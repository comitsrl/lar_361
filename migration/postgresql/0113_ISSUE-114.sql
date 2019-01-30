ALTER TABLE C_BPartner ADD COLUMN C_ConversionType_ID numeric(10,0);
ALTER TABLE C_BPartner ADD CONSTRAINT CConversionType_CBPartner FOREIGN KEY (C_ConversionType_ID)
      REFERENCES C_ConversionType (C_ConversionType_ID) MATCH SIMPLE;

ALTER TABLE C_Order ADD COLUMN TasaDeCambio numeric NOT NULL DEFAULT 0;
ALTER TABLE C_Invoice ADD COLUMN TasaDeCambio numeric NOT NULL DEFAULT 0;

-- 17/07/2018 16:19:10 ART
-- BUG #445: Venta en Dolares.
UPDATE AD_Column SET IsUpdateable='Y',Updated=TO_TIMESTAMP('2018-07-17 16:19:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=2191
;

-- 17/07/2018 16:19:43 ART
-- BUG #445: Venta en Dolares.
UPDATE AD_Column SET IsUpdateable='N',Updated=TO_TIMESTAMP('2018-07-17 16:19:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=10297
;

-- 17/07/2018 16:20:34 ART
-- BUG #445: Venta en Dolares.
UPDATE AD_Field SET IsReadOnly='N',Updated=TO_TIMESTAMP('2018-07-17 16:20:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=1103
;

-- 17/07/2018 16:21:12 ART
-- BUG #445: Venta en Dolares.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2018-07-17 16:21:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=8653
;

-- 17/07/2018 16:27:08 ART
-- BUG #445: Venta en Dolares.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3002966,291,'LAR',0,'N','N','N','The Currency Conversion Rate Type lets you define different type of rates, e.g. Spot, Corporate and/or Sell/Buy rates.','N',10,'N',19,'N',2278,'N','Y','N','Currency Conversion Rate Type','Currency Type','C_ConversionType_ID',100,TO_TIMESTAMP('2018-07-17 16:27:08','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2018-07-17 16:27:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 17/07/2018 16:27:09 ART
-- BUG #445: Venta en Dolares.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3002966 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 17/07/2018 16:29:00 ART
-- BUG #445: Venta en Dolares.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005535,10,'Y','N','N',3002966,'N','Y',223,'N','The Currency Conversion Rate Type lets you define different type of rates, e.g. Spot, Corporate and/or Sell/Buy rates.','LAR','Currency Conversion Rate Type','Currency Type',100,0,TO_TIMESTAMP('2018-07-17 16:29:00','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-07-17 16:29:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 17/07/2018 16:29:00 ART
-- BUG #445: Venta en Dolares.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005535 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 17/07/2018 16:42:57 ART
-- BUG #445: Venta en Dolares.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3005535
;

-- 17/07/2018 16:42:57 ART
-- BUG #445: Venta en Dolares.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=5282
;

-- 17/07/2018 16:42:57 ART
-- BUG #445: Venta en Dolares.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=10471
;

-- 17/07/2018 16:42:57 ART
-- BUG #445: Venta en Dolares.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3114
;

-- 17/07/2018 16:42:57 ART
-- BUG #445: Venta en Dolares.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=2408
;

-- 17/07/2018 16:42:57 ART
-- BUG #445: Venta en Dolares.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3524
;

-- 17/07/2018 16:42:57 ART
-- BUG #445: Venta en Dolares.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=2434
;

-- 17/07/2018 16:42:57 ART
-- BUG #445: Venta en Dolares.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3229
;

-- 17/07/2018 16:42:57 ART
-- BUG #445: Venta en Dolares.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3276
;

-- 17/07/2018 16:42:57 ART
-- BUG #445: Venta en Dolares.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3275
;

-- 17/07/2018 16:42:57 ART
-- BUG #445: Venta en Dolares.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=7362
;

-- 17/07/2018 16:42:57 ART
-- BUG #445: Venta en Dolares.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=8373
;

-- 17/07/2018 16:42:57 ART
-- BUG #445: Venta en Dolares.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=2427
;

-- 17/07/2018 16:42:57 ART
-- BUG #445: Venta en Dolares.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=2428
;

-- 17/07/2018 16:42:57 ART
-- BUG #445: Venta en Dolares.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3002709
;

-- 17/07/2018 16:43:13 ART
-- BUG #445: Venta en Dolares.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2018-07-17 16:43:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005535
;

-- 17/07/2018 17:12:05 ART
-- ISSUE #114: Venta en Dolares.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000867,'tasadecambio','LAR','tasadecambio','tasadecambio',0,TO_TIMESTAMP('2018-07-17 17:12:05','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2018-07-17 17:12:05','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 17/07/2018 17:12:05 ART
-- ISSUE #114: Venta en Dolares.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000867 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 17/07/2018 17:12:07 ART
-- ISSUE #114: Venta en Dolares.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3002967,259,'LAR',0,'Y','N','N','N',131089,'N',22,'N',3000867,'N','Y','N','tasadecambio','tasadecambio',100,TO_TIMESTAMP('2018-07-17 17:12:05','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2018-07-17 17:12:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 17/07/2018 17:12:07 ART
-- ISSUE #114: Venta en Dolares.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3002967 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 17/07/2018 17:13:11 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Column SET FieldLength=25, AD_Reference_ID=37, Name='Tasa de Cambio', ColumnName='TasaDeCambio',Updated=TO_TIMESTAMP('2018-07-17 17:13:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002967
;

-- 17/07/2018 17:13:11 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3002967
;

-- 17/07/2018 17:13:11 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET Name='Tasa de Cambio', Description=NULL, Help=NULL WHERE AD_Column_ID=3002967 AND IsCentrallyMaintained='Y'
;

-- 17/07/2018 17:13:16 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Column_Trl SET Name='Tasa de Cambio',Updated=TO_TIMESTAMP('2018-07-17 17:13:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002967 AND AD_Language='es_AR'
;

-- 17/07/2018 17:13:31 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Element SET ColumnName='TasaDeCambio', Name='Tasa de Cambio', PrintName='Tasa de Cambio',Updated=TO_TIMESTAMP('2018-07-17 17:13:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000867
;

-- 17/07/2018 17:13:31 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000867
;

-- 17/07/2018 17:13:31 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Column SET ColumnName='TasaDeCambio', Name='Tasa de Cambio', Description=NULL, Help=NULL WHERE AD_Element_ID=3000867
;

-- 17/07/2018 17:13:31 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Process_Para SET ColumnName='TasaDeCambio', Name='Tasa de Cambio', Description=NULL, Help=NULL, AD_Element_ID=3000867 WHERE UPPER(ColumnName)='TASADECAMBIO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 17/07/2018 17:13:31 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Process_Para SET ColumnName='TasaDeCambio', Name='Tasa de Cambio', Description=NULL, Help=NULL WHERE AD_Element_ID=3000867 AND IsCentrallyMaintained='Y'
;

-- 17/07/2018 17:13:31 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET Name='Tasa de Cambio', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000867) AND IsCentrallyMaintained='Y'
;

-- 17/07/2018 17:13:31 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_PrintFormatItem SET PrintName='Tasa de Cambio', Name='Tasa de Cambio' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000867)
;

-- 17/07/2018 17:13:36 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Element_Trl SET Name='Tasa de Cambio',PrintName='Tasa de Cambio',Updated=TO_TIMESTAMP('2018-07-17 17:13:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000867 AND AD_Language='es_AR'
;

-- 17/07/2018 17:14:14 ART
-- ISSUE #114: Venta en Dolares.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005559,25,'Y','N','N',3002967,'N','Y',186,'N','LAR','Tasa de Cambio',100,0,TO_TIMESTAMP('2018-07-17 17:14:14','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-07-17 17:14:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 17/07/2018 17:14:14 ART
-- ISSUE #114: Venta en Dolares.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005559 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 17/07/2018 17:14:34 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3005559
;

-- 17/07/2018 17:14:34 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=1098
;

-- 17/07/2018 17:14:34 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3272
;

-- 17/07/2018 17:14:34 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=2112
;

-- 17/07/2018 17:14:34 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=2109
;

-- 17/07/2018 17:14:34 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3113
;

-- 17/07/2018 17:14:34 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=1099
;

-- 17/07/2018 17:14:34 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=56906
;

-- 17/07/2018 17:14:34 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3001993
;

-- 17/07/2018 17:14:34 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=2593
;

-- 17/07/2018 17:14:34 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=2589
;

-- 17/07/2018 17:14:34 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=1324
;

-- 17/07/2018 17:14:34 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=7038
;

-- 17/07/2018 17:14:34 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=7826
;

-- 17/07/2018 17:14:34 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=7825
;

-- 17/07/2018 17:14:34 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=2594
;

-- 17/07/2018 17:14:34 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=1112
;

-- 17/07/2018 17:14:34 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=1113
;

-- 17/07/2018 17:14:34 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=1082
;

-- 17/07/2018 17:14:34 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=1084
;

-- 17/07/2018 17:14:34 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=60922
;

-- 17/07/2018 17:14:34 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=6560
;

-- 17/07/2018 17:14:34 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000750
;

-- 17/07/2018 17:14:34 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=1083
;

-- 17/07/2018 17:14:34 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3660
;

-- 17/07/2018 17:14:34 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=1090
;

-- 17/07/2018 17:14:34 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3001597
;

-- 17/07/2018 17:14:34 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3004046
;

-- 17/07/2018 17:14:46 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2018-07-17 17:14:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005559
;

-- 17/07/2018 17:15:49 ART
-- ISSUE #114: Venta en Dolares.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3002968,318,'LAR',0,'Y','N','N','N',131089,'N',22,'N',3000867,'N','Y','N','Tasa de Cambio','TasaDeCambio',100,TO_TIMESTAMP('2018-07-17 17:15:49','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2018-07-17 17:15:49','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 17/07/2018 17:15:49 ART
-- ISSUE #114: Venta en Dolares.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3002968 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 17/07/2018 17:16:25 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Column SET IsUpdateable='N',Updated=TO_TIMESTAMP('2018-07-17 17:16:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002968
;

-- 17/07/2018 17:16:37 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Column SET FieldLength=25, AD_Reference_ID=37,Updated=TO_TIMESTAMP('2018-07-17 17:16:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002968
;

-- 17/07/2018 17:16:59 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2018-07-17 17:16:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005559
;

-- 17/07/2018 17:17:26 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET DisplayLogic='@TasaDeCambio@ > 0',Updated=TO_TIMESTAMP('2018-07-17 17:17:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005559
;

-- 17/07/2018 17:18:15 ART
-- ISSUE #114: Venta en Dolares.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005560,25,'Y','N','N',3002968,'N','Y',263,'N','LAR','Tasa de Cambio',100,0,TO_TIMESTAMP('2018-07-17 17:18:15','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-07-17 17:18:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 17/07/2018 17:18:15 ART
-- ISSUE #114: Venta en Dolares.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005560 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 17/07/2018 17:19:12 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=2962
;

-- 17/07/2018 17:19:12 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=2959
;

-- 17/07/2018 17:19:12 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=6565
;

-- 17/07/2018 17:19:12 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=2958
;

-- 17/07/2018 17:19:12 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=2776
;

-- 17/07/2018 17:19:12 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3000041
;

-- 17/07/2018 17:19:12 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=2766
;

-- 17/07/2018 17:19:12 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=2767
;

-- 17/07/2018 17:19:12 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=2954
;

-- 17/07/2018 17:19:12 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000603
;

-- 17/07/2018 17:19:12 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=2961
;

-- 17/07/2018 17:19:12 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=2765
;

-- 17/07/2018 17:19:12 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=2770
;

-- 17/07/2018 17:19:12 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=8648
;

-- 17/07/2018 17:19:12 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3005560
;

-- 17/07/2018 17:19:12 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=2763
;

-- 17/07/2018 17:19:12 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=2953
;

-- 17/07/2018 17:19:12 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3273
;

-- 17/07/2018 17:19:12 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=2956
;

-- 17/07/2018 17:19:12 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3112
;

-- 17/07/2018 17:19:12 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=2774
;

-- 17/07/2018 17:19:12 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=2764
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=2768
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3001994
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=6935
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=2775
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=7794
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=7795
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=2786
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=1000017
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=2780
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=2778
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=2771
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=1000016
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=2777
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=6564
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=8657
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3663
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=10485
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3899
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000025
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000026
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000605
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=13700
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=53257
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=53258
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=60970
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000027
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000028
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3002136
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=200050
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3002142
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3002138
;

-- 17/07/2018 17:19:13 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3004048
;

-- 17/07/2018 17:19:39 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET IsSameLine='Y', IsReadOnly='Y', DisplayLogic='@TasaDeCambio@ > 0',Updated=TO_TIMESTAMP('2018-07-17 17:19:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005560
;

-- 17/07/2018 17:34:40 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=13700
;

-- 17/07/2018 17:34:41 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=60970
;

-- 17/07/2018 17:34:41 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000027
;

-- 17/07/2018 17:34:41 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=53257
;

-- 17/07/2018 17:34:41 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=53258
;

-- 17/07/2018 17:34:41 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000028
;

-- 17/07/2018 17:34:41 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3002136
;

-- 17/07/2018 17:34:41 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=200050
;

-- 17/07/2018 17:34:41 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3002142
;

-- 17/07/2018 17:34:41 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3002138
;

-- 17/07/2018 17:34:41 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3004048
;

-- 17/07/2018 17:37:28 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=2778
;

-- 17/07/2018 17:37:28 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=2780
;

-- 17/07/2018 17:37:28 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=1000016
;

-- 17/07/2018 17:37:28 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=2771
;

-- 17/07/2018 17:37:28 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=6564
;

-- 17/07/2018 17:37:28 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=2777
;

-- 17/07/2018 17:39:27 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000750
;

-- 17/07/2018 17:39:27 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=1083
;

-- 17/07/2018 17:39:27 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3660
;

-- 17/07/2018 17:39:27 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=1090
;

-- 17/07/2018 17:39:27 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3001597
;

-- 17/07/2018 17:39:27 ART
-- ISSUE #114: Venta en Dolares.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3004046
;

-- 10/08/2018 16:16:01 ART
-- BUG #445: Venta en Dolares.
UPDATE AD_Field SET DisplayLogic=NULL,Updated=TO_TIMESTAMP('2018-08-10 16:16:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=8648
;

-- 10/08/2018 16:18:26 ART
-- BUG #445: Venta en Dolares.
UPDATE AD_Field SET IsReadOnly='N',Updated=TO_TIMESTAMP('2018-08-10 16:18:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2770
;

-- 10/08/2018 17:39:10 ART
-- BUG #445: Venta en Dolares.
UPDATE AD_Column SET IsUpdateable='Y',Updated=TO_TIMESTAMP('2018-08-10 17:39:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002968
;

-- Registración de script
SELECT register_migration_script_lar('0113_BUG-114.sql', 'LAR', '')
;
