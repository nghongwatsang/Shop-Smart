"""
Export utilities for saving scraped data in various formats.

Functions:
- save_to_json(): Save products to JSON file
- save_to_csv(): Save products to CSV file
"""

import json
import csv
from pathlib import Path
from typing import List, Optional
from datetime import datetime

from scrapers.core import Product, ScraperResult


def save_to_json(
    products: List[Product],
    filepath: str,
    indent: int = 2,
    include_metadata: bool = True
) -> None:
    """
    Save products to JSON file with optional metadata.
    
    Args:
        products: List of Product objects to save
        filepath: Path to output JSON file
        indent: JSON indentation (default: 2)
        include_metadata: Whether to include metadata (timestamp, count)
        
    Raises:
        IOError: If file cannot be written
        
    Examples:
        >>> products = [Product(...), Product(...)]
        >>> save_to_json(products, "output/aldi_products.json")
    """
    # Ensure parent directory exists
    output_path = Path(filepath)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    
    # Convert products to dictionaries
    products_data = [product.to_dict() for product in products]
    
    # Build output structure
    if include_metadata:
        output = {
            "metadata": {
                "timestamp": datetime.now().isoformat(),
                "product_count": len(products),
                "sources": list(set(p.source for p in products))
            },
            "products": products_data
        }
    else:
        output = products_data
    
    # Write to file
    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(output, f, indent=indent, ensure_ascii=False)


def save_scraper_result(result: ScraperResult, filepath: str) -> None:
    """
    Save complete ScraperResult (products + metadata) to JSON.
    
    Args:
        result: ScraperResult object with products and metadata
        filepath: Path to output JSON file
        
    Examples:
        >>> result = ScraperResult(products=[...], source="aldi")
        >>> save_scraper_result(result, "output/raw/aldi_20231115.json")
    """
    output_path = Path(filepath)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    
    data = result.to_dict()
    
    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=2, ensure_ascii=False)


def save_to_csv(
    products: List[Product],
    filepath: str,
    include_header: bool = True
) -> None:
    """
    Save products to CSV file.
    
    CSV columns: brand, name, price, category, size, unit, source
    
    Args:
        products: List of Product objects to save
        filepath: Path to output CSV file
        include_header: Whether to include header row
        
    Raises:
        IOError: If file cannot be written
        
    Examples:
        >>> products = [Product(...), Product(...)]
        >>> save_to_csv(products, "output/aldi_products.csv")
    """
    output_path = Path(filepath)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    
    # Define CSV columns
    fieldnames = ['brand', 'name', 'price', 'category', 'size', 'unit', 'source']
    
    with open(output_path, 'w', newline='', encoding='utf-8') as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        
        if include_header:
            writer.writeheader()
        
        for product in products:
            writer.writerow(product.to_dict())


def append_to_csv(
    products: List[Product],
    filepath: str
) -> None:
    """
    Append products to existing CSV file (without header).
    
    Args:
        products: List of Product objects to append
        filepath: Path to CSV file
        
    Examples:
        >>> new_products = [Product(...)]
        >>> append_to_csv(new_products, "output/all_products.csv")
    """
    output_path = Path(filepath)
    
    # If file doesn't exist, create with header
    if not output_path.exists():
        save_to_csv(products, filepath, include_header=True)
        return
    
    fieldnames = ['brand', 'name', 'price', 'category', 'size', 'unit', 'source']
    
    with open(output_path, 'a', newline='', encoding='utf-8') as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        
        for product in products:
            writer.writerow(product.to_dict())


def load_from_json(filepath: str) -> List[Product]:
    """
    Load products from JSON file.
    
    Handles both formats:
    - Direct list: [{"brand": ..., "name": ...}, ...]
    - With metadata: {"products": [...], "metadata": {...}}
    
    Args:
        filepath: Path to JSON file
        
    Returns:
        List of Product objects
        
    Raises:
        FileNotFoundError: If file doesn't exist
        ValueError: If JSON format is invalid
        
    Examples:
        >>> products = load_from_json("output/aldi_products.json")
        >>> len(products) > 0
        True
    """
    with open(filepath, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    # Handle both formats
    if isinstance(data, dict) and 'products' in data:
        products_data = data['products']
    elif isinstance(data, list):
        products_data = data
    else:
        raise ValueError("Invalid JSON format: expected list or dict with 'products' key")
    
    # Convert to Product objects
    products = []
    for item in products_data:
        product = Product(
            brand=item['brand'],
            name=item['name'],
            price=item['price'],
            category=item['category'],
            size=item.get('size'),
            unit=item.get('unit'),
            source=item['source']
        )
        products.append(product)
    
    return products


def merge_json_files(input_files: List[str], output_file: str) -> None:
    """
    Merge multiple JSON product files into one.
    
    Args:
        input_files: List of JSON file paths to merge
        output_file: Path to output merged JSON file
        
    Examples:
        >>> merge_json_files(
        ...     ["aldi.json", "hannaford.json", "target.json"],
        ...     "all_products.json"
        ... )
    """
    all_products = []
    
    for filepath in input_files:
        try:
            products = load_from_json(filepath)
            all_products.extend(products)
        except FileNotFoundError:
            print(f"Warning: File not found: {filepath}")
            continue
        except Exception as e:
            print(f"Warning: Error loading {filepath}: {e}")
            continue
    
    save_to_json(all_products, output_file, include_metadata=True)


def generate_filename(source: str, extension: str = 'json', include_timestamp: bool = True) -> str:
    """
    Generate standardized filename for scraper output.
    
    Args:
        source: Store name (e.g., 'aldi', 'hannaford')
        extension: File extension without dot (default: 'json')
        include_timestamp: Whether to include timestamp in filename
        
    Returns:
        Filename string
        
    Examples:
        >>> generate_filename('aldi', 'json', True)
        'aldi_20231115_143022.json'
        >>> generate_filename('target', 'csv', False)
        'target.csv'
    """
    if include_timestamp:
        timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
        return f"{source}_{timestamp}.{extension}"
    return f"{source}.{extension}"
# - Return path to saved file


# TODO: Implement save_to_csv(products: list, filepath: Path) -> str
# - Export products to CSV format
# - Include headers
# - Handle special characters


# TODO: Implement create_timestamped_backup(data: dict, store_name: str) -> str
# - Save backup with timestamp in filename
# - Organize in backups directory
