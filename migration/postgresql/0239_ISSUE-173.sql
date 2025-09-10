CREATE TABLE IF NOT EXISTS adempiere.LAR_CategoriaCredito
(
    LAR_CategoriaCredito_ID numeric(10,0) NOT NULL,
    AD_Client_ID numeric(10,0) NOT NULL,
    AD_Org_ID numeric(10,0) NOT NULL,
    IsActive character(1) COLLATE pg_catalog."default" NOT NULL DEFAULT 'Y'::bpchar,
    Created timestamp without time zone NOT NULL DEFAULT now(),
    CreatedBy numeric(10,0) NOT NULL,
    Updated timestamp without time zone NOT NULL DEFAULT now(),
    UpdatedBy numeric(10,0) NOT NULL,
    Value character varying(40) COLLATE pg_catalog."default" NOT NULL,
    Name character varying(60) COLLATE pg_catalog."default" NOT NULL,
    Description character varying(255) COLLATE pg_catalog."default",
    SO_CreditLimit numeric NOT NULL DEFAULT 0,
    CONSTRAINT LAR_CategoriaCredito_key PRIMARY KEY (LAR_CategoriaCredito_ID),
    CONSTRAINT LAR_CategoriaCredito_isactive_check CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS adempiere.LAR_CategoriaCredito
    OWNER to adempiere;


ALTER TABLE C_BPartner ADD COLUMN LAR_CategoriaCredito_ID numeric(10,0);
ALTER TABLE C_BPartner ADD CONSTRAINT lar_categoriacredito_cbpartner FOREIGN KEY (LAR_CategoriaCredito_ID)
        REFERENCES adempiere.LAR_CategoriaCredito (LAR_CategoriaCredito_ID) MATCH SIMPLE;

-- 09/09/2025 23:37:15 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,ImportTable,IsHighVolume,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','6',0,3000280,'N','N','N','N','N','LAR','Y','Y','L','LAR_CategoriaCredito','Categoria de Crédito',0,'Y',0,100,TO_TIMESTAMP('2025-09-09 23:37:14','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2025-09-09 23:37:14','YYYY-MM-DD HH24:MI:SS'))
;

-- 09/09/2025 23:37:15 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000280 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- 09/09/2025 23:37:15 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,UpdatedBy,AD_Client_ID,Updated,Created,CreatedBy,IsActive) VALUES (1,'N',200000,'Y',1000000,1000000,'N','Y',3008096,'Table LAR_CategoriaCredito','LAR_CategoriaCredito',0,100,0,TO_TIMESTAMP('2025-09-09 23:37:15','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2025-09-09 23:37:15','YYYY-MM-DD HH24:MI:SS'),100,'Y')
;

-- 09/09/2025 23:37:59 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001518,'LAR_CategoriaCredito_ID','LAR','Categoria de Crédito','Categoria de Crédito',0,TO_TIMESTAMP('2025-09-09 23:37:59','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2025-09-09 23:37:59','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 09/09/2025 23:37:59 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001518 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 09/09/2025 23:37:59 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005903,3000280,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3001518,'N','N','N','Categoria de Crédito','LAR_CategoriaCredito_ID',100,TO_TIMESTAMP('2025-09-09 23:37:59','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2025-09-09 23:37:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/09/2025 23:37:59 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005903 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/09/2025 23:38:00 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005904,3000280,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,TO_TIMESTAMP('2025-09-09 23:37:59','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2025-09-09 23:37:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/09/2025 23:38:00 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005904 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/09/2025 23:38:00 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005905,3000280,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',100,TO_TIMESTAMP('2025-09-09 23:38:00','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2025-09-09 23:38:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/09/2025 23:38:00 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005905 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/09/2025 23:38:00 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005906,3000280,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,TO_TIMESTAMP('2025-09-09 23:38:00','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2025-09-09 23:38:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/09/2025 23:38:00 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005906 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/09/2025 23:38:00 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005907,3000280,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,TO_TIMESTAMP('2025-09-09 23:38:00','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2025-09-09 23:38:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/09/2025 23:38:00 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005907 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/09/2025 23:38:00 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005908,3000280,'LAR',0,110,'Y','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,TO_TIMESTAMP('2025-09-09 23:38:00','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2025-09-09 23:38:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/09/2025 23:38:00 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005908 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/09/2025 23:38:01 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005909,3000280,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,TO_TIMESTAMP('2025-09-09 23:38:00','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2025-09-09 23:38:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/09/2025 23:38:01 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005909 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/09/2025 23:38:01 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005910,3000280,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,TO_TIMESTAMP('2025-09-09 23:38:01','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2025-09-09 23:38:01','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/09/2025 23:38:01 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005910 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/09/2025 23:38:01 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005911,3000280,'LAR',0,'Y','N','N','A search key allows you a fast method of finding a particular record.
If you leave the search key empty, the system automatically creates a numeric number.  The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).','N',40,'Y',10,'N',620,'N','Y','N','Search key for the record in the format required - must be unique','Search Key','Value',100,TO_TIMESTAMP('2025-09-09 23:38:01','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2025-09-09 23:38:01','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/09/2025 23:38:01 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005911 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/09/2025 23:38:01 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005912,3000280,'LAR',0,'Y','N','Y',1,'The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.','N',60,'Y',10,'N',469,'N','Y','N','Alphanumeric identifier of the entity','Name','Name',100,TO_TIMESTAMP('2025-09-09 23:38:01','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2025-09-09 23:38:01','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/09/2025 23:38:01 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005912 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/09/2025 23:38:01 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005913,3000280,'LAR',0,'N','N','N','A description is limited to 255 characters.','N',255,'Y',10,'N',275,'N','Y','N','Optional short description of the record','Description','Description',100,TO_TIMESTAMP('2025-09-09 23:38:01','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2025-09-09 23:38:01','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/09/2025 23:38:01 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005913 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/09/2025 23:38:02 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005914,3000280,'LAR',0,'Y','N','N','The Credit Limit indicates the total amount allowed "on account" in primary accounting currency.  If the Credit Limit is 0, no check is performed.  Credit Management is based on the Total Open Amount, which includes Vendor activities.','N',131089,'N',22,'N',553,'N','Y','N','Total outstanding invoice amounts allowed','Credit Limit','SO_CreditLimit',100,TO_TIMESTAMP('2025-09-09 23:38:01','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2025-09-09 23:38:01','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/09/2025 23:38:02 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005914 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/09/2025 23:39:55 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Window (AD_Window_ID,WindowType,IsSOTrx,IsDefault,IsBetaFunctionality,WinHeight,WinWidth,EntityType,Name,IsActive,Created,UpdatedBy,CreatedBy,Updated,AD_Org_ID,AD_Client_ID,Processing) VALUES (3000147,'M','Y','N','N',0,0,'LAR','Categorias de Crédito','Y',TO_TIMESTAMP('2025-09-09 23:39:55','YYYY-MM-DD HH24:MI:SS'),100,100,TO_TIMESTAMP('2025-09-09 23:39:55','YYYY-MM-DD HH24:MI:SS'),0,0,'N')
;

-- 09/09/2025 23:39:55 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Window_Trl (AD_Language,AD_Window_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Window_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Window t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Window_ID=3000147 AND NOT EXISTS (SELECT * FROM AD_Window_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Window_ID=t.AD_Window_ID)
;

-- 09/09/2025 23:42:24 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,CommitWarning,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('N',3000147,10,'N','N',3000280,3000317,'Luego de Guardar los cambios, se actualizara el Limite de Crédito en todos los Socios del Negocio, en los cuales se haya asignado esta Categoria de Crédito.','N','N','N','N',0,'Y','N','LAR','Categoria de Crédito',0,0,TO_TIMESTAMP('2025-09-09 23:42:23','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2025-09-09 23:42:23','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 09/09/2025 23:42:24 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000317 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 09/09/2025 23:42:28 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009441,1,'Y','N','N',3005906,'N','Y',3000317,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,TO_TIMESTAMP('2025-09-09 23:42:27','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2025-09-09 23:42:27','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/09/2025 23:42:28 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009441 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/09/2025 23:42:28 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009442,10,'N','N','N',3005903,'N','Y',3000317,'N','LAR','Categoria de Crédito',100,0,TO_TIMESTAMP('2025-09-09 23:42:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2025-09-09 23:42:28','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/09/2025 23:42:28 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009442 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/09/2025 23:42:28 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009443,10,'Y','N','N',3005904,'N','Y',3000317,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,TO_TIMESTAMP('2025-09-09 23:42:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2025-09-09 23:42:28','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/09/2025 23:42:28 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009443 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/09/2025 23:42:28 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009444,131089,'Y','N','N',3005914,'N','Y',3000317,'N','The Credit Limit indicates the total amount allowed "on account" in primary accounting currency.  If the Credit Limit is 0, no check is performed.  Credit Management is based on the Total Open Amount, which includes Vendor activities.','LAR','Total outstanding invoice amounts allowed','Credit Limit',100,0,TO_TIMESTAMP('2025-09-09 23:42:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2025-09-09 23:42:28','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/09/2025 23:42:28 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009444 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/09/2025 23:42:28 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009445,255,'Y','N','N',3005913,'N','Y',3000317,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,TO_TIMESTAMP('2025-09-09 23:42:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2025-09-09 23:42:28','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/09/2025 23:42:28 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009445 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/09/2025 23:42:28 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009446,60,'Y','N','N',3005912,'N','Y',3000317,'N','The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.','LAR','Alphanumeric identifier of the entity','Name',100,0,TO_TIMESTAMP('2025-09-09 23:42:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2025-09-09 23:42:28','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/09/2025 23:42:28 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009446 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/09/2025 23:42:29 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009447,10,'Y','N','N',3005905,'N','Y',3000317,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,TO_TIMESTAMP('2025-09-09 23:42:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2025-09-09 23:42:28','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/09/2025 23:42:29 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009447 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/09/2025 23:42:29 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009448,40,'Y','N','N',3005911,'N','Y',3000317,'N','A search key allows you a fast method of finding a particular record.
If you leave the search key empty, the system automatically creates a numeric number.  The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).','LAR','Search key for the record in the format required - must be unique','Search Key',100,0,TO_TIMESTAMP('2025-09-09 23:42:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2025-09-09 23:42:29','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/09/2025 23:42:29 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009448 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/09/2025 23:43:09 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3009443
;

-- 09/09/2025 23:43:09 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3009447
;

-- 09/09/2025 23:43:09 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3009448
;

-- 09/09/2025 23:43:09 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3009446
;

-- 09/09/2025 23:43:09 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3009444
;

-- 09/09/2025 23:43:09 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3009445
;

-- 09/09/2025 23:43:09 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3009441
;

-- 09/09/2025 23:43:20 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2025-09-09 23:43:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009447
;

-- 09/09/2025 23:43:29 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2025-09-09 23:43:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009444
;

-- 09/09/2025 23:46:26 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Menu (AD_Window_ID,AD_Menu_ID,IsSummary,"action",IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Description,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000147,3000562,'N','W','Y','N','LAR','Y','Categorias de Crédito','Categorias de Crédito',TO_TIMESTAMP('2025-09-09 23:46:26','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_TIMESTAMP('2025-09-09 23:46:26','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 09/09/2025 23:46:26 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000562 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 09/09/2025 23:46:26 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100,t.AD_Tree_ID, 3000562, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000562)
;

-- 09/09/2025 23:46:56 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005915,291,'LAR',0,'N','N','N','N',10,'N',19,'N',3001518,'N','Y','N','Categoria de Crédito','LAR_CategoriaCredito_ID',100,TO_TIMESTAMP('2025-09-09 23:46:56','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2025-09-09 23:46:56','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/09/2025 23:46:56 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005915 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/09/2025 23:47:37 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009449,10,'Y','N','N',3005915,'N','Y',223,'N','LAR','Categoria de Crédito',100,0,TO_TIMESTAMP('2025-09-09 23:47:37','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2025-09-09 23:47:37','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/09/2025 23:47:37 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009449 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/09/2025 23:50:02 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3009449
;

-- 09/09/2025 23:50:02 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=2428
;

-- 09/09/2025 23:50:02 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3002709
;

-- 09/09/2025 23:50:02 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3006610
;

-- 09/09/2025 23:50:02 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3006997
;

-- 09/09/2025 23:50:02 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3006576
;

-- 09/09/2025 23:50:21 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3009449
;

-- 09/09/2025 23:50:21 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=2427
;

-- 10/09/2025 18:31:16 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=263, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000012
;

-- 10/09/2025 18:31:16 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=263, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=165
;

-- 10/09/2025 18:31:16 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=263, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000562
;

-- 10/09/2025 18:31:16 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=263, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=372
;

-- 10/09/2025 18:31:16 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=263, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=271
;

-- 10/09/2025 18:31:16 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=263, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=528
;

-- 10/09/2025 18:31:16 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=263, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=414
;

-- 10/09/2025 18:31:16 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=263, SeqNo=7, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=238
;

-- 10/09/2025 18:31:16 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=263, SeqNo=8, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=396
;

-- 10/09/2025 18:31:20 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=266
;

-- 10/09/2025 18:31:20 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=232
;

-- 10/09/2025 18:31:20 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=190
;

-- 10/09/2025 18:31:20 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=127
;

-- 10/09/2025 18:31:20 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=133
;

-- 10/09/2025 18:31:20 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=172
;

-- 10/09/2025 18:31:20 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=173
;

-- 10/09/2025 18:31:20 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=7, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53256
;

-- 10/09/2025 18:31:20 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=8, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=110
;

-- 10/09/2025 18:31:20 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=9, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=394
;

-- 10/09/2025 18:31:20 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=10, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=506
;

-- 10/09/2025 18:31:20 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=11, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=420
;

-- 10/09/2025 18:31:20 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=12, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=451
;

-- 10/09/2025 18:31:20 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=13, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=186
;

-- 10/09/2025 18:31:20 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=14, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000562
;

-- 10/09/2025 18:31:20 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=15, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=473
;

-- 10/09/2025 18:31:23 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=266
;

-- 10/09/2025 18:31:23 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=232
;

-- 10/09/2025 18:31:23 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=190
;

-- 10/09/2025 18:31:23 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=127
;

-- 10/09/2025 18:31:23 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=133
;

-- 10/09/2025 18:31:23 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=172
;

-- 10/09/2025 18:31:23 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=173
;

-- 10/09/2025 18:31:23 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=7, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53256
;

-- 10/09/2025 18:31:23 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=8, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=110
;

-- 10/09/2025 18:31:23 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=9, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=394
;

-- 10/09/2025 18:31:23 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=10, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=506
;

-- 10/09/2025 18:31:23 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=11, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=420
;

-- 10/09/2025 18:31:23 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=12, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=451
;

-- 10/09/2025 18:31:23 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=13, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=186
;

-- 10/09/2025 18:31:23 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=14, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000562
;

-- 10/09/2025 18:31:23 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=15, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000562
;

-- 10/09/2025 18:31:23 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_TreeNodeMM SET Parent_ID=165, SeqNo=16, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=473
;

-- 10/09/2025 18:32:15 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_Tab SET IsSingleRow='Y',Updated=TO_TIMESTAMP('2025-09-10 18:32:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000317
;

-- 10/09/2025 18:32:23 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3009446
;

-- 10/09/2025 18:32:23 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3009448
;

-- 10/09/2025 18:32:56 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2025-09-10 18:32:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009444
;

-- 10/09/2025 18:35:20 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2025-09-10 18:35:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009448
;

-- 10/09/2025 18:36:33 ART
-- ISSUE #173: Categorias de Crédito.
UPDATE AD_Table SET AD_Window_ID=3000147,Updated=TO_TIMESTAMP('2025-09-10 18:36:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000280
;

-- 10/09/2025 18:39:13 ART
-- ISSUE #173: Categorias de Crédito.
INSERT INTO AD_ModelValidator (ModelValidationClass,EntityType,AD_ModelValidator_ID,SeqNo,Name,CreatedBy,AD_Client_ID,AD_Org_ID,Created,Updated,UpdatedBy,IsActive) VALUES ('ar.com.ergio.model.LAR_ValidatorSdN','LAR',3000009,0,'Model Validator para Localizacion Argentina (SdN)',100,0,0,TO_TIMESTAMP('2025-09-10 18:39:07','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2025-09-10 18:39:07','YYYY-MM-DD HH24:MI:SS'),100,'Y')
;

-- Registración de script
SELECT register_migration_script_lar('0239_ISSUE-173.sql', 'LAR', '')
;
