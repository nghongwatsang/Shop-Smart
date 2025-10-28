#!/usr/bin/env python3

from typing import Optional, Dict, Type
import sys
import os

# Add the current directory to the Python path
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from base import BaseWebScraper
from stores.aldi_scraper import AldiScraper
from stores.hannaford_scraper import HannafordScraper


class ScraperFactory:
    """
    Factory class to create store-specific scrapers
    """
    
    _scrapers: Dict[str, Type[BaseWebScraper]] = {
        'aldi': AldiScraper,
        'hannaford': HannafordScraper,
        # Add more stores here as they're implemented
    }
    
    @classmethod
    def create_scraper(cls, store_name: str, **kwargs) -> Optional[BaseWebScraper]:
        """
        Create a scraper for the specified store
        
        Args:
            store_name: Name of the store (e.g., 'aldi', 'hannaford')
            **kwargs: Additional arguments to pass to the scraper constructor
            
        Returns:
            Scraper instance or None if store not found
        """
        store_name = store_name.lower()
        
        if store_name in cls._scrapers:
            scraper_class = cls._scrapers[store_name]
            return scraper_class(**kwargs)
        
        return None
    
    @classmethod
    def get_available_stores(cls) -> list:
        """
        Get list of available store scrapers
        
        Returns:
            List of available store names
        """
        return list(cls._scrapers.keys())
    
    @classmethod
    def register_scraper(cls, store_name: str, scraper_class: Type[BaseWebScraper]) -> None:
        """
        Register a new scraper class
        
        Args:
            store_name: Name of the store
            scraper_class: Scraper class that inherits from BaseWebScraper
        """
        cls._scrapers[store_name.lower()] = scraper_class


def main():
    """Demonstrate the scraper factory"""
    print("🛒 Shop-Smart Scraper Factory")
    print("=" * 40)
    
    # Show available stores
    available_stores = ScraperFactory.get_available_stores()
    print(f"Available stores: {', '.join(available_stores)}")
    
    # Test Aldi scraper
    print("\n🏪 Testing Aldi Scraper:")
    print("-" * 25)
    
    aldi_scraper = ScraperFactory.create_scraper('aldi', delay=0.5)
    if aldi_scraper:
        if aldi_scraper.test_connectivity():
            products = aldi_scraper.scrape_products(limit=3)
            print(f"Successfully scraped {len(products)} products from {aldi_scraper.store_name}")
            
            # Show first product as example
            if products:
                product = products[0]
                print(f"\nExample product:")
                print(f"  📦 {product.name}")
                print(f"  💰 {product.price}")
                print(f"  🏷️  {product.category}")
        else:
            print("Failed to connect to Aldi")
    else:
        print("Failed to create Aldi scraper")
    
    # Test Hannaford scraper (will fail connection but shows structure)
    print("\n🏪 Testing Hannaford Scraper (Template):")
    print("-" * 40)
    
    hannaford_scraper = ScraperFactory.create_scraper('hannaford')
    if hannaford_scraper:
        print(f"Created {hannaford_scraper.store_name} scraper successfully")
        print("(This is a template - would need real implementation)")
    
    print("\n✅ Scraper factory demonstration complete!")


if __name__ == "__main__":
    main()