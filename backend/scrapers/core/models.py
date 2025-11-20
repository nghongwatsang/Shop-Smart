"""
Core models for the scraper system.

Contains the Product dataclass and ScraperResult for consistent data handling.
"""

from dataclasses import dataclass, field
from typing import Optional, Dict, Any, List
from decimal import Decimal
from datetime import datetime


@dataclass
class Product:
    """
    Immutable product data model.
    
    Represents a single product from any store with validated fields.
    """
    brand: str
    name: str
    price: str  # Keep as string initially, parse in process_products.py
    category: str
    size: str
    unit: str
    source: str
    
    def __post_init__(self):
        """Validate required fields after initialization."""
        # Validate required fields are not empty
        if not self.brand or not self.brand.strip():
            raise ValueError("Product brand cannot be empty")
        
        if not self.name or not self.name.strip():
            raise ValueError("Product name cannot be empty")
        
        if not self.price or not self.price.strip():
            raise ValueError("Product price cannot be empty")
        
        if not self.category or not self.category.strip():
            raise ValueError("Product category cannot be empty")
        
        if not self.source or not self.source.strip():
            raise ValueError("Product source (store) cannot be empty")
        
        # Strip whitespace from all string fields
        object.__setattr__(self, 'brand', self.brand.strip())
        object.__setattr__(self, 'name', self.name.strip())
        object.__setattr__(self, 'price', self.price.strip())
        object.__setattr__(self, 'category', self.category.strip())
        object.__setattr__(self, 'size', self.size.strip() if self.size else self.size)
        object.__setattr__(self, 'unit', self.unit.strip() if self.unit else self.unit)
        object.__setattr__(self, 'source', self.source.strip())
    
    def to_dict(self) -> Dict[str, Any]:
        """
        Convert product to dictionary for JSON serialization.
        
        Returns:
            Dictionary with all product fields
        """
        return {
            'brand': self.brand,
            'name': self.name,
            'price': self.price,
            'category': self.category,
            'size': self.size,
            'unit': self.unit,
            'source': self.source
        }
    
    def __repr__(self) -> str:
        """String representation for debugging."""
        return f"Product(brand='{self.brand}', name='{self.name}', price='{self.price}', source='{self.source}')"


@dataclass
class ScraperResult:
    """
    Result from a scraper run.
    
    Contains products, metadata, and error information.
    """
    store: str
    products: List[Product] = field(default_factory=list)
    total_scraped: int = 0
    errors: List[str] = field(default_factory=list)
    duration_seconds: float = 0.0
    timestamp: datetime = field(default_factory=datetime.utcnow)
    scraper_version: str = "1.0.0"
    success: bool = True
    
    def __post_init__(self):
        """Set total_scraped from products list if not provided."""
        if self.total_scraped == 0:
            self.total_scraped = len(self.products)
    
    def to_dict(self) -> Dict[str, Any]:
        """
        Convert scraper result to dictionary for JSON export.
        
        Returns:
            Dictionary with all result metadata and products
        """
        return {
            'store': self.store,
            'scraped_at': self.timestamp.isoformat(),
            'scraper_version': self.scraper_version,
            'total_products': self.total_scraped,
            'metadata': {
                'success': self.success,
                'errors': self.errors,
                'duration_seconds': self.duration_seconds,
            },
            'products': [p.to_dict() for p in self.products]
        }
    
    def add_error(self, error: str) -> None:
        """Add an error message to the result."""
        self.errors.append(error)
        if len(self.errors) > 0:
            self.success = False
    
    def __repr__(self) -> str:
        """String representation for debugging."""
        return f"ScraperResult(store='{self.store}', products={self.total_scraped}, errors={len(self.errors)})"
