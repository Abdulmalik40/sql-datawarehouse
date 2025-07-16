
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'silver')
BEGIN
    EXEC('CREATE SCHEMA silver')
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'crm_cust_info' AND schema_id = SCHEMA_ID('silver'))
BEGIN
    CREATE TABLE silver.crm_cust_info (
        cst_id INT NOT NULL,
        cst_key NVARCHAR(55),
        cst_firstname NVARCHAR(55),
        cst_lastname NVARCHAR(55),
        cst_marital_status NVARCHAR(55),
        cst_gndr NVARCHAR(55),
        cst_create_date DATETIME,
        dwh_create_date DATETIME2 DEFAULT GETDATE(),
        CONSTRAINT PK_crm_cust_info PRIMARY KEY (cst_id)
    );
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'crm_prd_info' AND schema_id = SCHEMA_ID('silver'))
BEGIN
    CREATE TABLE silver.crm_prd_info (
        prd_id INT NOT NULL,
        prd_key NVARCHAR(55),
        prd_nm NVARCHAR(55),
        prd_cost DECIMAL(18,2),
        prd_line NVARCHAR(55),
        prd_start_dt DATE,
        prd_end_dt DATE,
        dwh_create_date DATETIME2 DEFAULT GETDATE(),
        CONSTRAINT PK_crm_prd_info PRIMARY KEY (prd_id, prd_start_dt)
    );
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'crm_sales_details' AND schema_id = SCHEMA_ID('silver'))
BEGIN
    CREATE TABLE silver.crm_sales_details (
        sls_ord_num     NVARCHAR(50),
        sls_prd_key     NVARCHAR(50),
        sls_cust_id     INT,
        sls_order_dt    DATE,
        sls_ship_dt     DATE,
        sls_due_dt      DATE,
        sls_sales       INT,
        sls_quantity    INT,
        sls_price       INT,
        dwh_create_date DATETIME2 DEFAULT GETDATE()
    );
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'erp_cust_az12' AND schema_id = SCHEMA_ID('silver'))
BEGIN
    CREATE TABLE silver.erp_cust_az12 (
        cid NVARCHAR(55),
        bdate DATE,
        gen NVARCHAR(55),
        dwh_create_date DATETIME2 DEFAULT GETDATE()
    );
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'erp_loc_a101' AND schema_id = SCHEMA_ID('silver'))
BEGIN
    CREATE TABLE silver.erp_loc_a101 (
        cid NVARCHAR(55),
        cntry NVARCHAR(55),
        dwh_create_date DATETIME2 DEFAULT GETDATE()
    );
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'erp_px_cat_g1v2' AND schema_id = SCHEMA_ID('silver'))
BEGIN
    CREATE TABLE silver.erp_px_cat_g1v2 (
        id INT,
        car NVARCHAR(55),
        subcat NVARCHAR(55),
        maintenance NVARCHAR(55),
        dwh_create_date DATETIME2 DEFAULT GETDATE()
    );
END
GO
