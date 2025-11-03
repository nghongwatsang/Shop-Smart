from flask import Blueprint, jsonify

# Create API v1 blueprint
api_v1_bp = Blueprint('api_v1', __name__)

@api_v1_bp.route('/example', methods=['GET'])
def example_endpoint():
    """Example API endpoint"""
    return jsonify({
        'message': 'This is an example endpoint',
        'version': 'v1'
    })
