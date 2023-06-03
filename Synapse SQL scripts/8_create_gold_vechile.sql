-- USE ts_reg;

-- SELECT b.cc, b.cylinder, b.hp, b.makerName, b.seatCapacity, b.modelDesc,
--     CONCAT('mo_', ROW_NUMBER() OVER (ORDER BY b.modelDesc) + 999) AS modelDescId
-- FROM bronze.ts_reg_parquet b
-- GROUP BY b.cc, b.cylinder, b.hp, b.makerName, b.seatCapacity, b.modelDesc
-- ORDER BY modelDescId DESC

-- Execute stored procedure
-- EXEC gold.usp_gold_vechile;

SELECT *
FROM gold.DimVechile

