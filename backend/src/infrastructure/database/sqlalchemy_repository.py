from typing import Type, TypeVar, List, Optional, Any, Dict, Generic
from sqlalchemy.orm import Session
from sqlalchemy import desc, asc
from ...domain.repositories.base_repository import BaseRepository

T = TypeVar('T')

class SQLAlchemyRepository(BaseRepository[T]):
    def __init__(self, session: Session, model_class: Type[T]):
        self.session = session
        self.model_class = model_class
    
    def get_by_id(self, id: Any) -> Optional[T]:
        return self.session.query(self.model_class).get(id)
    
    def get_all(self) -> List[T]:
        return self.session.query(self.model_class).all()
    
    def create(self, entity: T) -> T:
        self.session.add(entity)
        self.session.commit()
        self.session.refresh(entity)
        return entity
    
    def update(self, entity: T) -> T:
        self.session.merge(entity)
        self.session.commit()
        self.session.refresh(entity)
        return entity
    
    def delete(self, id: Any) -> bool:
        entity = self.get_by_id(id)
        if entity:
            self.session.delete(entity)
            self.session.commit()
            return True
        return False
    
    def filter_by(self, **filters) -> List[T]:
        query = self.session.query(self.model_class)
        return query.filter_by(**filters).all()
    
    def get_first(self, **filters) -> Optional[T]:
        query = self.session.query(self.model_class)
        return query.filter_by(**filters).first()
    
    def get_paginated(
        self,
        page: int = 1,
        per_page: int = 10,
        order_by: str = 'id',
        desc_order: bool = False,
        **filters
    ) -> List[T]:
        query = self.session.query(self.model_class)

        # Apply partial case-insensitive filters (ILIKE)
        for field, value in filters.items():
            if hasattr(self.model_class, field):
                column = getattr(self.model_class, field)
                query = query.filter(column.ilike(f"%{value}%"))

        # Apply ordering
        if hasattr(self.model_class, order_by):
            column = getattr(self.model_class, order_by)
            query = query.order_by(desc(column) if desc_order else asc(column))

        # Apply pagination
        return query.offset((page - 1) * per_page).limit(per_page).all()

    
    def count(self, **filters) -> int:
        query = self.session.query(self.model_class)
        if filters:
            query = query.filter_by(**filters)
        return query.count()
