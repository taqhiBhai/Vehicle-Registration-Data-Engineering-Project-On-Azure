-- USE ts_reg;


-- SELECT OfficeCd, ROW_NUMBER() OVER(ORDER BY OfficeCd) + 99 as OfficeId
-- FROM bronze.ts_reg_parquet
-- GROUP BY OfficeCd;

-- Execute stored procedure
-- EXEC gold.usp_gold_officecd;

SELECT *
FROM gold.DimOfficeCd