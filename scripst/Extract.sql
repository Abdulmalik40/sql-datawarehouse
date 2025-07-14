TRUNCATE Table bronze.crm_cust_info
-- crm customer info
BULK INSERT  bronze.crm_cust_info
FROM 'C:\Users\PC\Desktop\dataset1\cust_info.csv'
WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

TRUNCATE Table bronze.crm_prd_info
-- crm prd info
BULK INSERT bronze.crm_prd_info
FROM 'C:\Users\PC\Desktop\dataset1\prd_info.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);


TRUNCATE TABLE bronze.crm_sales_details
--sales info
BULK INSERT bronze.crm_sales_details
FROM 'C:\Users\PC\Desktop\dataset1\sales_details.csv'
WITH(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);

TRUNCATE TABLE bronze.erp_cust_az12
-- Customer AZ12
BULK INSERT bronze.erp_cust_az12
FROM 'C:\Users\PC\Desktop\dataset2\CUST_AZ12.csv'
WITH(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);

TRUNCATE TABLE bronze.erp_loc_101
-- erp loc101
BULK INSERT bronze.erp_loc_101
FROM 'C:\Users\PC\Desktop\dataset2\LOC_A101.csv'
WITH(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);

TRUNCATE TABLE bronze.erp_px_cat_g1v2
-- erp px_Cat
BULK INSERT bronze.erp_px_cat_g1v2
FROM 'C:\Users\PC\Desktop\dataset2\PX_CAT_G1V2.csv'
WITH(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);
