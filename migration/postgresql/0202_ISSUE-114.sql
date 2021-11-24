ALTER TABLE C_Invoice ADD COLUMN TasaManual character(1) NOT NULL DEFAULT 'N'::bpchar;
ALTER TABLE C_Invoice ADD CONSTRAINT c_invoice_tasaManual_check CHECK (TasaManual = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]));
ALTER TABLE C_Order ADD COLUMN TasaManual character(1) NOT NULL DEFAULT 'N'::bpchar;
ALTER TABLE C_Order ADD CONSTRAINT c_order_tasaManual_check CHECK (TasaManual = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]));

-- 23/11/2021 18:29:07 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001222,'tasamanual','LAR','tasamanual','tasamanual',0,TO_TIMESTAMP('2021-11-23 18:29:06','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2021-11-23 18:29:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 23/11/2021 18:29:07 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001222 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 23/11/2021 18:29:07 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004402,318,'LAR',0,'Y','N','N','N',1,'N',20,'N',3001222,'N','Y','N','tasamanual','tasamanual',TO_TIMESTAMP('2021-11-23 18:29:06','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2021-11-23 18:29:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/11/2021 18:29:07 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004402 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/11/2021 18:29:56 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
UPDATE AD_Element SET ColumnName='TasaManual', Name='Tasa Manual', PrintName='Tasa Manual',Updated=TO_TIMESTAMP('2021-11-23 18:29:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001222
;

-- 23/11/2021 18:29:56 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001222
;

-- 23/11/2021 18:29:56 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
UPDATE AD_Column SET ColumnName='TasaManual', Name='Tasa Manual', Description=NULL, Help=NULL WHERE AD_Element_ID=3001222
;

-- 23/11/2021 18:29:56 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
UPDATE AD_Process_Para SET ColumnName='TasaManual', Name='Tasa Manual', Description=NULL, Help=NULL, AD_Element_ID=3001222 WHERE UPPER(ColumnName)='TASAMANUAL' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 23/11/2021 18:29:56 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
UPDATE AD_Process_Para SET ColumnName='TasaManual', Name='Tasa Manual', Description=NULL, Help=NULL WHERE AD_Element_ID=3001222 AND IsCentrallyMaintained='Y'
;

-- 23/11/2021 18:29:56 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
UPDATE AD_Field SET Name='Tasa Manual', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001222) AND IsCentrallyMaintained='Y'
;

-- 23/11/2021 18:29:56 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
UPDATE AD_PrintFormatItem SET PrintName='Tasa Manual', Name='Tasa Manual' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001222)
;

-- 23/11/2021 18:30:01 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
UPDATE AD_Element_Trl SET Name='Tasa Manual',PrintName='Tasa Manual',Updated=TO_TIMESTAMP('2021-11-23 18:30:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001222 AND AD_Language='es_AR'
;

-- 23/11/2021 18:31:01 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
UPDATE AD_Column_Trl SET Name='Tasa Manual',Updated=TO_TIMESTAMP('2021-11-23 18:31:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004402 AND AD_Language='es_AR'
;

-- 23/11/2021 18:32:23 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
UPDATE AD_Column SET ReadOnlyLogic='@TasaManual@=''N''',Updated=TO_TIMESTAMP('2021-11-23 18:32:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002968
;

-- 23/11/2021 18:32:53 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,AD_Tab_ID,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007700,1,'Y','N','N',3004402,263,'N','Y','N','LAR','Tasa Manual',100,0,TO_TIMESTAMP('2021-11-23 18:32:53','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-11-23 18:32:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/11/2021 18:32:53 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007700 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/11/2021 18:33:04 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007700
;

-- 23/11/2021 18:34:53 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,AD_Tab_ID,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007701,1,'Y','N','N',3004402,290,'N','Y','N','LAR','Tasa Manual',100,0,TO_TIMESTAMP('2021-11-23 18:34:53','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-11-23 18:34:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/11/2021 18:34:53 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007701 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/11/2021 18:35:02 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007701
;

-- 23/11/2021 18:35:28 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
UPDATE AD_Field SET IsReadOnly='N',Updated=TO_TIMESTAMP('2021-11-23 18:35:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007365
;

-- 23/11/2021 18:35:59 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
UPDATE AD_Field SET IsReadOnly='N',Updated=TO_TIMESTAMP('2021-11-23 18:35:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005560
;

-- 23/11/2021 18:36:14 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004403,259,'LAR',0,'Y','N','N','N',1,'N',20,'N',3001222,'N','Y','N','Tasa Manual','TasaManual',TO_TIMESTAMP('2021-11-23 18:36:13','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2021-11-23 18:36:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/11/2021 18:36:14 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004403 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/11/2021 18:37:23 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,AD_Tab_ID,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007702,1,'Y','N','N',3004403,186,'N','Y','N','LAR','Tasa Manual',100,0,TO_TIMESTAMP('2021-11-23 18:37:23','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-11-23 18:37:23','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/11/2021 18:37:23 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007702 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/11/2021 18:37:38 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007702
;

-- 23/11/2021 18:38:47 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2021-11-23 18:38:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005559
;

-- 23/11/2021 18:38:50 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
UPDATE AD_Field SET IsReadOnly='N',Updated=TO_TIMESTAMP('2021-11-23 18:38:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005559
;

-- 23/11/2021 18:39:29 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,AD_Tab_ID,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007703,1,'Y','N','N',3004403,294,'N','Y','N','LAR','Tasa Manual',100,0,TO_TIMESTAMP('2021-11-23 18:39:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-11-23 18:39:29','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/11/2021 18:39:29 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007703 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/11/2021 18:39:40 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007703
;

-- 23/11/2021 18:39:48 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
UPDATE AD_Field SET IsReadOnly='N',Updated=TO_TIMESTAMP('2021-11-23 18:39:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007352
;

-- 23/11/2021 18:40:28 ART
-- ISSUE #114: Tasa Manual en Facturas/Ordenes.
UPDATE AD_Column SET ReadOnlyLogic='@TasaManual@=''N''',Updated=TO_TIMESTAMP('2021-11-23 18:40:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002967
;

-- Registración de script
SELECT register_migration_script_lar('0201_ISSUE-114.sql', 'LAR', '')
;
