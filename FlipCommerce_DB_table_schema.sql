-- ============================================================
--  FlipCommerce DB — E-Commerce Platform Database Schema
--  Database  : FlipCommerce_DB
--  Engine    : MySQL 8.0+
--  Encoding  : utf8mb4

-- ============================================================
create schema FlipCommerce_DB;
use FlipCommerce_DB;
-- ================= USERS =================
CREATE TABLE users (
  user_id         BIGINT        PRIMARY KEY AUTO_INCREMENT,
  first_name      VARCHAR(50)   NOT NULL,
  last_name       VARCHAR(50),
  email           VARCHAR(100)  NOT NULL UNIQUE,
  mobile_number   CHAR(10)      NOT NULL UNIQUE,
  password_hash   VARCHAR(255)  NOT NULL,
  account_status  ENUM('active','inactive','suspended') DEFAULT 'active',
  created_at      TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
  updated_at      TIMESTAMP     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ================= CARDS =================
CREATE TABLE cards (
  card_id           BIGINT      PRIMARY KEY AUTO_INCREMENT,
  user_id           BIGINT      NOT NULL,
  card_number_last4 CHAR(4)     NOT NULL,
  valid_thru        DATE        NOT NULL,
  card_type         ENUM('credit','debit') NOT NULL,
  issuing_bank      VARCHAR(100),
  card_network      ENUM('visa','mastercard','rupay','amex'),
  card_holder_name  VARCHAR(100),
  card_status       ENUM('active','expired','blocked') DEFAULT 'active',
  created_at        TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- ================= UPI =================
CREATE TABLE upi_ids (
  upi_id_id   BIGINT       PRIMARY KEY AUTO_INCREMENT,
  user_id     BIGINT       NOT NULL,
  upi_id      VARCHAR(100) NOT NULL UNIQUE,   -- e.g. username@okhdfc
  provider    VARCHAR(50),                    -- gpay | phonepe | paytm
  created_at  TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- ================= SELLERS =================
CREATE TABLE sellers (
  seller_id         BIGINT       PRIMARY KEY AUTO_INCREMENT,
  full_name         VARCHAR(100) NOT NULL,
  display_name      VARCHAR(100),
  email             VARCHAR(100) UNIQUE,
  mobile_number     CHAR(10)     UNIQUE,
  pan_id            CHAR(10)     UNIQUE,
  gstin_id          VARCHAR(15)  UNIQUE,
  store_description TEXT,
  seller_status     ENUM('active','inactive','blocked') DEFAULT 'active',
  created_at        TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
  updated_at        TIMESTAMP    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ================= SELLER ADDRESS =================
-- Physical locations (warehouse / office / pickup point) for each seller.
CREATE TABLE seller_address (
  seller_address_id BIGINT       PRIMARY KEY AUTO_INCREMENT,
  seller_id         BIGINT       NOT NULL,
  address_line1     VARCHAR(255),
  street            VARCHAR(255),
  city              VARCHAR(100),
  state             VARCHAR(100),
  landmark          VARCHAR(255),
  pincode           CHAR(6),
  country           VARCHAR(50)  DEFAULT 'India',
  address_type      ENUM('warehouse','office','pickup') DEFAULT 'warehouse',
  FOREIGN KEY (seller_id) REFERENCES sellers(seller_id)
);

-- ================= SELLER BANK =================
CREATE TABLE seller_bank_accounts (
  account_id           BIGINT      PRIMARY KEY AUTO_INCREMENT,
  seller_id            BIGINT      NOT NULL,
  account_holder_name  VARCHAR(100) NOT NULL,
  bank_account_number  VARCHAR(30)  NOT NULL,
  bank_ifsc_code       CHAR(11)     NOT NULL,
  is_primary           BOOLEAN      DEFAULT FALSE,
  verification_status  ENUM('pending','verified','rejected') DEFAULT 'pending',
  created_at           TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (seller_id) REFERENCES sellers(seller_id)
);

-- ================= CATEGORY =================
CREATE TABLE product_categories (
  category_id        BIGINT       PRIMARY KEY AUTO_INCREMENT,
  category_name      VARCHAR(100) NOT NULL,
  parent_category_id BIGINT,
  FOREIGN KEY (parent_category_id) REFERENCES product_categories(category_id)
);

-- ================= PRODUCTS =================
CREATE TABLE products (
  product_id   BIGINT       PRIMARY KEY AUTO_INCREMENT,
  product_name VARCHAR(150) NOT NULL,
  category_id  BIGINT,
  seller_id    BIGINT       NOT NULL,
  product_type ENUM('physical','digital') DEFAULT 'physical',
  description  TEXT,
  brand        VARCHAR(100),
  created_at   TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
  updated_at   TIMESTAMP    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (category_id) REFERENCES product_categories(category_id),
  FOREIGN KEY (seller_id)   REFERENCES sellers(seller_id)
);

-- ================= VARIANTS =================
CREATE TABLE variants (
  variant_id BIGINT         PRIMARY KEY AUTO_INCREMENT,
  product_id BIGINT         NOT NULL,
  sku        VARCHAR(100)   UNIQUE,
  price      DECIMAL(10,2)  NOT NULL,
  created_at TIMESTAMP      DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ================= INVENTORY =================
CREATE TABLE inventories (
  inventory_id      BIGINT        PRIMARY KEY AUTO_INCREMENT,
  variant_id        BIGINT        NOT NULL,
  stock_quantity    INT UNSIGNED  DEFAULT 0,
  reserved_quantity INT UNSIGNED  DEFAULT 0,
  updated_at        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (variant_id) REFERENCES variants(variant_id)
);

-- ================= ATTRIBUTES =================
CREATE TABLE product_attributes (
  attribute_id   BIGINT       PRIMARY KEY AUTO_INCREMENT,
  attribute_name VARCHAR(100) NOT NULL
);

CREATE TABLE variant_attribute_values (
  variant_id       BIGINT,
  attribute_id     BIGINT,
  attribute_value  VARCHAR(100),
  PRIMARY KEY (variant_id, attribute_id),
  FOREIGN KEY (variant_id)   REFERENCES variants(variant_id),
  FOREIGN KEY (attribute_id) REFERENCES product_attributes(attribute_id)
);

-- ================= ADDRESSES =================
-- NOTE: `address_type` added to match data (home / work / other).
CREATE TABLE addresses (
  address_id     BIGINT       PRIMARY KEY AUTO_INCREMENT,
  user_id        BIGINT,
  recipient_name VARCHAR(100),
  street         VARCHAR(255),
  city           VARCHAR(100),
  state          VARCHAR(100),
  pincode        CHAR(6),
  country        VARCHAR(50)  DEFAULT 'India',
  phone          CHAR(10),
  address_type   ENUM('home','work','other') DEFAULT 'home',
  is_default     BOOLEAN      DEFAULT FALSE,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- ================= CART =================
CREATE TABLE carts (
  cart_id    BIGINT    PRIMARY KEY AUTO_INCREMENT,
  user_id    BIGINT    NOT NULL UNIQUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE cart_items (
  cart_id    BIGINT,
  variant_id BIGINT,
  quantity   INT UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (cart_id, variant_id),
  FOREIGN KEY (cart_id)    REFERENCES carts(cart_id),
  FOREIGN KEY (variant_id) REFERENCES variants(variant_id)
);

-- ================= WISHLIST =================
CREATE TABLE wishlists (
  wishlist_id BIGINT    PRIMARY KEY AUTO_INCREMENT,
  user_id     BIGINT    UNIQUE,
  created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE wishlist_items (
  wishlist_id BIGINT,
  product_id  BIGINT,
  PRIMARY KEY (wishlist_id, product_id),
  FOREIGN KEY (wishlist_id) REFERENCES wishlists(wishlist_id),
  FOREIGN KEY (product_id)  REFERENCES products(product_id)
);

-- ================= ORDERS =================
CREATE TABLE orders (
  order_id      BIGINT         PRIMARY KEY AUTO_INCREMENT,
  user_id       BIGINT         NOT NULL,
  total_amount  DECIMAL(10,2)  NOT NULL,
  delivery_charge DECIMAL(10,2) DEFAULT 0,
  platform_fee  DECIMAL(10,2)  DEFAULT 0,
  order_status  ENUM('placed','shipped','delivered','cancelled') DEFAULT 'placed',
  ordered_at    TIMESTAMP      DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- ================= ORDER ITEMS =================
CREATE TABLE order_items (
  order_item_id    BIGINT         PRIMARY KEY AUTO_INCREMENT,
  order_id         BIGINT         NOT NULL,
  variant_id       BIGINT         NOT NULL,
  quantity         INT UNSIGNED   NOT NULL,
  price            DECIMAL(10,2)  NOT NULL,
  discount_percent DECIMAL(5,2)   DEFAULT 0,
  final_price      DECIMAL(10,2)  NOT NULL,
  FOREIGN KEY (order_id)   REFERENCES orders(order_id),
  FOREIGN KEY (variant_id) REFERENCES variants(variant_id)
);

-- ================= PAYMENTS =================
CREATE TABLE transactions (
  transaction_id BIGINT        PRIMARY KEY AUTO_INCREMENT,
  order_id       BIGINT        NOT NULL,
  payment_method ENUM('card','upi','wallet') NOT NULL,
  payment_status ENUM('success','pending','failed') DEFAULT 'pending',
  amount_paid    DECIMAL(10,2) NOT NULL,
  card_id        BIGINT,
  upi_id_id      BIGINT,
  created_at     TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (order_id)   REFERENCES orders(order_id),
  FOREIGN KEY (card_id)    REFERENCES cards(card_id),
  FOREIGN KEY (upi_id_id)  REFERENCES upi_ids(upi_id_id)
);

-- ================= SUPERCOINS WALLET =================
CREATE TABLE sc_wallet (
  sc_wallet_id BIGINT         PRIMARY KEY AUTO_INCREMENT,
  user_id      BIGINT         UNIQUE,
  balance      DECIMAL(10,2)  DEFAULT 0,
  updated_at   TIMESTAMP      DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE sc_transactions (
  sc_transaction_id BIGINT        PRIMARY KEY AUTO_INCREMENT,
  sc_wallet_id      BIGINT,
  order_id          BIGINT,
  amount            DECIMAL(10,2),
  type              ENUM('credit','debit'),
  created_at        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (sc_wallet_id) REFERENCES sc_wallet(sc_wallet_id),
  FOREIGN KEY (order_id)     REFERENCES orders(order_id)
);

-- ================= SHIPMENTS =================
CREATE TABLE shipments (
  shipment_id     BIGINT       PRIMARY KEY AUTO_INCREMENT,
  order_id        BIGINT,
  tracking_number VARCHAR(100),
  carrier_name    VARCHAR(100),
  shipped_date    DATETIME,
  delivered_date  DATETIME,
  shipment_status ENUM('pending','shipped','delivered') DEFAULT 'pending',
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- ================= REVIEWS =================
CREATE TABLE reviews (
  review_id   BIGINT     PRIMARY KEY AUTO_INCREMENT,
  user_id     BIGINT,
  product_id  BIGINT,
  rating      TINYINT    CHECK (rating BETWEEN 1 AND 5),
  review_text TEXT,
  created_at  TIMESTAMP  DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id)    REFERENCES users(user_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ================= RETURNS =================
CREATE TABLE returns (
  return_id     BIGINT     PRIMARY KEY AUTO_INCREMENT,
  order_item_id BIGINT,
  reason        TEXT,
  status        ENUM('requested','approved','rejected','completed') DEFAULT 'requested',
  created_at    TIMESTAMP  DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (order_item_id) REFERENCES order_items(order_item_id)
);