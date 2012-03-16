-- Mar 12, 2012 12:58:12 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,IsHighVolume,ImportTable,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','3',0,3000002,'N','N','N','N','N','LAR','Y','Y','L','LAR_DocumentLetter','LAR_DocumentLetter',0,'Y',0,100,TO_TIMESTAMP('2012-03-12 12:58:11','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-12 12:58:11','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 12:58:12 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000002 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- Mar 12, 2012 12:58:12 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,AD_Client_ID,Updated,UpdatedBy,Created,CreatedBy,IsActive) VALUES (1,'N',50000,'Y',1000000,1000000,'N','Y',3000002,'Table LAR_DocumentLetter','LAR_DocumentLetter',0,0,TO_TIMESTAMP('2012-03-12 12:58:12','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-12 12:58:12','YYYY-MM-DD HH24:MI:SS'),100,'Y')
;

-- Mar 12, 2012 1:00:09 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000042,3000002,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,TO_TIMESTAMP('2012-03-12 13:00:08','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-12 13:00:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:00:09 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000042 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 1:00:09 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000043,3000002,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',100,TO_TIMESTAMP('2012-03-12 13:00:09','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-12 13:00:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:00:09 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000043 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 1:00:10 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000044,3000002,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,TO_TIMESTAMP('2012-03-12 13:00:09','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-12 13:00:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:00:10 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000044 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 1:00:10 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000045,3000002,'LAR',0,110,'N','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,TO_TIMESTAMP('2012-03-12 13:00:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-12 13:00:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:00:10 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000045 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 1:00:11 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000046,3000002,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,TO_TIMESTAMP('2012-03-12 13:00:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-12 13:00:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:00:11 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000046 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 1:00:12 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000047,3000002,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,TO_TIMESTAMP('2012-03-12 13:00:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-12 13:00:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:00:12 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000047 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 1:00:12 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000048,3000002,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,TO_TIMESTAMP('2012-03-12 13:00:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-12 13:00:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:00:12 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000048 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 1:00:13 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000019,'LAR_DocumentLetter_ID','LAR','LAR_DocumentLetter','LAR_DocumentLetter',0,TO_TIMESTAMP('2012-03-12 13:00:12','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-03-12 13:00:12','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- Mar 12, 2012 1:00:13 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000019 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Mar 12, 2012 1:00:13 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000049,3000002,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3000019,'N','N','N','LAR_DocumentLetter','LAR_DocumentLetter_ID',100,TO_TIMESTAMP('2012-03-12 13:00:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-12 13:00:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:00:13 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000049 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 1:00:14 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000020,'letter','LAR','letter','letter',0,TO_TIMESTAMP('2012-03-12 13:00:13','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-03-12 13:00:13','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- Mar 12, 2012 1:00:14 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000020 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Mar 12, 2012 1:00:14 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000050,3000002,'LAR',0,'Y','N','N','N',1,'N',20,'N',3000020,'N','Y','N','letter','letter',100,TO_TIMESTAMP('2012-03-12 13:00:13','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-12 13:00:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:00:14 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000050 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 1:00:15 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000051,3000002,'LAR',0,'N','N','N','A description is limited to 255 characters.','N',255,'Y',10,'N',275,'N','Y','N','Optional short description of the record','Description','Description',100,TO_TIMESTAMP('2012-03-12 13:00:14','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-12 13:00:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:00:15 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000051 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 1:00:15 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000052,3000002,'LAR',0,'Y','N','N','The Default Checkbox indicates if this record will be used as a default value.','N',1,'N',20,'N',1103,'N','Y','N','Default value','Default','IsDefault',100,TO_TIMESTAMP('2012-03-12 13:00:15','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-12 13:00:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:00:15 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000052 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 1:01:10 PM ART
-- Fix and improve POS behavior
UPDATE AD_Element SET ColumnName='Letter', Name='Letter', PrintName='Letter',Updated=TO_TIMESTAMP('2012-03-12 13:01:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000020
;

-- Mar 12, 2012 1:01:10 PM ART
-- Fix and improve POS behavior
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000020
;

-- Mar 12, 2012 1:01:10 PM ART
-- Fix and improve POS behavior
UPDATE AD_Column SET ColumnName='Letter', Name='Letter', Description=NULL, Help=NULL WHERE AD_Element_ID=3000020
;

-- Mar 12, 2012 1:01:10 PM ART
-- Fix and improve POS behavior
UPDATE AD_Process_Para SET ColumnName='Letter', Name='Letter', Description=NULL, Help=NULL, AD_Element_ID=3000020 WHERE UPPER(ColumnName)='LETTER' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Mar 12, 2012 1:01:10 PM ART
-- Fix and improve POS behavior
UPDATE AD_Process_Para SET ColumnName='Letter', Name='Letter', Description=NULL, Help=NULL WHERE AD_Element_ID=3000020 AND IsCentrallyMaintained='Y'
;

-- Mar 12, 2012 1:01:10 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET Name='Letter', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000020) AND IsCentrallyMaintained='Y'
;

-- Mar 12, 2012 1:01:10 PM ART
-- Fix and improve POS behavior
UPDATE AD_PrintFormatItem SET PrintName='Letter', Name='Letter' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000020)
;

-- Mar 12, 2012 1:01:59 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000003,'L','LAR','N','LAR_Letters',0,0,100,TO_TIMESTAMP('2012-03-12 13:01:58','YYYY-MM-DD HH24:MI:SS'),'Y',TO_TIMESTAMP('2012-03-12 13:01:58','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:01:59 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000003 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- Mar 12, 2012 1:02:12 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Created,CreatedBy,Updated,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000017,3000003,'LAR','A','A',TO_TIMESTAMP('2012-03-12 13:02:12','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-12 13:02:12','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- Mar 12, 2012 1:02:12 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000017 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Mar 12, 2012 1:02:21 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Created,CreatedBy,Updated,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000018,3000003,'LAR','B','B',TO_TIMESTAMP('2012-03-12 13:02:20','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-12 13:02:20','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- Mar 12, 2012 1:02:21 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000018 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Mar 12, 2012 1:02:28 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Created,CreatedBy,Updated,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000019,3000003,'LAR','C','C',TO_TIMESTAMP('2012-03-12 13:02:27','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-12 13:02:27','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- Mar 12, 2012 1:02:28 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000019 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Mar 12, 2012 1:02:35 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Created,CreatedBy,Updated,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000020,3000003,'LAR','E','E',TO_TIMESTAMP('2012-03-12 13:02:34','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-12 13:02:34','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- Mar 12, 2012 1:02:35 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000020 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Mar 12, 2012 1:03:25 PM ART
-- Fix and improve POS behavior
UPDATE AD_Column SET AD_Reference_Value_ID=3000003, AD_Reference_ID=17,Updated=TO_TIMESTAMP('2012-03-12 13:03:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000050
;

-- Mar 12, 2012 1:04:31 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,IsHighVolume,ImportTable,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','3',0,3000003,'N','N','N','N','N','LAR','Y','Y','L','LAR_LetterRule','LAR_LetterRule',0,'Y',0,100,TO_TIMESTAMP('2012-03-12 13:04:30','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-12 13:04:30','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 1:04:31 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000003 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- Mar 12, 2012 1:04:31 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,AD_Client_ID,Updated,UpdatedBy,Created,CreatedBy,IsActive) VALUES (1,'N',50000,'Y',1000000,1000000,'N','Y',3000003,'Table LAR_LetterRule','LAR_LetterRule',0,0,TO_TIMESTAMP('2012-03-12 13:04:31','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-12 13:04:31','YYYY-MM-DD HH24:MI:SS'),100,'Y')
;

-- Mar 12, 2012 1:04:54 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000053,3000003,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,TO_TIMESTAMP('2012-03-12 13:04:53','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-12 13:04:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:04:54 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000053 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 1:04:54 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000054,3000003,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',100,TO_TIMESTAMP('2012-03-12 13:04:54','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-12 13:04:54','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:04:54 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000054 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 1:04:55 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000055,3000003,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,TO_TIMESTAMP('2012-03-12 13:04:54','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-12 13:04:54','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:04:55 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000055 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 1:04:55 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000056,3000003,'LAR',0,110,'N','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,TO_TIMESTAMP('2012-03-12 13:04:55','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-12 13:04:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:04:55 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000056 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 1:04:56 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000057,3000003,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,TO_TIMESTAMP('2012-03-12 13:04:55','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-12 13:04:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:04:56 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000057 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 1:04:56 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000058,3000003,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,TO_TIMESTAMP('2012-03-12 13:04:56','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-12 13:04:56','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:04:56 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000058 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 1:04:57 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000059,3000003,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,TO_TIMESTAMP('2012-03-12 13:04:56','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-12 13:04:56','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:04:57 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000059 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 1:04:57 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000021,'LAR_LetterRule_ID','LAR','LAR_LetterRule','LAR_LetterRule',0,TO_TIMESTAMP('2012-03-12 13:04:57','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-03-12 13:04:57','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- Mar 12, 2012 1:04:57 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000021 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Mar 12, 2012 1:04:58 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000060,3000003,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3000021,'N','N','N','LAR_LetterRule','LAR_LetterRule_ID',100,TO_TIMESTAMP('2012-03-12 13:04:57','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-12 13:04:57','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:04:58 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000060 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 1:04:58 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000061,3000003,'LAR',0,'Y','N','N','N',10,'N',19,'N',3000019,'N','Y','N','LAR_DocumentLetter','LAR_DocumentLetter_ID',100,TO_TIMESTAMP('2012-03-12 13:04:58','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-12 13:04:58','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:04:58 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000061 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 1:04:59 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000022,'lco_taxpayertype_vendor_id','LAR','lco_taxpayertype_vendor_id','lco_taxpayertype_vendor_id',0,TO_TIMESTAMP('2012-03-12 13:04:58','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-03-12 13:04:58','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- Mar 12, 2012 1:04:59 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000022 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Mar 12, 2012 1:04:59 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000062,3000003,'LAR',0,'Y','N','N','N',10,'N',19,'N',3000022,'N','Y','N','lco_taxpayertype_vendor_id','lco_taxpayertype_vendor_id',100,TO_TIMESTAMP('2012-03-12 13:04:58','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-12 13:04:58','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:04:59 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000062 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 1:05:00 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000023,'lco_taxpayertype_customer_id','LAR','lco_taxpayertype_customer_id','lco_taxpayertype_customer_id',0,TO_TIMESTAMP('2012-03-12 13:04:59','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-03-12 13:04:59','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- Mar 12, 2012 1:05:00 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000023 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Mar 12, 2012 1:05:00 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000063,3000003,'LAR',0,'Y','N','N','N',10,'N',19,'N',3000023,'N','Y','N','lco_taxpayertype_customer_id','lco_taxpayertype_customer_id',100,TO_TIMESTAMP('2012-03-12 13:04:59','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-12 13:04:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:05:00 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000063 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 1:05:01 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000064,3000003,'LAR',0,'N','N','N','The Maximum Amount indicates the maximum amount in invoice currency.','N',131089,'N',12,'N',937,'N','Y','N','Maximum Amount in invoice currency','Max Amount','MaxAmt',100,TO_TIMESTAMP('2012-03-12 13:05:00','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-12 13:05:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:05:01 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000064 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 1:06:06 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000004,'T','LAR','N','LAR_DocumentLetter_ID',0,0,100,TO_TIMESTAMP('2012-03-12 13:06:05','YYYY-MM-DD HH24:MI:SS'),'Y',TO_TIMESTAMP('2012-03-12 13:06:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:06:06 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000004 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- Mar 12, 2012 1:13:21 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Ref_Table (IsValueDisplayed,WhereClause,OrderByClause,AD_Table_ID,AD_Reference_ID,AD_Key,AD_Display,EntityType,CreatedBy,Updated,Created,AD_Client_ID,UpdatedBy,AD_Org_ID,IsActive) VALUES ('N','LAR_DocumentLetter.IsActive=''Y''','LAR_DocumentLetter.Letter',3000002,3000004,3000049,3000050,'LAR',100,TO_TIMESTAMP('2012-03-12 13:13:21','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-03-12 13:13:21','YYYY-MM-DD HH24:MI:SS'),0,100,0,'Y')
;

-- Mar 12, 2012 1:14:25 PM ART
-- Fix and improve POS behavior
UPDATE AD_Column SET AD_Reference_Value_ID=3000004, AD_Reference_ID=18,Updated=TO_TIMESTAMP('2012-03-12 13:14:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000061
;

-- Mar 12, 2012 1:15:27 PM ART
-- Fix and improve POS behavior
UPDATE AD_Element SET ColumnName='LCO_TaxPayerType_Customer_ID', Name='LCO_TaxPayerType_Customer_ID', PrintName='LCO_TaxPayerType_Customer_ID',Updated=TO_TIMESTAMP('2012-03-12 13:15:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000023
;

-- Mar 12, 2012 1:15:27 PM ART
-- Fix and improve POS behavior
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000023
;

-- Mar 12, 2012 1:15:27 PM ART
-- Fix and improve POS behavior
UPDATE AD_Column SET ColumnName='LCO_TaxPayerType_Customer_ID', Name='LCO_TaxPayerType_Customer_ID', Description=NULL, Help=NULL WHERE AD_Element_ID=3000023
;

-- Mar 12, 2012 1:15:27 PM ART
-- Fix and improve POS behavior
UPDATE AD_Process_Para SET ColumnName='LCO_TaxPayerType_Customer_ID', Name='LCO_TaxPayerType_Customer_ID', Description=NULL, Help=NULL, AD_Element_ID=3000023 WHERE UPPER(ColumnName)='LCO_TAXPAYERTYPE_CUSTOMER_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Mar 12, 2012 1:15:27 PM ART
-- Fix and improve POS behavior
UPDATE AD_Process_Para SET ColumnName='LCO_TaxPayerType_Customer_ID', Name='LCO_TaxPayerType_Customer_ID', Description=NULL, Help=NULL WHERE AD_Element_ID=3000023 AND IsCentrallyMaintained='Y'
;

-- Mar 12, 2012 1:15:27 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET Name='LCO_TaxPayerType_Customer_ID', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000023) AND IsCentrallyMaintained='Y'
;

-- Mar 12, 2012 1:15:27 PM ART
-- Fix and improve POS behavior
UPDATE AD_PrintFormatItem SET PrintName='LCO_TaxPayerType_Customer_ID', Name='LCO_TaxPayerType_Customer_ID' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000023)
;

-- Mar 12, 2012 1:16:02 PM ART
-- Fix and improve POS behavior
UPDATE AD_Column SET AD_Reference_Value_ID=1000002, AD_Reference_ID=18,Updated=TO_TIMESTAMP('2012-03-12 13:16:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000063
;

-- Mar 12, 2012 1:16:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Element SET ColumnName='LCO_TaxPayerType_Vendor_ID', Name='LCO_TaxPayerType_Vendor_ID', PrintName='LCO_TaxPayerType_Vendor_ID',Updated=TO_TIMESTAMP('2012-03-12 13:16:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000022
;

-- Mar 12, 2012 1:16:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000022
;

-- Mar 12, 2012 1:16:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Column SET ColumnName='LCO_TaxPayerType_Vendor_ID', Name='LCO_TaxPayerType_Vendor_ID', Description=NULL, Help=NULL WHERE AD_Element_ID=3000022
;

-- Mar 12, 2012 1:16:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Process_Para SET ColumnName='LCO_TaxPayerType_Vendor_ID', Name='LCO_TaxPayerType_Vendor_ID', Description=NULL, Help=NULL, AD_Element_ID=3000022 WHERE UPPER(ColumnName)='LCO_TAXPAYERTYPE_VENDOR_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Mar 12, 2012 1:16:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Process_Para SET ColumnName='LCO_TaxPayerType_Vendor_ID', Name='LCO_TaxPayerType_Vendor_ID', Description=NULL, Help=NULL WHERE AD_Element_ID=3000022 AND IsCentrallyMaintained='Y'
;

-- Mar 12, 2012 1:16:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET Name='LCO_TaxPayerType_Vendor_ID', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000022) AND IsCentrallyMaintained='Y'
;

-- Mar 12, 2012 1:16:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_PrintFormatItem SET PrintName='LCO_TaxPayerType_Vendor_ID', Name='LCO_TaxPayerType_Vendor_ID' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000022)
;

-- Mar 12, 2012 1:16:47 PM ART
-- Fix and improve POS behavior
UPDATE AD_Column SET AD_Reference_Value_ID=1000002, AD_Reference_ID=18,Updated=TO_TIMESTAMP('2012-03-12 13:16:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000062
;

-- Mar 12, 2012 1:17:43 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000024,'issalewithoutstock','LAR','issalewithoutstock','issalewithoutstock',0,TO_TIMESTAMP('2012-03-12 13:17:43','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-03-12 13:17:43','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- Mar 12, 2012 1:17:43 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000024 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Mar 12, 2012 1:17:44 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000065,748,'LAR',0,'Y','N','N','N',1,'N',20,'N',3000024,'N','Y','N','issalewithoutstock','issalewithoutstock',100,TO_TIMESTAMP('2012-03-12 13:17:43','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-12 13:17:43','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:17:44 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000065 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 1:17:44 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000025,'posnumber','LAR','posnumber','posnumber',0,TO_TIMESTAMP('2012-03-12 13:17:44','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-03-12 13:17:44','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- Mar 12, 2012 1:17:44 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000025 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Mar 12, 2012 1:17:45 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000066,748,'LAR',0,'Y','N','N','N',4,'N',22,'N',3000025,'N','Y','N','posnumber','posnumber',100,TO_TIMESTAMP('2012-03-12 13:17:44','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-12 13:17:44','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:17:45 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000066 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 1:18:11 PM ART
-- Fix and improve POS behavior
UPDATE AD_Element SET ColumnName='PosNumber', Name='PosNumber', PrintName='PosNumber',Updated=TO_TIMESTAMP('2012-03-12 13:18:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000025
;

-- Mar 12, 2012 1:18:11 PM ART
-- Fix and improve POS behavior
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000025
;

-- Mar 12, 2012 1:18:11 PM ART
-- Fix and improve POS behavior
UPDATE AD_Column SET ColumnName='PosNumber', Name='PosNumber', Description=NULL, Help=NULL WHERE AD_Element_ID=3000025
;

-- Mar 12, 2012 1:18:11 PM ART
-- Fix and improve POS behavior
UPDATE AD_Process_Para SET ColumnName='PosNumber', Name='PosNumber', Description=NULL, Help=NULL, AD_Element_ID=3000025 WHERE UPPER(ColumnName)='POSNUMBER' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Mar 12, 2012 1:18:11 PM ART
-- Fix and improve POS behavior
UPDATE AD_Process_Para SET ColumnName='PosNumber', Name='PosNumber', Description=NULL, Help=NULL WHERE AD_Element_ID=3000025 AND IsCentrallyMaintained='Y'
;

-- Mar 12, 2012 1:18:11 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET Name='PosNumber', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000025) AND IsCentrallyMaintained='Y'
;

-- Mar 12, 2012 1:18:12 PM ART
-- Fix and improve POS behavior
UPDATE AD_PrintFormatItem SET PrintName='PosNumber', Name='PosNumber' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000025)
;

-- Mar 12, 2012 1:18:25 PM ART
-- Fix and improve POS behavior
UPDATE AD_Column SET AD_Reference_ID=11,Updated=TO_TIMESTAMP('2012-03-12 13:18:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000066
;

-- Mar 12, 2012 1:19:06 PM ART
-- Fix and improve POS behavior
UPDATE AD_Element SET ColumnName='IsSaleWithoutStock', Name='IsSaleWithoutStock', PrintName='IsSaleWithoutStock',Updated=TO_TIMESTAMP('2012-03-12 13:19:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000024
;

-- Mar 12, 2012 1:19:06 PM ART
-- Fix and improve POS behavior
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000024
;

-- Mar 12, 2012 1:19:06 PM ART
-- Fix and improve POS behavior
UPDATE AD_Column SET ColumnName='IsSaleWithoutStock', Name='IsSaleWithoutStock', Description=NULL, Help=NULL WHERE AD_Element_ID=3000024
;

-- Mar 12, 2012 1:19:06 PM ART
-- Fix and improve POS behavior
UPDATE AD_Process_Para SET ColumnName='IsSaleWithoutStock', Name='IsSaleWithoutStock', Description=NULL, Help=NULL, AD_Element_ID=3000024 WHERE UPPER(ColumnName)='ISSALEWITHOUTSTOCK' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Mar 12, 2012 1:19:06 PM ART
-- Fix and improve POS behavior
UPDATE AD_Process_Para SET ColumnName='IsSaleWithoutStock', Name='IsSaleWithoutStock', Description=NULL, Help=NULL WHERE AD_Element_ID=3000024 AND IsCentrallyMaintained='Y'
;

-- Mar 12, 2012 1:19:06 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET Name='IsSaleWithoutStock', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000024) AND IsCentrallyMaintained='Y'
;

-- Mar 12, 2012 1:19:06 PM ART
-- Fix and improve POS behavior
UPDATE AD_PrintFormatItem SET PrintName='IsSaleWithoutStock', Name='IsSaleWithoutStock' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000024)
;

-- Mar 12, 2012 1:19:40 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000067,318,'LAR',0,'N','N','N','N',10,'N',19,'N',3000019,'N','Y','N','LAR_DocumentLetter','LAR_DocumentLetter_ID',100,TO_TIMESTAMP('2012-03-12 13:19:39','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-12 13:19:39','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:19:40 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000067 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 1:19:41 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000068,318,'LAR',0,'N','N','N','The POS Terminal defines the defaults and functions available for the POS Form','N',10,'N',19,'N',2581,'N','Y','N','Point of Sales Terminal','POS Terminal','C_POS_ID',100,TO_TIMESTAMP('2012-03-12 13:19:40','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-12 13:19:40','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:19:41 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000068 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 1:20:28 PM ART
-- Fix and improve POS behavior
UPDATE AD_Column SET AD_Reference_Value_ID=3000004, AD_Reference_ID=18,Updated=TO_TIMESTAMP('2012-03-12 13:20:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000067
;

-- Mar 12, 2012 1:21:29 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000005,'T','LAR','N','LAR_POS_ID',0,0,100,TO_TIMESTAMP('2012-03-12 13:21:29','YYYY-MM-DD HH24:MI:SS'),'Y',TO_TIMESTAMP('2012-03-12 13:21:29','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:21:29 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000005 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- Mar 12, 2012 1:22:24 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Ref_Table (IsValueDisplayed,WhereClause,OrderByClause,AD_Table_ID,AD_Reference_ID,AD_Key,AD_Display,EntityType,CreatedBy,Updated,Created,AD_Client_ID,UpdatedBy,AD_Org_ID,IsActive) VALUES ('N','C_POS.IsActive=''Y''','C_POS.PosNumber',748,3000005,12745,3000066,'LAR',100,TO_TIMESTAMP('2012-03-12 13:22:24','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-03-12 13:22:24','YYYY-MM-DD HH24:MI:SS'),0,100,0,'Y')
;

-- Mar 12, 2012 1:22:37 PM ART
-- Fix and improve POS behavior
UPDATE AD_Column SET AD_Reference_Value_ID=3000005, AD_Reference_ID=18,Updated=TO_TIMESTAMP('2012-03-12 13:22:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000068
;

-- Mar 12, 2012 1:23:46 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000069,217,'LAR',0,'N','N','N','N',10,'N',19,'N',3000019,'N','Y','N','LAR_DocumentLetter','LAR_DocumentLetter_ID',100,TO_TIMESTAMP('2012-03-12 13:23:45','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-12 13:23:45','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:23:46 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000069 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 1:23:46 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000070,217,'LAR',0,'N','N','N','The POS Terminal defines the defaults and functions available for the POS Form','N',10,'N',19,'N',2581,'N','Y','N','Point of Sales Terminal','POS Terminal','C_POS_ID',100,TO_TIMESTAMP('2012-03-12 13:23:46','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-12 13:23:46','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 12, 2012 1:23:46 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000070 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 12, 2012 1:24:02 PM ART
-- Fix and improve POS behavior
UPDATE AD_Column SET AD_Reference_Value_ID=3000005, AD_Reference_ID=18,Updated=TO_TIMESTAMP('2012-03-12 13:24:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000070
;

-- Mar 12, 2012 1:25:07 PM ART
-- Fix and improve POS behavior
UPDATE AD_Column SET AD_Reference_Value_ID=3000004, AD_Reference_ID=18,Updated=TO_TIMESTAMP('2012-03-12 13:25:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000069
;

-- Mar 12, 2012 1:26:01 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000038,10,'Y','N','N',3000069,'N','Y',167,'N','LAR','LAR_DocumentLetter',100,0,'Y',TO_TIMESTAMP('2012-03-12 13:26:00','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-12 13:26:00','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 1:26:01 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000038 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 1:26:01 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000039,10,'Y','N','N',3000070,'N','Y',167,'N','The POS Terminal defines the defaults and functions available for the POS Form','LAR','Point of Sales Terminal','POS Terminal',100,0,'Y',TO_TIMESTAMP('2012-03-12 13:26:01','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-12 13:26:01','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 1:26:01 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000039 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 1:28:08 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=1000015
;

-- Mar 12, 2012 1:28:08 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000039
;

-- Mar 12, 2012 1:28:08 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000032
;

-- Mar 12, 2012 1:28:08 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000038
;

-- Mar 12, 2012 1:28:08 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000031
;

-- Mar 12, 2012 1:28:08 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000036
;

-- Mar 12, 2012 1:28:08 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000035
;

-- Mar 12, 2012 1:28:08 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000037
;

-- Mar 12, 2012 1:28:08 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000030
;

-- Mar 12, 2012 1:28:08 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000034
;

-- Mar 12, 2012 1:28:30 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2012-03-12 13:28:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000038
;

-- Mar 12, 2012 1:29:18 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2012-03-12 13:29:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000019
;

-- Mar 12, 2012 1:30:15 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000040,10,'Y','N','N',3000067,'N','Y',263,'N','LAR','LAR_DocumentLetter',100,0,'Y',TO_TIMESTAMP('2012-03-12 13:30:11','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-12 13:30:11','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 1:30:15 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000040 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 1:30:15 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000041,10,'Y','N','N',3000068,'N','Y',263,'N','The POS Terminal defines the defaults and functions available for the POS Form','LAR','Point of Sales Terminal','POS Terminal',100,0,'Y',TO_TIMESTAMP('2012-03-12 13:30:15','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-12 13:30:15','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 1:30:15 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000041 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 1:34:32 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000040
;

-- Mar 12, 2012 1:34:32 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=6565
;

-- Mar 12, 2012 1:34:32 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=2958
;

-- Mar 12, 2012 1:34:32 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=2776
;

-- Mar 12, 2012 1:34:32 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3000041
;

-- Mar 12, 2012 1:34:32 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=2954
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=2765
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=2961
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=2770
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=8648
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=2763
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3273
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=2953
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=2956
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3112
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=2774
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=2775
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=2764
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=2768
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=6935
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=7794
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=7795
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=2786
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=2780
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=2778
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=2771
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=8657
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=10485
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=1000016
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=1000017
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=6564
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=2777
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3663
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3899
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=13700
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=53257
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=53258
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=60970
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000027
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000028
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000025
;

-- Mar 12, 2012 1:34:33 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000026
;

-- Mar 12, 2012 1:37:18 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,Updated,UpdatedBy,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('C_DocType.DocBaseType IN (''ARI'', ''API'',''ARC'',''APC'') AND ((C_DocType.C_DocType_ID IN (SELECT C_DocType_ID FROM C_DocType WHERE C_DocType.DocBaseType IN (''ARI'', ''ARC'') AND C_DocType.C_POS_ID=@C_POS_ID@ AND C_DocType.LAR_DocumentLetter_ID=(SELECT L.LAR_DocumentLetter_ID FROM LAR_DocumentLetter L JOIN LAR_LetterRule R ON R.LAR_DocumentLetter_ID = L.LAR_DocumentLetter_ID WHERE R.LCO_TaxPayerType_Customer_ID=(SELECT LCO_TaxPayerType_ID FROM C_BPartner WHERE C_BPartner_ID=@C_BPartner_ID@) AND R.LCO_TaxPayerType_Vendor_ID=(SELECT LCO_TaxPayerType_ID FROM AD_OrgInfo WHERE AD_Org_ID=@#AD_Org_ID@))) AND ''@IsSOTrx@''=''Y'') OR (C_DocType.C_DocType_ID IN (SELECT C_DocType_ID FROM C_DocType WHERE C_DocType.DocBaseType IN (''API'', ''APC'')) AND ''@IsSOTrx@''=''N''))','S',3000000,'LAR','LAR_DocTypes_For_Customer_Invoices',100,TO_TIMESTAMP('2012-03-12 13:37:17','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0,TO_TIMESTAMP('2012-03-12 13:37:17','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 1:37:37 PM ART
-- Fix and improve POS behavior
UPDATE AD_Column SET AD_Val_Rule_ID=3000000,Updated=TO_TIMESTAMP('2012-03-12 13:37:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3781
;

-- Mar 12, 2012 1:42:05 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Window (AD_Window_ID,WindowType,IsSOTrx,IsDefault,IsBetaFunctionality,WinHeight,WinWidth,EntityType,Name,IsActive,Created,UpdatedBy,CreatedBy,Updated,AD_Org_ID,AD_Client_ID,Processing) VALUES (3000002,'M','N','N','N',0,0,'LAR','Document Letter','Y',TO_TIMESTAMP('2012-03-12 13:42:05','YYYY-MM-DD HH24:MI:SS'),100,100,TO_TIMESTAMP('2012-03-12 13:42:05','YYYY-MM-DD HH24:MI:SS'),0,0,'N')
;

-- Mar 12, 2012 1:42:05 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Window_Trl (AD_Language,AD_Window_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Window_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Window t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Window_ID=3000002 AND NOT EXISTS (SELECT * FROM AD_Window_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Window_ID=t.AD_Window_ID)
;

-- Mar 12, 2012 1:42:32 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('N',3000002,10,'N','N',3000002,3000002,'N','N','N','N',0,'Y','N','LAR','Document Letter',0,0,TO_TIMESTAMP('2012-03-12 13:42:31','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-12 13:42:31','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- Mar 12, 2012 1:42:32 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000002 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- Mar 12, 2012 1:42:40 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000042,1,'Y','N','N',3000048,'N','Y',3000002,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,'Y',TO_TIMESTAMP('2012-03-12 13:42:39','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-12 13:42:39','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 1:42:40 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000042 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 1:42:40 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000043,10,'Y','N','N',3000042,'N','Y',3000002,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,'Y',TO_TIMESTAMP('2012-03-12 13:42:40','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-12 13:42:40','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 1:42:40 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000043 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 1:42:41 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000044,1,'Y','N','N',3000052,'N','Y',3000002,'N','The Default Checkbox indicates if this record will be used as a default value.','LAR','Default value','Default',100,0,'Y',TO_TIMESTAMP('2012-03-12 13:42:40','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-12 13:42:40','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 1:42:41 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000044 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 1:42:42 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000045,255,'Y','N','N',3000051,'N','Y',3000002,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,'Y',TO_TIMESTAMP('2012-03-12 13:42:41','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-12 13:42:41','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 1:42:42 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000045 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 1:42:42 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000046,10,'N','N','N',3000049,'N','Y',3000002,'N','LAR','LAR_DocumentLetter',100,0,'Y',TO_TIMESTAMP('2012-03-12 13:42:42','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-12 13:42:42','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 1:42:42 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000046 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 1:42:43 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000047,1,'Y','N','N',3000050,'N','Y',3000002,'N','LAR','Letter',100,0,'Y',TO_TIMESTAMP('2012-03-12 13:42:42','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-12 13:42:42','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 1:42:43 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000047 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 1:42:43 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000048,10,'Y','N','N',3000043,'N','Y',3000002,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,'Y',TO_TIMESTAMP('2012-03-12 13:42:43','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-12 13:42:43','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 1:42:43 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000048 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 1:43:06 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3000043
;

-- Mar 12, 2012 1:43:06 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3000048
;

-- Mar 12, 2012 1:43:06 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3000042
;

-- Mar 12, 2012 1:43:06 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3000047
;

-- Mar 12, 2012 1:43:06 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3000045
;

-- Mar 12, 2012 1:43:06 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3000044
;

-- Mar 12, 2012 1:43:16 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2012-03-12 13:43:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000048
;

-- Mar 12, 2012 1:46:17 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,AD_Column_ID,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('N',3000002,20,'N','N',3000003,3000003,'N','N','N','N',3000061,1,'Y','N','LAR','Letter Rule',0,0,TO_TIMESTAMP('2012-03-12 13:46:16','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-12 13:46:16','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- Mar 12, 2012 1:46:17 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000003 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- Mar 12, 2012 1:46:24 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000049,1,'Y','N','N',3000059,'N','Y',3000003,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,'Y',TO_TIMESTAMP('2012-03-12 13:46:23','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-12 13:46:23','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 1:46:24 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000049 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 1:46:24 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000050,10,'Y','N','N',3000053,'N','Y',3000003,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,'Y',TO_TIMESTAMP('2012-03-12 13:46:24','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-12 13:46:24','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 1:46:24 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000050 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 1:46:25 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000051,10,'Y','N','N',3000061,'N','Y',3000003,'N','LAR','LAR_DocumentLetter',100,0,'Y',TO_TIMESTAMP('2012-03-12 13:46:24','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-12 13:46:24','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 1:46:25 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000051 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 1:46:25 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000052,10,'N','N','N',3000060,'N','Y',3000003,'N','LAR','LAR_LetterRule',100,0,'Y',TO_TIMESTAMP('2012-03-12 13:46:25','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-12 13:46:25','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 1:46:25 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000052 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 1:46:26 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000053,10,'Y','N','N',3000063,'N','Y',3000003,'N','LAR','LCO_TaxPayerType_Customer_ID',100,0,'Y',TO_TIMESTAMP('2012-03-12 13:46:25','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-12 13:46:25','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 1:46:26 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000053 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 1:46:26 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000054,10,'Y','N','N',3000062,'N','Y',3000003,'N','LAR','LCO_TaxPayerType_Vendor_ID',100,0,'Y',TO_TIMESTAMP('2012-03-12 13:46:26','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-12 13:46:26','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 1:46:26 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000054 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 1:46:27 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000055,131089,'Y','N','N',3000064,'N','Y',3000003,'N','The Maximum Amount indicates the maximum amount in invoice currency.','LAR','Maximum Amount in invoice currency','Max Amount',100,0,'Y',TO_TIMESTAMP('2012-03-12 13:46:26','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-12 13:46:26','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 1:46:27 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000055 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 1:46:27 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000056,10,'Y','N','N',3000054,'N','Y',3000003,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,'Y',TO_TIMESTAMP('2012-03-12 13:46:27','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-12 13:46:27','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 12, 2012 1:46:27 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000056 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 12, 2012 1:48:00 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3000050
;

-- Mar 12, 2012 1:48:00 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3000056
;

-- Mar 12, 2012 1:48:00 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3000049
;

-- Mar 12, 2012 1:48:00 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3000051
;

-- Mar 12, 2012 1:48:00 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3000053
;

-- Mar 12, 2012 1:48:00 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3000054
;

-- Mar 12, 2012 1:48:00 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3000055
;

-- Mar 12, 2012 1:48:07 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2012-03-12 13:48:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000056
;

-- Mar 12, 2012 1:48:54 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3000054
;

-- Mar 12, 2012 1:48:54 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3000053
;

-- Mar 12, 2012 1:49:10 PM ART
-- Fix and improve POS behavior
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2012-03-12 13:49:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000053
;

-- Mar 12, 2012 2:12:24 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Menu (AD_Window_ID,AD_Menu_ID,IsSummary,"action",IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000002,3000005,'N','W','N','N','LAR','Y','Document Letter',TO_TIMESTAMP('2012-03-12 14:12:24','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_TIMESTAMP('2012-03-12 14:12:24','YYYY-MM-DD HH24:MI:SS'),0)
;

-- Mar 12, 2012 2:12:24 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000005 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- Mar 12, 2012 2:12:24 PM ART
-- Fix and improve POS behavior
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100,t.AD_Tree_ID, 3000005, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000005)
;

-- Mar 12, 2012 2:12:29 PM ART
-- Fix and improve POS behavior
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000005
;

-- Mar 12, 2012 2:12:29 PM ART
-- Fix and improve POS behavior
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000005
;

-- Mar 12, 2012 2:12:29 PM ART
-- Fix and improve POS behavior
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000002
;

-- Mar 12, 2012 2:12:29 PM ART
-- Fix and improve POS behavior
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000001
;

-- Mar 12, 2012 2:12:29 PM ART
-- Fix and improve POS behavior
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000003
;

-- Mar 12, 2012 2:12:29 PM ART
-- Fix and improve POS behavior
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000004
;

-- Mar 14, 2012 5:56:07 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000084,1,'Y','N','N',3000065,'N','Y',676,'N','LAR','IsSaleWithoutStock',100,0,'Y',TO_TIMESTAMP('2012-03-14 17:56:02','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-14 17:56:02','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 14, 2012 5:56:07 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000084 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 14, 2012 5:56:08 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000085,4,'Y','N','N',3000066,'N','Y',676,'N','LAR','PosNumber',100,0,'Y',TO_TIMESTAMP('2012-03-14 17:56:07','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-14 17:56:07','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 14, 2012 5:56:08 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000085 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 14, 2012 5:58:37 PM GMT-03:00
-- Fix and improve POS behavior
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2012-03-14 17:58:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000085
;

-- Mar 14, 2012 6:03:21 PM GMT-03:00
-- Fix and improve POS behavior
UPDATE AD_Tab SET IsSingleRow='Y',Updated=TO_TIMESTAMP('2012-03-14 18:03:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000002
;

-- Mar 14, 2012 6:03:24 PM GMT-03:00
-- Fix and improve POS behavior
UPDATE AD_Tab SET IsSingleRow='Y',Updated=TO_TIMESTAMP('2012-03-14 18:03:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000003
;

-- Mar 14, 2012 6:12:41 PM GMT-03:00
-- Fix and improve POS behavior
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2012-03-14 18:12:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000055
;

-- Mar 14, 2012 7:01:33 PM GMT-03:00
-- Fix and improve POS behavior
UPDATE AD_Table SET AD_Window_ID=3000002,Updated=TO_TIMESTAMP('2012-03-14 19:01:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000002
;

-- Mar 15, 2012 5:18:44 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,IsHighVolume,ImportTable,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Name,AD_Client_ID,IsActive,AD_Org_ID,Updated,CreatedBy,UpdatedBy,Created) VALUES ('N','3',0,3000006,'N','N','N','N','N','LAR','Y','Y','L','LAR_OrderPerception','LAR_OrderPerception',0,'Y',0,TO_TIMESTAMP('2012-03-15 17:18:43','YYYY-MM-DD HH24:MI:SS'),100,100,TO_TIMESTAMP('2012-03-15 17:18:43','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 15, 2012 5:18:44 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000006 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- Mar 15, 2012 5:18:45 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,CreatedBy,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,AD_Client_ID,Updated,UpdatedBy,Created,IsActive) VALUES (1,'N',50000,'Y',100,1000000,1000000,'N','Y',3000006,'Table LAR_OrderPerception','LAR_OrderPerception',0,0,TO_TIMESTAMP('2012-03-15 17:18:44','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-03-15 17:18:44','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- Mar 15, 2012 5:18:58 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Element (ColumnName,AD_Element_ID,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES ('LAR_OrderPerception_ID',3000031,'LAR','LAR_OrderPerception','LAR_OrderPerception',0,TO_TIMESTAMP('2012-03-15 17:18:58','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-03-15 17:18:58','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- Mar 15, 2012 5:18:58 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000031 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Mar 15, 2012 5:18:58 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000119,3000006,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3000031,'N','N','N','LAR_OrderPerception','LAR_OrderPerception_ID',100,TO_TIMESTAMP('2012-03-15 17:18:58','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-15 17:18:58','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 15, 2012 5:18:58 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000119 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 15, 2012 5:18:59 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000120,3000006,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,TO_TIMESTAMP('2012-03-15 17:18:58','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-15 17:18:58','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 15, 2012 5:18:59 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000120 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 15, 2012 5:18:59 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000121,3000006,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',100,TO_TIMESTAMP('2012-03-15 17:18:59','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-15 17:18:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 15, 2012 5:18:59 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000121 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 15, 2012 5:18:59 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000122,3000006,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,TO_TIMESTAMP('2012-03-15 17:18:59','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-15 17:18:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 15, 2012 5:18:59 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000122 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 15, 2012 5:18:59 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000123,3000006,'LAR',0,110,'Y','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,TO_TIMESTAMP('2012-03-15 17:18:59','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-15 17:18:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 15, 2012 5:18:59 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000123 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 15, 2012 5:19:00 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000124,3000006,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,TO_TIMESTAMP('2012-03-15 17:18:59','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-15 17:18:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 15, 2012 5:19:00 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000124 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 15, 2012 5:19:00 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000125,3000006,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,TO_TIMESTAMP('2012-03-15 17:19:00','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-15 17:19:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 15, 2012 5:19:00 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000125 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 15, 2012 5:19:00 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000126,3000006,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,TO_TIMESTAMP('2012-03-15 17:19:00','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-15 17:19:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 15, 2012 5:19:00 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000126 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 15, 2012 5:19:00 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000127,3000006,'LAR',0,'Y','N','N','The Order is a control document.  The  Order is complete when the quantity ordered is the same as the quantity shipped and invoiced.  When you close an order, unshipped (backordered) quantities are cancelled.','N',10,'N',19,'N',558,'N','Y','N','Order','Order','C_Order_ID',100,TO_TIMESTAMP('2012-03-15 17:19:00','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-15 17:19:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 15, 2012 5:19:00 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000127 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 15, 2012 5:19:01 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000128,3000006,'LAR',0,'N','N','N','The Tax indicates the type of tax used in document line.','N',10,'N',19,'N',213,'N','Y','N','Tax identifier','Tax','C_Tax_ID',100,TO_TIMESTAMP('2012-03-15 17:19:00','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-15 17:19:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 15, 2012 5:19:01 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000128 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 15, 2012 5:19:01 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000129,3000006,'LAR',0,'N','N','N','N',10,'N',19,'N',1000027,'N','Y','N','Withholding Rule','LCO_WithholdingRule_ID',100,TO_TIMESTAMP('2012-03-15 17:19:01','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-15 17:19:01','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 15, 2012 5:19:01 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000129 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 15, 2012 5:19:01 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000130,3000006,'LAR',0,'Y','N','N','N',10,'N',19,'N',1000028,'N','Y','N','Withholding Type','LCO_WithholdingType_ID',100,TO_TIMESTAMP('2012-03-15 17:19:01','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-15 17:19:01','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 15, 2012 5:19:01 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000130 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 15, 2012 5:19:01 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000131,3000006,'LAR',0,'N','N','N','The Accounting Date indicates the date to be used on the General Ledger account entries generated from this document. It is also used for any currency conversion.','N',29,'N',16,'N',263,'N','Y','N','Accounting Date','Account Date','DateAcct',100,TO_TIMESTAMP('2012-03-15 17:19:01','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-15 17:19:01','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 15, 2012 5:19:01 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000131 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 15, 2012 5:19:02 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000132,3000006,'LAR',0,'N','N','N','The Transaction Date indicates the date of the transaction.','N',29,'N',16,'N',1297,'N','Y','N','Transaction Date','Transaction Date','DateTrx',100,TO_TIMESTAMP('2012-03-15 17:19:01','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-15 17:19:01','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 15, 2012 5:19:02 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000132 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 15, 2012 5:19:02 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000133,3000006,'LAR',0,'N','N','N','N',1,'N',20,'N',1000005,'N','Y','N','Is Calc On Payment','IsCalcOnPayment',100,TO_TIMESTAMP('2012-03-15 17:19:02','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-15 17:19:02','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 15, 2012 5:19:02 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000133 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 15, 2012 5:19:02 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000134,3000006,'LAR',0,'Y','N','N','The Tax Included checkbox indicates if the prices include tax.  This is also known as the gross price.','N',1,'N',20,'N',1065,'N','Y','N','Tax is included in the price ','Price includes Tax','IsTaxIncluded',100,TO_TIMESTAMP('2012-03-15 17:19:02','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-15 17:19:02','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 15, 2012 5:19:02 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000134 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 15, 2012 5:19:02 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000135,3000006,'LAR',0,'N','N','N','The Percent indicates the percentage used.','N',131089,'N',22,'N',951,'N','Y','N','Percentage','Percent','Percent',100,TO_TIMESTAMP('2012-03-15 17:19:02','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-15 17:19:02','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 15, 2012 5:19:02 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000135 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 15, 2012 5:19:03 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000136,3000006,'LAR',0,'Y','N','N','The Processed checkbox indicates that a document has been processed.','N',1,'N',20,'N',1047,'N','Y','N','The document has been processed','Processed','Processed',100,TO_TIMESTAMP('2012-03-15 17:19:02','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-15 17:19:02','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 15, 2012 5:19:03 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000136 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 15, 2012 5:19:03 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000137,3000006,'LAR',0,'Y','N','N','The Tax Amount displays the total tax amount for a document.','N',131089,'N',12,'N',1133,'N','Y','N','Tax Amount for a document','Tax Amount','TaxAmt',100,TO_TIMESTAMP('2012-03-15 17:19:03','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-15 17:19:03','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 15, 2012 5:19:03 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000137 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 15, 2012 5:19:03 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000138,3000006,'LAR',0,'Y','N','N','The Tax Base Amount indicates the base amount used for calculating the tax amount.','N',131089,'N',12,'N',1134,'N','Y','N','Base for calculating the tax amount','Tax base Amount','TaxBaseAmt',100,TO_TIMESTAMP('2012-03-15 17:19:03','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-15 17:19:03','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 15, 2012 5:19:03 PM GMT-03:00
-- Fix and improve POS behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000138 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;
