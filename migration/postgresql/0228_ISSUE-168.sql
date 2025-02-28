ALTER TABLE C_Invoice ADD COLUMN CrearOP character(1) COLLATE pg_catalog."default";

-- 28/02/2025 0:24:20 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001501,'crearop','LAR','crearop','crearop',0,TO_TIMESTAMP('2025-02-28 00:24:19','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2025-02-28 00:24:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 28/02/2025 0:24:20 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001501 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 28/02/2025 0:24:20 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,AD_Org_ID,CreatedBy,AD_Client_ID,IsActive,Created,UpdatedBy) VALUES (3005801,318,'LAR',0,'N','N','N','N',1,'N',20,'N',3001501,'N','Y','N','crearop','crearop',TO_TIMESTAMP('2025-02-28 00:24:19','YYYY-MM-DD HH24:MI:SS'),0,100,0,'Y',TO_TIMESTAMP('2025-02-28 00:24:19','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/02/2025 0:24:20 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005801 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/02/2025 0:25:16 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Element SET ColumnName='CrearOP', Name='Crear Orden de Pago', PrintName='Crear Orden de Pago',Updated=TO_TIMESTAMP('2025-02-28 00:25:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001501
;

-- 28/02/2025 0:25:16 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001501
;

-- 28/02/2025 0:25:16 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Column SET ColumnName='CrearOP', Name='Crear Orden de Pago', Description=NULL, Help=NULL WHERE AD_Element_ID=3001501
;

-- 28/02/2025 0:25:16 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Process_Para SET ColumnName='CrearOP', Name='Crear Orden de Pago', Description=NULL, Help=NULL, AD_Element_ID=3001501 WHERE UPPER(ColumnName)='CREAROP' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 28/02/2025 0:25:16 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Process_Para SET ColumnName='CrearOP', Name='Crear Orden de Pago', Description=NULL, Help=NULL WHERE AD_Element_ID=3001501 AND IsCentrallyMaintained='Y'
;

-- 28/02/2025 0:25:16 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Field SET Name='Crear Orden de Pago', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001501) AND IsCentrallyMaintained='Y'
;

-- 28/02/2025 0:25:16 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_PrintFormatItem SET PrintName='Crear Orden de Pago', Name='Crear Orden de Pago' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001501)
;

-- 28/02/2025 0:25:49 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Element_Trl SET Name='Crear Orden de Pago',PrintName='Crear Orden de Pago',Updated=TO_TIMESTAMP('2025-02-28 00:25:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001501 AND AD_Language='es_AR'
;

-- 28/02/2025 0:26:43 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Column SET AD_Reference_ID=28, Name='Crear Orden de Pago', ColumnName='CrearOP',Updated=TO_TIMESTAMP('2025-02-28 00:26:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005801
;

-- 28/02/2025 0:26:59 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Column_Trl SET Name='Crear Orden de Pago',Updated=TO_TIMESTAMP('2025-02-28 00:26:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005801 AND AD_Language='es_AR'
;

-- 28/02/2025 0:35:27 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
INSERT INTO AD_Process (AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Classname,CopyFromProcess,Value,Name,AD_Org_ID,AD_Client_ID,UpdatedBy,CreatedBy,Updated,Created,IsActive) VALUES (5000594,'N','N','3','N','N','Y','LAR',0,0,'ar.com.ergio.process.LAR_GenerarOrdenPago','N','LAR_GenerarOP','LAR_GenerarOP',0,0,100,100,TO_TIMESTAMP('2025-02-28 00:35:26','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2025-02-28 00:35:26','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 28/02/2025 0:35:27 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=5000594 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 28/02/2025 0:39:16 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,Help,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,AD_Val_Rule_ID,SeqNo,IsMandatory,AD_Element_ID,EntityType,Name,ColumnName,Description,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',5001045,0,'The Bank Account identifies an account at this Bank.',5000594,100,'Y',19,3000004,10,'N',836,'LAR','Bank Account','C_BankAccount_ID','Account at the Bank','Y',0,100,TO_TIMESTAMP('2025-02-28 00:39:16','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2025-02-28 00:39:16','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 28/02/2025 0:39:16 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=5001045 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 28/02/2025 0:40:00 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Process_Para_Trl SET IsTranslated='Y',Name='Caja',Description=NULL,Help=NULL,Updated=TO_TIMESTAMP('2025-02-28 00:40:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=5001045 AND AD_Language='es_AR'
;

-- 28/02/2025 0:40:07 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Process_Para SET IsCentrallyMaintained='N',Updated=TO_TIMESTAMP('2025-02-28 00:40:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=5001045
;

-- 28/02/2025 0:42:34 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Process_Para SET Help=NULL, Name='Caja', Description=NULL,Updated=TO_TIMESTAMP('2025-02-28 00:42:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=5001045
;

-- 28/02/2025 0:42:34 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Process_Para_Trl SET IsTranslated='N' WHERE AD_Process_Para_ID=5001045
;

-- 28/02/2025 0:44:22 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,AD_Val_Rule_ID,SeqNo,IsMandatory,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',5001046,0,5000594,100,'N',19,3000002,20,'N','LAR','Tipo de Documento','C_DocType_ID','Y',0,100,TO_TIMESTAMP('2025-02-28 00:44:21','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2025-02-28 00:44:21','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 28/02/2025 0:44:22 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=5001046 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 28/02/2025 0:48:07 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,AD_Val_Rule_ID,SeqNo,IsMandatory,AD_Reference_Value_ID,AD_Element_ID,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',5001047,0,5000594,100,'Y',18,3000118,30,'N',3000054,3000368,'LAR','Tipo de Depósito Directo','LAR_Deposito_Directo_ID','Y',0,100,TO_TIMESTAMP('2025-02-28 00:48:07','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2025-02-28 00:48:07','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 28/02/2025 0:48:07 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=5001047 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 28/02/2025 0:49:50 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',5001057,0,5000594,100,'N',20,40,'N','LAR','Completar','Completar','Y',0,100,TO_TIMESTAMP('2025-02-28 00:49:49','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2025-02-28 00:49:49','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 28/02/2025 0:49:50 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=5001057 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 28/02/2025 0:50:37 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Column SET AD_Process_ID=5000594,Updated=TO_TIMESTAMP('2025-02-28 00:50:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005801
;

-- 28/02/2025 0:51:01 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009383,1,'Y','N','N',3005801,'N','Y',290,'N','LAR','Crear Orden de Pago',100,0,'Y',TO_TIMESTAMP('2025-02-28 00:51:01','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2025-02-28 00:51:01','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/02/2025 0:51:01 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009383 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/02/2025 0:52:02 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
DELETE FROM AD_Field_Trl WHERE AD_Field_ID=3009382
;

-- 28/02/2025 0:52:02 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
DELETE FROM AD_Field WHERE AD_Field_ID=3009382
;

-- 28/02/2025 0:52:02 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
DELETE FROM AD_Field_Trl WHERE AD_Field_ID=3009384
;

-- 28/02/2025 0:52:02 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
DELETE FROM AD_Field WHERE AD_Field_ID=3009384
;

-- 28/02/2025 0:52:02 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
DELETE FROM AD_Field_Trl WHERE AD_Field_ID=3009385
;

-- 28/02/2025 0:52:02 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
DELETE FROM AD_Field WHERE AD_Field_ID=3009385
;

-- 28/02/2025 0:52:02 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
DELETE FROM AD_Field_Trl WHERE AD_Field_ID=3009386
;

-- 28/02/2025 0:52:02 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
DELETE FROM AD_Field WHERE AD_Field_ID=3009386
;

-- 28/02/2025 0:52:02 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
DELETE FROM AD_Field_Trl WHERE AD_Field_ID=3009387
;

-- 28/02/2025 0:52:02 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
DELETE FROM AD_Field WHERE AD_Field_ID=3009387
;

-- 28/02/2025 0:54:04 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3009383
;

-- 28/02/2025 0:54:04 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3332
;

-- 28/02/2025 0:54:04 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3323
;

-- 28/02/2025 0:54:04 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3327
;

-- 28/02/2025 0:54:04 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=6936
;

-- 28/02/2025 0:54:04 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=7796
;

-- 28/02/2025 0:54:04 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=7797
;

-- 28/02/2025 0:54:04 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3007632
;

-- 28/02/2025 0:54:04 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3009277
;

-- 28/02/2025 0:54:04 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3343
;

-- 28/02/2025 0:54:04 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3337
;

-- 28/02/2025 0:54:04 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3335
;

-- 28/02/2025 0:54:04 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3329
;

-- 28/02/2025 0:54:04 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=1000034
;

-- 28/02/2025 0:54:04 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=1000035
;

-- 28/02/2025 0:54:04 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=8659
;

-- 28/02/2025 0:54:04 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=10486
;

-- 28/02/2025 0:54:04 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=6532
;

-- 28/02/2025 0:54:04 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3334
;

-- 28/02/2025 0:54:04 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3670
;

-- 28/02/2025 0:54:04 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=200048
;

-- 28/02/2025 0:54:04 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3900
;

-- 28/02/2025 0:54:04 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000088
;

-- 28/02/2025 0:56:42 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Field SET DisplayLogic='1=2',Updated=TO_TIMESTAMP('2025-02-28 00:56:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009383
;

-- 28/02/2025 1:17:20 ART
-- ISSUE #168: Generación automatica de OP, desde Factura Proveedor.
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_TIMESTAMP('2025-02-28 01:17:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005801
;

-- Registración de script
SELECT register_migration_script_lar('0228_ISSUE-168.sql', 'LAR', '')
;
