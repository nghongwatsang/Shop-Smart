# Shop-Smart Scrapers

Automated web scraping and data processing pipeline for grocery store price comparison.

## Table of Contents

- [Quick Start](#quick-start)
- [Architecture](#architecture)
- [Pipeline Flow](#pipeline-flow)
- [Core Infrastructure](#core-infrastructure)
- [Utility Modules](#utility-modules)
- [Output Files](#output-files)
- [Product Data Format](#product-data-format)
- [Individual Scrapers](#individual-scrapers)
- [Current Status](#current-status)
- [Testing](#testing)
- [Adding New Stores](#adding-new-stores)

## Quick Start

Run the complete pipeline (scraping, processing, and matching):

```bash
cd backend
python -m scrapers.main
```

Or skip scraping and just process existing data:

```bash
python -m scrapers.main --skip-scraping
```

## Architecture

```
backend/scrapers/
├── main.py                 # Main orchestrator (run this!)
├── stores/                 # Store-specific scrapers
│   ├── aldi_scraper.py
│   ├── pricechopper_api_scraper.py
│   └── target_scraper.py
├── utils/                  # Shared utilities
│   ├── data_processor.py   # Normalization, deduplication, matching
│   ├── parsers.py         # Price, size, text parsing
│   ├── validators.py      # Data validation and cleaning
│   └── exporters.py       # JSON/CSV export utilities
├── core/                   # Core infrastructure
│   ├── models.py          # Product, ScraperResult models
│   ├── http_client.py     # HTTP request handling with retry/rate limiting
│   ├── selenium_client.py # Selenium WebDriver wrapper
│   └── exceptions.py      # Custom exceptions
└── output/                # Generated data
    ├── raw/               # Raw scraped data
    └── processed/         # Normalized & matched data
```

## Pipeline Flow

The `main.py` orchestrator runs three steps automatically:

### Step 1: Scraping

- Scrapes product data from Aldi and Price Chopper
- Saves raw JSON to `output/raw/`
- Hannaford data must be added manually to `output/raw/hannaford_scraped_products.json`

### Step 2: Processing

- **Normalization**: Converts to standard format with unit_price
- **Deduplication**: Removes duplicate products
- **Simplification**: Removes store branding and excessive descriptors
- **Size Normalization**: Standardizes size formats (12.0 → 12)
- Saves to `output/processed/*_normalized.json`

### Step 3: Matching

- Finds matching products across all three stores
- Matches based on: brand, name (70% word overlap), size, and unit
- Saves results to `output/processed/store_matches.json`

## Output Files

### Raw Data (`output/raw/`)

- `aldi_products.json` - Raw Aldi scrape
- `pricechopper_products.json` - Raw Price Chopper scrape
- `hannaford_scraped_products.json` - Manual Hannaford data

### Processed Data (`output/processed/`)

- `aldi_normalized.json` - Cleaned Aldi products
- `pricechopper_normalized.json` - Cleaned Price Chopper products
- `hannaford_normalized.json` - Cleaned Hannaford products
- `store_matches.json` - Cross-store product matches

## Product Data Format

### Normalized Product

```json
{
  "brand": "Generic",
  "name": "Whole Milk",
  "price": "3.89",
  "category": "Dairy",
  "size": "1",
  "unit": "gallon",
  "source": "Aldi",
  "unit_price": 3.89
}
```

### Match Result

```json
{
  "three_way_matches": [
    {
      "hannaford": {...},
      "aldi": {...},
      "pricechopper": {...}
    }
  ],
  "hannaford_aldi_matches": [...],
  "hannaford_pricechopper_matches": [...],
  "metadata": {
    "analyzed_at": "2025-12-02T...",
    "total_hannaford": 574,
    "total_aldi": 3018,
    "total_pricechopper": 470,
    "match_rate": "18.6%"
  }
}
```

## Individual Scrapers

You can also run scrapers individually:

```bash
# Aldi scraper
python -m scrapers.stores.aldi_scraper

# Price Chopper scraper
python -m scrapers.stores.pricechopper_api_scraper
```

## Current Status

- **Aldi**: 3,018 products (fully automated scraping)
- **Price Chopper**: 470 products (API-based, Produce only)
- **Hannaford**: 574 products (manual data collection)
- **Match Rate**: 18.6% (107 total matches)
  - 63 three-way matches
  - 43 Hannaford ↔ Aldi matches
  - 1 Hannaford ↔ Price Chopper match

## Data Quality Improvements

The pipeline includes automatic data cleaning:

- Removes store-specific branding (e.g., "Specially Selected" → "")
- Strips excessive descriptors ("Fresh Premium" → "")
- Normalizes meat descriptions ("Boneless Skinless Chicken Breast" → "Chicken Breast")
- Standardizes size formats for consistent matching
- Deduplicates identical products

## Adding New Stores

1. Create scraper in `stores/<store>_scraper.py`
2. Implement `scrape_<store>()` function returning `List[Dict]`
3. Add to `main.py` in `run_scrapers()` function
4. Add processing logic in `process_data()`

---

## Core Infrastructure

### Models (`core/models.py`)

#### Product Dataclass

Immutable product data model with validation:

```python
from scrapers.core import Product

product = Product(
    brand='Simply Nature',
    name='Organic Pasta',
    price='2.99',
    category='Pasta, Rice & Grains',
    size='16',
    unit='oz',
    source='aldi'
)
```

**Features:**

- Required fields: brand, name, price, category, size, unit, source
- Automatic validation (no empty fields)
- Whitespace stripping
- JSON serialization via `to_dict()`

#### ScraperResult Dataclass

Result container with metadata:

```python
from scrapers.core import ScraperResult

result = ScraperResult(
    store='aldi',
    products=products,
    duration_seconds=15.5
)

result.add_error('Failed to parse some products')
result_dict = result.to_dict()  # Export to JSON
```

**Features:**

- Metadata: total_scraped, errors, duration, timestamp
- Version tracking (scraper_version)
- Success/failure tracking
- Automatic product count calculation

### HTTP Client (`core/http_client.py`)

Robust HTTP client with retry logic and rate limiting:

```python
from scrapers.core import HTTPClient

with HTTPClient(requests_per_second=2.0) as http:
    response = http.get('https://example.com/products')
    # Parse response...
```

**Features:**

- Automatic retry with exponential backoff
- Rate limiting (configurable requests/second)
- Persistent session with connection pooling
- Realistic browser headers
- Context manager support
- Timeout handling
- Custom exception mapping

### Selenium Client (`core/selenium_client.py`)

Managed Selenium WebDriver with utilities:

```python
from scrapers.core import SeleniumClient

with SeleniumClient(headless=True) as selenium:
    selenium.get('https://example.com')
    selenium.wait_for_element('.product-list')
    selenium.scroll_infinite_load()
    html = selenium.get_page_source()
```

**Features:**

- Automatic setup and cleanup
- Context manager support
- Headless mode
- Wait utilities (wait_for_element, wait_for_elements)
- Scroll helpers (scroll_to_bottom, scroll_infinite_load)
- Configurable timeouts
- Error handling with custom exceptions

### Exceptions (`core/exceptions.py`)

Custom exception hierarchy for better error handling:

- `ScraperError` - Base exception
- `ConnectionError` - Network/connectivity issues
- `ParseError` - HTML/data parsing failures
- `RateLimitError` - Rate limiting (triggers retry)
- `ValidationError` - Data validation failures
- `SeleniumError` - WebDriver issues
- `ConfigurationError` - Invalid configuration

---

## Utility Modules

### Parsers (`utils/parsers.py`)

Extract structured data from raw scraped content:

```python
from scrapers.utils import parse_price, parse_size, clean_text

price = parse_price("$1,234.99")  # Returns: 1234.99
quantity, unit = parse_size("16 oz")  # Returns: (16.0, 'oz')
name = clean_text("  Product™ Name  ")  # Returns: "Product Name"
```

**Functions:**

- `parse_price(price_str)` - Extract numeric price from various formats
- `parse_size(size_str)` - Extract quantity and unit from size strings
- `clean_text(text)` - Clean and normalize text content
- `parse_brand_and_name(full_name, known_brands)` - Split product name
- `extract_unit_price(text)` - Extract unit price from text

### Validators (`utils/validators.py`)

Ensure data quality and consistency:

```python
from scrapers.utils import validate_product, clean_product_data

# Clean raw data
raw_data = {
    "brand": "  Nike  ",
    "name": "Shoes™",
    "price": "$99.99",
    "category": "Apparel",
    "size": "16 oz",
    "source": "ALDI"
}
cleaned = clean_product_data(raw_data)

# Validate product
errors = validate_product(product)
if not errors:
    print("Valid product!")
```

**Functions:**

- `validate_product(product)` - Check Product object validity
- `clean_product_data(data)` - Clean and normalize product dict
- `is_valid_product_dict(data)` - Quick validation check
- `deduplicate_products(products)` - Remove duplicates
- `filter_invalid_products(products)` - Filter valid/invalid

### Exporters (`utils/exporters.py`)

Save scraped data in various formats:

```python
from scrapers.utils import save_to_json, save_to_csv, load_from_json

# Save to JSON with metadata
save_to_json(products, "output/aldi_products.json", include_metadata=True)

# Save to CSV
save_to_csv(products, "output/aldi_products.csv")

# Load from JSON
loaded = load_from_json("output/aldi_products.json")
```

**Functions:**

- `save_to_json(products, filepath)` - Save products to JSON
- `save_scraper_result(result, filepath)` - Save complete ScraperResult
- `save_to_csv(products, filepath)` - Save products to CSV
- `append_to_csv(products, filepath)` - Append products to existing CSV
- `load_from_json(filepath)` - Load products from JSON
- `merge_json_files(input_files, output_file)` - Merge multiple JSON files
- `generate_filename(source, extension)` - Generate standardized filenames

---

## Testing

### Run All Tests

```bash
cd backend
source .venv/bin/activate

# Core models tests
python scrapers/core/test_models.py

# Utils tests (25 tests)
pytest scrapers/utils/test_utils.py -v
```

### Test Coverage

**Core Models (7 tests):**

- Product creation and validation
- Whitespace stripping
- to_dict() serialization
- ScraperResult creation
- Error handling
- JSON serialization

**Utils (25 tests):**

- Parser tests (14): price, size, text cleaning, brand extraction
- Validator tests (7): validation, cleaning, deduplication
- Exporter tests (4): JSON, CSV, filename generation

---

## Archive

Old/experimental scripts have been archived and their functionality consolidated into the main pipeline.
