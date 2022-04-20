ALTER TABLE LAR_Fiscal_Printer_Type ADD COLUMN EsWebSocket character(1) NOT NULL DEFAULT 'N'::bpchar;

-- 20/04/2022 18:47:19 ART
-- ISSUE #157: Impresoras Fiscales de Segunda Generación.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001243,'eswebsocket','LAR','eswebsocket','eswebsocket',0,TO_TIMESTAMP('2022-04-20 18:47:18','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2022-04-20 18:47:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 20/04/2022 18:47:19 ART
-- ISSUE #157: Impresoras Fiscales de Segunda Generación.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, PO_Description,Help,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.PO_Description,t.Help,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001243 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 20/04/2022 18:47:19 ART
-- ISSUE #157: Impresoras Fiscales de Segunda Generación.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,IsMandatory,Version,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004456,3000000,'LAR','Y',0,'N','N','N',1,'N',20,'N',3001243,'N','Y','N','eswebsocket','eswebsocket',TO_TIMESTAMP('2022-04-20 18:47:18','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2022-04-20 18:47:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 20/04/2022 18:47:19 ART
-- ISSUE #157: Impresoras Fiscales de Segunda Generación.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004456 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 20/04/2022 18:47:54 ART
-- ISSUE #157: Impresoras Fiscales de Segunda Generación.
UPDATE AD_Column SET Name='Web Socket', ColumnName='EsWebSocket',Updated=TO_TIMESTAMP('2022-04-20 18:47:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004456
;

-- 20/04/2022 18:47:54 ART
-- ISSUE #157: Impresoras Fiscales de Segunda Generación.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3004456
;

-- 20/04/2022 18:47:54 ART
-- ISSUE #157: Impresoras Fiscales de Segunda Generación.
UPDATE AD_Field SET Name='Web Socket', Description=NULL, Help=NULL WHERE AD_Column_ID=3004456 AND IsCentrallyMaintained='Y'
;

-- 20/04/2022 18:47:59 ART
-- ISSUE #157: Impresoras Fiscales de Segunda Generación.
UPDATE AD_Column_Trl SET Name='Web Socket',Updated=TO_TIMESTAMP('2022-04-20 18:47:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004456 AND AD_Language='es_AR'
;

-- 20/04/2022 18:48:17 ART
-- ISSUE #157: Impresoras Fiscales de Segunda Generación.
UPDATE AD_Element SET ColumnName='EsWebSocket', Name='Web Socket', PrintName='Web Socket',Updated=TO_TIMESTAMP('2022-04-20 18:48:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001243
;

-- 20/04/2022 18:48:17 ART
-- ISSUE #157: Impresoras Fiscales de Segunda Generación.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001243
;

-- 20/04/2022 18:48:17 ART
-- ISSUE #157: Impresoras Fiscales de Segunda Generación.
UPDATE AD_Column SET ColumnName='EsWebSocket', Name='Web Socket', Description=NULL, Help=NULL WHERE AD_Element_ID=3001243
;

-- 20/04/2022 18:48:17 ART
-- ISSUE #157: Impresoras Fiscales de Segunda Generación.
UPDATE AD_Process_Para SET ColumnName='EsWebSocket', Name='Web Socket', Description=NULL, Help=NULL, AD_Element_ID=3001243 WHERE UPPER(ColumnName)='ESWEBSOCKET' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 20/04/2022 18:48:17 ART
-- ISSUE #157: Impresoras Fiscales de Segunda Generación.
UPDATE AD_Process_Para SET ColumnName='EsWebSocket', Name='Web Socket', Description=NULL, Help=NULL WHERE AD_Element_ID=3001243 AND IsCentrallyMaintained='Y'
;

-- 20/04/2022 18:48:17 ART
-- ISSUE #157: Impresoras Fiscales de Segunda Generación.
UPDATE AD_Field SET Name='Web Socket', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001243) AND IsCentrallyMaintained='Y'
;

-- 20/04/2022 18:48:18 ART
-- ISSUE #157: Impresoras Fiscales de Segunda Generación.
UPDATE AD_PrintFormatItem SET PrintName='Web Socket', Name='Web Socket' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001243)
;

-- 20/04/2022 18:48:24 ART
-- ISSUE #157: Impresoras Fiscales de Segunda Generación.
UPDATE AD_Element_Trl SET Name='Web Socket',PrintName='Web Socket',Updated=TO_TIMESTAMP('2022-04-20 18:48:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001243 AND AD_Language='es_AR'
;

-- 20/04/2022 18:49:47 ART
-- ISSUE #157: Impresoras Fiscales de Segunda Generación.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,AD_Tab_ID,IsCentrallyMaintained,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007772,1,'Y','N','N',3004456,'N',3000001,'Y','N','LAR','Web Socket',100,0,'Y',TO_TIMESTAMP('2022-04-20 18:49:47','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2022-04-20 18:49:47','YYYY-MM-DD HH24:MI:SS'))
;

-- 20/04/2022 18:49:47 ART
-- ISSUE #157: Impresoras Fiscales de Segunda Generación.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007772 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Registración de script
SELECT register_migration_script_lar('0209_ISSUE-157.sql', 'LAR', '')
;
