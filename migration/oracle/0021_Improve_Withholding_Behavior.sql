-- Mar 12, 2012 7:46:50 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,IsHighVolume,ImportTable,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','3',0,3000004,'N','N','N','N','N','LAR','Y','Y','L','LAR_PaymentWithholding','LAR_PaymentWithholding',0,'Y',0,100,TO_DATE('2012-03-12 19:46:48','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2012-03-12 19:46:48','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 7:46:50 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000004 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- Mar 12, 2012 7:46:51 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,AD_Client_ID,Updated,UpdatedBy,Created,CreatedBy,IsActive) VALUES (1,'N',50000,'Y',1000000,1000000,'N','Y',3000004,'Table LAR_PaymentWithholding','LAR_PaymentWithholding',0,0,TO_DATE('2012-03-12 19:46:50','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2012-03-12 19:46:50','YYYY-MM-DD HH24:MI:SS'),100,'Y')
;

-- Mar 12, 2012 7:51:05 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000071,3000004,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,TO_DATE('2012-03-12 19:51:05','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:51:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:51:06 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000071 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:51:06 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000072,3000004,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',100,TO_DATE('2012-03-12 19:51:06','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:51:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:51:06 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000072 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:51:06 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000073,3000004,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,TO_DATE('2012-03-12 19:51:06','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:51:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:51:07 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000073 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:51:07 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000074,3000004,'LAR',0,110,'Y','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,TO_DATE('2012-03-12 19:51:07','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:51:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:51:07 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000074 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:51:07 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000075,3000004,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,TO_DATE('2012-03-12 19:51:07','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:51:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:51:07 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000075 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:51:07 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000076,3000004,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,TO_DATE('2012-03-12 19:51:07','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:51:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:51:07 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000076 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:51:08 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000077,3000004,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,TO_DATE('2012-03-12 19:51:07','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:51:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:51:08 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000077 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:51:09 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000026,'LAR_PaymentWithholding_ID','LAR','LAR_PaymentWithholding','LAR_PaymentWithholding',0,TO_DATE('2012-03-12 19:51:08','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-03-12 19:51:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- Mar 12, 2012 7:51:09 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000026 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Mar 12, 2012 7:51:09 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000078,3000004,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3000026,'N','N','N','LAR_PaymentWithholding','LAR_PaymentWithholding_ID',100,TO_DATE('2012-03-12 19:51:08','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:51:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:51:09 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000078 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:51:10 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000079,3000004,'LAR',0,'Y','N','N','The Invoice Document.','N',10,'N',19,'N',1008,'N','Y','N','Invoice Identifier','Invoice','C_Invoice_ID',100,TO_DATE('2012-03-12 19:51:09','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:51:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:51:10 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000079 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:51:11 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000080,3000004,'LAR',0,'Y','N','N','The Payment is a unique identifier of this payment.','N',10,'N',19,'N',1384,'N','Y','N','Payment identifier','Payment','C_Payment_ID',100,TO_DATE('2012-03-12 19:51:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:51:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:51:11 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000080 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:51:12 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000081,3000004,'LAR',0,'N','N','N','The Tax indicates the type of tax used in document line.','N',10,'N',19,'N',213,'N','Y','N','Tax identifier','Tax','C_Tax_ID',100,TO_DATE('2012-03-12 19:51:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:51:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:51:12 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000081 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:51:13 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000082,3000004,'LAR',0,'N','N','N','The Accounting Date indicates the date to be used on the General Ledger account entries generated from this document. It is also used for any currency conversion.','N',29,'N',16,'N',263,'N','Y','N','Accounting Date','Account Date','DateAcct',100,TO_DATE('2012-03-12 19:51:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:51:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:51:13 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000082 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:51:14 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000083,3000004,'LAR',0,'N','N','N','The Transaction Date indicates the date of the transaction.','N',29,'N',16,'N',1297,'N','Y','N','Transaction Date','Transaction Date','DateTrx',100,TO_DATE('2012-03-12 19:51:13','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:51:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:51:14 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000083 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:51:14 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000084,3000004,'LAR',0,'N','N','N','N',10,'N',19,'N',1000027,'N','Y','N','Withholding Rule','LCO_WithholdingRule_ID',100,TO_DATE('2012-03-12 19:51:14','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:51:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:51:14 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000084 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:51:14 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000085,3000004,'LAR',0,'Y','N','N','N',10,'N',19,'N',1000028,'N','Y','N','Withholding Type','LCO_WithholdingType_ID',100,TO_DATE('2012-03-12 19:51:14','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:51:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:51:14 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000085 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:51:15 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000086,3000004,'LAR',0,'N','N','N','The Percent indicates the percentage used.','N',131089,'N',22,'N',951,'N','Y','N','Percentage','Percent','Percent',100,TO_DATE('2012-03-12 19:51:14','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:51:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:51:15 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000086 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:51:16 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000087,3000004,'LAR',0,'Y','N','N','The Processed checkbox indicates that a document has been processed.','N',1,'N',20,'N',1047,'N','Y','N','The document has been processed','Processed','Processed',100,TO_DATE('2012-03-12 19:51:15','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:51:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:51:16 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000087 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:51:16 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000088,3000004,'LAR',0,'Y','N','N','The Tax Amount displays the total tax amount for a document.','N',131089,'N',12,'N',1133,'N','Y','N','Tax Amount for a document','Tax Amount','TaxAmt',100,TO_DATE('2012-03-12 19:51:16','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:51:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:51:16 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000088 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:51:16 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000089,3000004,'LAR',0,'Y','N','N','The Tax Base Amount indicates the base amount used for calculating the tax amount.','N',131089,'N',12,'N',1134,'N','Y','N','Base for calculating the tax amount','Tax base Amount','TaxBaseAmt',100,TO_DATE('2012-03-12 19:51:16','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:51:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:51:16 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000089 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:57:02 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,IsHighVolume,ImportTable,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','3',0,3000005,'N','N','N','N','N','LAR','Y','Y','L','LAR_WithholdingCertificate','LAR_WithholdingCertificate',0,'Y',0,100,TO_DATE('2012-03-12 19:57:00','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2012-03-12 19:57:00','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 7:57:02 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000005 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- Mar 12, 2012 7:57:02 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,AD_Client_ID,Updated,UpdatedBy,Created,CreatedBy,IsActive) VALUES (1,'N',50000,'Y',1000000,1000000,'N','Y',3000005,'Table LAR_WithholdingCertificate','LAR_WithholdingCertificate',0,0,TO_DATE('2012-03-12 19:57:02','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2012-03-12 19:57:02','YYYY-MM-DD HH24:MI:SS'),100,'Y')
;

-- Mar 12, 2012 7:57:25 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000090,3000005,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,TO_DATE('2012-03-12 19:57:25','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:57:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:57:25 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000090 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:57:25 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000091,3000005,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',100,TO_DATE('2012-03-12 19:57:25','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:57:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:57:25 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000091 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:57:26 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000092,3000005,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,TO_DATE('2012-03-12 19:57:25','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:57:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:57:26 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000092 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:57:27 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000093,3000005,'LAR',0,110,'N','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,TO_DATE('2012-03-12 19:57:26','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:57:26','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:57:27 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000093 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:57:28 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000094,3000005,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,TO_DATE('2012-03-12 19:57:27','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:57:27','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:57:28 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000094 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:57:29 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000095,3000005,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,TO_DATE('2012-03-12 19:57:28','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:57:28','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:57:29 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000095 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:57:31 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000096,3000005,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,TO_DATE('2012-03-12 19:57:29','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:57:29','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:57:31 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000096 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:57:32 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000027,'LAR_WithholdingCertificate_ID','LAR','LAR_WithholdingCertificate','LAR_WithholdingCertificate',0,TO_DATE('2012-03-12 19:57:31','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-03-12 19:57:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- Mar 12, 2012 7:57:32 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000027 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Mar 12, 2012 7:57:33 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000097,3000005,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3000027,'N','N','N','LAR_WithholdingCertificate','LAR_WithholdingCertificate_ID',100,TO_DATE('2012-03-12 19:57:31','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:57:31','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:57:33 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000097 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:57:34 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000098,3000005,'LAR',0,'Y','N','N','The document number is usually automatically generated by the system and determined by the document type of the document. If the document is not saved, the preliminary number is displayed in "<>".

If the document type of your document has no automatic document sequence defined, the field is empty if you create a new document. This is for documents which usually have an external number (like vendor invoice).  If you leave the field empty, the system will generate a document number for you. The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).','N',30,'Y',10,'N',290,'N','Y','N','Document sequence number of the document','Document No','DocumentNo',100,TO_DATE('2012-03-12 19:57:33','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:57:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:57:34 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000098 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:57:34 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000099,3000005,'LAR',0,'Y','N','N','The Invoice Document.','N',10,'N',19,'N',1008,'N','Y','N','Invoice Identifier','Invoice','C_Invoice_ID',100,TO_DATE('2012-03-12 19:57:34','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:57:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:57:34 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000099 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:57:35 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000100,3000005,'LAR',0,'Y','N','N','The Payment is a unique identifier of this payment.','N',10,'N',19,'N',1384,'N','Y','N','Payment identifier','Payment','C_Payment_ID',100,TO_DATE('2012-03-12 19:57:34','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:57:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:57:35 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000100 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:57:36 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000101,3000005,'LAR',0,'N','N','N','The Document Type determines document sequence and processing rules','N',10,'N',19,'N',196,'N','Y','N','Document type or rules','Document Type','C_DocType_ID',100,TO_DATE('2012-03-12 19:57:35','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:57:35','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:57:36 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000101 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:57:37 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000102,3000005,'LAR',0,'N','N','N','You can convert document types (e.g. from Offer to Order or Invoice).  The conversion is then reflected in the current type.  This processing is initiated by selecting the appropriate Document Action.','N',10,'N',19,'N',197,'N','Y','N','Target document type for conversing documents','Target Document Type','C_DocTypeTarget_ID',100,TO_DATE('2012-03-12 19:57:36','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:57:36','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:57:37 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000102 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:58:21 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000103,335,'LAR',0,'N','N','N','N',131089,'N',12,'N',1000024,'N','Y','N','Withholding Amount','WithholdingAmt',100,TO_DATE('2012-03-12 19:58:20','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:58:20','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:58:21 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000103 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:58:21 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000028,'withholdingpercent','LAR','withholdingpercent','withholdingpercent',0,TO_DATE('2012-03-12 19:58:21','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-03-12 19:58:21','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- Mar 12, 2012 7:58:21 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000028 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Mar 12, 2012 7:58:22 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000104,335,'LAR',0,'N','N','N','N',131089,'N',22,'N',3000028,'N','Y','N','withholdingpercent','withholdingpercent',100,TO_DATE('2012-03-12 19:58:21','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 19:58:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 7:58:22 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000104 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 7:58:59 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Element SET ColumnName='WithholdingPercent', Name='WithholdingPercent', PrintName='WithholdingPercent',Updated=TO_DATE('2012-03-12 19:58:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000028
;

-- Mar 12, 2012 7:58:59 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000028
;

-- Mar 12, 2012 7:58:59 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Column SET ColumnName='WithholdingPercent', Name='WithholdingPercent', Description=NULL, Help=NULL WHERE AD_Element_ID=3000028
;

-- Mar 12, 2012 7:59:00 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Process_Para SET ColumnName='WithholdingPercent', Name='WithholdingPercent', Description=NULL, Help=NULL, AD_Element_ID=3000028 WHERE UPPER(ColumnName)='WITHHOLDINGPERCENT' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Mar 12, 2012 7:59:00 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Process_Para SET ColumnName='WithholdingPercent', Name='WithholdingPercent', Description=NULL, Help=NULL WHERE AD_Element_ID=3000028 AND IsCentrallyMaintained='Y'
;

-- Mar 12, 2012 7:59:00 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET Name='WithholdingPercent', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000028) AND IsCentrallyMaintained='Y'
;

-- Mar 12, 2012 7:59:00 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_PrintFormatItem pi SET PrintName='WithholdingPercent', Name='WithholdingPercent' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000028)
;

-- Mar 12, 2012 8:01:40 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000029,'paymentthresholdmin','LAR','paymentthresholdmin','paymentthresholdmin',0,TO_DATE('2012-03-12 20:01:39','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-03-12 20:01:39','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- Mar 12, 2012 8:01:40 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000029 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Mar 12, 2012 8:01:42 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000105,1000005,'LAR',0,'N','N','N','N',131089,'N',22,'N',3000029,'N','Y','N','paymentthresholdmin','paymentthresholdmin',100,TO_DATE('2012-03-12 20:01:39','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 20:01:39','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 8:01:42 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000105 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 8:01:43 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000030,'iscalcfrompayment','LAR','iscalcfrompayment','iscalcfrompayment',0,TO_DATE('2012-03-12 20:01:42','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-03-12 20:01:42','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- Mar 12, 2012 8:01:43 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000030 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Mar 12, 2012 8:01:44 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000106,1000005,'LAR',0,'Y','N','N','N',1,'N',20,'N',3000030,'N','Y','N','iscalcfrompayment','iscalcfrompayment',100,TO_DATE('2012-03-12 20:01:42','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 20:01:42','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 8:01:44 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000106 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 8:01:45 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000107,1000005,'LAR',0,'N','N','N','The Document Type determines document sequence and processing rules','N',10,'N',19,'N',196,'N','Y','N','Document type or rules','Document Type','C_DocType_ID',100,TO_DATE('2012-03-12 20:01:44','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 20:01:44','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 8:01:45 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000107 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 8:02:30 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Element SET ColumnName='IsCalcFromPayment', Name='IsCalcFromPayment', PrintName='IsCalcFromPayment',Updated=TO_DATE('2012-03-12 20:02:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000030
;

-- Mar 12, 2012 8:02:30 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000030
;

-- Mar 12, 2012 8:02:30 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Column SET ColumnName='IsCalcFromPayment', Name='IsCalcFromPayment', Description=NULL, Help=NULL WHERE AD_Element_ID=3000030
;

-- Mar 12, 2012 8:02:30 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Process_Para SET ColumnName='IsCalcFromPayment', Name='IsCalcFromPayment', Description=NULL, Help=NULL, AD_Element_ID=3000030 WHERE UPPER(ColumnName)='ISCALCFROMPAYMENT' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Mar 12, 2012 8:02:30 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Process_Para SET ColumnName='IsCalcFromPayment', Name='IsCalcFromPayment', Description=NULL, Help=NULL WHERE AD_Element_ID=3000030 AND IsCentrallyMaintained='Y'
;

-- Mar 12, 2012 8:02:30 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET Name='IsCalcFromPayment', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000030) AND IsCentrallyMaintained='Y'
;

-- Mar 12, 2012 8:02:30 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_PrintFormatItem pi SET PrintName='IsCalcFromPayment', Name='IsCalcFromPayment' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000030)
;

-- Mar 12, 2012 8:03:05 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Element SET ColumnName='PaymentThresholdMin', Name='PaymentThresholdMin', PrintName='PaymentThresholdMin',Updated=TO_DATE('2012-03-12 20:03:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000029
;

-- Mar 12, 2012 8:03:05 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000029
;

-- Mar 12, 2012 8:03:05 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Column SET ColumnName='PaymentThresholdMin', Name='PaymentThresholdMin', Description=NULL, Help=NULL WHERE AD_Element_ID=3000029
;

-- Mar 12, 2012 8:03:05 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Process_Para SET ColumnName='PaymentThresholdMin', Name='PaymentThresholdMin', Description=NULL, Help=NULL, AD_Element_ID=3000029 WHERE UPPER(ColumnName)='PAYMENTTHRESHOLDMIN' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Mar 12, 2012 8:03:05 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Process_Para SET ColumnName='PaymentThresholdMin', Name='PaymentThresholdMin', Description=NULL, Help=NULL WHERE AD_Element_ID=3000029 AND IsCentrallyMaintained='Y'
;

-- Mar 12, 2012 8:03:05 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET Name='PaymentThresholdMin', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000029) AND IsCentrallyMaintained='Y'
;

-- Mar 12, 2012 8:03:05 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_PrintFormatItem pi SET PrintName='PaymentThresholdMin', Name='PaymentThresholdMin' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000029)
;

-- Mar 12, 2012 8:04:36 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000057,20,'Y','N','N',59039,'N','Y',330,'N','The ProcessedOn Date+Time save the exact moment (nanoseconds precision if allowed by the DB) when a document has been processed.','D','The date+time (expressed in decimal format) when the document has been processed','Processed On',100,0,'Y',TO_DATE('2012-03-12 20:04:35','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-03-12 20:04:35','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 8:04:36 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000057 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 8:04:37 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000058,22,'Y','N','N',55309,'N','Y',330,'N','D','ID of document reversal','Reversal ID',100,0,'Y',TO_DATE('2012-03-12 20:04:36','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-03-12 20:04:36','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 8:04:37 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000058 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 8:04:39 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000059,131089,'Y','N','N',3000103,'N','Y',330,'N','LAR','Withholding Amount',100,0,'Y',TO_DATE('2012-03-12 20:04:37','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-03-12 20:04:37','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 8:04:39 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000059 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 8:04:39 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000060,131089,'Y','N','N',3000104,'N','Y',330,'N','LAR','WithholdingPercent',100,0,'Y',TO_DATE('2012-03-12 20:04:39','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-03-12 20:04:39','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 8:04:39 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000060 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000057
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000058
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000059
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3000060
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=4056
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=4363
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=4054
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=4027
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=4032
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=4041
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=4036
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=4057
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=4035
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=4037
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=4033
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=4034
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=4023
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=4025
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=4019
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=4026
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=4024
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=6299
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=4021
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=4022
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=4020
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=4055
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=4043
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=4058
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=4042
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=4258
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=4039
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=4053
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=4052
;

-- Mar 12, 2012 8:06:34 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=4051
;

-- Mar 12, 2012 8:06:35 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=4047
;

-- Mar 12, 2012 8:06:35 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=4049
;

-- Mar 12, 2012 8:06:35 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=4048
;

-- Mar 12, 2012 8:06:35 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=4362
;

-- Mar 12, 2012 8:06:35 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=4361
;

-- Mar 12, 2012 8:06:35 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=6552
;

-- Mar 12, 2012 8:06:35 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=4044
;

-- Mar 12, 2012 8:06:35 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=4266
;

-- Mar 12, 2012 8:06:35 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=680,IsDisplayed='Y' WHERE AD_Field_ID=52052
;

-- Mar 12, 2012 8:07:02 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_DATE('2012-03-12 20:07:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000059
;

-- Mar 12, 2012 8:07:13 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET DisplayLength=20, IsSameLine='Y',Updated=TO_DATE('2012-03-12 20:07:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000060
;

-- Mar 12, 2012 8:09:19 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000061,10,'Y','N','N',3000107,'N','Y',1000009,'N','The Document Type determines document sequence and processing rules','LAR','Document type or rules','Document Type',100,0,'Y',TO_DATE('2012-03-12 20:09:19','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-03-12 20:09:19','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 8:09:19 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000061 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 8:09:20 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000062,1,'Y','N','N',3000106,'N','Y',1000009,'N','LAR','IsCalcFromPayment',100,0,'Y',TO_DATE('2012-03-12 20:09:19','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-03-12 20:09:19','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 8:09:20 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000062 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 8:09:20 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000063,131089,'Y','N','N',3000105,'N','Y',1000009,'N','LAR','PaymentThresholdMin',100,0,'Y',TO_DATE('2012-03-12 20:09:20','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-03-12 20:09:20','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 8:09:20 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000063 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 8:11:09 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3000062
;

-- Mar 12, 2012 8:11:09 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000063
;

-- Mar 12, 2012 8:11:09 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000061
;

-- Mar 12, 2012 8:11:48 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET DisplayLogic='@IsCalcFromPayment@=''Y''',Updated=TO_DATE('2012-03-12 20:11:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000063
;

-- Mar 12, 2012 8:11:59 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET IsSameLine='Y', DisplayLogic='@IsCalcFromPayment@=''Y''',Updated=TO_DATE('2012-03-12 20:11:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000061
;

-- Mar 12, 2012 8:12:59 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Table SET IsHighVolume='Y', IsDeleteable='N',Updated=TO_DATE('2012-03-12 20:12:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000005
;

-- Mar 12, 2012 8:23:46 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('SELECT TaxBaseAmt FROM LAR_PaymentWithholding lh WHERE LAR_WithholdingCertificate.C_Payment_ID = lh.C_Payment_ID',3000108,3000005,'U',0,'N','N','N',0,'N',14,'N',12,'N','N',2818,'N','Y','N','N','N','Calculation Base','Base','Base','N',100,TO_DATE('2012-03-12 20:23:44','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 20:23:44','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 8:23:46 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000108 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 8:27:46 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('SELECT l.City FROM C_BPartner_Location bp JOIN C_Payment py ON py.C_BPartner_ID = bp.C_BPartner_ID  JOIN C_Location l ON l.C_Location_ID = bp.C_Location_ID WHERE py.C_Payment_ID = LAR_WithholdingCertificate.C_Payment_ID',3000109,3000005,'U',0,'N','N','N',0,'The City identifies a unique City for this Country or Region.','N',60,'N',14,'N','N',225,'N','Y','N','N','N','Identifies a City','City','City','N',100,TO_DATE('2012-03-12 20:27:44','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 20:27:44','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 8:27:46 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000109 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 8:32:18 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('SELECT l.Address1 FROM C_BPartner_Location bp JOIN C_Payment py ON py.C_BPartner_ID = bp.C_BPartner_ID JOIN C_Location l ON l.C_Location_ID = bp.C_Location_ID WHERE py.C_Payment_ID = LAR_WithholdingCertificate.C_Payment_ID',3000110,3000005,'U',0,'N','N','N',0,'The Location / Address field defines the location of an entity.','N',60,'N',14,'N','N',202,'N','Y','N','N','N','Location or Address','Address','C_Location_ID','N',100,TO_DATE('2012-03-12 20:32:16','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 20:32:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 8:32:18 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000110 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 8:34:05 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('SELECT DateTrx FROM C_Payment py WHERE py.C_Payment_ID = LAR_WithholdingCertificate.C_Payment_ID',3000111,3000005,'U',0,'N','N','N',0,'The Document Date indicates the date the document was generated.  It may or may not be the same as the accounting date.','N',7,'N',15,'N','N',265,'N','Y','N','N','N','Date of the Document','Document Date','DateDoc','N',100,TO_DATE('2012-03-12 20:34:05','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 20:34:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 8:34:05 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000111 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 8:37:19 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('SELECT bp.DUNS FROM C_BPartner bp JOIN C_Payment py ON py.C_BPartner_ID = bp.C_BPartner_ID WHERE py.C_Payment_ID = LAR_WithholdingCertificate.C_Payment_ID',3000112,3000005,'U',0,'N','N','N',0,'Used for EDI - For details see   www.dnb.com/dunsno/list.htm','N',11,'N',14,'N','N',260,'N','Y','N','N','N','Dun & Bradstreet Number','D-U-N-S','DUNS','N',100,TO_DATE('2012-03-12 20:37:18','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 20:37:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 8:37:20 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000112 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 8:39:30 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('SELECT bp.Name FROM C_BPartner bp JOIN C_Payment py ON py.C_BPartner_ID = bp.C_BPartner_ID WHERE py.C_Payment_ID = LAR_WithholdingCertificate.C_Payment_ID',3000113,3000005,'U',0,'N','N','N',0,'The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.','N',60,'Y',14,'N','N',469,'N','Y','N','N','N','Alphanumeric identifier of the entity','Name','Name','N',100,TO_DATE('2012-03-12 20:39:28','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 20:39:28','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 8:39:30 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000113 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 8:42:55 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('SELECT (Percent*100) FROM LAR_PaymentWithholding lh WHERE LAR_WithholdingCertificate.C_Payment_ID = lh.C_Payment_ID',3000114,3000005,'U',0,'N','N','N',0,'The Percent indicates the percentage used.','N',14,'N',22,'N','N',951,'N','Y','N','N','N','Percentage','Percent','Percent','N',100,TO_DATE('2012-03-12 20:42:53','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 20:42:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 8:42:55 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000114 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 8:45:30 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('SELECT l.Postal FROM C_BPartner_Location bp JOIN C_Payment py ON py.C_BPartner_id = bp.C_BPartner_ID JOIN C_Location l ON l.C_Location_ID = bp.C_Location_ID WHERE py.C_Payment_ID = LAR_WithholdingCertificate.C_Payment_ID',3000115,3000005,'U',0,'N','N','N',0,'The Postal Code or ZIP identifies the postal code for this entity''s address.','N',12,'N',14,'N','N',512,'N','Y','N','N','N','Postal code','ZIP','Postal','N',100,TO_DATE('2012-03-12 20:45:28','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 20:45:28','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 8:45:30 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000115 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 8:53:49 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('SELECT r.Name from C_BPartner_Location bp JOIN C_Payment py on py.C_BPartner_ID = bp.C_BPartner_ID JOIN c_Location l on l.c_Location_ID = bp.c_Location_ID JOIN c_region r on l.c_region_ID = r.c_region_ID WHERE py.C_Payment_ID = LAR_WithholdingCertificate.C_Payment_ID',3000116,3000005,'U',0,'N','N','N',0,'The Region Name defines the name that will print when this region is used in a document.','N',60,'Y',14,'N','N',541,'N','Y','N','N','N','Name of the Region','Region','RegionName','N',100,TO_DATE('2012-03-12 20:53:48','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 20:53:48','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 8:53:49 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000116 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 8:54:56 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('SELECT TaxAmt from LAR_PaymentWithholding lh WHERE LAR_WithholdingCertificate.C_Payment_ID = lh.C_Payment_ID',3000117,3000005,'U',0,'N','N','N',0,'The Tax Amount displays the total tax amount for a document.','N',14,'N',12,'N','N',1133,'N','Y','N','N','N','Tax Amount for a document','Tax Amount','TaxAmt','N',100,TO_DATE('2012-03-12 20:54:55','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 20:54:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 8:54:56 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000117 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 8:56:59 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('SELECT bp.TaxID from C_BPartner bp JOIN C_Payment py on py.C_BPartner_ID = bp.C_BPartner_ID WHERE py.C_Payment_ID = LAR_WithholdingCertificate.C_Payment_ID',3000118,3000005,'U',0,'N','N','N',0,'The Tax ID field identifies the legal Identification number of this Entity.','N',13,'N',14,'N','N',590,'N','Y','N','N','N','Tax Identification','Tax ID','TaxID','N',100,TO_DATE('2012-03-12 20:56:57','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-12 20:56:57','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 8:56:59 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000118 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 8:58:39 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Window (AD_Window_ID,WindowType,IsSOTrx,IsDefault,IsBetaFunctionality,WinHeight,WinWidth,EntityType,Name,IsActive,Created,UpdatedBy,CreatedBy,Updated,AD_Org_ID,AD_Client_ID,Processing) VALUES (3000003,'M','N','N','N',0,0,'LAR','WithholdingCertificate','Y',TO_DATE('2012-03-12 20:58:38','YYYY-MM-DD HH24:MI:SS'),100,100,TO_DATE('2012-03-12 20:58:38','YYYY-MM-DD HH24:MI:SS'),0,0,'N')
;

-- Mar 12, 2012 8:58:39 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Window_Trl (AD_Language,AD_Window_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Window_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Window t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Window_ID=3000003 AND NOT EXISTS (SELECT * FROM AD_Window_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Window_ID=t.AD_Window_ID)
;

-- Mar 12, 2012 9:00:25 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('Y',3000003,10,'N','N',3000005,3000004,'N','N','N','Y',0,'N','N','LAR','Withholding Certificate',0,0,TO_DATE('2012-03-12 21:00:25','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2012-03-12 21:00:25','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- Mar 12, 2012 9:00:25 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000004 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- Mar 12, 2012 9:01:11 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000064,1,'Y','N','N',3000096,'N','Y',3000004,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,'Y',TO_DATE('2012-03-12 21:01:10','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-03-12 21:01:10','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 9:01:11 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000064 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 9:01:11 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000065,60,'Y','N','N',3000110,'N','Y',3000004,'N','The Location / Address field defines the location of an entity.','U','Location or Address','Address',100,0,'Y',TO_DATE('2012-03-12 21:01:11','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-03-12 21:01:11','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 9:01:11 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000065 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 9:01:11 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000066,14,'Y','N','N',3000108,'N','Y',3000004,'N','U','Calculation Base','Base',100,0,'Y',TO_DATE('2012-03-12 21:01:11','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-03-12 21:01:11','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 9:01:11 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000066 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 9:01:12 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000067,60,'Y','N','N',3000109,'N','Y',3000004,'N','The City identifies a unique City for this Country or Region.','U','Identifies a City','City',100,0,'Y',TO_DATE('2012-03-12 21:01:11','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-03-12 21:01:11','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 9:01:12 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000067 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 9:01:12 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000068,10,'Y','N','N',3000090,'N','Y',3000004,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,'Y',TO_DATE('2012-03-12 21:01:12','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-03-12 21:01:12','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 9:01:12 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000068 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 9:01:12 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000069,7,'Y','N','N',3000111,'N','Y',3000004,'N','The Document Date indicates the date the document was generated.  It may or may not be the same as the accounting date.','U','Date of the Document','Document Date',100,0,'Y',TO_DATE('2012-03-12 21:01:12','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-03-12 21:01:12','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 9:01:12 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000069 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 9:01:13 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000070,30,'Y','N','N',3000098,'N','Y',3000004,'N','The document number is usually automatically generated by the system and determined by the document type of the document. If the document is not saved, the preliminary number is displayed in "<>".

If the document type of your document has no automatic document sequence defined, the field is empty if you create a new document. This is for documents which usually have an external number (like vendor invoice).  If you leave the field empty, the system will generate a document number for you. The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).','LAR','Document sequence number of the document','Document No',100,0,'Y',TO_DATE('2012-03-12 21:01:12','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-03-12 21:01:12','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 9:01:13 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000070 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 9:01:13 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000071,10,'Y','N','N',3000101,'N','Y',3000004,'N','The Document Type determines document sequence and processing rules','LAR','Document type or rules','Document Type',100,0,'Y',TO_DATE('2012-03-12 21:01:13','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-03-12 21:01:13','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 9:01:13 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000071 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 9:01:14 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000072,11,'Y','N','N',3000112,'N','Y',3000004,'N','Used for EDI - For details see   www.dnb.com/dunsno/list.htm','U','Dun & Bradstreet Number','D-U-N-S',100,0,'Y',TO_DATE('2012-03-12 21:01:13','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-03-12 21:01:13','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 9:01:14 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000072 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 9:01:14 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000073,10,'Y','N','N',3000099,'N','Y',3000004,'N','The Invoice Document.','LAR','Invoice Identifier','Invoice',100,0,'Y',TO_DATE('2012-03-12 21:01:14','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-03-12 21:01:14','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 9:01:14 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000073 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 9:01:15 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000074,10,'N','N','N',3000097,'N','Y',3000004,'N','LAR','LAR_WithholdingCertificate',100,0,'Y',TO_DATE('2012-03-12 21:01:14','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-03-12 21:01:14','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 9:01:15 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000074 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 9:01:15 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000075,60,'Y','N','N',3000113,'N','Y',3000004,'N','The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.','U','Alphanumeric identifier of the entity','Name',100,0,'Y',TO_DATE('2012-03-12 21:01:15','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-03-12 21:01:15','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 9:01:15 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000075 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 9:01:15 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000076,10,'Y','N','N',3000091,'N','Y',3000004,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,'Y',TO_DATE('2012-03-12 21:01:15','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-03-12 21:01:15','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 9:01:15 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000076 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 9:01:16 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000077,10,'Y','N','N',3000100,'N','Y',3000004,'N','The Payment is a unique identifier of this payment.','LAR','Payment identifier','Payment',100,0,'Y',TO_DATE('2012-03-12 21:01:15','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-03-12 21:01:15','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 9:01:16 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000077 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 9:01:17 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000078,14,'Y','N','N',3000114,'N','Y',3000004,'N','The Percent indicates the percentage used.','U','Percentage','Percent',100,0,'Y',TO_DATE('2012-03-12 21:01:16','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-03-12 21:01:16','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 9:01:17 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000078 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 9:01:18 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000079,60,'Y','N','N',3000116,'N','Y',3000004,'N','The Region Name defines the name that will print when this region is used in a document.','U','Name of the Region','Region',100,0,'Y',TO_DATE('2012-03-12 21:01:17','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-03-12 21:01:17','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 9:01:18 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000079 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 9:01:20 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000080,10,'Y','N','N',3000102,'N','Y',3000004,'N','You can convert document types (e.g. from Offer to Order or Invoice).  The conversion is then reflected in the current type.  This processing is initiated by selecting the appropriate Document Action.','LAR','Target document type for conversing documents','Target Document Type',100,0,'Y',TO_DATE('2012-03-12 21:01:18','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-03-12 21:01:18','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 9:01:20 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000080 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 9:01:20 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000081,14,'Y','N','N',3000117,'N','Y',3000004,'N','The Tax Amount displays the total tax amount for a document.','U','Tax Amount for a document','Tax Amount',100,0,'Y',TO_DATE('2012-03-12 21:01:20','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-03-12 21:01:20','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 9:01:20 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000081 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 9:01:20 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000082,13,'Y','N','N',3000118,'N','Y',3000004,'N','The Tax ID field identifies the legal Identification number of this Entity.','U','Tax Identification','Tax ID',100,0,'Y',TO_DATE('2012-03-12 21:01:20','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-03-12 21:01:20','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 9:01:20 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000082 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 9:01:21 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000083,12,'Y','N','N',3000115,'N','Y',3000004,'N','The Postal Code or ZIP identifies the postal code for this entity''s address.','U','Postal code','ZIP',100,0,'Y',TO_DATE('2012-03-12 21:01:20','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-03-12 21:01:20','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 9:01:21 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000083 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 9:05:29 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3000068
;

-- Mar 12, 2012 9:05:29 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3000076
;

-- Mar 12, 2012 9:05:29 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3000064
;

-- Mar 12, 2012 9:05:29 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3000069
;

-- Mar 12, 2012 9:05:29 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3000070
;

-- Mar 12, 2012 9:05:29 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3000071
;

-- Mar 12, 2012 9:05:29 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3000080
;

-- Mar 12, 2012 9:05:29 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3000073
;

-- Mar 12, 2012 9:05:29 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3000077
;

-- Mar 12, 2012 9:05:29 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3000075
;

-- Mar 12, 2012 9:05:29 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3000082
;

-- Mar 12, 2012 9:05:29 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3000072
;

-- Mar 12, 2012 9:05:29 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3000065
;

-- Mar 12, 2012 9:05:29 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000067
;

-- Mar 12, 2012 9:05:29 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000083
;

-- Mar 12, 2012 9:05:29 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000066
;

-- Mar 12, 2012 9:05:29 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000079
;

-- Mar 12, 2012 9:05:30 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000078
;

-- Mar 12, 2012 9:05:30 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000081
;

-- Mar 12, 2012 9:16:23 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2012-03-12 21:16:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000076
;

-- Mar 12, 2012 9:16:40 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2012-03-12 21:16:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000070
;

-- Mar 12, 2012 9:16:51 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2012-03-12 21:16:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000080
;

-- Mar 12, 2012 9:17:31 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2012-03-12 21:17:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000077
;

-- Mar 12, 2012 9:17:54 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_DATE('2012-03-12 21:17:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000082
;

-- Mar 12, 2012 9:18:07 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET DisplayLength=20, IsSameLine='Y',Updated=TO_DATE('2012-03-12 21:18:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000072
;

-- Mar 12, 2012 9:18:30 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2012-03-12 21:18:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000083
;

-- Mar 12, 2012 9:19:11 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_DATE('2012-03-12 21:19:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000067
;

-- Mar 12, 2012 9:19:30 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000079
;

-- Mar 12, 2012 9:19:30 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000066
;

-- Mar 12, 2012 9:19:59 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2012-03-12 21:19:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000078
;

-- Mar 12, 2012 11:30:06 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormat (IsForm,AD_PrintFormat_ID,CreateCopy,IsStandardHeaderFooter,FooterMargin,AD_PrintColor_ID,AD_PrintPaper_ID,AD_PrintTableFormat_ID,IsTableBased,AD_Table_ID,HeaderMargin,AD_PrintFont_ID,IsDefault,Name,IsActive,AD_Org_ID,Updated,CreatedBy,Created,UpdatedBy,AD_Client_ID) VALUES ('Y',3000000,'N','Y',0,100,100,100,'Y',3000005,0,130,'N','LAR_WithholdingCertificate','Y',0,TO_DATE('2012-03-12 23:30:06','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2012-03-12 23:30:06','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Mar 12, 2012 11:56:38 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem (PrintAreaType,SortNo,XPosition,IsOrderBy,IsPrinted,IsHeightOneLine,AD_PrintFormat_ID,IsGroupBy,MaxHeight,PrintFormatType,ImageIsAttached,SeqNo,AD_Column_ID,LineAlignmentType,XSpace,FieldAlignmentType,IsRelativePosition,YPosition,IsSuppressNull,IsPageBreak,IsFixedWidth,IsNextLine,YSpace,IsSetNLPosition,AD_PrintFormatItem_ID,MaxWidth,IsNextPage,IsCentrallyMaintained,IsVarianceCalc,ArcDiameter,ShapeType,IsFilledRectangle,LineWidth,IsImageField,IsMinCalc,IsSummarized,IsMaxCalc,IsAveraged,IsCounted,IsDeviationCalc,IsRunningTotal,PrintName,Name,Updated,AD_Org_ID,AD_Client_ID,UpdatedBy,CreatedBy,Created,IsActive) VALUES ('C',0,0,'N','N','N',3000000,'N',0,'F','N',0,3000090,'X',0,'L','Y',0,'N','N','N','N',0,'N',3000000,0,'N','Y','N',0,'N','N',1,'N','N','N','N','N','N','N','N','Client','Client',TO_TIMESTAMP('2012-03-12 23:56:38','YYYY-MM-DD HH24:MI:SS'),0,0,100,100,TO_TIMESTAMP('2012-03-12 23:56:38','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- Mar 12, 2012 11:56:38 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem_Trl (AD_Language,AD_PrintFormatItem_ID, PrintName,PrintNameSuffix, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_PrintFormatItem_ID, t.PrintName,t.PrintNameSuffix, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_PrintFormatItem t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_PrintFormatItem_ID=3000000 AND NOT EXISTS (SELECT * FROM AD_PrintFormatItem_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_PrintFormatItem_ID=t.AD_PrintFormatItem_ID)
;

-- Mar 12, 2012 11:56:38 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_PrintFormatItem_Trl SET PrintName = (SELECT e.PrintName FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000090) WHERE AD_PrintFormatItem_ID = 3000000 AND EXISTS (SELECT * FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000090 AND AD_PrintFormatItem_Trl.AD_PrintFormatItem_ID = 3000000) AND EXISTS (SELECT * FROM AD_Client WHERE AD_Client_ID=AD_PrintFormatItem_Trl.AD_Client_ID AND IsMultiLingualDocument='Y')
;

-- Mar 12, 2012 11:56:38 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem (PrintAreaType,SortNo,XPosition,IsOrderBy,IsPrinted,IsHeightOneLine,AD_PrintFormat_ID,IsGroupBy,MaxHeight,PrintFormatType,ImageIsAttached,SeqNo,AD_Column_ID,LineAlignmentType,XSpace,FieldAlignmentType,IsRelativePosition,YPosition,IsSuppressNull,IsPageBreak,IsFixedWidth,IsNextLine,YSpace,IsSetNLPosition,AD_PrintFormatItem_ID,MaxWidth,IsNextPage,IsCentrallyMaintained,IsVarianceCalc,ArcDiameter,ShapeType,IsFilledRectangle,LineWidth,IsImageField,IsMinCalc,IsSummarized,IsMaxCalc,IsAveraged,IsCounted,IsDeviationCalc,IsRunningTotal,PrintName,Name,Updated,AD_Org_ID,AD_Client_ID,UpdatedBy,CreatedBy,Created,IsActive) VALUES ('C',0,0,'N','N','N',3000000,'N',0,'F','N',0,3000091,'X',0,'L','Y',0,'N','N','N','N',0,'N',3000001,0,'N','Y','N',0,'N','N',1,'N','N','N','N','N','N','N','N','Organization','Organization',TO_TIMESTAMP('2012-03-12 23:56:38','YYYY-MM-DD HH24:MI:SS'),0,0,100,100,TO_TIMESTAMP('2012-03-12 23:56:38','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- Mar 12, 2012 11:56:39 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem_Trl (AD_Language,AD_PrintFormatItem_ID, PrintName,PrintNameSuffix, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_PrintFormatItem_ID, t.PrintName,t.PrintNameSuffix, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_PrintFormatItem t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_PrintFormatItem_ID=3000001 AND NOT EXISTS (SELECT * FROM AD_PrintFormatItem_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_PrintFormatItem_ID=t.AD_PrintFormatItem_ID)
;

-- Mar 12, 2012 11:56:39 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_PrintFormatItem_Trl SET PrintName = (SELECT e.PrintName FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000091) WHERE AD_PrintFormatItem_ID = 3000001 AND EXISTS (SELECT * FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000091 AND AD_PrintFormatItem_Trl.AD_PrintFormatItem_ID = 3000001) AND EXISTS (SELECT * FROM AD_Client WHERE AD_Client_ID=AD_PrintFormatItem_Trl.AD_Client_ID AND IsMultiLingualDocument='Y')
;

-- Mar 12, 2012 11:56:39 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem (PrintAreaType,SortNo,XPosition,IsOrderBy,IsPrinted,IsHeightOneLine,AD_PrintFormat_ID,IsGroupBy,MaxHeight,PrintFormatType,ImageIsAttached,SeqNo,AD_Column_ID,LineAlignmentType,XSpace,FieldAlignmentType,IsRelativePosition,YPosition,IsSuppressNull,IsPageBreak,IsFixedWidth,IsNextLine,YSpace,IsSetNLPosition,AD_PrintFormatItem_ID,MaxWidth,IsNextPage,IsCentrallyMaintained,IsVarianceCalc,ArcDiameter,ShapeType,IsFilledRectangle,LineWidth,IsImageField,IsMinCalc,IsSummarized,IsMaxCalc,IsAveraged,IsCounted,IsDeviationCalc,IsRunningTotal,PrintName,Name,Updated,AD_Org_ID,AD_Client_ID,UpdatedBy,CreatedBy,Created,IsActive) VALUES ('C',0,0,'N','N','N',3000000,'N',0,'F','N',0,3000096,'X',0,'L','Y',0,'N','N','N','N',0,'N',3000002,0,'N','Y','N',0,'N','N',1,'N','N','N','N','N','N','N','N','Active','Active',TO_TIMESTAMP('2012-03-12 23:56:39','YYYY-MM-DD HH24:MI:SS'),0,0,100,100,TO_TIMESTAMP('2012-03-12 23:56:39','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- Mar 12, 2012 11:56:39 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem_Trl (AD_Language,AD_PrintFormatItem_ID, PrintName,PrintNameSuffix, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_PrintFormatItem_ID, t.PrintName,t.PrintNameSuffix, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_PrintFormatItem t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_PrintFormatItem_ID=3000002 AND NOT EXISTS (SELECT * FROM AD_PrintFormatItem_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_PrintFormatItem_ID=t.AD_PrintFormatItem_ID)
;

-- Mar 12, 2012 11:56:39 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_PrintFormatItem_Trl SET PrintName = (SELECT e.PrintName FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000096) WHERE AD_PrintFormatItem_ID = 3000002 AND EXISTS (SELECT * FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000096 AND AD_PrintFormatItem_Trl.AD_PrintFormatItem_ID = 3000002) AND EXISTS (SELECT * FROM AD_Client WHERE AD_Client_ID=AD_PrintFormatItem_Trl.AD_Client_ID AND IsMultiLingualDocument='Y')
;

-- Mar 12, 2012 11:56:39 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem (PrintAreaType,SortNo,XPosition,IsOrderBy,IsPrinted,IsHeightOneLine,AD_PrintFormat_ID,IsGroupBy,MaxHeight,PrintFormatType,ImageIsAttached,SeqNo,AD_Column_ID,LineAlignmentType,XSpace,FieldAlignmentType,IsRelativePosition,YPosition,IsSuppressNull,IsPageBreak,IsFixedWidth,IsNextLine,YSpace,IsSetNLPosition,AD_PrintFormatItem_ID,MaxWidth,IsNextPage,IsCentrallyMaintained,IsVarianceCalc,ArcDiameter,ShapeType,IsFilledRectangle,LineWidth,IsImageField,IsMinCalc,IsSummarized,IsMaxCalc,IsAveraged,IsCounted,IsDeviationCalc,IsRunningTotal,PrintName,Name,Updated,AD_Org_ID,AD_Client_ID,UpdatedBy,CreatedBy,Created,IsActive) VALUES ('C',0,0,'N','Y','N',3000000,'N',0,'F','N',4,3000111,'X',0,'L','Y',0,'N','N','N','N',0,'N',3000003,0,'N','Y','N',0,'N','N',1,'N','N','N','N','N','N','N','N','Doc date','Document Date',TO_TIMESTAMP('2012-03-12 23:56:39','YYYY-MM-DD HH24:MI:SS'),0,0,100,100,TO_TIMESTAMP('2012-03-12 23:56:39','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- Mar 12, 2012 11:56:39 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem_Trl (AD_Language,AD_PrintFormatItem_ID, PrintName,PrintNameSuffix, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_PrintFormatItem_ID, t.PrintName,t.PrintNameSuffix, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_PrintFormatItem t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_PrintFormatItem_ID=3000003 AND NOT EXISTS (SELECT * FROM AD_PrintFormatItem_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_PrintFormatItem_ID=t.AD_PrintFormatItem_ID)
;

-- Mar 12, 2012 11:56:39 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_PrintFormatItem_Trl SET PrintName = (SELECT e.PrintName FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000111) WHERE AD_PrintFormatItem_ID = 3000003 AND EXISTS (SELECT * FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000111 AND AD_PrintFormatItem_Trl.AD_PrintFormatItem_ID = 3000003) AND EXISTS (SELECT * FROM AD_Client WHERE AD_Client_ID=AD_PrintFormatItem_Trl.AD_Client_ID AND IsMultiLingualDocument='Y')
;

-- Mar 12, 2012 11:56:39 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem (PrintAreaType,SortNo,XPosition,IsOrderBy,IsPrinted,IsHeightOneLine,AD_PrintFormat_ID,IsGroupBy,MaxHeight,PrintFormatType,ImageIsAttached,SeqNo,AD_Column_ID,LineAlignmentType,XSpace,FieldAlignmentType,IsRelativePosition,YPosition,IsSuppressNull,IsPageBreak,IsFixedWidth,IsNextLine,YSpace,IsSetNLPosition,AD_PrintFormatItem_ID,MaxWidth,IsNextPage,IsCentrallyMaintained,IsVarianceCalc,ArcDiameter,ShapeType,IsFilledRectangle,LineWidth,IsImageField,IsMinCalc,IsSummarized,IsMaxCalc,IsAveraged,IsCounted,IsDeviationCalc,IsRunningTotal,PrintName,Name,Updated,AD_Org_ID,AD_Client_ID,UpdatedBy,CreatedBy,Created,IsActive) VALUES ('C',0,0,'N','Y','N',3000000,'N',0,'F','N',5,3000098,'X',0,'L','Y',0,'N','N','N','N',0,'N',3000004,0,'N','Y','N',0,'N','N',1,'N','N','N','N','N','N','N','N','Document No','Document No',TO_TIMESTAMP('2012-03-12 23:56:39','YYYY-MM-DD HH24:MI:SS'),0,0,100,100,TO_TIMESTAMP('2012-03-12 23:56:39','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- Mar 12, 2012 11:56:39 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem_Trl (AD_Language,AD_PrintFormatItem_ID, PrintName,PrintNameSuffix, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_PrintFormatItem_ID, t.PrintName,t.PrintNameSuffix, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_PrintFormatItem t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_PrintFormatItem_ID=3000004 AND NOT EXISTS (SELECT * FROM AD_PrintFormatItem_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_PrintFormatItem_ID=t.AD_PrintFormatItem_ID)
;

-- Mar 12, 2012 11:56:39 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_PrintFormatItem_Trl SET PrintName = (SELECT e.PrintName FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000098) WHERE AD_PrintFormatItem_ID = 3000004 AND EXISTS (SELECT * FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000098 AND AD_PrintFormatItem_Trl.AD_PrintFormatItem_ID = 3000004) AND EXISTS (SELECT * FROM AD_Client WHERE AD_Client_ID=AD_PrintFormatItem_Trl.AD_Client_ID AND IsMultiLingualDocument='Y')
;

-- Mar 12, 2012 11:56:39 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem (PrintAreaType,SortNo,XPosition,IsOrderBy,IsPrinted,IsHeightOneLine,AD_PrintFormat_ID,IsGroupBy,MaxHeight,PrintFormatType,ImageIsAttached,SeqNo,AD_Column_ID,LineAlignmentType,XSpace,FieldAlignmentType,IsRelativePosition,YPosition,IsSuppressNull,IsPageBreak,IsFixedWidth,IsNextLine,YSpace,IsSetNLPosition,AD_PrintFormatItem_ID,MaxWidth,IsNextPage,IsCentrallyMaintained,IsVarianceCalc,ArcDiameter,ShapeType,IsFilledRectangle,LineWidth,IsImageField,IsMinCalc,IsSummarized,IsMaxCalc,IsAveraged,IsCounted,IsDeviationCalc,IsRunningTotal,PrintName,Name,Updated,AD_Org_ID,AD_Client_ID,UpdatedBy,CreatedBy,Created,IsActive) VALUES ('C',0,0,'N','Y','N',3000000,'N',0,'F','N',6,3000101,'X',0,'L','Y',0,'N','N','N','N',0,'N',3000005,0,'N','Y','N',0,'N','N',1,'N','N','N','N','N','N','N','N','Doc Type','Document Type',TO_TIMESTAMP('2012-03-12 23:56:39','YYYY-MM-DD HH24:MI:SS'),0,0,100,100,TO_TIMESTAMP('2012-03-12 23:56:39','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- Mar 12, 2012 11:56:39 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem_Trl (AD_Language,AD_PrintFormatItem_ID, PrintName,PrintNameSuffix, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_PrintFormatItem_ID, t.PrintName,t.PrintNameSuffix, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_PrintFormatItem t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_PrintFormatItem_ID=3000005 AND NOT EXISTS (SELECT * FROM AD_PrintFormatItem_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_PrintFormatItem_ID=t.AD_PrintFormatItem_ID)
;

-- Mar 12, 2012 11:56:39 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_PrintFormatItem_Trl SET PrintName = (SELECT e.PrintName FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000101) WHERE AD_PrintFormatItem_ID = 3000005 AND EXISTS (SELECT * FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000101 AND AD_PrintFormatItem_Trl.AD_PrintFormatItem_ID = 3000005) AND EXISTS (SELECT * FROM AD_Client WHERE AD_Client_ID=AD_PrintFormatItem_Trl.AD_Client_ID AND IsMultiLingualDocument='Y')
;

-- Mar 12, 2012 11:56:39 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem (PrintAreaType,SortNo,XPosition,IsOrderBy,IsPrinted,IsHeightOneLine,AD_PrintFormat_ID,IsGroupBy,MaxHeight,PrintFormatType,ImageIsAttached,SeqNo,AD_Column_ID,LineAlignmentType,XSpace,FieldAlignmentType,IsRelativePosition,YPosition,IsSuppressNull,IsPageBreak,IsFixedWidth,IsNextLine,YSpace,IsSetNLPosition,AD_PrintFormatItem_ID,MaxWidth,IsNextPage,IsCentrallyMaintained,IsVarianceCalc,ArcDiameter,ShapeType,IsFilledRectangle,LineWidth,IsImageField,IsMinCalc,IsSummarized,IsMaxCalc,IsAveraged,IsCounted,IsDeviationCalc,IsRunningTotal,PrintName,Name,Updated,AD_Org_ID,AD_Client_ID,UpdatedBy,CreatedBy,Created,IsActive) VALUES ('C',0,0,'N','Y','N',3000000,'N',0,'F','N',7,3000102,'X',0,'L','Y',0,'N','N','N','N',0,'N',3000006,0,'N','Y','N',0,'N','N',1,'N','N','N','N','N','N','N','N','Target Doc Type','Target Document Type',TO_TIMESTAMP('2012-03-12 23:56:39','YYYY-MM-DD HH24:MI:SS'),0,0,100,100,TO_TIMESTAMP('2012-03-12 23:56:39','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- Mar 12, 2012 11:56:39 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem_Trl (AD_Language,AD_PrintFormatItem_ID, PrintName,PrintNameSuffix, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_PrintFormatItem_ID, t.PrintName,t.PrintNameSuffix, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_PrintFormatItem t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_PrintFormatItem_ID=3000006 AND NOT EXISTS (SELECT * FROM AD_PrintFormatItem_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_PrintFormatItem_ID=t.AD_PrintFormatItem_ID)
;

-- Mar 12, 2012 11:56:39 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_PrintFormatItem_Trl SET PrintName = (SELECT e.PrintName FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000102) WHERE AD_PrintFormatItem_ID = 3000006 AND EXISTS (SELECT * FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000102 AND AD_PrintFormatItem_Trl.AD_PrintFormatItem_ID = 3000006) AND EXISTS (SELECT * FROM AD_Client WHERE AD_Client_ID=AD_PrintFormatItem_Trl.AD_Client_ID AND IsMultiLingualDocument='Y')
;

-- Mar 12, 2012 11:56:39 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem (PrintAreaType,SortNo,XPosition,IsOrderBy,IsPrinted,IsHeightOneLine,AD_PrintFormat_ID,IsGroupBy,MaxHeight,PrintFormatType,ImageIsAttached,SeqNo,AD_Column_ID,LineAlignmentType,XSpace,FieldAlignmentType,IsRelativePosition,YPosition,IsSuppressNull,IsPageBreak,IsFixedWidth,IsNextLine,YSpace,IsSetNLPosition,AD_PrintFormatItem_ID,MaxWidth,IsNextPage,IsCentrallyMaintained,IsVarianceCalc,ArcDiameter,ShapeType,IsFilledRectangle,LineWidth,IsImageField,IsMinCalc,IsSummarized,IsMaxCalc,IsAveraged,IsCounted,IsDeviationCalc,IsRunningTotal,PrintName,Name,Updated,AD_Org_ID,AD_Client_ID,UpdatedBy,CreatedBy,Created,IsActive) VALUES ('C',0,0,'N','Y','N',3000000,'N',0,'F','N',8,3000099,'X',0,'L','Y',0,'N','N','N','N',0,'N',3000007,0,'N','Y','N',0,'N','N',1,'N','N','N','N','N','N','N','N','Invoice','Invoice',TO_TIMESTAMP('2012-03-12 23:56:39','YYYY-MM-DD HH24:MI:SS'),0,0,100,100,TO_TIMESTAMP('2012-03-12 23:56:39','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- Mar 12, 2012 11:56:39 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem_Trl (AD_Language,AD_PrintFormatItem_ID, PrintName,PrintNameSuffix, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_PrintFormatItem_ID, t.PrintName,t.PrintNameSuffix, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_PrintFormatItem t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_PrintFormatItem_ID=3000007 AND NOT EXISTS (SELECT * FROM AD_PrintFormatItem_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_PrintFormatItem_ID=t.AD_PrintFormatItem_ID)
;

-- Mar 12, 2012 11:56:39 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_PrintFormatItem_Trl SET PrintName = (SELECT e.PrintName FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000099) WHERE AD_PrintFormatItem_ID = 3000007 AND EXISTS (SELECT * FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000099 AND AD_PrintFormatItem_Trl.AD_PrintFormatItem_ID = 3000007) AND EXISTS (SELECT * FROM AD_Client WHERE AD_Client_ID=AD_PrintFormatItem_Trl.AD_Client_ID AND IsMultiLingualDocument='Y')
;

-- Mar 12, 2012 11:56:39 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem (PrintAreaType,SortNo,XPosition,IsOrderBy,IsPrinted,IsHeightOneLine,AD_PrintFormat_ID,IsGroupBy,MaxHeight,PrintFormatType,ImageIsAttached,SeqNo,AD_Column_ID,LineAlignmentType,XSpace,FieldAlignmentType,IsRelativePosition,YPosition,IsSuppressNull,IsPageBreak,IsFixedWidth,IsNextLine,YSpace,IsSetNLPosition,AD_PrintFormatItem_ID,MaxWidth,IsNextPage,IsCentrallyMaintained,IsVarianceCalc,ArcDiameter,ShapeType,IsFilledRectangle,LineWidth,IsImageField,IsMinCalc,IsSummarized,IsMaxCalc,IsAveraged,IsCounted,IsDeviationCalc,IsRunningTotal,PrintName,Name,Updated,AD_Org_ID,AD_Client_ID,UpdatedBy,CreatedBy,Created,IsActive) VALUES ('C',0,0,'N','Y','N',3000000,'N',0,'F','N',9,3000100,'X',0,'L','Y',0,'N','N','N','N',0,'N',3000008,0,'N','Y','N',0,'N','N',1,'N','N','N','N','N','N','N','N','Payment','Payment',TO_TIMESTAMP('2012-03-12 23:56:39','YYYY-MM-DD HH24:MI:SS'),0,0,100,100,TO_TIMESTAMP('2012-03-12 23:56:39','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- Mar 12, 2012 11:56:39 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem_Trl (AD_Language,AD_PrintFormatItem_ID, PrintName,PrintNameSuffix, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_PrintFormatItem_ID, t.PrintName,t.PrintNameSuffix, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_PrintFormatItem t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_PrintFormatItem_ID=3000008 AND NOT EXISTS (SELECT * FROM AD_PrintFormatItem_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_PrintFormatItem_ID=t.AD_PrintFormatItem_ID)
;

-- Mar 12, 2012 11:56:39 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_PrintFormatItem_Trl SET PrintName = (SELECT e.PrintName FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000100) WHERE AD_PrintFormatItem_ID = 3000008 AND EXISTS (SELECT * FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000100 AND AD_PrintFormatItem_Trl.AD_PrintFormatItem_ID = 3000008) AND EXISTS (SELECT * FROM AD_Client WHERE AD_Client_ID=AD_PrintFormatItem_Trl.AD_Client_ID AND IsMultiLingualDocument='Y')
;

-- Mar 12, 2012 11:56:39 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem (PrintAreaType,SortNo,XPosition,IsOrderBy,IsPrinted,IsHeightOneLine,AD_PrintFormat_ID,IsGroupBy,MaxHeight,PrintFormatType,ImageIsAttached,SeqNo,AD_Column_ID,LineAlignmentType,XSpace,FieldAlignmentType,IsRelativePosition,YPosition,IsSuppressNull,IsPageBreak,IsFixedWidth,IsNextLine,YSpace,IsSetNLPosition,AD_PrintFormatItem_ID,MaxWidth,IsNextPage,IsCentrallyMaintained,IsVarianceCalc,ArcDiameter,ShapeType,IsFilledRectangle,LineWidth,IsImageField,IsMinCalc,IsSummarized,IsMaxCalc,IsAveraged,IsCounted,IsDeviationCalc,IsRunningTotal,PrintName,Name,Updated,AD_Org_ID,AD_Client_ID,UpdatedBy,CreatedBy,Created,IsActive) VALUES ('C',0,0,'N','Y','N',3000000,'N',0,'F','N',10,3000113,'X',0,'B','Y',0,'N','N','N','N',0,'N',3000009,0,'N','Y','N',0,'N','N',1,'N','N','N','N','N','N','N','N','Name','Name',TO_TIMESTAMP('2012-03-12 23:56:39','YYYY-MM-DD HH24:MI:SS'),0,0,100,100,TO_TIMESTAMP('2012-03-12 23:56:39','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- Mar 12, 2012 11:56:39 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem_Trl (AD_Language,AD_PrintFormatItem_ID, PrintName,PrintNameSuffix, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_PrintFormatItem_ID, t.PrintName,t.PrintNameSuffix, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_PrintFormatItem t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_PrintFormatItem_ID=3000009 AND NOT EXISTS (SELECT * FROM AD_PrintFormatItem_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_PrintFormatItem_ID=t.AD_PrintFormatItem_ID)
;

-- Mar 12, 2012 11:56:39 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_PrintFormatItem_Trl SET PrintName = (SELECT e.PrintName FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000113) WHERE AD_PrintFormatItem_ID = 3000009 AND EXISTS (SELECT * FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000113 AND AD_PrintFormatItem_Trl.AD_PrintFormatItem_ID = 3000009) AND EXISTS (SELECT * FROM AD_Client WHERE AD_Client_ID=AD_PrintFormatItem_Trl.AD_Client_ID AND IsMultiLingualDocument='Y')
;

-- Mar 12, 2012 11:56:39 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem (PrintAreaType,SortNo,XPosition,IsOrderBy,IsPrinted,IsHeightOneLine,AD_PrintFormat_ID,IsGroupBy,MaxHeight,PrintFormatType,ImageIsAttached,SeqNo,AD_Column_ID,LineAlignmentType,XSpace,FieldAlignmentType,IsRelativePosition,YPosition,IsSuppressNull,IsPageBreak,IsFixedWidth,IsNextLine,YSpace,IsSetNLPosition,AD_PrintFormatItem_ID,MaxWidth,IsNextPage,IsCentrallyMaintained,IsVarianceCalc,ArcDiameter,ShapeType,IsFilledRectangle,LineWidth,IsImageField,IsMinCalc,IsSummarized,IsMaxCalc,IsAveraged,IsCounted,IsDeviationCalc,IsRunningTotal,PrintName,Name,Updated,AD_Org_ID,AD_Client_ID,UpdatedBy,CreatedBy,Created,IsActive) VALUES ('C',0,0,'N','Y','N',3000000,'N',0,'F','N',11,3000118,'X',0,'B','Y',0,'N','N','N','N',0,'N',3000010,0,'N','Y','N',0,'N','N',1,'N','N','N','N','N','N','N','N','Tax ID','Tax ID',TO_TIMESTAMP('2012-03-12 23:56:39','YYYY-MM-DD HH24:MI:SS'),0,0,100,100,TO_TIMESTAMP('2012-03-12 23:56:39','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- Mar 12, 2012 11:56:40 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem_Trl (AD_Language,AD_PrintFormatItem_ID, PrintName,PrintNameSuffix, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_PrintFormatItem_ID, t.PrintName,t.PrintNameSuffix, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_PrintFormatItem t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_PrintFormatItem_ID=3000010 AND NOT EXISTS (SELECT * FROM AD_PrintFormatItem_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_PrintFormatItem_ID=t.AD_PrintFormatItem_ID)
;

-- Mar 12, 2012 11:56:40 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_PrintFormatItem_Trl SET PrintName = (SELECT e.PrintName FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000118) WHERE AD_PrintFormatItem_ID = 3000010 AND EXISTS (SELECT * FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000118 AND AD_PrintFormatItem_Trl.AD_PrintFormatItem_ID = 3000010) AND EXISTS (SELECT * FROM AD_Client WHERE AD_Client_ID=AD_PrintFormatItem_Trl.AD_Client_ID AND IsMultiLingualDocument='Y')
;

-- Mar 12, 2012 11:56:40 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem (PrintAreaType,SortNo,XPosition,IsOrderBy,IsPrinted,IsHeightOneLine,AD_PrintFormat_ID,IsGroupBy,MaxHeight,PrintFormatType,ImageIsAttached,SeqNo,AD_Column_ID,LineAlignmentType,XSpace,FieldAlignmentType,IsRelativePosition,YPosition,IsSuppressNull,IsPageBreak,IsFixedWidth,IsNextLine,YSpace,IsSetNLPosition,AD_PrintFormatItem_ID,MaxWidth,IsNextPage,IsCentrallyMaintained,IsVarianceCalc,ArcDiameter,ShapeType,IsFilledRectangle,LineWidth,IsImageField,IsMinCalc,IsSummarized,IsMaxCalc,IsAveraged,IsCounted,IsDeviationCalc,IsRunningTotal,PrintName,Name,Updated,AD_Org_ID,AD_Client_ID,UpdatedBy,CreatedBy,Created,IsActive) VALUES ('C',0,0,'N','Y','N',3000000,'N',0,'F','N',12,3000112,'X',0,'B','Y',0,'N','N','N','N',0,'N',3000011,0,'N','Y','N',0,'N','N',1,'N','N','N','N','N','N','N','N','D-U-N-S','D-U-N-S',TO_TIMESTAMP('2012-03-12 23:56:40','YYYY-MM-DD HH24:MI:SS'),0,0,100,100,TO_TIMESTAMP('2012-03-12 23:56:40','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- Mar 12, 2012 11:56:40 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem_Trl (AD_Language,AD_PrintFormatItem_ID, PrintName,PrintNameSuffix, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_PrintFormatItem_ID, t.PrintName,t.PrintNameSuffix, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_PrintFormatItem t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_PrintFormatItem_ID=3000011 AND NOT EXISTS (SELECT * FROM AD_PrintFormatItem_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_PrintFormatItem_ID=t.AD_PrintFormatItem_ID)
;

-- Mar 12, 2012 11:56:40 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_PrintFormatItem_Trl SET PrintName = (SELECT e.PrintName FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000112) WHERE AD_PrintFormatItem_ID = 3000011 AND EXISTS (SELECT * FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000112 AND AD_PrintFormatItem_Trl.AD_PrintFormatItem_ID = 3000011) AND EXISTS (SELECT * FROM AD_Client WHERE AD_Client_ID=AD_PrintFormatItem_Trl.AD_Client_ID AND IsMultiLingualDocument='Y')
;

-- Mar 12, 2012 11:56:40 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem (PrintAreaType,SortNo,XPosition,IsOrderBy,IsPrinted,IsHeightOneLine,AD_PrintFormat_ID,IsGroupBy,MaxHeight,PrintFormatType,ImageIsAttached,SeqNo,AD_Column_ID,LineAlignmentType,XSpace,FieldAlignmentType,IsRelativePosition,YPosition,IsSuppressNull,IsPageBreak,IsFixedWidth,IsNextLine,YSpace,IsSetNLPosition,AD_PrintFormatItem_ID,MaxWidth,IsNextPage,IsCentrallyMaintained,IsVarianceCalc,ArcDiameter,ShapeType,IsFilledRectangle,LineWidth,IsImageField,IsMinCalc,IsSummarized,IsMaxCalc,IsAveraged,IsCounted,IsDeviationCalc,IsRunningTotal,PrintName,Name,Updated,AD_Org_ID,AD_Client_ID,UpdatedBy,CreatedBy,Created,IsActive) VALUES ('C',0,0,'N','Y','N',3000000,'N',0,'F','N',13,3000110,'X',0,'B','Y',0,'N','N','N','N',0,'N',3000012,0,'N','Y','N',0,'N','N',1,'N','N','N','N','N','N','N','N','Address','Address',TO_TIMESTAMP('2012-03-12 23:56:40','YYYY-MM-DD HH24:MI:SS'),0,0,100,100,TO_TIMESTAMP('2012-03-12 23:56:40','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- Mar 12, 2012 11:56:40 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem_Trl (AD_Language,AD_PrintFormatItem_ID, PrintName,PrintNameSuffix, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_PrintFormatItem_ID, t.PrintName,t.PrintNameSuffix, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_PrintFormatItem t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_PrintFormatItem_ID=3000012 AND NOT EXISTS (SELECT * FROM AD_PrintFormatItem_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_PrintFormatItem_ID=t.AD_PrintFormatItem_ID)
;

-- Mar 12, 2012 11:56:40 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_PrintFormatItem_Trl SET PrintName = (SELECT e.PrintName FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000110) WHERE AD_PrintFormatItem_ID = 3000012 AND EXISTS (SELECT * FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000110 AND AD_PrintFormatItem_Trl.AD_PrintFormatItem_ID = 3000012) AND EXISTS (SELECT * FROM AD_Client WHERE AD_Client_ID=AD_PrintFormatItem_Trl.AD_Client_ID AND IsMultiLingualDocument='Y')
;

-- Mar 12, 2012 11:56:40 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem (PrintAreaType,SortNo,XPosition,IsOrderBy,IsPrinted,IsHeightOneLine,AD_PrintFormat_ID,IsGroupBy,MaxHeight,PrintFormatType,ImageIsAttached,SeqNo,AD_Column_ID,LineAlignmentType,XSpace,FieldAlignmentType,IsRelativePosition,YPosition,IsSuppressNull,IsPageBreak,IsFixedWidth,IsNextLine,YSpace,IsSetNLPosition,AD_PrintFormatItem_ID,MaxWidth,IsNextPage,IsCentrallyMaintained,IsVarianceCalc,ArcDiameter,ShapeType,IsFilledRectangle,LineWidth,IsImageField,IsMinCalc,IsSummarized,IsMaxCalc,IsAveraged,IsCounted,IsDeviationCalc,IsRunningTotal,PrintName,Name,Updated,AD_Org_ID,AD_Client_ID,UpdatedBy,CreatedBy,Created,IsActive) VALUES ('C',0,0,'N','Y','N',3000000,'N',0,'F','N',14,3000109,'X',0,'B','Y',0,'N','N','N','N',0,'N',3000013,0,'N','Y','N',0,'N','N',1,'N','N','N','N','N','N','N','N','City','City',TO_TIMESTAMP('2012-03-12 23:56:40','YYYY-MM-DD HH24:MI:SS'),0,0,100,100,TO_TIMESTAMP('2012-03-12 23:56:40','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- Mar 12, 2012 11:56:40 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem_Trl (AD_Language,AD_PrintFormatItem_ID, PrintName,PrintNameSuffix, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_PrintFormatItem_ID, t.PrintName,t.PrintNameSuffix, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_PrintFormatItem t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_PrintFormatItem_ID=3000013 AND NOT EXISTS (SELECT * FROM AD_PrintFormatItem_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_PrintFormatItem_ID=t.AD_PrintFormatItem_ID)
;

-- Mar 12, 2012 11:56:40 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_PrintFormatItem_Trl SET PrintName = (SELECT e.PrintName FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000109) WHERE AD_PrintFormatItem_ID = 3000013 AND EXISTS (SELECT * FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000109 AND AD_PrintFormatItem_Trl.AD_PrintFormatItem_ID = 3000013) AND EXISTS (SELECT * FROM AD_Client WHERE AD_Client_ID=AD_PrintFormatItem_Trl.AD_Client_ID AND IsMultiLingualDocument='Y')
;

-- Mar 12, 2012 11:56:40 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem (PrintAreaType,SortNo,XPosition,IsOrderBy,IsPrinted,IsHeightOneLine,AD_PrintFormat_ID,IsGroupBy,MaxHeight,PrintFormatType,ImageIsAttached,SeqNo,AD_Column_ID,LineAlignmentType,XSpace,FieldAlignmentType,IsRelativePosition,YPosition,IsSuppressNull,IsPageBreak,IsFixedWidth,IsNextLine,YSpace,IsSetNLPosition,AD_PrintFormatItem_ID,MaxWidth,IsNextPage,IsCentrallyMaintained,IsVarianceCalc,ArcDiameter,ShapeType,IsFilledRectangle,LineWidth,IsImageField,IsMinCalc,IsSummarized,IsMaxCalc,IsAveraged,IsCounted,IsDeviationCalc,IsRunningTotal,PrintName,Name,Updated,AD_Org_ID,AD_Client_ID,UpdatedBy,CreatedBy,Created,IsActive) VALUES ('C',0,0,'N','Y','N',3000000,'N',0,'F','N',15,3000115,'X',0,'B','Y',0,'N','N','N','N',0,'N',3000014,0,'N','Y','N',0,'N','N',1,'N','N','N','N','N','N','N','N','ZIP','ZIP',TO_TIMESTAMP('2012-03-12 23:56:40','YYYY-MM-DD HH24:MI:SS'),0,0,100,100,TO_TIMESTAMP('2012-03-12 23:56:40','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- Mar 12, 2012 11:56:40 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem_Trl (AD_Language,AD_PrintFormatItem_ID, PrintName,PrintNameSuffix, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_PrintFormatItem_ID, t.PrintName,t.PrintNameSuffix, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_PrintFormatItem t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_PrintFormatItem_ID=3000014 AND NOT EXISTS (SELECT * FROM AD_PrintFormatItem_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_PrintFormatItem_ID=t.AD_PrintFormatItem_ID)
;

-- Mar 12, 2012 11:56:40 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_PrintFormatItem_Trl SET PrintName = (SELECT e.PrintName FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000115) WHERE AD_PrintFormatItem_ID = 3000014 AND EXISTS (SELECT * FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000115 AND AD_PrintFormatItem_Trl.AD_PrintFormatItem_ID = 3000014) AND EXISTS (SELECT * FROM AD_Client WHERE AD_Client_ID=AD_PrintFormatItem_Trl.AD_Client_ID AND IsMultiLingualDocument='Y')
;

-- Mar 12, 2012 11:56:40 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem (PrintAreaType,SortNo,XPosition,IsOrderBy,IsPrinted,IsHeightOneLine,AD_PrintFormat_ID,IsGroupBy,MaxHeight,PrintFormatType,ImageIsAttached,SeqNo,AD_Column_ID,LineAlignmentType,XSpace,FieldAlignmentType,IsRelativePosition,YPosition,IsSuppressNull,IsPageBreak,IsFixedWidth,IsNextLine,YSpace,IsSetNLPosition,AD_PrintFormatItem_ID,MaxWidth,IsNextPage,IsCentrallyMaintained,IsVarianceCalc,ArcDiameter,ShapeType,IsFilledRectangle,LineWidth,IsImageField,IsMinCalc,IsSummarized,IsMaxCalc,IsAveraged,IsCounted,IsDeviationCalc,IsRunningTotal,PrintName,Name,Updated,AD_Org_ID,AD_Client_ID,UpdatedBy,CreatedBy,Created,IsActive) VALUES ('C',0,0,'N','Y','N',3000000,'N',0,'F','N',16,3000116,'X',0,'B','Y',0,'N','N','N','N',0,'N',3000015,0,'N','Y','N',0,'N','N',1,'N','N','N','N','N','N','N','N','Region','Region',TO_TIMESTAMP('2012-03-12 23:56:40','YYYY-MM-DD HH24:MI:SS'),0,0,100,100,TO_TIMESTAMP('2012-03-12 23:56:40','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- Mar 12, 2012 11:56:40 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem_Trl (AD_Language,AD_PrintFormatItem_ID, PrintName,PrintNameSuffix, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_PrintFormatItem_ID, t.PrintName,t.PrintNameSuffix, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_PrintFormatItem t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_PrintFormatItem_ID=3000015 AND NOT EXISTS (SELECT * FROM AD_PrintFormatItem_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_PrintFormatItem_ID=t.AD_PrintFormatItem_ID)
;

-- Mar 12, 2012 11:56:40 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_PrintFormatItem_Trl SET PrintName = (SELECT e.PrintName FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000116) WHERE AD_PrintFormatItem_ID = 3000015 AND EXISTS (SELECT * FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000116 AND AD_PrintFormatItem_Trl.AD_PrintFormatItem_ID = 3000015) AND EXISTS (SELECT * FROM AD_Client WHERE AD_Client_ID=AD_PrintFormatItem_Trl.AD_Client_ID AND IsMultiLingualDocument='Y')
;

-- Mar 12, 2012 11:56:40 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem (PrintAreaType,SortNo,XPosition,IsOrderBy,IsPrinted,IsHeightOneLine,AD_PrintFormat_ID,IsGroupBy,MaxHeight,PrintFormatType,ImageIsAttached,SeqNo,AD_Column_ID,LineAlignmentType,XSpace,FieldAlignmentType,IsRelativePosition,YPosition,IsSuppressNull,IsPageBreak,IsFixedWidth,IsNextLine,YSpace,IsSetNLPosition,AD_PrintFormatItem_ID,MaxWidth,IsNextPage,IsCentrallyMaintained,IsVarianceCalc,ArcDiameter,ShapeType,IsFilledRectangle,LineWidth,IsImageField,IsMinCalc,IsSummarized,IsMaxCalc,IsAveraged,IsCounted,IsDeviationCalc,IsRunningTotal,PrintName,Name,Updated,AD_Org_ID,AD_Client_ID,UpdatedBy,CreatedBy,Created,IsActive) VALUES ('C',0,0,'N','Y','N',3000000,'N',0,'F','N',17,3000108,'X',0,'T','Y',0,'N','N','N','N',0,'N',3000016,0,'N','Y','N',0,'N','N',1,'N','N','N','N','N','N','N','N','Base','Base',TO_TIMESTAMP('2012-03-12 23:56:40','YYYY-MM-DD HH24:MI:SS'),0,0,100,100,TO_TIMESTAMP('2012-03-12 23:56:40','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- Mar 12, 2012 11:56:40 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem_Trl (AD_Language,AD_PrintFormatItem_ID, PrintName,PrintNameSuffix, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_PrintFormatItem_ID, t.PrintName,t.PrintNameSuffix, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_PrintFormatItem t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_PrintFormatItem_ID=3000016 AND NOT EXISTS (SELECT * FROM AD_PrintFormatItem_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_PrintFormatItem_ID=t.AD_PrintFormatItem_ID)
;

-- Mar 12, 2012 11:56:40 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_PrintFormatItem_Trl SET PrintName = (SELECT e.PrintName FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000108) WHERE AD_PrintFormatItem_ID = 3000016 AND EXISTS (SELECT * FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000108 AND AD_PrintFormatItem_Trl.AD_PrintFormatItem_ID = 3000016) AND EXISTS (SELECT * FROM AD_Client WHERE AD_Client_ID=AD_PrintFormatItem_Trl.AD_Client_ID AND IsMultiLingualDocument='Y')
;

-- Mar 12, 2012 11:56:40 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem (PrintAreaType,SortNo,XPosition,IsOrderBy,IsPrinted,IsHeightOneLine,AD_PrintFormat_ID,IsGroupBy,MaxHeight,PrintFormatType,ImageIsAttached,SeqNo,AD_Column_ID,LineAlignmentType,XSpace,FieldAlignmentType,IsRelativePosition,YPosition,IsSuppressNull,IsPageBreak,IsFixedWidth,IsNextLine,YSpace,IsSetNLPosition,AD_PrintFormatItem_ID,MaxWidth,IsNextPage,IsCentrallyMaintained,IsVarianceCalc,ArcDiameter,ShapeType,IsFilledRectangle,LineWidth,IsImageField,IsMinCalc,IsSummarized,IsMaxCalc,IsAveraged,IsCounted,IsDeviationCalc,IsRunningTotal,PrintName,Name,Updated,AD_Org_ID,AD_Client_ID,UpdatedBy,CreatedBy,Created,IsActive) VALUES ('C',0,0,'N','Y','N',3000000,'N',0,'F','N',18,3000114,'X',0,'T','Y',0,'N','N','N','N',0,'N',3000017,0,'N','Y','N',0,'N','N',1,'N','N','N','N','N','N','N','N','Percent','Percent',TO_TIMESTAMP('2012-03-12 23:56:40','YYYY-MM-DD HH24:MI:SS'),0,0,100,100,TO_TIMESTAMP('2012-03-12 23:56:40','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- Mar 12, 2012 11:56:40 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem_Trl (AD_Language,AD_PrintFormatItem_ID, PrintName,PrintNameSuffix, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_PrintFormatItem_ID, t.PrintName,t.PrintNameSuffix, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_PrintFormatItem t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_PrintFormatItem_ID=3000017 AND NOT EXISTS (SELECT * FROM AD_PrintFormatItem_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_PrintFormatItem_ID=t.AD_PrintFormatItem_ID)
;

-- Mar 12, 2012 11:56:40 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_PrintFormatItem_Trl SET PrintName = (SELECT e.PrintName FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000114) WHERE AD_PrintFormatItem_ID = 3000017 AND EXISTS (SELECT * FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000114 AND AD_PrintFormatItem_Trl.AD_PrintFormatItem_ID = 3000017) AND EXISTS (SELECT * FROM AD_Client WHERE AD_Client_ID=AD_PrintFormatItem_Trl.AD_Client_ID AND IsMultiLingualDocument='Y')
;

-- Mar 12, 2012 11:56:41 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem (PrintAreaType,SortNo,XPosition,IsOrderBy,IsPrinted,IsHeightOneLine,AD_PrintFormat_ID,IsGroupBy,MaxHeight,PrintFormatType,ImageIsAttached,SeqNo,AD_Column_ID,LineAlignmentType,XSpace,FieldAlignmentType,IsRelativePosition,YPosition,IsSuppressNull,IsPageBreak,IsFixedWidth,IsNextLine,YSpace,IsSetNLPosition,AD_PrintFormatItem_ID,MaxWidth,IsNextPage,IsCentrallyMaintained,IsVarianceCalc,ArcDiameter,ShapeType,IsFilledRectangle,LineWidth,IsImageField,IsMinCalc,IsSummarized,IsMaxCalc,IsAveraged,IsCounted,IsDeviationCalc,IsRunningTotal,PrintName,Name,Updated,AD_Org_ID,AD_Client_ID,UpdatedBy,CreatedBy,Created,IsActive) VALUES ('C',0,0,'N','Y','N',3000000,'N',0,'F','N',19,3000117,'X',0,'T','Y',0,'N','N','N','N',0,'N',3000018,0,'N','Y','N',0,'N','N',1,'N','N','N','N','N','N','N','N','Tax','Tax Amount',TO_TIMESTAMP('2012-03-12 23:56:40','YYYY-MM-DD HH24:MI:SS'),0,0,100,100,TO_TIMESTAMP('2012-03-12 23:56:40','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- Mar 12, 2012 11:56:41 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem_Trl (AD_Language,AD_PrintFormatItem_ID, PrintName,PrintNameSuffix, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_PrintFormatItem_ID, t.PrintName,t.PrintNameSuffix, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_PrintFormatItem t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_PrintFormatItem_ID=3000018 AND NOT EXISTS (SELECT * FROM AD_PrintFormatItem_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_PrintFormatItem_ID=t.AD_PrintFormatItem_ID)
;

-- Mar 12, 2012 11:56:41 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_PrintFormatItem_Trl SET PrintName = (SELECT e.PrintName FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000117) WHERE AD_PrintFormatItem_ID = 3000018 AND EXISTS (SELECT * FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000117 AND AD_PrintFormatItem_Trl.AD_PrintFormatItem_ID = 3000018) AND EXISTS (SELECT * FROM AD_Client WHERE AD_Client_ID=AD_PrintFormatItem_Trl.AD_Client_ID AND IsMultiLingualDocument='Y')
;

-- Mar 12, 2012 11:56:41 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem (PrintAreaType,SortNo,XPosition,IsOrderBy,IsPrinted,IsHeightOneLine,AD_PrintFormat_ID,IsGroupBy,MaxHeight,PrintFormatType,ImageIsAttached,SeqNo,AD_Column_ID,LineAlignmentType,XSpace,FieldAlignmentType,IsRelativePosition,YPosition,IsSuppressNull,IsPageBreak,IsFixedWidth,IsNextLine,YSpace,IsSetNLPosition,AD_PrintFormatItem_ID,MaxWidth,IsNextPage,IsCentrallyMaintained,IsVarianceCalc,ArcDiameter,ShapeType,IsFilledRectangle,LineWidth,IsImageField,IsMinCalc,IsSummarized,IsMaxCalc,IsAveraged,IsCounted,IsDeviationCalc,IsRunningTotal,PrintName,Name,Updated,AD_Org_ID,AD_Client_ID,UpdatedBy,CreatedBy,Created,IsActive) VALUES ('C',0,0,'N','N','N',3000000,'N',0,'F','N',0,3000097,'X',0,'L','Y',0,'N','N','N','N',0,'N',3000019,0,'N','Y','N',0,'N','N',1,'N','N','N','N','N','N','N','N','LAR_WithholdingCertificate','LAR_WithholdingCertificate',TO_TIMESTAMP('2012-03-12 23:56:41','YYYY-MM-DD HH24:MI:SS'),0,0,100,100,TO_TIMESTAMP('2012-03-12 23:56:41','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- Mar 12, 2012 11:56:41 PM GMT-03:00
-- Improve Withholding Behavior.
INSERT INTO AD_PrintFormatItem_Trl (AD_Language,AD_PrintFormatItem_ID, PrintName,PrintNameSuffix, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_PrintFormatItem_ID, t.PrintName,t.PrintNameSuffix, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_PrintFormatItem t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_PrintFormatItem_ID=3000019 AND NOT EXISTS (SELECT * FROM AD_PrintFormatItem_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_PrintFormatItem_ID=t.AD_PrintFormatItem_ID)
;

-- Mar 12, 2012 11:56:41 PM GMT-03:00
-- Improve Withholding Behavior.
UPDATE AD_PrintFormatItem_Trl SET PrintName = (SELECT e.PrintName FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000097) WHERE AD_PrintFormatItem_ID = 3000019 AND EXISTS (SELECT * FROM AD_Element_Trl e, AD_Column c WHERE e.AD_Language=AD_PrintFormatItem_Trl.AD_Language AND e.AD_Element_ID=c.AD_Element_ID AND c.AD_Column_ID=3000097 AND AD_PrintFormatItem_Trl.AD_PrintFormatItem_ID = 3000019) AND EXISTS (SELECT * FROM AD_Client WHERE AD_Client_ID=AD_PrintFormatItem_Trl.AD_Client_ID AND IsMultiLingualDocument='Y')
;

-- Mar 13, 2012 10:31:38 AM ART
-- Improve Withholding Behavior.
INSERT INTO AD_Process (AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,AD_PrintFormat_ID,CopyFromProcess,Value,Name,AD_Org_ID,AD_Client_ID,CreatedBy,Updated,UpdatedBy,Created,IsActive) VALUES (3000000,'N','Y','3','N','N','Y','LAR',0,0,3000000,'N','10000000','LAR_WithholdingCertificate',0,0,100,TO_DATE('2012-03-13 10:31:37','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2012-03-13 10:31:37','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- Mar 13, 2012 10:31:38 AM ART
-- Improve Withholding Behavior.
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000000 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- Mar 13, 2012 10:37:01 AM ART
-- Improve Withholding Behavior.
UPDATE AD_Process SET Value='LAR_WithholdingCertificate',Updated=TO_DATE('2012-03-13 10:37:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000000
;

-- Mar 13, 2012 10:38:06 AM ART
-- Improve Withholding Behavior.
UPDATE AD_Tab SET AD_Process_ID=3000000,Updated=TO_DATE('2012-03-13 10:38:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000004
;

-- Mar 13, 2012 10:39:41 AM ART
-- Improve Withholding Behavior.
INSERT INTO AD_Menu (AD_Window_ID,AD_Menu_ID,IsSummary,Action,IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000003,3000006,'N','W','N','N','LAR','Y','Withholding Certificate',TO_DATE('2012-03-13 10:39:40','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_DATE('2012-03-13 10:39:40','YYYY-MM-DD HH24:MI:SS'),0)
;

-- Mar 13, 2012 10:39:41 AM ART
-- Improve Withholding Behavior.
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000006 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- Mar 13, 2012 10:39:41 AM ART
-- Improve Withholding Behavior.
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', SysDate, 100, SysDate, 100,t.AD_Tree_ID, 3000006, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000006)
;

-- Mar 13, 2012 10:39:49 AM ART
-- Improve Withholding Behavior.
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=0, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000005
;

-- Mar 13, 2012 10:39:49 AM ART
-- Improve Withholding Behavior.
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=1, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000006
;

-- Mar 13, 2012 10:39:49 AM ART
-- Improve Withholding Behavior.
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=2, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=1000005
;

-- Mar 13, 2012 10:39:49 AM ART
-- Improve Withholding Behavior.
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=3, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=1000002
;

-- Mar 13, 2012 10:39:49 AM ART
-- Improve Withholding Behavior.
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=4, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=1000001
;

-- Mar 13, 2012 10:39:49 AM ART
-- Improve Withholding Behavior.
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=5, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=1000003
;

-- Mar 13, 2012 10:39:49 AM ART
-- Improve Withholding Behavior.
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=6, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=1000004
;

-- Mar 15, 2012 11:14:45 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=1000004
;

-- Mar 15, 2012 11:14:45 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=2160
;

-- Mar 15, 2012 11:14:45 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=2155
;

-- Mar 15, 2012 11:14:45 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=1000005
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=1000010
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=2156
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=9627
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3261
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=1000006
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=1000007
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=1000008
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=1000009
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=2145
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3228
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=2133
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=2136
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=2141
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=8238
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=10592
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=57981
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=1000011
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=2132
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=2149
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=2144
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=2162
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3955
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=2124
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=2164
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=2139
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=9620
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=2148
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=2128
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=2127
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=2146
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=2154
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=2153
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=54555
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=2135
;

-- Mar 15, 2012 11:14:46 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=57533
;

-- Mar 15, 2012 11:15:14 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2012-03-15 23:15:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=1000010
;

-- Mar 15, 2012 11:18:52 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=1000005
;

-- Mar 15, 2012 11:18:52 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=1000010
;

-- Mar 15, 2012 11:18:52 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=2156
;

-- Mar 15, 2012 11:18:52 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=9627
;

-- Mar 15, 2012 11:18:52 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3261
;

-- Mar 15, 2012 11:18:52 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=1000006
;

-- Mar 15, 2012 11:18:52 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=1000007
;

-- Mar 15, 2012 11:18:52 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=1000008
;

-- Mar 15, 2012 11:18:52 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=1000009
;

-- Mar 15, 2012 11:18:52 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=2145
;

-- Mar 15, 2012 11:18:52 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3228
;

-- Mar 15, 2012 11:18:53 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=2133
;

-- Mar 15, 2012 11:18:53 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=2136
;

-- Mar 15, 2012 11:18:53 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=2141
;

-- Mar 15, 2012 11:18:53 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=8238
;

-- Mar 15, 2012 11:18:53 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=10592
;

-- Mar 15, 2012 11:18:53 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=57981
;

-- Mar 15, 2012 11:18:53 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=1000011
;

-- Mar 15, 2012 11:18:53 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=2132
;

-- Mar 15, 2012 11:18:53 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=2149
;

-- Mar 15, 2012 11:18:53 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=2144
;

-- Mar 15, 2012 11:18:53 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=2162
;

-- Mar 15, 2012 11:18:53 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3955
;

-- Mar 15, 2012 11:18:53 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=2124
;

-- Mar 15, 2012 11:18:53 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=2164
;

-- Mar 15, 2012 11:18:53 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=2139
;

-- Mar 15, 2012 11:18:53 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=9620
;

-- Mar 15, 2012 11:18:53 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=2148
;

-- Mar 15, 2012 11:18:53 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=2128
;

-- Mar 15, 2012 11:18:53 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=2127
;

-- Mar 15, 2012 11:18:53 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=2146
;

-- Mar 15, 2012 11:18:53 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=2154
;

-- Mar 15, 2012 11:18:53 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=2153
;

-- Mar 15, 2012 11:18:53 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=54555
;

-- Mar 15, 2012 11:18:53 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=2135
;

-- Mar 15, 2012 11:18:53 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=57533
;

-- Mar 15, 2012 11:19:57 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2012-03-15 23:19:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=1000011
;

-- Mar 15, 2012 11:20:02 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2012-03-15 23:20:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2132
;

-- Mar 15, 2012 11:20:08 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2012-03-15 23:20:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2149
;

-- Mar 15, 2012 11:20:38 PM GMT-03:00
-- Improve Withholding Behavior
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2012-03-15 23:20:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2135
;
