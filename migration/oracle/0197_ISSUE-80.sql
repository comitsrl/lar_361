ALTER TABLE C_BankAccount ADD COLUMN Concilia_Mov_Bancarios character(1) NOT NULL DEFAULT 'Y'::bpchar;

-- 04/10/2021 17:39:48 ART
-- ISSUE #80: Marca concilia mov. bancarios en cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001202,'concilia_mov_bancarios','LAR','concilia_mov_bancarios','concilia_mov_bancarios',0,TO_DATE('2021-10-04 17:39:47','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-10-04 17:39:47','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 04/10/2021 17:39:48 ART
-- ISSUE #80: Marca concilia mov. bancarios en cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001202 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 04/10/2021 17:39:48 ART
-- ISSUE #80: Marca concilia mov. bancarios en cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004309,297,'LAR',0,'Y','N','N','N',1,'N',20,'N',3001202,'N','Y','N','concilia_mov_bancarios','concilia_mov_bancarios',TO_DATE('2021-10-04 17:39:46','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2021-10-04 17:39:46','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 04/10/2021 17:39:48 ART
-- ISSUE #80: Marca concilia mov. bancarios en cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004309 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 04/10/2021 17:40:43 ART
-- ISSUE #80: Marca concilia mov. bancarios en cajas.
UPDATE AD_Column SET Name='Concilia Mov. Bancarios en Cierre', ColumnName='Concilia_Mov_Bancarios',Updated=TO_DATE('2021-10-04 17:40:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004309
;

-- 04/10/2021 17:40:43 ART
-- ISSUE #80: Marca concilia mov. bancarios en cajas.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3004309
;

-- 04/10/2021 17:40:43 ART
-- ISSUE #80: Marca concilia mov. bancarios en cajas.
UPDATE AD_Field SET Name='Concilia Mov. Bancarios en Cierre', Description=NULL, Help=NULL WHERE AD_Column_ID=3004309 AND IsCentrallyMaintained='Y'
;

-- 04/10/2021 17:41:05 ART
-- ISSUE #80: Marca concilia mov. bancarios en cajas.
UPDATE AD_Element SET ColumnName='Concilia_Mov_Bancarios', Name='Concilia Mov. Bancarios en Cierre', PrintName='Concilia Mov. Bancarios en Cierre',Updated=TO_DATE('2021-10-04 17:41:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001202
;

-- 04/10/2021 17:41:05 ART
-- ISSUE #80: Marca concilia mov. bancarios en cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001202
;

-- 04/10/2021 17:41:05 ART
-- ISSUE #80: Marca concilia mov. bancarios en cajas.
UPDATE AD_Column SET ColumnName='Concilia_Mov_Bancarios', Name='Concilia Mov. Bancarios en Cierre', Description=NULL, Help=NULL WHERE AD_Element_ID=3001202
;

-- 04/10/2021 17:41:05 ART
-- ISSUE #80: Marca concilia mov. bancarios en cajas.
UPDATE AD_Process_Para SET ColumnName='Concilia_Mov_Bancarios', Name='Concilia Mov. Bancarios en Cierre', Description=NULL, Help=NULL, AD_Element_ID=3001202 WHERE UPPER(ColumnName)='CONCILIA_MOV_BANCARIOS' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 04/10/2021 17:41:05 ART
-- ISSUE #80: Marca concilia mov. bancarios en cajas.
UPDATE AD_Process_Para SET ColumnName='Concilia_Mov_Bancarios', Name='Concilia Mov. Bancarios en Cierre', Description=NULL, Help=NULL WHERE AD_Element_ID=3001202 AND IsCentrallyMaintained='Y'
;

-- 04/10/2021 17:41:05 ART
-- ISSUE #80: Marca concilia mov. bancarios en cajas.
UPDATE AD_Field SET Name='Concilia Mov. Bancarios en Cierre', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001202) AND IsCentrallyMaintained='Y'
;

-- 04/10/2021 17:41:05 ART
-- ISSUE #80: Marca concilia mov. bancarios en cajas.
UPDATE AD_PrintFormatItem pi SET PrintName='Concilia Mov. Bancarios en Cierre', Name='Concilia Mov. Bancarios en Cierre' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001202)
;

-- 04/10/2021 17:41:12 ART
-- ISSUE #80: Marca concilia mov. bancarios en cajas.
UPDATE AD_Element_Trl SET Name='Concilia Mov. Bancarios en Cierre',PrintName='Concilia Mov. Bancarios en Cierre',Updated=TO_DATE('2021-10-04 17:41:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001202 AND AD_Language='es_AR'
;

-- 04/10/2021 17:42:18 ART
-- ISSUE #80: Marca concilia mov. bancarios en cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,AD_Tab_ID,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007491,1,'Y','N','N',3004309,228,'N','Y','N','LAR','Concilia Mov. Bancarios en Cierre',100,0,TO_DATE('2021-10-04 17:42:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-10-04 17:42:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 04/10/2021 17:42:18 ART
-- ISSUE #80: Marca concilia mov. bancarios en cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007491 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/10/2021 17:43:11 ART
-- ISSUE #80: Marca concilia mov. bancarios en cajas.
UPDATE AD_Field SET DisplayLogic='@IsDrawer@=''Y''',Updated=TO_DATE('2021-10-04 17:43:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007491
;

-- Registración de script
SELECT register_migration_script_lar('0197_ISSUE-80.sql', 'LAR', '') FROM dual
;
