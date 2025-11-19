from flask import Blueprint, request, jsonify
from src.application.services.route_service import RouteService
from src.domain.entities.store import Store
from src.domain.entities.address import Address
from src.infrastructure.database.database import get_db

# Create a new blueprint for route-related endpoints
route_bp = Blueprint('routes', __name__)

@route_bp.route('/route', methods=['GET'])
def get_route():
    try:
        # ---- Required query params ----
        start_lat = request.args.get('start_lat', type=float)
        start_lng = request.args.get('start_lng', type=float)
        store_name = request.args.get('store_name', type=str)

        if start_lat is None or start_lng is None:
            raise ValueError("Missing start_lat or start_lng")

        if not store_name:
            raise ValueError("Missing store_name")

        # Validate coords
        if not (-90 <= start_lat <= 90) or not (-180 <= start_lng <= 180):
            raise ValueError("Invalid start coordinates")

        # ---- DB Lookup ----
        db_gen = get_db()
        db = next(db_gen)

        q = (
            db.query(Store)
            .join(Address, Store.address_id == Address.id)
            .filter(Store.name.ilike(f"%{store_name}%"))
        )

        from sqlalchemy.dialects import postgresql

        print(
            q.statement.compile(
                dialect=postgresql.dialect(),
                compile_kwargs={"literal_binds": True}
            )
        )

        store = q.first()



        print(f"Found store: {store}")
        if not store:
            raise ValueError("Store not found")

        if store.address.latitude is None or store.address.longitude is None:
            raise ValueError("Store coordinates not found")

        end_lat = store.address.latitude
        end_lng = store.address.longitude

        start = (start_lat, start_lng)
        end = (end_lat, end_lng)

        # ---- Route calculation ----
        result = RouteService.get_route_info(start, end)

        if result.get('status') == 'error':
            return jsonify({
                "status": "error",
                "message": result.get("message", "Failed to calculate route")
            }), 400

        return jsonify({
            "status": "success",
            "data": {
                "start": {"lat": start_lat, "lng": start_lng},
                "end": {"lat": end_lat, "lng": end_lng},
                "distance_miles": result["distance_miles"],
                "duration_minutes": result["duration_minutes"]
            }
        }), 200

    except (ValueError, TypeError) as e:
        return jsonify({
            "status": "error",
            "message": str(e)
        }), 400
    except Exception as e:
        return jsonify({
            "status": "error",
            "message": str(e)
        }), 500
