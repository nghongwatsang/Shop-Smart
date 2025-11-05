#!/usr/bin/env python3

from typing import Optional, Dict, Type
import sys
import os

# Add the current directory to the Python path
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from base import BaseWebScraper
from stores.aldi_scraper import AldiScraper


class ScraperFactory:
    """
    Factory class to create static HTTP-based scrapers.
    Note: Selenium-based scrapers like Hannaford are standalone due to different lifecycle requirements.
    """
    
    _scrapers: Dict[str, Type[BaseWebScraper]] = {
        'aldi': AldiScraper,
        # Add more static HTTP scrapers here
    }
    
    @classmethod
    def create_scraper(cls, store_name: str, **kwargs) -> Optional[BaseWebScraper]:
        """
        Create a static HTTP scraper for the specified store
        
        Args:
            store_name: Name of the store (e.g., 'aldi')
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
        Get list of available static HTTP store scrapers
        
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
    """Demonstrate the scraper factory for static HTTP scrapers"""
    print("🛒 Shop-Smart Static HTTP Scraper Factory")
    print("=" * 45)
    
    # Show available stores
    available_stores = ScraperFactory.get_available_stores()
    print(f"Available static HTTP stores: {', '.join(available_stores)}")
    print("Note: Selenium scrapers (Hannaford) are standalone")
    
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
                print(f"  📦 {product.brand} {product.name}")
                print(f"  💰 {product.price}")
                print(f"  🏷️  {product.category}")
        else:
            print("Failed to connect to Aldi")
    else:
        print("Failed to create Aldi scraper")
    
    print("\n✅ Static HTTP scraper factory demonstration complete!")
    print("\n📝 For Selenium scrapers:")
    print("   - Import HannafordSeleniumScraper directly")
    print("   - Use: scraper = HannafordSeleniumScraper()")
    print("   - Remember: scraper.cleanup() when done")


if __name__ == "__main__":
    main()