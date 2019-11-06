ALTER TABLE C_Payment ADD COLUMN EsElectronico character(1) NOT NULL DEFAULT 'N'::bpchar;
ALTER TABLE C_Payment ADD CONSTRAINT c_payment_eselectronico_check CHECK (EsElectronico = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]));

-- 05/11/2019 11:01:44 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001048,'eselectronico','LAR','eselectronico','eselectronico',0,TO_DATE('2019-11-05 11:01:44','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2019-11-05 11:01:44','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 05/11/2019 11:01:45 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001048 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 05/11/2019 11:01:45 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003533,335,'LAR',0,'Y','N','N','N',1,'N',20,'N',3001048,'N','Y','N','eselectronico','eselectronico',100,TO_DATE('2019-11-05 11:01:44','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2019-11-05 11:01:44','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/11/2019 11:01:45 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003533 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 05/11/2019 11:02:49 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Column SET Name='Es Electrónico', ColumnName='EsElectronico',Updated=TO_DATE('2019-11-05 11:02:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003533
;

-- 05/11/2019 11:02:49 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003533
;

-- 05/11/2019 11:02:49 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET Name='Es Electrónico', Description=NULL, Help=NULL WHERE AD_Column_ID=3003533 AND IsCentrallyMaintained='Y'
;

-- 05/11/2019 11:02:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Column_Trl SET Name='Es Electrónico',Updated=TO_DATE('2019-11-05 11:02:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003533 AND AD_Language='es_AR'
;

-- 05/11/2019 11:03:10 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Element SET ColumnName='EsElectronico', Name='Es Electrónico', PrintName='Es Electrónico',Updated=TO_DATE('2019-11-05 11:03:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001048
;

-- 05/11/2019 11:03:10 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001048
;

-- 05/11/2019 11:03:10 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Column SET ColumnName='EsElectronico', Name='Es Electrónico', Description=NULL, Help=NULL WHERE AD_Element_ID=3001048
;

-- 05/11/2019 11:03:10 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Process_Para SET ColumnName='EsElectronico', Name='Es Electrónico', Description=NULL, Help=NULL, AD_Element_ID=3001048 WHERE UPPER(ColumnName)='ESELECTRONICO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 05/11/2019 11:03:10 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Process_Para SET ColumnName='EsElectronico', Name='Es Electrónico', Description=NULL, Help=NULL WHERE AD_Element_ID=3001048 AND IsCentrallyMaintained='Y'
;

-- 05/11/2019 11:03:10 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET Name='Es Electrónico', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001048) AND IsCentrallyMaintained='Y'
;

-- 05/11/2019 11:03:10 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_PrintFormatItem pi SET PrintName='Es Electrónico', Name='Es Electrónico' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001048)
;

-- 05/11/2019 11:03:18 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Element_Trl SET Name='Es Electrónico',PrintName='Es Electrónico',Updated=TO_DATE('2019-11-05 11:03:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001048 AND AD_Language='es_AR'
;

-- 05/11/2019 11:12:48 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006614,1,'Y','N','N',3003533,'N','Y',3000013,'N','LAR','Es Electrónico',100,0,TO_DATE('2019-11-05 11:12:48','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2019-11-05 11:12:48','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/11/2019 11:12:48 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006614 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/11/2019 11:12:48 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006615,10,'Y','N','N',3002109,'N','Y',3000013,'N','LAR','Tipo de Cheque Emitido',100,0,TO_DATE('2019-11-05 11:12:48','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2019-11-05 11:12:48','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/11/2019 11:12:48 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006615 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/11/2019 11:13:35 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006615
;

-- 05/11/2019 11:13:35 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=3006614
;

-- 05/11/2019 11:16:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=680,IsDisplayed='Y' WHERE AD_Field_ID=3006615
;

-- 05/11/2019 11:17:28 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3006615
;

-- 05/11/2019 11:17:28 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE FROM AD_Field WHERE AD_Field_ID=3006615
;

-- 05/11/2019 11:17:59 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3006614
;

-- 05/11/2019 11:17:59 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000340
;

-- 05/11/2019 11:17:59 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000341
;

-- 05/11/2019 11:17:59 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000342
;

-- 05/11/2019 11:17:59 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000343
;

-- 05/11/2019 11:17:59 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000344
;

-- 05/11/2019 11:17:59 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000345
;

-- 05/11/2019 11:17:59 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000346
;

-- 05/11/2019 11:17:59 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000347
;

-- 05/11/2019 11:17:59 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000348
;

-- 05/11/2019 11:17:59 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000349
;

-- 05/11/2019 11:17:59 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000350
;

-- 05/11/2019 11:17:59 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000351
;

-- 05/11/2019 11:17:59 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000352
;

-- 05/11/2019 11:17:59 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000353
;

-- 05/11/2019 11:17:59 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000354
;

-- 05/11/2019 11:17:59 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000355
;

-- 05/11/2019 11:17:59 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000357
;

-- 05/11/2019 11:17:59 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000358
;

-- 05/11/2019 11:17:59 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000359
;

-- 05/11/2019 11:17:59 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000360
;

-- 05/11/2019 11:17:59 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000363
;

-- 05/11/2019 11:17:59 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000302
;

-- 05/11/2019 11:17:59 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000364
;

-- 05/11/2019 11:17:59 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000362
;

-- 05/11/2019 11:17:59 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3000289
;

-- 05/11/2019 11:17:59 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=3000366
;

-- 05/11/2019 11:18:14 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2019-11-05 11:18:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006614
;

-- 05/11/2019 11:18:57 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET DisplayLogic='@TenderType@=K | @TenderType@=Z & @EsRetencionSufrida@=N',Updated=TO_DATE('2019-11-05 11:18:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006614
;

-- 05/11/2019 11:21:57 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3003009
;

-- 05/11/2019 11:21:57 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3002720
;

-- 05/11/2019 11:21:57 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000332
;

-- 05/11/2019 11:21:57 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3002803
;

-- 05/11/2019 11:21:58 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000335
;

-- 05/11/2019 11:21:58 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000356
;

-- 05/11/2019 11:22:39 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET AD_FieldGroup_ID=NULL,Updated=TO_DATE('2019-11-05 11:22:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000356
;

-- 05/11/2019 11:35:05 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3003293
;

-- 05/11/2019 11:35:05 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000329
;

-- 05/11/2019 11:35:05 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000330
;

-- 05/11/2019 11:35:05 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3002719
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000331
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3003009
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3002720
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000332
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3002803
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000335
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000356
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000336
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3000337
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000338
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000339
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3006614
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000340
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000341
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000342
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000343
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000344
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000345
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000346
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000347
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000348
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000349
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000350
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000351
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000352
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3001624
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000318
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000321
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000319
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000320
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000322
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000886
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000888
;

-- 05/11/2019 11:35:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000324
;

-- 05/11/2019 11:39:17 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3003009
;

-- 05/11/2019 11:39:17 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3003293
;

-- 05/11/2019 11:39:17 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000329
;

-- 05/11/2019 11:39:17 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000330
;

-- 05/11/2019 11:39:17 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3002719
;

-- 05/11/2019 11:39:17 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000331
;

-- 05/11/2019 11:41:30 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000332
;

-- 05/11/2019 11:41:30 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000339
;

-- 05/11/2019 11:41:30 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000331
;

-- 05/11/2019 11:41:30 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000330
;

-- 05/11/2019 11:41:30 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3003293
;

-- 05/11/2019 11:41:30 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3002719
;

-- 05/11/2019 11:41:30 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3002720
;

-- 05/11/2019 11:41:30 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3006614
;

-- 05/11/2019 11:41:30 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000340
;

-- 05/11/2019 11:41:30 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000341
;

-- 05/11/2019 11:41:30 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000342
;

-- 05/11/2019 11:41:30 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000343
;

-- 05/11/2019 11:41:30 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000344
;

-- 05/11/2019 11:41:30 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000345
;

-- 05/11/2019 11:41:30 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000346
;

-- 05/11/2019 11:41:30 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000347
;

-- 05/11/2019 11:41:30 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000348
;

-- 05/11/2019 11:41:30 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000349
;

-- 05/11/2019 11:41:30 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000350
;

-- 05/11/2019 11:41:30 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000351
;

-- 05/11/2019 11:41:30 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000352
;

-- 05/11/2019 11:41:30 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3001624
;

-- 05/11/2019 11:41:30 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000318
;

-- 05/11/2019 11:41:30 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000321
;

-- 05/11/2019 11:41:30 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000319
;

-- 05/11/2019 11:41:31 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000320
;

-- 05/11/2019 11:41:31 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000322
;

-- 05/11/2019 11:41:31 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000886
;

-- 05/11/2019 11:41:31 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000888
;

-- 05/11/2019 11:41:31 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000324
;

-- 05/11/2019 11:41:31 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000353
;

-- 05/11/2019 11:41:31 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000354
;

-- 05/11/2019 11:41:31 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000355
;

-- 05/11/2019 11:41:31 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000357
;

-- 05/11/2019 11:41:31 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000358
;

-- 05/11/2019 11:41:31 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000359
;

-- 05/11/2019 11:41:31 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000360
;

-- 05/11/2019 11:41:31 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000363
;

-- 05/11/2019 11:41:31 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000302
;

-- 05/11/2019 11:41:31 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000364
;

-- 05/11/2019 11:41:31 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000362
;

-- 05/11/2019 11:41:31 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000289
;

-- 05/11/2019 11:41:31 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3000366
;

-- 05/11/2019 11:43:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000329
;

-- 05/11/2019 11:43:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000339
;

-- 05/11/2019 11:43:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000330
;

-- 05/11/2019 11:43:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000331
;

-- 05/11/2019 11:43:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3006614
;

-- 05/11/2019 11:43:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3003293
;

-- 05/11/2019 11:43:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3002719
;

-- 05/11/2019 11:43:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3002720
;

-- 05/11/2019 11:43:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3002803
;

-- 05/11/2019 11:43:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000335
;

-- 05/11/2019 11:43:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000356
;

-- 05/11/2019 11:43:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3000336
;

-- 05/11/2019 11:43:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000337
;

-- 05/11/2019 11:43:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000338
;

-- 05/11/2019 11:44:01 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2019-11-05 11:44:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003009
;

-- 05/11/2019 11:44:19 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2019-11-05 11:44:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000329
;

-- 05/11/2019 11:47:41 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2019-11-05 11:47:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002719
;

-- 05/11/2019 11:47:46 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2019-11-05 11:47:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002720
;

-- 05/11/2019 11:47:53 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2019-11-05 11:47:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002803
;

-- 05/11/2019 11:48:09 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3002719
;

-- 05/11/2019 11:48:09 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3002720
;

-- 05/11/2019 11:48:09 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3002803
;

-- 05/11/2019 11:48:09 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3003009
;

-- 05/11/2019 11:48:09 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000329
;

-- 05/11/2019 11:48:09 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000339
;

-- 05/11/2019 11:48:09 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000330
;

-- 05/11/2019 11:48:09 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000331
;

-- 05/11/2019 11:48:09 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3006614
;

-- 05/11/2019 11:48:09 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3003293
;

-- 05/11/2019 11:51:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000330
;

-- 05/11/2019 11:51:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000329
;

-- 05/11/2019 11:51:17 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000335
;

-- 05/11/2019 11:51:17 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3003293
;

-- 05/11/2019 11:54:35 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2019-11-05 11:54:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000324
;

-- 05/11/2019 11:58:25 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006616,1,'Y','N','N',3003533,'N','Y',3000024,'N','LAR','Es Electrónico',100,0,TO_DATE('2019-11-05 11:58:24','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2019-11-05 11:58:24','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/11/2019 11:58:25 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006616 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/11/2019 11:58:25 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006617,10,'Y','N','N',3002109,'N','Y',3000024,'N','LAR','Tipo de Cheque Emitido',100,0,TO_DATE('2019-11-05 11:58:25','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2019-11-05 11:58:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/11/2019 11:58:25 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006617 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/11/2019 11:58:36 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3006617
;

-- 05/11/2019 11:58:36 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE FROM AD_Field WHERE AD_Field_ID=3006617
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000815
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000816
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000817
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3003303
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000819
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3002729
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000820
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3002730
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000821
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3002804
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000822
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000825
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000846
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000826
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000827
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000828
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3003010
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000829
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000830
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000831
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000832
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000833
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000834
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000835
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000836
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000837
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000838
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000839
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000840
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000841
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000843
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000844
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000845
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000847
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000848
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000849
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000850
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000851
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000852
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000857
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000856
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000858
;

-- 05/11/2019 11:59:02 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3006616
;

-- 05/11/2019 11:59:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2019-11-05 11:59:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000816
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000817
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3003303
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000819
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3002729
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000820
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3002730
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000821
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3002804
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000822
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000825
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000846
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000826
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3000827
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000828
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3003010
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000829
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000830
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000831
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000832
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000833
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000834
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000835
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000836
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000837
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000838
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000839
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000840
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000841
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000810
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000811
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000812
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000814
;

-- 05/11/2019 11:59:51 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000816
;

-- 05/11/2019 12:00:14 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET AD_FieldGroup_ID=NULL,Updated=TO_DATE('2019-11-05 12:00:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000846
;

-- 05/11/2019 12:02:23 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2019-11-05 12:02:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002729
;

-- 05/11/2019 12:02:30 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2019-11-05 12:02:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002730
;

-- 05/11/2019 12:02:37 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2019-11-05 12:02:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002804
;

-- 05/11/2019 12:03:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET DisplayLogic='@TenderType@=C',Updated=TO_DATE('2019-11-05 12:03:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003303
;

-- 05/11/2019 12:03:50 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3002729
;

-- 05/11/2019 12:03:50 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3002730
;

-- 05/11/2019 12:03:50 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3002804
;

-- 05/11/2019 12:03:50 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3003303
;

-- 05/11/2019 12:03:50 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000819
;

-- 05/11/2019 12:03:50 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000820
;

-- 05/11/2019 12:03:50 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000821
;

-- 05/11/2019 12:06:23 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000822
;

-- 05/11/2019 12:06:23 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3003010
;

-- 05/11/2019 12:06:23 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000820
;

-- 05/11/2019 12:06:23 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000829
;

-- 05/11/2019 12:06:23 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000819
;

-- 05/11/2019 12:06:23 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000821
;

-- 05/11/2019 12:06:23 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3006616
;

-- 05/11/2019 12:06:23 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000825
;

-- 05/11/2019 12:06:23 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3003303
;

-- 05/11/2019 12:06:23 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3000846
;

-- 05/11/2019 12:06:23 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000826
;

-- 05/11/2019 12:06:23 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000827
;

-- 05/11/2019 12:06:23 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000828
;

-- 05/11/2019 12:06:50 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2019-11-05 12:06:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003010
;

-- 05/11/2019 12:07:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET DisplayLogic='@TenderType@=Z | @TenderType@=K',Updated=TO_DATE('2019-11-05 12:07:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000820
;

-- 05/11/2019 12:07:55 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET DisplayLogic='@TenderType@=C | @TenderType@=K |  @TenderType@=Z | @TenderType@=D',Updated=TO_DATE('2019-11-05 12:07:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000829
;

-- 05/11/2019 12:08:15 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET DisplayLogic='@TenderType@=C | @TenderType@=K |  @TenderType@=Z | @TenderType@=D',Updated=TO_DATE('2019-11-05 12:08:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000819
;

-- 05/11/2019 12:08:26 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2019-11-05 12:08:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000819
;

-- 05/11/2019 12:08:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET DisplayLogic='@TenderType@=K | @TenderType@=Z',Updated=TO_DATE('2019-11-05 12:08:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000821
;

-- 05/11/2019 12:09:10 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET IsSameLine='Y', DisplayLogic='@TenderType@=K | @TenderType@=Z',Updated=TO_DATE('2019-11-05 12:09:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006616
;

-- 05/11/2019 12:09:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET DisplayLogic='@TenderType@=C | @TenderType@=D',Updated=TO_DATE('2019-11-05 12:09:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000825
;

-- 05/11/2019 12:15:20 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006618,1,'Y','N','N',3001179,'N','Y',3000018,'N','LAR','DebitCardType',100,0,TO_DATE('2019-11-05 12:15:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2019-11-05 12:15:20','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/11/2019 12:15:20 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006618 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/11/2019 12:15:21 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006619,1,'Y','N','N',3003533,'N','Y',3000018,'N','LAR','Es Electrónico',100,0,TO_DATE('2019-11-05 12:15:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2019-11-05 12:15:20','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/11/2019 12:15:21 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006619 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/11/2019 12:15:21 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006620,1,'Y','N','N',3000832,'N','Y',3000018,'N','LAR','EsRetencionIIBB',100,0,TO_DATE('2019-11-05 12:15:21','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2019-11-05 12:15:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/11/2019 12:15:21 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006620 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/11/2019 12:15:21 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006621,1,'Y','N','N',3000965,'N','Y',3000018,'N','LAR','EsRetencionSufrida',100,0,TO_DATE('2019-11-05 12:15:21','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2019-11-05 12:15:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/11/2019 12:15:21 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006621 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/11/2019 12:15:21 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006622,29,'Y','N','N',3001958,'N','Y',3000018,'N','LAR','Fecha de Venc. Cheque',100,0,TO_DATE('2019-11-05 12:15:21','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2019-11-05 12:15:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/11/2019 12:15:21 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006622 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/11/2019 12:15:22 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006623,2,'Y','N','N',3002077,'N','Y',3000018,'N','LAR','Nro. Cuotas',100,0,TO_DATE('2019-11-05 12:15:21','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2019-11-05 12:15:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/11/2019 12:15:22 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006623 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/11/2019 12:15:22 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006624,10,'Y','N','N',3001205,'N','Y',3000018,'N','LAR','Plan de Pago',100,0,TO_DATE('2019-11-05 12:15:22','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2019-11-05 12:15:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/11/2019 12:15:22 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006624 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/11/2019 12:15:22 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006625,10,'Y','N','N',3001188,'N','Y',3000018,'N','LAR','Tarjeta de Crédito',100,0,TO_DATE('2019-11-05 12:15:22','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2019-11-05 12:15:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/11/2019 12:15:22 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006625 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/11/2019 12:15:22 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006626,10,'Y','N','N',3001772,'N','Y',3000018,'N','LAR','Tarjeta de Debito',100,0,TO_DATE('2019-11-05 12:15:22','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2019-11-05 12:15:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/11/2019 12:15:22 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006626 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/11/2019 12:15:22 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006627,10,'Y','N','N',3002109,'N','Y',3000018,'N','LAR','Tipo de Cheque Emitido',100,0,TO_DATE('2019-11-05 12:15:22','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2019-11-05 12:15:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/11/2019 12:15:22 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006627 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/11/2019 12:15:23 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006628,10,'Y','N','N',3001865,'N','Y',3000018,'N','LAR','Tipo de Depósito Directo',100,0,TO_DATE('2019-11-05 12:15:22','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2019-11-05 12:15:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/11/2019 12:15:23 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006628 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/11/2019 12:16:23 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3006618
;

-- 05/11/2019 12:16:23 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE FROM AD_Field WHERE AD_Field_ID=3006618
;

-- 05/11/2019 12:16:28 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3006620
;

-- 05/11/2019 12:16:28 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE FROM AD_Field WHERE AD_Field_ID=3006620
;

-- 05/11/2019 12:16:33 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3006621
;

-- 05/11/2019 12:16:33 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE FROM AD_Field WHERE AD_Field_ID=3006621
;

-- 05/11/2019 12:16:38 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3006623
;

-- 05/11/2019 12:16:38 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE FROM AD_Field WHERE AD_Field_ID=3006623
;

-- 05/11/2019 12:16:45 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3006624
;

-- 05/11/2019 12:16:45 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE FROM AD_Field WHERE AD_Field_ID=3006624
;

-- 05/11/2019 12:16:48 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3006625
;

-- 05/11/2019 12:16:48 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE FROM AD_Field WHERE AD_Field_ID=3006625
;

-- 05/11/2019 12:16:50 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3006626
;

-- 05/11/2019 12:16:50 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE FROM AD_Field WHERE AD_Field_ID=3006626
;

-- 05/11/2019 12:16:53 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3006627
;

-- 05/11/2019 12:16:53 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE FROM AD_Field WHERE AD_Field_ID=3006627
;

-- 05/11/2019 12:16:56 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3006628
;

-- 05/11/2019 12:16:56 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE FROM AD_Field WHERE AD_Field_ID=3006628
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000560
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000561
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000562
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000563
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000564
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000565
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000566
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000567
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000568
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000569
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000570
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000571
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000572
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000573
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000574
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000575
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000576
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000577
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000578
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000579
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000580
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000581
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000582
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000583
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000584
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000585
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000586
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000587
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000588
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000589
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000595
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000895
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000896
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000897
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3000597
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=3006619
;

-- 05/11/2019 12:18:54 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=680,IsDisplayed='Y' WHERE AD_Field_ID=3006622
;

-- 05/11/2019 12:20:20 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3006622
;

-- 05/11/2019 12:20:20 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000567
;

-- 05/11/2019 12:20:20 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000558
;

-- 05/11/2019 12:20:20 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000559
;

-- 05/11/2019 12:20:20 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3006619
;

-- 05/11/2019 12:20:20 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000556
;

-- 05/11/2019 12:20:20 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000561
;

-- 05/11/2019 12:20:20 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000562
;

-- 05/11/2019 12:20:20 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000563
;

-- 05/11/2019 12:20:20 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000564
;

-- 05/11/2019 12:20:20 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000565
;

-- 05/11/2019 12:20:20 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000566
;

-- 05/11/2019 12:20:20 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000568
;

-- 05/11/2019 12:20:20 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000569
;

-- 05/11/2019 12:20:20 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000570
;

-- 05/11/2019 12:20:20 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000571
;

-- 05/11/2019 12:20:20 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000572
;

-- 05/11/2019 12:20:20 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000573
;

-- 05/11/2019 12:20:20 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000574
;

-- 05/11/2019 12:20:20 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000575
;

-- 05/11/2019 12:20:20 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000576
;

-- 05/11/2019 12:20:20 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000577
;

-- 05/11/2019 12:20:20 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000578
;

-- 05/11/2019 12:20:20 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000579
;

-- 05/11/2019 12:20:20 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000580
;

-- 05/11/2019 12:20:20 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000581
;

-- 05/11/2019 12:20:20 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000582
;

-- 05/11/2019 12:20:20 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000583
;

-- 05/11/2019 12:20:20 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000584
;

-- 05/11/2019 12:20:21 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000585
;

-- 05/11/2019 12:20:21 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000586
;

-- 05/11/2019 12:20:21 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000587
;

-- 05/11/2019 12:20:21 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000588
;

-- 05/11/2019 12:20:21 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000589
;

-- 05/11/2019 12:20:21 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000595
;

-- 05/11/2019 12:20:21 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000895
;

-- 05/11/2019 12:20:21 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3000896
;

-- 05/11/2019 12:20:21 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=3000897
;

-- 05/11/2019 12:20:21 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=680,IsDisplayed='Y' WHERE AD_Field_ID=3000597
;

-- 05/11/2019 12:20:48 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2019-11-05 12:20:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000557
;

-- 05/11/2019 12:21:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2019-11-05 12:21:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006619
;

-- 05/11/2019 12:21:27 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET DisplayLogic='@TenderType@=K | @TenderType@=Z',Updated=TO_DATE('2019-11-05 12:21:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006619
;

-- 05/11/2019 12:21:35 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET DisplayLogic='@TenderType@=K | @TenderType@=Z',Updated=TO_DATE('2019-11-05 12:21:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006622
;

-- 05/11/2019 12:27:30 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006629,1,'Y','N','N',3001179,'N','Y',3000034,'N','LAR','DebitCardType',100,0,TO_DATE('2019-11-05 12:27:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2019-11-05 12:27:30','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/11/2019 12:27:30 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006629 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/11/2019 12:27:30 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006630,1,'Y','N','N',3003533,'N','Y',3000034,'N','LAR','Es Electrónico',100,0,TO_DATE('2019-11-05 12:27:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2019-11-05 12:27:30','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/11/2019 12:27:30 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006630 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/11/2019 12:27:31 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006631,1,'Y','N','N',3000832,'N','Y',3000034,'N','LAR','EsRetencionIIBB',100,0,TO_DATE('2019-11-05 12:27:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2019-11-05 12:27:30','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/11/2019 12:27:31 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006631 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/11/2019 12:27:31 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006632,1,'Y','N','N',3000965,'N','Y',3000034,'N','LAR','EsRetencionSufrida',100,0,TO_DATE('2019-11-05 12:27:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2019-11-05 12:27:31','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/11/2019 12:27:31 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006632 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/11/2019 12:27:31 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006633,29,'Y','N','N',3001958,'N','Y',3000034,'N','LAR','Fecha de Venc. Cheque',100,0,TO_DATE('2019-11-05 12:27:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2019-11-05 12:27:31','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/11/2019 12:27:31 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006633 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/11/2019 12:27:31 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006634,2,'Y','N','N',3002077,'N','Y',3000034,'N','LAR','Nro. Cuotas',100,0,TO_DATE('2019-11-05 12:27:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2019-11-05 12:27:31','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/11/2019 12:27:31 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006634 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/11/2019 12:27:32 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006635,10,'Y','N','N',3001205,'N','Y',3000034,'N','LAR','Plan de Pago',100,0,TO_DATE('2019-11-05 12:27:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2019-11-05 12:27:31','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/11/2019 12:27:32 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006635 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/11/2019 12:27:32 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006636,10,'Y','N','N',3001188,'N','Y',3000034,'N','LAR','Tarjeta de Crédito',100,0,TO_DATE('2019-11-05 12:27:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2019-11-05 12:27:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/11/2019 12:27:32 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006636 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/11/2019 12:27:32 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006637,10,'Y','N','N',3001772,'N','Y',3000034,'N','LAR','Tarjeta de Debito',100,0,TO_DATE('2019-11-05 12:27:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2019-11-05 12:27:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/11/2019 12:27:32 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006637 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/11/2019 12:27:32 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006638,10,'Y','N','N',3002109,'N','Y',3000034,'N','LAR','Tipo de Cheque Emitido',100,0,TO_DATE('2019-11-05 12:27:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2019-11-05 12:27:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/11/2019 12:27:32 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006638 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/11/2019 12:27:33 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006639,10,'Y','N','N',3001865,'N','Y',3000034,'N','LAR','Tipo de Depósito Directo',100,0,TO_DATE('2019-11-05 12:27:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2019-11-05 12:27:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/11/2019 12:27:33 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006639 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/11/2019 12:28:22 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3006636
;

-- 05/11/2019 12:28:22 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE FROM AD_Field WHERE AD_Field_ID=3006636
;

-- 05/11/2019 12:28:25 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3006637
;

-- 05/11/2019 12:28:25 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE FROM AD_Field WHERE AD_Field_ID=3006637
;

-- 05/11/2019 12:28:29 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3006638
;

-- 05/11/2019 12:28:29 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE FROM AD_Field WHERE AD_Field_ID=3006638
;

-- 05/11/2019 12:28:31 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3006639
;

-- 05/11/2019 12:28:31 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE FROM AD_Field WHERE AD_Field_ID=3006639
;

-- 05/11/2019 12:28:36 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3006629
;

-- 05/11/2019 12:28:36 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE FROM AD_Field WHERE AD_Field_ID=3006629
;

-- 05/11/2019 12:28:41 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3006631
;

-- 05/11/2019 12:28:41 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE FROM AD_Field WHERE AD_Field_ID=3006631
;

-- 05/11/2019 12:28:45 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3006632
;

-- 05/11/2019 12:28:45 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE FROM AD_Field WHERE AD_Field_ID=3006632
;

-- 05/11/2019 12:28:49 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3006634
;

-- 05/11/2019 12:28:49 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE FROM AD_Field WHERE AD_Field_ID=3006634
;

-- 05/11/2019 12:28:52 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3006635
;

-- 05/11/2019 12:28:52 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
DELETE FROM AD_Field WHERE AD_Field_ID=3006635
;

-- 05/11/2019 12:30:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3006633
;

-- 05/11/2019 12:30:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3001370
;

-- 05/11/2019 12:30:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3001361
;

-- 05/11/2019 12:30:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3001362
;

-- 05/11/2019 12:30:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3006630
;

-- 05/11/2019 12:30:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3001359
;

-- 05/11/2019 12:30:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3001363
;

-- 05/11/2019 12:30:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3001364
;

-- 05/11/2019 12:30:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3001365
;

-- 05/11/2019 12:30:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3001366
;

-- 05/11/2019 12:30:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3001367
;

-- 05/11/2019 12:30:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3001368
;

-- 05/11/2019 12:30:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3001369
;

-- 05/11/2019 12:30:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3001371
;

-- 05/11/2019 12:30:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3001372
;

-- 05/11/2019 12:30:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3001373
;

-- 05/11/2019 12:30:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3001374
;

-- 05/11/2019 12:30:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3001375
;

-- 05/11/2019 12:30:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3001376
;

-- 05/11/2019 12:30:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3001377
;

-- 05/11/2019 12:30:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3001378
;

-- 05/11/2019 12:30:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3001379
;

-- 05/11/2019 12:30:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3001380
;

-- 05/11/2019 12:30:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3001381
;

-- 05/11/2019 12:30:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3001382
;

-- 05/11/2019 12:30:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3001383
;

-- 05/11/2019 12:30:12 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3001384
;

-- 05/11/2019 12:30:12 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3001385
;

-- 05/11/2019 12:30:12 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3001386
;

-- 05/11/2019 12:30:12 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3001387
;

-- 05/11/2019 12:30:12 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3001388
;

-- 05/11/2019 12:30:12 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3001389
;

-- 05/11/2019 12:30:12 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3001390
;

-- 05/11/2019 12:30:12 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3001391
;

-- 05/11/2019 12:30:12 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3001320
;

-- 05/11/2019 12:30:12 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3001392
;

-- 05/11/2019 12:30:12 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3001393
;

-- 05/11/2019 12:30:12 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=3001394
;

-- 05/11/2019 12:30:12 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=680,IsDisplayed='Y' WHERE AD_Field_ID=3001395
;

-- 05/11/2019 12:30:12 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=690,IsDisplayed='Y' WHERE AD_Field_ID=3001322
;

-- 05/11/2019 12:30:37 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2019-11-05 12:30:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001360
;

-- 05/11/2019 12:30:50 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET DisplayLogic='@TenderType@=K | @TenderType@=Z',Updated=TO_DATE('2019-11-05 12:30:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006633
;

-- 05/11/2019 12:31:06 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2019-11-05 12:31:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006630
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001363
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3001364
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3001365
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3001366
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3001367
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3001368
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3001369
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3001371
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3001372
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3001373
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3001374
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3001375
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3001376
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3001377
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3001378
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3001379
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3001380
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3001381
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3001382
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3001383
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3001384
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3001385
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3001386
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3001387
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3001388
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3001389
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3001390
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3001391
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3001320
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3001392
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3001393
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3001394
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=3001395
;

-- 05/11/2019 12:31:34 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=680,IsDisplayed='Y' WHERE AD_Field_ID=3001322
;

-- 05/11/2019 12:34:24 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001359
;

-- 05/11/2019 12:34:24 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3001364
;

-- 05/11/2019 12:34:24 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3001365
;

-- 05/11/2019 12:34:24 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3001366
;

-- 05/11/2019 12:34:24 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3001367
;

-- 05/11/2019 12:34:24 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3001368
;

-- 05/11/2019 12:34:24 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3001369
;

-- 05/11/2019 12:34:24 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3001371
;

-- 05/11/2019 12:34:24 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3001372
;

-- 05/11/2019 12:34:24 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3001373
;

-- 05/11/2019 12:34:24 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3001374
;

-- 05/11/2019 12:34:24 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3001375
;

-- 05/11/2019 12:34:24 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3001376
;

-- 05/11/2019 12:34:24 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3001377
;

-- 05/11/2019 12:34:24 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3001378
;

-- 05/11/2019 12:34:24 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3001379
;

-- 05/11/2019 12:34:24 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3001380
;

-- 05/11/2019 12:34:24 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3001381
;

-- 05/11/2019 12:34:24 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3001382
;

-- 05/11/2019 12:34:24 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3001383
;

-- 05/11/2019 12:34:24 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3001384
;

-- 05/11/2019 12:34:24 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3001385
;

-- 05/11/2019 12:34:24 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3001386
;

-- 05/11/2019 12:34:24 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3001387
;

-- 05/11/2019 12:34:24 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3001388
;

-- 05/11/2019 12:34:25 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3001389
;

-- 05/11/2019 12:34:25 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3001390
;

-- 05/11/2019 12:34:25 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3001391
;

-- 05/11/2019 12:34:25 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3001320
;

-- 05/11/2019 12:34:25 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3001392
;

-- 05/11/2019 12:34:25 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3001393
;

-- 05/11/2019 12:34:25 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3001394
;

-- 05/11/2019 12:34:25 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3001395
;

-- 05/11/2019 12:34:25 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=3001322
;

-- 05/11/2019 12:37:45 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006640,1,'Y','N','N',3003533,'N','Y',3000016,'N','LAR','Es Electrónico',100,0,TO_DATE('2019-11-05 12:37:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2019-11-05 12:37:45','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/11/2019 12:37:45 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006640 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/11/2019 12:42:05 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3002769
;

-- 05/11/2019 12:42:05 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3002770
;

-- 05/11/2019 12:42:05 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3002806
;

-- 05/11/2019 12:42:05 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3000452
;

-- 05/11/2019 12:42:05 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000453
;

-- 05/11/2019 12:42:05 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000454
;

-- 05/11/2019 12:42:05 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000455
;

-- 05/11/2019 12:42:05 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3003311
;

-- 05/11/2019 12:42:05 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3006640
;

-- 05/11/2019 12:42:19 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2019-11-05 12:42:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003313
;

-- 05/11/2019 12:42:26 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2019-11-05 12:42:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002769
;

-- 05/11/2019 12:42:29 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2019-11-05 12:42:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002770
;

-- 05/11/2019 12:42:37 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2019-11-05 12:42:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002806
;

-- 05/11/2019 12:44:26 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000455
;

-- 05/11/2019 12:44:26 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3003311
;

-- 05/11/2019 12:44:27 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000452
;

-- 05/11/2019 12:44:27 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000462
;

-- 05/11/2019 12:44:27 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000453
;

-- 05/11/2019 12:44:27 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000454
;

-- 05/11/2019 12:44:27 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3006640
;

-- 05/11/2019 12:44:27 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000458
;

-- 05/11/2019 12:44:27 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000459
;

-- 05/11/2019 12:44:27 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000460
;

-- 05/11/2019 12:44:27 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000461
;

-- 05/11/2019 12:46:11 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2019-11-05 12:46:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000452
;

-- 05/11/2019 12:46:23 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2019-11-05 12:46:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006640
;

-- 05/11/2019 12:46:37 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET DisplayLogic='@TenderType@=K | @TenderType@=Z',Updated=TO_DATE('2019-11-05 12:46:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006640
;

-- 05/11/2019 12:47:55 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET DisplayLogic='@TenderType@=C | @TenderType@=K | @TenderType@=Z | @TenderType@=D',Updated=TO_DATE('2019-11-05 12:47:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000462
;

-- 05/11/2019 12:48:18 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET DisplayLogic='@TenderType@=C | @TenderType@=D',Updated=TO_DATE('2019-11-05 12:48:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000458
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000556
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000561
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000562
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000563
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000564
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000565
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000566
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000568
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000569
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000570
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000571
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000572
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000573
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000574
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000575
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000576
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000577
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000578
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000579
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000580
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000581
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000582
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000583
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000584
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000585
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000586
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000587
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000588
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000589
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000595
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000895
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000896
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3000897
;

-- 05/11/2019 13:05:47 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=3000597
;

-- 05/11/2019 13:20:46 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3002719
;

-- 05/11/2019 13:20:46 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000327
;

-- 05/11/2019 13:20:49 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000327
;

-- 05/11/2019 13:20:49 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3002719
;

-- 05/11/2019 13:25:48 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2019-11-05 13:25:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001624
;

-- 05/11/2019 13:28:41 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET AD_FieldGroup_ID=NULL,Updated=TO_DATE('2019-11-05 13:28:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001624
;

-- 05/11/2019 13:28:49 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET AD_FieldGroup_ID=103,Updated=TO_DATE('2019-11-05 13:28:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001624
;

-- 05/11/2019 13:29:03 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET AD_FieldGroup_ID=NULL,Updated=TO_DATE('2019-11-05 13:29:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000327
;

-- 05/11/2019 13:29:08 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET AD_FieldGroup_ID=125,Updated=TO_DATE('2019-11-05 13:29:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000327
;

-- 05/11/2019 14:01:10 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000453
;

-- 05/11/2019 14:01:10 ART
-- ISSUE #127: Nueva columna es Cheque Electronico.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000452
;

-- Registración de script
SELECT register_migration_script_lar('0143_ISSUE-127.sql', 'LAR', '') FROM dual
;
