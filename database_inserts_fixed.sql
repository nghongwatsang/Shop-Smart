-- Addresses
INSERT INTO Address (id, street, city, state, postal_code, country, latitude, longitude)
VALUES ('8d0b0056-78b1-435b-9fbd-0a96cf9e1336', '662 Hoosick Rd', 'Troy', 'NY', 
        '12180', 'USA', 42.7415351, -73.6495478);
INSERT INTO Address (id, street, city, state, postal_code, country, latitude, longitude)
VALUES ('95330617-4726-40e5-9471-8a6b872a5a9c', '9 Lord Ave', 'Troy', 'NY', 
        '12180', 'USA', 42.7438908, -73.6519795);
INSERT INTO Address (id, street, city, state, postal_code, country, latitude, longitude)
VALUES ('fd81a815-ea95-4241-a6ad-13b4efc0c48a', '675 Troy-Schenectady Rd', 'Latham', 'NY', 
        '12110', 'USA', 42.74909, -73.770139);

-- Stores
INSERT INTO Store (id, name, addressid)
VALUES ('cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 'Aldi', '8d0b0056-78b1-435b-9fbd-0a96cf9e1336');
INSERT INTO Store (id, name, addressid)
VALUES ('b6015df1-fbae-4122-b5b4-e2dbd53ce1ab', 'Hannafords', '95330617-4726-40e5-9471-8a6b872a5a9c');
INSERT INTO Store (id, name, addressid)
VALUES ('9eb82af8-1eae-4846-9c73-3f27432d1591', 'Target', 'fd81a815-ea95-4241-a6ad-13b4efc0c48a');

-- Items
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('3dc3f440-bc82-43fa-9447-a5a220277397', 'Original Kettle Chips', 'Clancy''s', 
        'Chips, Crackers & Popcorn', 'https://www.aldi.us/product/clancy-s-original-kettle-chips-8-oz-0000000000000005', 8.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('c397076c-d504-4c78-a1df-505aaac15af8', 'Blueberry Breakfast Biscuits', 'Benton''s', 
        'Cookies & Sweets', 'https://www.aldi.us/product/benton-s-blueberry-breakfast-biscuits-8-8-oz-0000000000000006', 8.8, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('55c5480e-7acd-45da-9f7d-32189300e66d', 'Organic Unrefined Coconut Oil', 'Simply Nature', 
        'Oils & Vinegars', 'https://www.aldi.us/product/simply-nature-organic-unrefined-coconut-oil-14-fl-oz-0000000000000008', 14.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('9502e916-4bbe-41c9-b521-cb3ba75583c6', 'Plain Whole Milk Greek Yogurt', 'Friendly Farms', 
        'Yogurt & Sour Cream', 'https://www.aldi.us/product/friendly-farms-plain-whole-milk-greek-yogurt-32-oz-0000000000000009', 32.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('407aa82a-0541-42c1-a7c8-3fa7fbcd0167', 'Wild Caught Frozen Pink Salmon', 'Fremont Fish Market', 
        'Frozen Meat, Poultry & Seafood', 'https://www.aldi.us/product/fremont-fish-market-wild-caught-frozen-pink-salmon-16-oz-0000000000000010', 16.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('0211cbeb-e511-48b5-9e0e-8442e13f3c4e', 'Parsley Flakes', 'Stonemill', 
        'Spices', 'https://www.aldi.us/product/stonemill-parsley-flakes-0-25-oz-0000000000000011', 0.25, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('acc338ba-4cc1-4410-aa08-f954841bbbf4', 'Italian Meatballs', 'Bremer', 
        'Mother''s Day Meal Ideas', 'https://www.aldi.us/product/bremer-italian-meatballs-32-oz-0000000000000012', 32.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('4a8aed54-033d-4520-b263-39b78ec98a88', 'Garlic Powder', 'Stonemill', 
        'Spices', 'https://www.aldi.us/product/stonemill-garlic-powder-0000000000000018', 3.12, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('9fa862ed-d435-43d2-9953-c0b2c6df2cf2', 'Nonfat Plain Greek Yogurt', 'Friendly Farms', 
        'Healthy Food & Snacks', 'https://www.aldi.us/product/friendly-farms-nonfat-plain-greek-yogurt-32-oz-0000000000000020', 32.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('20666f06-2bb7-4f87-8e16-15f556ebf97d', 'Organic Whole Wheat Spaghetti', 'Simply Nature', 
        'Pasta, Rice & Grains', 'https://www.aldi.us/product/simply-nature-organic-whole-wheat-spaghetti-1-lb-0000000000000024', 16.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('c5cbc567-11a0-47ca-bbbe-c6cde9bdddc0', 'Cinnamon Raisin Bagels', 'L''oven Fresh', 
        'Back to School Breakfast', 'https://www.aldi.us/product/l-oven-fresh-cinnamon-raisin-bagels-6-count-0000000000000025', 20.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('b378e4aa-1e3d-4c9c-a008-d0a1df87346a', 'Brown Gravy Mix', 'Stonemill', 
        'Sauces & Salsa', 'https://www.aldi.us/product/stonemill-brown-gravy-mix-0-87-oz-0000000000000026', 0.87, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('115081fb-35ed-433f-8f93-a1e2e270174c', 'Reduced Sodium Taco Seasoning Mix', 'Casa Mamita', 
        'Spices', 'https://www.aldi.us/product/casa-mamita-reduced-sodium-taco-seasoning-mix-1-oz-0000000000000027', 1.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('ccd7e80d-5511-435a-9497-7da4d7c08e41', 'Crispy Rice Cereal', 'Millville', 
        'Cereal & Oatmeal', 'https://www.aldi.us/product/millville-crispy-rice-cereal-12-oz-0000000000000030', 12.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('d54dc4ef-289d-4e64-8858-b8692df2f5f3', 'Roasted Garlic Balsamic Vinaigrette Dressing', 'Specially Selected', 
        'Condiments & Dressings', 'https://www.aldi.us/product/specially-selected-roasted-garlic-balsamic-vinaigrette-dressing-12-fl-oz-0000000000000031', NULL, 'Not specified');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('f2f2c703-d8b7-44b0-92a5-6911182ad11d', 'French Dark Roast Coffee Pods', 'Barissimo', 
        'Coffee', 'https://www.aldi.us/product/barissimo-french-dark-roast-coffee-pods-12-count-0000000000000032', 12.0, 'count');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('5b60f777-a2ef-4bf5-a9b7-5e6a7e0d40b4', 'Ranch Salad Dressing and Seasoning Mix', 'Tuscan Garden', 
        'Spices', 'https://www.aldi.us/product/tuscan-garden-ranch-salad-dressing-and-seasoning-mix-1-oz-0000000000000038', 1.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('360df962-0cc6-4885-a204-6115cf85b725', 'Chocolate Chip Cookies', 'Benton''s', 
        'Cookies & Sweets', 'https://www.aldi.us/product/benton-s-chocolate-chip-cookies-13-oz-0000000000000039', 13.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('ebbafa30-90ff-42ee-8fff-8af09e84d86c', 'Roasted Red Pepper Topped Hummus', 'Park Street Deli', 
        'Healthy Food & Snacks', 'https://www.aldi.us/product/park-street-deli-roasted-red-pepper-topped-hummus-10oz-0000000000000041', 10.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('737b311d-d30a-4d6e-960b-aaac37719340', 'Bratwurst', 'Beer', 
        'Fresh Sausage', 'https://www.aldi.us/product/beer-bratwurst-0000000000000042', 19.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('0c474083-9f16-46be-accd-6a710a1a958f', 'Raspberry Strip Danish', 'Bake Shop', 
        'Easter Brunch', 'https://www.aldi.us/product/bake-shop-raspberry-danish-0000000000000045', 14.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('e4b93beb-d0ee-4b4b-b746-843f6936fe95', 'Italian Salad Dressing and Seasoning Mix', 'Tuscan Garden', 
        'Spices', 'https://www.aldi.us/product/tuscan-garden-italian-salad-dressing-and-seasoning-mix-0-7-oz-0000000000000047', 0.7, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('8d30ef9b-37dc-4102-aced-c46fafcc5ea9', 'Spaghetti', 'Reggano', 
        'Pasta, Rice & Grains', 'https://www.aldi.us/product/reggano-spaghetti-32-oz-0000000000000048', 32.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('ff46b1aa-da1d-4a94-9655-ae9ac93dcfd8', 'Medium Cooked in Shell Shrimp', 'Fremont Fish Market', 
        'Frozen Meat, Poultry & Seafood', 'https://www.aldi.us/product/fremont-fish-market-medium-cooked-in-shell-shrimp-12oz-0000000000000049', 12.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('524eae0e-c607-4f82-902c-1c50990cbf69', 'Ultimate Cheeseburger Cheesy Skillet Dinner Kit', 'Reggano', 
        'Boxed Meals & Side Dishes', 'https://www.aldi.us/product/reggano-ultimate-cheeseburger-cheesy-skillet-dinner-kit-12-8-oz-0000000000000058', 12.8, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('1f40dd44-902e-4551-ace9-bf273f6f0cd2', 'Large Cooked Shrimp', 'Fremont Fish Market', 
        'Chefs Best Excellence Award', 'https://www.aldi.us/product/fremont-fish-market-large-cooked-shrimp-12-oz-0000000000000059', 12.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('212d434a-c607-46c7-9bd1-d082a664e65c', 'Value Pack Cod Fillets', 'Fremont Fish Market', 
        'Frozen Meat, Poultry & Seafood', 'https://www.aldi.us/product/fremont-fish-market-value-pack-cod-fillets-32-oz-0000000000000060', 32.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('ef8daa8d-bc10-455c-ba71-03ce01b4befc', 'Flounder Fillets', 'Fremont Fish Market', 
        'St. Patrick''s Day', 'https://www.aldi.us/product/fremont-fish-market-flounder-fillets-16-oz-0000000000000061', 16.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('0165b519-e73e-471c-8f62-1f57fd992b91', 'Spicy Hummus', 'Park Street Deli', 
        'Healthy Food & Snacks', 'https://www.aldi.us/product/park-street-deli-spicy-hummus-0000000000000062', 10.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('a59659e9-5274-4c1a-84ea-ac37b86cf341', 'Olive Tapenade Hummus', 'Park Street Deli', 
        'Healthy Food & Snacks', 'https://www.aldi.us/product/park-street-deli-olive-tapenade-hummus-10-oz-0000000000000063', 10.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('5ce6d9ad-ac7d-4c19-8be0-96dd2d93d4d7', 'Spinach Parmesan Tzatziki Dip', 'Park Street Deli', 
        'Dorm Room Meals & Snacks', 'https://www.aldi.us/product/park-street-deli-spinach-parmesan-tzatziki-dip-10-oz-0000000000000064', 10.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('3c5b56da-96da-443f-9a8e-08c4f6659957', 'Cucumber Dill Tzatziki Dip', 'Park Street Deli', 
        'Dorm Room Meals & Snacks', 'https://www.aldi.us/product/park-street-deli-cucumber-dill-tzatziki-dip-10-oz-0000000000000065', 10.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('9f862ce7-f1fb-4038-b16b-7a34be70d874', 'Swiss Almond Spreadable Cheese Cup', 'Happy Farms', 
        'Seasonal', 'https://www.aldi.us/product/happy-farms-swiss-almond-spreadable-cheese-cup-12-9-oz-0000000000000066', 12.9, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('fb3faee7-3e23-491a-b64b-733676be86bd', 'Milk Chocolate Butter Cookies', 'Specially Selected', 
        'Cookies & Sweets', 'https://www.aldi.us/product/specially-selected-milk-chocolate-butter-cookies-4-41-oz-0000000000000067', 4.41, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('37bca2c5-2238-4137-8dd8-6f9dec8ac3f1', 'Sharp Cheddar Cheese Spread', 'Emporium Selection', 
        'Mother''s Day Meal Ideas', 'https://www.aldi.us/product/emporium-selection-sharp-cheddar-cheese-spread-6-5-oz-0000000000000068', 6.5, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('675fee50-7f7a-4f83-abbd-a312fbbcc944', 'Garlic & Herb Gourmet Spreadable Cheese', 'Emporium Selection', 
        'Mother''s Day Meal Ideas', 'https://www.aldi.us/product/emporium-selection-garlic-herb-gourmet-spreadable-cheese-6-5-oz-0000000000000069', 6.5, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('28833ebf-45ac-4e10-9bc4-e8b6c32ddc2a', 'Peppercorn Parmesan Cheese Spread', 'Emporium Selection', 
        'Mother''s Day Meal Ideas', 'https://www.aldi.us/product/emporium-selection-peppercorn-parmesan-cheese-spread-6-5-oz-0000000000000070', 6.5, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('8eed47b5-2e71-4a50-ad7d-52ebf7b935d9', 'Pre Sliced Hot Dog Buns', 'L''oven Fresh', 
        'Cookout Essentials', 'https://www.aldi.us/product/l-oven-fresh-pre-sliced-hot-dog-buns-8-count-0000000000000071', 11.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('0c95dfe8-3206-4c08-b09d-0d19ba8c7b5b', 'Steamable Frozen Asparagus Spears', 'Season''s Choice', 
        'Frozen Vegetables', 'https://www.aldi.us/product/season-s-choice-steamable-frozen-asparagus-spears-8-oz-0000000000000072', 8.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('a2eb384e-2b1f-415a-80d6-1ed5b0534ec3', 'Mint Chocolate Chip Ice Cream', 'Sundae Shoppe', 
        'Frozen Ice Cream & Desserts', 'https://www.aldi.us/product/sundae-shoppe-mint-chocolate-chip-ice-cream-48-fl-oz-0000000000000076', NULL, 'Not specified');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('ffdc4cb1-91cf-4942-8dfe-b93f2adc04c6', 'Classic Hummus Single Serve Mini Cups', 'Park Street Deli', 
        'Dips & Hummus', 'https://www.aldi.us/product/park-street-deli-classic-hummus-single-serve-mini-cups-6-pack-0000000000000077', 12.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('892a42c0-c319-4f7a-821c-4be20a918235', 'Uncured Beef Franks', 'Parkview', 
        'Grilled Meat & Seafood', 'https://www.aldi.us/product/parkview-uncured-beef-franks-15-oz-0000000000000081', 15.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('c669a815-750a-4d38-b6ba-a233b6373629', 'Honey Graham Squares', 'Millville', 
        'Cereal & Oatmeal', 'https://www.aldi.us/product/millville-honey-graham-squares-0000000000000082', 12.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('f58a1d73-6590-434e-acd3-c6e693f9530f', 'Organic Apple Cider Vinegar', 'Simply Nature', 
        'Oils & Vinegars', 'https://www.aldi.us/product/simply-nature-organic-apple-cider-vinegar-33-8-fl-oz-0000000000000086', NULL, 'Not specified');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('341c9802-d8a5-4cca-8ec1-3c6f9ae1404b', 'Condensed Cream of Chicken Soup', 'Chef''s Cupboard', 
        'Soups & Broth', 'https://www.aldi.us/product/chef-s-cupboard-condensed-cream-of-chicken-soup-10-5-oz-0000000000000088', 10.5, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('5ff8bd9d-2ea1-40ad-b8a3-3cd49f2c9f33', 'Fat Free Beef Broth', 'Chef''s Cupboard', 
        'Soups & Broth', 'https://www.aldi.us/product/chef-s-cupboard-fat-free-beef-broth-32-oz-0000000000000092', 32.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('2dfee28a-345d-4464-befb-7068ed442845', 'Fat Free Beef Cooking Stock', 'Chef''s Cupboard', 
        'Soups & Broth', 'https://www.aldi.us/product/chef-s-cupboard-beef-cooking-stock-32-oz-0000000000000093', 32.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('62087d45-3e62-4f17-81e1-94dc53f7f58c', 'Organic Low Sodium Chicken Broth', 'Simply Nature', 
        'Soups & Broth', 'https://www.aldi.us/product/simply-nature-organic-low-sodium-chicken-broth-32-oz-0000000000000094', 32.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('afa69eee-6c4f-4806-8d86-2f6d9b5da999', 'Almond', 'Southern Grove', 
        'Trail Mix', 'https://www.aldi.us/product/southern-grove-retreat-trail-mix-15-oz-0000000000000095', 15.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('e7fd9e0d-d354-463c-bb50-e8caae9c71ca', 'Sweet & Salty Trail Mix', 'Southern Grove', 
        'Trail Mix', 'https://www.aldi.us/product/southern-grove-sweet-salty-trail-mix-8-count-0000000000000097', 8.0, 'count');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('7d03acc5-959f-4b0c-9f85-a9e36627e46e', 'Chicken Breast Nuggets', 'Kirkwood', 
        'Halloween Themed Food', 'https://www.aldi.us/product/kirkwood-chicken-breast-nuggets-29-oz-0000000000000098', 29.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('04295c98-c992-4e48-b30c-447ac96fa5a4', 'Frozen Steam Cut Green Beans', 'Season''s Choice', 
        'Frozen Vegetables', 'https://www.aldi.us/product/season-s-choice-frozen-steam-cut-green-beans-12-oz-0000000000000106', 12.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('5dddb408-a1f6-4485-b041-785d535c63b4', 'Steamable Frozen Mixed Vegetable', 'Season''s Choice', 
        'Frozen Vegetables', 'https://www.aldi.us/product/season-s-choice-steamable-frozen-mixed-vegetable-12-oz-0000000000000107', 12.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('5ba8896a-7e32-448c-9a55-e880156cfd96', 'Steamable Frozen Sweet Garden Peas', 'Season''s Choice', 
        'Frozen Vegetables', 'https://www.aldi.us/product/season-s-choice-steamable-frozen-sweet-garden-peas-12-oz-0000000000000108', 12.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('755d5853-9278-4e85-9f80-b611155c0763', 'Jumbo EZ Peel Raw Shrimp', 'Fremont Fish Market', 
        'Frozen Meat, Poultry & Seafood', 'https://www.aldi.us/product/fremont-fish-market-jumbo-ez-peel-raw-shrimp-12-oz-0000000000000113', 12.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('37f8d804-6dd7-4fed-ad44-627f3b5ee697', 'Jumbo Cooked Shrimp', 'Fremont Fish Market', 
        'Chefs Best Excellence Award', 'https://www.aldi.us/product/fremont-fish-market-jumbo-cooked-shrimp-12-oz-0000000000000114', 12.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('5ae19222-eeaa-4b54-8183-704e4a443c7d', 'Organic Garlic Powder', 'Simply Nature', 
        'Spices', 'https://www.aldi.us/product/simply-nature-organic-garlic-powder-2-5-oz-0000000000000115', 2.5, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('5e95a163-55f8-43ef-8c3d-a5eee29bf1f7', 'Classic Single Guacamole - 6 Mini Cups', 'Park Street Deli', 
        'Dorm Room Meals & Snacks', 'https://www.aldi.us/product/park-street-deli-classic-single-guacamole-6-mini-cups-12-oz-0000000000000121', 12.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('bee9bf80-920c-4307-b64e-1dfa63bb640f', 'Red Pepper Hummus Single Serve Mini Cups', 'Park Street Deli', 
        'Dips & Hummus', 'https://www.aldi.us/product/park-street-deli-red-pepper-hummus-single-serve-mini-cups-6-count-0000000000000122', 12.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('ecf33dd9-4630-4bd5-90ff-4f6924a6760d', 'Fair Trade Organic Guatemalan Light Roast Coffee Pods', 'Simply Nature', 
        'Good Housekeeping Nutritionist Approved Emblem', 'https://www.aldi.us/product/simply-nature-fair-trade-organic-guatemalan-light-roast-coffee-pods-12-count-0000000000000126', 12.0, 'count');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('3e33473b-1153-445f-851b-3af01397ac03', 'Original Sloppy Joe Sauce', 'Brookdale', 
        'Sauces & Salsa', 'https://www.aldi.us/product/brookdale-original-sloppy-joe-sauce-15-oz-0000000000000127', 15.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('07bfca91-df4b-43b1-8570-8fe900f868a0', 'Casera Amarillas Tostadas', 'Pueblo Lindo', 
        'Tortillas & Flatbread', 'https://www.aldi.us/product/pueblo-lindo-casera-amarillas-tostadas-12-8-oz-0000000000000128', 12.8, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('e50c645d-1564-4025-a16f-17ce0e83a91e', 'Flour Tortillas', 'Pueblo Lindo', 
        'Back to School Lunches', 'https://www.aldi.us/product/pueblo-lindo-flour-tortillas-17-5-oz-0000000000000129', 17.5, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('8e5d0831-d66b-4e23-b965-86cdb2dfa4e3', 'USDA Organic Black Beans', 'Simply Nature', 
        'Canned Foods', 'https://www.aldi.us/product/simply-nature-usda-organic-black-beans-15-oz-can-0000000000000130', 15.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('b3ae25a3-281c-4f65-9df4-a091897ab707', 'Fajita Flour Tortillas', 'Pueblo Lindo', 
        'Tortillas & Flatbread', 'https://www.aldi.us/product/pueblo-lindo-fajita-flour-tortillas-20-count-0000000000000131', 23.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('6963305c-fb8e-49f9-b8e4-66b205c6a07a', 'Vitality Cereal Vanilla Almond', 'Fit & Active', 
        'Cereal & Oatmeal', 'https://www.aldi.us/product/fit-active-vitality-vanilla-almond-0000000000000133', 12.4, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('c941c2f1-9c2b-4219-a0e9-05a9311c215f', 'Mini Chocolate Bars', 'ChoceurMilk', 
        'Cookies & Sweets', 'https://www.aldi.us/product/choceur-milk-mini-chocolate-bars-0000000000000134', 1.4, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('d4371086-2827-4b1d-9717-38b02c66a277', 'Chocolate Chunk Cookies', 'Bake Shop', 
        'Halloween Themed Food', 'https://www.aldi.us/product/bake-shop-chocolate-chunk-cookies-14-oz-0000000000000135', 14.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('375fca09-cfdc-42ab-a40c-313ae497b21b', 'Organic Blue Corn Tortilla Chips', 'Simply Nature', 
        'Chips, Crackers & Popcorn', 'https://www.aldi.us/product/simply-nature-organic-blue-corn-tortilla-chips-8-25-oz-0000000000000136', 8.25, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('627ebcad-b75b-4c6d-af26-a895cafbf72e', 'German Style Sauerkraut', 'Deutsche Küche', 
        'Condiments & Dressings', 'https://www.aldi.us/product/deutsche-kuche-german-style-sauerkraut-24-oz-0000000000000137', 24.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('19d80af4-ac49-4ba3-b552-4fc26a3ddd1e', 'Aluminum Foil', 'BoulderRegular', 
        'Paper & Plastic Products', 'https://www.aldi.us/product/boulder-regular-aluminum-foil-75-ft-0000000000000139', NULL, 'Not specified');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('531e3542-10ae-4058-afec-bddbede948e7', 'Mini Bear Chocolate Grahams Snack Packs', 'Benton''s', 
        'Cookies & Sweets', 'https://www.aldi.us/product/benton-s-mini-bear-chocolate-grahams-snack-packs-12-oz-0000000000000142', 12.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('191eba71-0f66-4850-8e45-2580180d9825', 'Cranberry Almond Chicken Salad Mini Cups', 'Park Street Deli', 
        'Dorm Room Meals & Snacks', 'https://www.aldi.us/product/park-street-deli-cranberry-almond-chicken-salad-mini-cups-4-packs-12-oz-0000000000000143', 12.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('96e1aafb-1b30-4501-b59a-bccb6c84b95d', 'Cranberry Almond Chicken Salad', 'Park Street Deli', 
        'Cookout Essentials', 'https://www.aldi.us/product/park-street-deli-cranberry-almond-chicken-salad-16-oz-0000000000000144', 16.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('5258f652-bebc-40f5-a3cd-54bc4cf3d2b0', 'Medium Fresh Cut Salsa', 'Park Street Deli', 
        'Sauces & Salsa', 'https://www.aldi.us/product/park-street-deli-medium-fresh-cut-salsa-16-oz-0000000000000146', 16.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('30a2760c-c822-40f7-80ec-d6983f2e2576', 'Jubilee Assortment Olives', 'Park Street Deli', 
        'Charcuterie', 'https://www.aldi.us/product/park-street-deli-jubilee-assortment-olives-7-oz-0000000000000147', 7.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('b55fd09f-beb5-41d4-8898-fe833a70f032', 'HE Liquid Laundry Detergent', 'TandilOriginal', 
        'Laundry', 'https://www.aldi.us/product/tandil-original-he-liquid-laundry-detergent-100-fl-oz-0000000000000149', NULL, 'Not specified');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('44154572-2bb3-4700-9603-7b7145115abf', 'Chocolate Protein Meal Bars', 'ElevationDouble', 
        'Protein, Granola & Snack Bars', 'https://www.aldi.us/product/elevation-double-chocolate-protein-meal-bars-6-count-0000000000000153', 6.0, 'count');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('78552278-d4be-4fd2-b2bf-dbd0737de8a5', 'Low Sodium Sprouted 7 Grain Bread', 'Simply Nature', 
        'Healthy Food & Snacks', 'https://www.aldi.us/product/simply-nature-low-sodium-sprouted-7-grain-bread-16-oz-0000000000000154', 7.0, 'g');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('c17f2321-525f-4b9e-90d0-ef736faef719', 'Nonfat Vanilla Yogurt', 'Friendly Farms', 
        'Yogurt & Sour Cream', 'https://www.aldi.us/product/friendly-farms-nonfat-vanilla-yogurt-32-oz-0000000000000156', 32.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('32703546-686b-4654-9165-761583407c81', 'Drawstring Kitchen Bags', 'BoulderTall', 
        'Paper & Plastic Products', 'https://www.aldi.us/product/boulder-tall-drawstring-kitchen-bags-45-count-0000000000000159', 45.0, 'count');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('ca0fa904-5e3b-4f0d-829c-0c9a081e946c', 'Fat Free Vegetable Cooking Stock', 'Chef''s Cupboard', 
        'Soups & Broth', 'https://www.aldi.us/product/chef-s-cupboard-vegetable-cooking-stock-32-oz-0000000000000161', 32.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('b51fbfc1-3801-468e-bad1-8c7160e39a45', 'Teriyaki Stir Fry Sauce', 'Burman''s', 
        'Sauces & Salsa', 'https://www.aldi.us/product/burman-s-teriyaki-stir-fry-sauce-14-5-oz-0000000000000170', 14.5, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('82194d95-bb91-4d96-ad3e-73b40041b670', 'New Orleans Style Jambalaya Rice Mix', 'Earthly Grains', 
        'Boxed Meals & Side Dishes', 'https://www.aldi.us/product/earthly-grains-new-orleans-style-jambalaya-rice-mix-8-oz-0000000000000172', 8.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('6fa23113-fd5b-4e17-bb21-9bc097bc5a86', 'Pineapple Chunks in 100% Pineapple Juice', 'Sweet Harvest', 
        'Canned Foods', 'https://www.aldi.us/product/sweet-harvest-pineapple-chunks-in-100-pineapple-juice-20-oz-can-0000000000000173', 20.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('5b6e3814-9e9a-4f16-a633-2327456b19e2', 'Organics Apple Sweet Potato Baby Food Puree', 'Little Journey', 
        'Baby Food & Snacks', 'https://www.aldi.us/product/little-journey-apple-sweet-potato-baby-food-puree-4-oz-0000000000000177', 4.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('0c900102-1c76-4528-9468-2fad31ce578d', 'Apple Broccoli Pear Baby Food Puree', 'Little Journey', 
        'Baby Food & Snacks', 'https://www.aldi.us/product/little-journey-apple-broccoli-pear-baby-food-puree-4-oz-0000000000000179', 4.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('3614aaea-d34c-43ab-9626-fc1cb8852d12', 'Pineapple Slices', 'Sweet Harvest', 
        'Canned Foods', 'https://www.aldi.us/product/sweet-harvest-pineapple-slices-20-oz-can-0000000000000180', 20.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('3b48665c-cc61-416a-b5f1-806d08c86a0c', 'Dry Black Beans', 'Pueblo Lindo', 
        'Pasta, Rice & Grains', 'https://www.aldi.us/product/pueblo-lindo-dry-black-beans-32-oz-0000000000000181', 32.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('0220cb50-b6b0-4f56-8b73-ac5dbf70b5ab', 'Organic Multigrain Tortilla Chips', 'Simply Nature', 
        'Chips, Crackers & Popcorn', 'https://www.aldi.us/product/simply-nature-organic-multigrain-tortilla-chips-8-25-oz-0000000000000182', 8.25, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('095a196b-b114-45c5-af6c-73cb7ba8202d', 'Butter Flavored Pancake Syrup', 'Millville', 
        'Condiments & Dressings', 'https://www.aldi.us/product/millville-butter-flavored-pancake-syrup-24-oz-0000000000000183', 24.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('ce93c23c-78ba-4266-943a-b830ae8f7afa', 'Oregano Leaves', 'Stonemill', 
        'Spices', 'https://www.aldi.us/product/stonemill-oregano-leaves-0-75-oz-0000000000000184', 0.75, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('2f26a62f-3bef-4950-9c1d-b74f08ab5f3d', 'Organic Ground Cumin', 'Simply Nature', 
        'Spices', 'https://www.aldi.us/product/simply-nature-organic-ground-cumin-1-5-oz-0000000000000186', 1.5, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('2517c5bc-4afc-412c-87c1-2637cd91295a', 'Apple Cider Donuts', 'Bake Shop', 
        'Fall Food', 'https://www.aldi.us/product/bake-shop-apple-cider-donuts-10-oz-0000000000000189', 10.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('db239f1b-efda-4ec6-9dbd-f444293a3483', 'Organic Oats and Flax Instant Oatmeal Packets', 'Simply Nature', 
        'Cereal & Oatmeal', 'https://www.aldi.us/product/simply-nature-organic-oats-and-flax-instant-oatmeal-packets-8-count-0000000000000190', 11.29, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('d1515f47-0a4e-4a96-a6d5-bf27fccbffe9', 'Pure Olive Oil', 'Carlini', 
        'Oils & Vinegars', 'https://www.aldi.us/product/carlini-pure-olive-oil-16-9-fl-oz-0000000000000192', NULL, 'Not specified');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('f569faf3-969f-4883-87e4-8ed3c7cb1bff', 'Family Size Smoked Ham', 'Lunch Mate', 
        'Dorm Room Meals & Snacks', 'https://www.aldi.us/product/lunch-mate-family-size-smoked-ham-16-oz-0000000000000193', 16.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('fd626217-f484-4a76-8ed5-b8a184d5cce2', 'Honey Ham', 'Lunch Mate', 
        'Dorm Room Meals & Snacks', 'https://www.aldi.us/product/lunch-mate-honey-ham-16-oz-0000000000000194', 16.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('95bebf41-978b-45f4-933f-41f22abd9dcc', 'Family Size Roast Beef', 'Lunch Mate', 
        'Lunch Meat', 'https://www.aldi.us/product/lunch-mate-family-size-roast-beef-14-oz-0000000000000195', 14.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('8429ff5c-e365-4807-aa7b-2451ecc29376', 'Family Size Rotisserie Chicken Breast', 'Lunch Mate', 
        'Lunch Meat', 'https://www.aldi.us/product/lunch-mate-family-size-rotisserie-chicken-breast-1-lb-0000000000000196', 1.0, 'lb');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('8454918b-7d4e-4ae1-8423-8a20f47e3f4d', 'Family Size Lower Sodium Smoked Honey Ham in Lunch Meat Tub', 'Lunch Mate', 
        'Healthy Food & Snacks', 'https://www.aldi.us/product/lunch-mate-family-size-lower-sodium-smoked-honey-ham-in-lunch-meat-tub-15-oz-0000000000000197', 15.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('30fbae08-2d76-49e6-8855-53feed88da9e', 'Korma Curry Sauce', 'Burman''s', 
        'Sauces & Salsa', 'https://www.aldi.us/product/burman-s-korma-curry-sauce-15-oz-0000000000000198', 15.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('76e6c16d-751b-44fc-b9b3-8e814db77df4', 'Cinnamon Applesauce Cups', 'Lunch Buddies', 
        'Canned Foods', 'https://www.aldi.us/product/lunch-buddies-cinnamon-applesauce-cups-6-count-0000000000000199', 4.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('6baa9176-c882-41fa-af7d-bc161dd71e02', 'Quick Oats', 'Millville', 
        'Cereal & Oatmeal', 'https://www.aldi.us/product/millville-quick-oats-42-oz-0000000000000200', 42.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('5c28e8ba-1a02-4ee7-9db9-e4d07fa057d2', 'Roasted Garlic Alfredo Sauce', 'Priano', 
        'Sauces & Salsa', 'https://www.aldi.us/product/priano-roasted-garlic-alfredo-sauce-15-oz-0000000000000201', 15.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('a9f101d7-8016-478e-8bfc-1376d4a756cc', 'California Raisins', 'Southern Grove', 
        'Nuts & Dried Fruit', 'https://www.aldi.us/product/southern-grove-california-raisins-20-oz-0000000000000203', 20.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('513352b2-9fbc-431e-bdd1-b0eee2a9feb6', 'Herb Chicken Tortelloni', 'Priano', 
        'Valentine''s Day Dinner', 'https://www.aldi.us/product/priano-herb-chicken-tortelloni-20-oz-0000000000000206', 20.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('f857511e-68ee-440b-a5ce-29968ab1fae4', 'Pretzel Mini Twists', 'Clancy''s', 
        'Chips, Crackers & Popcorn', 'https://www.aldi.us/product/clancy-s-pretzel-mini-twists-1-lb-0000000000000208', 1.0, 'lb');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('b61e71d2-f4f7-4f84-b7ce-9452b2809fdd', 'Mesquite Barbecue Kettle Chips', 'Clancy''s', 
        'Chips, Crackers & Popcorn', 'https://www.aldi.us/product/clancy-s-mesquite-barbecue-kettle-chips-8-oz-0000000000000210', 8.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('647bace7-42cb-4d8d-b18c-acc0bfba71ea', 'Sardines in Mustard Sauce', 'Northern Catch', 
        'Canned Foods', 'https://www.aldi.us/product/northern-catch-sardines-in-mustard-sauce-3-75-oz-0000000000000211', 3.75, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('f2c2c9c6-b1d7-403a-937b-2282856d0493', 'Jalapeño Kettle Chips', 'Clancy''s', 
        'Chips, Crackers & Popcorn', 'https://www.aldi.us/product/clancy-s-jalapeno-kettle-chips-8-oz-0000000000000212', 8.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('f5c10396-bcf1-416a-8a5d-8070cdaaba18', 'Beer Battered Cod Fillets', 'Fremont Fish Market', 
        'St. Patrick''s Day', 'https://www.aldi.us/product/fremont-fish-market-beer-battered-cod-fillets-13-1-oz-0000000000000215', 13.1, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('54579222-e76d-48db-a1f1-2b28b5552b1f', 'Italian Seasoning', 'Stonemill', 
        'Spices', 'https://www.aldi.us/product/stonemill-italian-seasoning-0-75-oz-0000000000000216', 0.75, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('39923d8d-5dfc-488e-859c-dc7f8cc0b086', 'Ground Cinnamon', 'Stonemill', 
        'Spices', 'https://www.aldi.us/product/stonemill-ground-cinnamon-2-37-oz-0000000000000217', 2.37, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('b473b2b1-3407-4fca-befb-fb67003398a5', 'Champagne Cheddar Cheese', 'Emporium Selection', 
        'Seasonal', 'https://www.aldi.us/product/emporium-selection-champagne-cheddar-0000000000000219', 5.3, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('5847c0da-f27c-4523-88a7-007e1517694b', 'Sea Salt and Vinegar Kettle Chips', 'Clancy''s', 
        'Chips, Crackers & Popcorn', 'https://www.aldi.us/product/clancy-s-sea-salt-and-vinegar-kettle-chips-8-oz-0000000000000220', 8.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('a68c46a9-94c1-4cbe-a94f-5088795fdf0e', 'Four Cheese Homestyle Instant Mashed Potatoes', 'Chef''s Cupboard', 
        'Boxed Meals & Side Dishes', 'https://www.aldi.us/product/chef-s-cupboard-four-cheese-homestyle-instant-mashed-potatoes-4-oz-0000000000000221', 4.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('128a00bc-efdf-4929-9a29-22c14e9f4891', 'Low-fat Strawberry Yogurt', 'Friendly Farms', 
        'Yogurt & Sour Cream', 'https://www.aldi.us/product/friendly-farms-low-fat-strawberry-yogurt-6-oz-0000000000000222', 6.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('af56a398-40d4-4c42-8cd4-755d2993e8b1', 'Apple Chicken Sausage', 'Never Any!', 
        'Grilled Meat & Seafood', 'https://www.aldi.us/product/never-any-apple-chicken-sausage-4-count-0000000000000227', 12.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('972daf33-97b1-48d9-9a83-23716564e8af', 'Blueberry Bagels', 'L''oven Fresh', 
        'Back to School Breakfast', 'https://www.aldi.us/product/l-oven-fresh-blueberry-bagels-20-oz-0000000000000228', 20.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('04051020-aabc-44c0-9bb5-4a3ab07b42f5', 'Organic Gala Apples', 'Nature''s Promise', 
        'Produce', '', 2.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('22d7f48f-c344-4ad3-97fa-2b85d1a4ef38', 'Organic Fuji Apples', 'Nature''s Promise', 
        'Produce', '', 2.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('9a29d6c3-7968-4faf-b240-8a2f4a219c63', 'Organic Honeycrisp Apples', 'Nature''s Promise', 
        'Produce', '', 2.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('a831fa93-aa61-4b74-b790-f4bcf9d24716', 'Organic Granny Smith Apples', 'Nature''s Promise', 
        'Produce', '', 2.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('7fde71f3-635b-40f5-99ce-251b51512f3d', 'Honeycrisp Apples', 'USDA Produce', 
        'Produce', '', 1.0, 'EA');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('208d5037-3ea4-49e9-8723-90f639a1353e', 'Cereal', 'Apple Jacks', 
        'Breakfast', '', 8.9, 'OZ BOX');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('18668659-de01-496f-8ac6-fbe83ee4c54d', 'Granny Smith Apples', 'USDA Produce', 
        'Produce', '', 1.0, 'EA');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('bd020128-ad2a-433f-a55f-4c0079657334', 'Creations Apple Pie a La Mode Greek Yogurt Cup', 'Chobani', 
        'Dairy & Eggs', '', 5.3, 'OZ CUP');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('cbd0616c-fd79-49f4-9d38-d06d970eb333', 'Mcintosh Apples', 'USDA Produce', 
        'Produce', '', 1.0, 'EA');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('bbb9ef48-ab1a-4c50-9a14-2d388f212cc0', 'Pink Lady Apples', 'USDA Produce', 
        'Produce', '', 1.0, 'EA');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('3988a5f0-8f41-4448-823b-358f60f7a879', 'Gala Apples', 'USDA Produce', 
        'Produce', '', 1.0, 'EA');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('c7ac9135-6bf6-4bc2-968d-49e02390075e', 'Fuji Apples', 'USDA Produce', 
        'Produce', '', 1.0, 'EA');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('4fe45097-9cd4-4a2a-afe2-c54a4c2c7b23', 'Cortland Apples', 'USDA Produce', 
        'Produce', '', 1.0, 'EA');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('2b14842a-6a88-4c28-a68e-270882115450', 'Red Delicious Apples', 'USDA Produce', 
        'Produce', '', 1.0, 'EA');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('4b4ada6a-ddd2-4e0b-b857-e855748c1efd', 'Cortland Apple Tote Bag', 'USDA Produce', 
        'Produce', '', NULL, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('75bb99ac-de08-44ec-b920-70be643a0714', 'Macintosh Apple Tote Bag', 'USDA Produce', 
        'Produce', '', NULL, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('983f85d5-01eb-437d-b72b-843beae4a8f5', 'Mcintosh Apples', 'USDA Produce', 
        'Produce', '', 3.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('71fec5bb-e85c-436f-942a-9c26e8693305', 'Honeycrisp Apples', 'USDA Produce', 
        'Produce', '', 3.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('0d9c2650-39a8-447c-bf4d-3aaab0e3811f', 'Gala Apple Tote Bag', 'USDA Produce', 
        'Produce', '', NULL, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('c14738f0-794b-4144-825b-b76355968ad3', 'Granny Smith Apples', 'Hannaford', 
        'Produce', '', 3.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('af53f363-099c-4956-8c2e-7206d7f97232', 'Gala Apples', 'Hannaford', 
        'Produce', '', 3.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('b6505036-b941-4e94-8e35-12c6c49dd29f', 'Gala Apples', 'USDA Produce', 
        'Produce', '', 3.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('5f49afdf-3cb0-4d96-bd7d-6d15f82fa260', 'Empire Apple Tote Bag', 'USDA Produce', 
        'Produce', '', NULL, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('9c579f30-4417-4eb5-8f4d-19989f593800', 'Pink Lady Apples', 'USDA Produce', 
        'Produce', '', 3.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('8419e25b-1282-4712-b80b-001e3e2a7935', 'Granny Smith Apples', 'USDA Produce', 
        'Produce', '', 3.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('5bb7ef4e-bef2-4d76-9c1e-e20561814c1a', 'Fuji Apples', 'USDA Produce', 
        'Produce', '', 3.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('5dca55a8-a124-4b25-9574-c4d4134552a6', 'Envy Apples', 'USDA Produce', 
        'Produce', '', 1.0, 'EA');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('38d9dfe3-95fd-4ac5-bd7c-443e01d1830b', 'Cosmic Crisp Apples', 'USDA Produce', 
        'Produce', '', 1.0, 'EA');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('acc5b10f-4369-4aea-b975-ce7cfccdd14c', 'Macoun Apple Tote Bag', 'USDA Produce', 
        'Produce', '', NULL, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('14ea8774-a234-4b68-a266-51cbed8fd70d', 'SugarBee Apples', 'USDA Produce', 
        'Produce', '', 1.0, 'EA');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('bdffdeab-2dfc-4851-bcf7-9029b7e66236', 'Macoun Apples', 'USDA Produce', 
        'Produce', '', 1.0, 'EA');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('fbf8ef1f-fcf0-474f-8a86-afeedab24d2b', 'SweeTango Apples', 'USDA Produce', 
        'Produce', '', 1.0, 'EA');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('c9c57699-4225-4f19-be07-10a01322e1e5', 'Kanzi Apple', 'USDA Produce', 
        'Produce', '', 1.0, 'EA');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('edefa4a3-9956-4a3a-992b-5301b4b29420', 'Kanzi Apples', 'USDA Produce', 
        'Produce', '', 2.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('088cdfb8-fd00-4eb8-8656-9261347eec83', 'SweeTango Apples', 'USDA Produce', 
        'Produce', '', 2.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('0c8a1edc-23b6-4cd2-9308-627661ef9f4e', 'Early Red Apple Tote Bag', 'USDA Produce', 
        'Produce', '', NULL, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('b836c75b-56c3-4203-90a7-5f389b2092fa', '100% Apple Juice', 'Hannaford', 
        'Beverages', '', 64.0, 'OZ BTL');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('f2b161e0-ba75-4955-9a8a-c45134fdcdfa', '100% Apple Juice', 'Mott''s', 
        'Beverages', '', 64.0, 'OZ BTL');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('004202a8-7dea-4bd6-85da-380cd0050406', '100% Apple Juice Fresh Pressed No Sugar Added Natural', 'Mott''s', 
        'Beverages', '', 64.0, 'OZ BTL');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('a52ab18d-db3d-495f-8374-f64688149016', '100% Apple Juice', 'Hannaford', 
        'Beverages', '', 96.0, 'OZ BTL');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('2666daff-6529-4de7-9e4c-b59dc534c0eb', 'Original Almondmilk Unsweetened Non-Refrigerated', 'Almond Breeze', 
        'Dairy & Eggs', '', NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('2c90cc13-4910-4d68-b794-bd69821d4cb0', 'Reduced Fat Milk', 'Battenkill Valley', 
        'Dairy & Eggs', '', NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('5cc6ea2b-681a-4a06-9d49-dc3b27afe777', 'Chocolate Almondmilk', 'Almond Breeze', 
        'Dairy & Eggs', '', NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('d8bac475-6605-4b81-9c9e-289d4f63e81b', 'Lactose Free Whole Milk', 'Lactaid', 
        'Dairy & Eggs', '', NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('44d2f8ad-ed51-4a21-8bd5-1155eff26c55', 'Vitamin C & D Whole Milk', 'Hannaford', 
        'Dairy & Eggs', '', 1.0, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('5340784f-6be1-42d3-abcb-2d0adb33c3b0', '2% Reduced Fat Milk', 'Hannaford', 
        'Dairy & Eggs', '', 1.0, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('2562cdbd-00b7-421e-9411-47bd82bdbbe4', 'Lactose Free Protein 2% Reduced Fat Milk', 'Lactaid', 
        'Dairy & Eggs', '', 52.0, 'OZ CTN');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('ec73330b-53c8-4f6c-8d8e-d815f2e8d327', 'Vitamin D Whole Milk', 'Hannaford', 
        'Dairy & Eggs', '', NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('79a3b8c6-9d67-4002-b755-f01f106654df', 'Lactose Free Calcium Enriched 2% Reduced Fat Milk', 'Lactaid', 
        'Dairy & Eggs', '', 96.0, 'OZ JUG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('f672f604-5c1b-4509-ab4e-c845cf227276', '1% Low Fat Milk', 'Hannaford', 
        'Dairy & Eggs', '', 1.0, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('d7c0ba13-00c7-438c-9d07-c93af28a3ea8', 'Vanilla Almondmilk Unrefrigerated', 'Almond Breeze', 
        'Dairy & Eggs', '', 1.0, 'QUART');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('9cb6c2dd-c5c0-4760-b5be-444ca676d3ee', '2% Reduced Fat Milk', 'Hannaford', 
        'Dairy & Eggs', '', NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('c1f2b9d0-368e-4884-8291-16cb27ca5036', 'Vanilla Almondmilk Unsweetened Non-Refrigerated', 'Almond Breeze', 
        'Dairy & Eggs', '', NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('c9296990-185b-48d7-b345-c1ef129b140b', '1% Low Fat Milk', 'Hannaford', 
        'Dairy & Eggs', '', NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('fa228764-6bd1-4a48-8a72-afc5cd615688', 'Vitamin D Whole Milk', 'Hannaford', 
        'Dairy & Eggs', '', 1.0, 'QUART');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('1daa2063-9675-4b7a-8793-67fd4e87bd29', 'Organic Vitamin D Whole Milk', 'Nature''s Promise', 
        'Dairy & Eggs', '', NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('58219166-e72f-445f-ac0d-d1b4dbf125c9', 'Lactose Free Vitamin D Milk', 'Lactaid', 
        'Dairy & Eggs', '', 96.0, 'OZ JUG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('a36c5ab0-f406-4096-b470-024d72b8e878', 'Fat Free Skim Milk', 'Hannaford', 
        'Dairy & Eggs', '', 1.0, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('57641b97-9c2c-4460-9c9f-11ec9b2bbbe0', 'Lactose Free Calcium Enriched Vitamin D Milk', 'Lactaid', 
        'Dairy & Eggs', '', NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('9cd66007-d842-4216-a0df-7d50f612e90a', 'Organic 2% Reduced Fat Milk', 'Nature''s Promise', 
        'Dairy & Eggs', '', NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('db24dc3e-af9e-408e-8129-8f214e98de42', 'Unsweetened Original Almondmilk Unrefrigerated', 'Almond Breeze', 
        'Dairy & Eggs', '', 1.0, 'QUART');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('bd779803-1918-441a-8fb3-a14b93486cbf', 'Organic Vitamin D Whole Milk', 'Nature''s Promise', 
        'Dairy & Eggs', '', 1.0, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('1fbf613a-1241-4251-9062-b02f2234551d', 'Fat Free Skim Milk', 'Hannaford', 
        'Dairy & Eggs', '', NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('dde287ae-4044-429d-bb3b-469cfcb90b5a', 'Organic 1% Low Fat Milk', 'Nature''s Promise', 
        'Dairy & Eggs', '', NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('7d92f34a-994f-4b3f-a300-10cb2d76dea5', 'Organic Vitamin D Whole Milk', 'Stonyfield', 
        'Dairy & Eggs', '', NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('2feb7b66-fabc-4eb5-a362-72455e29dd8d', 'Organic 2% Reduced Fat Milk', 'Nature''s Promise', 
        'Dairy & Eggs', '', 1.0, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('2774f7cd-bc47-4280-b859-66f168905de9', 'Organic Fat Free Skim Milk', 'Nature''s Promise', 
        'Dairy & Eggs', '', NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('82cfdf1d-138d-42c4-bf0c-68cfc70da99a', 'Fat Free Skim Milk', 'Hannaford', 
        'Dairy & Eggs', '', 1.0, 'QUART');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('364ad617-8382-447b-9bf8-6e67c1b3cc37', 'Grass-fed Whole Milk', 'Organic Valley', 
        'Dairy & Eggs', '', NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('08309d92-663c-4eb2-bdb1-26b574a8c099', 'Vitamin D Whole Milk', 'Organic Valley', 
        'Dairy & Eggs', '', NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('f204f4c8-ff85-4cb2-918c-681c81cd9fe7', 'Organic 2% Reduced Fat Milk', 'Stonyfield', 
        'Dairy & Eggs', '', NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('d58ddd94-8b01-4e22-a0ea-c045a8af5271', 'Organic 1% Low Fat Milk', 'Nature''s Promise', 
        'Dairy & Eggs', '', 1.0, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('6ec22fd2-4d09-4bcd-894b-274f7d4e92ea', 'Organic Grass-fed Whole Milk', 'Maple Hill', 
        'Dairy & Eggs', '', NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('0062086f-bd49-4de9-9d9a-145fabd89c20', 'Whole Milk', 'Battenkill Valley', 
        'Dairy & Eggs', '', 1.0, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('84671b6f-8959-4823-9d87-e4ed1ba6346a', 'Whole Milk', 'Battenkill Valley', 
        'Dairy & Eggs', '', NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('ef763312-8d5b-41d2-9fae-aaaf982a7b6f', '2% Reduced Fat Milk', 'Organic Valley', 
        'Dairy & Eggs', '', NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('3c3428c6-c4e0-4531-b2e6-42959fab1d50', 'Organic Fat Free Skim Milk', 'Stonyfield', 
        'Dairy & Eggs', '', NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('6c3e599c-fb3c-4a91-9565-9bf582e618dd', 'Organic 1% Low Fat Milk', 'Stonyfield', 
        'Dairy & Eggs', '', NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('1a056e4f-22dc-4871-9fb4-fd3b0697cc40', 'Vitamin D Whole Milk DHA Omega-3', 'Horizon Organic', 
        'Dairy & Eggs', '', NULL, 'GALLON');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('07fb5fac-0250-4f28-b349-a74c7c0b1d2f', '2% Reduced Fat Milk', 'Crowley', 
        'Dairy & Eggs', '', 1.0, 'QUART');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('67569645-916d-46a6-8a86-e30595620b2d', 'Yellow Bananas', 'USDA Produce', 
        'Produce', '', 1.0, 'EA');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('505762a3-fe87-4ebe-a9b1-cdc31a678901', 'Green Bananas', 'USDA Produce', 
        'Produce', '', 1.0, 'EA');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('45aa35f1-159e-4c65-9d19-675aa9240326', 'Organic Bananas apx 4-7 ct', 'USDA Produce', 
        'Produce', '', 1.0, 'BUNCH');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('073b3551-faea-4542-9fad-79fb591a1f0e', 'Green Plantains', 'USDA Produce', 
        'Produce', '', 1.0, 'EA');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('c6549f1f-c4c0-4d3a-a31c-81f230facc78', 'Fresh Pack Mild Banana Pepper Rings', 'Hannaford', 
        'Condiments & Sauces', '', 16.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('49d8087a-4901-404d-8a0a-178ef0787e29', 'Low Fat Strawberry Banana on the Bottom Greek Yogurt Cup - 4 ct', 'Chobani', 
        'Dairy & Eggs', '', 21.2, 'OZ PKG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('1119775b-0eb3-4a0d-8835-3579361a608a', 'Banana Chips', 'USDA Produce', 
        'Snacks', '', 10.0, 'OZ TUB');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('35cb4c4b-d8cd-4e22-8990-08c1fa032f56', 'Fresh Pack Mild Banana Pepper Rings', 'Mezzetta', 
        'Condiments & Sauces', '', 16.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('c7f2dc3d-f814-4047-9d2b-ce62fb37651e', 'Banana Chocolate Chunk Ice Cream', 'Hannaford', 
        'Frozen', '', 1.0, 'PINT');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('179993d0-f48d-41d8-b16b-677459718059', 'Fresh Pack Hot Banana Pepper Rings', 'Hannaford', 
        'Condiments & Sauces', '', 16.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('c55ee3da-423e-4193-8e8b-ddffebb1777f', 'Mild Banana Pepper Rings', 'Mt. Olive', 
        'Condiments & Sauces', '', 12.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('055afe22-3e93-4b87-bba8-05c0d0d8b4c5', 'Delicatessen Style Mild Banana Pepper Rings', 'Mt. Olive', 
        'Condiments & Sauces', '', 32.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('29bcb2c1-66ff-4e09-ad84-d00a53c473da', 'No Sugar Added Dried Fruit Banana Bites', 'Good Sense', 
        'Snacks', '', 6.0, 'OZ PKG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('0510dc6a-4b9e-48ff-be55-6ef01ab41788', 'Fresh Pack Hot Banana Pepper Rings', 'Mezzetta', 
        'Condiments & Sauces', '', 16.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('e0ac4560-8b3c-419a-968b-fae13ca3c5a4', 'Banana Caramel Coconut HomeMaine Ice Cream', 'Gifford''s', 
        'Frozen', '', 1.0, 'PINT');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('3822db89-8697-4b6e-b245-a1b4bdcfe18f', 'Bakery Sliced Banana Bread', 'Hannaford', 
        'Bread & Bakery', '', 14.0, 'OZ PKG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('35984c39-9e71-466c-bc12-d2f324188eca', 'Non Fat Strawberry Banana Yogurt Cup', 'Hannaford', 
        'Dairy & Eggs', '', 6.0, 'OZ CUP');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('e64e3501-9e11-48af-972e-2d0e5750ebee', 'PRO 20g Protein Banana Cultured Ultra-Filtered Milk Yogurt Cup', 'Oikos', 
        'Dairy & Eggs', '', 5.3, 'OZ CUP');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('3a523cc0-d518-41e4-afd3-76a4e3d50d9f', 'Low Fat Strawberry Banana Greek Yogurt Drink', 'Chobani', 
        'Dairy & Eggs', '', 7.0, 'OZ BTL');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('7a61b8b8-6d4f-45e8-9d87-2543d90d4276', 'Organic Kids Low Fat Strawberry Banana Yogurt Pouch - 4 ct', 'Stonyfield', 
        'Dairy & Eggs', '', 14.0, 'OZ PKG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('1e02a684-f541-4a9f-bb36-2ac6224ccde6', 'Non Fat Strawberry Banana Greek Yogurt Cup', 'Hannaford', 
        'Dairy & Eggs', '', 5.3, 'OZ CUP');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('f2fc8ef5-04f2-4541-a435-2019b251bed0', 'Original Low Fat Strawberry Banana Yogurt Cup', 'Yoplait', 
        'Dairy & Eggs', '', 6.0, 'OZ CUP');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('175e24c4-2e6b-4a97-bdaf-34499d7862d3', 'Kids Low Fat Strawberry & Banana Yogurt Pouch - 4 ct', 'Siggi''s', 
        'Dairy & Eggs', '', 14.0, 'OZ BOX');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('b64052e9-6fc0-4d80-80d7-b37e7f976f1b', 'Gluten Free Peanut Butter Banana Dark Choc Breakfast Protein Bars 6ct', 'KIND', 
        'Breakfast', '', 10.56, 'OZ BOX');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('26fdbdfa-7612-4dc3-b7e0-beb47a82f88c', 'Extra Creamy Salted Caramel Banana Whole Milk Yogurt', 'Icelandic Provisions', 
        'Dairy & Eggs', '', 4.4, 'OZ CUP');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('09537b7a-ecee-41be-99b0-2048b5d3b28c', 'Organic Banana Apple Berry & Pomegranate Gut Health Snack Squeeze', 'gutzy', 
        'Soups & Canned Goods', '', 3.9, 'OZ PKG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('15a8d534-4f1b-4306-88fd-3f8cf237c7f7', 'Organic Kids Low Fat Strawberry Banana Yogurt Smoothies - 6 ct', 'Stonyfield', 
        'Dairy & Eggs', '', 3.1, 'OZ BTL');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('0a1e5018-0449-4f4b-af6d-72490483fee2', 'Organics 2 Baby Food Bananas Raspberries & Oats', 'Happy Baby', 
        'Baby', '', 4.0, 'OZ SQZ');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('f716ad1c-922f-4a01-b2cc-1ac8553707dd', 'Dairy Free Vegan Strawberry Banana Coconutmilk Yogurt Cup', 'So Delicious', 
        'Dairy & Eggs', '', 5.3, 'OZ CUP');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('ff69a320-b368-4d93-82cb-ea2014e6a69f', 'PRO 23g Protein Strawberry Banana Cultured Dairy Drink', 'Oikos', 
        'Dairy & Eggs', '', 7.0, 'OZ BTL');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('eb10c1e0-7caa-427e-be75-ffd62b0dad60', 'Organic 2 Baby Food Banana & Pumpkin', 'Nature''s Promise', 
        'Baby', '', 3.5, 'OZ SQZ');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('cf4a06fd-4d57-44d0-bb4f-78b37f6c0a76', 'Low Fat Strawberry Banana Skyr Yogurt', 'Siggi''s', 
        'Dairy & Eggs', '', 5.3, 'OZ CUP');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('9cc045a5-b0e2-476e-9799-0b933d8104b4', 'Organic Dairy Free Strawberry Banana Swirl Smoothie', 'Once Upon a Farm', 
        'Baby', '', 4.0, 'OZ SQZ');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('79d7fa6e-fa83-45d8-97d2-0615c8a035f5', 'Organics Stage 4 Super Morning Bananas Blueberries Yogurt & Oats', 'Happy Tot', 
        'Baby', '', 4.0, 'OZ SQZ');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('a2b43dad-09fb-4b78-b772-25a761256fc5', 'Organics Stage 4 Super Bellies Bananas Spinach & Blueberries', 'Happy Tot', 
        'Baby', '', 4.0, 'OZ SQZ');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('939ecfad-33c6-48f5-bdd5-0c3d3a1222cb', 'Organics Love My Veggies Carrot Banana Mango & Sweet Potato', 'Happy Tot', 
        'Baby', '', 4.22, 'OZ SQZ');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('38e55ad1-72ee-4f91-8af7-753d0a670157', 'Picked Fresh Sliced Bananas Frozen', 'Hannaford', 
        'Frozen', '', 16.0, 'OZ BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('10a30a6c-3724-4289-a632-bae1749e4915', 'Organic YoBaby Whole Milk Banana & Oat Yogurt Pouch - 4 ct', 'Stonyfield', 
        'Dairy & Eggs', '', 13.6, 'OZ PKG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('2940cf94-13b5-4639-b5c9-f9de5d2fff41', 'Veggies Stage 2 Baby Food Zucchini Spinach & Banana', 'Beech-Nut', 
        'Baby', '', 3.5, 'OZ SQZ');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('d9f001df-1c6a-44bc-bfe0-2bd1ed607e0c', 'Strawberry Banana Finest Yoghurt', 'Noosa', 
        'Dairy & Eggs', '', 8.0, 'OZ TUB');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('8ea8622a-74ea-40a9-a374-93459566115d', 'Natural Grain Free Stews Variety Pack Wet Dog Food - 6 ct', 'Blue Buffalo', 
        'Pets', '', 4.69, 'LB BOX');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('f0794625-8f03-46f2-8dc0-cd9de2b1c8e7', 'IncrediBites Small Dogs Variety Adult Wet Dog Food - 12 ct', 'Purina Beneful', 
        'Pets', '', 2.25, 'LB BOX');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('6422c459-24cf-4514-b5ca-9ffbf3854683', 'Natural Small Breed Chicken & Brown Rice Adult Dry Dog Food', 'Blue Buffalo', 
        'Pets', '', 5.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('d5414522-b78c-4902-a836-6cb71fd405bf', 'Natural Life Protection Chicken/Brown Rice Recipe Adult Dry Dog Food', 'Blue Buffalo', 
        'Pets', '', 5.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('0ba76e57-4399-4050-b9bf-b347e64dae9c', 'IncrediBITES Small Dogs Chicken Adult Dry Dog Food', 'Purina Beneful', 
        'Pets', '', 3.5, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('56fe7dcb-d475-41ed-ac31-6acc1af1159f', 'with Tender Bites Small Dogs Chicken & Steak Adult Dry Dog Food', 'PEDIGREE', 
        'Pets', '', 3.5, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('05e6a83a-a098-4083-80c1-c064f7e9e69c', 'Natural Life Protection Chicken/Brown Rice Recipe Adult Dry Dog Food', 'Blue Buffalo', 
        'Pets', '', 24.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('d422cb42-ed68-4477-87fe-fbee579b0f29', 'IncrediBites Small Dogs Beef/Veggies Adult Wet Dog Food', 'Purina Beneful', 
        'Pets', '', 3.0, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('70bb4f38-bfa9-4838-99d4-1f3217c184da', 'Wilderness Natural Hi-Protein Chicken Small Dry Dog Food', 'Blue Buffalo', 
        'Pets', '', 4.5, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('975ceee0-01c6-4992-96ef-3d09be29a694', 'IncrediBITES Small Dogs Farm-Raised Beef Adult Dry Dog Food', 'Purina Beneful', 
        'Pets', '', 3.5, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('56677c0e-81f1-4b8f-bc78-a9bea873b7f1', 'Healthy Weight Chicken & Brown Rice Adult Dry Dog Food', 'Blue Buffalo', 
        'Pets', '', 15.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('fb412699-ea55-45e3-95f7-06154000fc05', 'IncrediBITES Small Dogs Farm-Raised Beef Adult Dry Dog Food', 'Purina Beneful', 
        'Pets', '', 14.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('5897a5c6-fa02-454c-9063-eb782784b562', 'Life Protection Puppy Chicken & Brown Rice Dry Dog Food', 'Blue Buffalo', 
        'Pets', '', 5.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('18e83478-1ec3-4c19-92ad-bba8409d9286', 'IncrediBITES Small Dogs Chicken Adult Dry Dog Food', 'Purina Beneful', 
        'Pets', '', 14.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('7f894b24-6240-4223-9c17-8c271c0b7e4e', 'IncrediBites Small Dogs Beef/Wild Rice Adult Wet Dog Food', 'Purina Beneful', 
        'Pets', '', 3.0, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('032b39d6-41f3-4d28-b0a9-f5a3dc772323', 'Complete Essentials Chicken & Rice Adult Wet Dog Food', 'Nature''s Promise', 
        'Pets', '', 13.2, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('d0f865ec-43e4-4ac9-b36e-d8ccc625052f', 'Natural Homestyle Beef Dinner with Vegetables Adult Wet Dog Food', 'Blue Buffalo', 
        'Pets', '', 12.5, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('9c33cc2c-b25b-4755-a6f0-54d15dec2c3c', 'Grain Free Chicken Turkey & Salmon Adult Wet Dog Food', 'Nature''s Promise', 
        'Pets', '', 13.2, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('e5502f00-9070-4d1a-a08f-bcb47cefb5c1', 'Natural Homestyle Turkey Meatloaf with Vegetables Wet Dog Food', 'Blue Buffalo', 
        'Pets', '', 12.5, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('b957217d-c931-4a6f-9542-334e4aadd942', 'Complete Chicken Turkey & Duck Adult Wet Dog Food', 'Nature''s Promise', 
        'Pets', '', 13.2, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('76afd239-bd4a-45d9-8e98-a66adc84ddc0', 'Natural Large Breed Chicken & Brown Rice Adult Dry Dog Food', 'Blue Buffalo', 
        'Pets', '', 24.0, 'LB BAG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('f1a0ee1f-79af-4f45-bde5-0bc6cf808334', 'Grain Free Chicken Beef Vegetable in Gravy Wet Dog Food', 'Nature''s Promise', 
        'Pets', '', 13.2, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('4f79dc77-067b-486a-9263-9d1e3da60f2e', 'Grain Free Turkey & Chicken Adult Wet Dog Food', 'Nature''s Promise', 
        'Pets', '', 13.2, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('3fee2b7f-4e88-4023-bdfa-6791ae1ee36b', 'Grain Free Turkey & Sweet Potato Stew Adult Wet Dog Food', 'Nature''s Promise', 
        'Pets', '', 13.2, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('0aae69f4-64d2-475f-b84e-b64774721bbb', 'Grain Free Chicken & Vegetable in Gravy Wet Dog Food', 'Nature''s Promise', 
        'Pets', '', 13.2, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('eeda86f7-b06f-4734-9e27-c80bd11c863f', 'Tender Cuts in Gravy Chicken & Brown Rice Adult Wet Dog Food', 'Purina ONE', 
        'Pets', '', 13.0, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('119bcea3-e985-4bfc-bdb2-d02f07d0dcdf', 'Grain Free Chicken & Fish Dinner Adult Wet Dog Food', 'Nature''s Promise', 
        'Pets', '', 13.2, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('09b6e762-962e-43c8-b08a-36d9dd1148c9', 'Grain Free Turkey & Potato Dinner Adult Wet Dog Food', 'Nature''s Promise', 
        'Pets', '', 13.2, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('733cfc43-40e6-4425-a19d-f0eaa88644cb', 'Classic Ground Chicken & Brown Rice Adult Wet Dog Food', 'Purina ONE', 
        'Pets', '', 13.0, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('5a73858e-047c-467c-88fc-6e071dc8fd25', 'Grain Free Chicken Dinner with Gravy Wet Dog Food', 'Nature''s Promise', 
        'Pets', '', 3.5, 'OZ PKG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('5a2dcfcd-b237-4bce-a910-53e54559e8ef', 'Classic Ground Beef & Brown Rice Adult Wet Dog Food', 'Purina ONE', 
        'Pets', '', 13.0, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('a802178f-2de7-4b5e-8fb1-09bf3088bd42', 'Chopped Blends Salmon Sweet Potato Rice Adult Wet Dog Food', 'Purina Beneful', 
        'Pets', '', 10.0, 'OZ TUB');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('f3564cab-33d2-4a1d-a629-f9961542e957', 'True Instinct Tender Cuts Beef & Salmon Adult Wet Dog Food', 'Purina ONE', 
        'Pets', '', 13.0, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('6a15f295-cdb5-48cd-95e8-5e7f255612f3', 'Chopped Blends Turkey Sweet Potato Rice Adult Wet Dog Food', 'Purina Beneful', 
        'Pets', '', 10.0, 'OZ TUB');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('b77afd51-a343-4564-8f37-ab4fc79ab04e', 'Filets in Gravy Prime Rib Flavor Adult Wet Dog Food', 'CESAR', 
        'Pets', '', 3.5, 'OZ PKG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('40a12f7d-c8cf-470b-a5c4-1b293e2d9e8b', 'Tender Cuts in Gravy Healthy Weight Lamb Adult Wet Dog Food', 'Purina ONE', 
        'Pets', '', 13.0, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('0458c3a1-5a75-46f5-8ce6-68e10f114c07', 'Chopped Ground Dinner Filet Mignon Adult Wet Dog Food', 'PEDIGREE', 
        'Pets', '', 13.2, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('51bdf451-3377-4b07-8840-02c40e466427', 'Choice Cuts in Gravy Country Stew Adult Wet Dog Food', 'PEDIGREE', 
        'Pets', '', 13.2, 'OZ CAN');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('7305bbba-6207-4e24-b617-31423c232b9d', 'Top That Boost Wet Dog Food Topper Duck Recipe in Gravy', 'I and Love and You', 
        'Pets', '', 3.0, 'OZ PKG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('56967b60-14d2-4fbc-9bc8-e1291e2591b9', 'Nutrish Natural Chicken Muttballs Wet Dog Food', 'Rachael Ray', 
        'Pets', '', 8.0, 'OZ TUB');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('017e9c2f-4394-405c-a328-166bb4935fb3', 'Balsam & Cedar', 'Yankee Candle', 
        'Home & Office', '', 14.25, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('2542ec36-c25c-48f3-b901-21ed8f5f758d', 'Balsam & Cedar', 'Yankee Candle', 
        'Home & Office', '', 10.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('84db3571-05ff-4aac-bf76-c367583e2092', 'Kitchen Spice', 'Yankee Candle', 
        'Home & Office', '', 14.25, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('dc857137-684b-4c7b-8c40-74acdea29121', 'Welcoming Apple Cinnamon 3 Wick Candle', 'Glade', 
        'Laundry, Paper & Cleaning', '', 6.8, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('4dc295f3-e61c-4da2-95e2-6e67edaa10ff', 'Lemon Lavender with Essential Oils', 'Yankee Candle', 
        'Home & Office', '', 10.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('54ec5884-d4bf-4b27-9eda-712e17120396', 'Midsummer''s Night with Essential Oils', 'Yankee Candle', 
        'Home & Office', '', 10.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('2922f4ee-8b42-4baf-a119-91c9f8838155', 'Pink Sand with Essential Oils', 'Yankee Candle', 
        'Home & Office', '', 10.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('f4693d66-9f71-44c8-804a-4647e1b895ec', 'Macintosh', 'Yankee Candle', 
        'Home & Office', '', 14.25, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('27fdba28-cbf6-4894-9212-031da15ad667', 'Sage & Citrus', 'Yankee Candle', 
        'Home & Office', '', 14.25, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('bff39b92-b636-4a9e-8bfc-c5a9bf753062', 'Apple Cinnamon Candle', 'Glade', 
        'Laundry, Paper & Cleaning', '', 4.08, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('4c0bf1ce-02c6-401a-87fe-b1fd4d96c2ab', 'Scented Apple Pumpkin', 'Village Candle', 
        'Home & Office', '', 1.0, 'EA');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('7d8ba39f-2a1c-46bd-a5ee-810ffc20f275', 'Scented Balsam Fir', 'Village Candle', 
        'Home & Office', '', 14.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('1983a281-d1ec-4a40-9753-76ff440fee94', 'Bayside Cedar', 'Yankee Candle', 
        'Home & Office', '', 14.25, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('90ed1b12-5a3e-4cc7-afba-7a792174f1b0', 'Harvest Pumpkin', 'Tuscany Candle', 
        'Home & Office', '', 18.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('2b377d30-f917-4309-8c27-acc41236e03b', 'Clean Linen Candle', 'Glade', 
        'Laundry, Paper & Cleaning', '', 4.08, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('439c2733-84a9-4283-a346-2cb8c4ad22f7', 'Maple Butter', 'Village Candle', 
        'Home & Office', '', 16.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('bf38cf49-e426-4f42-b466-51cb2f40e838', '2-in-1 Vanilla Passion Fruit + Hawaiian Breeze Candles - 2 ct', 'Glade', 
        'Laundry, Paper & Cleaning', '', 8.16, 'OZ PKG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('8ddf102d-bd21-4956-8503-9c476f520505', 'Cashmere Woods Candle', 'Glade', 
        'Laundry, Paper & Cleaning', '', 4.08, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('ab847a9a-206b-41af-aa8f-7dbb6a943612', 'Scented Warm Apple Pie', 'Village Candle', 
        'Home & Office', '', 26.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('fac1331b-b145-42da-8ddc-e2aefb991310', 'Spiced Pumpkin', 'Village Candle', 
        'Home & Office', '', 16.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('861f4546-a858-44ea-8b20-b888a0b54b5c', 'Scented Mulled Cider', 'Village Candle', 
        'Home & Office', '', 21.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('86dde04a-eeb1-4497-809f-07fcccab2bdf', 'Scented Spiced Pumpkin', 'Village Candle', 
        'Home & Office', '', 21.2, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('5a0b25a2-ed59-4ec1-aa17-f8bc45d759c3', 'Scented Balsam Fir', 'Village Candle', 
        'Home & Office', '', 26.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('f694b945-b92e-4214-80d7-9ae4b7a99047', 'Comforting Cashmere Woods 3 Wick Candle', 'Glade', 
        'Laundry, Paper & Cleaning', '', 6.8, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('579b3803-927b-4717-ad40-17c8b3e23467', 'Midsummer''s Night', 'Yankee Candle', 
        'Home & Office', '', 14.25, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('2cf429fd-7189-475f-a7fc-0a8c2a393a69', 'Sky & Sea Salt Single Wick Candle - 2 ct', 'Glade', 
        'Laundry, Paper & Cleaning', '', 8.16, 'OZ PKG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('a3691a19-eb2c-4a28-a010-34099eff7b85', 'Tranquil Lavender & Aloe Candle - 2 ct', 'Glade', 
        'Laundry, Paper & Cleaning', '', 8.16, 'OZ PKG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('78878459-2cbd-421d-9e56-06da1dfd364a', 'Scented Mulled Cider', 'Village Candle', 
        'Home & Office', '', 13.7, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('42658bca-5583-43ce-a462-a116b5de173b', 'Scented Apple Pumpkin', 'Village Candle', 
        'Laundry, Paper & Cleaning', '', 1.0, 'EA');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('e96d8889-c79b-4e87-8245-a553a59cce45', 'Gentlemen''s Collection Scented Bergamot & Amber', 'Village Candle', 
        'Home & Office', '', 14.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('f91e2b40-36d1-4c51-8321-bbd4ffcbcb29', 'Scented Apples & Evergreen', 'Village Candle', 
        'Home & Office', '', 19.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('738682ab-fc80-4afe-a80a-7340ff9dcfa3', 'Gentlemen''s Collection Spiced Tobac & Honey Scented', 'Village Candle', 
        'Home & Office', '', 14.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('ed7f79c4-2d1a-4da8-b128-9ff651628ae1', 'Mind & Body Dream + Inspire Raspberry Coconut Candle', 'Chesapeake Bay', 
        'Laundry, Paper & Cleaning', '', 8.8, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('b41ea99a-6c59-4a6e-a752-f47434b7394a', 'Mind & Body Balance + Harmony Water Lily Pear Candle', 'Chesapeake Bay', 
        'Home & Office', '', 8.8, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('32eb0899-5972-4e5b-8f8b-b9ca74e7295a', 'Mind & Body Relax + Restore Sage Peppermint Candle', 'Chesapeake Bay', 
        'Home & Office', '', 8.8, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('82d5ae5a-c9d8-4f63-83ae-e3594e7cb8b2', 'Fresh Collection Juniper & Teak 3 Wick Scented Candle - 2 ct', 'Glade', 
        'Laundry, Paper & Cleaning', '', 6.8, 'OZ PKG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('599d9351-f054-4e66-90a4-e1e0692a42c8', 'Signature Collection Vanilla Creme Brulee', 'Yankee Candle', 
        'Home & Office', '', 4.3, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('e5626f88-6ad7-40ff-a55f-0a606106b68f', '2-in-1 Sheer Vanilla Embrace & Apple Cinnamon Candle', 'Glade', 
        'Laundry, Paper & Cleaning', '', 4.08, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('4745287e-748f-40e9-9e7a-bb85ed40263e', 'Soy Blend Vanilla Cream', 'Tuscany Candle', 
        'Home & Office', '', 14.0, 'OZ JAR');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('3cdc7538-465c-4d4f-b86c-4f643207021d', 'Smooth Bourbon & Oak Candles - 2 ct', 'Glade', 
        'Laundry, Paper & Cleaning', '', 8.16, 'OZ PKG');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('3e2374bc-cb7c-457e-970f-3c7eaf041b6f', 'Bell Peppers', 'Green', 
        'Produce', 'https://hannaford.com/product/green-bell-peppers-1-ea/118615', 1.0, 'ea');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('1e7997b8-2300-4d8f-a069-5cf2f3cc0be7', 'Green Grapes', 'Seedless', 
        'Produce', 'https://hannaford.com/product/seedless-green-grapes-apx-2.25-lb/333413', 2.25, 'lb');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('3be34829-8430-4421-8827-4153700fea99', 'Potatoes', 'Sweet', 
        'Produce', 'https://hannaford.com/product/sweet-potatoes-1-ea/386983', 1.0, 'ea');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('67a804e1-92c0-4fa2-85bc-685f0c62f487', 'Red Grapes', 'Seedless', 
        'Produce', 'https://hannaford.com/product/seedless-red-grapes-apx-2.25-lb/333414', 2.25, 'lb');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('c76aba3f-c4c4-4c72-98c2-ee7618b7f7e4', 'Seedless Cucumber', 'Hot House', 
        'Produce', 'https://hannaford.com/product/hot-house-seedless-cucumber-1-ea/118598', 1.0, 'ea');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('208ddf6a-94ec-4959-8f71-6449af6f43d0', 'Lemons', 'Hannaford', 
        'Produce', 'https://hannaford.com/product/lemons-1-ea/118609', 1.0, 'ea');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('04678e8b-a188-4301-ab11-37669fb7f0fe', 'Nature''s Promise Greenhouse Grown Crunchy Green Leaf Lettuce', 'Fresh', 
        'Produce', 'https://hannaford.com/product/natures-promise-greenhouse-grown-crunchy-green-leaf-lettuce-4-oz-pkg/383375', 4.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('0ca4cb2d-7c19-475e-88b6-f2cc8309afd4', 'Sprouts', 'Brussels', 
        'Produce', 'https://hannaford.com/product/brussels-sprouts-apx-1-lb/118677', 1.0, 'lb');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('43827ca7-083a-4fa9-a3a0-437d4004ad7c', 'Onions', 'Red', 
        'Produce', 'https://hannaford.com/product/red-onions-1-ea/386976', 1.0, 'ea');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('0d5937f2-d17e-4a92-a21e-c6a2498450c1', 'Mandarins', 'Hannaford', 
        'Produce', 'https://hannaford.com/product/mandarins-3-lb-bag/199577', 3.0, 'lb');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('9d0cec18-70c6-4c32-96b4-ad832f1d1ba2', 'Taste of Inspirations Cold Pressed Apple Cider Fresh', 'Fresh', 
        'Produce', 'https://hannaford.com/product/taste-of-inspirations-cold-pressed-apple-cider-fresh-1-2-gallon/356074', 2.0, 'g');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('662c7132-0581-4988-bb6f-35849fa3eac3', 'Berry Medley', 'Small', 
        'Produce', 'https://hannaford.com/product/small-berry-medley-apx-3-4-lb/371320', 4.0, 'lb');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('94abe264-ad83-404c-bc4b-4207aaa9e74d', 'Chef Salad', 'Hannaford', 
        'Deli & Prepared Food', 'https://hannaford.com/product/hannaford-chef-salad-7-oz-pkg/381025', 7.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('78e7bf35-7242-4509-9bd5-ea7123abf296', 'Sweetest Batch Blueberries', 'Driscoll''s', 
        'Produce', 'https://hannaford.com/product/driscolls-sweetest-batch-blueberries-11-oz-pkg/270787', 11.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('a7dbd5cb-1a60-4c89-89b1-f279db27f889', 'Nature''s Promise Greenhouse Grown Sweet Baby Butter Lettuce', 'Fresh', 
        'Produce', 'https://hannaford.com/product/natures-promise-greenhouse-grown-sweet-baby-butter-lettuce-4-oz-pkg/383381', 4.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('ec6e5526-0071-41f7-9ed0-f2e2409f2e0e', 'Sugar Snap Peas Microwaveable Bag', 'Hannaford', 
        'Produce', 'https://hannaford.com/product/hannaford-sugar-snap-peas-microwaveable-bag-8-oz-bag/351626', 8.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('9ed5b76a-9188-4a46-9718-626c1e816d91', 'Chicken Caesar Salad', 'Hannaford', 
        'Deli & Prepared Food', 'https://hannaford.com/product/hannaford-chicken-caesar-salad-5-oz-pkg/380152', 5.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('212bdb89-137f-461c-8281-f160e1120ff0', 'Nature''s Promise Greenhouse Grown Spring Mix Lettuce', 'Fresh', 
        'Produce', 'https://hannaford.com/product/natures-promise-greenhouse-grown-spring-mix-lettuce-4-oz-pkg/383379', 4.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('fb6f96fa-3cf6-435d-b485-04a96cb219ed', 'Nature''s Promise Greenhouse Grown Red & Green Leaf Lettuce', 'Fresh', 
        'Produce', 'https://hannaford.com/product/natures-promise-greenhouse-grown-red-green-leaf-lettuce-4-oz-pkg/383377', 4.0, 'oz');
INSERT INTO Item (id, name, brand, category, product_url, size, unit)
VALUES ('4ab759b0-5f3d-4455-a46d-25ac5ca4746b', 'Whole Mushrooms', 'Hannaford', 
        'Produce', 'https://hannaford.com/product/hannaford-whole-mushrooms-12-oz-pkg/363961', 12.0, 'oz');

-- Item Prices
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('1fd36808-de5e-42c7-bdd9-bbf310dd77d6', '3dc3f440-bc82-43fa-9447-a5a220277397', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('58d84cba-f672-494d-85a1-0e380e96ea1d', 'c397076c-d504-4c78-a1df-505aaac15af8', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.59);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('4daaf814-78c2-4442-8e0a-0c5cd8735eaf', '55c5480e-7acd-45da-9f7d-32189300e66d', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 5.29);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('688bdd11-c3e7-4a74-ad3e-edcd13046caf', '9502e916-4bbe-41c9-b521-cb3ba75583c6', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.09);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('a5847c3c-76e8-4648-9609-f9b1caa7f550', '407aa82a-0541-42c1-a7c8-3fa7fbcd0167', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 8.45);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('d1654b56-f441-4b5e-8cb9-4be30c934a27', '0211cbeb-e511-48b5-9e0e-8442e13f3c4e', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.09);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('13068a09-6a31-4a81-9c87-fdd21afb2fce', 'acc338ba-4cc1-4410-aa08-f954841bbbf4', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 8.15);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('3c97c33a-ef15-495e-a4ae-094003fb4ba4', '4a8aed54-033d-4520-b263-39b78ec98a88', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.09);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('dd088c6d-acfc-4407-adaf-c75229fced1e', '9fa862ed-d435-43d2-9953-c0b2c6df2cf2', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.55);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('05232758-f302-441a-a9b0-5ad08ea9223b', '20666f06-2bb7-4f87-8e16-15f556ebf97d', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.09);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('2b414bec-cbd6-4d85-af55-dd288fba1651', 'c5cbc567-11a0-47ca-bbbe-c6cde9bdddc0', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.19);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('fca5b7a9-395a-4c55-b900-89a9e619d443', 'b378e4aa-1e3d-4c9c-a008-d0a1df87346a', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.29);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('24144a53-cce7-4cea-bf6c-d35349c18ace', '115081fb-35ed-433f-8f93-a1e2e270174c', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.55);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('53bd26ec-24ca-46ce-9275-a5a7b8a86dfe', 'ccd7e80d-5511-435a-9497-7da4d7c08e41', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.15);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('b70c99e4-4344-4c93-a19a-40235c8882ce', 'd54dc4ef-289d-4e64-8858-b8692df2f5f3', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('e16be90c-eaa8-4a6f-97f1-fc958ceeafc4', 'f2f2c703-d8b7-44b0-92a5-6911182ad11d', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 5.05);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('6433a1fd-3291-4460-adeb-9ff6211eddaf', '5b60f777-a2ef-4bf5-a9b7-5e6a7e0d40b4', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.65);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('1d3d3eb5-cdc4-480d-a88c-6a24cbde8446', '360df962-0cc6-4885-a204-6115cf85b725', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.75);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('530d0ae3-8c01-4f07-af8d-193eb22eca4d', 'ebbafa30-90ff-42ee-8fff-8af09e84d86c', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.85);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('351289e1-49db-4eb2-8549-099583ee3351', '737b311d-d30a-4d6e-960b-aaac37719340', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.65);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('60058ae8-4417-4c45-bb83-3e359aac0909', '0c474083-9f16-46be-accd-6a710a1a958f', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.75);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('79610581-6cca-4305-8f90-56ed1feb828d', 'e4b93beb-d0ee-4b4b-b746-843f6936fe95', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.65);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('9dfa1d68-25b4-4371-99d4-75c89f503fa7', '8d30ef9b-37dc-4102-aced-c46fafcc5ea9', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.09);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('5df981cb-8df1-4c4e-a35c-0295acb3f95f', 'ff46b1aa-da1d-4a94-9655-ae9ac93dcfd8', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 7.15);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('baac7166-2585-4e83-aa19-4861218eaf4c', '524eae0e-c607-4f82-902c-1c50990cbf69', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.85);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('69e419c1-0f87-4e62-bada-9225c23bd778', '1f40dd44-902e-4551-ace9-bf273f6f0cd2', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 8.25);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('97ccb45c-2cbb-4da6-8e26-d517f3384ad2', '212d434a-c607-46c7-9bd1-d082a664e65c', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 16.79);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('3d8e181e-24a3-4b33-b60a-8f898a38cfe2', 'ef8daa8d-bc10-455c-ba71-03ce01b4befc', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 6.95);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('36eb619a-963f-405c-8253-13fb3d92944f', '0165b519-e73e-471c-8f62-1f57fd992b91', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.85);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('f69e7d00-40b9-4370-a8c9-b3c123c6777d', 'a59659e9-5274-4c1a-84ea-ac37b86cf341', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.85);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('356299c6-395f-42ce-af32-abe422d0dae7', '5ce6d9ad-ac7d-4c19-8be0-96dd2d93d4d7', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.29);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('db2c10da-a1c7-459b-9468-496a7a0d13ae', '3c5b56da-96da-443f-9a8e-08c4f6659957', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.29);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('459d91bd-9de5-4720-a85c-976df95e7d1c', '9f862ce7-f1fb-4038-b16b-7a34be70d874', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.39);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('68de9ded-1954-4ef6-bb7b-691908ac9578', 'fb3faee7-3e23-491a-b64b-733676be86bd', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.75);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('3311a5e9-bbef-4269-8628-2535a6582395', '37bca2c5-2238-4137-8dd8-6f9dec8ac3f1', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.85);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('3afa4824-967d-4adc-870e-ff3e3294fa2a', '675fee50-7f7a-4f83-abbd-a312fbbcc944', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.85);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('5acd0ee4-80eb-4447-ba23-1c1e86a156cb', '28833ebf-45ac-4e10-9bc4-e8b6c32ddc2a', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.85);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('01930382-611a-40d6-99e8-cd02dec503cd', '8eed47b5-2e71-4a50-ad7d-52ebf7b935d9', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.55);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('ae60b312-4422-45b4-a5c3-8a5cfa312004', '0c95dfe8-3206-4c08-b09d-0d19ba8c7b5b', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.19);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('e05e907b-1930-4c2d-814e-1398592603c4', 'a2eb384e-2b1f-415a-80d6-1ed5b0534ec3', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.25);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('5f6b7ae0-7a9b-463a-a573-6c768a0ea588', 'ffdc4cb1-91cf-4942-8dfe-b93f2adc04c6', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.39);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('3633ef68-33f4-45c9-8816-a1d27b4b97bb', '892a42c0-c319-4f7a-821c-4be20a918235', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.29);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('647b0dce-660f-494e-aba3-bec433c8512d', 'c669a815-750a-4d38-b6ba-a233b6373629', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.49);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('120a26c4-3855-4562-9d28-0f17d269b2e6', 'f58a1d73-6590-434e-acd3-c6e693f9530f', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 5.29);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('dc4b54e2-0ef7-48cc-89bb-95949ed36155', '341c9802-d8a5-4cca-8ec1-3c6f9ae1404b', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.79);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('3e6636b8-4f3c-44bf-9012-968f3afd0fd2', '5ff8bd9d-2ea1-40ad-b8a3-3cd49f2c9f33', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.55);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('38153ac1-f62f-4ebe-89f5-5b5bd2c95fe5', '2dfee28a-345d-4464-befb-7068ed442845', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.89);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('757cc056-7285-408f-ac14-59c9b7a7fdee', '62087d45-3e62-4f17-81e1-94dc53f7f58c', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.05);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('3443fe5c-23aa-4640-8ef2-aeb7a824d4fc', 'afa69eee-6c4f-4806-8d86-2f6d9b5da999', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 5.39);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('c802789a-ad89-495a-9952-4c8b692164c1', 'e7fd9e0d-d354-463c-bb50-e8caae9c71ca', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.29);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('05ccd3b5-3e54-4d76-834a-4ebdb3d107e1', '7d03acc5-959f-4b0c-9f85-a9e36627e46e', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 5.89);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('7afaca46-cf33-4ea0-af87-418b4077a228', '04295c98-c992-4e48-b30c-447ac96fa5a4', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.09);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('bc6cc18d-19e3-49d9-b36d-607027bde143', '5dddb408-a1f6-4485-b041-785d535c63b4', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.09);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('0b9374c6-a731-4a1e-83a9-1ce179581dc3', '5ba8896a-7e32-448c-9a55-e880156cfd96', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.09);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('1815732d-685c-4e65-aed4-6e4d4d7940bb', '755d5853-9278-4e85-9f80-b611155c0763', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 7.49);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('150afda9-a157-4b02-bd10-10fb4d53a7ca', '37f8d804-6dd7-4fed-ad44-627f3b5ee697', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 8.79);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('bd0e8dc3-e519-4db9-a2a3-49ba3a4521a6', '5ae19222-eeaa-4b54-8183-704e4a443c7d', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.19);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('631696d7-0ee5-4bfb-92b7-d77203ed65f0', '5e95a163-55f8-43ef-8c3d-a5eee29bf1f7', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.39);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('78a8bf04-3571-44de-88ab-c44bcdade4a8', 'bee9bf80-920c-4307-b64e-1dfa63bb640f', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.39);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('53209869-f982-412b-bbf3-85bb4bff90ad', 'ecf33dd9-4630-4bd5-90ff-4f6924a6760d', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 5.45);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('db72c63b-758e-4c72-93fc-1026a95cafa1', '3e33473b-1153-445f-851b-3af01397ac03', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.05);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('564b3c0c-e145-47c2-94b0-eda4ebc14f08', '07bfca91-df4b-43b1-8570-8fe900f868a0', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.55);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('35d9b9af-05bc-462e-b7a1-87e1b368020a', 'e50c645d-1564-4025-a16f-17ce0e83a91e', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.15);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('c7e5be80-2c60-4208-b785-79d769ea65d5', '8e5d0831-d66b-4e23-b965-86cdb2dfa4e3', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.05);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('ef9f479c-8e44-4dd2-abf2-797e420242e6', 'b3ae25a3-281c-4f65-9df4-a091897ab707', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.05);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('74770e74-f3dd-4b16-9f41-0b550a6dc26d', '6963305c-fb8e-49f9-b8e4-66b205c6a07a', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('c9d7b0fe-434c-495b-96d5-bd02fea35261', 'c941c2f1-9c2b-4219-a0e9-05a9311c215f', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.55);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('606000fc-b885-4a31-b881-ea84a616acdf', 'd4371086-2827-4b1d-9717-38b02c66a277', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.39);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('f5cabcae-ea82-4159-ada8-d6c3b06f5940', '375fca09-cfdc-42ab-a40c-313ae497b21b', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.55);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('beeac5c7-dbd1-401c-9b6d-2a7473827e59', '627ebcad-b75b-4c6d-af26-a895cafbf72e', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.65);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('19215fdd-a045-41b8-ac43-efe599735bce', '19d80af4-ac49-4ba3-b552-4fc26a3ddd1e', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.85);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('4967dadb-2236-4b8c-98a0-23d16e59d94e', '531e3542-10ae-4058-afec-bddbede948e7', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.75);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('9071f583-cd72-4753-8be1-391c4330dd5e', '191eba71-0f66-4850-8e45-2580180d9825', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 5.49);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('0ea6f64a-bc28-4279-a459-2ba168ed5618', '96e1aafb-1b30-4501-b59a-bccb6c84b95d', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 6.29);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('9d864031-fb76-4e68-b124-fe70c07a1b73', '5258f652-bebc-40f5-a3cd-54bc4cf3d2b0', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.75);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('b068a902-85bd-472f-8fad-b02c81a109be', '30a2760c-c822-40f7-80ec-d6983f2e2576', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('270183ad-ccdc-4c84-9991-4024a3f9cfc1', 'b55fd09f-beb5-41d4-8898-fe833a70f032', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 8.25);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('bb624971-8da8-40db-a5ed-642c3fe236d3', '44154572-2bb3-4700-9603-7b7145115abf', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 5.49);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('17b3ae3a-c554-45a8-b012-5fac9a32d7f4', '78552278-d4be-4fd2-b2bf-dbd0737de8a5', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.95);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('3537fe3b-216b-45c4-9665-d97d420cfc32', 'c17f2321-525f-4b9e-90d0-ef736faef719', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.85);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('e89a15d6-574b-4aca-8dee-bcdad83d80a7', '32703546-686b-4654-9165-761583407c81', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 6.05);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('3b46b013-bb68-40b6-b660-4b09b4f7bd26', 'ca0fa904-5e3b-4f0d-829c-0c9a081e946c', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.89);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('2382976f-22a2-41cd-a433-0491c88f7962', 'b51fbfc1-3801-468e-bad1-8c7160e39a45', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.35);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('6497a15c-a173-496d-9cfb-4975e3a9a729', '82194d95-bb91-4d96-ad3e-73b40041b670', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.75);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('ad24f283-67c1-4c76-87bf-7d8dfe80fdaf', '6fa23113-fd5b-4e17-bb21-9bc097bc5a86', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.75);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('793a9bff-9694-4422-a90c-115f1980fad9', '5b6e3814-9e9a-4f16-a633-2327456b19e2', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('a603fd24-7bfc-4aac-8f54-512ee2a855ba', '0c900102-1c76-4528-9468-2fad31ce578d', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('7b95f5ce-c48e-4006-b9b1-f92b1b1f9140', '3614aaea-d34c-43ab-9626-fc1cb8852d12', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.75);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('3f60bc5f-34d2-4e61-83cc-9e10c2e9b0d9', '3b48665c-cc61-416a-b5f1-806d08c86a0c', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('f574acc1-60e0-4e80-8942-14ca36eb5874', '0220cb50-b6b0-4f56-8b73-ac5dbf70b5ab', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.55);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('861d12ec-e548-4dcf-9704-aaf6b63751c4', '095a196b-b114-45c5-af6c-73cb7ba8202d', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.59);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('2e03008d-d955-4311-932b-8e89cf35a0ef', 'ce93c23c-78ba-4266-943a-b830ae8f7afa', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.09);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('8fc54c03-1dfd-408f-ae4d-945a5a4a3f46', '2f26a62f-3bef-4950-9c1d-b74f08ab5f3d', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.19);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('b18366d9-5994-498d-a53d-87bf0a7a5b6b', '2517c5bc-4afc-412c-87c1-2637cd91295a', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.65);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('b9db1419-f3ca-402d-a679-61438ef947e2', 'db239f1b-efda-4ec6-9dbd-f444293a3483', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.75);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('e10c4c4a-89ea-4ed2-9756-a7f78864dead', 'd1515f47-0a4e-4a96-a6d5-bf27fccbffe9', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 6.25);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('ecbf3caf-9821-4dc2-be7b-00f2ece46ea1', 'f569faf3-969f-4883-87e4-8ed3c7cb1bff', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 6.29);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('a569bd94-49d5-4923-96ae-0e8e96b3a781', 'fd626217-f484-4a76-8ed5-b8a184d5cce2', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 6.29);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('b2a9fcd7-9f33-499c-a32f-3b7fabc3df78', '95bebf41-978b-45f4-933f-41f22abd9dcc', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 6.29);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('94978f5b-9187-41ff-9bd3-ed4108889c48', '8429ff5c-e365-4807-aa7b-2451ecc29376', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 6.29);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('ba5b8245-1585-456b-b8f1-b9c32977a463', '8454918b-7d4e-4ae1-8423-8a20f47e3f4d', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 6.29);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('a4b373a3-b8be-426a-9eef-298c15850daa', '30fbae08-2d76-49e6-8855-53feed88da9e', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.09);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('7d4ce8b1-81b7-4aa8-9a86-6bd1eca44e49', '76e6c16d-751b-44fc-b9b3-8e814db77df4', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.15);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('47105c9e-bf31-46da-898f-d7fa29718752', '6baa9176-c882-41fa-af7d-bc161dd71e02', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.55);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('df445703-3dbd-4dd2-a325-d53fd2be5ceb', '5c28e8ba-1a02-4ee7-9db9-e4d07fa057d2', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('4d23e2fb-5908-4766-9296-1d4d018ae685', 'a9f101d7-8016-478e-8bfc-1376d4a756cc', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.79);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('0af1c3f0-2bce-4521-82e0-a2f20b42f4f4', '513352b2-9fbc-431e-bdd1-b0eee2a9feb6', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 6.45);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('ecc07d13-cf13-4db0-8c5d-eb6945986c11', 'f857511e-68ee-440b-a5ce-29968ab1fae4', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.19);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('88e6d4c0-6cd7-459c-89be-f3197a41dce0', 'b61e71d2-f4f7-4f84-b7ce-9452b2809fdd', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('9c306b9e-9e67-4830-b12a-409007704d3a', '647bace7-42cb-4d8d-b18c-acc0bfba71ea', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.09);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('70112e96-7c4f-4f9f-86f6-0a25d619e0e3', 'f2c2c9c6-b1d7-403a-937b-2282856d0493', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('8e557ba0-e0de-485e-bf83-a192088a582c', 'f5c10396-bcf1-416a-8a5d-8070cdaaba18', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 5.19);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('822a70ff-7dae-4883-8f02-75218d74afdf', '54579222-e76d-48db-a1f1-2b28b5552b1f', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.09);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('75fdd7a9-40c7-4aaf-924c-f141e61bae20', '39923d8d-5dfc-488e-859c-dc7f8cc0b086', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.09);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('8414ab8e-5682-46f5-815c-bdc6c98d8438', 'b473b2b1-3407-4fca-befb-fb67003398a5', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 5.29);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('47ed570f-208f-40a0-8923-add4154cd6fb', '5847c0da-f27c-4523-88a7-007e1517694b', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('6c964617-2b00-4d38-b1bf-5391d65545f8', 'a68c46a9-94c1-4cbe-a94f-5088795fdf0e', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.09);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('0db025ae-55ae-461e-809a-0e19cfd9f879', '128a00bc-efdf-4929-9a29-22c14e9f4891', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.59);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('1e921bc5-550f-4181-a0bb-f4df51814ab4', 'af56a398-40d4-4c42-8cd4-755d2993e8b1', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.19);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('369308a3-6365-4ce1-91c1-bdc6fd0db7b7', '972daf33-97b1-48d9-9a83-23716564e8af', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.19);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('34fdd186-3708-4977-b6e7-7ee8e2020796', '04051020-aabc-44c0-9bb5-4a3ab07b42f5', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('4ae0e347-7560-4a52-87ae-95aeb6a4f1a6', '22d7f48f-c344-4ad3-97fa-2b85d1a4ef38', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('e13dc2dc-6b8d-47a7-bf36-4ed33f6d4464', '9a29d6c3-7968-4faf-b240-8a2f4a219c63', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 8.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('2ef13dea-eb2e-42a5-88bb-dd7f6a823963', 'a831fa93-aa61-4b74-b790-f4bcf9d24716', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('aee80a0c-d45d-4043-83a8-adc905a8f208', '7fde71f3-635b-40f5-99ce-251b51512f3d', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.07);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('646ba595-1e79-45fe-84cd-1ada0519168c', '208d5037-3ea4-49e9-8723-90f639a1353e', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.59);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('d0045f0f-307c-486c-bc17-96c950890c8a', '18668659-de01-496f-8ac6-fbe83ee4c54d', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.85);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('5347506c-988c-4dec-9186-a9c901e30147', 'bd020128-ad2a-433f-a55f-4c0079657334', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.69);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('2f2f5411-cac5-460e-af0f-b9365644aa19', 'cbd0616c-fd79-49f4-9d38-d06d970eb333', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.86);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('aeb996cd-79a5-461a-a9f0-ef7d21450a3d', 'bbb9ef48-ab1a-4c50-9a14-2d388f212cc0', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.95);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('b9f9cf70-c73e-477c-945c-5c4568090689', '3988a5f0-8f41-4448-823b-358f60f7a879', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.94);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('2357948a-6d86-42c4-8a01-3252eaf50c0a', 'c7ac9135-6bf6-4bc2-968d-49e02390075e', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.98);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('c4fda1ad-449d-4f21-b5ad-e9ed0dba3936', '4fe45097-9cd4-4a2a-afe2-c54a4c2c7b23', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.9);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('71e3930e-8c84-4e02-a8ed-e7b6e7c77cc0', '2b14842a-6a88-4c28-a68e-270882115450', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.13);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('603dca28-a1bc-488d-9529-4344f1e820a0', '4b4ada6a-ddd2-4e0b-b857-e855748c1efd', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 7.45);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('ec8599f2-f59d-4722-a78b-f6e2ac75cc00', '75bb99ac-de08-44ec-b920-70be643a0714', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 7.45);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('27104317-4e64-4901-9048-18327a5454a3', '983f85d5-01eb-437d-b72b-843beae4a8f5', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('5ee1b4a1-11be-4d75-a11b-64ca1e6175da', '71fec5bb-e85c-436f-942a-9c26e8693305', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 5.89);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('cb4cdac9-d5e8-4470-a456-f94e0a86b88b', '0d9c2650-39a8-447c-bf4d-3aaab0e3811f', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 7.45);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('5a600674-8b50-4733-82ba-afa5e36c5e22', 'c14738f0-794b-4144-825b-b76355968ad3', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('9aea7ea1-cf5e-44d9-9a3b-a4e4f1b642af', 'af53f363-099c-4956-8c2e-7206d7f97232', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('850a983b-5031-4109-b7e6-8350d1defb9a', 'b6505036-b941-4e94-8e35-12c6c49dd29f', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('be8403c1-add6-45ad-ac41-5c43641d2dfc', '5f49afdf-3cb0-4d96-bd7d-6d15f82fa260', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 7.45);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('23bedc31-511a-4b52-9572-5883150a7ecd', '9c579f30-4417-4eb5-8f4d-19989f593800', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('6ebd7cc2-ac01-4f8a-9fd7-666f43302a25', '8419e25b-1282-4712-b80b-001e3e2a7935', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('61ed4a4e-9d37-4840-bdc2-e233b6446dc6', '5bb7ef4e-bef2-4d76-9c1e-e20561814c1a', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('7db40531-d93b-4d09-86e2-0a68d6f9c330', '5dca55a8-a124-4b25-9574-c4d4134552a6', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.52);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('156c1adc-bb66-416b-8dea-7965de780fdc', '38d9dfe3-95fd-4ac5-bd7c-443e01d1830b', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.42);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('2d6397a8-1fa3-43b4-815e-37ba768cb165', 'acc5b10f-4369-4aea-b975-ce7cfccdd14c', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 7.45);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('3c5d505c-de01-46ce-aaeb-48ce61eccc5b', '14ea8774-a234-4b68-a266-51cbed8fd70d', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.64);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('9e48de19-c2db-4217-a572-68de6b812fd8', 'bdffdeab-2dfc-4851-bcf7-9029b7e66236', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.81);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('5f050b2d-5c02-4a12-9cc8-b5da1532341b', 'fbf8ef1f-fcf0-474f-8a86-afeedab24d2b', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.2);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('8db9f710-8217-4a8a-a6f2-d636e0af3f3a', 'c9c57699-4225-4f19-be07-10a01322e1e5', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.45);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('3381f4da-64c8-4fd6-87f8-178abf2aab81', 'edefa4a3-9956-4a3a-992b-5301b4b29420', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.49);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('edc91407-7ff2-442b-93ea-0d5a2d744c29', '088cdfb8-fd00-4eb8-8656-9261347eec83', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('00f4acfc-6c02-4815-a662-82ddebf27596', '0c8a1edc-23b6-4cd2-9308-627661ef9f4e', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 7.45);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('818a73b6-495b-4b22-85c0-86b754d1aa43', 'b836c75b-56c3-4203-90a7-5f389b2092fa', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.14);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('e7ba1f58-e161-48d6-afc0-214b53e32cbd', 'f2b161e0-ba75-4955-9a8a-c45134fdcdfa', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.69);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('d992b38d-f7e9-46cf-bae2-b5f67f09f3de', '004202a8-7dea-4bd6-85da-380cd0050406', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.69);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('c43e8698-40aa-45e9-b884-1c38d89bd079', 'a52ab18d-db3d-495f-8374-f64688149016', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.24);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('13ba1e08-32a4-4661-8b33-e66e23c4033b', '2666daff-6529-4de7-9e4c-b59dc534c0eb', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 5.29);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('7fb51580-7c89-4e09-8185-23df526185c4', '2c90cc13-4910-4d68-b794-bd69821d4cb0', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('262c92c4-10ec-40eb-bacb-2e9566a3b0fc', '5cc6ea2b-681a-4a06-9d49-dc3b27afe777', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.49);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('bd897249-728e-438f-811f-3c98b338d020', 'd8bac475-6605-4b81-9c9e-289d4f63e81b', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.79);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('90091a2e-f2b0-4598-b8e0-2a1468824b36', '44d2f8ad-ed51-4a21-8bd5-1155eff26c55', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('038b9f45-faad-4d87-a999-987a8a28e222', '5340784f-6be1-42d3-abcb-2d0adb33c3b0', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('66e0fab6-594d-4168-86a3-3fad3dbc581a', '2562cdbd-00b7-421e-9411-47bd82bdbbe4', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.69);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('60040467-8b70-4385-a203-fac5fbc9a2ae', 'ec73330b-53c8-4f6c-8d8e-d815f2e8d327', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('2cc2c705-5725-43ad-85ba-2cf7fb627ba0', '79a3b8c6-9d67-4002-b755-f01f106654df', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 6.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('8ff8d928-ddff-4def-b0a7-8180cd0649f5', 'f672f604-5c1b-4509-ab4e-c845cf227276', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('8e22e2af-8106-4755-b1b3-d7fd2f0ddfe2', 'd7c0ba13-00c7-438c-9d07-c93af28a3ea8', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('7459b797-b1fe-4d92-8b0c-8b8f141f0c03', '9cb6c2dd-c5c0-4760-b5be-444ca676d3ee', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('793c3a2b-33dd-46ca-a7de-f3e8ad33f133', 'c1f2b9d0-368e-4884-8291-16cb27ca5036', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 5.29);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('499a633b-429b-4535-85e3-86855b9a7d6d', 'c9296990-185b-48d7-b345-c1ef129b140b', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('134eb95f-748e-403b-b38a-9c21e1ef4cfd', 'fa228764-6bd1-4a48-8a72-afc5cd615688', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.39);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('5faae21b-749e-42fd-af0b-da693b05e1d5', '1daa2063-9675-4b7a-8793-67fd4e87bd29', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('020fc1ad-3d30-47aa-9283-c7010aca42d6', '58219166-e72f-445f-ac0d-d1b4dbf125c9', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 6.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('b2fdfa39-ea3e-4b23-922a-d89a4e24e935', 'a36c5ab0-f406-4096-b470-024d72b8e878', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('82461da4-f512-4023-bc87-22f42c8e2a44', '57641b97-9c2c-4460-9c9f-11ec9b2bbbe0', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.79);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('c7e67206-1b91-4dbe-a845-bb83e566ddad', '9cd66007-d842-4216-a0df-7d50f612e90a', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('75ec27cd-3c3a-4d7b-9e8d-fa834835d4d2', 'db24dc3e-af9e-408e-8129-8f214e98de42', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('613f0dc0-626c-42e2-9dbe-918d0a5890cd', 'bd779803-1918-441a-8fb3-a14b93486cbf', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 7.79);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('df8bdfb0-b5d5-4287-a571-42b1a61ff231', '1fbf613a-1241-4251-9062-b02f2234551d', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('bc4df9fc-8dfb-4cbb-8dda-f821a349a5dc', 'dde287ae-4044-429d-bb3b-469cfcb90b5a', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('03bb7a75-e662-43d3-aff4-8d89501ba4b9', '7d92f34a-994f-4b3f-a300-10cb2d76dea5', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 6.39);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('ce8d765b-ecb3-4507-a27f-2c5ec83802c6', '2feb7b66-fabc-4eb5-a362-72455e29dd8d', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 7.79);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('21b0342b-7e33-43d0-9926-78436fc45630', '2774f7cd-bc47-4280-b859-66f168905de9', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('47c33d74-05fe-4d3b-be42-809aee8e7d9b', '82cfdf1d-138d-42c4-bf0c-68cfc70da99a', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.39);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('812031f1-e41f-45ce-81d2-5d8cce9a2473', '364ad617-8382-447b-9bf8-6e67c1b3cc37', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 6.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('63a2cb90-883e-4e20-94a7-09c14528721d', '08309d92-663c-4eb2-bdb1-26b574a8c099', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 5.29);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('c7fa629f-f60e-440c-9a30-3324a4bb0dca', 'f204f4c8-ff85-4cb2-918c-681c81cd9fe7', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 6.39);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('ffee4a30-5734-459a-ad4c-7a2d7f974433', 'd58ddd94-8b01-4e22-a0ea-c045a8af5271', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 7.79);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('062de15f-d2fa-4d09-848d-f78fbc238e82', '6ec22fd2-4d09-4bcd-894b-274f7d4e92ea', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 7.79);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('bfed8b8d-72b2-452b-ac9d-70e70611d075', '0062086f-bd49-4de9-9d9a-145fabd89c20', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.59);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('c8c12b53-c900-419c-a8cb-24e50a5ad4f5', '84671b6f-8959-4823-9d87-e4ed1ba6346a', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('6e611e9c-8987-4bba-afb7-f4c7f4a58232', 'ef763312-8d5b-41d2-9fae-aaaf982a7b6f', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 5.29);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('36ea4a7b-7218-46d9-ba79-55a5f832dd21', '3c3428c6-c4e0-4531-b2e6-42959fab1d50', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 6.39);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('e70d0950-b274-41f5-b714-3becdc09682d', '6c3e599c-fb3c-4a91-9565-9bf582e618dd', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 6.39);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('3fafd5d5-dd2f-4630-b648-b75c0745cc98', '1a056e4f-22dc-4871-9fb4-fd3b0697cc40', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 5.89);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('47c664a6-d9b7-4059-9789-1b0c6930837d', '07fb5fac-0250-4f28-b349-a74c7c0b1d2f', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.19);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('5a4dba7c-fe11-43a5-be70-b2f78560495e', '67569645-916d-46a6-8a86-e30595620b2d', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.21);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('0fead97b-a168-41cd-a7f5-7d4aaa47e8dd', '505762a3-fe87-4ebe-a9b1-cdc31a678901', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.21);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('19e9c807-afa0-453e-9559-b72782f1ced1', '45aa35f1-159e-4c65-9d19-675aa9240326', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.47);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('27b8b128-f14d-425f-9c03-1ef4e5477a4c', '073b3551-faea-4542-9fad-79fb591a1f0e', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.69);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('9f0619cc-485a-4604-8128-453dd6035450', 'c6549f1f-c4c0-4d3a-a31c-81f230facc78', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.49);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('a46c1d39-58c8-4100-901a-ee134befb596', '49d8087a-4901-404d-8a0a-178ef0787e29', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('c4ab70d0-879e-46f8-a611-35505a32f5cd', '1119775b-0eb3-4a0d-8835-3579361a608a', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.49);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('46ac33ee-d4a5-4530-ad0a-45788c9f2cb5', '35cb4c4b-d8cd-4e22-8990-08c1fa032f56', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.59);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('c5370a06-4f43-48ac-8c37-97085d01f5e1', 'c7f2dc3d-f814-4047-9d2b-ce62fb37651e', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.49);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('30b68a67-672f-4e81-a384-bc8fc7700269', '179993d0-f48d-41d8-b16b-677459718059', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.49);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('56c68f05-cde1-4190-b1f6-2dc7ebab6215', 'c55ee3da-423e-4193-8e8b-ddffebb1777f', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.79);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('34d5a3b2-b3ab-42ab-a62a-51985c095067', '055afe22-3e93-4b87-bba8-05c0d0d8b4c5', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.95);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('e21c2816-e566-49fc-a791-b057885f48a5', '29bcb2c1-66ff-4e09-ad84-d00a53c473da', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 5.75);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('8111d874-a49d-491f-bf56-e5c9645ffd12', '0510dc6a-4b9e-48ff-be55-6ef01ab41788', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.59);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('d54345bc-38d1-4bcb-ae15-477777a0cd92', 'e0ac4560-8b3c-419a-968b-fae13ca3c5a4', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.89);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('a3ad8c80-b377-4bb7-9b29-d221d18d48b8', '3822db89-8697-4b6e-b245-a1b4bdcfe18f', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 5.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('2b0d1415-2834-4e7c-8044-e91f9dadf88b', '35984c39-9e71-466c-bc12-d2f324188eca', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.65);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('ffa9b8e7-683b-4ee7-b69e-87951586276f', 'e64e3501-9e11-48af-972e-2d0e5750ebee', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.79);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('1e4fae28-aeaa-4f46-8236-691b9d3e9d61', '3a523cc0-d518-41e4-afd3-76a4e3d50d9f', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.0);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('3ca73129-76f8-4429-9f01-1c54f4f4c610', '7a61b8b8-6d4f-45e8-9d87-2543d90d4276', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 5.49);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('354e4d2b-ae0d-4b9f-a27d-3e23dd205c16', '1e02a684-f541-4a9f-bb36-2ac6224ccde6', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.89);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('64282c5d-ffc0-4fec-8115-31b57745a127', 'f2fc8ef5-04f2-4541-a435-2019b251bed0', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.79);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('96fbdc0c-b0c2-4e98-b998-9dc673cb1914', '175e24c4-2e6b-4a97-bdaf-34499d7862d3', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 5.49);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('d6e99715-ea80-49fe-a993-9dc21f174fef', 'b64052e9-6fc0-4d80-80d7-b37e7f976f1b', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 5.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('eee67219-f25b-46ae-b005-6121322d3d84', '26fdbdfa-7612-4dc3-b7e0-beb47a82f88c', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.69);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('1ff05bfd-8d73-4f56-8b4c-6f2442c6f1ef', '09537b7a-ecee-41be-99b0-2048b5d3b28c', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.89);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('59538c22-acea-4945-8246-7db423fa2e9b', '15a8d534-4f1b-4306-88fd-3f8cf237c7f7', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 4.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('14a80412-3d78-4a6c-9fd2-9fef840b00b1', '0a1e5018-0449-4f4b-af6d-72490483fee2', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.89);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('6a7c2813-9816-410c-b020-59da430b4327', 'f716ad1c-922f-4a01-b2cc-1ac8553707dd', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.89);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('dddfc49f-087f-47dd-9752-bff5613451bb', 'ff69a320-b368-4d93-82cb-ea2014e6a69f', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.49);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('c6e131eb-4d40-4e6c-be3a-c46d7463ec18', 'eb10c1e0-7caa-427e-be75-ffd62b0dad60', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('9f46d11b-472f-47c4-a720-72b1a1510427', 'cf4a06fd-4d57-44d0-bb4f-78b37f6c0a76', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.49);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('ddcc7cee-69cb-4175-b32c-a8659baaf699', '9cc045a5-b0e2-476e-9799-0b933d8104b4', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('0c73c7ae-4006-4e91-9de9-b98e937bce29', '79d7fa6e-fa83-45d8-97d2-0615c8a035f5', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.59);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('36601246-c2ee-4fc7-9b80-0da34dc343b9', 'a2b43dad-09fb-4b78-b772-25a761256fc5', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.59);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('b990593b-9e11-4230-9541-8978a2950bb8', '939ecfad-33c6-48f5-bdd5-0c3d3a1222cb', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.59);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('d8711cd8-e712-44cd-bdbe-d819ce2599e9', '38e55ad1-72ee-4f91-8af7-753d0a670157', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.09);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('d4f9a3c0-7906-4bd3-a612-f244bc983a29', '10a30a6c-3724-4289-a632-bae1749e4915', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 5.49);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('708601ff-f697-41fc-bf38-b57889a44a76', '2940cf94-13b5-4639-b5c9-f9de5d2fff41', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.39);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('d0418aa0-893f-4cee-a842-d62790a843ea', 'd9f001df-1c6a-44bc-bfe0-2bd1ed607e0c', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.09);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('2126ed3f-9479-4426-9c72-47af9c81c652', '8ea8622a-74ea-40a9-a374-93459566115d', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 19.29);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('b57d5d29-a6b3-4d17-83ff-ad2af2394fa5', 'f0794625-8f03-46f2-8dc0-cd9de2b1c8e7', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 10.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('099943b0-21ba-4547-8f19-2e168f94264a', '6422c459-24cf-4514-b5ca-9ffbf3854683', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 17.49);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('ce09823e-9727-4725-9a69-97f6cd1674e3', 'd5414522-b78c-4902-a836-6cb71fd405bf', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 17.49);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('a6188464-fa8d-46bc-9171-bf6042080421', '0ba76e57-4399-4050-b9bf-b347e64dae9c', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 5.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('bf2fc827-e68b-4d28-b3a7-a2355131a23b', '56fe7dcb-d475-41ed-ac31-6acc1af1159f', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 8.79);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('e4c38c19-a11b-493d-aa92-a1e2d38b4367', '05e6a83a-a098-4083-80c1-c064f7e9e69c', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 58.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('16d53475-f864-4178-9623-46a63046a66e', 'd422cb42-ed68-4477-87fe-fbee579b0f29', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('49dbcdc7-3d9f-4322-bba8-58fc8635359d', '70bb4f38-bfa9-4838-99d4-1f3217c184da', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 27.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('e7907709-64e2-4054-94ac-a790867b764b', '975ceee0-01c6-4992-96ef-3d09be29a694', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 5.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('93968aa3-4a3c-4a33-b2b2-1a68a45a1b8c', '56677c0e-81f1-4b8f-bc78-a9bea873b7f1', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 41.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('ff5d8644-a563-445e-9a67-3586389e34c4', 'fb412699-ea55-45e3-95f7-06154000fc05', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 17.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('d87c17cf-3f59-4525-95f9-c7515af12d41', '5897a5c6-fa02-454c-9063-eb782784b562', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 17.49);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('ee717c19-4dce-464b-9a93-5f69256c3220', '18e83478-1ec3-4c19-92ad-bba8409d9286', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 17.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('0a396cbd-e2a7-42c8-a2ca-ce6fb37748d8', '7f894b24-6240-4223-9c17-8c271c0b7e4e', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('f3caeada-0fbc-4ae4-b672-cf2d389555a1', '032b39d6-41f3-4d28-b0a9-f5a3dc772323', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('4bb7526a-0bf4-4827-a715-b7f31be99ccf', 'd0f865ec-43e4-4ac9-b36e-d8ccc625052f', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.69);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('6847ae23-3dd6-4868-90c1-831ed91c70c9', '9c33cc2c-b25b-4755-a6f0-54d15dec2c3c', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('be100724-bcae-498c-9dce-a9682d38f13f', 'e5502f00-9070-4d1a-a08f-bcb47cefb5c1', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.69);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('6f83a066-9126-4711-9cde-ac89063b5638', 'b957217d-c931-4a6f-9542-334e4aadd942', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('bf018668-ec90-452a-9e30-dea2ca679d8a', '76afd239-bd4a-45d9-8e98-a66adc84ddc0', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 58.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('1d60677f-8c09-4b9a-8c96-20991dd69d39', 'f1a0ee1f-79af-4f45-bde5-0bc6cf808334', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('25bfc1dc-c20e-499d-8e13-e2cd562b7a84', '4f79dc77-067b-486a-9263-9d1e3da60f2e', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('db1cf1c5-c37b-4283-a333-217a8603e4dc', '3fee2b7f-4e88-4023-bdfa-6791ae1ee36b', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('7e777387-ad12-458a-b66f-1d9490cd9190', '0aae69f4-64d2-475f-b84e-b64774721bbb', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('53780558-5944-462c-a419-5d8bf80745de', 'eeda86f7-b06f-4734-9e27-c80bd11c863f', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.29);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('cf133c4b-10ec-4b32-b59f-89c529bedf80', '119bcea3-e985-4bfc-bdb2-d02f07d0dcdf', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('8905bfa4-97db-45a6-81bc-b06115b4ceef', '09b6e762-962e-43c8-b08a-36d9dd1148c9', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 0.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('bd2155be-2ea6-404d-ab5f-4114bb8d7162', '733cfc43-40e6-4425-a19d-f0eaa88644cb', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.29);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('3a363b69-1b17-4781-af2c-d2001a937720', '5a73858e-047c-467c-88fc-6e071dc8fd25', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.09);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('7dc6d5cc-1715-4dc8-a99c-0629594a83db', '5a2dcfcd-b237-4bce-a910-53e54559e8ef', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.29);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('e35c929f-f1c9-45f8-9cd1-f33e0a25800c', 'a802178f-2de7-4b5e-8fb1-09bf3088bd42', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.79);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('5221bd7c-1f9f-48bb-b8ba-48e87ec545bd', 'f3564cab-33d2-4a1d-a629-f9961542e957', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.5);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('7deee1ac-853f-4893-8e4d-f33277701034', '6a15f295-cdb5-48cd-95e8-5e7f255612f3', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.79);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('76d83843-1b23-4282-931e-01d42058c3d9', 'b77afd51-a343-4564-8f37-ab4fc79ab04e', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.69);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('52f3b53c-12b5-4b5f-a3d6-583fa8f8a4cf', '40a12f7d-c8cf-470b-a5c4-1b293e2d9e8b', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.5);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('b1baaf3f-0fd3-4471-8da3-02cf3bd5ed30', '0458c3a1-5a75-46f5-8ce6-68e10f114c07', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.19);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('496008d3-5f60-4bc6-885c-61943cd7f048', '51bdf451-3377-4b07-8840-02c40e466427', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.19);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('8d29ae47-4d01-4b48-a393-918e54d62cfa', '7305bbba-6207-4e24-b617-31423c232b9d', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 1.79);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('59378d6d-5450-4ffc-9c27-df8e162c1cca', '56967b60-14d2-4fbc-9bc8-e1291e2591b9', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 2.69);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('f5399143-c442-469e-a140-5c964ffef0b2', '017e9c2f-4394-405c-a328-166bb4935fb3', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 19.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('a660742b-7313-4285-91cd-a2f13d63287e', '2542ec36-c25c-48f3-b901-21ed8f5f758d', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 14.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('25235830-4c6f-4fea-80c6-7881a0534673', '84db3571-05ff-4aac-bf76-c367583e2092', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 19.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('81297097-22ab-4476-bfd7-87a9782640b3', 'dc857137-684b-4c7b-8c40-74acdea29121', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 6.49);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('1a886f6b-8ce1-445f-9379-deb159cf5277', '4dc295f3-e61c-4da2-95e2-6e67edaa10ff', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 14.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('f4de8c21-9853-485e-b263-cee1b1913805', '54ec5884-d4bf-4b27-9eda-712e17120396', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 14.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('bac9c5bf-5501-47ca-a3aa-79ebf2593718', '2922f4ee-8b42-4baf-a119-91c9f8838155', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 14.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('6ec5e8e3-0a2d-44e3-ad0a-d443e6591d63', 'f4693d66-9f71-44c8-804a-4647e1b895ec', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 19.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('88f0d63d-9beb-40bb-8732-f8a79f5eb918', '27fdba28-cbf6-4894-9212-031da15ad667', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 19.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('a18766dc-c4f1-4800-afe3-7f0e5ace6560', 'bff39b92-b636-4a9e-8bfc-c5a9bf753062', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('58184dd4-0beb-4ea2-8531-4fd65696c5f2', '4c0bf1ce-02c6-401a-87fe-b1fd4d96c2ab', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 18.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('45214f22-3a7e-4e81-b36b-086b6c7e14e1', '7d8ba39f-2a1c-46bd-a5ee-810ffc20f275', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 15.19);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('b3f68b85-2db9-49f5-8d66-5746a67901fb', '1983a281-d1ec-4a40-9753-76ff440fee94', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 19.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('efd58911-2f93-4a73-b0c6-74b341f2e4b5', '90ed1b12-5a3e-4cc7-afba-7a792174f1b0', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 11.49);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('ec7ef752-1b7a-4a01-a97a-b1a78cece4dc', '2b377d30-f917-4309-8c27-acc41236e03b', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('48a6e77f-48b6-4fd3-85b2-c1f99f86bf92', '439c2733-84a9-4283-a346-2cb8c4ad22f7', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 15.19);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('114082af-3223-4426-9971-cd8129982aa3', 'bf38cf49-e426-4f42-b466-51cb2f40e838', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 6.29);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('4e7df462-4e04-4376-b79d-077abc70b566', '8ddf102d-bd21-4956-8503-9c476f520505', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('dc3ffb3a-9ff9-4b9f-aa3d-a533369cbd5e', 'ab847a9a-206b-41af-aa8f-7dbb6a943612', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 19.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('c135aa11-0948-4e3e-ad79-9b19911c772e', 'fac1331b-b145-42da-8ddc-e2aefb991310', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 15.19);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('c038e4af-fec3-4b05-b3c5-96a606f999da', '861f4546-a858-44ea-8b20-b888a0b54b5c', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 19.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('ea62cbe2-f87a-4ef1-999f-438590b37ea1', '86dde04a-eeb1-4497-809f-07fcccab2bdf', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 19.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('b5f00537-4947-4622-8ce7-29b83d78e781', '5a0b25a2-ed59-4ec1-aa17-f8bc45d759c3', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 19.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('0d35dfb3-940b-469b-89c7-41b1d2bf55ca', 'f694b945-b92e-4214-80d7-9ae4b7a99047', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 6.49);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('2787c5f1-6d4e-4ad5-8850-ab3b29c54468', '579b3803-927b-4717-ad40-17c8b3e23467', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 19.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('1b6cbeff-c9e6-4dc3-8d65-0b2b90eee9de', '2cf429fd-7189-475f-a7fc-0a8c2a393a69', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 6.29);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('7facc8f6-8240-45bd-8810-0167b97b0624', 'a3691a19-eb2c-4a28-a010-34099eff7b85', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 6.29);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('c4664772-4702-4077-84d3-1279d7b070bf', '78878459-2cbd-421d-9e56-06da1dfd364a', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 15.19);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('8dd61cfc-7512-4682-b489-a972232ab1cc', '42658bca-5583-43ce-a462-a116b5de173b', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 14.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('df671ae0-17cd-4f8e-a281-73211a3ffc98', 'e96d8889-c79b-4e87-8245-a553a59cce45', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 14.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('60c8e2c8-3932-4efa-93f9-184b3ce7da38', 'f91e2b40-36d1-4c51-8321-bbd4ffcbcb29', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 18.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('f3e72d25-c11e-4243-9acf-697e2cee2dc4', '738682ab-fc80-4afe-a80a-7340ff9dcfa3', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 14.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('2787d885-2d10-4f7b-88f7-43b35d63bc12', 'ed7f79c4-2d1a-4da8-b128-9ff651628ae1', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 11.59);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('e3bb5b6f-7b8c-446f-823c-15ea4e801493', 'b41ea99a-6c59-4a6e-a752-f47434b7394a', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 11.59);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('6effdd20-088d-4f9b-9e05-52082a618b88', '32eb0899-5972-4e5b-8f8b-b9ca74e7295a', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 11.59);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('d5faded9-9cf8-452f-a74f-f502bb79807d', '82d5ae5a-c9d8-4f63-83ae-e3594e7cb8b2', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 6.49);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('985d8f43-d28d-4da4-9b8a-a8cdd1ffc718', '599d9351-f054-4e66-90a4-e1e0692a42c8', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 11.5);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('8144b000-5609-46a6-b61d-7b371165ccf4', 'e5626f88-6ad7-40ff-a55f-0a606106b68f', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 3.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('3ca34369-045b-49df-a95d-bb1a55b6cbce', '4745287e-748f-40e9-9e7a-bb85ed40263e', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 9.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('69e8cfe4-902d-4b60-ba76-7810ac5b00d5', '3cdc7538-465c-4d4f-b86c-4f643207021d', 'cc2704a2-04ac-40c3-a2e4-a9a1d14654d1', 6.29);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('10ce2b6f-81de-4847-ab56-fed0d949311f', '3e2374bc-cb7c-457e-970f-3c7eaf041b6f', 'b6015df1-fbae-4122-b5b4-e2dbd53ce1ab', 0.79);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('00606b8b-6ee9-4860-8c45-18688aaece8d', '1e7997b8-2300-4d8f-a069-5cf2f3cc0be7', 'b6015df1-fbae-4122-b5b4-e2dbd53ce1ab', 4.48);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('b3c44380-db73-4b16-b6d8-0b451f0c47a4', '3be34829-8430-4421-8827-4153700fea99', 'b6015df1-fbae-4122-b5b4-e2dbd53ce1ab', 0.71);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('9aac6046-14c6-443c-9ebe-fc0445bafa3d', '67a804e1-92c0-4fa2-85bc-685f0c62f487', 'b6015df1-fbae-4122-b5b4-e2dbd53ce1ab', 4.48);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('f15ab3a5-8cde-48d3-93ce-381b4792be82', 'c76aba3f-c4c4-4c72-98c2-ee7618b7f7e4', 'b6015df1-fbae-4122-b5b4-e2dbd53ce1ab', 1.29);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('ad567305-057e-4726-b370-23cde2e00964', '208ddf6a-94ec-4959-8f71-6449af6f43d0', 'b6015df1-fbae-4122-b5b4-e2dbd53ce1ab', 0.5);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('61d1d89f-f662-46f9-a3a0-0ba43cd3d82d', '04678e8b-a188-4301-ab11-37669fb7f0fe', 'b6015df1-fbae-4122-b5b4-e2dbd53ce1ab', 2.5);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('0f2ab136-4d6f-405e-99a4-5ac3582cff18', '0ca4cb2d-7c19-475e-88b6-f2cc8309afd4', 'b6015df1-fbae-4122-b5b4-e2dbd53ce1ab', 2.49);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('d763f5dd-ed96-4586-a4aa-dcdc977c5b2a', '43827ca7-083a-4fa9-a3a0-437d4004ad7c', 'b6015df1-fbae-4122-b5b4-e2dbd53ce1ab', 0.71);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('cb05c445-8461-43a5-9c32-2e90066c8958', '0d5937f2-d17e-4a92-a21e-c6a2498450c1', 'b6015df1-fbae-4122-b5b4-e2dbd53ce1ab', 4.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('69262cbc-60a4-4c2e-8e12-5fd634f31bdf', '9d0cec18-70c6-4c32-96b4-ad832f1d1ba2', 'b6015df1-fbae-4122-b5b4-e2dbd53ce1ab', 3.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('2dd08a5d-8ecb-4cc5-bc57-4764d27f138b', '662c7132-0581-4988-bb6f-35849fa3eac3', 'b6015df1-fbae-4122-b5b4-e2dbd53ce1ab', 5.24);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('8e09a3b0-9f74-4665-810a-8da0dc6cae88', '94abe264-ad83-404c-bc4b-4207aaa9e74d', 'b6015df1-fbae-4122-b5b4-e2dbd53ce1ab', 5.0);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('d3b9d6f7-f9fd-406d-89d3-0f79770fef51', '78e7bf35-7242-4509-9bd5-ea7123abf296', 'b6015df1-fbae-4122-b5b4-e2dbd53ce1ab', 6.99);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('e748c1cf-ade6-4239-97d6-ea4db5691727', 'a7dbd5cb-1a60-4c89-89b1-f279db27f889', 'b6015df1-fbae-4122-b5b4-e2dbd53ce1ab', 2.5);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('b7f3e7d7-2327-4070-9296-debb35ae3425', 'ec6e5526-0071-41f7-9ed0-f2e2409f2e0e', 'b6015df1-fbae-4122-b5b4-e2dbd53ce1ab', 3.49);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('12f37ba4-56d3-45a4-ac06-ef2017bdbf6d', '9ed5b76a-9188-4a46-9718-626c1e816d91', 'b6015df1-fbae-4122-b5b4-e2dbd53ce1ab', 5.0);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('7d16961a-dd12-450e-9b77-d7d5407637b6', '212bdb89-137f-461c-8281-f160e1120ff0', 'b6015df1-fbae-4122-b5b4-e2dbd53ce1ab', 2.5);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('32082e11-8c4f-4869-9abf-a5931bfb0e63', 'fb6f96fa-3cf6-435d-b485-04a96cb219ed', 'b6015df1-fbae-4122-b5b4-e2dbd53ce1ab', 2.5);
INSERT INTO itemprice (id, itemid, storeid, price)
VALUES ('ce123d67-664d-467d-80ae-ee12f2cdb202', '4ab759b0-5f3d-4455-a46d-25ac5ca4746b', 'b6015df1-fbae-4122-b5b4-e2dbd53ce1ab', 2.5);