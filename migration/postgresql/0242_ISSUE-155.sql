ALTER TABLE AD_Role
ADD COLUMN IgnoraLimiteAdelantos character(1) NOT NULL DEFAULT 'N'::bpchar;

-- 31/10/2025 14:29:04 ART
-- ISSUE #155: Lote Pago de Sueldos
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001521,'ignoralimiteadelantos','LAR','ignoralimiteadelantos','ignoralimiteadelantos',0,TO_TIMESTAMP('2025-10-31 14:29:03','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2025-10-31 14:29:03','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 31/10/2025 14:29:04 ART
-- ISSUE #155: Lote Pago de Sueldos
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001521 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 31/10/2025 14:29:04 ART
-- ISSUE #155: Lote Pago de Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005919,156,'LAR',0,'Y','N','N','N',1,'N',20,'N',3001521,'N','Y','N','ignoralimiteadelantos','ignoralimiteadelantos',100,TO_TIMESTAMP('2025-10-31 14:29:03','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2025-10-31 14:29:03','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2025 14:29:04 ART
-- ISSUE #155: Lote Pago de Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005919 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2025 14:29:36 ART
-- ISSUE #155: Lote Pago de Sueldos
UPDATE AD_Element SET ColumnName='IgnoraLimiteAdelantos', Name='IgnoraLimiteAdelantos', PrintName='IgnoraLimiteAdelantos',Updated=TO_TIMESTAMP('2025-10-31 14:29:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001521
;

-- 31/10/2025 14:29:36 ART
-- ISSUE #155: Lote Pago de Sueldos
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001521
;

-- 31/10/2025 14:29:36 ART
-- ISSUE #155: Lote Pago de Sueldos
UPDATE AD_Column SET ColumnName='IgnoraLimiteAdelantos', Name='IgnoraLimiteAdelantos', Description=NULL, Help=NULL WHERE AD_Element_ID=3001521
;

-- 31/10/2025 14:29:36 ART
-- ISSUE #155: Lote Pago de Sueldos
UPDATE AD_Process_Para SET ColumnName='IgnoraLimiteAdelantos', Name='IgnoraLimiteAdelantos', Description=NULL, Help=NULL, AD_Element_ID=3001521 WHERE UPPER(ColumnName)='IGNORALIMITEADELANTOS' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 31/10/2025 14:29:36 ART
-- ISSUE #155: Lote Pago de Sueldos
UPDATE AD_Process_Para SET ColumnName='IgnoraLimiteAdelantos', Name='IgnoraLimiteAdelantos', Description=NULL, Help=NULL WHERE AD_Element_ID=3001521 AND IsCentrallyMaintained='Y'
;

-- 31/10/2025 14:29:36 ART
-- ISSUE #155: Lote Pago de Sueldos
UPDATE AD_Field SET Name='IgnoraLimiteAdelantos', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001521) AND IsCentrallyMaintained='Y'
;

-- 31/10/2025 14:29:36 ART
-- ISSUE #155: Lote Pago de Sueldos
UPDATE AD_PrintFormatItem SET PrintName='IgnoraLimiteAdelantos', Name='IgnoraLimiteAdelantos' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001521)
;

-- 31/10/2025 14:29:59 ART
-- ISSUE #155: Lote Pago de Sueldos
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Ignora Límite Adelantos',PrintName='Ignora Límite Adelantos',Updated=TO_TIMESTAMP('2025-10-31 14:29:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001521 AND AD_Language='es_AR'
;

-- 31/10/2025 14:36:10 ART
-- ISSUE #155: Lote Pago de Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009453,1,'Y','N','N',3005919,'N','Y',119,'N','LAR','IgnoraLimiteAdelantos',100,0,TO_TIMESTAMP('2025-10-31 14:36:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2025-10-31 14:36:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2025 14:36:10 ART
-- ISSUE #155: Lote Pago de Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009453 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/10/2025 14:36:10 ART
-- ISSUE #155: Lote Pago de Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009454,1,'Y','N','N',52114,'N','Y',119,'N','D','IsDiscountAllowedOnTotal',100,0,TO_TIMESTAMP('2025-10-31 14:36:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2025-10-31 14:36:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2025 14:36:10 ART
-- ISSUE #155: Lote Pago de Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009454 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/10/2025 14:36:11 ART
-- ISSUE #155: Lote Pago de Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009455,1,'Y','N','N',52113,'N','Y',119,'N','D','IsDiscountUptoLimitPrice',100,0,TO_TIMESTAMP('2025-10-31 14:36:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2025-10-31 14:36:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2025 14:36:11 ART
-- ISSUE #155: Lote Pago de Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009455 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/10/2025 19:38:53 ART
-- ISSUE #155: Lote Pago de Sueldos
UPDATE AD_Column SET DefaultValue='@#AD_Org_ID@', IsAllowCopy='N',Updated=TO_TIMESTAMP('2025-10-31 19:38:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005859
;

-- 31/10/2025 19:56:18 ART
-- ISSUE #155: Lote Pago de Sueldos
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,AD_Client_ID,AD_Org_ID,Created,Updated,CreatedBy,UpdatedBy,IsActive) VALUES (3000090,'LAR','C','','IDs de los SdNs (empleados) excluidos de la recuperación de sueldos por lote (Valores separados por coma).','LAR_SdNsExcluidosRRHH',1000000,0,TO_TIMESTAMP('2025-10-31 19:56:17','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2025-10-31 19:56:17','YYYY-MM-DD HH24:MI:SS'),100,100,'Y')
;

-- 11/11/2025 9:24:26 ART
-- ISSUE #155: Lote Pago de Sueldos
UPDATE AD_Column SET AD_Val_Rule_ID=52033,Updated=TO_TIMESTAMP('2025-11-11 09:24:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=4021
;

-- Registración de script
SELECT register_migration_script_lar('0242_ISSUE-155.sql', 'LAR', '') FROM dual
;
