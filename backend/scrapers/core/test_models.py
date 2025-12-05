"""
Tests for core.models module.

Run with: python -m pytest backend/scrapers/core/test_models.py
Or manually: python backend/scrapers/core/test_models.py
"""

import sys
import json
from pathlib import Path

# Add parent directory to path
sys.path.insert(0, str(Path(__file__).parent.parent))

from core.models import Product, ScraperResult


def test_product_creation():
    """Test basic Product creation."""
    product = Product(
        brand='Simply Nature',
        name='Organic Pasta',
        price='$2.99',
        category='Pasta, Rice & Grains',
        size='16',
        unit='oz',
        source='aldi'
    )
    
    assert product.brand == 'Simply Nature'
    assert product.name == 'Organic Pasta'
    assert product.price == '$2.99'
    assert product.source == 'aldi'
    print('✓ test_product_creation passed')


def test_product_validation():
    """Test Product validation raises errors for invalid data."""
    # Test empty brand
    try:
        Product(brand='', name='Test', price='1.99', category='Food', 
                size='', unit='', source='test')
        assert False, "Should have raised ValueError"
    except ValueError as e:
        assert 'brand' in str(e).lower()
    
    # Test empty name
    try:
        Product(brand='Test', name='', price='1.99', category='Food',
                size='', unit='', source='test')
        assert False, "Should have raised ValueError"
    except ValueError as e:
        assert 'name' in str(e).lower()
    
    print('✓ test_product_validation passed')


def test_product_whitespace_stripping():
    """Test that whitespace is stripped from fields."""
    product = Product(
        brand='  Simply Nature  ',
        name='  Organic Pasta  ',
        price='  $2.99  ',
        category='  Pasta  ',
        size='  16  ',
        unit='  oz  ',
        source='  aldi  '
    )
    
    assert product.brand == 'Simply Nature'
    assert product.name == 'Organic Pasta'
    assert product.price == '$2.99'
    assert product.category == 'Pasta'
    print('✓ test_product_whitespace_stripping passed')


def test_product_to_dict():
    """Test Product.to_dict() serialization."""
    product = Product(
        brand='Simply Nature',
        name='Organic Pasta',
        price='$2.99',
        category='Pasta',
        size='16',
        unit='oz',
        source='aldi'
    )
    
    product_dict = product.to_dict()
    
    assert isinstance(product_dict, dict)
    assert product_dict['brand'] == 'Simply Nature'
    assert product_dict['name'] == 'Organic Pasta'
    assert product_dict['price'] == '$2.99'
    assert len(product_dict) == 7  # All fields
    print('✓ test_product_to_dict passed')


def test_scraper_result_creation():
    """Test ScraperResult creation."""
    products = [
        Product(brand='Test', name='Product 1', price='1.99', 
                category='Food', size='', unit='', source='test'),
        Product(brand='Test', name='Product 2', price='2.99',
                category='Food', size='', unit='', source='test'),
    ]
    
    result = ScraperResult(store='test', products=products, duration_seconds=10.5)
    
    assert result.store == 'test'
    assert len(result.products) == 2
    assert result.total_scraped == 2
    assert result.duration_seconds == 10.5
    assert result.success is True
    assert len(result.errors) == 0
    print('✓ test_scraper_result_creation passed')


def test_scraper_result_error_handling():
    """Test ScraperResult error tracking."""
    result = ScraperResult(store='test')
    
    assert result.success is True
    assert len(result.errors) == 0
    
    result.add_error('Test error 1')
    assert result.success is False
    assert len(result.errors) == 1
    
    result.add_error('Test error 2')
    assert len(result.errors) == 2
    print('✓ test_scraper_result_error_handling passed')


def test_scraper_result_to_dict():
    """Test ScraperResult.to_dict() serialization."""
    products = [
        Product(brand='Test', name='Product', price='1.99',
                category='Food', size='', unit='', source='test')
    ]
    
    result = ScraperResult(store='test', products=products, duration_seconds=5.0)
    result_dict = result.to_dict()
    
    assert isinstance(result_dict, dict)
    assert result_dict['store'] == 'test'
    assert result_dict['total_products'] == 1
    assert 'scraped_at' in result_dict
    assert 'scraper_version' in result_dict
    assert 'metadata' in result_dict
    assert 'products' in result_dict
    
    # Ensure it's JSON serializable
    json_str = json.dumps(result_dict)
    assert len(json_str) > 0
    print('✓ test_scraper_result_to_dict passed')


def run_all_tests():
    """Run all tests."""
    print('Running core.models tests...')
    print('=' * 50)
    
    test_product_creation()
    test_product_validation()
    test_product_whitespace_stripping()
    test_product_to_dict()
    test_scraper_result_creation()
    test_scraper_result_error_handling()
    test_scraper_result_to_dict()
    
    print('=' * 50)
    print('✅ All tests passed!')


if __name__ == '__main__':
    run_all_tests()
