EXEC bronze.load_bronze
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @total_start DATETIME, @total_end DATETIME
	BEGIN TRY	
	
	PRINT '=================================================='
	PRINT '           BRONZE LAYER DATA LOADING'
	PRINT '=================================================='
	
	SET @total_start = GETDATE();
	
	SET @start_time = GETDATE();
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
	SET @end_time = GETDATE();
	PRINT ' CRM Customer Info loaded successfully'
	PRINT '>> Load duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds'
	PRINT ''
	
	SET @start_time = GETDATE();
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
	SET @end_time = GETDATE();
	PRINT ' CRM Product Info loaded successfully'
	PRINT '>> Load duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds'
	PRINT ''
	
	SET @start_time = GETDATE();
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
	SET @end_time = GETDATE();
	PRINT ' CRM Sales Details loaded successfully'
	PRINT '>> Load duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds'
	PRINT ''
	
	SET @start_time = GETDATE();
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
	SET @end_time = GETDATE();
	PRINT ' ERP Customer AZ12 loaded successfully'
	PRINT '>> Load duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds'
	PRINT ''
	
	SET @start_time = GETDATE();
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
	SET @end_time = GETDATE();
	PRINT ' ERP Location 101 loaded successfully'
	PRINT '>> Load duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds'
	PRINT ''
	
	SET @start_time = GETDATE();
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
	SET @end_time = GETDATE();
	PRINT ' ERP Product Category G1V2 loaded successfully'
	PRINT '>> Load duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds'
	PRINT ''
	
	SET @total_end = GETDATE();
	PRINT '=================================================='
	PRINT '         ALL BRONZE DATA LOADED SUCCESSFULLY!'
	PRINT '>> TOTAL EXECUTION TIME: ' + CAST(DATEDIFF(second,@total_start,@total_end) AS NVARCHAR) + ' seconds'
	PRINT '=================================================='
END TRY
BEGIN CATCH
	PRINT '=================================='
	PRINT 'ERROR OCCURED DURING BRONZE LAYER'
	PRINT '=================================='
	PRINT 'ERROR Message: ' + ERROR_MESSAGE();
	PRINT 'ERROR Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
END CATCH
END
