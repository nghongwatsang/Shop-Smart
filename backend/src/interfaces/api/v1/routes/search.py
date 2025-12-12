from flask import Blueprint, jsonify, request
from sqlalchemy.orm import Session
from sqlalchemy import or_, func
from src.infrastructure.database.database import get_db
from src.domain.entities.item import Item
from src.domain.entities.item_price import ItemPrice
from src.domain.entities.store import Store

bp = Blueprint('search', __name__, url_prefix='/search')

@bp.route('/', methods=['GET'], endpoint="search_items")
def search_items():
    db: Session = next(get_db())
    try:
        query = request.args.get('query', '').strip()
        page = max(1, int(request.args.get('page', 1)))
        per_page = min(100, max(1, int(request.args.get('per_page', 20))))
        pattern = f"%{query.strip('\"')}%"

        # Subquery to get the minimum price per item combination
        subquery = (
            db.query(
                ItemPrice.itemid,
                func.min(ItemPrice.price).label("min_price")
            )
            .group_by(ItemPrice.itemid)
            .subquery()
        )

        # Main query: join Item, ItemPrice, Store, and the min price subquery
        base_query = (
            db.query(
                Item.name,
                Item.brand,
                Item.size,
                Item.unit,
                ItemPrice.price,
                Store.name.label("store_name")
            )
            .join(ItemPrice, Item.id == ItemPrice.itemid)
            .join(Store, Store.id == ItemPrice.storeid)
            .join(subquery, (ItemPrice.itemid == subquery.c.itemid) & (ItemPrice.price == subquery.c.min_price))
            .filter(
                or_(
                    Item.name.ilike(pattern),
                    Item.category.ilike(pattern),
                    Item.brand.ilike(pattern)
                )
            )
            .order_by(ItemPrice.price.asc())
        )

        # Pagination
        results = base_query.offset((page - 1) * per_page).limit(per_page).all()
        total = base_query.count()

        return jsonify({
            "items": [
                {
                    "name": row.name,
                    "brand": row.brand,
                    "price": row.price,
                    "size": row.size,
                    "unit": row.unit,
                    "store": row.store_name
                }
                for row in results
            ],
            "pagination": {
                "page": page,
                "per_page": per_page,
                "total_items": total,
                "total_pages": (total + per_page - 1) // per_page
            }
        }), 200

    except Exception as e:
        db.rollback()
        return jsonify({"error": str(e)}), 500

    finally:
        db.close()
