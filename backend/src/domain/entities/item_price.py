from sqlalchemy import Column, String, Float, ForeignKey
from sqlalchemy.orm import relationship
from src.infrastructure.database.database import Base
import uuid

class ItemPrice(Base):
    __tablename__ = 'itemprice'
    
    id = Column(String, primary_key=True, default=lambda: str(uuid.uuid4()))
    item_id = Column(String, ForeignKey('item.id'))
    store_id = Column(String, ForeignKey('store.id'))
    price = Column(Float, nullable=False)
    
    # Relationships
    item = relationship("Item", back_populates="prices")
    store = relationship("Store", back_populates="prices")
    
    def to_dict(self):
        return {
            'id': self.id,
            'item_id': self.item_id,
            'store_id': self.store_id,
            'price': self.price,
            'item': self.item.to_dict() if self.item else None,
            'store': self.store.to_dict() if self.store else None
        }
