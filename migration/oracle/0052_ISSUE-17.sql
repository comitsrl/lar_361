-- 28/11/2012
-- ISSUE 17: Retención en Pago a varias Facturas
ALTER TABLE C_Payment ADD EsRetencionIIBB CHAR(1) DEFAULT 'N' NOT NULL
;

-- 28/11/2012
-- ISSUE 17: Retención en Pago a varias Facturas
ALTER TABLE LAR_PaymentHeader ADD COLUMN PayHeaderTotalAmt NUMERIC
;

-- 05/02/2013
-- ISSUE 17: Retención en Pago a varias Facturas
ALTER TABLE LAR_PaymentHeader ADD COLUMN WithholdingAmt NUMERIC
;

-- 19/02/2013
-- ISSUE 17: Retención en Pago a varias Facturas
ALTER TABLE LAR_PaymentHeader ADD GenerarRetencion CHAR(1)
;

-- 28/11/2012
-- ISSUE 17: Retención en Pago a varias Facturas
ALTER TABLE LAR_PaymentWithholding DROP COLUMN C_Payment_ID
;

-- 28/11/2012
-- ISSUE 17: Retención en Pago a varias Facturas
ALTER TABLE LAR_PaymentWithholding ADD LAR_PaymentHeader_ID NUMBER NOT NULL
;

-- 28/11/2012
-- ISSUE 17: Retención en Pago a varias Facturas
ALTER TABLE LAR_PaymentWithholding ADD CONSTRAINT paymentheader_wh_fk
  FOREIGN KEY (LAR_PaymentHeader_ID) REFERENCES LAR_PaymentHeader(LAR_PaymentHeader_ID)
;

-- 22/02/2013
-- ISSUE 17: Retención en Pago a varias Facturas
ALTER TABLE LAR_PaymentWithholding MODIFY C_Invoice_ID NUMBER NULL
;

-- 05/02/2013
-- ISSUE 17: Retención en Pago a varias Facturas
ALTER TABLE LAR_WithholdingCertificate DROP COLUMN C_Payment_ID
;

-- 05/02/2013
-- ISSUE 17: Retención en Pago a varias Facturas
ALTER TABLE LAR_WithholdingCertificate ADD LAR_PaymentHeader_ID NUMBER NOT NULL
;

-- 28/11/2012
-- ISSUE 17: Retención en Pago a varias Facturas
ALTER TABLE LAR_WithholdingCertificate ADD CONSTRAINT paymentheader_whc_fk
  FOREIGN KEY (LAR_PaymentHeader_ID) REFERENCES LAR_PaymentHeader(LAR_PaymentHeader_ID)
;

-- 22/02/2013
-- ISSUE 17: Retención en Pago a varias Facturas
ALTER TABLE LAR_WithholdingCertificate MODIFY C_Invoice_ID NUMBER NULL
;

-- 02/06/2013
-- ISSUE 17: Retención en Pago a varias Facturas
ALTER TABLE C_DocType ADD COLUMN LAR_Withholding_Charge_ID NUMERIC
;

-- 02/06/2013
-- ISSUE 17: Retención en Pago a varias Facturas
ALTER TABLE C_DocType ADD CONSTRAINT lar_wh_charge_fk
  FOREIGN KEY (LAR_Withholding_Charge_ID) REFERENCES C_Charge(C_Charge_ID)
;


-- 28/11/2012 23:23:04 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET ColumnSQL=NULL, IsUpdateable='Y',Updated=TO_DATE('2012-11-28 23:23:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000262
;

-- 18/02/2013 21:38:30 ART
-- ISSUE 17: Retención en Pago a varias Facturas
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3000077
;

-- 18/02/2013 21:38:30 ART
-- ISSUE 17: Retención en Pago a varias Facturas
DELETE FROM AD_Field WHERE AD_Field_ID=3000077
;

-- 18/02/2013 21:41:54 ART
-- ISSUE 17: Retención en Pago a varias Facturas
DELETE  FROM  AD_Column_Trl WHERE AD_Column_ID=3000100
;

-- 18/02/2013 21:41:54 ART
-- ISSUE 17: Retención en Pago a varias Facturas
DELETE FROM AD_Column WHERE AD_Column_ID=3000100
;

-- 18/02/2013 22:30:20 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000830,3000005,'LAR',0,'Y','N','N','N',131089,'N',19,'N',3000068,'N','Y','N','LAR_PaymentHeader','LAR_PaymentHeader_ID',100,TO_DATE('2013-02-18 22:30:18','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2013-02-18 22:30:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 18/02/2013 22:30:20 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000830 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 18/02/2013 22:32:04 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001126,131089,'Y','N','N',3000830,'N','Y',3000004,'N','LAR','LAR_PaymentHeader',100,0,TO_DATE('2013-02-18 22:32:03','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2013-02-18 22:32:03','YYYY-MM-DD HH24:MI:SS'))
;

-- 18/02/2013 22:32:04 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001126 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/02/2013 22:34:58 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3001126
;

-- 18/02/2013 22:34:58 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3000073
;

-- 18/02/2013 22:35:17 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2013-02-18 22:35:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000073
;

-- 19/02/2013 23:24:57 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000127,'generarretencion','LAR','generarretencion','generarretencion',0,TO_DATE('2013-02-19 23:24:56','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2013-02-19 23:24:56','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 19/02/2013 23:24:57 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000127 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 19/02/2013 23:24:57 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000831,3000010,'LAR',0,'N','N','N','N',1,'N',20,'N',3000127,'N','Y','N','generarretencion','generarretencion',100,TO_DATE('2013-02-19 23:24:55','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2013-02-19 23:24:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 19/02/2013 23:24:57 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000831 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 19/02/2013 23:25:59 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Element SET ColumnName='GenerarRetencion', Name='GenerarRetencion', PrintName='GenerarRetencion',Updated=TO_DATE('2013-02-19 23:25:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000127
;

-- 19/02/2013 23:25:59 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000127
;

-- 19/02/2013 23:25:59 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET ColumnName='GenerarRetencion', Name='GenerarRetencion', Description=NULL, Help=NULL WHERE AD_Element_ID=3000127
;

-- 19/02/2013 23:25:59 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Process_Para SET ColumnName='GenerarRetencion', Name='GenerarRetencion', Description=NULL, Help=NULL, AD_Element_ID=3000127 WHERE UPPER(ColumnName)='GENERARRETENCION' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 19/02/2013 23:25:59 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Process_Para SET ColumnName='GenerarRetencion', Name='GenerarRetencion', Description=NULL, Help=NULL WHERE AD_Element_ID=3000127 AND IsCentrallyMaintained='Y'
;

-- 19/02/2013 23:25:59 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET Name='GenerarRetencion', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000127) AND IsCentrallyMaintained='Y'
;

-- 19/02/2013 23:25:59 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_PrintFormatItem pi SET PrintName='GenerarRetencion', Name='GenerarRetencion' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000127)
;

-- 19/02/2013 23:30:01 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Process (AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Classname,Value,Name,AD_Org_ID,AD_Client_ID,Created,CreatedBy,Updated,UpdatedBy,IsActive) VALUES (3000055,'N','N','3','N','N','Y','LAR',55,49,'ar.com.ergio.process.LAR_GenerateWithholding','LAR_GenerateWithholding','Genera Retención sobre Cabecera de Pago',0,0,TO_DATE('2013-02-19 23:30:00','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2013-02-19 23:30:00','YYYY-MM-DD HH24:MI:SS'),100,'Y')
;

-- 19/02/2013 23:30:01 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000055 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 19/02/2013 23:31:02 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET AD_Reference_ID=28, AD_Process_ID=3000055,Updated=TO_DATE('2013-02-19 23:31:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000831
;

-- 20/02/2013 22:36:26 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000128,'esretencioniibb','LAR','esretencioniibb','esretencioniibb',0,TO_DATE('2013-02-20 22:36:25','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2013-02-20 22:36:25','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 20/02/2013 22:36:26 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000128 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 20/02/2013 22:36:27 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000832,335,'LAR',0,'N','N','N','N',1,'N',20,'N',3000128,'N','Y','N','esretencioniibb','esretencioniibb',100,TO_DATE('2013-02-20 22:36:25','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2013-02-20 22:36:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 20/02/2013 22:36:27 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000832 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 20/02/2013 22:37:37 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Element SET ColumnName='EsRetencionIIBB', Name='EsRetencionIIBB', PrintName='EsRetencionIIBB',Updated=TO_DATE('2013-02-20 22:37:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000128
;

-- 20/02/2013 22:37:37 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000128
;

-- 20/02/2013 22:37:37 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET ColumnName='EsRetencionIIBB', Name='EsRetencionIIBB', Description=NULL, Help=NULL WHERE AD_Element_ID=3000128
;

-- 20/02/2013 22:37:37 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Process_Para SET ColumnName='EsRetencionIIBB', Name='EsRetencionIIBB', Description=NULL, Help=NULL, AD_Element_ID=3000128 WHERE UPPER(ColumnName)='ESRETENCIONIIBB' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 20/02/2013 22:37:37 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Process_Para SET ColumnName='EsRetencionIIBB', Name='EsRetencionIIBB', Description=NULL, Help=NULL WHERE AD_Element_ID=3000128 AND IsCentrallyMaintained='Y'
;

-- 20/02/2013 22:37:37 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET Name='EsRetencionIIBB', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000128) AND IsCentrallyMaintained='Y'
;

-- 20/02/2013 22:37:37 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_PrintFormatItem pi SET PrintName='EsRetencionIIBB', Name='EsRetencionIIBB' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000128)
;

-- 20/02/2013 22:40:04 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Tab SET SeqNo=40,Updated=TO_DATE('2013-02-20 22:40:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000017
;

-- 20/02/2013 22:46:25 ART
-- ISSUE 17: Retención en Pago a varias Facturas
DELETE  FROM  AD_Column_Trl WHERE AD_Column_ID=3000080
;

-- 20/02/2013 22:46:25 ART
-- ISSUE 17: Retención en Pago a varias Facturas
DELETE FROM AD_Column WHERE AD_Column_ID=3000080
;

-- 20/02/2013 22:46:51 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000833,3000004,'LAR',0,'Y','N','N','N',131089,'N',19,'N',3000068,'N','Y','N','LAR_PaymentHeader','LAR_PaymentHeader_ID',100,TO_DATE('2013-02-20 22:46:50','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2013-02-20 22:46:50','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 20/02/2013 22:46:51 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000833 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 20/02/2013 22:47:39 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,AD_Column_ID,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('Y',3000010,30,'N','N',3000004,3000029,'N','N',3000833,'N','N',1,'Y','N','LAR','Withholding Detail',0,0,TO_DATE('2013-02-20 22:47:38','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2013-02-20 22:47:38','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 20/02/2013 22:47:39 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000029 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 20/02/2013 22:48:20 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001127,29,'Y','N','N',3000082,'N','Y',3000029,'N','The Accounting Date indicates the date to be used on the General Ledger account entries generated from this document. It is also used for any currency conversion.','LAR','Accounting Date','Account Date',100,0,TO_DATE('2013-02-20 22:48:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2013-02-20 22:48:19','YYYY-MM-DD HH24:MI:SS'))
;

-- 20/02/2013 22:48:20 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001127 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 20/02/2013 22:48:20 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001128,1,'Y','N','N',3000077,'N','Y',3000029,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,TO_DATE('2013-02-20 22:48:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2013-02-20 22:48:20','YYYY-MM-DD HH24:MI:SS'))
;

-- 20/02/2013 22:48:20 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001128 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 20/02/2013 22:48:21 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001129,10,'Y','N','N',3000071,'N','Y',3000029,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,TO_DATE('2013-02-20 22:48:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2013-02-20 22:48:20','YYYY-MM-DD HH24:MI:SS'))
;

-- 20/02/2013 22:48:21 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001129 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 20/02/2013 22:48:21 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001130,10,'Y','N','N',3000079,'N','Y',3000029,'N','The Invoice Document.','LAR','Invoice Identifier','Invoice',100,0,TO_DATE('2013-02-20 22:48:21','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2013-02-20 22:48:21','YYYY-MM-DD HH24:MI:SS'))
;

-- 20/02/2013 22:48:21 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001130 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 20/02/2013 22:48:22 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001131,131089,'Y','N','N',3000833,'N','Y',3000029,'N','LAR','LAR_PaymentHeader',100,0,TO_DATE('2013-02-20 22:48:21','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2013-02-20 22:48:21','YYYY-MM-DD HH24:MI:SS'))
;

-- 20/02/2013 22:48:22 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001131 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 20/02/2013 22:48:22 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001132,10,'N','N','N',3000078,'N','Y',3000029,'N','LAR','LAR_PaymentWithholding',100,0,TO_DATE('2013-02-20 22:48:22','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2013-02-20 22:48:22','YYYY-MM-DD HH24:MI:SS'))
;

-- 20/02/2013 22:48:22 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001132 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 20/02/2013 22:48:23 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001133,10,'Y','N','N',3000072,'N','Y',3000029,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,TO_DATE('2013-02-20 22:48:22','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2013-02-20 22:48:22','YYYY-MM-DD HH24:MI:SS'))
;

-- 20/02/2013 22:48:23 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001133 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 20/02/2013 22:48:23 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001134,131089,'Y','N','N',3000086,'N','Y',3000029,'N','The Percent indicates the percentage used.','LAR','Percentage','Percent',100,0,TO_DATE('2013-02-20 22:48:23','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2013-02-20 22:48:23','YYYY-MM-DD HH24:MI:SS'))
;

-- 20/02/2013 22:48:23 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001134 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 20/02/2013 22:48:24 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001135,1,'Y','N','N',3000087,'N','Y',3000029,'N','The Processed checkbox indicates that a document has been processed.','LAR','The document has been processed','Processed',100,0,TO_DATE('2013-02-20 22:48:23','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2013-02-20 22:48:23','YYYY-MM-DD HH24:MI:SS'))
;

-- 20/02/2013 22:48:24 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001135 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 20/02/2013 22:48:24 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001136,10,'Y','N','N',3000081,'N','Y',3000029,'N','The Tax indicates the type of tax used in document line.','LAR','Tax identifier','Tax',100,0,TO_DATE('2013-02-20 22:48:24','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2013-02-20 22:48:24','YYYY-MM-DD HH24:MI:SS'))
;

-- 20/02/2013 22:48:24 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001136 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 20/02/2013 22:48:25 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001137,131089,'Y','N','N',3000088,'N','Y',3000029,'N','The Tax Amount displays the total tax amount for a document.','LAR','Tax Amount for a document','Tax Amount',100,0,TO_DATE('2013-02-20 22:48:24','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2013-02-20 22:48:24','YYYY-MM-DD HH24:MI:SS'))
;

-- 20/02/2013 22:48:25 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001137 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 20/02/2013 22:48:25 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001138,131089,'Y','N','N',3000089,'N','Y',3000029,'N','The Tax Base Amount indicates the base amount used for calculating the tax amount.','LAR','Base for calculating the tax amount','Tax base Amount',100,0,TO_DATE('2013-02-20 22:48:25','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2013-02-20 22:48:25','YYYY-MM-DD HH24:MI:SS'))
;

-- 20/02/2013 22:48:25 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001138 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 20/02/2013 22:48:26 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001139,29,'Y','N','N',3000083,'N','Y',3000029,'N','The Transaction Date indicates the date of the transaction.','LAR','Transaction Date','Transaction Date',100,0,TO_DATE('2013-02-20 22:48:25','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2013-02-20 22:48:25','YYYY-MM-DD HH24:MI:SS'))
;

-- 20/02/2013 22:48:26 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001139 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 20/02/2013 22:48:26 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001140,10,'Y','N','N',3000084,'N','Y',3000029,'N','LAR','Withholding Rule',100,0,TO_DATE('2013-02-20 22:48:26','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2013-02-20 22:48:26','YYYY-MM-DD HH24:MI:SS'))
;

-- 20/02/2013 22:48:26 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001140 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 20/02/2013 22:48:27 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001141,10,'Y','N','N',3000085,'N','Y',3000029,'N','LAR','Withholding Type',100,0,TO_DATE('2013-02-20 22:48:26','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2013-02-20 22:48:26','YYYY-MM-DD HH24:MI:SS'))
;

-- 20/02/2013 22:48:27 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001141 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 20/02/2013 22:49:51 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2013-02-20 22:49:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001133
;

-- 20/02/2013 22:50:18 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2013-02-20 22:50:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001136
;

-- 20/02/2013 22:50:28 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2013-02-20 22:50:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001139
;

-- 20/02/2013 22:50:36 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2013-02-20 22:50:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001141
;

-- 20/02/2013 22:50:46 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2013-02-20 22:50:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001135
;

-- 20/02/2013 22:50:55 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2013-02-20 22:50:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001138
;

-- 20/02/2013 22:51:16 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001131
;

-- 20/02/2013 22:51:16 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3001127
;

-- 20/02/2013 22:51:16 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3001128
;

-- 20/02/2013 22:51:16 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3001129
;

-- 20/02/2013 22:51:16 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3001130
;

-- 20/02/2013 22:51:16 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3001133
;

-- 20/02/2013 22:51:16 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3001134
;

-- 20/02/2013 22:51:16 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3001135
;

-- 20/02/2013 22:51:16 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3001136
;

-- 20/02/2013 22:51:16 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3001137
;

-- 20/02/2013 22:51:16 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3001138
;

-- 20/02/2013 22:51:16 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3001139
;

-- 20/02/2013 22:51:16 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3001140
;

-- 20/02/2013 22:51:16 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3001141
;

-- 20/02/2013 22:53:28 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3001129
;

-- 20/02/2013 22:53:28 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3001133
;

-- 20/02/2013 22:53:28 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3001128
;

-- 20/02/2013 22:53:28 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3001135
;

-- 20/02/2013 22:53:28 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3001130
;

-- 20/02/2013 22:53:28 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3001137
;

-- 20/02/2013 22:53:28 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3001138
;

-- 20/02/2013 22:53:28 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3001134
;

-- 20/02/2013 22:53:28 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3001136
;

-- 20/02/2013 22:53:28 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3001127
;

-- 20/02/2013 23:01:06 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001142,1,'Y','N','N',3000831,'N','Y',3000015,'N','LAR','GenerarRetencion',100,0,TO_DATE('2013-02-20 23:01:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2013-02-20 23:01:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 20/02/2013 23:01:06 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001142 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 20/02/2013 23:02:51 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3001143
;

-- 20/02/2013 23:02:51 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3001142
;

-- 20/02/2013 23:02:51 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000402
;

-- 20/02/2013 23:03:44 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2013-02-20 23:03:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001142
;

-- 20/02/2013 23:12:29 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET DisplayLength=10,Updated=TO_DATE('2013-02-20 23:12:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001143
;

-- 20/02/2013 23:15:44 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET DisplayLength=10,Updated=TO_DATE('2013-02-20 23:15:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001137
;

-- 20/02/2013 23:16:13 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET DisplayLength=10,Updated=TO_DATE('2013-02-20 23:16:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001138
;

-- 20/02/2013 23:19:17 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET DisplayLength=10,Updated=TO_DATE('2013-02-20 23:19:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001134
;

-- 21/02/2013 18:03:43 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET DisplayLogic='@DocBaseType@=''API'' | @DocBaseType@=''APC'' | @DocBaseType@=''ARI'' | @DocBaseType@=''ARC'' | @DocBaseType@=''APP''',Updated=TO_DATE('2013-02-21 18:03:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=1000015
;

-- 23/02/2013 0:53:47 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET IsMandatory='N',Updated=TO_DATE('2013-02-23 00:53:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000079
;

-- 23/02/2013 1:18:25 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET AD_Reference_ID=15,Updated=TO_DATE('2013-02-23 01:18:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000082
;

-- 23/02/2013 1:18:42 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET AD_Reference_ID=15,Updated=TO_DATE('2013-02-23 01:18:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000083
;

-- 23/02/2013 1:19:09 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET IsMandatory='Y',Updated=TO_DATE('2013-02-23 01:19:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000084
;

-- 23/02/2013 17:46:55 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET IsMandatory='N',Updated=TO_DATE('2013-02-23 17:46:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000099
;

-- 23/02/2013 22:54:12 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET ColumnSQL='(SELECT l.City FROM C_BPartner_Location bp JOIN LAR_PaymentHeader py ON py.C_BPartner_ID = bp.C_BPartner_ID JOIN C_Location l ON l.C_Location_ID = bp.C_Location_ID WHERE py.LAR_PaymentHeader_ID = LAR_WithholdingCertificate.LAR_PaymentHeader_ID)',Updated=TO_DATE('2013-02-23 22:54:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000109
;

-- 23/02/2013 22:58:49 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET EntityType='LAR',Updated=TO_DATE('2013-02-23 22:58:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000109
;

-- 23/02/2013 23:01:12 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET ColumnSQL='(SELECT l.Address1 FROM C_BPartner_Location bp JOIN LAR_PaymentHeader py ON py.C_BPartner_ID = bp.C_BPartner_ID JOIN C_Location l ON l.C_Location_ID = bp.C_Location_ID WHERE py.LAR_PaymentHeader_ID = LAR_WithholdingCertificate.LAR_PaymentHeader_ID)', EntityType='LAR',Updated=TO_DATE('2013-02-23 23:01:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000110
;

-- 23/02/2013 23:03:09 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET ColumnSQL='(SELECT DateTrx FROM LAR_PaymentHeader py WHERE py.LAR_PaymentHeader_ID = LAR_WithholdingCertificate.LAR_PaymentHeader_ID)', EntityType='LAR',Updated=TO_DATE('2013-02-23 23:03:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000111
;

-- 23/02/2013 23:05:22 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET ColumnSQL='(SELECT bp.DUNS FROM C_BPartner bp JOIN LAR_PaymentHeader py ON py.C_BPartner_ID = bp.C_BPartner_ID WHERE py.LAR_PaymentHeader_ID = LAR_WithholdingCertificate.LAR_PaymentHeader_ID)', EntityType='LAR',Updated=TO_DATE('2013-02-23 23:05:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000112
;

-- 23/02/2013 23:07:49 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET ColumnSQL='(SELECT bp.Name FROM C_BPartner bp JOIN LAR_PaymentHeader py ON py.C_BPartner_ID = bp.C_BPartner_ID WHERE py.LAR_PaymentHeader_ID = LAR_WithholdingCertificate.LAR_PaymentHeader_ID)', EntityType='LAR',Updated=TO_DATE('2013-02-23 23:07:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000113
;

-- 23/02/2013 23:10:10 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET ColumnSQL='(SELECT (Percent*100) FROM LAR_PaymentWithholding lh WHERE LAR_WithholdingCertificate.LAR_PaymentHeader_ID = lh.LAR_PaymentHeader_ID)', EntityType='LAR',Updated=TO_DATE('2013-02-23 23:10:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000114
;

-- 23/02/2013 23:12:17 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET ColumnSQL='(SELECT l.Postal FROM C_BPartner_Location bp JOIN LAR_PaymentHeader py ON py.C_BPartner_id = bp.C_BPartner_ID JOIN C_Location l ON l.C_Location_ID = bp.C_Location_ID WHERE py.LAR_PaymentHeader_ID = LAR_WithholdingCertificate.LAR_PaymentHeader_ID)', EntityType='LAR',Updated=TO_DATE('2013-02-23 23:12:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000115
;

-- 23/02/2013 23:14:50 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET ColumnSQL='(SELECT r.Name from C_BPartner_Location bp JOIN LAR_PaymentHeader py on py.C_BPartner_ID = bp.C_BPartner_ID JOIN c_Location l on l.c_Location_ID = bp.c_Location_ID JOIN c_region r on l.c_region_ID = r.c_region_ID WHERE py.LAR_PaymentHeader_ID = LAR_WithholdingCertificate.LAR_PaymentHeader_ID)', EntityType='LAR',Updated=TO_DATE('2013-02-23 23:14:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000116
;

-- 23/02/2013 23:16:34 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET ColumnSQL='(SELECT TaxAmt from LAR_PaymentWithholding lh WHERE LAR_WithholdingCertificate.LAR_PaymentHeader_ID = lh.LAR_PaymentHeader_ID)', EntityType='LAR',Updated=TO_DATE('2013-02-23 23:16:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000117
;

-- 23/02/2013 23:17:49 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET ColumnSQL='(SELECT bp.TaxID from C_BPartner bp JOIN LAR_PaymentHeader py on py.C_BPartner_ID = bp.C_BPartner_ID WHERE py.LAR_PaymentHeader_ID = LAR_WithholdingCertificate.LAR_PaymentHeader_ID)', EntityType='LAR',Updated=TO_DATE('2013-02-23 23:17:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000118
;

-- 23/02/2013 23:25:18 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET ColumnSQL='(SELECT TaxBaseAmt FROM LAR_PaymentWithholding lh WHERE LAR_WithholdingCertificate.LAR_PaymentHeader_ID = lh.LAR_PaymentHeader_ID)', EntityType='LAR',Updated=TO_DATE('2013-02-23 23:25:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000108
;

-- 24/02/2013 2:37:39 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3000070
;

-- 24/02/2013 2:37:39 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3000069
;

-- 24/02/2013 2:38:22 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2013-02-24 02:38:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000070
;

-- 24/02/2013 2:38:28 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2013-02-24 02:38:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000069
;

-- 24/02/2013 2:38:48 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET DisplayLength=10,Updated=TO_DATE('2013-02-24 02:38:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001126
;

-- 24/02/2013 2:39:24 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET EntityType='LAR',Updated=TO_DATE('2013-02-24 02:39:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000069
;

-- 24/02/2013 2:39:46 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET EntityType='LAR',Updated=TO_DATE('2013-02-24 02:39:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000075
;

-- 24/02/2013 2:40:12 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET EntityType='LAR',Updated=TO_DATE('2013-02-24 02:40:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000082
;

-- 24/02/2013 2:40:32 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET EntityType='LAR',Updated=TO_DATE('2013-02-24 02:40:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000072
;

-- 24/02/2013 2:40:44 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET EntityType='LAR',Updated=TO_DATE('2013-02-24 02:40:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000065
;

-- 24/02/2013 2:40:56 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET EntityType='LAR',Updated=TO_DATE('2013-02-24 02:40:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000067
;

-- 24/02/2013 2:41:03 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET EntityType='LAR',Updated=TO_DATE('2013-02-24 02:41:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000083
;

-- 24/02/2013 2:41:21 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET DisplayLength=20, EntityType='LAR',Updated=TO_DATE('2013-02-24 02:41:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000079
;

-- 24/02/2013 2:41:44 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET EntityType='LAR',Updated=TO_DATE('2013-02-24 02:41:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000066
;

-- 24/02/2013 2:42:05 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET EntityType='LAR',Updated=TO_DATE('2013-02-24 02:42:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000078
;

-- 24/02/2013 2:42:14 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET EntityType='LAR',Updated=TO_DATE('2013-02-24 02:42:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000081
;

-- 24/02/2013 2:43:12 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET DisplayLength=20,Updated=TO_DATE('2013-02-24 02:43:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000070
;

-- 24/02/2013 2:46:28 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET AD_Reference_ID=10,Updated=TO_DATE('2013-02-24 02:46:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000109
;

-- 24/02/2013 2:47:18 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET AD_Reference_ID=10,Updated=TO_DATE('2013-02-24 02:47:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000110
;

-- 24/02/2013 2:47:44 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET AD_Reference_ID=10,Updated=TO_DATE('2013-02-24 02:47:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000112
;

-- 24/02/2013 2:47:59 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET AD_Reference_ID=10,Updated=TO_DATE('2013-02-24 02:47:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000113
;

-- 24/02/2013 2:48:12 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET AD_Reference_ID=10,Updated=TO_DATE('2013-02-24 02:48:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000115
;

-- 24/02/2013 2:48:20 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET AD_Reference_ID=10,Updated=TO_DATE('2013-02-24 02:48:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000116
;

-- 24/02/2013 2:48:34 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET AD_Reference_ID=10,Updated=TO_DATE('2013-02-24 02:48:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000118
;

-- 24/02/2013 15:23:35 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000839,3000010,'LAR',0,'N','N','N','N',131089,'N',12,'N',1000024,'N','Y','N','Withholding Amount','WithholdingAmt',100,TO_DATE('2013-02-24 15:23:34','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2013-02-24 15:23:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/02/2013 15:23:35 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000839 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/02/2013 15:24:43 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET FieldLength=22,Updated=TO_DATE('2013-02-24 15:24:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000839
;

-- 24/02/2013 15:26:10 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001147,22,'Y','N','N',3000839,'N','Y',3000015,'N','LAR','Withholding Amount',100,0,TO_DATE('2013-02-24 15:26:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2013-02-24 15:26:09','YYYY-MM-DD HH24:MI:SS'))
;

-- 24/02/2013 15:26:10 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001147 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 24/02/2013 15:26:45 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3001147
;

-- 24/02/2013 15:27:12 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2013-02-24 15:27:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001147
;

-- 22/03/2013 16:48:52 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Tab SET SeqNo=40,Updated=TO_DATE('2013-03-22 16:48:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000029
;

-- 22/03/2013 16:48:56 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Tab SET SeqNo=30,Updated=TO_DATE('2013-03-22 16:48:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000017
;

-- 01/04/2013 12:32:58 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET FieldLength=22, AD_Reference_ID=22,Updated=TO_DATE('2013-04-01 12:32:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000086
;

-- 02/05/2013 16:36:37 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2013-05-02 16:36:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000401
;

-- 01/06/2013 14:07:23 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000130,'lar_withholding_charge_id','LAR','lar_withholding_charge_id','lar_withholding_charge_id',0,TO_DATE('2013-06-01 14:07:18','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2013-06-01 14:07:18','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 01/06/2013 14:07:24 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000130 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 01/06/2013 14:07:24 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000842,217,'LAR',0,'N','N','N','N',131089,'N',19,'N',3000130,'N','Y','N','lar_withholding_charge_id','lar_withholding_charge_id',100,TO_DATE('2013-06-01 14:07:18','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2013-06-01 14:07:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 01/06/2013 14:07:24 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000842 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 01/06/2013 14:15:05 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Element SET ColumnName='LAR_Withholding_Charge_ID', Name='LAR_Withholding_Charge_ID', PrintName='LAR_Withholding_Charge_ID',Updated=TO_DATE('2013-06-01 14:15:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000130
;

-- 01/06/2013 14:15:05 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000130
;

-- 01/06/2013 14:15:05 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET ColumnName='LAR_Withholding_Charge_ID', Name='LAR_Withholding_Charge_ID', Description=NULL, Help=NULL WHERE AD_Element_ID=3000130
;

-- 01/06/2013 14:15:05 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Process_Para SET ColumnName='LAR_Withholding_Charge_ID', Name='LAR_Withholding_Charge_ID', Description=NULL, Help=NULL, AD_Element_ID=3000130 WHERE UPPER(ColumnName)='LAR_WITHHOLDING_CHARGE_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 01/06/2013 14:15:05 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Process_Para SET ColumnName='LAR_Withholding_Charge_ID', Name='LAR_Withholding_Charge_ID', Description=NULL, Help=NULL WHERE AD_Element_ID=3000130 AND IsCentrallyMaintained='Y'
;

-- 01/06/2013 14:15:05 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET Name='LAR_Withholding_Charge_ID', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000130) AND IsCentrallyMaintained='Y'
;

-- 01/06/2013 14:15:05 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_PrintFormatItem pi SET PrintName='LAR_Withholding_Charge_ID', Name='LAR_Withholding_Charge_ID' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000130)
;

-- 01/06/2013 14:25:04 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET FieldLength=22,Updated=TO_DATE('2013-06-01 14:25:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000842
;

-- 01/06/2013 14:39:34 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000025,'T','LAR','N','LAR Withholding Charges',0,0,100,TO_DATE('2013-06-01 14:39:33','YYYY-MM-DD HH24:MI:SS'),'Y',TO_DATE('2013-06-01 14:39:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 01/06/2013 14:39:34 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000025 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 01/06/2013 15:35:53 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Ref_Table (IsValueDisplayed,AD_Table_ID,AD_Reference_ID,AD_Key,AD_Display,EntityType,CreatedBy,Created,Updated,AD_Client_ID,UpdatedBy,AD_Org_ID,IsActive) VALUES ('N',313,3000025,3333,3341,'LAR',100,TO_DATE('2013-06-01 15:35:53','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2013-06-01 15:35:53','YYYY-MM-DD HH24:MI:SS'),0,100,0,'Y')
;

-- 01/06/2013 15:40:40 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Ref_Table SET WhereClause='C_Charge.IsActive=''Y''',Updated=TO_DATE('2013-06-01 15:40:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=3000025
;

-- 01/06/2013 15:40:56 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Column SET AD_Reference_Value_ID=3000025, AD_Reference_ID=18,Updated=TO_DATE('2013-06-01 15:40:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000842
;

-- 01/06/2013 18:52:00 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001289,22,'Y','N','N',3000842,'N','Y',167,'N','LAR','LAR_Withholding_Charge_ID',100,0,TO_DATE('2013-06-01 18:51:59','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2013-06-01 18:51:59','YYYY-MM-DD HH24:MI:SS'))
;

-- 01/06/2013 18:52:00 ART
-- ISSUE 17: Retención en Pago a varias Facturas
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001289 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 01/06/2013 19:17:52 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3125
;

-- 01/06/2013 19:17:52 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=1000015
;

-- 01/06/2013 19:17:52 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3001289
;

-- 01/06/2013 19:17:52 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000039
;

-- 01/06/2013 19:17:52 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000032
;

-- 01/06/2013 19:17:52 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000038
;

-- 01/06/2013 19:17:52 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000031
;

-- 01/06/2013 19:17:52 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000036
;

-- 01/06/2013 19:17:52 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000035
;

-- 01/06/2013 19:17:52 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000037
;

-- 01/06/2013 19:17:52 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000030
;

-- 01/06/2013 19:17:52 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000034
;

-- 01/06/2013 19:22:01 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET DisplayLogic='@GenerateWithholding@=''A'' | @GenerateWithholding@=''Y''',Updated=TO_DATE('2013-06-01 19:22:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001289
;

-- 01/06/2013 19:29:52 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2013-06-01 19:29:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001289
;

-- 02/06/2013 22:34:28 ART
-- ISSUE 17: Retención en Pago a varias Facturas
UPDATE AD_Field SET DisplayLogic='@DocBaseType@=''APP'' & @GenerateWithholding@=''A'' | @GenerateWithholding@=''Y''',Updated=TO_DATE('2013-06-02 22:34:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001289
;
