import json
import uuid
from typing import List, Dict, Any, Tuple

# Input files
import os

# Get the directory where this script is located
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
# Go up two levels to get to the project root
PROJECT_ROOT = os.path.dirname(os.path.dirname(SCRIPT_DIR))

SCRAPED_PRODUCTS_FILE = os.path.join(PROJECT_ROOT, 'scraped_products.json')
HANNAFORD_PRODUCTS_FILE = os.path.join(PROJECT_ROOT, 'hannaford_produce_results.json')
STORE_INFO = [
    {
        'name': 'Aldi',
        'street': '662 Hoosick Rd',
        'city': 'Troy',
        'state': 'NY',
        'postal_code': '12180',
        'latitude': 42.7415351,
        'longitude': -73.6495478
    },
    {
        'name': 'Hannafords',
        'street': '9 Lord Ave',
        'city': 'Troy',
        'state': 'NY',
        'postal_code': '12180',
        'latitude': 42.7438908,
        'longitude': -73.6519795
    },
    {
        'name': 'Target',
        'street': '675 Troy-Schenectady Rd',
        'city': 'Latham',
        'state': 'NY',
        'postal_code': '12110',
        'latitude': 42.74909,
        'longitude': -73.770139
    }
]

def load_json_file(file_path: str) -> List[Dict[str, Any]]:
    """Load and parse a JSON file."""
    with open(file_path, 'r') as f:
        return json.load(f)

def generate_uuid() -> str:
    """Generate a UUID for database records."""
    return str(uuid.uuid4())

def process_products(products: List[Dict[str, Any]], store_id: str) -> Tuple[List[Dict], List[Dict]]:
    """Process product data into Item and ItemPrice records."""
    items = []
    item_prices = []
    
    for product in products:
        item_id = generate_uuid()
        price_id = generate_uuid()
        
        # Clean price string (remove $ and convert to float)
        price_str = product['price'].replace('$', '')
        price = float(price_str) if price_str.replace('.', '', 1).isdigit() else 0.0
        
        # Handle size conversion - set to None if not a valid number
        size_value = None
        if product.get('size') and isinstance(product['size'], str) and product['size'].lower() != 'not specified':
            try:
                size_value = float(product['size'])
            except (ValueError, TypeError):
                size_value = None
        
        # Create item record
        item = {
            'id': item_id,
            'name': product['name'],
            'brand': product['brand'],
            'category': product['category'],
            'product_url': product.get('product_url', ''),
            'size': size_value,
            'unit': product.get('unit', '')
        }
        
        # Create item price record
        item_price = {
            'id': price_id,
            'itemId': item_id,
            'storeId': store_id,
            'price': price
        }
        
        items.append(item)
        item_prices.append(item_price)
    
    return items, item_prices

def generate_sql_inserts() -> str:
    """Generate SQL INSERT statements for all data."""
    # Load product data
    aldi_products = load_json_file(SCRAPED_PRODUCTS_FILE)
    hannaford_products = load_json_file(HANNAFORD_PRODUCTS_FILE)
    
    all_items = []
    all_item_prices = []
    stores = []
    addresses = []
    
    # Process stores and addresses
    store_mapping = {}  # Store name to ID mapping
    
    for store_info in STORE_INFO:
        address_id = generate_uuid()
        store_id = generate_uuid()
        
        # Create address record
        address = {
            'id': address_id,
            'street': store_info['street'],
            'city': store_info['city'],
            'state': store_info['state'],
            'postal_code': store_info['postal_code'],
            'country': 'USA',
            'latitude': store_info['latitude'],
            'longitude': store_info['longitude']
        }
        
        # Create store record
        store = {
            'id': store_id,
            'name': store_info['name'],
            'addressId': address_id
        }
        
        addresses.append(address)
        stores.append(store)
        store_mapping[store_info['name'].lower()] = store_id
    
    # Process Aldi products
    aldi_store_id = store_mapping.get('aldi')
    if aldi_store_id and aldi_products:
        items, item_prices = process_products(aldi_products, aldi_store_id)
        all_items.extend(items)
        all_item_prices.extend(item_prices)
    
    # Process Hannaford products
    hannaford_store_id = store_mapping.get('hannafords')
    if hannaford_store_id and hannaford_products:
        items, item_prices = process_products(hannaford_products, hannaford_store_id)
        all_items.extend(items)
        all_item_prices.extend(item_prices)
    
    # Generate SQL statements
    sql_statements = []
    
    # Insert addresses
    sql_statements.append('-- Addresses')
    for addr in addresses:
        sql = f"""INSERT INTO Address (id, street, city, state, postal_code, country, latitude, longitude)
VALUES ('{addr['id']}', '{addr['street'].replace("'", "''")}', '{addr['city']}', '{addr['state']}', 
        '{addr['postal_code']}', '{addr['country']}', {addr['latitude']}, {addr['longitude']});"""
        sql_statements.append(sql)
    
    # Insert stores
    sql_statements.append('\n-- Stores')
    for store in stores:
        sql = f"""INSERT INTO Store (id, name, "addressId")
VALUES ('{store['id']}', '{store['name']}', '{store['addressId']}');"""
        sql_statements.append(sql)
    
    # Insert items
    sql_statements.append('\n-- Items')
    for item in all_items:
        size = 'NULL' if item['size'] is None else str(item['size'])
        sql = f"""INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('{item['id']}', '{item['name'].replace("'", "''")}', '{item['brand'].replace("'", "''")}', 
        '{item['category'].replace("'", "''")}', '{item['product_url']}', {size}, '{item['unit']}');"""
        sql_statements.append(sql)
    
    # Insert item prices
    sql_statements.append('\n-- Item Prices')
    for price in all_item_prices:
        sql = f"""INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('{price['id']}', '{price['itemId']}', '{price['storeId']}', {price['price']});"""
        sql_statements.append(sql)
    
    return '\n'.join(sql_statements)

if __name__ == '__main__':
    sql = generate_sql_inserts()
    output_file = os.path.join(PROJECT_ROOT, 'database_inserts.sql')
    with open(output_file, 'w') as f:
        f.write(sql)
    print(f"SQL statements have been generated and saved to '{output_file}'")
    print("You can now import this file into your PostgreSQL database using psql or another PostgreSQL client.")
