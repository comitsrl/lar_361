ALTER TABLE C_Order ADD COLUMN Turno_Entrega character(1);

ALTER TABLE C_Order ADD COLUMN ImprimirEnvio character(1) NOT NULL DEFAULT 'N';

ALTER TABLE C_Order ADD CONSTRAINT c_order_imprimirenvio_check CHECK (ImprimirEnvio = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]));

-- 06/10/2017 19:49:34 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000467,'turno_entrega','LAR','turno_entrega','turno_entrega',0,TO_DATE('2017-10-06 19:49:34','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2017-10-06 19:49:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 06/10/2017 19:49:34 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000467 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 06/10/2017 19:49:35 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3002127,259,'LAR',0,'N','N','N','N',1,'N',20,'N',3000467,'N','Y','N','turno_entrega','turno_entrega',100,TO_DATE('2017-10-06 19:49:34','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-10-06 19:49:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 06/10/2017 19:49:35 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3002127 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 06/10/2017 19:50:48 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Element SET ColumnName='Turno_Entrega', Name='Turno de Entrega', PrintName='Turno de Entrega',Updated=TO_DATE('2017-10-06 19:50:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000467
;

-- 06/10/2017 19:50:48 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000467
;

-- 06/10/2017 19:50:48 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Column SET ColumnName='Turno_Entrega', Name='Turno de Entrega', Description=NULL, Help=NULL WHERE AD_Element_ID=3000467
;

-- 06/10/2017 19:50:48 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Process_Para SET ColumnName='Turno_Entrega', Name='Turno de Entrega', Description=NULL, Help=NULL, AD_Element_ID=3000467 WHERE UPPER(ColumnName)='TURNO_ENTREGA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 06/10/2017 19:50:48 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Process_Para SET ColumnName='Turno_Entrega', Name='Turno de Entrega', Description=NULL, Help=NULL WHERE AD_Element_ID=3000467 AND IsCentrallyMaintained='Y'
;

-- 06/10/2017 19:50:48 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET Name='Turno de Entrega', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000467) AND IsCentrallyMaintained='Y'
;

-- 06/10/2017 19:50:48 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_PrintFormatItem pi SET PrintName='Turno de Entrega', Name='Turno de Entrega' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000467)
;

-- 06/10/2017 19:50:57 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Element_Trl SET Name='Turno de Entrega',PrintName='Turno de Entrega',Updated=TO_DATE('2017-10-06 19:50:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000467 AND AD_Language='es_AR'
;

-- 06/10/2017 19:51:58 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000067,'L','LAR','N','Turnos',0,0,100,TO_DATE('2017-10-06 19:51:57','YYYY-MM-DD HH24:MI:SS'),'Y',TO_DATE('2017-10-06 19:51:57','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 06/10/2017 19:51:58 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000067 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 06/10/2017 19:52:22 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000150,3000067,'LAR','M','Mañana',TO_DATE('2017-10-06 19:52:22','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2017-10-06 19:52:22','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 06/10/2017 19:52:22 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000150 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 06/10/2017 19:52:32 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000151,3000067,'U','T','Tarde',TO_DATE('2017-10-06 19:52:31','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2017-10-06 19:52:31','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 06/10/2017 19:52:32 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000151 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 06/10/2017 19:53:17 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Column SET AD_Reference_Value_ID=3000067, AD_Reference_ID=17, Name='Turno de Entrega', ColumnName='Turno_Entrega',Updated=TO_DATE('2017-10-06 19:53:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002127
;

-- 06/10/2017 19:53:24 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Column_Trl SET Name='Turno de Entrega',Updated=TO_DATE('2017-10-06 19:53:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002127 AND AD_Language='es_AR'
;

-- 06/10/2017 19:55:05 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003385,22,'Y','N','N',55322,'N','Y',186,'N','D','This field links a sales order to the purchase order that is generated from it.','Linked Order',100,0,'Y',TO_DATE('2017-10-06 19:55:05','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-10-06 19:55:05','YYYY-MM-DD HH24:MI:SS'))
;

-- 06/10/2017 19:55:05 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003385 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 06/10/2017 19:55:05 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003386,1,'Y','N','N',3000887,'N','Y',186,'N','LAR','PrintShipment',100,0,'Y',TO_DATE('2017-10-06 19:55:05','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-10-06 19:55:05','YYYY-MM-DD HH24:MI:SS'))
;

-- 06/10/2017 19:55:05 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003386 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 06/10/2017 19:55:06 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003387,20,'Y','N','N',59038,'N','Y',186,'N','The ProcessedOn Date+Time save the exact moment (nanoseconds precision if allowed by the DB) when a document has been processed.','D','The date+time (expressed in decimal format) when the document has been processed','Processed On',100,0,'Y',TO_DATE('2017-10-06 19:55:05','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-10-06 19:55:05','YYYY-MM-DD HH24:MI:SS'))
;

-- 06/10/2017 19:55:06 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003387 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 06/10/2017 19:55:07 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003388,1,'Y','N','N',3002127,'N','Y',186,'N','LAR','Turno de Entrega',100,0,'Y',TO_DATE('2017-10-06 19:55:06','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-10-06 19:55:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 06/10/2017 19:55:07 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003388 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 06/10/2017 19:55:07 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003389,22,'Y','N','N',15899,'N','Y',186,'N','The Volume indicates the volume of the product in the Volume UOM of the Client','D','Volume of a product','Volume',100,0,'Y',TO_DATE('2017-10-06 19:55:07','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-10-06 19:55:07','YYYY-MM-DD HH24:MI:SS'))
;

-- 06/10/2017 19:55:07 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003389 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 06/10/2017 19:55:07 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003390,22,'Y','N','N',15900,'N','Y',186,'N','The Weight indicates the weight  of the product in the Weight UOM of the Client','D','Weight of a product','Weight',100,0,'Y',TO_DATE('2017-10-06 19:55:07','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-10-06 19:55:07','YYYY-MM-DD HH24:MI:SS'))
;

-- 06/10/2017 19:55:07 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003390 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 06/10/2017 19:56:11 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3003385
;

-- 06/10/2017 19:56:11 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3003386
;

-- 06/10/2017 19:56:11 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3003387
;

-- 06/10/2017 19:56:11 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3003389
;

-- 06/10/2017 19:56:11 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3003390
;

-- 06/10/2017 19:56:11 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3001993
;

-- 06/10/2017 19:56:11 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=2593
;

-- 06/10/2017 19:56:11 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=2589
;

-- 06/10/2017 19:56:11 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=1324
;

-- 06/10/2017 19:56:11 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=7038
;

-- 06/10/2017 19:56:11 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=7826
;

-- 06/10/2017 19:56:11 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=7825
;

-- 06/10/2017 19:56:11 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=1112
;

-- 06/10/2017 19:56:11 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=1113
;

-- 06/10/2017 19:56:11 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=1082
;

-- 06/10/2017 19:56:11 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=1084
;

-- 06/10/2017 19:56:11 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=60922
;

-- 06/10/2017 19:56:11 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=6560
;

-- 06/10/2017 19:56:11 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=60972
;

-- 06/10/2017 19:56:11 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000750
;

-- 06/10/2017 19:56:11 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=1083
;

-- 06/10/2017 19:56:11 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3660
;

-- 06/10/2017 19:56:11 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3003388
;

-- 06/10/2017 19:58:48 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=60972
;

-- 06/10/2017 19:58:48 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000750
;

-- 06/10/2017 19:58:48 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=1083
;

-- 06/10/2017 19:58:48 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3660
;

-- 06/10/2017 19:58:48 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=1090
;

-- 06/10/2017 19:58:48 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3001597
;

-- 06/10/2017 19:58:48 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3003388
;

-- 06/10/2017 20:00:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3003388
;

-- 06/10/2017 20:00:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=2594
;

-- 06/10/2017 20:00:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=1112
;

-- 06/10/2017 20:00:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=1113
;

-- 06/10/2017 20:00:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=1082
;

-- 06/10/2017 20:00:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=1084
;

-- 06/10/2017 20:00:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=60922
;

-- 06/10/2017 20:00:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=6560
;

-- 06/10/2017 20:00:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000750
;

-- 06/10/2017 20:00:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=1083
;

-- 06/10/2017 20:00:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3660
;

-- 06/10/2017 20:00:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=1090
;

-- 06/10/2017 20:00:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3001597
;

-- 09/10/2017 18:04:08 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000469,'imprimirenvio','LAR','imprimirenvio','imprimirenvio',0,TO_DATE('2017-10-09 18:04:07','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2017-10-09 18:04:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 09/10/2017 18:04:08 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000469 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 09/10/2017 18:04:08 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3002129,259,'LAR',0,'Y','N','N','N',1,'N',20,'N',3000469,'N','Y','N','imprimirenvio','imprimirenvio',100,TO_DATE('2017-10-09 18:04:07','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-10-09 18:04:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/10/2017 18:04:08 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3002129 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/10/2017 18:04:59 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Column SET Name='Imprimir Envío', ColumnName='ImprimirEnvio',Updated=TO_DATE('2017-10-09 18:04:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002129
;

-- 09/10/2017 18:04:59 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3002129
;

-- 09/10/2017 18:04:59 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET Name='Imprimir Envío', Description=NULL, Help=NULL WHERE AD_Column_ID=3002129 AND IsCentrallyMaintained='Y'
;

-- 09/10/2017 18:05:04 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Column_Trl SET Name='Imprimir Envío',Updated=TO_DATE('2017-10-09 18:05:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002129 AND AD_Language='es_AR'
;

-- 09/10/2017 18:05:28 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Element SET ColumnName='ImprimirEnvio', Name='Imprimir Envío', PrintName='Imprimir Envío',Updated=TO_DATE('2017-10-09 18:05:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000469
;

-- 09/10/2017 18:05:28 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000469
;

-- 09/10/2017 18:05:28 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Column SET ColumnName='ImprimirEnvio', Name='Imprimir Envío', Description=NULL, Help=NULL WHERE AD_Element_ID=3000469
;

-- 09/10/2017 18:05:28 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Process_Para SET ColumnName='ImprimirEnvio', Name='Imprimir Envío', Description=NULL, Help=NULL, AD_Element_ID=3000469 WHERE UPPER(ColumnName)='IMPRIMIRENVIO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 09/10/2017 18:05:28 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Process_Para SET ColumnName='ImprimirEnvio', Name='Imprimir Envío', Description=NULL, Help=NULL WHERE AD_Element_ID=3000469 AND IsCentrallyMaintained='Y'
;

-- 09/10/2017 18:05:28 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET Name='Imprimir Envío', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000469) AND IsCentrallyMaintained='Y'
;

-- 09/10/2017 18:05:28 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_PrintFormatItem pi SET PrintName='Imprimir Envío', Name='Imprimir Envío' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000469)
;

-- 09/10/2017 18:05:36 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Element_Trl SET Name='Imprimir Envío',PrintName='Imprimir Envío',Updated=TO_DATE('2017-10-09 18:05:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000469 AND AD_Language='es_AR'
;

-- 09/10/2017 18:09:30 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3003388
;

-- 09/10/2017 18:18:50 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET DisplayLogic='@ImprimirEnvio@=''Y''',Updated=TO_DATE('2017-10-09 18:18:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=1094
;

-- 09/10/2017 18:19:33 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET DisplayLogic='@ImprimirEnvio@=''Y''',Updated=TO_DATE('2017-10-09 18:19:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003388
;

-- 09/10/2017 18:20:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=6562
;

-- 09/10/2017 18:20:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=1093
;

-- 09/10/2017 18:20:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3003388
;

-- 09/10/2017 18:20:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=10124
;

-- 09/10/2017 18:20:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=55410
;

-- 09/10/2017 18:20:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=55411
;

-- 09/10/2017 18:20:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=55412
;

-- 09/10/2017 18:20:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=1108
;

-- 09/10/2017 18:20:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=1109
;

-- 09/10/2017 18:20:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=2878
;

-- 09/10/2017 18:20:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=56446
;

-- 09/10/2017 18:20:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=1107
;

-- 09/10/2017 18:20:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=1104
;

-- 09/10/2017 18:20:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=1077
;

-- 09/10/2017 18:20:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=1103
;

-- 09/10/2017 18:20:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=8653
;

-- 09/10/2017 18:20:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=1098
;

-- 09/10/2017 18:20:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3272
;

-- 09/10/2017 18:20:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=2112
;

-- 09/10/2017 18:20:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=2109
;

-- 09/10/2017 18:20:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3113
;

-- 09/10/2017 18:20:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=1099
;

-- 09/10/2017 18:20:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=56906
;

-- 09/10/2017 18:20:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3001993
;

-- 09/10/2017 18:20:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=2593
;

-- 09/10/2017 18:20:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=2589
;

-- 09/10/2017 18:20:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=1324
;

-- 09/10/2017 18:20:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=7038
;

-- 09/10/2017 18:20:55 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=7826
;

-- 09/10/2017 18:20:56 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=7825
;

-- 09/10/2017 18:20:56 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=2594
;

-- 09/10/2017 18:20:56 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=1112
;

-- 09/10/2017 18:20:56 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=1113
;

-- 09/10/2017 18:20:56 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=1082
;

-- 09/10/2017 18:20:56 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=1084
;

-- 09/10/2017 18:20:56 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=60922
;

-- 09/10/2017 18:20:56 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=6560
;

-- 09/10/2017 18:20:56 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000750
;

-- 09/10/2017 18:20:56 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=1083
;

-- 09/10/2017 18:20:56 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3660
;

-- 09/10/2017 18:20:56 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=1090
;

-- 09/10/2017 18:20:56 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3001597
;

-- 09/10/2017 18:21:46 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET IsSameLine='Y', AD_FieldGroup_ID=130,Updated=TO_DATE('2017-10-09 18:21:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003388
;

-- 09/10/2017 20:46:36 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003391,1,'Y','N','N',3002129,'N','Y',186,'N','LAR','Imprimir Envío',100,0,'Y',TO_DATE('2017-10-09 20:46:35','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-10-09 20:46:35','YYYY-MM-DD HH24:MI:SS'))
;

-- 09/10/2017 20:46:36 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003391 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/10/2017 20:46:44 ART
-- BUG #381: Agregar Campo Turno de Entrega en la OV
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3003391
;

-- Registración de script
SELECT register_migration_script_lar('0098_ISSUE-86.sql', 'LAR', '')
;
