"""
Main scraper orchestrator - runs all store scrapers and data processing pipeline
"""
import json
import sys
from pathlib import Path
from datetime import datetime

# Add backend to path
sys.path.insert(0, str(Path(__file__).parent.parent))

from scrapers.stores.aldi_scraper import scrape_aldi
from scrapers.stores.pricechopper_api_scraper import scrape_pricechopper
from scrapers.utils.data_processor import (
    normalize_products,
    deduplicate_products,
    simplify_product_names,
    normalize_sizes,
    find_matches,
    add_common_products,
    enhance_product_names
)


def ensure_directories():
    """Create necessary output directories"""
    output_dir = Path(__file__).parent / 'output'
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


def run_scrapers(raw_dir, skip_scraping=False):
    """Run all store scrapers"""
    print("\n" + "="*80)
    print("📥 STEP 1: SCRAPING STORE DATA")
    print("="*80)
    
    if skip_scraping:
        print("⏭️  Skipping scraping (using existing data)\n")
        return
    
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


def main():
    """Main orchestrator function"""
    print("\n" + "="*80)
    print("🛒 SHOP-SMART SCRAPER ORCHESTRATOR")
    print("="*80)
    print(f"Started at: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    
    # Setup
    raw_dir, processed_dir = ensure_directories()
    
    # Check if we should skip scraping
    import sys
    skip_scraping = '--skip-scraping' in sys.argv or '-s' in sys.argv
    
    try:
        # Step 1: Scrape data
        run_scrapers(raw_dir, skip_scraping=skip_scraping)
        
        # Step 2: Process data
        normalized_data = process_data(raw_dir, processed_dir)
        
        # Step 3: Analyze matches
        matches = analyze_matches(processed_dir, normalized_data)
        
        # Success
        print("\n" + "="*80)
        print("✅ ALL OPERATIONS COMPLETED SUCCESSFULLY")
        print("="*80)
        print(f"Completed at: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
        print(f"\n📁 Output files:")
        print(f"   Raw data: {raw_dir}")
        print(f"   Processed data: {processed_dir}")
        print(f"\n💡 Tip: Use --skip-scraping or -s to skip scraping and only process existing data")
        
    except Exception as e:
        print(f"\n❌ ERROR: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)


if __name__ == '__main__':
    main()