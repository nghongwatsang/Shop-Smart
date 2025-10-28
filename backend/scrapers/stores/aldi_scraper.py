#!/usr/bin/env python3

import re
from typing import List, Optional, Union
from bs4 import BeautifulSoup, Tag
import sys
import os

# Add the parent directory to the Python path to import base
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from base import BaseWebScraper, Product


class AldiScraper(BaseWebScraper):
    """
    Aldi-specific web scraper implementation
    """
    
    def __init__(self, delay: float = 0.5):
        """Initialize Aldi scraper"""
        super().__init__(
            store_name="Aldi",
            base_url="https://www.aldi.us",
            delay=delay
        )
    
    def get_product_pages(self) -> List[str]:
        """
        Get list of Aldi product page URLs to scrape
        
        Returns:
            List of product page URLs
        """
        return [
            "https://www.aldi.us/products",
            "https://www.aldi.us/weekly-specials"
        ]
    
    def extract_products_from_page(self, soup: BeautifulSoup, page_url: str) -> List[Product]:
        """
        Extract products from an Aldi page
        
        Args:
            soup: BeautifulSoup object of the page
            page_url: URL of the page being scraped
            
        Returns:
            List of Product objects
        """
        products = []
        
        # Common product selectors for Aldi
        product_selectors = [
            '.product-tile', 
            '.product',
            '.product-card',
            '.item',
            '[data-testid*="product"]',
            '.weekly-special',
            '.product-container'
        ]
        
        print("Looking for product containers...")
        
        for selector in product_selectors:
            product_elements = soup.select(selector)
            if product_elements:
                print(f"Found {len(product_elements)} products using selector: {selector}")
                
                # Limit to first 10 products to avoid too many requests
                for i, element in enumerate(product_elements[:10]):
                    print(f"Processing product {i+1}/10...")
                    product_info = self.extract_product_info(element)
                    if product_info:
                        products.append(product_info)
                    
                    # Add delay between requests
                    self.delay_request()
                
                print(f"Successfully extracted {len(products)} products")
                
                if products:  # Only break if we actually got product data
                    break
        
        return products
    
    def extract_product_info(self, element: Union[BeautifulSoup, Tag]) -> Optional[Product]:
        """
        Extract product information from a product element
        
        Args:
            element: BeautifulSoup element containing product data
            
        Returns:
            Product object or None if extraction failed
        """
        try:
            # Extract product name
            name_selectors = [
                'h1', 'h2', 'h3', 'h4', 'h5', 'h6',
                '.name', '.title', '.product-name', '.product-title',
                '[data-testid*="name"]', '[data-testid*="title"]',
                'a', 'span', 'p'
            ]
            
            name = self.find_text_by_selectors(element, name_selectors)
            
            # If no name found, try getting any text from the element
            if not name:
                all_text = element.get_text(strip=True)
                if all_text and len(all_text) < 200:
                    name = all_text.split('\n')[0]
            
            if not name or len(name.strip()) < 2:
                return None
            
            # Extract price
            price_selectors = [
                '.price', '.cost', '.amount',
                '[class*="price"]', '[class*="cost"]',
                '[data-testid*="price"]',
                'span', 'div'
            ]
            
            price_text = self.find_text_by_selectors(element, price_selectors)
            
            # Also look for price in the general text
            if not price_text:
                all_text = element.get_text()
                price_match = re.search(r'\$\d+\.?\d*', all_text)
                if price_match:
                    price_text = price_match.group()
            
            price = self._extract_price_from_text(price_text) if price_text else "Not found"
            
            # Extract size/unit information
            size_info = self._extract_size_info(element, name)
            
            # Extract category by visiting the product detail page
            product_url = self._get_product_url(element)
            category = self._extract_category_from_detail_page(product_url) if product_url else "General"
            
            return Product(
                name=name.strip(),
                price=price,
                category=category,
                size=size_info['size'],
                unit=size_info['unit'],
                source=self.store_name.lower(),
                product_url=product_url
            )
            
        except Exception as e:
            print(f"Error extracting product info: {e}")
            return None
    
    def _get_product_url(self, element: Union[BeautifulSoup, Tag]) -> Optional[str]:
        """
        Extract the product detail page URL from a product element
        
        Args:
            element: BeautifulSoup element containing product data
            
        Returns:
            Product URL or None if not found
        """
        # Look for links in the product element
        link_selectors = ['a', '[href]']
        
        for selector in link_selectors:
            link = element.select_one(selector)
            if link and link.get('href'):
                href = link.get('href')
                # Make sure href is a string and it's a full URL
                if isinstance(href, str):
                    if href.startswith('/'):
                        return f"{self.base_url}{href}"
                    elif href.startswith('http'):
                        return href
        
        return None
    
    def _extract_category_from_detail_page(self, product_url: str) -> str:
        """
        Visit the product detail page and extract category from breadcrumbs
        
        Args:
            product_url: URL of the product detail page
            
        Returns:
            Category name or "General" if not found
        """
        if not product_url:
            return "General"
        
        try:
            response = self.make_request(product_url)
            if not response:
                return "General"
            
            soup = self.parse_html(response.text)
            
            # Look for breadcrumb navigation
            breadcrumb_selectors = [
                '.breadcrumb',
                '.breadcrumbs', 
                '[class*="breadcrumb"]',
                '.navigation',
                '.nav-path',
                'nav ol',
                'nav ul',
                '.category-path'
            ]
            
            for selector in breadcrumb_selectors:
                breadcrumb = soup.select_one(selector)
                if breadcrumb:
                    # Get all breadcrumb items
                    breadcrumb_items = breadcrumb.find_all(['a', 'span', 'li'])
                    
                    # Skip "Home" and get the actual product category
                    categories = []
                    for item in breadcrumb_items:
                        text = item.get_text(strip=True)
                        if text and text.lower() not in ['home', 'products', '>', '']:
                            categories.append(text)
                    
                    if categories:
                        # Return the most specific category (usually the last one before product name)
                        category = categories[-1] if len(categories) > 1 else categories[0]
                        return category
            
            # Fallback: look for category in meta tags or other elements
            meta_category = soup.select_one('meta[name*="category"]')
            if meta_category:
                content = meta_category.get('content')
                if isinstance(content, str):
                    return content
                return 'General'
            
            # Look for category in data attributes
            category_data = soup.select_one('[data-category]')
            if category_data:
                data_category = category_data.get('data-category')
                if isinstance(data_category, str):
                    return data_category
                return 'General'
        
        except Exception as e:
            print(f"Error getting category: {e}")
        
        return "General"
    
    def _extract_price_from_text(self, price_text: str) -> str:
        """
        Extract numeric price from text
        
        Args:
            price_text: Raw price text
            
        Returns:
            Formatted price string
        """
        if not price_text:
            return "Not found"
        
        # Look for price patterns like $1.99, 1.99, $12.50, etc.
        price_pattern = r'\$?(\d+\.?\d*)'
        match = re.search(price_pattern, price_text.replace(',', ''))
        
        if match:
            return f"${match.group(1)}"
        
        return price_text  # Return original if no pattern found
    
    def _extract_size_info(self, element: Union[BeautifulSoup, Tag], product_name: str) -> dict:
        """
        Extract size and unit information
        
        Args:
            element: BeautifulSoup element containing product data
            product_name: Product name text
            
        Returns:
            Dictionary with 'size' and 'unit' keys
        """
        size_info = {'size': 'Not specified', 'unit': 'Not specified'}
        
        # Look for size in the product name first
        size_patterns = [
            r'(\d+\.?\d*)\s*(oz|lb|lbs|pounds|ounces|kg|g|ml|l|liters?)',
            r'(\d+\.?\d*)\s*(ct|count|pack|pcs?|pieces?)',
            r'(\d+\.?\d*)\s*-?\s*(oz|lb|lbs)',
            r'(\d+)\s*(pack|ct)'
        ]
        
        text_to_search = product_name.lower()
        
        # Also look for size in other elements
        size_elements = element.select('.size, .weight, .quantity, [class*="size"], [class*="weight"]')
        for elem in size_elements:
            text_to_search += " " + elem.get_text().lower()
        
        for pattern in size_patterns:
            match = re.search(pattern, text_to_search, re.IGNORECASE)
            if match:
                size_info['size'] = match.group(1)
                size_info['unit'] = match.group(2)
                break
        
        return size_info
    
    def display_products(self, products: List[Product]) -> None:
        """
        Display products in a nice format
        
        Args:
            products: List of Product objects to display
        """
        if not products:
            print("No products found to display")
            return
        
        print(f"\nFound {len(products)} products:")
        print("-" * 60)
        
        for i, product in enumerate(products, 1):
            print(f"\nProduct {i}:")
            print(f"  Name: {product.name}")
            print(f"  Price: {product.price}")
            print(f"  Category: {product.category}")
            print(f"  Size: {product.size} {product.unit}")
            if product.product_url:
                print(f"  URL: {product.product_url}")


def main():
    """Main function to run the Aldi scraper"""
    scraper = AldiScraper(delay=0.5)
    
    # Test connectivity
    if not scraper.test_connectivity():
        return
    
    # Scrape products (limited to 10 for demo)
    products = scraper.scrape_products(limit=10)
    
    # Display results
    scraper.display_products(products)
    
    print(f"\nSummary: Successfully scraped {len(products)} products from {scraper.store_name}")


if __name__ == "__main__":
    main()
