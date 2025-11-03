from flask import Blueprint, jsonify
from src.interfaces.api.v1 import api_v1_bp

# Create main API blueprint
api_bp = Blueprint('api', __name__)

# Register version 1 blueprint
api_bp.register_blueprint(api_v1_bp, url_prefix='/v1')

@api_bp.route('/health', methods=['GET'])
def health_check():
    """Health check endpoint"""
    return jsonify({
        'status': 'ok',
        'message': 'Service is running',
        'version': '1.0.0'
    })
