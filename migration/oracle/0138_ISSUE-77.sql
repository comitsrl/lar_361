ALTER TABLE C_BPartner ADD COLUMN DiasPagoFCE numeric(10,0) Default 0;

ALTER TABLE C_Invoice ALTER COLUMN FechaPago DROP default;

ALTER TABLE C_Invoice ALTER COLUMN FechaPago DROP NOT NULL;

-- 17/09/2019 16:19:10 ART
-- ISSUE #114: Dias de Pago FCE.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001045,'diaspagofce','LAR','diaspagofce','diaspagofce',0,TO_DATE('2019-09-17 16:19:09','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2019-09-17 16:19:09','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 17/09/2019 16:19:10 ART
-- ISSUE #114: Dias de Pago FCE.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001045 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 17/09/2019 16:19:10 ART
-- ISSUE #114: Dias de Pago FCE.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003528,291,'LAR',0,'N','N','N','N',10,'N',11,'N',3001045,'N','Y','N','diaspagofce','diaspagofce',100,TO_DATE('2019-09-17 16:19:09','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2019-09-17 16:19:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 17/09/2019 16:19:10 ART
-- ISSUE #114: Dias de Pago FCE.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003528 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 17/09/2019 16:20:23 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Column SET Name='Días de Pago FCE', ColumnName='DiasPagoFCE',Updated=TO_DATE('2019-09-17 16:20:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003528
;

-- 17/09/2019 16:20:23 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003528
;

-- 17/09/2019 16:20:23 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Field SET Name='Días de Pago FCE', Description=NULL, Help=NULL WHERE AD_Column_ID=3003528 AND IsCentrallyMaintained='Y'
;

-- 17/09/2019 16:20:46 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Column_Trl SET Name='Días de Pago FCE',Updated=TO_DATE('2019-09-17 16:20:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003528 AND AD_Language='es_AR'
;

-- 17/09/2019 16:21:04 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Element SET ColumnName='DiasPagoFCE', Name='Días de Pago FCE', PrintName='Días de Pago FCE',Updated=TO_DATE('2019-09-17 16:21:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001045
;

-- 17/09/2019 16:21:04 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001045
;

-- 17/09/2019 16:21:04 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Column SET ColumnName='DiasPagoFCE', Name='Días de Pago FCE', Description=NULL, Help=NULL WHERE AD_Element_ID=3001045
;

-- 17/09/2019 16:21:04 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Process_Para SET ColumnName='DiasPagoFCE', Name='Días de Pago FCE', Description=NULL, Help=NULL, AD_Element_ID=3001045 WHERE UPPER(ColumnName)='DIASPAGOFCE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 17/09/2019 16:21:04 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Process_Para SET ColumnName='DiasPagoFCE', Name='Días de Pago FCE', Description=NULL, Help=NULL WHERE AD_Element_ID=3001045 AND IsCentrallyMaintained='Y'
;

-- 17/09/2019 16:21:04 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Field SET Name='Días de Pago FCE', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001045) AND IsCentrallyMaintained='Y'
;

-- 17/09/2019 16:21:04 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_PrintFormatItem pi SET PrintName='Días de Pago FCE', Name='Días de Pago FCE' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001045)
;

-- 17/09/2019 16:21:10 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Element_Trl SET Name='Días de Pago FCE',PrintName='Días de Pago FCE',Updated=TO_DATE('2019-09-17 16:21:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001045 AND AD_Language='es_AR'
;

-- 17/09/2019 16:23:11 ART
-- ISSUE #114: Dias de Pago FCE.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006610,10,'Y','N','N',3003528,'N','Y',223,'N','LAR','Días de Pago FCE',100,0,TO_DATE('2019-09-17 16:23:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2019-09-17 16:23:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 17/09/2019 16:23:11 ART
-- ISSUE #114: Dias de Pago FCE.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006610 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 17/09/2019 16:25:10 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=9657
;

-- 17/09/2019 16:25:10 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=2420
;

-- 17/09/2019 16:25:10 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3522
;

-- 17/09/2019 16:25:10 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=9640
;

-- 17/09/2019 16:25:10 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=2429
;

-- 17/09/2019 16:25:10 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3523
;

-- 17/09/2019 16:25:10 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=5282
;

-- 17/09/2019 16:25:10 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3526
;

-- 17/09/2019 16:25:10 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=10471
;

-- 17/09/2019 16:25:10 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3005535
;

-- 17/09/2019 16:25:10 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3114
;

-- 17/09/2019 16:25:10 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=2408
;

-- 17/09/2019 16:25:10 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3524
;

-- 17/09/2019 16:25:10 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=2434
;

-- 17/09/2019 16:25:10 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3229
;

-- 17/09/2019 16:25:10 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3276
;

-- 17/09/2019 16:25:10 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3275
;

-- 17/09/2019 16:25:10 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=7362
;

-- 17/09/2019 16:25:10 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=8373
;

-- 17/09/2019 16:25:10 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=2427
;

-- 17/09/2019 16:25:10 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=2428
;

-- 17/09/2019 16:25:10 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3002709
;

-- 17/09/2019 16:25:10 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3006610
;

-- 17/09/2019 16:25:10 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3006576
;

-- 17/09/2019 16:25:19 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2019-09-17 16:25:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006610
;

-- 17/09/2019 16:25:28 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2019-09-17 16:25:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006576
;

-- 17/09/2019 16:25:35 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Field SET DisplayLogic='@IsCustomer@=''Y''',Updated=TO_DATE('2019-09-17 16:25:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006610
;

-- 17/09/2019 18:30:51 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Field SET DisplayLogic=NULL,Updated=TO_DATE('2019-09-17 18:30:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006608
;

-- 17/09/2019 18:55:02 ART
-- ISSUE #114: Dias de Pago FCE.
UPDATE AD_Column SET DefaultValue=NULL,Updated=TO_DATE('2019-09-17 18:55:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003527
;

-- Registración de script
SELECT register_migration_script_lar('0138_ISSUE-77.sql', 'LAR', '') FROM dual
;
