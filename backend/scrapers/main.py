import os
import uuid
import asyncio
from typing import Dict, List, Any
from apscheduler.schedulers.asyncio import AsyncIOScheduler
from sqlalchemy import create_engine, text
from sqlalchemy.orm import Session
from backend.scrapers.stores.target_scraper import run_target_scraper
from backend.scrapers.stores.hannaford_scraper import HannafordSeleniumScraper
from backend.scrapers.stores.aldi_scraper import AldiScraper
from process_products import process_products, STORE_INFO


# ============================================================
# CONFIG
# ============================================================
DATABASE_URL = os.getenv(
    "DATABASE_URL",
    "postgresql://postgres:postgres@localhost:5432/shopsmart"
)


# ============================================================
# SCRAPER RUNNER
# ============================================================

async def run_full_scrape() -> Dict[str, Any]:
    """
    Runs Target, Hannaford, and Aldi scrapers.
    Returns dict with results.
    """

    print("\n====================================")
    print("   🛒 Starting Weekly Scrape Job")
    print("====================================\n")

    # TARGET
    print("▶ Scraping Target...")
    target_products = run_target_scraper("bananas")
    print(f"   ✓ Target products: {len(target_products)}\n")

    # HANNAFORD
    print("▶ Scraping Hannaford...")
    hannaford_scraper = HannafordSeleniumScraper(headless=True)
    hannaford_products = hannaford_scraper.scrape_category_page(
        "https://hannaford.com/browse-aisles/categories/1/categories/2098-produce"
    )
    hannaford_scraper.cleanup()
    print(f"   ✓ Hannaford products: {len(hannaford_products)}\n")

    # ALDI
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
# DATABASE HELPERS
# ============================================================

def truncate_tables(session: Session):
    """Clears old rows safely using FK cascading."""
    print("🧹 Truncating tables...")

    tables = ["ItemPrice", "Item", "Store", "Address"]

    for t in tables:
        session.execute(text(f'TRUNCATE "{t}" CASCADE;'))

    session.commit()
    print("   ✓ Tables truncated.\n")


def insert_all_data(
    session: Session,
    stores: List[Dict[str, Any]],
    addresses: List[Dict[str, Any]],
    items: List[Dict[str, Any]],
    item_prices: List[Dict[str, Any]]
):
    """Insert addresses, stores, items, and prices."""

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
    """Full weekly run: scrape all stores → process → refresh DB."""

    result = await run_full_scrape()

    # Build stores & addresses
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

    # Aldi
    aldi_items, aldi_prices = process_products(result["aldi"], store_mapping["aldi"])
    all_items.extend(aldi_items)
    all_prices.extend(aldi_prices)

    # Hannaford
    h_items, h_prices = process_products(result["hannaford"], store_mapping["hannafords"])
    all_items.extend(h_items)
    all_prices.extend(h_prices)

    # Target
    t_items, t_prices = process_products(result["target"], store_mapping["target"])
    all_items.extend(t_items)
    all_prices.extend(t_prices)

    print(f"📦 Total Items: {len(all_items)}")
    print(f"💲 Total Prices: {len(all_prices)}\n")

    # DB Connection
    print("🔌 Connecting to DB...")
    engine = create_engine(DATABASE_URL)
    session = Session(engine)

    # Refresh Tables
    truncate_tables(session)
    insert_all_data(session, stores, addresses, all_items, all_prices)

    session.close()
    print("🎉 Weekly scrape + DB refresh COMPLETE.\n")


# ============================================================
# APScheduler — Weekly Cron Trigger
# ============================================================

def start_weekly_scheduler():
    scheduler = AsyncIOScheduler()

    # Every Monday at 2 AM
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
# MAIN ENTRY POINT
# ============================================================

if __name__ == "__main__":
    """
    Running this file does:
    - Starts APScheduler weekly job
    - Immediately runs the scrape once
    - Keeps the process alive (with asyncio Event)
    """

    # Start weekly cron job
    start_weekly_scheduler()

    # Run immediately on startup
    asyncio.run(scrape_and_update_db())

    # Keep process alive
    print("🟢 Scheduler running. Waiting for weekly jobs...")
    asyncio.get_event_loop().run_forever()
