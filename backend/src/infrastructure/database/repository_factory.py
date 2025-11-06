from sqlalchemy.orm import Session
from .sqlalchemy_repository import SQLAlchemyRepository

def get_repository(model_class, session: Session):
    return SQLAlchemyRepository(session=session, model_class=model_class)
