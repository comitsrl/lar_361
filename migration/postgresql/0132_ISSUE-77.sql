ALTER TABLE C_DocType ALTER COLUMN DocSubTypeCAE TYPE character(3);

-- Agregar columna cuenta bancaria en AD_OrgInfo.
ALTER TABLE AD_OrgInfo ADD COLUMN C_BankAccount_ID numeric(10,0);
ALTER TABLE AD_OrgInfo ADD CONSTRAINT cbankaccount_adorginfo FOREIGN KEY (C_BankAccount_ID)
      REFERENCES C_BankAccount (C_BankAccount_ID) MATCH SIMPLE;

-- Agregar columnas CBU y Alias en Cuenta Bancaria.
ALTER TABLE C_BankAccount ADD COLUMN Cbu character varying(40);
ALTER TABLE C_BankAccount ADD COLUMN Alias character varying(40);

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

-- Registración de script
SELECT register_migration_script_lar('0132_ISSUE-77.sql', 'LAR', '')
;
