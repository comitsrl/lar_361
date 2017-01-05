ALTER TABLE LAR_Tarjeta_Credito ADD COLUMN EsDeposito character(1) NOT NULL DEFAULT 'N'::bpchar;
ALTER TABLE LAR_Tarjeta_Credito ADD CONSTRAINT lar_tarjeta_credito_esdeposito_check
	CHECK (EsDeposito = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]));

DROP INDEX LAR_Tarjeta_Unique;

CREATE UNIQUE INDEX LAR_Tarjeta_Unique ON LAR_Tarjeta_Credito (Name, EsDeposito, EsDebito, CreditCardType);

ALTER TABLE C_Payment ADD COLUMN LAR_Deposito_Directo_ID numeric(10,0);

ALTER TABLE C_Payment ADD CONSTRAINT c_payment_lar_deposito_directo_id_fkey FOREIGN KEY (LAR_Deposito_Directo_ID)
      REFERENCES LAR_Tarjeta_Credito (LAR_Tarjeta_Credito_ID) MATCH SIMPLE;

ALTER TABLE LAR_TenderType_BankAccount ADD COLUMN LAR_Deposito_Directo_ID numeric(10,0);

ALTER TABLE LAR_TenderType_BankAccount ADD CONSTRAINT lartendertypebankaccount_lardepositodirecto_fkey FOREIGN KEY (LAR_Deposito_Directo_ID)
      REFERENCES LAR_Tarjeta_Credito (LAR_Tarjeta_Credito_ID) MATCH SIMPLE;

-- 07/09/2016 17:58:27 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000367,'esdeposito','LAR','esdeposito','esdeposito',0,TO_DATE('2016-09-07 17:58:27','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-09-07 17:58:27','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 07/09/2016 17:58:28 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000367 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 07/09/2016 17:58:28 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001864,3000031,'LAR',0,'Y','N','N','N',1,'N',20,'N',3000367,'N','Y','N','esdeposito','esdeposito',100,TO_DATE('2016-09-07 17:58:27','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-09-07 17:58:27','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 07/09/2016 17:58:28 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001864 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 07/09/2016 17:59:34 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET Name='Es Depósito', ColumnName='EsDeposito',Updated=TO_DATE('2016-09-07 17:59:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001864
;

-- 07/09/2016 17:59:34 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001864
;

-- 07/09/2016 17:59:34 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET Name='Es Depósito', Description=NULL, Help=NULL WHERE AD_Column_ID=3001864 AND IsCentrallyMaintained='Y'
;

-- 07/09/2016 17:59:45 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column_Trl SET Name='Es Depósito',Updated=TO_DATE('2016-09-07 17:59:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001864 AND AD_Language='es_AR'
;

-- 07/09/2016 18:00:30 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element SET Name='Es Depósito', PrintName='Es Depósito',Updated=TO_DATE('2016-09-07 18:00:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000367
;

-- 07/09/2016 18:00:30 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000367
;

-- 07/09/2016 18:00:30 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnName='esdeposito', Name='Es Depósito', Description=NULL, Help=NULL WHERE AD_Element_ID=3000367
;

-- 07/09/2016 18:00:30 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='esdeposito', Name='Es Depósito', Description=NULL, Help=NULL, AD_Element_ID=3000367 WHERE UPPER(ColumnName)='ESDEPOSITO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 07/09/2016 18:00:30 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='esdeposito', Name='Es Depósito', Description=NULL, Help=NULL WHERE AD_Element_ID=3000367 AND IsCentrallyMaintained='Y'
;

-- 07/09/2016 18:00:30 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET Name='Es Depósito', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000367) AND IsCentrallyMaintained='Y'
;

-- 07/09/2016 18:00:30 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_PrintFormatItem pi SET PrintName='Es Depósito', Name='Es Depósito' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000367)
;

-- 07/09/2016 18:00:36 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Es Depósito',PrintName='Es Depósito',Updated=TO_DATE('2016-09-07 18:00:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000367 AND AD_Language='es_AR'
;

-- 07/09/2016 18:02:11 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002802,1,'Y','N','N',3001864,'N','Y',3000052,'N','LAR','Es Depósito',100,0,TO_DATE('2016-09-07 18:02:11','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-09-07 18:02:11','YYYY-MM-DD HH24:MI:SS'))
;

-- 07/09/2016 18:02:11 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002802 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 07/09/2016 18:02:20 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3002802
;

-- 07/09/2016 18:02:20 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3001860
;

-- 07/09/2016 18:02:38 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2016-09-07 18:02:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001860
;

-- 07/09/2016 18:02:55 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2016-09-07 18:02:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002802
;

-- 07/09/2016 18:05:34 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Tab SET Name='Tipos de Forma de Pago',Updated=TO_DATE('2016-09-07 18:05:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000052
;

-- 07/09/2016 18:05:34 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Tab_Trl SET IsTranslated='N' WHERE AD_Tab_ID=3000052
;

-- 07/09/2016 18:05:44 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Tab_Trl SET Name='Tipos de Forma de Pago',Updated=TO_DATE('2016-09-07 18:05:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000052 AND AD_Language='es_AR'
;

-- 07/09/2016 18:06:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Window SET Name='Tipos de Forma de Pago',Updated=TO_DATE('2016-09-07 18:06:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Window_ID=3000026
;

-- 07/09/2016 18:06:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Window_Trl SET IsTranslated='N' WHERE AD_Window_ID=3000026
;

-- 07/09/2016 18:06:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Menu SET Name='Tipos de Forma de Pago', Description=NULL, IsActive='Y',Updated=TO_DATE('2016-09-07 18:06:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=3000099
;

-- 07/09/2016 18:06:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Menu_Trl SET IsTranslated='N' WHERE AD_Menu_ID=3000099
;

-- 07/09/2016 18:06:36 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Window_Trl SET Name='Tipos de Forma de Pago',Updated=TO_DATE('2016-09-07 18:06:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Window_ID=3000026 AND AD_Language='es_AR'
;

-- 07/09/2016 18:07:11 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Menu_Trl SET Name='Tipos de Forma de Pago',Updated=TO_DATE('2016-09-07 18:07:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=3000099 AND AD_Language='es_AR'
;

-- 07/09/2016 18:13:47 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@EsDeposito@=''N''',Updated=TO_DATE('2016-09-07 18:13:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001957
;

-- 07/09/2016 18:15:43 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@EsDeposito@=N',Updated=TO_DATE('2016-09-07 18:15:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001957
;

-- 07/09/2016 18:18:45 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@Es Depósito@=N',Updated=TO_DATE('2016-09-07 18:18:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001957
;

-- 07/09/2016 18:20:34 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@esdeposito@=N',Updated=TO_DATE('2016-09-07 18:20:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001957
;

-- 07/09/2016 18:22:16 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element SET ColumnName='EsDeposito',Updated=TO_DATE('2016-09-07 18:22:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000367
;

-- 07/09/2016 18:22:16 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnName='EsDeposito', Name='Es Depósito', Description=NULL, Help=NULL WHERE AD_Element_ID=3000367
;

-- 07/09/2016 18:22:16 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='EsDeposito', Name='Es Depósito', Description=NULL, Help=NULL, AD_Element_ID=3000367 WHERE UPPER(ColumnName)='ESDEPOSITO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 07/09/2016 18:22:16 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='EsDeposito', Name='Es Depósito', Description=NULL, Help=NULL WHERE AD_Element_ID=3000367 AND IsCentrallyMaintained='Y'
;

-- 07/09/2016 18:23:05 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@EsDeposito@=N',Updated=TO_DATE('2016-09-07 18:23:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001957
;

-- 07/09/2016 18:25:13 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Val_Rule SET Code='LAR_Tarjeta_Credito.EsDebito=''N'' AND LAR_Tarjeta_Credito.EsDeposito=''N''',Updated=TO_DATE('2016-09-07 18:25:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000031
;

-- 07/09/2016 18:26:34 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Val_Rule SET Code='LAR_Tarjeta_Credito.EsDebito=''Y'' AND LAR_Tarjeta_Credito.EsDeposito=''N''',Updated=TO_DATE('2016-09-07 18:26:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000032
;

-- 07/09/2016 18:31:44 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000368,'lar_deposito_directo_id','LAR','lar_deposito_directo_id','lar_deposito_directo_id',0,TO_DATE('2016-09-07 18:31:43','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-09-07 18:31:43','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 07/09/2016 18:31:44 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000368 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 07/09/2016 18:31:44 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001865,335,'LAR',0,'N','N','N','N',10,'N',19,'N',3000368,'N','Y','N','lar_deposito_directo_id','lar_deposito_directo_id',100,TO_DATE('2016-09-07 18:31:43','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-09-07 18:31:43','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 07/09/2016 18:31:44 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001865 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 07/09/2016 18:33:00 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET Name='Tipos de Depósito Directo', ColumnName='LAR_Deposito_Directo_ID',Updated=TO_DATE('2016-09-07 18:33:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001865
;

-- 07/09/2016 18:33:00 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001865
;

-- 07/09/2016 18:33:00 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET Name='Tipos de Depósito Directo', Description=NULL, Help=NULL WHERE AD_Column_ID=3001865 AND IsCentrallyMaintained='Y'
;

-- 07/09/2016 18:33:06 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column_Trl SET Name='Tipos de Depósito Directo',Updated=TO_DATE('2016-09-07 18:33:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001865 AND AD_Language='es_AR'
;

-- 07/09/2016 18:33:34 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element SET ColumnName='LAR_Deposito_Directo_ID', Name='Tipos de Depósito Directo', PrintName='Tipos de Depósito Directo',Updated=TO_DATE('2016-09-07 18:33:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000368
;

-- 07/09/2016 18:33:34 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000368
;

-- 07/09/2016 18:33:34 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnName='LAR_Deposito_Directo_ID', Name='Tipos de Depósito Directo', Description=NULL, Help=NULL WHERE AD_Element_ID=3000368
;

-- 07/09/2016 18:33:34 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='LAR_Deposito_Directo_ID', Name='Tipos de Depósito Directo', Description=NULL, Help=NULL, AD_Element_ID=3000368 WHERE UPPER(ColumnName)='LAR_DEPOSITO_DIRECTO_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 07/09/2016 18:33:34 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='LAR_Deposito_Directo_ID', Name='Tipos de Depósito Directo', Description=NULL, Help=NULL WHERE AD_Element_ID=3000368 AND IsCentrallyMaintained='Y'
;

-- 07/09/2016 18:33:34 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET Name='Tipos de Depósito Directo', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000368) AND IsCentrallyMaintained='Y'
;

-- 07/09/2016 18:33:34 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_PrintFormatItem pi SET PrintName='Tipos de Depósito Directo', Name='Tipos de Depósito Directo' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000368)
;

-- 07/09/2016 18:33:41 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Tipos de Depósito Directo',PrintName='Tipos de Depósito Directo',Updated=TO_DATE('2016-09-07 18:33:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000368 AND AD_Language='es_AR'
;

-- 07/09/2016 18:34:22 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Val_Rule (Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('S',3000040,'LAR','Tipos de Deposito Directo',100,100,TO_DATE('2016-09-07 18:34:22','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_DATE('2016-09-07 18:34:22','YYYY-MM-DD HH24:MI:SS'))
;

-- 07/09/2016 18:35:35 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Val_Rule SET Code='LAR_Tarjeta_Credito.EsDeposito=''Y'' AND LAR_Tarjeta_Credito.EsDebito=''N''',Updated=TO_DATE('2016-09-07 18:35:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000040
;

-- 07/09/2016 18:37:03 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET AD_Reference_ID=18, AD_Val_Rule_ID=3000040,Updated=TO_DATE('2016-09-07 18:37:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001865
;

-- 07/09/2016 18:39:19 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000054,'T','LAR','N','Tipos de Deposito Directo',0,0,100,TO_DATE('2016-09-07 18:39:19','YYYY-MM-DD HH24:MI:SS'),'Y',TO_DATE('2016-09-07 18:39:19','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 07/09/2016 18:39:19 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000054 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 07/09/2016 18:39:43 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Ref_Table (IsValueDisplayed,AD_Table_ID,AD_Reference_ID,AD_Key,AD_Display,EntityType,CreatedBy,Created,Updated,AD_Client_ID,UpdatedBy,AD_Org_ID,IsActive) VALUES ('N',3000031,3000054,3001045,3001053,'U',100,TO_DATE('2016-09-07 18:39:43','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-09-07 18:39:43','YYYY-MM-DD HH24:MI:SS'),0,100,0,'Y')
;

-- 07/09/2016 18:39:48 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Ref_Table SET EntityType='LAR',Updated=TO_DATE('2016-09-07 18:39:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=3000054
;

-- 07/09/2016 18:40:09 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET AD_Reference_Value_ID=3000054,Updated=TO_DATE('2016-09-07 18:40:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001865
;

-- 07/09/2016 18:52:04 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=K | @TenderType@=Z',Updated=TO_DATE('2016-09-07 18:52:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000330
;

-- 07/09/2016 18:52:41 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=K | @TenderType@=Z',Updated=TO_DATE('2016-09-07 18:52:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000329
;

-- 07/09/2016 18:54:18 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002803,10,'Y','N','N',3001865,'N','Y',3000013,'N','LAR','Tipos de Depósito Directo',100,0,TO_DATE('2016-09-07 18:54:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-09-07 18:54:18','YYYY-MM-DD HH24:MI:SS'))
;

-- 07/09/2016 18:54:18 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002803 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 07/09/2016 18:55:14 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000334
;

-- 07/09/2016 18:55:14 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3002803
;

-- 07/09/2016 18:55:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=A',Updated=TO_DATE('2016-09-07 18:55:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002803
;

-- 07/09/2016 18:58:00 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=K',Updated=TO_DATE('2016-09-07 18:58:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000820
;

-- 07/09/2016 18:58:10 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=K',Updated=TO_DATE('2016-09-07 18:58:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000819
;

-- 07/09/2016 18:58:26 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002804,10,'Y','N','N',3001865,'N','Y',3000024,'N','LAR','Tipos de Depósito Directo',100,0,TO_DATE('2016-09-07 18:58:26','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-09-07 18:58:26','YYYY-MM-DD HH24:MI:SS'))
;

-- 07/09/2016 18:58:26 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002804 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 07/09/2016 18:58:59 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000824
;

-- 07/09/2016 18:58:59 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3002804
;

-- 07/09/2016 19:00:05 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=A',Updated=TO_DATE('2016-09-07 19:00:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002804
;

-- 07/09/2016 19:07:58 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002805,10,'Y','N','N',3001865,'N','Y',3000026,'N','LAR','Tipos de Depósito Directo',100,0,TO_DATE('2016-09-07 19:07:58','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-09-07 19:07:58','YYYY-MM-DD HH24:MI:SS'))
;

-- 07/09/2016 19:07:58 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002805 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 07/09/2016 19:09:39 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=1000233
;

-- 07/09/2016 19:09:39 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3002805
;

-- 07/09/2016 19:10:02 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=K | @TenderType@=Z',Updated=TO_DATE('2016-09-07 19:10:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=1000229
;

-- 07/09/2016 19:10:10 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=K | @TenderType@=Z',Updated=TO_DATE('2016-09-07 19:10:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=1000228
;

-- 07/09/2016 19:10:44 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=A',Updated=TO_DATE('2016-09-07 19:10:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002805
;

-- 07/09/2016 19:17:17 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002806,10,'Y','N','N',3001865,'N','Y',3000016,'N','LAR','Tipos de Depósito Directo',100,0,TO_DATE('2016-09-07 19:17:16','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-09-07 19:17:16','YYYY-MM-DD HH24:MI:SS'))
;

-- 07/09/2016 19:17:17 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002806 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 07/09/2016 19:17:48 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000457
;

-- 07/09/2016 19:17:48 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3002806
;

-- 07/09/2016 19:18:06 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=K | @TenderType@=Z',Updated=TO_DATE('2016-09-07 19:18:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000452
;

-- 07/09/2016 19:18:13 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=K | @TenderType@=Z',Updated=TO_DATE('2016-09-07 19:18:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000453
;

-- 07/09/2016 19:18:31 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=A',Updated=TO_DATE('2016-09-07 19:18:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002806
;

-- 07/09/2016 19:37:05 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002807,10,'Y','N','N',3001865,'N','Y',3000031,'N','LAR','Tipos de Depósito Directo',100,0,TO_DATE('2016-09-07 19:37:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-09-07 19:37:05','YYYY-MM-DD HH24:MI:SS'))
;

-- 07/09/2016 19:37:05 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002807 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 07/09/2016 19:37:32 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001225
;

-- 07/09/2016 19:37:32 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3002807
;

-- 07/09/2016 19:37:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=K  | @TenderType@=Z',Updated=TO_DATE('2016-09-07 19:37:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001220
;

-- 07/09/2016 19:38:00 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=K | @TenderType@=Z',Updated=TO_DATE('2016-09-07 19:38:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001221
;

-- 07/09/2016 19:38:13 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=A',Updated=TO_DATE('2016-09-07 19:38:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002807
;

-- 07/09/2016 19:39:32 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002808,1,'Y','N','N',3001179,'N','Y',330,'N','LAR','DebitCardType',100,0,TO_DATE('2016-09-07 19:39:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-09-07 19:39:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 07/09/2016 19:39:32 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002808 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 07/09/2016 19:39:32 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002809 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 07/09/2016 19:39:33 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002810 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 07/09/2016 19:39:33 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002811 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 07/09/2016 19:39:33 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002812,10,'Y','N','N',3001865,'N','Y',330,'N','LAR','Tipos de Depósito Directo',100,0,TO_DATE('2016-09-07 19:39:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-09-07 19:39:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 07/09/2016 19:39:33 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002812 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002808
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002809
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002810
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002811
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=4057
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3001980
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3002679
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3002812
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=4035
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=4037
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=4033
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=4034
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=4023
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=4025
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=4019
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=4026
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=4024
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=6299
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=4021
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=4022
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=4020
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=4055
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=4043
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=4058
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=4042
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=4258
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=4039
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=4053
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=4052
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=4051
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=4047
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=4049
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=4048
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=4362
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=4361
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=6552
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=4044
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=4266
;

-- 07/09/2016 19:40:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=52052
;

-- 07/09/2016 19:40:41 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=K | @TenderType@=Z',Updated=TO_DATE('2016-09-07 19:40:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=4054
;

-- 07/09/2016 19:40:48 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=K | @TenderType@=Z',Updated=TO_DATE('2016-09-07 19:40:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=4027
;

-- 07/09/2016 19:41:10 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=A',Updated=TO_DATE('2016-09-07 19:41:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002812
;

-- 07/09/2016 19:53:30 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001866,3000034,'LAR',0,'N','N','N','N',10,'N',19,'N',3000368,'N','Y','N','Tipos de Depósito Directo','LAR_Deposito_Directo_ID',100,TO_DATE('2016-09-07 19:53:29','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-09-07 19:53:29','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 07/09/2016 19:53:30 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001866 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 07/09/2016 19:54:11 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002813,10,'Y','N','N',3001866,'N','Y',3000055,'N','LAR','Tipos de Depósito Directo',100,0,TO_DATE('2016-09-07 19:54:11','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-09-07 19:54:11','YYYY-MM-DD HH24:MI:SS'))
;

-- 07/09/2016 19:54:11 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002813 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 07/09/2016 19:54:39 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=A',Updated=TO_DATE('2016-09-07 19:54:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002813
;

-- 07/09/2016 20:08:25 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET AD_Reference_Value_ID=3000054, AD_Reference_ID=18, AD_Val_Rule_ID=3000040,Updated=TO_DATE('2016-09-07 20:08:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001866
;

-- 07/09/2016 20:08:41 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element SET Name='Tipo de Depósito Directo', PrintName='Tipo de Depósito Directo',Updated=TO_DATE('2016-09-07 20:08:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000368
;

-- 07/09/2016 20:08:41 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000368
;

-- 07/09/2016 20:08:41 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnName='LAR_Deposito_Directo_ID', Name='Tipo de Depósito Directo', Description=NULL, Help=NULL WHERE AD_Element_ID=3000368
;

-- 07/09/2016 20:08:41 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='LAR_Deposito_Directo_ID', Name='Tipo de Depósito Directo', Description=NULL, Help=NULL, AD_Element_ID=3000368 WHERE UPPER(ColumnName)='LAR_DEPOSITO_DIRECTO_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 07/09/2016 20:08:41 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='LAR_Deposito_Directo_ID', Name='Tipo de Depósito Directo', Description=NULL, Help=NULL WHERE AD_Element_ID=3000368 AND IsCentrallyMaintained='Y'
;

-- 07/09/2016 20:08:41 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET Name='Tipo de Depósito Directo', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000368) AND IsCentrallyMaintained='Y'
;

-- 07/09/2016 20:08:41 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_PrintFormatItem pi SET PrintName='Tipo de Depósito Directo', Name='Tipo de Depósito Directo' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000368)
;

-- 07/09/2016 20:08:54 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Tipo de Depósito Directo',PrintName='Tipo de Depósito Directo',Updated=TO_DATE('2016-09-07 20:08:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000368 AND AD_Language='es_AR'
;

-- 07/09/2016 20:09:09 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column_Trl SET Name='Tipo de Depósito Directo',Updated=TO_DATE('2016-09-07 20:09:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001866 AND AD_Language='es_AR'
;

-- 07/09/2016 20:09:29 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field_Trl SET Name='Tipo de Depósito Directo',Updated=TO_DATE('2016-09-07 20:09:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002813 AND AD_Language='es_AR'
;

-- 07/09/2016 20:11:16 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column_Trl SET Name='Tipo de Depósito Directo',Updated=TO_DATE('2016-09-07 20:11:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001865 AND AD_Language='es_AR'
;

-- 07/09/2016 20:20:31 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,AD_Client_ID,AD_Org_ID,Created,Updated,CreatedBy,UpdatedBy,IsActive) VALUES (3000017,'LAR','C','N','Ingresar Y, si desea tranferir el efectivo desde la caja de ventas a la caja principal al cerrar la misma. En caso contrario, ingrese N.','LAR_TransfiereEfectivo_En_CierreDeCajas',1000000,0,TO_DATE('2016-09-07 20:20:30','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-09-07 20:20:30','YYYY-MM-DD HH24:MI:SS'),100,100,'Y')
;

-- 19/09/2016 16:33:29 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Banco - Sucursal Bancaria',PrintName='Banco - Sucursal Bancaria',Updated=TO_DATE('2016-09-19 16:33:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=964 AND AD_Language='es_AR'
;

-- 19/09/2016 16:37:00 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field_Trl SET Name='Caja',Description='Identifica la caja en la que se registrará el Cobro',Help='Identifica la caja en la que se registrará el Cobro',Updated=TO_DATE('2016-09-19 16:37:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000301 AND AD_Language='es_AR'
;

-- 19/09/2016 16:44:17 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Caja',Description='Identifica la caja que emitió el Pago.',Help='Identifica la caja que emitió el Pago.',Updated=TO_DATE('2016-09-19 16:44:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001196 AND AD_Language='es_AR'
;

-- 19/09/2016 17:25:28 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3000266
;

-- 19/09/2016 17:25:28 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3000267
;

-- 19/09/2016 17:25:28 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3000901
;

-- 19/09/2016 17:25:28 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3000271
;

-- 19/09/2016 17:25:28 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3000386
;

-- 19/09/2016 17:25:28 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3001296
;

-- 19/09/2016 17:25:28 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000602
;

-- 19/09/2016 17:25:28 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000269
;

-- 19/09/2016 17:25:44 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2016-09-19 17:25:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000266
;

-- 19/09/2016 17:26:47 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field_Trl SET Name='Caja',Description='Identifica la cuenta en la que se registrará el Cobro',Help='Identifica la cuenta en la que se registrará el Cobro',Updated=TO_DATE('2016-09-19 17:26:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000266 AND AD_Language='es_AR'
;

-- 19/09/2016 17:26:53 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2016-09-19 17:26:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000266
;

-- 19/09/2016 17:28:47 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3000752
;

-- 19/09/2016 17:28:47 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3000760
;

-- 19/09/2016 17:28:47 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3000900
;

-- 19/09/2016 17:28:47 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3000761
;

-- 19/09/2016 17:28:47 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3000764
;

-- 19/09/2016 17:28:47 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3000765
;

-- 19/09/2016 17:28:47 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000766
;

-- 19/09/2016 17:28:47 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3001661
;

-- 19/09/2016 17:28:47 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000767
;

-- 19/09/2016 17:28:47 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000768
;

-- 19/09/2016 17:29:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET IsSameLine='Y', IsCentrallyMaintained='N',Updated=TO_DATE('2016-09-19 17:29:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000752
;

-- 19/09/2016 17:30:07 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field_Trl SET Name='Caja',Description='Cuenta bancariaCaja donde se registrará el cobro.',Help='Caja donde se registrará el cobro.',Updated=TO_DATE('2016-09-19 17:30:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000752 AND AD_Language='es_AR'
;

-- 19/09/2016 17:31:23 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2016-09-19 17:31:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000426
;

-- 19/09/2016 17:32:00 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET IsReadOnly='Y', DefaultValue='@SQL=SELECT C_BankAccount_ID FROM LAR_PaymentHeader ph WHERE ph.LAR_PaymentHeader_ID = @LAR_PaymentHeader_ID@',Updated=TO_DATE('2016-09-19 17:32:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001196
;

-- 19/09/2016 17:32:36 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET IsReadOnly='Y', DefaultValue='@SQL=SELECT C_BankAccount_ID FROM LAR_PaymentHeader ph WHERE ph.LAR_PaymentHeader_ID = @LAR_PaymentHeader_ID@',Updated=TO_DATE('2016-09-19 17:32:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000795
;

-- 19/09/2016 17:33:13 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET IsReadOnly='Y', DefaultValue='@SQL=SELECT C_BankAccount_ID FROM LAR_PaymentHeader ph WHERE ph.LAR_PaymentHeader_ID = @LAR_PaymentHeader_ID@',Updated=TO_DATE('2016-09-19 17:33:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000301
;

-- 19/09/2016 18:00:00 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET DefaultValue=NULL,Updated=TO_DATE('2016-09-19 18:00:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=4918
;

-- 19/09/2016 18:01:12 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Ref_List_Trl SET Name='Depósito Directo / Transferencia',Updated=TO_DATE('2016-09-19 18:01:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=402 AND AD_Language='es_AR'
;

-- 19/09/2016 18:09:14 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnSQL='(SELECT COALESCE(Sum(TrxAmt),0) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''A'' AND p.IsReceipt = ''Y'' ))',Updated=TO_DATE('2016-09-19 18:09:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000152
;

-- 19/09/2016 18:09:34 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnSQL='(SELECT (C_BankStatement.ScrutinizedDirectDebitAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN = ''A'' AND p.IsReceipt = ''Y'' ))',Updated=TO_DATE('2016-09-19 18:09:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000160
;

-- 19/09/2016 18:10:04 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnSQL='(SELECT COALESCE(Sum(TrxAmt),0) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''C'', ''D'') AND p.IsReceipt = ''Y''))',Updated=TO_DATE('2016-09-19 18:10:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000151
;

-- 19/09/2016 18:10:31 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnSQL='(SELECT (C_BankStatement.ScrutinizedCreditCardAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''C'', ''D'') AND p.IsReceipt = ''Y'' ))',Updated=TO_DATE('2016-09-19 18:10:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000159
;

-- 19/09/2016 18:13:09 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field_Trl SET Name='Total Cupones TC y TD',Updated=TO_DATE('2016-09-19 18:13:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000214 AND AD_Language='es_AR'
;

-- 19/09/2016 18:13:41 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field_Trl SET Name='Cupones T.C. y T.D. Contabilizados',Updated=TO_DATE('2016-09-19 18:13:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000220 AND AD_Language='es_AR'
;

-- 19/09/2016 18:14:03 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field_Trl SET Name='Diferencia Cupones TC y TD',Updated=TO_DATE('2016-09-19 18:14:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000213 AND AD_Language='es_AR'
;

-- 19/09/2016 18:24:55 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnSQL='(SELECT (C_BankStatement.ScrutinizedDirectDebitAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''A'' AND p.IsReceipt = ''Y'' ))',Updated=TO_DATE('2016-09-19 18:24:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000160
;

-- 19/09/2016 18:54:41 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnSQL='(SELECT (C_BankStatement.ScrutinizedCheckAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''K'', ''Z'') AND p.IsReceipt = ''Y''))',Updated=TO_DATE('2016-09-19 18:54:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000157
;

-- 19/09/2016 18:55:00 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnSQL='(SELECT COALESCE(Sum(TrxAmt),0) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''K'',''Z'') AND p.IsReceipt = ''Y''))',Updated=TO_DATE('2016-09-19 18:55:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000149
;

-- 19/09/2016 19:17:00 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnSQL='(SELECT COALESCE(Sum(TrxAmt),0) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''K'',''Z'')))',Updated=TO_DATE('2016-09-19 19:17:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000149
;

-- 19/09/2016 19:17:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnSQL='(SELECT (C_BankStatement.ScrutinizedCheckAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''K'', ''Z'')))',Updated=TO_DATE('2016-09-19 19:17:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000157
;

-- 19/09/2016 19:24:15 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnSQL='(SELECT COALESCE(Sum(TrxAmt),0) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''A''))',Updated=TO_DATE('2016-09-19 19:24:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000152
;

-- 19/09/2016 19:24:28 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnSQL='(SELECT (C_BankStatement.ScrutinizedDirectDebitAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''A''))',Updated=TO_DATE('2016-09-19 19:24:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000160
;

-- 19/09/2016 19:24:36 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnSQL='(SELECT COALESCE(Sum(TrxAmt),0) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''C'', ''D'')))',Updated=TO_DATE('2016-09-19 19:24:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000151
;

-- 19/09/2016 19:24:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnSQL='(SELECT (C_BankStatement.ScrutinizedCreditCardAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''C'', ''D'')))',Updated=TO_DATE('2016-09-19 19:24:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000159
;

-- 19/09/2016 19:27:06 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnSQL='((SELECT (C_BankStatement.ScrutinizedCashAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''X'')) + (SELECT (C_BankStatement.ScrutinizedCheckAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''K'')) + (SELECT (C_BankStatement.ScrutinizedCreditCardAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''C'')) + (SELECT (C_BankStatement.ScrutinizedDirectDebitAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''D'', ''A''))))',Updated=TO_DATE('2016-09-19 19:27:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000161
;

-- 19/09/2016 19:32:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnSQL='((SELECT (C_BankStatement.ScrutinizedCashAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''X'')) + (SELECT (C_BankStatement.ScrutinizedCheckAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''Z'', ''K''))) + (SELECT (C_BankStatement.ScrutinizedCreditCardAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''D'', ''C''))) + (SELECT (C_BankStatement.ScrutinizedDirectDebitAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''A'')))',Updated=TO_DATE('2016-09-19 19:32:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000161
;

-- 20/09/2016 15:03:44 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET DefaultValue='Los valores de caja en Efectivo y Cheque, serán transferidos a la Caja Principal. Por el contrario, los valores en Tarjetas de Crédito y Débito, Depósito Directo o Transferencias, serán transferidos a las Cuentas Bancarias previamente configuradas.',Updated=TO_DATE('2016-09-20 15:03:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001783
;

-- 20/09/2016 15:05:22 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field_Trl SET Description='Los valores de caja en Efectivo y Cheque, serán transferidos a la Caja Principal. Por el contrario, los valores en Tarjetas de Crédito y Débito, Depósito Directo o Transferencias, serán transferidos a las Cuentas Bancarias previamente configuradas.',Help='Los valores de caja en Efectivo y Cheque, serán transferidos a la Caja Principal. Por el contrario, los valores en Tarjetas de Crédito y Débito, Depósito Directo o Transferencias, serán transferidos a las Cuentas Bancarias previamente configuradas.',Updated=TO_DATE('2016-09-20 15:05:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000168 AND AD_Language='es_AR'
;

-- Registración de script
SELECT register_migration_script_lar('0076_ISSUE-80.sql', 'LAR', '') FROM dual
;
