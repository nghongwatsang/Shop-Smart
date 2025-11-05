from abc import ABC, abstractmethod
from typing import TypeVar, Generic, List, Optional, Type, Any

T = TypeVar('T')

class BaseRepository(Generic[T], ABC):
    @abstractmethod
    def get_by_id(self, id: Any) -> Optional[T]:
        raise NotImplementedError
    
    @abstractmethod
    def get_all(self) -> List[T]:
        raise NotImplementedError
    
    @abstractmethod
    def create(self, entity: T) -> T:
        raise NotImplementedError
    
    @abstractmethod
    def update(self, entity: T) -> T:
        raise NotImplementedError
    
    @abstractmethod
    def delete(self, id: Any) -> bool:
        raise NotImplementedError
    
    @abstractmethod
    def filter_by(self, **filters) -> List[T]:
        raise NotImplementedError
    
    @abstractmethod
    def get_first(self, **filters) -> Optional[T]:
        raise NotImplementedError
