ALTER TABLE LAR_Tarjeta_Credito ADD COLUMN EsCredito character(1) not null default 'N'::bpchar;
UPDATE LAR_Tarjeta_Credito SET EsCredito = 'Y' WHERE EsDebito = 'N' AND EsDeposito = 'N' AND EsChequeEmitido = 'N' AND EsQR = 'N';
UPDATE LAR_Tarjeta_Credito SET Name = Description WHERE Name = ' ' AND (EsCredito = 'Y' OR EsDebito = 'Y');
UPDATE LAR_Tarjeta_Credito SET Description = concat(Name, concat('_', upper((SELECT Name FROM
AD_Ref_List WHERE Value = SOPOType AND AD_Reference_ID=3000143))));
DROP INDEX LAR_Tarjeta_Unique;

-- 11/05/2022 20:51:30 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001248,'escredito','LAR','escredito','escredito',0,TO_TIMESTAMP('2022-05-11 20:51:30','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2022-05-11 20:51:30','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 11/05/2022 20:51:30 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001248 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 11/05/2022 20:51:31 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004462,3000031,'LAR',0,'Y','N','N','N',1,'N',20,'N',3001248,'N','Y','N','escredito','escredito',100,TO_TIMESTAMP('2022-05-11 20:51:30','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2022-05-11 20:51:30','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/05/2022 20:51:31 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004462 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/05/2022 20:52:09 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Element SET ColumnName='EsCredito', Name='Es Crédito', PrintName='Es Crédito',Updated=TO_TIMESTAMP('2022-05-11 20:52:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001248
;

-- 11/05/2022 20:52:09 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001248
;

-- 11/05/2022 20:52:09 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Column SET ColumnName='EsCredito', Name='Es Crédito', Description=NULL, Help=NULL WHERE AD_Element_ID=3001248
;

-- 11/05/2022 20:52:09 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Process_Para SET ColumnName='EsCredito', Name='Es Crédito', Description=NULL, Help=NULL, AD_Element_ID=3001248 WHERE UPPER(ColumnName)='ESCREDITO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 11/05/2022 20:52:09 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Process_Para SET ColumnName='EsCredito', Name='Es Crédito', Description=NULL, Help=NULL WHERE AD_Element_ID=3001248 AND IsCentrallyMaintained='Y'
;

-- 11/05/2022 20:52:09 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Field SET Name='Es Crédito', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001248) AND IsCentrallyMaintained='Y'
;

-- 11/05/2022 20:52:09 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_PrintFormatItem SET PrintName='Es Crédito', Name='Es Crédito' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001248)
;

-- 11/05/2022 20:52:38 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Element_Trl SET Name='Es Crédito',PrintName='Es Crédito',Updated=TO_TIMESTAMP('2022-05-11 20:52:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001248 AND AD_Language='es_AR'
;

-- 11/05/2022 20:53:25 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Column SET IsMandatory='N',Updated=TO_TIMESTAMP('2022-05-11 20:53:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001185
;

-- 11/05/2022 20:54:17 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001957
;

-- 11/05/2022 20:54:17 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3001862
;

-- 11/05/2022 20:54:17 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3002677
;

-- 11/05/2022 20:54:17 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3002802
;

-- 11/05/2022 20:54:17 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3003310
;

-- 11/05/2022 20:54:17 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3007055
;

-- 11/05/2022 20:54:17 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3001860
;

-- 11/05/2022 20:54:17 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3007773
;

-- 11/05/2022 21:08:25 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007781,1,'Y','N','N',3004462,'N','Y',3000052,'N','LAR','Es Crédito',100,0,TO_TIMESTAMP('2022-05-11 21:08:25','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2022-05-11 21:08:25','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/05/2022 21:08:25 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007781 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/05/2022 21:08:41 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3007781
;

-- 11/05/2022 21:08:41 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3002677
;

-- 11/05/2022 21:08:41 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3002802
;

-- 11/05/2022 21:08:41 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3003310
;

-- 11/05/2022 21:08:41 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3007055
;

-- 11/05/2022 21:08:41 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3001860
;

-- 11/05/2022 21:08:41 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3007773
;

-- 11/05/2022 21:08:50 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2022-05-11 21:08:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002677
;

-- 11/05/2022 21:08:55 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2022-05-11 21:08:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002802
;

-- 11/05/2022 21:09:00 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2022-05-11 21:09:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003310
;

-- 11/05/2022 21:09:05 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2022-05-11 21:09:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007055
;

-- 11/05/2022 21:11:23 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3007773
;

-- 11/05/2022 21:11:23 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3001860
;

-- 11/05/2022 21:11:23 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3007781
;

-- 11/05/2022 21:11:23 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3002677
;

-- 11/05/2022 21:11:23 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3002802
;

-- 11/05/2022 21:11:24 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3003310
;

-- 11/05/2022 21:11:24 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3007055
;

-- 11/05/2022 21:11:33 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2022-05-11 21:11:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001860
;

-- 11/05/2022 21:13:36 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Field SET IsReadOnly='N',Updated=TO_TIMESTAMP('2022-05-11 21:13:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001862
;

-- 11/05/2022 21:13:59 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_TIMESTAMP('2022-05-11 21:13:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001862
;

-- 11/05/2022 21:15:03 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Nombre Interno',Description='Nombre interno que será utilizado en ventanas de configuración.',Help=NULL,Updated=TO_TIMESTAMP('2022-05-11 21:15:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001862 AND AD_Language='es_AR'
;

-- 11/05/2022 21:16:04 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Column SET IsSelectionColumn='Y', IsAllowCopy='N',Updated=TO_TIMESTAMP('2022-05-11 21:16:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001048
;

-- 11/05/2022 21:23:21 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Val_Rule SET Code='LAR_Tarjeta_Credito.EsCredito=''Y'' AND (LAR_Tarjeta_Credito.SOPOType=''A'' OR LAR_Tarjeta_Credito.SOPOType=''V'')',Updated=TO_TIMESTAMP('2022-05-11 21:23:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000031
;

-- 11/05/2022 21:24:58 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Ref_Table SET AD_Display=3001053,Updated=TO_TIMESTAMP('2022-05-11 21:24:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=3000046
;

-- 11/05/2022 21:25:44 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Column SET IsIdentifier='N',Updated=TO_TIMESTAMP('2022-05-11 21:25:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001055
;

-- 11/05/2022 21:26:13 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Column SET IsIdentifier='Y',Updated=TO_TIMESTAMP('2022-05-11 21:26:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001053
;

-- 11/05/2022 21:28:31 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Val_Rule SET Code='LAR_Tarjeta_Credito.EsCredito=''Y'' AND (LAR_Tarjeta_Credito.SOPOType=''A'' OR LAR_Tarjeta_Credito.SOPOType=''C'')',Updated=TO_TIMESTAMP('2022-05-11 21:28:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000116
;

-- 12/05/2022 16:42:04 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000145,'T','LAR','N','Tipos de Cheques Emitidos INTERNO',0,0,100,TO_TIMESTAMP('2022-05-12 16:42:03','YYYY-MM-DD HH24:MI:SS'),'Y',TO_TIMESTAMP('2022-05-12 16:42:03','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 12/05/2022 16:42:04 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000145 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 12/05/2022 16:43:55 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
INSERT INTO AD_Ref_Table (IsValueDisplayed,WhereClause,AD_Table_ID,AD_Reference_ID,AD_Key,AD_Display,EntityType,CreatedBy,Created,Updated,AD_Client_ID,UpdatedBy,AD_Org_ID,IsActive) VALUES ('N','LAR_Tarjeta_Credito.EsChequeEmitido=''Y''',3000031,3000145,3001045,3001055,'LAR',100,TO_TIMESTAMP('2022-05-12 16:43:55','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2022-05-12 16:43:55','YYYY-MM-DD HH24:MI:SS'),0,100,0,'Y')
;

-- 12/05/2022 16:44:24 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
DELETE FROM AD_Ref_Table WHERE AD_Reference_ID=3000145
;

-- 12/05/2022 16:44:31 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
DELETE FROM AD_Reference_Trl WHERE AD_Reference_ID=3000145
;

-- 12/05/2022 16:44:31 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
DELETE FROM AD_Reference WHERE AD_Reference_ID=3000145
;

-- 12/05/2022 16:47:49 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000146,'T','LAR','N','Tipos de Cheques Emitidos INTERNO',0,0,100,TO_TIMESTAMP('2022-05-12 16:47:49','YYYY-MM-DD HH24:MI:SS'),'Y',TO_TIMESTAMP('2022-05-12 16:47:49','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 12/05/2022 16:47:49 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000146 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 12/05/2022 16:48:13 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
INSERT INTO AD_Ref_Table (IsValueDisplayed,WhereClause,AD_Table_ID,AD_Reference_ID,AD_Key,AD_Display,EntityType,CreatedBy,Created,Updated,AD_Client_ID,UpdatedBy,AD_Org_ID,IsActive) VALUES ('N','LAR_Tarjeta_Credito.EsChequeEmitido=''Y''',3000031,3000146,3001045,3001055,'LAR',100,TO_TIMESTAMP('2022-05-12 16:48:13','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2022-05-12 16:48:13','YYYY-MM-DD HH24:MI:SS'),0,100,0,'Y')
;

-- 12/05/2022 16:48:51 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Column SET AD_Reference_Value_ID=3000146,Updated=TO_TIMESTAMP('2022-05-12 16:48:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002110
;

-- 12/05/2022 16:49:37 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000147,'T','LAR','N','Tipos de Deposito Directo INTERNO',0,0,100,TO_TIMESTAMP('2022-05-12 16:49:37','YYYY-MM-DD HH24:MI:SS'),'Y',TO_TIMESTAMP('2022-05-12 16:49:37','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 12/05/2022 16:49:37 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000147 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 12/05/2022 16:50:08 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
INSERT INTO AD_Ref_Table (IsValueDisplayed,WhereClause,AD_Table_ID,AD_Reference_ID,AD_Key,AD_Display,EntityType,CreatedBy,Created,Updated,AD_Client_ID,UpdatedBy,AD_Org_ID,IsActive) VALUES ('N','LAR_Tarjeta_Credito.EsDeposito=''Y''',3000031,3000147,3001045,3001055,'LAR',100,TO_TIMESTAMP('2022-05-12 16:50:08','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2022-05-12 16:50:08','YYYY-MM-DD HH24:MI:SS'),0,100,0,'Y')
;

-- 12/05/2022 16:50:21 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Column SET AD_Reference_Value_ID=3000147,Updated=TO_TIMESTAMP('2022-05-12 16:50:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001866
;

-- 12/05/2022 16:53:18 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000148,'T','LAR','N','Billetera Digital INTERNO',0,0,100,TO_TIMESTAMP('2022-05-12 16:53:18','YYYY-MM-DD HH24:MI:SS'),'Y',TO_TIMESTAMP('2022-05-12 16:53:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 12/05/2022 16:53:18 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000148 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 12/05/2022 16:54:41 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
INSERT INTO AD_Ref_Table (IsValueDisplayed,WhereClause,AD_Table_ID,AD_Reference_ID,AD_Key,AD_Display,EntityType,CreatedBy,Created,Updated,AD_Client_ID,UpdatedBy,AD_Org_ID,IsActive) VALUES ('N','LAR_Tarjeta_Credito.EsQR = ''Y''',3000031,3000148,3001045,3001055,'LAR',100,TO_TIMESTAMP('2022-05-12 16:54:41','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2022-05-12 16:54:41','YYYY-MM-DD HH24:MI:SS'),0,100,0,'Y')
;

-- 12/05/2022 16:54:55 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Column SET AD_Reference_Value_ID=3000148,Updated=TO_TIMESTAMP('2022-05-12 16:54:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003930
;

-- 12/05/2022 16:55:56 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,Description,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000149,'T','LAR','N','Tarjetas de Crédito','Tarjetas de Crédito',0,0,100,TO_TIMESTAMP('2022-05-12 16:55:56','YYYY-MM-DD HH24:MI:SS'),'Y',TO_TIMESTAMP('2022-05-12 16:55:56','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 12/05/2022 16:55:56 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000149 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 12/05/2022 16:56:49 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
INSERT INTO AD_Ref_Table (IsValueDisplayed,WhereClause,AD_Table_ID,AD_Reference_ID,AD_Key,AD_Display,EntityType,CreatedBy,Created,Updated,AD_Client_ID,UpdatedBy,AD_Org_ID,IsActive) VALUES ('N','LAR_Tarjeta_Credito.EsCredito = ''Y''',3000031,3000149,3001045,3001055,'LAR',100,TO_TIMESTAMP('2022-05-12 16:56:49','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2022-05-12 16:56:49','YYYY-MM-DD HH24:MI:SS'),0,100,0,'Y')
;

-- 12/05/2022 16:57:25 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Reference SET Name='Tarjetas de Crédito INTERNO', Description='Tarjetas de Crédito INTERNO',Updated=TO_TIMESTAMP('2022-05-12 16:57:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=3000149
;

-- 12/05/2022 16:57:25 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Reference_Trl SET IsTranslated='N' WHERE AD_Reference_ID=3000149
;

-- 12/05/2022 16:57:39 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Column SET AD_Reference_Value_ID=3000149, AD_Reference_ID=18,Updated=TO_TIMESTAMP('2022-05-12 16:57:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001776
;

-- 12/05/2022 16:59:49 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Column SET AD_Val_Rule_ID=NULL,Updated=TO_TIMESTAMP('2022-05-12 16:59:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001776
;

-- 12/05/2022 17:00:50 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000150,'T','LAR','N','Tarjeta de Debito INTERNO',0,0,100,TO_TIMESTAMP('2022-05-12 17:00:50','YYYY-MM-DD HH24:MI:SS'),'Y',TO_TIMESTAMP('2022-05-12 17:00:50','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 12/05/2022 17:00:50 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000150 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 12/05/2022 17:01:18 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
INSERT INTO AD_Ref_Table (IsValueDisplayed,WhereClause,AD_Table_ID,AD_Reference_ID,AD_Key,AD_Display,EntityType,CreatedBy,Created,Updated,AD_Client_ID,UpdatedBy,AD_Org_ID,IsActive) VALUES ('N','LAR_Tarjeta_Credito.EsDebito=''Y''',3000031,3000150,3001045,3001055,'LAR',100,TO_TIMESTAMP('2022-05-12 17:01:18','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2022-05-12 17:01:18','YYYY-MM-DD HH24:MI:SS'),0,100,0,'Y')
;

-- 12/05/2022 17:01:36 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Column SET AD_Reference_Value_ID=3000150, AD_Val_Rule_ID=NULL,Updated=TO_TIMESTAMP('2022-05-12 17:01:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001774
;

-- 12/05/2022 17:02:56 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Reference_Trl SET Name='Tarjetas de Crédito INTERNO',Description='Tarjetas de Crédito INTERNO',Updated=TO_TIMESTAMP('2022-05-12 17:02:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=3000149 AND AD_Language='es_AR'
;

-- 12/05/2022 17:03:32 ART
-- ISSUE #80: Ajuste de Ventana de Tipos de Formas de Pago.
UPDATE AD_Column SET AD_Val_Rule_ID=NULL,Updated=TO_TIMESTAMP('2022-05-12 17:03:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001866
;

-- Registración de script
SELECT register_migration_script_lar('0212_ISSUE-80.sql', 'LAR', '')
;
