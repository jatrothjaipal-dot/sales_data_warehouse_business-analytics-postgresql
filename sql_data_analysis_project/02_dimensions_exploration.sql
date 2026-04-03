
/*
===============================================================================
Dimensions Exploration
===============================================================================
Purpose:
    Explore dimension tables and distinct business categories.
===============================================================================
*/

------------------------------------------------------------
-- Unique countries
------------------------------------------------------------

SELECT DISTINCT
    country
FROM gold.dim_customers
ORDER BY country;

------------------------------------------------------------
-- Unique category, subcategory, product
------------------------------------------------------------

SELECT DISTINCT
    category,
    subcategory,
    product_name
FROM gold.dim_products
ORDER BY category, subcategory, product_name;
