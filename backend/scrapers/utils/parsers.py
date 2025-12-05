"""
Parsing utilities for extracting structured data from raw scraped content.

Functions:
- parse_price(): Extract numeric price from various string formats
- parse_size(): Extract quantity and unit from size strings
- clean_text(): Clean and normalize text content
- parse_brand_and_name(): Split product name into brand and name
"""

import re
from typing import Tuple, Optional
from decimal import Decimal, InvalidOperation


def parse_price(price_str: str) -> Optional[float]:
    """
    Extract numeric price from various string formats.
    
    Handles formats like:
    - "$1.99"
    - "1.99"
    - "$1,234.99"
    - "1.99 ea"
    - "Sale: $1.99"
    
    Args:
        price_str: Raw price string from scraper
        
    Returns:
        Float price or None if parsing fails
        
    Examples:
        >>> parse_price("$1.99")
        1.99
        >>> parse_price("$1,234.99")
        1234.99
        >>> parse_price("Sale: $2.49 ea")
        2.49
    """
    if not price_str:
        return None
    
    # Remove common non-numeric characters
    cleaned = price_str.strip()
    
    # Extract first number-like pattern (handles $, commas, decimals)
    # Updated regex to handle any number of digits
    match = re.search(r'\$?\s*(\d+(?:,\d{3})*(?:\.\d{2})?)', cleaned)
    
    if not match:
        return None
    
    # Remove commas and convert to float
    price_text = match.group(1).replace(',', '')
    
    try:
        price = float(price_text)
        # Sanity check: prices between $0.01 and $99,999.99
        if 0.01 <= price <= 99999.99:
            return round(price, 2)
        return None
    except (ValueError, InvalidOperation):
        return None


def parse_size(size_str: str) -> Tuple[Optional[float], Optional[str]]:
    """
    Extract quantity and unit from size strings.
    
    Handles formats like:
    - "16 oz"
    - "1 lb"
    - "2.5 lbs"
    - "500ml"
    - "12 ct"
    - "1 gallon"
    
    Args:
        size_str: Raw size string from scraper
        
    Returns:
        Tuple of (quantity, unit) or (None, None) if parsing fails
        
    Examples:
        >>> parse_size("16 oz")
        (16.0, 'oz')
        >>> parse_size("2.5 lbs")
        (2.5, 'lb')
        >>> parse_size("500ml")
        (500.0, 'ml')
    """
    if not size_str:
        return (None, None)
    
    cleaned = size_str.strip().lower()
    
    # Common unit variations to normalize
    unit_normalizations = {
        'ounce': 'oz',
        'ounces': 'oz',
        'pound': 'lb',
        'pounds': 'lb',
        'lbs': 'lb',
        'gram': 'g',
        'grams': 'g',
        'kilogram': 'kg',
        'kilograms': 'kg',
        'milliliter': 'ml',
        'milliliters': 'ml',
        'liter': 'l',
        'liters': 'l',
        'count': 'ct',
        'gallon': 'gal',
        'gallons': 'gal',
        'quart': 'qt',
        'quarts': 'qt',
        'pint': 'pt',
        'pints': 'pt',
    }
    
    # Pattern: number (optional decimal) followed by optional space and unit
    pattern = r'(\d+(?:\.\d+)?)\s*([a-z]+)'
    match = re.search(pattern, cleaned)
    
    if not match:
        return (None, None)
    
    try:
        quantity = float(match.group(1))
        unit = match.group(2)
        
        # Normalize unit
        unit = unit_normalizations.get(unit, unit)
        
        return (quantity, unit)
    except (ValueError, AttributeError):
        return (None, None)


def clean_text(text: str) -> str:
    """
    Clean and normalize text content.
    
    - Strips leading/trailing whitespace
    - Removes extra whitespace (multiple spaces/newlines)
    - Removes special characters that cause encoding issues
    - Normalizes quotes and dashes
    
    Args:
        text: Raw text string
        
    Returns:
        Cleaned text string
        
    Examples:
        >>> clean_text("  Hello   World  \\n\\n")
        'Hello World'
        >>> clean_text("Product™ Name®")
        'Product Name'
    """
    if not text:
        return ""
    
    # Strip leading/trailing whitespace
    cleaned = text.strip()
    
    # Replace multiple whitespace with single space
    cleaned = re.sub(r'\s+', ' ', cleaned)
    
    # Remove trademark/registered symbols
    cleaned = cleaned.replace('™', '').replace('®', '').replace('©', '')
    
    # Normalize quotes
    cleaned = cleaned.replace('"', '"').replace('"', '"')
    cleaned = cleaned.replace(''', "'").replace(''', "'")
    
    # Normalize dashes
    cleaned = cleaned.replace('–', '-').replace('—', '-')
    
    # Remove zero-width characters
    cleaned = re.sub(r'[\u200b-\u200f\ufeff]', '', cleaned)
    
    return cleaned.strip()


def parse_brand_and_name(full_name: str, known_brands: Optional[list] = None) -> Tuple[str, str]:
    """
    Split product name into brand and name components.
    
    Attempts to extract brand from the beginning of the product name.
    If brand is not found or no known_brands list provided, returns empty brand.
    
    Args:
        full_name: Full product name string
        known_brands: Optional list of known brand names to look for
        
    Returns:
        Tuple of (brand, name)
        
    Examples:
        >>> parse_brand_and_name("Coca-Cola Classic Soda", ["Coca-Cola", "Pepsi"])
        ('Coca-Cola', 'Classic Soda')
        >>> parse_brand_and_name("Organic Bananas")
        ('', 'Organic Bananas')
    """
    if not full_name:
        return ("", "")
    
    cleaned = clean_text(full_name)
    
    # If no known brands provided, return empty brand
    if not known_brands:
        return ("", cleaned)
    
    # Check if any known brand appears at the start
    cleaned_lower = cleaned.lower()
    
    for brand in known_brands:
        brand_lower = brand.lower()
        if cleaned_lower.startswith(brand_lower):
            # Extract brand and remaining name
            name = cleaned[len(brand):].strip()
            # Remove leading dash or comma if present
            name = re.sub(r'^[-,]\s*', '', name)
            return (brand, name)
    
    # No brand found
    return ("", cleaned)


def extract_unit_price(text: str) -> Optional[float]:
    """
    Extract unit price from text like "$1.99/lb" or "$0.15/oz".
    
    Args:
        text: Text containing unit price
        
    Returns:
        Unit price as float or None
        
    Examples:
        >>> extract_unit_price("$1.99/lb")
        1.99
        >>> extract_unit_price("($0.15/oz)")
        0.15
    """
    if not text:
        return None
    
    # Pattern: price followed by / and unit
    pattern = r'\$?\s*(\d+\.\d{2})\s*/\s*[a-z]+'
    match = re.search(pattern, text.lower())
    
    if match:
        try:
            return float(match.group(1))
        except ValueError:
            return None
    
    return None
