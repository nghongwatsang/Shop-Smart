from flask import Blueprint, request, jsonify
from typing import Tuple, Optional
from src.application.services.route_service import RouteService

# Create a new blueprint for route-related endpoints
route_bp = Blueprint('routes', __name__)

@route_bp.route('/route', methods=['GET'])
def get_route():
    """
    Calculate route information between two points
    
    Query Parameters:
        start_lat: Starting latitude (required)
        start_lng: Starting longitude (required)
        end_lat: Destination latitude (required)
        end_lng: Destination longitude (required)
        
    Returns:
        JSON response with distance (miles) and duration (minutes)
    """
    try:
        # Get coordinates from query parameters
        start_lat = float(request.args.get('start_lat'))
        start_lng = float(request.args.get('start_lng'))
        storeName = request.args.get('store_name')
        
        # Validate coordinates
        if not (-90 <= start_lat <= 90) or not (-180 <= start_lng <= 180):
            raise ValueError("Invalid start coordinates")
        if not (-90 <= end_lat <= 90) or not (-180 <= end_lng <= 180):
            raise ValueError("Invalid end coordinates")
            
        start = (start_lat, start_lng)
        end = (end_lat, end_lng)
        
        # Get route information
        result = RouteService.get_route_info(start, end)
        
        if result.get('status') == 'error':
            return jsonify({
                'status': 'error',
                'message': result.get('message', 'Failed to calculate route')
            }), 400
            
        return jsonify({
            'status': 'success',
            'data': {
                'start': {'lat': start_lat, 'lng': start_lng},
                'end': {'lat': end_lat, 'lng': end_lng},
                'distance_miles': result['distance_miles'],
                'duration_minutes': result['duration_minutes']
            }
        })
        
    except (ValueError, TypeError) as e:
        return jsonify({
            'status': 'error',
            'message': 'Invalid parameters. Please provide valid latitude and longitude values.'
        }), 400
    except Exception as e:
        return jsonify({
            'status': 'error',
            'message': 'An unexpected error occurred'
        }), 500
