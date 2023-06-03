USE ts_reg;

-- SELECT fuel, CONCAT(''f_'' ,ROW_NUMBER() OVER(ORDER BY fuel) + 189) as fuelId
-- FROM bronze.ts_reg_parquet
-- GROUP BY fuel;

-- Execute stored procedure
-- EXEC gold.usp_gold_fuel;


SELECT *
FROM gold.DimFuel