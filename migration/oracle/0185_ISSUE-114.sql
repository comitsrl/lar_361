ALTER TABLE M_PriceList ADD COLUMN C_ConversionType_ID numeric(10,0);
ALTER TABLE M_PriceList ADD CONSTRAINT cconersiontype_mpricelist FOREIGN KEY (C_ConversionType_ID)
      REFERENCES C_ConversionType (C_ConversionType_ID) MATCH SIMPLE;

-- 21/07/2021 18:25:24 ART
-- ISSUE #114: Tipo de Cambio en Lista Madre.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004152,255,'LAR',0,'N','N','N','The Currency Conversion Rate Type lets you define different type of rates, e.g. Spot, Corporate and/or Sell/Buy rates.','N',10,'N',19,'N',2278,'N','Y','N','Currency Conversion Rate Type','Currency Type','C_ConversionType_ID',100,TO_DATE('2021-07-21 18:25:23','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2021-07-21 18:25:23','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/07/2021 18:25:24 ART
-- ISSUE #114: Tipo de Cambio en Lista Madre.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004152 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/07/2021 18:28:22 ART
-- ISSUE #114: Tipo de Cambio en Lista Madre.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007254,10,'Y','N','N',3004152,'N','Y',191,'N','The Currency Conversion Rate Type lets you define different type of rates, e.g. Spot, Corporate and/or Sell/Buy rates.','LAR','Currency Conversion Rate Type','Currency Type',100,0,TO_DATE('2021-07-21 18:28:21','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-07-21 18:28:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/07/2021 18:28:22 ART
-- ISSUE #114: Tipo de Cambio en Lista Madre.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007254 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/07/2021 18:35:43 ART
-- ISSUE #114: Tipo de Cambio en Lista Madre.
UPDATE AD_Field SET DisplayLogic='@EsListaMadre@=''Y''',Updated=TO_DATE('2021-07-21 18:35:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007254
;

-- 20/07/2021 14:42:59 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Menu SET IsCentrallyMaintained='N',Updated=TO_TIMESTAMP('2021-07-20 14:42:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=418
;

-- 20/07/2021 14:43:15 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Menu_Trl SET Name='Tipo de Cambio',Updated=TO_TIMESTAMP('2021-07-20 14:43:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=418 AND AD_Language='es_AR'
;

-- 20/07/2021 14:43:50 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Window_Trl SET Name='Tipo de Cambio',Updated=TO_TIMESTAMP('2021-07-20 14:43:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Window_ID=295 AND AD_Language='es_AR'
;

-- 20/07/2021 14:47:56 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Element_Trl SET Name='Tipo de Cambio',PrintName='Tipo de Cambio',Updated=TO_TIMESTAMP('2021-07-20 14:47:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=2278 AND AD_Language='es_AR'
;

-- Registración de script
SELECT register_migration_script_lar('0185_ISSUE-114.sql', 'LAR', '') FROM dual
;
