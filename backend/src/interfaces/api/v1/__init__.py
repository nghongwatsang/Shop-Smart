from flask import Blueprint
from .routes.route_routes import route_bp
from .routes.items import bp as items_bp

# Create API v1 blueprint
api_v1_bp = Blueprint('api_v1', __name__)

# Register route blueprints
api_v1_bp.register_blueprint(route_bp)
api_v1_bp.register_blueprint(items_bp)
