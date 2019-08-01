-- 31/07/2019 18:51:48 ART
-- ISSUE #124: Nueva categoria de iva "No Alcanzado".
INSERT INTO LCO_TaxPayerType (AD_Client_ID,AD_Org_ID,Created,CreatedBy,UpdatedBy,IsDefault,LCO_TaxPayerType_ID,IsActive,Updated,Name) VALUES (1000000,0,TO_DATE('2019-07-31 18:51:48','YYYY-MM-DD HH24:MI:SS'),100,100,'N',4000000,'Y',TO_DATE('2019-07-31 18:51:48','YYYY-MM-DD HH24:MI:SS'),'NoAlcanzado')
;

-- 31/07/2019 20:12:49 ART
-- ISSUE #124: Nueva categoria de iva "No Alcanzado".
INSERT INTO LAR_LetterRule (AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,UpdatedBy,IsActive,LAR_LetterRule_ID,MaxAmt,LCO_TaxPayerType_Vendor_ID,LAR_DocumentLetter_ID,LCO_TaxPayerType_Customer_ID) VALUES (1000000,0,TO_DATE('2019-07-31 20:12:49','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2019-07-31 20:12:49','YYYY-MM-DD HH24:MI:SS'),100,'Y',4000000,0,1000000,1000001,4000000)
;

-- Registración de script
SELECT register_migration_script_lar('0134_ISSUE-124.sql', 'LAR', '') FROM dual
;
