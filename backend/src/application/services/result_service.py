from src.domain.entities.item import Item
from src.domain.entities.item_price import ItemPrice
from src.domain.entities.store import Store
from sqlalchemy import func

class CartPricingService:
    def __init__(self, db):
        self.db = db

    def validate_cart_item(self, cart_item, index):
        """
        Returns (valid_item_dict, error_message or None)
        """
        errors = []

        # Required fields
        item_name = cart_item.get("name")
        if not item_name or not isinstance(item_name, str):
            errors.append("itemName (string) is required")

        # Optional but must be valid type
        brand = cart_item.get("brand")
        if brand is not None and not isinstance(brand, str):
            errors.append("brandName must be a string")

        size = cart_item.get("size")
        if size is not None and not isinstance(size, (str, int, float)):
            errors.append("size must be string or number")

        unit = cart_item.get("unit")
        if unit is not None and not isinstance(unit, str):
            errors.append("unit must be a string")

        quantity = cart_item.get("quantity", 1)
        if not isinstance(quantity, int) or quantity < 1:
            errors.append("quantity must be an integer >= 1")

        if errors:
            return None, f"Item #{index}: " + ", ".join(errors)

        # Return normalized item object
        return {
            "itemName": item_name,
            "brandName": brand,
            "size": size,
            "unit": unit,
            "quantity": quantity
        }, None

    def get_prices_for_cart(self, cart_items, allowed_stores=None):
        results_by_store = {}
        errors = {}
        
        for idx, cart in enumerate(cart_items, start=1):
            # ---- Validate ----
            valid_item, err = self.validate_cart_item(cart, idx)
            if err:
                errors[idx] = err
                continue

            name = valid_item["itemName"]
            brand = valid_item["brandName"]
            size = valid_item["size"]
            unit = valid_item["unit"]
            quantity = valid_item["quantity"]

            # ---- Database lookup ----
            filters = []
            print(name, brand, size, unit)
            # name must be partial match
            filters.append(Item.name.ilike(f"%{name}%"))

            if brand:
                clean_brand = brand.replace("%", "")
                filters.append(Item.brand.ilike(f"%{clean_brand}%"))

            if unit:
                filters.append(Item.unit.ilike(unit))   # case-insensitive

            if size:
                # try to cast to int if DB stores size numerically
                try:
                    filters.append(Item.size == float(size))
                except:
                    filters.append(Item.size == size)

            print("Filters:", filters)

            query = self.db.query(Item).filter(*filters)
            db_item = query.first()

            if not db_item:
                errors[idx] = "No matching item found in database"
                continue

            # ---- Pricing ----
            prices = (
                self.db.query(ItemPrice, Store)
                .join(Store, ItemPrice.storeid == Store.id)
                .filter(ItemPrice.itemid == db_item.id)
            )
            
            if allowed_stores:
                lowercase_stores = [s.lower() for s in allowed_stores]
                prices = prices.filter(func.lower(Store.name).in_(lowercase_stores))

                
            prices = prices.all()

            if not prices:
                errors[idx] = f"No prices found across stores"
                continue

            for price_row, store in prices:
                entry = {
                    "name": db_item.name,
                    "brand": db_item.brand,
                    "store": store.name,
                    "price": float(price_row.price),
                    "size": size,
                    "unit": unit,
                    "quantity": quantity
                }

                results_by_store.setdefault(store.name, []).append(entry)

        return {
            "results": results_by_store,
            "errors": errors
        }
