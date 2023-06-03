USE ts_reg
GO

CREATE OR ALTER PROCEDURE gold.usp_gold_fuel
AS
BEGIN

    DECLARE @create_sql_stmt NVARCHAR(MAX)
            -- @drop_sql_stmt   NVARCHAR(MAX);

    SET @create_sql_stmt = 
    'CREATE EXTERNAL TABLE gold.DimFuel ' +
    'WITH ' +
    '(DATA_SOURCE = ts_reg_src, LOCATION = ''gold/DimFuel/'', FILE_FORMAT = parquet_file_format) ' +
    'AS ' +
    'SELECT fuel,CONCAT(''f_'', ROW_NUMBER() OVER(ORDER BY fuel) + 189) as fuelId ' +
    'FROM bronze.ts_reg_parquet ' +
    'GROUP BY fuel';    

    PRINT @create_sql_stmt


    EXEC sp_executesql @create_sql_stmt;

    -- SET @drop_sql_stmt = 
    --     'DROP EXTERNAL TABLE gold.DimOfficeCd';

    -- print(@drop_sql_stmt)
    -- EXEC sp_executesql @drop_sql_stmt;

END;