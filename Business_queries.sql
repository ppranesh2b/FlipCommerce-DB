-- ============================================================
--  FlipCommerce DB — Business-Oriented Analytical Queries
--  Database :  FlipCommerce_DB
--  Purpose  : Simulate real-world business intelligence reports
--             that an e-commerce analytics or data team would run.
-- ============================================================
 
use  FlipCommerce_DB;
-- ============================================================
-- SECTION 1 — REVENUE & GMV ANALYSIS
-- ============================================================

-- Query 1: Total Gross Merchandise Value (GMV)
-- Business Use: Top-level KPI — how much did the platform sell in total?
-- Note: GMV = sum of final_price × quantity for all non-cancelled orders.
SELECT
    ROUND(SUM(oi.final_price * oi.quantity), 2) AS total_gmv
FROM order_items oi
JOIN orders o ON o.order_id = oi.order_id
WHERE o.order_status != 'cancelled';

-- --------------------------------------------------------

-- Query 2: Monthly Revenue Trend
-- Business Use: Identify growth, seasonal spikes, and slowdowns over time.
SELECT
    DATE_FORMAT(o.ordered_at, '%Y-%m')       AS month,
    COUNT(DISTINCT o.order_id)               AS total_orders,
    ROUND(SUM(oi.final_price * oi.quantity), 2) AS monthly_revenue
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
WHERE o.order_status != 'cancelled'
GROUP BY month
ORDER BY month;

-- --------------------------------------------------------

-- Query 3: Revenue by Product Category
-- Business Use: Decide which categories deserve more investment or promotion.
SELECT
    pc.category_name,
    COUNT(DISTINCT oi.order_item_id)             AS items_sold,
    ROUND(SUM(oi.final_price * oi.quantity), 2)  AS category_revenue
FROM order_items oi
JOIN orders o   ON o.order_id    = oi.order_id
JOIN variants v ON v.variant_id  = oi.variant_id
JOIN products p ON p.product_id  = v.product_id
JOIN product_categories pc ON pc.category_id = p.category_id
WHERE o.order_status != 'cancelled'
GROUP BY pc.category_id, pc.category_name
ORDER BY category_revenue DESC;

-- --------------------------------------------------------

-- Query 4: Average Order Value (AOV)
-- Business Use: Benchmark for upsell / cross-sell effectiveness.
SELECT
    ROUND(SUM(oi.final_price * oi.quantity) / COUNT(DISTINCT o.order_id), 2) AS avg_order_value
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
WHERE o.order_status != 'cancelled';

-- --------------------------------------------------------

-- Query 5: Revenue by Physical vs Digital Products
-- Business Use: Understand product-type contribution and margin difference.
SELECT
    p.product_type,
    COUNT(DISTINCT oi.order_item_id)             AS items_sold,
    ROUND(SUM(oi.final_price * oi.quantity), 2)  AS revenue
FROM order_items oi
JOIN orders o   ON o.order_id   = oi.order_id
JOIN variants v ON v.variant_id = oi.variant_id
JOIN products p ON p.product_id = v.product_id
WHERE o.order_status != 'cancelled'
GROUP BY p.product_type;

-- ============================================================
-- SECTION 2 — SELLER PERFORMANCE
-- ============================================================

-- Query 6: Top Sellers by Revenue
-- Business Use: Identify high-value seller partners for priority support & deals.
SELECT
    s.seller_id,
    s.display_name,
    COUNT(DISTINCT o.order_id)                   AS total_orders,
    ROUND(SUM(oi.final_price * oi.quantity), 2)  AS seller_revenue
FROM sellers s
JOIN products p  ON p.seller_id  = s.seller_id
JOIN variants v  ON v.product_id = p.product_id
JOIN order_items oi ON oi.variant_id = v.variant_id
JOIN orders o   ON o.order_id = oi.order_id
WHERE o.order_status != 'cancelled'
GROUP BY s.seller_id, s.display_name
ORDER BY seller_revenue DESC;

-- --------------------------------------------------------

-- Query 7: Seller Return Rate
-- Business Use: Flag sellers with high return rates for quality review.
SELECT
    s.display_name,
    COUNT(DISTINCT oi.order_item_id)  AS total_items_sold,
    COUNT(DISTINCT r.return_id)       AS total_returns,
    ROUND(
        COUNT(DISTINCT r.return_id) * 100.0 / COUNT(DISTINCT oi.order_item_id),
        2
    )                                 AS return_rate_pct
FROM sellers s
JOIN products p  ON p.seller_id  = s.seller_id
JOIN variants v  ON v.product_id = p.product_id
JOIN order_items oi ON oi.variant_id = v.variant_id
JOIN orders o   ON o.order_id = oi.order_id AND o.order_status != 'cancelled'
LEFT JOIN returns r ON r.order_item_id = oi.order_item_id
GROUP BY s.seller_id, s.display_name
ORDER BY return_rate_pct DESC;

-- --------------------------------------------------------

-- Query 8: Sellers with Unverified or Rejected Bank Accounts
-- Business Use: Finance / compliance — block payouts until verification is done.
SELECT
    s.display_name,
    s.seller_status,
    sba.bank_account_number,
    sba.bank_ifsc_code,
    sba.verification_status
FROM sellers s
JOIN seller_bank_accounts sba ON sba.seller_id = s.seller_id
WHERE sba.verification_status IN ('pending', 'rejected')
ORDER BY sba.verification_status;

-- ============================================================
-- SECTION 3 — PRODUCT & INVENTORY ANALYTICS
-- ============================================================

-- Query 9: Top 10 Best-Selling Products by Revenue
-- Business Use: Drive homepage placement, advertising bids, and stock replenishment.
SELECT
    p.product_name,
    s.display_name                              AS seller,
    SUM(oi.quantity)                            AS units_sold,
    ROUND(SUM(oi.final_price * oi.quantity), 2) AS product_revenue
FROM order_items oi
JOIN orders o   ON o.order_id   = oi.order_id
JOIN variants v ON v.variant_id = oi.variant_id
JOIN products p ON p.product_id = v.product_id
JOIN sellers  s ON s.seller_id  = p.seller_id
WHERE o.order_status != 'cancelled'
GROUP BY p.product_id, p.product_name, s.display_name
ORDER BY product_revenue DESC
LIMIT 10;

-- --------------------------------------------------------

-- Query 10: Low Stock Alert (Available Stock < 10 Units)
-- Business Use: Trigger restock requests before stockouts cause lost sales.
SELECT
    p.product_name,
    v.sku,
    i.stock_quantity,
    i.reserved_quantity,
    (i.stock_quantity - i.reserved_quantity) AS available_stock
FROM inventories i
JOIN variants v ON v.variant_id = i.variant_id
JOIN products p ON p.product_id = v.product_id
WHERE (i.stock_quantity - i.reserved_quantity) < 10
ORDER BY available_stock ASC;

-- --------------------------------------------------------

-- Query 11: Products That Have Never Been Ordered
-- Business Use: Identify dead stock / listing issues to clean the catalog.
SELECT
    p.product_id,
    p.product_name,
    p.brand,
    pc.category_name,
    s.display_name AS seller
FROM products p
JOIN product_categories pc ON pc.category_id = p.category_id
JOIN sellers s ON s.seller_id = p.seller_id
WHERE p.product_id NOT IN (
    SELECT DISTINCT v.product_id
    FROM order_items oi
    JOIN variants v ON v.variant_id = oi.variant_id
);

-- --------------------------------------------------------

-- Query 12: Most Wishlisted Products Never Purchased
-- Business Use: Conversion opportunity — target with discount or re-engagement campaign.
SELECT
    p.product_name,
    COUNT(wi.wishlist_id) AS wishlist_count
FROM wishlist_items wi
JOIN products p ON p.product_id = wi.product_id
WHERE p.product_id NOT IN (
    SELECT DISTINCT v.product_id
    FROM order_items oi
    JOIN variants v ON v.variant_id = oi.variant_id
    JOIN orders o ON o.order_id = oi.order_id
    WHERE o.order_status NOT IN ('cancelled')
)
GROUP BY p.product_id, p.product_name
ORDER BY wishlist_count DESC;

-- ============================================================
-- SECTION 4 — CUSTOMER ANALYTICS
-- ============================================================

-- Query 13: Top 10 Customers by Lifetime Spend
-- Business Use: Identify VIP / high-value customers for loyalty programmes.
SELECT
    u.user_id,
    CONCAT(u.first_name, ' ', COALESCE(u.last_name,'')) AS customer_name,
    u.email,
    COUNT(DISTINCT o.order_id)                          AS total_orders,
    ROUND(SUM(oi.final_price * oi.quantity), 2)         AS lifetime_value
FROM users u
JOIN orders o   ON o.user_id   = u.user_id
JOIN order_items oi ON oi.order_id = o.order_id
WHERE o.order_status != 'cancelled'
GROUP BY u.user_id, customer_name, u.email
ORDER BY lifetime_value DESC
LIMIT 10;

-- --------------------------------------------------------

-- Query 14: Customers with Abandoned Carts (Items in Cart, No Orders)
-- Business Use: Trigger cart-abandonment email / push notification campaigns.
SELECT
    u.user_id,
    CONCAT(u.first_name, ' ', COALESCE(u.last_name,'')) AS customer_name,
    u.email,
    COUNT(ci.variant_id) AS cart_item_count
FROM users u
JOIN carts c      ON c.user_id = u.user_id
JOIN cart_items ci ON ci.cart_id = c.cart_id
WHERE u.user_id NOT IN (
    SELECT DISTINCT user_id FROM orders
)
GROUP BY u.user_id, customer_name, u.email
ORDER BY cart_item_count DESC;

-- --------------------------------------------------------

-- Query 15: Customer Repeat Purchase Rate
-- Business Use: Measure loyalty — what percentage of customers placed more than one order?
SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN order_count > 1 THEN 1 ELSE 0 END) AS repeat_customers,
    ROUND(
        SUM(CASE WHEN order_count > 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS repeat_rate_pct
FROM (
    SELECT user_id, COUNT(order_id) AS order_count
    FROM orders
    WHERE order_status != 'cancelled'
    GROUP BY user_id
) order_counts;

-- --------------------------------------------------------

-- Query 16: City-wise Order Volume
-- Business Use: Geographic demand analysis to optimize logistics and marketing.
SELECT
    a.city,
    a.state,
    COUNT(DISTINCT o.order_id)                  AS total_orders,
    ROUND(SUM(oi.final_price * oi.quantity), 2) AS city_revenue
FROM addresses a
JOIN users u ON u.user_id = a.user_id
JOIN orders o ON o.user_id = u.user_id
JOIN order_items oi ON oi.order_id = o.order_id
WHERE o.order_status != 'cancelled'
  AND a.is_default = TRUE
GROUP BY a.city, a.state
ORDER BY total_orders DESC;

-- ============================================================
-- SECTION 5 — PAYMENT ANALYTICS
-- ============================================================

-- Query 17: Payment Method Distribution
-- Business Use: Understand channel mix — inform UPI discount strategies.
SELECT
    payment_method,
    COUNT(*)                               AS transaction_count,
    ROUND(SUM(amount_paid), 2)             AS total_amount,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    )                                      AS share_pct
FROM transactions
WHERE payment_status = 'success'
GROUP BY payment_method
ORDER BY transaction_count DESC;

-- --------------------------------------------------------

-- Query 18: Failed and Pending Payments with Order Details
-- Business Use: Finance team — follow up on incomplete payments and lost revenue.
SELECT
    t.transaction_id,
    o.order_id,
    CONCAT(u.first_name, ' ', COALESCE(u.last_name,'')) AS customer,
    t.payment_method,
    t.payment_status,
    t.amount_paid,
    o.ordered_at
FROM transactions t
JOIN orders o ON o.order_id = t.order_id
JOIN users  u ON u.user_id  = o.user_id
WHERE t.payment_status IN ('failed','pending')
ORDER BY o.ordered_at DESC;

-- ============================================================
-- SECTION 6 — LOGISTICS & OPERATIONS
-- ============================================================

-- Query 19: Pending Shipments Dashboard
-- Business Use: Operations team — track orders stuck in 'pending' state.
SELECT
    sh.shipment_id,
    sh.tracking_number,
    o.order_id,
    CONCAT(u.first_name, ' ', COALESCE(u.last_name,'')) AS customer,
    o.ordered_at,
    sh.carrier_name,
    sh.shipment_status
FROM shipments sh
JOIN orders o ON o.order_id = sh.order_id
JOIN users  u ON u.user_id  = o.user_id
WHERE sh.shipment_status = 'pending'
ORDER BY o.ordered_at;

-- --------------------------------------------------------

-- Query 20: Average Delivery Time by Carrier
-- Business Use: SLA monitoring — identify slow carriers for contract review.
SELECT
    carrier_name,
    COUNT(*) AS deliveries,
    ROUND(AVG(DATEDIFF(delivered_date, shipped_date)), 1) AS avg_delivery_days
FROM shipments
WHERE shipment_status = 'delivered'
  AND shipped_date IS NOT NULL
  AND delivered_date IS NOT NULL
GROUP BY carrier_name
ORDER BY avg_delivery_days;

-- ============================================================
-- SECTION 7 — RETURNS ANALYTICS
-- ============================================================

-- Query 21: Return Rate by Product Category
-- Business Use: Quality control — which categories drive the most returns?
SELECT
    pc.category_name,
    COUNT(DISTINCT oi.order_item_id) AS items_sold,
    COUNT(DISTINCT r.return_id)      AS returns_raised,
    ROUND(
        COUNT(DISTINCT r.return_id) * 100.0 / COUNT(DISTINCT oi.order_item_id),
        2
    )                                AS return_rate_pct
FROM order_items oi
JOIN orders o   ON o.order_id    = oi.order_id AND o.order_status != 'cancelled'
JOIN variants v ON v.variant_id  = oi.variant_id
JOIN products p ON p.product_id  = v.product_id
JOIN product_categories pc ON pc.category_id = p.category_id
LEFT JOIN returns r ON r.order_item_id = oi.order_item_id
GROUP BY pc.category_id, pc.category_name
ORDER BY return_rate_pct DESC;

-- --------------------------------------------------------

-- Query 22: Top Return Reasons
-- Business Use: Product / logistics improvement — where are the pain points?
SELECT
    reason,
    status,
    COUNT(*) AS occurrences
FROM returns
GROUP BY reason, status
ORDER BY occurrences DESC;

-- ============================================================
-- SECTION 8 — PRODUCT RATINGS
-- ============================================================

-- Query 23: Average Rating per Product with Review Count
-- Business Use: Surface highly rated products for homepage and search ranking.
SELECT
    p.product_name,
    s.display_name           AS seller,
    COUNT(r.review_id)       AS review_count,
    ROUND(AVG(r.rating), 2)  AS avg_rating
FROM reviews r
JOIN products p ON p.product_id = r.product_id
JOIN sellers  s ON s.seller_id  = p.seller_id
GROUP BY p.product_id, p.product_name, s.display_name
HAVING review_count >= 1
ORDER BY avg_rating DESC, review_count DESC;

-- ============================================================
-- SECTION 9 — LOYALTY / WALLET
-- ============================================================

-- Query 24: SuperCoin Wallet Balance Leaderboard
-- Business Use: Identify high-loyalty users for tiered benefits (Plus, Gold).
SELECT
    u.user_id,
    CONCAT(u.first_name, ' ', COALESCE(u.last_name,'')) AS customer,
    w.balance AS supercoin_balance
FROM sc_wallet w
JOIN users u ON u.user_id = w.user_id
ORDER BY w.balance DESC
LIMIT 10;

-- ============================================================
-- SECTION 10 — DISCOUNT ANALYSIS
-- ============================================================

-- Query 25: Discounted vs Non-Discounted Order Revenue Split
-- Business Use: Assess whether discounts drive revenue volume or erode margins.
SELECT
    CASE
        WHEN discount_percent > 0 THEN 'Discounted'
        ELSE 'Full Price'
    END                                                 AS price_type,
    COUNT(*)                                            AS item_count,
    ROUND(SUM(price * quantity), 2)                     AS gross_revenue,
    ROUND(SUM(final_price * quantity), 2)               AS net_revenue,
    ROUND(
        (SUM(price * quantity) - SUM(final_price * quantity)) / SUM(price * quantity) * 100,
        2
    )                                                   AS avg_discount_applied_pct
FROM order_items
GROUP BY price_type;