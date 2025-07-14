
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	PRINT '=================================================='
	PRINT '           BRONZE LAYER DATA LOADING'
	PRINT '=================================================='
	
	TRUNCATE Table bronze.crm_cust_info
	-- crm customer info
	PRINT '--------------------------------------------------'
	PRINT 'Loading CRM Customer Info...'
	PRINT '--------------------------------------------------'
	BULK INSERT  bronze.crm_cust_info
	FROM 'C:\Users\PC\Desktop\dataset1\cust_info.csv'
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	PRINT ' CRM Customer Info loaded successfully'
	PRINT ''
	
	TRUNCATE Table bronze.crm_prd_info
	-- crm prd info
	PRINT '--------------------------------------------------'
	PRINT 'Loading CRM Product Info...'
	PRINT '--------------------------------------------------'
	BULK INSERT bronze.crm_prd_info
	FROM 'C:\Users\PC\Desktop\dataset1\prd_info.csv'
	WITH
	(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
	);
	PRINT ' CRM Product Info loaded successfully'
	PRINT ''
	
	TRUNCATE TABLE bronze.crm_sales_details
	--sales info
	PRINT '--------------------------------------------------'
	PRINT 'Loading CRM Sales Details...'
	PRINT '--------------------------------------------------'
	BULK INSERT bronze.crm_sales_details
	FROM 'C:\Users\PC\Desktop\dataset1\sales_details.csv'
	WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
	);
	PRINT ' CRM Sales Details loaded successfully'
	PRINT ''
	
	TRUNCATE TABLE bronze.erp_cust_az12
	-- Customer AZ12
	PRINT '--------------------------------------------------'
	PRINT 'Loading ERP Customer AZ12...'
	PRINT '--------------------------------------------------'
	BULK INSERT bronze.erp_cust_az12
	FROM 'C:\Users\PC\Desktop\dataset2\CUST_AZ12.csv'
	WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
	);
	PRINT ' ERP Customer AZ12 loaded successfully'
	PRINT ''
	
	TRUNCATE TABLE bronze.erp_loc_101
	-- erp loc101
	PRINT '--------------------------------------------------'
	PRINT 'Loading ERP Location 101...'
	PRINT '--------------------------------------------------'
	BULK INSERT bronze.erp_loc_101
	FROM 'C:\Users\PC\Desktop\dataset2\LOC_A101.csv'
	WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
	);
	PRINT ' ERP Location 101 loaded successfully'
	PRINT ''
	
	TRUNCATE TABLE bronze.erp_px_cat_g1v2
	-- erp px_Cat
	PRINT '--------------------------------------------------'
	PRINT 'Loading ERP Product Category G1V2...'
	PRINT '--------------------------------------------------'
	BULK INSERT bronze.erp_px_cat_g1v2
	FROM 'C:\Users\PC\Desktop\dataset2\PX_CAT_G1V2.csv'
	WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
	);
	PRINT ' ERP Product Category G1V2 loaded successfully'
	PRINT ''
	
	PRINT '=================================================='
	PRINT '         ALL BRONZE DATA LOADED SUCCESSFULLY!'
	PRINT '=================================================='
END
