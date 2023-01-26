CREATE TABLE IF NOT EXISTS LAR_TerminalPostnet
(
    LAR_TerminalPostnet_ID numeric(10,0) NOT NULL,
    AD_Client_ID numeric(10,0) NOT NULL,
    AD_Org_ID numeric(10,0) NOT NULL,
    IsActive character(1) COLLATE pg_catalog."default" NOT NULL DEFAULT 'Y'::bpchar,
    Created timestamp without time zone NOT NULL DEFAULT now(),
    CreatedBy numeric(10,0) NOT NULL,
    Updated timestamp without time zone NOT NULL DEFAULT now(),
    UpdatedBy numeric(10,0) NOT NULL,
    Marca character varying(60) COLLATE pg_catalog."default" NOT NULL,
    Modelo character varying(60) COLLATE pg_catalog."default" NOT NULL,
    NroEstablecimiento character varying(60) COLLATE pg_catalog."default",
    CONSTRAINT LAR_TerminalPostnet_pkey PRIMARY KEY (LAR_TerminalPostnet_ID),
    CONSTRAINT LARTerminalPostnet_isactive_check CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS adempiere.LAR_TerminalPostnet
    OWNER to adempiere;

ALTER TABLE C_Pos ADD COLUMN LAR_TerminalPostnet_ID numeric(10,0);
ALTER TABLE C_Pos ADD CONSTRAINT LARTerminalPostnet_cpos FOREIGN KEY (LAR_TerminalPostnet_ID)
        REFERENCES adempiere.LAR_TerminalPostnet (LAR_TerminalPostnet_ID) MATCH SIMPLE;
ALTER TABLE LAR_Tarjeta_Credito ADD COLUMN LAR_TerminalPostnet_ID numeric(10,0);
ALTER TABLE LAR_Tarjeta_Credito ADD CONSTRAINT LARTerminalPostnet_LARTarjetaCredito FOREIGN KEY (LAR_TerminalPostnet_ID)
        REFERENCES adempiere.LAR_TerminalPostnet (LAR_TerminalPostnet_ID) MATCH SIMPLE;

-- 18/01/2023 17:07:42 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,IsHighVolume,ImportTable,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','3',0,3000255,'N','N','N','N','N','LAR','Y','Y','L','LAR_TerminalPostnet','Terminales Postnet',0,'Y',0,100,TO_TIMESTAMP('2023-01-18 17:07:41','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2023-01-18 17:07:41','YYYY-MM-DD HH24:MI:SS'))
;

-- 18/01/2023 17:07:42 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000255 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- 18/01/2023 17:07:42 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,AD_Client_ID,Updated,UpdatedBy,Created,CreatedBy,IsActive,StartNo) VALUES (1,'N',200000,'Y',1000000,'N','Y',3001800,'Table LAR_TerminalPostnet','LAR_TerminalPostnet',0,0,TO_TIMESTAMP('2023-01-18 17:07:42','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2023-01-18 17:07:42','YYYY-MM-DD HH24:MI:SS'),100,'Y',1000000)
;

-- 18/01/2023 17:07:49 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001351,'LAR_TerminalPostnet_ID','LAR','Terminales Postnet','Terminales Postnet',0,TO_TIMESTAMP('2023-01-18 17:07:49','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2023-01-18 17:07:49','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 18/01/2023 17:07:49 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001351 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 18/01/2023 17:07:49 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005273,3000255,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3001351,'N','N','N','Terminales Postnet','LAR_TerminalPostnet_ID',TO_TIMESTAMP('2023-01-18 17:07:49','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-18 17:07:49','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 18/01/2023 17:07:49 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005273 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 18/01/2023 17:07:50 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005274,3000255,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',TO_TIMESTAMP('2023-01-18 17:07:49','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-18 17:07:49','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 18/01/2023 17:07:50 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005274 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 18/01/2023 17:07:50 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005275,3000255,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',TO_TIMESTAMP('2023-01-18 17:07:50','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-18 17:07:50','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 18/01/2023 17:07:50 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005275 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 18/01/2023 17:07:50 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005276,3000255,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',TO_TIMESTAMP('2023-01-18 17:07:50','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-18 17:07:50','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 18/01/2023 17:07:50 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005276 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 18/01/2023 17:07:50 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005277,3000255,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',TO_TIMESTAMP('2023-01-18 17:07:50','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-18 17:07:50','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 18/01/2023 17:07:50 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005277 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 18/01/2023 17:07:50 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005278,3000255,'LAR',0,110,'Y','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',TO_TIMESTAMP('2023-01-18 17:07:50','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-18 17:07:50','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 18/01/2023 17:07:50 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005278 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 18/01/2023 17:07:51 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005279,3000255,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',TO_TIMESTAMP('2023-01-18 17:07:50','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-18 17:07:50','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 18/01/2023 17:07:51 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005279 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 18/01/2023 17:07:51 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005280,3000255,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',TO_TIMESTAMP('2023-01-18 17:07:51','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-18 17:07:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 18/01/2023 17:07:51 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005280 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 18/01/2023 17:07:51 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005281,3000255,'LAR',0,'Y','N','N','N',60,'N',10,'N',3000303,'N','Y','N','Marca','Marca',TO_TIMESTAMP('2023-01-18 17:07:51','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-18 17:07:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 18/01/2023 17:07:51 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005281 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 18/01/2023 17:07:51 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005282,3000255,'LAR',0,'Y','N','N','N',60,'N',10,'N',3000304,'N','Y','N','Modelo','Modelo',TO_TIMESTAMP('2023-01-18 17:07:51','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-18 17:07:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 18/01/2023 17:07:51 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005282 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 18/01/2023 17:07:51 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001352,'nroestablecimiento','LAR','nroestablecimiento','nroestablecimiento',0,TO_TIMESTAMP('2023-01-18 17:07:51','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2023-01-18 17:07:51','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 18/01/2023 17:07:51 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001352 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 18/01/2023 17:07:52 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005283,3000255,'LAR',0,'N','N','N','N',60,'N',10,'N',3001352,'N','Y','N','nroestablecimiento','nroestablecimiento',TO_TIMESTAMP('2023-01-18 17:07:51','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-18 17:07:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 18/01/2023 17:07:52 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005283 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 18/01/2023 17:08:38 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Column SET Name='Nro. de Establecimiento', ColumnName='NroEstablecimiento',Updated=TO_TIMESTAMP('2023-01-18 17:08:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005283
;

-- 18/01/2023 17:08:38 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3005283
;

-- 18/01/2023 17:08:38 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET Name='Nro. de Establecimiento', Description=NULL, Help=NULL WHERE AD_Column_ID=3005283 AND IsCentrallyMaintained='Y'
;

-- 18/01/2023 17:29:44 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005284,748,'LAR',0,'N','N','N','N',10,'N',19,'N',3001351,'N','Y','N','Terminales Postnet','LAR_TerminalPostnet_ID',TO_TIMESTAMP('2023-01-18 17:29:43','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-18 17:29:43','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 18/01/2023 17:29:44 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005284 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 18/01/2023 17:30:23 ART
-- ISSUE #80: Terminales Postnet.
DELETE FROM AD_Column_Trl WHERE AD_Column_ID=3005284
;

-- 18/01/2023 17:30:23 ART
-- ISSUE #80: Terminales Postnet.
DELETE FROM AD_Column WHERE AD_Column_ID=3005284
;

-- 18/01/2023 17:30:54 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Column SET IsUpdateable='N', Name='Terminal Postnet', IsAllowCopy='N',Updated=TO_TIMESTAMP('2023-01-18 17:30:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005273
;

-- 18/01/2023 17:30:54 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3005273
;

-- 18/01/2023 17:30:54 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET Name='Terminal Postnet', Description=NULL, Help=NULL WHERE AD_Column_ID=3005273 AND IsCentrallyMaintained='Y'
;

-- 18/01/2023 17:31:01 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Column_Trl SET Name='Terminal Postnet',Updated=TO_TIMESTAMP('2023-01-18 17:31:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005273 AND AD_Language='es_AR'
;

-- 18/01/2023 17:31:11 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Element SET Name='Terminal Postnet', PrintName='Terminal Postnet',Updated=TO_TIMESTAMP('2023-01-18 17:31:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001351
;

-- 18/01/2023 17:31:11 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001351
;

-- 18/01/2023 17:31:11 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Column SET ColumnName='LAR_TerminalPostnet_ID', Name='Terminal Postnet', Description=NULL, Help=NULL WHERE AD_Element_ID=3001351
;

-- 18/01/2023 17:31:11 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Process_Para SET ColumnName='LAR_TerminalPostnet_ID', Name='Terminal Postnet', Description=NULL, Help=NULL, AD_Element_ID=3001351 WHERE UPPER(ColumnName)='LAR_TERMINALPOSTNET_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 18/01/2023 17:31:11 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Process_Para SET ColumnName='LAR_TerminalPostnet_ID', Name='Terminal Postnet', Description=NULL, Help=NULL WHERE AD_Element_ID=3001351 AND IsCentrallyMaintained='Y'
;

-- 18/01/2023 17:31:11 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET Name='Terminal Postnet', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001351) AND IsCentrallyMaintained='Y'
;

-- 18/01/2023 17:31:11 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_PrintFormatItem SET PrintName='Terminal Postnet', Name='Terminal Postnet' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001351)
;

-- 18/01/2023 17:31:22 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Element_Trl SET Name='Terminal Postnet',PrintName='Terminal Postnet',Updated=TO_TIMESTAMP('2023-01-18 17:31:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001351 AND AD_Language='es_AR'
;

-- 18/01/2023 17:31:44 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005285,748,'LAR',0,'N','N','N','N',10,'N',19,'N',3001351,'N','Y','N','Terminal Postnet','LAR_TerminalPostnet_ID',TO_TIMESTAMP('2023-01-18 17:31:44','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-18 17:31:44','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 18/01/2023 17:31:44 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005285 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 18/01/2023 17:33:04 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005286,3000031,'LAR',0,'N','N','N','N',10,'N',19,'N',3001351,'N','Y','N','Terminal Postnet','LAR_TerminalPostnet_ID',TO_TIMESTAMP('2023-01-18 17:33:04','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-18 17:33:04','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 18/01/2023 17:33:04 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005286 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 18/01/2023 17:35:22 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008055,10,'Y','N','N',3005286,'N','Y',3000052,'N','LAR','Terminal Postnet',100,0,'Y',TO_TIMESTAMP('2023-01-18 17:35:22','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-01-18 17:35:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 18/01/2023 17:35:22 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008055 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/01/2023 17:38:28 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3008055
;

-- 18/01/2023 17:38:28 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3001860
;

-- 18/01/2023 17:38:37 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2023-01-18 17:38:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008055
;

-- 18/01/2023 17:38:43 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=30,Updated=TO_TIMESTAMP('2023-01-18 17:38:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008055
;

-- 18/01/2023 17:39:48 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3008055
;

-- 18/01/2023 17:43:00 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Column SET IsIdentifier='Y', SeqNo=1,Updated=TO_TIMESTAMP('2023-01-18 17:43:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005283
;

-- 18/01/2023 17:46:44 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008056,10,'Y','N','N',3005285,'N','Y',676,'N','LAR','Terminal Postnet',100,0,'Y',TO_TIMESTAMP('2023-01-18 17:46:43','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-01-18 17:46:43','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 18/01/2023 17:46:44 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008056 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/01/2023 17:47:27 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3008056
;

-- 18/01/2023 17:47:27 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000084
;

-- 18/01/2023 17:47:27 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000086
;

-- 18/01/2023 17:47:27 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000085
;

-- 18/01/2023 17:47:27 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000087
;

-- 18/01/2023 17:47:27 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3003215
;

-- 18/01/2023 17:47:27 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3003722
;

-- 18/01/2023 17:47:27 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3005257
;

-- 18/01/2023 17:47:27 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3007247
;

-- 18/01/2023 17:47:27 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3006687
;

-- 18/01/2023 17:47:27 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3006684
;

-- 18/01/2023 17:47:27 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3005570
;

-- 18/01/2023 17:47:27 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3006641
;

-- 18/01/2023 17:47:27 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3006686
;

-- 18/01/2023 17:47:27 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3006660
;

-- 18/01/2023 17:47:27 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3006642
;

-- 18/01/2023 17:47:27 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3006661
;

-- 18/01/2023 17:47:27 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3006659
;

-- 18/01/2023 17:47:27 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3006662
;

-- 18/01/2023 17:47:27 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3007395
;

-- 18/01/2023 17:47:27 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3007396
;

-- 18/01/2023 17:48:24 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2023-01-18 17:48:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008056
;

-- 18/01/2023 17:51:29 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Window (AD_Window_ID,WindowType,IsSOTrx,IsDefault,IsBetaFunctionality,WinHeight,WinWidth,EntityType,Name,IsActive,Created,CreatedBy,UpdatedBy,Updated,AD_Org_ID,AD_Client_ID,Processing) VALUES (3000134,'M','Y','N','N',0,0,'LAR','Terminales Postnet','Y',TO_TIMESTAMP('2023-01-18 17:51:28','YYYY-MM-DD HH24:MI:SS'),100,100,TO_TIMESTAMP('2023-01-18 17:51:28','YYYY-MM-DD HH24:MI:SS'),0,0,'N')
;

-- 18/01/2023 17:51:29 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Window_Trl (AD_Language,AD_Window_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Window_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Window t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Window_ID=3000134 AND NOT EXISTS (SELECT * FROM AD_Window_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Window_ID=t.AD_Window_ID)
;

-- 18/01/2023 17:52:06 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Tab_ID,AD_Table_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('N',3000134,10,'N','N',3000280,3000255,'N','N','N','N',0,'Y','N','LAR','Terminal Postnet',0,0,TO_TIMESTAMP('2023-01-18 17:52:05','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2023-01-18 17:52:05','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 18/01/2023 17:52:06 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000280 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 18/01/2023 17:52:42 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008057,1,'Y','N','N',3005276,'N','Y',3000280,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,'Y',TO_TIMESTAMP('2023-01-18 17:52:42','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-01-18 17:52:42','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 18/01/2023 17:52:42 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008057 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/01/2023 17:52:42 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008058,10,'Y','N','N',3005274,'N','Y',3000280,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,'Y',TO_TIMESTAMP('2023-01-18 17:52:42','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-01-18 17:52:42','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 18/01/2023 17:52:42 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008058 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/01/2023 17:52:42 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008059,60,'Y','N','N',3005281,'N','Y',3000280,'N','LAR','Marca',100,0,'Y',TO_TIMESTAMP('2023-01-18 17:52:42','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-01-18 17:52:42','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 18/01/2023 17:52:42 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008059 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/01/2023 17:52:42 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008060,60,'Y','N','N',3005282,'N','Y',3000280,'N','LAR','Modelo',100,0,'Y',TO_TIMESTAMP('2023-01-18 17:52:42','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-01-18 17:52:42','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 18/01/2023 17:52:42 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008060 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/01/2023 17:52:43 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008061,60,'Y','N','N',3005283,'N','Y',3000280,'N','LAR','nroestablecimiento',100,0,'Y',TO_TIMESTAMP('2023-01-18 17:52:42','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-01-18 17:52:42','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 18/01/2023 17:52:43 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008061 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/01/2023 17:52:43 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008062,10,'Y','N','N',3005275,'N','Y',3000280,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,'Y',TO_TIMESTAMP('2023-01-18 17:52:43','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-01-18 17:52:43','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 18/01/2023 17:52:43 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008062 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/01/2023 17:52:43 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008063,10,'N','N','N',3005273,'N','Y',3000280,'N','LAR','Terminal Postnet',100,0,'Y',TO_TIMESTAMP('2023-01-18 17:52:43','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-01-18 17:52:43','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 18/01/2023 17:52:43 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008063 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/01/2023 17:53:02 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3008058
;

-- 18/01/2023 17:53:02 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3008062
;

-- 18/01/2023 17:53:02 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3008059
;

-- 18/01/2023 17:53:02 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3008060
;

-- 18/01/2023 17:53:02 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3008061
;

-- 18/01/2023 17:53:02 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3008057
;

-- 18/01/2023 17:53:32 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Column_Trl SET Name='Nro. de Establecimiento',Updated=TO_TIMESTAMP('2023-01-18 17:53:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005283 AND AD_Language='es_AR'
;

-- 18/01/2023 17:53:49 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Element SET ColumnName='NroEstablecimiento', Name='Nro. de Establecimiento', PrintName='Nro. de Establecimiento',Updated=TO_TIMESTAMP('2023-01-18 17:53:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001352
;

-- 18/01/2023 17:53:49 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001352
;

-- 18/01/2023 17:53:49 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Column SET ColumnName='NroEstablecimiento', Name='Nro. de Establecimiento', Description=NULL, Help=NULL WHERE AD_Element_ID=3001352
;

-- 18/01/2023 17:53:49 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Process_Para SET ColumnName='NroEstablecimiento', Name='Nro. de Establecimiento', Description=NULL, Help=NULL, AD_Element_ID=3001352 WHERE UPPER(ColumnName)='NROESTABLECIMIENTO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 18/01/2023 17:53:49 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Process_Para SET ColumnName='NroEstablecimiento', Name='Nro. de Establecimiento', Description=NULL, Help=NULL WHERE AD_Element_ID=3001352 AND IsCentrallyMaintained='Y'
;

-- 18/01/2023 17:53:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET Name='Nro. de Establecimiento', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001352) AND IsCentrallyMaintained='Y'
;

-- 18/01/2023 17:53:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_PrintFormatItem SET PrintName='Nro. de Establecimiento', Name='Nro. de Establecimiento' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001352)
;

-- 18/01/2023 17:53:56 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Element_Trl SET Name='Nro. de Establecimiento',PrintName='Nro. de Establecimiento',Updated=TO_TIMESTAMP('2023-01-18 17:53:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001352 AND AD_Language='es_AR'
;

-- 18/01/2023 17:54:48 ART
-- ISSUE #80: Terminales Postnet.
DELETE FROM AD_Field_Trl WHERE AD_Field_ID=3008061
;

-- 18/01/2023 17:54:48 ART
-- ISSUE #80: Terminales Postnet.
DELETE FROM AD_Field WHERE AD_Field_ID=3008061
;

-- 18/01/2023 17:54:53 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008064,60,'Y','N','N',3005283,'N','Y',3000280,'N','LAR','Nro. de Establecimiento',100,0,'Y',TO_TIMESTAMP('2023-01-18 17:54:53','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-01-18 17:54:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 18/01/2023 17:54:53 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008064 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/01/2023 17:54:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3008064
;

-- 18/01/2023 17:55:06 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2023-01-18 17:55:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008062
;

-- 18/01/2023 17:55:11 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2023-01-18 17:55:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008060
;

-- 18/01/2023 17:55:18 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2023-01-18 17:55:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008057
;

-- 18/01/2023 17:57:06 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Menu (AD_Window_ID,AD_Menu_ID,IsSummary,"action",IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000134,3000468,'N','W','N','N','LAR','Y','Terminal Postnet',TO_TIMESTAMP('2023-01-18 17:57:06','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_TIMESTAMP('2023-01-18 17:57:06','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 18/01/2023 17:57:06 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000468 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 18/01/2023 17:57:06 ART
-- ISSUE #80: Terminales Postnet.
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100,t.AD_Tree_ID, 3000468, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000468)
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=512
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000011
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=243
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000015
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000028
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000101
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000287
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=7, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000013
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=8, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000024
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=9, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000014
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=10, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=288
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=11, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=432
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=12, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=235
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=13, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=241
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=14, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000099
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=15, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=462
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=16, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000102
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=17, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=245
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=18, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000306
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=19, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=251
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=20, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=255
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=21, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=413
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=22, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=538
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=23, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=286
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=24, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=287
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=25, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=438
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=26, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=234
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=27, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000468
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=28, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53313
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=29, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=511
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=30, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=505
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=31, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=496
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=32, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=497
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=33, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=304
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=34, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53190
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=35, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=246
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=36, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=509
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=37, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53187
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=38, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=510
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=39, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=244
;

-- 18/01/2023 17:59:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=40, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53314
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=512
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000011
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=243
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000015
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000028
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000101
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000287
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=7, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000013
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=8, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000024
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=9, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000014
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=10, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=288
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=11, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=432
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=12, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=235
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=13, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=241
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=14, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000099
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=15, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000468
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=16, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=462
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=17, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000102
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=18, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=245
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=19, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000306
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=20, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=251
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=21, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=255
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=22, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=413
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=23, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=538
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=24, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=286
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=25, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=287
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=26, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=438
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=27, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=234
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=28, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000468
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=29, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53313
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=30, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=511
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=31, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=505
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=32, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=496
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=33, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=497
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=34, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=304
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=35, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53190
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=36, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=246
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=37, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=509
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=38, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53187
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=39, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=510
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=40, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=244
;

-- 18/01/2023 17:59:50 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=41, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53314
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=512
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000011
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=243
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000015
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000028
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000101
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000287
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=7, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000013
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=8, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000024
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=9, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000014
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=10, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=288
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=11, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=432
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=12, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=235
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=13, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=241
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=14, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000099
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=15, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000468
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=16, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000102
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=17, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=462
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=18, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000102
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=19, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=245
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=20, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000306
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=21, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=251
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=22, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=255
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=23, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=413
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=24, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=538
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=25, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=286
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=26, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=287
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=27, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=438
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=28, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=234
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=29, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53313
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=30, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=511
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=31, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=505
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=32, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=496
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=33, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=497
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=34, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=304
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=35, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53190
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=36, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=246
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=37, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=509
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=38, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53187
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=39, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=510
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=40, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=244
;

-- 18/01/2023 17:59:59 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=41, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53314
;

-- 18/01/2023 18:04:07 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Column SET IsMandatory='Y',Updated=TO_TIMESTAMP('2023-01-18 18:04:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005283
;

-- 18/01/2023 18:05:26 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET DisplayLength=30,Updated=TO_TIMESTAMP('2023-01-18 18:05:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008064
;

-- 18/01/2023 18:05:32 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET DisplayLength=30,Updated=TO_TIMESTAMP('2023-01-18 18:05:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008060
;

-- 18/01/2023 18:05:36 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET DisplayLength=30,Updated=TO_TIMESTAMP('2023-01-18 18:05:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008059
;

-- 18/01/2023 18:06:44 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2023-01-18 18:06:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008059
;

-- 18/01/2023 18:06:48 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2023-01-18 18:06:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008060
;

-- 18/01/2023 18:06:54 ART
-- ISSUE #80: Terminales Postnet.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2023-01-18 18:06:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008064
;

-- Registración de script
SELECT register_migration_script_lar('0216_ISSUE-80.sql', 'LAR', '')
;
