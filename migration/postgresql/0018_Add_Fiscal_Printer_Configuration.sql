-- 11/03/2012 0:06:10 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,IsHighVolume,ImportTable,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','3',0,3000000,'N','N','N','N','N','LAR','Y','Y','L','LAR_Fiscal_Printer_Type','LAR_Fiscal_Printer_Type',0,'Y',0,100,TO_TIMESTAMP('2012-03-11 00:06:09','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-11 00:06:09','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/03/2012 0:06:10 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000000 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- 11/03/2012 0:06:11 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,AD_Client_ID,Updated,UpdatedBy,Created,CreatedBy,IsActive) VALUES (1,'N',50000,'Y',1000000,1000000,'N','Y',3000000,'Table LAR_Fiscal_Printer_Type','LAR_Fiscal_Printer_Type',0,0,TO_TIMESTAMP('2012-03-11 00:06:10','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-11 00:06:10','YYYY-MM-DD HH24:MI:SS'),100,'Y')
;

-- 11/03/2012 0:08:47 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000000,'LAR_Fiscal_Printer_Type_ID','LAR','LAR_Fiscal_Printer_Type','LAR_Fiscal_Printer_Type',0,TO_TIMESTAMP('2012-03-11 00:08:46','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-03-11 00:08:46','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 11/03/2012 0:08:47 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000000 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 11/03/2012 0:08:47 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000000,3000000,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3000000,'N','N','N','LAR_Fiscal_Printer_Type','LAR_Fiscal_Printer_Type_ID',100,TO_TIMESTAMP('2012-03-11 00:08:46','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:08:46','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:08:47 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000000 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:08:48 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000001,3000000,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,TO_TIMESTAMP('2012-03-11 00:08:47','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:08:47','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:08:48 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000001 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:08:48 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000002,3000000,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',100,TO_TIMESTAMP('2012-03-11 00:08:48','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:08:48','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:08:48 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000002 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:08:48 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000003,3000000,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,TO_TIMESTAMP('2012-03-11 00:08:48','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:08:48','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:08:48 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000003 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:08:50 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000004,3000000,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,TO_TIMESTAMP('2012-03-11 00:08:48','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:08:48','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:08:50 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000004 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:08:50 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000005,3000000,'LAR',0,110,'Y','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,TO_TIMESTAMP('2012-03-11 00:08:50','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:08:50','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:08:50 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000005 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:08:50 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000006,3000000,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,TO_TIMESTAMP('2012-03-11 00:08:50','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:08:50','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:08:50 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000006 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:08:50 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000007,3000000,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,TO_TIMESTAMP('2012-03-11 00:08:50','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:08:50','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:08:50 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000007 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:08:51 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000008,3000000,'LAR',0,'Y','N','Y',1,'The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.','N',100,'Y',10,'N',469,'N','Y','N','Alphanumeric identifier of the entity','Name','Name',100,TO_TIMESTAMP('2012-03-11 00:08:50','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:08:50','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:08:51 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000008 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:08:51 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000009,3000000,'LAR',0,'N','N','N','A description is limited to 255 characters.','N',200,'Y',10,'N',275,'N','Y','N','Optional short description of the record','Description','Description',100,TO_TIMESTAMP('2012-03-11 00:08:51','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:08:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:08:51 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000009 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:08:51 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000001,'parameters','LAR','parameters','parameters',0,TO_TIMESTAMP('2012-03-11 00:08:51','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-03-11 00:08:51','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 11/03/2012 0:08:51 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000001 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 11/03/2012 0:08:51 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000010,3000000,'LAR',0,'N','N','N','N',500,'N',14,'N',3000001,'N','Y','N','parameters','parameters',100,TO_TIMESTAMP('2012-03-11 00:08:51','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:08:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:08:51 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000010 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:08:52 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000002,'clazz','LAR','clazz','clazz',0,TO_TIMESTAMP('2012-03-11 00:08:51','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-03-11 00:08:51','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 11/03/2012 0:08:52 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000002 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 11/03/2012 0:08:52 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000011,3000000,'LAR',0,'Y','N','N','N',100,'N',10,'N',3000002,'N','Y','N','clazz','clazz',100,TO_TIMESTAMP('2012-03-11 00:08:51','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:08:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:08:52 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000011 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:09:53 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element SET ColumnName='Clazz', Name='Clazz', PrintName='Clazz',Updated=TO_TIMESTAMP('2012-03-11 00:09:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000002
;

-- 11/03/2012 0:09:53 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000002
;

-- 11/03/2012 0:09:53 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Column SET ColumnName='Clazz', Name='Clazz', Description=NULL, Help=NULL WHERE AD_Element_ID=3000002
;

-- 11/03/2012 0:09:53 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='Clazz', Name='Clazz', Description=NULL, Help=NULL, AD_Element_ID=3000002 WHERE UPPER(ColumnName)='CLAZZ' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 11/03/2012 0:09:53 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='Clazz', Name='Clazz', Description=NULL, Help=NULL WHERE AD_Element_ID=3000002 AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:09:53 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET Name='Clazz', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000002) AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:09:53 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_PrintFormatItem SET PrintName='Clazz', Name='Clazz' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000002)
;

-- 11/03/2012 0:11:20 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element SET ColumnName='Parameters', Name='Parameters', PrintName='Parameters',Updated=TO_TIMESTAMP('2012-03-11 00:11:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000001
;

-- 11/03/2012 0:11:20 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000001
;

-- 11/03/2012 0:11:20 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Column SET ColumnName='Parameters', Name='Parameters', Description=NULL, Help=NULL WHERE AD_Element_ID=3000001
;

-- 11/03/2012 0:11:20 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='Parameters', Name='Parameters', Description=NULL, Help=NULL, AD_Element_ID=3000001 WHERE UPPER(ColumnName)='PARAMETERS' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 11/03/2012 0:11:20 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='Parameters', Name='Parameters', Description=NULL, Help=NULL WHERE AD_Element_ID=3000001 AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:11:20 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET Name='Parameters', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000001) AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:11:20 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_PrintFormatItem SET PrintName='Parameters', Name='Parameters' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000001)
;

-- 11/03/2012 0:13:01 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,IsHighVolume,ImportTable,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','3',0,3000001,'N','N','N','N','N','LAR','Y','Y','L','LAR_Fiscal_Printer','LAR_Fiscal_Printer',0,'Y',0,100,TO_TIMESTAMP('2012-03-11 00:13:01','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-11 00:13:01','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/03/2012 0:13:01 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000001 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- 11/03/2012 0:13:01 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,AD_Client_ID,Updated,UpdatedBy,Created,CreatedBy,IsActive) VALUES (1,'N',50000,'Y',1000000,1000000,'N','Y',3000001,'Table LAR_Fiscal_Printer','LAR_Fiscal_Printer',0,0,TO_TIMESTAMP('2012-03-11 00:13:01','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-11 00:13:01','YYYY-MM-DD HH24:MI:SS'),100,'Y')
;

-- 11/03/2012 0:13:40 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000003,'LAR_Fiscal_Printer_ID','LAR','LAR_Fiscal_Printer','LAR_Fiscal_Printer',0,TO_TIMESTAMP('2012-03-11 00:13:40','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-03-11 00:13:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 11/03/2012 0:13:40 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000003 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 11/03/2012 0:13:41 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000012,3000001,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3000003,'N','N','N','LAR_Fiscal_Printer','LAR_Fiscal_Printer_ID',100,TO_TIMESTAMP('2012-03-11 00:13:40','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:13:40','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:13:41 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000012 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:13:41 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000013,3000001,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,TO_TIMESTAMP('2012-03-11 00:13:41','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:13:41','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:13:41 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000013 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:13:41 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000014,3000001,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',100,TO_TIMESTAMP('2012-03-11 00:13:41','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:13:41','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:13:41 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000014 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:13:41 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000015,3000001,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,TO_TIMESTAMP('2012-03-11 00:13:41','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:13:41','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:13:41 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000015 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:13:41 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000016,3000001,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,TO_TIMESTAMP('2012-03-11 00:13:41','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:13:41','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:13:41 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000016 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:13:42 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000017,3000001,'LAR',0,110,'Y','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,TO_TIMESTAMP('2012-03-11 00:13:41','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:13:41','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:13:42 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000017 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:13:42 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000018,3000001,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,TO_TIMESTAMP('2012-03-11 00:13:42','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:13:42','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:13:42 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000018 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:13:42 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000019,3000001,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,TO_TIMESTAMP('2012-03-11 00:13:42','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:13:42','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:13:42 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000019 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:13:42 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000020,3000001,'LAR',0,'Y','N','N','N',10,'N',19,'N',3000000,'N','Y','N','LAR_Fiscal_Printer_Type','LAR_Fiscal_Printer_Type_ID',100,TO_TIMESTAMP('2012-03-11 00:13:42','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:13:42','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:13:42 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000020 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:13:43 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000021,3000001,'LAR',0,'N','N','Y',1,'The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.','N',100,'Y',10,'N',469,'N','Y','N','Alphanumeric identifier of the entity','Name','Name',100,TO_TIMESTAMP('2012-03-11 00:13:42','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:13:42','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:13:43 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000021 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:13:43 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000022,3000001,'LAR',0,'N','N','N','A description is limited to 255 characters.','N',200,'Y',10,'N',275,'N','Y','N','Optional short description of the record','Description','Description',100,TO_TIMESTAMP('2012-03-11 00:13:43','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:13:43','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:13:43 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000022 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:13:43 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000023,3000001,'LAR',0,'Y','N','N','N',100,'N',10,'N',53374,'N','Y','N','Host','Host',100,TO_TIMESTAMP('2012-03-11 00:13:43','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:13:43','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:13:43 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000023 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:13:43 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000024,3000001,'LAR',0,'Y','N','N','N',10,'N',11,'N',53375,'N','Y','N','Port','Port',100,TO_TIMESTAMP('2012-03-11 00:13:43','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:13:43','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:13:43 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000024 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:13:44 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000025,3000001,'LAR',0,'N','N','N','Status of the currently running check','N',3,'N',10,'N',3020,'N','Y','N','Status of the currently running check','Status','Status',100,TO_TIMESTAMP('2012-03-11 00:13:43','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:13:43','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:13:44 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000025 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:13:45 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000005,'operation_date','LAR','operation_date','operation_date',0,TO_TIMESTAMP('2012-03-11 00:13:45','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-03-11 00:13:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 11/03/2012 0:13:45 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000005 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 11/03/2012 0:13:45 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000027,3000001,'LAR',0,'N','N','N','N',29,'N',16,'N',3000005,'N','Y','N','operation_date','operation_date',100,TO_TIMESTAMP('2012-03-11 00:13:45','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:13:45','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:13:45 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000027 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:13:45 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000006,'isremote','LAR','isremote','isremote',0,TO_TIMESTAMP('2012-03-11 00:13:45','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-03-11 00:13:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 11/03/2012 0:13:45 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000006 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 11/03/2012 0:13:46 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000028,3000001,'LAR',0,'Y','N','N','N',1,'N',20,'N',3000006,'N','Y','N','isremote','isremote',100,TO_TIMESTAMP('2012-03-11 00:13:45','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:13:45','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:13:46 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000028 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:13:46 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000007,'onprintproductformat','LAR','onprintproductformat','onprintproductformat',0,TO_TIMESTAMP('2012-03-11 00:13:46','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-03-11 00:13:46','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 11/03/2012 0:13:46 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000007 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 11/03/2012 0:13:46 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000029,3000001,'LAR',0,'Y','N','N','N',2,'N',10,'N',3000007,'N','Y','N','onprintproductformat','onprintproductformat',100,TO_TIMESTAMP('2012-03-11 00:13:46','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:13:46','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:13:46 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000029 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:13:46 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000008,'onprintuseproductreference','LAR','onprintuseproductreference','onprintuseproductreference',0,TO_TIMESTAMP('2012-03-11 00:13:46','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-03-11 00:13:46','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 11/03/2012 0:13:46 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000008 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 11/03/2012 0:13:46 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000030,3000001,'LAR',0,'Y','N','N','N',1,'N',20,'N',3000008,'N','Y','N','onprintuseproductreference','onprintuseproductreference',100,TO_TIMESTAMP('2012-03-11 00:13:46','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:13:46','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:13:46 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000030 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:14:41 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element SET ColumnName='IsRemote', Name='IsRemote', PrintName='IsRemote',Updated=TO_TIMESTAMP('2012-03-11 00:14:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000006
;

-- 11/03/2012 0:14:41 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000006
;

-- 11/03/2012 0:14:41 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Column SET ColumnName='IsRemote', Name='IsRemote', Description=NULL, Help=NULL WHERE AD_Element_ID=3000006
;

-- 11/03/2012 0:14:41 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='IsRemote', Name='IsRemote', Description=NULL, Help=NULL, AD_Element_ID=3000006 WHERE UPPER(ColumnName)='ISREMOTE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 11/03/2012 0:14:41 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='IsRemote', Name='IsRemote', Description=NULL, Help=NULL WHERE AD_Element_ID=3000006 AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:14:41 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET Name='IsRemote', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000006) AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:14:41 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_PrintFormatItem SET PrintName='IsRemote', Name='IsRemote' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000006)
;

-- 11/03/2012 0:15:18 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element SET ColumnName='OnPrintProductFormat', Name='OnPrintProductFormat', PrintName='OnPrintProductFormat',Updated=TO_TIMESTAMP('2012-03-11 00:15:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000007
;

-- 11/03/2012 0:15:18 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000007
;

-- 11/03/2012 0:15:18 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Column SET ColumnName='OnPrintProductFormat', Name='OnPrintProductFormat', Description=NULL, Help=NULL WHERE AD_Element_ID=3000007
;

-- 11/03/2012 0:15:18 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='OnPrintProductFormat', Name='OnPrintProductFormat', Description=NULL, Help=NULL, AD_Element_ID=3000007 WHERE UPPER(ColumnName)='ONPRINTPRODUCTFORMAT' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 11/03/2012 0:15:18 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='OnPrintProductFormat', Name='OnPrintProductFormat', Description=NULL, Help=NULL WHERE AD_Element_ID=3000007 AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:15:18 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET Name='OnPrintProductFormat', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000007) AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:15:18 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_PrintFormatItem SET PrintName='OnPrintProductFormat', Name='OnPrintProductFormat' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000007)
;

-- 11/03/2012 0:16:04 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element SET ColumnName='OnPrintUseProductReference', Name='OnPrintUseProductReference', PrintName='OnPrintUseProductReference',Updated=TO_TIMESTAMP('2012-03-11 00:16:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000008
;

-- 11/03/2012 0:16:04 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000008
;

-- 11/03/2012 0:16:04 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Column SET ColumnName='OnPrintUseProductReference', Name='OnPrintUseProductReference', Description=NULL, Help=NULL WHERE AD_Element_ID=3000008
;

-- 11/03/2012 0:16:04 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='OnPrintUseProductReference', Name='OnPrintUseProductReference', Description=NULL, Help=NULL, AD_Element_ID=3000008 WHERE UPPER(ColumnName)='ONPRINTUSEPRODUCTREFERENCE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 11/03/2012 0:16:04 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='OnPrintUseProductReference', Name='OnPrintUseProductReference', Description=NULL, Help=NULL WHERE AD_Element_ID=3000008 AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:16:04 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET Name='OnPrintUseProductReference', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000008) AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:16:05 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_PrintFormatItem SET PrintName='OnPrintUseProductReference', Name='OnPrintUseProductReference' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000008)
;

-- 11/03/2012 0:16:46 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element SET ColumnName='Operation_Date', Name='Operation_Date', PrintName='Operation_Date',Updated=TO_TIMESTAMP('2012-03-11 00:16:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000005
;

-- 11/03/2012 0:16:46 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000005
;

-- 11/03/2012 0:16:46 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Column SET ColumnName='Operation_Date', Name='Operation_Date', Description=NULL, Help=NULL WHERE AD_Element_ID=3000005
;

-- 11/03/2012 0:16:46 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='Operation_Date', Name='Operation_Date', Description=NULL, Help=NULL, AD_Element_ID=3000005 WHERE UPPER(ColumnName)='OPERATION_DATE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 11/03/2012 0:16:46 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='Operation_Date', Name='Operation_Date', Description=NULL, Help=NULL WHERE AD_Element_ID=3000005 AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:16:46 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET Name='Operation_Date', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000005) AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:16:46 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_PrintFormatItem SET PrintName='Operation_Date', Name='Operation_Date' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000005)
;

-- 11/03/2012 0:19:11 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000009,'isfiscal','LAR','isfiscal','isfiscal',0,TO_TIMESTAMP('2012-03-11 00:19:11','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-03-11 00:19:11','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 11/03/2012 0:19:11 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000009 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 11/03/2012 0:19:11 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000031,217,'LAR',0,'Y','N','N','N',1,'N',20,'N',3000009,'N','Y','N','isfiscal','isfiscal',100,TO_TIMESTAMP('2012-03-11 00:19:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:19:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:19:11 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000031 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:19:12 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000010,'isfiscaldocument','LAR','isfiscaldocument','isfiscaldocument',0,TO_TIMESTAMP('2012-03-11 00:19:11','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-03-11 00:19:11','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 11/03/2012 0:19:12 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000010 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 11/03/2012 0:19:12 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000032,217,'LAR',0,'Y','N','N','N',1,'N',20,'N',3000010,'N','Y','N','isfiscaldocument','isfiscaldocument',100,TO_TIMESTAMP('2012-03-11 00:19:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:19:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:19:12 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000032 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:19:12 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000011,'fiscaldocument','LAR','fiscaldocument','fiscaldocument',0,TO_TIMESTAMP('2012-03-11 00:19:12','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-03-11 00:19:12','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 11/03/2012 0:19:12 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000011 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 11/03/2012 0:19:12 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000033,217,'LAR',0,'N','N','N','N',1,'N',20,'N',3000011,'N','Y','N','fiscaldocument','fiscaldocument',100,TO_TIMESTAMP('2012-03-11 00:19:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:19:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:19:12 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000033 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:19:13 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000034,217,'LAR',0,'N','N','N','N',10,'N',19,'N',3000003,'N','Y','N','LAR_Fiscal_Printer','LAR_Fiscal_Printer_ID',100,TO_TIMESTAMP('2012-03-11 00:19:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:19:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:19:13 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000034 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:19:13 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000012,'docsubtypecae','LAR','docsubtypecae','docsubtypecae',0,TO_TIMESTAMP('2012-03-11 00:19:13','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-03-11 00:19:13','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 11/03/2012 0:19:13 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000012 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 11/03/2012 0:19:13 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000035,217,'LAR',0,'N','N','N','N',2,'N',17,'N',3000012,'N','Y','N','docsubtypecae','docsubtypecae',100,TO_TIMESTAMP('2012-03-11 00:19:13','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:19:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:19:13 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000035 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:19:13 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000013,'docsubtypeinv','LAR','docsubtypeinv','docsubtypeinv',0,TO_TIMESTAMP('2012-03-11 00:19:13','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-03-11 00:19:13','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 11/03/2012 0:19:13 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000013 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 11/03/2012 0:19:14 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000036,217,'LAR',0,'N','N','N','N',2,'N',17,'N',3000013,'N','Y','N','docsubtypeinv','docsubtypeinv',100,TO_TIMESTAMP('2012-03-11 00:19:13','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:19:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:19:14 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000036 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:19:14 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000014,'iselectronic','LAR','iselectronic','iselectronic',0,TO_TIMESTAMP('2012-03-11 00:19:14','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-03-11 00:19:14','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 11/03/2012 0:19:14 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000014 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 11/03/2012 0:19:14 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000037,217,'LAR',0,'Y','N','N','N',1,'N',20,'N',3000014,'N','Y','N','iselectronic','iselectronic',100,TO_TIMESTAMP('2012-03-11 00:19:14','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:19:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:19:14 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000037 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:19:44 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element SET ColumnName='IsElectronic', Name='IsElectronic', PrintName='IsElectronic',Updated=TO_TIMESTAMP('2012-03-11 00:19:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000014
;

-- 11/03/2012 0:19:44 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000014
;

-- 11/03/2012 0:19:44 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Column SET ColumnName='IsElectronic', Name='IsElectronic', Description=NULL, Help=NULL WHERE AD_Element_ID=3000014
;

-- 11/03/2012 0:19:44 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='IsElectronic', Name='IsElectronic', Description=NULL, Help=NULL, AD_Element_ID=3000014 WHERE UPPER(ColumnName)='ISELECTRONIC' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 11/03/2012 0:19:45 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='IsElectronic', Name='IsElectronic', Description=NULL, Help=NULL WHERE AD_Element_ID=3000014 AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:19:45 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET Name='IsElectronic', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000014) AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:19:45 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_PrintFormatItem SET PrintName='IsElectronic', Name='IsElectronic' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000014)
;

-- 11/03/2012 0:20:08 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element SET ColumnName='IsFiscal', Name='IsFiscal', PrintName='IsFiscal',Updated=TO_TIMESTAMP('2012-03-11 00:20:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000009
;

-- 11/03/2012 0:20:08 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000009
;

-- 11/03/2012 0:20:08 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Column SET ColumnName='IsFiscal', Name='IsFiscal', Description=NULL, Help=NULL WHERE AD_Element_ID=3000009
;

-- 11/03/2012 0:20:08 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='IsFiscal', Name='IsFiscal', Description=NULL, Help=NULL, AD_Element_ID=3000009 WHERE UPPER(ColumnName)='ISFISCAL' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 11/03/2012 0:20:08 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='IsFiscal', Name='IsFiscal', Description=NULL, Help=NULL WHERE AD_Element_ID=3000009 AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:20:08 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET Name='IsFiscal', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000009) AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:20:08 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_PrintFormatItem SET PrintName='IsFiscal', Name='IsFiscal' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000009)
;

-- 11/03/2012 0:20:35 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element SET ColumnName='IsFiscaldocument', Name='IsFiscaldocument', PrintName='IsFiscaldocument',Updated=TO_TIMESTAMP('2012-03-11 00:20:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000010
;

-- 11/03/2012 0:20:35 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000010
;

-- 11/03/2012 0:20:35 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Column SET ColumnName='IsFiscaldocument', Name='IsFiscaldocument', Description=NULL, Help=NULL WHERE AD_Element_ID=3000010
;

-- 11/03/2012 0:20:35 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='IsFiscaldocument', Name='IsFiscaldocument', Description=NULL, Help=NULL, AD_Element_ID=3000010 WHERE UPPER(ColumnName)='ISFISCALDOCUMENT' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 11/03/2012 0:20:35 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='IsFiscaldocument', Name='IsFiscaldocument', Description=NULL, Help=NULL WHERE AD_Element_ID=3000010 AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:20:35 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET Name='IsFiscaldocument', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000010) AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:20:36 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_PrintFormatItem SET PrintName='IsFiscaldocument', Name='IsFiscaldocument' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000010)
;

-- 11/03/2012 0:21:26 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element SET ColumnName='DocSubtypeCAE', Name='DocSubtypeCAE', PrintName='DocSubtypeCAE',Updated=TO_TIMESTAMP('2012-03-11 00:21:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000012
;

-- 11/03/2012 0:21:26 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000012
;

-- 11/03/2012 0:21:26 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Column SET ColumnName='DocSubtypeCAE', Name='DocSubtypeCAE', Description=NULL, Help=NULL WHERE AD_Element_ID=3000012
;

-- 11/03/2012 0:21:26 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='DocSubtypeCAE', Name='DocSubtypeCAE', Description=NULL, Help=NULL, AD_Element_ID=3000012 WHERE UPPER(ColumnName)='DOCSUBTYPECAE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 11/03/2012 0:21:26 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='DocSubtypeCAE', Name='DocSubtypeCAE', Description=NULL, Help=NULL WHERE AD_Element_ID=3000012 AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:21:26 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET Name='DocSubtypeCAE', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000012) AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:21:26 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_PrintFormatItem SET PrintName='DocSubtypeCAE', Name='DocSubtypeCAE' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000012)
;

-- 11/03/2012 0:22:00 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element SET ColumnName='DocSubtypeINV', Name='DocSubtypeINV', PrintName='DocSubtypeINV',Updated=TO_TIMESTAMP('2012-03-11 00:22:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000013
;

-- 11/03/2012 0:22:00 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000013
;

-- 11/03/2012 0:22:00 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Column SET ColumnName='DocSubtypeINV', Name='DocSubtypeINV', Description=NULL, Help=NULL WHERE AD_Element_ID=3000013
;

-- 11/03/2012 0:22:00 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='DocSubtypeINV', Name='DocSubtypeINV', Description=NULL, Help=NULL, AD_Element_ID=3000013 WHERE UPPER(ColumnName)='DOCSUBTYPEINV' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 11/03/2012 0:22:00 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='DocSubtypeINV', Name='DocSubtypeINV', Description=NULL, Help=NULL WHERE AD_Element_ID=3000013 AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:22:00 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET Name='DocSubtypeINV', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000013) AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:22:00 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_PrintFormatItem SET PrintName='DocSubtypeINV', Name='DocSubtypeINV' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000013)
;

-- 11/03/2012 0:22:42 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element SET ColumnName='FiscalDocument', Name='FiscalDocument', PrintName='FiscalDocument',Updated=TO_TIMESTAMP('2012-03-11 00:22:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000011
;

-- 11/03/2012 0:22:42 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000011
;

-- 11/03/2012 0:22:42 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Column SET ColumnName='FiscalDocument', Name='FiscalDocument', Description=NULL, Help=NULL WHERE AD_Element_ID=3000011
;

-- 11/03/2012 0:22:43 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='FiscalDocument', Name='FiscalDocument', Description=NULL, Help=NULL, AD_Element_ID=3000011 WHERE UPPER(ColumnName)='FISCALDOCUMENT' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 11/03/2012 0:22:43 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='FiscalDocument', Name='FiscalDocument', Description=NULL, Help=NULL WHERE AD_Element_ID=3000011 AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:22:43 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET Name='FiscalDocument', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000011) AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:22:43 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_PrintFormatItem SET PrintName='FiscalDocument', Name='FiscalDocument' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000011)
;

-- 11/03/2012 0:29:24 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000015,'isfiscalprinted','LAR','isfiscalprinted','isfiscalprinted',0,TO_TIMESTAMP('2012-03-11 00:29:24','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-03-11 00:29:24','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 11/03/2012 0:29:24 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000015 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 11/03/2012 0:29:24 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000038,318,'LAR',0,'Y','N','N','N',1,'N',20,'N',3000015,'N','Y','N','isfiscalprinted','isfiscalprinted',100,TO_TIMESTAMP('2012-03-11 00:29:24','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:29:24','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:29:24 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000038 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:29:25 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000016,'fiscalreceiptnumber','LAR','fiscalreceiptnumber','fiscalreceiptnumber',0,TO_TIMESTAMP('2012-03-11 00:29:24','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-03-11 00:29:24','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 11/03/2012 0:29:25 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000016 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 11/03/2012 0:29:25 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000039,318,'LAR',0,'N','N','N','N',30,'N',10,'N',3000016,'N','Y','N','fiscalreceiptnumber','fiscalreceiptnumber',100,TO_TIMESTAMP('2012-03-11 00:29:24','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:29:24','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:29:25 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000039 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:29:25 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000017,'cai','LAR','cai','cai',0,TO_TIMESTAMP('2012-03-11 00:29:25','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-03-11 00:29:25','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 11/03/2012 0:29:25 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000017 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 11/03/2012 0:29:25 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000040,318,'LAR',0,'N','N','N','N',14,'N',10,'N',3000017,'N','Y','N','cai','cai',100,TO_TIMESTAMP('2012-03-11 00:29:25','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:29:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:29:25 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000040 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:29:26 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000018,'caidate','LAR','caidate','caidate',0,TO_TIMESTAMP('2012-03-11 00:29:25','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-03-11 00:29:25','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 11/03/2012 0:29:26 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000018 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 11/03/2012 0:29:26 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000041,318,'LAR',0,'N','N','N','N',29,'N',16,'N',3000018,'N','Y','N','caidate','caidate',100,TO_TIMESTAMP('2012-03-11 00:29:25','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-11 00:29:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/03/2012 0:29:26 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000041 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/03/2012 0:30:22 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element SET ColumnName='CAI', Name='CAI', PrintName='CAI',Updated=TO_TIMESTAMP('2012-03-11 00:30:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000017
;

-- 11/03/2012 0:30:22 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000017
;

-- 11/03/2012 0:30:22 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Column SET ColumnName='CAI', Name='CAI', Description=NULL, Help=NULL WHERE AD_Element_ID=3000017
;

-- 11/03/2012 0:30:23 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='CAI', Name='CAI', Description=NULL, Help=NULL, AD_Element_ID=3000017 WHERE UPPER(ColumnName)='CAI' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 11/03/2012 0:30:23 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='CAI', Name='CAI', Description=NULL, Help=NULL WHERE AD_Element_ID=3000017 AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:30:23 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET Name='CAI', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000017) AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:30:23 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_PrintFormatItem SET PrintName='CAI', Name='CAI' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000017)
;

-- 11/03/2012 0:30:57 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element SET ColumnName='CAIDate', Name='CAIDate', PrintName='CAIDate',Updated=TO_TIMESTAMP('2012-03-11 00:30:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000018
;

-- 11/03/2012 0:30:57 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000018
;

-- 11/03/2012 0:30:57 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Column SET ColumnName='CAIDate', Name='CAIDate', Description=NULL, Help=NULL WHERE AD_Element_ID=3000018
;

-- 11/03/2012 0:30:57 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='CAIDate', Name='CAIDate', Description=NULL, Help=NULL, AD_Element_ID=3000018 WHERE UPPER(ColumnName)='CAIDATE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 11/03/2012 0:30:57 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='CAIDate', Name='CAIDate', Description=NULL, Help=NULL WHERE AD_Element_ID=3000018 AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:30:57 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET Name='CAIDate', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000018) AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:30:57 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_PrintFormatItem SET PrintName='CAIDate', Name='CAIDate' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000018)
;

-- 11/03/2012 0:31:40 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element SET ColumnName='IsFiscalPrinted', Name='IsFiscalPrinted', PrintName='IsFiscalPrinted',Updated=TO_TIMESTAMP('2012-03-11 00:31:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000015
;

-- 11/03/2012 0:31:40 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000015
;

-- 11/03/2012 0:31:40 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Column SET ColumnName='IsFiscalPrinted', Name='IsFiscalPrinted', Description=NULL, Help=NULL WHERE AD_Element_ID=3000015
;

-- 11/03/2012 0:31:40 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='IsFiscalPrinted', Name='IsFiscalPrinted', Description=NULL, Help=NULL, AD_Element_ID=3000015 WHERE UPPER(ColumnName)='ISFISCALPRINTED' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 11/03/2012 0:31:40 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='IsFiscalPrinted', Name='IsFiscalPrinted', Description=NULL, Help=NULL WHERE AD_Element_ID=3000015 AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:31:40 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET Name='IsFiscalPrinted', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000015) AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:31:40 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_PrintFormatItem SET PrintName='IsFiscalPrinted', Name='IsFiscalPrinted' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000015)
;

-- 11/03/2012 0:33:03 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element SET ColumnName='FiscalReceiptNumber', Name='FiscalReceiptNumber', PrintName='FiscalReceiptNumber',Updated=TO_TIMESTAMP('2012-03-11 00:33:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000016
;

-- 11/03/2012 0:33:03 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000016
;

-- 11/03/2012 0:33:03 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Column SET ColumnName='FiscalReceiptNumber', Name='FiscalReceiptNumber', Description=NULL, Help=NULL WHERE AD_Element_ID=3000016
;

-- 11/03/2012 0:33:03 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='FiscalReceiptNumber', Name='FiscalReceiptNumber', Description=NULL, Help=NULL, AD_Element_ID=3000016 WHERE UPPER(ColumnName)='FISCALRECEIPTNUMBER' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 11/03/2012 0:33:03 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Process_Para SET ColumnName='FiscalReceiptNumber', Name='FiscalReceiptNumber', Description=NULL, Help=NULL WHERE AD_Element_ID=3000016 AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:33:03 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET Name='FiscalReceiptNumber', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000016) AND IsCentrallyMaintained='Y'
;

-- 11/03/2012 0:33:03 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_PrintFormatItem SET PrintName='FiscalReceiptNumber', Name='FiscalReceiptNumber' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000016)
;

-- 11/03/2012 0:38:59 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Window (AD_Window_ID,WindowType,IsSOTrx,IsDefault,IsBetaFunctionality,WinHeight,WinWidth,EntityType,Name,IsActive,Created,UpdatedBy,CreatedBy,Updated,AD_Org_ID,AD_Client_ID,Processing) VALUES (3000000,'M','Y','N','N',0,0,'LAR','LAR_Fiscal_Printer','Y',TO_TIMESTAMP('2012-03-11 00:38:59','YYYY-MM-DD HH24:MI:SS'),100,100,TO_TIMESTAMP('2012-03-11 00:38:59','YYYY-MM-DD HH24:MI:SS'),0,0,'N')
;

-- 11/03/2012 0:38:59 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Window_Trl (AD_Language,AD_Window_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Window_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Window t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Window_ID=3000000 AND NOT EXISTS (SELECT * FROM AD_Window_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Window_ID=t.AD_Window_ID)
;

-- 11/03/2012 0:43:15 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('N',3000000,10,'N','N',3000001,3000000,'N','N','N','N',0,'Y','N','LAR','Fiscal Printer',0,0,TO_TIMESTAMP('2012-03-11 00:43:15','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-11 00:43:15','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 11/03/2012 0:43:16 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000000 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 11/03/2012 0:44:05 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Window SET Name='Fiscal Printer',Updated=TO_TIMESTAMP('2012-03-11 00:44:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Window_ID=3000000
;

-- 11/03/2012 0:44:05 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Window_Trl SET IsTranslated='N' WHERE AD_Window_ID=3000000
;

-- 11/03/2012 0:44:51 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Window (AD_Window_ID,WindowType,IsSOTrx,IsDefault,IsBetaFunctionality,WinHeight,WinWidth,EntityType,Name,IsActive,Created,UpdatedBy,CreatedBy,Updated,AD_Org_ID,AD_Client_ID,Processing) VALUES (3000001,'M','Y','N','N',0,0,'LAR','Fiscal Printer Type','Y',TO_TIMESTAMP('2012-03-11 00:44:51','YYYY-MM-DD HH24:MI:SS'),100,100,TO_TIMESTAMP('2012-03-11 00:44:51','YYYY-MM-DD HH24:MI:SS'),0,0,'N')
;

-- 11/03/2012 0:44:51 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Window_Trl (AD_Language,AD_Window_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Window_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Window t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Window_ID=3000001 AND NOT EXISTS (SELECT * FROM AD_Window_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Window_ID=t.AD_Window_ID)
;

-- 11/03/2012 0:45:27 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('N',3000001,10,'N','N',3000000,3000001,'N','N','N','N',0,'Y','N','LAR','Fiscal Printer Type',0,0,TO_TIMESTAMP('2012-03-11 00:45:26','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-11 00:45:26','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 11/03/2012 0:45:27 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000001 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 11/03/2012 0:45:32 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000000,1,'Y','N','N',3000003,'N','Y',3000001,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,'Y',TO_TIMESTAMP('2012-03-11 00:45:32','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 00:45:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/03/2012 0:45:32 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000000 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/03/2012 0:45:33 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000001,100,'Y','N','N',3000011,'N','Y',3000001,'N','LAR','Clazz',100,0,'Y',TO_TIMESTAMP('2012-03-11 00:45:32','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 00:45:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/03/2012 0:45:33 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000001 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/03/2012 0:45:33 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000002,10,'Y','N','N',3000001,'N','Y',3000001,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,'Y',TO_TIMESTAMP('2012-03-11 00:45:33','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 00:45:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/03/2012 0:45:33 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000002 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/03/2012 0:45:33 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000003,200,'Y','N','N',3000009,'N','Y',3000001,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,'Y',TO_TIMESTAMP('2012-03-11 00:45:33','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 00:45:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/03/2012 0:45:33 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000003 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/03/2012 0:45:33 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000004,10,'N','N','N',3000000,'N','Y',3000001,'N','LAR','LAR_Fiscal_Printer_Type',100,0,'Y',TO_TIMESTAMP('2012-03-11 00:45:33','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 00:45:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/03/2012 0:45:33 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000004 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/03/2012 0:45:34 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000005,100,'Y','N','N',3000008,'N','Y',3000001,'N','The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.','LAR','Alphanumeric identifier of the entity','Name',100,0,'Y',TO_TIMESTAMP('2012-03-11 00:45:33','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 00:45:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/03/2012 0:45:34 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000005 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/03/2012 0:45:34 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000006,10,'Y','N','N',3000002,'N','Y',3000001,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,'Y',TO_TIMESTAMP('2012-03-11 00:45:34','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 00:45:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/03/2012 0:45:34 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000006 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/03/2012 0:45:34 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000007,500,'Y','N','N',3000010,'N','Y',3000001,'N','LAR','Parameters',100,0,'Y',TO_TIMESTAMP('2012-03-11 00:45:34','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 00:45:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/03/2012 0:45:34 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000007 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/03/2012 0:46:26 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3000002
;

-- 11/03/2012 0:46:26 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3000006
;

-- 11/03/2012 0:46:26 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3000005
;

-- 11/03/2012 0:46:26 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3000003
;

-- 11/03/2012 0:46:26 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3000000
;

-- 11/03/2012 0:46:26 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3000001
;

-- 11/03/2012 0:46:26 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3000007
;

-- 11/03/2012 0:47:04 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2012-03-11 00:47:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000006
;

-- 11/03/2012 0:47:23 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET DisplayLength=10,Updated=TO_TIMESTAMP('2012-03-11 00:47:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000001
;

-- 11/03/2012 0:47:34 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET DisplayLength=10, IsSameLine='Y',Updated=TO_TIMESTAMP('2012-03-11 00:47:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000007
;

-- 11/03/2012 0:53:48 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000008,1,'Y','N','N',3000015,'N','Y',3000000,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,'Y',TO_TIMESTAMP('2012-03-11 00:53:48','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 00:53:48','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/03/2012 0:53:48 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000008 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/03/2012 0:53:49 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000009,10,'Y','N','N',3000013,'N','Y',3000000,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,'Y',TO_TIMESTAMP('2012-03-11 00:53:48','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 00:53:48','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/03/2012 0:53:49 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000009 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/03/2012 0:53:49 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000010,200,'Y','N','N',3000022,'N','Y',3000000,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,'Y',TO_TIMESTAMP('2012-03-11 00:53:49','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 00:53:49','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/03/2012 0:53:49 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000010 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/03/2012 0:53:49 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000011,100,'Y','N','N',3000023,'N','Y',3000000,'N','LAR','Host',100,0,'Y',TO_TIMESTAMP('2012-03-11 00:53:49','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 00:53:49','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/03/2012 0:53:49 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000011 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/03/2012 0:53:50 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000012,1,'Y','N','N',3000028,'N','Y',3000000,'N','LAR','IsRemote',100,0,'Y',TO_TIMESTAMP('2012-03-11 00:53:49','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 00:53:49','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/03/2012 0:53:50 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000012 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/03/2012 0:53:50 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000013,10,'N','N','N',3000012,'N','Y',3000000,'N','LAR','LAR_Fiscal_Printer',100,0,'Y',TO_TIMESTAMP('2012-03-11 00:53:50','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 00:53:50','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/03/2012 0:53:50 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000013 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/03/2012 0:53:50 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000014,10,'Y','N','N',3000020,'N','Y',3000000,'N','LAR','LAR_Fiscal_Printer_Type',100,0,'Y',TO_TIMESTAMP('2012-03-11 00:53:50','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 00:53:50','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/03/2012 0:53:50 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000014 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/03/2012 0:53:51 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000015,100,'Y','N','N',3000021,'N','Y',3000000,'N','The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.','LAR','Alphanumeric identifier of the entity','Name',100,0,'Y',TO_TIMESTAMP('2012-03-11 00:53:50','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 00:53:50','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/03/2012 0:53:51 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000015 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/03/2012 0:53:51 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000016,2,'Y','N','N',3000029,'N','Y',3000000,'N','LAR','OnPrintProductFormat',100,0,'Y',TO_TIMESTAMP('2012-03-11 00:53:51','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 00:53:51','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/03/2012 0:53:51 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000016 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/03/2012 0:53:52 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000017,1,'Y','N','N',3000030,'N','Y',3000000,'N','LAR','OnPrintUseProductReference',100,0,'Y',TO_TIMESTAMP('2012-03-11 00:53:51','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 00:53:51','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/03/2012 0:53:52 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000017 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/03/2012 0:53:52 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000018,29,'Y','N','N',3000027,'N','Y',3000000,'N','LAR','Operation_Date',100,0,'Y',TO_TIMESTAMP('2012-03-11 00:53:52','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 00:53:52','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/03/2012 0:53:52 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000018 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/03/2012 0:53:52 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000019,10,'Y','N','N',3000014,'N','Y',3000000,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,'Y',TO_TIMESTAMP('2012-03-11 00:53:52','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 00:53:52','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/03/2012 0:53:52 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000019 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/03/2012 0:53:52 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000020,10,'Y','N','N',3000024,'N','Y',3000000,'N','LAR','Port',100,0,'Y',TO_TIMESTAMP('2012-03-11 00:53:52','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 00:53:52','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/03/2012 0:53:52 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000020 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/03/2012 0:53:53 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000021,3,'Y','N','N',3000025,'N','Y',3000000,'N','Status of the currently running check','LAR','Status of the currently running check','Status',100,0,'Y',TO_TIMESTAMP('2012-03-11 00:53:52','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 00:53:52','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/03/2012 0:53:53 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000021 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/03/2012 1:02:34 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3000009
;

-- 11/03/2012 1:02:35 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3000019
;

-- 11/03/2012 1:02:35 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3000008
;

-- 11/03/2012 1:02:35 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3000015
;

-- 11/03/2012 1:02:35 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3000010
;

-- 11/03/2012 1:02:35 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3000014
;

-- 11/03/2012 1:02:35 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3000011
;

-- 11/03/2012 1:02:35 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3000020
;

-- 11/03/2012 1:02:35 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3000021
;

-- 11/03/2012 1:02:35 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3000018
;

-- 11/03/2012 1:02:35 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3000012
;

-- 11/03/2012 1:02:35 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3000017
;

-- 11/03/2012 1:02:35 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3000016
;

-- 11/03/2012 1:03:20 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2012-03-11 01:03:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000011
;

-- 11/03/2012 1:03:27 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET DisplayLength=20, IsSameLine='Y',Updated=TO_TIMESTAMP('2012-03-11 01:03:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000020
;

-- 11/03/2012 1:04:38 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET DisplayLength=10,Updated=TO_TIMESTAMP('2012-03-11 01:04:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000018
;

-- 11/03/2012 1:08:03 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET DisplayLogic='@OnPrintUseProductReference@=N',Updated=TO_TIMESTAMP('2012-03-11 01:08:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000016
;

-- 11/03/2012 1:08:42 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3000000
;

-- 11/03/2012 1:08:42 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3000005
;

-- 11/03/2012 1:08:42 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3000003
;

-- 11/03/2012 1:09:48 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Menu (AD_Menu_ID,IsSummary,IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000000,'Y','N','N','LAR','Y','Localizacion Argentina',TO_TIMESTAMP('2012-03-11 01:09:47','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_TIMESTAMP('2012-03-11 01:09:47','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 11/03/2012 1:09:48 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000000 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 11/03/2012 1:09:48 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100,t.AD_Tree_ID, 3000000, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000000)
;

-- 11/03/2012 1:11:13 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Menu (AD_Menu_ID,IsSummary,IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000001,'Y','N','N','LAR','Y','Impuestos',TO_TIMESTAMP('2012-03-11 01:11:12','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_TIMESTAMP('2012-03-11 01:11:12','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 11/03/2012 1:11:13 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000001 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 11/03/2012 1:11:13 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100,t.AD_Tree_ID, 3000001, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000001)
;

-- 11/03/2012 1:11:17 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_TreeNodeMM SET Parent_ID=3000000, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000001
;

-- 11/03/2012 1:11:46 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Menu (AD_Menu_ID,IsSummary,IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000002,'Y','N','N','LAR','Y','Impresion Fiscal',TO_TIMESTAMP('2012-03-11 01:11:45','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_TIMESTAMP('2012-03-11 01:11:45','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 11/03/2012 1:11:46 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000002 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 11/03/2012 1:11:46 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100,t.AD_Tree_ID, 3000002, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000002)
;

-- 11/03/2012 1:11:49 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_TreeNodeMM SET Parent_ID=3000000, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000002
;

-- 11/03/2012 1:11:49 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_TreeNodeMM SET Parent_ID=3000000, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000001
;

-- 11/03/2012 1:13:11 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Menu (AD_Window_ID,AD_Menu_ID,IsSummary,"action",IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000000,3000003,'N','W','N','N','LAR','Y','Fiscal Printer',TO_TIMESTAMP('2012-03-11 01:13:10','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_TIMESTAMP('2012-03-11 01:13:10','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 11/03/2012 1:13:11 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000003 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 11/03/2012 1:13:11 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100,t.AD_Tree_ID, 3000003, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000003)
;

-- 11/03/2012 1:13:16 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_TreeNodeMM SET Parent_ID=3000002, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000003
;

-- 11/03/2012 1:13:33 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Menu (AD_Window_ID,AD_Menu_ID,IsSummary,"action",IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000001,3000004,'N','W','N','N','LAR','Y','Fiscal Printer Type',TO_TIMESTAMP('2012-03-11 01:13:32','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_TIMESTAMP('2012-03-11 01:13:32','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 11/03/2012 1:13:33 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000004 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 11/03/2012 1:13:33 GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100,t.AD_Tree_ID, 3000004, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000004)
;

-- 11/03/2012 1:13:38 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_TreeNodeMM SET Parent_ID=3000002, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000004
;

-- 11/03/2012 1:13:38 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_TreeNodeMM SET Parent_ID=3000002, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000003
;

-- Mar 11, 2012 9:59:15 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000000,'L','LAR','N','LAR_DocSubtyeINV',0,0,100,TO_TIMESTAMP('2012-03-11 21:59:14','YYYY-MM-DD HH24:MI:SS'),'Y',TO_TIMESTAMP('2012-03-11 21:59:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 11, 2012 9:59:15 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000000 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- Mar 11, 2012 10:03:16 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Created,CreatedBy,Updated,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000000,3000000,'LAR','EL','Electronic',TO_TIMESTAMP('2012-03-11 22:03:15','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-11 22:03:15','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- Mar 11, 2012 10:03:16 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000000 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Mar 11, 2012 10:06:34 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Created,CreatedBy,Updated,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000001,3000000,'LAR','FF','Fiscal Form',TO_TIMESTAMP('2012-03-11 22:06:32','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-11 22:06:32','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- Mar 11, 2012 10:06:34 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000001 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Mar 11, 2012 10:07:32 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Created,CreatedBy,Updated,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000002,3000000,'LAR','NF','No Fiscal',TO_TIMESTAMP('2012-03-11 22:07:31','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-11 22:07:31','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- Mar 11, 2012 10:07:32 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000002 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Mar 11, 2012 10:07:47 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Created,CreatedBy,Updated,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000003,3000000,'LAR','SF','Fiscal',TO_TIMESTAMP('2012-03-11 22:07:46','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-11 22:07:46','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- Mar 11, 2012 10:07:47 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000003 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Mar 11, 2012 10:09:01 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Column SET AD_Reference_Value_ID=3000000,Updated=TO_TIMESTAMP('2012-03-11 22:09:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000036
;

-- Mar 11, 2012 10:12:19 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000001,'L','LAR','N','LAR_FiscalDocument',0,0,100,TO_TIMESTAMP('2012-03-11 22:12:17','YYYY-MM-DD HH24:MI:SS'),'Y',TO_TIMESTAMP('2012-03-11 22:12:17','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 11, 2012 10:12:19 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000001 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- Mar 11, 2012 10:12:37 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Created,CreatedBy,Updated,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000004,3000001,'LAR','F','Factura',TO_TIMESTAMP('2012-03-11 22:12:36','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-11 22:12:36','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- Mar 11, 2012 10:12:37 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000004 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Mar 11, 2012 10:13:01 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Created,CreatedBy,Updated,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000005,3000001,'LAR','D','Credit Note',TO_TIMESTAMP('2012-03-11 22:13:00','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-11 22:13:00','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- Mar 11, 2012 10:13:01 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000005 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Mar 11, 2012 10:14:03 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Created,CreatedBy,Updated,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000006,3000001,'LAR','C','Credit Note',TO_TIMESTAMP('2012-03-11 22:14:02','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-11 22:14:02','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- Mar 11, 2012 10:14:03 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000006 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Mar 11, 2012 10:14:12 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Ref_List SET Name='Debit Note',Updated=TO_TIMESTAMP('2012-03-11 22:14:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000005
;

-- Mar 11, 2012 10:14:12 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Ref_List_Trl SET IsTranslated='N' WHERE AD_Ref_List_ID=3000005
;

-- Mar 11, 2012 10:14:23 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Ref_List SET Name='Invoice',Updated=TO_TIMESTAMP('2012-03-11 22:14:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000004
;

-- Mar 11, 2012 10:14:23 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Ref_List_Trl SET IsTranslated='N' WHERE AD_Ref_List_ID=3000004
;

-- Mar 11, 2012 10:14:48 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Column SET AD_Reference_Value_ID=3000001, AD_Reference_ID=17,Updated=TO_TIMESTAMP('2012-03-11 22:14:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000033
;

-- Mar 11, 2012 10:17:46 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000002,'L','LAR','N','LAR_DocSubtypeCAE',0,0,100,TO_TIMESTAMP('2012-03-11 22:17:46','YYYY-MM-DD HH24:MI:SS'),'Y',TO_TIMESTAMP('2012-03-11 22:17:46','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 11, 2012 10:17:46 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000002 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- Mar 11, 2012 10:18:32 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Created,CreatedBy,Updated,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000007,3000002,'LAR','01','Invoice A',TO_TIMESTAMP('2012-03-11 22:18:32','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-11 22:18:32','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- Mar 11, 2012 10:18:32 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000007 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Mar 11, 2012 10:19:05 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Created,CreatedBy,Updated,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000008,3000002,'LAR','02','Debit Note A',TO_TIMESTAMP('2012-03-11 22:19:04','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-11 22:19:04','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- Mar 11, 2012 10:19:05 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000008 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Mar 11, 2012 10:19:26 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Created,CreatedBy,Updated,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000009,3000002,'LAR','03','Credit Note A',TO_TIMESTAMP('2012-03-11 22:19:26','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-11 22:19:26','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- Mar 11, 2012 10:19:26 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000009 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Mar 11, 2012 10:21:22 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Created,CreatedBy,Updated,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000010,3000002,'LAR','04','Receipt A',TO_TIMESTAMP('2012-03-11 22:21:20','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-11 22:21:20','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- Mar 11, 2012 10:21:22 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000010 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Mar 11, 2012 10:22:34 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Created,CreatedBy,Updated,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000011,3000002,'LAR','05','Cash Sale Note',TO_TIMESTAMP('2012-03-11 22:22:33','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-11 22:22:33','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- Mar 11, 2012 10:22:34 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000011 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Mar 11, 2012 10:22:55 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Created,CreatedBy,Updated,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000012,3000002,'LAR','06','Invoice B',TO_TIMESTAMP('2012-03-11 22:22:55','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-11 22:22:55','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- Mar 11, 2012 10:22:55 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000012 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Mar 11, 2012 10:23:49 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Created,CreatedBy,Updated,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000013,3000002,'LAR','07','Debit Note B',TO_TIMESTAMP('2012-03-11 22:23:49','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-11 22:23:49','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- Mar 11, 2012 10:23:49 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000013 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Mar 11, 2012 10:24:05 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Created,CreatedBy,Updated,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000014,3000002,'LAR','08','Credit Note B',TO_TIMESTAMP('2012-03-11 22:24:05','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-11 22:24:05','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- Mar 11, 2012 10:24:05 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000014 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Mar 11, 2012 10:24:46 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Created,CreatedBy,Updated,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000015,3000002,'LAR','09','Receipt B',TO_TIMESTAMP('2012-03-11 22:24:46','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-11 22:24:46','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- Mar 11, 2012 10:24:46 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000015 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Mar 11, 2012 10:24:57 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Created,CreatedBy,Updated,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000016,3000002,'LAR','10','Cash Sale Note B',TO_TIMESTAMP('2012-03-11 22:24:56','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-11 22:24:56','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- Mar 11, 2012 10:24:57 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000016 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Mar 11, 2012 10:29:00 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Column SET AD_Reference_Value_ID=3000002,Updated=TO_TIMESTAMP('2012-03-11 22:29:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000035
;

-- Mar 11, 2012 10:32:39 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000023,14,'Y','N','N',3000040,'N','Y',263,'N','LAR','CAI',100,0,'Y',TO_TIMESTAMP('2012-03-11 22:32:38','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 22:32:38','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 11, 2012 10:32:39 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000023 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 11, 2012 10:32:40 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000024,29,'Y','N','N',3000041,'N','Y',263,'N','LAR','CAIDate',100,0,'Y',TO_TIMESTAMP('2012-03-11 22:32:39','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 22:32:39','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 11, 2012 10:32:40 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000024 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 11, 2012 10:32:42 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000025,30,'Y','N','N',3000039,'N','Y',263,'N','LAR','FiscalReceiptNumber',100,0,'Y',TO_TIMESTAMP('2012-03-11 22:32:40','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 22:32:40','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 11, 2012 10:32:42 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000025 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 11, 2012 10:32:43 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000026,1,'Y','N','N',3000038,'N','Y',263,'N','LAR','IsFiscalPrinted',100,0,'Y',TO_TIMESTAMP('2012-03-11 22:32:42','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 22:32:42','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 11, 2012 10:32:43 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000026 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 11, 2012 10:32:46 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000027,20,'Y','N','N',59037,'N','Y',263,'N','The ProcessedOn Date+Time save the exact moment (nanoseconds precision if allowed by the DB) when a document has been processed.','D','The date+time (expressed in decimal format) when the document has been processed','Processed On',100,0,'Y',TO_TIMESTAMP('2012-03-11 22:32:43','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 22:32:43','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 11, 2012 10:32:46 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000027 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 11, 2012 10:32:47 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000028,22,'Y','N','N',55305,'N','Y',263,'N','D','ID of document reversal','Reversal ID',100,0,'Y',TO_TIMESTAMP('2012-03-11 22:32:46','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 22:32:46','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 11, 2012 10:32:47 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000028 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 11, 2012 10:32:48 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000029,22,'Y','N','N',52007,'N','Y',263,'N','A Return Material Authorization may be required to accept returns and to create Credit Memos','D','Return Material Authorization','RMA',100,0,'Y',TO_TIMESTAMP('2012-03-11 22:32:47','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 22:32:47','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 11, 2012 10:32:48 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000029 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 11, 2012 10:36:24 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000023
;

-- Mar 11, 2012 10:36:24 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000024
;

-- Mar 11, 2012 10:36:24 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000029
;

-- Mar 11, 2012 10:36:24 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=1000016
;

-- Mar 11, 2012 10:36:24 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=1000017
;

-- Mar 11, 2012 10:36:24 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=6564
;

-- Mar 11, 2012 10:36:24 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=2777
;

-- Mar 11, 2012 10:36:24 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3663
;

-- Mar 11, 2012 10:36:24 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3899
;

-- Mar 11, 2012 10:36:24 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=13700
;

-- Mar 11, 2012 10:36:24 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=53257
;

-- Mar 11, 2012 10:36:24 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=53258
;

-- Mar 11, 2012 10:36:24 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=60970
;

-- Mar 11, 2012 10:36:24 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000027
;

-- Mar 11, 2012 10:36:24 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000028
;

-- Mar 11, 2012 10:36:25 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000025
;

-- Mar 11, 2012 10:36:25 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000026
;

-- Mar 11, 2012 10:37:33 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000030,2,'Y','N','N',3000035,'N','Y',167,'N','LAR','DocSubtypeCAE',100,0,'Y',TO_TIMESTAMP('2012-03-11 22:37:33','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 22:37:33','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 11, 2012 10:37:33 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000030 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 11, 2012 10:37:33 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000031,2,'Y','N','N',3000036,'N','Y',167,'N','LAR','DocSubtypeINV',100,0,'Y',TO_TIMESTAMP('2012-03-11 22:37:33','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 22:37:33','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 11, 2012 10:37:33 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000031 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 11, 2012 10:37:34 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000032,1,'Y','N','N',3000033,'N','Y',167,'N','LAR','FiscalDocument',100,0,'Y',TO_TIMESTAMP('2012-03-11 22:37:33','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 22:37:33','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 11, 2012 10:37:34 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000032 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 11, 2012 10:37:34 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000033,1,'Y','N','N',15806,'N','Y',167,'N','For cross document search, the document can be indexed for faster search (Container, Document Type, Request Type)','D','Index the document for the internal search engine','Indexed',100,0,'Y',TO_TIMESTAMP('2012-03-11 22:37:34','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 22:37:34','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 11, 2012 10:37:34 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000033 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 11, 2012 10:37:34 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000034,1,'Y','N','N',3000037,'N','Y',167,'N','LAR','IsElectronic',100,0,'Y',TO_TIMESTAMP('2012-03-11 22:37:34','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 22:37:34','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 11, 2012 10:37:34 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000034 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 11, 2012 10:37:34 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000035,1,'Y','N','N',3000031,'N','Y',167,'N','LAR','IsFiscal',100,0,'Y',TO_TIMESTAMP('2012-03-11 22:37:34','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 22:37:34','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 11, 2012 10:37:34 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000035 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 11, 2012 10:37:35 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000036,1,'Y','N','N',3000032,'N','Y',167,'N','LAR','IsFiscaldocument',100,0,'Y',TO_TIMESTAMP('2012-03-11 22:37:34','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 22:37:34','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 11, 2012 10:37:35 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000036 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 11, 2012 10:37:35 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000037,10,'Y','N','N',3000034,'N','Y',167,'N','LAR','LAR_Fiscal_Printer',100,0,'Y',TO_TIMESTAMP('2012-03-11 22:37:35','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-11 22:37:35','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 11, 2012 10:37:35 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000037 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 11, 2012 10:54:50 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000033
;

-- Mar 11, 2012 10:54:50 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=1000015
;

-- Mar 11, 2012 10:54:50 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3125
;

-- Mar 11, 2012 10:54:50 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000032
;

-- Mar 11, 2012 10:54:50 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000031
;

-- Mar 11, 2012 10:54:50 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000036
;

-- Mar 11, 2012 10:54:50 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000035
;

-- Mar 11, 2012 10:54:50 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000037
;

-- Mar 11, 2012 10:54:50 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000030
;

-- Mar 11, 2012 10:54:50 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000034
;

-- Mar 11, 2012 11:02:40 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET DisplayLogic='@DocSubtypeINV@=''SF'' | @DocSubtypeINV@=''FF'' | @DocSubtypeINV@=''EL''',Updated=TO_TIMESTAMP('2012-03-11 23:02:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000036
;

-- Mar 11, 2012 11:03:08 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET DisplayLogic='@DocSubtypeINV@=''FF''',Updated=TO_TIMESTAMP('2012-03-11 23:03:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000035
;

-- Mar 11, 2012 11:03:19 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET DisplayLogic='@DocSubtypeINV@=''FF''',Updated=TO_TIMESTAMP('2012-03-11 23:03:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000037
;

-- Mar 11, 2012 11:03:44 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET DisplayLogic='@DocSubtypeINV@=''EL''',Updated=TO_TIMESTAMP('2012-03-11 23:03:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000030
;

-- Mar 11, 2012 11:03:54 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET DisplayLogic='@DocSubtypeINV@=''EL''',Updated=TO_TIMESTAMP('2012-03-11 23:03:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000034
;

-- Mar 13, 2012 5:45:41 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000006,'L','LAR','N','LAR_OnPrintProductFormat',0,0,100,TO_TIMESTAMP('2012-03-13 17:45:38','YYYY-MM-DD HH24:MI:SS'),'Y',TO_TIMESTAMP('2012-03-13 17:45:38','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 13, 2012 5:45:41 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000006 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- Mar 13, 2012 5:46:02 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Created,CreatedBy,Updated,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000021,3000006,'LAR','N','Name',TO_TIMESTAMP('2012-03-13 17:46:02','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-13 17:46:02','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- Mar 13, 2012 5:46:02 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000021 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Mar 13, 2012 5:46:33 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Created,CreatedBy,Updated,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000022,3000006,'LAR','NV','Name Value',TO_TIMESTAMP('2012-03-13 17:46:33','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-13 17:46:33','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- Mar 13, 2012 5:46:33 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000022 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Mar 13, 2012 5:46:48 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Created,CreatedBy,Updated,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000023,3000006,'LAR','V','Value',TO_TIMESTAMP('2012-03-13 17:46:47','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-13 17:46:47','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- Mar 13, 2012 5:46:48 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000023 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Mar 13, 2012 5:47:05 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Created,CreatedBy,Updated,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000024,3000006,'LAR','VN','Value Name',TO_TIMESTAMP('2012-03-13 17:47:04','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-13 17:47:04','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- Mar 13, 2012 5:47:05 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000024 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Mar 13, 2012 5:48:00 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Column SET AD_Reference_Value_ID=3000006, AD_Reference_ID=17,Updated=TO_TIMESTAMP('2012-03-13 17:48:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000029
;

-- Mar 13, 2012 5:49:37 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000007,'L','LAR','N','LAR_FiscalPrinterStatus',0,0,100,TO_TIMESTAMP('2012-03-13 17:49:37','YYYY-MM-DD HH24:MI:SS'),'Y',TO_TIMESTAMP('2012-03-13 17:49:37','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 13, 2012 5:49:37 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000007 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- Mar 13, 2012 5:51:02 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Created,CreatedBy,Updated,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000025,3000007,'LAR','BSY','Busy',TO_TIMESTAMP('2012-03-13 17:51:00','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-13 17:51:00','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- Mar 13, 2012 5:51:02 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000025 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Mar 13, 2012 5:51:18 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Created,CreatedBy,Updated,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000026,3000007,'LAR','ERR','Error',TO_TIMESTAMP('2012-03-13 17:51:17','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-13 17:51:17','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- Mar 13, 2012 5:51:18 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000026 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Mar 13, 2012 5:51:46 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Created,CreatedBy,Updated,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000027,3000007,'LAR','IDL','IDLE',TO_TIMESTAMP('2012-03-13 17:51:45','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-13 17:51:45','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- Mar 13, 2012 5:51:46 PM GMT-03:00
-- Add Fiscal printer configuration
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000027 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Mar 13, 2012 5:52:08 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Column SET AD_Reference_Value_ID=3000007, AD_Reference_ID=17,Updated=TO_TIMESTAMP('2012-03-13 17:52:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000025
;

-- Mar 14, 2012 6:06:44 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Tab SET IsSingleRow='Y',Updated=TO_TIMESTAMP('2012-03-14 18:06:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000000
;

-- Mar 14, 2012 6:06:51 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Tab SET IsSingleRow='Y',Updated=TO_TIMESTAMP('2012-03-14 18:06:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000001
;

-- Mar 14, 2012 6:51:46 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Table SET AD_Window_ID=3000000,Updated=TO_TIMESTAMP('2012-03-14 18:51:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000001
;

-- Mar 14, 2012 6:51:54 PM GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Table SET AD_Window_ID=3000001,Updated=TO_TIMESTAMP('2012-03-14 18:51:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000000
;

-- 28/04/2012 15:57:33 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2012-04-28 15:57:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=30000
;

-- 28/04/2012 15:58:21 GMT-03:00
-- Add Fiscal printer configuration
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2012-04-28 15:58:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=30000
;
