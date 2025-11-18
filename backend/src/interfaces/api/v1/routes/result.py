from flask import Blueprint, jsonify, request
from src.infrastructure.database.database import get_db
from src.application.services.result_service import CartPricingService

bp = Blueprint('result', __name__, url_prefix='/result')

@bp.route('/', methods=['POST'], endpoint='get_results')
def get_results():
    db_gen = get_db()
    db = next(db_gen)

    try:
        items = request.get_json()
        if not isinstance(items, list):
            return jsonify({"error": "Expected list"}), 400

        service = CartPricingService(db)
        result = service.get_prices_for_cart(items)

        return jsonify(result), 200

    finally:
        try:
            next(db_gen)
        except StopIteration:
            pass
