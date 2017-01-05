-- Bug 251: Contabilidad por Forma de Pago
-- Tabla LAR_TenderType_BankAccount

CREATE TABLE LAR_TenderType_BankAccount
(
  LAR_TenderType_BankAccount_ID numeric(10,0) NOT NULL,
  AD_Client_ID numeric(10,0) NOT NULL,
  AD_Org_ID numeric(10,0) NOT NULL,
  Created timestamp without time zone NOT NULL,
  CreatedBy numeric(10,0) NOT NULL,
  Updated timestamp without time zone NOT NULL,
  UpdatedBy numeric(10,0) NOT NULL,
  IsActive character(1) NOT NULL DEFAULT 'Y'::bpchar,
  TenderType character(1) NOT NULL,
  C_BankAccount_ID numeric(10,0) NOT NULL,
  CreditCardType character(1),
  DebitCardType character(1),
 CONSTRAINT LAR_TenderType_BankAccount_key PRIMARY KEY (LAR_TenderType_BankAccount_ID),
 CONSTRAINT LAR_TenderType_BankAccount_isactive_check CHECK (isactive = 'Y'::bpchar OR isactive = 'N'::bpchar),
 CONSTRAINT ad_org_LAR_TenderType_BankAccount FOREIGN KEY (ad_org_id)
    REFERENCES ad_org (ad_org_id) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED,
 CONSTRAINT C_BankAccount_ID_LAR_TenderType_BankAccount FOREIGN KEY (C_BankAccount_ID)
    REFERENCES C_BankAccount (C_BankAccount_ID) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED,
 CONSTRAINT ad_client_LAR_TenderType_BankAccount FOREIGN KEY (ad_client_id)
    REFERENCES ad_client (ad_client_id) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED
)
WITH (
  OIDS=FALSE
);

-- 02/07/2015 12:51:47 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,ImportTable,IsHighVolume,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Description,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','3',0,3000034,'N','N','N','N','N','LAR','Y','Y','L','LAR_TenderType_BankAccount','Cuentas Bancarias para cada Forma de Pago','LAR_TenderType_BankAccount',0,'Y',0,100,TO_DATE('2015-07-02 12:51:46','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2015-07-02 12:51:46','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/07/2015 12:51:47 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000034 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- 02/07/2015 12:51:48 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,UpdatedBy,AD_Client_ID,Updated,Created,CreatedBy,IsActive) VALUES (1,'N',200000,'Y',1000000,1000000,'N','Y',3000142,'Table LAR_TenderType_BankAccount','LAR_TenderType_BankAccount',0,100,0,TO_DATE('2015-07-02 12:51:47','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-07-02 12:51:47','YYYY-MM-DD HH24:MI:SS'),100,'Y')
;

-- 02/07/2015 12:51:55 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000215,'LAR_TenderType_BankAccount_ID','LAR','LAR_TenderType_BankAccount','LAR_TenderType_BankAccount',0,TO_DATE('2015-07-02 12:51:54','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-07-02 12:51:54','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 02/07/2015 12:51:55 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000215 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 02/07/2015 12:51:55 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001078,3000034,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3000215,'N','N','N','LAR_TenderType_BankAccount','LAR_TenderType_BankAccount_ID',100,TO_DATE('2015-07-02 12:51:54','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2015-07-02 12:51:54','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/08/2015 9:56:00 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Column SET IsIdentifier='Y', IsUpdateable='N', IsAllowCopy='N',Updated=TO_DATE('2015-08-31 09:56:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001078
;

-- 31/08/2015 10:07:56 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Column SET IsIdentifier='Y',Updated=TO_DATE('2015-08-31 10:07:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001087
;

-- 02/07/2015 12:51:56 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001078 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/07/2015 12:51:56 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001079,3000034,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,TO_DATE('2015-07-02 12:51:56','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2015-07-02 12:51:56','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/07/2015 12:51:56 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001079 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/07/2015 12:51:56 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001080,3000034,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',100,TO_DATE('2015-07-02 12:51:56','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2015-07-02 12:51:56','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/07/2015 12:51:56 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001080 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/07/2015 12:51:57 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001081,3000034,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,TO_DATE('2015-07-02 12:51:56','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2015-07-02 12:51:56','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/07/2015 12:51:57 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001081 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/07/2015 12:51:57 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001082,3000034,'LAR',0,110,'Y','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,TO_DATE('2015-07-02 12:51:57','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2015-07-02 12:51:57','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/07/2015 12:51:57 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001082 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/07/2015 12:51:58 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001083,3000034,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,TO_DATE('2015-07-02 12:51:57','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2015-07-02 12:51:57','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/07/2015 12:51:58 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001083 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/07/2015 12:51:58 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001084,3000034,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,TO_DATE('2015-07-02 12:51:58','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2015-07-02 12:51:58','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/07/2015 12:51:58 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001084 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/07/2015 12:51:59 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001085,3000034,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,TO_DATE('2015-07-02 12:51:58','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2015-07-02 12:51:58','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/07/2015 12:51:59 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001085 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/07/2015 12:51:59 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001086,3000034,'LAR',0,'Y','N','N','The Tender Type indicates the method of payment (ACH or Direct Deposit, Credit Card, Check, Direct Debit)','N',1,'N',20,'N',1441,'N','Y','N','Method of Payment','Tender type','TenderType',100,TO_DATE('2015-07-02 12:51:59','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2015-07-02 12:51:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/07/2015 12:51:59 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001086 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/07/2015 12:51:59 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001087,3000034,'LAR',0,'Y','N','N','The Bank Account identifies an account at this Bank.','N',10,'N',19,'N',836,'N','Y','N','Account at the Bank','Bank Account','C_BankAccount_ID',100,TO_DATE('2015-07-02 12:51:59','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2015-07-02 12:51:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/07/2015 12:51:59 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001087 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/07/2015 12:52:37 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_DATE('2015-07-02 12:52:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001086
;

-- 02/07/2015 12:56:36 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Column SET AD_Reference_Value_ID=214, AD_Reference_ID=17, ReadOnlyLogic='@IsApproved@=Y | @LAR_PaymentSource_ID@!0',Updated=TO_DATE('2015-07-02 12:56:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001086
;

-- 02/07/2015 12:58:59 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Column SET DefaultValue='@#AD_Client_ID@', AD_Val_Rule_ID=129, IsAllowCopy='N',Updated=TO_DATE('2015-07-02 12:58:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001079
;

-- 02/07/2015 12:59:34 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Column SET AD_Val_Rule_ID=130, IsAllowCopy='N',Updated=TO_DATE('2015-07-02 12:59:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001080
;

-- 02/07/2015 13:03:08 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Window (AD_Window_ID,WindowType,Help,IsSOTrx,IsDefault,IsBetaFunctionality,WinHeight,WinWidth,EntityType,Name,Description,IsActive,Created,UpdatedBy,CreatedBy,Updated,AD_Org_ID,AD_Client_ID,Processing) VALUES (3000028,'M','Permite asignar una cuenta bancaria a una Forma de Pago. Al momento de contabilizarse el Cobro/Pago con la respectiva Forma de Pago lo hará contra la cuenta contable configurados en la cuenta bancaria seleccionada.','Y','N','N',0,0,'LAR','Cuentas Bancaria por Forma de Pago','Asignar Cuentas Bancaria por Forma de Pago','Y',TO_DATE('2015-07-02 13:03:08','YYYY-MM-DD HH24:MI:SS'),100,100,TO_DATE('2015-07-02 13:03:08','YYYY-MM-DD HH24:MI:SS'),0,0,'N')
;

-- 02/07/2015 13:03:08 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Window_Trl (AD_Language,AD_Window_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Window_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Window t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Window_ID=3000028 AND NOT EXISTS (SELECT * FROM AD_Window_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Window_ID=t.AD_Window_ID)
;

-- 02/07/2015 13:05:55 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('Y',3000028,10,'N','N',3000034,3000055,'N','N','N','N',0,'Y','N','LAR','Cuentas por Forma de Pago',0,0,TO_DATE('2015-07-02 13:05:54','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2015-07-02 13:05:54','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 02/07/2015 13:05:55 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000055 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 02/07/2015 13:06:03 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001881,1,'Y','N','N',3001085,'N','Y',3000055,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,TO_DATE('2015-07-02 13:06:02','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-07-02 13:06:02','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/07/2015 13:06:03 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001881 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/07/2015 13:06:03 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001882,10,'Y','N','N',3001087,'N','Y',3000055,'N','The Bank Account identifies an account at this Bank.','LAR','Account at the Bank','Bank Account',100,0,TO_DATE('2015-07-02 13:06:03','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-07-02 13:06:03','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/07/2015 13:06:03 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001882 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/07/2015 13:06:04 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001883,10,'Y','N','N',3001079,'N','Y',3000055,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,TO_DATE('2015-07-02 13:06:03','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-07-02 13:06:03','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/07/2015 13:06:04 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001883 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/07/2015 13:06:05 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001884,10,'N','N','N',3001078,'N','Y',3000055,'N','LAR','LAR_TenderType_BankAccount',100,0,TO_DATE('2015-07-02 13:06:04','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-07-02 13:06:04','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/07/2015 13:06:05 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001884 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/07/2015 13:06:05 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001885,10,'Y','N','N',3001080,'N','Y',3000055,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,TO_DATE('2015-07-02 13:06:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-07-02 13:06:05','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/07/2015 13:06:05 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001885 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/07/2015 13:06:06 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001886,1,'Y','N','N',3001086,'N','Y',3000055,'N','The Tender Type indicates the method of payment (ACH or Direct Deposit, Credit Card, Check, Direct Debit)','LAR','Method of Payment','Tender type',100,0,TO_DATE('2015-07-02 13:06:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-07-02 13:06:05','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/07/2015 13:06:06 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001886 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/07/2015 13:06:36 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3001883
;

-- 02/07/2015 13:06:36 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3001885
;

-- 02/07/2015 13:06:36 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3001881
;

-- 02/07/2015 13:06:36 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3001886
;

-- 02/07/2015 13:06:36 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3001882
;

-- 02/07/2015 13:06:44 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2015-07-02 13:06:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001885
;

-- 02/07/2015 13:06:53 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2015-07-02 13:06:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001882
;

-- 02/07/2015 13:09:57 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET AD_FieldGroup_ID=50002,Updated=TO_DATE('2015-07-02 13:09:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001886
;

-- 02/07/2015 13:10:18 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET AD_FieldGroup_ID=50002,Updated=TO_DATE('2015-07-02 13:10:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001882
;

-- 02/07/2015 13:12:16 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Window_Trl SET Name='Cuenta Bancaria por Forma de Pago',Description='Asignar Cuenta Bancaria por Forma de Pago',Updated=TO_DATE('2015-07-02 13:12:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Window_ID=3000028 AND AD_Language='es_AR'
;

-- 02/07/2015 13:12:31 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Menu (AD_Window_ID,AD_Menu_ID,IsSummary,Action,IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Description,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000028,3000101,'N','W','Y','N','LAR','Y','Cuenta Bancaria por Forma de Pago','Asigna una Cuenta Bancaria por Forma de Pago',TO_DATE('2015-07-02 13:12:31','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_DATE('2015-07-02 13:12:31','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 02/07/2015 13:12:31 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000101 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 02/07/2015 13:12:31 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', SysDate, 100, SysDate, 100,t.AD_Tree_ID, 3000101, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000101)
;

-- 02/07/2015 13:12:45 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=0, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=1000013
;

-- 02/07/2015 13:12:45 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=1, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000092
;

-- 02/07/2015 13:12:45 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=2, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000015
;

-- 02/07/2015 13:12:45 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=3, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000060
;

-- 02/07/2015 13:12:45 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=4, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000101
;

-- 02/07/2015 13:12:45 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=5, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000013
;

-- 02/07/2015 13:12:45 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=6, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000024
;

-- 02/07/2015 13:12:45 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=7, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=1000008
;

-- 02/07/2015 13:12:45 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=8, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000014
;

-- 02/07/2015 13:12:45 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=9, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000048
;

-- 02/07/2015 13:12:45 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=10, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=235
;

-- 02/07/2015 13:12:45 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=11, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=241
;

-- 02/07/2015 13:12:45 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=12, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=462
;

-- 02/07/2015 13:12:45 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=13, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=245
;

-- 02/07/2015 13:12:45 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=14, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=251
;

-- 02/07/2015 13:12:45 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=15, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=255
;

-- 02/07/2015 13:12:45 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=16, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=286
;

-- 02/07/2015 13:12:45 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=17, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=287
;

-- 02/07/2015 13:12:45 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=18, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=438
;

-- 02/07/2015 13:12:45 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=19, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=234
;

-- 02/07/2015 13:12:45 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=20, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53313
;

-- 02/07/2015 13:12:45 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=21, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=505
;

-- 02/07/2015 13:12:45 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=22, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=496
;

-- 02/07/2015 13:12:45 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=23, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=497
;

-- 02/07/2015 13:12:45 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=24, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=304
;

-- 02/07/2015 13:12:45 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=25, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53190
;

-- 02/07/2015 13:12:45 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=26, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53187
;

-- 02/07/2015 13:28:40 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001088,3000034,'LAR',0,'N','N','N','The Credit Card drop down list box is used for selecting the type of Credit Card presented for payment.','N',1,'N',20,'N',1012,'N','Y','N','Credit Card (Visa, MC, AmEx)','Credit Card','CreditCardType',100,TO_DATE('2015-07-02 13:28:39','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2015-07-02 13:28:39','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/07/2015 13:28:40 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001088 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/07/2015 13:30:06 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Column SET AD_Reference_Value_ID=149, AD_Reference_ID=17,Updated=TO_DATE('2015-07-02 13:30:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001088
;

-- 02/07/2015 13:31:44 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001887,1,'Y','N','N',3001088,'N','Y',3000055,'N','The Credit Card drop down list box is used for selecting the type of Credit Card presented for payment.','LAR','Credit Card (Visa, MC, AmEx)','Credit Card',100,0,TO_DATE('2015-07-02 13:31:44','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-07-02 13:31:44','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/07/2015 13:31:44 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001887 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/07/2015 13:32:10 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET DisplayLogic='@TenderType@=C',Updated=TO_DATE('2015-07-02 13:32:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001887
;

-- 02/07/2015 13:38:15 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Column SET DefaultValue='C',Updated=TO_DATE('2015-07-02 13:38:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001088
;

-- 31/07/2015 13:05:30 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Ref_List_Trl SET Name='Tarjeta de Débito',Updated=TO_DATE('2015-07-31 13:05:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=651 AND AD_Language='es_AR'
;

-- 31/07/2015 13:05:38 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Ref_List SET IsActive='Y',Updated=TO_DATE('2015-07-31 13:05:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=651
;

-- 31/07/2015 13:07:18 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Ref_List SET IsActive='N',Updated=TO_DATE('2015-07-31 13:07:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=419
;

-- 31/07/2015 13:21:26 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,VFormat,EntityType,IsOrderByValue,Name,Description,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000036,'L','A','LAR','N','C_Payment DebitCard Type','Lista de tipos de Tarjetas de Débito',0,0,100,TO_DATE('2015-07-31 13:21:25','YYYY-MM-DD HH24:MI:SS'),'Y',TO_DATE('2015-07-31 13:21:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/07/2015 13:21:26 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000036 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 31/07/2015 13:29:01 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,Created,CreatedBy,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000058,3000036,'LAR','V','Visa',TO_DATE('2015-07-31 13:29:01','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-07-31 13:29:01','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',0)
;

-- 31/07/2015 13:29:01 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000058 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 31/07/2015 13:29:16 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,Created,CreatedBy,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000059,3000036,'LAR','E','Cabal',TO_DATE('2015-07-31 13:29:16','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-07-31 13:29:16','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',0)
;

-- 31/07/2015 13:29:16 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000059 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 31/07/2015 13:29:41 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,Created,CreatedBy,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000060,3000036,'LAR','I','Confiable',TO_DATE('2015-07-31 13:29:41','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-07-31 13:29:41','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',0)
;

-- 31/07/2015 13:29:41 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000060 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 31/07/2015 13:29:53 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,Created,CreatedBy,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000061,3000036,'LAR','Z','Nativa',TO_DATE('2015-07-31 13:29:53','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-07-31 13:29:53','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',0)
;

-- 31/07/2015 13:29:53 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000061 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 31/07/2015 13:30:07 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,Created,CreatedBy,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000062,3000036,'LAR','N','Maestro',TO_DATE('2015-07-31 13:30:07','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-07-31 13:30:07','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',0)
;

-- 31/07/2015 13:30:07 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000062 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

ALTER TABLE C_Payment ADD COLUMN
DebitCardType character(1);

-- 31/07/2015 19:27:36 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000223,'debitcardtype','LAR','debitcardtype','debitcardtype',0,TO_DATE('2015-07-31 19:27:35','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-07-31 19:27:35','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 31/07/2015 19:27:36 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000223 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 31/07/2015 19:27:36 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001179,335,'LAR',0,'N','N','N','N',1,'N',20,'N',3000223,'N','Y','N','debitcardtype','debitcardtype',100,TO_DATE('2015-07-31 19:27:35','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2015-07-31 19:27:35','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/07/2015 19:27:36 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001179 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/07/2015 19:28:58 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001944 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/07/2015 19:28:58 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001945 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/07/2015 19:28:58 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001946 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/07/2015 19:28:58 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001947 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/07/2015 19:28:58 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001948 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/07/2015 19:28:58 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001949 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/07/2015 19:28:59 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001950 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/07/2015 19:28:59 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001951 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/07/2015 19:28:59 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001952 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/07/2015 19:28:59 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001953 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/07/2015 19:33:07 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Ref_List SET IsActive='Y',Updated=TO_DATE('2015-07-31 19:33:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=419
;

-- 31/07/2015 19:34:54 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET DisplayLogic='@TenderType@=D',Updated=TO_DATE('2015-07-31 19:34:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001945
;

-- 31/07/2015 19:35:39 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET DisplayLogic='@TenderType@=C | @TenderType@=D',Updated=TO_DATE('2015-07-31 19:35:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=1000234
;

-- 31/07/2015 19:36:29 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Element SET ColumnName='DebitCardType', Name='DebitCardType', PrintName='DebitCardType',Updated=TO_DATE('2015-07-31 19:36:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000223
;

-- 31/07/2015 19:36:29 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000223
;

-- 31/07/2015 19:36:29 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Column SET ColumnName='DebitCardType', Name='DebitCardType', Description=NULL, Help=NULL WHERE AD_Element_ID=3000223
;

-- 31/07/2015 19:36:29 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Process_Para SET ColumnName='DebitCardType', Name='DebitCardType', Description=NULL, Help=NULL, AD_Element_ID=3000223 WHERE UPPER(ColumnName)='DEBITCARDTYPE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 31/07/2015 19:36:29 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Process_Para SET ColumnName='DebitCardType', Name='DebitCardType', Description=NULL, Help=NULL WHERE AD_Element_ID=3000223 AND IsCentrallyMaintained='Y'
;

-- 31/07/2015 19:36:29 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET Name='DebitCardType', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000223) AND IsCentrallyMaintained='Y'
;

-- 31/07/2015 19:36:29 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_PrintFormatItem pi SET PrintName='DebitCardType', Name='DebitCardType' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000223)
;

-- 31/07/2015 19:37:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Column SET AD_Reference_Value_ID=3000036, AD_Reference_ID=17,Updated=TO_DATE('2015-07-31 19:37:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001179
;

-- 31/07/2015 19:41:03 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001954,1,'Y','N','N',3001179,'N','Y',3000013,'N','LAR','DebitCardType',100,0,TO_DATE('2015-07-31 19:41:02','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-07-31 19:41:02','YYYY-MM-DD HH24:MI:SS'))
;

-- 31/07/2015 19:41:03 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001954 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3001954
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000334
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000335
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000336
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000337
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000338
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000339
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000340
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000341
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000342
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000343
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000344
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000345
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000346
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000347
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000348
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000349
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000350
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000351
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000352
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000353
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000354
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000355
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000356
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000357
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000358
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000359
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000360
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000363
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000302
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000364
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000362
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000289
;

-- 31/07/2015 19:41:41 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000366
;

-- 31/07/2015 19:42:18 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET DisplayLogic='@TenderType@=D',Updated=TO_DATE('2015-07-31 19:42:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001954
;

-- 31/07/2015 19:42:35 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET DisplayLogic='@TenderType@=C | @TenderType@=D',Updated=TO_DATE('2015-07-31 19:42:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000335
;

-- 31/07/2015 19:43:18 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Column_Trl SET Name='Tarjeta de Débito',Updated=TO_DATE('2015-07-31 19:43:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001179 AND AD_Language='es_AR'
;

-- 31/07/2015 19:43:24 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Column_Trl SET IsTranslated='Y',Updated=TO_DATE('2015-07-31 19:43:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001179 AND AD_Language='es_AR'
;

-- 31/07/2015 19:43:42 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Tarjeta de Débito',Description='Tipo de tarjeta de Débito',Updated=TO_DATE('2015-07-31 19:43:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001954 AND AD_Language='es_AR'
;

-- 03/08/2015 13:04:14 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001181,3000034,'LAR',0,'N','N','N','N',1,'N',20,'N',3000223,'N','Y','N','DebitCardType','DebitCardType',100,TO_DATE('2015-08-03 13:04:14','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2015-08-03 13:04:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 03/08/2015 13:04:14 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001181 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 03/08/2015 13:05:22 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001955,1,'Y','N','N',3001181,'N','Y',3000055,'N','LAR','DebitCardType',100,0,TO_DATE('2015-08-03 13:05:21','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-08-03 13:05:21','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/08/2015 13:05:22 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001955 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/08/2015 13:06:03 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Tarjeta de Débito',Description='Tipo de Tarjeta de Débito',Updated=TO_DATE('2015-08-03 13:06:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001955 AND AD_Language='es_AR'
;

-- 03/08/2015 13:07:44 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Field SET DisplayLogic='@TenderType@=D',Updated=TO_DATE('2015-08-03 13:07:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001955
;

-- 03/08/2015 13:10:58 ART
-- BUG 251: Contabilidad por Forma de Pago
UPDATE AD_Column SET AD_Reference_Value_ID=3000036, AD_Reference_ID=17,Updated=TO_DATE('2015-08-03 13:10:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001181
;

-- 06/08/2015 18:26:27 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,Created,CreatedBy,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000064,149,'LAR','T','Nativa Mastercard',TO_DATE('2015-08-06 18:26:27','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-08-06 18:26:27','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',0)
;

-- 06/08/2015 18:26:27 ART
-- BUG 251: Contabilidad por Forma de Pago
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000064 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

ALTER TABLE LAR_TenderType_BankAccount ADD COLUMN LAR_Tarjeta_Credito_ID numeric(10,0);

ALTER TABLE LAR_TenderType_BankAccount ADD CONSTRAINT lar_tarjeta_credito_lar_tarjeta_credito_id_fkey FOREIGN KEY (lar_tarjeta_credito_id)
      REFERENCES lar_tarjeta_credito (lar_tarjeta_credito_id) MATCH SIMPLE;

ALTER TABLE LAR_TenderType_BankAccount ADD COLUMN LAR_Tarjeta_Debito_ID numeric(10,0);

ALTER TABLE LAR_TenderType_BankAccount ADD CONSTRAINT lar_tendertype_bankaccount_lar_tarjeta_debito_id_fkey FOREIGN KEY (lar_tarjeta_debito_id)
      REFERENCES lar_tarjeta_credito (lar_tarjeta_credito_id) MATCH SIMPLE;

CREATE UNIQUE INDEX LAR_TenderType_BankAccount_Credito ON LAR_TenderType_BankAccount (TenderType, LAR_Tarjeta_Credito_ID);

CREATE UNIQUE INDEX LAR_TenderType_BankAccount_Debito ON LAR_TenderType_BankAccount (TenderType, LAR_Tarjeta_Debito_ID);

-- 16/06/2016 20:17:24 ART
-- BUG #251: Contabilidad por Forma de Pago
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001774,3000034,'LAR',0,'N','N','N','N',10,'N',19,'N',3000338,'N','Y','N','Tarjeta de Debito','LAR_Tarjeta_Debito_ID',100,TO_DATE('2016-06-16 20:17:23','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-06-16 20:17:23','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 16/06/2016 20:17:24 ART
-- BUG #251: Contabilidad por Forma de Pago
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001774 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 16/06/2016 20:17:53 ART
-- BUG #251: Contabilidad por Forma de Pago
UPDATE AD_Column SET AD_Reference_Value_ID=3000046, AD_Reference_ID=18, AD_Val_Rule_ID=3000032,Updated=TO_DATE('2016-06-16 20:17:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001774
;

-- 16/06/2016 20:18:42 ART
-- BUG #251: Contabilidad por Forma de Pago
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002681,10,'Y','N','N',3001774,'N','Y',3000055,'N','LAR','Tarjeta de Debito',100,0,'Y',TO_DATE('2016-06-16 20:18:42','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-06-16 20:18:42','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/06/2016 20:18:42 ART
-- BUG #251: Contabilidad por Forma de Pago
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002681 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/06/2016 20:19:02 ART
-- BUG #251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001955
;

-- 16/06/2016 20:19:02 ART
-- BUG #251: Contabilidad por Forma de Pago
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3002681
;

-- 16/06/2016 20:19:42 ART
-- BUG #251: Contabilidad por Forma de Pago
UPDATE AD_Field SET DisplayLogic='@TenderType@=D',Updated=TO_DATE('2016-06-16 20:19:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002681
;

-- 16/06/2016 20:21:07 ART
-- BUG #251: Contabilidad por Forma de Pago
UPDATE AD_Column SET AD_Val_Rule_ID=3000031,Updated=TO_DATE('2016-06-16 20:21:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001770
;

-- 22/06/2016 16:23:35 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001776,3000034,'LAR',0,'N','N','N','N',10,'N',19,'N',3000209,'N','Y','N','Tarjeta de Crédito','LAR_Tarjeta_Credito_ID',100,TO_DATE('2016-06-22 16:23:34','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-06-22 16:23:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/06/2016 16:23:35 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001776 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/06/2016 16:23:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET AD_Val_Rule_ID=3000031,Updated=TO_DATE('2016-06-22 16:23:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001776
;

-- 22/06/2016 16:24:39 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002682,10,'Y','N','N',3001776,'N','Y',3000055,'N','LAR','Tarjeta de Crédito',100,0,'Y',TO_DATE('2016-06-22 16:24:39','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-06-22 16:24:39','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/06/2016 16:24:39 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002682 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/06/2016 16:24:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001887
;

-- 22/06/2016 16:24:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3002681
;

-- 22/06/2016 16:24:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3002682
;

-- 22/06/2016 16:25:21 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=C',Updated=TO_DATE('2016-06-22 16:25:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002682
;

-- Registración de script
SELECT register_migration_script_lar('0071_ISSUE-80.sql', 'LAR', '') FROM dual
;
