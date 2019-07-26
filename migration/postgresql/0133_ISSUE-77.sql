-- 26/07/2019 15:29:15 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001039,'cancelacion','LAR','cancelacion','cancelacion',0,TO_TIMESTAMP('2019-07-26 15:29:14','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2019-07-26 15:29:14','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 26/07/2019 15:29:15 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001039 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 26/07/2019 15:29:15 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003522,318,'LAR',0,'Y','N','N','N',1,'N',20,'N',3001039,'N','Y','N','cancelacion','cancelacion',100,TO_TIMESTAMP('2019-07-26 15:29:14','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2019-07-26 15:29:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/07/2019 15:29:15 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003522 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 26/07/2019 15:30:18 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Column SET Name='Cancelación', ColumnName='Cancelacion',Updated=TO_TIMESTAMP('2019-07-26 15:30:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003522
;

-- 26/07/2019 15:30:18 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003522
;

-- 26/07/2019 15:30:18 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET Name='Cancelación', Description=NULL, Help=NULL WHERE AD_Column_ID=3003522 AND IsCentrallyMaintained='Y'
;

-- 26/07/2019 15:30:23 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Column_Trl SET Name='Cancelación',Updated=TO_TIMESTAMP('2019-07-26 15:30:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003522 AND AD_Language='es_AR'
;

-- 26/07/2019 15:30:35 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Element SET ColumnName='Cancelacion', Name='Cancelación', PrintName='Cancelación',Updated=TO_TIMESTAMP('2019-07-26 15:30:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001039
;

-- 26/07/2019 15:30:35 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001039
;

-- 26/07/2019 15:30:35 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Column SET ColumnName='Cancelacion', Name='Cancelación', Description=NULL, Help=NULL WHERE AD_Element_ID=3001039
;

-- 26/07/2019 15:30:35 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Process_Para SET ColumnName='Cancelacion', Name='Cancelación', Description=NULL, Help=NULL, AD_Element_ID=3001039 WHERE UPPER(ColumnName)='CANCELACION' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 26/07/2019 15:30:35 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Process_Para SET ColumnName='Cancelacion', Name='Cancelación', Description=NULL, Help=NULL WHERE AD_Element_ID=3001039 AND IsCentrallyMaintained='Y'
;

-- 26/07/2019 15:30:35 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET Name='Cancelación', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001039) AND IsCentrallyMaintained='Y'
;

-- 26/07/2019 15:30:35 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_PrintFormatItem SET PrintName='Cancelación', Name='Cancelación' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001039)
;

-- 26/07/2019 15:30:43 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Element_Trl SET Name='Cancelación',PrintName='Cancelación',Updated=TO_TIMESTAMP('2019-07-26 15:30:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001039 AND AD_Language='es_AR'
;

-- 26/07/2019 15:32:51 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006572,1,'Y','N','N',3003522,'N','Y',263,'N','LAR','Cancelación',100,0,TO_TIMESTAMP('2019-07-26 15:32:50','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-07-26 15:32:50','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/07/2019 15:32:51 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006572 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 26/07/2019 15:40:40 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3006572
;

-- 26/07/2019 15:40:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=2778
;

-- 26/07/2019 15:40:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=2780
;

-- 26/07/2019 15:40:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=1000016
;

-- 26/07/2019 15:40:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=2771
;

-- 26/07/2019 15:40:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=6564
;

-- 26/07/2019 15:40:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=2777
;

-- 26/07/2019 15:40:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=8657
;

-- 26/07/2019 15:40:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3663
;

-- 26/07/2019 15:40:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=10485
;

-- 26/07/2019 15:40:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3899
;

-- 26/07/2019 15:40:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000025
;

-- 26/07/2019 15:40:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000026
;

-- 26/07/2019 15:40:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000605
;

-- 26/07/2019 15:40:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=53257
;

-- 26/07/2019 15:40:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=53258
;

-- 26/07/2019 15:40:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000028
;

-- 26/07/2019 15:40:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3002136
;

-- 26/07/2019 15:40:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=200050
;

-- 26/07/2019 15:40:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3002142
;

-- 26/07/2019 15:40:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3002138
;

-- 26/07/2019 15:40:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3004048
;

-- 26/07/2019 15:40:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3006573
;

-- 26/07/2019 15:41:02 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2019-07-26 15:41:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006572
;

-- 26/07/2019 16:40:45 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET DisplayLogic='@TargetDocBaseType@=''ARC''',Updated=TO_TIMESTAMP('2019-07-26 16:40:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006572
;

-- 26/07/2019 17:27:31 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET DisplayLogic='@TargetDocBaseType@=''ARC'' & @DocSubTypeCAE@ = 203 | @DocSubTypeCAE@ = 208 | @DocSubTypeCAE@ = 213',Updated=TO_TIMESTAMP('2019-07-26 17:27:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006572
;

-- 26/07/2019 17:32:23 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET DisplayLogic='@TargetDocBaseType@=''ARC'' | @DocSubTypeCAE@=202 | @DocSubTypeCAE@=207 | @DocSubTypeCAE@=212',Updated=TO_TIMESTAMP('2019-07-26 17:32:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000603
;

-- 26/07/2019 17:34:54 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field_Trl SET Name='Cancelación FCE',Updated=TO_TIMESTAMP('2019-07-26 17:34:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006572 AND AD_Language='es_AR'
;

-- 26/07/2019 17:35:06 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_TIMESTAMP('2019-07-26 17:35:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006572
;

-- Registración de script
SELECT register_migration_script_lar('0133_ISSUE-77.sql', 'LAR', '')
;
