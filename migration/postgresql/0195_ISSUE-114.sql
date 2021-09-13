ALTER TABLE C_Payment ADD COLUMN EsDiferenciaCambio character(1) NOT NULL DEFAULT 'N'::bpchar;

-- 13/09/2021 16:37:48 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001186,'esdiferenciacambio','LAR','esdiferenciacambio','esdiferenciacambio',0,TO_TIMESTAMP('2021-09-13 16:37:47','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2021-09-13 16:37:47','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 13/09/2021 16:37:48 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001186 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 13/09/2021 16:37:48 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004183,335,'LAR',0,'Y','N','N','N',1,'N',20,'N',3001186,'N','Y','N','esdiferenciacambio','esdiferenciacambio',TO_TIMESTAMP('2021-09-13 16:37:47','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2021-09-13 16:37:47','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 13/09/2021 16:37:48 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004183 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 13/09/2021 16:39:11 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Column SET Name='Es Diferencia de Cambio', ColumnName='EsDiferenciaCambio',Updated=TO_TIMESTAMP('2021-09-13 16:39:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004183
;

-- 13/09/2021 16:39:11 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3004183
;

-- 13/09/2021 16:39:11 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET Name='Es Diferencia de Cambio', Description=NULL, Help=NULL WHERE AD_Column_ID=3004183 AND IsCentrallyMaintained='Y'
;

-- 13/09/2021 16:39:16 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Column_Trl SET Name='Es Diferencia de Cambio',Updated=TO_TIMESTAMP('2021-09-13 16:39:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004183 AND AD_Language='es_AR'
;

-- 13/09/2021 16:39:34 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Element SET ColumnName='EsDiferenciaCambio', Name='Es Diferencia de Cambio', PrintName='Es Diferencia de Cambio',Updated=TO_TIMESTAMP('2021-09-13 16:39:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001186
;

-- 13/09/2021 16:39:34 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001186
;

-- 13/09/2021 16:39:34 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Column SET ColumnName='EsDiferenciaCambio', Name='Es Diferencia de Cambio', Description=NULL, Help=NULL WHERE AD_Element_ID=3001186
;

-- 13/09/2021 16:39:34 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Process_Para SET ColumnName='EsDiferenciaCambio', Name='Es Diferencia de Cambio', Description=NULL, Help=NULL, AD_Element_ID=3001186 WHERE UPPER(ColumnName)='ESDIFERENCIACAMBIO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 13/09/2021 16:39:34 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Process_Para SET ColumnName='EsDiferenciaCambio', Name='Es Diferencia de Cambio', Description=NULL, Help=NULL WHERE AD_Element_ID=3001186 AND IsCentrallyMaintained='Y'
;

-- 13/09/2021 16:39:34 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET Name='Es Diferencia de Cambio', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001186) AND IsCentrallyMaintained='Y'
;

-- 13/09/2021 16:39:34 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_PrintFormatItem SET PrintName='Es Diferencia de Cambio', Name='Es Diferencia de Cambio' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001186)
;

-- 13/09/2021 16:39:42 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Element_Trl SET Name='Es Diferencia de Cambio',PrintName='Es Diferencia de Cambio',Updated=TO_TIMESTAMP('2021-09-13 16:39:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001186 AND AD_Language='es_AR'
;

-- 13/09/2021 16:43:29 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,AD_Tab_ID,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007397,1,'Y','N','N',3004183,3000013,'N','Y','N','LAR','Es Diferencia de Cambio',100,0,TO_TIMESTAMP('2021-09-13 16:43:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-09-13 16:43:29','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 13/09/2021 16:43:29 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007397 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 13/09/2021 16:45:41 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3007397
;

-- 13/09/2021 16:45:41 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000318
;

-- 13/09/2021 16:45:41 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000322
;

-- 13/09/2021 16:45:41 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000319
;

-- 13/09/2021 16:45:41 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000320
;

-- 13/09/2021 16:47:02 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2021-09-13 16:47:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007397
;

-- 13/09/2021 16:53:34 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,AD_Tab_ID,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007398,10,'Y','N','N',3003929,3000016,'N','Y','N','LAR','Billetera Digital',100,0,TO_TIMESTAMP('2021-09-13 16:53:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-09-13 16:53:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 13/09/2021 16:53:34 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007398 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 13/09/2021 16:53:35 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,AD_Tab_ID,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007399,1,'Y','N','N',3004183,3000016,'N','Y','N','LAR','Es Diferencia de Cambio',100,0,TO_TIMESTAMP('2021-09-13 16:53:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-09-13 16:53:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 13/09/2021 16:53:35 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007399 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 13/09/2021 16:54:15 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007398
;

-- 13/09/2021 16:54:15 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007400
;

-- 13/09/2021 16:54:15 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007401
;

-- 13/09/2021 16:54:15 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007402
;

-- 13/09/2021 16:54:15 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007403
;

-- 13/09/2021 16:54:15 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000492
;

-- 13/09/2021 16:54:15 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3007399
;

-- 13/09/2021 16:56:05 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3007399
;

-- 13/09/2021 16:56:05 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000450
;

-- 13/09/2021 16:56:05 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3003313
;

-- 13/09/2021 16:56:05 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3002769
;

-- 13/09/2021 16:56:05 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3002770
;

-- 13/09/2021 16:56:05 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3002806
;

-- 13/09/2021 16:56:05 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3003311
;

-- 13/09/2021 16:56:05 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000453
;

-- 13/09/2021 16:56:05 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000462
;

-- 13/09/2021 16:56:05 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000452
;

-- 13/09/2021 16:56:05 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000454
;

-- 13/09/2021 16:56:05 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3006640
;

-- 13/09/2021 16:56:05 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000458
;

-- 13/09/2021 16:56:05 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000459
;

-- 13/09/2021 16:56:05 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000460
;

-- 13/09/2021 16:56:05 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000461
;

-- 13/09/2021 16:56:05 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000463
;

-- 13/09/2021 16:56:05 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000464
;

-- 13/09/2021 16:56:05 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000465
;

-- 13/09/2021 16:56:05 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000466
;

-- 13/09/2021 16:56:05 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000467
;

-- 13/09/2021 16:56:05 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000468
;

-- 13/09/2021 16:56:05 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000469
;

-- 13/09/2021 16:56:05 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000470
;

-- 13/09/2021 16:56:05 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000471
;

-- 13/09/2021 16:56:05 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000472
;

-- 13/09/2021 16:56:05 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000473
;

-- 13/09/2021 16:56:05 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000474
;

-- 13/09/2021 16:56:05 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000475
;

-- 13/09/2021 16:56:06 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000476
;

-- 13/09/2021 16:56:06 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000477
;

-- 13/09/2021 16:56:06 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000478
;

-- 13/09/2021 16:56:06 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000479
;

-- 13/09/2021 16:56:06 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000480
;

-- 13/09/2021 16:56:06 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000481
;

-- 13/09/2021 16:56:06 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000482
;

-- 13/09/2021 16:56:06 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000483
;

-- 13/09/2021 16:56:06 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000484
;

-- 13/09/2021 16:56:06 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000490
;

-- 13/09/2021 16:56:06 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000489
;

-- 13/09/2021 16:56:06 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000491
;

-- 13/09/2021 16:56:31 ART
-- ISSUE #114: Cobro/Pago por diferencia de cambio.
UPDATE AD_Field SET AD_FieldGroup_ID=125,Updated=TO_TIMESTAMP('2021-09-13 16:56:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007399
;

-- Registración de script
SELECT register_migration_script_lar('0195_ISSUE-114.sql', 'LAR', '')
;
