from src.infrastructure.database.database import engine, Base
from src.domain.entities.address import Address
from src.domain.entities.store import Store
from src.domain.entities.item import Item
from src.domain.entities.item_price import ItemPrice

def init_db():
    print("Creating database tables...")
    Base.metadata.create_all(bind=engine)
    print("Database tables created successfully!")

if __name__ == "__main__":
    init_db()
