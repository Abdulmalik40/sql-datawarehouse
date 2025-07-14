USE Master;
GO
-- Check database
DROP DATABASE IF EXISTS DataWareHouse;
GO

-- Creating the database and Schemas
CREATE DATABASE DataWareHouse

USE DataWareHouse

CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
