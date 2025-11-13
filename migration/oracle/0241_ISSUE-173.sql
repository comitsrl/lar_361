-- 23/10/2025 22:09:32 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,Updated,AD_Client_ID,AD_Org_ID,Created,CreatedBy,UpdatedBy,IsActive) VALUES (3000089,'LAR','C','Y','Ingresar Y si se desea afectar la cuenta corriente del cliente de manera inmediata, cuando se reciba un cheque con vencimiento diferido.','LAR_Actualizar_CC_Cliente_ChequeDiferido',TO_DATE('2025-10-23 22:09:31','YYYY-MM-DD HH24:MI:SS'),1000000,0,TO_DATE('2025-10-23 22:09:31','YYYY-MM-DD HH24:MI:SS'),100,100,'Y')
;

ALTER TABLE C_Payment ADD COLUMN AcreditadoCC character(1) COLLATE pg_catalog."default" NOT NULL DEFAULT 'N'::bpchar;

UPDATE C_Payment SET AcreditadoCC = 'Y' WHERE DocStatus IN ('CO', 'CL') AND AD_Client_ID = 1000000;

-- 23/10/2025 22:39:32 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001520,'acreditadocc','LAR','acreditadocc','acreditadocc',0,TO_DATE('2025-10-23 22:39:31','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-10-23 22:39:31','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 23/10/2025 22:39:32 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PO_PrintName,PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PO_PrintName,t.PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001520 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 23/10/2025 22:39:32 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005918,335,'LAR',0,'Y','N','N','N',1,'N',20,'N',3001520,'N','Y','N','acreditadocc','acreditadocc',100,TO_DATE('2025-10-23 22:39:31','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-10-23 22:39:31','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/10/2025 22:39:32 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005918 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/10/2025 22:40:31 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Element SET ColumnName='AcreditadoCC', Name='Acreditado en C/C', PrintName='Acreditado en C/C',Updated=TO_DATE('2025-10-23 22:40:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001520
;

-- 23/10/2025 22:40:31 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001520
;

-- 23/10/2025 22:40:31 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Column SET ColumnName='AcreditadoCC', Name='Acreditado en C/C', Description=NULL, Help=NULL WHERE AD_Element_ID=3001520
;

-- 23/10/2025 22:40:31 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Process_Para SET ColumnName='AcreditadoCC', Name='Acreditado en C/C', Description=NULL, Help=NULL, AD_Element_ID=3001520 WHERE UPPER(ColumnName)='ACREDITADOCC' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 23/10/2025 22:40:31 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Process_Para SET ColumnName='AcreditadoCC', Name='Acreditado en C/C', Description=NULL, Help=NULL WHERE AD_Element_ID=3001520 AND IsCentrallyMaintained='Y'
;

-- 23/10/2025 22:40:31 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET Name='Acreditado en C/C', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001520) AND IsCentrallyMaintained='Y'
;

-- 23/10/2025 22:40:31 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_PrintFormatItem pi SET PrintName='Acreditado en C/C', Name='Acreditado en C/C' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001520)
;

-- 23/10/2025 22:40:40 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Element_Trl SET Name='Acreditado en C/C',PrintName='Acreditado en C/C',Updated=TO_DATE('2025-10-23 22:40:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001520 AND AD_Language='es_AR'
;

-- 23/10/2025 22:40:55 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Column_Trl SET Name='Acreditado en C/C',Updated=TO_DATE('2025-10-23 22:40:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005918 AND AD_Language='es_AR'
;

-- 23/10/2025 22:42:05 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009451,1,'Y','N','N',3005918,'N','Y',3000013,'N','LAR','Acreditado en C/C',100,0,TO_DATE('2025-10-23 22:42:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-10-23 22:42:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/10/2025 22:42:05 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009451 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/10/2025 22:42:05 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009452,20,'Y','N','N',3004422,'N','Y',3000013,'N','LAR','Monto en Moneda Ext.',100,0,TO_DATE('2025-10-23 22:42:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-10-23 22:42:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/10/2025 22:42:05 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009452 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/10/2025 22:42:26 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3009452
;

-- 23/10/2025 22:42:26 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
DELETE FROM AD_Field WHERE AD_Field_ID=3009452
;

-- 23/10/2025 22:43:45 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2025-10-23 22:43:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009451
;

-- 23/10/2025 22:44:04 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_DATE('2025-10-23 22:44:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005918
;

-- 23/10/2025 22:45:10 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2025-10-23 22:45:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009451
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3000327
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3000311
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3000323
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3007070
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3000312
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000313
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3003009
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3009451
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000314
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000330
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000315
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3002719
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000339
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000316
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3002720
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000317
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000329
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3002803
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000331
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3006614
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3000335
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3003293
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000356
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000336
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000337
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000338
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000340
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000341
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000342
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000343
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000348
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000344
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000345
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000349
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000350
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000346
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000347
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000351
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000352
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3001624
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000318
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000321
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000319
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000320
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3007397
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000322
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000886
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000888
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000324
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000353
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000325
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3007322
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000354
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000355
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000357
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000358
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000359
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3000360
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=3000363
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=680,IsDisplayed='Y' WHERE AD_Field_ID=3000302
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=690,IsDisplayed='Y' WHERE AD_Field_ID=3000364
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=700,IsDisplayed='Y' WHERE AD_Field_ID=3000362
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=710,IsDisplayed='Y' WHERE AD_Field_ID=3000289
;

-- 23/10/2025 22:45:39 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET SeqNo=720,IsDisplayed='Y' WHERE AD_Field_ID=3000366
;

-- 23/10/2025 22:46:03 ART
-- ISSUE #173: Actualización de Crédito - Cheques Diferidos.
UPDATE AD_Field SET DisplayLogic='@TenderType@=K | @TenderType@=Z & @EsRetencionSufrida@=N',Updated=TO_DATE('2025-10-23 22:46:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009451
;

-- Registración de script
SELECT register_migration_script_lar('0241_ISSUE-173.sql', 'LAR', '') FROM dual
;
