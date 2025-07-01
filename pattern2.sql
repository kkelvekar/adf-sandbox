select * from dbo.Products

-- 2. Alter the column to NVARCHAR(150):
--ALTER TABLE dbo.Products
--ALTER COLUMN PRODUCT_NAME NVARCHAR(200) NOT NULL;
GO

ALTER PROCEDURE dbo.usp_MergeProducts
AS
BEGIN
  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  BEGIN TRAN;

    -- 1) Delete any existing target rows for the IDs in staging
    DELETE P
    FROM dbo.Products AS P
    INNER JOIN dbo.Products_Staging AS S
      ON P.PRODUCT_ID = S.PRODUCT_ID;

    -- 2) Insert all rows from staging into production
    INSERT INTO dbo.Products (PRODUCT_ID, PRODUCT_NAME, UNIT_PRICE)
    SELECT 
      S.PRODUCT_ID,
      S.PRODUCT_NAME,
      S.UNIT_PRICE
    FROM dbo.Products_Staging AS S;

    -- 3) (Optional) Validate counts or checksums
    -- DECLARE @cntSrc INT = (SELECT COUNT(*) FROM dbo.Products_Staging);
    -- DECLARE @cntTgt INT = (SELECT COUNT(*) FROM dbo.Products WHERE PRODUCT_ID IN (SELECT PRODUCT_ID FROM dbo.Products_Staging));
    -- IF @cntSrc <> @cntTgt
    --   THROW 51000, 'Row count mismatch after DELETE/INSERT.', 1;

    -- 4) Clean up staging by deleting its rows
    DELETE FROM dbo.Products_Staging;

  COMMIT TRAN;
END
GO

CREATE TABLE dbo.Products_Staging (
    PRODUCT_ID     INT             NOT NULL PRIMARY KEY,
    PRODUCT_NAME   NVARCHAR(200)   NOT NULL,
    UNIT_PRICE     DECIMAL(10,2)   NOT NULL
);


-- 2. Create a custom role for executing all stored procedures
CREATE ROLE db_executor;
GO

-- 3. Grant execute permission on all objects in the dbo schema to that role
GRANT EXECUTE
  ON SCHEMA::dbo
  TO db_executor;
GO

-- 4. Add your managed identity user into the executor role
ALTER ROLE db_executor
  ADD MEMBER [uami-adf-dev-uksouth-001];
GO
