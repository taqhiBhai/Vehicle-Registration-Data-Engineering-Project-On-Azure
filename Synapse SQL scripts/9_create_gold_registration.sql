-- USE ts_reg;
-- DROP EXTERNAL TABLE gold.factRegNo


-- SELECT bt.registrationNo,bt.regvalidfrom,bt.regvalidto,goc.OfficeId,gf.fuelId,gbt.bodyTypeId,MAX(gv.modelDescId) AS modelDescId
-- FROM bronze.ts_reg_parquet bt
-- JOIN gold.DimOfficeCd goc ON bt.OfficeCd = goc.OfficeCd
-- JOIN gold.DimFuel gf ON bt.fuel = gf.fuel
-- JOIN gold.DimBodyType gbt ON bt.bodyType = gbt.bodyType
-- JOIN gold.DimVechile gv ON bt.modelDesc = gv.modelDesc
-- GROUP BY bt.registrationNo,bt.regvalidfrom,bt.regvalidto,goc.OfficeId,gf.fuelId,gbt.bodyTypeId

--Execute stored procedure
--EXEC gold.usp_gold_factRegNo;

SELECT count(*) FROM gold.factRegNo