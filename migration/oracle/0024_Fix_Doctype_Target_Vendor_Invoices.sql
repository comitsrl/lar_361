-- 29/03/2012 13:34:27 ART
-- Fix doctype target selection for vendor invoices
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,DefaultValue,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3000088,0,'Y','N','N',3000068,'N',450,'Y',290,'Y','The POS Terminal defines the defaults and functions available for the POS Form','1=2','LAR','1000000','Point of Sales Terminal','POS Terminal',100,0,'Y',TO_DATE('2012-03-29 13:34:25','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-03-29 13:34:25','YYYY-MM-DD HH24:MI:SS'))
;

-- 29/03/2012 13:34:27 ART
-- Fix doctype target selection for vendor invoices
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000088 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 29/03/2012 13:54:13 ART
-- Fix doctype target selection for vendor invoices
UPDATE AD_Val_Rule SET Code='((C_DocType.C_DocType_ID IN (SELECT C_DocType_ID FROM C_DocType WHERE C_DocType.DocBaseType IN (''API'', ''APC'')) AND ''@IsSOTrx@''=''N'') OR (C_DocType.C_DocType_ID IN (SELECT C_DocType_ID FROM C_DocType WHERE C_DocType.DocBaseType IN (''ARI'', ''ARC'') AND C_DocType.C_POS_ID=@C_POS_ID@ AND C_DocType.LAR_DocumentLetter_ID=(SELECT L.LAR_DocumentLetter_ID FROM LAR_DocumentLetter L JOIN LAR_LetterRule R ON R.LAR_DocumentLetter_ID=L.LAR_DocumentLetter_ID WHERE R.LCO_TaxPayerType_Customer_ID=(SELECT LCO_TaxPayerType_ID FROM C_BPartner WHERE C_BPartner_ID=@C_BPartner_ID@) AND R.LCO_TaxPayerType_Vendor_ID=(SELECT LCO_TaxPayerType_ID FROM AD_OrgInfo WHERE AD_Org_ID=@#AD_Org_ID@))) AND ''@IsSOTrx@''=''Y''))',Updated=TO_DATE('2012-03-29 13:54:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000000
;

-- 29/03/2012 13:55:14 ART
-- Fix doctype target selection for vendor invoices
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3348
;

-- 29/03/2012 13:55:14 ART
-- Fix doctype target selection for vendor invoices
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3333
;

-- 29/03/2012 13:55:14 ART
-- Fix doctype target selection for vendor invoices
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3325
;

-- 29/03/2012 13:55:14 ART
-- Fix doctype target selection for vendor invoices
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3326
;

-- 29/03/2012 13:55:14 ART
-- Fix doctype target selection for vendor invoices
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3344
;

