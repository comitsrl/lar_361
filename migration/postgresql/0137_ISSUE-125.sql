ALTER TABLE M_Product
ADD COLUMN ExentoIVAVenta character(1) NOT NULL DEFAULT 'N'::bpchar;

-- 16/08/2019 17:07:15 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001042,'exentoivaventa','LAR','exentoivaventa','exentoivaventa',0,TO_TIMESTAMP('2019-08-16 17:07:14','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2019-08-16 17:07:14','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 16/08/2019 17:07:15 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, PO_Description,Help,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.PO_Description,t.Help,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001042 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 16/08/2019 17:07:15 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,IsMandatory,Version,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003525,208,'LAR','Y',0,'N','N','N',1,'N',20,'N',3001042,'N','Y','N','exentoivaventa','exentoivaventa',TO_TIMESTAMP('2019-08-16 17:07:14','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2019-08-16 17:07:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 16/08/2019 17:07:15 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003525 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 16/08/2019 17:08:16 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Column SET Name='Exento de IVA Venta', ColumnName='ExentoIVAVenta',Updated=TO_TIMESTAMP('2019-08-16 17:08:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003525
;

-- 16/08/2019 17:08:16 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003525
;

-- 16/08/2019 17:08:16 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET Name='Exento de IVA Venta', Description=NULL, Help=NULL WHERE AD_Column_ID=3003525 AND IsCentrallyMaintained='Y'
;

-- 16/08/2019 17:08:24 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Column_Trl SET Name='Exento de IVA Venta',Updated=TO_TIMESTAMP('2019-08-16 17:08:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003525 AND AD_Language='es_AR'
;

-- 16/08/2019 17:08:56 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Element SET ColumnName='ExentoIVAVenta', Name='Exento de IVA Venta', PrintName='Exento de IVA Venta',Updated=TO_TIMESTAMP('2019-08-16 17:08:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001042
;

-- 16/08/2019 17:08:56 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001042
;

-- 16/08/2019 17:08:56 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Column SET ColumnName='ExentoIVAVenta', Name='Exento de IVA Venta', Description=NULL, Help=NULL WHERE AD_Element_ID=3001042
;

-- 16/08/2019 17:08:56 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Process_Para SET ColumnName='ExentoIVAVenta', Name='Exento de IVA Venta', Description=NULL, Help=NULL, AD_Element_ID=3001042 WHERE UPPER(ColumnName)='EXENTOIVAVENTA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 16/08/2019 17:08:56 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Process_Para SET ColumnName='ExentoIVAVenta', Name='Exento de IVA Venta', Description=NULL, Help=NULL WHERE AD_Element_ID=3001042 AND IsCentrallyMaintained='Y'
;

-- 16/08/2019 17:08:56 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET Name='Exento de IVA Venta', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001042) AND IsCentrallyMaintained='Y'
;

-- 16/08/2019 17:08:56 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_PrintFormatItem SET PrintName='Exento de IVA Venta', Name='Exento de IVA Venta' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001042)
;

-- 16/08/2019 17:09:05 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Element_Trl SET Name='Exento de IVA Venta',PrintName='Exento de IVA Venta',Updated=TO_TIMESTAMP('2019-08-16 17:09:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001042 AND AD_Language='es_AR'
;

-- 16/08/2019 17:10:58 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006606,1,'Y','N','N',3003525,'N','Y',180,'N','LAR','Exento de IVA Venta',100,0,'Y',TO_TIMESTAMP('2019-08-16 17:10:57','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2019-08-16 17:10:57','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/08/2019 17:10:58 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006606 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/08/2019 17:13:08 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3006606
;

-- 16/08/2019 17:13:08 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3079
;

-- 16/08/2019 17:13:09 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=1032
;

-- 16/08/2019 17:13:09 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=6841
;

-- 16/08/2019 17:13:09 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=1031
;

-- 16/08/2019 17:13:09 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=1319
;

-- 16/08/2019 17:13:09 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=1320
;

-- 16/08/2019 17:13:09 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=1321
;

-- 16/08/2019 17:13:09 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=1322
;

-- 16/08/2019 17:13:09 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3744
;

-- 16/08/2019 17:13:09 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3745
;

-- 16/08/2019 17:13:09 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=1569
;

-- 16/08/2019 17:13:09 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=5381
;

-- 16/08/2019 17:13:09 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=5383
;

-- 16/08/2019 17:13:09 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=6130
;

-- 16/08/2019 17:13:09 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=8307
;

-- 16/08/2019 17:13:09 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=1025
;

-- 16/08/2019 17:13:09 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=2587
;

-- 16/08/2019 17:15:01 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2019-08-16 17:15:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006606
;

-- 16/08/2019 19:22:29 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=9657
;

-- 16/08/2019 19:22:29 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=2420
;

-- 16/08/2019 19:22:29 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=9640
;

-- 16/08/2019 19:22:29 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3006203
;

-- 16/08/2019 19:22:29 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=5282
;

-- 16/08/2019 19:22:29 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=10471
;

-- 16/08/2019 19:22:29 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3006204
;

-- 16/08/2019 19:22:29 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3006205
;

-- 16/08/2019 19:22:29 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3114
;

-- 16/08/2019 19:22:29 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=2408
;

-- 16/08/2019 19:22:29 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3524
;

-- 16/08/2019 19:22:29 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=2434
;

-- 16/08/2019 19:22:29 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3229
;

-- 16/08/2019 19:22:29 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3276
;

-- 16/08/2019 19:22:29 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3275
;

-- 16/08/2019 19:22:29 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=7362
;

-- 16/08/2019 19:22:29 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=8373
;

-- 16/08/2019 19:22:29 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=2427
;

-- 16/08/2019 19:22:29 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=2428
;

-- 16/08/2019 19:22:57 ART
-- ISSUE #125: Eximir de IVA a Consumidores Finales sobre ciertos productos.
UPDATE AD_Field SET IsSameLine='Y', DisplayLogic='@IsCustomer@=''Y''',Updated=TO_TIMESTAMP('2019-08-16 19:22:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=9657
;

-- Registración de script
SELECT register_migration_script_lar('0137_ISSUE-125.sql', 'LAR', '')
;
