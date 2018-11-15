--ISSUE #81: Aplicar Regimen de Retenciones IIBB
ALTER TABLE C_Invoice
ADD COLUMN ImporteRetencionIIBB numeric DEFAULT 0::numeric
;

ALTER TABLE C_BPartner
ADD COLUMN CoeficienteUnificadoCM numeric DEFAULT 0::numeric
;

ALTER TABLE LAR_PaymentWithholding
ADD COLUMN Documentno character varying(30),
ADD COLUMN c_doctype_id numeric(10,0),
ADD COLUMN Description character varying(255)
;

-- 11/11/2018 19:15:08 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000951,'importeretencioniibb','LAR','importeretencioniibb','importeretencioniibb',0,TO_TIMESTAMP('2018-11-11 19:15:07','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2018-11-11 19:15:07','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 11/11/2018 19:15:08 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000951 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 11/11/2018 19:15:09 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003217,318,'LAR',0,'N','N','N','N',131089,'N',22,'N',3000951,'N','Y','N','importeretencioniibb','importeretencioniibb',100,TO_TIMESTAMP('2018-11-11 19:15:07','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2018-11-11 19:15:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:15:09 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003217 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/11/2018 19:15:44 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Element SET ColumnName='ImporteRetencionIIBB', Name='ImporteRetencionIIBB', PrintName='ImporteRetencionIIBB',Updated=TO_TIMESTAMP('2018-11-11 19:15:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000951
;

-- 11/11/2018 19:15:44 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000951
;

-- 11/11/2018 19:15:44 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Column SET ColumnName='ImporteRetencionIIBB', Name='ImporteRetencionIIBB', Description=NULL, Help=NULL WHERE AD_Element_ID=3000951
;

-- 11/11/2018 19:15:44 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Process_Para SET ColumnName='ImporteRetencionIIBB', Name='ImporteRetencionIIBB', Description=NULL, Help=NULL, AD_Element_ID=3000951 WHERE UPPER(ColumnName)='IMPORTERETENCIONIIBB' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 11/11/2018 19:15:44 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Process_Para SET ColumnName='ImporteRetencionIIBB', Name='ImporteRetencionIIBB', Description=NULL, Help=NULL WHERE AD_Element_ID=3000951 AND IsCentrallyMaintained='Y'
;

-- 11/11/2018 19:15:44 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET Name='ImporteRetencionIIBB', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000951) AND IsCentrallyMaintained='Y'
;

-- 11/11/2018 19:15:44 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_PrintFormatItem SET PrintName='ImporteRetencionIIBB', Name='ImporteRetencionIIBB' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000951)
;

-- 11/11/2018 19:16:10 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Importe Retención IIBB',PrintName='Importe Retención IIBB',Updated=TO_TIMESTAMP('2018-11-11 19:16:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000951 AND AD_Language='es_AR'
;

-- 11/11/2018 19:16:27 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Column SET FieldLength=22, AD_Reference_ID=12, Name='ImporteRetencionIIBB', ColumnName='ImporteRetencionIIBB',Updated=TO_TIMESTAMP('2018-11-11 19:16:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003217
;

-- 11/11/2018 19:17:05 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006077,14,'Y','N','N',3001378,'N','Y',290,'N','LAR','CAE',100,0,TO_TIMESTAMP('2018-11-11 19:17:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-11 19:17:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:17:05 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006077 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2018 19:17:06 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006078,10,'Y','N','N',3001381,'N','Y',290,'N','LAR','CAE Cbte',100,0,TO_TIMESTAMP('2018-11-11 19:17:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-11 19:17:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:17:06 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006078 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2018 19:17:06 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006079,255,'Y','N','N',3001380,'N','Y',290,'N','LAR','CAE Error',100,0,TO_TIMESTAMP('2018-11-11 19:17:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-11 19:17:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:17:06 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006079 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2018 19:17:06 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006080,14,'Y','N','N',3000040,'N','Y',290,'N','LAR','CAI',100,0,TO_TIMESTAMP('2018-11-11 19:17:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-11 19:17:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:17:06 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006080 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2018 19:17:06 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006081,29,'Y','N','N',3000041,'N','Y',290,'N','LAR','CAIDate',100,0,TO_TIMESTAMP('2018-11-11 19:17:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-11 19:17:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:17:06 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006081 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2018 19:17:07 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006082,10,'Y','N','N',3001208,'N','Y',290,'N','Ingresar valores negativos para generar un Recargo.','LAR','Ingresar valores negativos para generar un Recargo.','Descuento',100,0,TO_TIMESTAMP('2018-11-11 19:17:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-11 19:17:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:17:07 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006082 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2018 19:17:07 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006083,7,'Y','N','N',53247,'N','Y',290,'N','D','Dunning Grace Date',100,0,TO_TIMESTAMP('2018-11-11 19:17:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-11 19:17:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:17:07 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006083 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2018 19:17:07 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006084,22,'Y','N','N',53248,'N','Y',290,'N','D','Dunning Level',100,0,TO_TIMESTAMP('2018-11-11 19:17:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-11 19:17:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:17:07 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006084 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2018 19:17:07 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006085,1,'Y','N','N',3002276,'N','Y',290,'N','LAR','FE_EOS',100,0,TO_TIMESTAMP('2018-11-11 19:17:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-11 19:17:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:17:07 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006085 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2018 19:17:07 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006086,30,'Y','N','N',3000039,'N','Y',290,'N','LAR','FiscalReceiptNumber',100,0,TO_TIMESTAMP('2018-11-11 19:17:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-11 19:17:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:17:07 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006086 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2018 19:17:08 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006087,15,'Y','N','N',3001382,'N','Y',290,'N','LAR','IdCAE',100,0,TO_TIMESTAMP('2018-11-11 19:17:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-11 19:17:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:17:08 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006087 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2018 19:17:08 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006088,22,'Y','N','N',3003217,'N','Y',290,'N','LAR','ImporteRetencionIIBB',100,0,TO_TIMESTAMP('2018-11-11 19:17:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-11 19:17:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:17:08 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006088 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2018 19:17:08 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006089,1,'Y','N','N',3000038,'N','Y',290,'N','LAR','IsFiscalPrinted',100,0,TO_TIMESTAMP('2018-11-11 19:17:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-11 19:17:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:17:08 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006089 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2018 19:17:08 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006090,10,'Y','N','N',3000067,'N','Y',290,'N','LAR','LAR_DocumentLetter',100,0,TO_TIMESTAMP('2018-11-11 19:17:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-11 19:17:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:17:08 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006090 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2018 19:17:08 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006091,30,'Y','N','N',3002810,'N','Y',290,'N','El número del documento es usualmente generado en automático por el sistema y determinado por el tipo del documento. Si el documento no se salva; el número preliminar se despliega entre "<>"','U','Número de secuencia del documento para cada documento','No. del Documento',100,0,TO_TIMESTAMP('2018-11-11 19:17:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-11 19:17:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:17:08 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006091 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2018 19:17:09 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006092,10,'Y','N','N',3001383,'N','Y',290,'N','LAR','Número de Comprobante',100,0,TO_TIMESTAMP('2018-11-11 19:17:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-11 19:17:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:17:09 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006092 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2018 19:17:09 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006093,20,'Y','N','N',59037,'N','Y',290,'N','The ProcessedOn Date+Time save the exact moment (nanoseconds precision if allowed by the DB) when a document has been processed.','D','The date+time (expressed in decimal format) when the document has been processed','Processed On',100,0,TO_TIMESTAMP('2018-11-11 19:17:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-11 19:17:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:17:09 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006093 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2018 19:17:09 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006094,22,'Y','N','N',55305,'N','Y',290,'N','D','ID of document reversal','Reversal ID',100,0,TO_TIMESTAMP('2018-11-11 19:17:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-11 19:17:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:17:09 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006094 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2018 19:17:09 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006095,22,'Y','N','N',52007,'N','Y',290,'N','A Return Material Authorization may be required to accept returns and to create Credit Memos','D','Return Material Authorization','RMA',100,0,TO_TIMESTAMP('2018-11-11 19:17:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-11 19:17:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:17:09 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006095 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2018 19:17:10 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006096,10,'Y','N','N',3000265,'N','Y',290,'N','LAR','Source_Invoice_ID',100,0,TO_TIMESTAMP('2018-11-11 19:17:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-11 19:17:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:17:10 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006096 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2018 19:17:10 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006097,5,'Y','N','N',3000266,'N','Y',290,'N','U','TargetDocBaseType',100,0,TO_TIMESTAMP('2018-11-11 19:17:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-11 19:17:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:17:10 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006097 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2018 19:17:10 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006098,29,'Y','N','N',3001379,'N','Y',290,'N','LAR','Vencimiento CAE',100,0,TO_TIMESTAMP('2018-11-11 19:17:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-11 19:17:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:17:10 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006098 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2018 19:17:48 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006077
;

-- 11/11/2018 19:17:48 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006078
;

-- 11/11/2018 19:17:48 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006079
;

-- 11/11/2018 19:17:48 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006080
;

-- 11/11/2018 19:17:48 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006081
;

-- 11/11/2018 19:17:48 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006082
;

-- 11/11/2018 19:17:48 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006083
;

-- 11/11/2018 19:17:48 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006084
;

-- 11/11/2018 19:17:48 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006085
;

-- 11/11/2018 19:17:48 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006086
;

-- 11/11/2018 19:17:49 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006087
;

-- 11/11/2018 19:17:49 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006089
;

-- 11/11/2018 19:17:49 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006090
;

-- 11/11/2018 19:17:49 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006091
;

-- 11/11/2018 19:17:49 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006092
;

-- 11/11/2018 19:17:49 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006093
;

-- 11/11/2018 19:17:49 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006095
;

-- 11/11/2018 19:17:49 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006094
;

-- 11/11/2018 19:17:49 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006096
;

-- 11/11/2018 19:17:49 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006097
;

-- 11/11/2018 19:17:49 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006098
;

-- 11/11/2018 19:17:49 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=1000034
;

-- 11/11/2018 19:17:49 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=1000035
;

-- 11/11/2018 19:17:49 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=8659
;

-- 11/11/2018 19:17:49 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=10486
;

-- 11/11/2018 19:17:49 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=6532
;

-- 11/11/2018 19:17:49 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3334
;

-- 11/11/2018 19:17:49 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3670
;

-- 11/11/2018 19:17:49 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=200048
;

-- 11/11/2018 19:17:49 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3900
;

-- 11/11/2018 19:17:49 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=60971
;

-- 11/11/2018 19:17:49 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000088
;

-- 11/11/2018 19:17:49 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3006088
;

-- 11/11/2018 19:18:12 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000952,'coeficienteunificadocm','LAR','coeficienteunificadocm','coeficienteunificadocm',0,TO_TIMESTAMP('2018-11-11 19:18:12','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2018-11-11 19:18:12','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 11/11/2018 19:18:12 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000952 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 11/11/2018 19:18:13 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003218,291,'LAR',0,'N','N','N','N',131089,'N',22,'N',3000952,'N','Y','N','coeficienteunificadocm','coeficienteunificadocm',100,TO_TIMESTAMP('2018-11-11 19:18:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2018-11-11 19:18:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:18:13 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003218 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/11/2018 19:18:46 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Column SET FieldLength=22, Name='CoeficienteUnificadoCM', ColumnName='CoeficienteUnificadoCM',Updated=TO_TIMESTAMP('2018-11-11 19:18:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003218
;

-- 11/11/2018 19:18:46 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003218
;

-- 11/11/2018 19:18:46 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET Name='CoeficienteUnificadoCM', Description=NULL, Help=NULL WHERE AD_Column_ID=3003218 AND IsCentrallyMaintained='Y'
;

-- 11/11/2018 19:19:00 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Element SET ColumnName='CoeficienteUnificadoCM', Name='CoeficienteUnificadoCM', PrintName='CoeficienteUnificadoCM',Updated=TO_TIMESTAMP('2018-11-11 19:19:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000952
;

-- 11/11/2018 19:19:00 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000952
;

-- 11/11/2018 19:19:00 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Column SET ColumnName='CoeficienteUnificadoCM', Name='CoeficienteUnificadoCM', Description=NULL, Help=NULL WHERE AD_Element_ID=3000952
;

-- 11/11/2018 19:19:00 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Process_Para SET ColumnName='CoeficienteUnificadoCM', Name='CoeficienteUnificadoCM', Description=NULL, Help=NULL, AD_Element_ID=3000952 WHERE UPPER(ColumnName)='COEFICIENTEUNIFICADOCM' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 11/11/2018 19:19:00 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Process_Para SET ColumnName='CoeficienteUnificadoCM', Name='CoeficienteUnificadoCM', Description=NULL, Help=NULL WHERE AD_Element_ID=3000952 AND IsCentrallyMaintained='Y'
;

-- 11/11/2018 19:19:00 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET Name='CoeficienteUnificadoCM', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000952) AND IsCentrallyMaintained='Y'
;

-- 11/11/2018 19:19:00 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_PrintFormatItem SET PrintName='CoeficienteUnificadoCM', Name='CoeficienteUnificadoCM' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000952)
;

-- 11/11/2018 19:19:16 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Coeficiente Unificado CM',PrintName='Coeficiente Unificado CM',Updated=TO_TIMESTAMP('2018-11-11 19:19:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000952 AND AD_Language='es_AR'
;

-- 11/11/2018 19:19:45 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Element_Trl SET Updated=TO_TIMESTAMP('2018-11-11 19:19:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000952 AND AD_Language='es_AR'
;

-- 11/11/2018 19:20:32 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006099,22,'Y','N','N',3003218,'N','Y',220,'N','LAR','CoeficienteUnificadoCM',100,0,TO_TIMESTAMP('2018-11-11 19:20:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-11 19:20:31','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:20:32 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006099 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2018 19:20:32 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006100,22,'Y','N','N',3001991,'N','Y',220,'N','LAR','LAR_Exencion_SUSS',100,0,TO_TIMESTAMP('2018-11-11 19:20:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-11 19:20:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:20:32 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006100 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2018 19:20:32 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006101,1,'Y','N','N',3001990,'N','Y',220,'N','LAR','LAR_Exento_Retenciones_SUSS',100,0,TO_TIMESTAMP('2018-11-11 19:20:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-11 19:20:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:20:32 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006101 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2018 19:20:32 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006102,22,'Y','N','N',3001992,'N','Y',220,'N','LAR','LAR_Importe_Exencion_SUSS',100,0,TO_TIMESTAMP('2018-11-11 19:20:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-11 19:20:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:20:32 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006102 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2018 19:20:33 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006103,29,'Y','N','N',3001996,'N','Y',220,'N','LAR','LAR_Inicio_Cert_IIBB',100,0,TO_TIMESTAMP('2018-11-11 19:20:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-11 19:20:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:20:33 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006103 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2018 19:20:33 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006104,29,'Y','N','N',3001994,'N','Y',220,'N','LAR','LAR_Inicio_Cert_SUSS',100,0,TO_TIMESTAMP('2018-11-11 19:20:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-11 19:20:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:20:33 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006104 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2018 19:20:33 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006105,30,'Y','N','N',3001993,'N','Y',220,'N','LAR','LAR_NroCertificado_SUSS',100,0,TO_TIMESTAMP('2018-11-11 19:20:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-11 19:20:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:20:33 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006105 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2018 19:20:33 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006106,29,'Y','N','N',3001995,'N','Y',220,'N','LAR','LAR_Vencimiento_Cert_SUSS',100,0,TO_TIMESTAMP('2018-11-11 19:20:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-11 19:20:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:20:33 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006106 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2018 19:20:33 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006107,10,'Y','N','N',3001796,'N','Y',220,'N','LAR','PlazoPago',100,0,TO_TIMESTAMP('2018-11-11 19:20:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-11 19:20:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2018 19:20:33 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006107 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2018 19:21:29 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=2141
;

-- 11/11/2018 19:21:29 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006100
;

-- 11/11/2018 19:21:29 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006101
;

-- 11/11/2018 19:21:29 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006102
;

-- 11/11/2018 19:21:29 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006103
;

-- 11/11/2018 19:21:29 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006104
;

-- 11/11/2018 19:21:29 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006105
;

-- 11/11/2018 19:21:29 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006106
;

-- 11/11/2018 19:21:29 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006107
;

-- 11/11/2018 19:21:29 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=8238
;

-- 11/11/2018 19:21:29 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=10592
;

-- 11/11/2018 19:21:29 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=1000011
;

-- 11/11/2018 19:21:29 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3006099
;

-- 11/11/2018 19:21:29 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3955
;

-- 11/11/2018 19:21:29 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=2124
;

-- 11/11/2018 19:21:29 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=2164
;

-- 11/11/2018 19:21:29 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=2139
;

-- 11/11/2018 19:21:29 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=2149
;

-- 11/11/2018 19:21:29 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3001605
;

-- 11/11/2018 19:21:29 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=2144
;

-- 11/11/2018 19:21:29 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=2162
;

-- 11/11/2018 19:21:29 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=2148
;

-- 11/11/2018 19:21:29 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=2128
;

-- 11/11/2018 19:21:29 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=2127
;

-- 11/11/2018 19:21:29 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=2146
;

-- 11/11/2018 19:21:29 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=2154
;

-- 11/11/2018 19:21:29 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=2153
;

-- 11/11/2018 19:21:29 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=54555
;

-- 11/11/2018 19:21:29 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=2135
;

-- 11/11/2018 19:21:29 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=9620
;

-- 11/11/2018 19:21:29 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=57533
;

-- 11/11/2018 19:21:38 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2018-11-11 19:21:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006099
;

-- 11/11/2018 19:21:41 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2018-11-11 19:21:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2132
;

-- 11/11/2018 19:26:04 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET DisplayLogic='@LCO_ISIC_ID@=1000002',Updated=TO_TIMESTAMP('2018-11-11 19:26:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006099
;

-- 13/11/2018 19:19:04 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003219,3000004,'LAR',0,'N','N','N','The document number is usually automatically generated by the system and determined by the document type of the document. If the document is not saved, the preliminary number is displayed in "<>".

If the document type of your document has no automatic document sequence defined, the field is empty if you create a new document. This is for documents which usually have an external number (like vendor invoice).  If you leave the field empty, the system will generate a document number for you. The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).','N',30,'Y',10,'N',290,'N','Y','N','Document sequence number of the document','Document No','DocumentNo',100,TO_TIMESTAMP('2018-11-13 19:19:03','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2018-11-13 19:19:03','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 13/11/2018 19:19:04 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003219 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 13/11/2018 19:19:04 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003220,3000004,'LAR',0,'N','N','N','The Document Type determines document sequence and processing rules','N',10,'N',19,'N',196,'N','Y','N','Document type or rules','Document Type','C_DocType_ID',100,TO_TIMESTAMP('2018-11-13 19:19:04','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2018-11-13 19:19:04','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 13/11/2018 19:19:04 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003220 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 13/11/2018 19:19:04 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003221,3000004,'LAR',0,'N','N','N','A description is limited to 255 characters.','N',255,'Y',10,'N',275,'N','Y','N','Optional short description of the record','Description','Description',100,TO_TIMESTAMP('2018-11-13 19:19:04','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2018-11-13 19:19:04','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 13/11/2018 19:19:04 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003221 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 13/11/2018 19:21:32 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006108,255,'Y','N','N',3003221,'N','Y',3000029,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,TO_TIMESTAMP('2018-11-13 19:21:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-13 19:21:31','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 13/11/2018 19:21:32 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006108 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 13/11/2018 19:21:32 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006109,30,'Y','N','N',3003219,'N','Y',3000029,'N','The document number is usually automatically generated by the system and determined by the document type of the document. If the document is not saved, the preliminary number is displayed in "<>".

If the document type of your document has no automatic document sequence defined, the field is empty if you create a new document. This is for documents which usually have an external number (like vendor invoice).  If you leave the field empty, the system will generate a document number for you. The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).','LAR','Document sequence number of the document','Document No',100,0,TO_TIMESTAMP('2018-11-13 19:21:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-13 19:21:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 13/11/2018 19:21:32 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006109 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 13/11/2018 19:21:32 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006110,10,'Y','N','N',3003220,'N','Y',3000029,'N','The Document Type determines document sequence and processing rules','LAR','Document type or rules','Document Type',100,0,TO_TIMESTAMP('2018-11-13 19:21:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-13 19:21:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 13/11/2018 19:21:32 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006110 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 13/11/2018 19:22:03 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3006110
;

-- 13/11/2018 19:22:03 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3006109
;

-- 13/11/2018 19:22:03 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3001135
;

-- 13/11/2018 19:22:03 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3001137
;

-- 13/11/2018 19:22:03 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3001138
;

-- 13/11/2018 19:22:03 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3001134
;

-- 13/11/2018 19:22:03 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3001136
;

-- 13/11/2018 19:22:03 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3001127
;

-- 13/11/2018 19:22:03 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3001139
;

-- 13/11/2018 19:22:03 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3001140
;

-- 13/11/2018 19:22:03 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3001141
;

-- 13/11/2018 19:22:03 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3006108
;

-- 13/11/2018 19:22:17 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2018-11-13 19:22:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006109
;

-- Parametrización de configuración para las retenciones
-- 13/11/2018 20:38:02 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,AD_Client_ID,AD_Org_ID,Created,Updated,CreatedBy,UpdatedBy,IsActive) VALUES (3000037,'LAR','C','4000010','Ingresar ID del Cargo para las retenciones de IIBB Río Negro Efectuadas.','LAR_C_Charge_ID_Ret_IIBB_RN',1000000,0,TO_TIMESTAMP('2018-11-13 20:38:01','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2018-11-13 20:38:01','YYYY-MM-DD HH24:MI:SS'),100,100,'Y')
;

-- 13/11/2018 20:39:22 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,AD_Client_ID,AD_Org_ID,Created,Updated,CreatedBy,UpdatedBy,IsActive) VALUES (3000038,'LAR','C','1000032','Ingresar ID del Cargo para las percepciones de IIBB Río Negro SUFRIDAS.(Se utiliza para detectar la percepciones en facturas de compra)','LAR_C_ChargeID_Perc_IIBB_SUFRIDAS',1000000,0,TO_TIMESTAMP('2018-11-13 20:39:22','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2018-11-13 20:39:22','YYYY-MM-DD HH24:MI:SS'),100,100,'Y')
;

-- 13/11/2018 20:40:31 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,AD_Client_ID,AD_Org_ID,Created,Updated,CreatedBy,UpdatedBy,IsActive) VALUES (3000039,'LAR','C','1000002','Ingresar LCO_ISIC_ID que representa el Tipo de IIBB Convenio Multilateral c/jurisdicción Río Negro','LAR_BP_LCO_ISIC_CM_Jurisd_RN',1000000,0,TO_TIMESTAMP('2018-11-13 20:40:31','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2018-11-13 20:40:31','YYYY-MM-DD HH24:MI:SS'),100,100,'Y')
;

-- 13/11/2018 20:43:46 ART
-- ISSUE #81: Régimen de Retenciones IIBB
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,AD_Client_ID,AD_Org_ID,Created,Updated,CreatedBy,UpdatedBy,IsActive) VALUES (3000040,'LAR','C','0.03','Coeficiente Unificado mínimo para Río Negro. (Superando este coeficiente se generan retenciones de IIIBB RN)','LAR_Coef_Unif_Minimo_CM_Ret_IIBB_RN',1000000,0,TO_TIMESTAMP('2018-11-13 20:43:46','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2018-11-13 20:43:46','YYYY-MM-DD HH24:MI:SS'),100,100,'Y')
;

-- 13/11/2018 21:26:59 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_TIMESTAMP('2018-11-13 21:26:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003217
;

-- 13/11/2018 22:18:47 ART
-- ISSUE #81: Régimen de Retenciones IIBB
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2018-11-13 22:18:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006088
;

-- 15/11/2018 19:19:39 ART
-- ISSUE #81: Régimen de Retención de IIBB
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_TIMESTAMP('2018-11-15 19:19:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003217
;

-- 15/11/2018 19:28:47 ART
-- ISSUE #81: Régimen de Retención de IIBB
UPDATE AD_Column SET IsAlwaysUpdateable='N',Updated=TO_TIMESTAMP('2018-11-15 19:28:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003217
;

-- 15/11/2018 19:29:10 ART
-- ISSUE #81: Régimen de Retención de IIBB
UPDATE AD_Column SET ReadOnlyLogic=NULL,Updated=TO_TIMESTAMP('2018-11-15 19:29:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003217
;

-- Registración de script
SELECT register_migration_script_lar('0120_ISSUE-81.sql', 'LAR', '')
;
