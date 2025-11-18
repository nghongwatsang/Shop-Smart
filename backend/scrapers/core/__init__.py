"""
Core package initialization.

Exports main classes for easy importing.
"""

from .models import Product, ScraperResult
from .http_client import HTTPClient, RateLimiter
from .selenium_client import SeleniumClient
from .exceptions import (
    ScraperError,
    ConnectionError,
    ParseError,
    RateLimitError,
    ValidationError,
    SeleniumError,
    ConfigurationError
)

__all__ = [
    # Models
    'Product',
    'ScraperResult',
    # Clients
    'HTTPClient',
    'RateLimiter',
    'SeleniumClient',
    # Exceptions
    'ScraperError',
    'ConnectionError',
    'ParseError',
    'RateLimitError',
    'ValidationError',
    'SeleniumError',
    'ConfigurationError',
]
