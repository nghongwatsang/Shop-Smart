"""
HTTP client for static website scraping.

Provides a robust HTTP client with retry logic, rate limiting, and session management.
"""

import requests
from requests.adapters import HTTPAdapter
from urllib3.util.retry import Retry
from typing import Optional, Dict, Any
import time
from threading import Lock

from .exceptions import ConnectionError, RateLimitError


class HTTPClient:
    """
    HTTP client with retry logic and rate limiting.
    
    Features:
        - Automatic retry with exponential backoff
        - Rate limiting to respect server resources
        - Persistent session with connection pooling
        - Realistic browser headers
    """
    
    def __init__(
        self,
        timeout: int = 10,
        max_retries: int = 3,
        requests_per_second: float = 2.0,
        backoff_factor: float = 0.5
    ):
        """
        Initialize HTTP client.
        
        Args:
            timeout: Request timeout in seconds
            max_retries: Maximum number of retry attempts
            requests_per_second: Rate limit (requests per second)
            backoff_factor: Multiplier for exponential backoff
        """
        self.timeout = timeout
        self.max_retries = max_retries
        self.session = requests.Session()
        
        # Setup rate limiter
        self._rate_limiter = RateLimiter(requests_per_second)
        
        # Setup retry strategy
        retry_strategy = Retry(
            total=max_retries,
            backoff_factor=backoff_factor,
            status_forcelist=[429, 500, 502, 503, 504],
            allowed_methods=["GET", "POST"]
        )
        
        # Mount adapter with retry strategy
        adapter = HTTPAdapter(max_retries=retry_strategy, pool_maxsize=10)
        self.session.mount("http://", adapter)
        self.session.mount("https://", adapter)
        
        # Setup realistic headers
        self._setup_headers()
    
    def _setup_headers(self) -> None:
        """Setup realistic browser headers."""
        self.session.headers.update({
            "User-Agent": (
                "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) "
                "AppleWebKit/537.36 (KHTML, like Gecko) "
                "Chrome/120.0.0.0 Safari/537.36"
            ),
            "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
            "Accept-Language": "en-US,en;q=0.5",
            "Accept-Encoding": "gzip, deflate",
            "Connection": "keep-alive",
            "Upgrade-Insecure-Requests": "1",
            "DNT": "1",
        })
    
    def get(
        self,
        url: str,
        params: Optional[Dict[str, Any]] = None,
        headers: Optional[Dict[str, str]] = None
    ) -> requests.Response:
        """
        Make a GET request with rate limiting and retry logic.
        
        Args:
            url: URL to request
            params: Query parameters
            headers: Additional headers (merged with default)
            
        Returns:
            Response object
            
        Raises:
            ConnectionError: If request fails after retries
            RateLimitError: If rate limited (429 response)
        """
        # Wait for rate limiter
        self._rate_limiter.wait()
        
        try:
            # Merge custom headers with session headers
            request_headers = self.session.headers.copy()
            if headers:
                request_headers.update(headers)
            
            response = self.session.get(
                url,
                params=params,
                headers=request_headers,
                timeout=self.timeout
            )
            
            # Check for rate limiting
            if response.status_code == 429:
                raise RateLimitError(f"Rate limited by server: {url}")
            
            # Raise for other HTTP errors
            response.raise_for_status()
            
            return response
            
        except requests.exceptions.Timeout as e:
            raise ConnectionError(f"Request timeout for {url}: {e}")
        except requests.exceptions.ConnectionError as e:
            raise ConnectionError(f"Connection failed for {url}: {e}")
        except requests.exceptions.HTTPError as e:
            if e.response.status_code == 429:
                raise RateLimitError(f"Rate limited: {url}")
            raise ConnectionError(f"HTTP error for {url}: {e}")
        except requests.exceptions.RequestException as e:
            raise ConnectionError(f"Request failed for {url}: {e}")
    
    def post(
        self,
        url: str,
        data: Optional[Dict[str, Any]] = None,
        json: Optional[Dict[str, Any]] = None,
        headers: Optional[Dict[str, str]] = None
    ) -> requests.Response:
        """
        Make a POST request with rate limiting and retry logic.
        
        Args:
            url: URL to request
            data: Form data
            json: JSON data
            headers: Additional headers
            
        Returns:
            Response object
            
        Raises:
            ConnectionError: If request fails
            RateLimitError: If rate limited
        """
        self._rate_limiter.wait()
        
        try:
            request_headers = self.session.headers.copy()
            if headers:
                request_headers.update(headers)
            
            response = self.session.post(
                url,
                data=data,
                json=json,
                headers=request_headers,
                timeout=self.timeout
            )
            
            if response.status_code == 429:
                raise RateLimitError(f"Rate limited by server: {url}")
            
            response.raise_for_status()
            return response
            
        except requests.exceptions.RequestException as e:
            raise ConnectionError(f"POST request failed for {url}: {e}")
    
    def close(self) -> None:
        """Close the session and release connections."""
        self.session.close()
    
    def __enter__(self):
        """Context manager entry."""
        return self
    
    def __exit__(self, exc_type, exc_val, exc_tb):
        """Context manager exit - close session."""
        self.close()


class RateLimiter:
    """
    Simple rate limiter using token bucket algorithm.
    
    Ensures requests don't exceed a specified rate.
    """
    
    def __init__(self, requests_per_second: float):
        """
        Initialize rate limiter.
        
        Args:
            requests_per_second: Maximum requests per second
        """
        self.min_interval = 1.0 / requests_per_second if requests_per_second > 0 else 0
        self.last_request_time = 0.0
        self.lock = Lock()
    
    def wait(self) -> None:
        """
        Wait if necessary to respect rate limit.
        
        Blocks until enough time has passed since last request.
        """
        if self.min_interval == 0:
            return
        
        with self.lock:
            current_time = time.time()
            time_since_last = current_time - self.last_request_time
            
            if time_since_last < self.min_interval:
                sleep_time = self.min_interval - time_since_last
                time.sleep(sleep_time)
            
            self.last_request_time = time.time()
