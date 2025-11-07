import re
import json
import time
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from webdriver_manager.chrome import ChromeDriverManager


# Setup Chrome driver
options = webdriver.ChromeOptions()
# options.add_argument("--headless")  # Uncomment for headless mode
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=options)

category_url = "https://www.target.com/s?searchTerm=bananas"
driver.get(category_url)

all_product_urls = set()


# Collect all product urls
while True:
    # Scroll to load all products on current page
    scroll_pause_time = 0.5
    scroll_step = 500
    last_height = driver.execute_script("return document.body.scrollHeight")
    current_position = 0

    while current_position < last_height:
        driver.execute_script(f"window.scrollTo(0, {current_position});")
        time.sleep(scroll_pause_time)
        current_position += scroll_step
        last_height = driver.execute_script("return document.body.scrollHeight")

    # Collect product urls
    WebDriverWait(driver, 20).until(
        EC.presence_of_all_elements_located((By.CSS_SELECTOR, "a[data-test='product-title']"))
    )
    product_elements = driver.find_elements(By.CSS_SELECTOR, "a[data-test='product-title']")
    for elem in product_elements:
        href = elem.get_attribute("href")
        if href:
            all_product_urls.add(href)

    # Try to go to next page
    try:
        next_button = WebDriverWait(driver, 10).until(
            EC.element_to_be_clickable((By.CSS_SELECTOR, "button[data-test='next']"))
        )
        driver.execute_script("arguments[0].click();", next_button)
        time.sleep(2)
    except:
        #Finished collecting all urls
        print("No more pages.")
        break

print(f"Collected {len(all_product_urls)} product URLs across all pages.")

urls_to_scrape = list(all_product_urls)
products_data = []


# Scrape each product page
for idx, url in enumerate(urls_to_scrape, start=1):
    driver.get(url)
    try:
        WebDriverWait(driver, 20).until(
            EC.presence_of_element_located((By.CSS_SELECTOR, "h1[data-test='product-title']"))
        )
        raw_name = driver.find_element(By.CSS_SELECTOR, "h1[data-test='product-title']").text.strip()
    except:
        raw_name = "No title found"

    try:
        price = driver.find_element(By.CSS_SELECTOR, "span[data-test='product-price']").text.strip()
    except:
        price = "No price found"

    # Extract brand (fallback: first word of title)
    try:
        brand_elem = driver.find_element(By.CSS_SELECTOR, "span[data-test='brand-name']")
        brand = brand_elem.text.strip()
    except:
        brand = raw_name.split()[0]

  
    # regex for size and unit from raw_name
    size = ""
    unit = ""
    pattern = r"(\d+(?:\.\d+)?)\s*(fl\s*oz|oz|ounce|lb|pound|g|kg)"
    match = re.search(pattern, raw_name.lower())
    if match:
        size = match.group(1)
        unit = match.group(2)
        unit = unit.replace(" ", "")
        unit = {
            "ounce": "oz",
            "oz": "oz",
            "floz": "fl oz",
            "lb": "lb",
            "pound": "lb",
            "g": "g",
            "kg": "kg"
        }.get(unit, unit)

    # get name by removing size and unit
    name = re.sub(pattern, "", raw_name.lower(), flags=re.IGNORECASE).strip()
    name = name.title()

    product_info = {
        "brand": brand,
        "name": name,
        "price": price,
        "category": "Soup",
        "size": size,
        "unit": unit,
        "source": "target",
        "product_url": url,
        "raw_name": raw_name
    }

    products_data.append(product_info)
    print(f"[{idx}/{len(urls_to_scrape)}] Scraped: {product_info}")

# Save to JSON
json_filename = "target_bananas_products.json"
with open(json_filename, "w", encoding="utf-8") as f:
    json.dump(products_data, f, indent=2)

driver.quit()
print(f"\nScraping complete. JSON saved to {json_filename}")