from flask import Blueprint, jsonify, request
from src.infrastructure.database.database import get_db
from src.application.services.result_service import CartPricingService

bp = Blueprint('result', __name__, url_prefix='/results')

@bp.route('/', methods=['POST'], endpoint='get_results')
def get_results():
    print("Start")
    db_gen = get_db()
    db = next(db_gen)

    try:
        payload = request.get_json()

        if not payload:
            return jsonify({"error": "Missing JSON body"}), 400

        items = payload.get("items", [])
        if not isinstance(items, list):
            return jsonify({"error": "items must be a list"}), 400
            
        allowed_stores = payload.get("allowedStores", [])
        if not isinstance(allowed_stores, list):
            return jsonify({"error": "allowedStores must be a list"}), 400
            
        service = CartPricingService(db)
        print("Entering Service")
        result = service.get_prices_for_cart(items, allowed_stores=allowed_stores)

        return jsonify(result), 200

    finally:
        try:
            next(db_gen)
        except StopIteration:
            pass

# try:
#         payload = request.get_json()

#         if not payload:
#             return jsonify({"error": "Missing JSON body"}), 400

#         # --- Extract allowedStores list ---
#         allowed_stores = payload.get("allowedStores", [])
#         if not isinstance(allowed_stores, list):
#             return jsonify({"error": "allowedStores must be a list"}), 400

#         # --- Extract items list ---
#         items = payload.get("items")
#         if not isinstance(items, list):
#             return jsonify({"error": "items must be a list"}), 400

#         # --- Process ---
#         service = CartPricingService(db)
#         result = service.get_prices_for_cart(
#             items,
#             allowed_stores=allowed_stores
#         )

#         return jsonify(result), 200

#     finally:
#         try:
#             next(db_gen)
#         except StopIteration:
#             pass