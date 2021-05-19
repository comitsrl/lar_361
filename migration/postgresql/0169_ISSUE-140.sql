ALTER TABLE M_InOut ADD COLUMN SolicitarCOT character(1) DEFAULT 'N'::bpchar;
ALTER TABLE M_InOut ADD COLUMN Chofer character varying(60);
ALTER TABLE M_InOut ADD COLUMN Patente character varying(10);
ALTER TABLE M_InOut ADD COLUMN Patente_Acoplado character varying(10);
ALTER TABLE M_InOut ADD COLUMN Condicion_Flete character varying(60);
ALTER TABLE M_InOut ADD COLUMN Domicilio_Transporte character varying(60);
ALTER TABLE M_InOut ADD COLUMN Identificacion_Transporte character varying(15);
ALTER TABLE M_InOut ADD COLUMN Tipo_Ident_Transporte_ID numeric(10,0);
ALTER TABLE M_InOut ADD CONSTRAINT tipoidenttransporte_minout FOREIGN KEY (Tipo_Ident_Transporte_ID)
      REFERENCES adempiere.LCO_TaxIDType (LCO_TaxIDType_ID) MATCH SIMPLE;
ALTER TABLE M_InOut ADD COLUMN COT character varying(60);
ALTER TABLE M_InOut ADD COLUMN CodigoIntegridadCOT character varying(60);
ALTER TABLE M_InOut ADD COLUMN NumeroComprobanteCOT character varying(30);
ALTER TABLE M_InOut ADD COLUMN ErrorCOT character varying(255);

ALTER TABLE C_UOM ADD COLUMN CodigoCOT character(1);

ALTER TABLE C_Region ADD COLUMN CodigoCOT character(1);

ALTER TABLE C_Order ADD COLUMN Chofer character varying(60);
ALTER TABLE C_Order ADD COLUMN Patente character varying(10);
ALTER TABLE C_Order ADD COLUMN Patente_Acoplado character varying(10);
ALTER TABLE C_Order ADD COLUMN Condicion_Flete character varying(60);
ALTER TABLE C_Order ADD COLUMN Domicilio_Transporte character varying(60);
ALTER TABLE C_Order ADD COLUMN Identificacion_Transporte character varying(15);
ALTER TABLE C_Order ADD COLUMN Tipo_Ident_Transporte_ID numeric(10,0);
ALTER TABLE C_Order ADD CONSTRAINT tipoidenttransporte_corder FOREIGN KEY (Tipo_Ident_Transporte_ID)
      REFERENCES adempiere.LCO_TaxIDType (LCO_TaxIDType_ID) MATCH SIMPLE;

-- 21/04/2021 19:34:24 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001092,'solicitarcot','LAR','solicitarcot','solicitarcot',0,TO_TIMESTAMP('2021-04-21 19:34:24','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2021-04-21 19:34:24','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 21/04/2021 19:34:24 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001092 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 21/04/2021 19:34:25 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003692,319,'LAR',0,'N','N','N','N',1,'N',20,'N',3001092,'N','Y','N','solicitarcot','solicitarcot',TO_TIMESTAMP('2021-04-21 19:34:24','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2021-04-21 19:34:24','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/04/2021 19:34:25 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003692 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/04/2021 19:34:58 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET Name='Solicitar COT', ColumnName='SolicitarCOT',Updated=TO_TIMESTAMP('2021-04-21 19:34:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003692
;

-- 21/04/2021 19:34:58 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003692
;

-- 21/04/2021 19:34:58 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Solicitar COT', Description=NULL, Help=NULL WHERE AD_Column_ID=3003692 AND IsCentrallyMaintained='Y'
;

-- 21/04/2021 19:35:27 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element SET ColumnName='SolicitarCOT', Name='Solicitar COT', PrintName='Solicitar COT',Updated=TO_TIMESTAMP('2021-04-21 19:35:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001092
;

-- 21/04/2021 19:35:27 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001092
;

-- 21/04/2021 19:35:27 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ColumnName='SolicitarCOT', Name='Solicitar COT', Description=NULL, Help=NULL WHERE AD_Element_ID=3001092
;

-- 21/04/2021 19:35:27 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='SolicitarCOT', Name='Solicitar COT', Description=NULL, Help=NULL, AD_Element_ID=3001092 WHERE UPPER(ColumnName)='SOLICITARCOT' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 21/04/2021 19:35:27 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='SolicitarCOT', Name='Solicitar COT', Description=NULL, Help=NULL WHERE AD_Element_ID=3001092 AND IsCentrallyMaintained='Y'
;

-- 21/04/2021 19:35:27 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Solicitar COT', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001092) AND IsCentrallyMaintained='Y'
;

-- 21/04/2021 19:35:27 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_PrintFormatItem SET PrintName='Solicitar COT', Name='Solicitar COT' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001092)
;

-- 21/04/2021 19:35:45 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET Name='Solicitar COT',PrintName='Solicitar COT',Updated=TO_TIMESTAMP('2021-04-21 19:35:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001092 AND AD_Language='es_AR'
;

-- 21/04/2021 19:36:12 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET Name='Solicitar COT',Updated=TO_TIMESTAMP('2021-04-21 19:36:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003692 AND AD_Language='es_AR'
;

-- 21/04/2021 19:38:33 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Process (AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Classname,CopyFromProcess,Value,Name,AD_Org_ID,AD_Client_ID,UpdatedBy,CreatedBy,Updated,Created,IsActive) VALUES (3000413,'N','N','3','N','N','Y','LAR',0,0,'ar.com.ergio.process.LAR_SolicitarCOT','N','10000000','LAR_SolicitarCOT',0,0,100,100,TO_TIMESTAMP('2021-04-21 19:38:32','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2021-04-21 19:38:32','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 21/04/2021 19:38:33 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000413 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 21/04/2021 19:39:58 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000689,0,3000413,100,'N',13,10,'N','LAR','M_InOut_ID','M_InOut_ID','Y',0,100,TO_TIMESTAMP('2021-04-21 19:39:57','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2021-04-21 19:39:57','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 21/04/2021 19:39:58 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000689 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 21/04/2021 19:40:20 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process SET ShowHelp='S',Updated=TO_TIMESTAMP('2021-04-21 19:40:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000413
;

-- 21/04/2021 19:40:56 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET AD_Reference_ID=28, AD_Process_ID=3000413,Updated=TO_TIMESTAMP('2021-04-21 19:40:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003692
;

-- 21/04/2021 19:42:05 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007002,20,'Y','N','N',59044,'N','Y',257,'N','The ProcessedOn Date+Time save the exact moment (nanoseconds precision if allowed by the DB) when a document has been processed.','D','The date+time (expressed in decimal format) when the document has been processed','Processed On',100,0,TO_TIMESTAMP('2021-04-21 19:42:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-04-21 19:42:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/04/2021 19:42:05 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007002 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/04/2021 19:42:06 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007003,22,'Y','N','N',55303,'N','Y',257,'N','D','ID of document reversal','Reversal ID',100,0,TO_TIMESTAMP('2021-04-21 19:42:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-04-21 19:42:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/04/2021 19:42:06 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007003 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/04/2021 19:42:06 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007004,1,'Y','N','N',3003692,'N','Y',257,'N','LAR','Solicitar COT',100,0,TO_TIMESTAMP('2021-04-21 19:42:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-04-21 19:42:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/04/2021 19:42:06 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007004 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/04/2021 19:42:33 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007002
;

-- 21/04/2021 19:42:33 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007003
;

-- 21/04/2021 19:42:33 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3007004
;

-- 21/04/2021 19:43:26 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_TIMESTAMP('2021-04-21 19:43:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003692
;

-- 21/04/2021 20:19:23 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET DefaultValue='@M_InOut_ID@',Updated=TO_TIMESTAMP('2021-04-21 20:19:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000689
;

-- 21/04/2021 20:39:42 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000260,3000002,'LAR','088','Remito Electrónico',TO_TIMESTAMP('2021-04-21 20:39:41','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2021-04-21 20:39:41','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 21/04/2021 20:39:42 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000260 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 21/04/2021 21:07:09 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001093,'codigocot','LAR','codigocot','codigocot',0,TO_TIMESTAMP('2021-04-21 21:07:09','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2021-04-21 21:07:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 21/04/2021 21:07:09 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001093 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 21/04/2021 21:07:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003693,146,'LAR',0,'N','N','N','N',1,'N',20,'N',3001093,'N','Y','N','codigocot','codigocot',TO_TIMESTAMP('2021-04-21 21:07:09','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2021-04-21 21:07:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/04/2021 21:07:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003693 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/04/2021 21:11:42 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET AD_Reference_ID=14, Name='Codigo COT', ColumnName='CodigoCOT',Updated=TO_TIMESTAMP('2021-04-21 21:11:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003693
;

-- 21/04/2021 21:11:42 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003693
;

-- 21/04/2021 21:11:42 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Codigo COT', Description=NULL, Help=NULL WHERE AD_Column_ID=3003693 AND IsCentrallyMaintained='Y'
;

-- 21/04/2021 21:12:01 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element SET ColumnName='CodigoCOT', Name='Codigo COT', PrintName='Codigo COT',Updated=TO_TIMESTAMP('2021-04-21 21:12:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001093
;

-- 21/04/2021 21:12:01 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001093
;

-- 21/04/2021 21:12:01 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ColumnName='CodigoCOT', Name='Codigo COT', Description=NULL, Help=NULL WHERE AD_Element_ID=3001093
;

-- 21/04/2021 21:12:01 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='CodigoCOT', Name='Codigo COT', Description=NULL, Help=NULL, AD_Element_ID=3001093 WHERE UPPER(ColumnName)='CODIGOCOT' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 21/04/2021 21:12:01 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='CodigoCOT', Name='Codigo COT', Description=NULL, Help=NULL WHERE AD_Element_ID=3001093 AND IsCentrallyMaintained='Y'
;

-- 21/04/2021 21:12:02 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Codigo COT', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001093) AND IsCentrallyMaintained='Y'
;

-- 21/04/2021 21:12:02 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_PrintFormatItem SET PrintName='Codigo COT', Name='Codigo COT' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001093)
;

-- 21/04/2021 21:12:07 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET Name='Codigo COT',PrintName='Codigo COT',Updated=TO_TIMESTAMP('2021-04-21 21:12:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001093 AND AD_Language='es_AR'
;

-- 21/04/2021 21:12:15 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET Name='Codigo COT',Updated=TO_TIMESTAMP('2021-04-21 21:12:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003693 AND AD_Language='es_AR'
;

-- 21/04/2021 21:13:45 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007005,1,'Y','N','N',3003693,'N','Y',133,'N','LAR','Codigo COT',100,0,TO_TIMESTAMP('2021-04-21 21:13:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-04-21 21:13:45','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/04/2021 21:13:45 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007005 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/04/2021 21:14:58 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3007001
;

-- 21/04/2021 21:14:58 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3007005
;

-- 21/04/2021 21:15:09 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2021-04-21 21:15:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007005
;

-- 21/04/2021 21:15:29 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET AD_Reference_ID=10,Updated=TO_TIMESTAMP('2021-04-21 21:15:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003693
;

-- 21/04/2021 21:17:24 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_UOM SET CodigoCOT='1',Updated=TO_TIMESTAMP('2021-04-21 21:17:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_UOM_ID=1000000
;

-- 21/04/2021 21:17:58 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_UOM SET CodigoCOT='3',Updated=TO_TIMESTAMP('2021-04-21 21:17:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_UOM_ID=100
;

-- 21/04/2021 21:19:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003694,164,'LAR',0,'N','N','N','N',1,'N',20,'N',3001093,'N','Y','N','Codigo COT','CodigoCOT',TO_TIMESTAMP('2021-04-21 21:19:43','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2021-04-21 21:19:43','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/04/2021 21:19:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003694 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/04/2021 21:20:01 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET AD_Reference_ID=14,Updated=TO_TIMESTAMP('2021-04-21 21:20:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003694
;

-- 21/04/2021 21:21:07 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007006,1,'Y','N','N',3003694,'N','Y',136,'N','LAR','Codigo COT',100,0,TO_TIMESTAMP('2021-04-21 21:21:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-04-21 21:21:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/04/2021 21:21:07 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007006 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/04/2021 21:24:07 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='B',Updated=TO_TIMESTAMP('2021-04-21 21:24:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=209
;

-- 21/04/2021 21:24:27 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='A',Updated=TO_TIMESTAMP('2021-04-21 21:24:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=225
;

-- 21/04/2021 21:25:24 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='C',Updated=TO_TIMESTAMP('2021-04-21 21:25:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=213
;

-- 21/04/2021 21:25:43 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='D',Updated=TO_TIMESTAMP('2021-04-21 21:25:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=227
;

-- 21/04/2021 21:25:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='E',Updated=TO_TIMESTAMP('2021-04-21 21:25:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=216
;

-- 21/04/2021 21:26:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='F',Updated=TO_TIMESTAMP('2021-04-21 21:26:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=220
;

-- 21/04/2021 21:26:24 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='G',Updated=TO_TIMESTAMP('2021-04-21 21:26:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=230
;

-- 21/04/2021 21:26:43 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='H',Updated=TO_TIMESTAMP('2021-04-21 21:26:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=211
;

-- 21/04/2021 21:26:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='J',Updated=TO_TIMESTAMP('2021-04-21 21:26:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=226
;

-- 21/04/2021 21:27:13 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='K',Updated=TO_TIMESTAMP('2021-04-21 21:27:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=210
;

-- 21/04/2021 21:27:38 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='L',Updated=TO_TIMESTAMP('2021-04-21 21:27:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=219
;

-- 21/04/2021 21:27:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='M',Updated=TO_TIMESTAMP('2021-04-21 21:27:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=221
;

-- 21/04/2021 21:28:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='N',Updated=TO_TIMESTAMP('2021-04-21 21:28:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=222
;

-- 21/04/2021 21:28:31 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='P',Updated=TO_TIMESTAMP('2021-04-21 21:28:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=217
;

-- 21/04/2021 21:28:40 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='Q',Updated=TO_TIMESTAMP('2021-04-21 21:28:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=223
;

-- 21/04/2021 21:28:59 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='R',Updated=TO_TIMESTAMP('2021-04-21 21:28:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=224
;

-- 21/04/2021 21:29:08 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='S',Updated=TO_TIMESTAMP('2021-04-21 21:29:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=229
;

-- 21/04/2021 21:29:35 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='T',Updated=TO_TIMESTAMP('2021-04-21 21:29:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=233
;

-- 21/04/2021 21:29:47 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='U',Updated=TO_TIMESTAMP('2021-04-21 21:29:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=212
;

-- 21/04/2021 21:30:05 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='V',Updated=TO_TIMESTAMP('2021-04-21 21:30:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=231
;

-- 21/04/2021 21:30:20 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='W',Updated=TO_TIMESTAMP('2021-04-21 21:30:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=215
;

-- 21/04/2021 21:30:42 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='X',Updated=TO_TIMESTAMP('2021-04-21 21:30:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=214
;

-- 21/04/2021 21:30:50 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='Y',Updated=TO_TIMESTAMP('2021-04-21 21:30:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=218
;

-- 21/04/2021 21:31:09 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='Z',Updated=TO_TIMESTAMP('2021-04-21 21:31:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=228
;

-- 21/04/2021 21:32:28 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET IsActive='N',Updated=TO_TIMESTAMP('2021-04-21 21:32:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=232
;

-- 26/04/2021 20:14:54 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001095,'chofer','LAR','chofer','chofer',0,TO_TIMESTAMP('2021-04-26 20:14:53','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2021-04-26 20:14:53','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 26/04/2021 20:14:54 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001095 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 26/04/2021 20:14:54 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003696,319,'LAR',0,'N','N','N','N',60,'N',10,'N',3001095,'N','Y','N','chofer','chofer',TO_TIMESTAMP('2021-04-26 20:14:53','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2021-04-26 20:14:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/04/2021 20:14:54 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003696 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 26/04/2021 20:14:54 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001096,'patente','LAR','patente','patente',0,TO_TIMESTAMP('2021-04-26 20:14:54','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2021-04-26 20:14:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 26/04/2021 20:14:54 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001096 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 26/04/2021 20:14:54 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003697,319,'LAR',0,'N','N','N','N',10,'N',10,'N',3001096,'N','Y','N','patente','patente',TO_TIMESTAMP('2021-04-26 20:14:54','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2021-04-26 20:14:54','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/04/2021 20:14:54 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003697 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 26/04/2021 20:14:55 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001097,'patente_acoplado','LAR','patente_acoplado','patente_acoplado',0,TO_TIMESTAMP('2021-04-26 20:14:54','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2021-04-26 20:14:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 26/04/2021 20:14:55 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001097 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 26/04/2021 20:14:55 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003698,319,'LAR',0,'N','N','N','N',10,'N',10,'N',3001097,'N','Y','N','patente_acoplado','patente_acoplado',TO_TIMESTAMP('2021-04-26 20:14:54','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2021-04-26 20:14:54','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/04/2021 20:14:55 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003698 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 26/04/2021 20:14:55 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001098,'condicion_flete','LAR','condicion_flete','condicion_flete',0,TO_TIMESTAMP('2021-04-26 20:14:55','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2021-04-26 20:14:55','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 26/04/2021 20:14:55 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001098 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 26/04/2021 20:14:55 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003699,319,'LAR',0,'N','N','N','N',60,'N',10,'N',3001098,'N','Y','N','condicion_flete','condicion_flete',TO_TIMESTAMP('2021-04-26 20:14:55','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2021-04-26 20:14:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/04/2021 20:14:55 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003699 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 26/04/2021 20:14:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001099,'domicilio_transporte','LAR','domicilio_transporte','domicilio_transporte',0,TO_TIMESTAMP('2021-04-26 20:14:55','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2021-04-26 20:14:55','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 26/04/2021 20:14:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001099 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 26/04/2021 20:14:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003700,319,'LAR',0,'N','N','N','N',60,'N',10,'N',3001099,'N','Y','N','domicilio_transporte','domicilio_transporte',TO_TIMESTAMP('2021-04-26 20:14:55','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2021-04-26 20:14:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/04/2021 20:14:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003700 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 26/04/2021 20:14:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001100,'identificacion_transporte','LAR','identificacion_transporte','identificacion_transporte',0,TO_TIMESTAMP('2021-04-26 20:14:57','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2021-04-26 20:14:57','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 26/04/2021 20:14:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001100 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 26/04/2021 20:14:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003701,319,'LAR',0,'N','N','N','N',15,'N',10,'N',3001100,'N','Y','N','identificacion_transporte','identificacion_transporte',TO_TIMESTAMP('2021-04-26 20:14:57','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2021-04-26 20:14:57','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/04/2021 20:14:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003701 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 26/04/2021 20:14:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001101,'tipo_ident_transporte_id','LAR','tipo_ident_transporte_id','tipo_ident_transporte_id',0,TO_TIMESTAMP('2021-04-26 20:14:57','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2021-04-26 20:14:57','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 26/04/2021 20:14:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001101 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 26/04/2021 20:14:58 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003702,319,'LAR',0,'N','N','N','N',10,'N',19,'N',3001101,'N','Y','N','tipo_ident_transporte_id','tipo_ident_transporte_id',TO_TIMESTAMP('2021-04-26 20:14:57','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2021-04-26 20:14:57','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/04/2021 20:14:58 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003702 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 26/04/2021 20:14:58 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001102,'cot','LAR','cot','cot',0,TO_TIMESTAMP('2021-04-26 20:14:58','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2021-04-26 20:14:58','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 26/04/2021 20:14:58 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001102 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 26/04/2021 20:14:58 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003703,319,'LAR',0,'N','N','N','N',60,'N',10,'N',3001102,'N','Y','N','cot','cot',TO_TIMESTAMP('2021-04-26 20:14:58','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2021-04-26 20:14:58','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/04/2021 20:14:58 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003703 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 26/04/2021 20:15:38 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET Name='Chofer', ColumnName='Chofer',Updated=TO_TIMESTAMP('2021-04-26 20:15:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003696
;

-- 26/04/2021 20:15:38 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003696
;

-- 26/04/2021 20:15:38 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Chofer', Description=NULL, Help=NULL WHERE AD_Column_ID=3003696 AND IsCentrallyMaintained='Y'
;

-- 26/04/2021 20:16:02 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element SET ColumnName='Chofer', Name='Chofer', PrintName='Chofer',Updated=TO_TIMESTAMP('2021-04-26 20:16:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001095
;

-- 26/04/2021 20:16:02 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001095
;

-- 26/04/2021 20:16:02 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ColumnName='Chofer', Name='Chofer', Description=NULL, Help=NULL WHERE AD_Element_ID=3001095
;

-- 26/04/2021 20:16:02 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='Chofer', Name='Chofer', Description=NULL, Help=NULL, AD_Element_ID=3001095 WHERE UPPER(ColumnName)='CHOFER' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 26/04/2021 20:16:02 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='Chofer', Name='Chofer', Description=NULL, Help=NULL WHERE AD_Element_ID=3001095 AND IsCentrallyMaintained='Y'
;

-- 26/04/2021 20:16:02 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Chofer', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001095) AND IsCentrallyMaintained='Y'
;

-- 26/04/2021 20:16:02 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_PrintFormatItem SET PrintName='Chofer', Name='Chofer' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001095)
;

-- 26/04/2021 20:16:08 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET Name='Chofer',PrintName='Chofer',Updated=TO_TIMESTAMP('2021-04-26 20:16:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001095 AND AD_Language='es_AR'
;

-- 26/04/2021 20:16:19 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET Name='Chofer',Updated=TO_TIMESTAMP('2021-04-26 20:16:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003696 AND AD_Language='es_AR'
;

-- 26/04/2021 20:17:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET Name='Condición del Flete', ColumnName='Condicion_Flete',Updated=TO_TIMESTAMP('2021-04-26 20:17:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003699
;

-- 26/04/2021 20:17:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003699
;

-- 26/04/2021 20:17:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Condición del Flete', Description=NULL, Help=NULL WHERE AD_Column_ID=3003699 AND IsCentrallyMaintained='Y'
;

-- 26/04/2021 20:17:24 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element SET ColumnName='Condicion_Flete', Name='Condición del Flete', PrintName='Condición del Flete',Updated=TO_TIMESTAMP('2021-04-26 20:17:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001098
;

-- 26/04/2021 20:17:24 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001098
;

-- 26/04/2021 20:17:24 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ColumnName='Condicion_Flete', Name='Condición del Flete', Description=NULL, Help=NULL WHERE AD_Element_ID=3001098
;

-- 26/04/2021 20:17:24 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='Condicion_Flete', Name='Condición del Flete', Description=NULL, Help=NULL, AD_Element_ID=3001098 WHERE UPPER(ColumnName)='CONDICION_FLETE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 26/04/2021 20:17:24 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='Condicion_Flete', Name='Condición del Flete', Description=NULL, Help=NULL WHERE AD_Element_ID=3001098 AND IsCentrallyMaintained='Y'
;

-- 26/04/2021 20:17:24 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Condición del Flete', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001098) AND IsCentrallyMaintained='Y'
;

-- 26/04/2021 20:17:24 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_PrintFormatItem SET PrintName='Condición del Flete', Name='Condición del Flete' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001098)
;

-- 26/04/2021 20:17:38 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET Name='Condición del Flete',PrintName='Condición del Flete',Updated=TO_TIMESTAMP('2021-04-26 20:17:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001098 AND AD_Language='es_AR'
;

-- 26/04/2021 20:18:03 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET Name='Condición del Flete',Updated=TO_TIMESTAMP('2021-04-26 20:18:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003699 AND AD_Language='es_AR'
;

-- 26/04/2021 20:18:23 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET Name='COT', ColumnName='COT',Updated=TO_TIMESTAMP('2021-04-26 20:18:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003703
;

-- 26/04/2021 20:18:23 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003703
;

-- 26/04/2021 20:18:23 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='COT', Description=NULL, Help=NULL WHERE AD_Column_ID=3003703 AND IsCentrallyMaintained='Y'
;

-- 26/04/2021 20:18:31 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element SET ColumnName='COT', Name='COT', PrintName='COT',Updated=TO_TIMESTAMP('2021-04-26 20:18:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001102
;

-- 26/04/2021 20:18:31 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001102
;

-- 26/04/2021 20:18:31 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ColumnName='COT', Name='COT', Description=NULL, Help=NULL WHERE AD_Element_ID=3001102
;

-- 26/04/2021 20:18:31 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='COT', Name='COT', Description=NULL, Help=NULL, AD_Element_ID=3001102 WHERE UPPER(ColumnName)='COT' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 26/04/2021 20:18:31 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='COT', Name='COT', Description=NULL, Help=NULL WHERE AD_Element_ID=3001102 AND IsCentrallyMaintained='Y'
;

-- 26/04/2021 20:18:31 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='COT', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001102) AND IsCentrallyMaintained='Y'
;

-- 26/04/2021 20:18:31 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_PrintFormatItem SET PrintName='COT', Name='COT' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001102)
;

-- 26/04/2021 20:18:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET Name='COT',PrintName='COT',Updated=TO_TIMESTAMP('2021-04-26 20:18:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001102 AND AD_Language='es_AR'
;

-- 26/04/2021 20:18:45 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET Name='COT',Updated=TO_TIMESTAMP('2021-04-26 20:18:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003703 AND AD_Language='es_AR'
;

-- 26/04/2021 20:19:35 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET Name='Domicilio del Transporte', ColumnName='Domicilio_Transporte',Updated=TO_TIMESTAMP('2021-04-26 20:19:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003700
;

-- 26/04/2021 20:19:35 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003700
;

-- 26/04/2021 20:19:35 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Domicilio del Transporte', Description=NULL, Help=NULL WHERE AD_Column_ID=3003700 AND IsCentrallyMaintained='Y'
;

-- 26/04/2021 20:19:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element SET ColumnName='Domicilio_Transporte', Name='Domicilio del Transporte', PrintName='Domicilio del Transporte',Updated=TO_TIMESTAMP('2021-04-26 20:19:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001099
;

-- 26/04/2021 20:19:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001099
;

-- 26/04/2021 20:19:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ColumnName='Domicilio_Transporte', Name='Domicilio del Transporte', Description=NULL, Help=NULL WHERE AD_Element_ID=3001099
;

-- 26/04/2021 20:19:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='Domicilio_Transporte', Name='Domicilio del Transporte', Description=NULL, Help=NULL, AD_Element_ID=3001099 WHERE UPPER(ColumnName)='DOMICILIO_TRANSPORTE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 26/04/2021 20:19:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='Domicilio_Transporte', Name='Domicilio del Transporte', Description=NULL, Help=NULL WHERE AD_Element_ID=3001099 AND IsCentrallyMaintained='Y'
;

-- 26/04/2021 20:19:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Domicilio del Transporte', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001099) AND IsCentrallyMaintained='Y'
;

-- 26/04/2021 20:19:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_PrintFormatItem SET PrintName='Domicilio del Transporte', Name='Domicilio del Transporte' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001099)
;

-- 26/04/2021 20:20:03 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET Name='Domicilio del Transporte',PrintName='Domicilio del Transporte',Updated=TO_TIMESTAMP('2021-04-26 20:20:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001099 AND AD_Language='es_AR'
;

-- 26/04/2021 20:20:12 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET Name='Domicilio del Transporte',Updated=TO_TIMESTAMP('2021-04-26 20:20:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003700 AND AD_Language='es_AR'
;

-- 26/04/2021 20:21:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET Name='Nro. Identificación', ColumnName='Identificacion_Transporte',Updated=TO_TIMESTAMP('2021-04-26 20:21:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003701
;

-- 26/04/2021 20:21:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003701
;

-- 26/04/2021 20:21:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Nro. Identificación', Description=NULL, Help=NULL WHERE AD_Column_ID=3003701 AND IsCentrallyMaintained='Y'
;

-- 26/04/2021 20:21:59 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET Name='Nro. Identificación',Updated=TO_TIMESTAMP('2021-04-26 20:21:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003701 AND AD_Language='es_AR'
;

-- 26/04/2021 20:22:20 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element SET ColumnName='Identificacion_Transporte', Name='Nro. Identificación', PrintName='Nro. Identificación',Updated=TO_TIMESTAMP('2021-04-26 20:22:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001100
;

-- 26/04/2021 20:22:20 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001100
;

-- 26/04/2021 20:22:20 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ColumnName='Identificacion_Transporte', Name='Nro. Identificación', Description=NULL, Help=NULL WHERE AD_Element_ID=3001100
;

-- 26/04/2021 20:22:20 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='Identificacion_Transporte', Name='Nro. Identificación', Description=NULL, Help=NULL, AD_Element_ID=3001100 WHERE UPPER(ColumnName)='IDENTIFICACION_TRANSPORTE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 26/04/2021 20:22:20 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='Identificacion_Transporte', Name='Nro. Identificación', Description=NULL, Help=NULL WHERE AD_Element_ID=3001100 AND IsCentrallyMaintained='Y'
;

-- 26/04/2021 20:22:20 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Nro. Identificación', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001100) AND IsCentrallyMaintained='Y'
;

-- 26/04/2021 20:22:20 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_PrintFormatItem SET PrintName='Nro. Identificación', Name='Nro. Identificación' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001100)
;

-- 26/04/2021 20:22:42 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET Name='Nro. Identificación',PrintName='Nro. Identificación',Updated=TO_TIMESTAMP('2021-04-26 20:22:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001100 AND AD_Language='es_AR'
;

-- 26/04/2021 20:24:34 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET Name='Patente', ColumnName='Patente',Updated=TO_TIMESTAMP('2021-04-26 20:24:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003697
;

-- 26/04/2021 20:24:34 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003697
;

-- 26/04/2021 20:24:34 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Patente', Description=NULL, Help=NULL WHERE AD_Column_ID=3003697 AND IsCentrallyMaintained='Y'
;

-- 26/04/2021 20:24:38 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET Name='Patente',Updated=TO_TIMESTAMP('2021-04-26 20:24:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003697 AND AD_Language='es_AR'
;

-- 26/04/2021 20:24:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element SET ColumnName='Patente', Name='Patente', PrintName='Patente',Updated=TO_TIMESTAMP('2021-04-26 20:24:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001096
;

-- 26/04/2021 20:24:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001096
;

-- 26/04/2021 20:24:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ColumnName='Patente', Name='Patente', Description=NULL, Help=NULL WHERE AD_Element_ID=3001096
;

-- 26/04/2021 20:24:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='Patente', Name='Patente', Description=NULL, Help=NULL, AD_Element_ID=3001096 WHERE UPPER(ColumnName)='PATENTE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 26/04/2021 20:24:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='Patente', Name='Patente', Description=NULL, Help=NULL WHERE AD_Element_ID=3001096 AND IsCentrallyMaintained='Y'
;

-- 26/04/2021 20:24:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Patente', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001096) AND IsCentrallyMaintained='Y'
;

-- 26/04/2021 20:24:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_PrintFormatItem SET PrintName='Patente', Name='Patente' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001096)
;

-- 26/04/2021 20:24:53 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET Name='Patente',PrintName='Patente',Updated=TO_TIMESTAMP('2021-04-26 20:24:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001096 AND AD_Language='es_AR'
;

-- 26/04/2021 20:25:40 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET Name='Patente Acoplado', ColumnName='Patente_Acoplado',Updated=TO_TIMESTAMP('2021-04-26 20:25:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003698
;

-- 26/04/2021 20:25:40 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003698
;

-- 26/04/2021 20:25:40 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Patente Acoplado', Description=NULL, Help=NULL WHERE AD_Column_ID=3003698 AND IsCentrallyMaintained='Y'
;

-- 26/04/2021 20:25:46 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET Name='Patente Acoplado',Updated=TO_TIMESTAMP('2021-04-26 20:25:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003698 AND AD_Language='es_AR'
;

-- 26/04/2021 20:25:58 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element SET ColumnName='Patente_Acoplado', Name='Patente Acoplado', PrintName='Patente Acoplado',Updated=TO_TIMESTAMP('2021-04-26 20:25:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001097
;

-- 26/04/2021 20:25:58 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001097
;

-- 26/04/2021 20:25:58 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ColumnName='Patente_Acoplado', Name='Patente Acoplado', Description=NULL, Help=NULL WHERE AD_Element_ID=3001097
;

-- 26/04/2021 20:25:58 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='Patente_Acoplado', Name='Patente Acoplado', Description=NULL, Help=NULL, AD_Element_ID=3001097 WHERE UPPER(ColumnName)='PATENTE_ACOPLADO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 26/04/2021 20:25:58 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='Patente_Acoplado', Name='Patente Acoplado', Description=NULL, Help=NULL WHERE AD_Element_ID=3001097 AND IsCentrallyMaintained='Y'
;

-- 26/04/2021 20:25:58 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Patente Acoplado', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001097) AND IsCentrallyMaintained='Y'
;

-- 26/04/2021 20:25:58 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_PrintFormatItem SET PrintName='Patente Acoplado', Name='Patente Acoplado' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001097)
;

-- 26/04/2021 20:26:03 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET Name='Patente Acoplado',PrintName='Patente Acoplado',Updated=TO_TIMESTAMP('2021-04-26 20:26:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001097 AND AD_Language='es_AR'
;

-- 26/04/2021 20:28:31 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000120,'T','LAR','N','LCO_TaxIDType_ID',0,0,100,TO_TIMESTAMP('2021-04-26 20:28:30','YYYY-MM-DD HH24:MI:SS'),'Y',TO_TIMESTAMP('2021-04-26 20:28:30','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/04/2021 20:28:31 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000120 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 26/04/2021 20:29:32 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Ref_Table (IsValueDisplayed,AD_Table_ID,AD_Reference_ID,AD_Key,AD_Display,EntityType,CreatedBy,Updated,Created,AD_Client_ID,UpdatedBy,AD_Org_ID,IsActive) VALUES ('N',1000008,3000120,1000134,1000144,'LAR',100,TO_TIMESTAMP('2021-04-26 20:29:32','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2021-04-26 20:29:32','YYYY-MM-DD HH24:MI:SS'),0,100,0,'Y')
;

-- 26/04/2021 20:30:11 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Ref_Table SET OrderByClause='LCO_TaxIDType.Name',Updated=TO_TIMESTAMP('2021-04-26 20:30:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=3000120
;

-- 26/04/2021 20:31:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET AD_Reference_Value_ID=3000120, AD_Reference_ID=18, Name='Tipo de Identificación', ColumnName='Tipo_Ident_Transporte_ID',Updated=TO_TIMESTAMP('2021-04-26 20:31:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003702
;

-- 26/04/2021 20:31:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003702
;

-- 26/04/2021 20:31:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Tipo de Identificación', Description=NULL, Help=NULL WHERE AD_Column_ID=3003702 AND IsCentrallyMaintained='Y'
;

-- 26/04/2021 20:31:15 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET Name='Tipo de Identificación',Updated=TO_TIMESTAMP('2021-04-26 20:31:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003702 AND AD_Language='es_AR'
;

-- 26/04/2021 20:31:41 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element SET ColumnName='Tipo_Ident_Transporte_ID', Name='Tipo de Identificación', PrintName='Tipo de Identificación',Updated=TO_TIMESTAMP('2021-04-26 20:31:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001101
;

-- 26/04/2021 20:31:41 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001101
;

-- 26/04/2021 20:31:41 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ColumnName='Tipo_Ident_Transporte_ID', Name='Tipo de Identificación', Description=NULL, Help=NULL WHERE AD_Element_ID=3001101
;

-- 26/04/2021 20:31:41 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='Tipo_Ident_Transporte_ID', Name='Tipo de Identificación', Description=NULL, Help=NULL, AD_Element_ID=3001101 WHERE UPPER(ColumnName)='TIPO_IDENT_TRANSPORTE_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 26/04/2021 20:31:41 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='Tipo_Ident_Transporte_ID', Name='Tipo de Identificación', Description=NULL, Help=NULL WHERE AD_Element_ID=3001101 AND IsCentrallyMaintained='Y'
;

-- 26/04/2021 20:31:41 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Tipo de Identificación', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001101) AND IsCentrallyMaintained='Y'
;

-- 26/04/2021 20:31:41 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_PrintFormatItem SET PrintName='Tipo de Identificación', Name='Tipo de Identificación' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001101)
;

-- 26/04/2021 20:31:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET Name='Tipo de Identificación',PrintName='Tipo de Identificación',Updated=TO_TIMESTAMP('2021-04-26 20:31:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001101 AND AD_Language='es_AR'
;

-- 26/04/2021 20:34:36 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007007,60,'Y','N','N',3003696,'N','Y',257,'N','LAR','Chofer',100,0,TO_TIMESTAMP('2021-04-26 20:34:36','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-04-26 20:34:36','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/04/2021 20:34:36 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007007 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 26/04/2021 20:34:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007008,60,'Y','N','N',3003699,'N','Y',257,'N','LAR','Condición del Flete',100,0,TO_TIMESTAMP('2021-04-26 20:34:36','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-04-26 20:34:36','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/04/2021 20:34:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007008 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 26/04/2021 20:34:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007009,60,'Y','N','N',3003703,'N','Y',257,'N','LAR','COT',100,0,TO_TIMESTAMP('2021-04-26 20:34:37','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-04-26 20:34:37','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/04/2021 20:34:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007009 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 26/04/2021 20:34:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007010,60,'Y','N','N',3003700,'N','Y',257,'N','LAR','Domicilio del Transporte',100,0,TO_TIMESTAMP('2021-04-26 20:34:37','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-04-26 20:34:37','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/04/2021 20:34:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007010 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 26/04/2021 20:34:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007011,15,'Y','N','N',3003701,'N','Y',257,'N','LAR','Nro. Identificación',100,0,TO_TIMESTAMP('2021-04-26 20:34:37','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-04-26 20:34:37','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/04/2021 20:34:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007011 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 26/04/2021 20:34:38 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007012,10,'Y','N','N',3003697,'N','Y',257,'N','LAR','Patente',100,0,TO_TIMESTAMP('2021-04-26 20:34:37','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-04-26 20:34:37','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/04/2021 20:34:38 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007012 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 26/04/2021 20:34:38 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007013,10,'Y','N','N',3003698,'N','Y',257,'N','LAR','Patente Acoplado',100,0,TO_TIMESTAMP('2021-04-26 20:34:38','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-04-26 20:34:38','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/04/2021 20:34:38 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007013 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 26/04/2021 20:34:38 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007014,10,'Y','N','N',3003702,'N','Y',257,'N','LAR','Tipo de Identificación',100,0,TO_TIMESTAMP('2021-04-26 20:34:38','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-04-26 20:34:38','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/04/2021 20:34:38 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007014 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 26/04/2021 20:42:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3007004
;

-- 26/04/2021 20:42:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3007007
;

-- 26/04/2021 20:42:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3007008
;

-- 26/04/2021 20:42:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3007009
;

-- 26/04/2021 20:42:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3007010
;

-- 26/04/2021 20:42:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3007011
;

-- 26/04/2021 20:42:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3007012
;

-- 26/04/2021 20:42:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3007013
;

-- 26/04/2021 20:42:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3007014
;

-- 26/04/2021 20:42:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3007015
;

-- 26/04/2021 20:42:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=55419
;

-- 26/04/2021 20:42:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=55429
;

-- 26/04/2021 20:42:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=55430
;

-- 26/04/2021 20:42:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=55431
;

-- 26/04/2021 20:42:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=4243
;

-- 26/04/2021 20:42:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=2930
;

-- 26/04/2021 20:42:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=2933
;

-- 26/04/2021 20:42:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=7831
;

-- 26/04/2021 20:42:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=7829
;

-- 26/04/2021 20:42:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=7830
;

-- 26/04/2021 20:42:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=7832
;

-- 26/04/2021 20:42:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=7828
;

-- 26/04/2021 20:42:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=7827
;

-- 26/04/2021 20:42:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=2707
;

-- 26/04/2021 20:42:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=10369
;

-- 26/04/2021 20:42:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=9463
;

-- 26/04/2021 20:42:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=9462
;

-- 26/04/2021 20:42:45 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3280
;

-- 26/04/2021 20:42:45 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3281
;

-- 26/04/2021 20:42:45 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=10568
;

-- 26/04/2021 20:42:45 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=5143
;

-- 26/04/2021 20:42:45 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3001593
;

-- 26/04/2021 20:42:45 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3001592
;

-- 26/04/2021 20:44:19 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=S',Updated=TO_TIMESTAMP('2021-04-26 20:44:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007004
;

-- 26/04/2021 20:44:25 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=S',Updated=TO_TIMESTAMP('2021-04-26 20:44:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007007
;

-- 26/04/2021 20:44:32 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=S',Updated=TO_TIMESTAMP('2021-04-26 20:44:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007008
;

-- 26/04/2021 20:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=S',Updated=TO_TIMESTAMP('2021-04-26 20:44:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007009
;

-- 26/04/2021 20:44:42 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=S',Updated=TO_TIMESTAMP('2021-04-26 20:44:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007010
;

-- 26/04/2021 20:44:50 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=S',Updated=TO_TIMESTAMP('2021-04-26 20:44:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007011
;

-- 26/04/2021 20:44:53 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=S',Updated=TO_TIMESTAMP('2021-04-26 20:44:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007012
;

-- 26/04/2021 20:44:59 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=S',Updated=TO_TIMESTAMP('2021-04-26 20:44:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007013
;

-- 26/04/2021 20:45:04 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=S',Updated=TO_TIMESTAMP('2021-04-26 20:45:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007014
;

-- 26/04/2021 20:45:06 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=S',Updated=TO_TIMESTAMP('2021-04-26 20:45:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007015
;

-- 26/04/2021 20:50:17 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3007015
;

-- 26/04/2021 20:50:17 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3007014
;

-- 26/04/2021 20:50:17 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3007011
;

-- 26/04/2021 20:50:17 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3007012
;

-- 26/04/2021 20:50:17 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3007013
;

-- 26/04/2021 20:50:17 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3007008
;

-- 26/04/2021 20:50:17 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3007010
;

-- 26/04/2021 20:50:17 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3007004
;

-- 26/04/2021 20:50:17 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3007009
;

-- 26/04/2021 20:50:33 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2021-04-26 20:50:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007007
;

-- 26/04/2021 20:50:39 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2021-04-26 20:50:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007011
;

-- 26/04/2021 20:50:46 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2021-04-26 20:50:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007013
;

-- 26/04/2021 20:50:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2021-04-26 20:50:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007010
;

-- 26/04/2021 20:51:08 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2021-04-26 20:51:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007009
;

-- 26/04/2021 20:51:21 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET AD_FieldGroup_ID=124,Updated=TO_TIMESTAMP('2021-04-26 20:51:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007009
;

-- 26/04/2021 20:51:26 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET AD_FieldGroup_ID=124,Updated=TO_TIMESTAMP('2021-04-26 20:51:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007004
;

-- 26/04/2021 20:51:30 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET AD_FieldGroup_ID=124,Updated=TO_TIMESTAMP('2021-04-26 20:51:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007010
;

-- 26/04/2021 20:51:34 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET AD_FieldGroup_ID=124,Updated=TO_TIMESTAMP('2021-04-26 20:51:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007008
;

-- 26/04/2021 20:51:39 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET AD_FieldGroup_ID=124,Updated=TO_TIMESTAMP('2021-04-26 20:51:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007013
;

-- 26/04/2021 20:51:43 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET AD_FieldGroup_ID=124,Updated=TO_TIMESTAMP('2021-04-26 20:51:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007012
;

-- 26/04/2021 20:51:48 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET AD_FieldGroup_ID=124,Updated=TO_TIMESTAMP('2021-04-26 20:51:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007011
;

-- 26/04/2021 20:51:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET AD_FieldGroup_ID=124,Updated=TO_TIMESTAMP('2021-04-26 20:51:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007014
;

-- 26/04/2021 20:51:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET AD_FieldGroup_ID=124,Updated=TO_TIMESTAMP('2021-04-26 20:51:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007007
;

-- 26/04/2021 20:52:01 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET AD_FieldGroup_ID=124,Updated=TO_TIMESTAMP('2021-04-26 20:52:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007015
;

-- 26/04/2021 20:53:31 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2021-04-26 20:53:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007015
;

-- 26/04/2021 20:53:36 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2021-04-26 20:53:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007007
;

-- 26/04/2021 20:53:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2021-04-26 20:53:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007008
;

-- 26/04/2021 20:53:56 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2021-04-26 20:53:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007010
;

-- 26/04/2021 20:54:04 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2021-04-26 20:54:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007009
;

-- 26/04/2021 22:15:27 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2021-04-26 22:15:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007007
;

-- 27/04/2021 19:12:25 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003718,259,'LAR',0,'N','N','N','N',60,'N',10,'N',3001095,'N','Y','N','Chofer','Chofer',TO_TIMESTAMP('2021-04-27 19:12:24','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2021-04-27 19:12:24','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 19:12:25 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003718 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/04/2021 19:12:25 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003719,259,'LAR',0,'N','N','N','N',10,'N',10,'N',3001096,'N','Y','N','Patente','Patente',TO_TIMESTAMP('2021-04-27 19:12:25','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2021-04-27 19:12:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 19:12:25 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003719 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/04/2021 19:12:26 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003720,259,'LAR',0,'N','N','N','N',10,'N',10,'N',3001097,'N','Y','N','Patente Acoplado','Patente_Acoplado',TO_TIMESTAMP('2021-04-27 19:12:25','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2021-04-27 19:12:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 19:12:26 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003720 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/04/2021 19:12:26 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003721,259,'LAR',0,'N','N','N','N',60,'N',10,'N',3001098,'N','Y','N','Condición del Flete','Condicion_Flete',TO_TIMESTAMP('2021-04-27 19:12:26','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2021-04-27 19:12:26','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 19:12:26 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003721 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/04/2021 19:12:26 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003722,259,'LAR',0,'N','N','N','N',60,'N',10,'N',3001099,'N','Y','N','Domicilio del Transporte','Domicilio_Transporte',TO_TIMESTAMP('2021-04-27 19:12:26','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2021-04-27 19:12:26','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 19:12:26 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003722 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/04/2021 19:12:26 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003723,259,'LAR',0,'N','N','N','N',15,'N',10,'N',3001100,'N','Y','N','Nro. Identificación','Identificacion_Transporte',TO_TIMESTAMP('2021-04-27 19:12:26','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2021-04-27 19:12:26','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 19:12:26 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003723 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/04/2021 19:12:27 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003724,259,'LAR',0,'N','N','N','N',10,'N',19,'N',3001101,'N','Y','N','Tipo de Identificación','Tipo_Ident_Transporte_ID',TO_TIMESTAMP('2021-04-27 19:12:26','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2021-04-27 19:12:26','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 19:12:27 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003724 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/04/2021 19:12:27 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003725,259,'LAR',0,'N','N','N','N',60,'N',10,'N',3001102,'N','Y','N','COT','COT',TO_TIMESTAMP('2021-04-27 19:12:27','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2021-04-27 19:12:27','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 19:12:27 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003725 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/04/2021 19:13:02 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007026,60,'Y','N','N',3003718,'N','Y',186,'N','LAR','Chofer',100,0,TO_TIMESTAMP('2021-04-27 19:13:02','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-04-27 19:13:02','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 19:13:02 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007026 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/04/2021 19:13:03 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007027,60,'Y','N','N',3003721,'N','Y',186,'N','LAR','Condición del Flete',100,0,TO_TIMESTAMP('2021-04-27 19:13:02','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-04-27 19:13:02','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 19:13:03 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007027 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/04/2021 19:13:03 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007028,60,'Y','N','N',3003725,'N','Y',186,'N','LAR','COT',100,0,TO_TIMESTAMP('2021-04-27 19:13:03','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-04-27 19:13:03','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 19:13:03 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007028 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/04/2021 19:13:03 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007029,60,'Y','N','N',3003722,'N','Y',186,'N','LAR','Domicilio del Transporte',100,0,TO_TIMESTAMP('2021-04-27 19:13:03','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-04-27 19:13:03','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 19:13:03 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007029 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/04/2021 19:13:03 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007030,15,'Y','N','N',3003723,'N','Y',186,'N','LAR','Nro. Identificación',100,0,TO_TIMESTAMP('2021-04-27 19:13:03','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-04-27 19:13:03','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 19:13:03 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007030 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/04/2021 19:13:04 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007031,10,'Y','N','N',3003719,'N','Y',186,'N','LAR','Patente',100,0,TO_TIMESTAMP('2021-04-27 19:13:03','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-04-27 19:13:03','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 19:13:04 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007031 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/04/2021 19:13:04 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007032,10,'Y','N','N',3003720,'N','Y',186,'N','LAR','Patente Acoplado',100,0,TO_TIMESTAMP('2021-04-27 19:13:04','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-04-27 19:13:04','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 19:13:04 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007032 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/04/2021 19:13:04 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007033,10,'Y','N','N',3003724,'N','Y',186,'N','LAR','Tipo de Identificación',100,0,TO_TIMESTAMP('2021-04-27 19:13:04','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-04-27 19:13:04','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 19:13:04 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007033 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/04/2021 19:13:42 ART
-- ISSUE #140: Solicitud de COT, para remitos.
DELETE FROM AD_Field_Trl WHERE AD_Field_ID=3007028
;

-- 27/04/2021 19:13:43 ART
-- ISSUE #140: Solicitud de COT, para remitos.
DELETE FROM AD_Field WHERE AD_Field_ID=3007028
;

-- 27/04/2021 19:14:01 ART
-- ISSUE #140: Solicitud de COT, para remitos.
DELETE FROM AD_Column_Trl WHERE AD_Column_ID=3003725
;

-- 27/04/2021 19:14:01 ART
-- ISSUE #140: Solicitud de COT, para remitos.
DELETE FROM AD_Column WHERE AD_Column_ID=3003725
;

-- 27/04/2021 19:15:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3007026
;

-- 27/04/2021 19:15:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3007027
;

-- 27/04/2021 19:15:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3007029
;

-- 27/04/2021 19:15:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3007030
;

-- 27/04/2021 19:15:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3007031
;

-- 27/04/2021 19:15:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3007032
;

-- 27/04/2021 19:15:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3007033
;

-- 27/04/2021 19:15:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=1104
;

-- 27/04/2021 19:15:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3006998
;

-- 27/04/2021 19:15:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=1077
;

-- 27/04/2021 19:15:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=1103
;

-- 27/04/2021 19:15:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=8653
;

-- 27/04/2021 19:15:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3005559
;

-- 27/04/2021 19:15:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=1098
;

-- 27/04/2021 19:15:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3272
;

-- 27/04/2021 19:15:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=2112
;

-- 27/04/2021 19:15:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=2109
;

-- 27/04/2021 19:15:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3113
;

-- 27/04/2021 19:15:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=1099
;

-- 27/04/2021 19:15:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=56906
;

-- 27/04/2021 19:15:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3001993
;

-- 27/04/2021 19:15:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=2593
;

-- 27/04/2021 19:15:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=2589
;

-- 27/04/2021 19:15:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=1324
;

-- 27/04/2021 19:15:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=7038
;

-- 27/04/2021 19:15:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=7826
;

-- 27/04/2021 19:15:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=7825
;

-- 27/04/2021 19:15:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=2594
;

-- 27/04/2021 19:15:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=1112
;

-- 27/04/2021 19:15:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=1113
;

-- 27/04/2021 19:15:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=1082
;

-- 27/04/2021 19:15:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=60972
;

-- 27/04/2021 19:15:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=1084
;

-- 27/04/2021 19:15:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=60922
;

-- 27/04/2021 19:15:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=6560
;

-- 27/04/2021 19:15:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=1083
;

-- 27/04/2021 19:15:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3660
;

-- 27/04/2021 19:15:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=1090
;

-- 27/04/2021 19:15:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=680,IsDisplayed='Y' WHERE AD_Field_ID=3001597
;

-- 27/04/2021 19:16:18 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@OrderType@=''WP''',Updated=TO_TIMESTAMP('2021-04-27 19:16:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=1108
;

-- 27/04/2021 19:18:24 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=''S'' & @OrderType@=''PW''',Updated=TO_TIMESTAMP('2021-04-27 19:18:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=1109
;

-- 27/04/2021 19:18:48 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=''S'' & @OrderType@=''PW''',Updated=TO_TIMESTAMP('2021-04-27 19:18:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007026
;

-- 27/04/2021 19:18:54 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=''S'' & @OrderType@=''PW''',Updated=TO_TIMESTAMP('2021-04-27 19:18:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007027
;

-- 27/04/2021 19:18:58 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=''S'' & @OrderType@=''PW''',Updated=TO_TIMESTAMP('2021-04-27 19:18:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007029
;

-- 27/04/2021 19:19:02 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=''S'' & @OrderType@=''PW''',Updated=TO_TIMESTAMP('2021-04-27 19:19:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007030
;

-- 27/04/2021 19:19:06 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=''S'' & @OrderType@=''PW''',Updated=TO_TIMESTAMP('2021-04-27 19:19:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007031
;

-- 27/04/2021 19:19:12 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsSameLine='Y', DisplayLogic='@DeliveryViaRule@=''S'' & @OrderType@=''PW''',Updated=TO_TIMESTAMP('2021-04-27 19:19:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007032
;

-- 27/04/2021 19:19:19 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=''S'' & @OrderType@=''PW''',Updated=TO_TIMESTAMP('2021-04-27 19:19:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007033
;

-- 27/04/2021 19:19:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET AD_FieldGroup_ID=124,Updated=TO_TIMESTAMP('2021-04-27 19:19:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007033
;

-- 27/04/2021 19:19:42 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET AD_FieldGroup_ID=124,Updated=TO_TIMESTAMP('2021-04-27 19:19:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007032
;

-- 27/04/2021 19:19:47 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET AD_FieldGroup_ID=124,Updated=TO_TIMESTAMP('2021-04-27 19:19:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007031
;

-- 27/04/2021 19:19:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET AD_FieldGroup_ID=124,Updated=TO_TIMESTAMP('2021-04-27 19:19:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007030
;

-- 27/04/2021 19:19:55 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET AD_FieldGroup_ID=124,Updated=TO_TIMESTAMP('2021-04-27 19:19:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007029
;

-- 27/04/2021 19:19:59 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET AD_FieldGroup_ID=124,Updated=TO_TIMESTAMP('2021-04-27 19:19:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007027
;

-- 27/04/2021 19:20:04 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET AD_FieldGroup_ID=124,Updated=TO_TIMESTAMP('2021-04-27 19:20:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007026
;

-- 27/04/2021 19:20:47 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLength=20, IsSameLine='Y',Updated=TO_TIMESTAMP('2021-04-27 19:20:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007026
;

-- 27/04/2021 19:20:54 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3007026
;

-- 27/04/2021 19:20:54 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=2878
;

-- 27/04/2021 19:20:55 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=56446
;

-- 27/04/2021 19:20:55 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=1107
;

-- 27/04/2021 19:21:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3007029
;

-- 27/04/2021 19:21:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3007030
;

-- 27/04/2021 19:21:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3007031
;

-- 27/04/2021 19:21:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3007032
;

-- 27/04/2021 19:21:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3007033
;

-- 27/04/2021 19:21:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=2878
;

-- 27/04/2021 19:21:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=56446
;

-- 27/04/2021 19:21:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=1107
;

-- 27/04/2021 19:21:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3007027
;

-- 27/04/2021 19:21:43 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3007033
;

-- 27/04/2021 19:21:43 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3007029
;

-- 27/04/2021 19:21:43 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3007027
;

-- 27/04/2021 19:21:43 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=2878
;

-- 27/04/2021 19:21:43 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=56446
;

-- 27/04/2021 19:21:43 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=1107
;

-- 27/04/2021 19:22:16 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2021-04-27 19:22:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007030
;

-- 27/04/2021 19:22:36 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2021-04-27 19:22:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007029
;

-- 27/04/2021 19:22:46 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2021-04-27 19:22:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007027
;

-- 27/04/2021 19:22:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2021-04-27 19:22:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007029
;

-- 27/04/2021 19:22:55 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3007027
;

-- 27/04/2021 19:22:55 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3007029
;

-- 27/04/2021 19:23:26 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET AD_Reference_Value_ID=3000120, AD_Reference_ID=18,Updated=TO_TIMESTAMP('2021-04-27 19:23:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003724
;

-- 27/04/2021 19:26:05 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=''S'' & @OrderType@=''WP''',Updated=TO_TIMESTAMP('2021-04-27 19:26:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007033
;

-- 27/04/2021 19:26:19 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=''S'' & @OrderType@=''WP''',Updated=TO_TIMESTAMP('2021-04-27 19:26:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007030
;

-- 27/04/2021 19:26:26 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=''S'' & @OrderType@=''WP''',Updated=TO_TIMESTAMP('2021-04-27 19:26:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007031
;

-- 27/04/2021 19:26:31 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=''S'' & @OrderType@=''WP''',Updated=TO_TIMESTAMP('2021-04-27 19:26:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007032
;

-- 27/04/2021 19:26:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=''S'' & @OrderType@=''WP''',Updated=TO_TIMESTAMP('2021-04-27 19:26:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007027
;

-- 27/04/2021 19:26:43 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=''S'' & @OrderType@=''WP''',Updated=TO_TIMESTAMP('2021-04-27 19:26:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007029
;

-- 27/04/2021 19:26:58 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=''S'' & @OrderType@=''WP''',Updated=TO_TIMESTAMP('2021-04-27 19:26:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007026
;

-- 27/04/2021 19:27:06 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=''S'' & @OrderType@=''WP''',Updated=TO_TIMESTAMP('2021-04-27 19:27:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=1109
;

-- 27/04/2021 19:29:12 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET AD_FieldGroup_ID=124,Updated=TO_TIMESTAMP('2021-04-27 19:29:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=1109
;

-- 27/04/2021 19:29:21 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2021-04-27 19:29:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=1109
;

-- 07/05/2021 16:52:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001109,'codigointegridadcot','LAR','codigointegridadcot','codigointegridadcot',0,TO_TIMESTAMP('2021-05-07 16:52:51','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2021-05-07 16:52:51','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 07/05/2021 16:52:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001109 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 07/05/2021 16:52:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003728,319,'LAR',0,'N','N','N','N',60,'N',10,'N',3001109,'N','Y','N','codigointegridadcot','codigointegridadcot',TO_TIMESTAMP('2021-05-07 16:52:51','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2021-05-07 16:52:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 07/05/2021 16:52:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003728 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 07/05/2021 16:52:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001110,'numerocomprobantecot','LAR','numerocomprobantecot','numerocomprobantecot',0,TO_TIMESTAMP('2021-05-07 16:52:52','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2021-05-07 16:52:52','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 07/05/2021 16:52:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001110 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 07/05/2021 16:52:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003729,319,'LAR',0,'N','N','N','N',30,'N',10,'N',3001110,'N','Y','N','numerocomprobantecot','numerocomprobantecot',TO_TIMESTAMP('2021-05-07 16:52:52','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2021-05-07 16:52:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 07/05/2021 16:52:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003729 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 07/05/2021 16:52:53 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001111,'errorcot','LAR','errorcot','errorcot',0,TO_TIMESTAMP('2021-05-07 16:52:52','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2021-05-07 16:52:52','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 07/05/2021 16:52:53 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001111 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 07/05/2021 16:52:53 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003730,319,'LAR',0,'N','N','N','N',255,'N',10,'N',3001111,'N','Y','N','errorcot','errorcot',TO_TIMESTAMP('2021-05-07 16:52:52','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2021-05-07 16:52:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 07/05/2021 16:52:53 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003730 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 07/05/2021 16:53:45 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET Name='Codigo de Integridad COT', ColumnName='CodigoIntegridadCOT',Updated=TO_TIMESTAMP('2021-05-07 16:53:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003728
;

-- 07/05/2021 16:53:45 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003728
;

-- 07/05/2021 16:53:45 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Codigo de Integridad COT', Description=NULL, Help=NULL WHERE AD_Column_ID=3003728 AND IsCentrallyMaintained='Y'
;

-- 07/05/2021 16:54:03 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET Name='Codigo de Integridad COT',Updated=TO_TIMESTAMP('2021-05-07 16:54:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003728 AND AD_Language='es_AR'
;

-- 07/05/2021 16:54:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element SET ColumnName='CodigoIntegridadCOT', Name='Codigo de Integridad COT', PrintName='Codigo de Integridad COT',Updated=TO_TIMESTAMP('2021-05-07 16:54:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001109
;

-- 07/05/2021 16:54:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001109
;

-- 07/05/2021 16:54:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ColumnName='CodigoIntegridadCOT', Name='Codigo de Integridad COT', Description=NULL, Help=NULL WHERE AD_Element_ID=3001109
;

-- 07/05/2021 16:54:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='CodigoIntegridadCOT', Name='Codigo de Integridad COT', Description=NULL, Help=NULL, AD_Element_ID=3001109 WHERE UPPER(ColumnName)='CODIGOINTEGRIDADCOT' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 07/05/2021 16:54:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='CodigoIntegridadCOT', Name='Codigo de Integridad COT', Description=NULL, Help=NULL WHERE AD_Element_ID=3001109 AND IsCentrallyMaintained='Y'
;

-- 07/05/2021 16:54:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Codigo de Integridad COT', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001109) AND IsCentrallyMaintained='Y'
;

-- 07/05/2021 16:54:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_PrintFormatItem SET PrintName='Codigo de Integridad COT', Name='Codigo de Integridad COT' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001109)
;

-- 07/05/2021 16:54:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET Name='Codigo de Integridad COT',PrintName='Codigo de Integridad COT',Updated=TO_TIMESTAMP('2021-05-07 16:54:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001109 AND AD_Language='es_AR'
;

-- 07/05/2021 16:55:21 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ColumnName='ErrorCOT',Updated=TO_TIMESTAMP('2021-05-07 16:55:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003730
;

-- 07/05/2021 16:55:25 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET Name='ErrorCOT',Updated=TO_TIMESTAMP('2021-05-07 16:55:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003730
;

-- 07/05/2021 16:55:25 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003730
;

-- 07/05/2021 16:55:25 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='ErrorCOT', Description=NULL, Help=NULL WHERE AD_Column_ID=3003730 AND IsCentrallyMaintained='Y'
;

-- 07/05/2021 16:55:29 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET Name='ErrorCOT',Updated=TO_TIMESTAMP('2021-05-07 16:55:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003730 AND AD_Language='es_AR'
;

-- 07/05/2021 16:55:38 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET Name='Error COT',Updated=TO_TIMESTAMP('2021-05-07 16:55:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003730
;

-- 07/05/2021 16:55:38 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003730
;

-- 07/05/2021 16:55:38 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Error COT', Description=NULL, Help=NULL WHERE AD_Column_ID=3003730 AND IsCentrallyMaintained='Y'
;

-- 07/05/2021 16:55:50 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element SET ColumnName='ErrorCOT', Name='Error COT', PrintName='Error COT',Updated=TO_TIMESTAMP('2021-05-07 16:55:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001111
;

-- 07/05/2021 16:55:50 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001111
;

-- 07/05/2021 16:55:50 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ColumnName='ErrorCOT', Name='Error COT', Description=NULL, Help=NULL WHERE AD_Element_ID=3001111
;

-- 07/05/2021 16:55:50 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='ErrorCOT', Name='Error COT', Description=NULL, Help=NULL, AD_Element_ID=3001111 WHERE UPPER(ColumnName)='ERRORCOT' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 07/05/2021 16:55:50 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='ErrorCOT', Name='Error COT', Description=NULL, Help=NULL WHERE AD_Element_ID=3001111 AND IsCentrallyMaintained='Y'
;

-- 07/05/2021 16:55:50 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Error COT', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001111) AND IsCentrallyMaintained='Y'
;

-- 07/05/2021 16:55:50 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_PrintFormatItem SET PrintName='Error COT', Name='Error COT' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001111)
;

-- 07/05/2021 16:56:02 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET Name='Error COT',PrintName='Error COT',Updated=TO_TIMESTAMP('2021-05-07 16:56:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001111 AND AD_Language='es_AR'
;

-- 07/05/2021 16:57:36 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET Name='Número de Comprobante COT', ColumnName='NumeroComprobanteCOT',Updated=TO_TIMESTAMP('2021-05-07 16:57:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003729
;

-- 07/05/2021 16:57:36 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003729
;

-- 07/05/2021 16:57:36 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Número de Comprobante COT', Description=NULL, Help=NULL WHERE AD_Column_ID=3003729 AND IsCentrallyMaintained='Y'
;

-- 07/05/2021 16:57:40 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET Name='Número de Comprobante COT',Updated=TO_TIMESTAMP('2021-05-07 16:57:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003729 AND AD_Language='es_AR'
;

-- 07/05/2021 16:58:02 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element SET ColumnName='NumeroComprobanteCOT', Name='Número de Comprobante COT', PrintName='Número de Comprobante COT',Updated=TO_TIMESTAMP('2021-05-07 16:58:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001110
;

-- 07/05/2021 16:58:02 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001110
;

-- 07/05/2021 16:58:02 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ColumnName='NumeroComprobanteCOT', Name='Número de Comprobante COT', Description=NULL, Help=NULL WHERE AD_Element_ID=3001110
;

-- 07/05/2021 16:58:02 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='NumeroComprobanteCOT', Name='Número de Comprobante COT', Description=NULL, Help=NULL, AD_Element_ID=3001110 WHERE UPPER(ColumnName)='NUMEROCOMPROBANTECOT' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 07/05/2021 16:58:02 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='NumeroComprobanteCOT', Name='Número de Comprobante COT', Description=NULL, Help=NULL WHERE AD_Element_ID=3001110 AND IsCentrallyMaintained='Y'
;

-- 07/05/2021 16:58:02 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Número de Comprobante COT', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001110) AND IsCentrallyMaintained='Y'
;

-- 07/05/2021 16:58:02 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_PrintFormatItem SET PrintName='Número de Comprobante COT', Name='Número de Comprobante COT' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001110)
;

-- 07/05/2021 16:58:06 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET Name='Número de Comprobante COT',PrintName='Número de Comprobante COT',Updated=TO_TIMESTAMP('2021-05-07 16:58:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001110 AND AD_Language='es_AR'
;



-- Registración de script
SELECT register_migration_script_lar('0169_ISSUE-140.sql', 'LAR', '')
;
