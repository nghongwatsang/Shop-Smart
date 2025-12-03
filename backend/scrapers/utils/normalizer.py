"""
Product data normalization for cross-store price comparison.

This module standardizes product data from different stores to enable
accurate price comparisons by normalizing categories, units, and sizes.
"""

from typing import Dict, List, Optional, Tuple
import re
from scrapers.core import Product


# ============================================================================
# CATEGORY TAXONOMY - Master list for cross-store comparison
# ============================================================================

CATEGORY_TAXONOMY = {
    # Produce & Fresh
    'Fresh Produce': [
        'produce', 'fresh produce', 'fruits', 'vegetables', 'organic produce',
        'fresh fruits', 'fresh vegetables',
        # Specific produce categories from Price Chopper API
        'strawberries', 'green grapes', 'red grapes', 'black grapes',
        'other avocados', 'florida avocado', 'broccoli crowns', 'green broccoli', 'broccolini',
        'other cucumbers', 'mini cucumbers', 'english cucumbers',
        'green brussels sprouts', 'red bell peppers', 'green bell peppers', 
        'yellow bell peppers', 'orange bell peppers', 'mixed bell peppers',
        'sweet mini bell peppers', 'shisito peppers', 'jalapeno peppers',
        'habanero peppers', 'hungarian peppers', 'friggitello pepper',
        'white garlic', 'minced garlic and pastes', 'ginger paste',
        'green asparagus', 'yellow lemons', 'green limes',
        'tomatoes on the vine', 'grape tomatoes', 'cherry tomatoes',
        'beefsteak tomatoes', 'roma tomatoes', 'campari tomatoes', 'tomatillos',
        'bartlett pears', 'other pears', 'd\'anjou pears', 'bosc pears',
        'red raspberries', 'blueberries', 'blackberries', 'cranberries',
        'vidalia onions', 'red onions', 'white onions', 'yellow onions',
        'sweet onions', 'spanish onions', 'shallots', 'scallions',
        'honeycrisp apples', 'gala apples', 'granny smith apples', 'fuji apples',
        'other apples', 'empire apples', 'mcintosh apples', 'macoun apples',
        'ginger gold apples', 'golden delicious apples', 'cortland apples',
        'cripps pink apples', 'red delicious apples',
        'cauliflower florettes', 'white cauliflower',
        'yellow bananas', 'plantains',
        'mandarines', 'navel oranges', 'clementine oranges',
        'watermelons', 'cantaloupe melons', 'honeydew melons',
        'pineapples', 'maradol papayas',
        'other cherries', 'pomegranates',
        'haden mangos', 'other mangos',
        'green kiwis', 'starfruit', 'red dragonfruit', 'other persimmons',
        'green okra', 'green beans', 'french green beans',
        'yellow corn', 'sweet corn',
        'green cabbage', 'purple cabbage', 'napa cabbage',
        'red beets', 'parsnips', 'turnips', 'rutabaga',
        'butternut squash', 'acorn squash', 'spaghetti squash', 'yellow squash',
        'green zucchini', 'other eggplant',
        'gold and yellow potatoes', 'red potatoes', 'russet potatoes',
        'medley potatoes', 'white potatoes', 'purple potatoes',
        'sweet potatoes', 'yams', 'yucca', 'taro', 'malanga root',
        'baby carrots', 'orange carrots',
        'mixed vegetables', 'prepared vegetables', 'mixed fruits',
        'fruit snack cups',
        'ruby red grapefruit', 'other grapefruits'
    ],
    'Fresh Herbs': [
        'herbs', 'fresh herbs', 'spices & herbs',
        'cilantro', 'dill', 'curly parsley', 'flat leaf parsley', 'parsley',
        'common thyme', 'sage', 'marjoram', 'tarragon', 'oregano',
        'rosemary', 'bay leaves', 'peppermint', 'other fresh herbs'
    ],
    
    # Meat & Seafood
    'Fresh Meat': ['meat', 'fresh meat', 'beef', 'pork', 'lamb'],
    'Fresh Poultry': ['poultry', 'chicken', 'turkey'],
    'Fresh Seafood': ['seafood', 'fish', 'fresh seafood', 'fresh fish'],
    'Frozen Meat & Seafood': [
        'frozen meat, poultry & seafood', 'frozen meat', 'frozen seafood',
        'frozen fish', 'frozen chicken'
    ],
    
    # Tofu & Plant-Based
    'Tofu & Plant-Based': [
        'tofu', 'tofu and bean curd', 'tempeh', 'plant-based protein'
    ],
    
    # Dairy & Refrigerated
    'Milk & Cream': ['milk', 'cream', 'half & half', 'milk & cream'],
    'Cheese': ['cheese', 'shredded cheese', 'sliced cheese', 'cream cheese'],
    'Yogurt': ['yogurt', 'yogurt & sour cream', 'greek yogurt'],
    'Eggs': ['eggs', 'egg products'],
    'Butter & Margarine': ['butter', 'margarine', 'butter & margarine'],
    'Dips & Spreads': [
        'dips', 'spreads', 'guacamole', 'hummus', 'salsa',
        'other dips and spreads', 'cheese dips and spreads',
        'fresh spinach artichoke dip', 'fresh dessert dip'
    ],
    
    # Salads & Leafy Greens
    'Salads & Greens': [
        'salads', 'lettuce', 'greens',
        'prepared green salad kits', 'mixed greens', 'spinach',
        'romaine lettuce', 'iceberg lettuce', 'leaf lettuce',
        'butter lettuce', 'little gem lettuce', 'arugula',
        'collards', 'curly kale', 'green chard', 'escarole',
        'bok choy', 'rapini', 'coleslaw mix'
    ],
    
    # Mushrooms
    'Mushrooms': [
        'mushrooms', 'baby bella mushrooms', 'white button mushrooms',
        'shiitake mushrooms', 'mixed mushrooms'
    ],
    
    # Bakery
    'Bread': ['bread', 'bread & bakery', 'sandwich bread'],
    'Bakery & Desserts': ['bakery', 'cakes', 'pastries', 'cookies & sweets'],
    
    # Pantry Staples
    'Pasta': ['pasta', 'pasta, rice & grains', 'noodles'],
    'Rice & Grains': ['rice', 'grains', 'quinoa', 'couscous'],
    'Canned Goods': [
        'canned foods', 'canned vegetables', 'canned fruit',
        'other canned vegetables', 'canned onion'
    ],
    'Condiments': ['condiments', 'condiments & dressings', 'ketchup', 'mustard'],
    'Sauces': ['sauces', 'sauces & salsa', 'pasta sauce', 'salsa', 'other pastes'],
    'Oils & Vinegars': ['oils', 'vinegars', 'oils & vinegars', 'cooking oil'],
    'Baking': [
        'baking', 'baking supplies & ingredients', 'flour', 'sugar',
        'pizza crust mixes'
    ],
    'Spices & Seasonings': [
        'spices', 'seasonings', 'herbs & spices',
        'dried parsley', 'dried dill', 'dried basil', 'dried garlic',
        'dried ginger', 'ginger', 'fennel bulb', 'leeks', 'artichokes'
    ],
    
    # Dried Fruits & Nuts
    'Nuts & Dried Fruit': [
        'nuts', 'dried fruit', 'nuts & dried fruit', 'trail mix',
        'dried dates', 'dried apricots'
    ],
    
    # Snacks & Sweets
    'Chips & Crackers': [
        'chips', 'crackers', 'chips, crackers & popcorn', 'popcorn',
        'tortilla chips', 'potato chips'
    ],
    'Cookies & Candy': [
        'cookies', 'candy', 'cookies & sweets', 'chocolate',
        'gummy fruit snacks'
    ],
    'Fruit Snacks': [
        'fruit snacks', 'squeeze snack pouches'
    ],
    
    # Breakfast
    'Cereal': ['cereal', 'cereal & oatmeal', 'breakfast cereal'],
    'Oatmeal': ['oatmeal', 'hot cereal'],
    'Breakfast Foods': [
        'breakfast', 'pancake mix', 'syrup', 'breakfast foods'
    ],
    
    # Beverages
    'Juice': [
        'juice', 'juice & cider', 'fruit juice', 'vegetable juice',
        'apple juice and cider'
    ],
    'Coffee & Tea': ['coffee', 'tea', 'coffee & tea', 'black tea'],
    'Soft Drinks': ['soda', 'soft drinks', 'carbonated beverages'],
    'Water': ['water', 'bottled water', 'sparkling water'],
    'Sports Drinks': ['sports drinks', 'energy drinks'],
    
    # Frozen Foods
    'Frozen Vegetables': ['frozen vegetables', 'frozen veggies', 'frozen spinach'],
    'Frozen Meals': ['frozen meals', 'frozen meals & sides', 'frozen dinners'],
    'Ice Cream': ['ice cream', 'frozen ice cream & desserts', 'frozen desserts'],
    
    # Household
    'Paper Products': [
        'paper products', 'paper & plastic products', 'paper towels',
        'toilet paper', 'napkins'
    ],
    'Cleaning Supplies': ['cleaning', 'cleaning supplies', 'household cleaners'],
    
    # Other
    'Prepared Foods': [
        'deli', 'prepared meals', 'ready to eat', 'meal kits',
        'dorm room meals & snacks',
        'fresh fruit and vegetable party trays',
        'other deli meals and sides'
    ],
    'Specialty Foods': [
        'organic', 'gluten-free', 'vegan', 'healthy food & snacks',
        'international foods'
    ],
}


# ============================================================================
# UNIT STANDARDIZATION - Convert all units to consistent format
# ============================================================================

UNIT_MAPPINGS = {
    # Weight - standardize to oz and lb
    'oz': 'oz',
    'ounce': 'oz',
    'ounces': 'oz',
    'lb': 'lb',
    'lbs': 'lb',
    'pound': 'lb',
    'pounds': 'lb',
    'g': 'g',
    'gram': 'g',
    'grams': 'g',
    'kg': 'kg',
    'kilogram': 'kg',
    'kilograms': 'kg',
    
    # Volume - standardize to fl oz and gal
    'fl': 'fl oz',
    'fl oz': 'fl oz',
    'floz': 'fl oz',
    'fluid ounce': 'fl oz',
    'fluid ounces': 'fl oz',
    'ml': 'ml',
    'milliliter': 'ml',
    'milliliters': 'ml',
    'l': 'l',
    'liter': 'l',
    'liters': 'l',
    'gal': 'gal',
    'gallon': 'gal',
    'gallons': 'gal',
    'qt': 'qt',
    'quart': 'qt',
    'quarts': 'qt',
    'pt': 'pt',
    'pint': 'pt',
    'pints': 'pt',
    'cup': 'cup',
    'cups': 'cup',
    'tbsp': 'tbsp',
    'tablespoon': 'tbsp',
    'tablespoons': 'tbsp',
    'tsp': 'tsp',
    'teaspoon': 'tsp',
    'teaspoons': 'tsp',
    
    # Count
    'ct': 'ct',
    'count': 'ct',
    'each': 'each',
    'ea': 'each',
    'pack': 'pack',
    'pk': 'pack',
    'package': 'pack',
    'box': 'box',
    'bag': 'bag',
    'can': 'can',
    'jar': 'jar',
    'bottle': 'bottle',
}


# Unit conversion factors (to ounces for weight, fl oz for volume)
UNIT_CONVERSIONS = {
    # Weight to oz
    'lb': 16.0,
    'g': 0.035274,
    'kg': 35.274,
    
    # Volume to fl oz
    'pt': 16.0,
    'qt': 32.0,
    'gal': 128.0,
    'l': 33.814,
    'ml': 0.033814,
    'cup': 8.0,
    'tbsp': 0.5,
    'tsp': 0.166667,
}


# ============================================================================
# NORMALIZATION FUNCTIONS
# ============================================================================

def normalize_category(raw_category: str) -> str:
    """
    Normalize a raw category string to a standardized taxonomy category.
    
    Args:
        raw_category: Raw category from scraper (e.g., "produce", "Chips, Crackers & Popcorn")
        
    Returns:
        Normalized category from CATEGORY_TAXONOMY
        
    Examples:
        >>> normalize_category("produce")
        'Fresh Produce'
        >>> normalize_category("Chips, Crackers & Popcorn")
        'Chips & Crackers'
        >>> normalize_category("yogurt & sour cream")
        'Yogurt'
    """
    if not raw_category:
        return 'Other'
    
    # Clean and lowercase for matching
    clean_cat = raw_category.strip().lower()
    
    # Try exact match first
    for standard_cat, variations in CATEGORY_TAXONOMY.items():
        if clean_cat in [v.lower() for v in variations]:
            return standard_cat
    
    # Try partial match (for complex categories like "Mother's Day Meal Ideas")
    for standard_cat, variations in CATEGORY_TAXONOMY.items():
        for variation in variations:
            if variation.lower() in clean_cat or clean_cat in variation.lower():
                return standard_cat
    
    # If no match, return original but title-cased
    return raw_category.title()


def normalize_unit(raw_unit: str) -> str:
    """
    Normalize a unit string to standard format.
    
    Args:
        raw_unit: Raw unit from scraper (e.g., "fl", "ounce", "lbs")
        
    Returns:
        Standardized unit (e.g., "fl oz", "oz", "lb")
        
    Examples:
        >>> normalize_unit("fl")
        'fl oz'
        >>> normalize_unit("ounces")
        'oz'
        >>> normalize_unit("lbs")
        'lb'
    """
    if not raw_unit:
        return ''
    
    clean_unit = raw_unit.strip().lower()
    return UNIT_MAPPINGS.get(clean_unit, raw_unit)


def parse_size_and_unit(size_str: str, unit_str: str) -> Tuple[str, str]:
    """
    Parse and normalize size and unit values.
    
    Handles cases where:
    - Unit is embedded in size (e.g., "12 oz" in size field)
    - Size has multiple values (e.g., "2 x 16 oz")
    - Unit needs standardization
    
    Args:
        size_str: Size value (may include unit)
        unit_str: Unit value (may be incomplete)
        
    Returns:
        Tuple of (normalized_size, normalized_unit)
        
    Examples:
        >>> parse_size_and_unit("12", "fl")
        ('12', 'fl oz')
        >>> parse_size_and_unit("2 x 16 oz", "")
        ('32', 'oz')
        >>> parse_size_and_unit("1.5 lbs", "")
        ('1.5', 'lb')
    """
    size = str(size_str).strip()
    unit = str(unit_str).strip()
    
    # Check if unit is embedded in size
    unit_pattern = r'(\d+\.?\d*)\s*([a-zA-Z]+)'
    match = re.search(unit_pattern, size)
    
    if match:
        size = match.group(1)
        embedded_unit = match.group(2)
        if not unit or unit == 'each':
            unit = embedded_unit
    
    # Handle multiplied quantities (e.g., "2 x 16 oz")
    multi_pattern = r'(\d+)\s*x\s*(\d+\.?\d*)\s*([a-zA-Z]*)'
    multi_match = re.search(multi_pattern, size_str)
    if multi_match:
        count = float(multi_match.group(1))
        size_val = float(multi_match.group(2))
        size = str(count * size_val)
        if multi_match.group(3):
            unit = multi_match.group(3)
    
    # Normalize the unit
    normalized_unit = normalize_unit(unit)
    
    return size, normalized_unit


def calculate_unit_price(price: str, size: str, unit: str) -> Optional[float]:
    """
    Calculate price per standard unit for comparison.
    
    Args:
        price: Product price as string
        size: Product size as string
        unit: Product unit (normalized)
        
    Returns:
        Price per standard unit (oz for weight, fl oz for volume) or None if can't calculate
        
    Examples:
        >>> calculate_unit_price("2.99", "16", "oz")
        0.186875
        >>> calculate_unit_price("4.99", "1", "lb")
        0.311875
    """
    try:
        price_val = float(price.replace('$', '').strip())
        size_val = float(size)
        
        if size_val <= 0:
            return None
        
        # Convert to standard unit if possible
        conversion_factor = UNIT_CONVERSIONS.get(unit, 1.0)
        standard_size = size_val * conversion_factor
        
        return price_val / standard_size
        
    except (ValueError, ZeroDivisionError):
        return None


def normalize_product(product: Product) -> Product:
    """
    Normalize a product's data for cross-store comparison.
    
    Args:
        product: Product object from scraper
        
    Returns:
        New Product object with normalized data
        
    Example:
        >>> prod = Product(brand="Generic", name="Milk", price="3.99", 
        ...                category="produce", size="1", unit="gal", source="pricechopper")
        >>> normalized = normalize_product(prod)
        >>> normalized.category
        'Fresh Produce'
        >>> normalized.unit
        'gal'
    """
    # Normalize category
    normalized_category = normalize_category(product.category)
    
    # Normalize size and unit
    normalized_size, normalized_unit = parse_size_and_unit(product.size, product.unit)
    
    # Create normalized product
    return Product(
        brand=product.brand,
        name=product.name,
        price=product.price,
        category=normalized_category,
        size=normalized_size,
        unit=normalized_unit,
        source=product.source
    )


def normalize_products(products: List[Product]) -> List[Product]:
    """
    Normalize a list of products.
    
    Args:
        products: List of Product objects
        
    Returns:
        List of normalized Product objects
    """
    return [normalize_product(p) for p in products]


# ============================================================================
# COMPARISON UTILITIES
# ============================================================================

def products_match(prod1: Product, prod2: Product, 
                   name_threshold: float = 0.3) -> bool:
    """
    Determine if two products from different stores are the same item.
    
    Uses fuzzy matching on name, exact matching on category, and similar size/unit.
    Improved to be more lenient with brand names and product variations.
    
    Args:
        prod1: First product
        prod2: Second product
        name_threshold: Similarity threshold for name matching (0-1, default 0.3)
        
    Returns:
        True if products likely represent the same item
    """
    # Must be different stores
    if prod1.source == prod2.source:
        return False
    
    # Category must match
    if normalize_category(prod1.category) != normalize_category(prod2.category):
        return False
    
    # Unit should be compatible (allow different but convertible units)
    unit1 = normalize_unit(prod1.unit).lower()
    unit2 = normalize_unit(prod2.unit).lower()
    
    # Group compatible units
    weight_units = {'oz', 'lb', 'g', 'kg'}
    volume_units = {'fl oz', 'ml', 'l', 'gal', 'qt', 'pt', 'cup'}
    count_units = {'ct', 'count', 'each', 'pack', 'bag', 'box', 'can', 'jar', 'bottle'}
    
    # Units must be in same group
    units_compatible = False
    if unit1 in weight_units and unit2 in weight_units:
        units_compatible = True
    elif unit1 in volume_units and unit2 in volume_units:
        units_compatible = True
    elif unit1 in count_units and unit2 in count_units:
        units_compatible = True
    elif unit1 == unit2:
        units_compatible = True
    
    if not units_compatible:
        return False
    
    # Clean and tokenize names - remove common filler words
    stop_words = {
        'fresh', 'organic', 'natural', 'premium', 'select', 'quality',
        'pack', 'bag', 'box', 'frozen', 'all', 'new', 'great', 'value',
        'store', 'brand', 'family', 'size', 'large', 'small', 'medium',
        'lb', 'oz', 'ct', 'count', 'each'
    }
    
    def clean_name(name):
        """Remove brand names, stop words, and common modifiers."""
        words = name.lower().split()
        # Remove stop words and very short words
        meaningful_words = [w for w in words if w not in stop_words and len(w) > 2]
        return set(meaningful_words)
    
    words1 = clean_name(prod1.name)
    words2 = clean_name(prod2.name)
    
    if not words1 or not words2:
        return False
    
    # Calculate similarity using Jaccard index
    overlap = len(words1 & words2)
    union = len(words1 | words2)
    
    if union == 0:
        return False
    
    similarity = overlap / union
    
    # Also check if key product words match (like "potato", "apple", etc.)
    # Extract likely product type (usually the main noun)
    def get_product_type(words):
        """Get the most likely product type from words."""
        # Common produce/food types (usually appear in both names)
        food_words = {
            'potato', 'potatoes', 'apple', 'apples', 'banana', 'bananas',
            'tomato', 'tomatoes', 'onion', 'onions', 'pepper', 'peppers',
            'carrot', 'carrots', 'lettuce', 'spinach', 'broccoli', 'cucumber',
            'strawberry', 'strawberries', 'grape', 'grapes', 'orange', 'oranges',
            'milk', 'cheese', 'yogurt', 'butter', 'eggs', 'bread',
            'chicken', 'beef', 'pork', 'fish', 'salmon', 'shrimp'
        }
        return words & food_words
    
    type1 = get_product_type(words1)
    type2 = get_product_type(words2)
    
    # If both have product type words and they match, boost similarity
    if type1 and type2 and type1 & type2:
        similarity += 0.2  # Boost for matching product type
    
    return similarity >= name_threshold


def find_matching_products(product: Product, 
                          other_products: List[Product]) -> List[Product]:
    """
    Find all products from other stores that match the given product.
    
    Args:
        product: Product to find matches for
        other_products: List of products from other stores
        
    Returns:
        List of matching products
    """
    return [p for p in other_products if products_match(product, p)]
