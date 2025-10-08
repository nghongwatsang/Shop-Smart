#TEST FOR ME TO FIND OUT HOW THIS WORKS AT A BASE LEVEL, DO NOT TAKE AS THE CORRECT PERFECT ONE.

import requests
from bs4 import BeautifulSoup
import json

BASE_URL = "https://stores.hannaford.com"
STORE_PATH = "/ny/troy/8336"

def fetch_html(url):
    resp = requests.get(url)
    resp.raise_for_status()
    return resp.text

def parse_store_page(html):
    soup = BeautifulSoup(html, "html.parser")

    # 1. Store info (as before)
    name = soup.select_one("h1.store-header__title")
    address = soup.select_one(".store-header__address .address")
    phone = soup.select_one(".store-header__address a[href^='tel:']")

    store = {
        "name": name.get_text(strip=True) if name else None,
        "address": address.get_text(" ", strip=True) if address else None,
        "phone": phone.get_text(strip=True) if phone else None
    }

    # 2. Find Weekly Ad link
    weekly_ad_href = None
    for a in soup.find_all("a", href=True):
        if "weekly ad" in a.get_text(strip=True).lower():
            weekly_ad_href = a["href"]
            break

    if weekly_ad_href and not weekly_ad_href.startswith("http"):
        weekly_ad_href = BASE_URL + weekly_ad_href

    return store, weekly_ad_href

def parse_weekly_ad(html):
    soup = BeautifulSoup(html, "html.parser")
    products = []

    # Adjust these selectors if Hannaford changes their markup
    cards = soup.select(".weekly-ad__product-card, .ad-item, .product-card")
    for card in cards:
        name_tag = card.select_one(".product-card__name, .ad-item__title")
        sale_price_tag = card.select_one(".product-card__sale-price, .ad-item__sale-price")
        reg_price_tag = card.select_one(".product-card__reg-price, .ad-item__reg-price")
        unit_price_tag = card.select_one(".product-card__unit-price, .ad-item__unit-price")

        product = {
            "name": name_tag.get_text(strip=True) if name_tag else None,
            "sale_price": sale_price_tag.get_text(strip=True) if sale_price_tag else None,
            "regular_price": reg_price_tag.get_text(strip=True) if reg_price_tag else None,
            "unit_price": unit_price_tag.get_text(strip=True) if unit_price_tag else None
        }
        products.append(product)

    return products

def main():
    store_url = BASE_URL + STORE_PATH
    store_html = fetch_html(store_url)
    store_info, ad_url = parse_store_page(store_html)

    print("Store info:")
    print(json.dumps(store_info, indent=2))

    if not ad_url:
        print("Could not find Weekly Ad link on store page.")
        return

    print(f"\nFetching Weekly Ad from {ad_url}\n")
    ad_html = fetch_html(ad_url)
    products = parse_weekly_ad(ad_html)

    print(f"Found {len(products)} products:")
    for idx, p in enumerate(products, 1):
        print(f"{idx}. {p['name']} — sale: {p['sale_price']} | reg: {p['regular_price']} | unit: {p['unit_price']}")

if __name__ == "__main__":
    main()