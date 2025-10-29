import requests
from bs4 import BeautifulSoup
import re

#This will scrape hannafords for all products sold by them from each department.
#TODO: get past that "see more" button that hides things ona  page, it doesn't change the source when you click it because it technically isn't a new page.
def scrape_hannaford_products(url):
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"
    }
    resp = requests.get(url, headers=headers)
    resp.raise_for_status()
    soup = BeautifulSoup(resp.text, "html.parser")
    
   

    return resp.text

if __name__ == "__main__":
    URL = (
        "https://shop.pricechopper.com/"
        "store/price-chopper-ny/s?k=soda&utm_source=widgets&utm_medium=search-bar"
    )
    items = scrape_hannaford_products(URL)
    

    pattern = r"Current.{0,50}"

# Use re.MULTILINE to treat each line separately
    matches = re.findall(pattern, items, re.MULTILINE)

# Print matching blocks
    for match in matches:
        print(match)
    #print(items)