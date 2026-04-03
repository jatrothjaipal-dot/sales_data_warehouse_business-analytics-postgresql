
/*
===============================================================================
Date Range Exploration
===============================================================================
Purpose:
    Check first date, last date and customer age range.
===============================================================================
*/

------------------------------------------------------------
-- Order date range
------------------------------------------------------------

SELECT
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    EXTRACT(MONTH FROM AGE(MAX(order_date), MIN(order_date))) +
    EXTRACT(YEAR FROM AGE(MAX(order_date), MIN(order_date))) * 12 AS order_range_months
FROM gold.fact_sales;

------------------------------------------------------------
-- Oldest and youngest customer
------------------------------------------------------------

SELECT
    MIN(birthdate) AS oldest_birthdate,
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, MIN(birthdate))) AS oldest_age,
    MAX(birthdate) AS youngest_birthdate,
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, MAX(birthdate))) AS youngest_age
FROM gold.dim_customers;
