#!/usr/bin/env python3
"""
Aldi Scraper - Refactored to use core infrastructure.

Uses HTTPClient for requests and utils for data processing.
"""

import re
import time
from typing import List, Optional, Dict, Any
from bs4 import BeautifulSoup
from datetime import datetime

from scrapers.core import Product, ScraperResult, HTTPClient
from scrapers.core.exceptions import ConnectionError, ParseError
from scrapers.utils import (
    parse_price, parse_size, clean_text,
    validate_product, clean_product_data,
    save_scraper_result, parse_brand_and_name
)


class AldiScraper:
    """
    Aldi-specific web scraper using static HTTP requests.
    
    Scrapes product data from Aldi's website using BeautifulSoup for parsing.
    """
    
    # Known Aldi store brands
    KNOWN_BRANDS = [
        "Simply Nature", "Specially Selected", "Friendly Farms", "Millville",
        "Clancy's", "Southern Grove", "Park Street Deli", "Season's Choice",
        "L'oven Fresh", "Kirkwood", "Fremont Fish Market", "Baker's Corner",
        "Benton's", "Sundae Shoppe", "PurAqua", "Chef's Cupboard",
        "Happy Farms", "Pueblo Lindo", "Stonemill", "Earthly Grains",
        "Burman's", "Lunch Mate", "Priano", "Reggano", "Carlini",
        "Tuscan Garden", "Elevation", "Fit & Active", "Choceur",
        "Deutsche Küche", "Boulder", "Tandil", "Savoritz", "Sweet Harvest",
        "Little Journey", "Barissimo", "Beaumont", "Emporium Selection",
        "Brookdale", "Casa Mamita", "Appleton Farms", "Parkview",
        "Bremer", "Lunch Buddies", "Northern Cast", "Never Any!",
        "Bake Shop", "Simms", "Winking Owl", "Scarlet Path",
        "Heart to Tail", "Benner"
    ]
    
    def __init__(self, requests_per_second: float = 2.0):
        """
        Initialize Aldi scraper.
        
        Args:
            requests_per_second: Rate limit for requests (default: 2.0)
        """
        self.store_name = "aldi"
        self.base_url = "https://www.aldi.us"
        self.requests_per_second = requests_per_second
        self.http_client = None
    
    def scrape(self, max_pages: int = 60) -> ScraperResult:
        """
        Scrape products from Aldi website.
        
        Args:
            max_pages: Maximum number of pages to scrape (default: 3)
            
        Returns:
            ScraperResult with products and metadata
        """
        start_time = time.time()
        all_products = []
        errors = []
        
        print(f"\n{'='*60}")
        print(f"Starting Aldi Scraper")
        print(f"{'='*60}\n")
        
        try:
            with HTTPClient(requests_per_second=self.requests_per_second) as http:
                self.http_client = http
                
                # Scrape main products page and paginated pages
                pages_to_scrape = [f"{self.base_url}/products"]
                
                # Add pagination pages
                for page_num in range(2, max_pages + 1):
                    pages_to_scrape.append(f"{self.base_url}/products?page={page_num}")
                
                for page_num, url in enumerate(pages_to_scrape, 1):
                    print(f"\n📄 Scraping page {page_num}/{len(pages_to_scrape)}: {url}")
                    
                    try:
                        products = self._scrape_page(url)
                        all_products.extend(products)
                        print(f"   ✓ Found {len(products)} products")
                    except Exception as e:
                        error_msg = f"Error scraping page {page_num}: {str(e)}"
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
        
        self._print_summary(result)
        
        return result
    
    def _scrape_page(self, url: str) -> List[Product]:
        """
        Scrape products from a single page.
        
        Args:
            url: Page URL to scrape
            
        Returns:
            List of Product objects
        """
        # Fetch page
        response = self.http_client.get(url)
        
        if response.status_code != 200:
            raise ConnectionError(f"Failed to fetch page: {response.status_code}")
        
        # Parse HTML
        soup = BeautifulSoup(response.text, 'html.parser')
        
        # Extract products
        products = self._extract_products(soup)
        
        return products
    
    def _extract_products(self, soup: BeautifulSoup) -> List[Product]:
        """
        Extract products from page HTML.
        
        Args:
            soup: BeautifulSoup object of the page
            
        Returns:
            List of Product objects
        """
        products = []
        
        # Try multiple selectors to find product containers
        product_selectors = [
            '.product-tile',
            '.product-card',
            '.product',
            '[data-testid*="product"]',
            '.item'
        ]
        
        product_elements = []
        for selector in product_selectors:
            product_elements = soup.select(selector)
            if product_elements:
                print(f"   Found {len(product_elements)} product elements with selector: {selector}")
                break
        
        if not product_elements:
            print("   ⚠️  No product elements found")
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
            
            # Clean product name: remove size/price info that was extracted
            product_name = self._clean_product_name(product_name, size, unit, price)
            
            # Extract product URL and fetch category from detail page
            category = self._extract_category_from_detail_page(element)
            
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
            'a'
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
        """Remove duplicate patterns like '8 oz8 oz' or '14 fl oz14 oz' -> '8 oz' or '14 fl oz'."""
        # Pattern 1: number + unit immediately repeated (no space): "8 oz8 oz"
        text = re.sub(r'(\d+\.?\d*\s*(?:oz|lb|lbs|ml|l|g|kg|ct|count|pack))\1', r'\1', text, flags=re.IGNORECASE)
        
        # Pattern 2: number + fl + unit repeated: "14 fl oz14 oz" or "14 fl oz14 fl oz"
        text = re.sub(r'(\d+\.?\d*\s+fl\s+oz)\d+\.?\d*(?:\s+fl)?\s+oz', r'\1', text, flags=re.IGNORECASE)
        
        # Pattern 3: spaced repetition: "16 oz 16 oz"
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
        
        # Remove price patterns like "$2.15" or "$12.99"
        cleaned = re.sub(r'\$\d+\.?\d*', '', cleaned)
        
        # Remove size patterns like "8 oz", "14 fl oz", "12 count", "6 pack", etc.
        # This is more aggressive to catch various formats
        cleaned = re.sub(r',?\s*\d+\.?\d*\s*(oz|fl oz|lb|lbs|ml|l|g|kg|ct|count|pack|can|box|bottle|jar|bag|gallon|quart|pint|cup|fluid ounce|ounce|pound|gram|kilogram|liter|milliliter|feet|ft|inch|in)\b', '', cleaned, flags=re.IGNORECASE)
        
        # Remove "x count" patterns like "6 count20 oz" -> after first removal becomes "6 count"
        cleaned = re.sub(r'\d+\s*(count|ct|pack)\d*', '', cleaned, flags=re.IGNORECASE)
        
        # Remove standalone numbers that might be left over
        cleaned = re.sub(r'\s+\d+\.?\d*\s*$', '', cleaned)
        
        # Clean up extra spaces and commas
        cleaned = re.sub(r'\s*,\s*,\s*', ', ', cleaned)  # Multiple commas
        cleaned = re.sub(r',\s*$', '', cleaned)  # Trailing comma
        cleaned = re.sub(r'^\s*,\s*', '', cleaned)  # Leading comma
        cleaned = re.sub(r'\s+', ' ', cleaned)  # Multiple spaces
        
        return cleaned.strip()
    
    def _extract_price(self, element) -> Optional[str]:
        """Extract price from element."""
        price_selectors = [
            '.price', '.cost', '[class*="price"]',
            '[data-testid*="price"]', '.amount'
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
        size_selectors = ['.size', '.weight', '.quantity', '[class*="size"]']
        
        for selector in size_selectors:
            elem = element.select_one(selector)
            if elem:
                text = elem.get_text()
                quantity, unit = parse_size(text)
                if quantity and unit:
                    return (str(quantity), unit)
        
        # Try parsing from name
        quantity, unit = parse_size(name)
        if quantity and unit:
            return (str(quantity), unit)
        
        return ('', '')
    
    def _extract_category_from_detail_page(self, element) -> str:
        """
        Extract category by following product link and parsing breadcrumb.
        
        Breadcrumb format: Home > Snacks > Chips, Crackers & Popcorn
        Returns the last breadcrumb item (e.g., "Chips, Crackers & Popcorn")
        """
        try:
            # Find product link
            link = element.find('a', href=True)
            if not link:
                return 'Grocery'
            
            product_url = link['href']
            
            # Make sure it's a full URL
            if not product_url.startswith('http'):
                product_url = self.base_url + product_url
            
            # Fetch the product detail page
            response = self.http_client.get(product_url)
            if response.status_code != 200:
                return 'Grocery'
            
            # Parse the detail page
            soup = BeautifulSoup(response.text, 'html.parser')
            
            # Look for breadcrumb navigation
            breadcrumb_selectors = [
                '.breadcrumb',
                '[class*="breadcrumb"]',
                'nav[aria-label*="breadcrumb" i]',
                'nav[class*="breadcrumb"]',
                '.breadcrumbs',
                '[data-testid*="breadcrumb"]'
            ]
            
            for selector in breadcrumb_selectors:
                breadcrumb = soup.select_one(selector)
                if breadcrumb:
                    # Get all breadcrumb items
                    items = breadcrumb.find_all(['a', 'li', 'span'])
                    
                    # Filter out "Home" and get the last meaningful category
                    categories = []
                    for item in items:
                        text = clean_text(item.get_text())
                        if text and text.lower() not in ['home', '']:
                            categories.append(text)
                    
                    # Return the last (most specific) category
                    if categories:
                        return categories[-1]
            
            # If no breadcrumb found, try looking for category in meta tags or schema
            category_meta = soup.find('meta', {'property': 'product:category'})
            if category_meta and category_meta.get('content'):
                return clean_text(category_meta['content'])
            
            return 'Grocery'
            
        except Exception as e:
            # If anything fails, return default category
            return 'Grocery'
    
    def _print_summary(self, result: ScraperResult) -> None:
        """Print scraping summary."""
        print(f"\n{'='*60}")
        print(f"Scraping Complete")
        print(f"{'='*60}")
        print(f"Store: {result.store}")
        print(f"Products scraped: {len(result.products)}")
        print(f"Errors: {len(result.errors)}")
        print(f"Duration: {result.duration_seconds}s")
        print(f"Success: {'✓' if result.success else '✗'}")
        
        if result.errors:
            print(f"\nErrors encountered:")
            for error in result.errors[:5]:  # Show first 5 errors
                print(f"  • {error}")
        
        # Show sample products
        if result.products:
            print(f"\nSample products:")
            for product in result.products[:3]:
                print(f"  • {product.brand} - {product.name} (${product.price})")
        
        print(f"{'='*60}\n")


def main():
    """Main function to run the Aldi scraper."""
    scraper = AldiScraper(requests_per_second=2.0)
    
    # Scrape products
    result = scraper.scrape(max_pages=60)
    
    # Save results
    if result.products:
        output_path = 'scrapers/output/raw/aldi_scraped_products.json'
        
        save_scraper_result(result, output_path)
        print(f"💾 Saved results to {output_path}")
    else:
        print("⚠️  No products scraped, skipping save")


if __name__ == "__main__":
    main()
