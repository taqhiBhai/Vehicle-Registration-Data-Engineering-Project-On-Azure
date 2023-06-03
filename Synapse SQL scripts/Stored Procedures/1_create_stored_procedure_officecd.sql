USE ts_reg
GO

CREATE OR ALTER PROCEDURE gold.usp_gold_officecd
AS
BEGIN

    DECLARE @create_sql_stmt NVARCHAR(MAX)
            -- @drop_sql_stmt   NVARCHAR(MAX);

    SET @create_sql_stmt = 
    'CREATE EXTERNAL TABLE gold.DimOfficeCd ' +
    'WITH ' +
    '(DATA_SOURCE = ts_reg_src, LOCATION = ''gold/DimOfficeCd/'', FILE_FORMAT = parquet_file_format) ' +
    'AS ' +
    'SELECT OfficeCd, ROW_NUMBER() OVER(ORDER BY OfficeCd) + 99 as OfficeId ' +
    'FROM bronze.ts_reg_parquet ' +
    'GROUP BY OfficeCd';    

    PRINT @create_sql_stmt


    EXEC sp_executesql @create_sql_stmt;

    -- SET @drop_sql_stmt = 
    --     'DROP EXTERNAL TABLE gold.DimOfficeCd';

    -- print(@drop_sql_stmt)
    -- EXEC sp_executesql @drop_sql_stmt;

END;