from flask import Blueprint, jsonify
from src.infrastructure.database.database import get_db
from src.domain.entities.item import Item
from src.infrastructure.database.repository_factory import get_repository
from sqlalchemy.orm import Session

bp = Blueprint('items', __name__, url_prefix='/items')

@bp.route('/', methods=['GET'], endpoint='get_items')
def get_items():
    """
    Get all items with optional filtering
    Query parameters:
    - category: Filter by category
    - brand: Filter by brand
    - page: Page number (default: 1)
    - per_page: Items per page (default: 20, max: 100)
    """
    db: Session = next(get_db())
    try:
        # Get query parameters
        from flask import request
        category = request.args.get('category')
        brand = request.args.get('brand')
        page = max(1, int(request.args.get('page', 1)))
        per_page = min(100, max(1, int(request.args.get('per_page', 20))))


        # Create filter dictionary
        filters = {}
        if category:
            filters['category'] = category
        if brand:
            filters['brand'] = brand
        
        # Get repository and query items
        repo = get_repository(Item, session=db)
        print("Route session:", db)
        print("Repo session:", repo.session)
        # Get paginated results
        items = repo.get_paginated(
            page=page,
            per_page=per_page,
            order_by='name',
            **filters
        )

        
        # Get total count for pagination
        total_count = repo.count(**filters)
        
        # Prepare response
        response = {
            'items': [item.to_dict() for item in items],
            'pagination': {
                'page': page,
                'per_page': per_page,
                'total_items': total_count,
                'total_pages': (total_count + per_page - 1) // per_page
            }
        }
        
        return jsonify(response), 200
        
    except Exception as e:
        db.rollback()  # <<< Prevent aborted transaction issues
        return jsonify({'error': str(e)}), 500

    finally:
        db.close()

@bp.route('/<item_id>', methods=['GET'])
def get_item(item_id: str):
    """Get a single item by ID"""
    db: Session = next(get_db())
    try:
        repo = get_repository(Item)
        item = repo.get_by_id(item_id)
        
        if not item:
            return jsonify({'error': 'Item not found'}), 404
            
        return jsonify(item.to_dict()), 200
        
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        db.close()
