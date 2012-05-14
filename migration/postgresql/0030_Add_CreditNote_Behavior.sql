-- Add credit note behavior
ALTER TABLE C_Invoice ADD COLUMN Source_Invoice_ID Numeric(10,0) NULL;
ALTER TABLE C_Invoice ADD CONSTRAINT sourceinvoice_cinvoice
    FOREIGN KEY (Source_Invoice_ID) REFERENCES C_Invoice (C_Invoice_ID);

-- 12/05/2012 14:57:42 GMT-03:00
-- Add credit note behavior
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000079,'source_invoice_id','LAR','source_invoice_id','source_invoice_id',0,TO_TIMESTAMP('2012-05-12 14:57:40','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-05-12 14:57:40','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 12/05/2012 14:57:42 GMT-03:00
-- Add credit note behavior
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000079 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 12/05/2012 14:57:42 GMT-03:00
-- Add credit note behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000265,318,'LAR',0,'N','N','N','N',10,'N',19,'N',3000079,'N','Y','N','source_invoice_id','source_invoice_id',100,TO_TIMESTAMP('2012-05-12 14:57:40','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-05-12 14:57:40','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 12/05/2012 14:57:42 GMT-03:00
-- Add credit note behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000265 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 12/05/2012 14:58:25 GMT-03:00
-- Add credit note behavior
UPDATE AD_Element SET ColumnName='Source_Invoice_ID', Name='Source_Invoice_ID', PrintName='Source_Invoice_ID',Updated=TO_TIMESTAMP('2012-05-12 14:58:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000079
;

-- 12/05/2012 14:58:25 GMT-03:00
-- Add credit note behavior
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000079
;

-- 12/05/2012 14:58:25 GMT-03:00
-- Add credit note behavior
UPDATE AD_Column SET ColumnName='Source_Invoice_ID', Name='Source_Invoice_ID', Description=NULL, Help=NULL WHERE AD_Element_ID=3000079
;

-- 12/05/2012 14:58:25 GMT-03:00
-- Add credit note behavior
UPDATE AD_Process_Para SET ColumnName='Source_Invoice_ID', Name='Source_Invoice_ID', Description=NULL, Help=NULL, AD_Element_ID=3000079 WHERE UPPER(ColumnName)='SOURCE_INVOICE_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 12/05/2012 14:58:25 GMT-03:00
-- Add credit note behavior
UPDATE AD_Process_Para SET ColumnName='Source_Invoice_ID', Name='Source_Invoice_ID', Description=NULL, Help=NULL WHERE AD_Element_ID=3000079 AND IsCentrallyMaintained='Y'
;

-- 12/05/2012 14:58:25 GMT-03:00
-- Add credit note behavior
UPDATE AD_Field SET Name='Source_Invoice_ID', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000079) AND IsCentrallyMaintained='Y'
;

-- 12/05/2012 14:58:25 GMT-03:00
-- Add credit note behavior
UPDATE AD_PrintFormatItem SET PrintName='Source_Invoice_ID', Name='Source_Invoice_ID' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000079)
;

-- 12/05/2012 15:04:17 GMT-03:00
-- Add credit note behavior
UPDATE AD_Column SET AD_Reference_ID=30,Updated=TO_TIMESTAMP('2012-05-12 15:04:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000265
;

-- 12/05/2012 15:22:15 GMT-03:00
-- Add credit note behavior
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3000603,0,'Y','N','N',3000265,'N',510,'Y',263,'N','LAR','Source_Invoice_ID',100,0,TO_TIMESTAMP('2012-05-12 15:22:14','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2012-05-12 15:22:14','YYYY-MM-DD HH24:MI:SS'))
;

-- 12/05/2012 15:22:15 GMT-03:00
-- Add credit note behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000603 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 12/05/2012 15:32:38 GMT-03:00
-- Add credit note behavior
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000603
;

-- 12/05/2012 15:32:38 GMT-03:00
-- Add credit note behavior
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=6564
;

-- 12/05/2012 15:32:38 GMT-03:00
-- Add credit note behavior
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=2777
;

-- 12/05/2012 15:32:38 GMT-03:00
-- Add credit note behavior
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3663
;

-- 12/05/2012 15:32:38 GMT-03:00
-- Add credit note behavior
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3899
;

-- 12/05/2012 15:32:38 GMT-03:00
-- Add credit note behavior
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=13700
;

-- 12/05/2012 15:32:38 GMT-03:00
-- Add credit note behavior
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=53257
;

-- 12/05/2012 15:32:38 GMT-03:00
-- Add credit note behavior
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=53258
;

-- 12/05/2012 15:32:38 GMT-03:00
-- Add credit note behavior
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=60970
;

-- 12/05/2012 15:32:38 GMT-03:00
-- Add credit note behavior
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000027
;

-- 12/05/2012 15:32:38 GMT-03:00
-- Add credit note behavior
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000028
;

-- 12/05/2012 15:32:38 GMT-03:00
-- Add credit note behavior
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000025
;

-- 12/05/2012 15:32:38 GMT-03:00
-- Add credit note behavior
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000026
;

-- 12/05/2012 18:05:35 GMT-03:00
-- Add credit note behavior
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000080,'TargetDocBaseType','LAR','TargetDocBaseType','TargetDocBaseType',0,TO_TIMESTAMP('2012-05-12 18:05:34','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-05-12 18:05:34','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 12/05/2012 18:05:35 GMT-03:00
-- Add credit note behavior
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000080 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 12/05/2012 18:18:29 GMT-03:00
-- Add credit note behavior
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('(SELECT d.DocBaseType FROM C_DocType d WHERE C_Invoice.C_DocTypeTarget_ID=d.C_DocType_ID)',3000266,318,'U',0,'N','N','N',0,'N',5,'N',10,'N','N',3000080,'N','Y','N','N','N','TargetDocBaseType','TargetDocBaseType','N',100,TO_TIMESTAMP('2012-05-12 18:18:29','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-05-12 18:18:29','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 12/05/2012 18:18:30 GMT-03:00
-- Add credit note behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000266 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 12/05/2012 19:06:21 GMT-03:00
-- Add credit note behavior
UPDATE AD_Field SET DisplayLogic='@TargetDocBaseType@=''ARC''',Updated=TO_TIMESTAMP('2012-05-12 19:06:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000603
;

-- 12/05/2012 19:07:36 GMT-03:00
-- Add credit note behavior
UPDATE AD_Field SET DisplayLogic='@TargetDocBaseType@!''ARC''',Updated=TO_TIMESTAMP('2012-05-12 19:07:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=6564
;

-- 12/05/2012 19:17:27 GMT-03:00
-- Add credit note behavior
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000012,'T','LAR','N','LAR_Invoices_For_Credit_Note',0,0,100,TO_TIMESTAMP('2012-05-12 19:17:25','YYYY-MM-DD HH24:MI:SS'),'Y',TO_TIMESTAMP('2012-05-12 19:17:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 12/05/2012 19:17:27 GMT-03:00
-- Add credit note behavior
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000012 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 12/05/2012 19:38:36 GMT-03:00
-- Add credit note behavior
INSERT INTO AD_Ref_Table (IsValueDisplayed,WhereClause,AD_Table_ID,AD_Reference_ID,AD_Key,AD_Display,EntityType,CreatedBy,Created,Updated,UpdatedBy,AD_Client_ID,AD_Org_ID,IsActive) VALUES ('N','C_Invoice.IsActive=''Y'' AND C_Invoice.DocStatus=''CO'' AND C_Invoice.AD_Client_ID=@#AD_Client_ID@ AND C_Invoice.C_DocTypeTarget_ID IN (SELECT C_DocType_ID FROM C_DocType WHERE DocBaseType=''ARI'')',318,3000012,3484,3492,'LAR',100,TO_TIMESTAMP('2012-05-12 19:38:36','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-05-12 19:38:36','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y')
;

-- 12/05/2012 19:39:23 GMT-03:00
-- Add credit note behavior
UPDATE AD_Column SET AD_Reference_Value_ID=3000012,Updated=TO_TIMESTAMP('2012-05-12 19:39:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000265
;

-- 12/05/2012 19:42:34 GMT-03:00
-- Add credit note behavior
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3000605,0,'Y','N','N',3000266,'N',520,'Y',263,'N','1=2','LAR','TargetDocBaseType',100,0,TO_TIMESTAMP('2012-05-12 19:42:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2012-05-12 19:42:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 12/05/2012 19:42:34 GMT-03:00
-- Add credit note behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000605 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 13/05/2012 20:05:14 GMT-03:00
-- Add credit note behavior
UPDATE AD_Column SET Callout='ar.com.ergio.model.LAR_Callouts.copyLines',Updated=TO_TIMESTAMP('2012-05-13 20:05:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000265
;
