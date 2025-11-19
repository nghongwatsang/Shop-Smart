from flask import Blueprint, jsonify
from src.infrastructure.database.database import get_db
from src.domain.entities.item import Item
from src.infrastructure.database.repository_factory import get_repository
from sqlalchemy.orm import Session

bp = Blueprint('categories', __name__, url_prefix='/categories')

@bp.route('/', methods=['GET'], endpoint='get_categories')
def get_categories():
    try:
        db_gen = get_db()
        db: Session = next(db_gen)

        from sqlalchemy import func

        # Query categories grouped & sorted by count
        query = (
            db.query(Item.category)
              .group_by(Item.category)
              .order_by(func.count(Item.category).desc())
        )

        categories = [row[0] for row in query.all()]

        return jsonify({"categories": categories}), 200

    except Exception as e:
        return jsonify({"error": str(e)}), 500

    finally:
        try:
            next(db_gen)
        except StopIteration:
            pass
