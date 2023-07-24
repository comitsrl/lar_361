ALTER TABLE C_UserRemuneration
ADD COLUMN TotalRAmt numeric NOT NULL DEFAULT 0
;

-- 15/07/2023 14:19:54 ART
-- ISSUE #155: RRHH
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,AD_Client_ID,AD_Org_ID,Created,Updated,CreatedBy,UpdatedBy,IsActive) VALUES (3000083,'LAR','C','4000003','C_Remuneration_ID de DiffSAC','LAR_DiffSAC_C_Remuneration_ID',1000000,0,TO_TIMESTAMP('2023-07-15 14:19:53','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2023-07-15 14:19:53','YYYY-MM-DD HH24:MI:SS'),100,100,'Y')
;

-- 15/07/2023 14:20:56 ART
-- ISSUE #155: RRHH
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,AD_Client_ID,AD_Org_ID,Created,Updated,CreatedBy,UpdatedBy,IsActive) VALUES (3000084,'LAR','C','4000002','C_Remuneration_ID de Diferencia Sueldo','LAR_Diff_C_Remuneration_ID',1000000,0,TO_TIMESTAMP('2023-07-15 14:20:56','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2023-07-15 14:20:56','YYYY-MM-DD HH24:MI:SS'),100,100,'Y')
;

-- 15/07/2023 14:38:53 ART
-- ISSUE #155: RRHH
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001396,'totalramt','LAR','totalramt','totalramt',0,TO_TIMESTAMP('2023-07-15 14:38:53','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2023-07-15 14:38:53','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 15/07/2023 14:38:53 ART
-- ISSUE #155: RRHH
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001396 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 15/07/2023 14:38:53 ART
-- ISSUE #155: RRHH
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005578,794,'LAR',0,'Y','N','N','N',14,'N',12,'N',3001396,'N','Y','N','totalramt','totalramt',100,TO_TIMESTAMP('2023-07-15 14:38:53','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-07-15 14:38:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/07/2023 14:38:53 ART
-- ISSUE #155: RRHH
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005578 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/07/2023 14:39:17 ART
-- ISSUE #155: RRHH
UPDATE AD_Element SET ColumnName='TotalRAmt', Name='TotalRAmt',Updated=TO_TIMESTAMP('2023-07-15 14:39:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001396
;

-- 15/07/2023 14:39:17 ART
-- ISSUE #155: RRHH
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001396
;

-- 15/07/2023 14:39:17 ART
-- ISSUE #155: RRHH
UPDATE AD_Column SET ColumnName='TotalRAmt', Name='TotalRAmt', Description=NULL, Help=NULL WHERE AD_Element_ID=3001396
;

-- 15/07/2023 14:39:17 ART
-- ISSUE #155: RRHH
UPDATE AD_Process_Para SET ColumnName='TotalRAmt', Name='TotalRAmt', Description=NULL, Help=NULL, AD_Element_ID=3001396 WHERE UPPER(ColumnName)='TOTALRAMT' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 15/07/2023 14:39:17 ART
-- ISSUE #155: RRHH
UPDATE AD_Process_Para SET ColumnName='TotalRAmt', Name='TotalRAmt', Description=NULL, Help=NULL WHERE AD_Element_ID=3001396 AND IsCentrallyMaintained='Y'
;

-- 15/07/2023 14:39:17 ART
-- ISSUE #155: RRHH
UPDATE AD_Field SET Name='TotalRAmt', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001396) AND IsCentrallyMaintained='Y'
;

-- 15/07/2023 14:39:17 ART
-- ISSUE #155: RRHH
UPDATE AD_PrintFormatItem SET PrintName='totalramt', Name='TotalRAmt' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001396)
;

-- 15/07/2023 14:39:31 ART
-- ISSUE #155: RRHH
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Remuneración Total',PrintName='Remuneración Total',Updated=TO_TIMESTAMP('2023-07-15 14:39:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001396 AND AD_Language='es_AR'
;

-- 15/07/2023 14:40:00 ART
-- ISSUE #155: RRHH
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008815,14,'Y','N','N',3005578,'N','Y',727,'N','LAR','TotalRAmt',100,0,TO_TIMESTAMP('2023-07-15 14:40:00','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-07-15 14:40:00','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/07/2023 14:40:00 ART
-- ISSUE #155: RRHH
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008815 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/07/2023 14:40:13 ART
-- ISSUE #155: RRHH
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3008815
;

-- 15/07/2023 14:40:13 ART
-- ISSUE #155: RRHH
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=11747
;

-- 15/07/2023 14:40:13 ART
-- ISSUE #155: RRHH
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=11738
;

-- 15/07/2023 14:40:13 ART
-- ISSUE #155: RRHH
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=11741
;

-- 15/07/2023 14:40:13 ART
-- ISSUE #155: RRHH
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=11748
;

-- 15/07/2023 14:40:13 ART
-- ISSUE #155: RRHH
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=11750
;

-- 15/07/2023 14:40:40 ART
-- ISSUE #155: RRHH
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=11747
;

-- 15/07/2023 14:40:40 ART
-- ISSUE #155: RRHH
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=11738
;

-- 15/07/2023 14:40:40 ART
-- ISSUE #155: RRHH
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=11741
;

-- 15/07/2023 14:40:40 ART
-- ISSUE #155: RRHH
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3008815
;

-- 15/07/2023 14:40:53 ART
-- ISSUE #155: RRHH
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2023-07-15 14:40:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008815
;

-- Registración de script
SELECT register_migration_script_lar('0221_ISSUE-155.sql', 'LAR', '')
;
