ALTER TABLE C_BankAccount_Acct
    ADD COLUMN IsPosteable character(1) NOT NULL DEFAULT 'Y'::bpchar;

ALTER TABLE C_BankAccount_Acct
    ADD CONSTRAINT c_bankaccount_acct_isposteable_check CHECK (IsPosteable = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]));

-- 24/01/2026 9:13:17 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001532,'isposteable','LAR','isposteable','isposteable',0,TO_TIMESTAMP('2026-01-24 09:13:16','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-01-24 09:13:16','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 24/01/2026 9:13:17 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001532 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 24/01/2026 9:13:17 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005951,391,'LAR',0,'Y','N','N','N',1,'N',20,'N',3001532,'N','Y','N','isposteable','isposteable',100,TO_TIMESTAMP('2026-01-24 09:13:16','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2026-01-24 09:13:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/01/2026 9:13:17 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005951 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/01/2026 9:14:26 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009473,1,'Y','N','N',3005951,'N','Y',327,'N','LAR','isposteable',100,0,TO_TIMESTAMP('2026-01-24 09:14:26','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2026-01-24 09:14:26','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/01/2026 9:14:26 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009473 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 24/01/2026 9:15:11 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Element SET ColumnName='IsPosteable', Name='IsPosteable', PrintName='IsPosteable',Updated=TO_TIMESTAMP('2026-01-24 09:15:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001532
;

-- 24/01/2026 9:15:11 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001532
;

-- 24/01/2026 9:15:11 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Column SET ColumnName='IsPosteable', Name='IsPosteable', Description=NULL, Help=NULL WHERE AD_Element_ID=3001532
;

-- 24/01/2026 9:15:11 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Process_Para SET ColumnName='IsPosteable', Name='IsPosteable', Description=NULL, Help=NULL, AD_Element_ID=3001532 WHERE UPPER(ColumnName)='ISPOSTEABLE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 24/01/2026 9:15:11 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Process_Para SET ColumnName='IsPosteable', Name='IsPosteable', Description=NULL, Help=NULL WHERE AD_Element_ID=3001532 AND IsCentrallyMaintained='Y'
;

-- 24/01/2026 9:15:11 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Field SET Name='IsPosteable', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001532) AND IsCentrallyMaintained='Y'
;

-- 24/01/2026 9:15:11 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_PrintFormatItem SET PrintName='IsPosteable', Name='IsPosteable' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001532)
;

-- 24/01/2026 9:15:21 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Contabiliza',PrintName='Contabiliza',Updated=TO_TIMESTAMP('2026-01-24 09:15:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001532 AND AD_Language='es_AR'
;

-- Registración de script
SELECT register_migration_script_lar('0244_ISSUE-174.sql', 'LAR', '')
;
