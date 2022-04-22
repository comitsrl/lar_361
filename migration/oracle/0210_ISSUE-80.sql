ALTER TABLE LAR_Tarjeta_Credito ADD COLUMN SoPoType character(1) NOT NULL DEFAULT 'A'::bpchar;

-- 22/04/2022 17:58:58 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004457,3000031,'LAR',0,'Y','N','N','Sales Tax: charged when selling - examples: Sales Tax, Output VAT (payable)
Purchase Tax: tax charged when purchasing - examples: Use Tax, Input VAT (receivable)','N',1,'N',20,'N',2167,'N','Y','N','Sales Tax applies to sales situations, Purchase Tax to purchase situations','SO/PO Type','SOPOType',100,TO_DATE('2022-04-22 17:58:57','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2022-04-22 17:58:57','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/04/2022 17:58:58 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004457 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/04/2022 18:00:04 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007773,1,'Y','N','N',3004457,'N','Y',3000052,'N','Sales Tax: charged when selling - examples: Sales Tax, Output VAT (payable)
Purchase Tax: tax charged when purchasing - examples: Use Tax, Input VAT (receivable)','LAR','Sales Tax applies to sales situations, Purchase Tax to purchase situations','SO/PO Type',100,0,TO_DATE('2022-04-22 18:00:04','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2022-04-22 18:00:04','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/04/2022 18:00:04 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007773 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/04/2022 18:12:14 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000143,'L','LAR','N','LAR_TipoTransaccion',0,0,100,TO_DATE('2022-04-22 18:12:14','YYYY-MM-DD HH24:MI:SS'),'Y',TO_DATE('2022-04-22 18:12:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/04/2022 18:12:15 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000143 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 22/04/2022 18:12:32 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,Created,CreatedBy,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000338,3000143,'LAR','A','Ambos',TO_DATE('2022-04-22 18:12:32','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-04-22 18:12:32','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',0)
;

-- 22/04/2022 18:12:32 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000338 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 22/04/2022 18:12:50 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,Created,CreatedBy,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000339,3000143,'LAR','C','Compras',TO_DATE('2022-04-22 18:12:49','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-04-22 18:12:49','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',0)
;

-- 22/04/2022 18:12:50 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000339 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 22/04/2022 18:13:09 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,Created,CreatedBy,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000340,3000143,'LAR','V','Ventas',TO_DATE('2022-04-22 18:13:08','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-04-22 18:13:08','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',0)
;

-- 22/04/2022 18:13:09 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000340 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 22/04/2022 18:14:49 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Column SET AD_Reference_Value_ID=3000143, AD_Reference_ID=17,Updated=TO_DATE('2022-04-22 18:14:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004457
;

-- 22/04/2022 18:26:11 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Ref_Table SET WhereClause='LAR_Tarjeta_Credito.EsChequeEmitido=''Y'' AND LAR_Tarjeta_Credito.SOPOType=''A'' AND LAR_Tarjeta_Credito.SOPOType=''V''',Updated=TO_DATE('2022-04-22 18:26:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=3000062
;

-- 22/04/2022 18:28:34 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Val_Rule SET Code='LAR_Tarjeta_Credito.EsDeposito=''Y'' AND LAR_Tarjeta_Credito.SOPOType=''A'' AND LAR_Tarjeta_Credito.SOPOType=''V''',Updated=TO_DATE('2022-04-22 18:28:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000040
;

-- 22/04/2022 18:30:05 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('LAR_Tarjeta_Credito.SOPOType=''A'' AND LAR_Tarjeta_Credito.SOPOType=''V''','S',3000114,'LAR','LAR_Billeteras_Digitales_Ventas',100,100,TO_DATE('2022-04-22 18:30:03','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_DATE('2022-04-22 18:30:03','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/04/2022 18:30:18 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Column SET AD_Val_Rule_ID=3000114,Updated=TO_DATE('2022-04-22 18:30:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003929
;

-- 22/04/2022 18:30:58 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Val_Rule SET Code='LAR_Tarjeta_Credito.EsDebito=''N'' AND LAR_Tarjeta_Credito.EsDeposito=''N'' AND LAR_Tarjeta_Credito.EsChequeEmitido=''N'' AND LAR_Tarjeta_Credito.EsQR = ''N'' AND LAR_Tarjeta_Credito.SOPOType=''A'' AND LAR_Tarjeta_Credito.SOPOType=''V''', Name='Tarjetas de Credito Ventas',Updated=TO_DATE('2022-04-22 18:30:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000031
;

-- 22/04/2022 18:31:23 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Val_Rule SET Code='LAR_Tarjeta_Credito.EsDebito=''Y'' AND LAR_Tarjeta_Credito.EsDeposito=''N'' AND LAR_Tarjeta_Credito.SOPOType=''A'' AND LAR_Tarjeta_Credito.SOPOType=''V''', Name='Tarjeta de Debito Ventas',Updated=TO_DATE('2022-04-22 18:31:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000032
;

-- 22/04/2022 18:34:29 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Val_Rule SET Name='Billeteras_Digitales_Ventas',Updated=TO_DATE('2022-04-22 18:34:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000114
;

-- 22/04/2022 18:35:14 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Val_Rule SET Code='LAR_Tarjeta_Credito.SOPOType=''A'' AND LAR_Tarjeta_Credito.SOPOType=''V''', Name='Tipos de Deposito Directo Ventas',Updated=TO_DATE('2022-04-22 18:35:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000040
;

-- 22/04/2022 18:35:46 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Ref_Table SET WhereClause='LAR_Tarjeta_Credito.EsDeposito=''Y''',Updated=TO_DATE('2022-04-22 18:35:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=3000054
;

-- 22/04/2022 18:39:42 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Ref_Table SET WhereClause='LAR_Tarjeta_Credito.EsChequeEmitido=''Y''',Updated=TO_DATE('2022-04-22 18:39:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=3000062
;

-- 22/04/2022 18:40:45 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('LAR_Tarjeta_Credito.SOPOType=''A'' AND LAR_Tarjeta_Credito.SOPOType=''C''','S',3000115,'LAR','Tipo de Cheques Emitidos COMPRAS',100,100,TO_DATE('2022-04-22 18:40:45','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_DATE('2022-04-22 18:40:45','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/04/2022 18:40:57 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Field SET AD_Reference_ID=18, AD_Reference_Value_ID=3000062, AD_Val_Rule_ID=3000115,Updated=TO_DATE('2022-04-22 18:40:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003313
;

-- 22/04/2022 18:42:17 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('LAR_Tarjeta_Credito.EsDebito=''N'' AND LAR_Tarjeta_Credito.EsDeposito=''N'' AND LAR_Tarjeta_Credito.EsChequeEmitido=''N'' AND LAR_Tarjeta_Credito.EsQR = ''N'' AND LAR_Tarjeta_Credito.SOPOType=''A'' AND LAR_Tarjeta_Credito.SOPOType=''C''','S',3000116,'LAR','Tarjetas de Credito Ventas',100,100,TO_DATE('2022-04-22 18:42:16','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_DATE('2022-04-22 18:42:16','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/04/2022 18:43:09 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Val_Rule SET Name='Tarjetas de Credito COMPRAS',Updated=TO_DATE('2022-04-22 18:43:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000116
;

-- 22/04/2022 18:43:23 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Field SET AD_Reference_ID=19, AD_Val_Rule_ID=3000116,Updated=TO_DATE('2022-04-22 18:43:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002769
;

-- 22/04/2022 18:44:52 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Val_Rule SET Code='LAR_Tarjeta_Credito.SOPOType=''A'' AND LAR_Tarjeta_Credito.SOPOType=''V''',Updated=TO_DATE('2022-04-22 18:44:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000032
;

-- 22/04/2022 18:45:02 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Ref_Table SET WhereClause='LAR_Tarjeta_Credito.EsDebito=''Y''',Updated=TO_DATE('2022-04-22 18:45:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=3000046
;

-- 22/04/2022 18:45:43 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('LAR_Tarjeta_Credito.SOPOType=''A'' AND LAR_Tarjeta_Credito.SOPOType=''C''','S',3000117,'LAR','Tarjeta de Debito COMPRAS',100,100,TO_DATE('2022-04-22 18:45:42','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_DATE('2022-04-22 18:45:42','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/04/2022 18:46:16 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Field SET AD_Reference_ID=18, AD_Reference_Value_ID=3000046, AD_Val_Rule_ID=3000116,Updated=TO_DATE('2022-04-22 18:46:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002770
;

-- 22/04/2022 18:47:32 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('LAR_Tarjeta_Credito.SOPOType=''A'' AND LAR_Tarjeta_Credito.SOPOType=''C''','S',3000118,'LAR','Tipos de Deposito Directo COMPRAS',100,100,TO_DATE('2022-04-22 18:47:32','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_DATE('2022-04-22 18:47:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/04/2022 18:47:51 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Field SET AD_Reference_ID=18, AD_Reference_Value_ID=3000054, AD_Val_Rule_ID=3000118,Updated=TO_DATE('2022-04-22 18:47:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002806
;

-- 22/04/2022 19:04:48 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Val_Rule SET Code='LAR_Tarjeta_Credito.SOPOType=''A'' OR LAR_Tarjeta_Credito.SOPOType=''V''',Updated=TO_DATE('2022-04-22 19:04:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000040
;

-- 22/04/2022 19:05:30 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Val_Rule SET Code='LAR_Tarjeta_Credito.SOPOType=''A'' OR LAR_Tarjeta_Credito.SOPOType=''V''',Updated=TO_DATE('2022-04-22 19:05:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000114
;

-- 22/04/2022 19:06:26 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Val_Rule SET Code='LAR_Tarjeta_Credito.EsDebito=''N'' AND LAR_Tarjeta_Credito.EsDeposito=''N'' AND LAR_Tarjeta_Credito.EsChequeEmitido=''N'' AND LAR_Tarjeta_Credito.EsQR = ''N'' AND LAR_Tarjeta_Credito.SOPOType=''A'' OR LAR_Tarjeta_Credito.SOPOType=''V''',Updated=TO_DATE('2022-04-22 19:06:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000031
;

-- 22/04/2022 19:06:43 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Val_Rule SET Code='LAR_Tarjeta_Credito.SOPOType=''A'' OR LAR_Tarjeta_Credito.SOPOType=''V''',Updated=TO_DATE('2022-04-22 19:06:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000032
;

-- 22/04/2022 19:07:45 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Val_Rule SET Code='LAR_Tarjeta_Credito.SOPOType=''A'' OR LAR_Tarjeta_Credito.SOPOType=''C''',Updated=TO_DATE('2022-04-22 19:07:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000115
;

-- 22/04/2022 19:07:59 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Val_Rule SET Code='LAR_Tarjeta_Credito.EsDebito=''N'' AND LAR_Tarjeta_Credito.EsDeposito=''N'' AND LAR_Tarjeta_Credito.EsChequeEmitido=''N'' AND LAR_Tarjeta_Credito.EsQR = ''N'' AND LAR_Tarjeta_Credito.SOPOType=''A'' OR LAR_Tarjeta_Credito.SOPOType=''C''',Updated=TO_DATE('2022-04-22 19:07:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000116
;

-- 22/04/2022 19:08:34 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Val_Rule SET Code='LAR_Tarjeta_Credito.SOPOType=''A'' OR LAR_Tarjeta_Credito.SOPOType=''C''',Updated=TO_DATE('2022-04-22 19:08:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000117
;

-- 22/04/2022 19:08:46 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Field SET AD_Val_Rule_ID=3000117,Updated=TO_DATE('2022-04-22 19:08:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002770
;

-- 22/04/2022 19:09:00 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Val_Rule SET Code='LAR_Tarjeta_Credito.SOPOType=''A'' OR LAR_Tarjeta_Credito.SOPOType=''C''',Updated=TO_DATE('2022-04-22 19:09:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000118
;

-- 22/04/2022 19:25:07 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Val_Rule SET Code='(LAR_Tarjeta_Credito.SOPOType=''A'' OR LAR_Tarjeta_Credito.SOPOType=''V'')',Updated=TO_DATE('2022-04-22 19:25:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000040
;

-- 22/04/2022 19:25:34 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Val_Rule SET Code='LAR_Tarjeta_Credito.EsDebito=''N'' AND LAR_Tarjeta_Credito.EsDeposito=''N'' AND LAR_Tarjeta_Credito.EsChequeEmitido=''N'' AND LAR_Tarjeta_Credito.EsQR = ''N'' AND (LAR_Tarjeta_Credito.SOPOType=''A'' OR LAR_Tarjeta_Credito.SOPOType=''V'')',Updated=TO_DATE('2022-04-22 19:25:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000031
;

-- 22/04/2022 19:26:05 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Val_Rule SET Code='(LAR_Tarjeta_Credito.SOPOType=''A'' OR LAR_Tarjeta_Credito.SOPOType=''V'')',Updated=TO_DATE('2022-04-22 19:26:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000032
;

-- 22/04/2022 19:27:14 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Val_Rule SET Code='(LAR_Tarjeta_Credito.SOPOType=''A'' OR LAR_Tarjeta_Credito.SOPOType=''C'')',Updated=TO_DATE('2022-04-22 19:27:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000115
;

-- 22/04/2022 19:27:30 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Val_Rule SET Code='LAR_Tarjeta_Credito.EsDebito=''N'' AND LAR_Tarjeta_Credito.EsDeposito=''N'' AND LAR_Tarjeta_Credito.EsChequeEmitido=''N'' AND LAR_Tarjeta_Credito.EsQR = ''N'' AND (LAR_Tarjeta_Credito.SOPOType=''A'' OR LAR_Tarjeta_Credito.SOPOType=''C'')',Updated=TO_DATE('2022-04-22 19:27:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000116
;

-- 22/04/2022 19:27:50 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Val_Rule SET Code='(LAR_Tarjeta_Credito.SOPOType=''A'' OR LAR_Tarjeta_Credito.SOPOType=''C'')',Updated=TO_DATE('2022-04-22 19:27:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000117
;

-- 22/04/2022 19:28:10 ART
-- ISSUE #80: Filtrar formas de pago para compras y ventas.
UPDATE AD_Val_Rule SET Code='(LAR_Tarjeta_Credito.SOPOType=''A'' OR LAR_Tarjeta_Credito.SOPOType=''C'')',Updated=TO_DATE('2022-04-22 19:28:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000118
;

-- Registración de script
SELECT register_migration_script_lar('0210_ISSUE-80.sql', 'LAR', '') FROM dual
;
