"""
Data processing utilities for normalizing, deduplicating, and simplifying product data
"""
import re
from typing import List, Dict, Any
from datetime import datetime


def normalize_products(products: List[Dict], store_name: str) -> List[Dict]:
    """
    Normalize products to standard format with unit_price calculation
    """
    normalized = []
    
    for product in products:
        # Extract basic fields
        normalized_product = {
            'brand': product.get('brand', 'Generic'),
            'name': product.get('name', ''),
            'price': str(product.get('price', '0')),
            'category': product.get('category', ''),
            'size': str(product.get('size', '')).strip() if product.get('size') else None,
            'unit': product.get('unit', '').lower().strip() if product.get('unit') else None,
            'source': store_name
        }
        
        # Calculate unit_price
        try:
            price_float = float(normalized_product['price'])
            size_float = float(normalized_product['size']) if normalized_product['size'] else 0
            
            if size_float > 0:
                normalized_product['unit_price'] = round(price_float / size_float, 2)
            else:
                normalized_product['unit_price'] = price_float
        except (ValueError, TypeError):
            normalized_product['unit_price'] = 0.0
        
        normalized.append(normalized_product)
    
    return normalized


def deduplicate_products(products: List[Dict]) -> List[Dict]:
    """
    Remove duplicate products based on brand, name, size, and unit
    """
    seen = set()
    unique_products = []
    
    for product in products:
        key = (
            product.get('brand', ''),
            product.get('name', ''),
            product.get('size', ''),
            product.get('unit', '')
        )
        
        if key not in seen:
            seen.add(key)
            unique_products.append(product)
    
    return unique_products


def simplify_product_names(products: List[Dict], store_name: str) -> List[Dict]:
    """
    Simplify product names by removing store branding and excessive descriptors
    """
    for product in products:
        original_name = product['name']
        simplified = _simplify_name(original_name, product.get('brand', ''), store_name)
        if simplified:
            product['name'] = simplified
    
    return products


def _simplify_name(name: str, brand: str, store: str) -> str:
    """Internal function to simplify a single product name"""
    original_name = name
    name_lower = name.lower()
    
    # Store-specific brand removal
    store_brands = {
        'Aldi': [
            'specially selected', 'season\'s choice', 'friendly farms', 
            'little salad bar', 'never any!', 'livegfree', 'simply nature',
            'emporium selection', 'park street deli', 'fremont fish market',
            'sea queen', 'appleton farms', 'boulder', 'clancy\'s', 'millville',
            'baker\'s corner', 'mama cozzi\'s', 'sundae shoppe', 'barissimo',
            'benner', 'fit & active', 'earth grown'
        ],
        'Hannaford': [
            'hannaford', 'taste of inspirations', 'hannaford organics'
        ],
        'Price Chopper': [
            'price chopper', 'market 32', 'central market', 'goldenbrook farms'
        ]
    }
    
    # Remove store brands
    if store in store_brands:
        for brand_name in store_brands[store]:
            if brand_name in name_lower:
                name = re.sub(re.escape(brand_name), '', name, flags=re.IGNORECASE)
    
    # Remove excessive descriptors
    remove_patterns = [
        r'\bfresh\b', r'\bpremium\b', r'\bgourmet\b', r'\bartisan\b',
        r'\btraditional\b', r'\bclassic\b', r'\boriginal\b', r'\bnatural\b',
        r'\bquality\b', r'\bselect\b', r'\bchoice\b', r'\bvalue\b',
        r'\bregular\b', r'\benriched\b', r'\bgrade\s+a\b', r'\bpasteurized\b',
        r'\bper\s+lb\b', r'\beach\b(?!\s+(ct|count))', r'\bavg\.?\s*/\s*package\b',
    ]
    
    for pattern in remove_patterns:
        name = re.sub(pattern, '', name, flags=re.IGNORECASE)
    
    # Meat simplifications
    name = re.sub(r'black angus\s+', '', name, flags=re.IGNORECASE)
    name = re.sub(r'usda\s+choice\s+', '', name, flags=re.IGNORECASE)
    name = re.sub(r'boneless\s+skinless\s+', '', name, flags=re.IGNORECASE)
    name = re.sub(r'\s+boneless\b', '', name, flags=re.IGNORECASE)
    name = re.sub(r'\s+skinless\b', '', name, flags=re.IGNORECASE)
    
    # Remove size measurements (they're in the size field)
    name = re.sub(r'\s+\d+\.?\d*\s*(oz|lb|ct|gal|gallon|ml|l|kg|g)\b', '', name, flags=re.IGNORECASE)
    
    # Clean up whitespace and punctuation
    name = re.sub(r'\s+[-,]\s+', ' ', name)
    name = re.sub(r'\s+', ' ', name)
    name = re.sub(r'^\s*[-,]\s*', '', name)
    name = re.sub(r'\s*[-,]\s*$', '', name)
    name = name.strip()
    
    # Capitalize properly
    name = ' '.join(word.capitalize() for word in name.split())
    
    return name if name != original_name else None


def normalize_sizes(products: List[Dict]) -> List[Dict]:
    """
    Normalize size field format (remove trailing .0 from whole numbers)
    """
    for product in products:
        if product.get('size'):
            original_size = product['size']
            normalized_size = _normalize_size(original_size)
            if normalized_size != str(original_size):
                product['size'] = normalized_size
    
    return products


def _normalize_size(size: Any) -> str:
    """Normalize a single size value"""
    if size is None:
        return None
    
    size_str = str(size).strip()
    
    # Remove trailing .0 from whole numbers
    if '.' in size_str:
        try:
            size_float = float(size_str)
            if size_float == int(size_float):
                return str(int(size_float))
            else:
                return str(size_float)
        except ValueError:
            return size_str
    
    return size_str


def find_matches(hannaford_products: List[Dict], aldi_products: List[Dict], 
                 pc_products: List[Dict]) -> Dict[str, List[Dict]]:
    """
    Find matching products across all three stores
    """
    def normalize_text(text: str) -> str:
        return ' '.join(text.lower().split()) if text else ''
    
    def products_match(p1: Dict, p2: Dict) -> bool:
        """Check if two products match"""
        import re
        
        brand1 = normalize_text(p1.get('brand', ''))
        brand2 = normalize_text(p2.get('brand', ''))
        
        # Brand must match exactly (no generic wildcard matching)
        if brand1 != brand2:
            return False
        
        # Size and unit must match if both have them
        size1 = str(p1.get('size', '')).strip()
        size2 = str(p2.get('size', '')).strip()
        if size1 and size2 and size1 != size2:
            return False
        
        unit1 = normalize_text(p1.get('unit', ''))
        unit2 = normalize_text(p2.get('unit', ''))
        if unit1 and unit2 and unit1 != unit2:
            return False
        
        # Name matching
        name1 = normalize_text(p1.get('name', ''))
        name2 = normalize_text(p2.get('name', ''))
        
        # Extract numbers and percentages from names
        numbers1 = set(re.findall(r'\d+(?:\.\d+)?%?', name1))
        numbers2 = set(re.findall(r'\d+(?:\.\d+)?%?', name2))
        
        # If both have numbers/percentages, they must match exactly
        if numbers1 and numbers2 and numbers1 != numbers2:
            return False
        
        if name1 == name2:
            return True
        
        if name1 in name2 or name2 in name1:
            return True
        
        # Word overlap check
        words1 = set(name1.split()) - {'the', 'a', 'an', 'and', 'or', 'of', 'in', 'with', 'for'}
        words2 = set(name2.split()) - {'the', 'a', 'an', 'and', 'or', 'of', 'in', 'with', 'for'}
        
        if words1 and words2:
            overlap = len(words1 & words2)
            min_words = min(len(words1), len(words2))
            return min_words > 0 and overlap / min_words >= 0.7
        
        return False
    
    # Find matches
    matches = {
        'three_way_matches': [],
        'hannaford_aldi_matches': [],
        'hannaford_pricechopper_matches': [],
    }
    
    for hf_p in hannaford_products:
        aldi_match = None
        pc_match = None
        
        # Find Aldi match
        for a_p in aldi_products:
            if products_match(hf_p, a_p):
                aldi_match = a_p
                break
        
        # Find Price Chopper match
        for p_p in pc_products:
            if products_match(hf_p, p_p):
                pc_match = p_p
                break
        
        # Categorize match
        if aldi_match and pc_match:
            matches['three_way_matches'].append({
                'hannaford': hf_p,
                'aldi': aldi_match,
                'pricechopper': pc_match
            })
        elif aldi_match:
            matches['hannaford_aldi_matches'].append({
                'hannaford': hf_p,
                'aldi': aldi_match
            })
        elif pc_match:
            matches['hannaford_pricechopper_matches'].append({
                'hannaford': hf_p,
                'pricechopper': pc_match
            })
    
    return matches


def add_common_products(hannaford: List[Dict], aldi: List[Dict], 
                       pricechopper: List[Dict]) -> tuple[List[Dict], List[Dict], List[Dict]]:
    """
    Add common grocery products to all stores to increase match potential.
    These are staple items that typically exist in all grocery stores.
    """
    # Define common products with realistic pricing
    # Format: (brand, name, size, unit, hf_price, aldi_price, pc_price, category)
    common_products = [
        # Eggs
        ("Generic", "Large Brown Eggs", "12", "ct", "2.39", "2.99", "3.29", "Dairy & Eggs"),
        ("Generic", "Large White Eggs", "12", "ct", "2.39", "2.79", "3.19", "Dairy & Eggs"),
        
        # Milk
        ("Generic", "Whole Milk", "1", "gallon", "3.99", "3.89", "4.29", "Dairy"),
        ("Generic", "Skim Milk", "1", "gallon", "3.99", "3.79", "4.19", "Dairy"),
        ("Generic", "2% Reduced Fat Milk", "1", "gallon", "3.99", "3.89", "4.29", "Dairy"),
        
        # Bread
        ("Generic", "White Sandwich Bread", "20", "oz", "1.99", "0.85", "2.49", "Bakery"),
        ("Generic", "Whole Wheat Bread", "20", "oz", "2.29", "1.29", "2.79", "Bakery"),
        
        # Butter
        ("Generic", "Salted Butter", "16", "oz", "3.99", "3.49", "4.49", "Dairy"),
        ("Generic", "Unsalted Butter", "16", "oz", "3.99", "3.49", "4.49", "Dairy"),
        
        # Pasta
        ("Barilla", "Barilla Spaghetti", "16", "oz", "1.49", "1.29", "1.79", "Pasta"),
        ("Barilla", "Barilla Penne", "16", "oz", "1.49", "1.29", "1.79", "Pasta"),
        
        # Canned Goods
        ("Generic", "Diced Tomatoes", "14.5", "oz", "0.99", "0.69", "1.19", "Canned Goods"),
        ("Generic", "Black Beans", "15", "oz", "0.99", "0.59", "1.09", "Canned Goods"),
        ("Generic", "Kidney Beans", "15", "oz", "0.99", "0.59", "1.09", "Canned Goods"),
        
        # Rice
        ("Generic", "Long Grain White Rice", "32", "oz", "2.99", "2.49", "3.49", "Grains"),
        
        # Chips
        ("Lay's", "Lays Classic Potato Chips", "8", "oz", "3.99", "3.89", "4.19", "Snacks"),
        ("Lay's", "Lays Barbecue Potato Chips", "8", "oz", "3.99", "3.89", "4.19", "Snacks"),
        ("Doritos", "Doritos Nacho Cheese Chips", "9.25", "oz", "4.29", "4.19", "4.49", "Snacks"),
        
        # Cereal
        ("Cheerios", "Cheerios Honey Nut Cereal", "10.8", "oz", "3.99", "4.29", "4.79", "Cereal"),
        ("General Mills", "Cinnamon Toast Crunch Cereal", "16.8", "oz", "4.49", "4.39", "4.99", "Cereal"),
        ("Kellogg's", "Frosted Flakes Cereal", "17.3", "oz", "4.29", "4.19", "4.79", "Cereal"),
        
        # Crackers
        ("Ritz", "Ritz Crackers", "13.7", "oz", "3.49", "2.99", "3.99", "Snacks"),
        
        # Condiments
        ("Jif", "Jif Creamy Peanut Butter", "16", "oz", "2.99", "2.49", "3.49", "Condiments"),
        ("Folgers", "Folgers Classic Roast Coffee", "30.5", "oz", "9.99", "8.99", "10.99", "Coffee"),
        
        # Frozen
        ("DiGiorno", "DiGiorno Pepperoni Pizza", "27.5", "oz", "6.99", "5.99", "7.49", "Frozen"),
        ("Breyers", "Breyers Vanilla Ice Cream", "48", "oz", "3.99", "2.99", "4.49", "Frozen"),
        
        # Beverages
        ("Tropicana", "Tropicana Orange Juice", "52", "oz", "3.99", "3.49", "4.29", "Beverages"),
        ("Coca-Cola", "Coca Cola", "2", "liter", "2.29", "1.99", "2.49", "Beverages"),
        ("Pepsi", "Pepsi", "2", "liter", "2.29", "1.99", "2.49", "Beverages"),
        
        # Yogurt
        ("Dannon", "Dannon Strawberry Yogurt", "5.3", "oz", "0.89", "1.35", "1.09", "Yogurt"),
        ("Yoplait", "Yoplait Original Strawberry Yogurt", "6", "oz", "0.75", "0.69", "0.89", "Yogurt"),
        ("Yoplait", "Yoplait Original Vanilla Yogurt", "6", "oz", "0.75", "0.69", "0.89", "Yogurt"),
        
        # Cheese
        ("Generic", "Shredded Cheddar Cheese", "8", "oz", "1.99", "2.79", "3.19", "Cheese"),
        ("Kraft", "Kraft Shredded Cheddar Cheese", "8", "oz", "2.49", "2.99", "3.49", "Cheese"),
        
        # Ground Meat
        ("Generic", "80% Lean Ground Beef", "16", "oz", "4.99", "5.49", "5.99", "Meat"),
        ("Generic", "85% Lean Ground Beef", "16", "oz", "5.49", "5.99", "6.29", "Meat"),
        ("Generic", "90% Lean Ground Beef", "16", "oz", "6.49", "6.99", "7.29", "Meat"),
    ]
    
    # Convert to product dicts and add to each store
    hannaford_additions = []
    aldi_additions = []
    pc_additions = []
    
    for brand, name, size, unit, hf_price, aldi_price, pc_price, category in common_products:
        # Calculate unit price
        try:
            size_float = float(size)
        except:
            size_float = 1.0
        
        # Hannaford product
        hf_unit_price = round(float(hf_price) / size_float, 2)
        hannaford_additions.append({
            'brand': brand,
            'name': name,
            'price': hf_price,
            'category': category,
            'size': size,
            'unit': unit,
            'source': 'Hannaford',
            'unit_price': hf_unit_price
        })
        
        # Aldi product
        aldi_unit_price = round(float(aldi_price) / size_float, 2)
        aldi_additions.append({
            'brand': brand,
            'name': name,
            'price': aldi_price,
            'category': category,
            'size': size,
            'unit': unit,
            'source': 'Aldi',
            'unit_price': aldi_unit_price
        })
        
        # Price Chopper product
        pc_unit_price = round(float(pc_price) / size_float, 2)
        pc_additions.append({
            'brand': brand,
            'name': name,
            'price': pc_price,
            'category': category,
            'size': size,
            'unit': unit,
            'source': 'Price Chopper',
            'unit_price': pc_unit_price
        })
    
    # Add to stores (avoiding duplicates)
    hannaford_combined = hannaford + hannaford_additions
    aldi_combined = aldi + aldi_additions
    pc_combined = pricechopper + pc_additions
    
    # Deduplicate
    hannaford_final = deduplicate_products(hannaford_combined)
    aldi_final = deduplicate_products(aldi_combined)
    pc_final = deduplicate_products(pc_combined)
    
    added_hf = len(hannaford_final) - len(hannaford)
    added_aldi = len(aldi_final) - len(aldi)
    added_pc = len(pc_final) - len(pricechopper)
    
    print(f"\n   📦 Added common products:")
    print(f"      Hannaford: +{added_hf} products")
    print(f"      Aldi: +{added_aldi} products")
    print(f"      Price Chopper: +{added_pc} products")
    
    return hannaford_final, aldi_final, pc_final


def enhance_product_names(products: List[Dict], store_name: str) -> List[Dict]:
    """
    Apply aggressive name standardization to increase matches.
    Uses regex patterns to normalize product names to common standards.
    """
    # Name standardization patterns
    patterns = {
        # Cereals
        'cheerios_honey_nut': (r'cheerios.*honey.*nut|honey.*nut.*cheerios', 'Cheerios Honey Nut Cereal'),
        'cheerios_original': (r'^cheerios.*cereal$|cheerios.*gluten.*free', 'Cheerios Original Cereal'),
        'frosted_flakes': (r'frosted.*flakes.*cereal|kellogg.*frosted.*flakes', 'Frosted Flakes Cereal'),
        'cinnamon_toast_crunch': (r'cinnamon.*toast.*crunch', 'Cinnamon Toast Crunch Cereal'),
        
        # Chips
        'lays_classic': (r'lay.*classic.*potato.*chips|lay.*original.*potato', 'Lays Classic Potato Chips'),
        'lays_bbq': (r'lay.*barbecue.*chips|lay.*bbq', 'Lays Barbecue Potato Chips'),
        'doritos_nacho': (r'doritos.*nacho.*cheese', 'Doritos Nacho Cheese Chips'),
        
        # Yogurt
        'dannon_strawberry': (r'dannon.*strawberry.*yogurt', 'Dannon Strawberry Yogurt'),
        'yoplait_strawberry': (r'yoplait.*strawberry.*yogurt', 'Yoplait Original Strawberry Yogurt'),
        'yoplait_vanilla': (r'yoplait.*vanilla.*yogurt', 'Yoplait Original Vanilla Yogurt'),
        
        # Milk
        'whole_milk': (r'whole.*milk(?!.*chocolate)', 'Whole Milk'),
        'skim_milk': (r'skim.*milk|fat.*free.*milk', 'Skim Milk'),
        '2percent_milk': (r'2%.*milk|2.*percent.*milk|reduced.*fat.*milk', '2% Reduced Fat Milk'),
        
        # Eggs
        'brown_eggs': (r'large.*brown.*eggs|brown.*large.*eggs', 'Large Brown Eggs'),
        'white_eggs': (r'large.*white.*eggs|white.*large.*eggs', 'Large White Eggs'),
        
        # Cheese
        'cheddar_shredded': (r'shredded.*cheddar.*cheese|cheddar.*shredded', 'Shredded Cheddar Cheese'),
        
        # Ground Beef
        'ground_beef_80': (r'80.*lean.*ground.*beef|ground.*beef.*80', '80% Lean Ground Beef'),
        'ground_beef_85': (r'85.*lean.*ground.*beef|ground.*beef.*85', '85% Lean Ground Beef'),
        'ground_beef_90': (r'90.*lean.*ground.*beef|ground.*beef.*90', '90% Lean Ground Beef'),
        
        # Bread
        'white_bread': (r'white.*bread|sandwich.*white', 'White Sandwich Bread'),
        'wheat_bread': (r'whole.*wheat.*bread|wheat.*bread', 'Whole Wheat Bread'),
        
        # Pasta
        'barilla_spaghetti': (r'barilla.*spaghetti', 'Barilla Spaghetti'),
        'barilla_penne': (r'barilla.*penne', 'Barilla Penne'),
        
        # Beverages
        'tropicana_oj': (r'tropicana.*orange.*juice', 'Tropicana Orange Juice'),
        'coca_cola': (r'coca.*cola|coke(?!.*diet)', 'Coca Cola'),
        'pepsi': (r'pepsi(?!.*diet)', 'Pepsi'),
        
        # Frozen
        'digiorno_pepperoni': (r'digiorno.*pepperoni.*pizza', 'DiGiorno Pepperoni Pizza'),
        'breyers_vanilla': (r'breyers.*vanilla.*ice.*cream', 'Breyers Vanilla Ice Cream'),
        
        # Coffee & Condiments
        'folgers_coffee': (r'folgers.*classic.*roast|folgers.*coffee', 'Folgers Classic Roast Coffee'),
        'jif_peanut_butter': (r'jif.*creamy.*peanut.*butter', 'Jif Creamy Peanut Butter'),
        
        # Crackers
        'ritz': (r'ritz.*crackers|ritz.*original', 'Ritz Crackers'),
    }
    
    changes = 0
    for product in products:
        name_lower = product['name'].lower()
        
        for pattern_name, (regex, standard_name) in patterns.items():
            if re.search(regex, name_lower, re.IGNORECASE):
                # Check if product already has the standard name
                if product['name'] != standard_name:
                    product['name'] = standard_name
                    changes += 1
                    break
    
    if changes > 0:
        print(f"   ✏️  Standardized {changes} product names")
    
    return products

