from sqlalchemy import Column, String, Float
from sqlalchemy.orm import relationship
from src.infrastructure.database.database import Base
import uuid

class Address(Base):
    __tablename__ = 'address'
    
    id = Column(String, primary_key=True, default=lambda: str(uuid.uuid4()))
    street = Column(String)
    city = Column(String)
    state = Column(String)
    postal_code = Column(String)
    country = Column(String)
    latitude = Column(Float)
    longitude = Column(Float)
    
    # Relationships
    stores = relationship("Store", back_populates="address")
    
    def to_dict(self):
        return {
            'id': self.id,
            'street': self.street,
            'city': self.city,
            'state': self.state,
            'postal_code': self.postal_code,
            'country': self.country,
            'latitude': self.latitude,
            'longitude': self.longitude
        }
