from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, scoped_session
import os
from dotenv import load_dotenv

load_dotenv()

# Database configuration
# Use 'db' as the host when running in Docker, 'localhost' otherwise
DB_HOST = 'db' if os.getenv('DOCKER_CONTAINER') == 'true' else 'localhost'
DATABASE_URL = os.getenv('DATABASE_URL', f'postgresql://shopuser:shoppass@{DB_HOST}:5432/shopdb')

# Create the SQLAlchemy engine
engine = create_engine(DATABASE_URL, pool_pre_ping=True)

# Create a configured "Session" class
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# Create a scoped session factory
ScopedSession = scoped_session(SessionLocal)

# Base class for models
Base = declarative_base()

def get_db():
    """
    Dependency function to get DB session.
    Use this in your FastAPI route dependencies.
    """
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

def get_repository(session, model_class):
    """
    Helper function to get a repository instance for a model.
    """
    from .sqlalchemy_repository import SQLAlchemyRepository
    return SQLAlchemyRepository(session, model_class)
