"""
Test suite for utils module (parsers, validators, exporters).
"""

import pytest
import os
import json
from pathlib import Path
from scrapers.core import Product, ScraperResult
from scrapers.utils import (
    # Parsers
    parse_price, parse_size, clean_text, parse_brand_and_name, extract_unit_price,
    # Validators
    validate_product, clean_product_data, is_valid_product_dict,
    deduplicate_products, filter_invalid_products,
    # Exporters
    save_to_json, save_scraper_result, save_to_csv,
    load_from_json, generate_filename
)


# ============================================================================
# PARSER TESTS
# ============================================================================

class TestParsers:
    """Tests for parsing utilities."""
    
    def test_parse_price_basic(self):
        """Test basic price parsing."""
        assert parse_price("$1.99") == 1.99
        assert parse_price("1.99") == 1.99
        assert parse_price("$0.99") == 0.99
    
    def test_parse_price_with_commas(self):
        """Test price parsing with thousands separator."""
        assert parse_price("$1,234.99") == 1234.99
        assert parse_price("$12,345.67") == 12345.67
        assert parse_price("$99,999.99") == 99999.99  # Max reasonable price
    
    def test_parse_price_with_text(self):
        """Test price extraction from text."""
        assert parse_price("Sale: $2.49") == 2.49
        assert parse_price("Price $5.99 ea") == 5.99
        assert parse_price("Was $10.00 Now $7.99") == 10.00  # Gets first price
    
    def test_parse_price_invalid(self):
        """Test price parsing with invalid input."""
        assert parse_price("") is None
        assert parse_price("free") is None
        assert parse_price("$100000.00") is None  # Too high (over $99,999.99)
    
    def test_parse_size_basic(self):
        """Test basic size parsing."""
        assert parse_size("16 oz") == (16.0, "oz")
        assert parse_size("1 lb") == (1.0, "lb")
        assert parse_size("500ml") == (500.0, "ml")
    
    def test_parse_size_decimals(self):
        """Test size parsing with decimals."""
        assert parse_size("2.5 lbs") == (2.5, "lb")  # Normalized to lb
        assert parse_size("1.5 liters") == (1.5, "l")
    
    def test_parse_size_variations(self):
        """Test size parsing with unit variations."""
        quantity, unit = parse_size("2 pounds")
        assert quantity == 2.0
        assert unit == "lb"  # Normalized
        
        quantity, unit = parse_size("12 count")
        assert quantity == 12.0
        assert unit == "ct"
    
    def test_parse_size_invalid(self):
        """Test size parsing with invalid input."""
        assert parse_size("") == (None, None)
        assert parse_size("large") == (None, None)
    
    def test_clean_text_whitespace(self):
        """Test text cleaning removes extra whitespace."""
        assert clean_text("  Hello   World  ") == "Hello World"
        assert clean_text("Text\n\nWith\nNewlines") == "Text With Newlines"
    
    def test_clean_text_special_chars(self):
        """Test text cleaning removes special characters."""
        assert clean_text("Product™ Name®") == "Product Name"
        assert clean_text("Test©") == "Test"
    
    def test_clean_text_quotes_dashes(self):
        """Test text cleaning normalizes quotes and dashes."""
        # Just verify the function doesn't crash and returns clean text
        # The actual quote conversion depends on what the input contains
        text_with_dashes = "em\u2013dash\u2014here"  # – and —
        assert clean_text(text_with_dashes) == "em-dash-here"
        
        # Test that whitespace is cleaned
        assert clean_text("  multiple   spaces  ") == "multiple spaces"
    
    def test_parse_brand_and_name_with_brands(self):
        """Test brand extraction with known brands."""
        brands = ["Coca-Cola", "Pepsi", "Nike"]
        
        brand, name = parse_brand_and_name("Coca-Cola Classic Soda", brands)
        assert brand == "Coca-Cola"
        assert name == "Classic Soda"
        
        brand, name = parse_brand_and_name("Nike Running Shoes", brands)
        assert brand == "Nike"
        assert name == "Running Shoes"
    
    def test_parse_brand_and_name_no_brands(self):
        """Test brand extraction without known brands."""
        brand, name = parse_brand_and_name("Generic Product")
        assert brand == ""
        assert name == "Generic Product"
    
    def test_extract_unit_price(self):
        """Test unit price extraction."""
        assert extract_unit_price("$1.99/lb") == 1.99
        assert extract_unit_price("($0.15/oz)") == 0.15
        assert extract_unit_price("no price") is None


# ============================================================================
# VALIDATOR TESTS
# ============================================================================

class TestValidators:
    """Tests for validation utilities."""
    
    def test_validate_product_valid(self):
        """Test validation of valid product."""
        product = Product(
            brand="Test Brand",
            name="Test Product",
            price="9.99",
            category="Test Category",
            size="16",
            unit="oz",
            source="aldi"
        )
        errors = validate_product(product)
        assert len(errors) == 0
    
    def test_validate_product_missing_unit(self):
        """Test validation catches missing unit when size is present."""
        product = Product(
            brand="Test",
            name="Product",
            price="9.99",
            category="Category",
            size="16",
            unit="",
            source="aldi"
        )
        errors = validate_product(product)
        assert any("Unit is required" in e for e in errors)
    
    def test_validate_product_invalid_source(self):
        """Test validation catches invalid source."""
        product = Product(
            brand="Test",
            name="Product",
            price="9.99",
            category="Category",
            size="16",
            unit="oz",
            source="walmart"  # Not in valid sources
        )
        errors = validate_product(product)
        assert any("Source must be one of" in e for e in errors)
    
    def test_clean_product_data(self):
        """Test product data cleaning."""
        raw = {
            "brand": "  Nike  ",
            "name": "Shoes™",
            "price": "$99.99",
            "category": "Apparel",
            "size": "16 oz",
            "unit": "",
            "source": "ALDI"
        }
        
        cleaned = clean_product_data(raw)
        assert cleaned["brand"] == "Nike"
        assert cleaned["name"] == "Shoes"
        assert cleaned["price"] == "99.99"  # Kept as string for Product model
        assert cleaned["size"] == "16.0"    # Kept as string
        assert cleaned["unit"] == "oz"
        assert cleaned["source"] == "aldi"
    
    def test_is_valid_product_dict(self):
        """Test product dict validation."""
        valid = {
            "brand": "Test",
            "name": "Product",
            "price": "9.99",
            "category": "Category",
            "source": "aldi"
        }
        assert is_valid_product_dict(valid) is True
        
        invalid = {"brand": "Test"}  # Missing fields
        assert is_valid_product_dict(invalid) is False
    
    def test_deduplicate_products(self):
        """Test product deduplication."""
        p1 = Product("Nike", "Shoes", "99.99", "Apparel", "10", "size", "aldi")
        p2 = Product("Nike", "Shoes", "99.99", "Apparel", "10", "size", "aldi")
        p3 = Product("Adidas", "Sneakers", "89.99", "Apparel", "10", "size", "aldi")
        
        products = [p1, p2, p3]
        unique = deduplicate_products(products)
        assert len(unique) == 2
    
    def test_filter_invalid_products(self):
        """Test filtering invalid products."""
        valid = Product("Nike", "Shoes", "99.99", "Apparel", "10", "size", "aldi")
        invalid = Product("Test", "Product", "99.99", "Category", "16", "", "walmart")
        
        products = [valid, invalid]
        valid_list, invalid_list = filter_invalid_products(products)
        
        assert len(valid_list) == 1
        assert len(invalid_list) == 1


# ============================================================================
# EXPORTER TESTS
# ============================================================================

class TestExporters:
    """Tests for export utilities."""
    
    @pytest.fixture
    def test_products(self):
        """Create test products."""
        return [
            Product("Aldi", "Bananas", "0.69", "Produce", "1", "lb", "aldi"),
            Product("Aldi", "Milk", "3.29", "Dairy", "1", "gal", "aldi"),
        ]
    
    @pytest.fixture
    def temp_dir(self, tmp_path):
        """Create temporary directory for test files."""
        return tmp_path / "test_output"
    
    def test_save_and_load_json(self, test_products, temp_dir):
        """Test saving and loading JSON."""
        filepath = str(temp_dir / "test.json")
        
        # Save
        save_to_json(test_products, filepath, include_metadata=True)
        assert Path(filepath).exists()
        
        # Load
        loaded = load_from_json(filepath)
        assert len(loaded) == len(test_products)
        assert loaded[0].name == test_products[0].name
    
    def test_save_scraper_result(self, test_products, temp_dir):
        """Test saving ScraperResult."""
        result = ScraperResult(
            store="aldi",
            products=test_products,
            errors=[],
            duration_seconds=10.5
        )
        
        filepath = str(temp_dir / "result.json")
        save_scraper_result(result, filepath)
        
        assert Path(filepath).exists()
        
        # Verify content
        with open(filepath) as f:
            data = json.load(f)
        assert data["store"] == "aldi"
        assert len(data["products"]) == 2
    
    def test_save_to_csv(self, test_products, temp_dir):
        """Test saving to CSV."""
        filepath = str(temp_dir / "test.csv")
        
        save_to_csv(test_products, filepath, include_header=True)
        assert Path(filepath).exists()
        
        # Verify CSV has correct structure
        with open(filepath) as f:
            lines = f.readlines()
        assert len(lines) == 3  # Header + 2 products
        assert "brand,name,price" in lines[0]
    
    def test_generate_filename(self):
        """Test filename generation."""
        # Without timestamp
        filename = generate_filename("aldi", "json", include_timestamp=False)
        assert filename == "aldi.json"
        
        # With timestamp
        filename = generate_filename("target", "csv", include_timestamp=True)
        assert filename.startswith("target_")
        assert filename.endswith(".csv")


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
