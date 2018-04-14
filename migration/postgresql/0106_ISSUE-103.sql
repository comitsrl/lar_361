ALTER TABLE M_RmaLine ADD COLUMN PriceList numeric(10,0) NOT NULL DEFAULT 0;

-- 11/04/2018 18:13:33 ART
-- ISSUE #103: Se agrega columna Precio de Lista en M_RmaLine
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3002825,660,'LAR',0,'Y','N','N','The List Price is the official List Price in the document currency.','N',10,'N',11,'N',520,'N','Y','N','List Price','List Price','PriceList',TO_TIMESTAMP('2018-04-11 18:13:32','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2018-04-11 18:13:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/04/2018 18:13:33 ART
-- ISSUE #103: Se agrega columna Precio de Lista en M_RmaLine
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3002825 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/04/2018 18:14:36 ART
-- ISSUE #103: Se agrega columna Precio de Lista en M_RmaLine
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3005396,10,'Y','N','N',3002825,'N','Y',629,'N','The List Price is the official List Price in the document currency.','LAR','List Price','List Price',100,0,'Y',TO_TIMESTAMP('2018-04-11 18:14:36','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2018-04-11 18:14:36','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/04/2018 18:14:36 ART
-- ISSUE #103: Se agrega columna Precio de Lista en M_RmaLine
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005396 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/04/2018 18:14:36 ART
-- ISSUE #103: Se agrega columna Precio de Lista en M_RmaLine
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3005397,22,'Y','N','N',57792,'N','Y',629,'N','The Invoiced Quantity indicates the quantity of a product that have been invoiced.','D','Invoiced Quantity','Quantity Invoiced',100,0,'Y',TO_TIMESTAMP('2018-04-11 18:14:36','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2018-04-11 18:14:36','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/04/2018 18:14:36 ART
-- ISSUE #103: Se agrega columna Precio de Lista en M_RmaLine
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005397 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/04/2018 18:14:37 ART
-- ISSUE #103: Se agrega columna Precio de Lista en M_RmaLine
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3005398,22,'Y','N','N',57791,'N','Y',629,'N','D','Referenced RMA Line',100,0,'Y',TO_TIMESTAMP('2018-04-11 18:14:36','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2018-04-11 18:14:36','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/04/2018 18:14:37 ART
-- ISSUE #103: Se agrega columna Precio de Lista en M_RmaLine
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005398 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/04/2018 18:16:44 ART
-- ISSUE #103: Se agrega columna Precio de Lista en M_RmaLine
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3005398
;

-- 11/04/2018 18:16:44 ART
-- ISSUE #103: Se agrega columna Precio de Lista en M_RmaLine
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3005397
;

-- 11/04/2018 18:16:44 ART
-- ISSUE #103: Se agrega columna Precio de Lista en M_RmaLine
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=52001
;

-- 11/04/2018 18:16:44 ART
-- ISSUE #103: Se agrega columna Precio de Lista en M_RmaLine
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3005396
;

-- 11/04/2018 18:16:44 ART
-- ISSUE #103: Se agrega columna Precio de Lista en M_RmaLine
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=52004
;

-- 11/04/2018 18:20:16 ART
-- ISSUE #103: Se agrega columna Precio de Lista en M_RmaLine
UPDATE AD_Field SET IsSameLine='Y', IsReadOnly='Y', DisplayLogic='@Processed@=''Y''',Updated=TO_TIMESTAMP('2018-04-11 18:20:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005397
;

-- 11/04/2018 18:21:43 ART
-- ISSUE #103: Se agrega columna Precio de Lista en M_RmaLine
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=52004
;

-- 11/04/2018 18:21:43 ART
-- ISSUE #103: Se agrega columna Precio de Lista en M_RmaLine
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=52001
;

-- 11/04/2018 18:22:08 ART
-- ISSUE #103: Se agrega columna Precio de Lista en M_RmaLine
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2018-04-11 18:22:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005396
;

-- 11/04/2018 18:22:09 ART
-- ISSUE #103: Se agrega columna Precio de Lista en M_RmaLine
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2018-04-11 18:22:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=52001
;

-- 11/04/2018 18:22:17 ART
-- ISSUE #103: Se agrega columna Precio de Lista en M_RmaLine
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2018-04-11 18:22:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005396
;

-- 11/04/2018 19:09:58 ART
-- ISSUE #103: Se agrega columna Precio de Lista en M_RmaLine
UPDATE AD_Column SET AD_Reference_ID=37,Updated=TO_TIMESTAMP('2018-04-11 19:09:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002825
;

-- Registración de script
SELECT register_migration_script_lar('0106_ISSUE-103.sql', 'LAR', '')
;
