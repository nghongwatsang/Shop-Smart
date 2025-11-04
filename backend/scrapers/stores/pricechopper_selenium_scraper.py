#!/usr/bin/env python3

import re
import time
import json
from typing import List, Optional, Dict, Any
from dataclasses import dataclass
from bs4 import BeautifulSoup

# Selenium imports
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from selenium.common.exceptions import TimeoutException, NoSuchElementException, WebDriverException
from webdriver_manager.chrome import ChromeDriverManager


@dataclass
class Product:
    """Data class representing a product"""
    brand: str
    name: str
    price: str
    category: str
    size: str
    unit: str
    source: str = "pricechopper"
    product_url: Optional[str] = None
    raw_name: Optional[str] = None
    
    def to_dict(self) -> Dict[str, Any]:
        """Convert product to dictionary"""
        return {
            'brand': self.brand,
            'name': self.name,
            'price': self.price,
            'category': self.category,
            'size': self.size,
            'unit': self.unit,
            'source': self.source,
            'product_url': self.product_url,
            'raw_name': self.raw_name
        }


class PriceChopperSeleniumScraper:
    """
    Price Chopper grocery scraper using Selenium for JavaScript-heavy pages
    """
    
    def __init__(self, headless: bool = True, delay: float = 2.0):
        """Initialize the scraper with Selenium"""
        self.headless = headless
        self.delay = delay
        self.driver: Optional[webdriver.Chrome] = None
        self.wait: Optional[WebDriverWait] = None
        self.setup_driver()
    
    def setup_driver(self) -> None:
        """Setup Selenium WebDriver with Chrome"""
        try:
            print("🔧 Setting up Selenium WebDriver...")
            
            # Configure Chrome options for stealth
            chrome_options = Options()
            if self.headless:
                chrome_options.add_argument("--headless=new")
            chrome_options.add_argument("--no-sandbox")
            chrome_options.add_argument("--disable-dev-shm-usage")
            chrome_options.add_argument("--disable-gpu")
            chrome_options.add_argument("--window-size=1920,1080")
            chrome_options.add_argument("--disable-blink-features=AutomationControlled")
            chrome_options.add_experimental_option("excludeSwitches", ["enable-automation"])
            chrome_options.add_experimental_option('useAutomationExtension', False)
            chrome_options.add_argument("--user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36")
            
            # Additional stealth options
            chrome_options.add_argument("--disable-extensions")
            chrome_options.add_argument("--disable-plugins")
            chrome_options.add_argument("--no-first-run")
            chrome_options.add_argument("--disable-default-apps")
            chrome_options.add_argument("--disable-web-security")
            chrome_options.add_argument("--allow-running-insecure-content")
            
            # Setup Chrome driver
            service = Service(ChromeDriverManager().install())
            self.driver = webdriver.Chrome(service=service, options=chrome_options)
            
            # Execute script to hide automation indicators
            self.driver.execute_script("Object.defineProperty(navigator, 'webdriver', {get: () => undefined})")
            
            self.wait = WebDriverWait(self.driver, 30)  # Increased timeout for JS loading
            print("✅ Selenium WebDriver setup complete")
            
        except Exception as e:
            print(f"❌ Failed to setup Selenium: {e}")
            raise
    
    def cleanup(self) -> None:
        """Clean up Selenium WebDriver"""
        if self.driver:
            try:
                self.driver.quit()
                print("🧹 Selenium WebDriver cleaned up")
            except Exception as e:
                print(f"⚠️ Error cleaning up Selenium: {e}")
    
    def __del__(self):
        """Destructor to ensure cleanup"""
        self.cleanup()
    
    def scrape_category_page(self, url: str) -> List[Product]:
        """Scrape all products from a category page"""
        products = []
        
        if not self.driver:
            print("❌ Driver not initialized")
            return products
        
        print(f"🔍 Scraping Price Chopper category page: {url}")
        
        try:
            # Navigate to the category page
            self.driver.get(url)
            
            # Wait for page to load
            print("⏳ Waiting for initial page load...")
            time.sleep(8)  # Give extra time for React to load
            
            # Check if we're still connected
            try:
                current_url = self.driver.current_url
                print(f"📍 Current URL: {current_url}")
            except Exception as e:
                print(f"❌ Lost connection to browser: {e}")
                return products
            
            # Wait for the loading indicator to disappear
            print("⏳ Waiting for loading to complete...")
            try:
                if self.wait:
                    # Wait for the loading template to disappear
                    self.wait.until_not(EC.presence_of_element_located((By.ID, "loading-template")))
                    print("✅ Loading template disappeared")
            except TimeoutException:
                print("⚠️ Loading template still present, continuing anyway...")
            
            # Wait for products to load
            print("⏳ Waiting for products to load...")
            product_selectors = [
                "[data-testid*='product']",
                ".product-item",
                ".product-card",
                "[class*='product-card']",
                "[class*='item-card']",
                ".item",
                "[data-automation-id*='product']"
            ]
            
            products_found = False
            for selector in product_selectors:
                try:
                    if self.wait:
                        elements = self.wait.until(EC.presence_of_all_elements_located((By.CSS_SELECTOR, selector)))
                        if elements:
                            print(f"✅ Found {len(elements)} products with selector: {selector}")
                            products_found = True
                            break
                except TimeoutException:
                    continue
            
            if not products_found:
                print("⚠️ No products found with standard selectors, trying alternative approach...")
                # Wait a bit more and try different approach
                time.sleep(10)
            
            # Scroll to load more products if needed
            self.scroll_to_load_products()
            
            # Get page source and parse
            print("📄 Getting page source...")
            page_source = self.driver.page_source
            
            soup = BeautifulSoup(page_source, 'html.parser')
            
            # Debug what we got
            title = soup.find('title')
            if title:
                print(f"📄 Page title: {title.get_text(strip=True)}")
            
            # Extract products directly from the rendered page
            products = self.extract_products_from_page(soup, url)
            
            if not products:
                print("❌ No products found")
                self.debug_page_content(soup)
                return products
            
            print(f"✅ Found {len(products)} products")
            
        except Exception as e:
            print(f"❌ Error in category scraping: {e}")
        
        return products
    
    def scroll_to_load_products(self):
        """Scroll down to load more products dynamically"""
        if not self.driver:
            print("❌ Driver not initialized")
            return
            
        print("📜 Scrolling to load all products...")
        
        last_height = self.driver.execute_script("return document.body.scrollHeight")
        scroll_attempts = 0
        max_scrolls = 5
        
        while scroll_attempts < max_scrolls:
            # Scroll down to bottom
            self.driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
            
            # Wait for new content to load
            time.sleep(3)
            
            # Calculate new scroll height
            new_height = self.driver.execute_script("return document.body.scrollHeight")
            
            if new_height == last_height:
                break
                
            last_height = new_height
            scroll_attempts += 1
        
        print(f"✅ Completed scrolling ({scroll_attempts} scrolls)")
    
    def extract_products_from_page(self, soup: BeautifulSoup, base_url: str) -> List[Product]:
        """Extract products directly from the category page"""
        products = []
        
        print("🔍 Looking for products on rendered page...")
        
        # More comprehensive selectors for grocery sites
        product_selectors = [
            "[data-testid*='product']",
            "[data-testid*='item']",
            ".product-item",
            ".product-card",
            ".product",
            "[class*='product-card']",
            "[class*='item-card']",
            "[class*='product-tile']",
            ".item",
            ".grid-item",
            "[class*='product']",
            "[class*='item']"
        ]
        
        for selector in product_selectors:
            try:
                elements = soup.select(selector)
                print(f"🔍 Selector '{selector}': {len(elements)} elements")
                
                if elements:
                    print(f"✅ Found {len(elements)} product elements with selector: {selector}")
                    
                    for element in elements:
                        try:
                            product = self.extract_product_from_element(element, base_url)
                            if product:
                                products.append(product)
                        except Exception as e:
                            print(f"⚠️ Error extracting product from element: {e}")
                            continue
                    
                    if products:  # If we found products, use this selector
                        break
                        
            except Exception as e:
                print(f"⚠️ Selector '{selector}' failed: {e}")
                continue
        
        return products
    
    def extract_product_from_element(self, element: Any, base_url: str) -> Optional[Product]:
        """Extract product info from a product element"""
        try:
            # Find product name with various selectors
            name_selectors = [
                "[data-testid*='product-name']",
                "[data-testid*='item-name']",
                ".product-title",
                ".product-name",
                ".title",
                ".name",
                "h1", "h2", "h3", "h4",
                "[class*='title']",
                "[class*='name']",
                "a[title]",
                "span[title]"
            ]
            
            name = None
            product_url = None
            
            for selector in name_selectors:
                try:
                    name_elem = element.select_one(selector)
                    if name_elem:
                        name = name_elem.get_text(strip=True)
                        if name and len(name) > 2:
                            # Try to get product URL
                            link = name_elem.find('a') if name_elem.name != 'a' else name_elem
                            if link and link.get('href'):
                                href = link.get('href')
                                href_str = str(href) if href else ''
                                if href_str.startswith('/'):
                                    product_url = f"https://shop.pricechopper.com{href_str}"
                                elif href_str.startswith('http'):
                                    product_url = href_str
                            break
                except Exception:
                    continue
            
            # If no name found in text, try title attributes
            if not name:
                for elem in element.find_all(['a', 'span', 'div'], title=True):
                    title_text = elem.get('title', '')
                    if title_text and len(title_text) > 2:
                        name = title_text
                        break
            
            if not name:
                return None
            
            # Find price with various selectors
            price_selectors = [
                "[data-testid*='price']",
                ".price",
                ".product-price",
                "[class*='price']",
                ".cost",
                "[class*='cost']"
            ]
            
            price = None
            for selector in price_selectors:
                try:
                    price_elem = element.select_one(selector)
                    if price_elem:
                        price_text = price_elem.get_text(strip=True)
                        if price_text and ('$' in price_text or any(c.isdigit() for c in price_text)):
                            price = price_text
                            break
                except Exception:
                    continue
            
            if not price:
                price = "Price not available"
            
            # Parse product info
            raw_name = str(name)
            brand_info = self.parse_brand_and_name(raw_name)
            size_info = self.extract_size_info(raw_name)
            clean_price = self.clean_price(str(price))
            
            return Product(
                brand=brand_info['brand'],
                name=brand_info['name'],
                price=clean_price,
                category="Produce",
                size=size_info.get('size', 'Not specified'),
                unit=size_info.get('unit', 'Not specified'),
                product_url=product_url,
                raw_name=raw_name
            )
            
        except Exception as e:
            print(f"❌ Error extracting product from element: {e}")
            return None
    
    def parse_brand_and_name(self, raw_name: str) -> Dict[str, str]:
        """Parse brand and product name from raw name"""
        if not raw_name:
            return {'brand': 'Unknown', 'name': 'Unknown Product'}
        
        # Clean up the name first
        cleaned_name = raw_name.strip()
        
        # Remove size information (everything from dash or comma onwards)
        for separator in [' - ', ', ', ' | ']:
            if separator in cleaned_name:
                cleaned_name = cleaned_name.split(separator)[0].strip()
                break
        
        # Common patterns for produce
        produce_patterns = [
            r'^(Organic|Fresh|Premium|Select|Market 32)\s+(.+)',
            r'^(.+?)\s+(Apples?|Oranges?|Bananas?|Potatoes?|Onions?|Carrots?|Peppers?|Tomatoes?)',
        ]
        
        # Try produce patterns first
        for pattern in produce_patterns:
            match = re.match(pattern, cleaned_name, re.IGNORECASE)
            if match:
                if pattern.startswith('^(Organic'):  # Multi-word brand
                    return {
                        'brand': match.group(1),
                        'name': match.group(2)
                    }
                else:  # Product type at end
                    return {
                        'brand': 'Fresh',
                        'name': cleaned_name
                    }
        
        # Try to identify brand (first word if capitalized)
        words = cleaned_name.split()
        if len(words) >= 2:
            first_word = words[0]
            if first_word[0].isupper() and len(first_word) >= 2:
                remaining = ' '.join(words[1:])
                return {
                    'brand': first_word,
                    'name': remaining if remaining else cleaned_name
                }
        
        # Fallback: treat as store brand
        return {
            'brand': 'Market 32',
            'name': cleaned_name
        }
    
    def extract_size_info(self, name: str) -> Dict[str, str]:
        """Extract size and unit information"""
        size_info = {'size': 'Not specified', 'unit': 'Not specified'}
        
        # Common size patterns
        size_patterns = [
            r'(\d+\.?\d*)\s*(oz|ounces?|lb|lbs?|pounds?|kg|g|grams?)',
            r'(\d+\.?\d*)\s*(ct|count|pack|pcs?|pieces?)',
            r'(\d+)\s*(ea|each)',
            r'(\d+\.?\d*)\s*-?\s*(lb|pound)',
        ]
        
        for pattern in size_patterns:
            match = re.search(pattern, name, re.IGNORECASE)
            if match:
                size_info['size'] = match.group(1)
                size_info['unit'] = match.group(2)
                break
        
        return size_info
    
    def clean_price(self, price: str) -> str:
        """Clean and format price"""
        if not price:
            return "Price not available"
        
        # Extract numbers and decimal points
        price_clean = re.sub(r'[^\d\.]', '', price)
        
        if price_clean:
            try:
                price_float = float(price_clean)
                return f"${price_float:.2f}"
            except ValueError:
                pass
        
        return "Price not available"
    
    def debug_page_content(self, soup: BeautifulSoup) -> None:
        """Debug page content when extraction fails"""
        print("🔍 Debugging page content...")
        
        # Check for common indicators
        title = soup.find('title')
        if title:
            print(f"📄 Page title: {title.get_text(strip=True)}")
        
        # Look for any text that might be a product name
        h_tags = soup.find_all(['h1', 'h2', 'h3'])
        print(f"📝 Found {len(h_tags)} heading tags:")
        for i, tag in enumerate(h_tags[:5]):
            text = tag.get_text(strip=True)
            if text:
                print(f"  H{tag.name[1:]}: {text[:100]}")
        
        # Check for price-like text
        price_like = soup.find_all(string=re.compile(r'\$\d'))
        print(f"💰 Found {len(price_like)} price-like texts:")
        for price_text in price_like[:3]:
            price_str = str(price_text) if price_text else ''
            if price_str.strip():
                print(f"  Price: {price_str.strip()}")
        
        # Look for data-testid attributes
        testid_elements = soup.find_all(attrs={"data-testid": True})
        print(f"🧪 Found {len(testid_elements)} elements with data-testid:")
        testids = set()
        for elem in testid_elements:
            testid = elem.get('data-testid')
            if testid:
                testids.add(str(testid))
        
        relevant_testids = [tid for tid in sorted(testids) if any(keyword in tid.lower() for keyword in ['product', 'item', 'card'])]
        if relevant_testids:
            print(f"  Relevant testids: {relevant_testids[:10]}")
    
    def save_to_json(self, products: List[Product], filename: str) -> None:
        """Save products to JSON file"""
        product_dicts = [product.to_dict() for product in products]
        
        with open(filename, 'w', encoding='utf-8') as f:
            json.dump(product_dicts, f, indent=2, ensure_ascii=False)
        
        print(f"💾 Saved {len(products)} product(s) to {filename}")


def main():
    """Main function to run the scraper"""
    print("🛒 Scraping Price Chopper Produce with Selenium")
    print("=" * 60)
    
    # Use headless for efficiency, set to False for debugging
    scraper = PriceChopperSeleniumScraper(headless=True, delay=3.0)
    
    try:
        # Use the provided URL
        pricechopper_url = "https://shop.pricechopper.com/store/price-chopper-ny/collections/n-produce-61?_gl=1*nkbst7*_gcl_au*MTM3MzM3NTk4OS4xNzYyMjc4OTky*_ga*MTgyOTY0NjU2LjE3NjIyNzg5OTM.*_ga_4B5RTNL54S*czE3NjIyNzg5OTMkbzEkZzAkdDE3NjIyNzg5OTMkajYwJGwwJGgw"
        print(f"🎯 Price Chopper URL: {pricechopper_url}")
        
        products = scraper.scrape_category_page(pricechopper_url)
        
        if products:
            print(f"\n✅ Successfully scraped {len(products)} product(s) from Price Chopper produce!")
            
            # Save results
            scraper.save_to_json(products, 'pricechopper_produce_results.json')
            print(f"💾 Saved {len(products)} product(s) to pricechopper_produce_results.json")
            
            # Show first few products
            print("\n🔍 Sample products:")
            for i, product in enumerate(products[:5]):
                print(f"   {i+1}. {product.brand} {product.name} - {product.price}")
        else:
            print("❌ No products found")
            
    except Exception as e:
        print(f"❌ Error during scraping: {e}")
        import traceback
        traceback.print_exc()
    
    finally:
        scraper.cleanup()
        print("\n🏁 Scraping session completed")
        print("🧹 Selenium WebDriver cleaned up")


if __name__ == "__main__":
    main()