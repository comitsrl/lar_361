-- 12/07/2012 12:21:31 ART
-- Doctype validation, just list those IN logged Organization
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('(C_DocType.DocBaseType IN (''ARR'')) AND (@#AD_Org_ID@=C_DocType.AD_Org_ID)','S',3000007,'LAR','C_DocType Receipts',100,100,TO_TIMESTAMP('2012-07-12 12:21:30','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_TIMESTAMP('2012-07-12 12:21:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 12/07/2012 12:22:19 ART
-- Doctype validation, just list those IN logged Organization
UPDATE AD_Val_Rule SET Name='C_DocType Receipts Org',Updated=TO_TIMESTAMP('2012-07-12 12:22:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000007
;

-- 12/07/2012 12:22:33 ART
-- Doctype validation, just list those IN logged Organization
UPDATE AD_Field SET AD_Val_Rule_ID=3000007,Updated=TO_TIMESTAMP('2012-07-12 12:22:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000755
;

