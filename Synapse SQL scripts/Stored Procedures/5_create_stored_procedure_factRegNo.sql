USE ts_reg
GO

CREATE OR ALTER PROCEDURE gold.usp_gold_factRegNo
AS
BEGIN

    DECLARE @create_sql_stmt NVARCHAR(MAX)
            -- @drop_sql_stmt   NVARCHAR(MAX);

    SET @create_sql_stmt = 
    'CREATE EXTERNAL TABLE gold.factRegNo ' +
    'WITH ' +
    '(DATA_SOURCE = ts_reg_src, LOCATION = ''gold/factRegNo/'', FILE_FORMAT = parquet_file_format) ' +
    'AS ' +
    'SELECT bt.registrationNo,bt.regvalidfrom,bt.regvalidto,goc.OfficeId,gf.fuelId,gbt.bodyTypeId,MAX(gv.modelDescId) AS modelDescId
    FROM bronze.ts_reg_parquet bt
    JOIN gold.DimOfficeCd goc ON bt.OfficeCd = goc.OfficeCd
    JOIN gold.DimFuel gf ON bt.fuel = gf.fuel
    JOIN gold.DimBodyType gbt ON bt.bodyType = gbt.bodyType
    JOIN gold.DimVechile gv ON bt.modelDesc = gv.modelDesc
    GROUP BY bt.registrationNo,bt.regvalidfrom,bt.regvalidto,goc.OfficeId,gf.fuelId,gbt.bodyTypeId';    

    PRINT @create_sql_stmt


    EXEC sp_executesql @create_sql_stmt;

    -- SET @drop_sql_stmt = 
    --     'DROP EXTERNAL TABLE gold.DimOfficeCd';

    -- print(@drop_sql_stmt)
    -- EXEC sp_executesql @drop_sql_stmt;

END;