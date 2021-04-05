-- Se crea la nueva columna OpcionTransferenciaFCE en C_BPartner 
ALTER TABLE C_BPartner ADD COLUMN OpcionTransferenciaFCE character(3);

-- Configurar la opción por defecto SCA = 'TRANSFERENCIA AL SISTEMA DE CIRCULACION ABIERTA'
ALTER TABLE C_BPartner ALTER COLUMN OpcionTransferenciaFCE SET DEFAULT 'SCA'::bpchar;

-- Se crea la nueva columna OpcionTransferenciaFCE en C_Order
ALTER TABLE C_Order ADD COLUMN OpcionTransferenciaFCE character(3);

-- Se crea la nueva columna OpcionTransferenciaFCE en C_Invoice
ALTER TABLE C_Invoice ADD COLUMN OpcionTransferenciaFCE character(3);

-- 05/04/2021 14:16:36 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001091,'opciontransferenciafce','LAR','opciontransferenciafce','opciontransferenciafce',0,TO_DATE('2021-04-05 14:16:36','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-04-05 14:16:36','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 05/04/2021 14:16:36 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001091 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 05/04/2021 14:16:36 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003688,291,'LAR',0,'N','N','N','N',3,'N',17,'N',3001091,'N','Y','N','opciontransferenciafce','opciontransferenciafce',100,TO_DATE('2021-04-05 14:16:36','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2021-04-05 14:16:36','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/04/2021 14:16:36 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003688 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 05/04/2021 14:17:34 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Element SET ColumnName='OpcionTransferenciaFCE', Name='OpcionTransferenciaFCE', PrintName='OpcionTransferenciaFCE',Updated=TO_DATE('2021-04-05 14:17:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001091
;

-- 05/04/2021 14:17:34 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001091
;

-- 05/04/2021 14:17:34 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Column SET ColumnName='OpcionTransferenciaFCE', Name='OpcionTransferenciaFCE', Description=NULL, Help=NULL WHERE AD_Element_ID=3001091
;

-- 05/04/2021 14:17:34 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Process_Para SET ColumnName='OpcionTransferenciaFCE', Name='OpcionTransferenciaFCE', Description=NULL, Help=NULL, AD_Element_ID=3001091 WHERE UPPER(ColumnName)='OPCIONTRANSFERENCIAFCE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 05/04/2021 14:17:34 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Process_Para SET ColumnName='OpcionTransferenciaFCE', Name='OpcionTransferenciaFCE', Description=NULL, Help=NULL WHERE AD_Element_ID=3001091 AND IsCentrallyMaintained='Y'
;

-- 05/04/2021 14:17:34 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET Name='OpcionTransferenciaFCE', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001091) AND IsCentrallyMaintained='Y'
;

-- 05/04/2021 14:17:34 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_PrintFormatItem pi SET PrintName='OpcionTransferenciaFCE', Name='OpcionTransferenciaFCE' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001091)
;

-- 05/04/2021 14:17:59 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Opción Transferencia FCE',PrintName='Opción Transferencia FCE',Updated=TO_DATE('2021-04-05 14:17:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001091 AND AD_Language='es_AR'
;

-- 05/04/2021 14:20:19 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000117,'L','LAR','N','LAR_OpcionTransferenciaFCE',0,0,100,TO_DATE('2021-04-05 14:20:19','YYYY-MM-DD HH24:MI:SS'),'Y',TO_DATE('2021-04-05 14:20:19','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/04/2021 14:20:19 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000117 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 05/04/2021 14:21:44 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,Created,CreatedBy,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000254,3000117,'LAR','SCA','SCA (Transf. Sistema Circulación Abierta)',TO_DATE('2021-04-05 14:21:44','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-04-05 14:21:44','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',0)
;

-- 05/04/2021 14:21:44 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000254 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 05/04/2021 14:22:06 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,Created,CreatedBy,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000255,3000117,'LAR','ADC','ADC (Agente de Depósito Colectivo)',TO_DATE('2021-04-05 14:22:06','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-04-05 14:22:06','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',0)
;

-- 05/04/2021 14:22:06 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000255 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 05/04/2021 14:22:36 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Column SET AD_Reference_Value_ID=3000117,Updated=TO_DATE('2021-04-05 14:22:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003688
;

-- 05/04/2021 14:23:07 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003689,259,'LAR',0,'N','N','N','N',3,'N',17,'N',3001091,'N','Y','N','OpcionTransferenciaFCE','OpcionTransferenciaFCE',100,TO_DATE('2021-04-05 14:23:06','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2021-04-05 14:23:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/04/2021 14:23:07 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003689 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 05/04/2021 14:23:49 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Column SET AD_Reference_Value_ID=3000117,Updated=TO_DATE('2021-04-05 14:23:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003689
;

-- 05/04/2021 14:24:12 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003690,318,'LAR',0,'N','N','N','N',3,'N',17,'N',3001091,'N','Y','N','OpcionTransferenciaFCE','OpcionTransferenciaFCE',100,TO_DATE('2021-04-05 14:24:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2021-04-05 14:24:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/04/2021 14:24:12 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003690 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 05/04/2021 14:24:35 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Column SET AD_Reference_Value_ID=3000117,Updated=TO_DATE('2021-04-05 14:24:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003690
;

-- 05/04/2021 14:25:11 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006997,3,'Y','N','N',3003688,'N','Y',223,'N','LAR','OpcionTransferenciaFCE',100,0,TO_DATE('2021-04-05 14:25:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2021-04-05 14:25:10','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/04/2021 14:25:11 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006997 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/04/2021 14:25:42 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET IsDisplayed='N',Updated=TO_DATE('2021-04-05 14:25:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=10471
;

-- 05/04/2021 14:25:48 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2021-04-05 14:25:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005535
;

-- 05/04/2021 14:26:59 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=10471
;

-- 05/04/2021 14:26:59 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=9657
;

-- 05/04/2021 14:26:59 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=2435
;

-- 05/04/2021 14:26:59 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3005535
;

-- 05/04/2021 14:26:59 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3114
;

-- 05/04/2021 14:26:59 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=2408
;

-- 05/04/2021 14:26:59 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3524
;

-- 05/04/2021 14:26:59 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=2434
;

-- 05/04/2021 14:26:59 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3229
;

-- 05/04/2021 14:26:59 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3276
;

-- 05/04/2021 14:26:59 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3275
;

-- 05/04/2021 14:26:59 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=7362
;

-- 05/04/2021 14:26:59 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=8373
;

-- 05/04/2021 14:26:59 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=2427
;

-- 05/04/2021 14:26:59 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=2428
;

-- 05/04/2021 14:26:59 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3002709
;

-- 05/04/2021 14:26:59 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3006610
;

-- 05/04/2021 14:26:59 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3006997
;

-- 05/04/2021 14:27:07 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2021-04-05 14:27:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006576
;

-- 05/04/2021 14:29:24 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006998,3,'Y','N','N',3003689,'N','Y',186,'N','LAR','OpcionTransferenciaFCE',100,0,TO_DATE('2021-04-05 14:29:24','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2021-04-05 14:29:24','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/04/2021 14:29:24 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006998 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/04/2021 14:29:25 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006999,1,'Y','N','N',3003562,'N','Y',186,'N','LAR','Sincronizada',100,0,TO_DATE('2021-04-05 14:29:24','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2021-04-05 14:29:24','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/04/2021 14:29:25 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006999 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006999
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3006998
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=1077
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=1103
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=8653
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3005559
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=1098
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3272
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=2112
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=2109
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3113
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=1099
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=56906
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3001993
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=2593
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=2589
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=1324
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=7038
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=7826
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=7825
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=2594
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=1112
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=1113
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=1082
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=1084
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=60922
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=6560
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=1083
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3660
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=1090
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3004046
;

-- 05/04/2021 14:29:53 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3001597
;

-- 05/04/2021 14:30:42 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2021-04-05 14:30:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006998
;

-- 05/04/2021 14:31:15 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007000,3,'Y','N','N',3003690,'N','Y',263,'N','LAR','OpcionTransferenciaFCE',100,0,TO_DATE('2021-04-05 14:31:15','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2021-04-05 14:31:15','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/04/2021 14:31:15 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007000 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3007000
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=2765
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=2770
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=8648
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3005560
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=2763
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=2953
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3273
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=2956
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3112
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=2774
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=2764
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=2768
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3001994
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=6935
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=2775
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=7794
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=7795
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=2786
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3006572
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=1000017
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=2778
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=2780
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=1000016
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=2771
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=6564
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=2777
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=8657
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3663
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=10485
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=13700
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3899
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000025
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000026
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=60970
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000605
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=53257
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000027
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3004048
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=53258
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000028
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3002136
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=200050
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3002142
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3002138
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3274
;

-- 05/04/2021 14:34:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3006683
;

-- 05/04/2021 14:35:02 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2021-04-05 14:35:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007000
;

-- 05/04/2021 14:40:22 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2021-04-05 14:40:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007000
;

-- 05/04/2021 14:47:10 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET DisplayLogic='@DocSubTypeCAE@=201 | @DocSubTypeCAE@=206 | @DocSubTypeCAE@=211',Updated=TO_DATE('2021-04-05 14:47:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007000
;

-- 05/04/2021 14:49:26 ART
-- ISSUE #77: Opción de Transferencia FCE MiPyme
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2021-04-05 14:49:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006998
;

UPDATE C_BPartner SET OpcionTransferenciaFCE = 'SCA' WHERE AD_Client_ID = 1000000;

-- Registración de script
SELECT register_migration_script_lar('0166_ISSUE-77.sql', 'LAR', '') FROM dual
;
