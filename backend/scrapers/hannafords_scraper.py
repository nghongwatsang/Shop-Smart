import requests
from bs4 import BeautifulSoup

def scrape_hannaford_products(url):
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"
    }
    resp = requests.get(url, headers=headers)
    resp.raise_for_status()
    soup = BeautifulSoup(resp.text, "html.parser")

    products = []
    # Select every input element that carries product metadata
    for inp in soup.select("input.qtyInput[data-id]"):
        prod = {
            "id":           inp.get("data-id"),
            "name":         inp.get("data-name"),
            "variant":      inp.get("data-variant"),
            "category":     inp.get("data-category"),
            "store":        inp.get("data-store"),
            "size":         inp.get("data-size") or None,
            #the discount price is the same as the price of the good if there is no discount amount, always take from this when webscraping
            "cost":         inp.get("data-discount-price"),
            "quantity":     inp.get("data-quantity"),
            "discount":     inp.get("data-discount"),
            "coupon":       inp.get("data-coupon") or None,
            "customerType": inp.get("data-customertype"),
        }
        products.append(prod)

    return products

if __name__ == "__main__":
    URL = (
        "https://www.hannaford.com/"
        "departments/meat/bacon-hot-dogs-sausage?displayAll=true"
    )
    items = scrape_hannaford_products(URL)
    for item in items:
        print(
            f"{item['name']} (ID {item['id']}): "
            f"${item['cost']}  |  Variant: {item['variant']}  |  "
            f"Qty: {item['quantity']}"
        )