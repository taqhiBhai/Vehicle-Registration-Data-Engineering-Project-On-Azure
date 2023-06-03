USE ts_reg
GO

CREATE OR ALTER PROCEDURE gold.usp_gold_vechile
AS
BEGIN

    DECLARE @create_sql_stmt NVARCHAR(MAX)
            -- @drop_sql_stmt   NVARCHAR(MAX);

    SET @create_sql_stmt = 
    'CREATE EXTERNAL TABLE gold.DimVechile ' +
    'WITH ' +
    '(DATA_SOURCE = ts_reg_src, LOCATION = ''gold/DimVechile/'', FILE_FORMAT = parquet_file_format) ' +
    'AS ' +
    'SELECT b.cc, b.cylinder, b.hp, b.makerName, b.seatCapacity, b.modelDesc,
    CONCAT(''mo_'', ROW_NUMBER() OVER (ORDER BY b.modelDesc) + 999) AS modelDescId
    FROM bronze.ts_reg_parquet b
    GROUP BY b.cc, b.cylinder, b.hp, b.makerName, b.seatCapacity, b.modelDesc';    

    PRINT @create_sql_stmt


    EXEC sp_executesql @create_sql_stmt;

    -- SET @drop_sql_stmt = 
    --     'DROP EXTERNAL TABLE gold.DimOfficeCd';

    -- print(@drop_sql_stmt)
    -- EXEC sp_executesql @drop_sql_stmt;

END;