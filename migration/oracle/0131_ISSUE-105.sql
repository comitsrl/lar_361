ALTER TABLE C_BPartner ADD COLUMN LAR_Exento_Perc_IIBB character(1) DEFAULT 'N'::bpchar;
ALTER TABLE C_BPartner ADD CONSTRAINT C_BPartner_LAR_Exento_Perc_IIBB_Check CHECK (LAR_Exento_Perc_IIBB = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]));
ALTER TABLE C_BPartner ADD COLUMN LAR_Inicio_Cert_IIBB_Venta timestamp without time zone;
ALTER TABLE C_BPartner ADD COLUMN LAR_Venc_Cert_IIBB_Venta timestamp without time zone;
ALTER TABLE C_BPartner ADD COLUMN LAR_NroCertificado_IIBB_Venta character varying(30);
ALTER TABLE C_BPartner ADD COLUMN LAR_Imp_Exencion_IIBB_Venta numeric DEFAULT 0;
ALTER TABLE C_BPartner ADD COLUMN LAR_Exencion_IIBB_Venta numeric;

-- 07/06/2019 19:28:41 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001025,'lar_exento_perc_iibb','LAR','lar_exento_perc_iibb','lar_exento_perc_iibb',0,TO_DATE('2019-06-07 19:28:40','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2019-06-07 19:28:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 07/06/2019 19:28:41 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, PO_Description,Help,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.PO_Description,t.Help,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001025 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 07/06/2019 19:28:41 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,IsMandatory,Version,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003497,291,'LAR','N',0,'N','N','N',1,'N',20,'N',3001025,'N','Y','N','lar_exento_perc_iibb','lar_exento_perc_iibb',TO_DATE('2019-06-07 19:28:40','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2019-06-07 19:28:40','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 07/06/2019 19:28:41 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003497 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 07/06/2019 19:28:42 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001026,'lar_inicio_cert_iibb_venta','LAR','lar_inicio_cert_iibb_venta','lar_inicio_cert_iibb_venta',0,TO_DATE('2019-06-07 19:28:41','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2019-06-07 19:28:41','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 07/06/2019 19:28:42 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, PO_Description,Help,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.PO_Description,t.Help,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001026 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 07/06/2019 19:28:42 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,IsMandatory,Version,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003498,291,'LAR','N',0,'N','N','N',29,'N',16,'N',3001026,'N','Y','N','lar_inicio_cert_iibb_venta','lar_inicio_cert_iibb_venta',TO_DATE('2019-06-07 19:28:41','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2019-06-07 19:28:41','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 07/06/2019 19:28:42 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003498 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 07/06/2019 19:28:42 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001027,'lar_vencimiento_cert_iibb_vent','LAR','lar_vencimiento_cert_iibb_venta','lar_vencimiento_cert_iibb_venta',0,TO_DATE('2019-06-07 19:28:42','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2019-06-07 19:28:42','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 07/06/2019 19:28:42 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, PO_Description,Help,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.PO_Description,t.Help,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001027 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 07/06/2019 19:28:42 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,IsMandatory,Version,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003499,291,'LAR','N',0,'N','N','N',29,'N',16,'N',3001027,'N','Y','N','lar_vencimiento_cert_iibb_venta','lar_vencimiento_cert_iibb_vent',TO_DATE('2019-06-07 19:28:42','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2019-06-07 19:28:42','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 07/06/2019 19:28:42 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003499 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 07/06/2019 19:28:43 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001028,'lar_nrocertificado_iibb_venta','LAR','lar_nrocertificado_iibb_venta','lar_nrocertificado_iibb_venta',0,TO_DATE('2019-06-07 19:28:42','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2019-06-07 19:28:42','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 07/06/2019 19:28:43 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, PO_Description,Help,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.PO_Description,t.Help,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001028 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 07/06/2019 19:28:43 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,IsMandatory,Version,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003500,291,'LAR','N',0,'N','N','N',30,'N',10,'N',3001028,'N','Y','N','lar_nrocertificado_iibb_venta','lar_nrocertificado_iibb_venta',TO_DATE('2019-06-07 19:28:42','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2019-06-07 19:28:42','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 07/06/2019 19:28:43 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003500 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 07/06/2019 19:28:43 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001029,'lar_importe_exencion_iibb_vent','LAR','lar_importe_exencion_iibb_venta','lar_importe_exencion_iibb_venta',0,TO_DATE('2019-06-07 19:28:43','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2019-06-07 19:28:43','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 07/06/2019 19:28:43 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, PO_Description,Help,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.PO_Description,t.Help,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001029 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 07/06/2019 19:28:43 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,IsMandatory,Version,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003501,291,'LAR','N',0,'N','N','N',131089,'N',22,'N',3001029,'N','Y','N','lar_importe_exencion_iibb_venta','lar_importe_exencion_iibb_vent',TO_DATE('2019-06-07 19:28:43','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2019-06-07 19:28:43','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 07/06/2019 19:28:43 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003501 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 07/06/2019 19:28:44 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001030,'lar_exencion_iibb_venta','LAR','lar_exencion_iibb_venta','lar_exencion_iibb_venta',0,TO_DATE('2019-06-07 19:28:43','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2019-06-07 19:28:43','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 07/06/2019 19:28:44 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, PO_Description,Help,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.PO_Description,t.Help,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001030 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 07/06/2019 19:28:44 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,IsMandatory,Version,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003502,291,'LAR','N',0,'N','N','N',131089,'N',22,'N',3001030,'N','Y','N','lar_exencion_iibb_venta','lar_exencion_iibb_venta',TO_DATE('2019-06-07 19:28:43','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2019-06-07 19:28:43','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 07/06/2019 19:28:44 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003502 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 07/06/2019 19:31:42 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column SET Name='Exento Percepciones IIBB', ColumnName='LAR_Exento_Perc_IIBB',Updated=TO_DATE('2019-06-07 19:31:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003497
;

-- 07/06/2019 19:31:42 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003497
;

-- 07/06/2019 19:31:42 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET Name='Exento Percepciones IIBB', Description=NULL, Help=NULL WHERE AD_Column_ID=3003497 AND IsCentrallyMaintained='Y'
;

-- 07/06/2019 19:31:48 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column_Trl SET Name='Exento Percepciones IIBB',Updated=TO_DATE('2019-06-07 19:31:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003497 AND AD_Language='es_AR'
;

-- 07/06/2019 19:32:04 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Element SET ColumnName='LAR_Exento_Perc_IIBB', Name='Exento Percepciones IIBB', PrintName='Exento Percepciones IIBB',Updated=TO_DATE('2019-06-07 19:32:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001025
;

-- 07/06/2019 19:32:04 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001025
;

-- 07/06/2019 19:32:04 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column SET ColumnName='LAR_Exento_Perc_IIBB', Name='Exento Percepciones IIBB', Description=NULL, Help=NULL WHERE AD_Element_ID=3001025
;

-- 07/06/2019 19:32:04 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Process_Para SET ColumnName='LAR_Exento_Perc_IIBB', Name='Exento Percepciones IIBB', Description=NULL, Help=NULL, AD_Element_ID=3001025 WHERE UPPER(ColumnName)='LAR_EXENTO_PERC_IIBB' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 07/06/2019 19:32:04 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Process_Para SET ColumnName='LAR_Exento_Perc_IIBB', Name='Exento Percepciones IIBB', Description=NULL, Help=NULL WHERE AD_Element_ID=3001025 AND IsCentrallyMaintained='Y'
;

-- 07/06/2019 19:32:04 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET Name='Exento Percepciones IIBB', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001025) AND IsCentrallyMaintained='Y'
;

-- 07/06/2019 19:32:04 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_PrintFormatItem pi SET PrintName='Exento Percepciones IIBB', Name='Exento Percepciones IIBB' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001025)
;

-- 07/06/2019 19:32:14 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Element_Trl SET Name='Exento Percepciones IIBB',PrintName='Exento Percepciones IIBB',Updated=TO_DATE('2019-06-07 19:32:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001025 AND AD_Language='es_AR'
;

-- 07/06/2019 19:38:24 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column SET FieldLength=20, AD_Reference_ID=37, Name='Importe Exención Perc. IIBB', ColumnName='LAR_Imp_Exencion_IIBB_Venta',Updated=TO_DATE('2019-06-07 19:38:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003501
;

-- 07/06/2019 19:38:24 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003501
;

-- 07/06/2019 19:38:24 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET Name='Importe Exención Perc. IIBB', Description=NULL, Help=NULL WHERE AD_Column_ID=3003501 AND IsCentrallyMaintained='Y'
;

-- 07/06/2019 19:38:32 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column_Trl SET Name='Importe Exención Perc. IIBB',Updated=TO_DATE('2019-06-07 19:38:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003501 AND AD_Language='es_AR'
;

-- 07/06/2019 19:39:05 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Element SET ColumnName='LAR_Imp_Exencion_IIBB_Venta', Name='Importe Exención Perc. IIBB', PrintName='Importe Exención Perc. IIBB',Updated=TO_DATE('2019-06-07 19:39:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001029
;

-- 07/06/2019 19:39:05 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001029
;

-- 07/06/2019 19:39:05 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column SET ColumnName='LAR_Imp_Exencion_IIBB_Venta', Name='Importe Exención Perc. IIBB', Description=NULL, Help=NULL WHERE AD_Element_ID=3001029
;

-- 07/06/2019 19:39:05 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Process_Para SET ColumnName='LAR_Imp_Exencion_IIBB_Venta', Name='Importe Exención Perc. IIBB', Description=NULL, Help=NULL, AD_Element_ID=3001029 WHERE UPPER(ColumnName)='LAR_IMP_EXENCION_IIBB_VENTA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 07/06/2019 19:39:05 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Process_Para SET ColumnName='LAR_Imp_Exencion_IIBB_Venta', Name='Importe Exención Perc. IIBB', Description=NULL, Help=NULL WHERE AD_Element_ID=3001029 AND IsCentrallyMaintained='Y'
;

-- 07/06/2019 19:39:05 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET Name='Importe Exención Perc. IIBB', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001029) AND IsCentrallyMaintained='Y'
;

-- 07/06/2019 19:39:05 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_PrintFormatItem pi SET PrintName='Importe Exención Perc. IIBB', Name='Importe Exención Perc. IIBB' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001029)
;

-- 07/06/2019 19:39:18 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Element_Trl SET Name='Importe Exención Perc. IIBB',PrintName='Importe Exención Perc. IIBB',Updated=TO_DATE('2019-06-07 19:39:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001029 AND AD_Language='es_AR'
;

-- 07/06/2019 19:42:42 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column SET Name='Fecha Inicio Exención Perc. IIBB', ColumnName='LAR_Inicio_Cert_IIBB_Venta',Updated=TO_DATE('2019-06-07 19:42:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003498
;

-- 07/06/2019 19:42:42 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003498
;

-- 07/06/2019 19:42:42 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET Name='Fecha Inicio Exención Perc. IIBB', Description=NULL, Help=NULL WHERE AD_Column_ID=3003498 AND IsCentrallyMaintained='Y'
;

-- 07/06/2019 19:42:50 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column_Trl SET Name='Fecha Inicio Exención Perc. IIBB',Updated=TO_DATE('2019-06-07 19:42:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003498 AND AD_Language='es_AR'
;

-- 07/06/2019 19:43:08 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Element SET ColumnName='LAR_Inicio_Cert_IIBB_Venta', Name='Fecha Inicio Exención Perc. IIBB', PrintName='Fecha Inicio Exención Perc. IIBB',Updated=TO_DATE('2019-06-07 19:43:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001026
;

-- 07/06/2019 19:43:08 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001026
;

-- 07/06/2019 19:43:08 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column SET ColumnName='LAR_Inicio_Cert_IIBB_Venta', Name='Fecha Inicio Exención Perc. IIBB', Description=NULL, Help=NULL WHERE AD_Element_ID=3001026
;

-- 07/06/2019 19:43:08 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Process_Para SET ColumnName='LAR_Inicio_Cert_IIBB_Venta', Name='Fecha Inicio Exención Perc. IIBB', Description=NULL, Help=NULL, AD_Element_ID=3001026 WHERE UPPER(ColumnName)='LAR_INICIO_CERT_IIBB_VENTA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 07/06/2019 19:43:08 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Process_Para SET ColumnName='LAR_Inicio_Cert_IIBB_Venta', Name='Fecha Inicio Exención Perc. IIBB', Description=NULL, Help=NULL WHERE AD_Element_ID=3001026 AND IsCentrallyMaintained='Y'
;

-- 07/06/2019 19:43:08 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET Name='Fecha Inicio Exención Perc. IIBB', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001026) AND IsCentrallyMaintained='Y'
;

-- 07/06/2019 19:43:08 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_PrintFormatItem pi SET PrintName='Fecha Inicio Exención Perc. IIBB', Name='Fecha Inicio Exención Perc. IIBB' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001026)
;

-- 07/06/2019 19:43:21 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Element_Trl SET Name='Fecha Inicio Exención Perc. IIBB',PrintName='Fecha Inicio Exención Perc. IIBB',Updated=TO_DATE('2019-06-07 19:43:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001026 AND AD_Language='es_AR'
;

-- 07/06/2019 19:47:16 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column SET Name='Nro. Certificado Exención Perc. IIBB', ColumnName='LAR_NroCertificado_IIBB_Venta',Updated=TO_DATE('2019-06-07 19:47:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003500
;

-- 07/06/2019 19:47:16 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003500
;

-- 07/06/2019 19:47:16 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET Name='Nro. Certificado Exención Perc. IIBB', Description=NULL, Help=NULL WHERE AD_Column_ID=3003500 AND IsCentrallyMaintained='Y'
;

-- 07/06/2019 19:47:24 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column_Trl SET Name='Nro. Certificado Exención Perc. IIBB',Updated=TO_DATE('2019-06-07 19:47:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003500 AND AD_Language='es_AR'
;

-- 07/06/2019 19:48:28 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Element SET ColumnName='LAR_NroCertificado_IIBB_Venta', Name='Nro. Certificado Exención Perc. IIBB', PrintName='Nro. Certificado Exención Perc. IIBB',Updated=TO_DATE('2019-06-07 19:48:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001028
;

-- 07/06/2019 19:48:28 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001028
;

-- 07/06/2019 19:48:28 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column SET ColumnName='LAR_NroCertificado_IIBB_Venta', Name='Nro. Certificado Exención Perc. IIBB', Description=NULL, Help=NULL WHERE AD_Element_ID=3001028
;

-- 07/06/2019 19:48:28 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Process_Para SET ColumnName='LAR_NroCertificado_IIBB_Venta', Name='Nro. Certificado Exención Perc. IIBB', Description=NULL, Help=NULL, AD_Element_ID=3001028 WHERE UPPER(ColumnName)='LAR_NROCERTIFICADO_IIBB_VENTA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 07/06/2019 19:48:28 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Process_Para SET ColumnName='LAR_NroCertificado_IIBB_Venta', Name='Nro. Certificado Exención Perc. IIBB', Description=NULL, Help=NULL WHERE AD_Element_ID=3001028 AND IsCentrallyMaintained='Y'
;

-- 07/06/2019 19:48:28 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET Name='Nro. Certificado Exención Perc. IIBB', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001028) AND IsCentrallyMaintained='Y'
;

-- 07/06/2019 19:48:28 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_PrintFormatItem pi SET PrintName='Nro. Certificado Exención Perc. IIBB', Name='Nro. Certificado Exención Perc. IIBB' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001028)
;

-- 07/06/2019 19:48:40 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Element_Trl SET Name='Nro. Certificado Exención Perc. IIBB',PrintName='Nro. Certificado Exención Perc. IIBB',Updated=TO_DATE('2019-06-07 19:48:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001028 AND AD_Language='es_AR'
;

-- 07/06/2019 19:50:36 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column SET Name='Vencimiento Cert. Exención Perc. IIBB', ColumnName='LAR_Venc_Cert_IIBB_Venta',Updated=TO_DATE('2019-06-07 19:50:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003499
;

-- 07/06/2019 19:50:36 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003499
;

-- 07/06/2019 19:50:36 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET Name='Vencimiento Cert. Exención Perc. IIBB', Description=NULL, Help=NULL WHERE AD_Column_ID=3003499 AND IsCentrallyMaintained='Y'
;

-- 07/06/2019 19:50:43 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column_Trl SET Name='Vencimiento Cert. Exención Perc. IIBB',Updated=TO_DATE('2019-06-07 19:50:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003499 AND AD_Language='es_AR'
;

-- 07/06/2019 19:51:03 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Element SET ColumnName='LAR_Venc_Cert_IIBB_Venta', Name='Vencimiento Cert. Exención Perc. IIBB', PrintName='Vencimiento Cert. Exención Perc. IIBB',Updated=TO_DATE('2019-06-07 19:51:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001027
;

-- 07/06/2019 19:51:03 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001027
;

-- 07/06/2019 19:51:03 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column SET ColumnName='LAR_Venc_Cert_IIBB_Venta', Name='Vencimiento Cert. Exención Perc. IIBB', Description=NULL, Help=NULL WHERE AD_Element_ID=3001027
;

-- 07/06/2019 19:51:03 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Process_Para SET ColumnName='LAR_Venc_Cert_IIBB_Venta', Name='Vencimiento Cert. Exención Perc. IIBB', Description=NULL, Help=NULL, AD_Element_ID=3001027 WHERE UPPER(ColumnName)='LAR_VENC_CERT_IIBB_VENTA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 07/06/2019 19:51:03 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Process_Para SET ColumnName='LAR_Venc_Cert_IIBB_Venta', Name='Vencimiento Cert. Exención Perc. IIBB', Description=NULL, Help=NULL WHERE AD_Element_ID=3001027 AND IsCentrallyMaintained='Y'
;

-- 07/06/2019 19:51:03 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET Name='Vencimiento Cert. Exención Perc. IIBB', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001027) AND IsCentrallyMaintained='Y'
;

-- 07/06/2019 19:51:03 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_PrintFormatItem pi SET PrintName='Vencimiento Cert. Exención Perc. IIBB', Name='Vencimiento Cert. Exención Perc. IIBB' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001027)
;

-- 07/06/2019 19:51:15 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Element_Trl SET Name='Vencimiento Cert. Exención Perc. IIBB',PrintName='Vencimiento Cert. Exención Perc. IIBB',Updated=TO_DATE('2019-06-07 19:51:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001027 AND AD_Language='es_AR'
;

-- 07/06/2019 19:52:35 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column SET AD_Reference_ID=15,Updated=TO_DATE('2019-06-07 19:52:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003499
;

-- 07/06/2019 19:53:02 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column SET AD_Reference_ID=15,Updated=TO_DATE('2019-06-07 19:53:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003498
;

-- 07/06/2019 20:02:29 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006525,1,'Y','N','N',3003497,'N','Y',220,'N','LAR','Exento Percepciones IIBB',100,0,'Y',TO_DATE('2019-06-07 20:02:29','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2019-06-07 20:02:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 07/06/2019 20:02:29 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006525 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 07/06/2019 20:02:29 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006526,29,'Y','N','N',3003498,'N','Y',220,'N','LAR','Fecha Inicio Exención Perc. IIBB',100,0,'Y',TO_DATE('2019-06-07 20:02:29','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2019-06-07 20:02:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 07/06/2019 20:02:29 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006526 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 07/06/2019 20:02:30 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006527,20,'Y','N','N',3003501,'N','Y',220,'N','LAR','Importe Exención Perc. IIBB',100,0,'Y',TO_DATE('2019-06-07 20:02:29','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2019-06-07 20:02:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 07/06/2019 20:02:30 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006527 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 07/06/2019 20:02:30 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006528,131089,'Y','N','N',3003502,'N','Y',220,'N','LAR','lar_exencion_iibb_venta',100,0,'Y',TO_DATE('2019-06-07 20:02:30','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2019-06-07 20:02:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 07/06/2019 20:02:30 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006528 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 07/06/2019 20:02:30 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006529,30,'Y','N','N',3003500,'N','Y',220,'N','LAR','Nro. Certificado Exención Perc. IIBB',100,0,'Y',TO_DATE('2019-06-07 20:02:30','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2019-06-07 20:02:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 07/06/2019 20:02:30 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006529 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 07/06/2019 20:02:30 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006530,29,'Y','N','N',3003499,'N','Y',220,'N','LAR','Vencimiento Cert. Exención Perc. IIBB',100,0,'Y',TO_DATE('2019-06-07 20:02:30','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2019-06-07 20:02:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 07/06/2019 20:02:30 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006530 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 07/06/2019 20:08:23 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column SET FieldLength=20, Name='Exento Percepciones IIBB', ColumnName='LAR_Exencion_IIBB_Venta',Updated=TO_DATE('2019-06-07 20:08:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003502
;

-- 07/06/2019 20:08:23 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003502
;

-- 07/06/2019 20:08:23 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET Name='Exento Percepciones IIBB', Description=NULL, Help=NULL WHERE AD_Column_ID=3003502 AND IsCentrallyMaintained='Y'
;

-- 07/06/2019 20:08:35 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column_Trl SET Name='Exento Percepciones IIBB',Updated=TO_DATE('2019-06-07 20:08:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003502 AND AD_Language='es_AR'
;

-- 07/06/2019 20:08:54 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Element SET ColumnName='LAR_Exencion_IIBB_Venta', Name='Exento Percepciones IIBB', PrintName='Exento Percepciones IIBB',Updated=TO_DATE('2019-06-07 20:08:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001030
;

-- 07/06/2019 20:08:54 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001030
;

-- 07/06/2019 20:08:54 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column SET ColumnName='LAR_Exencion_IIBB_Venta', Name='Exento Percepciones IIBB', Description=NULL, Help=NULL WHERE AD_Element_ID=3001030
;

-- 07/06/2019 20:08:54 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Process_Para SET ColumnName='LAR_Exencion_IIBB_Venta', Name='Exento Percepciones IIBB', Description=NULL, Help=NULL, AD_Element_ID=3001030 WHERE UPPER(ColumnName)='LAR_EXENCION_IIBB_VENTA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 07/06/2019 20:08:54 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Process_Para SET ColumnName='LAR_Exencion_IIBB_Venta', Name='Exento Percepciones IIBB', Description=NULL, Help=NULL WHERE AD_Element_ID=3001030 AND IsCentrallyMaintained='Y'
;

-- 07/06/2019 20:08:54 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET Name='Exento Percepciones IIBB', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001030) AND IsCentrallyMaintained='Y'
;

-- 07/06/2019 20:08:54 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_PrintFormatItem pi SET PrintName='Exento Percepciones IIBB', Name='Exento Percepciones IIBB' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001030)
;

-- 07/06/2019 20:09:04 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Element_Trl SET Name='Exento Percepciones IIBB',PrintName='Exento Percepciones IIBB',Updated=TO_DATE('2019-06-07 20:09:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001030 AND AD_Language='es_AR'
;

-- 07/06/2019 20:09:24 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_DATE('2019-06-07 20:09:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006528
;

-- 07/06/2019 20:10:30 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET DisplayLogic='@LAR_Exencion_IIBB_Venta@ = ''Y''',Updated=TO_DATE('2019-06-07 20:10:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006529
;

-- 07/06/2019 20:10:37 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET DisplayLogic='@LAR_Exencion_IIBB_Venta@ = ''Y''',Updated=TO_DATE('2019-06-07 20:10:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006530
;

-- 07/06/2019 20:10:48 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET DisplayLogic='@LAR_Exencion_IIBB_Venta@ = ''Y''',Updated=TO_DATE('2019-06-07 20:10:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006526
;

-- 07/06/2019 20:10:55 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET DisplayLogic='@LAR_Exencion_IIBB_Venta@ = ''Y''',Updated=TO_DATE('2019-06-07 20:10:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006527
;

-- 07/06/2019 20:12:53 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column SET Name='% Exencion Percepciones IIBB',Updated=TO_DATE('2019-06-07 20:12:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003502
;

-- 07/06/2019 20:12:53 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003502
;

-- 07/06/2019 20:12:53 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET Name='% Exencion Percepciones IIBB', Description=NULL, Help=NULL WHERE AD_Column_ID=3003502 AND IsCentrallyMaintained='Y'
;

-- 07/06/2019 20:12:58 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column_Trl SET Name='% Exencion Percepciones IIBB',Updated=TO_DATE('2019-06-07 20:12:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003502 AND AD_Language='es_AR'
;

-- 07/06/2019 20:13:09 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Element SET Name='% Exencion Percepciones IIBB', PrintName='% Exencion Percepciones IIBB',Updated=TO_DATE('2019-06-07 20:13:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001030
;

-- 07/06/2019 20:13:09 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001030
;

-- 07/06/2019 20:13:09 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column SET ColumnName='LAR_Exencion_IIBB_Venta', Name='% Exencion Percepciones IIBB', Description=NULL, Help=NULL WHERE AD_Element_ID=3001030
;

-- 07/06/2019 20:13:09 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Process_Para SET ColumnName='LAR_Exencion_IIBB_Venta', Name='% Exencion Percepciones IIBB', Description=NULL, Help=NULL, AD_Element_ID=3001030 WHERE UPPER(ColumnName)='LAR_EXENCION_IIBB_VENTA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 07/06/2019 20:13:09 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Process_Para SET ColumnName='LAR_Exencion_IIBB_Venta', Name='% Exencion Percepciones IIBB', Description=NULL, Help=NULL WHERE AD_Element_ID=3001030 AND IsCentrallyMaintained='Y'
;

-- 07/06/2019 20:13:09 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET Name='% Exencion Percepciones IIBB', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001030) AND IsCentrallyMaintained='Y'
;

-- 07/06/2019 20:13:09 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_PrintFormatItem pi SET PrintName='% Exencion Percepciones IIBB', Name='% Exencion Percepciones IIBB' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001030)
;

-- 07/06/2019 20:13:16 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Element_Trl SET Name='% Exencion Percepciones IIBB',PrintName='% Exencion Percepciones IIBB',Updated=TO_DATE('2019-06-07 20:13:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001030 AND AD_Language='es_AR'
;

-- 07/06/2019 20:13:33 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Element_Trl SET Name='% Exención Percepciones IIBB',PrintName='% Exención Percepciones IIBB',Updated=TO_DATE('2019-06-07 20:13:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001030 AND AD_Language='es_AR'
;

-- 07/06/2019 20:13:41 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Element SET Name='% Exención Percepciones IIBB', PrintName='% Exención Percepciones IIBB',Updated=TO_DATE('2019-06-07 20:13:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001030
;

-- 07/06/2019 20:13:41 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001030
;

-- 07/06/2019 20:13:41 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column SET ColumnName='LAR_Exencion_IIBB_Venta', Name='% Exención Percepciones IIBB', Description=NULL, Help=NULL WHERE AD_Element_ID=3001030
;

-- 07/06/2019 20:13:41 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Process_Para SET ColumnName='LAR_Exencion_IIBB_Venta', Name='% Exención Percepciones IIBB', Description=NULL, Help=NULL, AD_Element_ID=3001030 WHERE UPPER(ColumnName)='LAR_EXENCION_IIBB_VENTA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 07/06/2019 20:13:41 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Process_Para SET ColumnName='LAR_Exencion_IIBB_Venta', Name='% Exención Percepciones IIBB', Description=NULL, Help=NULL WHERE AD_Element_ID=3001030 AND IsCentrallyMaintained='Y'
;

-- 07/06/2019 20:13:41 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET Name='% Exención Percepciones IIBB', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001030) AND IsCentrallyMaintained='Y'
;

-- 07/06/2019 20:13:41 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_PrintFormatItem pi SET PrintName='% Exención Percepciones IIBB', Name='% Exención Percepciones IIBB' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001030)
;

-- 07/06/2019 20:13:57 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Column_Trl SET Name='% Exención Percepciones IIBB',Updated=TO_DATE('2019-06-07 20:13:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003502 AND AD_Language='es_AR'
;

-- 07/06/2019 20:17:07 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Perc_IIBB@ = ''Y''',Updated=TO_DATE('2019-06-07 20:17:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006528
;

-- 07/06/2019 20:17:29 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Perc_IIBB@ = ''Y''',Updated=TO_DATE('2019-06-07 20:17:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006527
;

-- 07/06/2019 20:17:36 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Perc_IIBB@ = ''Y''',Updated=TO_DATE('2019-06-07 20:17:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006526
;

-- 07/06/2019 20:17:57 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Perc_IIBB@ = ''Y''',Updated=TO_DATE('2019-06-07 20:17:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006530
;

-- 07/06/2019 20:18:03 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Perc_IIBB@ = ''Y''',Updated=TO_DATE('2019-06-07 20:18:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006529
;

-- 07/06/2019 20:18:18 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006524
;

-- 07/06/2019 20:18:18 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3006525
;

-- 07/06/2019 20:18:18 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3006526
;

-- 07/06/2019 20:18:18 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3006527
;

-- 07/06/2019 20:18:18 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3006528
;

-- 07/06/2019 20:18:18 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3006529
;

-- 07/06/2019 20:18:18 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3006530
;

-- 07/06/2019 20:19:14 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3006525
;

-- 07/06/2019 20:19:14 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3006526
;

-- 07/06/2019 20:19:14 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3006527
;

-- 07/06/2019 20:19:14 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3006528
;

-- 07/06/2019 20:19:14 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3006529
;

-- 07/06/2019 20:19:14 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3006530
;

-- 07/06/2019 20:19:14 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3955
;

-- 07/06/2019 20:19:14 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=2124
;

-- 07/06/2019 20:19:14 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=2164
;

-- 07/06/2019 20:19:14 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=2139
;

-- 07/06/2019 20:19:14 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=2149
;

-- 07/06/2019 20:19:14 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=2144
;

-- 07/06/2019 20:19:14 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=2162
;

-- 07/06/2019 20:19:14 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=2148
;

-- 07/06/2019 20:19:14 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=2128
;

-- 07/06/2019 20:19:14 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=2127
;

-- 07/06/2019 20:19:14 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=2146
;

-- 07/06/2019 20:19:14 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=2154
;

-- 07/06/2019 20:19:14 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=2153
;

-- 07/06/2019 20:19:14 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=54555
;

-- 07/06/2019 20:19:14 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=2135
;

-- 07/06/2019 20:19:14 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=9620
;

-- 07/06/2019 20:19:14 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=57533
;

-- 07/06/2019 20:19:41 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3006528
;

-- 07/06/2019 20:19:41 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3006526
;

-- 07/06/2019 20:19:41 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3006530
;

-- 07/06/2019 20:19:41 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3006529
;

-- 07/06/2019 20:19:59 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2019-06-07 20:19:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006527
;

-- 07/06/2019 20:20:11 ART
-- ISSUE #105: Exenciones de Percepciones de IIBB.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2019-06-07 20:20:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006530
;

-- 14/06/2019 16:16:14 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006527
;

-- 14/06/2019 16:16:14 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3006526
;

-- 14/06/2019 16:16:14 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3006530
;

-- 14/06/2019 16:16:14 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3006529
;

-- 14/06/2019 16:16:14 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3955
;

-- 14/06/2019 16:16:14 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=2124
;

-- 14/06/2019 16:16:14 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=2164
;

-- 14/06/2019 16:16:14 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=2139
;

-- 14/06/2019 16:16:14 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=2149
;

-- 14/06/2019 16:16:14 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=2144
;

-- 14/06/2019 16:16:14 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=2162
;

-- 14/06/2019 16:16:14 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=2148
;

-- 14/06/2019 16:16:14 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=2128
;

-- 14/06/2019 16:16:14 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=2127
;

-- 14/06/2019 16:16:14 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=2146
;

-- 14/06/2019 16:16:14 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=2154
;

-- 14/06/2019 16:16:14 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=2153
;

-- 14/06/2019 16:16:14 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=54555
;

-- 14/06/2019 16:16:14 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=2135
;

-- 14/06/2019 16:16:14 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=9620
;

-- 14/06/2019 16:16:14 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=57533
;

-- Registración de script
SELECT register_migration_script_lar('0131_ISSUE-105.sql', 'LAR', '') FROM dual
;
