ALTER TABLE C_Payment ADD COLUMN C_TaxWithholding_ID Numeric(10,0);
ALTER TABLE C_Payment ADD CONSTRAINT ctax_cpayment FOREIGN KEY (C_TaxWithholding_ID)
    REFERENCES C_Tax(C_Tax_ID);
ALTER TABLE C_Payment ADD COLUMN WithholdingCertNo Varchar(20);

-- 07/07/2012 13:55:25 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
INSERT INTO C_TaxCategory (IsWithholding,IsDefault,C_TaxCategory_ID,Name,CreatedBy,Updated,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID) VALUES ('Y','N',1000004,'Retenciones Sufridas',100,TO_TIMESTAMP('2012-07-07 13:55:24','YYYY-MM-DD HH24:MI:SS'),100,1000000,TO_TIMESTAMP('2012-07-07 13:55:24','YYYY-MM-DD HH24:MI:SS'),'Y',1000000)
;

-- 07/07/2012 13:55:25 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
INSERT INTO C_TaxCategory_Trl (AD_Language,C_TaxCategory_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.C_TaxCategory_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, C_TaxCategory t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.C_TaxCategory_ID=1000004 AND NOT EXISTS (SELECT * FROM C_TaxCategory_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.C_TaxCategory_ID=t.C_TaxCategory_ID)
;

-- 07/07/2012 14:36:42 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000124,'c_taxwithholding_id','LAR','c_taxwithholding_id','c_taxwithholding_id',0,TO_TIMESTAMP('2012-07-07 14:36:42','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-07-07 14:36:42','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 07/07/2012 14:36:42 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000124 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 07/07/2012 14:36:42 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000816,335,'LAR',0,'N','N','N','N',10,'N',19,'N',3000124,'N','Y','N','c_taxwithholding_id','c_taxwithholding_id',100,TO_TIMESTAMP('2012-07-07 14:36:42','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-07-07 14:36:42','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 07/07/2012 14:36:42 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000816 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 07/07/2012 14:38:19 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Element SET ColumnName='C_TaxWithholding_ID', Name='C_TaxWithholding_ID', PrintName='C_TaxWithholding_ID',Updated=TO_TIMESTAMP('2012-07-07 14:38:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000124
;

-- 07/07/2012 14:38:19 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000124
;

-- 07/07/2012 14:38:19 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Column SET ColumnName='C_TaxWithholding_ID', Name='C_TaxWithholding_ID', Description=NULL, Help=NULL WHERE AD_Element_ID=3000124
;

-- 07/07/2012 14:38:19 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Process_Para SET ColumnName='C_TaxWithholding_ID', Name='C_TaxWithholding_ID', Description=NULL, Help=NULL, AD_Element_ID=3000124 WHERE UPPER(ColumnName)='C_TAXWITHHOLDING_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 07/07/2012 14:38:19 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Process_Para SET ColumnName='C_TaxWithholding_ID', Name='C_TaxWithholding_ID', Description=NULL, Help=NULL WHERE AD_Element_ID=3000124 AND IsCentrallyMaintained='Y'
;

-- 07/07/2012 14:38:19 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET Name='C_TaxWithholding_ID', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000124) AND IsCentrallyMaintained='Y'
;

-- 07/07/2012 14:38:19 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_PrintFormatItem SET PrintName='C_TaxWithholding_ID', Name='C_TaxWithholding_ID' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000124)
;

-- 07/07/2012 15:02:13 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000021,'T','LAR','N','LAR C_TaxWithholding_ID',0,0,100,TO_TIMESTAMP('2012-07-07 15:02:12','YYYY-MM-DD HH24:MI:SS'),'Y',TO_TIMESTAMP('2012-07-07 15:02:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 07/07/2012 15:02:13 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000021 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 07/07/2012 15:09:05 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
INSERT INTO AD_Ref_Table (IsValueDisplayed,WhereClause,AD_Table_ID,AD_Reference_ID,AD_Key,AD_Display,EntityType,CreatedBy,Created,Updated,AD_Client_ID,UpdatedBy,AD_Org_ID,IsActive) VALUES ('N','C_Tax.C_TaxCategory_ID=(SELECT C_TaxCategory_ID FROM C_TaxCategory WHERE name = ''Retenciones Sufridas'')',261,3000021,2240,2246,'LAR',100,TO_TIMESTAMP('2012-07-07 15:09:05','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-07-07 15:09:05','YYYY-MM-DD HH24:MI:SS'),0,100,0,'Y')
;

-- 07/07/2012 15:10:06 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Column SET AD_Reference_Value_ID=3000021, AD_Reference_ID=18,Updated=TO_TIMESTAMP('2012-07-07 15:10:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000816
;

-- 10/07/2012 22:58:12 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3000885,0,'Y','N','N',3000816,'N',670,'Y',1000012,'N','@C_Invoice_ID@^'''' & @WriteOffAmt@!0','U','C_TaxWithholding_ID',100,0,TO_TIMESTAMP('2012-07-10 22:58:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2012-07-10 22:58:10','YYYY-MM-DD HH24:MI:SS'))
;

-- 10/07/2012 22:58:12 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000885 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/07/2012 22:59:51 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3000886,0,'Y','N','N',3000816,'N',660,'Y',3000013,'N','@C_Invoice_ID@^'''' & @WriteOffAmt@!0','U','C_TaxWithholding_ID',100,0,TO_TIMESTAMP('2012-07-10 22:59:50','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2012-07-10 22:59:50','YYYY-MM-DD HH24:MI:SS'))
;

-- 10/07/2012 22:59:51 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000886 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/07/2012 23:04:29 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000886
;

-- 10/07/2012 23:04:29 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000323
;

-- 10/07/2012 23:04:29 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000324
;

-- 10/07/2012 23:04:29 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000327
;

-- 10/07/2012 23:04:29 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000328
;

-- 10/07/2012 23:04:29 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000329
;

-- 10/07/2012 23:04:29 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000330
;

-- 10/07/2012 23:04:29 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3000331
;

-- 10/07/2012 23:04:29 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000332
;

-- 10/07/2012 23:04:29 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000333
;

-- 10/07/2012 23:04:29 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000334
;

-- 10/07/2012 23:04:29 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000335
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000336
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000337
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000338
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000339
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000340
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000341
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000342
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000343
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000344
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000345
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000346
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000347
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000348
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000349
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000350
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000351
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000352
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000353
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000354
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000355
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000356
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000357
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000358
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000359
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000360
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000363
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000302
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000368
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000369
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000362
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000289
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000364
;

-- 10/07/2012 23:04:30 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3000366
;

-- 10/07/2012 23:21:25 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000885
;

-- 10/07/2012 23:21:25 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=1000222
;

-- 10/07/2012 23:21:25 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=1000223
;

-- 10/07/2012 23:21:25 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=1000226
;

-- 10/07/2012 23:21:25 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=1000227
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=1000228
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=1000229
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=1000230
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=1000231
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=1000232
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=1000233
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=1000234
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=1000235
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=1000236
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=1000237
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=1000238
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=1000239
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=1000240
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=1000241
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=1000242
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=1000243
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=1000244
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=1000245
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=1000246
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=1000247
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=1000248
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=1000249
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=1000250
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=1000251
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=1000252
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=1000253
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=1000254
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=1000255
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=1000256
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=1000257
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=1000258
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=1000259
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=1000260
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=1000261
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=1000262
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=1000263
;

-- 10/07/2012 23:21:26 GMT-03:00
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=1000264
;

-- 23/07/2012 18:27:44 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000125,'withholdingcertno','LAR','withholdingcertno','withholdingcertno',0,TO_TIMESTAMP('2012-07-23 18:27:43','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-07-23 18:27:43','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 23/07/2012 18:27:44 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000125 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 23/07/2012 18:27:44 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000820,335,'LAR',0,'N','N','N','N',20,'N',10,'N',3000125,'N','Y','N','withholdingcertno','withholdingcertno',100,TO_TIMESTAMP('2012-07-23 18:27:43','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-07-23 18:27:43','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/07/2012 18:27:44 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000820 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/07/2012 18:29:23 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Element SET ColumnName='WithholdingCertNo', Name='WithholdingCertNo', PrintName='WithholdingCertNo',Updated=TO_TIMESTAMP('2012-07-23 18:29:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000125
;

-- 23/07/2012 18:29:23 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000125
;

-- 23/07/2012 18:29:23 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Column SET ColumnName='WithholdingCertNo', Name='WithholdingCertNo', Description=NULL, Help=NULL WHERE AD_Element_ID=3000125
;

-- 23/07/2012 18:29:23 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Process_Para SET ColumnName='WithholdingCertNo', Name='WithholdingCertNo', Description=NULL, Help=NULL, AD_Element_ID=3000125 WHERE UPPER(ColumnName)='WITHHOLDINGCERTNO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 23/07/2012 18:29:23 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Process_Para SET ColumnName='WithholdingCertNo', Name='WithholdingCertNo', Description=NULL, Help=NULL WHERE AD_Element_ID=3000125 AND IsCentrallyMaintained='Y'
;

-- 23/07/2012 18:29:23 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET Name='WithholdingCertNo', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000125) AND IsCentrallyMaintained='Y'
;

-- 23/07/2012 18:29:23 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_PrintFormatItem SET PrintName='WithholdingCertNo', Name='WithholdingCertNo' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000125)
;

-- 23/07/2012 18:50:38 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET EntityType='LAR',Updated=TO_TIMESTAMP('2012-07-23 18:50:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000885
;

-- 23/07/2012 18:52:32 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3000887,0,'Y','N','N',3000820,'N',680,'Y',1000012,'N','@C_Invoice_ID@^'''' & @WriteOffAmt@!0','LAR','WithholdingCertNo',100,0,TO_TIMESTAMP('2012-07-23 18:52:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2012-07-23 18:52:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/07/2012 18:52:32 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000887 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000887
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=1000222
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=1000223
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=1000226
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=1000227
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=1000228
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=1000229
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=1000230
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=1000231
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=1000232
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=1000233
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=1000234
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=1000235
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=1000236
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=1000237
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=1000238
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=1000239
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=1000240
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=1000241
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=1000242
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=1000243
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=1000244
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=1000245
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=1000246
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=1000247
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=1000248
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=1000249
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=1000250
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=1000251
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=1000252
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=1000253
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=1000254
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=1000255
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=1000256
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=1000257
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=1000258
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=1000259
;

-- 23/07/2012 18:58:24 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=1000260
;

-- 23/07/2012 18:58:25 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=1000261
;

-- 23/07/2012 18:58:25 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=1000262
;

-- 23/07/2012 18:58:25 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=1000263
;

-- 23/07/2012 18:58:25 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=680,IsDisplayed='Y' WHERE AD_Field_ID=1000264
;

-- 23/07/2012 18:59:04 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2012-07-23 18:59:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000887
;

-- 23/07/2012 21:19:26 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET EntityType='LAR',Updated=TO_TIMESTAMP('2012-07-23 21:19:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000886
;

-- 23/07/2012 21:20:17 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3000888,0,'Y','N','N',3000820,'N',670,'Y',3000013,'Y','@C_Invoice_ID@^'''' & @WriteOffAmt@!0','LAR','WithholdingCertNo',100,0,TO_TIMESTAMP('2012-07-23 21:20:14','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2012-07-23 21:20:14','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/07/2012 21:20:17 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000888 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000888
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000323
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000324
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000327
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000328
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000329
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3000330
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000331
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000332
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000333
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000334
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000335
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000336
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000337
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000338
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000339
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000340
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000341
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000342
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000343
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000344
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000345
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000346
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000347
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000348
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000349
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000350
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000351
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000352
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000353
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000354
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000355
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000356
;

-- 23/07/2012 21:27:30 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000357
;

-- 23/07/2012 21:27:31 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000358
;

-- 23/07/2012 21:27:31 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000359
;

-- 23/07/2012 21:27:31 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000360
;

-- 23/07/2012 21:27:31 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000363
;

-- 23/07/2012 21:27:31 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000302
;

-- 23/07/2012 21:27:31 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000368
;

-- 23/07/2012 21:27:31 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000369
;

-- 23/07/2012 21:27:31 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000362
;

-- 23/07/2012 21:27:31 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000289
;

-- 23/07/2012 21:27:31 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3000364
;

-- 23/07/2012 21:27:31 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=3000366
;

-- 23/07/2012 21:28:47 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Field SET IsSameLine='Y', IsReadOnly='N',Updated=TO_TIMESTAMP('2012-07-23 21:28:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000888
;

-- 24/07/2012 17:55:57 ART
-- Add C_TaxWitholding_ID and WithholdingCertNo columns with their logics
UPDATE AD_Column SET Callout='org.compiere.model.CalloutPayment.amounts;ar.com.ergio.model.LAR_CalloutWithholding.withholdingTax',Updated=TO_TIMESTAMP('2012-07-24 17:55:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=6475
;

-- 29/07/2012 0:13:38 ART
-- Show Invoice Info on Header 
UPDATE AD_Column SET ColumnSQL='((SELECT InvoiceOpen( C_Invoice_ID, 0) FROM C_Invoice i WHERE i.C_Invoice_ID = LAR_PaymentHeader.C_Invoice_ID) - ((SELECT COALESCE(Sum(PayAmt),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID) + (SELECT COALESCE(Sum(WriteOffAmt),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID)))',Updated=TO_TIMESTAMP('2012-07-29 00:13:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000264
;

-- 29/07/2012 0:17:37 ART
-- Show Invoice Info on Header 
UPDATE AD_Column SET ColumnSQL='(COALESCE((SELECT InvoiceOpen( C_Invoice_ID, 0) FROM C_Invoice i WHERE i.C_Invoice_ID = LAR_PaymentHeader.C_Invoice_ID),0))',Updated=TO_TIMESTAMP('2012-07-29 00:17:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000263
;

-- 29/07/2012 0:18:49 ART
-- Show Invoice Info on Header 
UPDATE AD_Column SET ColumnSQL='((SELECT COALESCE(Sum(PayAmt),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID) + (SELECT COALESCE(Sum(WriteOffAmt),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID))',Updated=TO_TIMESTAMP('2012-07-29 00:18:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000262
;

-- 29/07/2012 0:24:45 ART
-- Show Invoice Info on Header 
UPDATE AD_Column SET DefaultValue=NULL,Updated=TO_TIMESTAMP('2012-07-29 00:24:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000241
;

-- 29/07/2012 9:35:26 ART
-- Add mandatory logic to C_TaxWithholding_id y WithholdingcertNo
UPDATE AD_Column SET MandatoryLogic='@WriteOffAmt@>0',Updated=TO_TIMESTAMP('2012-07-29 09:35:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000820
;

-- 29/07/2012 9:35:40 ART
-- Add mandatory logic to C_TaxWithholding_id y WithholdingcertNo
UPDATE AD_Column SET MandatoryLogic='@WriteOffAmt@>0',Updated=TO_TIMESTAMP('2012-07-29 09:35:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000816
;

-- 29/07/2012 10:42:45 ART
-- Do not display Remaining Amount if the invoice is processed
UPDATE AD_Field SET DisplayLogic='@C_Invoice_ID@>0 & @Processed@=N',Updated=TO_TIMESTAMP('2012-07-29 10:42:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000602
;

-- 27/07/2012 22:45:08 ART
-- Add mandatory logic to C_TaxWithholding_id y WithholdingcertNo
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype) VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'PaymentNotAllowed', 'Payment not allowed', null, 'I', 'LAR')
;

-- 27/07/2012 22:45:08 ART
-- Add mandatory logic to C_TaxWithholding_id y WithholdingcertNo
INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated) VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Pago no permitido', null, 'Y')
;

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9
;

-- 30/07/2012 13:08:36 ART
-- Set C_Bpartner as not updateable on LAR_Payment_Header
UPDATE AD_Column SET IsUpdateable='N',Updated=TO_TIMESTAMP('2012-07-30 13:08:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000239
;

-- 30/07/2012 13:10:36 ART
-- Do not display Invoice Amt/Remaining Amt if the invoice is processed
UPDATE AD_Field SET DisplayLogic='@C_Invoice_ID@>0 & @Processed@=N',Updated=TO_TIMESTAMP('2012-07-30 13:10:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000601
;

-- 30/07/2012 13:11:25 ART
-- Do not display Invoice Amt/Remaining Amt if the invoice is processed
UPDATE AD_Field SET DisplayLogic='@C_Invoice_ID@>0  & @Processed@=N',Updated=TO_TIMESTAMP('2012-07-30 13:11:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000767
;

-- 30/07/2012 13:11:39 ART
-- Do not display Invoice Amt/Remaining Amt if the invoice is processed
UPDATE AD_Field SET DisplayLogic='@C_Invoice_ID@>0  & @Processed@=N',Updated=TO_TIMESTAMP('2012-07-30 13:11:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000765
;

-- 30/07/2012 13:12:35 ART
-- Do not display Invoice Amt/Remaining Amt if the invoice is processed
UPDATE AD_Field SET DisplayLogic='@C_Invoice_ID@>0  & @Processed@=N',Updated=TO_TIMESTAMP('2012-07-30 13:12:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000600
;

-- 30/07/2012 13:12:51 ART
-- Do not display Invoice Amt/Remaining Amt if the invoice is processed
UPDATE AD_Field SET DisplayLogic='@C_Invoice_ID@>0 & @Processed@=N',Updated=TO_TIMESTAMP('2012-07-30 13:12:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000599
;

