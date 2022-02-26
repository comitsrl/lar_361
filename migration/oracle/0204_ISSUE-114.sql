ALTER TABLE C_Payment ADD COLUMN MontoMonedExt numeric NOT NULL DEFAULT 0;
ALTER TABLE LAR_PaymentHeader ADD COLUMN GeneraPagoDifCambio character(1) NOT NULL DEFAULT 'N';

-- 21/12/2021 15:15:09 ART
-- ISSUE 60: Mejorar registro de scripts de migración
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001231,'montomonedext','LAR','montomonedext','montomonedext',0,TO_DATE('2021-12-21 15:15:09','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-12-21 15:15:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 21/12/2021 15:15:09 ART
-- ISSUE 60: Mejorar registro de scripts de migración
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001231 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 21/12/2021 15:15:10 ART
-- ISSUE 60: Mejorar registro de scripts de migración
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004422,335,'LAR',0,'Y','N','N','N',131089,'N',22,'N',3001231,'N','Y','N','montomonedext','montomonedext',TO_DATE('2021-12-21 15:15:09','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2021-12-21 15:15:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/12/2021 15:15:10 ART
-- ISSUE 60: Mejorar registro de scripts de migración
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004422 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/12/2021 15:16:28 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Column SET FieldLength=20, AD_Reference_ID=12, Name='Monto en Moneda Ext.', ColumnName='MontoMonedExt',Updated=TO_DATE('2021-12-21 15:16:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004422
;

-- 21/12/2021 15:16:28 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3004422
;

-- 21/12/2021 15:16:28 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET Name='Monto en Moneda Ext.', Description=NULL, Help=NULL WHERE AD_Column_ID=3004422 AND IsCentrallyMaintained='Y'
;

-- 21/12/2021 15:16:35 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Column_Trl SET Name='Monto en Moneda Ext.',Updated=TO_DATE('2021-12-21 15:16:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004422 AND AD_Language='es_AR'
;

-- 21/12/2021 15:16:58 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Element SET ColumnName='MontoMonedExt', Name='Monto en Moneda Ext.', PrintName='Monto en Moneda Ext.',Updated=TO_DATE('2021-12-21 15:16:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001231
;

-- 21/12/2021 15:16:58 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001231
;

-- 21/12/2021 15:16:58 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Column SET ColumnName='MontoMonedExt', Name='Monto en Moneda Ext.', Description=NULL, Help=NULL WHERE AD_Element_ID=3001231
;

-- 21/12/2021 15:16:58 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Process_Para SET ColumnName='MontoMonedExt', Name='Monto en Moneda Ext.', Description=NULL, Help=NULL, AD_Element_ID=3001231 WHERE UPPER(ColumnName)='MONTOMONEDEXT' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 21/12/2021 15:16:58 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Process_Para SET ColumnName='MontoMonedExt', Name='Monto en Moneda Ext.', Description=NULL, Help=NULL WHERE AD_Element_ID=3001231 AND IsCentrallyMaintained='Y'
;

-- 21/12/2021 15:16:58 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET Name='Monto en Moneda Ext.', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001231) AND IsCentrallyMaintained='Y'
;

-- 21/12/2021 15:16:58 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_PrintFormatItem pi SET PrintName='Monto en Moneda Ext.', Name='Monto en Moneda Ext.' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001231)
;

-- 21/12/2021 15:17:06 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Element_Trl SET Name='Monto en Moneda Ext.',PrintName='Monto en Moneda Ext.',Updated=TO_DATE('2021-12-21 15:17:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001231 AND AD_Language='es_AR'
;

-- 21/12/2021 15:19:01 ART
-- ISSUE 60: Mejorar registro de scripts de migración
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,AD_Tab_ID,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007721,20,'Y','N','N',3004422,3000016,'N','Y','N','LAR','Monto en Moneda Ext.',100,0,TO_DATE('2021-12-21 15:19:00','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-12-21 15:19:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/12/2021 15:19:01 ART
-- ISSUE 60: Mejorar registro de scripts de migración
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007721 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/12/2021 15:21:29 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007399
;

-- 21/12/2021 15:21:29 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3007721
;

-- 21/12/2021 15:21:29 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000442
;

-- 21/12/2021 15:21:29 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000443
;

-- 21/12/2021 15:21:29 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000444
;

-- 21/12/2021 15:21:29 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000445
;

-- 21/12/2021 15:21:29 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3007718
;

-- 21/12/2021 15:21:29 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3007719
;

-- 21/12/2021 15:21:29 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=3007720
;

-- 21/12/2021 15:21:29 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET SeqNo=680,IsDisplayed='Y' WHERE AD_Field_ID=3007722
;

-- 21/12/2021 15:21:52 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET AD_FieldGroup_ID=103,Updated=TO_DATE('2021-12-21 15:21:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007721
;

-- 21/12/2021 15:22:09 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3007721
;

-- 21/12/2021 15:22:09 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000441
;

-- 21/12/2021 18:04:33 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0  | @EsRetencionIIBB@=Y | @MontoMonedExt@!0',Updated=TO_DATE('2021-12-21 18:04:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=5303
;

-- 21/12/2021 18:04:42 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2021-12-21 18:04:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000442
;

-- 21/12/2021 18:04:52 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2021-12-21 18:04:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000443
;

-- 21/12/2021 18:21:52 ART
-- ISSUE 60: Mejorar registro de scripts de migración
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001232,'generapagodifcambio','LAR','generapagodifcambio','generapagodifcambio',0,TO_DATE('2021-12-21 18:21:51','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-12-21 18:21:51','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 21/12/2021 18:21:52 ART
-- ISSUE 60: Mejorar registro de scripts de migración
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001232 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 21/12/2021 18:21:52 ART
-- ISSUE 60: Mejorar registro de scripts de migración
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004423,3000010,'LAR',0,'Y','N','N','N',1,'N',20,'N',3001232,'N','Y','N','generapagodifcambio','generapagodifcambio',TO_DATE('2021-12-21 18:21:51','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2021-12-21 18:21:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/12/2021 18:21:52 ART
-- ISSUE 60: Mejorar registro de scripts de migración
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004423 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/12/2021 18:22:55 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Element SET ColumnName='GeneraPagoDifCambio', Name='Generar Pago x Dif. de Cambio', PrintName='Generar Pago x Dif. de Cambio',Updated=TO_DATE('2021-12-21 18:22:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001232
;

-- 21/12/2021 18:22:55 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001232
;

-- 21/12/2021 18:22:55 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Column SET ColumnName='GeneraPagoDifCambio', Name='Generar Pago x Dif. de Cambio', Description=NULL, Help=NULL WHERE AD_Element_ID=3001232
;

-- 21/12/2021 18:22:55 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Process_Para SET ColumnName='GeneraPagoDifCambio', Name='Generar Pago x Dif. de Cambio', Description=NULL, Help=NULL, AD_Element_ID=3001232 WHERE UPPER(ColumnName)='GENERAPAGODIFCAMBIO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 21/12/2021 18:22:55 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Process_Para SET ColumnName='GeneraPagoDifCambio', Name='Generar Pago x Dif. de Cambio', Description=NULL, Help=NULL WHERE AD_Element_ID=3001232 AND IsCentrallyMaintained='Y'
;

-- 21/12/2021 18:22:55 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET Name='Generar Pago x Dif. de Cambio', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001232) AND IsCentrallyMaintained='Y'
;

-- 21/12/2021 18:22:55 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_PrintFormatItem pi SET PrintName='Generar Pago x Dif. de Cambio', Name='Generar Pago x Dif. de Cambio' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001232)
;

-- 21/12/2021 18:23:11 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Element_Trl SET Name='Generar Pago x Dif. de Cambio',PrintName='Generar Pago x Dif. de Cambio',Updated=TO_DATE('2021-12-21 18:23:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001232 AND AD_Language='es_AR'
;

-- 21/12/2021 18:23:42 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Column_Trl SET Name='Generar Pago x Dif. de Cambio',Updated=TO_DATE('2021-12-21 18:23:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004423 AND AD_Language='es_AR'
;

-- 21/12/2021 18:24:12 ART
-- ISSUE 60: Mejorar registro de scripts de migración
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,AD_Tab_ID,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007723,1,'Y','N','N',3004423,3000015,'N','Y','N','LAR','Generar Pago x Dif. de Cambio',100,0,TO_DATE('2021-12-21 18:24:12','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-12-21 18:24:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/12/2021 18:24:12 ART
-- ISSUE 60: Mejorar registro de scripts de migración
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007723 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/12/2021 18:25:16 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000400
;

-- 21/12/2021 18:25:16 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3001147
;

-- 21/12/2021 18:25:16 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000600
;

-- 21/12/2021 18:25:16 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3001142
;

-- 21/12/2021 18:25:16 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000402
;

-- 21/12/2021 18:25:16 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3007405
;

-- 21/12/2021 18:25:16 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3007407
;

-- 21/12/2021 18:25:16 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3007682
;

-- 21/12/2021 18:25:16 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3007723
;

-- 21/12/2021 18:25:16 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3007388
;

-- 21/12/2021 18:25:16 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3007406
;

-- 21/12/2021 18:25:17 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3007390
;

-- 21/12/2021 18:25:32 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2021-12-21 18:25:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007723
;

-- 21/12/2021 18:25:44 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET DefaultValue='Y',Updated=TO_DATE('2021-12-21 18:25:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007723
;

-- 21/12/2021 18:26:26 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET DisplayLogic='@TasaDelDia@ > 0',Updated=TO_DATE('2021-12-21 18:26:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007723
;

-- 22/12/2021 12:38:09 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Column SET Callout='org.compiere.model.CalloutPayment.montoMonedaExt',Updated=TO_DATE('2021-12-22 12:38:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004422
;

-- 16/02/2022 21:00:49 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0  | @EsRetencionIIBB@=Y',Updated=TO_TIMESTAMP('2022-02-16 21:00:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=5303
;

-- 16/02/2022 21:01:02 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007721
;

-- 16/02/2022 21:01:02 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000441
;

-- 16/02/2022 21:01:02 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000442
;

-- 16/02/2022 21:01:02 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000443
;

-- 16/02/2022 21:01:02 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000444
;

-- 16/02/2022 21:01:02 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000445
;

-- 16/02/2022 21:01:02 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000450
;

-- 16/02/2022 21:01:02 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3003313
;

-- 16/02/2022 21:01:02 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3002769
;

-- 16/02/2022 21:01:02 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3002770
;

-- 16/02/2022 21:01:02 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3002806
;

-- 16/02/2022 21:01:02 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3003311
;

-- 16/02/2022 21:01:02 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3000453
;

-- 16/02/2022 21:01:02 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000462
;

-- 16/02/2022 21:01:02 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000452
;

-- 16/02/2022 21:01:02 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000454
;

-- 16/02/2022 21:01:02 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3006640
;

-- 16/02/2022 21:01:02 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000458
;

-- 16/02/2022 21:01:02 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000459
;

-- 16/02/2022 21:01:02 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000460
;

-- 16/02/2022 21:01:02 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000461
;

-- 16/02/2022 21:01:02 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000463
;

-- 16/02/2022 21:01:02 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000464
;

-- 16/02/2022 21:01:02 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000465
;

-- 16/02/2022 21:01:02 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000466
;

-- 16/02/2022 21:01:03 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000467
;

-- 16/02/2022 21:01:03 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000468
;

-- 16/02/2022 21:01:03 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000469
;

-- 16/02/2022 21:01:03 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000470
;

-- 16/02/2022 21:01:03 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000471
;

-- 16/02/2022 21:01:03 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000472
;

-- 16/02/2022 21:01:03 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000473
;

-- 16/02/2022 21:01:03 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000474
;

-- 16/02/2022 21:01:03 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000475
;

-- 16/02/2022 21:01:03 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000476
;

-- 16/02/2022 21:01:03 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000477
;

-- 16/02/2022 21:01:03 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000478
;

-- 16/02/2022 21:01:03 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000479
;

-- 16/02/2022 21:01:03 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000480
;

-- 16/02/2022 21:01:03 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000481
;

-- 16/02/2022 21:01:03 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000482
;

-- 16/02/2022 21:01:03 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000483
;

-- 16/02/2022 21:01:03 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000484
;

-- 16/02/2022 21:01:03 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000490
;

-- 16/02/2022 21:01:03 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000489
;

-- 16/02/2022 21:01:03 ART
-- BUG #432: Incorporación de Billeteras Digitales en POS.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000491
;

-- Registración de script
SELECT register_migration_script_lar('0204_ISSUE-114.sql', 'LAR', '') FROM dual
;
