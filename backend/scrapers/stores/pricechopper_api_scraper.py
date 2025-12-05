#!/usr/bin/env python3
"""
Price Chopper scraper using GraphQL API.
Uses Selenium to establish session, then makes direct API calls.
"""

from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import requests
import json
import time
import re
from urllib.parse import urlencode
from typing import List, Dict, Any, Optional

from scrapers.core import Product, ScraperResult
from scrapers.utils import clean_product_data, validate_product

class PriceChopperAPIScraper:
    """Scraper for Price Chopper using their GraphQL API."""
    
    # Known Price Chopper brands
    KNOWN_BRANDS = [
        "Price Chopper", "Market 32", "Central Market", "Wholesome Pantry",
        "Naturipe", "Peelz", "Driscoll's", "Dole"
    ]
    
    # Map of categories to search queries
    # Using search allows us to get products from categories not exposed via collections
    SEARCH_CATEGORIES = {
        "Dairy & Eggs": ["milk", "cheese", "yogurt", "eggs", "butter", "cream"],
        "Meat & Seafood": ["chicken", "beef", "pork", "fish", "salmon", "shrimp"],
        "Bakery": ["bread", "bagels", "rolls", "muffins", "cake"],
        "Frozen": ["frozen pizza", "ice cream", "frozen vegetables", "frozen meals"],
        "Pantry": ["pasta", "rice", "beans", "canned", "cereal", "oil"],
        "Beverages": ["juice", "soda", "coffee", "tea", "water"],
        "Snacks": ["chips", "crackers", "cookies", "candy", "nuts"],
    }
    
    # Search queries based on common grocery categories
    # Mapped from Aldi's normalized categories
    SEARCH_QUERIES = [
        # Fresh
        "produce", "fruits", "vegetables", "organic produce",
        "meat", "chicken", "beef", "pork", "seafood", "fish",
        
        # Dairy
        "milk", "cheese", "yogurt", "eggs", "butter",
        
        # Bakery & Bread
        "bread", "bagels", "bakery", "cookies",
        
        # Pantry
        "pasta", "rice", "cereal", "oatmeal",
        "canned goods", "soup", "beans",
        "chips", "crackers", "snacks",
        "condiments", "ketchup", "mustard", "mayo",
        "sauces", "pasta sauce", "salsa",
        "oil", "olive oil", "vegetable oil",
        "spices", "salt", "pepper",
        "baking", "flour", "sugar",
        
        # Frozen
        "frozen vegetables", "frozen meals", "ice cream",
        
        # Beverages
        "juice", "soda", "water", "coffee", "tea",
        
        # Other
        "paper towels", "toilet paper", "cleaning supplies"
    ]
    
    # Known Price Chopper collection slugs (discovered from browsing the site)
    # Format: "slug-name": "Display Name"
    COLLECTIONS = {
        "n-produce-61": "Produce",
        "n-meat-seafood-62": "Meat & Seafood",
        "n-dairy-eggs-63": "Dairy & Eggs",
        "n-bakery-64": "Bakery",
        "n-deli-65": "Deli",
        "n-frozen-66": "Frozen",
        "n-pantry-67": "Pantry",
        "n-beverages-68": "Beverages",
        "n-snacks-69": "Snacks",
        "n-breakfast-70": "Breakfast",
        "n-household-71": "Household",
    }
    
    def __init__(self, use_collections: bool = True):
        self.store_name = "pricechopper"
        self.base_url = "https://shop.pricechopper.com"
        self.graphql_url = f"{self.base_url}/graphql"
        self.shop_id = "17148"
        self.postal_code = "12180"
        self.zone_id = "674"
        self.cookies = None
        self.use_collections = use_collections  # Use collections vs single produce
        self.seen_product_ids = set()  # Track to avoid duplicates
    
    def _discover_working_collections(self, test_range=range(1, 100)) -> Dict[str, str]:
        """
        Discover working collection IDs by trying different ID combinations.
        Returns dict of working collection slugs and their product counts.
        """
        print("\n🔍 Discovering working collection IDs...")
        working_collections = {}
        
        prefixes_to_try = ["n-"]  # Known working prefix
        
        for prefix in prefixes_to_try:
            for collection_id in test_range:
                slug = f"{prefix}{collection_id}"
                
                try:
                    # Try to fetch items from this collection
                    item_ids = self._get_collection_item_ids(slug, first=10)
                    
                    if item_ids and len(item_ids) > 0:
                        working_collections[slug] = len(item_ids)
                        print(f"   ✅ Found working collection: {slug} ({len(item_ids)} products)")
                except Exception as e:
                    # Silently skip non-working collections
                    pass
        
        print(f"\n✅ Discovered {len(working_collections)} working collections")
        return working_collections
    
    def _establish_session(self):
        """Use Selenium to load page and collect cookies."""
        print("🌐 Establishing browser session...")
        
        chrome_options = Options()
        chrome_options.add_argument('--headless=new')
        chrome_options.add_argument('--no-sandbox')
        chrome_options.add_argument('--disable-dev-shm-usage')
        
        driver = webdriver.Chrome(options=chrome_options)
        
        try:
            driver.get(f"{self.base_url}/store/price-chopper-ny/collections/n-produce-61")
            time.sleep(10)  # Wait for page to fully load
            
            cookies = driver.get_cookies()
            self.cookies = {cookie['name']: cookie['value'] for cookie in cookies}
            print(f"✅ Session established with {len(cookies)} cookies")
            
        finally:
            driver.quit()
    
    def _make_graphql_request(self, operation_name: str, variables: Dict, hash_value: str) -> Dict:
        """Make a GraphQL API request."""
        params = {
            "operationName": operation_name,
            "variables": json.dumps(variables, separators=(',', ':')),
            "extensions": json.dumps({
                "persistedQuery": {
                    "version": 1,
                    "sha256Hash": hash_value
                }
            }, separators=(',', ':'))
        }
        
        headers = {
            'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36',
            'Accept': '*/*',
            'Referer': f"{self.base_url}/store/price-chopper-ny/collections/n-produce-61",
            'Origin': self.base_url,
        }
        
        full_url = f"{self.graphql_url}?{urlencode(params)}"
        response = requests.get(full_url, headers=headers, cookies=self.cookies, timeout=30)
        
        if response.status_code != 200:
            raise Exception(f"GraphQL request failed: {response.status_code} - {response.text[:200]}")
        
        return response.json()
    
    def _get_collection_item_ids(self, slug: str, first: int = 500) -> List[str]:
        """Get list of product IDs from a collection."""
        print(f"📋 Fetching from collection '{slug}'...")
        
        variables = {
            "slug": slug,
            "shopId": self.shop_id,
            "pageViewId": "scraper-view",
            "zoneId": self.zone_id,
            "postalCode": self.postal_code,
            "first": first
        }
        
        hash_value = "5364052954c149876547a1f0b42b6cffada3ed98d3588a5ae45bec7500d4e388"
        
        try:
            data = self._make_graphql_request("CollectionProductsWithFeaturedProducts", variables, hash_value)
            
            if 'data' in data and data['data'] and 'collectionProducts' in data['data']:
                item_ids = data['data']['collectionProducts'].get('itemIds', [])
                
                # Filter out duplicates
                new_ids = [id for id in item_ids if id not in self.seen_product_ids]
                self.seen_product_ids.update(new_ids)
                
                print(f"✅ Found {len(new_ids)} new products (total: {len(item_ids)})")
                return new_ids
            else:
                print(f"⚠️ No products found in response")
                return []
        except Exception as e:
            print(f"⚠️ Collection fetch failed: {e}")
            return []
    
    def _search_products(self, query: str, first: int = 100) -> List[str]:
        """
        Search for products using a search query.
        Uses the SearchSuggestions GraphQL endpoint.
        """
        print(f"🔍 Searching for: '{query}'")
        
        # SearchSuggestions hash discovered from network inspection
        hash_value = "7bbc6b4c256f61f411f6e8e6a554c050f8dc6c9f66c9b4a235095bd8e0a30d5f"
        
        variables = {
            "query": query,
            "shopId": self.shop_id,
            "first": first,
            "searchType": "PRODUCT"
        }
        
        try:
            data = self._make_graphql_request("SearchSuggestions", variables, hash_value)
            
            if 'data' in data and 'searchSuggestions' in data['data']:
                suggestions = data['data']['searchSuggestions']
                
                # Extract item IDs from search results
                item_ids = []
                for suggestion in suggestions:
                    if 'id' in suggestion:
                        item_ids.append(suggestion['id'])
                
                if item_ids:
                    print(f"   ✓ Found {len(item_ids)} products")
                    return item_ids
                else:
                    print(f"   ⚠️ No products found for '{query}'")
                    return []
            else:
                print(f"   ⚠️ Search failed for '{query}'")
                return []
        except Exception as e:
            print(f"   ✗ Search error for '{query}': {str(e)}")
            return []
    
    def _get_product_details(self, item_ids: List[str]) -> List[Dict]:
        """Fetch product details for given item IDs."""
        print(f"📦 Fetching details for {len(item_ids)} products...")
        
        # The Items query hash - this is from the intercepted requests
        hash_value = "8e814b738f12564460af5db399c598e09807f9c34cd3f959763f81be058d9c24"
        
        variables = {
            "ids": item_ids,
            "shopId": self.shop_id,
            "zoneId": self.zone_id,
            "postalCode": self.postal_code
        }
        
        data = self._make_graphql_request("Items", variables, hash_value)
        
        if 'data' in data and data['data'] and 'items' in data['data']:
            items = data['data']['items']
            print(f"✅ Retrieved {len(items)} product details")
            return items
        else:
            if 'errors' in data:
                print(f"⚠️ API Error: {data['errors'][0]['message']}")
            else:
                print(f"⚠️ No product details in response")
            return []
    
    def _parse_product(self, item: Dict) -> Optional[Product]:
        """Parse a product item into Product model."""
        try:
            # Extract basic info
            name = item.get('name', '')
            if not name:
                return None
            
            # Try to extract brand from API
            brand_name = item.get('brandName', '')
            
            # If no brand in API, try to parse from name
            if not brand_name:
                for known_brand in self.KNOWN_BRANDS:
                    if name.lower().startswith(known_brand.lower()):
                        brand_name = known_brand
                        # Remove brand from name
                        name = name[len(known_brand):].strip()
                        break
            
            # Default brand if still not found
            if not brand_name:
                brand_name = "Generic"
            
            # Price info from nested structure
            price_str = None
            if 'price' in item and isinstance(item['price'], dict):
                view_section = item['price'].get('viewSection', {})
                if isinstance(view_section, dict):
                    price_value = view_section.get('priceValueString', '')
                    if price_value:
                        price_str = price_value  # Keep as string
            
            if not price_str:
                return None  # Price is required
            
            # Get size and unit info
            size_str = item.get('size', '')
            size = ''
            unit = ''
            
            if size_str:
                # Parse size and unit (e.g., "1 lb" -> size="1", unit="lb")
                # Common patterns: "per lb", "1 each", "2 lb", "16 oz"
                size_match = re.match(r'([\d.]+)\s*([a-zA-Z]+)', size_str)
                if size_match:
                    size = size_match.group(1)
                    unit = size_match.group(2)
                elif 'per' in size_str.lower():
                    # "per lb" -> unit="lb"
                    unit = size_str.replace('per', '').strip()
                elif 'each' in size_str.lower():
                    size = '1'
                    unit = 'each'
                else:
                    # Just store as size if can't parse
                    size = size_str
            
            # Category - try to infer from product data or use generic
            category = ''
            
            # Try multiple locations for category
            # 1. From viewSection trackingProperties (most reliable)
            if 'viewSection' in item and item['viewSection']:
                tracking = item['viewSection'].get('trackingProperties', {})
                if tracking:
                    category = tracking.get('product_category_name', '')
            
            # 2. From breadcrumbs if available
            if not category:
                breadcrumbs = item.get('breadcrumbs', [])
                if breadcrumbs and len(breadcrumbs) > 0:
                    category = breadcrumbs[-1].get('name', '')
            
            # 3. From category field directly
            if not category:
                category = item.get('category', '')
            
            # Default if still not found
            if not category:
                category = 'Other'
            
            # Build raw product data
            raw_data = {
                'brand': brand_name,
                'name': name.strip(),
                'price': price_str,
                'category': category,
                'size': size,
                'unit': unit,
                'source': self.store_name
            }
            
            # Clean and validate
            cleaned = clean_product_data(raw_data)
            product = Product(**cleaned)
            
            # Validate
            errors = validate_product(product)
            if errors:
                print(f"   ⚠️ Validation errors for {name}: {errors}")
                return None
            
            return product
            
        except Exception as e:
            print(f"⚠️ Error parsing product: {e}")
            return None
    
    def scrape(self, output_file: str = "scrapers/output/raw/pricechopper_scraped_products.json", 
               collections_to_scrape: List[str] = None) -> ScraperResult:
        """
        Main scraping method.
        
        Args:
            output_file: Where to save results
            collections_to_scrape: List of collection slugs to scrape (None = all)
        """
        start_time = time.time()
        errors = []
        
        print(f"\n{'='*60}")
        print(f"Starting Price Chopper Scraper (GraphQL API)")
        if self.use_collections:
            colls = collections_to_scrape or list(self.COLLECTIONS.keys())
            print(f"Mode: Multi-collection ({len(colls)} collections)")
        else:
            print(f"Mode: Single collection (produce only)")
        print(f"{'='*60}\n")
        
        all_products = []
        all_item_ids = []
        
        try:
            # Step 1: Establish session
            self._establish_session()
            
            # Step 1.5: Discover working collections if requested
            if self.use_collections and collections_to_scrape is None:
                print("\n🔍 Auto-discovering collections...")
                discovered = self._discover_working_collections(test_range=range(1, 100))
                
                if discovered:
                    collections_to_scrape = list(discovered.keys())
                    print(f"\n📚 Will scrape {len(collections_to_scrape)} discovered collections")
                else:
                    print("\n⚠️ No collections discovered, falling back to produce only")
                    collections_to_scrape = ["n-produce-61"]
            
            # Step 2: Get product IDs
            if self.use_collections:
                # Scrape multiple collections for broader coverage
                collections = collections_to_scrape or list(self.COLLECTIONS.keys())
                
                seen_ids = set()  # Track unique product IDs across collections
                
                print(f"\n📚 Scraping {len(collections)} collections...")
                for i, slug in enumerate(collections, 1):
                    collection_name = self.COLLECTIONS.get(slug, slug)
                    print(f"\n[{i}/{len(collections)}] {collection_name} ({slug})")
                    try:
                        item_ids = self._get_collection_item_ids(slug, first=500)
                        
                        # Deduplicate - only add new IDs
                        new_ids = [id for id in item_ids if id not in seen_ids]
                        seen_ids.update(new_ids)
                        all_item_ids.extend(new_ids)
                        
                        print(f"   📋 Found {len(item_ids)} products ({len(new_ids)} new, {len(item_ids) - len(new_ids)} duplicates)")
                        time.sleep(0.5)  # Rate limiting
                    except Exception as e:
                        error_msg = f"Collection '{slug}' failed: {str(e)}"
                        print(f"   ✗ {error_msg}")
                        errors.append(error_msg)
                
                print(f"\n✅ Total unique products found: {len(all_item_ids)}")
            else:
                # Original single collection approach (produce only)
                all_item_ids = self._get_collection_item_ids("n-produce-61", first=500)
            
            if not all_item_ids:
                error_msg = "No product IDs found"
                print(f"❌ {error_msg}")
                errors.append(error_msg)
            else:
                # Step 3: Fetch product details in batches
                batch_size = 100
                
                print(f"\n📦 Fetching details for {len(all_item_ids)} products in batches of {batch_size}...")
                
                for i in range(0, len(all_item_ids), batch_size):
                    batch = all_item_ids[i:i+batch_size]
                    batch_num = i//batch_size + 1
                    total_batches = (len(all_item_ids) + batch_size - 1) // batch_size
                    print(f"\n📦 Batch {batch_num}/{total_batches}: Processing {len(batch)} products...")
                    
                    try:
                        items = self._get_product_details(batch)
                        
                        # Parse products
                        parsed_count = 0
                        for item in items:
                            parsed = self._parse_product(item)
                            if parsed:
                                all_products.append(parsed)
                                parsed_count += 1
                        
                        print(f"   ✓ Parsed {parsed_count}/{len(items)} products")
                        
                        # Small delay between batches
                        if i + batch_size < len(all_item_ids):
                            time.sleep(1)
                            
                    except Exception as e:
                        error_msg = f"Error processing batch {batch_num}: {str(e)}"
                        print(f"   ✗ {error_msg}")
                        errors.append(error_msg)
        
        except Exception as e:
            error_msg = f"Fatal error during scraping: {str(e)}"
            print(f"\n✗ {error_msg}")
            errors.append(error_msg)
        
        duration = time.time() - start_time
        
        # Create result
        result = ScraperResult(
            store=self.store_name,
            products=all_products,
            errors=errors,
            duration_seconds=round(duration, 2),
            success=len(all_products) > 0
        )
        
        print(f"\n{'='*60}")
        print(f"Scraping Complete")
        print(f"{'='*60}")
        print(f"✅ Total products: {len(all_products)}")
        print(f"⏱️  Duration: {duration:.2f}s")
        if errors:
            print(f"⚠️  Errors: {len(errors)}")
        print(f"{'='*60}\n")
        
        # Save results using ScraperResult's to_dict method
        if output_file:
            with open(output_file, 'w') as f:
                json.dump(result.to_dict(), f, indent=2)
            print(f"💾 Saved to: {output_file}")
        
        return result

def main():
    """Run scraper with search-based mode."""
    scraper = PriceChopperAPIScraper(use_search=True)
    
    # Start with a limited test
    print("Running in SEARCH mode with category-based queries\n")
    result = scraper.scrape(max_queries=5)  # Test with 5 queries first
    
    # Print sample products
    if result.products:
        print(f"\n📊 Sample products:")
        for i, product in enumerate(result.products[:10], 1):
            print(f"\n{i}. {product.name}")
            print(f"   Brand: {product.brand}")
            print(f"   Price: ${product.price}")
            print(f"   Size: {product.size} {product.unit}".strip())
            print(f"   Category: {product.category}")
        
        # Category distribution


def scrape_pricechopper(collection_id: str = "n-produce-61", max_items: int = None) -> List[Dict[str, Any]]:
    """
    Convenience function to scrape Price Chopper and return products as list of dicts.
    
    Args:
        collection_id: Price Chopper collection to scrape (default: produce)
        max_items: Maximum number of items to scrape (None for all)
        
    Returns:
        List of product dictionaries
    """
    scraper = PriceChopperAPIScraper()
    result = scraper.scrape(output_file=None, collection_id=collection_id, max_items=max_items)
    
    # Convert Product objects to dicts
    return [product.to_dict() for product in result.products]


def main():
    """Run scraper using both collections AND search queries for comprehensive coverage."""
    scraper = PriceChopperAPIScraper()
    
    print("🛒 Price Chopper Comprehensive Scraper")
    print("=" * 60)
    print("Strategy: Collection (Produce) + Search (Other Categories)")
    print("=" * 60 + "\n")
    
    all_item_ids = []
    seen_ids = set()
    
    # Step 1: Get Produce via collection API (fastest, most reliable)
    print("📦 STEP 1: Scraping Produce collection...")
    produce_slug = "n-produce-61"
    produce_ids = scraper._get_collection_item_ids(produce_slug)
    
    new_produce = [id for id in produce_ids if id not in seen_ids]
    seen_ids.update(new_produce)
    all_item_ids.extend(new_produce)
    print(f"✅ Produce: {len(new_produce)} unique products\n")
    
    # Step 2: Search for other categories
    print("🔍 STEP 2: Searching for other categories...")
    for category, queries in scraper.SEARCH_CATEGORIES.items():
        print(f"\n📂 {category}:")
        category_ids = []
        
        for query in queries:
            search_ids = scraper._search_products(query)
            new_ids = [id for id in search_ids if id not in seen_ids]
            seen_ids.update(new_ids)
            category_ids.extend(new_ids)
            
            # Small delay between searches
            time.sleep(0.5)
        
        all_item_ids.extend(category_ids)
        print(f"   ✓ Total for {category}: {len(category_ids)} new products")
    
    print(f"\n{'='*60}")
    print(f"Total unique product IDs collected: {len(all_item_ids)}")
    print(f"{'='*60}\n")
    
    # Step 3: Fetch product details in batches
    all_products = []
    batch_size = 100
    
    print("📥 STEP 3: Fetching product details...")
    for i in range(0, len(all_item_ids), batch_size):
        batch = all_item_ids[i:i+batch_size]
        batch_num = i//batch_size + 1
        total_batches = (len(all_item_ids) + batch_size - 1) // batch_size
        print(f"\n📦 Batch {batch_num}/{total_batches}: Processing {len(batch)} products...")
        
        try:
            items = scraper._get_product_details(batch)
            
            # Parse products
            parsed_count = 0
            for item in items:
                parsed = scraper._parse_product(item)
                if parsed:
                    all_products.append(parsed)
                    parsed_count += 1
            
            print(f"   ✓ Parsed {parsed_count}/{len(items)} products")
            
            # Small delay between batches
            if i + batch_size < len(all_item_ids):
                time.sleep(1)
                
        except Exception as e:
            print(f"   ✗ Error processing batch {batch_num}: {str(e)}")
    
    # Create result
    result = ScraperResult(
        store=scraper.store_name,
        products=all_products,
        errors=[],
        duration_seconds=0,
        success=len(all_products) > 0
    )
    
    print(f"\n{'='*60}")
    print(f"Scraping Complete")
    print(f"{'='*60}")
    print(f"✅ Total products: {len(all_products)}")
    
    # Print category breakdown
    from collections import Counter
    category_counts = Counter(p.category for p in all_products)
    print(f"\n📊 Category Breakdown:")
    for category, count in sorted(category_counts.items(), key=lambda x: x[1], reverse=True):
        print(f"   {category}: {count}")
    
    # Print sample products
    if all_products:
        print(f"\n📦 Sample products (first 10):")
        for i, product in enumerate(all_products[:10], 1):
            print(f"\n{i}. {product.name}")
            print(f"   Brand: {product.brand}")
            print(f"   Price: ${product.price}")
            print(f"   Size: {product.size} {product.unit}".strip())
            print(f"   Category: {product.category}")
    
    # Save results
    output_file = "backend/scrapers/output/raw/pricechopper_scraped_products.json"
    with open(output_file, 'w') as f:
        json.dump(result.to_dict(), f, indent=2)
    print(f"\n💾 Saved to: {output_file}")
    
    return result


if __name__ == "__main__":
    main()
