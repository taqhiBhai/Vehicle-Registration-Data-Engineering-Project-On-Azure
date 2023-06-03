-- USE ts_reg;


-- SELECT bodyType, CONCAT(''b_'' ,ROW_NUMBER() OVER(ORDER BY bodyType) + 199) as bodyTypeId
-- FROM bronze.ts_reg_parquet
-- GROUP BY bodyType

-- Execute stored procedure
-- EXEC gold.usp_gold_bodytype;

SELECT *
FROM gold.DimBodyType