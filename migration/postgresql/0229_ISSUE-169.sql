ALTER TABLE LCO_WithholdingRuleConf
ADD COLUMN IsUseDocumentType character(1) DEFAULT 'N'::bpchar,
ADD COLUMN IsUseShipmentRegion character(1) DEFAULT 'N'::bpchar,
ADD CONSTRAINT IsUseDocumentType_isactive_check CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])),
ADD CONSTRAINT IsUseShipmentRegion_isactive_check CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
;

ALTER TABLE LCO_WithholdingRule
ADD COLUMN C_Region_ID numeric(10,0);

ALTER TABLE LCO_WithholdingRule
ADD CONSTRAINT FK_LCO_WithholdingRule_C_Region 
FOREIGN KEY (C_Region_ID) 
REFERENCES C_Region (C_Region_ID) MATCH SIMPLE;

ALTER TABLE LCO_WithholdingRule
ADD COLUMN C_DocTypeInvoice_ID numeric(10,0);

ALTER TABLE LCO_WithholdingRule
ADD CONSTRAINT FK_LCO_WithholdingRule_C_DocType 
FOREIGN KEY (C_DocTypeInvoice_ID) 
REFERENCES C_DocType (C_DocType_ID) MATCH SIMPLE;

-- 28/03/2025 18:00:51 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001504,'isusedocumenttype','LAR','isusedocumenttype','isusedocumenttype',0,TO_TIMESTAMP('2025-03-28 18:00:50','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2025-03-28 18:00:50','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 28/03/2025 18:00:51 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001504 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 28/03/2025 18:00:51 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005807,1000005,'LAR',0,'N','N','N','N',1,'N',20,'N',3001504,'N','Y','N','isusedocumenttype','isusedocumenttype',100,TO_TIMESTAMP('2025-03-28 18:00:50','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2025-03-28 18:00:50','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/03/2025 18:00:51 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005807 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/03/2025 18:00:51 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001505,'isuseshipmentregion','LAR','isuseshipmentregion','isuseshipmentregion',0,TO_TIMESTAMP('2025-03-28 18:00:51','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2025-03-28 18:00:51','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 28/03/2025 18:00:51 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001505 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 28/03/2025 18:00:51 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005808,1000005,'LAR',0,'N','N','N','N',1,'N',20,'N',3001505,'N','Y','N','isuseshipmentregion','isuseshipmentregion',100,TO_TIMESTAMP('2025-03-28 18:00:51','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2025-03-28 18:00:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/03/2025 18:00:52 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005808 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/03/2025 18:01:38 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Element SET ColumnName='IsUseShipmentRegion', Name='IsUseShipmentRegion', PrintName='IsUseShipmentRegion',Updated=TO_TIMESTAMP('2025-03-28 18:01:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001505
;

-- 28/03/2025 18:01:38 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001505
;

-- 28/03/2025 18:01:38 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Column SET ColumnName='IsUseShipmentRegion', Name='IsUseShipmentRegion', Description=NULL, Help=NULL WHERE AD_Element_ID=3001505
;

-- 28/03/2025 18:01:38 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Process_Para SET ColumnName='IsUseShipmentRegion', Name='IsUseShipmentRegion', Description=NULL, Help=NULL, AD_Element_ID=3001505 WHERE UPPER(ColumnName)='ISUSESHIPMENTREGION' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 28/03/2025 18:01:38 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Process_Para SET ColumnName='IsUseShipmentRegion', Name='IsUseShipmentRegion', Description=NULL, Help=NULL WHERE AD_Element_ID=3001505 AND IsCentrallyMaintained='Y'
;

-- 28/03/2025 18:01:38 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Field SET Name='IsUseShipmentRegion', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001505) AND IsCentrallyMaintained='Y'
;

-- 28/03/2025 18:01:38 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_PrintFormatItem SET PrintName='IsUseShipmentRegion', Name='IsUseShipmentRegion' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001505)
;

-- 28/03/2025 18:01:58 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Usa Provincia Remito',PrintName='Usa Provincia Remito',Updated=TO_TIMESTAMP('2025-03-28 18:01:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001505 AND AD_Language='es_AR'
;

-- 28/03/2025 18:03:34 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Element SET ColumnName='IsUseDocumentType', Name='IsUseDocumentType', PrintName='IsUseDocumentType',Updated=TO_TIMESTAMP('2025-03-28 18:03:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001504
;

-- 28/03/2025 18:03:34 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001504
;

-- 28/03/2025 18:03:34 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Column SET ColumnName='IsUseDocumentType', Name='IsUseDocumentType', Description=NULL, Help=NULL WHERE AD_Element_ID=3001504
;

-- 28/03/2025 18:03:34 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Process_Para SET ColumnName='IsUseDocumentType', Name='IsUseDocumentType', Description=NULL, Help=NULL, AD_Element_ID=3001504 WHERE UPPER(ColumnName)='ISUSEDOCUMENTTYPE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 28/03/2025 18:03:34 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Process_Para SET ColumnName='IsUseDocumentType', Name='IsUseDocumentType', Description=NULL, Help=NULL WHERE AD_Element_ID=3001504 AND IsCentrallyMaintained='Y'
;

-- 28/03/2025 18:03:34 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Field SET Name='IsUseDocumentType', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001504) AND IsCentrallyMaintained='Y'
;

-- 28/03/2025 18:03:34 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_PrintFormatItem SET PrintName='IsUseDocumentType', Name='IsUseDocumentType' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001504)
;

-- 28/03/2025 18:03:47 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Usa Tipo de Documento',PrintName='Usa Tipo de Documento',Updated=TO_TIMESTAMP('2025-03-28 18:03:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001504 AND AD_Language='es_AR'
;

-- 28/03/2025 18:04:23 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005809,1000006,'LAR',0,'N','N','N','The Region identifies a unique Region for this Country.','N',10,'N',19,'N',209,'N','Y','N','Identifies a geographical Region','Region','C_Region_ID',100,TO_TIMESTAMP('2025-03-28 18:04:23','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2025-03-28 18:04:23','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/03/2025 18:04:23 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005809 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/03/2025 18:04:24 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005810,1000006,'LAR',0,'N','N','N','The Document Type for Invoice indicates the document type that will be used when an invoice is generated from this sales document.  This field will display only when the base document type is Sales Order.','N',10,'N',19,'N',1072,'N','Y','N','Document type used for invoices generated from this sales document','Document Type for Invoice','C_DocTypeInvoice_ID',100,TO_TIMESTAMP('2025-03-28 18:04:23','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2025-03-28 18:04:23','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/03/2025 18:04:24 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005810 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/03/2025 18:07:04 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009392,1,'Y','N','N',3005807,'N','Y',1000009,'N','LAR','IsUseDocumentType',100,0,TO_TIMESTAMP('2025-03-28 18:07:04','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2025-03-28 18:07:04','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/03/2025 18:07:04 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009392 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/03/2025 18:07:05 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009393,1,'Y','N','N',3005808,'N','Y',1000009,'N','LAR','IsUseShipmentRegion',100,0,TO_TIMESTAMP('2025-03-28 18:07:04','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2025-03-28 18:07:04','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/03/2025 18:07:05 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009393 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/03/2025 18:07:21 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009394,10,'Y','N','N',3005810,'N','Y',1000010,'N','The Document Type for Invoice indicates the document type that will be used when an invoice is generated from this sales document.  This field will display only when the base document type is Sales Order.','LAR','Document type used for invoices generated from this sales document','Document Type for Invoice',100,0,TO_TIMESTAMP('2025-03-28 18:07:21','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2025-03-28 18:07:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/03/2025 18:07:21 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009394 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/03/2025 18:07:21 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009395,10,'Y','N','N',3005809,'N','Y',1000010,'N','The Region identifies a unique Region for this Country.','LAR','Identifies a geographical Region','Region',100,0,TO_TIMESTAMP('2025-03-28 18:07:21','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2025-03-28 18:07:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/03/2025 18:07:21 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009395 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/03/2025 18:07:37 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3009395
;

-- 28/03/2025 18:07:37 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=1000161
;

-- 28/03/2025 18:07:37 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=1000162
;

-- 28/03/2025 18:07:37 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=1000163
;

-- 28/03/2025 18:07:37 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3009394
;

-- 28/03/2025 18:07:53 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3009394
;

-- 28/03/2025 18:07:53 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=1000161
;

-- 28/03/2025 18:07:53 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=1000162
;

-- 28/03/2025 18:07:53 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=1000163
;

-- 28/03/2025 18:08:08 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3009392
;

-- 28/03/2025 18:08:08 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3009393
;

-- 28/03/2025 18:08:08 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=1000137
;

-- 28/03/2025 18:08:08 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000062
;

-- 28/03/2025 18:08:08 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000063
;

-- 28/03/2025 18:08:08 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000061
;

-- 28/03/2025 18:08:19 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3009393
;

-- 28/03/2025 18:08:19 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3009392
;

-- 28/03/2025 18:08:49 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2025-03-28 18:08:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009392
;

-- 28/03/2025 18:11:01 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Column (ColumnSQL,DefaultValue,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('(SELECT IsUseDocumentType FROM LCO_WithholdingRuleConf WHERE LCO_WithholdingRuleConf.LCO_WithholdingType_ID=LCO_WithholdingRule.LCO_WithholdingType_ID)','N',3005811,1000006,'U',0,'N','N','N',0,'N',1,'N',20,'Y','N',3001504,'N','Y','N','N','N','IsUseDocumentType','IsUseDocumentType','N',100,TO_TIMESTAMP('2025-03-28 18:11:01','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2025-03-28 18:11:01','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/03/2025 18:11:01 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005811 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/03/2025 18:11:09 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Column SET EntityType='LAR',Updated=TO_TIMESTAMP('2025-03-28 18:11:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005811
;

-- 28/03/2025 18:12:44 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Column (ColumnSQL,DefaultValue,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('(SELECT IsUseShipmentRegion FROM LCO_WithholdingRuleConf WHERE LCO_WithholdingRuleConf.LCO_WithholdingType_ID=LCO_WithholdingRule.LCO_WithholdingType_ID)','N',3005813,1000006,'LAR',0,'N','N','N',0,'N',1,'N',20,'Y','N',3001505,'N','Y','N','N','N','IsUseShipmentRegion','IsUseShipmentRegion','N',100,TO_TIMESTAMP('2025-03-28 18:12:44','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2025-03-28 18:12:44','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/03/2025 18:12:44 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005813 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/03/2025 19:23:25 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Field SET DisplayLogic='@IsCalcFromPayment@=N',Updated=TO_TIMESTAMP('2025-03-28 19:23:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009393
;

-- 28/03/2025 19:23:35 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Field SET DisplayLogic='@IsCalcFromPayment@=N',Updated=TO_TIMESTAMP('2025-03-28 19:23:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009392
;

-- 28/03/2025 19:25:03 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Field SET DisplayLogic='@IsCalcFromPayment@=Y',Updated=TO_TIMESTAMP('2025-03-28 19:25:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009394
;

-- 28/03/2025 19:25:54 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Field SET DisplayLogic='@IsUseDocumentType@=Y',Updated=TO_TIMESTAMP('2025-03-28 19:25:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009394
;

-- 28/03/2025 19:26:56 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Field SET DisplayLogic='@IsUseShipmentRegion@=Y',Updated=TO_TIMESTAMP('2025-03-28 19:26:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009395
;

-- 28/03/2025 19:27:32 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Field SET DisplayLogic='@IsCalcFromPayment@=Y',Updated=TO_TIMESTAMP('2025-03-28 19:27:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009392
;

-- 28/03/2025 19:28:39 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Column SET AD_Val_Rule_ID=153,Updated=TO_TIMESTAMP('2025-03-28 19:28:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005809
;

-- 28/03/2025 19:30:19 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Column SET AD_Val_Rule_ID=173,Updated=TO_TIMESTAMP('2025-03-28 19:30:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005810
;

-- 28/03/2025 19:36:44 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,Description,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('EXISTS (SELECT 1 FROM C_DocType WHERE C_DocType.C_DocType_ID IN  (SELECT C_DocType_ID FROM C_DocType WHERE DocBaseType IN (''ARI'', ''ARC'')))','S',3000152,'LAR','Ret Ventas C_DocTypeInvoice Invoices and Credit Memos','Facturas y NC Ventas para Retenciones',100,100,TO_TIMESTAMP('2025-03-28 19:36:43','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_TIMESTAMP('2025-03-28 19:36:43','YYYY-MM-DD HH24:MI:SS'))
;

-- 28/03/2025 19:36:52 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Column SET AD_Val_Rule_ID=3000152, IsUpdateable='N',Updated=TO_TIMESTAMP('2025-03-28 19:36:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005810
;

-- 28/03/2025 19:45:03 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000173,'T','LAR','N','LAR_Invoices_NC_For_Withholdiing',0,0,100,TO_TIMESTAMP('2025-03-28 19:45:03','YYYY-MM-DD HH24:MI:SS'),'Y',TO_TIMESTAMP('2025-03-28 19:45:03','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/03/2025 19:45:03 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000173 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 28/03/2025 19:48:14 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Ref_Table (IsValueDisplayed,WhereClause,AD_Table_ID,AD_Reference_ID,AD_Key,AD_Display,EntityType,CreatedBy,Created,Updated,AD_Client_ID,UpdatedBy,AD_Org_ID,IsActive) VALUES ('N','C_DocType.IsActive=''Y'' AND C_DocType.DocBaseType IN (''ARI'', ''ARC'')',217,3000173,1501,1509,'LAR',100,TO_TIMESTAMP('2025-03-28 19:48:14','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2025-03-28 19:48:14','YYYY-MM-DD HH24:MI:SS'),0,100,0,'Y')
;

-- 28/03/2025 19:49:35 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Column SET AD_Reference_Value_ID=3000173, AD_Reference_ID=18, AD_Val_Rule_ID=NULL,Updated=TO_TIMESTAMP('2025-03-28 19:49:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005810
;

-- 29/03/2025 15:27:14 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Ref_Table SET WhereClause='C_DocType.IsActive=''Y'' AND C_DocType.DocBaseType IN (''ARI'', ''ARC'') AND C_DocType.AD_Client_ID=@#AD_Client_ID@',Updated=TO_TIMESTAMP('2025-03-29 15:27:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=3000173
;

-- 29/03/2025 15:30:16 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Column SET AD_Reference_ID=30,Updated=TO_TIMESTAMP('2025-03-29 15:30:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005810
;

-- 29/03/2025 15:33:51 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Column SET AD_Reference_ID=18, IsUpdateable='Y',Updated=TO_TIMESTAMP('2025-03-29 15:33:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005810
;

-- 29/03/2025 15:35:00 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Reference SET Name='LAR_Invoices_For_Withholdiing',Updated=TO_TIMESTAMP('2025-03-29 15:35:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=3000173
;

-- 29/03/2025 15:35:00 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Reference_Trl SET IsTranslated='N' WHERE AD_Reference_ID=3000173
;

-- 29/03/2025 15:35:14 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Ref_Table SET WhereClause='C_DocType.IsActive=''Y'' AND C_DocType.DocBaseType IN (''API'')',Updated=TO_TIMESTAMP('2025-03-29 15:35:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=3000173
;

-- 30/03/2025 10:51:14 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Field_Trl SET Name='(Ret IVA) Usa Cat IVA Org',Updated=TO_TIMESTAMP('2025-03-30 10:51:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=1000130 AND AD_Language='es_AR'
;

-- 30/03/2025 10:51:21 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_TIMESTAMP('2025-03-30 10:51:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=1000130
;

-- 31/03/2025 10:24:10 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009398,1,'Y','N','N',3005811,'N','Y',1000010,'N','LAR','IsUseDocumentType',100,0,TO_TIMESTAMP('2025-03-31 10:24:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2025-03-31 10:24:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/03/2025 10:24:10 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009398 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/03/2025 10:24:11 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009399,1,'Y','N','N',3005813,'N','Y',1000010,'N','LAR','IsUseShipmentRegion',100,0,TO_TIMESTAMP('2025-03-31 10:24:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2025-03-31 10:24:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/03/2025 10:24:11 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009399 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;


-- 31/03/2025 10:28:27 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3009398
;

-- 31/03/2025 10:28:27 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas configuraciones
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3009399
;

-- Registración de script
SELECT register_migration_script_lar('0229_ISSUE-169.sql', 'LAR', '')
;
