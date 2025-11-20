#!/usr/bin/env python3
"""
Price Chopper Scraper - Uses Selenium for dynamic content.

Scrapes product data from Price Chopper's website using Selenium for JavaScript rendering.
"""

import re
import time
from typing import List, Optional, Dict, Any
from bs4 import BeautifulSoup
from datetime import datetime

from scrapers.core import Product, ScraperResult, SeleniumClient
from scrapers.core.exceptions import SeleniumError, ParseError
from scrapers.utils import (
    parse_price, parse_size, clean_text,
    validate_product, clean_product_data,
    save_scraper_result, parse_brand_and_name
)


class PriceChopperScraper:
    """
    Price Chopper-specific web scraper using Selenium.
    
    Scrapes product data from Price Chopper's website using Selenium for dynamic content.
    """
    
    # Known Price Chopper brands (can be extended)
    KNOWN_BRANDS = [
        "Price Chopper", "Market 32", "Central Market", "Tops",
        "Essential Everyday", "Full Circle", "TopCare", "Shop Rite"
    ]
    
    def __init__(
        self,
        headless: bool = True,
        page_load_wait: int = 5,
        scroll_pause: float = 2.0
    ):
        """
        Initialize Price Chopper scraper.
        
        Args:
            headless: Run browser in headless mode
            page_load_wait: Seconds to wait after page load
            scroll_pause: Seconds to pause between scrolls
        """
        self.store_name = "pricechopper"
        self.base_url = "https://shop.pricechopper.com"
        self.headless = headless
        self.page_load_wait = page_load_wait
        self.scroll_pause = scroll_pause
        self.selenium_client: Optional[SeleniumClient] = None
        
    def scrape(
        self,
        category_urls: Optional[List[str]] = None,
        max_products: Optional[int] = None
    ) -> ScraperResult:
        """
        Scrape products from Price Chopper.
        
        Args:
            category_urls: List of category URLs to scrape. If None, uses default.
            max_products: Maximum number of products to scrape (optional)
            
        Returns:
            ScraperResult with products and metadata
        """
        start_time = time.time()
        products = []
        errors = []
        
        # Default categories if none provided
        if not category_urls:
            category_urls = [
                f"{self.base_url}/store/price-chopper-ny/collections/n-produce-61"
            ]
        
        print("=" * 60)
        print("Starting Price Chopper Scraper")
        print("=" * 60)
        print()
        
        try:
            # Initialize Selenium client
            with SeleniumClient(headless=self.headless) as client:
                self.selenium_client = client
                
                for idx, url in enumerate(category_urls, 1):
                    if max_products and len(products) >= max_products:
                        break
                    
                    print(f"📄 Scraping category {idx}/{len(category_urls)}: {url}")
                    
                    try:
                        category_products = self._scrape_category(url)
                        products.extend(category_products)
                        print(f"   ✓ Found {len(category_products)} products")
                        
                        if max_products and len(products) >= max_products:
                            products = products[:max_products]
                            break
                            
                    except Exception as e:
                        error_msg = f"Error scraping {url}: {str(e)}"
                        print(f"   ⚠️  {error_msg}")
                        errors.append(error_msg)
                        continue
        
        except Exception as e:
            error_msg = f"Fatal error during scraping: {str(e)}"
            print(f"❌ {error_msg}")
            errors.append(error_msg)
        
        finally:
            self.selenium_client = None
        
        duration = time.time() - start_time
        
        # Create result
        result = ScraperResult(
            store=self.store_name,
            products=products,
            total_scraped=len(products),
            errors=errors,
            duration_seconds=round(duration, 2),
            timestamp=datetime.now(),
            scraper_version="1.0.0",
            success=len(errors) == 0
        )
        
        # Print summary
        self._print_summary(result)
        
        return result
    
    def _scrape_category(self, url: str) -> List[Product]:
        """
        Scrape all products from a category page.
        
        Args:
            url: Category page URL
            
        Returns:
            List of Product objects
        """
        products = []
        
        try:
            # Load page
            self.selenium_client.get(url, wait_time=self.page_load_wait)
            
            # Scroll to load all products (if infinite scroll)
            self._scroll_to_load_products()
            
            # Get page source and parse with BeautifulSoup
            html = self.selenium_client.get_page_source()
            
            # Debug: Save HTML to file for inspection
            with open('scrapers/output/raw/pricechopper_debug.html', 'w', encoding='utf-8') as f:
                f.write(html)
            print(f"   💾 Saved HTML to scrapers/output/raw/pricechopper_debug.html")
            
            soup = BeautifulSoup(html, 'html.parser')
            
            # Extract products
            products = self._extract_products(soup)
            
        except SeleniumError as e:
            raise ParseError(f"Selenium error: {str(e)}")
        
        return products
    
    def _scroll_to_load_products(self) -> None:
        """
        Scroll page to trigger lazy loading of products.
        """
        try:
            # Wait for products to start appearing (up to 30 seconds)
            print("   ⏳ Waiting for products to load...")
            max_wait = 30
            start_time = time.time()
            
            while time.time() - start_time < max_wait:
                # Check for product elements
                html = self.selenium_client.get_page_source()
                soup = BeautifulSoup(html, 'html.parser')
                
                # Look for any product-like elements
                products = (
                    soup.find_all('div', {'data-testid': lambda x: x and 'product' in str(x).lower()}) or
                    soup.find_all('article') or
                    soup.find_all('div', class_=lambda x: x and 'product' in str(x).lower()) or
                    soup.find_all('div', {'role': 'listitem'})
                )
                
                if len(products) > 5:  # Need at least a few products
                    elapsed = time.time() - start_time
                    print(f"   ✓ Found {len(products)} potential products after {elapsed:.1f}s")
                    break
                
                # Scroll a bit to trigger loading
                self.selenium_client.driver.execute_script("window.scrollBy(0, 500);")
                time.sleep(0.5)
            else:
                print(f"   ⚠️  No products appeared after {max_wait}s")
            
            # Now do full scroll to load remaining products
            for i in range(3):
                self.selenium_client.scroll_to_bottom(pause_time=self.scroll_pause)
                
            # Use infinite scroll helper
            self.selenium_client.scroll_infinite_load(
                max_scrolls=3,
                pause_time=self.scroll_pause
            )
            
        except Exception as e:
            print(f"   ⚠️  Scroll warning: {str(e)}")
            # Continue even if scrolling has issues
    
    def _extract_products(self, soup: BeautifulSoup) -> List[Product]:
        """
        Extract products from parsed HTML.
        
        Args:
            soup: BeautifulSoup parsed HTML
            
        Returns:
            List of Product objects
        """
        products = []
        
        # Try multiple selectors to find product containers
        product_selectors = [
            '.product-card',
            '.product-item',
            '.product',
            '[data-testid*="product"]',
            '.item-card',
            'article',
            '[class*="Product"]',
            '[class*="product"]',
            '.item',
            '[class*="Item"]'
        ]
        
        product_elements = []
        for selector in product_selectors:
            product_elements = soup.select(selector)
            if product_elements:
                print(f"   Found {len(product_elements)} product elements with selector: {selector}")
                break
        
        if not product_elements:
            print("   ⚠️  No product elements found")
            # Debug: Print some of the page structure
            print("   🔍 Debugging - looking for common element patterns...")
            divs_with_class = soup.find_all('div', class_=True, limit=20)
            if divs_with_class:
                classes = set()
                for div in divs_with_class:
                    classes.update(div.get('class', []))
                print(f"   Sample classes found: {list(classes)[:10]}")
            return products
        
        # Extract each product
        for i, element in enumerate(product_elements, 1):
            try:
                product = self._extract_product_info(element)
                if product:
                    products.append(product)
            except Exception as e:
                print(f"   ⚠️  Error extracting product {i}: {str(e)}")
                continue
        
        return products
    
    def _extract_product_info(self, element) -> Optional[Product]:
        """
        Extract product information from a product element.
        
        Args:
            element: BeautifulSoup element containing product data
            
        Returns:
            Product object or None if extraction failed
        """
        try:
            # Extract full name (contains brand + product name)
            full_name = self._extract_name(element)
            if not full_name:
                return None
            
            # Parse brand and product name
            brand, product_name = parse_brand_and_name(full_name, self.KNOWN_BRANDS)
            
            # If no brand was found, use "Generic"
            if not brand:
                brand = "Generic"
                product_name = full_name
            
            # Extract price
            price = self._extract_price(element)
            if not price:
                return None
            
            # Extract size and unit (from full_name before cleaning)
            size, unit = self._extract_size_and_unit(element, full_name)
            
            # Clean product name: remove size/price info
            product_name = self._clean_product_name(product_name, size, unit, price)
            
            # Extract category (try from element or default)
            category = self._extract_category(element)
            
            # Build raw product data
            raw_data = {
                'brand': brand,
                'name': product_name,
                'price': price,
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
                print(f"   ⚠️  Validation errors: {errors}")
                return None
            
            return product
            
        except Exception as e:
            raise ParseError(f"Failed to extract product info: {str(e)}")
    
    def _extract_name(self, element) -> Optional[str]:
        """Extract product name from element."""
        name_selectors = [
            'h1', 'h2', 'h3', 'h4',
            '.product-title', '.product-name', '.name', '.title',
            '[data-testid*="name"]', '[data-testid*="title"]',
            '[class*="name"]', '[class*="title"]',
            'a[href*="product"]'
        ]
        
        for selector in name_selectors:
            elem = element.select_one(selector)
            if elem:
                text = clean_text(elem.get_text())
                if text and len(text) > 2:
                    # Clean up duplicate patterns in names
                    text = self._clean_duplicate_patterns(text)
                    return text
        
        return None
    
    def _clean_duplicate_patterns(self, text: str) -> str:
        """Remove duplicate patterns like '8 oz8 oz' -> '8 oz'."""
        # Pattern 1: number + unit immediately repeated (no space)
        text = re.sub(r'(\d+\.?\d*\s*(?:oz|lb|lbs|ml|l|g|kg|ct|count|pack))\1', r'\1', text, flags=re.IGNORECASE)
        
        # Pattern 2: fluid ounce repetition
        text = re.sub(r'(\d+\.?\d*\s*fl\s*oz)\1', r'\1', text, flags=re.IGNORECASE)
        
        # Pattern 3: spaced repetition
        text = re.sub(r'(\d+\.?\d*)\s+(oz|lb|lbs|ml|l|g|kg|ct|count|pack)\s+\1\s+\2', r'\1 \2', text, flags=re.IGNORECASE)
        
        return text
    
    def _clean_product_name(self, name: str, size: Optional[str], unit: Optional[str], price: Optional[str]) -> str:
        """
        Remove size and price information from product name.
        
        Args:
            name: Product name that may contain size/price
            size: Extracted size value
            unit: Extracted unit value
            price: Extracted price value
            
        Returns:
            Cleaned product name without size/price
        """
        cleaned = name
        
        # Remove price patterns
        cleaned = re.sub(r'\$\d+\.?\d*', '', cleaned)
        
        # Remove size patterns
        cleaned = re.sub(r',?\s*\d+\.?\d*\s*(oz|fl oz|lb|lbs|ml|l|g|kg|ct|count|pack|can|box|bottle|jar|bag|gallon|quart|pint|cup|fluid ounce|ounce|pound|gram|kilogram|liter|milliliter|feet|ft|inch|in)\b', '', cleaned, flags=re.IGNORECASE)
        
        # Remove "x count" patterns
        cleaned = re.sub(r'\d+\s*(count|ct|pack)\d*', '', cleaned, flags=re.IGNORECASE)
        
        # Remove standalone numbers at end
        cleaned = re.sub(r'\s+\d+\.?\d*\s*$', '', cleaned)
        
        # Clean up extra spaces and commas
        cleaned = re.sub(r'\s*,\s*,\s*', ', ', cleaned)
        cleaned = re.sub(r',\s*$', '', cleaned)
        cleaned = re.sub(r'^\s*,\s*', '', cleaned)
        cleaned = re.sub(r'\s+', ' ', cleaned)
        
        return cleaned.strip()
    
    def _extract_price(self, element) -> Optional[str]:
        """Extract price from element."""
        price_selectors = [
            '.price', '.cost', '[class*="price"]', '[class*="Price"]',
            '[data-testid*="price"]', '.amount', '[class*="amount"]'
        ]
        
        for selector in price_selectors:
            elem = element.select_one(selector)
            if elem:
                text = elem.get_text()
                parsed_price = parse_price(text)
                if parsed_price:
                    return str(parsed_price)
        
        # Try to find price in all text
        all_text = element.get_text()
        parsed_price = parse_price(all_text)
        if parsed_price:
            return str(parsed_price)
        
        return None
    
    def _extract_size_and_unit(self, element, name: str) -> tuple:
        """Extract size and unit from element or name."""
        # Look in element first
        size_selectors = [
            '.size', '.quantity', '[class*="size"]',
            '[data-testid*="size"]', '.unit'
        ]
        
        for selector in size_selectors:
            elem = element.select_one(selector)
            if elem:
                text = clean_text(elem.get_text())
                size, unit = parse_size(text)
                if size and unit:
                    return (str(size), unit)
        
        # Try to extract from name
        if name:
            size, unit = parse_size(name)
            if size and unit:
                return (str(size), unit)
        
        # Try entire element text
        all_text = element.get_text()
        size, unit = parse_size(all_text)
        if size and unit:
            return (str(size), unit)
        
        return (None, None)
    
    def _extract_category(self, element) -> str:
        """Extract category from element or use default."""
        category_selectors = [
            '.category', '.department', '[class*="category"]',
            '[data-testid*="category"]'
        ]
        
        for selector in category_selectors:
            elem = element.select_one(selector)
            if elem:
                text = clean_text(elem.get_text())
                if text:
                    return text
        
        return "Grocery"
    
    def _print_summary(self, result: ScraperResult) -> None:
        """Print scraping summary."""
        print()
        print("=" * 60)
        print("Scraping Complete")
        print("=" * 60)
        print(f"Store: {result.store}")
        print(f"Products scraped: {result.total_scraped}")
        print(f"Errors: {len(result.errors)}")
        print(f"Duration: {result.duration_seconds}s")
        print(f"Success: {'✓' if result.success else '✗'}")
        
        if result.products:
            print("\nSample products:")
            for product in result.products[:3]:
                print(f"  • {product.brand} - {product.name} (${product.price})")
        
        print("=" * 60)
        print()


def main():
    """Main entry point for testing."""
    scraper = PriceChopperScraper(headless=True)
    
    # Scrape products
    result = scraper.scrape(max_products=50)
    
    # Save results
    output_path = 'scrapers/output/raw/pricechopper_scraped_products.json'
    save_scraper_result(result, output_path)
    print(f"💾 Saved results to {output_path}")


if __name__ == "__main__":
    main()