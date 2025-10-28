#!/usr/bin/env python3

import json
import csv
from datetime import datetime
from typing import List, Dict, Any, Optional
from dataclasses import asdict
import sys
import os

# Add the current directory to the Python path
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from scraper_factory import ScraperFactory
from base import Product


class ScrapingService:
    """
    Service layer for managing product scraping operations
    """
    
    def __init__(self):
        """Initialize the scraping service"""
        self.scraped_data: List[Product] = []
        self.last_scrape_time: Optional[datetime] = None
    
    def scrape_store(self, store_name: str, limit: Optional[int] = None, **kwargs) -> Dict[str, Any]:
        """
        Scrape products from a specific store
        
        Args:
            store_name: Name of the store to scrape
            limit: Maximum number of products to scrape
            **kwargs: Additional arguments for the scraper
            
        Returns:
            Dictionary with scraping results
        """
        try:
            # Create scraper
            scraper = ScraperFactory.create_scraper(store_name, **kwargs)
            if not scraper:
                return {
                    'success': False,
                    'error': f'Unknown store: {store_name}',
                    'products': [],
                    'count': 0
                }
            
            # Test connectivity
            if not scraper.test_connectivity():
                return {
                    'success': False,
                    'error': f'Cannot connect to {store_name}',
                    'products': [],
                    'count': 0
                }
            
            # Scrape products
            products = scraper.scrape_products(limit=limit)
            
            # Store results
            self.scraped_data.extend(products)
            self.last_scrape_time = datetime.now()
            
            return {
                'success': True,
                'store': scraper.store_name,
                'products': [product.to_dict() for product in products],
                'count': len(products),
                'scraped_at': self.last_scrape_time.isoformat()
            }
            
        except Exception as e:
            return {
                'success': False,
                'error': str(e),
                'products': [],
                'count': 0
            }
    
    def scrape_all_stores(self, limit: Optional[int] = None, **kwargs) -> Dict[str, Any]:
        """
        Scrape products from all available stores
        
        Args:
            limit: Maximum number of products per store
            **kwargs: Additional arguments for scrapers
            
        Returns:
            Dictionary with results from all stores
        """
        available_stores = ScraperFactory.get_available_stores()
        results = {}
        total_products = 0
        
        for store in available_stores:
            print(f"\n🏪 Scraping {store.upper()}...")
            result = self.scrape_store(store, limit=limit, **kwargs)
            results[store] = result
            
            if result['success']:
                total_products += result['count']
                print(f"✅ {store}: {result['count']} products")
            else:
                print(f"❌ {store}: {result['error']}")
        
        return {
            'success': True,
            'stores': results,
            'total_products': total_products,
            'scraped_at': datetime.now().isoformat()
        }
    
    def get_products_by_category(self, category: str) -> List[Dict[str, Any]]:
        """
        Get products filtered by category
        
        Args:
            category: Category name to filter by
            
        Returns:
            List of products in the specified category
        """
        return [
            product.to_dict() 
            for product in self.scraped_data 
            if product.category.lower() == category.lower()
        ]
    
    def get_products_by_store(self, store_name: str) -> List[Dict[str, Any]]:
        """
        Get products filtered by store
        
        Args:
            store_name: Store name to filter by
            
        Returns:
            List of products from the specified store
        """
        return [
            product.to_dict() 
            for product in self.scraped_data 
            if product.source.lower() == store_name.lower()
        ]
    
    def search_products(self, query: str) -> List[Dict[str, Any]]:
        """
        Search products by name
        
        Args:
            query: Search query
            
        Returns:
            List of products matching the query
        """
        query_lower = query.lower()
        return [
            product.to_dict() 
            for product in self.scraped_data 
            if query_lower in product.name.lower()
        ]
    
    def get_categories(self) -> List[str]:
        """
        Get all unique categories from scraped products
        
        Returns:
            List of unique category names
        """
        categories = set(product.category for product in self.scraped_data)
        return sorted(list(categories))
    
    def get_statistics(self) -> Dict[str, Any]:
        """
        Get statistics about scraped data
        
        Returns:
            Dictionary with various statistics
        """
        if not self.scraped_data:
            return {'total_products': 0, 'stores': [], 'categories': []}
        
        stores = {}
        categories = {}
        price_ranges = []
        
        for product in self.scraped_data:
            # Count by store
            store = product.source
            stores[store] = stores.get(store, 0) + 1
            
            # Count by category
            category = product.category
            categories[category] = categories.get(category, 0) + 1
            
            # Collect prices for analysis
            if product.price.startswith('$'):
                try:
                    price = float(product.price[1:])
                    price_ranges.append(price)
                except ValueError:
                    pass
        
        stats = {
            'total_products': len(self.scraped_data),
            'stores': stores,
            'categories': categories,
            'last_scrape': self.last_scrape_time.isoformat() if self.last_scrape_time else None
        }
        
        if price_ranges:
            stats['price_stats'] = {
                'min': min(price_ranges),
                'max': max(price_ranges),
                'avg': sum(price_ranges) / len(price_ranges)
            }
        
        return stats
    
    def save_to_json(self, filename: str) -> bool:
        """
        Save scraped products to JSON file
        
        Args:
            filename: Output filename
            
        Returns:
            True if successful, False otherwise
        """
        try:
            data = {
                'scraped_at': self.last_scrape_time.isoformat() if self.last_scrape_time else None,
                'total_products': len(self.scraped_data),
                'products': [product.to_dict() for product in self.scraped_data]
            }
            
            with open(filename, 'w', encoding='utf-8') as f:
                json.dump(data, f, indent=2, ensure_ascii=False)
            
            print(f"✅ Saved {len(self.scraped_data)} products to {filename}")
            return True
            
        except Exception as e:
            print(f"❌ Error saving to JSON: {e}")
            return False
    
    def save_to_csv(self, filename: str) -> bool:
        """
        Save scraped products to CSV file
        
        Args:
            filename: Output filename
            
        Returns:
            True if successful, False otherwise
        """
        try:
            if not self.scraped_data:
                print("No data to save")
                return False
            
            fieldnames = ['name', 'price', 'category', 'size', 'unit', 'source', 'product_url']
            
            with open(filename, 'w', newline='', encoding='utf-8') as f:
                writer = csv.DictWriter(f, fieldnames=fieldnames)
                writer.writeheader()
                
                for product in self.scraped_data:
                    writer.writerow(product.to_dict())
            
            print(f"✅ Saved {len(self.scraped_data)} products to {filename}")
            return True
            
        except Exception as e:
            print(f"❌ Error saving to CSV: {e}")
            return False


def main():
    """Demonstrate the scraping service"""
    print("🛒 Shop-Smart Scraping Service Demo")
    print("=" * 50)
    
    service = ScrapingService()
    
    # Scrape from Aldi
    print("\n📦 Scraping products from Aldi...")
    result = service.scrape_store('aldi', limit=5, delay=0.3)
    
    if result['success']:
        print(f"✅ Successfully scraped {result['count']} products")
        
        # Show statistics
        print("\n📊 Statistics:")
        stats = service.get_statistics()
        print(f"  Total products: {stats['total_products']}")
        print(f"  Categories: {len(stats['categories'])}")
        print(f"  Stores: {list(stats['stores'].keys())}")
        
        if 'price_stats' in stats:
            price_stats = stats['price_stats']
            print(f"  Price range: ${price_stats['min']:.2f} - ${price_stats['max']:.2f}")
            print(f"  Average price: ${price_stats['avg']:.2f}")
        
        # Show categories
        print(f"\n🏷️  Available categories:")
        for category in service.get_categories():
            count = len(service.get_products_by_category(category))
            print(f"  • {category}: {count} products")
        
        # Save data
        print(f"\n💾 Saving data...")
        service.save_to_json('scraped_products.json')
        service.save_to_csv('scraped_products.csv')
        
    else:
        print(f"❌ Failed: {result['error']}")
    
    print("\n✅ Service demonstration complete!")


if __name__ == "__main__":
    main()