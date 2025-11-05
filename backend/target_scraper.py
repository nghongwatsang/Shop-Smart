from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from webdriver_manager.chrome import ChromeDriverManager
import csv
import time

# Chrome driver
options = webdriver.ChromeOptions()
#options.add_argument("--headless")
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=options)

# Link
category_url = "https://www.target.com/s?searchTerm=soup"
driver.get(category_url)

# Scroll to bottom to load all products
scroll_pause_time = 0.5  #seconds
scroll_step = 500 # pixels

last_height = driver.execute_script("return document.body.scrollHeight")
current_position = 0

#incrementally scroll
while current_position < last_height:
    driver.execute_script(f"window.scrollTo(0, {current_position});")
    time.sleep(scroll_pause_time)
    current_position += scroll_step
    last_height = driver.execute_script("return document.body.scrollHeight")


# Wait for product links to load
WebDriverWait(driver, 20).until(
    EC.presence_of_all_elements_located((By.CSS_SELECTOR, "a[data-test='product-title']"))
)

# Get all product URLs
product_elements = driver.find_elements(By.CSS_SELECTOR, "a[data-test='product-title']")
product_urls = list({elem.get_attribute("href") for elem in product_elements if elem.get_attribute("href")})

# CSV file
csv_filename = "target_soup_products.csv"
with open(csv_filename, mode='w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(["Title", "Price", "URL"])

    # Go through each scraped url and get the item name and price
    for url in product_urls:
        driver.get(url)
        try:
            WebDriverWait(driver, 20).until(
                EC.presence_of_element_located((By.CSS_SELECTOR, "h1[data-test='product-title']"))
            )
            title = driver.find_element(By.CSS_SELECTOR, "h1[data-test='product-title']").text.strip()
        except:
            title = "No title found"

        try:
            price = driver.find_element(By.CSS_SELECTOR, "span[data-test='product-price']").text.strip()
        except:
            price = "No price found"

        writer.writerow([title, price, url])
        print(f"Scraped: {title} - {price}")

# Close browser
driver.quit()

print(f"\nScraping complete. Results saved to {csv_filename}")