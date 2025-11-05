from typing import Dict, Type, Any
from sqlalchemy.orm import Session
from .sqlalchemy_repository import SQLAlchemyRepository

class RepositoryRegistry:
    _repositories: Dict[Type, Any] = {}
    _session: Session = None
    
    @classmethod
    def initialize(cls, session: Session):
        """Initialize the registry with a database session"""
        cls._session = session
    
    @classmethod
    def get_repository(cls, model_class: Type) -> SQLAlchemyRepository:
        """Get or create a repository for a model class"""
        if model_class not in cls._repositories:
            cls._repositories[model_class] = SQLAlchemyRepository(cls._session, model_class)
        return cls._repositories[model_class]
    
    @classmethod
    def clear(cls):
        """Clear all repositories (useful for testing)"""
        cls._repositories.clear()

# Shortcut function for easier access
def get_repository(model_class: Type) -> SQLAlchemyRepository:
    """Get a repository for the given model class"""
    if not RepositoryRegistry._session:
        raise RuntimeError("RepositoryRegistry not initialized. Call RepositoryRegistry.initialize(session) first.")
    return RepositoryRegistry.get_repository(model_class)
