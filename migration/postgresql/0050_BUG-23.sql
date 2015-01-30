ALTER TABLE C_Payment ADD COLUMN EsRetencionSufrida CHAR(1) NOT NULL DEFAULT 'N'
;
-- 05/01/2015 8:26:25 ART
-- BUG #23: Retenciones en Cobros
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000176,'esretencionsufrida','LAR','esretencionsufrida','esretencionsufrida',0,TO_TIMESTAMP('2015-01-05 08:26:25','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2015-01-05 08:26:25','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 05/01/2015 8:26:25 ART
-- BUG #23: Retenciones en Cobros
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000176 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 05/01/2015 8:26:26 ART
-- BUG #23: Retenciones en Cobros
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000965,335,'LAR',0,'Y','N','N','N',1,'N',20,'N',3000176,'N','Y','N','esretencionsufrida','esretencionsufrida',100,TO_TIMESTAMP('2015-01-05 08:26:25','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-01-05 08:26:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/01/2015 8:26:26 ART
-- BUG #23: Retenciones en Cobros
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000965 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 05/01/2015 8:27:10 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Element SET ColumnName='EsRetencionSufrida', Name='EsRetencionSufrida', PrintName='EsRetencionSufrida',Updated=TO_TIMESTAMP('2015-01-05 08:27:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000176
;

-- 05/01/2015 8:27:10 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000176
;

-- 05/01/2015 8:27:10 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Column SET ColumnName='EsRetencionSufrida', Name='EsRetencionSufrida', Description=NULL, Help=NULL WHERE AD_Element_ID=3000176
;

-- 05/01/2015 8:27:10 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Process_Para SET ColumnName='EsRetencionSufrida', Name='EsRetencionSufrida', Description=NULL, Help=NULL, AD_Element_ID=3000176 WHERE UPPER(ColumnName)='ESRETENCIONSUFRIDA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 05/01/2015 8:27:10 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Process_Para SET ColumnName='EsRetencionSufrida', Name='EsRetencionSufrida', Description=NULL, Help=NULL WHERE AD_Element_ID=3000176 AND IsCentrallyMaintained='Y'
;

-- 05/01/2015 8:27:10 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET Name='EsRetencionSufrida', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000176) AND IsCentrallyMaintained='Y'
;

-- 05/01/2015 8:27:10 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_PrintFormatItem SET PrintName='EsRetencionSufrida', Name='EsRetencionSufrida' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000176)
;

-- 05/01/2015 8:29:35 ART
-- BUG #23: Retenciones en Cobros
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001623,1,'Y','N','N',3000832,'N','Y',3000013,'N','LAR','EsRetencionIIBB',100,0,TO_TIMESTAMP('2015-01-05 08:29:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2015-01-05 08:29:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/01/2015 8:29:35 ART
-- BUG #23: Retenciones en Cobros
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001623 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/01/2015 8:29:35 ART
-- BUG #23: Retenciones en Cobros
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001624,1,'Y','N','N',3000965,'N','Y',3000013,'N','LAR','EsRetencionSufrida',100,0,TO_TIMESTAMP('2015-01-05 08:29:35','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2015-01-05 08:29:35','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/01/2015 8:29:35 ART
-- BUG #23: Retenciones en Cobros
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001624 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/01/2015 8:29:35 ART
-- BUG #23: Retenciones en Cobros
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001625,1,'Y','N','N',3000825,'N','Y',3000013,'N','LAR','IsBounced',100,0,TO_TIMESTAMP('2015-01-05 08:29:35','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2015-01-05 08:29:35','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/01/2015 8:29:35 ART
-- BUG #23: Retenciones en Cobros
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001625 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/01/2015 8:29:36 ART
-- BUG #23: Retenciones en Cobros
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001626,1,'Y','N','N',3000826,'N','Y',3000013,'N','LAR','IsDeposited',100,0,TO_TIMESTAMP('2015-01-05 08:29:35','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2015-01-05 08:29:35','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/01/2015 8:29:36 ART
-- BUG #23: Retenciones en Cobros
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001626 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/01/2015 8:29:36 ART
-- BUG #23: Retenciones en Cobros
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001627,60,'Y','N','N',3000824,'N','Y',3000013,'N','LAR','TargetAccount',100,0,TO_TIMESTAMP('2015-01-05 08:29:36','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2015-01-05 08:29:36','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/01/2015 8:29:36 ART
-- BUG #23: Retenciones en Cobros
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001627 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001623
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001625
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001626
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001627
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3001624
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000318
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000319
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000320
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000321
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000322
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000886
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000888
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000323
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000324
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000327
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000328
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3000329
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000330
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000331
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000332
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000333
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000334
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000335
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000336
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000337
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000338
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000339
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000340
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000341
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000342
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000343
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000344
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000345
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000346
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000347
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000348
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000349
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000350
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000351
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000352
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000353
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000354
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000355
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000356
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000357
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000358
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000359
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000360
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000363
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000302
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000364
;

-- 05/01/2015 8:31:01 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000362
;

-- 05/01/2015 8:31:02 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000289
;

-- 05/01/2015 8:31:02 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3000366
;

-- 05/01/2015 8:31:02 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=3000368
;

-- 05/01/2015 8:31:02 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET SeqNo=680,IsDisplayed='Y' WHERE AD_Field_ID=3000369
;

-- 05/01/2015 8:31:31 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET AD_FieldGroup_ID=103,Updated=TO_TIMESTAMP('2015-01-05 08:31:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001624
;

-- 05/01/2015 8:32:32 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET DisplayLogic='@EsRetencionSufrida@=''N''',Updated=TO_TIMESTAMP('2015-01-05 08:32:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000318
;

-- 05/01/2015 8:32:43 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET DisplayLogic='@EsRetencionSufrida@=''N''',Updated=TO_TIMESTAMP('2015-01-05 08:32:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000319
;

-- 05/01/2015 8:32:58 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET DisplayLogic='@C_Currency_ID@!@$C_Currency_ID@ & @EsRetencionSufrida@=''N''',Updated=TO_TIMESTAMP('2015-01-05 08:32:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000320
;

-- 05/01/2015 8:33:23 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET DisplayLogic='@C_Invoice_ID@^'''' & @EsRetencionSufrida@=''N''',Updated=TO_TIMESTAMP('2015-01-05 08:33:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000321
;

-- 05/01/2015 8:33:40 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET DisplayLogic='@C_Invoice_ID@^'''' & @EsRetencionSufrida@=''Y''',Updated=TO_TIMESTAMP('2015-01-05 08:33:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000322
;

-- 05/01/2015 8:34:24 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET DisplayLogic='@C_Invoice_ID@^'''' & @EsRetencionSufrida@=''N''',Updated=TO_TIMESTAMP('2015-01-05 08:34:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000323
;

-- 05/01/2015 8:34:32 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET DisplayLogic='@IsOverUnderPayment@=Y & @C_Invoice_ID@^'''' & @EsRetencionSufrida@=''N''',Updated=TO_TIMESTAMP('2015-01-05 08:34:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000324
;

-- 05/01/2015 8:41:35 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET DisplayLogic='@C_Invoice_ID@^'''' &  @EsRetencionSufrida@=''Y''',Updated=TO_TIMESTAMP('2015-01-05 08:41:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000886
;

-- 05/01/2015 8:42:28 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field SET DisplayLogic='@C_Invoice_ID@^'''' & @EsRetencionSufrida@=''Y''',Updated=TO_TIMESTAMP('2015-01-05 08:42:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000888
;

-- 29/01/2015 18:27:49 ART
-- BUG #23: Retenciones en Cobros
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Es Retención Sufrida',Updated=TO_TIMESTAMP('2015-01-29 18:27:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001624 AND AD_Language='es_AR'
;

-- Registración de Script
SELECT register_migration_script_lar('0050_BUG-23.sql','LAR_Leimat','');
