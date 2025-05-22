ALTER TABLE AD_Org
ADD COLUMN LAR_CodigoCentroEmisor character varying(4);

-- 26/04/2025 13:23:10 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas config
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001507,'lar_codigocentroemisor','LAR','lar_codigocentroemisor','lar_codigocentroemisor',0,TO_TIMESTAMP('2025-04-26 13:23:09','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2025-04-26 13:23:09','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 26/04/2025 13:23:10 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas config
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001507 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 26/04/2025 13:23:10 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas config
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005816,155,'LAR',0,'N','N','N','N',4,'N',10,'N',3001507,'N','Y','N','lar_codigocentroemisor','lar_codigocentroemisor',100,TO_TIMESTAMP('2025-04-26 13:23:09','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2025-04-26 13:23:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/04/2025 13:23:10 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas config
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005816 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 26/04/2025 13:23:57 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas config
UPDATE AD_Element SET ColumnName='LAR_CodigoCentroEmisor', Name='LAR_CodigoCentroEmisor', PrintName='LAR_CodigoCentroEmisor',Updated=TO_TIMESTAMP('2025-04-26 13:23:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001507
;

-- 26/04/2025 13:23:57 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas config
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001507
;

-- 26/04/2025 13:23:57 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas config
UPDATE AD_Column SET ColumnName='LAR_CodigoCentroEmisor', Name='LAR_CodigoCentroEmisor', Description=NULL, Help=NULL WHERE AD_Element_ID=3001507
;

-- 26/04/2025 13:23:57 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas config
UPDATE AD_Process_Para SET ColumnName='LAR_CodigoCentroEmisor', Name='LAR_CodigoCentroEmisor', Description=NULL, Help=NULL, AD_Element_ID=3001507 WHERE UPPER(ColumnName)='LAR_CODIGOCENTROEMISOR' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 26/04/2025 13:23:57 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas config
UPDATE AD_Process_Para SET ColumnName='LAR_CodigoCentroEmisor', Name='LAR_CodigoCentroEmisor', Description=NULL, Help=NULL WHERE AD_Element_ID=3001507 AND IsCentrallyMaintained='Y'
;

-- 26/04/2025 13:23:57 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas config
UPDATE AD_Field SET Name='LAR_CodigoCentroEmisor', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001507) AND IsCentrallyMaintained='Y'
;

-- 26/04/2025 13:23:57 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas config
UPDATE AD_PrintFormatItem SET PrintName='LAR_CodigoCentroEmisor', Name='LAR_CodigoCentroEmisor' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001507)
;

-- 26/04/2025 13:24:15 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas config
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Cóodigo Centro Emisor',PrintName='Cóodigo Centro Emisor',Updated=TO_TIMESTAMP('2025-04-26 13:24:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001507 AND AD_Language='es_AR'
;

-- 26/04/2025 13:24:23 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas config
UPDATE AD_Element_Trl SET Name='Código Centro Emisor',PrintName='Código Centro Emisor',Updated=TO_TIMESTAMP('2025-04-26 13:24:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001507 AND AD_Language='es_AR'
;

-- 26/04/2025 13:25:00 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas config
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009402,4,'Y','N','N',3005816,'N','Y',143,'N','LAR','LAR_CodigoCentroEmisor',100,0,TO_TIMESTAMP('2025-04-26 13:25:00','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2025-04-26 13:25:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/04/2025 13:25:00 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas config
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009402 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Registración de script
SELECT register_migration_script_lar('0233_ISSUE-169.sql', 'LAR', '') FROM dual
;
