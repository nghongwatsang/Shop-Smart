from flask import Blueprint
from .routes.route_routes import route_bp
from .routes.items import bp as items_bp
from .routes.search import bp as search_bp
from .routes.result import bp as result_bp
from .routes.categories import bp as categories_bp

# Create API v1 blueprint
api_v1_bp = Blueprint('api_v1', __name__)

# Register route blueprints
api_v1_bp.register_blueprint(route_bp)
api_v1_bp.register_blueprint(items_bp)
api_v1_bp.register_blueprint(search_bp)
api_v1_bp.register_blueprint(result_bp)
api_v1_bp.register_blueprint(categories_bp)
