select * from dbo.Products

-- 2. Alter the column to NVARCHAR(150):
--ALTER TABLE dbo.Products
--ALTER COLUMN PRODUCT_NAME NVARCHAR(200) NOT NULL;
GO

CREATE PROCEDURE dbo.usp_MergeProducts
AS
BEGIN
  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  BEGIN TRAN;

    -- 1) Merge staging into production
    MERGE INTO dbo.Products AS Target
    USING dbo.Products_Staging AS Src
      ON Target.PRODUCT_ID = Src.PRODUCT_ID
    WHEN MATCHED THEN
      UPDATE SET
        Target.PRODUCT_NAME = Src.PRODUCT_NAME,
        Target.UNIT_PRICE   = Src.UNIT_PRICE
    WHEN NOT MATCHED BY TARGET THEN
      INSERT (PRODUCT_ID, PRODUCT_NAME, UNIT_PRICE)
      VALUES (Src.PRODUCT_ID, Src.PRODUCT_NAME, Src.UNIT_PRICE);

    -- 2) (Optional) Validate row counts or checksums
    -- DECLARE @cntSrc INT = (SELECT COUNT(*) FROM dbo.Products_Staging);
    -- DECLARE @cntTgt INT = (SELECT COUNT(*) FROM dbo.Products WHERE PRODUCT_ID IN (SELECT PRODUCT_ID FROM dbo.Products_Staging));
    -- IF @cntSrc <> @cntTgt
    --   THROW 51000, 'Row count mismatch after MERGE.', 1;

    -- 3) Clean up staging
    TRUNCATE TABLE dbo.Products_Staging;

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
