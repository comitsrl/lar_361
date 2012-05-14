-- Add payment doctype to POS
ALTER TABLE C_POS ADD COLUMN C_Payment_DocType_ID Numeric(10,0);

-- 14/05/2012 10:53:06 ART
-- Add payment doctype to POS
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000087,'C_Payment_DocType_ID','LAR','C_Payment_DocType_ID','C_Payment_DocType_ID',0,TO_TIMESTAMP('2012-04-30 18:23:39','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-04-30 18:23:39','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,0)
;

-- 14/05/2012 10:53:06 ART
-- Add payment doctype to POS
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,PO_Name,Name,Description,PrintName,PO_PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.PO_Name,t.Name,t.Description,t.PrintName,t.PO_PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000087 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 14/05/2012 10:53:06 ART
-- Add payment doctype to POS
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000277,748,'LAR',0,'N','N','N','N',10,'N',19,'N',3000087,'N','Y','N','c_payment_doctype_id','c_payment_doctype_id',100,TO_TIMESTAMP('2012-05-14 10:53:05','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-05-14 10:53:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/05/2012 10:53:06 ART
-- Add payment doctype to POS
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000277 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 14/05/2012 10:54:21 ART
-- Add payment doctype to POS
UPDATE AD_Element SET ColumnName='C_Payment_DocType_ID', Name='C_Payment_DocType_ID', PrintName='C_Payment_DocType_ID',Updated=TO_TIMESTAMP('2012-05-14 10:54:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000087
;

-- 14/05/2012 10:54:21 ART
-- Add payment doctype to POS
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000087
;

-- 14/05/2012 10:54:21 ART
-- Add payment doctype to POS
UPDATE AD_Column SET ColumnName='C_Payment_DocType_ID', Name='C_Payment_DocType_ID', Description=NULL, Help=NULL WHERE AD_Element_ID=3000087
;

-- 14/05/2012 10:54:22 ART
-- Add payment doctype to POS
UPDATE AD_Process_Para SET ColumnName='C_Payment_DocType_ID', Name='C_Payment_DocType_ID', Description=NULL, Help=NULL, AD_Element_ID=3000087 WHERE UPPER(ColumnName)='C_PAYMENT_DOCTYPE_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 14/05/2012 10:54:22 ART
-- Add payment doctype to POS
UPDATE AD_Process_Para SET ColumnName='C_Payment_DocType_ID', Name='C_Payment_DocType_ID', Description=NULL, Help=NULL WHERE AD_Element_ID=3000087 AND IsCentrallyMaintained='Y'
;

-- 14/05/2012 10:54:22 ART
-- Add payment doctype to POS
UPDATE AD_Field SET Name='C_Payment_DocType_ID', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000087) AND IsCentrallyMaintained='Y'
;

-- 14/05/2012 10:54:22 ART
-- Add payment doctype to POS
UPDATE AD_PrintFormatItem SET PrintName='C_Payment_DocType_ID', Name='C_Payment_DocType_ID' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000087)
;

-- 14/05/2012 10:55:27 ART
-- Add payment doctype to POS
UPDATE AD_Column SET AD_Reference_Value_ID=170, IsMandatory='Y', AD_Reference_ID=18,Updated=TO_TIMESTAMP('2012-05-14 10:55:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000277
;

-- 14/05/2012 11:00:17 ART
-- Add payment doctype to POS
UPDATE AD_Column SET IsMandatory='Y', AD_Val_Rule_ID=3000004,Updated=TO_TIMESTAMP('2012-05-14 11:00:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=54236
;

-- 14/05/2012 11:11:44 ART
-- Add payment doctype to POS
UPDATE AD_Column SET IsMandatory='Y',Updated=TO_TIMESTAMP('2012-05-14 11:11:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=12795
;

-- 14/05/2012 11:11:58 ART
-- Add payment doctype to POS
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000742,10,'Y','N','N',3000277,'N','Y',676,'N','LAR','C_Payment_DocType_ID',100,0,TO_TIMESTAMP('2012-05-14 11:11:58','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2012-05-14 11:11:58','YYYY-MM-DD HH24:MI:SS'))
;

-- 14/05/2012 11:11:58 ART
-- Add payment doctype to POS
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000742 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/05/2012 11:14:10 ART
-- Add payment doctype to POS
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000742
;

-- 14/05/2012 11:14:10 ART
-- Add payment doctype to POS
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=10810
;

-- 14/05/2012 11:14:10 ART
-- Add payment doctype to POS
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=10798
;

-- 14/05/2012 11:14:10 ART
-- Add payment doctype to POS
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=58808
;

-- 14/05/2012 11:14:10 ART
-- Add payment doctype to POS
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=58809
;

-- 14/05/2012 11:14:10 ART
-- Add payment doctype to POS
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=58810
;

-- 14/05/2012 11:14:10 ART
-- Add payment doctype to POS
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=10803
;

-- 14/05/2012 11:14:10 ART
-- Add payment doctype to POS
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=52017
;

-- 14/05/2012 11:14:10 ART
-- Add payment doctype to POS
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000084
;

-- 14/05/2012 11:14:10 ART
-- Add payment doctype to POS
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000086
;

-- 14/05/2012 11:14:10 ART
-- Add payment doctype to POS
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000087
;

-- 14/05/2012 11:14:10 ART
-- Add payment doctype to POS
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000085
;

-- 14/05/2012 11:14:26 ART
-- Add payment doctype to POS
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2012-05-14 11:14:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000742
;

-- 14/05/2012 11:14:32 ART
-- Add payment doctype to POS
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2012-05-14 11:14:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=10810
;

-- 14/05/2012 11:15:09 ART
-- Add payment doctype to POS
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2012-05-14 11:15:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=10798
;

-- 14/05/2012 11:15:14 ART
-- Add payment doctype to POS
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2012-05-14 11:15:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=58808
;

-- 14/05/2012 11:15:17 ART
-- Add payment doctype to POS
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2012-05-14 11:15:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=58809
;

-- 14/05/2012 11:15:30 ART
-- Add payment doctype to POS
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2012-05-14 11:15:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=58810
;

-- 14/05/2012 11:15:35 ART
-- Add payment doctype to POS
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2012-05-14 11:15:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=10803
;

-- 14/05/2012 11:19:05 ART
-- Add payment doctype to POS
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=52017
;

-- 14/05/2012 11:19:05 ART
-- Add payment doctype to POS
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=10803
;

-- 14/05/2012 11:19:05 ART
-- Add payment doctype to POS
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000084
;

-- 14/05/2012 11:19:05 ART
-- Add payment doctype to POS
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000086
;

-- 14/05/2012 11:19:05 ART
-- Add payment doctype to POS
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000087
;

-- 14/05/2012 11:19:05 ART
-- Add payment doctype to POS
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000085
;

-- 14/05/2012 11:22:25 ART
-- Add payment doctype to POS
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000085
;

-- 14/05/2012 11:22:25 ART
-- Add payment doctype to POS
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000087
;

-- 14/05/2012 11:22:33 ART
-- Add payment doctype to POS
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2012-05-14 11:22:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000085
;

-- 14/05/2012 11:22:36 ART
-- Add payment doctype to POS
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2012-05-14 11:22:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000087
;

-- 14/05/2012 11:28:01 ART
-- Add payment doctype to POS
UPDATE AD_Column SET AD_Val_Rule_ID=3000001,Updated=TO_TIMESTAMP('2012-05-14 11:28:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000277
;
