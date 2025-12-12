"""
Validation utilities for ensuring data quality and consistency.

Functions:
- validate_product(): Check if Product object has valid required fields
- clean_product_data(): Clean and normalize product data dict
"""

from typing import Dict, List, Optional, Any
from backend.scrapers.core import Product, ValidationError
from backend.scrapers.utils.parsers import clean_text, parse_price, parse_size


def validate_product(product: Product) -> List[str]:
    """
    Validate a Product object and return list of validation errors.
    
    Checks:
    - All required fields are non-empty
    - Price is positive number
    - Size and unit are valid if present
    - Source is recognized store
    
    Args:
        product: Product object to validate
        
    Returns:
        List of error messages (empty if valid)
        
    Examples:
        >>> product = Product("Nike", "Shoes", 99.99, "Apparel", 1.0, "pair", "aldi")
        >>> validate_product(product)
        []
        >>> bad_product = Product("", "Shoes", -5.0, "Apparel", 1.0, "pair", "aldi")
        >>> validate_product(bad_product)
        ['Brand is empty', 'Price must be positive']
    """
    errors = []
    
    # Check required fields
    if not product.brand or not product.brand.strip():
        errors.append("Brand is empty")
    
    if not product.name or not product.name.strip():
        errors.append("Name is empty")
    
    if not product.category or not product.category.strip():
        errors.append("Category is empty")
    
    if not product.source or not product.source.strip():
        errors.append("Source is empty")
    
    # Validate price
    if not product.price:
        errors.append("Price is missing")
    else:
        # Try to parse price if it's a string
        try:
            price_val = float(product.price) if isinstance(product.price, str) else product.price
            if price_val <= 0:
                errors.append("Price must be positive")
            elif price_val > 10000:
                errors.append("Price seems unreasonably high (>$10,000)")
        except (ValueError, TypeError):
            errors.append("Price must be a valid number")
    
    # Validate size/unit consistency
    if product.size:
        try:
            size_val = float(product.size) if isinstance(product.size, str) else product.size
            if size_val <= 0:
                errors.append("Size must be positive")
        except (ValueError, TypeError):
            errors.append("Size must be a valid number")
        
        if not product.unit:
            errors.append("Unit is required when size is specified")
    
    if product.unit and not product.size:
        errors.append("Size is required when unit is specified")
    
    # Validate source
    valid_sources = ['aldi', 'hannaford', 'target', 'pricechopper']
    if product.source and product.source.lower() not in valid_sources:
        errors.append(f"Source must be one of {valid_sources}")
    
    return errors


def clean_product_data(data: Dict[str, Any]) -> Dict[str, Any]:
    """
    Clean and normalize product data dictionary before creating Product.
    
    - Cleans text fields
    - Normalizes price format
    - Parses size/unit if needed
    - Validates basic structure
    
    Args:
        data: Raw product data dictionary
        
    Returns:
        Cleaned product data dictionary
        
    Raises:
        ValidationError: If required fields are missing
        
    Examples:
        >>> data = {"brand": "  Nike  ", "name": "Shoes", "price": "$99.99", ...}
        >>> clean_product_data(data)
        {"brand": "Nike", "name": "Shoes", "price": 99.99, ...}
    """
    # Check required fields exist
    required = ['brand', 'name', 'price', 'category', 'source']
    missing = [field for field in required if field not in data]
    
    if missing:
        raise ValidationError(f"Missing required fields: {', '.join(missing)}")
    
    cleaned = {}
    
    # Clean text fields
    text_fields = ['brand', 'name', 'category', 'source']
    for field in text_fields:
        value = data.get(field, '')
        cleaned[field] = clean_text(str(value)) if value else ''
    
    # Parse price if it's a string
    price = data.get('price')
    if isinstance(price, str):
        parsed_price = parse_price(price)
        # Keep as string for Product model
        cleaned['price'] = str(parsed_price) if parsed_price else price
    elif isinstance(price, (int, float)):
        cleaned['price'] = str(float(price))
    else:
        cleaned['price'] = str(price) if price else ''
    
    # Handle size/unit
    size_value = data.get('size')
    unit_value = data.get('unit')
    
    # If size is a string like "16 oz", parse it
    if isinstance(size_value, str):
        quantity, unit = parse_size(size_value)
        # Keep as string for Product model
        cleaned['size'] = str(quantity) if quantity else size_value
        cleaned['unit'] = unit if unit else (clean_text(str(unit_value)) if unit_value else '')
    else:
        cleaned['size'] = str(size_value) if size_value else ''
        cleaned['unit'] = clean_text(str(unit_value)) if unit_value else ''
    
    # Normalize source to lowercase
    if cleaned.get('source'):
        cleaned['source'] = cleaned['source'].lower()
    
    return cleaned


def is_valid_product_dict(data: Dict[str, Any]) -> bool:
    """
    Quick check if a dictionary has the minimum required product fields.
    
    Args:
        data: Dictionary to check
        
    Returns:
        True if has required fields, False otherwise
    """
    required = ['brand', 'name', 'price', 'category', 'source']
    return all(field in data and data[field] for field in required)


def deduplicate_products(products: List[Product]) -> List[Product]:
    """
    Remove duplicate products based on brand, name, and source.
    
    Keeps the first occurrence of each unique product.
    
    Args:
        products: List of Product objects
        
    Returns:
        Deduplicated list of products
        
    Examples:
        >>> products = [Product(...), Product(...)]  # Some duplicates
        >>> unique = deduplicate_products(products)
        >>> len(unique) < len(products)
        True
    """
    seen = set()
    unique_products = []
    
    for product in products:
        # Create unique key from brand, name, source
        key = (
            product.brand.lower().strip(),
            product.name.lower().strip(),
            product.source.lower().strip()
        )
        
        if key not in seen:
            seen.add(key)
            unique_products.append(product)
    
    return unique_products


def filter_invalid_products(products: List[Product]) -> tuple[List[Product], List[tuple[Product, List[str]]]]:
    """
    Filter out invalid products and return valid ones plus error details.
    
    Args:
        products: List of Product objects to filter
        
    Returns:
        Tuple of (valid_products, invalid_products_with_errors)
        
    Examples:
        >>> products = [good_product, bad_product, another_good]
        >>> valid, invalid = filter_invalid_products(products)
        >>> len(valid) == 2
        True
        >>> len(invalid) == 1
        True
    """
    valid = []
    invalid = []
    
    for product in products:
        errors = validate_product(product)
        if errors:
            invalid.append((product, errors))
        else:
            valid.append(product)
    
    return valid, invalid

from typing import Dict, Any, List


# TODO: Implement validate_product(product_dict: dict) -> bool
# - Check required fields exist
# - Validate data types
# - Check price is positive
# - Validate category is not empty


# TODO: Implement validate_products_batch(products: list) -> Tuple[list, list]
# - Validate multiple products
# - Return (valid_products, invalid_products)


# TODO: Implement clean_product_data(product: dict) -> dict
# - Strip whitespace from strings
# - Normalize price format
# - Fix common data issues
