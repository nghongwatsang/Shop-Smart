"""
Utils package initialization.
"""

"""
Utility functions for scrapers.

Parsers: Extract structured data from raw content
Validators: Ensure data quality and consistency
Exporters: Save data in various formats
"""

from .parsers import (
    parse_price,
    parse_size,
    clean_text,
    parse_brand_and_name,
    extract_unit_price
)

from .validators import (
    validate_product,
    clean_product_data,
    is_valid_product_dict,
    deduplicate_products,
    filter_invalid_products
)

from .exporters import (
    save_to_json,
    save_scraper_result,
    save_to_csv,
    append_to_csv,
    load_from_json,
    merge_json_files,
    generate_filename
)

__all__ = [
    # Parsers
    'parse_price',
    'parse_size',
    'clean_text',
    'parse_brand_and_name',
    'extract_unit_price',
    
    # Validators
    'validate_product',
    'clean_product_data',
    'is_valid_product_dict',
    'deduplicate_products',
    'filter_invalid_products',
    
    # Exporters
    'save_to_json',
    'save_scraper_result',
    'save_to_csv',
    'append_to_csv',
    'load_from_json',
    'merge_json_files',
    'generate_filename',
]
# from .parsers import parse_price, parse_size, clean_text
# from .validators import validate_product, clean_product_data
# from .exporters import save_to_json, save_to_csv

__all__ = []
