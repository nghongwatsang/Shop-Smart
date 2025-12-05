import re
import json
import time
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC


def create_driver() -> webdriver.Chrome:
    """Create a Chrome driver configured for Docker."""
    options = webdriver.ChromeOptions()
    options.add_argument("--headless=new")
    options.add_argument("--disable-gpu")
    options.add_argument("--no-sandbox")
    options.add_argument("--disable-dev-shm-usage")
    options.add_argument("--window-size=1920,1080")

    service = Service("/usr/local/bin/chromedriver")
    return webdriver.Chrome(service=service, options=options)


def extract_size_and_unit(raw_name: str):
    """Extracts size and unit using regex."""
    pattern = r"(\d+(?:\.\d+)?)\s*(fl\s*oz|oz|ounce|lb|pound|g|kg)"
    match = re.search(pattern, raw_name.lower())

    if not match:
        return "", ""

    size = match.group(1)
    unit = match.group(2).replace(" ", "")

    return size, {
        "ounce": "oz",
        "oz": "oz",
        "floz": "fl oz",
        "lb": "lb",
        "pound": "lb",
        "g": "g",
        "kg": "kg"
    }.get(unit, unit)


def run_target_scraper(search_term: str = "bananas") -> list[dict]:
    """
    Run the Target scraper and return a list of product dictionaries.
    """
    print(f"🔍 Running Target scraper for '{search_term}'...")

    driver = create_driver()
    category_url = f"https://www.target.com/s?searchTerm={search_term}"
    driver.get(category_url)

    all_urls = set()

    print("📄 Collecting product URLs...")

    while True:
        scroll_pause_time = 0.4
        scroll_step = 500

        last_height = driver.execute_script("return document.body.scrollHeight")
        current_pos = 0

        # scroll page
        while current_pos < last_height:
            driver.execute_script(f"window.scrollTo(0, {current_pos});")
            time.sleep(scroll_pause_time)
            current_pos += scroll_step
            last_height = driver.execute_script("return document.body.scrollHeight")

        # wait for products
        try:
            WebDriverWait(driver, 12).until(
                EC.presence_of_all_elements_located((By.CSS_SELECTOR, "a[data-test='product-title']"))
            )
        except:
            print("⚠️ No products found.")
            break

        # collect urls
        for elem in driver.find_elements(By.CSS_SELECTOR, "a[data-test='product-title']"):
            href = elem.get_attribute("href")
            if href:
                all_urls.add(href)

        # next page
        try:
            next_button = WebDriverWait(driver, 5).until(
                EC.element_to_be_clickable((By.CSS_SELECTOR, "button[data-test='next']"))
            )
            driver.execute_script("arguments[0].click();", next_button)
            time.sleep(1.2)
        except:
            print("📌 No more pages.")
            break

    print(f"📦 Found {len(all_urls)} product URLs.")

    results = []

    for idx, url in enumerate(all_urls, 1):
        driver.get(url)

        try:
            WebDriverWait(driver, 10).until(
                EC.presence_of_element_located((By.CSS_SELECTOR, "h1[data-test='product-title']"))
            )
            raw_name = driver.find_element(By.CSS_SELECTOR, "h1[data-test='product-title']").text.strip()
        except:
            raw_name = "Unknown Product"

        # price
        try:
            price = driver.find_element(By.CSS_SELECTOR, "span[data-test='product-price']").text.strip()
        except:
            price = "N/A"

        # brand
        try:
            brand = driver.find_element(By.CSS_SELECTOR, "span[data-test='brand-name']").text.strip()
        except:
            brand = raw_name.split()[0]

        # parse size + unit
        size, unit = extract_size_and_unit(raw_name)

        # clean name
        name = re.sub(r"(\d+(?:\.\d+)?)\s*(fl\s*oz|oz|ounce|lb|pound|g|kg)", "", raw_name.lower()).strip()
        name = name.title()

        product = {
            "brand": brand,
            "name": name,
            "price": price,
            "category": search_term.title(),
            "size": size,
            "unit": unit,
            "source": "target",
            "product_url": url,
            "raw_name": raw_name
        }

        results.append(product)
        print(f"[{idx}/{len(all_urls)}] {raw_name}")

    driver.quit()
    print(f"✅ Scraper finished. Extracted {len(results)} products.")

    return results
