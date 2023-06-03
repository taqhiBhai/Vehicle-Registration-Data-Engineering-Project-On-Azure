USE ts_reg
GO

CREATE OR ALTER PROCEDURE gold.usp_gold_bodytype
AS
BEGIN

    DECLARE @create_sql_stmt NVARCHAR(MAX)
            -- @drop_sql_stmt   NVARCHAR(MAX);

    SET @create_sql_stmt = 
    'CREATE EXTERNAL TABLE gold.DimBodyType ' +
    'WITH ' +
    '(DATA_SOURCE = ts_reg_src, LOCATION = ''gold/DimBodyType/'', FILE_FORMAT = parquet_file_format) ' +
    'AS ' +
    'SELECT bodyType, CONCAT(''b_'' ,ROW_NUMBER() OVER(ORDER BY bodyType) + 199) as bodyTypeId
    FROM bronze.ts_reg_parquet
    GROUP BY bodyType;';    

    PRINT @create_sql_stmt


    EXEC sp_executesql @create_sql_stmt;

    -- SET @drop_sql_stmt = 
    --     'DROP EXTERNAL TABLE gold.DimOfficeCd';

    -- print(@drop_sql_stmt)
    -- EXEC sp_executesql @drop_sql_stmt;

END;