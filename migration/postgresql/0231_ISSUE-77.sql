ALTER TABLE LCO_TaxPayerType ADD COLUMN WSFECode numeric(2,0) DEFAULT NULL::numeric;

-- 10/04/2025 22:10:09 ART
-- ISSUE #77: Informar Cond. IVA del Cliente en FE
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005815,1000001,'LAR',0,'N','N','N','N',2,'N',22,'N',3000270,'N','Y','N','WSFECode','WSFECode',100,TO_TIMESTAMP('2025-04-10 22:10:08','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2025-04-10 22:10:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/04/2025 22:10:09 ART
-- ISSUE #77: Informar Cond. IVA del Cliente en FE
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005815 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 10/04/2025 22:10:38 ART
-- ISSUE #77: Informar Cond. IVA del Cliente en FE
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009401,2,'Y','N','N',3005815,'N','Y',1000006,'N','LAR','WSFECode',100,0,TO_TIMESTAMP('2025-04-10 22:10:37','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2025-04-10 22:10:37','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/04/2025 22:10:38 ART
-- ISSUE #77: Informar Cond. IVA del Cliente en FE
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009401 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/04/2025 22:11:12 ART
-- ISSUE #77: Informar Cond. IVA del Cliente en FE
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3009401
;

-- 10/04/2025 22:11:12 ART
-- ISSUE #77: Informar Cond. IVA del Cliente en FE
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=1000106
;

-- 10/04/2025 22:11:17 ART
-- ISSUE #77: Informar Cond. IVA del Cliente en FE
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3009401
;

-- 10/04/2025 22:11:17 ART
-- ISSUE #77: Informar Cond. IVA del Cliente en FE
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=1000105
;

-- Registración de script
SELECT register_migration_script_lar('0231_ISSUE-77.sql', 'LAR', '')
;
