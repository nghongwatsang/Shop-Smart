"""
Selenium client for dynamic/JavaScript-heavy websites.

Provides a managed Selenium WebDriver with common utilities and automatic cleanup.
"""

from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import (
    TimeoutException,
    NoSuchElementException,
    WebDriverException
)
from webdriver_manager.chrome import ChromeDriverManager
from typing import Optional, List
import time

from .exceptions import SeleniumError


class SeleniumClient:
    """
    Managed Selenium WebDriver client with context manager support.
    
    Features:
        - Automatic WebDriver setup and cleanup
        - Common wait utilities
        - Scroll helpers for infinite scroll pages
        - Error handling with custom exceptions
    """
    
    def __init__(
        self,
        headless: bool = True,
        page_load_timeout: int = 30,
        implicit_wait: int = 10,
        window_size: tuple = (1920, 1080)
    ):
        """
        Initialize Selenium client.
        
        Args:
            headless: Run browser in headless mode
            page_load_timeout: Maximum time to wait for page load
            implicit_wait: Default wait time for elements
            window_size: Browser window size (width, height)
        """
        self.headless = headless
        self.page_load_timeout = page_load_timeout
        self.implicit_wait = implicit_wait
        self.window_size = window_size
        self.driver: Optional[webdriver.Chrome] = None
        self._is_initialized = False
    
    def _setup_driver(self) -> webdriver.Chrome:
        """
        Setup and configure Chrome WebDriver.
        
        Returns:
            Configured WebDriver instance
            
        Raises:
            SeleniumError: If WebDriver initialization fails
        """
        try:
            options = Options()
            
            if self.headless:
                options.add_argument("--headless")
                options.add_argument("--no-sandbox")
                options.add_argument("--disable-dev-shm-usage")
            
            # Additional options for stability
            options.add_argument(f"--window-size={self.window_size[0]},{self.window_size[1]}")
            options.add_argument("--disable-blink-features=AutomationControlled")
            options.add_argument("--disable-gpu")
            options.add_argument("--disable-extensions")
            options.add_experimental_option("excludeSwitches", ["enable-logging"])
            options.add_experimental_option("useAutomationExtension", False)
            
            # User agent
            options.add_argument(
                "user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) "
                "AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
            )
            
            # Initialize driver
            service = Service(ChromeDriverManager().install())
            driver = webdriver.Chrome(service=service, options=options)
            
            # Set timeouts
            driver.set_page_load_timeout(self.page_load_timeout)
            driver.implicitly_wait(self.implicit_wait)
            
            return driver
            
        except Exception as e:
            raise SeleniumError(f"Failed to initialize WebDriver: {e}")
    
    def get(self, url: str, wait_time: Optional[int] = None) -> None:
        """
        Navigate to URL and optionally wait for page load.
        
        Args:
            url: URL to navigate to
            wait_time: Additional wait time after page load
            
        Raises:
            SeleniumError: If navigation fails
        """
        if not self._is_initialized:
            raise SeleniumError("WebDriver not initialized. Use as context manager or call start().")
        
        try:
            self.driver.get(url)
            
            if wait_time:
                time.sleep(wait_time)
                
        except TimeoutException:
            raise SeleniumError(f"Timeout loading page: {url}")
        except WebDriverException as e:
            raise SeleniumError(f"Failed to load page {url}: {e}")
    
    def wait_for_element(
        self,
        selector: str,
        by: By = By.CSS_SELECTOR,
        timeout: int = 10
    ):
        """
        Wait for element to be present in DOM.
        
        Args:
            selector: Element selector
            by: Selector type (CSS_SELECTOR, XPATH, etc.)
            timeout: Maximum wait time
            
        Returns:
            WebElement when found
            
        Raises:
            SeleniumError: If element not found within timeout
        """
        try:
            element = WebDriverWait(self.driver, timeout).until(
                EC.presence_of_element_located((by, selector))
            )
            return element
        except TimeoutException:
            raise SeleniumError(f"Element not found: {selector}")
    
    def wait_for_elements(
        self,
        selector: str,
        by: By = By.CSS_SELECTOR,
        timeout: int = 10
    ) -> List:
        """
        Wait for multiple elements to be present in DOM.
        
        Args:
            selector: Element selector
            by: Selector type
            timeout: Maximum wait time
            
        Returns:
            List of WebElements
            
        Raises:
            SeleniumError: If elements not found
        """
        try:
            elements = WebDriverWait(self.driver, timeout).until(
                EC.presence_of_all_elements_located((by, selector))
            )
            return elements
        except TimeoutException:
            raise SeleniumError(f"Elements not found: {selector}")
    
    def scroll_to_bottom(self, pause_time: float = 0.5) -> None:
        """
        Scroll to bottom of page.
        
        Args:
            pause_time: Time to pause after scrolling
        """
        self.driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
        time.sleep(pause_time)
    
    def scroll_infinite_load(
        self,
        max_scrolls: int = 10,
        pause_time: float = 1.0,
        scroll_step: int = 500
    ) -> None:
        """
        Scroll page to trigger infinite scroll loading.
        
        Useful for pages that load content dynamically as you scroll.
        
        Args:
            max_scrolls: Maximum number of scroll iterations
            pause_time: Time to pause between scrolls
            scroll_step: Pixels to scroll each step
        """
        last_height = self.driver.execute_script("return document.body.scrollHeight")
        
        for _ in range(max_scrolls):
            # Scroll in steps
            current_position = 0
            while current_position < last_height:
                self.driver.execute_script(f"window.scrollTo(0, {current_position});")
                time.sleep(pause_time)
                current_position += scroll_step
                last_height = self.driver.execute_script("return document.body.scrollHeight")
            
            # Check if height changed (new content loaded)
            new_height = self.driver.execute_script("return document.body.scrollHeight")
            if new_height == last_height:
                break  # No more content loading
            
            last_height = new_height
    
    def get_page_source(self) -> str:
        """
        Get current page HTML source.
        
        Returns:
            Page HTML as string
        """
        return self.driver.page_source
    
    def close_current_tab(self) -> None:
        """Close current browser tab."""
        if self.driver:
            self.driver.close()
    
    def cleanup(self) -> None:
        """
        Close browser and cleanup resources.
        
        Should always be called when done using the client.
        """
        if self.driver:
            try:
                self.driver.quit()
            except Exception:
                pass  # Ignore errors during cleanup
            finally:
                self.driver = None
                self._is_initialized = False
    
    def start(self):
        """
        Manually start the WebDriver.
        
        Returns:
            Self for chaining
        """
        if not self._is_initialized:
            self.driver = self._setup_driver()
            self._is_initialized = True
        return self
    
    def __enter__(self):
        """Context manager entry - setup WebDriver."""
        self.driver = self._setup_driver()
        self._is_initialized = True
        return self
    
    def __exit__(self, exc_type, exc_val, exc_tb):
        """Context manager exit - cleanup WebDriver."""
        self.cleanup()
    
    def __del__(self):
        """Destructor - ensure cleanup."""
        self.cleanup()
