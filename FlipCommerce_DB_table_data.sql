 USE  FlipCommerce_DB;
-- ============================================================
-- 1. USERS
-- ============================================================
INSERT INTO users
  (user_id, first_name, last_name, email, mobile_number, password_hash, account_status, created_at)
VALUES
  (1,  'Arun',    'Kumar',  'arun@gmail.com',    '9876543210', 'hash1',  'active',    '2025-01-01'),
  (2,  'Arun',    'Kumar',  'arunS@gmail.com',   '9876543211', 'hash2',  'active',    '2025-01-02'),
  (3,  'Priya',   'Sharma', 'priya@gmail.com',   '9876543212', 'hash3',  'inactive',  '2025-01-03'),
  (4,  'Rahul',   NULL,     'rahul@gmail.com',   '9876543213', 'hash4',  'active',    '2025-01-04'),
  (5,  'Sneha',   'Iyer',   'sneha@gmail.com',   '9876543214', 'hash5',  'active',    '2025-01-05'),
  (6,  'Vikram',  'Singh',  'vikram@gmail.com',  '9876543215', 'hash6',  'suspended', '2025-01-06'),
  (7,  'Anu',     'R',      'anu@gmail.com',      '9876543216', 'hash7',  'active',    '2025-01-07'),
  (8,  'John',    'Doe',    'john@gmail.com',     '9876543217', 'hash8',  'active',    '2025-01-08'),
  (9,  'Meena',   'Das',    'meena@gmail.com',   '9876543218', 'hash9',  'active',    '2025-01-09'),
  (10, 'Kiran',   'Patel',  'kiran@gmail.com',   '9876543219', 'hash10', 'active',    '2025-01-10'),
  (11, 'Ajay',    'K',      'ajay@gmail.com',     '9876543220', 'hash11', 'active',    '2025-01-11'),
  (12, 'Divya',   'N',      'divya@gmail.com',    '9876543221', 'hash12', 'inactive',  '2025-01-12'),
  (13, 'Ravi',    'Teja',   'ravi@gmail.com',     '9876543222', 'hash13', 'active',    '2025-01-13'),
  (14, 'Suresh',  'B',      'suresh@gmail.com',   '9876543223', 'hash14', 'active',    '2025-01-14'),
  (15, 'Lakshmi', 'P',      'lakshmi@gmail.com', '9876543224', 'hash15', 'active',    '2025-01-15'),
  (16, 'Manoj',   'R',      'manoj@gmail.com',   '9876543225', 'hash16', 'active',    '2025-01-16'),
  (17, 'Neha',    'Singh',  'neha@gmail.com',    '9876543226', 'hash17', 'active',    '2025-01-17'),
  (18, 'Pooja',   'K',      'pooja@gmail.com',    '9876543227', 'hash18', 'active',    '2025-01-18'),
  (19, 'Varun',   'S',      'varun@gmail.com',    '9876543228', 'hash19', 'active',    '2025-01-19'),
  (20, 'Deepa',   'M',      'deepa@gmail.com',    '9876543229', 'hash20', 'active',    '2025-01-20'),
  (21, 'Amit',    'Shah',   'amit@gmail.com',     '9876543230', 'hash21', 'active',    '2025-01-21'),
  (22, 'Ankit',   'J',      'ankit@gmail.com',    '9876543231', 'hash22', 'active',    '2025-01-22'),
  (23, 'Rohit',   'Y',      'rohit@gmail.com',    '9876543232', 'hash23', 'active',    '2025-01-23'),
  (24, 'Sanjay',  'K',      'sanjay@gmail.com',   '9876543233', 'hash24', 'active',    '2025-01-24'),
  (25, 'Kavya',   'R',      'kavya@gmail.com',    '9876543234', 'hash25', 'active',    '2025-01-25'),
  (26, 'Nisha',   'T',      'nisha@gmail.com',    '9876543235', 'hash26', 'active',    '2025-01-26'),
  (27, 'Raj',     'P',      'raj@gmail.com',       '9876543236', 'hash27', 'active',    '2025-01-27'),
  (28, 'Ramesh',  'G',      'ramesh@gmail.com',   '9876543237', 'hash28', 'active',    '2025-01-28'),
  (29, 'Vani',    'L',      'vani@gmail.com',      '9876543238', 'hash29', 'active',    '2025-01-29'),
  (30, 'Hari',    'D',      'hari@gmail.com',      '9876543239', 'hash30', 'active',    '2025-01-30');

-- ============================================================
-- 2. SELLERS
-- ============================================================
INSERT INTO sellers
  (seller_id, full_name, display_name, email, mobile_number, pan_id, gstin_id, store_description, seller_status)
VALUES
  (1,  'Murugan Stores',   'MuruganMart',    'murugan@gmail.com',  '9000000001', 'ABCDE1234F', '29ABCDE1234F1Z5', 'Electronics store',  'active'),
  (2,  'Kumar Traders',    'KumarShop',      'kumar@gmail.com',    '9000000002', 'ABCDE1234G', '29ABCDE1234G1Z5', 'General store',      'active'),
  (3,  'Raja Electronics', 'RajaElectro',    'raja@gmail.com',     '9000000003', 'ABCDE1234H', '29ABCDE1234H1Z5', 'Gadgets',            'active'),
  (4,  'Sunil Mart',       'SunilMart',      'sunil@gmail.com',    '9000000004', 'ABCDE1234I', '29ABCDE1234I1Z5', 'Clothing',           'inactive'),
  (5,  'Tech World',       'TechWorld',      'tech@gmail.com',     '9000000005', 'ABCDE1234J', '29ABCDE1234J1Z5', 'Electronics',        'active'),
  (6,  'Fashion Hub',      'FashionHub',     'fashion@gmail.com',  '9000000006', 'ABCDE1234K', '29ABCDE1234K1Z5', 'Clothes',            'active'),
  (7,  'Book Store',       'BookShop',       'book@gmail.com',     '9000000007', 'ABCDE1234L', '29ABCDE1234L1Z5', 'Books',              'active'),
  (8,  'Mobile Zone',      'MobileZone',     'mobile@gmail.com',   '9000000008', 'ABCDE1234M', '29ABCDE1234M1Z5', 'Mobiles',            'active'),
  (9,  'Home Needs',       'HomeNeeds',      'home@gmail.com',     '9000000009', 'ABCDE1234N', '29ABCDE1234N1Z5', 'Home items',         'active'),
  (10, 'Sports Hub',       'SportsHub',      'sports@gmail.com',   '9000000010', 'ABCDE1234O', '29ABCDE1234O1Z5', 'Sports',             'active'),
  (11, 'Kitchen King',     'KitchenKing',    'kitchen@gmail.com',  '9000000011', 'ABCDE1234P', '29ABCDE1234P1Z5', 'Kitchen items',      'active'),
  (12, 'Gadget Store',     'GadgetStore',    'gadget@gmail.com',   '9000000012', 'ABCDE1234Q', '29ABCDE1234Q1Z5', 'Electronics',        'active'),
  (13, 'Digital Shop',     'DigitalShop',    'digital@gmail.com',  '9000000013', 'ABCDE1234R', '29ABCDE1234R1Z5', 'Digital goods',      'active'),
  (14, 'Toy World',        'ToyWorld',       'toy@gmail.com',      '9000000014', 'ABCDE1234S', '29ABCDE1234S1Z5', 'Toys',               'active'),
  (15, 'Furniture House',  'FurnitureHouse', 'furniture@gmail.com','9000000015', 'ABCDE1234T', '29ABCDE1234T1Z5', 'Furniture',          'active');

-- ============================================================
-- 3. SELLER ADDRESSES   
-- ============================================================
INSERT INTO seller_address
  (seller_address_id, seller_id, address_line1, street, city, state, landmark, pincode, country, address_type)
VALUES
  (1,  1,  '12 Gandhi Street', 'T Nagar',        'Chennai',    'Tamil Nadu', 'Near Bus Stand', '600017', 'India', 'warehouse'),
  (2,  2,  '45 Anna Salai',    'Mount Road',      'Chennai',    'Tamil Nadu', 'Near LIC',       '600002', 'India', 'office'),
  (3,  3,  '23 Market Road',   'RS Puram',        'Coimbatore', 'Tamil Nadu', 'Near Park',      '641002', 'India', 'warehouse'),
  (4,  4,  '78 Bazaar Street', 'Town Hall',       'Coimbatore', 'Tamil Nadu', 'Near Temple',    '641001', 'India', 'pickup'),
  (5,  5,  '11 Lake View',     'KK Nagar',        'Madurai',    'Tamil Nadu', 'Near Lake',      '625020', 'India', 'warehouse'),
  (6,  6,  '90 Main Road',     'Anna Nagar',      'Madurai',    'Tamil Nadu', 'Near School',    '625001', 'India', 'office'),
  (7,  7,  '5 Cross Street',   'Gandhipuram',     'Coimbatore', 'Tamil Nadu', 'Near Mall',      '641012', 'India', 'warehouse'),
  (8,  8,  '66 High Road',     'Velachery',       'Chennai',    'Tamil Nadu', 'Near Signal',    '600042', 'India', 'pickup'),
  (9,  9,  '14 River Side',    'Erode Town',      'Erode',      'Tamil Nadu', 'Near Bridge',    '638001', 'India', 'warehouse'),
  (10, 10, '32 Hill Street',   'Yercaud Road',    'Salem',      'Tamil Nadu', 'Near Hills',     '636007', 'India', 'office'),
  (11, 11, '88 Garden Road',   'Trichy Central',  'Trichy',     'Tamil Nadu', 'Near Station',   '620001', 'India', 'warehouse'),
  (12, 12, '21 Temple Street', 'Srirangam',       'Trichy',     'Tamil Nadu', 'Near Temple',    '620006', 'India', 'pickup'),
  (13, 13, '7 Beach Road',     'Besant Nagar',    'Chennai',    'Tamil Nadu', 'Near Beach',     '600090', 'India', 'warehouse'),
  (14, 14, '55 Forest Lane',   'Ooty Road',       'Nilgiris',   'Tamil Nadu', 'Near Forest',    '643001', 'India', 'office'),
  (15, 15, '99 Ring Road',     'Outer Ring',      'Chennai',    'Tamil Nadu', 'Near Highway',   '600101', 'India', 'warehouse');

-- ============================================================
-- 4. SELLER BANK ACCOUNTS
-- ============================================================
INSERT INTO seller_bank_accounts
  (account_id, seller_id, account_holder_name, bank_account_number, bank_ifsc_code, is_primary, verification_status)
VALUES
  (1,  1,  'Murugan Stores',   '100000000001', 'HDFC0001234', 1, 'verified'),
  (2,  2,  'Kumar Traders',    '100000000002', 'SBIN0005678', 1, 'verified'),
  (3,  3,  'Raja Electronics', '100000000003', 'ICIC0004321', 1, 'verified'),
  (4,  4,  'Sunil Mart',       '100000000004', 'AXIS0008765', 1, 'pending'),
  (5,  5,  'Tech World',       '100000000005', 'HDFC0001111', 1, 'verified'),
  (6,  6,  'Fashion Hub',      '100000000006', 'SBIN0002222', 1, 'verified'),
  (7,  7,  'Book Store',       '100000000007', 'ICIC0003333', 1, 'verified'),
  (8,  8,  'Mobile Zone',      '100000000008', 'AXIS0004444', 1, 'verified'),
  (9,  9,  'Home Needs',       '100000000009', 'HDFC0005555', 1, 'pending'),
  (10, 10, 'Sports Hub',       '100000000010', 'SBIN0006666', 1, 'verified'),
  (11, 11, 'Kitchen King',     '100000000011', 'ICIC0007777', 1, 'verified'),
  (12, 12, 'Gadget Store',     '100000000012', 'AXIS0008888', 1, 'verified'),
  (13, 13, 'Digital Shop',     '100000000013', 'HDFC0009999', 1, 'verified'),
  (14, 14, 'Toy World',        '100000000014', 'SBIN0001212', 1, 'rejected'),
  (15, 15, 'Furniture House',  '100000000015', 'ICIC0003434', 1, 'verified');

-- ============================================================
-- 5. PRODUCT CATEGORIES
-- ============================================================
INSERT INTO product_categories (category_id, category_name, parent_category_id)
VALUES
  (1,  'Electronics',  NULL),
  (2,  'Mobiles',      1),
  (3,  'Laptops',      1),
  (4,  'Clothing',     NULL),
  (5,  'Men Wear',     4),
  (6,  'Women Wear',   4),
  (7,  'Books',        NULL),
  (8,  'Home',         NULL),
  (9,  'Kitchen',      8),
  (10, 'Sports',       NULL),
  (11, 'Toys',         NULL),
  (12, 'Furniture',    NULL),
  (13, 'Digital',      NULL),
  (14, 'Accessories',  1),
  (15, 'Gaming',       1);

-- ============================================================
-- 6. PRODUCTS
-- ============================================================
INSERT INTO products
  (product_id, product_name, category_id, seller_id, product_type, brand)
VALUES
  (1,  'iPhone 13',         2,  1,  'physical', 'Apple'),
  (2,  'Samsung S21',       2,  2,  'physical', 'Samsung'),
  (3,  'Dell Laptop',       3,  3,  'physical', 'Dell'),
  (4,  'HP Laptop',         3,  5,  'physical', 'HP'),
  (5,  'T-Shirt',           5,  6,  'physical', 'Nike'),
  (6,  'Jeans',             5,  6,  'physical', 'Levis'),
  (7,  'Dress',             6,  4,  'physical', 'Zara'),
  (8,  'Novel Book',        7,  7,  'physical', 'Penguin'),
  (9,  'Cookware Set',      9,  11, 'physical', 'Prestige'),
  (10, 'Football',          10, 10, 'physical', 'Adidas'),
  (11, 'Cricket Bat',       10, 10, 'physical', 'SG'),
  (12, 'Toy Car',           11, 14, 'physical', 'FunToy'),
  (13, 'Sofa',              12, 15, 'physical', 'UrbanLadder'),
  (14, 'Ebook Python',      13, 13, 'digital',  'NA'),
  (15, 'Gaming Mouse',      15, 1,  'physical', 'Logitech'),
  (16, 'Keyboard',          15, 1,  'physical', 'HP'),
  (17, 'Tablet',            2,  8,  'physical', 'Lenovo'),
  (18, 'Smart Watch',       2,  8,  'physical', 'Boat'),
  (19, 'Headphones',        1,  1,  'physical', 'Sony'),
  (20, 'Mixer Grinder',     9,  11, 'physical', 'Bajaj'),
  (21, 'Shirt',             5,  6,  'physical', 'AllenSolly'),
  (22, 'Skirt',             6,  6,  'physical', 'Zara'),
  (23, 'Cookbook',          7,  7,  'physical', 'Penguin'),
  (24, 'Office Chair',      12, 15, 'physical', 'Godrej'),
  (25, 'Basketball',        10, 10, 'physical', 'Nike'),
  (26, 'Toy Train',         11, 14, 'physical', 'FunToy'),
  (27, 'Bed',               12, 15, 'physical', 'Ikea'),
  (28, 'Online Course SQL', 13, 13, 'digital',  'NA'),
  (29, 'Power Bank',        14, 1,  'physical', 'Mi'),
  (30, 'Gaming Console',    15, 1,  'physical', 'Sony');

-- ============================================================
-- 7. VARIANTS  
-- ============================================================
INSERT INTO variants (variant_id, product_id, sku, price)
VALUES
  (1,  1,  'IPH13-BLK-64',    69999.00),
  (2,  1,  'IPH13-WHT-128',   74999.00),
  (3,  2,  'SAM-S21-128',     59999.00),
  (4,  3,  'DELL-I5-8GB',     55999.00),
  (5,  4,  'HP-I7-16GB',      75999.00),
  (6,  5,  'TSHIRT-M-BLK',      799.00),
  (7,  5,  'TSHIRT-L-BLK',      799.00),
  (8,  6,  'JEANS-32-BLU',     1999.00),
  (9,  7,  'DRESS-S-RED',      2499.00),
  (10, 8,  'BOOK-NOVEL-1',      399.00),
  (11, 9,  'COOKSET-5PC',      2999.00),
  (12, 10, 'FOOTBALL-STD',      999.00),
  (13, 11, 'BAT-SG',           2499.00),
  (14, 12, 'TOYCAR-RED',        499.00),
  (15, 13, 'SOFA-3SEAT',      19999.00),
  (16, 15, 'MOUSE-GAMING',     1499.00),
  (17, 16, 'KEYBOARD-MECH',    2999.00),
  (18, 17, 'TAB-64GB',        15999.00),
  (19, 18, 'WATCH-BLK',        1999.00),
  (20, 19, 'HEADPHONES-BLK',   2999.00),
  (21, 14, 'EBOOK-PY-PDF',      499.00),
  (22, 20, 'MIXER-750W',        2499.00),
  (23, 21, 'SHIRT-M-WHT',      1299.00),
  (24, 21, 'SHIRT-L-BLU',      1299.00),
  (25, 22, 'SKIRT-S-BLK',      1499.00),
  (26, 23, 'COOKBOOK-HB',        599.00),
  (27, 24, 'OFFCHAIR-BLK',     8999.00),
  (28, 25, 'BBALL-STD',         1499.00),
  (29, 26, 'TOYTRAIN-RED',       799.00),
  (30, 27, 'BED-QUEEN-WHT',   25999.00),
  (31, 28, 'COURSE-SQL-DIG',     999.00),
  (32, 29, 'PBANK-20K-BLK',    1799.00),
  (33, 30, 'CONSOLE-BLK',     49999.00);

-- ============================================================
-- 8. INVENTORIES  
-- ============================================================
INSERT INTO inventories (inventory_id, variant_id, stock_quantity, reserved_quantity)
VALUES
  (1,  1,  50,  5),
  (2,  2,  30,  2),
  (3,  3,  40,  0),
  (4,  4,  20,  1),
  (5,  5,  15,  0),
  (6,  6,  100, 10),
  (7,  7,  0,   0),
  (8,  8,  60,  5),
  (9,  9,  25,  2),
  (10, 10, 80,  0),
  (11, 11, 35,  3),
  (12, 12, 70,  0),
  (13, 13, 10,  1),
  (14, 14, 150, 20),
  (15, 15, 5,   0),
  (16, 16, 90,  5),
  (17, 17, 40,  4),
  (18, 18, 25,  2),
  (19, 19, 55,  6),
  (20, 20, 0,   0),
  (21, 21, 500, 0),
  (22, 22, 45,  3),
  (23, 23, 80,  5),
  (24, 24, 60,  2),
  (25, 25, 30,  1),
  (26, 26, 100, 0),
  (27, 27, 15,  2),
  (28, 28, 50,  0),
  (29, 29, 200, 10),
  (30, 30, 8,   1),
  (31, 31, 750, 0),
  (32, 32, 75,  4),
  (33, 33, 20,  2);

-- ============================================================
-- 9. PRODUCT ATTRIBUTES
-- ============================================================
INSERT INTO product_attributes (attribute_id, attribute_name)
VALUES
  (1, 'Color'),
  (2, 'Size'),
  (3, 'Storage'),
  (4, 'RAM'),
  (5, 'Material'),
  (6, 'Weight'),
  (7, 'BrandType'),
  (8, 'Battery'),
  (9, 'Length'),
  (10,'Width');

-- ============================================================
-- 10. VARIANT ATTRIBUTE VALUES  
-- ============================================================
INSERT INTO variant_attribute_values (variant_id, attribute_id, attribute_value)
VALUES
  (1,  1, 'Black'),
  (2,  1, 'White'),
  (1,  3, '64GB'),
  (2,  3, '128GB'),
  (3,  3, '128GB'),
  (4,  4, '8GB'),
  (5,  4, '16GB'),
  (6,  2, 'M'),
  (7,  2, 'L'),
  (8,  2, '32'),
  (9,  2, 'S'),
  (10, 5, 'Paper'),
  (11, 5, 'Steel'),
  (12, 6, '500g'),
  (13, 6, '1kg'),
  (14, 1, 'Red'),
  (15, 5, 'Wood'),
  (16, 7, 'Gaming'),
  (17, 7, 'Mechanical'),
  (18, 3, '64GB'),
  (19, 8, '300mAh'),   -- Smart Watch battery
  (20, 7, 'Over-Ear'), -- Headphones type
  (21, 5, 'Digital'),  -- Ebook Python
  (22, 6, '750W'),     -- Mixer Grinder wattage
  (23, 1, 'White'),    -- Shirt White
  (23, 2, 'M'),
  (24, 1, 'Blue'),     -- Shirt Blue
  (24, 2, 'L'),
  (25, 1, 'Black'),    -- Skirt
  (25, 2, 'S'),
  (26, 5, 'Hardback'), -- Cookbook
  (27, 1, 'Black'),    -- Office Chair
  (28, 6, '500g'),     -- Basketball
  (29, 1, 'Red'),      -- Toy Train
  (30, 1, 'White'),    -- Bed
  (31, 5, 'Digital'),  -- Online Course
  (32, 1, 'Black'),    -- Power Bank
  (33, 1, 'Black');    -- Gaming Console

-- ============================================================
-- 11. CARDS  
-- ============================================================
INSERT INTO cards
  (card_id, user_id, card_number_last4, valid_thru, card_type, issuing_bank, card_network, card_holder_name, card_status, created_at)
VALUES
  (1,  1,  '1234', '2027-12-01', 'credit', 'HDFC',  'visa',       'User 1',  'active',  '2025-01-01'),
  (2,  2,  '2345', '2026-11-01', 'debit',  'SBI',   'mastercard', 'User 2',  'active',  '2025-01-02'),
  (3,  3,  '3456', '2028-10-01', 'credit', 'ICICI', 'visa',       'User 3',  'active',  '2025-01-03'),
  (4,  4,  '4567', '2027-09-01', 'debit',  'Axis',  'rupay',      'User 4',  'active',  '2025-01-04'),
  (5,  5,  '5678', '2026-08-01', 'credit', 'HDFC',  'amex',       'User 5',  'active',  '2025-01-05'),
  (6,  6,  '6789', '2027-07-01', 'debit',  'SBI',   'visa',       'User 6',  'active',  '2025-01-06'),
  (7,  7,  '7890', '2028-06-01', 'credit', 'ICICI', 'mastercard', 'User 7',  'active',  '2025-01-07'),
  (8,  8,  '8901', '2027-05-01', 'debit',  'Axis',  'rupay',      'User 8',  'blocked', '2025-01-08'),
  (9,  9,  '9012', '2026-04-01', 'credit', 'HDFC',  'visa',       'User 9',  'active',  '2025-01-09'),
  (10, 10, '0123', '2027-03-01', 'debit',  'SBI',   'mastercard', 'User 10', 'active',  '2025-01-10'),
  (11, 11, '1122', '2028-02-01', 'credit', 'ICICI', 'visa',       'User 11', 'expired', '2025-01-11'),
  (12, 12, '2233', '2027-01-01', 'debit',  'HDFC',  'visa',       'User 12', 'active',  '2025-01-12'),
  (13, 13, '3344', '2028-01-01', 'credit', 'ICICI', 'mastercard', 'User 13', 'active',  '2025-01-13'),
  (14, 14, '4455', '2027-01-01', 'debit',  'SBI',   'rupay',      'User 14', 'active',  '2025-01-14'),
  (15, 15, '5566', '2026-01-01', 'credit', 'HDFC',  'visa',       'User 15', 'active',  '2025-01-15'),
  (16, 16, '6677', '2028-01-01', 'debit',  'ICICI', 'mastercard', 'User 16', 'active',  '2025-01-16'),
  (17, 17, '7788', '2027-01-01', 'credit', 'Axis',  'rupay',      'User 17', 'active',  '2025-01-17'),
  (18, 18, '8899', '2026-01-01', 'debit',  'HDFC',  'amex',       'User 18', 'active',  '2025-01-18'),
  (19, 19, '9900', '2028-01-01', 'credit', 'SBI',   'visa',       'User 19', 'active',  '2025-01-19'),
  (20, 20, '0011', '2027-01-01', 'debit',  'ICICI', 'mastercard', 'User 20', 'active',  '2025-01-20'),
  (21, 21, '1133', '2028-01-01', 'credit', 'HDFC',  'visa',       'User 21', 'active',  '2025-01-21'),
  (22, 22, '2244', '2027-01-01', 'debit',  'SBI',   'rupay',      'User 22', 'active',  '2025-01-22'),
  (23, 23, '3355', '2026-01-01', 'credit', 'ICICI', 'mastercard', 'User 23', 'active',  '2025-01-23'),
  (24, 24, '4466', '2028-01-01', 'debit',  'Axis',  'visa',       'User 24', 'active',  '2025-01-24'),
  (25, 25, '5577', '2027-01-01', 'credit', 'HDFC',  'mastercard', 'User 25', 'active',  '2025-01-25'),
  (26, 26, '6688', '2026-01-01', 'debit',  'SBI',   'rupay',      'User 26', 'active',  '2025-01-26'),
  (27, 27, '7799', '2028-01-01', 'credit', 'ICICI', 'visa',       'User 27', 'active',  '2025-01-27'),
  (28, 28, '8800', '2027-01-01', 'debit',  'Axis',  'mastercard', 'User 28', 'active',  '2025-01-28'),
  (29, 29, '9911', '2026-01-01', 'credit', 'HDFC',  'rupay',      'User 29', 'active',  '2025-01-29'),
  (30, 30, '0022', '2028-01-01', 'debit',  'SBI',   'visa',       'User 30', 'active',  '2025-01-30');

-- ============================================================
-- 12. UPI IDs   
-- ============================================================
INSERT INTO upi_ids (upi_id_id, user_id, upi_id, provider, created_at)
VALUES
  (1,  2,  'arunkumar@okhdfc',  'gpay',    '2025-01-01'),
  (2,  5,  'sneha.iyer@ybl',    'phonepe', '2025-01-02'),
  (3,  8,  'johndoe@paytm',     'paytm',   '2025-01-03'),
  (4,  11, 'ajay.k@okicici',    'gpay',    '2025-01-04'),
  (5,  13, 'ravi.teja@ybl',     'phonepe', '2025-01-05'),
  (6,  17, 'neha.singh@paytm',  'paytm',   '2025-01-06'),
  (7,  20, 'deepa.m@okhdfc',    'gpay',    '2025-01-07'),
  (8,  22, 'ankit.j@ybl',       'phonepe', '2025-01-08'),
  (9,  24, 'sanjay.k@paytm',    'paytm',   '2025-01-09'),
  (10, 26, 'nisha.t@okicici',   'gpay',    '2025-01-10'),
  (11, 28, 'ramesh.g@ybl',      'phonepe', '2025-01-11'),
  (12, 30, 'hari.d@paytm',      'paytm',   '2025-01-12');

-- ============================================================
-- 13. ADDRESSES
-- ============================================================
INSERT INTO addresses (address_id, user_id, city, state, pincode, address_type)
VALUES
  (1,  1,  'Chennai',     'Tamil Nadu', '600001', 'home'),
  (2,  2,  'Coimbatore',  'Tamil Nadu', '641001', 'home'),
  (3,  3,  'Madurai',     'Tamil Nadu', '625001', 'home'),
  (4,  4,  'Salem',       'Tamil Nadu', '636001', 'work'),
  (5,  5,  'Trichy',      'Tamil Nadu', '620001', 'home'),
  (6,  6,  'Erode',       'Tamil Nadu', '638001', 'home'),
  (7,  7,  'Vellore',     'Tamil Nadu', '632001', 'home'),
  (8,  8,  'Tirunelveli', 'Tamil Nadu', '627001', 'home'),
  (9,  9,  'Thoothukudi', 'Tamil Nadu', '628001', 'work'),
  (10, 10, 'Chennai',     'Tamil Nadu', '600002', 'home'),
  (11, 11, 'Chennai',     'Tamil Nadu', '600003', 'home'),
  (12, 12, 'Coimbatore',  'Tamil Nadu', '641002', 'work'),
  (13, 13, 'Madurai',     'Tamil Nadu', '625002', 'home'),
  (14, 14, 'Salem',       'Tamil Nadu', '636002', 'home'),
  (15, 15, 'Trichy',      'Tamil Nadu', '620002', 'home'),
  (16, 16, 'Erode',       'Tamil Nadu', '638002', 'home'),
  (17, 17, 'Vellore',     'Tamil Nadu', '632002', 'home'),
  (18, 18, 'Tirunelveli', 'Tamil Nadu', '627002', 'home'),
  (19, 19, 'Thoothukudi', 'Tamil Nadu', '628002', 'home'),
  (20, 20, 'Chennai',     'Tamil Nadu', '600004', 'home'),
  (21, 21, 'Chennai',     'Tamil Nadu', '600005', 'work'),
  (22, 22, 'Coimbatore',  'Tamil Nadu', '641003', 'home'),
  (23, 23, 'Madurai',     'Tamil Nadu', '625003', 'home'),
  (24, 24, 'Salem',       'Tamil Nadu', '636003', 'home'),
  (25, 25, 'Trichy',      'Tamil Nadu', '620003', 'home'),
  (26, 26, 'Erode',       'Tamil Nadu', '638003', 'home'),
  (27, 27, 'Vellore',     'Tamil Nadu', '632003', 'home'),
  (28, 28, 'Tirunelveli', 'Tamil Nadu', '627003', 'home'),
  (29, 29, 'Thoothukudi', 'Tamil Nadu', '628003', 'home'),
  (30, 30, 'Chennai',     'Tamil Nadu', '600006', 'home');

-- ============================================================
-- 14. CARTS   
-- ============================================================
INSERT INTO carts (cart_id, user_id)
VALUES
  (1,1),(2,2),(3,3),(4,4),(5,5),
  (6,6),(7,7),(8,8),(9,9),(10,10),
  (11,11),(12,12),(13,13),(14,14),(15,15),
  (16,16),(17,17),(18,18),(19,19),(20,20),
  (21,21),(22,22),(23,23),(24,24),(25,25),
  (26,26),(27,27),(28,28),(29,29),(30,30);

-- ============================================================
-- 15. CART ITEMS   
-- ============================================================
INSERT INTO cart_items (cart_id, variant_id, quantity)
VALUES
  (1,  1,  1),
  (1,  6,  2),
  (2,  3,  1),
  (3,  10, 3),
  (4,  5,  1),
  (5,  7,  2),
  (6,  8,  1),
  (7,  9,  1),
  (8,  2,  1),
  (9,  11, 2),
  (10, 12, 1),
  (11, 13, 1),
  (12, 14, 5),
  (13, 15, 1),
  (14, 16, 2),
  (15, 17, 1),
  (2,  18, 1),
  (3,  19, 2),
  (4,  20, 1),
  (5,  1,  1),
  (16, 22, 1),
  (17, 23, 2),
  (18, 28, 1),
  (19, 33, 1),
  (20, 25, 1),
  (21, 27, 1),
  (22, 24, 1),
  (23, 31, 1),
  (24, 29, 2),
  (25, 21, 1),
  (26, 26, 3),
  (27, 32, 1),
  (28, 30, 1),
  (29, 22, 2),
  (30, 1,  1);

-- ============================================================
-- 16. WISHLISTS 
-- ============================================================
INSERT INTO wishlists (wishlist_id, user_id, created_at)
VALUES
  (1,  1,  '2025-02-01'),
  (2,  2,  '2025-02-01'),
  (3,  3,  '2025-02-02'),
  (4,  4,  '2025-02-02'),
  (5,  5,  '2025-02-03'),
  (6,  6,  '2025-02-03'),
  (7,  7,  '2025-02-04'),
  (8,  8,  '2025-02-04'),
  (9,  9,  '2025-02-05'),
  (10, 10, '2025-02-05'),
  (11, 11, '2025-02-06'),
  (12, 12, '2025-02-06'),
  (13, 13, '2025-02-07'),
  (14, 14, '2025-02-07'),
  (15, 15, '2025-02-08'),
  (16, 16, '2025-02-08'),
  (17, 17, '2025-02-09'),
  (18, 18, '2025-02-09'),
  (19, 19, '2025-02-10'),
  (20, 20, '2025-02-10'),
  (21, 21, '2025-02-11'),
  (22, 22, '2025-02-12'),
  (23, 23, '2025-02-13'),
  (24, 24, '2025-02-14'),
  (25, 25, '2025-02-15'),
  (26, 26, '2025-02-16'),
  (27, 27, '2025-02-17'),
  (28, 28, '2025-02-18'),
  (29, 29, '2025-02-19'),
  (30, 30, '2025-02-20');

-- ============================================================
-- 17. WISHLIST ITEMS 
-- ============================================================
INSERT INTO wishlist_items (wishlist_id, product_id)
VALUES
  (1,1),(1,15),
  (2,2),(2,17),
  (3,3),(3,4),
  (4,5),(4,6),
  (5,7),(5,22),
  (6,8),(6,23),
  (7,9),(7,20),
  (8,10),(8,11),
  (9,12),(9,26),
  (10,13),(10,24),
  (11,14),(11,28),
  (12,15),(12,16),
  (13,18),(13,19),
  (14,21),(14,25),
  (15,27),(15,30),
  (16,29),(16,1),
  (17,2),(17,3),
  (18,4),(18,5),
  (19,6),(19,7),
  (20,8),(20,9),
  (21,1),(21,29),
  (22,3),(22,30),
  (23,5),(23,13),
  (24,7),(24,15),
  (25,9),(25,19),
  (26,11),(26,21),
  (27,13),(27,25),
  (28,15),(28,27),
  (29,17),(29,29),
  (30,19),(30,3);

-- ============================================================
-- 18. ORDERS
-- ============================================================
INSERT INTO orders
  (order_id, user_id, total_amount, delivery_charge, platform_fee, order_status, ordered_at)
VALUES
  (1,  1,  70998.00, 50,  10, 'placed',     '2025-02-01'),
  (2,  2,  59999.00, 40,  10, 'delivered',  '2025-02-02'),
  (3,  3,  399.00,   20,  5,  'cancelled',  '2025-02-03'),
  (4,  4,  75999.00, 50,  15, 'shipped',    '2025-02-04'),
  (5,  5,  1598.00,  30,  5,  'delivered',  '2025-02-05'),
  (6,  6,  1999.00,  30,  5,  'placed',     '2025-02-06'),
  (7,  7,  2499.00,  25,  5,  'delivered',  '2025-02-07'),
  (8,  8,  2999.00,  40,  5,  'delivered',  '2025-02-08'),
  (9,  9,  999.00,   20,  5,  'placed',     '2025-02-09'),
  (10, 10, 2499.00,  30,  5,  'delivered',  '2025-02-10'),
  (11, 11, 499.00,   20,  5,  'delivered',  '2025-02-11'),
  (12, 12, 19999.00, 100, 20, 'shipped',    '2025-02-12'),
  (13, 13, 1499.00,  25,  5,  'delivered',  '2025-02-13'),
  (14, 14, 2999.00,  40,  5,  'cancelled',  '2025-02-14'),
  (15, 15, 15999.00, 60,  10, 'delivered',  '2025-02-15'),
  (16, 16, 1999.00,  20,  5,  'placed',     '2025-02-16'),
  (17, 17, 2999.00,  40,  5,  'delivered',  '2025-02-17'),
  (18, 18, 799.00,   20,  5,  'delivered',  '2025-02-18'),
  (19, 19, 1999.00,  25,  5,  'placed',     '2025-02-19'),
  (20, 20, 399.00,   20,  5,  'delivered',  '2025-02-20'),
  (21, 21, 2999.00,  40,  5,  'delivered',  '2025-02-21'),
  (22, 22, 2499.00,  30,  5,  'placed',     '2025-02-22'),
  (23, 23, 999.00,   20,  5,  'delivered',  '2025-02-23'),
  (24, 24, 2499.00,  30,  5,  'delivered',  '2025-02-24'),
  (25, 25, 19999.00, 100, 20, 'delivered',  '2025-02-25'),
  (26, 26, 1499.00,  25,  5,  'placed',     '2025-02-26'),
  (27, 27, 2999.00,  40,  5,  'delivered',  '2025-02-27'),
  (28, 28, 15999.00, 60,  10, 'delivered',  '2025-02-28'),
  (29, 29, 799.00,   20,  5,  'cancelled',  '2025-03-01'),
  (30, 30, 69999.00, 80,  15, 'placed',     '2025-03-02');

-- ============================================================
-- 19. ORDER ITEMS  
-- ============================================================
INSERT INTO order_items
  (order_item_id, order_id, variant_id, quantity, price, discount_percent, final_price)
VALUES
  (1,  1,  1,  1, 69999.00, 0.00,  69999.00),
  (2,  1,  6,  2,   799.00, 0.00,   1598.00),
  (3,  2,  3,  1, 59999.00, 5.00,  56999.00),
  (4,  3,  10, 1,   399.00, 0.00,    399.00),
  (5,  4,  5,  1, 75999.00, 10.00, 68399.00),
  (6,  5,  6,  2,   799.00, 0.00,   1598.00),
  (7,  6,  8,  1,  1999.00, 0.00,   1999.00),
  (8,  7,  9,  1,  2499.00, 0.00,   2499.00),
  (9,  8,  11, 1,  2999.00, 0.00,   2999.00),
  (10, 9,  12, 1,   999.00, 0.00,    999.00),
  (11, 10, 13, 1,  2499.00, 0.00,   2499.00),
  (12, 11, 14, 1,   499.00, 0.00,    499.00),
  (13, 12, 15, 1, 19999.00, 0.00,  19999.00),
  (14, 13, 16, 1,  1499.00, 0.00,   1499.00),
  (15, 14, 17, 1,  2999.00, 0.00,   2999.00),
  (16, 15, 18, 1, 15999.00, 0.00,  15999.00),
  (17, 16, 19, 1,  1999.00, 0.00,   1999.00),
  (18, 17, 20, 1,  2999.00, 0.00,   2999.00),
  (19, 18, 6,  1,   799.00, 0.00,    799.00),
  (20, 19, 19, 1,  1999.00, 0.00,   1999.00),
  (21, 20, 10, 1,   399.00, 0.00,    399.00),
  (22, 21, 11, 1,  2999.00, 0.00,   2999.00),
  (23, 22, 9,  1,  2499.00, 0.00,   2499.00),
  (24, 23, 12, 1,   999.00, 0.00,    999.00),
  (25, 24, 13, 1,  2499.00, 0.00,   2499.00),
  (26, 25, 15, 1, 19999.00, 0.00,  19999.00),
  (27, 26, 16, 1,  1499.00, 0.00,   1499.00),
  (28, 27, 11, 1,  2999.00, 0.00,   2999.00),
  (29, 28, 18, 1, 15999.00, 0.00,  15999.00),
  (30, 29, 6,  1,   799.00, 0.00,    799.00),
  (31, 30, 1,  1, 69999.00, 0.00,  69999.00);

-- ============================================================
-- 20. TRANSACTIONS 
-- ============================================================
INSERT INTO transactions
  (transaction_id, order_id, payment_method, payment_status, amount_paid, card_id, upi_id_id)
VALUES
  (1,  1,  'card',   'success', 70998.00, 1,    NULL),
  (2,  2,  'upi',    'success', 56999.00, NULL, 1),
  (3,  3,  'card',   'failed',    399.00, 2,    NULL),
  (4,  4,  'card',   'pending', 68399.00, 3,    NULL),
  (5,  5,  'upi',    'success',  1598.00, NULL, 2),
  (6,  6,  'wallet', 'success',  1999.00, NULL, NULL),
  (7,  7,  'card',   'success',  2499.00, 4,    NULL),
  (8,  8,  'upi',    'success',  2999.00, NULL, 3),
  (9,  9,  'card',   'pending',   999.00, 5,    NULL),
  (10, 10, 'card',   'success',  2499.00, 6,    NULL),
  (11, 11, 'upi',    'success',   499.00, NULL, 4),
  (12, 12, 'card',   'success', 19999.00, 7,    NULL),
  (13, 13, 'upi',    'success',  1499.00, NULL, 5),
  (14, 14, 'card',   'failed',   2999.00, 8,    NULL),
  (15, 15, 'card',   'success', 15999.00, 9,    NULL),
  (16, 16, 'wallet', 'pending',  1999.00, NULL, NULL),
  (17, 17, 'upi',    'success',  2999.00, NULL, 6),
  (18, 18, 'card',   'success',   799.00, 10,   NULL),
  (19, 19, 'card',   'pending',  1999.00, 11,   NULL),
  (20, 20, 'upi',    'success',   399.00, NULL, 7),
  (21, 21, 'card',   'success',  2999.00, 21,   NULL),
  (22, 22, 'upi',    'success',  2499.00, NULL, 8),
  (23, 23, 'card',   'success',   999.00, 23,   NULL),
  (24, 24, 'upi',    'pending',  2499.00, NULL, 9),
  (25, 25, 'card',   'success', 19999.00, 25,   NULL),
  (26, 26, 'wallet', 'success',  1499.00, NULL, NULL),
  (27, 27, 'card',   'success',  2999.00, 27,   NULL),
  (28, 28, 'upi',    'success', 15999.00, NULL, 11),
  (29, 29, 'card',   'failed',    799.00, 29,   NULL),
  (30, 30, 'card',   'pending', 69999.00, 30,   NULL);

-- ============================================================
-- 21. SUPERCOINS WALLET  
-- ============================================================
INSERT INTO sc_wallet (sc_wallet_id, user_id, balance)
VALUES
  (1,  1,  500.00),
  (2,  2,  1000.00),
  (3,  3,  0.00),
  (4,  4,  200.00),
  (5,  5,  300.00),
  (6,  6,  50.00),
  (7,  7,  400.00),
  (8,  8,  600.00),
  (9,  9,  0.00),
  (10, 10, 100.00),
  (11, 11, 250.00),
  (12, 12, 800.00),
  (13, 13, 150.00),
  (14, 14, 0.00),
  (15, 15, 500.00),
  (16, 16, 750.00),
  (17, 17, 200.00),
  (18, 18, 0.00),
  (19, 19, 500.00),
  (20, 20, 150.00),
  (21, 21, 1200.00),
  (22, 22, 300.00),
  (23, 23, 0.00),
  (24, 24, 800.00),
  (25, 25, 2000.00),
  (26, 26, 100.00),
  (27, 27, 600.00),
  (28, 28, 0.00),
  (29, 29, 450.00),
  (30, 30, 1000.00);

-- ============================================================
-- 22. SUPERCOIN TRANSACTIONS  
-- ============================================================
INSERT INTO sc_transactions (sc_transaction_id, sc_wallet_id, order_id, amount, type)
VALUES
  (1,  1,  1,  100.00, 'debit'),
  (2,  2,  2,  200.00, 'debit'),
  (3,  3,  3,  50.00,  'credit'),
  (4,  4,  4,  100.00, 'debit'),
  (5,  5,  5,  50.00,  'debit'),
  (6,  6,  6,  20.00,  'debit'),
  (7,  7,  7,  150.00, 'debit'),
  (8,  8,  8,  200.00, 'debit'),
  (9,  9,  9,  10.00,  'credit'),
  (10, 10, 10, 50.00,  'debit'),
  (11, 11, 11, 100.00, 'debit'),
  (12, 12, 12, 300.00, 'debit'),
  (13, 13, 13, 50.00,  'debit'),
  (14, 14, 14, 30.00,  'credit'),
  (15, 15, 15, 200.00, 'debit'),
  (16, 16, 16, 75.00,  'debit'),
  (17, 17, 17, 150.00, 'debit'),
  (18, 18, 18, 25.00,  'credit'),
  (19, 19, 19, 100.00, 'debit'),
  (20, 20, 20, 20.00,  'credit'),
  (21, 21, 21, 300.00, 'debit'),
  (22, 22, 22, 125.00, 'debit'),
  (23, 23, 23, 50.00,  'credit'),
  (24, 24, 24, 200.00, 'debit'),
  (25, 25, 25, 1000.00,'debit'),
  (26, 26, 26, 75.00,  'debit'),
  (27, 27, 27, 150.00, 'debit'),
  (28, 28, 28, 800.00, 'debit'),
  (29, 29, 29, 40.00,  'credit'),
  (30, 30, 30, 350.00, 'debit');

-- ============================================================
-- 23. SHIPMENTS
-- ============================================================
INSERT INTO shipments
  (shipment_id, order_id, tracking_number, carrier_name, shipped_date, delivered_date, shipment_status)
VALUES
  (1,  1,  'TRK1001', 'Delhivery', NULL,         NULL,         'pending'),
  (2,  2,  'TRK1002', 'BlueDart',  '2025-02-02', '2025-02-04', 'delivered'),
  (3,  4,  'TRK1004', 'Ekart',     '2025-02-04', NULL,         'shipped'),
  (4,  5,  'TRK1005', 'Delhivery', '2025-02-05', '2025-02-07', 'delivered'),
  (5,  6,  'TRK1006', 'BlueDart',  NULL,         NULL,         'pending'),
  (6,  7,  'TRK1007', 'Ekart',     '2025-02-07', '2025-02-09', 'delivered'),
  (7,  8,  'TRK1008', 'Delhivery', '2025-02-08', '2025-02-10', 'delivered'),
  (8,  9,  'TRK1009', 'BlueDart',  NULL,         NULL,         'pending'),
  (9,  10, 'TRK1010', 'Ekart',     '2025-02-10', '2025-02-12', 'delivered'),
  (10, 11, 'TRK1011', 'Delhivery', '2025-02-11', '2025-02-13', 'delivered'),
  (11, 12, 'TRK1012', 'BlueDart',  '2025-02-12', NULL,         'shipped'),
  (12, 13, 'TRK1013', 'Ekart',     '2025-02-13', '2025-02-15', 'delivered'),
  (13, 15, 'TRK1015', 'Delhivery', '2025-02-15', '2025-02-17', 'delivered'),
  (14, 16, 'TRK1016', 'BlueDart',  NULL,         NULL,         'pending'),
  (15, 17, 'TRK1017', 'Ekart',     '2025-02-17', '2025-02-19', 'delivered'),
  (16, 18, 'TRK1018', 'Delhivery', '2025-02-18', '2025-02-20', 'delivered'),
  (17, 19, 'TRK1019', 'BlueDart',  NULL,         NULL,         'pending'),
  (18, 20, 'TRK1020', 'Ekart',     '2025-02-20', '2025-02-22', 'delivered'),
  (19, 21, 'TRK1021', 'Delhivery', '2025-02-21', '2025-02-23', 'delivered'),
  (20, 22, 'TRK1022', 'BlueDart',  NULL,         NULL,         'pending'),
  (21, 23, 'TRK1023', 'Ekart',     '2025-02-23', '2025-02-25', 'delivered'),
  (22, 24, 'TRK1024', 'Delhivery', '2025-02-24', '2025-02-26', 'delivered'),
  (23, 25, 'TRK1025', 'BlueDart',  '2025-02-25', '2025-02-27', 'delivered'),
  (24, 26, 'TRK1026', 'Ekart',     NULL,         NULL,         'pending'),
  (25, 27, 'TRK1027', 'Delhivery', '2025-02-27', '2025-03-01', 'delivered'),
  (26, 28, 'TRK1028', 'BlueDart',  '2025-02-28', '2025-03-02', 'delivered'),
  (27, 30, 'TRK1030', 'Ekart',     NULL,         NULL,         'pending');

-- ============================================================
-- 24. REVIEWS 
-- ============================================================
INSERT INTO reviews (review_id, user_id, product_id, rating, review_text)
VALUES
  (1,  1,  1,  5, 'Excellent product'),
  (2,  2,  3,  4, 'Good but pricey'),
  (3,  3,  10, 2, 'Not satisfied'),
  (4,  4,  5,  5, 'Worth every rupee'),
  (5,  5,  6,  4, 'Nice quality'),
  (6,  6,  8,  3, 'Average'),
  (7,  7,  9,  5, 'Loved it'),
  (8,  8,  11, 4, 'Very good'),
  (9,  9,  12, 2, 'Poor quality'),
  (10, 10, 13, 5, 'Amazing'),
  (11, 11, 14, 3, 'Okayish'),
  (12, 12, 15, 5, 'Best purchase'),
  (13, 13, 16, 4, 'Good'),
  (14, 14, 17, 1, 'Terrible'),
  (15, 15, 18, 5, 'Fantastic'),
  (16, 16, 19, 3, 'Average'),
  (17, 17, 20, 4, 'Nice'),
  (18, 18, 6,  5, 'Excellent'),
  (19, 19, 19, 2, 'Not great'),
  (20, 20, 10, 4, 'Good value'),
  (21, 21, 2,  4, 'Great camera and performance'),
  (22, 22, 4,  5, 'Powerful laptop, love it'),
  (23, 23, 14, 3, 'Decent content for beginners'),
  (24, 24, 20, 4, 'Works well, good build quality'),
  (25, 25, 29, 5, 'Charges very fast, great capacity'),
  (26, 26, 25, 4, 'Good grip and bounce'),
  (27, 27, 21, 3, 'Fits true to size'),
  (28, 28, 27, 5, 'Sturdy and elegant design'),
  (29, 29, 24, 4, 'Very comfortable for long hours'),
  (30, 30, 30, 5, 'Amazing gaming experience');

-- ============================================================
-- 25. RETURNS
-- ============================================================
INSERT INTO returns (return_id, order_item_id, reason, status)
VALUES
  (1,  2,  'Damaged',           'approved'),
  (2,  5,  'Size issue',        'approved'),
  (3,  7,  'Not needed',        'rejected'),
  (4,  8,  'Wrong item',        'approved'),
  (5,  10, 'Defective',         'approved'),
  (6,  11, 'Not satisfied',     'rejected'),
  (7,  13, 'Damaged',           'approved'),
  (8,  15, 'Wrong size',        'approved'),
  (9,  17, 'Late delivery',     'approved'),
  (10, 18, 'Quality issue',     'approved'),
  (11, 20, 'Not needed',        'rejected'),
  (12, 21, 'Damaged',           'approved'),
  (13, 23, 'Wrong item',        'approved'),
  (14, 24, 'Size issue',        'approved'),
  (15, 25, 'Defective',         'approved'),
  (16, 27, 'Late delivery',     'requested'),
  (17, 28, 'Not as described',  'approved'),
  (18, 29, 'Defective',         'completed'),
  (19, 26, 'Changed mind',      'rejected'),
  (20, 31, 'Wrong item',        'requested');