ALTER TABLE C_BPartner
ADD COLUMN porcdiferenciaacordado numeric NOT NULL DEFAULT 0;

-- 20/03/2022 10:03:10 ART
-- ISSUE #114: Facturación Moneda Extrangera
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001239,'porcdiferenciaacordado','LAR','porcdiferenciaacordado','porcdiferenciaacordado',0,TO_TIMESTAMP('2022-03-20 10:03:10','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2022-03-20 10:03:10','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 20/03/2022 10:03:10 ART
-- ISSUE #114: Facturación Moneda Extrangera
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001239 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 20/03/2022 10:03:10 ART
-- ISSUE #114: Facturación Moneda Extrangera
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004437,291,'LAR',0,'Y','N','N','N',131089,'N',22,'N',3001239,'N','Y','N','porcdiferenciaacordado','porcdiferenciaacordado',100,TO_TIMESTAMP('2022-03-20 10:03:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2022-03-20 10:03:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 20/03/2022 10:03:10 ART
-- ISSUE #114: Facturación Moneda Extrangera
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004437 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 20/03/2022 10:07:15 ART
-- ISSUE #114: Facturación Moneda Extrangera
UPDATE AD_Element SET ColumnName='PorcDiferenciaAcordado', Name='PorcDiferenciaAcordado', PrintName='PorcDiferenciaAcordado',Updated=TO_TIMESTAMP('2022-03-20 10:07:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001239
;

-- 20/03/2022 10:07:15 ART
-- ISSUE #114: Facturación Moneda Extrangera
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001239
;

-- 20/03/2022 10:07:15 ART
-- ISSUE #114: Facturación Moneda Extrangera
UPDATE AD_Column SET ColumnName='PorcDiferenciaAcordado', Name='PorcDiferenciaAcordado', Description=NULL, Help=NULL WHERE AD_Element_ID=3001239
;

-- 20/03/2022 10:07:15 ART
-- ISSUE #114: Facturación Moneda Extrangera
UPDATE AD_Process_Para SET ColumnName='PorcDiferenciaAcordado', Name='PorcDiferenciaAcordado', Description=NULL, Help=NULL, AD_Element_ID=3001239 WHERE UPPER(ColumnName)='PORCDIFERENCIAACORDADO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 20/03/2022 10:07:15 ART
-- ISSUE #114: Facturación Moneda Extrangera
UPDATE AD_Process_Para SET ColumnName='PorcDiferenciaAcordado', Name='PorcDiferenciaAcordado', Description=NULL, Help=NULL WHERE AD_Element_ID=3001239 AND IsCentrallyMaintained='Y'
;

-- 20/03/2022 10:07:15 ART
-- ISSUE #114: Facturación Moneda Extrangera
UPDATE AD_Field SET Name='PorcDiferenciaAcordado', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001239) AND IsCentrallyMaintained='Y'
;

-- 20/03/2022 10:07:15 ART
-- ISSUE #114: Facturación Moneda Extrangera
UPDATE AD_PrintFormatItem SET PrintName='PorcDiferenciaAcordado', Name='PorcDiferenciaAcordado' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001239)
;

-- 20/03/2022 10:07:38 ART
-- ISSUE #114: Facturación Moneda Extrangera
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Porc. Diferencia Acordado',PrintName='Porc. Diferencia Acordado',Updated=TO_TIMESTAMP('2022-03-20 10:07:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001239 AND AD_Language='es_AR'
;

-- 20/03/2022 10:07:47 ART
-- ISSUE #114: Facturación Moneda Extrangera
UPDATE AD_Column SET FieldLength=22, Name='PorcDiferenciaAcordado', ColumnName='PorcDiferenciaAcordado',Updated=TO_TIMESTAMP('2022-03-20 10:07:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004437
;

-- 20/03/2022 10:12:29 ART
-- ISSUE #114: Facturación Moneda Extrangera
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007757,22,'Y','N','N',3004437,'N','Y',223,'N','LAR','PorcDiferenciaAcordado',100,0,TO_TIMESTAMP('2022-03-20 10:12:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2022-03-20 10:12:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 20/03/2022 10:12:29 ART
-- ISSUE #114: Facturación Moneda Extrangera
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007757 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 20/03/2022 10:13:05 ART
-- ISSUE #114: Facturación Moneda Extrangera
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3007757
;

-- 20/03/2022 10:13:05 ART
-- ISSUE #114: Facturación Moneda Extrangera
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3114
;

-- 20/03/2022 10:13:05 ART
-- ISSUE #114: Facturación Moneda Extrangera
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=2408
;

-- 20/03/2022 10:13:05 ART
-- ISSUE #114: Facturación Moneda Extrangera
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3524
;

-- 20/03/2022 10:13:05 ART
-- ISSUE #114: Facturación Moneda Extrangera
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=2434
;

-- 20/03/2022 10:13:05 ART
-- ISSUE #114: Facturación Moneda Extrangera
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3229
;

-- 20/03/2022 10:13:05 ART
-- ISSUE #114: Facturación Moneda Extrangera
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3276
;

-- 20/03/2022 10:13:05 ART
-- ISSUE #114: Facturación Moneda Extrangera
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3275
;

-- 20/03/2022 10:13:05 ART
-- ISSUE #114: Facturación Moneda Extrangera
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=7362
;

-- 20/03/2022 10:13:05 ART
-- ISSUE #114: Facturación Moneda Extrangera
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=8373
;

-- 20/03/2022 10:13:05 ART
-- ISSUE #114: Facturación Moneda Extrangera
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=2427
;

-- 20/03/2022 10:13:05 ART
-- ISSUE #114: Facturación Moneda Extrangera
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=2428
;

-- 20/03/2022 10:13:05 ART
-- ISSUE #114: Facturación Moneda Extrangera
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3002709
;

-- 20/03/2022 10:13:05 ART
-- ISSUE #114: Facturación Moneda Extrangera
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3006610
;

-- 20/03/2022 10:13:05 ART
-- ISSUE #114: Facturación Moneda Extrangera
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3006997
;

-- 20/03/2022 10:13:05 ART
-- ISSUE #114: Facturación Moneda Extrangera
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3006576
;

-- Registración de script
SELECT register_migration_script_lar('0208_ISSUE-114.sql', 'LAR', '')
;
