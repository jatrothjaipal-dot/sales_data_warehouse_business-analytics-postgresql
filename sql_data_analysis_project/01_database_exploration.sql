
/*
===============================================================================
Database Exploration
===============================================================================
Purpose:
    Explore database tables and columns in PostgreSQL.
===============================================================================
*/

------------------------------------------------------------
-- List all tables
------------------------------------------------------------

SELECT
    table_catalog,
    table_schema,
    table_name,
    table_type
FROM information_schema.tables;

------------------------------------------------------------
-- Show columns from dim_customers
------------------------------------------------------------

SELECT
    column_name,
    data_type,
    is_nullable,
    character_maximum_length
FROM information_schema.columns
WHERE table_name = 'dim_customers';
