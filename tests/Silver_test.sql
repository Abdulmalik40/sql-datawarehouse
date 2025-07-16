PRINT '================================================';
PRINT 'SILVER LAYER ETL VALIDATION TESTS';
PRINT '================================================';

PRINT '>> Testing Data Quality';
SELECT 'Duplicate customer IDs' AS test_name, COUNT(*) AS error_count
FROM (SELECT cst_id FROM silver.crm_cust_info GROUP BY cst_id HAVING COUNT(*) > 1) duplicates;

SELECT 'NULL customer IDs in sales' AS test_name, COUNT(*) AS error_count
FROM silver.crm_sales_details WHERE sls_cust_id IS NULL;

SELECT 'Invalid marital status' AS test_name, COUNT(*) AS error_count
FROM silver.crm_cust_info WHERE cst_marital_status NOT IN ('Single', 'Married', 'n/a');

SELECT 'Invalid gender values' AS test_name, COUNT(*) AS error_count
FROM silver.crm_cust_info WHERE cst_gndr NOT IN ('Male', 'Female', 'n/a');

SELECT 'Future birth dates' AS test_name, COUNT(*) AS error_count
FROM silver.erp_cust_az12 WHERE bdate > GETDATE();

SELECT 'Sales calculation errors' AS test_name, COUNT(*) AS error_count
FROM silver.crm_sales_details WHERE ABS(sls_sales - (sls_quantity * sls_price)) > 0.01;

PRINT '>> Testing Record Counts';
SELECT 'crm_cust_info' AS table_name, COUNT(*) AS record_count FROM silver.crm_cust_info;
SELECT 'crm_sales_details' AS table_name, COUNT(*) AS record_count FROM silver.crm_sales_details;
SELECT 'crm_prd_info' AS table_name, COUNT(*) AS record_count FROM silver.crm_prd_info;

PRINT '>> Testing Referential Integrity';
SELECT 'Sales with missing customers' AS test_name, COUNT(*) AS error_count
FROM silver.crm_sales_details s
LEFT JOIN silver.crm_cust_info c ON s.sls_cust_id = c.cst_id
WHERE c.cst_id IS NULL;

PRINT '================================================';
PRINT 'ALL ERROR_COUNT SHOULD BE 0 FOR SUCCESSFUL ETL';
PRINT '================================================';
