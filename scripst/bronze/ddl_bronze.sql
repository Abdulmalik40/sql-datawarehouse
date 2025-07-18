-- Create the table of customer info

CREATE TABLE bronze.crm_cust_info(
cst_id INT ,
cst_key NVARCHAR(50),
cst_firstname NVARCHAR(50),
cst_lastname NVARCHAR(50),
cst_marital_status NVARCHAR(50),
cst_gndr NVARCHAR(50),
cst_create_date DATE

);
-- Create Table prd
CREATE TABLE bronze.crm_prd_info(
prd_id INT,
prd_key NVARCHAR(50),
prd_nm NVARCHAR(50) ,
prd_cost INT,
prd_line NVARCHAR(50),
prd_start_dt DATETIME,
prd_end_dt DATETIME
);
-- Sales details
CREATE TABLE bronze.crm_sales_details(
sls_ord_num NVARCHAR(50),
sls_prd_key NVARCHAR(50),
sls_cust_id INT,
sls_order_dt INT,
sls_ship_dt INT,
sls_due_dt INT,
sls_sales INT,
sls_quantity INT,
sls_price INT
);

-- Table of CUST AZ

CREATE TABLE bronze.erp_cust_az12(
CID NVARCHAR(50),
BDATE DATE,
GEN NVARCHAR(50)
);

-- Table of LOC AR
CREATE TABLE bronze.erp_loc_101(
CID NVARCHAR(50),
CNTRY NVARCHAR(50)
);
-- Table of PX CAT G1
CREATE TABLE bronze.erp_px_cat_g1v2(
ID VARCHAR(50),
CAR NVARCHAR(50),
SUBCAT NVARCHAR(50),
MAINTENANCE NVARCHAR(50)

);
