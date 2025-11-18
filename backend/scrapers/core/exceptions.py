"""
Custom exceptions for the scraper system.

Provides a hierarchy of exceptions for better error handling and debugging.
"""


class ScraperError(Exception):
    """
    Base exception for all scraper errors.
    
    All custom scraper exceptions inherit from this class.
    """
    pass


class ConnectionError(ScraperError):
    """
    Raised when unable to connect to a store website.
    
    Examples:
        - Network timeouts
        - DNS resolution failures
        - SSL/TLS errors
    """
    pass


class ParseError(ScraperError):
    """
    Raised when unable to parse HTML content or extract product data.
    
    Examples:
        - Missing expected HTML elements
        - Invalid data format
        - Selector doesn't match anything
    """
    pass


class RateLimitError(ScraperError):
    """
    Raised when rate limit is exceeded or temporarily blocked.
    
    Should trigger retry logic with backoff.
    
    Examples:
        - 429 Too Many Requests
        - Captcha page encountered
        - IP temporarily blocked
    """
    pass


class ValidationError(ScraperError):
    """
    Raised when product data fails validation.
    
    Examples:
        - Missing required fields
        - Invalid price format
        - Empty product name
    """
    pass


class SeleniumError(ScraperError):
    """
    Raised when Selenium WebDriver encounters issues.
    
    Examples:
        - WebDriver initialization failure
        - Element not found after waiting
        - JavaScript execution error
    """
    pass


class ConfigurationError(ScraperError):
    """
    Raised when scraper configuration is invalid.
    
    Examples:
        - Missing required config values
        - Invalid URL format
        - Unsupported store name
    """
    pass
