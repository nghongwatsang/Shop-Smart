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
    
    def __init__(self):
        self.store_name = "pricechopper"
        self.base_url = "https://shop.pricechopper.com"
        self.graphql_url = f"{self.base_url}/graphql"
        self.shop_id = "17148"
        self.postal_code = "12180"
        self.zone_id = "674"
        self.cookies = None
        
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
    
    def _get_collection_item_ids(self, slug: str = "n-produce-61", first: int = 500) -> List[str]:
        """Get list of product IDs from a collection."""
        print(f"📋 Fetching product IDs from collection '{slug}'...")
        
        variables = {
            "slug": slug,
            "shopId": self.shop_id,
            "pageViewId": "scraper-view",
            "zoneId": self.zone_id,
            "postalCode": self.postal_code,
            "first": first
        }
        
        hash_value = "5364052954c149876547a1f0b42b6cffada3ed98d3588a5ae45bec7500d4e388"
        
        data = self._make_graphql_request("CollectionProductsWithFeaturedProducts", variables, hash_value)
        
        if 'data' in data and data['data'] and 'collectionProducts' in data['data']:
            item_ids = data['data']['collectionProducts'].get('itemIds', [])
            print(f"✅ Found {len(item_ids)} product IDs")
            return item_ids
        else:
            print(f"⚠️ No products found in response")
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
            
            # Category - all products from this scraper are produce
            category = "produce"
            
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
    
    def scrape(self, output_file: str = "scrapers/output/raw/pricechopper_scraped_products.json") -> ScraperResult:
        """Main scraping method."""
        start_time = time.time()
        errors = []
        
        print(f"\n{'='*60}")
        print(f"Starting Price Chopper Scraper (GraphQL API)")
        print(f"{'='*60}\n")
        
        all_products = []
        
        try:
            # Step 1: Establish session
            self._establish_session()
            
            # Step 2: Get product IDs from produce collection
            item_ids = self._get_collection_item_ids(slug="n-produce-61", first=500)
            
            if not item_ids:
                error_msg = "No product IDs found in collection"
                print(f"❌ {error_msg}")
                errors.append(error_msg)
            else:
                # Step 3: Fetch product details in batches
                batch_size = 100
                
                for i in range(0, len(item_ids), batch_size):
                    batch = item_ids[i:i+batch_size]
                    batch_num = i//batch_size + 1
                    print(f"\n📦 Batch {batch_num}: Processing {len(batch)} products...")
                    
                    try:
                        items = self._get_product_details(batch)
                        
                        # Parse products
                        for item in items:
                            parsed = self._parse_product(item)
                            if parsed:
                                all_products.append(parsed)
                        
                        # Small delay between batches
                        if i + batch_size < len(item_ids):
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
    scraper = PriceChopperAPIScraper()
    result = scraper.scrape()
    
    # Print sample products
    if result.products:
        print(f"\n📊 Sample products:")
        for i, product in enumerate(result.products[:5], 1):
            print(f"\n{i}. {product.name}")
            print(f"   Brand: {product.brand}")
            print(f"   Price: ${product.price}")
            print(f"   Size: {product.size} {product.unit}".strip())
            print(f"   Category: {product.category}")

if __name__ == "__main__":
    main()
