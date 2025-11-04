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
    source: str = "hannaford"
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


class HannafordSeleniumScraper:
    """
    Standalone Hannaford scraper using Selenium for JavaScript-heavy pages
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
            
            # Configure Chrome options
            chrome_options = Options()
            if self.headless:
                chrome_options.add_argument("--headless")
            chrome_options.add_argument("--no-sandbox")
            chrome_options.add_argument("--disable-dev-shm-usage")
            chrome_options.add_argument("--disable-gpu")
            chrome_options.add_argument("--window-size=1920,1080")
            chrome_options.add_argument("--disable-blink-features=AutomationControlled")
            chrome_options.add_experimental_option("excludeSwitches", ["enable-automation"])
            chrome_options.add_experimental_option('useAutomationExtension', False)
            chrome_options.add_argument("--user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36")
            
            # Setup Chrome driver
            service = Service(ChromeDriverManager().install())
            self.driver = webdriver.Chrome(service=service, options=chrome_options)
            
            # Execute script to hide automation indicators
            self.driver.execute_script("Object.defineProperty(navigator, 'webdriver', {get: () => undefined})")
            
            self.wait = WebDriverWait(self.driver, 15)
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
        
        print(f"🔍 Scraping category page: {url}")
        
        # Navigate to the category page
        self.driver.get(url)
        
        # Wait for page to load
        print("⏳ Waiting for category page to load...")
        time.sleep(3)
        
        # Wait for product grid to load
        try:
            WebDriverWait(self.driver, 15).until(
                EC.presence_of_element_located((By.CSS_SELECTOR, "[data-testid*='product'], .product-item, .product-card"))
            )
            print("✅ Product grid loaded")
        except TimeoutException:
            print("⚠️ Timeout waiting for product grid, continuing anyway...")
        
        # Scroll to load more products
        self.scroll_to_load_products()
        
        # Find all product links
        product_links = self.find_product_links()
        
        if not product_links:
            print("❌ No product links found on category page")
            return products
        
        print(f"🔍 Found {len(product_links)} product links")
        
        # Scrape each product (limit to avoid long execution)
        max_products = 20  # Limit for testing
        for i, link in enumerate(product_links[:max_products]):
            try:
                print(f"📦 Scraping product {i+1}/{min(len(product_links), max_products)}: {link}")
                product = self.scrape_product(link)
                if product:
                    products.append(product)
                    print(f"   ✅ {product.brand} {product.name} - {product.price}")
                else:
                    print(f"   ❌ Failed to extract product from {link}")
                
                # Small delay between products
                time.sleep(1)
                
            except Exception as e:
                print(f"   ❌ Error scraping {link}: {e}")
                continue
        
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
            time.sleep(2)
            
            # Calculate new scroll height
            new_height = self.driver.execute_script("return document.body.scrollHeight")
            
            if new_height == last_height:
                break
                
            last_height = new_height
            scroll_attempts += 1
        
        print(f"✅ Completed scrolling ({scroll_attempts} scrolls)")
    
    def find_product_links(self) -> List[str]:
        """Find all product links on the category page"""
        if not self.driver:
            print("❌ Driver not initialized")
            return []
            
        links = []
        
        # Multiple selectors to try
        selectors = [
            "a[href*='/product/']",
            "[data-testid*='product'] a",
            ".product-item a",
            ".product-card a",
            "a[data-testid*='product-link']"
        ]
        
        for selector in selectors:
            try:
                elements = self.driver.find_elements(By.CSS_SELECTOR, selector)
                if elements:
                    print(f"✅ Found {len(elements)} links with selector: {selector}")
                    for element in elements:
                        href = element.get_attribute('href')
                        if href and '/product/' in href and href not in links:
                            links.append(href)
                    break
            except Exception as e:
                print(f"⚠️ Selector '{selector}' failed: {e}")
                continue
        
        return links

    def scrape_product(self, url: str) -> Optional[Product]:
        """
        Scrape a single product from the given URL
        
        Args:
            url: Product URL to scrape
            
        Returns:
            Product object or None if scraping failed
        """
        if not self.driver or not self.wait:
            print("❌ Driver or wait not initialized")
            return None
            
        try:
            print(f"🔍 Scraping product from: {url}")
            
            # Navigate to the page
            self.driver.get(url)
            
            # Wait for initial page load
            print("⏳ Waiting for page to load...")
            time.sleep(self.delay)
            
            # Wait for any dynamic content
            try:
                # Wait for body to be present
                self.wait.until(EC.presence_of_element_located((By.TAG_NAME, "body")))
                print("✅ Page body loaded")
            except TimeoutException:
                print("⚠️ Timeout waiting for page body")
            
            # Try to wait for product-specific elements
            product_indicators = [
                "h1",
                "[data-testid*='product']",
                "[class*='product']",
                "[class*='item']",
                ".price",
                "[data-testid*='price']"
            ]
            
            for selector in product_indicators:
                try:
                    element = self.wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, selector)))
                    print(f"✅ Found product indicator: {selector}")
                    break
                except TimeoutException:
                    continue
            
            # Additional wait for dynamic content
            print("⏳ Waiting for dynamic content...")
            time.sleep(3)
            
            # Get the rendered page source
            page_source = self.driver.page_source
            soup = BeautifulSoup(page_source, 'html.parser')
            
            print("🔍 Analyzing rendered content...")
            
            # Extract product information
            product = self.extract_product_info(soup, url)
            
            if product:
                print(f"✅ Successfully extracted: {product.name}")
                return product
            else:
                print("❌ Could not extract product information")
                self.debug_page_content(soup)
                return None
                
        except Exception as e:
            print(f"❌ Error scraping product: {e}")
            return None
    
    def extract_product_info(self, soup: BeautifulSoup, url: str) -> Optional[Product]:
        """Extract product information from the rendered page"""
        try:
            # Try various selectors for product name
            name_selectors = [
                "h1",
                "[data-testid*='product-title']",
                "[data-testid*='product-name']",
                ".product-title",
                ".product-name",
                ".item-title",
                ".pdp-product-name",
                "h1[class*='product']",
                "[class*='product-title']",
                "[class*='item-name']"
            ]
            
            name = self.find_text_by_selectors(soup, name_selectors)
            print(f"📝 Product name: {name}")
            
            # Try various selectors for price
            price_selectors = [
                ".price",
                "[data-testid*='price']",
                ".product-price",
                ".current-price",
                ".item-price",
                "span[class*='price']",
                "[class*='price-current']",
                ".price-display"
            ]
            
            price = self.find_text_by_selectors(soup, price_selectors)
            print(f"💰 Price: {price}")
            
            # Try to find category from breadcrumbs
            category_selectors = [
                ".breadcrumb a",
                ".breadcrumbs a",
                "nav a",
                "[data-testid*='breadcrumb'] a",
                "ol a",
                "ul a"
            ]
            
            category = self.extract_category(soup, category_selectors)
            print(f"🏷️ Category: {category}")
            
            # If no name found, try alternative approaches
            if not name:
                name = self.extract_alternative_name(soup)
                print(f"📝 Alternative name: {name}")
            
            if not name:
                print("❌ No product name found")
                return None
            
            # Parse brand and clean name
            raw_name = str(name)
            brand_info = self.parse_brand_and_name(raw_name)
            brand = brand_info['brand']
            clean_name = brand_info['name']
            
            # Extract size information
            size_info = self.extract_size_info(raw_name)
            
            # Clean price
            if price:
                price = self.clean_price(str(price))
            else:
                price = "Price not available"
            
            return Product(
                brand=brand,
                name=clean_name,
                price=price,
                category=category,
                size=size_info.get('size', 'Not specified'),
                unit=size_info.get('unit', 'Not specified'),
                product_url=url,
                raw_name=raw_name
            )
            
        except Exception as e:
            print(f"❌ Error extracting product info: {e}")
            return None
    
    def find_text_by_selectors(self, soup: BeautifulSoup, selectors: List[str]) -> Optional[str]:
        """Find text using multiple CSS selectors"""
        for selector in selectors:
            try:
                elements = soup.select(selector)
                for element in elements:
                    text = element.get_text(strip=True)
                    if text and len(text) > 1:
                        return text
            except Exception:
                continue
        return None
    
    def extract_category(self, soup: BeautifulSoup, selectors: List[str]) -> str:
        """Extract category from breadcrumbs"""
        for selector in selectors:
            try:
                elements = soup.select(selector)
                if elements and len(elements) > 1:
                    # Get the last meaningful breadcrumb (skip "Home" and current page)
                    for elem in reversed(elements[:-1]):
                        text = elem.get_text(strip=True)
                        if text and text.lower() not in ['home', 'products', '']:
                            return text
            except Exception:
                continue
        return "General"
    
    def extract_alternative_name(self, soup: BeautifulSoup) -> Optional[str]:
        """Try alternative methods to extract product name"""
        try:
            # Try page title
            title = soup.find('title')
            if title:
                title_text = title.get_text(strip=True)
                title_text = title_text.replace(' | Hannaford', '').strip()
                if title_text and 'grocery' not in title_text.lower():
                    return title_text
            
            # Try meta tags
            meta_tags = soup.find_all('meta')
            for meta in meta_tags:
                if meta.get('property') == 'og:title' or meta.get('name') == 'title':
                    content = meta.get('content', '')
                    # Ensure content is a string
                    content_str = str(content) if content else ''
                    if content_str and 'hannaford' not in content_str.lower():
                        return content_str
            
            return None
            
        except Exception:
            return None
    
    def parse_brand_and_name(self, raw_name: str) -> Dict[str, str]:
        """Parse brand and product name from raw name"""
        if not raw_name:
            return {'brand': 'Unknown', 'name': 'Unknown Product'}
        
        # Clean up the name first
        cleaned_name = raw_name.strip()
        
        # Remove size information (everything from comma onwards and after dash)
        if ',' in cleaned_name:
            cleaned_name = cleaned_name.split(',')[0].strip()
        if ' - ' in cleaned_name:
            cleaned_name = cleaned_name.split(' - ')[0].strip()
        
        # Common grocery product patterns
        produce_patterns = [
            r'^(Hot House|Organic|Fresh|Baby|Mini)\s+(.+)',
            r'^(.+?)\s+(Seedless|Cucumber|Tomato|Apple|Orange|Banana|Lettuce|Spinach|Carrot)',
        ]
        
        # Try produce patterns first
        for pattern in produce_patterns:
            match = re.match(pattern, cleaned_name, re.IGNORECASE)
            if match:
                if pattern.startswith('^(Hot House'):  # Multi-word brand
                    return {
                        'brand': match.group(1),
                        'name': match.group(2)
                    }
                else:  # Product type at end
                    return {
                        'brand': 'Fresh',
                        'name': cleaned_name
                    }
        
        # Try to identify brand (first word if capitalized and reasonable length)
        words = cleaned_name.split()
        if len(words) >= 2:
            # Check for two-word brands
            if len(words) >= 3 and words[0].lower() in ['hot', 'fresh', 'organic', 'baby']:
                brand = f"{words[0]} {words[1]}"
                remaining = ' '.join(words[2:])
                return {
                    'brand': brand,
                    'name': remaining if remaining else cleaned_name
                }
            
            # Single word brand
            first_word = words[0]
            if first_word[0].isupper() and len(first_word) >= 2:
                remaining = ' '.join(words[1:])
                return {
                    'brand': first_word,
                    'name': remaining if remaining else cleaned_name
                }
        
        # Fallback: treat as generic store brand
        return {
            'brand': 'Hannaford',
            'name': cleaned_name
        }
    
    def extract_size_info(self, name: str) -> Dict[str, str]:
        """Extract size and unit information"""
        size_info = {'size': 'Not specified', 'unit': 'Not specified'}
        
        # Common size patterns
        size_patterns = [
            r'(\d+\.?\d*)\s*(oz|ounces?|lb|lbs?|pounds?|kg|g|grams?|ml|l|liters?)',
            r'(\d+\.?\d*)\s*(ct|count|pack|pcs?|pieces?)',
            r'(\d+)\s*(ea|each)'
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
            print(f"Page title: {title.get_text(strip=True)}")
        
        # Look for any text that might be a product name
        h_tags = soup.find_all(['h1', 'h2', 'h3'])
        print(f"Found {len(h_tags)} heading tags:")
        for i, tag in enumerate(h_tags[:5]):
            text = tag.get_text(strip=True)
            if text:
                print(f"  H{tag.name[1:]}: {text[:100]}")
        
        # Check for price-like text
        price_like = soup.find_all(text=re.compile(r'\$\d'))
        print(f"Found {len(price_like)} price-like texts:")
        for price_text in price_like[:3]:
            price_str = str(price_text) if price_text else ''
            if price_str.strip():
                print(f"  Price: {price_str.strip()}")
            else:
                print(f"  Price: {price_str}")
    
    def save_to_json(self, products: List[Product], filename: str) -> None:
        """Save products to JSON file"""
        product_dicts = [product.to_dict() for product in products]
        
        with open(filename, 'w', encoding='utf-8') as f:
            json.dump(product_dicts, f, indent=2, ensure_ascii=False)
        
        print(f"💾 Saved {len(products)} product(s) to {filename}")


def main():
    """Main function to run the scraper"""
    print("🛒 Scraping Hannaford Produce Category with Selenium")
    print("=" * 60)
    
    scraper = HannafordSeleniumScraper()
    
    try:
        # Scrape the produce category page
        produce_url = "https://hannaford.com/browse-aisles/categories/1/categories/2098-produce"
        products = scraper.scrape_category_page(produce_url)
        
        if products:
            print(f"\n✅ Successfully scraped {len(products)} product(s) from produce category!")
            
            # Save results
            scraper.save_to_json(products, 'hannaford_produce_results.json')
            print(f"💾 Saved {len(products)} product(s) to hannaford_produce_results.json")
            
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