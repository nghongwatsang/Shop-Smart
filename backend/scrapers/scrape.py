import os
import json
import asyncio
import uvicorn
import sys
from pathlib import Path
from datetime import datetime
from typing import Dict, List, Any
from fastapi import FastAPI, Response, status
from apscheduler.schedulers.asyncio import AsyncIOScheduler
from sqlalchemy.orm import Session

# Add backend to path so we can import src
sys.path.insert(0, str(Path(__file__).parent.parent))

# Import scrapers and processors
from backend.scrapers.stores.aldi_scraper import scrape_aldi
from backend.scrapers.stores.pricechopper_api_scraper import scrape_pricechopper
from backend.scrapers.utils.data_processor import (
    normalize_products,
    deduplicate_products,
    simplify_product_names,
    normalize_sizes,
    find_matches,
    add_common_products,
    enhance_product_names
)

# Import Database Entities
from src.infrastructure.database.database import SessionLocal
from src.domain.entities.item import Item
from src.domain.entities.store import Store
from src.domain.entities.item_price import ItemPrice
from src.domain.entities.address import Address
from sqlalchemy import text

app = FastAPI()

# Global health flag
INITIAL_SCRAPE_COMPLETE = False

# ============================================================
# HEALTH ENDPOINT
# ============================================================

@app.get("/health")
def health(response: Response):
    """
    Returns 200 only after initial scrape completes.
    """
    if not INITIAL_SCRAPE_COMPLETE:
        response.status_code = status.HTTP_503_SERVICE_UNAVAILABLE
        return {"ok": False, "status": "booting", "detail": "Initial scrape in progress"}
    return {"ok": True, "status": "ready"}

# ============================================================
# FILE HELPERS
# ============================================================

def ensure_directories():
    """Create necessary output directories"""
    # Use absolute path relative to this file
    base_dir = Path(__file__).parent
    output_dir = base_dir / 'output'
    raw_dir = output_dir / 'raw'
    processed_dir = output_dir / 'processed'
    
    raw_dir.mkdir(parents=True, exist_ok=True)
    processed_dir.mkdir(parents=True, exist_ok=True)
    
    return raw_dir, processed_dir

def save_json(data, filepath):
    """Save data to JSON file"""
    with open(filepath, 'w') as f:
        json.dump(data, f, indent=2)
    print(f"   ✅ Saved to {filepath.name}")

def load_json(filepath):
    """Load data from JSON file"""
    if not filepath.exists():
        return None
    with open(filepath, 'r') as f:
        return json.load(f)

# ============================================================
# DATABASE LOGIC
# ============================================================

def save_to_db(all_normalized: Dict[str, List[Dict]]):
    """Save normalized data to the database."""
    print("\n" + "="*80)
    print("💾 STEP 4: SAVING TO DATABASE")
    print("="*80)

    db = SessionLocal()
    ensure_schema(db)
    prepare_database_for_scrape(db)
    try:
        # 1. Ensure Stores Exist
        store_map = {} # name -> store_obj
        
        # Define store metadata (hardcoded for now as we don't scrape addresses)
        store_metadata = {
            'aldi': {
                'name': 'Aldi',
                'street': '123 Aldi Way', # Placeholder
                'city': 'Troy',
                'state': 'NY',
                'postal_code': '12180',
                'latitude': 42.7,
                'longitude': -73.6
            },
            'pricechopper': {
                'name': 'Price Chopper',
                'street': '456 PC Blvd',
                'city': 'Troy',
                'state': 'NY',
                'postal_code': '12180',
                'latitude': 42.7,
                'longitude': -73.6
            },
            'hannaford': {
                'name': 'Hannaford',
                'street': '789 Hannaford Ln',
                'city': 'Troy',
                'state': 'NY',
                'postal_code': '12180',
                'latitude': 42.7,
                'longitude': -73.6
            }
        }

        for key, products in all_normalized.items():
            # key is like 'aldi', 'pricechopper'
            # Normalize key to match metadata
            meta_key = key.lower().replace(' ', '')
            if meta_key not in store_metadata:
                print(f"⚠️ Unknown store key: {key}")
                continue
                
            meta = store_metadata[meta_key]
            
            # Check if store exists
            store = db.query(Store).filter(Store.name == meta['name']).first()
            if not store:
                # Create Address
                address = Address(
                    street=meta['street'],
                    city=meta['city'],
                    state=meta['state'],
                    postal_code=meta['postal_code'],
                    country='USA',
                    latitude=meta['latitude'],
                    longitude=meta['longitude']
                )
                db.add(address)
                db.flush() # Get ID
                
                store = Store(
                    name=meta['name'],
                    address_id=address.id
                )
                db.add(store)
                db.commit()
                print(f"   ✅ Created store: {store.name}")
            else:
                print(f"   ✓ Found store: {store.name}")
            
            store_map[meta_key] = store

        # 2. Process Products
        for key, products in all_normalized.items():
            meta_key = key.lower().replace(' ', '')
            if meta_key not in store_map:
                continue
            
            store = store_map[meta_key]
            print(f"\n   📦 Saving {len(products)} items for {store.name}...")
            
            count = 0
            updated_count = 0
            created_count = 0
            
            for p in products:
                # p is a dict
                
                # Clean size/unit for query
                size_val = None
                if p.get('size'):
                    try:
                        size_val = float(p['size'])
                    except ValueError:
                        pass # Keep as None if not a number
                
                # Find Item
                # We use a combination of fields to identify unique items
                item = db.query(Item).filter(
                    Item.name == p['name'],
                    Item.brand == p['brand'],
                    Item.size == size_val,
                    Item.unit == p.get('unit')
                ).first()
                
                if not item:
                    item = Item(
                        name=p['name'],
                        brand=p['brand'],
                        category=p['category'],
                        product_url=p.get('product_url'), # Might be None
                        size=size_val,
                        unit=p.get('unit')
                    )
                    db.add(item)
                    db.flush() # Get ID
                    created_count += 1
                
                # Update/Create Price
                try:
                    price_val = float(p['price'])
                except ValueError:
                    continue # Skip if price is invalid
                
                item_price = db.query(ItemPrice).filter(
                    ItemPrice.itemid == item.id,
                    ItemPrice.storeid == store.id
                ).first()
                
                if item_price:
                    item_price.price = price_val
                    updated_count += 1
                else:
                    item_price = ItemPrice(
                        itemid=item.id,
                        storeid=store.id,
                        price=price_val
                    )
                    db.add(item_price)
                    updated_count += 1
                
                count += 1
                if count % 100 == 0:
                    db.commit()
                    print(f"      Processed {count} items...")
            
            db.commit()
            print(f"   ✅ Saved {count} items for {store.name} (Created: {created_count}, Updated/Verified: {updated_count})")

    except Exception as e:
        print(f"   ❌ Database error: {e}")
        db.rollback()
        import traceback
        traceback.print_exc()
    finally:
        db.close()

# ============================================================
# PIPELINE LOGIC
# ============================================================

def prepare_database_for_scrape(db: Session):
    ensure_schema(db)  # Create tables if they don't exist

    db.execute(text("""
        TRUNCATE TABLE itemprice, item, store, address 
        RESTART IDENTITY CASCADE;
    """))
    
    db.commit()
    print("   🧹 Database reset complete.")

def ensure_schema(db: Session):
    db.execute(text("""
        CREATE TABLE IF NOT EXISTS address (
            id UUID PRIMARY KEY,
            street TEXT,
            city TEXT,
            state TEXT,
            postal_code TEXT,
            country TEXT,
            latitude DOUBLE PRECISION,
            longitude DOUBLE PRECISION
        );
    """))

    db.execute(text("""
        CREATE TABLE IF NOT EXISTS store (
            id UUID PRIMARY KEY,
            name TEXT NOT NULL,
            addressid UUID REFERENCES address(id)
        );
    """))

    db.execute(text("""
        CREATE TABLE IF NOT EXISTS item (
            id UUID PRIMARY KEY,
            name TEXT NOT NULL,
            brand TEXT,
            category TEXT,
            product_url TEXT,
            size DOUBLE PRECISION,
            unit TEXT
        );
    """))

    db.execute(text("""
        CREATE TABLE IF NOT EXISTS itemprice (
            id UUID PRIMARY KEY,
            itemid UUID REFERENCES item(id),
            storeid UUID REFERENCES store(id),
            price DOUBLE PRECISION
        );
    """))

    db.commit()



def run_scrapers(raw_dir):
    """Run all store scrapers"""
    print("\n" + "="*80)
    print("📥 STEP 1: SCRAPING STORE DATA")
    print("="*80)
    
    # Scrape Aldi
    print("\n🛒 Scraping Aldi...")
    try:
        aldi_products = scrape_aldi()
        aldi_data = {
            'store': 'Aldi',
            'scraped_at': datetime.now().isoformat(),
            'product_count': len(aldi_products),
            'products': aldi_products
        }
        save_json(aldi_data, raw_dir / 'aldi_products.json')
        print(f"   ✅ Scraped {len(aldi_products)} Aldi products")
    except Exception as e:
        print(f"   ❌ Error scraping Aldi: {e}")
    
    # Scrape Price Chopper
    print("\n🛒 Scraping Price Chopper...")
    try:
        pc_products = scrape_pricechopper()
        pc_data = {
            'store': 'Price Chopper',
            'scraped_at': datetime.now().isoformat(),
            'product_count': len(pc_products),
            'products': pc_products
        }
        save_json(pc_data, raw_dir / 'pricechopper_products.json')
        print(f"   ✅ Scraped {len(pc_products)} Price Chopper products")
    except Exception as e:
        print(f"   ❌ Error scraping Price Chopper: {e}")
    
    print("\n✅ Scraping complete!")

def process_data(raw_dir, processed_dir):
    """Process and normalize all scraped data"""
    print("\n" + "="*80)
    print("⚙️  STEP 2: PROCESSING & NORMALIZING DATA")
    print("="*80)
    
    stores = [
        ('Aldi', 'aldi_products.json', 'aldi_normalized.json'),
        ('Price Chopper', 'pricechopper_products.json', 'pricechopper_normalized.json'),
        ('Hannaford', 'hannaford_scraped_products.json', 'hannaford_normalized.json'),
    ]
    
    all_normalized = {}
    
    for store_name, raw_file, normalized_file in stores:
        print(f"\n📦 Processing {store_name}...")
        
        # Load raw data
        raw_path = raw_dir / raw_file
        raw_data = load_json(raw_path)
        
        if not raw_data:
            print(f"   ⚠️  No raw data found for {store_name}, skipping...")
            continue
        
        products = raw_data.get('products', [])
        print(f"   📊 Loaded {len(products)} raw products")
        
        # Step 1: Normalize to standard format
        normalized = normalize_products(products, store_name)
        print(f"   ✅ Normalized {len(normalized)} products")
        
        # Step 2: Deduplicate
        deduped = deduplicate_products(normalized)
        removed = len(normalized) - len(deduped)
        if removed > 0:
            print(f"   🗑️  Removed {removed} duplicates")
        
        # Step 3: Simplify names
        simplified = simplify_product_names(deduped, store_name)
        print(f"   ✅ Simplified product names")
        
        # Step 4: Normalize sizes
        size_normalized = normalize_sizes(simplified)
        print(f"   ✅ Normalized size formats")
        
        all_normalized[store_name.lower().replace(' ', '')] = size_normalized
    
    # Step 5: Add common products to increase matches
    print(f"\n🔧 Enhancing data for better matches...")
    hannaford_enhanced, aldi_enhanced, pc_enhanced = add_common_products(
        all_normalized.get('hannaford', []),
        all_normalized.get('aldi', []),
        all_normalized.get('pricechopper', [])
    )
    
    # Step 6: Apply name standardization
    print(f"\n   ✏️  Applying name standardization patterns...")
    hannaford_final = enhance_product_names(hannaford_enhanced, 'Hannaford')
    aldi_final = enhance_product_names(aldi_enhanced, 'Aldi')
    pc_final = enhance_product_names(pc_enhanced, 'Price Chopper')
    
    # Save final normalized data
    for store_name, products, filename in [
        ('Hannaford', hannaford_final, 'hannaford_normalized.json'),
        ('Aldi', aldi_final, 'aldi_normalized.json'),
        ('Price Chopper', pc_final, 'pricechopper_normalized.json')
    ]:
        normalized_data = {
            'store': store_name,
            'processed_at': datetime.now().isoformat(),
            'product_count': len(products),
            'products': products
        }
        save_json(normalized_data, processed_dir / filename)
    
    all_normalized['hannaford'] = hannaford_final
    all_normalized['aldi'] = aldi_final
    all_normalized['pricechopper'] = pc_final
    
    print("\n✅ Data processing complete!")
    return all_normalized

def analyze_matches(processed_dir, normalized_data):
    """Find and analyze product matches across stores"""
    print("\n" + "="*80)
    print("🔍 STEP 3: FINDING PRODUCT MATCHES")
    print("="*80)
    
    # Find matches
    matches = find_matches(
        normalized_data.get('hannaford', []),
        normalized_data.get('aldi', []),
        normalized_data.get('pricechopper', [])
    )
    
    # Display results
    total_hannaford = len(normalized_data.get('hannaford', []))
    total_aldi = len(normalized_data.get('aldi', []))
    total_pc = len(normalized_data.get('pricechopper', []))
    
    three_way = len(matches['three_way_matches'])
    hf_aldi = len(matches['hannaford_aldi_matches'])
    hf_pc = len(matches['hannaford_pricechopper_matches'])
    total_matched = three_way + hf_aldi + hf_pc
    
    match_rate = (total_matched / total_hannaford * 100) if total_hannaford > 0 else 0
    
    print(f"\n📊 MATCH STATISTICS:")
    print(f"   Total products per store:")
    print(f"      Hannaford: {total_hannaford:,}")
    print(f"      Aldi: {total_aldi:,}")
    print(f"      Price Chopper: {total_pc:,}")
    print(f"\n   Matches found:")
    print(f"      ✅ Three-way matches: {three_way}")
    print(f"      ✅ Hannaford ↔ Aldi: {hf_aldi}")
    print(f"      ✅ Hannaford ↔ Price Chopper: {hf_pc}")
    print(f"\n   📈 Overall match rate: {match_rate:.1f}%")
    
    # Save matches
    matches['metadata'] = {
        'analyzed_at': datetime.now().isoformat(),
        'total_hannaford': total_hannaford,
        'total_aldi': total_aldi,
        'total_pricechopper': total_pc,
        'match_rate': f"{match_rate:.1f}%"
    }
    
    save_json(matches, processed_dir / 'store_matches.json')
    print("\n✅ Match analysis complete!")
    
    return matches

# ============================================================
# MASTER PIPELINE
# ============================================================

async def run_pipeline():
    """Complete scrape and processing pipeline."""
    global INITIAL_SCRAPE_COMPLETE

    try:
        print("\n" + "="*80)
        print("🚀 STARTING SCHEDULED PIPELINE")
        print("="*80)
        
        raw_dir, processed_dir = ensure_directories()
        
        # 1. Scrape
        run_scrapers(raw_dir)
        
        # 2. Process
        normalized_data = process_data(raw_dir, processed_dir)
        
        # 3. Match (Optional step, but good for analytics)
        analyze_matches(processed_dir, normalized_data)
        
        # 4. Save to DB
        save_to_db(normalized_data)
        
        print("\n" + "="*80)
        print("🎉 PIPELINE COMPLETE")
        print("="*80)
        
        INITIAL_SCRAPE_COMPLETE = True
        print("✅ System is now HEALTHY.")

    except Exception as e:
        print(f"❌ Error during pipeline: {e}")
        import traceback
        traceback.print_exc()

# ============================================================
# SCHEDULER
# ============================================================

def start_weekly_scheduler():
    scheduler = AsyncIOScheduler()
    scheduler.add_job(
        run_pipeline,
        trigger="cron",
        day_of_week="mon",
        hour=2,
        minute=0,
    )
    print("⏰ APScheduler: Weekly job scheduled (Mondays @ 02:00)")
    scheduler.start()

# ============================================================
# NON-BLOCKING STARTUP FLOW
# ============================================================

async def run_initial_scrape():
    """Runs initial scrape AFTER the API is ready."""
    await asyncio.sleep(1)
    print("🚀 Running initial scrape in background...")
    await run_pipeline()

@app.on_event("startup")
async def startup_event():
    """Start API → scheduler → run scraper in background."""
    start_weekly_scheduler()
    asyncio.create_task(run_initial_scrape())
    print("🟢 Startup event complete — API is now ready.")

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
