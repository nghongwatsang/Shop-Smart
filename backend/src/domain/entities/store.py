from sqlalchemy import Column, String, ForeignKey
from sqlalchemy.orm import relationship
from src.infrastructure.database.database import Base
import uuid

class Store(Base):
    __tablename__ = 'store'
    
    id = Column(String, primary_key=True, default=lambda: str(uuid.uuid4()))
    name = Column(String, nullable=False)
    address_id = Column(String, ForeignKey('address.id'))
    
    # Relationships
    address = relationship("Address", back_populates="stores")
    prices = relationship("ItemPrice", back_populates="store")
    
    def to_dict(self):
        return {
            'id': self.id,
            'name': self.name,
            'address_id': self.address_id,
            'address': self.address.to_dict() if self.address else None
        }
