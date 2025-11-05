#!/bin/bash

# Wait for PostgreSQL to be ready
echo "Waiting for PostgreSQL to be ready..."
until docker exec shop-smart-db-1 pg_isready -U shopuser -d shopdb >/dev/null 2>&1; do
  echo -n "."
  sleep 1
done
echo -e "\nPostgreSQL is ready!"

# Create tables
echo "Creating database tables..."
docker exec -i shop-smart-db-1 psql -U shopuser -d shopdb -c "
CREATE TABLE IF NOT EXISTS address (
  id UUID PRIMARY KEY,
  street TEXT,
  city TEXT,
  state TEXT,
  postal_code TEXT,
  country TEXT,
  latitude DOUBLE PRECISION,
  longitude DOUBLE PRECISION
);

CREATE TABLE IF NOT EXISTS store (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  addressid UUID REFERENCES address(id)
);

CREATE TABLE IF NOT EXISTS item (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  brand TEXT,
  category TEXT,
  product_url TEXT,
  size DOUBLE PRECISION,
  unit TEXT
);

CREATE TABLE IF NOT EXISTS itemprice (
  id UUID PRIMARY KEY,
  itemid UUID REFERENCES item(id),
  storeid UUID REFERENCES store(id),
  price DOUBLE PRECISION
);"

echo "Importing data..."
# Create a modified SQL file with lowercase table names
sed 's/"Item"/item/g; s/"Store"/store/g; s/"Address"/address/g; s/"ItemPrice"/itemprice/g; s/"itemId"/itemid/g; s/"storeId"/storeid/g; s/"addressId"/addressid/g' database_inserts.sql > database_inserts_fixed.sql

# Copy the fixed SQL file to the container
docker cp database_inserts_fixed.sql shop-smart-db-1:/tmp/database_inserts_fixed.sql
# Execute the fixed SQL file inside the container
docker exec -i shop-smart-db-1 psql -U shopuser -d shopdb -f /tmp/database_inserts_fixed.sql

echo "Database setup complete!"
