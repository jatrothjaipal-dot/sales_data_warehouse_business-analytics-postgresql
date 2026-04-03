
/*
===============================================================================
Measures Exploration (Key Metrics)
===============================================================================
Purpose:
    Calculate overall business metrics.
===============================================================================
*/

------------------------------------------------------------
-- Total Sales
------------------------------------------------------------

SELECT SUM(sales_amount) AS total_sales
FROM gold.fact_sales;

------------------------------------------------------------
-- Total Quantity
------------------------------------------------------------

SELECT SUM(quantity) AS total_quantity
FROM gold.fact_sales;

------------------------------------------------------------
-- Average Price
------------------------------------------------------------

SELECT AVG(price) AS avg_price
FROM gold.fact_sales;

------------------------------------------------------------
-- Total Orders
------------------------------------------------------------

SELECT COUNT(order_number) AS total_orders
FROM gold.fact_sales;

SELECT COUNT(DISTINCT order_number) AS total_orders
FROM gold.fact_sales;

------------------------------------------------------------
-- Total Products
------------------------------------------------------------

SELECT COUNT(product_name) AS total_products
FROM gold.dim_products;

------------------------------------------------------------
-- Total Customers
------------------------------------------------------------

SELECT COUNT(customer_key) AS total_customers
FROM gold.dim_customers;

------------------------------------------------------------
-- Customers who placed orders
------------------------------------------------------------

SELECT COUNT(DISTINCT customer_key) AS total_customers
FROM gold.fact_sales;

------------------------------------------------------------
-- KPI Summary Report
------------------------------------------------------------

SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity', SUM(quantity) FROM gold.fact_sales
UNION ALL
SELECT 'Average Price', AVG(price) FROM gold.fact_sales
UNION ALL
SELECT 'Total Orders', COUNT(DISTINCT order_number) FROM gold.fact_sales
UNION ALL
SELECT 'Total Products', COUNT(DISTINCT product_name) FROM gold.dim_products
UNION ALL
SELECT 'Total Customers', COUNT(customer_key) FROM gold.dim_customers;
