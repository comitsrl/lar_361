CREATE TABLE IF NOT EXISTS LAR_TerminalPosnet
(
    LAR_TerminalPosnet_ID numeric(10,0) NOT NULL,
    AD_Client_ID numeric(10,0) NOT NULL,
    AD_Org_ID numeric(10,0) NOT NULL,
    IsActive character(1) COLLATE pg_catalog."default" NOT NULL DEFAULT 'Y'::bpchar,
    Created timestamp without time zone NOT NULL DEFAULT now(),
    CreatedBy numeric(10,0) NOT NULL,
    Updated timestamp without time zone NOT NULL DEFAULT now(),
    UpdatedBy numeric(10,0) NOT NULL,
    Name character varying(60) COLLATE pg_catalog."default" NOT NULL,
    Description character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT LAR_TerminalPosnet_pkey PRIMARY KEY (LAR_TerminalPosnet_ID),
    CONSTRAINT LARTerminalPosnet_isactive_check CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS adempiere.LAR_TerminalPosnet
    OWNER to adempiere;

ALTER TABLE C_Pos ADD COLUMN LAR_TerminalPosnet_ID numeric(10,0);
ALTER TABLE C_Pos ADD CONSTRAINT LARTerminalPosnet_cpos FOREIGN KEY (LAR_TerminalPosnet_ID)
        REFERENCES adempiere.LAR_TerminalPosnet (LAR_TerminalPosnet_ID) MATCH SIMPLE;

CREATE TABLE IF NOT EXISTS LAR_NroEstablecimiento
(
    LAR_NroEstablecimiento_ID numeric(10,0) NOT NULL,
    AD_Client_ID numeric(10,0) NOT NULL,
    AD_Org_ID numeric(10,0) NOT NULL,
    IsActive character(1) COLLATE pg_catalog."default" NOT NULL DEFAULT 'Y'::bpchar,
    Created timestamp without time zone NOT NULL DEFAULT now(),
    CreatedBy numeric(10,0) NOT NULL,
    Updated timestamp without time zone NOT NULL DEFAULT now(),
    UpdatedBy numeric(10,0) NOT NULL,
    NroEstablecimiento character varying(60) COLLATE pg_catalog."default" NOT NULL,
    Description character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT LAR_NroEstablecimiento_pkey PRIMARY KEY (LAR_NroEstablecimiento_ID),
    CONSTRAINT LARNroEstablecimiento_isactive_check CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS adempiere.LAR_NroEstablecimiento
    OWNER to adempiere;

ALTER TABLE LAR_Tarjeta_Credito ADD COLUMN LAR_NroEstablecimiento_ID numeric(10,0);
ALTER TABLE LAR_Tarjeta_Credito ADD CONSTRAINT LARNroEstablecimiento_LARTarjetaCredito FOREIGN KEY (LAR_NroEstablecimiento_ID)
        REFERENCES adempiere.LAR_NroEstablecimiento (LAR_NroEstablecimiento_ID) MATCH SIMPLE;

CREATE TABLE IF NOT EXISTS LAR_Posnet_NroEstablec
(
    LAR_Posnet_NroEstablec_ID numeric(10,0) NOT NULL,
    AD_Client_ID numeric(10,0) NOT NULL,
    AD_Org_ID numeric(10,0) NOT NULL,
    IsActive character(1) COLLATE pg_catalog."default" NOT NULL DEFAULT 'Y'::bpchar,
    Created timestamp without time zone NOT NULL DEFAULT now(),
    CreatedBy numeric(10,0) NOT NULL,
    Updated timestamp without time zone NOT NULL DEFAULT now(),
    UpdatedBy numeric(10,0) NOT NULL,
	LAR_TerminalPosnet_ID numeric(10,0) NOT NULL,
    LAR_NroEstablecimiento_ID numeric(10,0) NOT NULL,
    Description character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT LARPosnetNroEstablecimiento_pkey PRIMARY KEY (LAR_Posnet_NroEstablec_ID),
    CONSTRAINT LARPosnetNroEstablecimiento_isactive_check CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])),
	CONSTRAINT LARPosnetNroEstablecimiento_TerminalPosnet FOREIGN KEY (LAR_TerminalPosnet_ID)
        REFERENCES adempiere.LAR_TerminalPosnet (LAR_TerminalPosnet_ID) MATCH SIMPLE,
	CONSTRAINT LARPosnetNroEstablecimiento_NroEstablecimiento FOREIGN KEY (LAR_NroEstablecimiento_ID)
        REFERENCES adempiere.LAR_NroEstablecimiento (LAR_NroEstablecimiento_ID) MATCH SIMPLE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS adempiere.LAR_Posnet_NroEstablec
    OWNER to adempiere;

-- 23/01/2023 17:32:09 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,IsHighVolume,ImportTable,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','3',0,3000256,'N','N','N','N','N','LAR','Y','Y','L','LAR_TerminalPosnet','Terminal Posnet',0,'Y',0,100,TO_TIMESTAMP('2023-01-23 17:32:08','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2023-01-23 17:32:08','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/01/2023 17:32:09 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000256 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- 23/01/2023 17:32:09 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,AD_Client_ID,Updated,UpdatedBy,Created,CreatedBy,IsActive,StartNo) VALUES (1,'N',200000,'Y',1000000,'N','Y',3001820,'Table LAR_TerminalPosnet','LAR_TerminalPosnet',0,0,TO_TIMESTAMP('2023-01-23 17:32:09','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2023-01-23 17:32:09','YYYY-MM-DD HH24:MI:SS'),100,'Y',1000000)
;

-- 23/01/2023 17:32:15 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001353,'LAR_TerminalPosnet_ID','LAR','Terminal Posnet','Terminal Posnet',0,TO_TIMESTAMP('2023-01-23 17:32:15','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2023-01-23 17:32:15','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 23/01/2023 17:32:15 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001353 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 23/01/2023 17:32:15 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005287,3000256,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3001353,'N','N','N','Terminal Posnet','LAR_TerminalPosnet_ID',TO_TIMESTAMP('2023-01-23 17:32:15','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:32:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:32:15 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005287 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:32:15 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005288,3000256,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',TO_TIMESTAMP('2023-01-23 17:32:15','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:32:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:32:15 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005288 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:32:16 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005289,3000256,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',TO_TIMESTAMP('2023-01-23 17:32:15','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:32:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:32:16 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005289 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:32:16 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005290,3000256,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',TO_TIMESTAMP('2023-01-23 17:32:16','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:32:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:32:16 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005290 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:32:16 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005291,3000256,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',TO_TIMESTAMP('2023-01-23 17:32:16','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:32:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:32:16 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005291 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:32:17 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005292,3000256,'LAR',0,110,'Y','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',TO_TIMESTAMP('2023-01-23 17:32:16','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:32:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:32:17 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005292 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:32:17 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005293,3000256,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',TO_TIMESTAMP('2023-01-23 17:32:17','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:32:17','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:32:17 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005293 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:32:17 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005294,3000256,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',TO_TIMESTAMP('2023-01-23 17:32:17','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:32:17','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:32:17 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005294 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:32:17 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005295,3000256,'LAR',0,'Y','N','Y',1,'The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.','N',60,'Y',10,'N',469,'N','Y','N','Alphanumeric identifier of the entity','Name','Name',TO_TIMESTAMP('2023-01-23 17:32:17','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:32:17','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:32:17 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005295 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:32:18 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005296,3000256,'LAR',0,'N','N','N','A description is limited to 255 characters.','N',255,'Y',10,'N',275,'N','Y','N','Optional short description of the record','Description','Description',TO_TIMESTAMP('2023-01-23 17:32:17','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:32:17','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:32:18 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005296 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:34:35 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,IsHighVolume,ImportTable,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','3',0,3000257,'N','N','N','N','N','LAR','Y','Y','L','LAR_NroEstablecimiento','Número de Establecimiento',0,'Y',0,100,TO_TIMESTAMP('2023-01-23 17:34:35','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2023-01-23 17:34:35','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/01/2023 17:34:35 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000257 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- 23/01/2023 17:34:36 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,AD_Client_ID,Updated,UpdatedBy,Created,CreatedBy,IsActive,StartNo) VALUES (1,'N',200000,'Y',1000000,'N','Y',3001821,'Table LAR_NroEstablecimiento','LAR_NroEstablecimiento',0,0,TO_TIMESTAMP('2023-01-23 17:34:35','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2023-01-23 17:34:35','YYYY-MM-DD HH24:MI:SS'),100,'Y',1000000)
;

-- 23/01/2023 17:34:47 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001354,'LAR_NroEstablecimiento_ID','LAR','Número de Establecimiento','Número de Establecimiento',0,TO_TIMESTAMP('2023-01-23 17:34:47','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2023-01-23 17:34:47','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 23/01/2023 17:34:47 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001354 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 23/01/2023 17:34:47 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005299,3000257,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3001354,'N','N','N','Número de Establecimiento','LAR_NroEstablecimiento_ID',TO_TIMESTAMP('2023-01-23 17:34:47','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:34:47','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:34:47 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005299 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:34:47 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005300,3000257,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',TO_TIMESTAMP('2023-01-23 17:34:47','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:34:47','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:34:47 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005300 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:34:47 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005301,3000257,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',TO_TIMESTAMP('2023-01-23 17:34:47','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:34:47','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:34:47 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005301 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:34:47 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005302,3000257,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',TO_TIMESTAMP('2023-01-23 17:34:47','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:34:47','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:34:47 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005302 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:34:48 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005303,3000257,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',TO_TIMESTAMP('2023-01-23 17:34:47','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:34:47','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:34:48 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005303 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:34:48 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005304,3000257,'LAR',0,110,'Y','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',TO_TIMESTAMP('2023-01-23 17:34:48','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:34:48','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:34:48 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005304 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:34:48 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005305,3000257,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',TO_TIMESTAMP('2023-01-23 17:34:48','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:34:48','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:34:48 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005305 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:34:48 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005306,3000257,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',TO_TIMESTAMP('2023-01-23 17:34:48','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:34:48','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:34:48 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005306 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:34:49 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001355,'nroestablecimiento','LAR','nroestablecimiento','nroestablecimiento',0,TO_TIMESTAMP('2023-01-23 17:34:48','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2023-01-23 17:34:48','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 23/01/2023 17:34:49 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001355 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 23/01/2023 17:34:49 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005307,3000257,'LAR',0,'Y','N','N','N',60,'N',10,'N',3001355,'N','Y','N','nroestablecimiento','nroestablecimiento',TO_TIMESTAMP('2023-01-23 17:34:48','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:34:48','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:34:49 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005307 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:34:49 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005308,3000257,'LAR',0,'N','N','N','A description is limited to 255 characters.','N',255,'Y',10,'N',275,'N','Y','N','Optional short description of the record','Description','Description',TO_TIMESTAMP('2023-01-23 17:34:49','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:34:49','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:34:49 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005308 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:35:37 ART
-- ADP #2: Migracion de datos
UPDATE AD_Column SET Name='Nro. de Establecimiento', ColumnName='NroEstablecimiento',Updated=TO_TIMESTAMP('2023-01-23 17:35:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005307
;

-- 23/01/2023 17:35:37 ART
-- ADP #2: Migracion de datos
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3005307
;

-- 23/01/2023 17:35:37 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET Name='Nro. de Establecimiento', Description=NULL, Help=NULL WHERE AD_Column_ID=3005307 AND IsCentrallyMaintained='Y'
;

-- 23/01/2023 17:35:45 ART
-- ADP #2: Migracion de datos
UPDATE AD_Column_Trl SET Name='Nro. de Establecimiento',Updated=TO_TIMESTAMP('2023-01-23 17:35:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005307 AND AD_Language='es_AR'
;

-- 23/01/2023 17:36:04 ART
-- ADP #2: Migracion de datos
UPDATE AD_Element SET ColumnName='NroEstablecimiento', Name='Nro. de Establecimiento', PrintName='Nro. de Establecimiento',Updated=TO_TIMESTAMP('2023-01-23 17:36:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001355
;

-- 23/01/2023 17:36:04 ART
-- ADP #2: Migracion de datos
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001355
;

-- 23/01/2023 17:36:04 ART
-- ADP #2: Migracion de datos
UPDATE AD_Column SET ColumnName='NroEstablecimiento', Name='Nro. de Establecimiento', Description=NULL, Help=NULL WHERE AD_Element_ID=3001355
;

-- 23/01/2023 17:36:04 ART
-- ADP #2: Migracion de datos
UPDATE AD_Process_Para SET ColumnName='NroEstablecimiento', Name='Nro. de Establecimiento', Description=NULL, Help=NULL, AD_Element_ID=3001355 WHERE UPPER(ColumnName)='NROESTABLECIMIENTO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 23/01/2023 17:36:04 ART
-- ADP #2: Migracion de datos
UPDATE AD_Process_Para SET ColumnName='NroEstablecimiento', Name='Nro. de Establecimiento', Description=NULL, Help=NULL WHERE AD_Element_ID=3001355 AND IsCentrallyMaintained='Y'
;

-- 23/01/2023 17:36:04 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET Name='Nro. de Establecimiento', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001355) AND IsCentrallyMaintained='Y'
;

-- 23/01/2023 17:36:04 ART
-- ADP #2: Migracion de datos
UPDATE AD_PrintFormatItem SET PrintName='Nro. de Establecimiento', Name='Nro. de Establecimiento' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001355)
;

-- 23/01/2023 17:36:09 ART
-- ADP #2: Migracion de datos
UPDATE AD_Element_Trl SET Name='Nro. de Establecimiento',PrintName='Nro. de Establecimiento',Updated=TO_TIMESTAMP('2023-01-23 17:36:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001355 AND AD_Language='es_AR'
;

-- 23/01/2023 17:38:22 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,IsHighVolume,ImportTable,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','3',0,3000258,'N','N','N','N','N','LAR','Y','Y','L','LAR_Posnet_NroEstablecimiento','Nro. de Establecimiento de Posnet',0,'Y',0,100,TO_TIMESTAMP('2023-01-23 17:38:21','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2023-01-23 17:38:21','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/01/2023 17:38:22 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000258 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- 23/01/2023 17:38:22 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,AD_Client_ID,Updated,UpdatedBy,Created,CreatedBy,IsActive,StartNo) VALUES (1,'N',200000,'Y',1000000,'N','Y',3001822,'Table LAR_Posnet_NroEstablecimiento','LAR_Posnet_NroEstablecimiento',0,0,TO_TIMESTAMP('2023-01-23 17:38:22','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2023-01-23 17:38:22','YYYY-MM-DD HH24:MI:SS'),100,'Y',1000000)
;

-- 23/01/2023 17:38:50 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001356,'LAR_Posnet_NroEstablecimiento_','LAR','Nro. de Establecimiento de Posnet','Nro. de Establecimiento de Posnet',0,TO_TIMESTAMP('2023-01-23 17:38:50','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2023-01-23 17:38:50','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 23/01/2023 17:38:50 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001356 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 23/01/2023 17:38:50 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005309,3000258,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3001356,'N','N','N','Nro. de Establecimiento de Posnet','LAR_Posnet_NroEstablecimiento_',TO_TIMESTAMP('2023-01-23 17:38:50','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:38:50','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:38:50 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005309 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:38:51 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005310,3000258,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',TO_TIMESTAMP('2023-01-23 17:38:50','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:38:50','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:38:51 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005310 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:38:51 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005311,3000258,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',TO_TIMESTAMP('2023-01-23 17:38:51','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:38:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:38:51 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005311 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:38:51 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005312,3000258,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',TO_TIMESTAMP('2023-01-23 17:38:51','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:38:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:38:51 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005312 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:38:51 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005313,3000258,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',TO_TIMESTAMP('2023-01-23 17:38:51','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:38:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:38:51 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005313 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:38:51 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005314,3000258,'LAR',0,110,'Y','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',TO_TIMESTAMP('2023-01-23 17:38:51','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:38:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:38:51 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005314 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:38:51 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005315,3000258,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',TO_TIMESTAMP('2023-01-23 17:38:51','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:38:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:38:51 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005315 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:38:52 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005316,3000258,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',TO_TIMESTAMP('2023-01-23 17:38:51','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:38:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:38:52 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005316 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:38:52 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005317,3000258,'LAR',0,'Y','N','N','N',10,'N',19,'N',3001353,'N','Y','N','Terminal Posnet','LAR_TerminalPosnet_ID',TO_TIMESTAMP('2023-01-23 17:38:52','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:38:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:38:52 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005317 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:38:52 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005318,3000258,'LAR',0,'Y','N','N','N',10,'N',19,'N',3001354,'N','Y','N','Número de Establecimiento','LAR_NroEstablecimiento_ID',TO_TIMESTAMP('2023-01-23 17:38:52','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:38:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:38:52 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005318 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:38:52 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005319,3000258,'LAR',0,'N','N','N','A description is limited to 255 characters.','N',255,'Y',10,'N',275,'N','Y','N','Optional short description of the record','Description','Description',TO_TIMESTAMP('2023-01-23 17:38:52','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:38:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:38:52 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005319 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:43:44 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Window (AD_Window_ID,WindowType,IsSOTrx,IsDefault,IsBetaFunctionality,WinHeight,WinWidth,EntityType,Name,IsActive,Created,CreatedBy,UpdatedBy,Updated,AD_Org_ID,AD_Client_ID,Processing) VALUES (3000135,'M','Y','N','N',0,0,'LAR','Terminal Posnet','Y',TO_TIMESTAMP('2023-01-23 17:43:44','YYYY-MM-DD HH24:MI:SS'),100,100,TO_TIMESTAMP('2023-01-23 17:43:44','YYYY-MM-DD HH24:MI:SS'),0,0,'N')
;

-- 23/01/2023 17:43:44 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Window_Trl (AD_Language,AD_Window_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Window_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Window t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Window_ID=3000135 AND NOT EXISTS (SELECT * FROM AD_Window_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Window_ID=t.AD_Window_ID)
;

-- 23/01/2023 17:45:06 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Tab_ID,AD_Table_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('Y',3000135,10,'N','N',3000281,3000256,'N','N','N','N',0,'Y','N','LAR','Terminal Posnet',0,0,TO_TIMESTAMP('2023-01-23 17:45:06','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2023-01-23 17:45:06','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 23/01/2023 17:45:06 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000281 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 23/01/2023 17:45:12 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008065,1,'Y','N','N',3005290,'N','Y',3000281,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,'Y',TO_TIMESTAMP('2023-01-23 17:45:12','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-01-23 17:45:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:45:12 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008065 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/01/2023 17:45:12 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008066,10,'Y','N','N',3005288,'N','Y',3000281,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,'Y',TO_TIMESTAMP('2023-01-23 17:45:12','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-01-23 17:45:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:45:12 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008066 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/01/2023 17:45:12 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008067,255,'Y','N','N',3005296,'N','Y',3000281,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,'Y',TO_TIMESTAMP('2023-01-23 17:45:12','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-01-23 17:45:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:45:12 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008067 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/01/2023 17:45:13 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008070,60,'Y','N','N',3005295,'N','Y',3000281,'N','The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.','LAR','Alphanumeric identifier of the entity','Name',100,0,'Y',TO_TIMESTAMP('2023-01-23 17:45:13','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-01-23 17:45:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:45:13 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008070 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/01/2023 17:45:13 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008071,10,'Y','N','N',3005289,'N','Y',3000281,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,'Y',TO_TIMESTAMP('2023-01-23 17:45:13','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-01-23 17:45:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:45:13 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008071 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/01/2023 17:45:13 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008072,10,'N','N','N',3005287,'N','Y',3000281,'N','LAR','Terminal Posnet',100,0,'Y',TO_TIMESTAMP('2023-01-23 17:45:13','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-01-23 17:45:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:45:13 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008072 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/01/2023 17:45:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3008066
;

-- 23/01/2023 17:45:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3008071
;

-- 23/01/2023 17:45:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3008070
;

-- 23/01/2023 17:45:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3008068
;

-- 23/01/2023 17:45:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3008069
;

-- 23/01/2023 17:45:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3008067
;

-- 23/01/2023 17:45:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3008065
;

-- 23/01/2023 17:45:57 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2023-01-23 17:45:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008071
;

-- 23/01/2023 17:46:08 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2023-01-23 17:46:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008069
;

-- 23/01/2023 17:46:16 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET DisplayLength=30,Updated=TO_TIMESTAMP('2023-01-23 17:46:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008069
;

-- 23/01/2023 17:46:22 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET DisplayLength=30,Updated=TO_TIMESTAMP('2023-01-23 17:46:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008068
;

-- 23/01/2023 17:46:36 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET DisplayLength=30,Updated=TO_TIMESTAMP('2023-01-23 17:46:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008070
;

-- 23/01/2023 17:46:45 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3008065
;

-- 23/01/2023 17:46:45 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3008068
;

-- 23/01/2023 17:46:45 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3008069
;

-- 23/01/2023 17:46:45 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3008067
;

-- 23/01/2023 17:46:55 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2023-01-23 17:46:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008065
;

-- 23/01/2023 17:51:42 ART
-- ADP #2: Migracion de datos
DELETE FROM AD_Column_Trl WHERE AD_Column_ID=3005309
;

-- 23/01/2023 17:51:42 ART
-- ADP #2: Migracion de datos
DELETE FROM AD_Column WHERE AD_Column_ID=3005309
;

-- 23/01/2023 17:54:35 ART
-- ADP #2: Migracion de datos
UPDATE AD_Table SET TableName='LAR_Posnet_NroEstablec',Updated=TO_TIMESTAMP('2023-01-23 17:54:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000258
;

-- 23/01/2023 17:54:35 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,AD_Client_ID,Updated,UpdatedBy,Created,CreatedBy,IsActive,StartNo) VALUES (1,'N',200000,'Y',1000000,'N','Y',3001823,'Table LAR_Posnet_NroEstablec','LAR_Posnet_NroEstablec',0,0,TO_TIMESTAMP('2023-01-23 17:54:35','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2023-01-23 17:54:35','YYYY-MM-DD HH24:MI:SS'),100,'Y',1000000)
;

-- 23/01/2023 17:55:31 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001357,'LAR_Posnet_NroEstablec_ID','LAR','Nro. de Establecimiento de Posnet','Nro. de Establecimiento de Posnet',0,TO_TIMESTAMP('2023-01-23 17:55:31','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2023-01-23 17:55:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 23/01/2023 17:55:31 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001357 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 23/01/2023 17:55:31 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005320,3000258,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3001357,'N','N','N','Nro. de Establecimiento de Posnet','LAR_Posnet_NroEstablec_ID',TO_TIMESTAMP('2023-01-23 17:55:31','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 17:55:31','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 17:55:31 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005320 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 17:59:07 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Tab_ID,AD_Table_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('Y',3000135,20,'N','N',3000282,3000258,'N','N','N','N',1,'Y','N','LAR','Nro. de Establecimiento',0,0,TO_TIMESTAMP('2023-01-23 17:59:07','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2023-01-23 17:59:07','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 23/01/2023 17:59:07 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000282 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 23/01/2023 18:03:01 ART
-- ADP #2: Migracion de datos
UPDATE AD_Tab SET AD_Column_ID=3005317,Updated=TO_TIMESTAMP('2023-01-23 18:03:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000282
;

-- 23/01/2023 18:03:12 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008073,1,'Y','N','N',3005312,'N','Y',3000282,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,'Y',TO_TIMESTAMP('2023-01-23 18:03:11','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-01-23 18:03:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 18:03:12 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008073 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/01/2023 18:03:12 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008074,10,'Y','N','N',3005310,'N','Y',3000282,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,'Y',TO_TIMESTAMP('2023-01-23 18:03:12','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-01-23 18:03:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 18:03:12 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008074 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/01/2023 18:03:12 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008075,255,'Y','N','N',3005319,'N','Y',3000282,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,'Y',TO_TIMESTAMP('2023-01-23 18:03:12','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-01-23 18:03:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 18:03:12 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008075 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/01/2023 18:03:12 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008076,10,'N','N','N',3005320,'N','Y',3000282,'N','LAR','Nro. de Establecimiento de Posnet',100,0,'Y',TO_TIMESTAMP('2023-01-23 18:03:12','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-01-23 18:03:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 18:03:12 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008076 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/01/2023 18:03:12 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008077,10,'Y','N','N',3005318,'N','Y',3000282,'N','LAR','Número de Establecimiento',100,0,'Y',TO_TIMESTAMP('2023-01-23 18:03:12','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-01-23 18:03:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 18:03:12 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008077 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/01/2023 18:03:12 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008078,10,'Y','N','N',3005311,'N','Y',3000282,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,'Y',TO_TIMESTAMP('2023-01-23 18:03:12','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-01-23 18:03:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 18:03:12 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008078 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/01/2023 18:03:13 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008079,10,'Y','N','N',3005317,'N','Y',3000282,'N','LAR','Terminal Posnet',100,0,'Y',TO_TIMESTAMP('2023-01-23 18:03:12','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-01-23 18:03:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 18:03:13 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008079 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/01/2023 18:03:33 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3008074
;

-- 23/01/2023 18:03:33 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3008078
;

-- 23/01/2023 18:03:33 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3008079
;

-- 23/01/2023 18:03:33 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3008077
;

-- 23/01/2023 18:03:33 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3008075
;

-- 23/01/2023 18:03:33 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3008073
;

-- 23/01/2023 18:03:40 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2023-01-23 18:03:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008078
;

-- 23/01/2023 18:03:51 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2023-01-23 18:03:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008077
;

-- 23/01/2023 18:06:18 ART
-- ADP #2: Migracion de datos
UPDATE AD_Table SET AD_Window_ID=3000135,Updated=TO_TIMESTAMP('2023-01-23 18:06:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000256
;

-- 23/01/2023 18:10:05 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Window (AD_Window_ID,WindowType,IsSOTrx,IsDefault,IsBetaFunctionality,WinHeight,WinWidth,EntityType,Name,IsActive,Created,CreatedBy,UpdatedBy,Updated,AD_Org_ID,AD_Client_ID,Processing) VALUES (3000136,'M','Y','N','N',0,0,'LAR','Número de Establecimiento','Y',TO_TIMESTAMP('2023-01-23 18:10:05','YYYY-MM-DD HH24:MI:SS'),100,100,TO_TIMESTAMP('2023-01-23 18:10:05','YYYY-MM-DD HH24:MI:SS'),0,0,'N')
;

-- 23/01/2023 18:10:05 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Window_Trl (AD_Language,AD_Window_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Window_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Window t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Window_ID=3000136 AND NOT EXISTS (SELECT * FROM AD_Window_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Window_ID=t.AD_Window_ID)
;

-- 23/01/2023 18:10:52 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Tab_ID,AD_Table_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('Y',3000136,10,'N','N',3000283,3000257,'N','N','N','N',0,'Y','N','LAR','Nro. de Establecimiento',0,0,TO_TIMESTAMP('2023-01-23 18:10:52','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2023-01-23 18:10:52','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 23/01/2023 18:10:52 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000283 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 23/01/2023 18:15:31 ART
-- ADP #2: Migracion de datos
UPDATE AD_Table SET AD_Window_ID=3000136,Updated=TO_TIMESTAMP('2023-01-23 18:15:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000257
;

-- 23/01/2023 18:17:06 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Menu (AD_Window_ID,AD_Menu_ID,IsSummary,"action",IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000135,3000469,'N','W','Y','N','LAR','Y','Teminal Posnet',TO_TIMESTAMP('2023-01-23 18:17:05','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_TIMESTAMP('2023-01-23 18:17:05','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 23/01/2023 18:17:06 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000469 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 23/01/2023 18:17:06 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100,t.AD_Tree_ID, 3000469, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000469)
;

-- 23/01/2023 18:17:49 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Menu (AD_Window_ID,AD_Menu_ID,IsSummary,"action",IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000136,3000470,'N','W','Y','N','LAR','Y','Número de Establecimiento',TO_TIMESTAMP('2023-01-23 18:17:49','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_TIMESTAMP('2023-01-23 18:17:49','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 23/01/2023 18:17:49 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000470 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 23/01/2023 18:17:49 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100,t.AD_Tree_ID, 3000470, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000470)
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=512
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000011
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=243
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000015
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000028
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000101
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000287
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=7, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000013
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=8, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000024
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=9, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000014
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=10, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=288
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=11, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=432
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=12, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=235
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=13, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=241
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=14, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000099
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=15, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000469
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=16, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=462
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=17, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000102
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=18, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=245
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=19, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000306
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=20, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=251
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=21, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=255
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=22, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=413
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=23, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=538
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=24, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=286
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=25, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=287
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=26, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=438
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=27, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=234
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=28, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53313
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=29, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=511
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=30, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=505
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=31, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=496
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=32, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=497
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=33, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=304
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=34, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53190
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=35, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=246
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=36, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=509
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=37, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53187
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=38, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=510
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=39, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=244
;

-- 23/01/2023 18:18:17 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=40, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53314
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=512
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000011
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=243
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000015
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000028
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000101
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000287
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=7, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000013
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=8, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000024
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=9, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000014
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=10, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=288
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=11, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=432
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=12, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=235
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=13, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=241
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=14, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000099
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=15, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000469
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=16, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000470
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=17, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=462
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=18, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000102
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=19, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=245
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=20, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000306
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=21, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=251
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=22, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=255
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=23, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=413
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=24, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=538
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=25, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=286
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=26, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=287
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=27, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=438
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=28, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=234
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=29, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53313
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=30, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=511
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=31, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=505
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=32, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=496
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=33, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=497
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=34, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=304
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=35, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53190
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=36, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=246
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=37, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=509
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=38, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53187
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=39, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=510
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=40, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=244
;

-- 23/01/2023 18:18:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=41, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53314
;

-- 23/01/2023 18:21:21 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2023-01-23 18:21:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008068
;

-- 23/01/2023 18:21:27 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2023-01-23 18:21:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008069
;

-- 23/01/2023 18:22:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2023-01-23 18:22:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008070
;

-- 23/01/2023 18:25:03 ART
-- ADP #2: Migracion de datos
UPDATE AD_Column SET IsIdentifier='Y',Updated=TO_TIMESTAMP('2023-01-23 18:25:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005307
;

-- 23/01/2023 18:28:55 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008080,1,'Y','N','N',3005302,'N','Y',3000283,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,'Y',TO_TIMESTAMP('2023-01-23 18:28:54','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-01-23 18:28:54','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 18:28:55 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008080 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/01/2023 18:28:55 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008081,10,'Y','N','N',3005300,'N','Y',3000283,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,'Y',TO_TIMESTAMP('2023-01-23 18:28:55','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-01-23 18:28:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 18:28:55 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008081 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/01/2023 18:28:55 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008082,255,'Y','N','N',3005308,'N','Y',3000283,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,'Y',TO_TIMESTAMP('2023-01-23 18:28:55','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-01-23 18:28:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 18:28:55 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008082 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/01/2023 18:28:56 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008083,60,'Y','N','N',3005307,'N','Y',3000283,'N','LAR','Nro. de Establecimiento',100,0,'Y',TO_TIMESTAMP('2023-01-23 18:28:55','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-01-23 18:28:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 18:28:56 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008083 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/01/2023 18:28:56 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008084,10,'N','N','N',3005299,'N','Y',3000283,'N','LAR','Número de Establecimiento',100,0,'Y',TO_TIMESTAMP('2023-01-23 18:28:56','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-01-23 18:28:56','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 18:28:56 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008084 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/01/2023 18:28:56 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008085,10,'Y','N','N',3005301,'N','Y',3000283,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,'Y',TO_TIMESTAMP('2023-01-23 18:28:56','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-01-23 18:28:56','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 18:28:56 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008085 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/01/2023 18:29:21 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3008081
;

-- 23/01/2023 18:29:21 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3008085
;

-- 23/01/2023 18:29:21 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3008083
;

-- 23/01/2023 18:29:21 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3008080
;

-- 23/01/2023 18:29:21 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3008082
;

-- 23/01/2023 18:29:31 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2023-01-23 18:29:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008085
;

-- 23/01/2023 18:29:39 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2023-01-23 18:29:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008083
;

-- 23/01/2023 18:29:43 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2023-01-23 18:29:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008080
;

-- 23/01/2023 18:32:20 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005321,3000031,'LAR',0,'N','N','N','N',10,'N',19,'N',3001354,'N','Y','N','Número de Establecimiento','LAR_NroEstablecimiento_ID',TO_TIMESTAMP('2023-01-23 18:32:19','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 18:32:19','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 18:32:20 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005321 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 18:33:16 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008086,10,'Y','N','N',3005321,'N','Y',3000052,'N','LAR','Número de Establecimiento',100,0,'Y',TO_TIMESTAMP('2023-01-23 18:33:16','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-01-23 18:33:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 18:33:16 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008086 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/01/2023 18:34:29 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3008086
;

-- 23/01/2023 18:34:29 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3001860
;

-- 23/01/2023 18:34:51 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2023-01-23 18:34:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008086
;

-- 23/01/2023 18:35:44 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET DisplayLogic='@EsDebito@=''Y'' OR @EsCredito@=''Y''',Updated=TO_TIMESTAMP('2023-01-23 18:35:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008086
;

-- 23/01/2023 18:38:40 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET DisplayLogic='@EsDebito@=''Y'' | @EsCredito@=''Y''',Updated=TO_TIMESTAMP('2023-01-23 18:38:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008086
;

-- 23/01/2023 18:40:35 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005322,748,'LAR',0,'N','N','N','N',10,'N',19,'N',3001353,'N','Y','N','Terminal Posnet','LAR_TerminalPosnet_ID',TO_TIMESTAMP('2023-01-23 18:40:34','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-01-23 18:40:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 18:40:35 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005322 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/01/2023 18:40:48 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008087,10,'Y','N','N',3005322,'N','Y',676,'N','LAR','Terminal Posnet',100,0,'Y',TO_TIMESTAMP('2023-01-23 18:40:48','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-01-23 18:40:48','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/01/2023 18:40:48 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008087 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/01/2023 18:42:07 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3008087
;

-- 23/01/2023 18:42:07 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000084
;

-- 23/01/2023 18:42:07 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000086
;

-- 23/01/2023 18:42:07 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000085
;

-- 23/01/2023 18:42:07 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000087
;

-- 23/01/2023 18:42:07 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3003215
;

-- 23/01/2023 18:42:07 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3003722
;

-- 23/01/2023 18:42:07 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3005257
;

-- 23/01/2023 18:42:07 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3007247
;

-- 23/01/2023 18:42:07 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3006687
;

-- 23/01/2023 18:42:07 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3006684
;

-- 23/01/2023 18:42:07 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3005570
;

-- 23/01/2023 18:42:07 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3006641
;

-- 23/01/2023 18:42:07 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3006686
;

-- 23/01/2023 18:42:07 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3006660
;

-- 23/01/2023 18:42:07 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3006642
;

-- 23/01/2023 18:42:07 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3006661
;

-- 23/01/2023 18:42:07 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3006659
;

-- 23/01/2023 18:42:07 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3006662
;

-- 23/01/2023 18:42:07 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3007395
;

-- 23/01/2023 18:42:07 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3007396
;

-- 23/01/2023 18:42:35 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2023-01-23 18:42:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008087
;

-- Registración de script
SELECT register_migration_script_lar('0216_ISSUE-80.sql', 'LAR', '')
;
