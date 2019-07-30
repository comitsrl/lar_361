ALTER TABLE C_DocType ADD COLUMN EsFce character(1) NOT NULL DEFAULT 'N'::bpchar;
ALTER TABLE C_DocType ADD CONSTRAINT c_doctype_esfce_check CHECK (EsFce = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]));

ALTER TABLE C_DocType ALTER COLUMN DocSubTypeCAE TYPE character(3);

-- Agregar columna cuenta bancaria en AD_OrgInfo.
ALTER TABLE AD_OrgInfo ADD COLUMN C_BankAccount_ID numeric(10,0);
ALTER TABLE AD_OrgInfo ADD CONSTRAINT cbankaccount_adorginfo FOREIGN KEY (C_BankAccount_ID)
      REFERENCES C_BankAccount (C_BankAccount_ID) MATCH SIMPLE;

-- Agregar columnas CBU y Alias en Cuenta Bancaria.
ALTER TABLE C_BankAccount ADD COLUMN Cbu character varying(40);
ALTER TABLE C_BankAccount ADD COLUMN Alias character varying(40);

-- Cambiar indice unico de tabla C_DocType
drop index lar_letter_doctype_idx;
CREATE UNIQUE INDEX lar_letter_doctype_idx
  ON c_doctype
  USING btree
  (ad_client_id, ad_org_id, isactive COLLATE pg_catalog."default", docbasetype COLLATE pg_catalog."default", fiscaldocument COLLATE pg_catalog."default", lar_documentletter_id, c_pos_id, docsubtypecae);

-- 12/07/2019 16:53:59 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003516,228,'LAR',0,'N','N','N','The Bank Account identifies an account at this Bank.','N',10,'N',19,'N',836,'N','Y','N','Account at the Bank','Bank Account','C_BankAccount_ID',100,TO_TIMESTAMP('2019-07-12 16:53:58','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2019-07-12 16:53:58','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 12/07/2019 16:53:59 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003516 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 12/07/2019 16:56:32 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006566,10,'Y','N','N',3003516,'N','Y',170,'N','The Bank Account identifies an account at this Bank.','LAR','Account at the Bank','Bank Account',100,0,TO_TIMESTAMP('2019-07-12 16:56:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-07-12 16:56:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 12/07/2019 16:56:32 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006566 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 12/07/2019 16:59:04 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=8728
;

-- 12/07/2019 16:59:04 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=1315
;

-- 12/07/2019 16:59:04 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3003218
;

-- 12/07/2019 16:59:04 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=1000000
;

-- 12/07/2019 16:59:04 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=1000001
;

-- 12/07/2019 16:59:05 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=56622
;

-- 12/07/2019 16:59:05 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=58855
;

-- 12/07/2019 16:59:05 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=58852
;

-- 12/07/2019 16:59:05 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=58854
;

-- 12/07/2019 16:59:05 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=58853
;

-- 12/07/2019 16:59:05 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=57532
;

-- 12/07/2019 16:59:05 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3006566
;

-- 12/07/2019 16:59:38 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3006566
;

-- 12/07/2019 16:59:38 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=58855
;

-- 12/07/2019 16:59:38 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=58852
;

-- 12/07/2019 16:59:38 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=58854
;

-- 12/07/2019 16:59:38 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=58853
;

-- 12/07/2019 16:59:38 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=57532
;

-- 12/07/2019 17:02:06 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3003218
;

-- 12/07/2019 17:02:06 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=1315
;

-- 12/07/2019 17:02:22 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2019-07-12 17:02:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006566
;

-- 12/07/2019 17:04:20 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001036,'cbu','LAR','cbu','cbu',0,TO_TIMESTAMP('2019-07-12 17:04:20','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2019-07-12 17:04:20','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 12/07/2019 17:04:20 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001036 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 12/07/2019 17:04:21 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003517,297,'LAR',0,'N','N','N','N',40,'N',10,'N',3001036,'N','Y','N','cbu','cbu',100,TO_TIMESTAMP('2019-07-12 17:04:20','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2019-07-12 17:04:20','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 12/07/2019 17:04:21 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003517 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 12/07/2019 17:04:21 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003518,297,'LAR',0,'N','N','N','The Alias field allows you to define a alternate method for referring to a full account combination.  For example, the Account Receivable Account for Garden World may be aliased as GW_AR.','N',40,'N',10,'N',159,'N','Y','N','Defines an alternate method of indicating an account combination.','Alias','Alias',100,TO_TIMESTAMP('2019-07-12 17:04:21','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2019-07-12 17:04:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 12/07/2019 17:04:21 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003518 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 12/07/2019 17:05:20 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Column SET Name='CBU', ColumnName='CBU',Updated=TO_TIMESTAMP('2019-07-12 17:05:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003517
;

-- 12/07/2019 17:05:20 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003517
;

-- 12/07/2019 17:05:20 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET Name='CBU', Description=NULL, Help=NULL WHERE AD_Column_ID=3003517 AND IsCentrallyMaintained='Y'
;

-- 12/07/2019 17:05:24 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Column_Trl SET Name='CBU',Updated=TO_TIMESTAMP('2019-07-12 17:05:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003517 AND AD_Language='es_AR'
;

-- 12/07/2019 17:05:33 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Element SET ColumnName='CBU', Name='CBU', PrintName='CBU',Updated=TO_TIMESTAMP('2019-07-12 17:05:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001036
;

-- 12/07/2019 17:05:33 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001036
;

-- 12/07/2019 17:05:33 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Column SET ColumnName='CBU', Name='CBU', Description=NULL, Help=NULL WHERE AD_Element_ID=3001036
;

-- 12/07/2019 17:05:33 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Process_Para SET ColumnName='CBU', Name='CBU', Description=NULL, Help=NULL, AD_Element_ID=3001036 WHERE UPPER(ColumnName)='CBU' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 12/07/2019 17:05:33 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Process_Para SET ColumnName='CBU', Name='CBU', Description=NULL, Help=NULL WHERE AD_Element_ID=3001036 AND IsCentrallyMaintained='Y'
;

-- 12/07/2019 17:05:33 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET Name='CBU', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001036) AND IsCentrallyMaintained='Y'
;

-- 12/07/2019 17:05:33 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_PrintFormatItem SET PrintName='CBU', Name='CBU' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001036)
;

-- 12/07/2019 17:05:37 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Element_Trl SET Name='CBU',PrintName='CBU',Updated=TO_TIMESTAMP('2019-07-12 17:05:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001036 AND AD_Language='es_AR'
;

-- 12/07/2019 17:07:22 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006567,40,'Y','N','N',3003518,'N','Y',228,'N','The Alias field allows you to define a alternate method for referring to a full account combination.  For example, the Account Receivable Account for Garden World may be aliased as GW_AR.','LAR','Defines an alternate method of indicating an account combination.','Alias',100,0,TO_TIMESTAMP('2019-07-12 17:07:22','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-07-12 17:07:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 12/07/2019 17:07:22 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006567 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 12/07/2019 17:07:23 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006568,40,'Y','N','N',3003517,'N','Y',228,'N','LAR','CBU',100,0,TO_TIMESTAMP('2019-07-12 17:07:22','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-07-12 17:07:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 12/07/2019 17:07:23 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006568 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 12/07/2019 17:09:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3006567
;

-- 12/07/2019 17:09:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3006568
;

-- 12/07/2019 17:09:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=11201
;

-- 12/07/2019 17:09:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=11017
;

-- 12/07/2019 17:09:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=11016
;

-- 12/07/2019 17:09:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=2222
;

-- 12/07/2019 17:09:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3220
;

-- 12/07/2019 17:09:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=2219
;

-- 12/07/2019 17:09:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=4114
;

-- 12/07/2019 17:09:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=60881
;

-- 12/07/2019 17:09:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=2220
;

-- 12/07/2019 17:09:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=2221
;

-- 12/07/2019 17:09:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000089
;

-- 12/07/2019 17:09:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3002674
;

-- 12/07/2019 17:09:41 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3002675
;

-- 12/07/2019 17:10:04 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2019-07-12 17:10:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006568
;

-- 12/07/2019 17:11:23 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2019-07-12 17:11:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006568
;

-- 12/07/2019 17:11:31 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2019-07-12 17:11:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006567
;

-- 12/07/2019 17:11:38 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3006568
;

-- 12/07/2019 17:11:38 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3006567
;

-- 12/07/2019 17:11:48 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2019-07-12 17:11:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006567
;

-- 12/07/2019 17:11:54 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2019-07-12 17:11:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006568
;

-- 12/07/2019 19:12:32 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET DisplayLength=3,Updated=TO_TIMESTAMP('2019-07-12 19:12:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000030
;

-- 12/07/2019 19:12:42 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Column SET FieldLength=3,Updated=TO_TIMESTAMP('2019-07-12 19:12:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000035
;

-- 16/07/2019 20:53:30 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,Created,CreatedBy,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000228,3000002,'LAR','201','Factura de Crédito Electrónica MiPyMEs A',TO_TIMESTAMP('2019-07-16 20:53:29','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2019-07-16 20:53:29','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',0)
;

-- 16/07/2019 20:53:30 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000228 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 16/07/2019 20:54:52 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,Created,CreatedBy,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000229,3000002,'LAR','202','Nota De Débito Electónica MiPyMEs A',TO_TIMESTAMP('2019-07-16 20:54:51','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2019-07-16 20:54:51','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',0)
;

-- 16/07/2019 20:54:52 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000229 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 16/07/2019 20:55:53 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,Created,CreatedBy,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000230,3000002,'LAR','203','Nota de Credito Electrónica MiPyMEs A',TO_TIMESTAMP('2019-07-16 20:55:53','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2019-07-16 20:55:53','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',0)
;

-- 16/07/2019 20:55:53 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000230 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 16/07/2019 20:56:36 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,Created,CreatedBy,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000231,3000002,'LAR','206','Factura de Crédito Electrónica MiPyMEs B',TO_TIMESTAMP('2019-07-16 20:56:36','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2019-07-16 20:56:36','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',0)
;

-- 16/07/2019 20:56:36 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000231 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 16/07/2019 20:57:06 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,Created,CreatedBy,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000232,3000002,'LAR','207','Nota de Débito Electónica MiPyMEs B',TO_TIMESTAMP('2019-07-16 20:57:06','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2019-07-16 20:57:06','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',0)
;

-- 16/07/2019 20:57:06 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000232 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 16/07/2019 20:57:15 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Ref_List SET Name='Nota de Débito Electónica MiPyMEs A',Updated=TO_TIMESTAMP('2019-07-16 20:57:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000229
;

-- 16/07/2019 20:57:15 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Ref_List_Trl SET IsTranslated='N' WHERE AD_Ref_List_ID=3000229
;

-- 16/07/2019 20:57:59 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,Created,CreatedBy,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000233,3000002,'LAR','208','Nota de Crédito Electrónica MiPyMEs B',TO_TIMESTAMP('2019-07-16 20:57:59','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2019-07-16 20:57:59','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',0)
;

-- 16/07/2019 20:57:59 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000233 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 16/07/2019 20:58:26 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,Created,CreatedBy,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000234,3000002,'LAR','211','Factura de Crédito Electrónica MiPyMEs C',TO_TIMESTAMP('2019-07-16 20:58:26','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2019-07-16 20:58:26','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',0)
;

-- 16/07/2019 20:58:26 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000234 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 16/07/2019 20:58:55 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,Created,CreatedBy,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000235,3000002,'LAR','212','Nota de Débito Electónica MiPyMEs C',TO_TIMESTAMP('2019-07-16 20:58:54','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2019-07-16 20:58:54','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',0)
;

-- 16/07/2019 20:58:55 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000235 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 16/07/2019 20:59:18 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,Created,CreatedBy,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000236,3000002,'LAR','213','Nota de Credito Electrónica MiPyMEs C',TO_TIMESTAMP('2019-07-16 20:59:18','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2019-07-16 20:59:18','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',0)
;

-- 16/07/2019 20:59:18 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000236 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 17/07/2019 17:55:03 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001037,'esfce','LAR','esfce','esfce',0,TO_TIMESTAMP('2019-07-17 17:55:03','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2019-07-17 17:55:03','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 17/07/2019 17:55:03 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001037 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 17/07/2019 17:55:04 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003519,217,'LAR',0,'Y','N','N','N',1,'N',20,'N',3001037,'N','Y','N','esfce','esfce',100,TO_TIMESTAMP('2019-07-17 17:55:03','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2019-07-17 17:55:03','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 17/07/2019 17:55:04 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003519 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 17/07/2019 17:57:10 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Column SET Name='EsFce', ColumnName='EsFce',Updated=TO_TIMESTAMP('2019-07-17 17:57:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003519
;

-- 17/07/2019 17:57:10 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003519
;

-- 17/07/2019 17:57:10 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET Name='EsFce', Description=NULL, Help=NULL WHERE AD_Column_ID=3003519 AND IsCentrallyMaintained='Y'
;

-- 17/07/2019 17:57:35 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Column_Trl SET Name='Es Factura de Crédito Electrónica',Updated=TO_TIMESTAMP('2019-07-17 17:57:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003519 AND AD_Language='es_AR'
;

-- 17/07/2019 17:57:57 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Column SET Name='Es Factura de Crédito Electrónica',Updated=TO_TIMESTAMP('2019-07-17 17:57:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003519
;

-- 17/07/2019 17:57:57 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003519
;

-- 17/07/2019 17:57:57 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET Name='Es Factura de Crédito Electrónica', Description=NULL, Help=NULL WHERE AD_Column_ID=3003519 AND IsCentrallyMaintained='Y'
;

-- 17/07/2019 17:58:17 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Element SET ColumnName='EsFce', Name='Es Factura de Crédito Electrónica', PrintName='Es Factura de Crédito Electrónica',Updated=TO_TIMESTAMP('2019-07-17 17:58:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001037
;

-- 17/07/2019 17:58:17 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001037
;

-- 17/07/2019 17:58:17 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Column SET ColumnName='EsFce', Name='Es Factura de Crédito Electrónica', Description=NULL, Help=NULL WHERE AD_Element_ID=3001037
;

-- 17/07/2019 17:58:17 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Process_Para SET ColumnName='EsFce', Name='Es Factura de Crédito Electrónica', Description=NULL, Help=NULL, AD_Element_ID=3001037 WHERE UPPER(ColumnName)='ESFCE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 17/07/2019 17:58:17 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Process_Para SET ColumnName='EsFce', Name='Es Factura de Crédito Electrónica', Description=NULL, Help=NULL WHERE AD_Element_ID=3001037 AND IsCentrallyMaintained='Y'
;

-- 17/07/2019 17:58:17 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET Name='Es Factura de Crédito Electrónica', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001037) AND IsCentrallyMaintained='Y'
;

-- 17/07/2019 17:58:17 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_PrintFormatItem SET PrintName='Es Factura de Crédito Electrónica', Name='Es Factura de Crédito Electrónica' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001037)
;

-- 17/07/2019 17:58:23 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Element_Trl SET Name='Es Factura de Crédito Electrónica',PrintName='Es Factura de Crédito Electrónica',Updated=TO_TIMESTAMP('2019-07-17 17:58:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001037 AND AD_Language='es_AR'
;

-- 17/07/2019 17:59:44 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006569,1,'Y','N','N',3003519,'N','Y',167,'N','LAR','Es Factura de Crédito Electrónica',100,0,TO_TIMESTAMP('2019-07-17 17:59:44','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-07-17 17:59:44','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 17/07/2019 17:59:44 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006569 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 17/07/2019 18:01:49 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=1000015
;

-- 17/07/2019 18:01:49 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3001289
;

-- 17/07/2019 18:01:49 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000039
;

-- 17/07/2019 18:01:49 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000032
;

-- 17/07/2019 18:01:49 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000038
;

-- 17/07/2019 18:01:49 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000031
;

-- 17/07/2019 18:01:49 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000036
;

-- 17/07/2019 18:01:49 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000035
;

-- 17/07/2019 18:01:49 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000037
;

-- 17/07/2019 18:01:49 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000030
;

-- 17/07/2019 18:01:49 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3006569
;

-- 17/07/2019 18:01:49 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000034
;

-- 17/07/2019 18:02:10 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2019-07-17 18:02:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006569
;

-- 17/07/2019 18:02:51 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Field SET DisplayLogic='@DocSubtypeINV@=''EL''',Updated=TO_TIMESTAMP('2019-07-17 18:02:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006569
;

-- 17/07/2019 18:41:06 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Ref_List SET Value='001',Updated=TO_TIMESTAMP('2019-07-17 18:41:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000007
;

-- 17/07/2019 18:41:13 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Ref_List SET Value='002',Updated=TO_TIMESTAMP('2019-07-17 18:41:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000008
;

-- 17/07/2019 18:41:20 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Ref_List SET Value='003',Updated=TO_TIMESTAMP('2019-07-17 18:41:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000009
;

-- 17/07/2019 18:41:27 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Ref_List SET Value='004',Updated=TO_TIMESTAMP('2019-07-17 18:41:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000010
;

-- 17/07/2019 18:41:33 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Ref_List SET Value='005',Updated=TO_TIMESTAMP('2019-07-17 18:41:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000011
;

-- 17/07/2019 18:41:39 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Ref_List SET Value='006',Updated=TO_TIMESTAMP('2019-07-17 18:41:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000012
;

-- 17/07/2019 18:41:47 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Ref_List SET Value='007',Updated=TO_TIMESTAMP('2019-07-17 18:41:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000013
;

-- 17/07/2019 18:41:56 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Ref_List SET Value='008',Updated=TO_TIMESTAMP('2019-07-17 18:41:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000014
;

-- 17/07/2019 18:42:01 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Ref_List SET Value='009',Updated=TO_TIMESTAMP('2019-07-17 18:42:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000015
;

-- 17/07/2019 18:42:08 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Ref_List SET Value='010',Updated=TO_TIMESTAMP('2019-07-17 18:42:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000016
;

-- 17/07/2019 18:42:14 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Ref_List SET Value='011',Updated=TO_TIMESTAMP('2019-07-17 18:42:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=1000012
;

-- 17/07/2019 18:42:36 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Ref_List SET Value='012',Updated=TO_TIMESTAMP('2019-07-17 18:42:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000096
;

-- 17/07/2019 18:42:44 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Ref_List SET Value='013',Updated=TO_TIMESTAMP('2019-07-17 18:42:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000095
;

-- 17/07/2019 18:42:51 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Ref_List SET Value='015',Updated=TO_TIMESTAMP('2019-07-17 18:42:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=1000011
;

-- 17/07/2019 18:43:07 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Ref_List SET Value='039',Updated=TO_TIMESTAMP('2019-07-17 18:43:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000082
;

-- 17/07/2019 18:43:14 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Ref_List SET Value='040',Updated=TO_TIMESTAMP('2019-07-17 18:43:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000083
;

-- 17/07/2019 18:43:23 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Ref_List SET Value='041',Updated=TO_TIMESTAMP('2019-07-17 18:43:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000094
;

-- 17/07/2019 18:43:30 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Ref_List SET Value='051',Updated=TO_TIMESTAMP('2019-07-17 18:43:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000111
;

-- 17/07/2019 18:43:39 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Ref_List SET Value='052',Updated=TO_TIMESTAMP('2019-07-17 18:43:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000112
;

-- 17/07/2019 18:43:48 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Ref_List SET Value='053',Updated=TO_TIMESTAMP('2019-07-17 18:43:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000113
;

-- 17/07/2019 18:43:55 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Ref_List SET Value='054',Updated=TO_TIMESTAMP('2019-07-17 18:43:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000114
;

-- 17/07/2019 18:44:02 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Ref_List SET Value='066',Updated=TO_TIMESTAMP('2019-07-17 18:44:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000148
;

-- 17/07/2019 18:44:08 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Ref_List SET Value='081',Updated=TO_TIMESTAMP('2019-07-17 18:44:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000086
;

-- 17/07/2019 18:44:13 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Ref_List SET Value='082',Updated=TO_TIMESTAMP('2019-07-17 18:44:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000087
;

-- 17/07/2019 18:44:22 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Ref_List SET Value='083',Updated=TO_TIMESTAMP('2019-07-17 18:44:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000115
;

-- 17/07/2019 18:44:27 ART
-- ISSUE #77: Factura de Credito Electronica (FCE).
UPDATE AD_Ref_List SET Value='099',Updated=TO_TIMESTAMP('2019-07-17 18:44:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000149
;

-- Actualizar el DocSubTypeCAE de todos los Tipos de Doc Electronicos.
UPDATE C_DocType SET DocSubTypeCAE = CONCAT('0', DocSubTypeCAE) WHERE AD_Client_ID = 1000000 AND IsActive = 'Y' AND IsElectronic = 'Y';

-- Registración de script
SELECT register_migration_script_lar('0132_ISSUE-77.sql', 'LAR', '')
;
