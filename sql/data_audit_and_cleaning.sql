-- DATA AUDIT & QUALITY CONTROL
-- Dataset: theLook eCommerce (PostgreSQL)

-- 1. Check for Duplicate Orders
-- Ensuring that each order_id is unique to avoid revenue inflation
SELECT order_id, COUNT(*)
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

-- 2. Handling NULL Values in Critical Fields
-- Checking if there are any orders without a user or status
SELECT COUNT(*) AS missing_critical_data
FROM orders
WHERE order_id IS NULL 
   OR user_id IS NULL 
   OR status IS NULL;

-- 3. Logical Date Validation
-- An order cannot be delivered before it is created.
-- This query checks for logical inconsistencies in the supply chain data.
SELECT *
FROM orders
WHERE delivered_at < created_at 
   OR shipped_at < created_at;

-- 4. Price & Cost Sanity Check
-- Products should not have a negative or zero cost/retail price.
SELECT id, name, cost, retail_price
FROM products
WHERE cost <= 0 OR retail_price <= 0;

-- 5. Referential Integrity Check
-- Checking if there are any order_items pointing to non-existent products
SELECT COUNT(*) AS orphaned_records
FROM order_items oi
LEFT JOIN products p ON oi.product_id = p.id
WHERE p.id IS NULL;

-- 6. Handling "Ghost" Sessions (Events)
-- Removing or identifying web events that aren't linked to a user (if applicable)
-- This helps in cleaning up traffic analysis for the dashboard.
DELETE FROM events 
WHERE user_id IS NULL AND session_id IS NULL;
