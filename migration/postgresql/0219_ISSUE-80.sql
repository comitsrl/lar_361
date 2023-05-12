ALTER TABLE LAR_Plan_Pago ADD COLUMN AplicaEnSaldo character(1) COLLATE pg_catalog."default" NOT NULL DEFAULT 'N'::bpchar;

-- 24/04/2023 0:38:35 ART
-- ADP #3: Aplica descuento en Saldo
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001393,'aplicaensaldo','LAR','aplicaensaldo','aplicaensaldo',0,TO_TIMESTAMP('2023-04-24 00:38:34','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2023-04-24 00:38:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 24/04/2023 0:38:35 ART
-- ADP #3: Aplica descuento en Saldo
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001393 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 24/04/2023 0:38:35 ART
-- ADP #3: Aplica descuento en Saldo
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005573,3000033,'LAR',0,'Y','N','N','N',1,'N',20,'N',3001393,'N','Y','N','aplicaensaldo','aplicaensaldo',TO_TIMESTAMP('2023-04-24 00:38:34','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-04-24 00:38:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/04/2023 0:38:35 ART
-- ADP #3: Aplica descuento en Saldo
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005573 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/04/2023 0:41:21 ART
-- ADP #3: Aplica descuento en Saldo
UPDATE AD_Element SET ColumnName='AplicaEnSaldo', Name='Aplica en Saldo', PrintName='Aplica en Saldo',Updated=TO_TIMESTAMP('2023-04-24 00:41:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001393
;

-- 24/04/2023 0:41:21 ART
-- ADP #3: Aplica descuento en Saldo
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001393
;

-- 24/04/2023 0:41:21 ART
-- ADP #3: Aplica descuento en Saldo
UPDATE AD_Column SET ColumnName='AplicaEnSaldo', Name='Aplica en Saldo', Description=NULL, Help=NULL WHERE AD_Element_ID=3001393
;

-- 24/04/2023 0:41:21 ART
-- ADP #3: Aplica descuento en Saldo
UPDATE AD_Process_Para SET ColumnName='AplicaEnSaldo', Name='Aplica en Saldo', Description=NULL, Help=NULL, AD_Element_ID=3001393 WHERE UPPER(ColumnName)='APLICAENSALDO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 24/04/2023 0:41:21 ART
-- ADP #3: Aplica descuento en Saldo
UPDATE AD_Process_Para SET ColumnName='AplicaEnSaldo', Name='Aplica en Saldo', Description=NULL, Help=NULL WHERE AD_Element_ID=3001393 AND IsCentrallyMaintained='Y'
;

-- 24/04/2023 0:41:21 ART
-- ADP #3: Aplica descuento en Saldo
UPDATE AD_Field SET Name='Aplica en Saldo', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001393) AND IsCentrallyMaintained='Y'
;

-- 24/04/2023 0:41:21 ART
-- ADP #3: Aplica descuento en Saldo
UPDATE AD_PrintFormatItem SET PrintName='Aplica en Saldo', Name='Aplica en Saldo' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001393)
;

-- 24/04/2023 0:41:25 ART
-- ADP #3: Aplica descuento en Saldo
UPDATE AD_Element_Trl SET Name='Aplica en Saldo',PrintName='Aplica en Saldo',Updated=TO_TIMESTAMP('2023-04-24 00:41:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001393 AND AD_Language='es_AR'
;

-- 24/04/2023 0:41:34 ART
-- ADP #3: Aplica descuento en Saldo
UPDATE AD_Column_Trl SET Name='Aplica en Saldo',Updated=TO_TIMESTAMP('2023-04-24 00:41:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005573 AND AD_Language='es_AR'
;

-- 24/04/2023 0:42:24 ART
-- ADP #3: Aplica descuento en Saldo
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008389,1,'Y','N','N',3005573,'N','Y',3000057,'N','LAR','Aplica en Saldo',100,0,'Y',TO_TIMESTAMP('2023-04-24 00:42:24','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-04-24 00:42:24','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/04/2023 0:42:24 ART
-- ADP #3: Aplica descuento en Saldo
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008389 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 24/04/2023 0:42:33 ART
-- ADP #3: Aplica descuento en Saldo
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3008389
;

-- 24/04/2023 0:42:33 ART
-- ADP #3: Aplica descuento en Saldo
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3001894
;

-- 24/04/2023 0:42:41 ART
-- ADP #3: Aplica descuento en Saldo
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2023-04-24 00:42:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001894
;

-- Registración de script
SELECT register_migration_script_lar('0219_ISSUE-80.sql', 'LAR', '')
;
