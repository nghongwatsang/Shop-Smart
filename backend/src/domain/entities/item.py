from sqlalchemy import Column, String, Float
from sqlalchemy.orm import relationship
from src.infrastructure.database.database import Base
import uuid

class Item(Base):
    __tablename__ = 'item'
    
    id = Column(String, primary_key=True, default=lambda: str(uuid.uuid4()))
    name = Column(String, nullable=False)
    brand = Column(String)
    category = Column(String)
    product_url = Column(String)
    size = Column(Float)
    unit = Column(String)
    
    # Relationship
    prices = relationship("ItemPrice", back_populates="item")
    
    def to_dict(self):
        return {
            'id': self.id,
            'name': self.name,
            'brand': self.brand,
            'category': self.category,
            'product_url': self.product_url,
            'size': self.size,
            'unit': self.unit
        }
