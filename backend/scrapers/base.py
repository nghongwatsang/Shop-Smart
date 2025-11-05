#!/usr/bin/env python3

from abc import ABC, abstractmethod
from dataclasses import dataclass
from typing import List, Optional, Dict, Any, Union
import requests
from bs4 import BeautifulSoup, Tag
import time


@dataclass
class Product:
    """Data class representing a product"""
    brand: str
    name: str  # This is now the item name without brand
    price: str
    category: str
    size: str
    unit: str
    source: str
    product_url: Optional[str] = None
    raw_name: Optional[str] = None  # Store the original unparsed name for reference
    
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


class BaseWebScraper(ABC):
    """
    Abstract base class for web scrapers.
    All store-specific scrapers should inherit from this class.
    """
    
    def __init__(self, store_name: str, base_url: str, delay: float = 0.5):
        """
        Initialize the scraper
        
        Args:
            store_name: Name of the store (e.g., "aldi")
            base_url: Base URL of the store website
            delay: Delay between requests in seconds
        """
        self.store_name = store_name
        self.base_url = base_url
        self.delay = delay
        self.session = requests.Session()
        self._setup_session()
    
    def _setup_session(self) -> None:
        """Setup the requests session with appropriate headers"""
        self.session.headers.update({
            "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
            "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
            "Accept-Language": "en-US,en;q=0.5",
            "Accept-Encoding": "gzip, deflate",
            "Connection": "keep-alive",
            "Upgrade-Insecure-Requests": "1"
        })
    
    def make_request(self, url: str, timeout: int = 10) -> Optional[requests.Response]:
        """
        Make a GET request with error handling
        
        Args:
            url: URL to request
            timeout: Request timeout in seconds
            
        Returns:
            Response object or None if failed
        """
        try:
            response = self.session.get(url, timeout=timeout)
            response.raise_for_status()
            return response
        except requests.RequestException as e:
            print(f"Request failed for {url}: {e}")
            return None
    
    def delay_request(self) -> None:
        """Add delay between requests to be respectful to the server"""
        if self.delay > 0:
            time.sleep(self.delay)
    
    def parse_html(self, html_content: str) -> BeautifulSoup:
        """
        Parse HTML content using BeautifulSoup
        
        Args:
            html_content: Raw HTML content
            
        Returns:
            BeautifulSoup object
        """
        return BeautifulSoup(html_content, 'html.parser')
    
    def find_text_by_selectors(self, element: Union[BeautifulSoup, Tag], selectors: List[str]) -> Optional[str]:
        """
        Find text using multiple CSS selectors
        
        Args:
            element: BeautifulSoup element to search in
            selectors: List of CSS selectors to try
            
        Returns:
            First found text or None
        """
        for selector in selectors:
            found = element.select_one(selector)
            if found:
                text = found.get_text(strip=True)
                if text and len(text) > 1:
                    return text
        return None
    
    def parse_brand_and_name(self, raw_name: str) -> Dict[str, str]:
        """
        Parse brand and product name from raw product name
        
        Args:
            raw_name: Raw product name string
            
        Returns:
            Dictionary with 'brand' and 'name' keys
        """
        if not raw_name:
            return {'brand': 'Unknown', 'name': 'Unknown Product'}
        
        # Clean up the raw name first
        cleaned_name = raw_name.strip()
        
        # Common Aldi brand patterns - these are store-specific but can be overridden
        # Ordered by length (longest first) to match multi-word brands before single words
        known_brands = [
            'Fremont Fish Market', 'Park Street Deli', 'Emporium Selection', 
            'Specially Selected', 'Simply Nature', 'Season\'s Choice',
            'Friendly Farms', 'Happy Farms', 'Chef\'s Cupboard', 'Southern Grove',
            'L\'oven Fresh', 'Sundae Shoppe', 'Tuscan Garden', 'Casa Mamita',
            'Bake Shop', 'Never Any!', 'Lunch Mate', 'Lunch Buddies', 
            'Appleton Farms', 'Little Journey', 'Sweet Harvest', 'Pueblo Lindo',
            'Fit & Active', 'Northern Catch', 'Merry Moments', 'Deutsche Küche',
            'Baker\'s Corner', 'ElevationDouble', 'TandilOriginal', 'BoulderGallon',
            'BoulderRegular', 'BoulderTall', 'Earthly Grains', 'ChoceurMilk',
            'Burman\'s', 'Priano', 'Carlini', 'Clancy\'s', 'Benton\'s', 'Stonemill', 
            'Bremer', 'Millville', 'Barissimo', 'Reggano', 'Parkview', 'Kirkwood', 
            'Brookdale', 'Beer'  # Keep single-word brands last
        ]
        
        # Try to find a known brand at the start
        for brand in known_brands:
            if cleaned_name.startswith(brand):
                # Extract the brand and the rest as product name
                remaining_name = cleaned_name[len(brand):].strip()
                
                # Remove any leading punctuation or whitespace
                remaining_name = remaining_name.lstrip('- .,')
                
                # Remove size information (everything from comma onwards)
                if ',' in remaining_name:
                    remaining_name = remaining_name.split(',')[0].strip()
                
                if remaining_name:
                    return {
                        'brand': brand,
                        'name': remaining_name
                    }
        
        # If no known brand found, try to extract first word/phrase as brand
        # Look for patterns like "BrandName Product Description"
        words = cleaned_name.split()
        if len(words) >= 2:
            # Check if first word could be a brand (capitalized, not too long)
            first_word = words[0]
            if (first_word[0].isupper() and 
                len(first_word) >= 2 and 
                len(first_word) <= 15 and
                not any(char in first_word for char in ['$', '(', ')', '%'])):
                
                remaining = ' '.join(words[1:])
                
                # Remove size information (everything from comma onwards)
                if ',' in remaining:
                    remaining = remaining.split(',')[0].strip()
                
                return {
                    'brand': first_word,
                    'name': remaining
                }
        
        # Fallback: if we can't parse it, put everything in name with generic brand
        # Remove size information (everything from comma onwards)
        cleaned_fallback_name = cleaned_name
        if ',' in cleaned_fallback_name:
            cleaned_fallback_name = cleaned_fallback_name.split(',')[0].strip()
            
        return {
            'brand': 'Store Brand',
            'name': cleaned_fallback_name
        }
    
    @abstractmethod
    def get_product_pages(self) -> List[str]:
        """
        Get list of product page URLs to scrape
        
        Returns:
            List of URLs
        """
        pass
    
    @abstractmethod
    def extract_products_from_page(self, soup: BeautifulSoup, page_url: str) -> List[Product]:
        """
        Extract products from a single page
        
        Args:
            soup: BeautifulSoup object of the page
            page_url: URL of the page being scraped
            
        Returns:
            List of Product objects
        """
        pass
    
    @abstractmethod
    def extract_product_info(self, element: Union[BeautifulSoup, Tag]) -> Optional[Product]:
        """
        Extract product information from a product element
        
        Args:
            element: BeautifulSoup element containing product data
            
        Returns:
            Product object or None if extraction failed
        """
        pass
    
    def scrape_products(self, limit: Optional[int] = None) -> List[Product]:
        """
        Main method to scrape products from all product pages
        
        Args:
            limit: Maximum number of products to scrape (None for all)
            
        Returns:
            List of Product objects
        """
        print(f"Starting {self.store_name} product scraping...")
        if limit:
            print(f"Limit set to {limit} products")
        
        all_products = []
        product_pages = self.get_product_pages()
        
        for page_url in product_pages:
            print(f"Scraping page: {page_url}")
            
            response = self.make_request(page_url)
            if not response:
                continue
            
            soup = self.parse_html(response.text)
            products = self.extract_products_from_page(soup, page_url)
            
            if products:
                print(f"Found {len(products)} products on this page")
                all_products.extend(products)
                
                # Check if we've reached the limit
                if limit and len(all_products) >= limit:
                    all_products = all_products[:limit]
                    print(f"Reached limit of {limit} products, stopping...")
                    break
            else:
                print("No products found on this page")
        
        print(f"Total products scraped: {len(all_products)}")
        return all_products
    
    def test_connectivity(self) -> bool:
        """
        Test if the scraper can connect to the website
        
        Returns:
            True if connection successful, False otherwise
        """
        print(f"Testing connectivity to: {self.base_url}")
        response = self.make_request(self.base_url)
        
        if response:
            print(f"✓ Successfully connected to {self.store_name}")
            return True
        else:
            print(f"✗ Failed to connect to {self.store_name}")
            return False