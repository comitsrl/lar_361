ALTER TABLE C_Country ADD COLUMN TaxID character varying(20);

-- 29/07/2021 22:09:39 ART
-- ISSUE #139: TaxID en ventana Pais.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004170,170,'LAR',0,'N','N','N','The Tax ID field identifies the legal Identification number of this Entity.','N',20,'N',10,'N',590,'N','Y','N','Tax Identification','Tax ID','TaxID',TO_DATE('2021-07-29 22:09:34','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2021-07-29 22:09:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 29/07/2021 22:09:39 ART
-- ISSUE #139: TaxID en ventana Pais.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004170 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 29/07/2021 22:11:37 ART
-- ISSUE #139: TaxID en ventana Pais.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007321,20,'Y','N','N',3004170,'N','Y',135,'N','The Tax ID field identifies the legal Identification number of this Entity.','LAR','Tax Identification','Tax ID',100,0,TO_DATE('2021-07-29 22:11:36','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-07-29 22:11:36','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 29/07/2021 22:11:37 ART
-- ISSUE #139: TaxID en ventana Pais.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007321 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Registración de script
SELECT register_migration_script_lar('0187_ISSUE-139.sql', 'LAR', '') FROM dual
;
