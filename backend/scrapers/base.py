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
    name: str
    price: str
    category: str
    size: str
    unit: str
    source: str
    product_url: Optional[str] = None
    
    def to_dict(self) -> Dict[str, Any]:
        """Convert product to dictionary"""
        return {
            'name': self.name,
            'price': self.price,
            'category': self.category,
            'size': self.size,
            'unit': self.unit,
            'source': self.source,
            'product_url': self.product_url
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