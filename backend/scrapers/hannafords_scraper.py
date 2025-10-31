import requests
from bs4 import BeautifulSoup

#This will scrape hannafords for all products sold by them from each department.
#TODO: get past that "see more" button that hides things ona  page, it doesn't change the source when you click it because it technically isn't a new page.
#BLOCKER: IF I USE SELENIUM IT SAYS: You don't have permission to access "http://www.hannaford.com/departments/meat/bacon-hot-dogs-sausage?" on this server.<p>
#Reference #18.25623417.1760563910.939ef38
#</p><p>https://errors.edgesuite.net/18.25623417.1760563910.939ef38</p> 
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
        "https://hannaford.com/"
        "browse-aisles/categories/1/categories/1563/categories/2853-beef"
    )
    items = scrape_hannaford_products(URL)
    for item in items:
        print(
            f"{item['name']} (ID {item['id']}): "
            f"${item['cost']}  |  Variant: {item['variant']}  |  "
            f"Qty: {item['quantity']}"
        )