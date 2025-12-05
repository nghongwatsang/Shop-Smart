import os
import uuid
import asyncio
import uvicorn
from fastapi import FastAPI, Response, status
from typing import Dict, List, Any
from apscheduler.schedulers.asyncio import AsyncIOScheduler
from sqlalchemy import create_engine, text
from sqlalchemy.orm import Session

from backend.scrapers.stores.target_scraper import run_target_scraper
from backend.scrapers.stores.hannaford_scraper import HannafordSeleniumScraper
from backend.scrapers.stores.aldi_scraper import AldiScraper
from .process_products import process_products, STORE_INFO


# ============================================================
# CONFIG
# ============================================================
DATABASE_URL = os.getenv(
    "DATABASE_URL",
    "postgresql://postgres:postgres@localhost:5432/shopsmart"
)

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
# SCRAPER LOGIC
# ============================================================

async def run_full_scrape() -> Dict[str, Any]:
    """Runs scrapers for Target, Hannaford, and Aldi."""

    print("\n====================================")
    print("   🛒 Starting Weekly Scrape Job")
    print("====================================\n")

    # ---------- TARGET ----------
    print("▶ Scraping Target...")
    target_products = run_target_scraper("bananas")
    print(f"   ✓ Target products: {len(target_products)}\n")

    # ---------- HANNAFORD ----------
    print("▶ Scraping Hannaford...")
    hannaford_scraper = HannafordSeleniumScraper(headless=True)
    hannaford_products = hannaford_scraper.scrape_category_page(
        "https://hannaford.com/browse-aisles/categories/1/categories/2098-produce"
    )
    hannaford_scraper.cleanup()
    print(f"   ✓ Hannaford products: {len(hannaford_products)}\n")

    # ---------- ALDI ----------
    print("▶ Scraping Aldi...")
    aldi = AldiScraper(delay=0.3)
    aldi_products = aldi.scrape_products(limit=150)
    print(f"   ✓ Aldi products: {len(aldi_products)}\n")

    return {
        "target": target_products,
        "hannaford": hannaford_products,
        "aldi": aldi_products
    }


# ============================================================
# DB HELPERS
# ============================================================

def truncate_tables(session: Session):
    print("🧹 Truncating tables...")
    tables = ["ItemPrice", "Item", "Store", "Address"]
    for t in tables:
        session.execute(text(f'TRUNCATE "{t}" CASCADE;'))
    session.commit()
    print("   ✓ Tables truncated.\n")


def insert_all_data(session: Session, stores, addresses, items, item_prices):
    print("📝 Inserting Addresses...")
    for a in addresses:
        session.execute(text("""
            INSERT INTO Address (id, street, city, state, postal_code, country, latitude, longitude)
            VALUES (:id, :street, :city, :state, :postal_code, 'USA', :lat, :lon)
        """), {
            "id": a["id"],
            "street": a["street"],
            "city": a["city"],
            "state": a["state"],
            "postal_code": a["postal_code"],
            "lat": a["latitude"],
            "lon": a["longitude"]
        })

    print("🏬 Inserting Stores...")
    for s in stores:
        session.execute(text("""
            INSERT INTO Store (id, name, "addressId")
            VALUES (:id, :name, :addressId)
        """), s)

    print("📦 Inserting Items...")
    for item in items:
        session.execute(text("""
            INSERT INTO Item (id, name, brand, category, product_url, size, unit)
            VALUES (:id, :name, :brand, :category, :url, :size, :unit)
        """), {
            "id": item["id"],
            "name": item["name"],
            "brand": item["brand"],
            "category": item["category"],
            "url": item["product_url"],
            "size": item["size"],
            "unit": item["unit"]
        })

    print("💲 Inserting Item Prices...")
    for price in item_prices:
        session.execute(text("""
            INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
            VALUES (:id, :itemId, :storeId, :price)
        """), price)

    session.commit()
    print("✅ Inserted all records.\n")


# ============================================================
# MASTER PIPELINE
# ============================================================

async def scrape_and_update_db():
    """Complete scrape and DB refresh."""
    global INITIAL_SCRAPE_COMPLETE

    try:
        result = await run_full_scrape()

        addresses = []
        stores = []
        store_mapping = {}

        print("🏗 Building store/address entries...")

        for store_info in STORE_INFO:
            addr_id = str(uuid.uuid4())
            store_id = str(uuid.uuid4())

            addresses.append({
                "id": addr_id,
                "street": store_info["street"],
                "city": store_info["city"],
                "state": store_info["state"],
                "postal_code": store_info["postal_code"],
                "latitude": store_info["latitude"],
                "longitude": store_info["longitude"]
            })

            stores.append({
                "id": store_id,
                "name": store_info["name"],
                "addressId": addr_id
            })

            store_mapping[store_info["name"].lower()] = store_id

        print("⚙ Processing products...")

        all_items = []
        all_prices = []

        aldi_items, aldi_prices = process_products(result["aldi"], store_mapping["aldi"])
        all_items.extend(aldi_items)
        all_prices.extend(aldi_prices)

        h_items, h_prices = process_products(result["hannaford"], store_mapping["hannafords"])
        all_items.extend(h_items)
        all_prices.extend(h_prices)

        t_items, t_prices = process_products(result["target"], store_mapping["target"])
        all_items.extend(t_items)
        all_prices.extend(t_prices)

        print(f"📦 Total Items: {len(all_items)}")
        print(f"💲 Total Prices: {len(all_prices)}\n")

        engine = create_engine(DATABASE_URL)
        session = Session(engine)

        truncate_tables(session)
        insert_all_data(session, stores, addresses, all_items, all_prices)

        session.close()
        print("🎉 Weekly scrape + DB refresh COMPLETE.")
        
        INITIAL_SCRAPE_COMPLETE = True
        print("✅ System is now HEALTHY.")

    except Exception as e:
        print(f"❌ Error during scrape/update: {e}")


# ============================================================
# SCHEDULER
# ============================================================

def start_weekly_scheduler():
    scheduler = AsyncIOScheduler()
    scheduler.add_job(
        scrape_and_update_db,
        trigger="cron",
        day_of_week="mon",
        hour=2,
        minute=0,
    )
    print("⏰ APScheduler: Weekly job scheduled (Mondays @ 02:00)")
    scheduler.start()


# ============================================================
# NON-BLOCKING STARTUP FLOW (CRITICAL FIX)
# ============================================================

async def run_initial_scrape():
    """Runs initial scrape AFTER the API is ready."""
    await asyncio.sleep(1)
    print("🚀 Running initial scrape in background...")
    await scrape_and_update_db()


@app.on_event("startup")
async def startup_event():
    """Start API → scheduler → run scraper in background."""
    start_weekly_scheduler()

    asyncio.create_task(run_initial_scrape())
    print("🟢 Startup event complete — API is now ready.")


# ============================================================
# MAIN ENTRY
# ============================================================

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
