-- 13/04/2021 12:04:41 ART
-- ISSUE #138: Ajustes en DA - Campos, Ventanas y Pestañas
UPDATE LCO_TaxIdType SET LCO_TaxCodeDian='80',Updated=TO_TIMESTAMP('2021-04-13 12:04:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LCO_TaxIdType_ID=1000000
;

-- 13/04/2021 12:04:56 ART
-- ISSUE #138: Ajustes en DA - Campos, Ventanas y Pestañas
UPDATE LCO_TaxIdType SET LCO_TaxCodeDian='96',Updated=TO_TIMESTAMP('2021-04-13 12:04:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LCO_TaxIdType_ID=1000001
;

-- 13/04/2021 12:06:54 ART
-- ISSUE #138: Ajustes en DA - Campos, Ventanas y Pestañas
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_TIMESTAMP('2021-04-13 12:06:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=1000115
;

-- 13/04/2021 12:07:13 ART
-- ISSUE #138: Ajustes en DA - Campos, Ventanas y Pestañas
UPDATE AD_Field_Trl SET Name='Código WSFE',Updated=TO_TIMESTAMP('2021-04-13 12:07:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=1000115 AND AD_Language='es_AR'
;

-- Se agrega código WSFE a la Unidad de Medida
ALTER TABLE C_UOM
ADD COLUMN wsfecode character(2);

-- 13/04/2021 21:20:05 ART
-- ISSUE #138: Ajustes en DA - Campos, Ventanas y Pestañas
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003691,146,'LAR',0,'N','N','N','N',2,'N',17,'N',3000270,'N','Y','N','WSFECode','WSFECode',TO_TIMESTAMP('2021-04-13 21:20:04','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2021-04-13 21:20:04','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 13/04/2021 21:20:05 ART
-- ISSUE #138: Ajustes en DA - Campos, Ventanas y Pestañas
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003691 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 13/04/2021 21:20:24 ART
-- ISSUE #138: Ajustes en DA - Campos, Ventanas y Pestañas
UPDATE AD_Element_Trl SET IsTranslated='Y',Updated=TO_TIMESTAMP('2021-04-13 21:20:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000270 AND AD_Language='es_AR'
;

-- 13/04/2021 21:20:37 ART
-- ISSUE #138: Ajustes en DA - Campos, Ventanas y Pestañas
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007001,2,'Y','N','N',3003691,'N','Y',133,'N','LAR','WSFECode',100,0,'Y',TO_TIMESTAMP('2021-04-13 21:20:37','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2021-04-13 21:20:37','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 13/04/2021 21:20:37 ART
-- ISSUE #138: Ajustes en DA - Campos, Ventanas y Pestañas
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007001 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 13/04/2021 22:36:07 ART
-- ISSUE #138: Ajustes en DA - Campos, Ventanas y Pestañas
UPDATE AD_Column SET AD_Reference_ID=10,Updated=TO_TIMESTAMP('2021-04-13 22:36:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003691
;

-- Registración de script
SELECT register_migration_script_lar('0168_ISSUE-138.sql', 'LAR', '')
;
