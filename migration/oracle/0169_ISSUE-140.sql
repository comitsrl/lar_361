ALTER TABLE M_InOut ADD COLUMN SolicitarCOT character(1) DEFAULT 'N'::bpchar;

ALTER TABLE C_UOM ADD COLUMN CodigoCOT character(1);

ALTER TABLE C_Region ADD COLUMN CodigoCOT character(1);

-- 21/04/2021 19:34:24 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001092,'solicitarcot','LAR','solicitarcot','solicitarcot',0,TO_DATE('2021-04-21 19:34:24','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-04-21 19:34:24','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 21/04/2021 19:34:24 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001092 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 21/04/2021 19:34:25 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003692,319,'LAR',0,'N','N','N','N',1,'N',20,'N',3001092,'N','Y','N','solicitarcot','solicitarcot',TO_DATE('2021-04-21 19:34:24','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2021-04-21 19:34:24','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/04/2021 19:34:25 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003692 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/04/2021 19:34:58 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET Name='Solicitar COT', ColumnName='SolicitarCOT',Updated=TO_DATE('2021-04-21 19:34:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003692
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
UPDATE AD_Element SET ColumnName='SolicitarCOT', Name='Solicitar COT', PrintName='Solicitar COT',Updated=TO_DATE('2021-04-21 19:35:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001092
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
UPDATE AD_PrintFormatItem pi SET PrintName='Solicitar COT', Name='Solicitar COT' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001092)
;

-- 21/04/2021 19:35:45 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET Name='Solicitar COT',PrintName='Solicitar COT',Updated=TO_DATE('2021-04-21 19:35:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001092 AND AD_Language='es_AR'
;

-- 21/04/2021 19:36:12 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET Name='Solicitar COT',Updated=TO_DATE('2021-04-21 19:36:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003692 AND AD_Language='es_AR'
;

-- 21/04/2021 19:38:33 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Process (AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Classname,CopyFromProcess,Value,Name,AD_Org_ID,AD_Client_ID,UpdatedBy,CreatedBy,Updated,Created,IsActive) VALUES (3000413,'N','N','3','N','N','Y','LAR',0,0,'ar.com.ergio.process.LAR_SolicitarCOT','N','10000000','LAR_SolicitarCOT',0,0,100,100,TO_DATE('2021-04-21 19:38:32','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-04-21 19:38:32','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 21/04/2021 19:38:33 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000413 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 21/04/2021 19:39:58 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000689,0,3000413,100,'N',13,10,'N','LAR','M_InOut_ID','M_InOut_ID','Y',0,100,TO_DATE('2021-04-21 19:39:57','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-04-21 19:39:57','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 21/04/2021 19:39:58 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000689 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 21/04/2021 19:40:20 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process SET ShowHelp='S',Updated=TO_DATE('2021-04-21 19:40:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000413
;

-- 21/04/2021 19:40:56 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET AD_Reference_ID=28, AD_Process_ID=3000413,Updated=TO_DATE('2021-04-21 19:40:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003692
;

-- 21/04/2021 19:42:05 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007002,20,'Y','N','N',59044,'N','Y',257,'N','The ProcessedOn Date+Time save the exact moment (nanoseconds precision if allowed by the DB) when a document has been processed.','D','The date+time (expressed in decimal format) when the document has been processed','Processed On',100,0,TO_DATE('2021-04-21 19:42:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-04-21 19:42:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/04/2021 19:42:05 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007002 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/04/2021 19:42:06 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007003,22,'Y','N','N',55303,'N','Y',257,'N','D','ID of document reversal','Reversal ID',100,0,TO_DATE('2021-04-21 19:42:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-04-21 19:42:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/04/2021 19:42:06 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007003 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/04/2021 19:42:06 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007004,1,'Y','N','N',3003692,'N','Y',257,'N','LAR','Solicitar COT',100,0,TO_DATE('2021-04-21 19:42:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-04-21 19:42:06','YYYY-MM-DD HH24:MI:SS'),100)
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
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_DATE('2021-04-21 19:43:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003692
;

-- 21/04/2021 20:19:23 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET DefaultValue='@M_InOut_ID@',Updated=TO_DATE('2021-04-21 20:19:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000689
;

-- 21/04/2021 20:39:42 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000260,3000002,'LAR','088','Remito Electrónico',TO_DATE('2021-04-21 20:39:41','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2021-04-21 20:39:41','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 21/04/2021 20:39:42 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000260 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 21/04/2021 21:07:09 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001093,'codigocot','LAR','codigocot','codigocot',0,TO_DATE('2021-04-21 21:07:09','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-04-21 21:07:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 21/04/2021 21:07:09 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001093 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 21/04/2021 21:07:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003693,146,'LAR',0,'N','N','N','N',1,'N',20,'N',3001093,'N','Y','N','codigocot','codigocot',TO_DATE('2021-04-21 21:07:09','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2021-04-21 21:07:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/04/2021 21:07:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003693 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/04/2021 21:11:42 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET AD_Reference_ID=14, Name='Codigo COT', ColumnName='CodigoCOT',Updated=TO_DATE('2021-04-21 21:11:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003693
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
UPDATE AD_Element SET ColumnName='CodigoCOT', Name='Codigo COT', PrintName='Codigo COT',Updated=TO_DATE('2021-04-21 21:12:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001093
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
UPDATE AD_PrintFormatItem pi SET PrintName='Codigo COT', Name='Codigo COT' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001093)
;

-- 21/04/2021 21:12:07 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET Name='Codigo COT',PrintName='Codigo COT',Updated=TO_DATE('2021-04-21 21:12:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001093 AND AD_Language='es_AR'
;

-- 21/04/2021 21:12:15 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET Name='Codigo COT',Updated=TO_DATE('2021-04-21 21:12:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003693 AND AD_Language='es_AR'
;

-- 21/04/2021 21:13:45 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007005,1,'Y','N','N',3003693,'N','Y',133,'N','LAR','Codigo COT',100,0,TO_DATE('2021-04-21 21:13:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-04-21 21:13:45','YYYY-MM-DD HH24:MI:SS'),100)
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
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2021-04-21 21:15:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007005
;

-- 21/04/2021 21:15:29 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET AD_Reference_ID=10,Updated=TO_DATE('2021-04-21 21:15:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003693
;

-- 21/04/2021 21:17:24 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_UOM SET CodigoCOT='1',Updated=TO_DATE('2021-04-21 21:17:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_UOM_ID=1000000
;

-- 21/04/2021 21:17:58 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_UOM SET CodigoCOT='3',Updated=TO_DATE('2021-04-21 21:17:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_UOM_ID=100
;

-- 21/04/2021 21:19:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003694,164,'LAR',0,'N','N','N','N',1,'N',20,'N',3001093,'N','Y','N','Codigo COT','CodigoCOT',TO_DATE('2021-04-21 21:19:43','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2021-04-21 21:19:43','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/04/2021 21:19:44 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003694 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/04/2021 21:20:01 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET AD_Reference_ID=14,Updated=TO_DATE('2021-04-21 21:20:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003694
;

-- 21/04/2021 21:21:07 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007006,1,'Y','N','N',3003694,'N','Y',136,'N','LAR','Codigo COT',100,0,TO_DATE('2021-04-21 21:21:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-04-21 21:21:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/04/2021 21:21:07 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007006 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/04/2021 21:24:07 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='B',Updated=TO_DATE('2021-04-21 21:24:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=209
;

-- 21/04/2021 21:24:27 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='A',Updated=TO_DATE('2021-04-21 21:24:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=225
;

-- 21/04/2021 21:25:24 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='C',Updated=TO_DATE('2021-04-21 21:25:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=213
;

-- 21/04/2021 21:25:43 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='D',Updated=TO_DATE('2021-04-21 21:25:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=227
;

-- 21/04/2021 21:25:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='E',Updated=TO_DATE('2021-04-21 21:25:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=216
;

-- 21/04/2021 21:26:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='F',Updated=TO_DATE('2021-04-21 21:26:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=220
;

-- 21/04/2021 21:26:24 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='G',Updated=TO_DATE('2021-04-21 21:26:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=230
;

-- 21/04/2021 21:26:43 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='H',Updated=TO_DATE('2021-04-21 21:26:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=211
;

-- 21/04/2021 21:26:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='J',Updated=TO_DATE('2021-04-21 21:26:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=226
;

-- 21/04/2021 21:27:13 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='K',Updated=TO_DATE('2021-04-21 21:27:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=210
;

-- 21/04/2021 21:27:38 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='L',Updated=TO_DATE('2021-04-21 21:27:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=219
;

-- 21/04/2021 21:27:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='M',Updated=TO_DATE('2021-04-21 21:27:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=221
;

-- 21/04/2021 21:28:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='N',Updated=TO_DATE('2021-04-21 21:28:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=222
;

-- 21/04/2021 21:28:31 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='P',Updated=TO_DATE('2021-04-21 21:28:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=217
;

-- 21/04/2021 21:28:40 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='Q',Updated=TO_DATE('2021-04-21 21:28:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=223
;

-- 21/04/2021 21:28:59 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='R',Updated=TO_DATE('2021-04-21 21:28:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=224
;

-- 21/04/2021 21:29:08 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='S',Updated=TO_DATE('2021-04-21 21:29:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=229
;

-- 21/04/2021 21:29:35 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='T',Updated=TO_DATE('2021-04-21 21:29:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=233
;

-- 21/04/2021 21:29:47 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='U',Updated=TO_DATE('2021-04-21 21:29:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=212
;

-- 21/04/2021 21:30:05 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='V',Updated=TO_DATE('2021-04-21 21:30:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=231
;

-- 21/04/2021 21:30:20 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='W',Updated=TO_DATE('2021-04-21 21:30:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=215
;

-- 21/04/2021 21:30:42 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='X',Updated=TO_DATE('2021-04-21 21:30:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=214
;

-- 21/04/2021 21:30:50 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='Y',Updated=TO_DATE('2021-04-21 21:30:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=218
;

-- 21/04/2021 21:31:09 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET CodigoCOT='Z',Updated=TO_DATE('2021-04-21 21:31:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=228
;

-- 21/04/2021 21:32:28 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE C_Region SET IsActive='N',Updated=TO_DATE('2021-04-21 21:32:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Region_ID=232
;

-- Registración de script
SELECT register_migration_script_lar('0169_ISSUE-140.sql', 'LAR', '') FROM dual
;
