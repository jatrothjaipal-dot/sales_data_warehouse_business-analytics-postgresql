
/*
===============================================================================
Procedure: bronze.load_bronze()
===============================================================================
Purpose:
    Loads raw CSV data into bronze schema tables.

Process:
    1. Clears existing data from bronze tables
    2. Loads fresh data from CSV files using COPY
    3. Displays execution time for each table load

Usage:
    CALL bronze.load_bronze();
===============================================================================
*/

CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql
AS $$
DECLARE
    start_time TIMESTAMP;
    end_time TIMESTAMP;
    batch_start_time TIMESTAMP;
    batch_end_time TIMESTAMP;
BEGIN
    batch_start_time := clock_timestamp();

    RAISE NOTICE '=========================================';
    RAISE NOTICE 'Starting Bronze Layer Load';
    RAISE NOTICE '=========================================';

    RAISE NOTICE 'Loading CRM Tables';

    start_time := clock_timestamp();

    TRUNCATE TABLE bronze.crm_cust_info;

    COPY bronze.crm_cust_info
    FROM 'C:/sql/dwh_project/datasets/source_crm/cust_info.csv'
    DELIMITER ','
    CSV HEADER;

    end_time := clock_timestamp();

    RAISE NOTICE 'crm_cust_info loaded in % seconds',
        EXTRACT(EPOCH FROM (end_time - start_time));

    start_time := clock_timestamp();

    TRUNCATE TABLE bronze.crm_prd_info;

    COPY bronze.crm_prd_info
    FROM 'C:/sql/dwh_project/datasets/source_crm/prd_info.csv'
    DELIMITER ','
    CSV HEADER;

    end_time := clock_timestamp();

    RAISE NOTICE 'crm_prd_info loaded in % seconds',
        EXTRACT(EPOCH FROM (end_time - start_time));

    start_time := clock_timestamp();

    TRUNCATE TABLE bronze.crm_sales_details;

    COPY bronze.crm_sales_details
    FROM 'C:/sql/dwh_project/datasets/source_crm/sales_details.csv'
    DELIMITER ','
    CSV HEADER;

    end_time := clock_timestamp();

    RAISE NOTICE 'crm_sales_details loaded in % seconds',
        EXTRACT(EPOCH FROM (end_time - start_time));

    RAISE NOTICE 'Loading ERP Tables';

    start_time := clock_timestamp();

    TRUNCATE TABLE bronze.erp_loc_a101;

    COPY bronze.erp_loc_a101
    FROM 'C:/sql/dwh_project/datasets/source_erp/loc_a101.csv'
    DELIMITER ','
    CSV HEADER;

    end_time := clock_timestamp();

    RAISE NOTICE 'erp_loc_a101 loaded in % seconds',
        EXTRACT(EPOCH FROM (end_time - start_time));

    start_time := clock_timestamp();

    TRUNCATE TABLE bronze.erp_cust_az12;

    COPY bronze.erp_cust_az12
    FROM 'C:/sql/dwh_project/datasets/source_erp/cust_az12.csv'
    DELIMITER ','
    CSV HEADER;

    end_time := clock_timestamp();

    RAISE NOTICE 'erp_cust_az12 loaded in % seconds',
        EXTRACT(EPOCH FROM (end_time - start_time));

    start_time := clock_timestamp();

    TRUNCATE TABLE bronze.erp_px_cat_g1v2;

    COPY bronze.erp_px_cat_g1v2
    FROM 'C:/sql/dwh_project/datasets/source_erp/px_cat_g1v2.csv'
    DELIMITER ','
    CSV HEADER;

    end_time := clock_timestamp();

    RAISE NOTICE 'erp_px_cat_g1v2 loaded in % seconds',
        EXTRACT(EPOCH FROM (end_time - start_time));

    batch_end_time := clock_timestamp();

    RAISE NOTICE '=========================================';
    RAISE NOTICE 'Bronze Layer Load Completed';
    RAISE NOTICE 'Total duration: % seconds',
        EXTRACT(EPOCH FROM (batch_end_time - batch_start_time));
    RAISE NOTICE '=========================================';

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Load failed: %', SQLERRM;
END;
$$;
