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
);