#!/usr/bin/env python3#!/usr/bin/env python3



import jsonimport json

from datetime import datetimefrom datetime import datetime

from typing import List, Dict, Any, Optionalfrom typing import List, Dict, Any, Optional

import sysimport sys

import osimport os



# Add the current directory to the Python path# Add the current directory to the Python path

sys.path.append(os.path.dirname(os.path.abspath(__file__)))sys.path.append(os.path.dirname(os.path.abspath(__file__)))



from scraper_factory import ScraperFactoryfrom scraper_factory import ScraperFactory

from base import Productfrom base import Product





class ScrapingService:class ScrapingService:

    """    """

    Simple service layer for static HTTP scrapers only.    Simple service layer for static HTTP scrapers only.

    For Selenium scrapers, use them directly.    For Selenium scrapers, use them directly.

    """    """

        

    def __init__(self):    def __init__(self):

        """Initialize the scraping service"""        """Initialize the scraping service"""

        self.scraped_data: List[Product] = []        self.scraped_data: List[Product] = []

        self.last_scrape_time: Optional[datetime] = None        self.last_scrape_time: Optional[datetime] = None

        

    def scrape_store(self, store_name: str, limit: Optional[int] = None, **kwargs) -> Dict[str, Any]:    def scrape_store(self, store_name: str, limit: Optional[int] = None, **kwargs) -> Dict[str, Any]:

        """        """

        Scrape products from a static HTTP store        Scrape products from a static HTTP store

                

        Args:        Args:

            store_name: Name of the store to scrape (must be in ScraperFactory)            store_name: Name of the store to scrape (must be in ScraperFactory)

            limit: Maximum number of products to scrape            limit: Maximum number of products to scrape

            **kwargs: Additional arguments for the scraper            **kwargs: Additional arguments for the scraper

                        

        Returns:        Returns:

            Dictionary with scraping results            Dictionary with scraping results

        """        """

        try:        try:

            # Create scraper (only works for static HTTP scrapers)            # Create scraper (only works for static HTTP scrapers)

            scraper = ScraperFactory.create_scraper(store_name, **kwargs)            scraper = ScraperFactory.create_scraper(store_name, **kwargs)

            if not scraper:            if not scraper:

                return {                return {

                    'success': False,                    'success': False,

                    'error': f'Unknown static HTTP store: {store_name}. Use Selenium scrapers directly.',                    'error': f'Unknown static HTTP store: {store_name}. Use Selenium scrapers directly.',

                    'products': [],                    'products': [],

                    'count': 0                    'count': 0

                }                }

                        

            # Test connectivity            # Test connectivity

            if not scraper.test_connectivity():            if not scraper.test_connectivity():

                return {                return {

                    'success': False,                    'success': False,

                    'error': f'Cannot connect to {store_name}',                    'error': f'Cannot connect to {store_name}',

                    'products': [],                    'products': [],

                    'count': 0                    'count': 0

                }                }

                        

            # Scrape products            # Scrape products

            products = scraper.scrape_products(limit=limit)            products = scraper.scrape_products(limit=limit)

                        

            # Store results            # Store results

            self.scraped_data.extend(products)            self.scraped_data.extend(products)

            self.last_scrape_time = datetime.now()            self.last_scrape_time = datetime.now()

                        

            return {            return {

                'success': True,                'success': True,

                'store': scraper.store_name,                'store': scraper.store_name,

                'products': [product.to_dict() for product in products],                'products': [product.to_dict() for product in products],

                'count': len(products),                'count': len(products),

                'scraped_at': self.last_scrape_time.isoformat()                'scraped_at': self.last_scrape_time.isoformat()

            }            }

                        

        except Exception as e:        except Exception as e:

            return {            return {

                'success': False,                'success': False,

                'error': str(e),                'error': str(e),

                'products': [],                'products': [],

                'count': 0                'count': 0

            }            }

        

    def get_available_stores(self) -> List[str]:    def get_available_stores(self) -> List[str]:

        """Get list of stores available through this service (static HTTP only)"""        """Get list of stores available through this service (static HTTP only)"""

        return ScraperFactory.get_available_stores()        return ScraperFactory.get_available_stores()

        

    def save_to_json(self, filename: str) -> None:    def save_to_json(self, filename: str) -> None:

        """Save scraped data to JSON file"""        """Save scraped data to JSON file"""

        if not self.scraped_data:        if not self.scraped_data:

            print("No data to save")            print("No data to save")

            return            return

                        

        data = {        data = {

            'scraped_at': self.last_scrape_time.isoformat() if self.last_scrape_time else None,            'scraped_at': self.last_scrape_time.isoformat() if self.last_scrape_time else None,

            'products': [product.to_dict() for product in self.scraped_data],            'products': [product.to_dict() for product in self.scraped_data],

            'count': len(self.scraped_data)            'count': len(self.scraped_data)

        }        }

                

        with open(filename, 'w', encoding='utf-8') as f:        with open(filename, 'w', encoding='utf-8') as f:

            json.dump(data, f, indent=2, ensure_ascii=False)            json.dump(data, f, indent=2, ensure_ascii=False)

                

        print(f"Saved {len(self.scraped_data)} products to {filename}")        print(f"Saved {len(self.scraped_data)} products to {filename}")





def main():def main():

    """Demonstrate the simplified scraping service"""    """Demonstrate the simplified scraping service"""

    print("🛒 Shop-Smart Simple Scraping Service")    print("🛒 Shop-Smart Simple Scraping Service")

    print("=" * 40)    print("=" * 40)

    print("Note: This service only works with static HTTP scrapers.")    print("Note: This service only works with static HTTP scrapers.")

    print("For Selenium scrapers (Hannaford), import and use directly.\n")    print("For Selenium scrapers (Hannaford), import and use directly.\n")

        

    service = ScrapingService()    service = ScrapingService()

        

    # Show available stores    # Show available stores

    stores = service.get_available_stores()    stores = service.get_available_stores()

    print(f"Available stores: {', '.join(stores)}")    print(f"Available stores: {', '.join(stores)}")

        

    # Test scraping Aldi    # Test scraping Aldi

    if 'aldi' in stores:    if 'aldi' in stores:

        print(f"\n🏪 Testing Aldi scraping...")        print(f"\n🏪 Testing Aldi scraping...")

        result = service.scrape_store('aldi', limit=5)        result = service.scrape_store('aldi', limit=5)

                

        if result['success']:        if result['success']:

            print(f"✅ Successfully scraped {result['count']} products from {result['store']}")            print(f"✅ Successfully scraped {result['count']} products from {result['store']}")

            if result['products']:            if result['products']:

                print("\nSample products:")                print("\nSample products:")

                for i, product in enumerate(result['products'][:3]):                for i, product in enumerate(result['products'][:3]):

                    print(f"  {i+1}. {product['brand']} {product['name']} - {product['price']}")                    print(f"  {i+1}. {product['brand']} {product['name']} - {product['price']}")

        else:        else:

            print(f"❌ Failed: {result['error']}")            print(f"❌ Failed: {result['error']}")

        

    print("\n📝 For Selenium-based stores:")    print("\n📝 For Selenium-based stores:")

    print("   from stores.hannaford_scraper import HannafordSeleniumScraper")    print("   from stores.hannaford_scraper import HannafordSeleniumScraper")

    print("   scraper = HannafordSeleniumScraper()")    print("   scraper = HannafordSeleniumScraper()")

    print("   products = scraper.scrape_category_page(url)")    print("   products = scraper.scrape_category_page(url)")

    print("   scraper.cleanup()  # Important!")    print("   scraper.cleanup()  # Important!")





if __name__ == "__main__":if __name__ == "__main__":

    main()    main()
    
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
        Search products by name or brand
        
        Args:
            query: Search query
            
        Returns:
            List of products matching the query
        """
        query_lower = query.lower()
        return [
            product.to_dict() 
            for product in self.scraped_data 
            if (query_lower in product.name.lower() or 
                query_lower in product.brand.lower())
        ]
    
    def get_products_by_brand(self, brand: str) -> List[Dict[str, Any]]:
        """
        Get products filtered by brand
        
        Args:
            brand: Brand name to filter by
            
        Returns:
            List of products from the specified brand
        """
        return [
            product.to_dict() 
            for product in self.scraped_data 
            if product.brand.lower() == brand.lower()
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
        brands = {}
        price_ranges = []
        
        for product in self.scraped_data:
            # Count by store
            store = product.source
            stores[store] = stores.get(store, 0) + 1
            
            # Count by category
            category = product.category
            categories[category] = categories.get(category, 0) + 1
            
            # Count by brand
            brand = product.brand
            brands[brand] = brands.get(brand, 0) + 1
            
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
            'brands': brands,
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
            
            fieldnames = ['brand', 'name', 'price', 'category', 'size', 'unit', 'source', 'product_url', 'raw_name']
            
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
        print(f"  Brands: {len(stats['brands'])}")
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
        
        # Show brands
        print(f"\n🏭 Available brands:")
        for brand_name in sorted(stats['brands'].keys()):
            count = stats['brands'][brand_name]
            print(f"  • {brand_name}: {count} products")
        
        # Demo brand search
        if stats['brands']:
            first_brand = list(stats['brands'].keys())[0]
            brand_products = service.get_products_by_brand(first_brand)
            print(f"\n🔍 Products from '{first_brand}':")
            for product in brand_products[:2]:  # Show first 2
                print(f"  • {product['name']} - {product['price']}")
        
        # Save data
        print(f"\n💾 Saving data...")
        service.save_to_json('scraped_products.json')
        service.save_to_csv('scraped_products.csv')
        
    else:
        print(f"❌ Failed: {result['error']}")
    
    print("\n✅ Service demonstration complete!")


if __name__ == "__main__":
    main()