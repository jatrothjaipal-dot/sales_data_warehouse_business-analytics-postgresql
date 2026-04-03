
/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    Creates schemas and loads gold tables in PostgreSQL.
=============================================================
*/

CREATE SCHEMA IF NOT EXISTS gold;

------------------------------------------------------------
-- gold.dim_customers
------------------------------------------------------------

DROP TABLE IF EXISTS gold.dim_customers;

CREATE TABLE gold.dim_customers(
    customer_key INT,
    customer_id INT,
    customer_number VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    country VARCHAR(50),
    marital_status VARCHAR(50),
    gender VARCHAR(50),
    birthdate DATE,
    create_date DATE
);

------------------------------------------------------------
-- gold.dim_products
------------------------------------------------------------

DROP TABLE IF EXISTS gold.dim_products;

CREATE TABLE gold.dim_products(
    product_key INT,
    product_id INT,
    product_number VARCHAR(50),
    product_name VARCHAR(50),
    category_id VARCHAR(50),
    category VARCHAR(50),
    subcategory VARCHAR(50),
    maintenance VARCHAR(50),
    cost INT,
    product_line VARCHAR(50),
    start_date DATE
);

------------------------------------------------------------
-- gold.fact_sales
------------------------------------------------------------

DROP TABLE IF EXISTS gold.fact_sales;

CREATE TABLE gold.fact_sales(
    order_number VARCHAR(50),
    product_key INT,
    customer_key INT,
    order_date DATE,
    shipping_date DATE,
    due_date DATE,
    sales_amount INT,
    quantity SMALLINT,
    price INT
);

------------------------------------------------------------
-- Load dim_customers
------------------------------------------------------------

TRUNCATE TABLE gold.dim_customers;

COPY gold.dim_customers
FROM 'C:/sql/sql-data-analytics-project/datasets/csv-files/gold.dim_customers.csv'
DELIMITER ','
CSV HEADER;

------------------------------------------------------------
-- Load dim_products
------------------------------------------------------------

TRUNCATE TABLE gold.dim_products;

COPY gold.dim_products
FROM 'C:/sql/sql-data-analytics-project/datasets/csv-files/gold.dim_products.csv'
DELIMITER ','
CSV HEADER;

------------------------------------------------------------
-- Load fact_sales
------------------------------------------------------------

TRUNCATE TABLE gold.fact_sales;

COPY gold.fact_sales
FROM 'C:/sql/sql-data-analytics-project/datasets/csv-files/gold.fact_sales.csv'
DELIMITER ','
CSV HEADER;
