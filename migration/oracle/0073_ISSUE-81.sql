ALTER TABLE LAR_WithHoldingCertificate ADD COLUMN Base numeric NOT NULL DEFAULT 0;
ALTER TABLE LAR_WithHoldingCertificate ADD COLUMN TotalImpuesto numeric NOT NULL DEFAULT 0;
ALTER TABLE LAR_WithHoldingCertificate ADD COLUMN Porcentaje numeric NOT NULL DEFAULT 0;

ALTER TABLE LAR_WithHoldingCertificate ADD COLUMN C_BPartner_ID numeric(10,0) NOT NULL;
ALTER TABLE LAR_WithHoldingCertificate ADD COLUMN City character varying(60);
ALTER TABLE LAR_WithHoldingCertificate ADD COLUMN C_Location_ID numeric(10,0);
ALTER TABLE LAR_WithHoldingCertificate ADD COLUMN Postal character varying(10);
ALTER TABLE LAR_WithHoldingCertificate ADD COLUMN RegionName character varying(40);
ALTER TABLE LAR_WithHoldingCertificate ADD COLUMN TaxID character varying(20);
ALTER TABLE LAR_WithHoldingCertificate ADD COLUMN Duns character(11);

-- 07/07/2016 18:00:47 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3000081
;

-- 07/07/2016 18:00:48 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE FROM AD_Field WHERE AD_Field_ID=3000081
;

-- 07/07/2016 18:00:55 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3000078
;

-- 07/07/2016 18:00:55 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE FROM AD_Field WHERE AD_Field_ID=3000078
;

-- 07/07/2016 18:01:07 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3000066
;

-- 07/07/2016 18:01:07 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE FROM AD_Field WHERE AD_Field_ID=3000066
;

-- 07/07/2016 18:02:04 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE  FROM  AD_Column_Trl WHERE AD_Column_ID=3000108
;

-- 07/07/2016 18:02:04 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE FROM AD_Column WHERE AD_Column_ID=3000108
;

-- 07/07/2016 18:02:15 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE  FROM  AD_Column_Trl WHERE AD_Column_ID=3000114
;

-- 07/07/2016 18:02:15 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE FROM AD_Column WHERE AD_Column_ID=3000114
;

-- 07/07/2016 18:02:20 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE  FROM  AD_Column_Trl WHERE AD_Column_ID=3000117
;

-- 07/07/2016 18:02:20 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE FROM AD_Column WHERE AD_Column_ID=3000117
;

-- 07/07/2016 18:22:57 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001786,3000005,'LAR',0,'Y','N','N','N',131089,'N',22,'N',2818,'N','Y','N','Calculation Base','Base','Base',100,TO_DATE('2016-07-07 18:22:56','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-07-07 18:22:56','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 07/07/2016 18:22:57 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001786 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 07/07/2016 18:22:57 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000347,'totalimpuesto','LAR','totalimpuesto','totalimpuesto',0,TO_DATE('2016-07-07 18:22:57','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-07-07 18:22:57','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 07/07/2016 18:22:57 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000347 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 07/07/2016 18:22:57 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001787,3000005,'LAR',0,'Y','N','N','N',131089,'N',22,'N',3000347,'N','Y','N','totalimpuesto','totalimpuesto',100,TO_DATE('2016-07-07 18:22:57','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-07-07 18:22:57','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 07/07/2016 18:22:57 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001787 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 07/07/2016 18:22:57 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000348,'porcentaje','LAR','porcentaje','porcentaje',0,TO_DATE('2016-07-07 18:22:57','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-07-07 18:22:57','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 07/07/2016 18:22:57 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000348 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 07/07/2016 18:22:57 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001788,3000005,'LAR',0,'Y','N','N','N',131089,'N',22,'N',3000348,'N','Y','N','porcentaje','porcentaje',100,TO_DATE('2016-07-07 18:22:57','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-07-07 18:22:57','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 07/07/2016 18:22:57 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001788 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 07/07/2016 18:24:29 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Column SET AD_Reference_ID=12, Name='Porcentaje', ColumnName='Porcentaje',Updated=TO_DATE('2016-07-07 18:24:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001788
;

-- 07/07/2016 18:24:29 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001788
;

-- 07/07/2016 18:24:29 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Field SET Name='Porcentaje', Description=NULL, Help=NULL WHERE AD_Column_ID=3001788 AND IsCentrallyMaintained='Y'
;

-- 07/07/2016 18:24:35 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Column_Trl SET Name='Porcentaje',Updated=TO_DATE('2016-07-07 18:24:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001788 AND AD_Language='es_AR'
;

-- 07/07/2016 18:24:45 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Element SET ColumnName='Porcentaje', Name='Porcentaje', PrintName='Porcentaje',Updated=TO_DATE('2016-07-07 18:24:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000348
;

-- 07/07/2016 18:24:45 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000348
;

-- 07/07/2016 18:24:45 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Column SET ColumnName='Porcentaje', Name='Porcentaje', Description=NULL, Help=NULL WHERE AD_Element_ID=3000348
;

-- 07/07/2016 18:24:45 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Process_Para SET ColumnName='Porcentaje', Name='Porcentaje', Description=NULL, Help=NULL, AD_Element_ID=3000348 WHERE UPPER(ColumnName)='PORCENTAJE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 07/07/2016 18:24:45 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Process_Para SET ColumnName='Porcentaje', Name='Porcentaje', Description=NULL, Help=NULL WHERE AD_Element_ID=3000348 AND IsCentrallyMaintained='Y'
;

-- 07/07/2016 18:24:45 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Field SET Name='Porcentaje', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000348) AND IsCentrallyMaintained='Y'
;

-- 07/07/2016 18:24:45 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_PrintFormatItem pi SET PrintName='Porcentaje', Name='Porcentaje' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000348)
;

-- 07/07/2016 18:24:49 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Element_Trl SET Name='Porcentaje',PrintName='Porcentaje',Updated=TO_DATE('2016-07-07 18:24:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000348 AND AD_Language='es_AR'
;

-- 07/07/2016 18:25:38 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002689,131089,'Y','N','N',3001786,'N','Y',3000004,'N','LAR','Calculation Base','Base',100,0,'Y',TO_DATE('2016-07-07 18:25:38','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-07-07 18:25:38','YYYY-MM-DD HH24:MI:SS'))
;

-- 07/07/2016 18:25:38 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002689 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 07/07/2016 18:25:38 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002690,131089,'Y','N','N',3001788,'N','Y',3000004,'N','LAR','Porcentaje',100,0,'Y',TO_DATE('2016-07-07 18:25:38','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-07-07 18:25:38','YYYY-MM-DD HH24:MI:SS'))
;

-- 07/07/2016 18:25:38 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002690 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 07/07/2016 18:25:38 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002691,131089,'Y','N','N',3001787,'N','Y',3000004,'N','LAR','totalimpuesto',100,0,'Y',TO_DATE('2016-07-07 18:25:38','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-07-07 18:25:38','YYYY-MM-DD HH24:MI:SS'))
;

-- 07/07/2016 18:25:38 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002691 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 07/07/2016 18:25:54 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3002691
;

-- 07/07/2016 18:25:54 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE FROM AD_Field WHERE AD_Field_ID=3002691
;

-- 07/07/2016 18:26:38 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Column SET AD_Reference_ID=12, Name='Total del Impuesto', ColumnName='TotalImpuesto',Updated=TO_DATE('2016-07-07 18:26:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001787
;

-- 07/07/2016 18:26:38 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001787
;

-- 07/07/2016 18:26:38 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Field SET Name='Total del Impuesto', Description=NULL, Help=NULL WHERE AD_Column_ID=3001787 AND IsCentrallyMaintained='Y'
;

-- 07/07/2016 18:26:44 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Column_Trl SET Name='Total del Impuesto',Updated=TO_DATE('2016-07-07 18:26:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001787 AND AD_Language='es_AR'
;

-- 07/07/2016 18:27:03 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Element SET ColumnName='TotalImpuesto', Name='Total del Impuesto', PrintName='Total del Impuesto',Updated=TO_DATE('2016-07-07 18:27:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000347
;

-- 07/07/2016 18:27:03 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000347
;

-- 07/07/2016 18:27:03 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Column SET ColumnName='TotalImpuesto', Name='Total del Impuesto', Description=NULL, Help=NULL WHERE AD_Element_ID=3000347
;

-- 07/07/2016 18:27:03 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Process_Para SET ColumnName='TotalImpuesto', Name='Total del Impuesto', Description=NULL, Help=NULL, AD_Element_ID=3000347 WHERE UPPER(ColumnName)='TOTALIMPUESTO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 07/07/2016 18:27:03 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Process_Para SET ColumnName='TotalImpuesto', Name='Total del Impuesto', Description=NULL, Help=NULL WHERE AD_Element_ID=3000347 AND IsCentrallyMaintained='Y'
;

-- 07/07/2016 18:27:03 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Field SET Name='Total del Impuesto', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000347) AND IsCentrallyMaintained='Y'
;

-- 07/07/2016 18:27:03 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_PrintFormatItem pi SET PrintName='Total del Impuesto', Name='Total del Impuesto' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000347)
;

-- 07/07/2016 18:27:09 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Element_Trl SET Name='Total del Impuesto',PrintName='Total del Impuesto',Updated=TO_DATE('2016-07-07 18:27:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000347 AND AD_Language='es_AR'
;

-- 07/07/2016 18:27:21 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002692,131089,'Y','N','N',3001787,'N','Y',3000004,'N','LAR','Total del Impuesto',100,0,'Y',TO_DATE('2016-07-07 18:27:21','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-07-07 18:27:21','YYYY-MM-DD HH24:MI:SS'))
;

-- 07/07/2016 18:27:21 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002692 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 07/07/2016 18:27:51 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_DATE('2016-07-07 18:27:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002689
;

-- 07/07/2016 18:27:54 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_DATE('2016-07-07 18:27:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002692
;

-- 07/07/2016 18:28:03 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_DATE('2016-07-07 18:28:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002690
;

-- 07/07/2016 18:28:07 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2016-07-07 18:28:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002692
;

-- 07/07/2016 18:28:18 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Field SET SeqNo=170,Updated=TO_DATE('2016-07-07 18:28:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002689
;

-- 07/07/2016 18:28:22 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Field SET SeqNo=180,Updated=TO_DATE('2016-07-07 18:28:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002692
;

-- 07/07/2016 18:28:26 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Field SET SeqNo=190,Updated=TO_DATE('2016-07-07 18:28:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002690
;

-- 07/07/2016 19:12:13 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Tab_Trl SET Name='Certificado de Retención',Updated=TO_DATE('2016-07-07 19:12:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000004 AND AD_Language='es_AR'
;

-- 11/07/2016 19:54:15 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3000067
;

-- 11/07/2016 19:54:15 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE FROM AD_Field WHERE AD_Field_ID=3000067
;

-- 11/07/2016 19:54:38 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3000065
;

-- 11/07/2016 19:54:38 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE FROM AD_Field WHERE AD_Field_ID=3000065
;

-- 11/07/2016 19:54:50 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3000075
;

-- 11/07/2016 19:54:50 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE FROM AD_Field WHERE AD_Field_ID=3000075
;

-- 11/07/2016 19:54:54 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3000082
;

-- 11/07/2016 19:54:54 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE FROM AD_Field WHERE AD_Field_ID=3000082
;

-- 11/07/2016 19:55:01 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3000079
;

-- 11/07/2016 19:55:01 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE FROM AD_Field WHERE AD_Field_ID=3000079
;

-- 11/07/2016 19:55:11 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3000083
;

-- 11/07/2016 19:55:11 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE FROM AD_Field WHERE AD_Field_ID=3000083
;

-- 11/07/2016 19:56:05 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE  FROM  AD_Column_Trl WHERE AD_Column_ID=3000109
;

-- 11/07/2016 19:56:05 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE FROM AD_Column WHERE AD_Column_ID=3000109
;

-- 11/07/2016 19:56:08 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE  FROM  AD_Column_Trl WHERE AD_Column_ID=3000110
;

-- 11/07/2016 19:56:08 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE FROM AD_Column WHERE AD_Column_ID=3000110
;

-- 11/07/2016 19:56:20 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE  FROM  AD_Column_Trl WHERE AD_Column_ID=3000113
;

-- 11/07/2016 19:56:20 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE FROM AD_Column WHERE AD_Column_ID=3000113
;

-- 11/07/2016 19:56:23 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE  FROM  AD_Column_Trl WHERE AD_Column_ID=3000115
;

-- 11/07/2016 19:56:23 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE FROM AD_Column WHERE AD_Column_ID=3000115
;

-- 11/07/2016 19:56:26 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE  FROM  AD_Column_Trl WHERE AD_Column_ID=3000116
;

-- 11/07/2016 19:56:26 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE FROM AD_Column WHERE AD_Column_ID=3000116
;

-- 11/07/2016 19:56:29 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE  FROM  AD_Column_Trl WHERE AD_Column_ID=3000118
;

-- 11/07/2016 19:56:29 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE FROM AD_Column WHERE AD_Column_ID=3000118
;

-- 11/07/2016 19:57:00 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001789,3000005,'LAR',0,'Y','N','N','A Business Partner is anyone with whom you transact.  This can include Vendor, Customer, Employee or Salesperson','N',10,'N',19,'N',187,'N','Y','N','Identifies a Business Partner','Business Partner ','C_BPartner_ID',100,TO_DATE('2016-07-11 19:57:00','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-07-11 19:57:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/07/2016 19:57:00 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001789 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/07/2016 19:57:01 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001790,3000005,'LAR',0,'N','N','N','The City identifies a unique City for this Country or Region.','N',60,'N',10,'N',225,'N','Y','N','Identifies a City','City','City',100,TO_DATE('2016-07-11 19:57:00','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-07-11 19:57:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/07/2016 19:57:01 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001790 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/07/2016 19:57:01 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001791,3000005,'LAR',0,'N','N','N','The Location / Address field defines the location of an entity.','N',10,'N',21,'N',202,'N','Y','N','Location or Address','Address','C_Location_ID',100,TO_DATE('2016-07-11 19:57:01','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-07-11 19:57:01','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/07/2016 19:57:01 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001791 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/07/2016 19:57:01 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001792,3000005,'LAR',0,'N','N','N','The Postal Code or ZIP identifies the postal code for this entity''s address.','N',10,'N',10,'N',512,'N','Y','N','Postal code','ZIP','Postal',100,TO_DATE('2016-07-11 19:57:01','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-07-11 19:57:01','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/07/2016 19:57:01 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001792 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/07/2016 19:57:01 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001793,3000005,'LAR',0,'N','N','N','The Region Name defines the name that will print when this region is used in a document.','N',40,'Y',10,'N',541,'N','Y','N','Name of the Region','Region','RegionName',100,TO_DATE('2016-07-11 19:57:01','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-07-11 19:57:01','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/07/2016 19:57:01 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001793 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/07/2016 19:57:01 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001794,3000005,'LAR',0,'N','N','N','The Tax ID field identifies the legal Identification number of this Entity.','N',20,'N',10,'N',590,'N','Y','N','Tax Identification','Tax ID','TaxID',100,TO_DATE('2016-07-11 19:57:01','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-07-11 19:57:01','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/07/2016 19:57:01 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001794 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/07/2016 19:57:28 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002693,10,'Y','N','N',3001791,'N','Y',3000004,'N','The Location / Address field defines the location of an entity.','LAR','Location or Address','Address',100,0,'Y',TO_DATE('2016-07-11 19:57:28','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-07-11 19:57:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/07/2016 19:57:28 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002693 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/07/2016 19:57:29 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002694,10,'Y','N','N',3001789,'N','Y',3000004,'N','A Business Partner is anyone with whom you transact.  This can include Vendor, Customer, Employee or Salesperson','LAR','Identifies a Business Partner','Business Partner ',100,0,'Y',TO_DATE('2016-07-11 19:57:28','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-07-11 19:57:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/07/2016 19:57:29 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002694 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/07/2016 19:57:29 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002695,60,'Y','N','N',3001790,'N','Y',3000004,'N','The City identifies a unique City for this Country or Region.','LAR','Identifies a City','City',100,0,'Y',TO_DATE('2016-07-11 19:57:29','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-07-11 19:57:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/07/2016 19:57:29 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002695 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/07/2016 19:57:29 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002696,40,'Y','N','N',3001793,'N','Y',3000004,'N','The Region Name defines the name that will print when this region is used in a document.','LAR','Name of the Region','Region',100,0,'Y',TO_DATE('2016-07-11 19:57:29','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-07-11 19:57:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/07/2016 19:57:29 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002696 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/07/2016 19:57:29 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002697,20,'Y','N','N',3001794,'N','Y',3000004,'N','The Tax ID field identifies the legal Identification number of this Entity.','LAR','Tax Identification','Tax ID',100,0,'Y',TO_DATE('2016-07-11 19:57:29','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-07-11 19:57:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/07/2016 19:57:29 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002697 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/07/2016 19:57:29 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002698,10,'Y','N','N',3001792,'N','Y',3000004,'N','The Postal Code or ZIP identifies the postal code for this entity''s address.','LAR','Postal code','ZIP',100,0,'Y',TO_DATE('2016-07-11 19:57:29','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-07-11 19:57:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/07/2016 19:57:29 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002698 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/07/2016 19:59:20 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3002694
;

-- 11/07/2016 19:59:20 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3002697
;

-- 11/07/2016 19:59:20 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3002693
;

-- 11/07/2016 19:59:20 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3002695
;

-- 11/07/2016 19:59:20 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3002698
;

-- 11/07/2016 19:59:20 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3002696
;

-- 11/07/2016 20:00:28 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2016-07-11 20:00:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002698
;

-- 11/07/2016 20:04:26 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3000072
;

-- 11/07/2016 20:04:26 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE FROM AD_Field WHERE AD_Field_ID=3000072
;

-- 11/07/2016 20:04:33 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE  FROM  AD_Column_Trl WHERE AD_Column_ID=3000112
;

-- 11/07/2016 20:04:33 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
DELETE FROM AD_Column WHERE AD_Column_ID=3000112
;

-- 11/07/2016 20:04:39 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001795,3000005,'LAR',0,'N','N','N','Used for EDI - For details see   www.dnb.com/dunsno/list.htm','N',11,'N',10,'N',260,'N','Y','N','Dun & Bradstreet Number','D-U-N-S','DUNS',100,TO_DATE('2016-07-11 20:04:39','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-07-11 20:04:39','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/07/2016 20:04:39 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001795 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/07/2016 20:04:52 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002699,11,'Y','N','N',3001795,'N','Y',3000004,'N','Used for EDI - For details see   www.dnb.com/dunsno/list.htm','LAR','Dun & Bradstreet Number','D-U-N-S',100,0,'Y',TO_DATE('2016-07-11 20:04:52','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-07-11 20:04:52','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/07/2016 20:04:52 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002699 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/07/2016 20:05:34 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3002699
;

-- 11/07/2016 20:07:11 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2016-07-11 20:07:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002699
;

-- 11/07/2016 20:08:52 ART
-- ISSUE #81: Aplicar regimen de Retenciones.
UPDATE AD_Column SET IsIdentifier='Y',Updated=TO_DATE('2016-07-11 20:08:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001789
;

-- Registración de script
SELECT register_migration_script_lar('0073_ISSUE-81.sql', 'LAR', '') FROM dual
;
