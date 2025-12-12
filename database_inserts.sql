-- Addresses
INSERT INTO Address (id, street, city, state, postal_code, country, latitude, longitude)
VALUES ('8040dba8-a7f4-45f2-bc98-c725099dbda4', '662 Hoosick Rd', 'Troy', 'NY', 
        '12180', 'USA', 42.7415351, -73.6495478);
INSERT INTO Address (id, street, city, state, postal_code, country, latitude, longitude)
VALUES ('484452b7-dfb1-4acb-b64a-2a4db02e24fe', '9 Lord Ave', 'Troy', 'NY', 
        '12180', 'USA', 42.7438908, -73.6519795);
INSERT INTO Address (id, street, city, state, postal_code, country, latitude, longitude)
VALUES ('9d91a547-8ef1-438e-86b2-a7b26bf09a5f', '675 Troy-Schenectady Rd', 'Latham', 'NY', 
        '12110', 'USA', 42.74909, -73.770139);

-- Stores
INSERT INTO Store (id, name, "addressId")
VALUES ('2b05b779-8779-4bd5-b3b9-97a6cf193f66', 'Aldi', '8040dba8-a7f4-45f2-bc98-c725099dbda4');
INSERT INTO Store (id, name, "addressId")
VALUES ('4d58504f-2d00-457e-8340-150635883ce0', 'Hannafords', '484452b7-dfb1-4acb-b64a-2a4db02e24fe');
INSERT INTO Store (id, name, "addressId")
VALUES ('169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 'Target', '9d91a547-8ef1-438e-86b2-a7b26bf09a5f');

-- Items
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('db177b0c-cd54-4460-bb80-1377db92c2f2', 'Original Kettle Chips', 'Clancy''s', 
        'Chips, Crackers & Popcorn',  8.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('e6760b34-66d5-4c60-8dbe-68758cd7e80d', 'Blueberry Breakfast Biscuits', 'Benton''s', 
        'Cookies & Sweets',  8.8, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('e41f5a58-849d-4f15-ba87-e4083998b6f3', 'Organic Unrefined Coconut Oil', 'Simply Nature', 
        'Oils & Vinegars',  14.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('617cb80c-96e2-4961-bec6-f3264e0eb561', 'Plain Whole Milk Greek Yogurt', 'Friendly Farms', 
        'Yogurt & Sour Cream',  32.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('efbc4488-f03c-4b71-a757-802054b85513', 'Wild Caught Frozen Pink Salmon', 'Fremont Fish Market', 
        'Frozen Meat, Poultry & Seafood',  16.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('27e1fc35-d335-4f8b-8d52-d9da47ba7ff5', 'Parsley Flakes', 'Stonemill', 
        'Spices',  0.25, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('092bfaa3-bd2e-4dcc-a96b-489c4e4546f3', 'Italian Meatballs', 'Bremer', 
        'Mother''s Day Meal Ideas',  32.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('705fc9f9-d173-4beb-9723-39bd674b8dea', 'Garlic Powder', 'Stonemill', 
        'Spices',  3.12, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('a3fe9f2d-2a9f-489a-8050-166983349f9f', 'Nonfat Plain Greek Yogurt', 'Friendly Farms', 
        'Healthy Food & Snacks',  32.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('4e031df5-e44f-4e06-a88c-9d898bc6b889', 'Organic Whole Wheat Spaghetti', 'Simply Nature', 
        'Pasta, Rice & Grains',  16.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('fedcdbe0-4511-4cbc-9211-5333773581b8', 'Cinnamon Raisin Bagels', 'L''oven Fresh', 
        'Back to School Breakfast',  20.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('48bcfb22-4334-4cc6-99a7-eae1245fbe36', 'Brown Gravy Mix', 'Stonemill', 
        'Sauces & Salsa',  0.87, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('68f34a63-b028-4a63-8824-e9ea9769c41f', 'Reduced Sodium Taco Seasoning Mix', 'Casa Mamita', 
        'Spices',  1.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('8da3eff1-57a3-4b06-b679-7cf570215bf3', 'Crispy Rice Cereal', 'Millville', 
        'Cereal & Oatmeal',  12.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('b08b2071-ffe9-4da9-8f82-f98489984ac3', 'Roasted Garlic Balsamic Vinaigrette Dressing', 'Specially Selected', 
        'Condiments & Dressings',  NULL, 'Not specified');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('d8744e20-629c-49ce-8228-26c627c228dc', 'French Dark Roast Coffee Pods', 'Barissimo', 
        'Coffee',  12.0, 'count');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('7ab895e0-21c1-4ea1-8bee-3041aece4848', 'Ranch Salad Dressing and Seasoning Mix', 'Tuscan Garden', 
        'Spices',  1.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('0258ebd1-4d1c-4d89-8d2a-7bb7bf1ab784', 'Chocolate Chip Cookies', 'Benton''s', 
        'Cookies & Sweets',  13.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('3ce5561c-1283-45f7-ad27-a35959188a80', 'Roasted Red Pepper Topped Hummus', 'Park Street Deli', 
        'Healthy Food & Snacks',  10.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('0c4cb5c1-6a00-4c53-8782-323bcec8f91b', 'Bratwurst', 'Beer', 
        'Fresh Sausage',  19.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('b2680c55-e6d1-451f-81aa-4eec05996632', 'Raspberry Strip Danish', 'Bake Shop', 
        'Easter Brunch',  14.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('44812c68-4e4d-405e-b2df-c4c2a13bb30f', 'Italian Salad Dressing and Seasoning Mix', 'Tuscan Garden', 
        'Spices',  0.7, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('ddce0a30-721f-422e-a654-65ed72c7809f', 'Spaghetti', 'Reggano', 
        'Pasta, Rice & Grains',  32.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('059acf73-ac6e-4e49-993a-ce5ecf3fcc08', 'Medium Cooked in Shell Shrimp', 'Fremont Fish Market', 
        'Frozen Meat, Poultry & Seafood',  12.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('cb719244-040a-4436-a7b6-3092507c202b', 'Ultimate Cheeseburger Cheesy Skillet Dinner Kit', 'Reggano', 
        'Boxed Meals & Side Dishes',  12.8, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('11f4c695-13c8-4907-a397-198c333d7a3d', 'Large Cooked Shrimp', 'Fremont Fish Market', 
        'Chefs Best Excellence Award',  12.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('ebbc4cf6-359e-4897-a256-1bd0b710ad16', 'Value Pack Cod Fillets', 'Fremont Fish Market', 
        'Frozen Meat, Poultry & Seafood',  32.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('9d1a7a14-c1f0-44da-bd7e-33cb5680936d', 'Flounder Fillets', 'Fremont Fish Market', 
        'St. Patrick''s Day',  16.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('f09c517d-101e-4f29-8aec-e720b3eafb37', 'Spicy Hummus', 'Park Street Deli', 
        'Healthy Food & Snacks',  10.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('80897074-8a48-4436-b1fb-c1e2635e208f', 'Olive Tapenade Hummus', 'Park Street Deli', 
        'Healthy Food & Snacks',  10.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('4e5193e8-1453-4aac-bd7e-4c5f79d5971a', 'Spinach Parmesan Tzatziki Dip', 'Park Street Deli', 
        'Dorm Room Meals & Snacks',  10.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('25640b66-5678-4cbd-8244-5e16d3cd4bb1', 'Cucumber Dill Tzatziki Dip', 'Park Street Deli', 
        'Dorm Room Meals & Snacks',  10.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('44a8d109-bc1b-499f-82f6-5184d3c60f14', 'Swiss Almond Spreadable Cheese Cup', 'Happy Farms', 
        'Seasonal',  12.9, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('66d00708-2847-4847-ba4a-698b272c728e', 'Milk Chocolate Butter Cookies', 'Specially Selected', 
        'Cookies & Sweets',  4.41, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('814b5bd5-81d2-488d-8d4e-9360988759be', 'Sharp Cheddar Cheese Spread', 'Emporium Selection', 
        'Mother''s Day Meal Ideas',  6.5, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('f689c25a-7cc7-44ea-bfe6-6e0c4c5093ea', 'Garlic & Herb Gourmet Spreadable Cheese', 'Emporium Selection', 
        'Mother''s Day Meal Ideas',  6.5, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('2c02a9fa-77c0-495f-a096-af61d88b9d16', 'Peppercorn Parmesan Cheese Spread', 'Emporium Selection', 
        'Mother''s Day Meal Ideas',  6.5, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('23c2571e-f29a-47b6-8ee5-191c4929e909', 'Pre Sliced Hot Dog Buns', 'L''oven Fresh', 
        'Cookout Essentials',  11.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('fd7d519b-e74e-41c6-afbe-d90c484bdf8c', 'Steamable Frozen Asparagus Spears', 'Season''s Choice', 
        'Frozen Vegetables',  8.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('42413112-5be5-472b-8ffc-a2b5b739d433', 'Mint Chocolate Chip Ice Cream', 'Sundae Shoppe', 
        'Frozen Ice Cream & Desserts',  NULL, 'Not specified');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('ed2218e6-841f-46f9-a26e-0fd462173ebe', 'Classic Hummus Single Serve Mini Cups', 'Park Street Deli', 
        'Dips & Hummus',  12.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('201c4da9-a6d5-455d-9440-65d3ab0c1f77', 'Uncured Beef Franks', 'Parkview', 
        'Grilled Meat & Seafood',  15.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('5e2a6983-fb76-4497-9692-411d68f2db44', 'Honey Graham Squares', 'Millville', 
        'Cereal & Oatmeal',  12.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('427fe77c-f2d2-43f0-a779-0b9b3abe0c3f', 'Organic Apple Cider Vinegar', 'Simply Nature', 
        'Oils & Vinegars',  NULL, 'Not specified');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('f15d4a7e-e5f2-4027-9a36-c40e0c9ad078', 'Condensed Cream of Chicken Soup', 'Chef''s Cupboard', 
        'Soups & Broth',  10.5, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('e70da2c3-6f73-460d-9a0c-0df05391d961', 'Fat Free Beef Broth', 'Chef''s Cupboard', 
        'Soups & Broth',  32.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('31962d72-497c-4382-abd3-b278d22ad642', 'Fat Free Beef Cooking Stock', 'Chef''s Cupboard', 
        'Soups & Broth',  32.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('7c8657cd-7cbb-4b02-a005-143fd3ead9fe', 'Organic Low Sodium Chicken Broth', 'Simply Nature', 
        'Soups & Broth',  32.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('dc639576-f8fe-4757-86f8-4d9917a924ea', 'Almond', 'Southern Grove', 
        'Trail Mix',  15.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('42e4b4cb-3bf7-46ce-803e-878b685bf3bd', 'Sweet & Salty Trail Mix', 'Southern Grove', 
        'Trail Mix',  8.0, 'count');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('a7e4d05c-75c0-47aa-96c3-dd4f6d6cf1cd', 'Chicken Breast Nuggets', 'Kirkwood', 
        'Halloween Themed Food',  29.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('98074393-af6d-49d5-b15f-e14a50ba9d9b', 'Frozen Steam Cut Green Beans', 'Season''s Choice', 
        'Frozen Vegetables',  12.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('48a7b61b-fba8-4bbb-916d-70884c349010', 'Steamable Frozen Mixed Vegetable', 'Season''s Choice', 
        'Frozen Vegetables',  12.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('b6b6c563-c798-43d0-ad82-8d6c56181ee9', 'Steamable Frozen Sweet Garden Peas', 'Season''s Choice', 
        'Frozen Vegetables',  12.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('10de16c7-21f0-4c4b-8618-7991d4fd9207', 'Jumbo EZ Peel Raw Shrimp', 'Fremont Fish Market', 
        'Frozen Meat, Poultry & Seafood',  12.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('38afe0ee-c83d-456f-8bde-b7007e08cedb', 'Jumbo Cooked Shrimp', 'Fremont Fish Market', 
        'Chefs Best Excellence Award',  12.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('187c8126-5fe4-48ce-8c41-550c91033f38', 'Organic Garlic Powder', 'Simply Nature', 
        'Spices',  2.5, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('8a9ae54a-6c7c-42bd-adb3-83cbebd07997', 'Classic Single Guacamole - 6 Mini Cups', 'Park Street Deli', 
        'Dorm Room Meals & Snacks',  12.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('4c10d690-1b0c-43e2-9417-5484463ab1fd', 'Red Pepper Hummus Single Serve Mini Cups', 'Park Street Deli', 
        'Dips & Hummus',  12.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('3910a284-52c6-427d-9807-b1ab49855e09', 'Fair Trade Organic Guatemalan Light Roast Coffee Pods', 'Simply Nature', 
        'Good Housekeeping Nutritionist Approved Emblem',  12.0, 'count');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('84623346-aa5d-483b-b351-38968bb02e3b', 'Original Sloppy Joe Sauce', 'Brookdale', 
        'Sauces & Salsa',  15.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('8a22ce7b-5c71-439c-bea0-6b58e5ed38b0', 'Casera Amarillas Tostadas', 'Pueblo Lindo', 
        'Tortillas & Flatbread',  12.8, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('ed448d61-fe5e-4fa3-afaf-da6dc6c1258f', 'Flour Tortillas', 'Pueblo Lindo', 
        'Back to School Lunches',  17.5, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('c0d47e13-dbc7-4363-bcc4-d726f9a4593b', 'USDA Organic Black Beans', 'Simply Nature', 
        'Canned Foods',  15.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('101c2330-fbe1-40c6-b0c3-24e1dd6b811e', 'Fajita Flour Tortillas', 'Pueblo Lindo', 
        'Tortillas & Flatbread',  23.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('f574b259-c79f-406a-b8a5-91280605f94d', 'Vitality Cereal Vanilla Almond', 'Fit & Active', 
        'Cereal & Oatmeal',  12.4, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('6c5d4a0a-f1cc-4e47-aa74-6b5ea3189804', 'Mini Chocolate Bars', 'ChoceurMilk', 
        'Cookies & Sweets',  1.4, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('ed0d51a5-6823-4d45-bca1-0f236de06051', 'Chocolate Chunk Cookies', 'Bake Shop', 
        'Halloween Themed Food',  14.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('154d4e07-4b19-4c5d-be77-8cc6c0c193fa', 'Organic Blue Corn Tortilla Chips', 'Simply Nature', 
        'Chips, Crackers & Popcorn',  8.25, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('980d765c-e132-4d9d-80a2-10ae847c7f4c', 'German Style Sauerkraut', 'Deutsche Küche', 
        'Condiments & Dressings',  24.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('f1ae711b-916a-4e4b-ba24-f206bd2ac261', 'Aluminum Foil', 'BoulderRegular', 
        'Paper & Plastic Products',  NULL, 'Not specified');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('021bab26-de59-4e68-95f9-efe147de3d25', 'Mini Bear Chocolate Grahams Snack Packs', 'Benton''s', 
        'Cookies & Sweets',  12.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('e65dd5bb-d76c-47fd-bacb-403f32ba9935', 'Cranberry Almond Chicken Salad Mini Cups', 'Park Street Deli', 
        'Dorm Room Meals & Snacks',  12.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('f5bdddf8-00be-4b9c-a5e3-3f1817132dec', 'Cranberry Almond Chicken Salad', 'Park Street Deli', 
        'Cookout Essentials',  16.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('39fcfbcb-e162-4f97-a699-ff0b2fab27d1', 'Medium Fresh Cut Salsa', 'Park Street Deli', 
        'Sauces & Salsa',  16.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('9b1802a4-1ee4-498f-b740-91685bd5241e', 'Jubilee Assortment Olives', 'Park Street Deli', 
        'Charcuterie',  7.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('4a9f7454-ed4d-4c82-b89d-74ee11374171', 'HE Liquid Laundry Detergent', 'TandilOriginal', 
        'Laundry',  NULL, 'Not specified');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('2a221741-7ac4-41dc-9ce5-18e7afdaeb36', 'Chocolate Protein Meal Bars', 'ElevationDouble', 
        'Protein, Granola & Snack Bars',  6.0, 'count');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('566b404c-3e41-408e-ad83-a85a7a502266', 'Low Sodium Sprouted 7 Grain Bread', 'Simply Nature', 
        'Healthy Food & Snacks',  7.0, 'g');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('458aee5a-974a-4af1-9de5-0305b54cb414', 'Nonfat Vanilla Yogurt', 'Friendly Farms', 
        'Yogurt & Sour Cream',  32.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('c57349c1-40b2-4c0d-90fd-ffe1d459967e', 'Drawstring Kitchen Bags', 'BoulderTall', 
        'Paper & Plastic Products',  45.0, 'count');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('71bfc40b-a199-49c9-b379-e6ade63a9c12', 'Fat Free Vegetable Cooking Stock', 'Chef''s Cupboard', 
        'Soups & Broth',  32.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('c4878a17-990d-472c-bff7-30843bfdeb1e', 'Teriyaki Stir Fry Sauce', 'Burman''s', 
        'Sauces & Salsa',  14.5, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('03b39184-89b7-4d77-be80-1ae88d4a7191', 'New Orleans Style Jambalaya Rice Mix', 'Earthly Grains', 
        'Boxed Meals & Side Dishes',  8.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('3802f1cb-9e66-43ff-9640-7e3ba43bbd42', 'Pineapple Chunks in 100% Pineapple Juice', 'Sweet Harvest', 
        'Canned Foods',  20.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('6aca59a0-5ace-4d7c-93c2-2b486dc5d129', 'Organics Apple Sweet Potato Baby Food Puree', 'Little Journey', 
        'Baby Food & Snacks',  4.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('329ee0e3-6326-4e76-b1d9-27e994b3f40f', 'Apple Broccoli Pear Baby Food Puree', 'Little Journey', 
        'Baby Food & Snacks',  4.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('f1191ef1-196e-4bab-b468-f169da9d67cc', 'Pineapple Slices', 'Sweet Harvest', 
        'Canned Foods',  20.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('f06fb7f6-0051-43f9-b852-3d385f3edc3d', 'Dry Black Beans', 'Pueblo Lindo', 
        'Pasta, Rice & Grains',  32.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('45a8965b-85b9-4a5b-90fe-93097725a4da', 'Organic Multigrain Tortilla Chips', 'Simply Nature', 
        'Chips, Crackers & Popcorn',  8.25, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('1d38382e-d516-418f-ba56-fa95cee734cb', 'Butter Flavored Pancake Syrup', 'Millville', 
        'Condiments & Dressings',  24.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('ee8fcda7-352d-4e03-a19e-e9a41372a545', 'Oregano Leaves', 'Stonemill', 
        'Spices',  0.75, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('be9ab4ba-181e-4e95-a013-bb622b144731', 'Organic Ground Cumin', 'Simply Nature', 
        'Spices',  1.5, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('a8f8deaf-703c-4fa0-9150-2934c2c84924', 'Apple Cider Donuts', 'Bake Shop', 
        'Fall Food',  10.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('80691dbc-d340-4b51-9e65-ef114e9a7fbd', 'Organic Oats and Flax Instant Oatmeal Packets', 'Simply Nature', 
        'Cereal & Oatmeal',  11.29, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('d5780ab9-d422-4089-b029-aaadcb23ae53', 'Pure Olive Oil', 'Carlini', 
        'Oils & Vinegars',  NULL, 'Not specified');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('cdee97f1-77c8-4676-86a2-a8a31edbd475', 'Family Size Smoked Ham', 'Lunch Mate', 
        'Dorm Room Meals & Snacks',  16.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('f3c8984c-aa42-4ecd-b3ba-d2fc82095ce1', 'Honey Ham', 'Lunch Mate', 
        'Dorm Room Meals & Snacks',  16.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('59b7ba68-69ac-42a6-9b15-43621ea62747', 'Family Size Roast Beef', 'Lunch Mate', 
        'Lunch Meat',  14.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('27ffbfb0-1086-4800-9f55-43e4365ab51e', 'Family Size Rotisserie Chicken Breast', 'Lunch Mate', 
        'Lunch Meat',  1.0, 'lb');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('8ba70f5c-f826-43f2-b026-ccef09e8a61c', 'Family Size Lower Sodium Smoked Honey Ham in Lunch Meat Tub', 'Lunch Mate', 
        'Healthy Food & Snacks',  15.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('0008f541-3ed8-4f88-acde-fd86bec0c878', 'Korma Curry Sauce', 'Burman''s', 
        'Sauces & Salsa',  15.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('7960d317-8533-43d2-bd11-d95c799aa0ac', 'Cinnamon Applesauce Cups', 'Lunch Buddies', 
        'Canned Foods',  4.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('04c2205e-9074-4f8e-aad5-8a8bab2db5ce', 'Quick Oats', 'Millville', 
        'Cereal & Oatmeal',  42.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('59fb3ce7-6296-4312-acb6-649fb2ce3f4a', 'Roasted Garlic Alfredo Sauce', 'Priano', 
        'Sauces & Salsa',  15.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('22c2cf56-123e-422b-a0c1-9f5ac9261870', 'California Raisins', 'Southern Grove', 
        'Nuts & Dried Fruit',  20.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('9d151ac8-44de-47d9-bd42-b6c7455fc9c9', 'Herb Chicken Tortelloni', 'Priano', 
        'Valentine''s Day Dinner',  20.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('b74cc794-1ab4-44f4-857d-0c030e19e48e', 'Pretzel Mini Twists', 'Clancy''s', 
        'Chips, Crackers & Popcorn',  1.0, 'lb');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('954afb22-74d5-4a4b-8118-d1414a2e0537', 'Mesquite Barbecue Kettle Chips', 'Clancy''s', 
        'Chips, Crackers & Popcorn',  8.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('3b2528d8-a84b-4ed8-89e8-6e81b893efbc', 'Sardines in Mustard Sauce', 'Northern Catch', 
        'Canned Foods',  3.75, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('0ed15f0f-3d42-4561-aacb-f4c9c9d73cf9', 'Jalapeño Kettle Chips', 'Clancy''s', 
        'Chips, Crackers & Popcorn',  8.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('155dec2d-4b49-4330-88b7-8f5e5ee985b7', 'Beer Battered Cod Fillets', 'Fremont Fish Market', 
        'St. Patrick''s Day',  13.1, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('8c563430-f170-4d29-bd2b-5563d18a750e', 'Italian Seasoning', 'Stonemill', 
        'Spices',  0.75, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('0bb08794-180f-4619-a30a-4cdcec1c9354', 'Ground Cinnamon', 'Stonemill', 
        'Spices',  2.37, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('840ce2ac-310b-4cc8-b674-0061d35fb5b9', 'Champagne Cheddar Cheese', 'Emporium Selection', 
        'Seasonal',  5.3, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('eba3ef07-d0e6-413d-a798-d04c08158fa5', 'Sea Salt and Vinegar Kettle Chips', 'Clancy''s', 
        'Chips, Crackers & Popcorn',  8.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('4dc049b5-8c2a-4091-a829-187b07c2442b', 'Four Cheese Homestyle Instant Mashed Potatoes', 'Chef''s Cupboard', 
        'Boxed Meals & Side Dishes',  4.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('b7f6593a-5427-4144-a0b6-2ca1baf37232', 'Low-fat Strawberry Yogurt', 'Friendly Farms', 
        'Yogurt & Sour Cream',  6.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('33ff66ec-e465-48ed-9c03-afd85fa23863', 'Apple Chicken Sausage', 'Never Any!', 
        'Grilled Meat & Seafood',  12.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('7d8a96a7-acf1-4ea6-bcc7-704a1fd5a0ec', 'Blueberry Bagels', 'L''oven Fresh', 
        'Back to School Breakfast',  20.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('4f958e95-bcf6-4fd3-87d7-b6ea8b76a194', 'Organic Gala Apples', 'Nature''s Promise', 
        'Produce',  2.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('f19c9a71-35a4-48e4-9365-202952bfa8e3', 'Organic Fuji Apples', 'Nature''s Promise', 
        'Produce',  2.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('8cece01d-d302-4c83-b707-f4fa4acf5cbf', 'Organic Honeycrisp Apples', 'Nature''s Promise', 
        'Produce',  2.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('20d675cd-be77-49ec-b080-517a2792b6db', 'Organic Granny Smith Apples', 'Nature''s Promise', 
        'Produce',  2.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('11936f32-f439-40f7-a866-984769311705', 'Honeycrisp Apples', 'USDA Produce', 
        'Produce',  1.0, 'EA');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('0ef69879-3a3e-4bfd-ace4-ba4e73d6a8e7', 'Cereal', 'Apple Jacks', 
        'Breakfast',  8.9, 'OZ BOX');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('ed4fa2da-b4cf-44c8-a456-3984b6a61eca', 'Granny Smith Apples', 'USDA Produce', 
        'Produce',  1.0, 'EA');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('906f6f8e-63c0-43ec-bd97-83cafaf61d93', 'Creations Apple Pie a La Mode Greek Yogurt Cup', 'Chobani', 
        'Dairy & Eggs',  5.3, 'OZ CUP');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('af3103cb-855c-4612-822a-0f37b96757c0', 'Mcintosh Apples', 'USDA Produce', 
        'Produce',  1.0, 'EA');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('d4f964a1-8097-4ce9-88ac-56d46a0b4d84', 'Pink Lady Apples', 'USDA Produce', 
        'Produce',  1.0, 'EA');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('ba25f3d4-1144-40fe-857b-bbb7bc4cb991', 'Gala Apples', 'USDA Produce', 
        'Produce',  1.0, 'EA');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('a83073e8-bb44-4863-986a-5784553c18d5', 'Fuji Apples', 'USDA Produce', 
        'Produce',  1.0, 'EA');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('f94f39c0-557e-4484-98c5-6c6255d46096', 'Cortland Apples', 'USDA Produce', 
        'Produce',  1.0, 'EA');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('410d325d-18e6-4dd1-a97d-a36a76ddca0f', 'Red Delicious Apples', 'USDA Produce', 
        'Produce',  1.0, 'EA');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('2f8eb569-e504-48d1-bd09-15876940c5e3', 'Cortland Apple Tote Bag', 'USDA Produce', 
        'Produce',  NULL, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('ed80d0a1-a465-42b6-888a-2b5688e26fbe', 'Macintosh Apple Tote Bag', 'USDA Produce', 
        'Produce',  NULL, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('81022f0f-77f7-45c6-8e4f-d5e4eeaa37a4', 'Mcintosh Apples', 'USDA Produce', 
        'Produce',  3.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('a977c8df-0db4-45c7-89e2-3a1448d7970b', 'Honeycrisp Apples', 'USDA Produce', 
        'Produce',  3.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('86aa8ea4-4e2e-4b6b-ade0-9db601876043', 'Gala Apple Tote Bag', 'USDA Produce', 
        'Produce',  NULL, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('c5411aa1-f5ac-4657-9ae1-bdb5acf8df6e', 'Granny Smith Apples', 'Hannaford', 
        'Produce',  3.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('9fa7b287-275b-4584-9936-044272f12484', 'Gala Apples', 'Hannaford', 
        'Produce',  3.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('4e78bd98-8734-4706-8d58-b7c56524956c', 'Gala Apples', 'USDA Produce', 
        'Produce',  3.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('e3f98019-ce32-4386-8e85-068c6b4e197f', 'Empire Apple Tote Bag', 'USDA Produce', 
        'Produce',  NULL, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('596d762d-7f8a-4111-b42f-dba108405dc2', 'Pink Lady Apples', 'USDA Produce', 
        'Produce',  3.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('8f1bb711-2e6c-497b-b28b-da35c385e239', 'Granny Smith Apples', 'USDA Produce', 
        'Produce',  3.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('c5c51c9b-e3d3-45be-bc2a-8a9506cf8c0b', 'Fuji Apples', 'USDA Produce', 
        'Produce',  3.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('b538e983-e5f6-4631-acc1-96afef8e4c6d', 'Envy Apples', 'USDA Produce', 
        'Produce',  1.0, 'EA');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('1c0fc96f-89e7-4ae5-8e0c-c7666eb26ce1', 'Cosmic Crisp Apples', 'USDA Produce', 
        'Produce',  1.0, 'EA');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('0452f96b-119b-41a8-bea3-c1e08d48a80d', 'Macoun Apple Tote Bag', 'USDA Produce', 
        'Produce',  NULL, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('27356132-adbf-4463-8d81-6240840cc7b3', 'SugarBee Apples', 'USDA Produce', 
        'Produce',  1.0, 'EA');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('f30030bf-e10d-4e07-9b25-b9f8e1346701', 'Macoun Apples', 'USDA Produce', 
        'Produce',  1.0, 'EA');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('648c391e-318f-47b9-a337-21bf1bcd46b3', 'SweeTango Apples', 'USDA Produce', 
        'Produce',  1.0, 'EA');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('e071996c-2efb-4782-9637-eac9ca8eeb55', 'Kanzi Apple', 'USDA Produce', 
        'Produce',  1.0, 'EA');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('039af4da-7c96-44b7-b44d-ad4f61ef9946', 'Kanzi Apples', 'USDA Produce', 
        'Produce',  2.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('1e95ee3d-c946-4af7-b9c7-e4f7620147ca', 'SweeTango Apples', 'USDA Produce', 
        'Produce',  2.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('ed715cb5-6e36-4f05-8517-8dc6a8e387a3', 'Early Red Apple Tote Bag', 'USDA Produce', 
        'Produce',  NULL, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('8e74f511-5744-4cf7-9f0b-e1c0c37e33ab', '100% Apple Juice', 'Hannaford', 
        'Beverages',  64.0, 'OZ BTL');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('e87752f2-d872-4efe-b47f-8aec02dd9385', '100% Apple Juice', 'Mott''s', 
        'Beverages',  64.0, 'OZ BTL');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('ea25bee6-9c37-4782-81f2-a402fefd3773', '100% Apple Juice Fresh Pressed No Sugar Added Natural', 'Mott''s', 
        'Beverages',  64.0, 'OZ BTL');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('fc73e1c3-b5d9-4fc8-9307-d62f40d2c004', '100% Apple Juice', 'Hannaford', 
        'Beverages',  96.0, 'OZ BTL');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('f914128c-d125-4c4d-81fb-93bd2c887cc0', 'Original Almondmilk Unsweetened Non-Refrigerated', 'Almond Breeze', 
        'Dairy & Eggs',  NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('36b15daf-af82-484d-91dd-5019690f080b', 'Reduced Fat Milk', 'Battenkill Valley', 
        'Dairy & Eggs',  NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('6038d3f2-fe12-4816-96a9-686fe00f676b', 'Chocolate Almondmilk', 'Almond Breeze', 
        'Dairy & Eggs',  NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('75af8531-d3e4-4dee-b7d3-cf7c2ec3eb28', 'Lactose Free Whole Milk', 'Lactaid', 
        'Dairy & Eggs',  NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('62534056-a140-42cd-9305-dce17abaa8df', 'Vitamin C & D Whole Milk', 'Hannaford', 
        'Dairy & Eggs',  1.0, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('88f38743-4a80-4f54-bcab-b908dbd673a7', '2% Reduced Fat Milk', 'Hannaford', 
        'Dairy & Eggs',  1.0, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('0c020083-54da-4ad7-83fc-8d3ad792aa48', 'Lactose Free Protein 2% Reduced Fat Milk', 'Lactaid', 
        'Dairy & Eggs',  52.0, 'OZ CTN');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('fec29886-6234-4c97-9130-4e9af61f3a1b', 'Vitamin D Whole Milk', 'Hannaford', 
        'Dairy & Eggs',  NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('7fa0c31d-2e19-418c-8eda-910ff5048f44', 'Lactose Free Calcium Enriched 2% Reduced Fat Milk', 'Lactaid', 
        'Dairy & Eggs',  96.0, 'OZ JUG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('a1c929b2-917d-4141-9405-1782100107b2', '1% Low Fat Milk', 'Hannaford', 
        'Dairy & Eggs',  1.0, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('3931ddcf-d3a8-46f6-8241-6975bb9427ec', 'Vanilla Almondmilk Unrefrigerated', 'Almond Breeze', 
        'Dairy & Eggs',  1.0, 'QUART');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('8be97469-c624-4ff1-8d07-bda7ab9995c1', '2% Reduced Fat Milk', 'Hannaford', 
        'Dairy & Eggs',  NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('14d39044-711d-462e-9eb0-6c3440fc8a74', 'Vanilla Almondmilk Unsweetened Non-Refrigerated', 'Almond Breeze', 
        'Dairy & Eggs',  NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('376eec7c-2349-4f6c-a3c3-8f315ea79cc3', '1% Low Fat Milk', 'Hannaford', 
        'Dairy & Eggs',  NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('28020589-31ac-4d2d-99f4-609e130eb127', 'Vitamin D Whole Milk', 'Hannaford', 
        'Dairy & Eggs',  1.0, 'QUART');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('d47e9470-18fb-4c55-a57b-76e67b7bd39a', 'Organic Vitamin D Whole Milk', 'Nature''s Promise', 
        'Dairy & Eggs',  NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('b8a30f37-82c2-4a7c-a5d8-e5f986be2db6', 'Lactose Free Vitamin D Milk', 'Lactaid', 
        'Dairy & Eggs',  96.0, 'OZ JUG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('5aee7906-5549-4350-b75d-bc49e1996532', 'Fat Free Skim Milk', 'Hannaford', 
        'Dairy & Eggs',  1.0, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('93d5b03e-bbee-41b2-8e96-c6608b3e23b3', 'Lactose Free Calcium Enriched Vitamin D Milk', 'Lactaid', 
        'Dairy & Eggs',  NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('093e2570-178d-424f-9039-6cc8a4c04822', 'Organic 2% Reduced Fat Milk', 'Nature''s Promise', 
        'Dairy & Eggs',  NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('67541d56-c0b3-422e-b710-9e9afda867c4', 'Unsweetened Original Almondmilk Unrefrigerated', 'Almond Breeze', 
        'Dairy & Eggs',  1.0, 'QUART');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('0ac250a7-823a-4e20-9576-7404f7b08a7e', 'Organic Vitamin D Whole Milk', 'Nature''s Promise', 
        'Dairy & Eggs',  1.0, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('72fc67d8-7af1-4b10-a97b-3517ae364c27', 'Fat Free Skim Milk', 'Hannaford', 
        'Dairy & Eggs',  NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('9f2961e2-250f-4a92-8cd6-c5e90fbd0e0f', 'Organic 1% Low Fat Milk', 'Nature''s Promise', 
        'Dairy & Eggs',  NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('fd329336-0ddb-4e73-af5a-3637bcb5c4ba', 'Organic Vitamin D Whole Milk', 'Stonyfield', 
        'Dairy & Eggs',  NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('78299a95-be56-484e-a627-7b2d27a0a230', 'Organic 2% Reduced Fat Milk', 'Nature''s Promise', 
        'Dairy & Eggs',  1.0, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('7ad9eb0f-f77c-4ad0-beae-afc21561ecdf', 'Organic Fat Free Skim Milk', 'Nature''s Promise', 
        'Dairy & Eggs',  NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('47731937-5dc1-4c06-8694-b057508765d4', 'Fat Free Skim Milk', 'Hannaford', 
        'Dairy & Eggs',  1.0, 'QUART');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('4ef70e82-b264-4b38-b2e7-cd2623268fee', 'Grass-fed Whole Milk', 'Organic Valley', 
        'Dairy & Eggs',  NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('0a9d75ac-67a6-4900-a2ac-b439ac589609', 'Vitamin D Whole Milk', 'Organic Valley', 
        'Dairy & Eggs',  NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('c8ded2bf-00f7-4b00-a5e7-c6ae06db4046', 'Organic 2% Reduced Fat Milk', 'Stonyfield', 
        'Dairy & Eggs',  NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('a4f82609-af26-4231-a11e-000986c534bb', 'Organic 1% Low Fat Milk', 'Nature''s Promise', 
        'Dairy & Eggs',  1.0, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('360e13fb-27df-46cc-a30d-a5f2c361f623', 'Organic Grass-fed Whole Milk', 'Maple Hill', 
        'Dairy & Eggs',  NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('c162f4d5-0665-4786-8371-b32761a6020f', 'Whole Milk', 'Battenkill Valley', 
        'Dairy & Eggs',  1.0, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('1706c170-9cd3-4571-a493-4a1b575339d8', 'Whole Milk', 'Battenkill Valley', 
        'Dairy & Eggs',  NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('b472f6cf-2021-45e8-b267-6a8cc77953bb', '2% Reduced Fat Milk', 'Organic Valley', 
        'Dairy & Eggs',  NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('cbef4766-a291-4d11-b20b-15c25ed5bdb8', 'Organic Fat Free Skim Milk', 'Stonyfield', 
        'Dairy & Eggs',  NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('f855421f-faf9-4ab9-b988-0bcc3110624d', 'Organic 1% Low Fat Milk', 'Stonyfield', 
        'Dairy & Eggs',  NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('fbdbbec1-fc09-49c3-8bbd-9cc7f8f4b3cc', 'Vitamin D Whole Milk DHA Omega-3', 'Horizon Organic', 
        'Dairy & Eggs',  NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('81ba61e5-3a29-4737-971d-80ab96d77869', '2% Reduced Fat Milk', 'Crowley', 
        'Dairy & Eggs',  1.0, 'QUART');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('fa615e59-21b1-4e8e-a867-06d85d8a087d', 'Yellow Bananas', 'USDA Produce', 
        'Produce',  1.0, 'EA');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('ec7debd3-e52c-4d63-b3ac-4f9281445e21', 'Green Bananas', 'USDA Produce', 
        'Produce',  1.0, 'EA');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('05b40ba5-f05b-41fa-a2c1-ba845e3ae8e0', 'Organic Bananas apx 4-7 ct', 'USDA Produce', 
        'Produce',  1.0, 'BUNCH');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('eb1aba67-e931-44f1-88a6-e058b42771b8', 'Green Plantains', 'USDA Produce', 
        'Produce',  1.0, 'EA');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('fb6f7df1-3f58-49e0-986d-69333b31e472', 'Fresh Pack Mild Banana Pepper Rings', 'Hannaford', 
        'Condiments & Sauces',  16.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('1b560b63-9eec-4197-a630-cda946cfe6d5', 'Low Fat Strawberry Banana on the Bottom Greek Yogurt Cup - 4 ct', 'Chobani', 
        'Dairy & Eggs',  21.2, 'OZ PKG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('6c4019ba-8a4f-4e4c-8b69-78ef49b39ebd', 'Banana Chips', 'USDA Produce', 
        'Snacks',  10.0, 'OZ TUB');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('c16d8e5f-4d48-451a-8f61-027c69acd24e', 'Fresh Pack Mild Banana Pepper Rings', 'Mezzetta', 
        'Condiments & Sauces',  16.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('5bf2cacd-29ea-4e48-9a0b-24d99516324f', 'Banana Chocolate Chunk Ice Cream', 'Hannaford', 
        'Frozen',  1.0, 'PINT');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('51d792db-d4b3-4e7b-be9f-b7496f8b591c', 'Fresh Pack Hot Banana Pepper Rings', 'Hannaford', 
        'Condiments & Sauces',  16.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('1428b34b-7011-4c24-bd20-695154163d64', 'Mild Banana Pepper Rings', 'Mt. Olive', 
        'Condiments & Sauces',  12.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('0507095c-c47b-4bea-9fed-28430a270971', 'Delicatessen Style Mild Banana Pepper Rings', 'Mt. Olive', 
        'Condiments & Sauces',  32.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('d16d1ed1-4d00-4b02-89e2-16650e621f94', 'No Sugar Added Dried Fruit Banana Bites', 'Good Sense', 
        'Snacks',  6.0, 'OZ PKG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('42dbe726-4879-44e8-bddd-6f08d2086a5d', 'Fresh Pack Hot Banana Pepper Rings', 'Mezzetta', 
        'Condiments & Sauces',  16.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('ab546775-93d7-41e2-a2d7-1ff2a857b57b', 'Banana Caramel Coconut HomeMaine Ice Cream', 'Gifford''s', 
        'Frozen',  1.0, 'PINT');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('1598ceca-07ef-4d6b-bd50-aaa2631b5a3d', 'Bakery Sliced Banana Bread', 'Hannaford', 
        'Bread & Bakery',  14.0, 'OZ PKG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('6b596c75-a9e1-454a-a396-d93a895fe098', 'Non Fat Strawberry Banana Yogurt Cup', 'Hannaford', 
        'Dairy & Eggs',  6.0, 'OZ CUP');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('5985d9e3-15b9-4098-85b3-1b40deb7df17', 'PRO 20g Protein Banana Cultured Ultra-Filtered Milk Yogurt Cup', 'Oikos', 
        'Dairy & Eggs',  5.3, 'OZ CUP');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('8ccf2d27-5f19-46f6-89d8-63914a80dc59', 'Low Fat Strawberry Banana Greek Yogurt Drink', 'Chobani', 
        'Dairy & Eggs',  7.0, 'OZ BTL');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('6b2e907f-7b75-4590-bb79-54735ac494fe', 'Organic Kids Low Fat Strawberry Banana Yogurt Pouch - 4 ct', 'Stonyfield', 
        'Dairy & Eggs',  14.0, 'OZ PKG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('a04f3df5-3ef0-4b76-ad9f-13330bcca10d', 'Non Fat Strawberry Banana Greek Yogurt Cup', 'Hannaford', 
        'Dairy & Eggs',  5.3, 'OZ CUP');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('48260c5e-7b13-4a0b-8f42-ad663b6fc392', 'Original Low Fat Strawberry Banana Yogurt Cup', 'Yoplait', 
        'Dairy & Eggs',  6.0, 'OZ CUP');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('45cf4f25-ee1a-4c47-8b48-2eb7ad326c01', 'Kids Low Fat Strawberry & Banana Yogurt Pouch - 4 ct', 'Siggi''s', 
        'Dairy & Eggs',  14.0, 'OZ BOX');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('082f2d54-28e4-4764-aad2-58036c29e928', 'Gluten Free Peanut Butter Banana Dark Choc Breakfast Protein Bars 6ct', 'KIND', 
        'Breakfast',  10.56, 'OZ BOX');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('2f8b425d-baa4-42c5-9053-86bc3263298d', 'Extra Creamy Salted Caramel Banana Whole Milk Yogurt', 'Icelandic Provisions', 
        'Dairy & Eggs',  4.4, 'OZ CUP');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('9ecd741c-8046-4bfb-b26c-12ffe90880e1', 'Organic Banana Apple Berry & Pomegranate Gut Health Snack Squeeze', 'gutzy', 
        'Soups & Canned Goods',  3.9, 'OZ PKG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('163e126d-3e96-4a23-a2d1-3639262a76f8', 'Organic Kids Low Fat Strawberry Banana Yogurt Smoothies - 6 ct', 'Stonyfield', 
        'Dairy & Eggs',  3.1, 'OZ BTL');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('60ed1a7c-9d20-46e8-977d-26970366c5f3', 'Organics 2 Baby Food Bananas Raspberries & Oats', 'Happy Baby', 
        'Baby',  4.0, 'OZ SQZ');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('31557c77-c640-4778-babb-9bda972704a9', 'Dairy Free Vegan Strawberry Banana Coconutmilk Yogurt Cup', 'So Delicious', 
        'Dairy & Eggs',  5.3, 'OZ CUP');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('c21551ce-06c4-4fb0-87bf-ad2d00eaaeb5', 'PRO 23g Protein Strawberry Banana Cultured Dairy Drink', 'Oikos', 
        'Dairy & Eggs',  7.0, 'OZ BTL');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('7a4c0442-068a-48e8-bc9c-c6a6f1a9011b', 'Organic 2 Baby Food Banana & Pumpkin', 'Nature''s Promise', 
        'Baby',  3.5, 'OZ SQZ');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('d90ea925-33c9-4d86-8ec9-d039f6f93480', 'Low Fat Strawberry Banana Skyr Yogurt', 'Siggi''s', 
        'Dairy & Eggs',  5.3, 'OZ CUP');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('fa1a1501-cebb-40f5-b639-b92a923669aa', 'Organic Dairy Free Strawberry Banana Swirl Smoothie', 'Once Upon a Farm', 
        'Baby',  4.0, 'OZ SQZ');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('ed1c0864-1cb5-4869-a508-8024e0a7e696', 'Organics Stage 4 Super Morning Bananas Blueberries Yogurt & Oats', 'Happy Tot', 
        'Baby',  4.0, 'OZ SQZ');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('14af5eaf-d843-4c3a-ade8-7fcfb84e15d8', 'Organics Stage 4 Super Bellies Bananas Spinach & Blueberries', 'Happy Tot', 
        'Baby',  4.0, 'OZ SQZ');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('f5b6bea3-a598-40b2-a3c5-24682a55dfbc', 'Organics Love My Veggies Carrot Banana Mango & Sweet Potato', 'Happy Tot', 
        'Baby',  4.22, 'OZ SQZ');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('66e13c95-7003-4d5c-866c-b600b3bd5ebc', 'Picked Fresh Sliced Bananas Frozen', 'Hannaford', 
        'Frozen',  16.0, 'OZ BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('9aeba663-7731-4903-97e3-564cd994e82a', 'Organic YoBaby Whole Milk Banana & Oat Yogurt Pouch - 4 ct', 'Stonyfield', 
        'Dairy & Eggs',  13.6, 'OZ PKG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('d045f3f6-c50c-4994-a672-c77d434a2066', 'Veggies Stage 2 Baby Food Zucchini Spinach & Banana', 'Beech-Nut', 
        'Baby',  3.5, 'OZ SQZ');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('9bb78705-691a-4466-a85c-67fdb684e761', 'Strawberry Banana Finest Yoghurt', 'Noosa', 
        'Dairy & Eggs',  8.0, 'OZ TUB');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('99775ab5-b796-4033-a756-f92d1f2c74ea', 'Natural Grain Free Stews Variety Pack Wet Dog Food - 6 ct', 'Blue Buffalo', 
        'Pets',  4.69, 'LB BOX');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('9de4288c-bcd6-4a3e-80a5-fb6e3bbc2f95', 'IncrediBites Small Dogs Variety Adult Wet Dog Food - 12 ct', 'Purina Beneful', 
        'Pets',  2.25, 'LB BOX');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('e3d830fa-98bf-4bbe-85c3-9cc918657df0', 'Natural Small Breed Chicken & Brown Rice Adult Dry Dog Food', 'Blue Buffalo', 
        'Pets',  5.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('0a9c426a-e038-4dce-903f-34685858182d', 'Natural Life Protection Chicken/Brown Rice Recipe Adult Dry Dog Food', 'Blue Buffalo', 
        'Pets',  5.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('3a81d70a-6896-4b17-8554-e1d9ee50bf63', 'IncrediBITES Small Dogs Chicken Adult Dry Dog Food', 'Purina Beneful', 
        'Pets',  3.5, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('1cba349c-177a-4d3c-a09a-3d8575d93a6c', 'with Tender Bites Small Dogs Chicken & Steak Adult Dry Dog Food', 'PEDIGREE', 
        'Pets',  3.5, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('7de9352e-a5d9-4214-9b7b-b80141a30828', 'Natural Life Protection Chicken/Brown Rice Recipe Adult Dry Dog Food', 'Blue Buffalo', 
        'Pets',  24.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('1ece00e7-59b2-4596-afb9-cfc0ff7d80c7', 'IncrediBites Small Dogs Beef/Veggies Adult Wet Dog Food', 'Purina Beneful', 
        'Pets',  3.0, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('7ec111a3-bd25-47bc-bdb1-5794167e6074', 'Wilderness Natural Hi-Protein Chicken Small Dry Dog Food', 'Blue Buffalo', 
        'Pets',  4.5, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('bf6ee340-1567-4d05-96b2-e54e225092ba', 'IncrediBITES Small Dogs Farm-Raised Beef Adult Dry Dog Food', 'Purina Beneful', 
        'Pets',  3.5, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('eb25a78b-dbb6-46cc-b3f5-6823702b056e', 'Healthy Weight Chicken & Brown Rice Adult Dry Dog Food', 'Blue Buffalo', 
        'Pets',  15.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('8d1bf213-ae35-4cab-a9ac-f40cb07f820e', 'IncrediBITES Small Dogs Farm-Raised Beef Adult Dry Dog Food', 'Purina Beneful', 
        'Pets',  14.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('28ad2171-f824-4da7-8a4e-08af0d368d7f', 'Life Protection Puppy Chicken & Brown Rice Dry Dog Food', 'Blue Buffalo', 
        'Pets',  5.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('174b58c8-67ed-4828-9e10-0d665e00de49', 'IncrediBITES Small Dogs Chicken Adult Dry Dog Food', 'Purina Beneful', 
        'Pets',  14.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('48b90a24-36eb-4ba4-aad1-dbd091bc4bf7', 'IncrediBites Small Dogs Beef/Wild Rice Adult Wet Dog Food', 'Purina Beneful', 
        'Pets',  3.0, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('358c4650-def1-468f-8096-29033f60c6f5', 'Complete Essentials Chicken & Rice Adult Wet Dog Food', 'Nature''s Promise', 
        'Pets',  13.2, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('bd9ea01a-710d-4720-89d5-542835d77c69', 'Natural Homestyle Beef Dinner with Vegetables Adult Wet Dog Food', 'Blue Buffalo', 
        'Pets',  12.5, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('df4b846e-905f-44fe-a036-d248697803ef', 'Grain Free Chicken Turkey & Salmon Adult Wet Dog Food', 'Nature''s Promise', 
        'Pets',  13.2, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('7fc85be8-7199-4690-8992-c0c41c1c112f', 'Natural Homestyle Turkey Meatloaf with Vegetables Wet Dog Food', 'Blue Buffalo', 
        'Pets',  12.5, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('60f701e8-6c45-484e-b579-9d4111f5d23a', 'Complete Chicken Turkey & Duck Adult Wet Dog Food', 'Nature''s Promise', 
        'Pets',  13.2, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('dc836a27-5bb2-43a9-955b-777d8ddce04c', 'Natural Large Breed Chicken & Brown Rice Adult Dry Dog Food', 'Blue Buffalo', 
        'Pets',  24.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('02ab48db-dbf9-4414-910c-2944b5aca1b6', 'Grain Free Chicken Beef Vegetable in Gravy Wet Dog Food', 'Nature''s Promise', 
        'Pets',  13.2, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('6d388085-fb80-4a8d-a70a-f2434cd33ffd', 'Grain Free Turkey & Chicken Adult Wet Dog Food', 'Nature''s Promise', 
        'Pets',  13.2, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('fb8858a6-cc50-40f7-9082-7a2770719b9c', 'Grain Free Turkey & Sweet Potato Stew Adult Wet Dog Food', 'Nature''s Promise', 
        'Pets',  13.2, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('5cf73bae-49ca-4941-9424-68134554896e', 'Grain Free Chicken & Vegetable in Gravy Wet Dog Food', 'Nature''s Promise', 
        'Pets',  13.2, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('56b3e2a3-528e-45c3-8e62-53b5388cb25b', 'Tender Cuts in Gravy Chicken & Brown Rice Adult Wet Dog Food', 'Purina ONE', 
        'Pets',  13.0, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('40a75523-3ed7-4f19-9474-fc7d70039343', 'Grain Free Chicken & Fish Dinner Adult Wet Dog Food', 'Nature''s Promise', 
        'Pets',  13.2, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('d735df4a-b50e-4e26-bd9d-c585830a59dd', 'Grain Free Turkey & Potato Dinner Adult Wet Dog Food', 'Nature''s Promise', 
        'Pets',  13.2, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('f440829d-ee0d-4fbb-9051-996a0feef7ab', 'Classic Ground Chicken & Brown Rice Adult Wet Dog Food', 'Purina ONE', 
        'Pets',  13.0, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('7ba7007c-844a-4561-be57-4d1bc645792f', 'Grain Free Chicken Dinner with Gravy Wet Dog Food', 'Nature''s Promise', 
        'Pets',  3.5, 'OZ PKG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('20c19689-c5a3-42db-8504-2db1f9010dc4', 'Classic Ground Beef & Brown Rice Adult Wet Dog Food', 'Purina ONE', 
        'Pets',  13.0, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('a3f9f393-5bec-48e8-b1ea-96b0ceedaddb', 'Chopped Blends Salmon Sweet Potato Rice Adult Wet Dog Food', 'Purina Beneful', 
        'Pets',  10.0, 'OZ TUB');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('93817bfe-4766-4959-a843-43c3d263408a', 'True Instinct Tender Cuts Beef & Salmon Adult Wet Dog Food', 'Purina ONE', 
        'Pets',  13.0, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('2c0c8e13-95a2-4cc7-9f56-52fe8072c109', 'Chopped Blends Turkey Sweet Potato Rice Adult Wet Dog Food', 'Purina Beneful', 
        'Pets',  10.0, 'OZ TUB');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('6b609065-82bf-43a3-9000-0c76887e535d', 'Filets in Gravy Prime Rib Flavor Adult Wet Dog Food', 'CESAR', 
        'Pets',  3.5, 'OZ PKG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('c17aec6d-92aa-4c5d-a478-17b0e65b83c2', 'Tender Cuts in Gravy Healthy Weight Lamb Adult Wet Dog Food', 'Purina ONE', 
        'Pets',  13.0, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('9938a5fd-d989-414e-bab8-5666890b7b72', 'Chopped Ground Dinner Filet Mignon Adult Wet Dog Food', 'PEDIGREE', 
        'Pets',  13.2, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('2651517f-4983-404d-9649-2d12c1d32322', 'Choice Cuts in Gravy Country Stew Adult Wet Dog Food', 'PEDIGREE', 
        'Pets',  13.2, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('4d1fff01-1b5d-4970-8a5e-599de828c887', 'Top That Boost Wet Dog Food Topper Duck Recipe in Gravy', 'I and Love and You', 
        'Pets',  3.0, 'OZ PKG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('f6db5619-54e8-4bf9-81f6-7ea8b1090e5f', 'Nutrish Natural Chicken Muttballs Wet Dog Food', 'Rachael Ray', 
        'Pets',  8.0, 'OZ TUB');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('d849e6ca-eb0f-4112-b61d-10770e425263', 'Balsam & Cedar', 'Yankee Candle', 
        'Home & Office',  14.25, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('97ded5a9-3f29-4f96-9218-51c75d53aabb', 'Balsam & Cedar', 'Yankee Candle', 
        'Home & Office',  10.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('2f736794-7dd1-437a-84a6-78f9b46bc5ce', 'Kitchen Spice', 'Yankee Candle', 
        'Home & Office',  14.25, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('8eb5c845-8fa5-4785-93cf-15b2fab7f58c', 'Welcoming Apple Cinnamon 3 Wick Candle', 'Glade', 
        'Laundry, Paper & Cleaning',  6.8, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('dcb3e92c-d5bb-4e6b-abc4-3eb8c3bb9454', 'Lemon Lavender with Essential Oils', 'Yankee Candle', 
        'Home & Office',  10.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('c18e3d2f-ef9b-48be-9116-7be038d6af61', 'Midsummer''s Night with Essential Oils', 'Yankee Candle', 
        'Home & Office',  10.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('89e646af-90c4-4ee5-ab19-18da19e121fd', 'Pink Sand with Essential Oils', 'Yankee Candle', 
        'Home & Office',  10.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('f789fd0f-046c-48fa-ab83-24383d07d8de', 'Macintosh', 'Yankee Candle', 
        'Home & Office',  14.25, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('afdf6e27-f29a-4008-a996-4e76d7bf9de1', 'Sage & Citrus', 'Yankee Candle', 
        'Home & Office',  14.25, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('f6e0144a-d368-4c1e-a7ce-b2462e35fbc8', 'Apple Cinnamon Candle', 'Glade', 
        'Laundry, Paper & Cleaning',  4.08, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('bdb6d354-4f3d-46c4-b0df-18eb1bda7bdc', 'Scented Apple Pumpkin', 'Village Candle', 
        'Home & Office',  1.0, 'EA');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('7e05fa08-28c8-4bae-9aec-818413c9c13e', 'Scented Balsam Fir', 'Village Candle', 
        'Home & Office',  14.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('0290e195-fed4-49a1-ab3e-a3da7adbeb82', 'Bayside Cedar', 'Yankee Candle', 
        'Home & Office',  14.25, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('2ccd0f96-10da-441d-a360-36c6c0adeb4a', 'Harvest Pumpkin', 'Tuscany Candle', 
        'Home & Office',  18.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('4dbb0bcb-5beb-4004-a63a-7a93636252c2', 'Clean Linen Candle', 'Glade', 
        'Laundry, Paper & Cleaning',  4.08, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('bae39811-521c-4f64-b32b-826b447fabf0', 'Maple Butter', 'Village Candle', 
        'Home & Office',  16.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('cd58d9f9-49a7-4743-9ccf-b36e86145a7e', '2-in-1 Vanilla Passion Fruit + Hawaiian Breeze Candles - 2 ct', 'Glade', 
        'Laundry, Paper & Cleaning',  8.16, 'OZ PKG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('c5c4608f-cd9b-4c93-894e-defcf15acd1f', 'Cashmere Woods Candle', 'Glade', 
        'Laundry, Paper & Cleaning',  4.08, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('80cd38e8-821f-40db-9301-e14c191a5f0c', 'Scented Warm Apple Pie', 'Village Candle', 
        'Home & Office',  26.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('3c5a58bc-815f-4af9-ab88-c9d792c8145e', 'Spiced Pumpkin', 'Village Candle', 
        'Home & Office',  16.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('1ad372bf-c397-4bc9-9992-f3209a4447cc', 'Scented Mulled Cider', 'Village Candle', 
        'Home & Office',  21.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('3b70051c-26ba-476c-bfbf-3e05081a2602', 'Scented Spiced Pumpkin', 'Village Candle', 
        'Home & Office',  21.2, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('ca60bf27-0b2b-4475-85cc-2b036fb5b5a6', 'Scented Balsam Fir', 'Village Candle', 
        'Home & Office',  26.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('62e81499-fd89-4f72-a263-53cc78e0bdb2', 'Comforting Cashmere Woods 3 Wick Candle', 'Glade', 
        'Laundry, Paper & Cleaning',  6.8, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('ff07b267-b31b-44af-af1d-d82b8757d2e4', 'Midsummer''s Night', 'Yankee Candle', 
        'Home & Office',  14.25, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('9a10b490-e208-46a6-b848-1974aaf597f4', 'Sky & Sea Salt Single Wick Candle - 2 ct', 'Glade', 
        'Laundry, Paper & Cleaning',  8.16, 'OZ PKG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('4dfc07f0-fde9-4719-b6a7-6cdd66b1c239', 'Tranquil Lavender & Aloe Candle - 2 ct', 'Glade', 
        'Laundry, Paper & Cleaning',  8.16, 'OZ PKG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('d20b627d-2f90-4807-a7cc-a2f0d54a3e42', 'Scented Mulled Cider', 'Village Candle', 
        'Home & Office',  13.7, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('d17b7402-9201-41df-8c17-948a8bd57125', 'Scented Apple Pumpkin', 'Village Candle', 
        'Laundry, Paper & Cleaning',  1.0, 'EA');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('e21a3c32-f251-4908-bd1b-61d2cb9e0ebd', 'Gentlemen''s Collection Scented Bergamot & Amber', 'Village Candle', 
        'Home & Office',  14.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('f0996450-293a-4eca-8ec6-4f1539a5cfd8', 'Scented Apples & Evergreen', 'Village Candle', 
        'Home & Office',  19.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('6e98fc51-7ad2-4b1f-9b31-19e43a165654', 'Gentlemen''s Collection Spiced Tobac & Honey Scented', 'Village Candle', 
        'Home & Office',  14.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('efb2e697-5a24-42da-a733-03e699edb4bb', 'Mind & Body Dream + Inspire Raspberry Coconut Candle', 'Chesapeake Bay', 
        'Laundry, Paper & Cleaning',  8.8, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('0591c1b5-c1c1-42a2-b592-8301e3e71a4c', 'Mind & Body Balance + Harmony Water Lily Pear Candle', 'Chesapeake Bay', 
        'Home & Office',  8.8, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('143d2040-e60d-4eee-a7eb-50fd1c34c598', 'Mind & Body Relax + Restore Sage Peppermint Candle', 'Chesapeake Bay', 
        'Home & Office',  8.8, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('1c292e6a-8092-493d-96c5-fe4a9be3e36e', 'Fresh Collection Juniper & Teak 3 Wick Scented Candle - 2 ct', 'Glade', 
        'Laundry, Paper & Cleaning',  6.8, 'OZ PKG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('d7f2b8c6-9aa5-4aea-bd43-126ea8f15dbe', 'Signature Collection Vanilla Creme Brulee', 'Yankee Candle', 
        'Home & Office',  4.3, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('5a87732e-51c6-48ca-a162-3902c4d2466c', '2-in-1 Sheer Vanilla Embrace & Apple Cinnamon Candle', 'Glade', 
        'Laundry, Paper & Cleaning',  4.08, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('3ab52cb5-5f55-46af-96fb-b77dae0e91bb', 'Soy Blend Vanilla Cream', 'Tuscany Candle', 
        'Home & Office',  14.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('38c7408f-35af-4077-a2d1-a5f30bcbe238', 'Smooth Bourbon & Oak Candles - 2 ct', 'Glade', 
        'Laundry, Paper & Cleaning',  8.16, 'OZ PKG');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('b539a1f8-06f3-426d-912e-6f47ccd9b7e5', 'That''S It Fruit Bars, Apple + Cherries, 12 Bars,  () Each', 'That''s', 
        'Soup',  1.2, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('a75ccd9a-4a7f-4ff5-ae78-4d2c10a4a25b', 'Fresh Lucy Glo Apples - S Bag', 'Fresh', 
        'Soup',  2.0, 'lb');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('2500553b-42a4-4549-bd64-33ad8035c05d', 'Goodrow 100% Apple Juice -  Bottle', 'good2grow', 
        'Soup',  2.0, 'g');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('ee7b1651-9c45-4916-ab83-8c415458abf0', 'Once Upon A Farm Green Kale & Apples Organic Kids'' Snack -  Pouch', 'Once', 
        'Soup',  3.2, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('df421961-582c-48c2-9500-626e32e0bc6f', 'Nature''S Bakery Apple Crumble Bar - /6Ct', 'Nature''s', 
        'Soup',  8.46, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('ece1425b-1c8b-45a7-b022-807217aeef76', 'Martinelli''S Apple Juice - 1 Liter Bottle', 'Martinelli''s', 
        'Soup',  NULL, '');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('09b46f4e-7dc1-4169-b635-c89bc3a76132', 'Bob Snail, Fruit Rolls, Apple-Pear, 10 Pouches,', 'Bob', 
        'Soup',  0.35, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('6f124954-7ae4-4596-9afe-a5f4d281d5c8', 'Gogo Squeez Applesauce And Fruit Puree, Apple Apple - /40Ct', 'GoGo', 
        'Soup',  3.2, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('1eec7f82-0dbe-41fe-9c49-6244df6e9cbb', 'Pure Organic Twisted Fruit Bites Peach Mango - /8Ct', 'Pure', 
        'Soup',  5.6, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('ae2974d0-edd8-4888-beef-180da301eb1d', 'Happy Baby Organics Clearly Crafted Stage 2 Apples, Guavas & Beets -', 'Happy', 
        'Soup',  4.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('f1a8fb66-8e06-4e11-bd72-11fb1eb167b0', 'Brainiac Kids Brain Squeezers Applesauce Pouches With Omega-3S Variety Pack Apple, Strawberry And Cinnamon - /10Ct', 'Brainiac', 
        'Soup',  3.2, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('360c9387-34ce-491b-ac1c-3d5a2a6d603d', 'Fruit Roll-Ups Betty Crocker Variety Fruit Flavored Snacks - /30Ct', 'Fruit', 
        'Soup',  15.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('9b17c025-5dc3-407d-89b0-009835f36965', 'Organic Dried Unsweetened Apple Rings Snacks -  - Good & Gather™', 'Organic', 
        'Soup',  4.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('2fe246db-dd82-4801-9495-9b7663b946eb', 'Fresh Navel Oranges -  Bag - Good & Gather™', 'Fresh', 
        'Soup',  4.0, 'lb');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('38cc78df-1f71-4015-b540-79f1e2ba1034', 'Mott''S 100% Original Apple Juice - 6Pk/ Bottles', 'Mott''s', 
        'Soup',  8.0, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('5f19c978-2359-4df0-84f4-a76a23885adf', 'Zoa Green Apple Zero Sugar Energy Drink -  Can', 'ZOA', 
        'Soup',  12.0, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('0b057245-b531-47f9-9324-55f8327f2bff', 'Gogo Squeez Applesauce On The Go Pouch -', 'GoGo', 
        'Soup',  3.2, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('153dafd4-42be-461f-a1c7-83cc2400b0ff', 'Noka Superfood Smoothie Fruit Super Berry Single Pouch -', 'NOKA', 
        'Soup',  4.22, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('ac55dfb2-cae4-4b53-84b4-9b1ff094aec2', 'Sprout Foods Organic Blueberry Apple Wafflez Toddler Snacks -', 'Sprout', 
        'Soup',  3.15, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('8ae778c9-3960-4a33-bfb6-f12f5c5e4cf5', 'Kyvan Mild Honey Apple Salsa -', 'KYVAN', 
        'Soup',  16.3, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('ab95d7ca-0e1e-41c7-a3d8-586d6d0428a4', 'Kencko Mango Fruit Snaps - /5Ct', 'Kencko', 
        'Soup',  1.8, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('91495f71-8daa-459f-a671-375161d49a35', 'Noka Organic Superfood Smoothie Super Berry + Immune Support Pouches - /4Pk', 'NOKA', 
        'Soup',  16.9, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('c2ad0c64-bee7-4654-9c92-d232c5e89c41', 'Crunch Pak Bluey Snacker With Peeled Apples, Fruit Snacks And Crackers -', 'Crunch', 
        'Soup',  4.25, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('1208ba4e-957e-4806-9313-b2d464360daa', 'Gogo Squeez Applesauce And Fruit Puree Apple Strawberry Pouches - /12Ct', 'GoGo', 
        'Soup',  38.4, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('31806383-9f8c-450f-a87d-6c8b81481eea', 'Epic Bar, Beef Bar, Uncured Bacon + Apple,', 'Epic', 
        'Soup',  1.3, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('e3fe1d81-4164-41e0-abbe-62b1aa9e08ad', 'Mott''S Soft Baked Strawberry Filled Snack Bars - /5Ct', 'Mott''s', 
        'Soup',  6.55, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('2aab3345-2d19-4fb1-b702-33eb108d1f3c', 'Olipop Crisp Apple Soda -  Can', 'OLIPOP', 
        'Soup',  12.0, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('7d2eb935-304f-4061-8812-75be4e7f0907', 'Happytot Super Morning Organic Apples Cinnamon Yogurt & Oats With Superchia Baby Food Pouch -', 'HappyTot', 
        'Soup',  4.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('af93d143-ff56-4c04-b59d-6160e95e2ed2', 'North Coast Apple Sauce Honey Crisp 4 Pack Pouch Organic - Box Of 6 -', 'North', 
        'Soup',  12.8, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('9bb3aa76-6c8c-4b7e-a1b0-fae15f10c850', 'Fresh Pink Lady Apples -  Bag - Good & Gather™', 'Fresh', 
        'Soup',  3.0, 'lb');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('8c003d48-72fa-4b4c-b613-bc6f41cf66c8', 'Mott''S Assorted Fruit Flavored Snacks Value Pack - /22Ct', 'Mott''s', 
        'Soup',  19.2, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('f7931f6e-d7a6-465a-a4f9-ac68ca2ac41f', 'Table Talk 4" Baked Apple Pies -', 'Table', 
        'Soup',  4.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('8a191254-414c-4f02-b122-25896e02a8c4', 'Poppi Wild Berry Prebiotic Beverage -  Can', 'Poppi', 
        'Soup',  12.0, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('9781156d-6e48-4a7e-9b46-1729204f8d4d', 'Betty Crocker Fruit Shapes Lilo & Stitch Fruit Snacks - /10Ct', 'Betty', 
        'Soup',  8.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('6a90e0ea-6e39-4404-9606-ac8c614b353b', 'Dally Apple Gel Snack -', 'Dally', 
        'Soup',  5.07, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('731b807d-73f1-4573-98e5-789e1b0e9f07', 'Bare Baked Crunchy Fuji & Reds Apple Chips -', 'Bare', 
        'Soup',  3.4, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('083bada2-01da-46fd-b38a-8a60c08905c0', 'Brothers-All-Natural Fruit Crisps, Fuji Apple, 12 Single-Serve Bags,  () Each', 'Brothers-All-Natural', 
        'Soup',  0.35, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('8274d5e9-9983-4a64-a77f-5b1275f8983e', 'Nut Cravings Sun Dried Apple Rings: Slices, Unsweetened And All Natural', 'Nut', 
        'Soup',  NULL, '');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('7bb0d9dd-b97c-4af5-9787-fcbc44df2112', 'Crunch Pak Organic Sweet Apple Slices - /5Ct', 'Crunch', 
        'Soup',  11.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('d3de1053-01c6-40cf-b9d1-d2843bd92a85', 'Martinelli''S Apple Juice - 4Pk/ Bottles', 'Martinelli''s', 
        'Soup',  10.0, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('fe60ab30-f872-4b6e-b69b-442086c59255', 'That''S It. Strawberry Banana Mini Fruit Bars - 10Ct/', 'That''s', 
        'Soup',  7.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('5dd0adcf-acd3-46d6-8c6f-5c2d6c12efe8', 'Disney Foodles Peeled Apples, Cheese & Crackers Crunch Pak -', 'Disney', 
        'Soup',  3.85, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('22226f3b-5de9-43d3-912a-1bbd22a9bd96', 'Noka Superfood Smoothie Fruit Strawberry Pineapple Single Pouch -', 'NOKA', 
        'Soup',  4.22, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('5870aa86-5244-4031-9166-4eed3a77a19a', 'Fresh Gala Apple - Each', 'Fresh', 
        'Soup',  NULL, '');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('cdbc25cd-a3e8-4534-a8c8-4b334971d255', 'Gushers Watermelon Sour Apple Fruit Snacks - /6Ct', 'Gushers', 
        'Soup',  4.8, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('64ec728a-baa8-49f7-8197-e49e2de8ad57', 'Cove Green Apple Soda -  Can', 'Cove', 
        'Soup',  12.0, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('e0f99ce2-c506-4591-a36d-f47d35d1c6c5', 'Fresh Organic Gala Apples - S Bag - Good & Gather™', 'Fresh', 
        'Soup',  2.0, 'lb');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('31140007-3e40-4138-a7dc-9694ca63a467', 'Brainiac Kids Brain Squeezers Applesauce Pouches Fruit And Veggie Variety Pack Apple Banana Carrot & Apple Strawberry Spinach - /10Ct', 'Brainiac', 
        'Soup',  3.2, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('88981cf2-95d9-4a07-a60f-bcbd3e53d341', 'Fresh Organic Cosmic Crisp Apple - S', 'Fresh', 
        'Soup',  2.0, 'lb');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('2ca4264b-89ec-471c-ab28-1e7974eb801b', 'Bobo''S Stuff''D Apple Pie Bites -', 'Bobo''s', 
        'Soup',  6.5, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('c0dc0783-8587-4ae9-883f-3b692921550f', 'Noka Organic Superfood Smoothie Cherry Acai - Case Of 6/', 'Noka', 
        'Soup',  4.22, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('e55c04c2-5079-4d4a-a407-f95e716889a0', 'North Coast Apple Sauce Honey Crisp Organic - Pack Of 6 -', 'North', 
        'Soup',  24.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('316bc9e4-561b-4669-a95b-d95422d174d2', 'Annie''S Organic Bees, Bugs & Butterflies Strawberry, Raspberry & Apple Fruit Snacks - /10Ct', 'Annie''s', 
        'Soup',  7.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('15e79851-7247-4faf-916b-a4beab1188a9', 'Fresh Honeycrisp Apples -  Bag - Good & Gather™', 'Fresh', 
        'Soup',  3.0, 'lb');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('149ec6f2-5f4f-43a8-9939-b178d7122dcb', 'Smash Foods Concord Grape Superfood Jam -', 'Smash', 
        'Soup',  8.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('8ab3efa3-42aa-4583-9b47-81e3e3fae1cd', 'Betty Crocker Bluey Fruit Flavored Fruit Snacks - /10Ct', 'Betty', 
        'Soup',  8.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('7d693ca4-ba77-45aa-9a03-bfe8953ad4ab', 'Once Upon A Farm Green Kale & Apples Organic Kids'' Snack - 4Ct/ Pouches', 'Once', 
        'Soup',  3.2, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('1d179594-c235-4eff-9aca-eb96e06ee38b', 'Health-Ade Organic Vegan Pink Lady Apple Kombucha -', 'Health-Ade', 
        'Soup',  16.0, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('f5ae9d79-c52d-4716-993a-d0a6ffae0aa0', 'Bob Snail, Fruit Rolls, Apple-Sour Cherry, 10 Pouches,', 'Bob', 
        'Soup',  0.35, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('9222dffc-84fa-4f94-bd92-3696baf0cd41', 'Annie''S Organic Sweet & Sour Twists Fruit Snacks - /12Ct', 'Annie''s', 
        'Soup',  7.68, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('4366a293-8eb8-40c7-82d5-382df9979fb0', 'Stonyfield Organic Lowfat Cherry Apple Traditional Kids'' Yogurt Smoothies - /6Ct', 'Stonyfield', 
        'Soup',  3.1, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('7a073d9b-db0a-408d-8625-a318845375fa', 'Stonyfield Organic Lowfat Mango Apple Traditional Kids'' Yogurt Smoothies - /6Ct', 'Stonyfield', 
        'Soup',  3.1, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('3d9830f0-1d4a-4a81-a7b0-a384f3a822e7', 'Apple Pie Nutrition Bars - 5Ct - Good & Gather™', 'Apple', 
        'Soup',  NULL, '');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('f97e75ca-62dd-4e8f-b131-13095669a5aa', 'Organic Whole Grain Apple Cinnamon Fruit & Grain Bars - 6Ct - Good & Gather™', 'Organic', 
        'Soup',  NULL, '');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('75330bf4-42aa-4aea-b0fe-9ad3d710e769', 'Mott''S Applesauce Cups - /6Ct', 'Mott''s', 
        'Soup',  24.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('245b1287-80d4-4659-84cf-168b811ccbcb', 'Brainiac Kids Fruit Snacks With Omega-3S Mixed Fruit - /20Ct', 'Brainiac', 
        'Soup',  12.4, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('a8ff26f1-c645-4aa2-b89a-3f0fb20d48b3', '100% Apple Juice -  Bottle - Market Pantry™', '100%', 
        'Soup',  64.0, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('d8395eee-3da0-47c1-ae81-0ece215f49fc', 'Readywise Gluten Free Vegan Simple Kitchen Mango Freeze-Dried Fruit - /6Ct', 'READYWISE', 
        'Soup',  6.3, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('499b37b5-912d-4c21-a8ef-28f9576ea1fa', 'Gogo Squeez Applesauce, Apple Cinnamon', 'GoGo', 
        'Soup',  NULL, '');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('2fbf710c-1413-48b5-9cab-dfd7a189c820', '100% Apple Juice From Concentrate -  Bottle Market Pantry™', '100%', 
        'Soup',  96.0, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('865dd03e-c889-4643-9c02-e871d4387290', 'That''S It Fruit Bars, Apple + Mangoes, 12 Bars,  () Each', 'That''s', 
        'Soup',  1.2, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('8b8cfbde-4355-4c7d-a633-63e631c039ad', 'Olipop Crisp Apple Prebiotic Soda -  Can', 'OLIPOP', 
        'Soup',  12.0, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('3228fa4b-8c15-4b5c-a527-730863bfcac1', 'Welch''S Christmas Mixed Fruit Snacks - /26Ct', 'Welch''s', 
        'Soup',  13.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('81c908d7-3a86-4340-b7d5-7399dac4ef2f', 'Naked Mighty Mango Fruit Juice Smoothie -', 'Naked', 
        'Soup',  15.2, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('9fca2482-969d-4a95-8c9a-763627ef9223', 'Kellogg''S Apple Jacks Breakfast Cereal', 'Kellogg''s', 
        'Soup',  NULL, '');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('54995d2c-5d49-489a-bb91-73166252b05b', 'Mott''S Halloween Shapes Fruit Snacks - /28Ct', 'Mott''s', 
        'Soup',  22.4, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('7ac39970-da04-41e8-a09c-047aabfa637e', 'Bob Snail, Fruit Roll, Mango, 10 Pouches,', 'Bob', 
        'Soup',  0.35, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('3d202b49-99cf-45a0-9dd3-9e2333398559', 'Earth''S Best Organic Apple Toddler Snack Bars Sesame Street Sunny Days - 7Ct', 'Earth''s', 
        'Soup',  NULL, '');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('a3bca956-ccf6-45fd-9b19-2eff1917c398', 'Caramel Apple Whole Grain Baked Bar -  - Good & Gather™', 'Caramel', 
        'Soup',  15.24, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('5a922453-84eb-429b-a340-e533450a705a', 'Kyvan Hot Honey Apple Salsa -', 'KYVAN', 
        'Soup',  16.3, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('6d60bfc3-795d-447e-96e8-2a507262e4f9', 'Fresh Fuji Apples -  Bag - Good & Gather™', 'Fresh', 
        'Soup',  3.0, 'lb');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('f5726567-f63c-42ae-8bca-580e0080d0f6', 'Welch''S Juicefuls Fusions Fruit Snacks - /20Ct', 'Welch''s', 
        'Soup',  16.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('a0be26c2-6e0a-465c-93e3-f5968589470c', 'Del Monte Diced Pears In 100% Juice Fruit Cups 4Pk/', 'Del', 
        'Soup',  16.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('e92cc089-287a-4078-9ced-2fe2b293e548', 'Marie Callender''S Frozen Dutch Apple Pie -', 'Marie', 
        'Soup',  38.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('4c4800a7-85c9-44f4-bff7-1b9722accbe6', 'Welch''S Holiday Fruit Snacks Mixed Fruit Peg -', 'Welch''s', 
        'Soup',  2.25, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('3c4e994b-d029-47a9-b1ee-778a0f7a88fd', 'Brainiac Kids Fruit Snacks With Omega-3S Berry Blast - /20Ct', 'Brainiac', 
        'Soup',  12.4, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('46dfb35f-89e8-4ffb-94f7-a5176c06a6e2', 'Fresh Snapdragon Apples - S', 'Fresh', 
        'Soup',  2.0, 'lb');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('ecaec186-c030-44e4-a044-42ea6c6aac7c', 'Dole Diced Peaches In Juice Fruit Cups - /4Ct', 'Dole', 
        'Soup',  16.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('3cb7c103-8306-47c8-a0a7-e58bd87ec835', 'Dried Unsweetened Cinnamon Apple Chips -', 'Dried', 
        'Soup',  2.25, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('7fa4a300-4f6c-4c72-accb-2cef0bb5eb48', 'Fresh Rockit Miniature Apples -  Bag', 'Fresh', 
        'Soup',  3.0, 'lb');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('d3ae2237-9ea0-4d18-b933-c4fd34884c16', 'Naked Pina Colada Blended Juice Smoothie -', 'Naked', 
        'Soup',  15.2, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('dffa5dad-a8af-46e9-b837-ea4aa8d049e4', 'That''S It. Mango Blueberry Mini Fruit Bars - 10Ct/', 'That''s', 
        'Soup',  7.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('2ca8562d-b8da-42ac-b101-dee8ce030c54', 'Olyra Snack Bars Apple Cinnamon Fruit And Grain Bites - /4Ct', 'Olyra', 
        'Soup',  5.3, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('3bc4a935-8e6d-4db0-a073-5f21d5cb5c40', 'Gogo Squeez Applesauce And Fruit Puree Variety Pack, Apple, Banana & Strawberry - /12Ct', 'GoGo', 
        'Soup',  3.2, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('0f563cfd-8eec-4a49-be9b-9097b52640b4', 'Betty Crocker Harry Potter Fruit Snacks - /10Ct', 'Betty', 
        'Soup',  8.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('2d0be50a-33fe-4f60-809f-ef0acb290032', 'Honest Kids Organic Apple Juice Drink - 20Pk/ Boxes', 'Honest', 
        'Soup',  6.0, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('f34773e2-e2a4-499f-b544-044c008d46d2', 'Spindrift Fuji Apple Sparkling Water - 8Pk/ Cans', 'Spindrift', 
        'Soup',  12.0, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('b856b263-8718-4bcf-ac2e-1d490007b9dd', 'Dole Mandarins In 100% Juice Fruit Cups - /4Ct', 'Dole', 
        'Soup',  16.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('53394e3c-3185-4af3-a31f-7360d3f93e32', 'That''S It. Apples & Mangoes Flavored Fruit Bars - /5Pk', 'That''s', 
        'Soup',  6.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('eb4f8893-09a4-4492-a897-6a1bcd923f7b', 'Happytot Fiber & Protein Organic Apples And Spinach Soft-Baked Oat Bar - 5Ct/ Each', 'HappyTot', 
        'Soup',  0.88, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('4328c7df-3962-499b-852d-a2d7025f8157', 'Avocado - Each', 'Avocado', 
        'Soup',  NULL, '');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('f0788fa9-2324-44a6-9deb-584c9dbc6da2', 'Mott''S 100% Original Apple Juice -  Bottle', 'Mott''s', 
        'Soup',  64.0, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('61657962-8236-46dd-8566-4c1b4b5af07e', 'Fresh Organic Sweet Apples - S', 'Fresh', 
        'Soup',  2.0, 'lb');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('67bae964-1b98-48d7-b11b-f36633b3bd42', 'Betty Crocker Bluey Fruit Snacks - /22Ct', 'Betty', 
        'Soup',  17.6, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('57aad6b8-0aec-4137-ac8e-5b4b7535439f', 'Huel Rtd Daily Greens Apple Cucumber Mint Drink -', 'Huel', 
        'Soup',  12.0, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('22bed2a2-0310-4a20-a28d-7ba7abb42820', 'Red Apple Chips -  / 6Ct - Good & Gather™', 'Red', 
        'Soup',  3.18, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('18d4fe9d-b7da-4aab-9d4b-f822cddb0360', 'Fresh Cosmic Crisp Apples -  Bag', 'Fresh', 
        'Soup',  2.0, 'lb');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('19695b41-6a06-48d4-910a-3d0fdf1af2d2', 'Simply Apple Juice -', 'Simply', 
        'Soup',  52.0, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('43ebbc80-79f1-4443-a263-f0765e38812b', 'Izze Apple Sparkling Juice - 6Pk/ Cans', 'IZZE', 
        'Soup',  8.4, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('a14348a2-b978-4b8c-a59f-c44eabe5ba73', 'Bob Snail, Fruit Stripe, Apple-Pear-Blueberry, 6 Stripes,', 'Bob', 
        'Soup',  0.49, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('b0ccb1de-66f8-4635-a0e2-312a9cbd6a62', 'Mott''S Unsweetened Applesauce Cups - /6Ct', 'Mott''s', 
        'Soup',  23.4, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('97452d9c-5242-469f-9488-360cc96197f8', 'Dole Pineapple Paradise Tidbits Fruit Cups - /4Ct', 'Dole', 
        'Soup',  16.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('b1685c3f-eddb-47a5-b607-b9df34544223', 'Prime Bites Apple Cinnamon Raisin Protein Mini Muffins -  Protein -', 'Prime', 
        'Soup',  15.0, 'g');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('b475974f-3f6b-4f7d-9bb2-b6624184f300', 'Mott''S Cinnamon Applesauce Cups - /6Ct', 'Mott''s', 
        'Soup',  24.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('0b8e722c-faf2-4acb-a509-bd3e419ae9e2', 'Honest Kids Organic Apple Juice Drink - 8Pk/ Box', 'Honest', 
        'Soup',  6.0, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('91fe4133-c6cb-4ff9-9edf-6865c7f56e1f', 'Mott''S Soft Baked Apple Filled Snack Bars - /5Ct', 'Mott''s', 
        'Soup',  6.55, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('ce5ebeac-2a94-4adb-a86e-df75fd7733fb', 'Crunchpak Paw Patrol Sweet Apples - S Bag', 'CrunchPak', 
        'Soup',  3.0, 'lb');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('b0d981a0-6fe2-4f36-a2e9-80bdc5121406', 'Apple & Eve Sesame Street Big Bird''S Apple Fruit Juice - 8Pk/', 'Apple', 
        'Soup',  4.23, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('7f1ed9b2-09dc-4239-9aa8-f2f79651c527', 'Family Sweet Li Hing Mui -', 'Family', 
        'Soup',  6.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('371bf2cd-9800-461b-916a-e6ddd855ea98', 'Brainiac Kids Fruit Snacks With Omega-3S Mega Apple - /20Ct', 'Brainiac', 
        'Soup',  12.4, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('23e95c24-4640-45b5-9b69-657efb6a0889', 'Noka Blueberry Acai Superfood Smoothie + Brain Support Pouches - /4Ct', 'NOKA', 
        'Soup',  16.9, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('91739652-ec16-4d3b-9552-49ca972af8c8', 'Martinelli''S Apple Juice -  Bottle', 'Martinelli''s', 
        'Soup',  64.0, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('24642284-bbb7-4f02-8ebc-39f8a541b7ec', 'Gogo Squeez Applesauce, Apple Apple', 'GoGo', 
        'Soup',  NULL, '');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('ca8d982d-79ac-4a79-8557-fab077519184', 'Fresh Kanzi Apples -  - Good & Gather™', 'Fresh', 
        'Soup',  2.0, 'lb');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('cb922e07-a058-45d5-8526-39376e1b28f3', 'Readywise Vegan Gluten Free Simple Kitchen Sweet Apples Freeze-Dried Fruit - /6Ct', 'READYWISE', 
        'Soup',  4.2, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('94df9774-9c64-42fb-a535-411fa22d3147', 'Bare Baked Crunchy Granny Smith Apple Chips -', 'Bare', 
        'Soup',  3.4, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('33910508-06f6-40f3-95df-cdc5c0f7ae3f', 'Del Monte No Sugar Added Diced Peaches Fruit Cups - /4Ct', 'Del', 
        'Soup',  15.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('e1c98917-8ac8-4902-92c7-38b2d2e8fd4f', 'Air Wick Scented Oil Air Freshener Spiced Apples -', 'Air', 
        'Soup',  1.34, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('5097ce14-eeeb-4271-a960-a2df510a4f8e', 'Fruitblox Unspeakable Apple & Strawberry Fruit Snacks - /22Ct', 'FruitBlox', 
        'Soup',  17.6, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('a9484d42-9a82-4c4b-80b1-ed4b68f4bdc2', 'Freeze Dried Apple Slices -  - Good & Gather™', 'Freeze', 
        'Soup',  1.25, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('9007144a-c12c-4c5a-a4a1-c7b4d30bf995', 'Bob Snail, Fruit Stripe, Apple-Raspberry, 6 Count,', 'Bob', 
        'Soup',  0.49, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('83055139-4b9d-4e0a-9e94-74376ea3d63d', 'That''S It Fruit Bars, Apple + Apricots, 12 Bars,  () Each', 'That''s', 
        'Soup',  1.2, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('a46e7ea5-f6e5-464b-9765-a1c0629c836d', 'Apple Cinnamon Soft Baked Breakfast Bars - 8Ct/ - Market Pantry™', 'Apple', 
        'Soup',  10.4, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('763d645b-2300-4b42-a121-9ed1644d6fd0', 'Kellogg''S Apple Jacks Breakfast Cereal', 'Kellogg''s', 
        'Soup',  NULL, '');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('925532c4-5910-4832-808d-619b49d5774c', 'Bare Baked Crunchy Cinnamon Apple Chips -', 'Bare', 
        'Soup',  3.4, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('fcb946b1-b5f8-4321-b467-a0ba781512a8', 'Dried Unsweetened Honey Crisp Apple Chips -', 'Dried', 
        'Soup',  2.25, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('3c6f2682-a196-4581-8c86-c4bef88cb73e', 'Sweet Apple Snackers With Pretzels & Cheese Crunch Pak -', 'Sweet', 
        'Soup',  3.9, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('527192ce-c228-4812-9474-255e1911e69d', 'Bob Snail, Fruit Rolls, Apple-Black Currant, 10 Pouches,', 'Bob', 
        'Soup',  0.35, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('a45a950c-9340-4a5c-8f9e-a11bc486f1a9', 'Yumi Organic Apple And Cinnamon Squash Baby Snack Bar - /5Ct', 'YUMI', 
        'Soup',  3.7, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('dcafcaf9-48a6-4030-98a6-62daeea2f11f', 'Fruitblox Aphmau Mixed Fruit Fruit Snacks - /22Ct', 'FruitBlox', 
        'Soup',  17.6, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('2a7bef8a-20c2-417e-8729-792aeccd5b35', 'Welch''S Fruit Snacks Berries N'' Cherries & Fruit Punch - /22Ct', 'WELCH''S', 
        'Soup',  17.6, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('b1606524-dccb-4c78-bb63-66262fd4281c', 'Olipop Crisp Apple Soda - 12Ct/ Cans', 'OLIPOP', 
        'Soup',  12.0, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('a6f87f23-bf23-4016-925f-2fd26fe57d9e', 'Mamma Chia Organic Squeeze Vitality Snack Wild Raspberry - Case Of 16/', 'Mamma', 
        'Soup',  3.5, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('6199cb79-61f8-4c1e-91d6-6e19ad9d0e9f', 'Freeze Dried Cinnamon Apple Slices -  - Good & Gather™', 'Freeze', 
        'Soup',  1.25, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('2e20cc6c-6433-47f8-ab3f-a7692cc9c5fa', 'Fresh Honeycrisp Apple - Each', 'Fresh', 
        'Soup',  NULL, '');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('21464c37-9965-45ae-933f-440d7f927a8b', 'Poppi Raspberry Rose Prebiotic Beverage - 6Pk/ Mini Cans', 'Poppi', 
        'Soup',  7.5, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('1aecab50-a18a-44b9-aa63-d447521672d3', 'Bob Snail, Fruit Rolls, Apple-Strawberry, 10 Pouches,', 'Bob', 
        'Soup',  0.35, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('f0800958-669f-431d-8a82-0cdb021fb740', 'Fresh Sugarbee Apple - Each', 'Fresh', 
        'Soup',  NULL, '');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('b4446c1d-b3e7-45b7-94cd-1c99506b2bd6', 'Katz Gluten Free Fritters - Apple - 6 Pack', 'Katz', 
        'Soup',  NULL, '');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('531e6173-57ca-47ae-8576-0120f2204077', 'Fresh Granny Smith Apples -  Bag - Good & Gather™', 'Fresh', 
        'Soup',  3.0, 'lb');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('ca05c6c1-4e39-4a3e-b00e-88c50c6c2b2d', 'Naked Juice Rainbow Machine -', 'Naked', 
        'Soup',  15.2, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('885bb35d-d7e2-47a0-b1a3-6eb43f87d7bb', 'Betty Crocker Fruit Roll-Ups Variety Fruit Flavored Snacks - 10Ct/', 'Betty', 
        'Soup',  5.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('c8cd840f-381e-4659-b66e-db7e7af51342', 'Seneca Original Red Apple Chips -', 'Seneca', 
        'Soup',  2.5, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('d4a4e831-e753-4793-baf1-5c0222a37daf', 'Bare Apple Chips Fuji Red And Cinnamon Snack Pack - 7Ct/', 'Bare', 
        'Soup',  3.7, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('91704b1d-07cc-43c7-9b67-aa23f04210c9', 'Concord Fresh Success Apple Crisp Mix -', 'Concord', 
        'Soup',  8.5, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('1dbb0322-b4f1-4730-bd21-3d38ac651680', 'Gogo Squeez Applesauce, Apple Apple', 'GoGo', 
        'Soup',  NULL, '');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('55c2310c-c90b-4dda-9233-84c1010b38f7', 'Once Upon A Farm Ohmymegaveggie Apple, Carrot, Beet Organic Kids'' Snack -  Pouch', 'Once', 
        'Soup',  3.2, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('3206afc2-39df-4c13-8c68-1d6527c1498b', 'Nature''S Bakery Apple Cinnamon Fig Bar - /6Ct', 'Nature''s', 
        'Soup',  12.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('ed5cbe0e-34c6-4725-a084-9a4e9c65722d', 'Dole Mandarin Oranges Fruit Cups In 100% Juice - /12Ct', 'Dole', 
        'Soup',  48.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('c571f2cf-3b7a-430c-a44a-e5ee91639340', 'Gerber Toddler Apple Prune Juice - 4Ct/', 'Gerber', 
        'Soup',  16.0, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('e25c6062-e9bd-4c79-b5bc-c0d93fd0199f', 'Paw Patrol Apple Cheese Grape Cookies Crunch Pak -', 'PAW', 
        'Soup',  3.65, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('a118d938-bcb7-40fb-948f-58fc8e304022', 'Fresh Granny Smith Apple - Each', 'Fresh', 
        'Soup',  NULL, '');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('fbead265-edfe-418a-8aa7-4e4cb391731f', 'Fresh Sweetango Apples -  Bag', 'Fresh', 
        'Soup',  2.0, 'lb');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('c3243dcb-9353-4b5c-b509-11fb9499ae03', 'Poppi Raspberry Rose Prebiotic Beverage - 4Pk/ Cans', 'Poppi', 
        'Soup',  12.0, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('f1ece033-0a3c-44e8-922b-9af44f10bb00', 'Baked Honeycrisp Apple Chips -  - Good & Gather™', 'Baked', 
        'Soup',  3.5, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('b11df752-76d0-4699-9e23-ac149ae52e6b', 'Gogo Squeez Applesauce And Fruit Puree Variety Pack Apple & Cinnamon Pouches - /20Ct', 'GoGo', 
        'Soup',  64.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('4f4d16f3-c53d-4098-95a0-669ae9045ac6', 'Mixed Fruit Flavored Snacks /1Ct - Good & Gather™', 'Mixed', 
        'Soup',  3.5, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('46d6d6f4-96aa-419c-88e7-99b5a566105c', 'That''S It. Cherry And Pear Mini Snack Bars Variety Pack - /10Ct', 'That''s', 
        'Soup',  7.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('95c75dbe-1ae2-4016-a215-d8fda7743402', 'Gogo Squeez Fruit & Veggiez Applesauce And Puree Variety Pack Apple Banana Parsnip & Apple Pear Zucchini & Lime Pouches - /12Ct', 'GoGo', 
        'Soup',  38.4, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('213a9397-dc19-4897-9ac4-6b7e262187f5', 'Del Monte Diced Peaches Fruit Cup', 'Del', 
        'Soup',  NULL, '');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('14036922-5b02-4c20-b968-e7a88125a90b', 'Fresh Organic Granny Smith Apples -  Bag - Good & Gather™', 'Fresh', 
        'Soup',  2.0, 'lb');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('4f1d60bc-3bc0-4e0a-82ef-7705636b0272', 'Fresh Sugarbee Apples -  Bag', 'Fresh', 
        'Soup',  2.0, 'lb');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('4576b89e-ecb2-45d6-a5b4-4d139bd48295', 'Once Upon A Farm Apple And Oat Snack Bars - /8Ct', 'Once', 
        'Soup',  9.6, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('40a0ef02-ec0e-445e-a7a3-892ad6da36a3', 'Fresh Mcintosh Apples - S Bag', 'Fresh', 
        'Soup',  3.0, 'lb');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('bca5da56-d248-4ead-901b-529ec72c2f0b', 'Navel Oranges -  Bag - Good & Gather™', 'Navel', 
        'Soup',  3.0, 'lb');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('fdd65ab0-8757-4fd3-99e3-70796d4040ca', 'Gogo Squeez Applesauce And Fruit Puree Variety Pack Apple Peach & Gimme Five! - /20Ct', 'GoGo', 
        'Soup',  3.2, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('5419c98c-8ee6-4a4c-aa01-fab56d194b11', 'That''S It. Organic Mango Lime Blends Energy Bars - /6Ct', 'That''s', 
        'Soup',  4.2, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('03e5d3df-cd90-41c1-984e-6048c4d8af2e', 'Dole Mangos In Juice Fruit Cups - /4Ct', 'Dole', 
        'Soup',  4.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('f5e15b2e-e46f-4ac9-bcd0-0263904a4e6e', 'Fresh Gala Apples -  Bag - Good & Gather™', 'Fresh', 
        'Soup',  3.0, 'lb');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('e16ae37e-b5f0-4f8b-91ce-ad706b165a1b', 'Martinelli''S Apple Juice - 9Pk/ Bottles', 'Martinelli''s', 
        'Soup',  10.0, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('89a0d833-d1d9-4f2b-8915-1875c72c73f1', 'Bear Strawberry Apple Fruit Splits -', 'BEAR', 
        'Soup',  3.5, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('8192de8f-fe24-4b4b-92f1-ac12805b83ac', 'Amish Wedding Apple Pie Filling Pre Cooked Real Natural Flavor  Jar', 'Amish', 
        'Soup',  32.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('0c75c93a-fb59-4954-9495-15c6489ee2c8', 'That''S It. Apple And Strawberry Nutrition Bar -  - 5Ct', 'That''s', 
        'Soup',  6.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('6e96f078-6185-4519-aed7-446ce1ed668c', 'Poppi Orange Prebiotic Beverage - 4Pk/ Cans', 'Poppi', 
        'Soup',  12.0, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('9c1b6f55-36fa-46b0-8793-b3db9ddd1d19', 'Fruit Gushers Spooky Halloween Mini Fruit Snacks - /26Ct', 'Fruit', 
        'Soup',  11.44, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('1842f8c9-353b-461f-8ed2-499d48227134', 'Cheerios Breakfast Cereal', 'Cheerios', 
        'Soup',  NULL, '');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('f534e612-0de0-4d68-ac9f-bb62c89b92fd', 'Drink & Play Apple Spring Water -', 'Drink', 
        'Soup',  10.0, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('430e5509-f3b1-454e-abbc-af515d72c88d', 'Mott''S Fruit Smoothie Strawberry Banana Pouches - /8Ct', 'Mott''s', 
        'Soup',  33.6, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('bb27b877-5040-448f-add0-7848a8cd5734', 'Mamma Chia Blueberry Acai Squeeze Vitality Snack Pouches - /4Pk', 'Mamma', 
        'Soup',  14.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('49e72c8a-e9fe-48fb-ad12-ccfced94b4a6', 'North Coast Apple Sauce Cinnamon 4 Pack Pouch Organic - Box Of 6 -', 'North', 
        'Soup',  12.8, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('9f03c5a5-7d7a-466e-aa7c-71efbc765522', 'Diced Pear No Sugar Added Fruit Cups - /4Ct - Market Pantry™', 'Diced', 
        'Soup',  16.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('45ef2afe-2933-4943-8057-218e727d6ae5', 'Nutri-Grain Apple Cinnamon Soft Baked Breakfast Bars - 8Ct/', 'Nutri-Grain', 
        'Soup',  10.4, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('83209c6d-c170-4e02-9d36-a92c5945aa55', 'Fresh Organic Honeycrisp Apples - S Bag - Good & Gather™', 'Fresh', 
        'Soup',  2.0, 'lb');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('6c0d991d-c218-4f33-aa3d-82393da345b2', 'Goodrow 100% Apple Juice - 3Pk/ Bottles', 'good2grow', 
        'Soup',  2.0, 'g');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('ae56b617-bdd8-4ee3-a32e-5dbfac81e898', 'Unsweetened Diced Apples -', 'Unsweetened', 
        'Soup',  3.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('9f1965a9-d3e1-4b32-8ecb-7be3144263bb', 'Poppi Orange Prebiotic Beverage - 6Pk/ Mini Cans', 'Poppi', 
        'Soup',  7.5, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('caf4f109-eaa1-4422-a53f-9fa9b662dee1', 'Mixed Fruit Flavored Snacks /22Ct - Good & Gather™', 'Mixed', 
        'Soup',  17.6, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('e119e509-843d-4791-ba7e-81756ee37a0a', 'Fruit Cocktail In Fruit Juice -  - Market Pantry™', 'Fruit', 
        'Soup',  15.0, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('edf9e3b9-c3ad-4a79-9e20-83b225e1f6dd', 'Poppi Watermelon Prebiotic Beverage -  Can', 'Poppi', 
        'Soup',  12.0, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('99f1b965-c8b4-4c0d-ae08-719d307f6a91', 'Organic Apple Cinnamon And Spinach Snacks Bars - /5Ct - Good & Gather™', 'Organic', 
        'Soup',  3.17, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('50355853-9324-46f1-9fd8-faa6f695e968', 'Apple Mango Spinach Baby Pouch - Yellow -  - Good & Gather™', 'Apple', 
        'Soup',  3.5, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('4737eeb8-1299-4b1f-bcc0-4421d55e29a2', 'Seneca Granny Smith Apple Chips -', 'Seneca', 
        'Soup',  2.5, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('a78a9a50-e2bb-4764-b54e-481111a614cc', 'Drake''S Apple Fruit Pies - /8Ct', 'Drake''s', 
        'Soup',  18.04, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('1302bad4-b143-403f-bddf-a9fbbbe9e014', 'Gogo Squeez Fruit & Veggiez Applesauce And Puree Variety Pack, Pedal Peach And Speedy Strawberry - /12Ct', 'GoGo', 
        'Soup',  3.2, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('10c61412-e456-4b5d-9398-0a97980b7dab', 'Sweetango Apple - Each', 'Sweetango', 
        'Soup',  NULL, '');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('631d3d1d-3fde-4537-b6d2-8c94ac9b8fff', 'Red Apple Chips -  - Good & Gather™', 'Red', 
        'Soup',  3.5, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('24c23ccd-b8cb-49c5-8d8b-b344f51b54b6', 'Gogo Squeez Applesauce And Fruit Puree Variety Pack, Apple, Banana & Strawberry - /20Ct', 'GoGo', 
        'Soup',  3.2, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('eba24d39-78b9-465f-9541-252a4f4a7294', 'Naked Blue Machine Juice Smoothie -', 'Naked', 
        'Soup',  15.2, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('8085c797-456d-4f83-b1e5-26cf2c9bcf0a', 'Poppi Orange Prebiotic Beverage -  Can', 'Poppi', 
        'Soup',  12.0, 'fl oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('56e2414f-757c-408a-99bb-d26e51bb3dc0', 'Madegood Snack Bars Apple Crumble Oat Cups - /5Ct', 'MadeGood', 
        'Soup',  1.23, 'oz');
INSERT INTO Item (id, name, brand, category, size, unit)
VALUES ('8aaf3bea-7d94-4c85-ab50-a11bc32bcf7b', 'Old Orchard 100% Frozen Apple Juice -', 'Old', 
        'Soup',  12.0, 'oz');

-- Item Prices
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('83feb570-7f5b-48d6-929f-7d04fb504b69', 'db177b0c-cd54-4460-bb80-1377db92c2f2', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 1.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('ee653624-daea-49e9-abb3-2633c8d6b464', 'e6760b34-66d5-4c60-8dbe-68758cd7e80d', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 3.59);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('3e703a91-7013-4c8a-bb02-31a20caed977', 'e41f5a58-849d-4f15-ba87-e4083998b6f3', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 5.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('7f5c9793-e8ef-42e8-88ca-a64f9f1678ed', '617cb80c-96e2-4961-bec6-f3264e0eb561', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 4.09);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('c0d7a7b1-e76d-48df-84e3-c955499195df', 'efbc4488-f03c-4b71-a757-802054b85513', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 8.45);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('40a7f04a-082b-4d6e-9ed7-316c5c6bb269', '27e1fc35-d335-4f8b-8d52-d9da47ba7ff5', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 1.09);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('e965724c-6d8b-4840-bcdf-a548159b1dbe', '092bfaa3-bd2e-4dcc-a96b-489c4e4546f3', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 8.15);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('9ad510e5-973d-4865-a790-7a6645c7e05b', '705fc9f9-d173-4beb-9723-39bd674b8dea', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 1.09);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('2cb41aa3-d719-446a-8a28-03ea56f499bb', 'a3fe9f2d-2a9f-489a-8050-166983349f9f', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 3.55);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('03f62de7-6627-4e88-9168-f1907284f62d', '4e031df5-e44f-4e06-a88c-9d898bc6b889', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 2.09);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('96650c49-552c-4c22-a964-ec9f0dae8758', 'fedcdbe0-4511-4cbc-9211-5333773581b8', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 2.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d1455ce9-934e-45ef-8fcb-4d0082e03c3f', '48bcfb22-4334-4cc6-99a7-eae1245fbe36', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 0.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('e5a06e37-6f5a-4d6d-b3f7-bf7997ea4887', '68f34a63-b028-4a63-8824-e9ea9769c41f', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 0.55);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('f5e61d06-9d1a-4076-ae76-6e6f31b10e03', '8da3eff1-57a3-4b06-b679-7cf570215bf3', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 2.15);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('7e9fee04-f858-4f12-866d-3fdf08dd9d50', 'b08b2071-ffe9-4da9-8f82-f98489984ac3', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 2.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d8c5ddf1-c0b5-41ed-a885-9f1d40363f2d', 'd8744e20-629c-49ce-8228-26c627c228dc', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 5.05);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('f8a1c770-05fc-4b6a-a651-bb0542f6e9ab', '7ab895e0-21c1-4ea1-8bee-3041aece4848', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 0.65);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('0c2f0d1e-d091-48ba-bb0b-d4a794b83792', '0258ebd1-4d1c-4d89-8d2a-7bb7bf1ab784', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 2.75);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('bfee22b1-fc1c-498f-9cff-daf66178c05a', '3ce5561c-1283-45f7-ad27-a35959188a80', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 2.85);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('7608e933-275e-4fc9-9ecf-69d79812bf21', '0c4cb5c1-6a00-4c53-8782-323bcec8f91b', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 4.65);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('dd86da4d-4fa4-4063-a577-4fdec9fe8a24', 'b2680c55-e6d1-451f-81aa-4eec05996632', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 3.75);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('4202e255-024e-438c-a316-fbca133eca99', '44812c68-4e4d-405e-b2df-c4c2a13bb30f', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 0.65);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('0130bc8e-dc73-4b76-9aca-b823d7d79226', 'ddce0a30-721f-422e-a654-65ed72c7809f', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 2.09);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('9b1c76c5-eda9-4deb-97f7-1bca932e11e1', '059acf73-ac6e-4e49-993a-ce5ecf3fcc08', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 7.15);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('e3c0fe2b-1445-43f2-be8a-bcc4cf094f76', 'cb719244-040a-4436-a7b6-3092507c202b', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 2.85);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('3014fa82-51b1-472d-b069-baf6f6f4abe9', '11f4c695-13c8-4907-a397-198c333d7a3d', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 8.25);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('aaba5ef4-4f9e-49aa-8174-2fe027b77cda', 'ebbc4cf6-359e-4897-a256-1bd0b710ad16', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 16.79);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('02d8897f-db5e-4e06-97d9-5d86302f89d3', '9d1a7a14-c1f0-44da-bd7e-33cb5680936d', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 6.95);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('3341ebf7-3bf0-4dbc-bdff-25c6e61d46e9', 'f09c517d-101e-4f29-8aec-e720b3eafb37', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 2.85);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('009644cc-6192-4938-9f40-cea230825b56', '80897074-8a48-4436-b1fb-c1e2635e208f', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 2.85);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('a407cfd7-2b5a-4b81-b453-1d9f34ccfca3', '4e5193e8-1453-4aac-bd7e-4c5f79d5971a', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 3.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('30e0716a-4a00-49b0-8256-09933c6bb498', '25640b66-5678-4cbd-8244-5e16d3cd4bb1', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 3.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('70a6c34f-f638-4685-9570-bd1e03991403', '44a8d109-bc1b-499f-82f6-5184d3c60f14', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 4.39);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('70db9311-9f4a-4d06-bcd4-6f8b61ed6fe4', '66d00708-2847-4847-ba4a-698b272c728e', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 2.75);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('dded2cac-8c4d-4c64-94ea-51869ce6fc0c', '814b5bd5-81d2-488d-8d4e-9360988759be', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 3.85);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('65da5814-86a3-4285-8817-3718d2901c31', 'f689c25a-7cc7-44ea-bfe6-6e0c4c5093ea', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 3.85);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('2a25e033-da53-4c5a-925f-26bb8a349c93', '2c02a9fa-77c0-495f-a096-af61d88b9d16', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 3.85);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('4ec10484-8fc8-4fb7-9a26-7046737ad488', '23c2571e-f29a-47b6-8ee5-191c4929e909', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 1.55);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d8b64735-eb17-4f0b-9a49-6fcba3de0ca9', 'fd7d519b-e74e-41c6-afbe-d90c484bdf8c', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 3.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('45d76c00-a356-4296-ae32-5502b23e992f', '42413112-5be5-472b-8ffc-a2b5b739d433', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 3.25);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('ea936122-46ab-45a5-a1aa-91e454baf3d0', 'ed2218e6-841f-46f9-a26e-0fd462173ebe', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 4.39);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('5f4af344-68d8-429e-b4b8-6f2eeff36697', '201c4da9-a6d5-455d-9440-65d3ab0c1f77', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 4.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('4566a36d-9fb1-4e42-babf-e47daa20854e', '5e2a6983-fb76-4497-9692-411d68f2db44', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 2.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('ceca753b-3868-480d-a00f-8950f49f9f86', '427fe77c-f2d2-43f0-a779-0b9b3abe0c3f', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 5.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('7dc60791-cbe3-4f71-9066-5982f2b345ad', 'f15d4a7e-e5f2-4027-9a36-c40e0c9ad078', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 0.79);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d0596111-432a-47e3-8a95-de8405791dde', 'e70da2c3-6f73-460d-9a0c-0df05391d961', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 1.55);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('831a7d28-faca-4d6a-84d9-f07ff45373f0', '31962d72-497c-4382-abd3-b278d22ad642', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 1.89);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('df968766-0f6e-4b5b-8d51-8f3dca2c8ec0', '7c8657cd-7cbb-4b02-a005-143fd3ead9fe', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 2.05);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('be08e4ee-09a1-43c4-8bb9-ef5a02cf2d92', 'dc639576-f8fe-4757-86f8-4d9917a924ea', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 5.39);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('57db0701-0205-4267-8a86-ddd32bf71fdd', '42e4b4cb-3bf7-46ce-803e-878b685bf3bd', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 3.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('f37ed7f4-77cb-456d-b2c6-4284e4acbf65', 'a7e4d05c-75c0-47aa-96c3-dd4f6d6cf1cd', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 5.89);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('5694a454-52d5-4d20-b02b-9ea8771f60b8', '98074393-af6d-49d5-b15f-e14a50ba9d9b', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 1.09);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d6f2f25e-73de-4a1a-93e3-1b8c53898a4a', '48a7b61b-fba8-4bbb-916d-70884c349010', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 1.09);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('7a74ad1a-2509-4625-8714-9829f28c0e83', 'b6b6c563-c798-43d0-ad82-8d6c56181ee9', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 1.09);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('dd33bd7d-b2e5-4c23-a4de-d0b031e63a8c', '10de16c7-21f0-4c4b-8618-7991d4fd9207', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 7.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('641b1d5b-b808-46c1-b35b-31d56668e316', '38afe0ee-c83d-456f-8bde-b7007e08cedb', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 8.79);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('f3271980-c957-49e7-a96e-951979cd3321', '187c8126-5fe4-48ce-8c41-550c91033f38', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 2.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('32650e67-da71-4a02-b3a6-6282f6f46130', '8a9ae54a-6c7c-42bd-adb3-83cbebd07997', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 4.39);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('cf4ba29b-5daf-48ff-b8d6-bc91c6bdc9b3', '4c10d690-1b0c-43e2-9417-5484463ab1fd', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 4.39);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('042de393-b6dd-4ef7-a5f0-0882ffa1ca56', '3910a284-52c6-427d-9807-b1ab49855e09', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 5.45);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('0ee38afb-47a2-49b7-b57a-7ea908a554cc', '84623346-aa5d-483b-b351-38968bb02e3b', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 1.05);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('b743bb7b-cfa9-460a-9386-f3ab97020437', '8a22ce7b-5c71-439c-bea0-6b58e5ed38b0', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 2.55);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('79b867c3-b45b-4dc5-aa81-361d5b2933f2', 'ed448d61-fe5e-4fa3-afaf-da6dc6c1258f', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 2.15);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('8b6fd9b0-c459-4cca-857a-3f5f59559d88', 'c0d47e13-dbc7-4363-bcc4-d726f9a4593b', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 1.05);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('9ac3c044-d4c3-4120-a30f-61e0500bdac2', '101c2330-fbe1-40c6-b0c3-24e1dd6b811e', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 2.05);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('2700e45e-4b39-40fc-a23d-1056dd82feaa', 'f574b259-c79f-406a-b8a5-91280605f94d', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 2.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('28cd5687-0cd8-4ce7-986a-11a2aca5a842', '6c5d4a0a-f1cc-4e47-aa74-6b5ea3189804', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 3.55);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('2e4c2ca4-dd57-4873-a612-59391e99df96', 'ed0d51a5-6823-4d45-bca1-0f236de06051', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 4.39);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('7073eee6-9fc3-42d1-9a16-626c628a113c', '154d4e07-4b19-4c5d-be77-8cc6c0c193fa', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 2.55);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('e8d18c5f-f6bc-46b5-83dc-a18241b85907', '980d765c-e132-4d9d-80a2-10ae847c7f4c', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 1.65);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('dcd2519e-9cd5-4dac-b747-61cb726ed4bc', 'f1ae711b-916a-4e4b-ba24-f206bd2ac261', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 4.85);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('da62088b-4782-4369-af82-b4cd20f28eba', '021bab26-de59-4e68-95f9-efe147de3d25', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 4.75);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('6c32ec7f-0f79-4c16-86d0-59a2bc2a7fd8', 'e65dd5bb-d76c-47fd-bacb-403f32ba9935', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 5.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('7e575701-ba3b-4c19-ac4d-c76d38b3b661', 'f5bdddf8-00be-4b9c-a5e3-3f1817132dec', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 6.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('40ec6806-f6be-4126-ab8d-0a83721ee563', '39fcfbcb-e162-4f97-a699-ff0b2fab27d1', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 2.75);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('34929185-64db-40be-b6eb-4cb0d0226167', '9b1802a4-1ee4-498f-b740-91685bd5241e', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 2.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('93e5c8da-fffc-4dd1-a635-6fab6abad1fa', '4a9f7454-ed4d-4c82-b89d-74ee11374171', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 8.25);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('78d74d58-9e44-43f8-935f-78ad623d6bbc', '2a221741-7ac4-41dc-9ce5-18e7afdaeb36', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 5.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('b27f3f23-5dbd-485d-8ded-03274ccde8a3', '566b404c-3e41-408e-ad83-a85a7a502266', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 3.95);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('30b01be0-0a9d-4e3f-83b8-0cda69a0a663', '458aee5a-974a-4af1-9de5-0305b54cb414', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 2.85);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('ff2c8f61-f36f-49d7-b9eb-434745f3b3b8', 'c57349c1-40b2-4c0d-90fd-ffe1d459967e', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 6.05);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('5a70ed81-116e-431b-a9ca-569f46a25a4e', '71bfc40b-a199-49c9-b379-e6ade63a9c12', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 1.89);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('63ccf01f-bdbc-4c5a-874e-964f69c9793d', 'c4878a17-990d-472c-bff7-30843bfdeb1e', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 2.35);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('df31e376-c5d1-4dd4-99b4-9efddcaaf441', '03b39184-89b7-4d77-be80-1ae88d4a7191', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 1.75);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('c086e75f-3679-463a-8d6f-bfa3da6a70d0', '3802f1cb-9e66-43ff-9640-7e3ba43bbd42', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 1.75);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('933a553e-7cbc-4481-9247-4afca1f073d3', '6aca59a0-5ace-4d7c-93c2-2b486dc5d129', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 0.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('5bbda632-50c8-4049-ad20-5f36dad6e8ff', '329ee0e3-6326-4e76-b1d9-27e994b3f40f', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 0.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('14dadcdc-4f64-4283-a788-99922a7a4583', 'f1191ef1-196e-4bab-b468-f169da9d67cc', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 1.75);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('0223741c-aca1-4f60-959f-b2301a54c59c', 'f06fb7f6-0051-43f9-b852-3d385f3edc3d', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 2.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('bec5cdd0-13d0-44a3-9679-2b3d6b0a0db0', '45a8965b-85b9-4a5b-90fe-93097725a4da', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 2.55);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('91b388b7-6424-40fe-bba2-ac00a9807199', '1d38382e-d516-418f-ba56-fa95cee734cb', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 2.59);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('4a6aca90-5b1d-4822-9c77-e6d23d89b7f1', 'ee8fcda7-352d-4e03-a19e-e9a41372a545', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 1.09);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('68c8ec83-6163-42ee-a038-84525104ac47', 'be9ab4ba-181e-4e95-a013-bb622b144731', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 2.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('9ca3ca88-9efe-465f-8ce6-67084b823604', 'a8f8deaf-703c-4fa0-9150-2934c2c84924', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 3.65);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('f0860828-cabf-46ef-b60d-633460215544', '80691dbc-d340-4b51-9e65-ef114e9a7fbd', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 2.75);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('740e2414-cb0d-4314-9a46-6b9bcadf388d', 'd5780ab9-d422-4089-b029-aaadcb23ae53', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 6.25);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('7792a902-a44b-4d28-90ec-70d7d82f0f2c', 'cdee97f1-77c8-4676-86a2-a8a31edbd475', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 6.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('ace0d414-89fc-4c70-be81-28de3e2d4b07', 'f3c8984c-aa42-4ecd-b3ba-d2fc82095ce1', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 6.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('5351bc18-a62c-4081-a42f-59c0a762afa8', '59b7ba68-69ac-42a6-9b15-43621ea62747', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 6.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('5ca6b1e0-1f4c-4b20-b270-767167b9bd5d', '27ffbfb0-1086-4800-9f55-43e4365ab51e', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 6.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('821b05ef-4e98-4623-8e01-d8db3cfdc9fb', '8ba70f5c-f826-43f2-b026-ccef09e8a61c', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 6.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('cf8a2a6f-8fd4-4a21-ba34-8461ad2728bb', '0008f541-3ed8-4f88-acde-fd86bec0c878', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 4.09);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('17f51a34-2fd8-48df-b212-b1bb1005fe57', '7960d317-8533-43d2-bd11-d95c799aa0ac', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 2.15);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d0a039aa-297a-4d32-b1ec-2b9308e47e4f', '04c2205e-9074-4f8e-aad5-8a8bab2db5ce', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 4.55);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('0782d5a2-89fa-4424-8ffc-f7b6c5a0ff67', '59fb3ce7-6296-4312-acb6-649fb2ce3f4a', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 1.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('c08d4649-6548-4444-9f81-860046870957', '22c2cf56-123e-422b-a0c1-9f5ac9261870', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 4.79);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('61e97ef7-260a-4141-b4cd-b0a15bdbec06', '9d151ac8-44de-47d9-bd42-b6c7455fc9c9', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 6.45);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('499d277f-b181-47d5-8f4c-8bf4ab09335e', 'b74cc794-1ab4-44f4-857d-0c030e19e48e', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 2.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('cafd4ea9-492f-4501-a8df-09647e9b215c', '954afb22-74d5-4a4b-8118-d1414a2e0537', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 1.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('dbd91419-d944-4b0c-8be7-21a555a2a4c2', '3b2528d8-a84b-4ed8-89e8-6e81b893efbc', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 1.09);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('e8e10127-404b-4c29-b7d7-359644a67cfc', '0ed15f0f-3d42-4561-aacb-f4c9c9d73cf9', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 1.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('8b609073-493b-4656-9fb2-8d0f9e24697f', '155dec2d-4b49-4330-88b7-8f5e5ee985b7', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 5.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('3e1601d7-dea5-4592-92d6-03f728189d69', '8c563430-f170-4d29-bd2b-5563d18a750e', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 1.09);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('ad8be1a1-6510-44cc-98c4-d8e498bb9fdd', '0bb08794-180f-4619-a30a-4cdcec1c9354', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 1.09);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('7d90efb8-75a2-4b71-b844-963da04687ab', '840ce2ac-310b-4cc8-b674-0061d35fb5b9', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 5.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('9fc287aa-fefc-4e49-8cc3-934c27d908be', 'eba3ef07-d0e6-413d-a798-d04c08158fa5', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 1.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('33c02b5e-e570-4be2-a387-29ae8ec39525', '4dc049b5-8c2a-4091-a829-187b07c2442b', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 1.09);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('dc93a660-912f-4b94-9b75-7eca96d8846a', 'b7f6593a-5427-4144-a0b6-2ca1baf37232', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 0.59);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('3832facf-c284-4d96-8ee6-a26bbe9f6a6e', '33ff66ec-e465-48ed-9c03-afd85fa23863', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 3.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('935fdc3d-8f5d-40f2-95cc-158723581537', '7d8a96a7-acf1-4ea6-bcc7-704a1fd5a0ec', '2b05b779-8779-4bd5-b3b9-97a6cf193f66', 2.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('f0ec177c-fa87-435c-9b9c-464731e3aad0', '4f958e95-bcf6-4fd3-87d7-b6ea8b76a194', '4d58504f-2d00-457e-8340-150635883ce0', 3.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('774d5f0f-5c29-4f32-8afa-a164ad93f85c', 'f19c9a71-35a4-48e4-9365-202952bfa8e3', '4d58504f-2d00-457e-8340-150635883ce0', 4.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('1afb12b5-a60f-4446-ad12-110e2ea66f9a', '8cece01d-d302-4c83-b707-f4fa4acf5cbf', '4d58504f-2d00-457e-8340-150635883ce0', 8.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('ace6a833-4222-414d-bf94-78414bcf1774', '20d675cd-be77-49ec-b080-517a2792b6db', '4d58504f-2d00-457e-8340-150635883ce0', 4.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('191e79a1-2aa2-43e9-9550-e35ad52a3d14', '11936f32-f439-40f7-a866-984769311705', '4d58504f-2d00-457e-8340-150635883ce0', 1.07);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('06429528-3d36-4dff-b2cd-738203249c82', '0ef69879-3a3e-4bfd-ace4-ba4e73d6a8e7', '4d58504f-2d00-457e-8340-150635883ce0', 4.59);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('4761de02-8e5b-40d8-b1a5-a665ec6215d5', 'ed4fa2da-b4cf-44c8-a456-3984b6a61eca', '4d58504f-2d00-457e-8340-150635883ce0', 0.85);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('4be77ff3-93c0-4be7-8b38-c5863b40660f', '906f6f8e-63c0-43ec-bd97-83cafaf61d93', '4d58504f-2d00-457e-8340-150635883ce0', 1.69);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('f82b7031-fbae-44f8-b700-225a97af8669', 'af3103cb-855c-4612-822a-0f37b96757c0', '4d58504f-2d00-457e-8340-150635883ce0', 0.86);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('4164efa0-e674-4b3b-bc20-b3e74b55f113', 'd4f964a1-8097-4ce9-88ac-56d46a0b4d84', '4d58504f-2d00-457e-8340-150635883ce0', 0.95);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('3bdd32a8-d81e-400e-8f5c-9930dca24a9d', 'ba25f3d4-1144-40fe-857b-bbb7bc4cb991', '4d58504f-2d00-457e-8340-150635883ce0', 0.94);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('6a19f2e8-e750-469f-ac65-5b4780a04bdb', 'a83073e8-bb44-4863-986a-5784553c18d5', '4d58504f-2d00-457e-8340-150635883ce0', 0.98);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('0040678f-b990-4455-bef8-76ee46848084', 'f94f39c0-557e-4484-98c5-6c6255d46096', '4d58504f-2d00-457e-8340-150635883ce0', 0.9);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('f2dd0cda-9a65-4af6-b03b-eceb0ae792a3', '410d325d-18e6-4dd1-a97d-a36a76ddca0f', '4d58504f-2d00-457e-8340-150635883ce0', 1.13);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('1e25fea9-db0d-453c-b0ab-e98b938c4c2f', '2f8eb569-e504-48d1-bd09-15876940c5e3', '4d58504f-2d00-457e-8340-150635883ce0', 7.45);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d8db4dfb-70aa-4ec4-ba57-5b28a4c1a295', 'ed80d0a1-a465-42b6-888a-2b5688e26fbe', '4d58504f-2d00-457e-8340-150635883ce0', 7.45);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('f7b043af-4fd2-4f59-abc6-3498b7c95007', '81022f0f-77f7-45c6-8e4f-d5e4eeaa37a4', '4d58504f-2d00-457e-8340-150635883ce0', 4.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('69c49e0c-c1d8-4cb7-94a1-5d83c125158c', 'a977c8df-0db4-45c7-89e2-3a1448d7970b', '4d58504f-2d00-457e-8340-150635883ce0', 5.89);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('f73c3fa4-c48f-4468-8e60-294bbc86c3d9', '86aa8ea4-4e2e-4b6b-ade0-9db601876043', '4d58504f-2d00-457e-8340-150635883ce0', 7.45);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('1abe7a03-71a6-4033-8ecf-11fb8b249e28', 'c5411aa1-f5ac-4657-9ae1-bdb5acf8df6e', '4d58504f-2d00-457e-8340-150635883ce0', 4.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('544b569b-5ec8-4f14-a933-86003aa3ef38', '9fa7b287-275b-4584-9936-044272f12484', '4d58504f-2d00-457e-8340-150635883ce0', 4.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('a4bdc37e-c049-4468-bf15-33629b86cf7d', '4e78bd98-8734-4706-8d58-b7c56524956c', '4d58504f-2d00-457e-8340-150635883ce0', 4.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('67183229-94a6-450e-a36e-736e47eb9932', 'e3f98019-ce32-4386-8e85-068c6b4e197f', '4d58504f-2d00-457e-8340-150635883ce0', 7.45);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d2cac9ab-9a2a-4f08-b45d-352a470e69b3', '596d762d-7f8a-4111-b42f-dba108405dc2', '4d58504f-2d00-457e-8340-150635883ce0', 4.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('c7885ef7-d3bf-4b7a-9ce9-da11d8ce14bc', '8f1bb711-2e6c-497b-b28b-da35c385e239', '4d58504f-2d00-457e-8340-150635883ce0', 4.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('690c055c-cda6-44a0-afe4-eaa0c5ff3b06', 'c5c51c9b-e3d3-45be-bc2a-8a9506cf8c0b', '4d58504f-2d00-457e-8340-150635883ce0', 4.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('48979434-b888-452f-aa06-fba589af9c60', 'b538e983-e5f6-4631-acc1-96afef8e4c6d', '4d58504f-2d00-457e-8340-150635883ce0', 1.52);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('7076a3a0-e88b-4f5a-bcba-3199c00afb43', '1c0fc96f-89e7-4ae5-8e0c-c7666eb26ce1', '4d58504f-2d00-457e-8340-150635883ce0', 1.42);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('1cdc0df2-7c7b-4763-baad-c2a23ca16fa7', '0452f96b-119b-41a8-bea3-c1e08d48a80d', '4d58504f-2d00-457e-8340-150635883ce0', 7.45);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('5e665e82-1040-4620-a9ce-a6af52996170', '27356132-adbf-4463-8d81-6240840cc7b3', '4d58504f-2d00-457e-8340-150635883ce0', 1.64);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('3ee26ba4-75a0-4e64-83c8-6f4a46178dae', 'f30030bf-e10d-4e07-9b25-b9f8e1346701', '4d58504f-2d00-457e-8340-150635883ce0', 0.81);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('a65a35f7-5933-4022-839f-9cf60029e96a', '648c391e-318f-47b9-a337-21bf1bcd46b3', '4d58504f-2d00-457e-8340-150635883ce0', 1.2);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('284bcca7-d67c-4b70-b419-ccb1e1bc74c5', 'e071996c-2efb-4782-9637-eac9ca8eeb55', '4d58504f-2d00-457e-8340-150635883ce0', 1.45);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('982c914d-4a47-4eb5-a794-f659bcc75fe2', '039af4da-7c96-44b7-b44d-ad4f61ef9946', '4d58504f-2d00-457e-8340-150635883ce0', 3.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('266e7687-666c-4558-b4df-3f943d4a1bab', '1e95ee3d-c946-4af7-b9c7-e4f7620147ca', '4d58504f-2d00-457e-8340-150635883ce0', 4.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('7f8d356e-e4bf-457d-aa2b-03da61b66979', 'ed715cb5-6e36-4f05-8517-8dc6a8e387a3', '4d58504f-2d00-457e-8340-150635883ce0', 7.45);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('9f32a47d-c660-4eb5-9a4a-dbaef3775338', '8e74f511-5744-4cf7-9f0b-e1c0c37e33ab', '4d58504f-2d00-457e-8340-150635883ce0', 2.14);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('9e7d2b85-3f90-4bfb-8756-5c502adbac54', 'e87752f2-d872-4efe-b47f-8aec02dd9385', '4d58504f-2d00-457e-8340-150635883ce0', 3.69);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('2685702d-4637-4103-9357-a65a0672a6e7', 'ea25bee6-9c37-4782-81f2-a402fefd3773', '4d58504f-2d00-457e-8340-150635883ce0', 3.69);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('4d2f8e25-c1b9-4a0e-87dd-ecc8d1b8a92d', 'fc73e1c3-b5d9-4fc8-9307-d62f40d2c004', '4d58504f-2d00-457e-8340-150635883ce0', 3.24);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('0134794e-bb08-4abf-a6aa-7a894ce44c61', 'f914128c-d125-4c4d-81fb-93bd2c887cc0', '4d58504f-2d00-457e-8340-150635883ce0', 5.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('72dfb5a8-6390-4af4-afe1-f07172450936', '36b15daf-af82-484d-91dd-5019690f080b', '4d58504f-2d00-457e-8340-150635883ce0', 2.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('86c5de13-140c-4f4d-8242-bf186881faa8', '6038d3f2-fe12-4816-96a9-686fe00f676b', '4d58504f-2d00-457e-8340-150635883ce0', 3.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('75cfc66e-05b5-44c3-9be4-ec3e0ce1bec4', '75af8531-d3e4-4dee-b7d3-cf7c2ec3eb28', '4d58504f-2d00-457e-8340-150635883ce0', 4.79);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('bc5593f9-eeef-492b-b18c-18ecfbd34eb0', '62534056-a140-42cd-9305-dce17abaa8df', '4d58504f-2d00-457e-8340-150635883ce0', 2.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('3425e9fb-49e2-4ad2-99e2-3177cb0cbbf2', '88f38743-4a80-4f54-bcab-b908dbd673a7', '4d58504f-2d00-457e-8340-150635883ce0', 2.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('7353890c-9cbb-4a02-a650-ef0c28a85310', '0c020083-54da-4ad7-83fc-8d3ad792aa48', '4d58504f-2d00-457e-8340-150635883ce0', 4.69);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('976ae7b0-864a-45ff-b6ca-6857bc773798', 'fec29886-6234-4c97-9130-4e9af61f3a1b', '4d58504f-2d00-457e-8340-150635883ce0', 1.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('e3fa9c40-6987-46d2-a19d-917ae5006478', '7fa0c31d-2e19-418c-8eda-910ff5048f44', '4d58504f-2d00-457e-8340-150635883ce0', 6.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('110c55f8-c562-4144-991f-b72c8a968127', 'a1c929b2-917d-4141-9405-1782100107b2', '4d58504f-2d00-457e-8340-150635883ce0', 2.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('1f964b18-9c7b-44f3-9190-fe78fd903210', '3931ddcf-d3a8-46f6-8241-6975bb9427ec', '4d58504f-2d00-457e-8340-150635883ce0', 3.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('807a6ab8-51b7-40a5-a59f-5842f449d0e0', '8be97469-c624-4ff1-8d07-bda7ab9995c1', '4d58504f-2d00-457e-8340-150635883ce0', 1.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('ad0f56f6-e912-4b4a-ad3c-71e9d5a056ae', '14d39044-711d-462e-9eb0-6c3440fc8a74', '4d58504f-2d00-457e-8340-150635883ce0', 5.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('273df0f5-3071-4cf7-88b1-1835fa862282', '376eec7c-2349-4f6c-a3c3-8f315ea79cc3', '4d58504f-2d00-457e-8340-150635883ce0', 1.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d140bd04-e214-4fb5-b29b-9f1a2dec1aa5', '28020589-31ac-4d2d-99f4-609e130eb127', '4d58504f-2d00-457e-8340-150635883ce0', 1.39);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('0de567ef-57aa-42f9-9c3a-e347bab78d45', 'd47e9470-18fb-4c55-a57b-76e67b7bd39a', '4d58504f-2d00-457e-8340-150635883ce0', 3.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('aa245f0d-589d-4213-9fee-fdf4571ffbd2', 'b8a30f37-82c2-4a7c-a5d8-e5f986be2db6', '4d58504f-2d00-457e-8340-150635883ce0', 6.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('bb9b740b-ef0d-4b89-a837-f032a381b42e', '5aee7906-5549-4350-b75d-bc49e1996532', '4d58504f-2d00-457e-8340-150635883ce0', 2.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('16902b52-5765-48d8-b69f-2baa317f8baf', '93d5b03e-bbee-41b2-8e96-c6608b3e23b3', '4d58504f-2d00-457e-8340-150635883ce0', 4.79);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('765335c7-6478-4fef-a43e-814ab34986e1', '093e2570-178d-424f-9039-6cc8a4c04822', '4d58504f-2d00-457e-8340-150635883ce0', 3.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('e2ecfa1f-7781-4475-a63b-62af19e5ccf6', '67541d56-c0b3-422e-b710-9e9afda867c4', '4d58504f-2d00-457e-8340-150635883ce0', 3.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('47c37616-a9b1-4be5-bd08-163019418ea7', '0ac250a7-823a-4e20-9576-7404f7b08a7e', '4d58504f-2d00-457e-8340-150635883ce0', 7.79);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('ac086003-35b6-431c-99cf-30db1f315ff4', '72fc67d8-7af1-4b10-a97b-3517ae364c27', '4d58504f-2d00-457e-8340-150635883ce0', 1.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('f9010655-bb69-4f0f-8a08-58d7b7beb1f1', '9f2961e2-250f-4a92-8cd6-c5e90fbd0e0f', '4d58504f-2d00-457e-8340-150635883ce0', 3.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('aa8fa7ee-704e-4cbb-ac0d-0adf60571878', 'fd329336-0ddb-4e73-af5a-3637bcb5c4ba', '4d58504f-2d00-457e-8340-150635883ce0', 6.39);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('acc7beff-d39c-43c3-a1c1-ae8641ae6d17', '78299a95-be56-484e-a627-7b2d27a0a230', '4d58504f-2d00-457e-8340-150635883ce0', 7.79);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d523492e-b6bb-491f-8146-c3c846bc4d49', '7ad9eb0f-f77c-4ad0-beae-afc21561ecdf', '4d58504f-2d00-457e-8340-150635883ce0', 3.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('867b3314-6115-4346-8ca3-1125863cbec2', '47731937-5dc1-4c06-8694-b057508765d4', '4d58504f-2d00-457e-8340-150635883ce0', 1.39);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('cbb890cb-4ed8-4629-b9a3-0b17140b715c', '4ef70e82-b264-4b38-b2e7-cd2623268fee', '4d58504f-2d00-457e-8340-150635883ce0', 6.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('72758b7e-e07e-4efc-acf9-5aeb557620e6', '0a9d75ac-67a6-4900-a2ac-b439ac589609', '4d58504f-2d00-457e-8340-150635883ce0', 5.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('7f4e0521-27e1-4894-8fb5-40583dccb689', 'c8ded2bf-00f7-4b00-a5e7-c6ae06db4046', '4d58504f-2d00-457e-8340-150635883ce0', 6.39);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('c774a6a1-73df-4d77-b281-c7d2acc06942', 'a4f82609-af26-4231-a11e-000986c534bb', '4d58504f-2d00-457e-8340-150635883ce0', 7.79);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('ab4d14a8-cb12-4ef1-b9a9-173d0f77d220', '360e13fb-27df-46cc-a30d-a5f2c361f623', '4d58504f-2d00-457e-8340-150635883ce0', 7.79);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('85903565-f664-45e7-b50e-aa9cc5df4386', 'c162f4d5-0665-4786-8371-b32761a6020f', '4d58504f-2d00-457e-8340-150635883ce0', 4.59);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('cf630e83-3d0c-42d6-882d-2efef5815f03', '1706c170-9cd3-4571-a493-4a1b575339d8', '4d58504f-2d00-457e-8340-150635883ce0', 2.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('6500fb99-ad95-44ec-99cf-101714180752', 'b472f6cf-2021-45e8-b267-6a8cc77953bb', '4d58504f-2d00-457e-8340-150635883ce0', 5.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('46ae0743-296d-4593-9d8c-1ea148824bba', 'cbef4766-a291-4d11-b20b-15c25ed5bdb8', '4d58504f-2d00-457e-8340-150635883ce0', 6.39);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('68ad5063-db26-4252-819c-a367f97c5b8c', 'f855421f-faf9-4ab9-b988-0bcc3110624d', '4d58504f-2d00-457e-8340-150635883ce0', 6.39);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('6bc1d249-2c0b-44cd-9ac5-cf84169d101d', 'fbdbbec1-fc09-49c3-8bbd-9cc7f8f4b3cc', '4d58504f-2d00-457e-8340-150635883ce0', 5.89);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('50504fd8-02e4-4ce1-a9c8-d09a2dfe30f3', '81ba61e5-3a29-4737-971d-80ab96d77869', '4d58504f-2d00-457e-8340-150635883ce0', 2.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('7e44519b-d2bb-4bd4-843d-8e15cd321f1f', 'fa615e59-21b1-4e8e-a867-06d85d8a087d', '4d58504f-2d00-457e-8340-150635883ce0', 0.21);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('a9e439eb-e249-4a82-af2b-809e3f0fa199', 'ec7debd3-e52c-4d63-b3ac-4f9281445e21', '4d58504f-2d00-457e-8340-150635883ce0', 0.21);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('be730a7f-ebfa-498e-861e-203c7818abc8', '05b40ba5-f05b-41fa-a2c1-ba845e3ae8e0', '4d58504f-2d00-457e-8340-150635883ce0', 2.47);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('04d8da15-0072-4505-80d9-3fd0f271949b', 'eb1aba67-e931-44f1-88a6-e058b42771b8', '4d58504f-2d00-457e-8340-150635883ce0', 0.69);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d22aff54-ea49-4175-9f42-7f912d5a7faf', 'fb6f7df1-3f58-49e0-986d-69333b31e472', '4d58504f-2d00-457e-8340-150635883ce0', 2.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('38fe0218-ad52-450f-98ee-560dddbe6c92', '1b560b63-9eec-4197-a630-cda946cfe6d5', '4d58504f-2d00-457e-8340-150635883ce0', 4.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('ba700f94-ac39-4925-a410-6f5aa389b8fc', '6c4019ba-8a4f-4e4c-8b69-78ef49b39ebd', '4d58504f-2d00-457e-8340-150635883ce0', 3.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('0004f558-ae1e-4022-8d05-89ed05537f23', 'c16d8e5f-4d48-451a-8f61-027c69acd24e', '4d58504f-2d00-457e-8340-150635883ce0', 3.59);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('f0eb8bcb-5e27-4fb7-ba53-14e1d84d7658', '5bf2cacd-29ea-4e48-9a0b-24d99516324f', '4d58504f-2d00-457e-8340-150635883ce0', 3.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('b47b813a-727f-44eb-b945-40d982c0f5fb', '51d792db-d4b3-4e7b-be9f-b7496f8b591c', '4d58504f-2d00-457e-8340-150635883ce0', 2.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('a3c315b6-fa22-4d47-8845-f7d1e68ff0e9', '1428b34b-7011-4c24-bd20-695154163d64', '4d58504f-2d00-457e-8340-150635883ce0', 2.79);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('f5991d96-6211-4434-90d7-02f4822edc3c', '0507095c-c47b-4bea-9fed-28430a270971', '4d58504f-2d00-457e-8340-150635883ce0', 4.95);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d659df4f-8abb-4d98-b516-04dd8956992a', 'd16d1ed1-4d00-4b02-89e2-16650e621f94', '4d58504f-2d00-457e-8340-150635883ce0', 5.75);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('b26e860b-bcd5-4316-85fe-129404731bc9', '42dbe726-4879-44e8-bddd-6f08d2086a5d', '4d58504f-2d00-457e-8340-150635883ce0', 3.59);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('2548ad17-f71c-43c6-bbc3-5525c6b99925', 'ab546775-93d7-41e2-a2d7-1ff2a857b57b', '4d58504f-2d00-457e-8340-150635883ce0', 4.89);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('b592e906-1e9a-4d50-93be-f10fee9b3412', '1598ceca-07ef-4d6b-bd50-aaa2631b5a3d', '4d58504f-2d00-457e-8340-150635883ce0', 5.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('1b279991-97f7-4778-ac23-6a77199fb476', '6b596c75-a9e1-454a-a396-d93a895fe098', '4d58504f-2d00-457e-8340-150635883ce0', 0.65);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d70d76f3-3991-4a95-9844-3fcaf6f2d837', '5985d9e3-15b9-4098-85b3-1b40deb7df17', '4d58504f-2d00-457e-8340-150635883ce0', 1.79);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('b4442db0-59c0-497a-9704-b538ab56a991', '8ccf2d27-5f19-46f6-89d8-63914a80dc59', '4d58504f-2d00-457e-8340-150635883ce0', 2.0);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('3b4256ef-101f-4eff-ab02-d61edf54d6bd', '6b2e907f-7b75-4590-bb79-54735ac494fe', '4d58504f-2d00-457e-8340-150635883ce0', 5.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('52a80158-e5ca-4c27-93f6-1f1cfc3207be', 'a04f3df5-3ef0-4b76-ad9f-13330bcca10d', '4d58504f-2d00-457e-8340-150635883ce0', 0.89);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('714b465e-03f6-4742-a477-bfd640ba810d', '48260c5e-7b13-4a0b-8f42-ad663b6fc392', '4d58504f-2d00-457e-8340-150635883ce0', 0.79);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('b65af7e7-2db9-49af-b575-d15d99534c29', '45cf4f25-ee1a-4c47-8b48-2eb7ad326c01', '4d58504f-2d00-457e-8340-150635883ce0', 5.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('f6cde9e0-dfb4-47de-822e-127a184168ac', '082f2d54-28e4-4764-aad2-58036c29e928', '4d58504f-2d00-457e-8340-150635883ce0', 5.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('93f2a45a-1c2e-4e83-be5f-af029e81047f', '2f8b425d-baa4-42c5-9053-86bc3263298d', '4d58504f-2d00-457e-8340-150635883ce0', 1.69);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('2137aefd-45f9-4072-8e4d-1c59e586eb05', '9ecd741c-8046-4bfb-b26c-12ffe90880e1', '4d58504f-2d00-457e-8340-150635883ce0', 1.89);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('910ec0e2-6380-4fdc-96dd-e0e0f61547e3', '163e126d-3e96-4a23-a2d1-3639262a76f8', '4d58504f-2d00-457e-8340-150635883ce0', 4.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('90d23cb5-359e-429c-990e-6629fdc30ea9', '60ed1a7c-9d20-46e8-977d-26970366c5f3', '4d58504f-2d00-457e-8340-150635883ce0', 1.89);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d7e2defe-ce6e-4a16-86d5-abec6947ca66', '31557c77-c640-4778-babb-9bda972704a9', '4d58504f-2d00-457e-8340-150635883ce0', 1.89);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('a00405b3-486e-4693-8687-e5a9877e84a8', 'c21551ce-06c4-4fb0-87bf-ad2d00eaaeb5', '4d58504f-2d00-457e-8340-150635883ce0', 2.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('ba852f4d-f12d-4850-8632-5bea1a288f29', '7a4c0442-068a-48e8-bc9c-c6a6f1a9011b', '4d58504f-2d00-457e-8340-150635883ce0', 0.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('b2cdf78b-112f-466b-a9df-50edfa3cf617', 'd90ea925-33c9-4d86-8ec9-d039f6f93480', '4d58504f-2d00-457e-8340-150635883ce0', 1.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('20c8c3a1-69e3-4219-ab74-21c3b2eb941a', 'fa1a1501-cebb-40f5-b639-b92a923669aa', '4d58504f-2d00-457e-8340-150635883ce0', 2.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('38a07245-f4f6-4af7-a938-4a088a6d0394', 'ed1c0864-1cb5-4869-a508-8024e0a7e696', '4d58504f-2d00-457e-8340-150635883ce0', 1.59);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('99ec3c53-3892-4ecc-a4af-9254b44fb200', '14af5eaf-d843-4c3a-ade8-7fcfb84e15d8', '4d58504f-2d00-457e-8340-150635883ce0', 1.59);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('48aaed1f-7e23-4846-946d-f13dc0e0feab', 'f5b6bea3-a598-40b2-a3c5-24682a55dfbc', '4d58504f-2d00-457e-8340-150635883ce0', 1.59);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('f969bb8e-5df3-4cd5-bb24-75f5412239ae', '66e13c95-7003-4d5c-866c-b600b3bd5ebc', '4d58504f-2d00-457e-8340-150635883ce0', 3.09);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('dcf7fafa-4c5f-4687-bfc2-69e5e50c6af8', '9aeba663-7731-4903-97e3-564cd994e82a', '4d58504f-2d00-457e-8340-150635883ce0', 5.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('b51dbbb2-99b5-4646-a1b4-cb2f7731f340', 'd045f3f6-c50c-4994-a672-c77d434a2066', '4d58504f-2d00-457e-8340-150635883ce0', 1.39);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('8cb17e36-9d90-4f18-a39d-a440bf49acc9', '9bb78705-691a-4466-a85c-67fdb684e761', '4d58504f-2d00-457e-8340-150635883ce0', 2.09);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('2834e1a2-04b4-4c71-8893-57d610428fcd', '99775ab5-b796-4033-a756-f92d1f2c74ea', '4d58504f-2d00-457e-8340-150635883ce0', 19.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('a92cb05d-bfbf-44f1-af05-21908b05c125', '9de4288c-bcd6-4a3e-80a5-fb6e3bbc2f95', '4d58504f-2d00-457e-8340-150635883ce0', 10.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('f172be59-2caf-4f81-86cd-714aa5db697b', 'e3d830fa-98bf-4bbe-85c3-9cc918657df0', '4d58504f-2d00-457e-8340-150635883ce0', 17.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('16c0208d-1bf6-42e3-a2d7-493da4b8d637', '0a9c426a-e038-4dce-903f-34685858182d', '4d58504f-2d00-457e-8340-150635883ce0', 17.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('1b83416b-db78-4757-b9dc-b462223ae71d', '3a81d70a-6896-4b17-8554-e1d9ee50bf63', '4d58504f-2d00-457e-8340-150635883ce0', 5.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('0bc81421-d21e-4a48-bde0-1c2c5a422168', '1cba349c-177a-4d3c-a09a-3d8575d93a6c', '4d58504f-2d00-457e-8340-150635883ce0', 8.79);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('0ab6274d-83e9-4de5-932c-933f8c63ac86', '7de9352e-a5d9-4214-9b7b-b80141a30828', '4d58504f-2d00-457e-8340-150635883ce0', 58.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('8c872cee-4c4c-42af-afd4-393fb9d0e831', '1ece00e7-59b2-4596-afb9-cfc0ff7d80c7', '4d58504f-2d00-457e-8340-150635883ce0', 0.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('a1174879-3b75-4334-8e1d-29fd52d7f147', '7ec111a3-bd25-47bc-bdb1-5794167e6074', '4d58504f-2d00-457e-8340-150635883ce0', 27.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('11fecb06-f7ed-4de8-83c8-7811f578b214', 'bf6ee340-1567-4d05-96b2-e54e225092ba', '4d58504f-2d00-457e-8340-150635883ce0', 5.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('64c61aed-ac48-4f38-86cc-44ba31a8397d', 'eb25a78b-dbb6-46cc-b3f5-6823702b056e', '4d58504f-2d00-457e-8340-150635883ce0', 41.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('c1256793-6358-4762-a59d-9b02f1025e1c', '8d1bf213-ae35-4cab-a9ac-f40cb07f820e', '4d58504f-2d00-457e-8340-150635883ce0', 17.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('a1dccd58-1e07-41ac-a14b-7355f61e346f', '28ad2171-f824-4da7-8a4e-08af0d368d7f', '4d58504f-2d00-457e-8340-150635883ce0', 17.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d6658485-a3ec-482d-a8d0-4014d6d3f11c', '174b58c8-67ed-4828-9e10-0d665e00de49', '4d58504f-2d00-457e-8340-150635883ce0', 17.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('43603511-2a4a-4857-bf18-c3a0f800f88f', '48b90a24-36eb-4ba4-aad1-dbd091bc4bf7', '4d58504f-2d00-457e-8340-150635883ce0', 0.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('b42a7574-f691-45b9-a0bc-55705e77805a', '358c4650-def1-468f-8096-29033f60c6f5', '4d58504f-2d00-457e-8340-150635883ce0', 0.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d8d468c2-d482-46c7-b7c8-5ddd4157eb80', 'bd9ea01a-710d-4720-89d5-542835d77c69', '4d58504f-2d00-457e-8340-150635883ce0', 3.69);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('b9db7e3f-4063-4123-a7fb-3b733bcf1225', 'df4b846e-905f-44fe-a036-d248697803ef', '4d58504f-2d00-457e-8340-150635883ce0', 0.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('2b51d705-860a-4269-89a9-376dbc35c12e', '7fc85be8-7199-4690-8992-c0c41c1c112f', '4d58504f-2d00-457e-8340-150635883ce0', 3.69);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('056abb70-884c-4a81-9e8f-73dce41522f4', '60f701e8-6c45-484e-b579-9d4111f5d23a', '4d58504f-2d00-457e-8340-150635883ce0', 0.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('5c2d1280-9f91-45ae-8385-3671aa5c65e1', 'dc836a27-5bb2-43a9-955b-777d8ddce04c', '4d58504f-2d00-457e-8340-150635883ce0', 58.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d447ed71-ca72-494f-a2de-250fd9924a1a', '02ab48db-dbf9-4414-910c-2944b5aca1b6', '4d58504f-2d00-457e-8340-150635883ce0', 0.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d944d452-b947-4cb2-84e0-75563cbaabfd', '6d388085-fb80-4a8d-a70a-f2434cd33ffd', '4d58504f-2d00-457e-8340-150635883ce0', 0.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('423b89d6-42ed-47c6-b170-0cfe32bbad2f', 'fb8858a6-cc50-40f7-9082-7a2770719b9c', '4d58504f-2d00-457e-8340-150635883ce0', 0.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('0afd795d-2433-43a3-b696-8e8406822153', '5cf73bae-49ca-4941-9424-68134554896e', '4d58504f-2d00-457e-8340-150635883ce0', 0.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('ed1e0605-7a2b-49dd-8f80-3dffb968f6d8', '56b3e2a3-528e-45c3-8e62-53b5388cb25b', '4d58504f-2d00-457e-8340-150635883ce0', 2.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('ea33dd11-ee28-48ce-9e41-6de3f4c35ef9', '40a75523-3ed7-4f19-9474-fc7d70039343', '4d58504f-2d00-457e-8340-150635883ce0', 0.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('66f3113f-2995-48a1-8649-0848cbccbbd7', 'd735df4a-b50e-4e26-bd9d-c585830a59dd', '4d58504f-2d00-457e-8340-150635883ce0', 0.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('87dfec7d-2132-4571-b13a-f465e36c70bc', 'f440829d-ee0d-4fbb-9051-996a0feef7ab', '4d58504f-2d00-457e-8340-150635883ce0', 2.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('5410ba8c-3f80-46b5-97fc-c832f87e69f5', '7ba7007c-844a-4561-be57-4d1bc645792f', '4d58504f-2d00-457e-8340-150635883ce0', 1.09);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('3758fdc7-07e7-453e-bcd4-1014c3fc9267', '20c19689-c5a3-42db-8504-2db1f9010dc4', '4d58504f-2d00-457e-8340-150635883ce0', 2.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('e2897852-991a-4cd9-b898-08d4162a2f06', 'a3f9f393-5bec-48e8-b1ea-96b0ceedaddb', '4d58504f-2d00-457e-8340-150635883ce0', 2.79);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('db6b4217-1df7-4192-ba82-dbf0890fe4f4', '93817bfe-4766-4959-a843-43c3d263408a', '4d58504f-2d00-457e-8340-150635883ce0', 2.5);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('47ca276e-8433-41f4-9a3b-bf37b97dc49d', '2c0c8e13-95a2-4cc7-9f56-52fe8072c109', '4d58504f-2d00-457e-8340-150635883ce0', 2.79);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('8a30bf95-8cf8-41ba-b3b7-db94707c6c64', '6b609065-82bf-43a3-9000-0c76887e535d', '4d58504f-2d00-457e-8340-150635883ce0', 1.69);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('1a023ed1-98af-488f-b4e8-fce8104fe87f', 'c17aec6d-92aa-4c5d-a478-17b0e65b83c2', '4d58504f-2d00-457e-8340-150635883ce0', 2.5);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('b9f99bb8-3747-4193-af6f-86fc5cc27608', '9938a5fd-d989-414e-bab8-5666890b7b72', '4d58504f-2d00-457e-8340-150635883ce0', 2.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('b45f45bb-d1e7-4e7d-8b38-7d09e569ca4f', '2651517f-4983-404d-9649-2d12c1d32322', '4d58504f-2d00-457e-8340-150635883ce0', 2.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('7f77ca16-12aa-4314-a94a-b9c46bec81c3', '4d1fff01-1b5d-4970-8a5e-599de828c887', '4d58504f-2d00-457e-8340-150635883ce0', 1.79);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('54385f2a-6325-438e-8fb2-1b4f00b9ee7e', 'f6db5619-54e8-4bf9-81f6-7ea8b1090e5f', '4d58504f-2d00-457e-8340-150635883ce0', 2.69);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('e8bdaf3a-a2a6-4dce-9a77-d795ec2889a0', 'd849e6ca-eb0f-4112-b61d-10770e425263', '4d58504f-2d00-457e-8340-150635883ce0', 19.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('a8f263d8-c5ac-4599-a56a-1facf777107b', '97ded5a9-3f29-4f96-9218-51c75d53aabb', '4d58504f-2d00-457e-8340-150635883ce0', 14.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('15bff8f7-092c-4a07-bb25-a1cc6b8f5124', '2f736794-7dd1-437a-84a6-78f9b46bc5ce', '4d58504f-2d00-457e-8340-150635883ce0', 19.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('27bda65a-cdd6-496a-b42d-203ae07b204f', '8eb5c845-8fa5-4785-93cf-15b2fab7f58c', '4d58504f-2d00-457e-8340-150635883ce0', 6.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('62a58955-bad5-49a9-b85d-c83b7ab8f4c8', 'dcb3e92c-d5bb-4e6b-abc4-3eb8c3bb9454', '4d58504f-2d00-457e-8340-150635883ce0', 14.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('3d0854e5-30ed-4057-a596-e24da5b8a2ca', 'c18e3d2f-ef9b-48be-9116-7be038d6af61', '4d58504f-2d00-457e-8340-150635883ce0', 14.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('075c76bd-b13c-4847-b36f-f306e40e8ea1', '89e646af-90c4-4ee5-ab19-18da19e121fd', '4d58504f-2d00-457e-8340-150635883ce0', 14.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('9a7f918d-24d1-486d-9f8f-2bde45f3c747', 'f789fd0f-046c-48fa-ab83-24383d07d8de', '4d58504f-2d00-457e-8340-150635883ce0', 19.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('81a6923d-62ae-48d4-b7c8-4de1c58ec858', 'afdf6e27-f29a-4008-a996-4e76d7bf9de1', '4d58504f-2d00-457e-8340-150635883ce0', 19.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('ee6dc0d5-f09c-499e-9caf-64fbdc6e015a', 'f6e0144a-d368-4c1e-a7ce-b2462e35fbc8', '4d58504f-2d00-457e-8340-150635883ce0', 3.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('cc75f209-b1f6-48fe-a89a-4ae30f178535', 'bdb6d354-4f3d-46c4-b0df-18eb1bda7bdc', '4d58504f-2d00-457e-8340-150635883ce0', 18.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('9a043fbf-492f-4ddf-a3ea-a8458fbb6d19', '7e05fa08-28c8-4bae-9aec-818413c9c13e', '4d58504f-2d00-457e-8340-150635883ce0', 15.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('17757c61-60e0-4e35-904e-fdd53919a4ef', '0290e195-fed4-49a1-ab3e-a3da7adbeb82', '4d58504f-2d00-457e-8340-150635883ce0', 19.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('4959b813-0438-4349-85da-e4d0365e2b9a', '2ccd0f96-10da-441d-a360-36c6c0adeb4a', '4d58504f-2d00-457e-8340-150635883ce0', 11.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('af81cf64-4273-4600-b1ae-dad03a626c30', '4dbb0bcb-5beb-4004-a63a-7a93636252c2', '4d58504f-2d00-457e-8340-150635883ce0', 3.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('32bcbf8a-403a-426a-81cc-2b6b13584b8a', 'bae39811-521c-4f64-b32b-826b447fabf0', '4d58504f-2d00-457e-8340-150635883ce0', 15.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d86a77e3-3359-4bbd-97e8-45217be09366', 'cd58d9f9-49a7-4743-9ccf-b36e86145a7e', '4d58504f-2d00-457e-8340-150635883ce0', 6.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('90eebad0-abf8-46c9-83c7-e8b26629e64f', 'c5c4608f-cd9b-4c93-894e-defcf15acd1f', '4d58504f-2d00-457e-8340-150635883ce0', 3.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('15946c41-5316-450f-b381-b4a7bd953757', '80cd38e8-821f-40db-9301-e14c191a5f0c', '4d58504f-2d00-457e-8340-150635883ce0', 19.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('8027eee6-9bdd-49f3-9c6b-f1a5dd06c825', '3c5a58bc-815f-4af9-ab88-c9d792c8145e', '4d58504f-2d00-457e-8340-150635883ce0', 15.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('05bfff4e-db89-409d-801d-0a5a6fc6fa74', '1ad372bf-c397-4bc9-9992-f3209a4447cc', '4d58504f-2d00-457e-8340-150635883ce0', 19.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('bc66ca12-af5c-4ab1-85f4-5652a49b98fb', '3b70051c-26ba-476c-bfbf-3e05081a2602', '4d58504f-2d00-457e-8340-150635883ce0', 19.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('c5450543-7623-4022-aad7-e13dea8722f7', 'ca60bf27-0b2b-4475-85cc-2b036fb5b5a6', '4d58504f-2d00-457e-8340-150635883ce0', 19.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('2276f52a-ad63-4c30-b68e-bc2a4310584c', '62e81499-fd89-4f72-a263-53cc78e0bdb2', '4d58504f-2d00-457e-8340-150635883ce0', 6.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('24945869-aa92-45b2-acac-0387d3adf342', 'ff07b267-b31b-44af-af1d-d82b8757d2e4', '4d58504f-2d00-457e-8340-150635883ce0', 19.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d3c9bd15-e6ff-400c-9fa0-d5af9b3fe10b', '9a10b490-e208-46a6-b848-1974aaf597f4', '4d58504f-2d00-457e-8340-150635883ce0', 6.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('0d1831fe-43eb-4867-a2ea-acc079fa80b6', '4dfc07f0-fde9-4719-b6a7-6cdd66b1c239', '4d58504f-2d00-457e-8340-150635883ce0', 6.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('98063942-f195-4c9f-ae8e-80656bd36074', 'd20b627d-2f90-4807-a7cc-a2f0d54a3e42', '4d58504f-2d00-457e-8340-150635883ce0', 15.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('29fe0349-c972-4c4f-9883-de6b41c10cb6', 'd17b7402-9201-41df-8c17-948a8bd57125', '4d58504f-2d00-457e-8340-150635883ce0', 14.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('ead01d7d-6b26-41bf-94a2-ef71099f05ad', 'e21a3c32-f251-4908-bd1b-61d2cb9e0ebd', '4d58504f-2d00-457e-8340-150635883ce0', 14.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('60f4e670-8b6b-4563-82ad-2501c8f0e066', 'f0996450-293a-4eca-8ec6-4f1539a5cfd8', '4d58504f-2d00-457e-8340-150635883ce0', 18.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('aa645aef-5da4-45c0-8e8b-f24471eb8211', '6e98fc51-7ad2-4b1f-9b31-19e43a165654', '4d58504f-2d00-457e-8340-150635883ce0', 14.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('24dbf81a-679a-4cd5-8fe9-58590df3d522', 'efb2e697-5a24-42da-a733-03e699edb4bb', '4d58504f-2d00-457e-8340-150635883ce0', 11.59);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('e39ef855-93b3-4595-b271-7380c69a136d', '0591c1b5-c1c1-42a2-b592-8301e3e71a4c', '4d58504f-2d00-457e-8340-150635883ce0', 11.59);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d7f41eee-9a3f-43f8-8b0a-1e7c2f83cdbb', '143d2040-e60d-4eee-a7eb-50fd1c34c598', '4d58504f-2d00-457e-8340-150635883ce0', 11.59);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('9822707c-fdb3-4fa3-9998-a90d7bb97cca', '1c292e6a-8092-493d-96c5-fe4a9be3e36e', '4d58504f-2d00-457e-8340-150635883ce0', 6.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('2d131c12-efa8-4b84-bb7e-000916d4235d', 'd7f2b8c6-9aa5-4aea-bd43-126ea8f15dbe', '4d58504f-2d00-457e-8340-150635883ce0', 11.5);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('94ed7eaf-ac42-4e5f-91c2-ba063015d5ce', '5a87732e-51c6-48ca-a162-3902c4d2466c', '4d58504f-2d00-457e-8340-150635883ce0', 3.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('35610a93-f753-4275-8c4c-449e72a2eb9a', '3ab52cb5-5f55-46af-96fb-b77dae0e91bb', '4d58504f-2d00-457e-8340-150635883ce0', 9.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('1f1468b2-05d5-4b98-99fa-c1363934ffb8', '38c7408f-35af-4077-a2d1-a5f30bcbe238', '4d58504f-2d00-457e-8340-150635883ce0', 6.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('1603dc98-9321-44ab-a8be-17e1fa02f00b', 'b539a1f8-06f3-426d-912e-6f47ccd9b7e5', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 24.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('200ad55f-a0d9-49c3-96be-cd516c05bfad', 'a75ccd9a-4a7f-4ff5-ae78-4d2c10a4a25b', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 4.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('e2149f3e-7baa-45cb-917a-463bb5a907f9', '2500553b-42a4-4549-bd64-33ad8035c05d', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('41ca21a9-05ab-468f-bc5c-1015082755e1', 'ee7b1651-9c45-4916-ab83-8c415458abf0', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 2.54);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('02291977-fdf2-41e7-898b-89c908f180e2', 'df421961-582c-48c2-9500-626e32e0bc6f', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 4.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('87e8ada5-1b80-4108-85fd-87a2f20c36e4', 'ece1425b-1c8b-45a7-b022-807217aeef76', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 4.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('e2947297-3346-426a-8fb8-2223aebf52b0', '09b46f4e-7dc1-4169-b635-c89bc3a76132', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 14.48);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('ddeee383-b632-4381-b62d-126b6d3bba72', '6f124954-7ae4-4596-9afe-a5f4d281d5c8', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 24.3);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('1737d2b2-5052-4d7c-bb07-6096902d1c02', '1eec7f82-0dbe-41fe-9c49-6244df6e9cbb', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 6.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('a8401c7b-6f92-4c58-950c-edd2b5a76fe1', 'ae2974d0-edd8-4888-beef-180da301eb1d', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 1.79);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('e1be3f25-9e2c-487d-92f9-1c83bd6ab648', 'f1a8fb66-8e06-4e11-bd72-11fb1eb167b0', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 8.69);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('cb0cb9c0-568c-4222-ac78-5dd1f09ab268', '360c9387-34ce-491b-ac1c-3d5a2a6d603d', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 8.79);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('f655a7f0-1cc3-4a7a-8749-9542ef9ddae4', '9b17c025-5dc3-407d-89b0-009835f36965', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 5.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('c985c83d-ea23-4674-8c68-d654d5dde5ab', '2fe246db-dd82-4801-9495-9b7663b946eb', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 7.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('c8bb814e-a570-46aa-a59c-6a4f164126bf', '38cc78df-1f71-4015-b540-79f1e2ba1034', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 4.39);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('edf23638-07b0-4608-8fcb-c63c2bcdc0bd', '5f19c978-2359-4df0-84f4-a76a23885adf', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 1.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('2f0b7179-4044-45a2-a98f-33803e0978ec', '0b057245-b531-47f9-9324-55f8327f2bff', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 1.0);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('9210efe7-634f-4aff-9988-ba4c366d02e7', '153dafd4-42be-461f-a1c7-83cc2400b0ff', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.0);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('b5e61203-b153-457e-b327-949037aed45e', 'ac55dfb2-cae4-4b53-84b4-9b1ff094aec2', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 4.69);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('ab029bcb-d034-453f-802a-0a56d0b337df', '8ae778c9-3960-4a33-bfb6-f12f5c5e4cf5', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 6.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('14e422a4-6da7-4ea9-b068-c96656ec2710', 'ab95d7ca-0e1e-41c7-a3d8-586d6d0428a4', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 7.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('1a860c63-ef74-4b4d-addb-fb48e1a7e8e4', '91495f71-8daa-459f-a671-375161d49a35', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 8.89);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('2bf3e2f9-f7d6-4954-adf9-215fc7b873fe', 'c2ad0c64-bee7-4654-9c92-d232c5e89c41', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d5c326a5-3c09-49a4-97b5-4fa896832662', '1208ba4e-957e-4806-9313-b2d464360daa', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 7.79);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('c37bcd96-e455-4304-ab6c-11e9cb4146fc', '31806383-9f8c-450f-a87d-6c8b81481eea', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 13.32);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('2603a71e-3fdd-47d9-8403-d856fd34c64f', 'e3fe1d81-4164-41e0-abbe-62b1aa9e08ad', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 1.59);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('662eb8fc-fccc-498a-8522-baf59d2f7597', '2aab3345-2d19-4fb1-b702-33eb108d1f3c', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 2.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('da4472ba-6016-4c41-b045-6d34cc189625', '7d2eb935-304f-4061-8812-75be4e7f0907', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 1.89);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d55268c6-d233-458e-abeb-1b77b7e69539', 'af93d143-ff56-4c04-b59d-6160e95e2ed2', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 36.41);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('5dcbb268-9889-41af-a66c-1d0a671142bd', '9bb3aa76-6c8c-4b7e-a1b0-fae15f10c850', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.89);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('c83a3772-3aea-4a70-a5af-547568fd9594', '8c003d48-72fa-4b4c-b613-bc6f41cf66c8', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 5.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('e09a9530-b259-4a48-ac5f-365471e871d0', 'f7931f6e-d7a6-465a-a4f9-ac68ca2ac41f', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 1.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('93751edb-6341-4569-a06b-12591cc4ac8d', '8a191254-414c-4f02-b122-25896e02a8c4', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 2.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('e52f89db-daa8-47a0-9ae6-01a618821b6c', '9781156d-6e48-4a7e-9b46-1729204f8d4d', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 2.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('a4e05022-6df9-4ce7-87d3-300e4a56b069', '6a90e0ea-6e39-4404-9606-ac8c614b353b', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 2.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('620aa437-36b5-4a38-8f98-b8482f9c9d75', '731b807d-73f1-4573-98e5-789e1b0e9f07', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 5.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('16197b4f-1839-4b90-b774-7823de2093ef', '083bada2-01da-46fd-b38a-8a60c08905c0', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 21.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('997fff3e-cd56-407d-9382-a9efb20de3a4', '8274d5e9-9983-4a64-a77f-5b1275f8983e', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 22.97);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('7ad41033-42d6-40dd-ac96-8b103fe9998f', '7bb0d9dd-b97c-4af5-9787-fcbc44df2112', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('76460b95-4958-47e2-bf35-97f29d6827dd', 'd3de1053-01c6-40cf-b9d1-d2843bd92a85', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 6.39);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('63e26b3f-37ee-4145-a1bc-51b882954128', 'fe60ab30-f872-4b6e-b69b-442086c59255', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 8.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('3b1110dd-7a7b-4e77-acc5-e56c7f7351a9', '5dd0adcf-acd3-46d6-8c6f-5c2d6c12efe8', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('e6e47955-72a7-410b-8b29-2d22d5f79178', '22226f3b-5de9-43d3-912a-1bbd22a9bd96', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.0);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('831178a7-ac66-4b1d-bd9a-99e7fbbb09b7', '5870aa86-5244-4031-9166-4eed3a77a19a', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 0.79);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('0761e47e-849e-4eb8-8bf7-7b1139e3a038', 'cdbc25cd-a3e8-4534-a8c8-4b334971d255', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 2.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('c25066a7-58f6-4e65-a259-12e584c30541', '64ec728a-baa8-49f7-8197-e49e2de8ad57', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 2.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('2ae42b8c-2252-4d91-bee2-9debf61ad242', 'e0f99ce2-c506-4591-a36d-f47d35d1c6c5', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('26971cde-1d36-4bb1-b13e-42d7e1f94da9', '31140007-3e40-4138-a7dc-9694ca63a467', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 8.69);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('5f64e3ee-bd75-4b62-a1b2-02c6e15a77ee', '88981cf2-95d9-4a07-a60f-bcbd3e53d341', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 6.39);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('caa1a46c-bb88-4792-bb12-52533118f29a', '2ca4264b-89ec-471c-ab28-1e7974eb801b', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('af144dca-58f0-4530-800b-586d5d734c59', 'c0dc0783-8587-4ae9-883f-3b692921550f', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 31.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('5f8df9d4-0ed5-4383-9220-62c6ab335eb9', 'e55c04c2-5079-4d4a-a407-f95e716889a0', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 45.3);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('4d7b9821-d812-40c9-9b2c-6e0d91651303', '316bc9e4-561b-4669-a95b-d95422d174d2', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 5.79);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('83556929-7fc8-4625-8eb4-33793d8dee16', '15e79851-7247-4faf-916b-a4beab1188a9', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 5.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('63354987-73f0-4b68-b7d7-dc0e9d0575a7', '149ec6f2-5f4f-43a8-9939-b178d7122dcb', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 5.69);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('21f5b317-66e2-41e0-8673-a0a6922349c6', '8ab3efa3-42aa-4583-9b47-81e3e3fae1cd', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 2.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('7a59836f-81a6-4253-b197-9a39f12ff2c4', '7d693ca4-ba77-45aa-9a03-bfe8953ad4ab', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 7.81);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('9507fbe6-f044-4e4e-801f-c2d751b813a1', '1d179594-c235-4eff-9aca-eb96e06ee38b', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('7803fc56-9c14-4019-8c61-4605fb6baa1d', 'f5ae9d79-c52d-4716-993a-d0a6ffae0aa0', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 13.1);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('f1efd5a6-75ad-4124-852f-34829a14bb98', '9222dffc-84fa-4f94-bd92-3696baf0cd41', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 9.89);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('762b818a-89d3-4694-9ed6-67cfbc8a84cc', '4366a293-8eb8-40c7-82d5-382df9979fb0', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 4.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d7d2d179-291e-4fa0-aeec-c9535d314217', '7a073d9b-db0a-408d-8625-a318845375fa', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 4.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('5bcda237-02ff-4f0f-a668-6551c1efd785', '3d9830f0-1d4a-4a81-a7b0-a384f3a822e7', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 4.89);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('e1449be3-c78f-4ade-8bb2-946f37923e5c', 'f97e75ca-62dd-4e8f-b131-13095669a5aa', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('3642691a-6c33-42e8-8439-044d71d7b7a6', '75330bf4-42aa-4aea-b0fe-9ad3d710e769', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 2.69);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('82f095d9-5eeb-4089-adaa-33097aa7e81d', '245b1287-80d4-4659-84cf-168b811ccbcb', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 8.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('84314e9e-5c52-4962-985b-be1a0c0b7662', 'a8ff26f1-c645-4aa2-b89a-3f0fb20d48b3', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 2.39);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('6eb646e7-2d3d-43de-b531-c8f061f867c9', 'd8395eee-3da0-47c1-ae81-0ece215f49fc', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 29.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('8b432b7b-ba04-453e-ab2b-49e2a844480a', '499b37b5-912d-4c21-a8ef-28f9576ea1fa', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 7.79);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('f1deb967-de9a-4772-aa76-b1bd4183e130', '2fbf710c-1413-48b5-9cab-dfd7a189c820', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('3663cad3-3536-450b-995b-f6badb59efb3', '865dd03e-c889-4643-9c02-e871d4387290', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 24.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('8cc74a33-cc90-4afb-bf8b-8b23e693f3a8', '8b8cfbde-4355-4c7d-a633-63e631c039ad', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 2.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('8ecadc57-8916-4cfc-9b57-8b217c719f6d', '3228fa4b-8c15-4b5c-a527-730863bfcac1', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 5.69);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('ea245e43-c2d9-49a0-9771-aa6061c60ec3', '81c908d7-3a86-4340-b7d5-7399dac4ef2f', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('b851e562-9ed5-49dd-b0b5-7563986ef641', '9fca2482-969d-4a95-8c9a-763627ef9223', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 1.39);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('0f4764db-35d3-4327-bb18-66c2b32aeb53', '54995d2c-5d49-489a-bb91-73166252b05b', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 6.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('a0b7ad36-d10b-4202-a438-2436706e807f', '7ac39970-da04-41e8-a09c-047aabfa637e', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 14.48);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('961eb052-3404-4651-a7b7-36312c41a60d', '3d202b49-99cf-45a0-9dd3-9e2333398559', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 4.59);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('7a6201a1-2f8a-426e-b00c-b3f2226e0e32', 'a3bca956-ccf6-45fd-9b19-2eff1917c398', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 7.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d443c6ce-1c76-4167-8af2-74066865de66', '5a922453-84eb-429b-a340-e533450a705a', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 6.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('dcf153b4-0652-4203-85a7-8429b41e4dcf', '6d60bfc3-795d-447e-96e8-2a507262e4f9', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 4.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('a1d043e2-7dcc-4c27-ae84-d0ab690486a6', 'f5726567-f63c-42ae-8bca-580e0080d0f6', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 8.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('27a61acb-ea27-407b-a44b-caa0c5c93d98', 'a0be26c2-6e0a-465c-93e3-f5968589470c', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('5b721e61-31f3-438d-a9ee-990f1ecee18b', 'e92cc089-287a-4078-9ced-2fe2b293e548', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 6.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d7374800-0c54-4e03-87b7-1942212ee84f', '4c4800a7-85c9-44f4-bff7-1b9722accbe6', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 1.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('a3a2a8a6-ae24-45f9-9c95-5be4c318017f', '3c4e994b-d029-47a9-b1ee-778a0f7a88fd', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 8.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('828b6a15-89e9-4689-8306-1ff5a3d24782', '46dfb35f-89e8-4ffb-94f7-a5176c06a6e2', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 4.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('cf344f0a-ce3d-459d-ba99-989762466796', 'ecaec186-c030-44e4-a044-42ea6c6aac7c', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.59);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('958b1da5-b797-4808-aabf-40fc8ba26edf', '3cb7c103-8306-47c8-a0a7-e58bd87ec835', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 2.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('61148c4c-f900-40c8-83b0-3936053f18ca', '7fa4a300-4f6c-4c72-accb-2cef0bb5eb48', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 7.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('ab280e11-2977-4ab0-8355-cf6a7f63223f', 'd3ae2237-9ea0-4d18-b933-c4fd34884c16', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('782d1966-18a2-4547-8ab0-e090124a7383', 'dffa5dad-a8af-46e9-b837-ea4aa8d049e4', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 8.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('7f0e1919-8cf7-493f-8a20-b26b155bebd4', '2ca8562d-b8da-42ac-b101-dee8ce030c54', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 4.24);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('394506df-32fa-4d6a-ae91-5bba1dae57e0', '3bc4a935-8e6d-4db0-a073-5f21d5cb5c40', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 7.79);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d61252e0-9b1e-4b3c-bfae-bf826541f3c4', '0f563cfd-8eec-4a49-be9b-9097b52640b4', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 2.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('4a67fb65-d554-4a1a-bbe1-96771258c76d', '2d0be50a-33fe-4f60-809f-ef0acb290032', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 8.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('57492936-fb2d-46b1-ae7d-1d9ba3b56906', 'f34773e2-e2a4-499f-b544-044c008d46d2', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 6.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('a37a682e-e12f-48c4-94de-0f0d7af5c368', 'b856b263-8718-4bcf-ac2e-1d490007b9dd', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.59);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('3da23124-3cc4-4dac-a275-cb017e3a8ef4', '53394e3c-3185-4af3-a31f-7360d3f93e32', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 6.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('5d0cb617-d169-4121-8f14-4fd256223659', 'eb4f8893-09a4-4492-a897-6a1bcd923f7b', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 4.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('7b2567bd-9101-48d4-8d87-3dc3447dfba9', '4328c7df-3962-499b-852d-a2d7025f8157', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 0.79);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('8ae3f158-c55e-4726-9a52-7e2ce9c7c550', 'f0788fa9-2324-44a6-9deb-584c9dbc6da2', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.89);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('7aaf71e5-beeb-43bf-b1bc-ce929e7cba5d', '61657962-8236-46dd-8566-4c1b4b5af07e', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 4.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('b550f311-6457-4e00-b063-b761e26ea37c', '67bae964-1b98-48d7-b11b-f36633b3bd42', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 5.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('b614a51c-3351-4095-979a-e938cf11093e', '57aad6b8-0aec-4137-ac8e-5b4b7535439f', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 2.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('775b8922-1f52-4ae6-84af-4d22b0aec2d7', '22bed2a2-0310-4a20-a28d-7ba7abb42820', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 7.89);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('e876a4d8-c5fd-4526-abf1-a69ca3039951', '18d4fe9d-b7da-4aab-9d4b-f822cddb0360', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('46360e22-dfa5-4c96-82cf-0f5d6ae110c4', '19695b41-6a06-48d4-910a-3d0fdf1af2d2', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 4.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('86820f46-a2cf-4182-9be2-e537fc3d61d5', '43ebbc80-79f1-4443-a263-f0765e38812b', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 6.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('847162da-9c87-4bca-82c9-887ebfb846d1', 'a14348a2-b978-4b8c-a59f-c44eabe5ba73', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 13.88);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('12c9308f-8054-48f2-bc0d-8d3ab4d138f3', 'b0ccb1de-66f8-4635-a0e2-312a9cbd6a62', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 2.69);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('0748261d-ed11-4bb9-9f36-0fe6d3ef9684', '97452d9c-5242-469f-9488-360cc96197f8', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.59);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d1f0628b-be6b-4bb4-abac-ca4fb1aa0be5', 'b1685c3f-eddb-47a5-b607-b9df34544223', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.0);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('61384af4-5f8b-4eff-949c-3ccf0f2a9a41', 'b475974f-3f6b-4f7d-9bb2-b6624184f300', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 2.69);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('28c5d425-c376-443c-a348-6f7cccede209', '0b8e722c-faf2-4acb-a509-bd3e419ae9e2', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('a2ffedf0-b269-4fa8-a2ea-5a0d0879ea04', '91fe4133-c6cb-4ff9-9edf-6865c7f56e1f', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 1.59);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('df93bdb9-51ba-41a2-8f03-91a0b1eb5e8a', 'ce5ebeac-2a94-4adb-a86e-df75fd7733fb', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d3daea72-a52d-4d73-9032-d4dacfa24e5d', 'b0d981a0-6fe2-4f36-a2e9-80bdc5121406', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 2.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('cf8190fc-5aff-42af-9d00-eebfd9242ee7', '7f1ed9b2-09dc-4239-9aa8-f2f79651c527', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 7.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('fc7c6aef-0e4e-4534-a177-aff4923eb67d', '371bf2cd-9800-461b-916a-e6ddd855ea98', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 8.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('4d97f07d-3f00-4883-8eab-6dc08f8fc99e', '23e95c24-4640-45b5-9b69-657efb6a0889', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 8.89);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('014191dd-3b66-4f47-a381-feb3d19ba502', '91739652-ec16-4d3b-9552-49ca972af8c8', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 8.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('dcc30e87-5d9b-4439-9a60-96f1e0b28d00', '24642284-bbb7-4f02-8ebc-39f8a541b7ec', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('521009d6-688d-4b65-a5c4-6add9eac19cb', 'ca8d982d-79ac-4a79-8557-fab077519184', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('daae8175-99b3-481c-9a08-d955b2cf2c0d', 'cb922e07-a058-45d5-8526-39376e1b28f3', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 29.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('f83fd1ae-0ca0-4183-98cf-20df33d08599', '94df9774-9c64-42fb-a535-411fa22d3147', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 5.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('0f97bd24-20cd-4c6e-97a3-7d82d26d9811', '33910508-06f6-40f3-95df-cdc5c0f7ae3f', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('1df06c69-e488-4efc-a776-1aabc49494f3', 'e1c98917-8ac8-4902-92c7-38b2d2e8fd4f', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 7.39);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('b20dacb0-8b62-4dd4-9fa4-dca5f642eefc', '5097ce14-eeeb-4271-a960-a2df510a4f8e', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 6.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('abf1987c-a5f7-4d9f-a04d-1a8909897631', 'a9484d42-9a82-4c4b-80b1-ed4b68f4bdc2', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 4.59);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('69dd245b-eaf5-467d-87bf-d7c657f13bda', '9007144a-c12c-4c5a-a4a1-c7b4d30bf995', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 13.88);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('07545942-5f3e-4705-9b73-047ef90dc866', '83055139-4b9d-4e0a-9e94-74376ea3d63d', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 24.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d26af497-ac94-470f-8cce-51e227d7990d', 'a46e7ea5-f6e5-464b-9765-a1c0629c836d', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 2.59);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('caf861c1-0b8c-4909-8464-91e4caf1d597', '763d645b-2300-4b42-a121-9ed1644d6fd0', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 5.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('1cfe4979-3189-4db4-8449-12dc2ad28e8b', '925532c4-5910-4832-808d-619b49d5774c', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 5.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d68b6ff1-3298-465a-a2a4-3025fa262c02', 'fcb946b1-b5f8-4321-b467-a0ba781512a8', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 2.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('8127ce94-28e0-4311-b8a8-46981ac31f61', '3c6f2682-a196-4581-8c86-c4bef88cb73e', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('9946dd67-b1b3-44d8-ab85-85c8ec65b88c', '527192ce-c228-4812-9474-255e1911e69d', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 14.48);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('ad043da2-e764-4e05-b170-c9b9aaa7024e', 'a45a950c-9340-4a5c-8f9e-a11bc486f1a9', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 5.89);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d13548f3-e178-44f4-8f01-974acf4b975e', 'dcafcaf9-48a6-4030-98a6-62daeea2f11f', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 6.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('f0d61ef0-9e21-4812-b450-7cb4d280fdd0', '2a7bef8a-20c2-417e-8729-792aeccd5b35', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 5.69);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('ffebfdb0-6975-476f-94de-945ce1557eef', 'b1606524-dccb-4c78-bb63-66262fd4281c', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 35.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('5c0d862c-117f-4b2a-83e1-2b1f12b2414c', 'a6f87f23-bf23-4016-925f-2fd26fe57d9e', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 46.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('163e31c0-732d-442d-a1da-5ac9a14ba673', '6199cb79-61f8-4c1e-91d6-6e19ad9d0e9f', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 4.59);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('cb2a02ea-e0ba-430f-bd18-8b3618c7d29b', '2e20cc6c-6433-47f8-ab3f-a7692cc9c5fa', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 1.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('10d9f480-e733-4f52-a53f-bda6c259fef8', '21464c37-9965-45ae-933f-440d7f927a8b', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 10.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('dc2a1d69-d586-4060-b88c-1fd6c4199711', '1aecab50-a18a-44b9-aa63-d447521672d3', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 14.48);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('f50cd082-2775-47fe-a560-bbe9d2802909', 'f0800958-669f-431d-8a82-0cdb021fb740', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 1.39);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('410da46f-74fa-41d1-ad69-3cca52b273cf', 'b4446c1d-b3e7-45b7-94cd-1c99506b2bd6', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 45.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('8df789b6-7bec-4048-80fd-15cab5d8e83b', '531e6173-57ca-47ae-8576-0120f2204077', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('f1244b31-90eb-4bb4-8902-cf18fc4e597e', 'ca05c6c1-4e39-4a3e-b00e-88c50c6c2b2d', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('81eb4319-6c31-48e2-aa33-47e1550ed8cc', '885bb35d-d7e2-47a0-b1a3-6eb43f87d7bb', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 2.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('868f1f94-b4aa-425a-ad09-dca4072ba8ae', 'c8cd840f-381e-4659-b66e-db7e7af51342', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 2.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('629e6b84-7576-4cb0-937c-9ca8bab5e56b', 'd4a4e831-e753-4793-baf1-5c0222a37daf', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 9.59);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('650e94cd-01ee-49ee-9a5c-afc1b72bddf8', '91704b1d-07cc-43c7-9b67-aa23f04210c9', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 2.69);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('72cee65f-ebd9-4b79-929b-b1d31e1d42b6', '1dbb0322-b4f1-4730-bd21-3d38ac651680', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 7.79);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('099b9a39-9193-4e04-b5d1-613484951c34', '55c2310c-c90b-4dda-9233-84c1010b38f7', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 2.54);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('f5f8f642-1179-4cd8-b636-3350c5216d15', '3206afc2-39df-4c13-8c68-1d6527c1498b', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 4.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('cc5cecd2-7b33-4cfe-9b25-a3247d5e8b0e', 'ed5cbe0e-34c6-4725-a084-9a4e9c65722d', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 8.89);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('413d9c4a-bb09-4837-b8fa-2d1013501c90', 'c571f2cf-3b7a-430c-a44a-e5ee91639340', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('8b4ecd85-5733-4531-be5c-12809ad078f3', 'e25c6062-e9bd-4c79-b5bc-c0d93fd0199f', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('2527cea1-0a95-4bba-8030-2e09fb1a7dbc', 'a118d938-bcb7-40fb-948f-58fc8e304022', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 0.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('892ac767-de7d-4f6b-93c2-093b013d835a', 'fbead265-edfe-418a-8aa7-4e4cb391731f', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('0561ba26-7fe1-46d5-863f-99ccba12a507', 'c3243dcb-9353-4b5c-b509-11fb9499ae03', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 8.69);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('069b710d-4378-4d18-929b-f3474cce28fa', 'f1ece033-0a3c-44e8-922b-9af44f10bb00', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 4.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('e00176f4-5cab-44e7-90d3-23b74a9c59d5', 'b11df752-76d0-4699-9e23-ac149ae52e6b', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 12.79);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('ed084a24-3293-4e1e-be10-42d7b7bc815b', '4f4d16f3-c53d-4098-95a0-669ae9045ac6', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 1.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('12153af9-3f8e-4396-a57d-d9f01680df44', '46d6d6f4-96aa-419c-88e7-99b5a566105c', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 8.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('33cca1ca-dce0-4f27-baca-4d7167acc34b', '95c75dbe-1ae2-4016-a215-d8fda7743402', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 7.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('1b8e9690-ade3-4378-8f43-9c1ec3b3b252', '213a9397-dc19-4897-9ac4-6b7e262187f5', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('dd986cb5-75d4-4761-9995-6b594740e775', '14036922-5b02-4c20-b968-e7a88125a90b', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 4.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('9cde9bd7-cc77-4768-b783-3d127d8d89e7', '4f1d60bc-3bc0-4e0a-82ef-7705636b0272', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 5.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('a2486fc0-a8cc-4e8b-be28-16010ed8eb8f', '4576b89e-ecb2-45d6-a5b4-4d139bd48295', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 9.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('9fcbaa58-81d0-4e27-8962-0c353e855709', '40a0ef02-ec0e-445e-a7a3-892ad6da36a3', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 4.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('2ab0a144-61c3-4539-a3f1-e171c72a0f64', 'bca5da56-d248-4ead-901b-529ec72c2f0b', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 5.39);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d5a482fa-b604-47d7-a448-ba66143d8afe', 'fdd65ab0-8757-4fd3-99e3-70796d4040ca', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 12.79);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('62c83e66-645a-4066-a35d-636af7dfeade', '5419c98c-8ee6-4a4c-aa01-fab56d194b11', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 7.89);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('b3bfdbf1-877e-48cd-bfe1-1c27e14e9514', '03e5d3df-cd90-41c1-984e-6048c4d8af2e', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.59);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('e6e6d9e6-04d6-4b9f-acd4-117270816649', 'f5e15b2e-e46f-4ac9-bcd0-0263904a4e6e', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('540def69-f321-41fa-b194-a5399b102c13', 'e16ae37e-b5f0-4f8b-91ce-ad706b165a1b', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 13.79);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('23056b2e-3ec0-4034-833a-ab3700366edf', '89a0d833-d1d9-4f2b-8915-1875c72c73f1', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 4.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('de15256a-32a2-4286-ab96-a7ab312aac86', '8192de8f-fe24-4b4b-92f1-ac12805b83ac', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 25.98);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('8a816c45-9fd2-4e1b-90fa-7815b8d96b8e', '0c75c93a-fb59-4954-9495-15c6489ee2c8', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 6.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('e1cb3749-b2eb-4f65-8bea-85e2431096fa', '6e96f078-6185-4519-aed7-446ce1ed668c', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 8.69);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('5d9e9819-0592-4d08-a4cd-ffe5b560e3aa', '9c1b6f55-36fa-46b0-8793-b3db9ddd1d19', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 7.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('7d0bb860-5512-4990-b650-1982f88c75c5', '1842f8c9-353b-461f-8ed2-499d48227134', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 5.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('47aaf416-530c-40c4-89c5-83c6b1541709', 'f534e612-0de0-4d68-ac9f-bb62c89b92fd', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 2.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('c1bf1498-84d1-46ed-b9f6-c64f8419fdcc', '430e5509-f3b1-454e-abbc-af515d72c88d', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 7.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('e8e554cb-5c1f-4d52-b4b0-cc7649974674', 'bb27b877-5040-448f-add0-7848a8cd5734', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 4.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('5a13003d-fc92-433a-905c-122d4280e22e', '49e72c8a-e9fe-48fb-ad12-ccfced94b4a6', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 38.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('656a7747-b918-4372-87d2-a39b06f90212', '9f03c5a5-7d7a-466e-aa7c-71efbc765522', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('fcc615cc-743b-4cbd-a40c-856c7d684a89', '45ef2afe-2933-4943-8057-218e727d6ae5', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('3fb3a37e-c1aa-45a9-88fb-65850c51cb6b', '83209c6d-c170-4e02-9d36-a92c5945aa55', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 6.59);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('cf361d21-8835-445b-b025-8aaadd4a0430', '6c0d991d-c218-4f33-aa3d-82393da345b2', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 7.69);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('562dd149-d084-4e7c-b143-6550eaccd989', 'ae56b617-bdd8-4ee3-a32e-5dbfac81e898', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('7f4c77aa-f099-4a1b-9526-c3408e664468', '9f1965a9-d3e1-4b32-8ecb-7be3144263bb', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 10.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('b61a436d-9d83-462c-b0bb-e4d33db3e371', 'caf4f109-eaa1-4422-a53f-9fa9b662dee1', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 5.79);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('b321cb00-9803-47d9-908a-eed85bcffdf8', 'e119e509-843d-4791-ba7e-81756ee37a0a', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 1.89);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('adb1b67f-92ce-4c96-a800-ec79b3c7d5e8', 'edf9e3b9-c3ad-4a79-9e20-83b225e1f6dd', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 2.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('d673371f-55b5-4ffd-914b-0b92d6a136b9', '99f1b965-c8b4-4c0d-ae08-719d307f6a91', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.59);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('895bdc4c-33df-4955-a89b-5cc74a583cb8', '50355853-9324-46f1-9fd8-faa6f695e968', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 0.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('6ca81404-b2d2-46f9-bfa0-530d06e67770', '4737eeb8-1299-4b1f-bcc0-4421d55e29a2', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 2.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('4b74c178-508a-4775-8f7e-1b2e2d7a438c', 'a78a9a50-e2bb-4764-b54e-481111a614cc', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 4.39);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('432d72f2-8ee0-4038-b8d3-98ef3bb3a9ed', '1302bad4-b143-403f-bddf-a9fbbbe9e014', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 7.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('f6931d1e-928f-4303-b0ec-eb4902f5e078', '10c61412-e456-4b5d-9398-0a97980b7dab', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 0.99);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('883d455a-225a-4d82-abed-ebb029548657', '631d3d1d-3fde-4537-b6d2-8c94ac9b8fff', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 4.69);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('04b99f7a-0bc3-4b10-812d-13a7244c530b', '24c23ccd-b8cb-49c5-8d8b-b344f51b54b6', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 12.79);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('27b2c2ba-f1cf-4740-a5e2-8fe8d2142a06', 'eba24d39-78b9-465f-9541-252a4f4a7294', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 3.19);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('35b599f2-466f-48f1-9c7f-2d9d590abc55', '8085c797-456d-4f83-b1e5-26cf2c9bcf0a', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 2.29);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('c3b0d561-3460-4702-8adc-0582da932788', '56e2414f-757c-408a-99bb-d26e51bb3dc0', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 5.49);
INSERT INTO "ItemPrice" (id, "itemId", "storeId", price)
VALUES ('2154f171-20af-4ada-85b7-81b073f6efef', '8aaf3bea-7d94-4c85-ab50-a11bc32bcf7b', '169b9b9c-f98f-4cdb-924d-59a33f83b1ad', 1.59);