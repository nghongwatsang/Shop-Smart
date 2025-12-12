from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flask_cors import CORS
import os
from dotenv import load_dotenv

db = SQLAlchemy()
migrate = Migrate()

def create_app():
    # Load environment variables
    load_dotenv()
    
    # Create and configure the app
    app = Flask(__name__)
    
    # Configuration
    app.config['SECRET_KEY'] = os.getenv('SECRET_KEY', 'dev')
    app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv('DATABASE_URL', 'postgresql://shopuser:shoppass@localhost:5432/shopdb')
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    
    # Initialize extensions
    db.init_app(app)
    migrate.init_app(app, db)
    CORS(app, 
        resources={r"/*": {"origins": "*"}},
        supports_credentials=True,
        allow_headers="*",
        methods=["GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS"]
    )

    
    # Import models to ensure they are registered with SQLAlchemy
    from src.domain.entities.address import Address
    from src.domain.entities.store import Store
    from src.domain.entities.item import Item
    from src.domain.entities.item_price import ItemPrice
    
    # Register blueprints
    from src.interfaces.api.v1 import api_v1_bp
    app.register_blueprint(api_v1_bp, url_prefix=os.getenv('API_PREFIX', '/api/v1'))
    
    return app
