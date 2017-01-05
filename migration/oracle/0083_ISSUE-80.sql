ALTER TABLE C_Payment ADD COLUMN Fecha_Venc_Cheque timestamp without time zone;

-- 29/12/2016 17:42:02 ART
-- ISSUE #80: Cierre de cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000419,'fecha_venc_cheque','LAR','fecha_venc_cheque','fecha_venc_cheque',0,TO_DATE('2016-12-29 17:42:01','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-12-29 17:42:01','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 29/12/2016 17:42:02 ART
-- ISSUE #80: Cierre de cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000419 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 29/12/2016 17:42:02 ART
-- ISSUE #80: Cierre de cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001958,335,'LAR',0,'N','N','N',29,'N','N',16,'N',3000419,'N','Y','N','fecha_venc_cheque','fecha_venc_cheque',100,TO_DATE('2016-12-29 17:42:01','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-29 17:42:01','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 29/12/2016 17:42:02 ART
-- ISSUE #80: Cierre de cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001958 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 29/12/2016 17:42:53 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Column SET Name='Fecha de Venc. Cheque', ColumnName='Fecha_Venc_Cheque',Updated=TO_DATE('2016-12-29 17:42:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001958
;

-- 29/12/2016 17:42:53 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001958
;

-- 29/12/2016 17:42:53 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET Name='Fecha de Venc. Cheque', Description=NULL, Help=NULL WHERE AD_Column_ID=3001958 AND IsCentrallyMaintained='Y'
;

-- 29/12/2016 17:42:58 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Column_Trl SET Name='Fecha de Venc. Cheque',Updated=TO_DATE('2016-12-29 17:42:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001958 AND AD_Language='es_AR'
;

-- 29/12/2016 17:43:24 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Element SET ColumnName='Fecha_Venc_Cheque', Name='Fecha de Venc. Cheque', PrintName='Fecha de Venc. Cheque',Updated=TO_DATE('2016-12-29 17:43:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000419
;

-- 29/12/2016 17:43:24 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000419
;

-- 29/12/2016 17:43:24 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Column SET ColumnName='Fecha_Venc_Cheque', Name='Fecha de Venc. Cheque', Description=NULL, Help=NULL WHERE AD_Element_ID=3000419
;

-- 29/12/2016 17:43:24 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Process_Para SET ColumnName='Fecha_Venc_Cheque', Name='Fecha de Venc. Cheque', Description=NULL, Help=NULL, AD_Element_ID=3000419 WHERE UPPER(ColumnName)='FECHA_VENC_CHEQUE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 29/12/2016 17:43:24 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Process_Para SET ColumnName='Fecha_Venc_Cheque', Name='Fecha de Venc. Cheque', Description=NULL, Help=NULL WHERE AD_Element_ID=3000419 AND IsCentrallyMaintained='Y'
;

-- 29/12/2016 17:43:24 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET Name='Fecha de Venc. Cheque', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000419) AND IsCentrallyMaintained='Y'
;

-- 29/12/2016 17:43:24 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_PrintFormatItem pi SET PrintName='Fecha de Venc. Cheque', Name='Fecha de Venc. Cheque' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000419)
;

-- 29/12/2016 17:43:39 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Element_Trl SET Name='Fecha de Venc. Cheque',PrintName='Fecha de Venc. Cheque',Updated=TO_DATE('2016-12-29 17:43:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000419 AND AD_Language='es_AR'
;

-- 29/12/2016 17:43:55 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Column SET AD_Reference_ID=15,Updated=TO_DATE('2016-12-29 17:43:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001958
;

-- 29/12/2016 17:45:53 ART
-- ISSUE #80: Cierre de cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003009,29,'Y','N','N',3001958,'N','Y',3000013,'N','LAR','Fecha de Venc. Cheque',100,0,'Y',TO_DATE('2016-12-29 17:45:47','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-12-29 17:45:47','YYYY-MM-DD HH24:MI:SS'))
;

-- 29/12/2016 17:45:53 ART
-- ISSUE #80: Cierre de cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003009 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000326
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000325
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000323
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000324
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000329
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000330
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000331
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3000332
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3002719
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3002720
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3002803
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000335
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000336
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000337
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000338
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000339
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3003009
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000340
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000341
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000342
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000343
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000344
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000345
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000346
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000347
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000348
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000349
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000350
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000351
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000352
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000353
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000354
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000355
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000356
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000357
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000358
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000359
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000360
;

-- 29/12/2016 17:56:37 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000363
;

-- 29/12/2016 17:56:38 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000302
;

-- 29/12/2016 17:56:38 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000364
;

-- 29/12/2016 17:56:38 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000362
;

-- 29/12/2016 17:56:38 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000289
;

-- 29/12/2016 17:56:38 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000366
;

-- 29/12/2016 17:57:24 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=K | @TenderType@=Z',Updated=TO_DATE('2016-12-29 17:57:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003009
;

-- 29/12/2016 17:59:56 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2016-12-29 17:59:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003009
;

-- 29/12/2016 18:04:09 ART
-- ISSUE #80: Cierre de cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003010,29,'Y','N','N',3001958,'N','Y',3000024,'N','LAR','Fecha de Venc. Cheque',100,0,'Y',TO_DATE('2016-12-29 18:04:09','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-12-29 18:04:09','YYYY-MM-DD HH24:MI:SS'))
;

-- 29/12/2016 18:04:09 ART
-- ISSUE #80: Cierre de cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003010 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 29/12/2016 18:05:02 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3003010
;

-- 29/12/2016 18:05:02 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000830
;

-- 29/12/2016 18:05:02 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000831
;

-- 29/12/2016 18:05:02 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000832
;

-- 29/12/2016 18:05:02 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000833
;

-- 29/12/2016 18:05:02 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000834
;

-- 29/12/2016 18:05:02 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000835
;

-- 29/12/2016 18:05:02 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000836
;

-- 29/12/2016 18:05:02 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000837
;

-- 29/12/2016 18:05:02 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000838
;

-- 29/12/2016 18:05:02 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000839
;

-- 29/12/2016 18:05:02 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000840
;

-- 29/12/2016 18:05:02 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000841
;

-- 29/12/2016 18:05:02 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000842
;

-- 29/12/2016 18:05:02 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000843
;

-- 29/12/2016 18:05:02 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000844
;

-- 29/12/2016 18:05:02 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000845
;

-- 29/12/2016 18:05:02 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000846
;

-- 29/12/2016 18:05:02 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000847
;

-- 29/12/2016 18:05:02 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000848
;

-- 29/12/2016 18:05:02 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000849
;

-- 29/12/2016 18:05:02 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000850
;

-- 29/12/2016 18:05:02 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000851
;

-- 29/12/2016 18:05:02 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000852
;

-- 29/12/2016 18:05:02 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000857
;

-- 29/12/2016 18:05:02 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000855
;

-- 29/12/2016 18:05:02 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000856
;

-- 29/12/2016 18:05:02 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000858
;

-- 29/12/2016 18:05:31 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2016-12-29 18:05:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003010
;

-- 29/12/2016 18:06:05 ART
-- ISSUE #80: Cierre de cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=Z | @TenderType@=K',Updated=TO_DATE('2016-12-29 18:06:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003010
;

-- 05/01/2017 12:58:02 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET AD_Reference_Value_ID=149,Updated=TO_DATE('2017-01-05 12:58:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001179
;

-- Registración de script
SELECT register_migration_script_lar('0080_ISSUE-80.sql', 'LAR', '') FROM dual
;
