-- 2026-06-08
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas.

SET search_path TO adempiere, pg_catalog;

-- =========================================================
-- DDL
-- =========================================================

CREATE TABLE IF NOT EXISTS adempiere.LAR_CardSettlement_Hdr
(
    LAR_CardSettlement_Hdr_ID numeric(10,0) NOT NULL,
    AD_Client_ID              numeric(10,0) NOT NULL,
    AD_Org_ID                 numeric(10,0) NOT NULL,
    IsActive                  char(1)       DEFAULT 'Y'::bpchar NOT NULL,
    Created                   timestamp without time zone NOT NULL,
    CreatedBy                 numeric(10,0) NOT NULL,
    Updated                   timestamp without time zone NOT NULL,
    UpdatedBy                 numeric(10,0) NOT NULL,
    DocumentNo                character varying(30) NOT NULL,
    DocStatus                 character varying(2)  DEFAULT 'DR'::character varying NOT NULL,
    DocAction                 character varying(2)  DEFAULT 'CO'::character varying NOT NULL,
    Processing                char(1)       DEFAULT 'N'::bpchar NOT NULL,
    Processed                 char(1)       DEFAULT 'N'::bpchar NOT NULL,
    DateDoc                   timestamp without time zone NOT NULL,
    DateAcct                  timestamp without time zone NOT NULL,
    C_BPartner_ID             numeric(10,0) NOT NULL,
    OperationType             character varying(1) NOT NULL,
    TotalAmt                  numeric        DEFAULT 0 NOT NULL,
    Description               character varying(255),
    ProcessMsg                character varying(2000),
    CONSTRAINT LAR_CardSettlement_Hdr_Key PRIMARY KEY (LAR_CardSettlement_Hdr_ID),
    CONSTRAINT LAR_CardSettlement_Hdr_Op_chk CHECK (OperationType IN ('C','T')),
    CONSTRAINT LAR_CardSettlement_Hdr_IsActive_chk CHECK (IsActive IN ('Y','N')),
    CONSTRAINT LAR_CardSettlement_Hdr_Processing_chk CHECK (Processing IN ('Y','N')),
    CONSTRAINT LAR_CardSettlement_Hdr_Processed_chk CHECK (Processed IN ('Y','N'))
);

ALTER TABLE adempiere.LAR_CardSettlement_Hdr
    ADD CONSTRAINT LARCardSettlementHdr_Client
    FOREIGN KEY (AD_Client_ID) REFERENCES adempiere.AD_Client(AD_Client_ID);

ALTER TABLE adempiere.LAR_CardSettlement_Hdr
    ADD CONSTRAINT LARCardSettlementHdr_Org
    FOREIGN KEY (AD_Org_ID) REFERENCES adempiere.AD_Org(AD_Org_ID);

ALTER TABLE adempiere.LAR_CardSettlement_Hdr
    ADD CONSTRAINT LARCardSettlementHdr_BPartner
    FOREIGN KEY (C_BPartner_ID) REFERENCES adempiere.C_BPartner(C_BPartner_ID);

ALTER TABLE adempiere.LAR_CardSettlement
    ADD COLUMN IF NOT EXISTS LAR_CardSettlement_Hdr_ID numeric(10,0),
    ADD COLUMN IF NOT EXISTS Line numeric(10,0),
    ADD COLUMN IF NOT EXISTS VoidLine character(1);

ALTER TABLE adempiere.LAR_CardSettlement
    DROP CONSTRAINT IF EXISTS larcardsettlement_hdr;

ALTER TABLE adempiere.LAR_CardSettlement
    ADD CONSTRAINT larcardsettlement_hdr
    FOREIGN KEY (LAR_CardSettlement_Hdr_ID)
    REFERENCES adempiere.LAR_CardSettlement_Hdr(LAR_CardSettlement_Hdr_ID)
    ON DELETE CASCADE;

CREATE INDEX IF NOT EXISTS LAR_CardSettlement_Hdr_DocumentNo
    ON adempiere.LAR_CardSettlement_Hdr(DocumentNo);

CREATE INDEX IF NOT EXISTS LAR_CardSettlement_Hdr_BPartner
    ON adempiere.LAR_CardSettlement_Hdr(C_BPartner_ID);

CREATE INDEX IF NOT EXISTS LAR_CardSettlement_Hdr_OperationType
    ON adempiere.LAR_CardSettlement_Hdr(OperationType);

CREATE INDEX IF NOT EXISTS LAR_CardSettlement_Header
    ON adempiere.LAR_CardSettlement(LAR_CardSettlement_Hdr_ID);

CREATE INDEX IF NOT EXISTS LAR_CardSettlement_Line
    ON adempiere.LAR_CardSettlement(LAR_CardSettlement_Hdr_ID, Line);

-- =========================================================
-- DD Base
-- =========================================================

INSERT INTO AD_Table (AD_Table_ID,TableName,Name,AccessLevel,LoadSeq,ImportTable,IsView,IsHighVolume,IsSecurityEnabled,IsDeleteable,IsChangeLog,IsCentrallyMaintained,CopyColumnsFromTable,ReplicationType,EntityType,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive)
VALUES (3000288,'LAR_CardSettlement_Hdr','Cabecera Liquidación Operativa Tarjetas','3',0,'N','N','Y','N','Y','N','Y','N','L','LAR',0,0,100,100,TO_TIMESTAMP('2026-06-08 12:00:00','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:00','YYYY-MM-DD HH24:MI:SS'),'Y');

INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID,Name,IsTranslated,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,UpdatedBy)
SELECT l.AD_Language,t.AD_Table_ID,t.Name,'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.CreatedBy,t.Updated,t.UpdatedBy
FROM AD_Language l, AD_Table t
WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N'
  AND t.AD_Table_ID=3000288
  AND NOT EXISTS (SELECT 1 FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID);

INSERT INTO AD_Sequence (AD_Sequence_ID,Name,Description,IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive)
VALUES (3008248,'LAR_CardSettlement_Hdr','Table LAR_CardSettlement_Hdr',1,'N',200000,'Y',1000000,1000000,'N','Y',0,0,100,100,TO_TIMESTAMP('2026-06-08 12:00:01','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:01','YYYY-MM-DD HH24:MI:SS'),'Y');

INSERT INTO AD_Sequence (AD_Sequence_ID,Name,Description,IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive)
VALUES (3008249,'LAR_CardSettlement_Hdr_Doc','Document sequence for card settlement headers',1,'N',1,'N',1,1,'N','Y',0,0,100,100,TO_TIMESTAMP('2026-06-08 12:00:01','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:01','YYYY-MM-DD HH24:MI:SS'),'Y');

INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive)
VALUES (3001548,'LAR_CardSettlement_Hdr_ID','LAR','Cabecera Liquidación Operativa Tarjetas','Cabecera Liquidación Operativa Tarjetas',0,0,100,100,TO_TIMESTAMP('2026-06-08 12:00:02','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:02','YYYY-MM-DD HH24:MI:SS'),'Y');

INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID,Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name,IsTranslated,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,UpdatedBy)
SELECT l.AD_Language,t.AD_Element_ID,t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name,'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.CreatedBy,t.Updated,t.UpdatedBy
FROM AD_Language l, AD_Element t
WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N'
  AND t.AD_Element_ID IN (3001548)
  AND NOT EXISTS (SELECT 1 FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID);

-- =========================================================
-- Header columns
-- =========================================================

INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005989,3000288,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3001548,'N','N','N','Cabecera Liquidación Operativa Tarjetas','LAR_CardSettlement_Hdr_ID',100,100,TO_TIMESTAMP('2026-06-08 12:00:10','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005990,3000288,'LAR',0,'Y','N','N','A Client is a company or a legal entity.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,100,TO_TIMESTAMP('2026-06-08 12:00:10','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005991,3000288,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity.','N',10,'N',19,'N',113,'N','Y','N','Organizational entity within client','Organization','AD_Org_ID',100,100,TO_TIMESTAMP('2026-06-08 12:00:10','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005992,3000288,'LAR',0,'Y','N','N','The record is active in the system','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,100,TO_TIMESTAMP('2026-06-08 12:00:10','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005993,3000288,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,100,TO_TIMESTAMP('2026-06-08 12:00:10','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005994,3000288,'LAR',0,110,'Y','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,100,TO_TIMESTAMP('2026-06-08 12:00:10','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005995,3000288,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,100,TO_TIMESTAMP('2026-06-08 12:00:10','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005996,3000288,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,100,TO_TIMESTAMP('2026-06-08 12:00:10','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005997,3000288,'LAR',0,'Y','N','Y','Document sequence number of the document','N',30,'Y',10,'N',290,'N','N','N','Document sequence number of the document','Document No','DocumentNo',100,100,TO_TIMESTAMP('2026-06-08 12:00:11','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005998,3000288,'LAR',0,'Y','N','N','The Document Status indicates the status of a document at this time.','N',2,'Y',10,'N',289,'N','Y','N','The current status of the document','Document Status','DocStatus',100,100,TO_TIMESTAMP('2026-06-08 12:00:11','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005999,3000288,'LAR',0,'Y','N','N','You find the current status in the Document Status field.','N',2,'N',10,'N',287,'N','Y','N','The targeted status of the document','Document Action','DocAction',100,100,TO_TIMESTAMP('2026-06-08 12:00:11','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3006000,3000288,'LAR',0,'N','N','N','N',1,'N',20,'N',524,'N','Y','N','Process Now','Processing',100,100,TO_TIMESTAMP('2026-06-08 12:00:11','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3006001,3000288,'LAR',0,'Y','N','N','The Processed checkbox indicates that a document has been processed.','N',1,'N',20,'N',1047,'N','Y','N','The document has been processed','Processed','Processed',100,100,TO_TIMESTAMP('2026-06-08 12:00:11','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3006002,3000288,'LAR',0,'Y','N','N','The Document Date indicates the date the document was generated.','N',29,'Y',15,'N',265,'N','Y','N','Date of the Document','Document Date','DateDoc',100,100,TO_TIMESTAMP('2026-06-08 12:00:11','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3006003,3000288,'LAR',0,'Y','N','N','The Accounting Date indicates the date to be used on the General Ledger account entries generated from this document.','N',29,'N',15,'N',263,'N','Y','N','Accounting Date','Account Date','DateAcct',100,100,TO_TIMESTAMP('2026-06-08 12:00:11','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3006004,3000288,'LAR',0,'Y','N','N','A Business Partner is anyone with whom you transact.','N',10,'Y',30,'N',187,'N','Y','N','Identifies a Business Partner','Business Partner','C_BPartner_ID',100,100,TO_TIMESTAMP('2026-06-08 12:00:11','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3006005,3000288,'LAR',0,3000182,'Y','N','N','N',1,'Y',17,'N',3001539,'N','Y','N','Cheque o transferencia bancaria','Tipo de Operación','OperationType',100,100,TO_TIMESTAMP('2026-06-08 12:00:12','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive)
SELECT 3006006,3000288,'LAR',0,'Y','N','N','The Amount indicates the amount for this document line.','N',22,'Y',12,'N',e.AD_Element_ID,'N','Y','N','Total liquidado vigente de la operación','Total Liquidado','TotalAmt',100,100,TO_TIMESTAMP('2026-06-08 12:00:12','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y'
FROM AD_Element e
WHERE UPPER(e.ColumnName)='TOTALAMT';
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3006007,3000288,'LAR',0,'N','N','N','A description is limited to 255 characters.','N',255,'Y',10,'N',275,'N','Y','N','Optional short description of the record','Description','Description',100,100,TO_TIMESTAMP('2026-06-08 12:00:12','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3006008,3000288,'LAR',0,'N','N','N','N',2000,'N',10,'N',3001545,'N','Y','N','Mensaje de Proceso','ProcessMsg',100,100,TO_TIMESTAMP('2026-06-08 12:00:12','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');

-- Line columns on existing table
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3006009,3000284,'LAR',0,'Y','N','N','Y',10,'N',30,'N',3001548,'N','N','N','Cabecera Liquidación Operativa Tarjetas','LAR_CardSettlement_Hdr_ID',100,100,TO_TIMESTAMP('2026-06-08 12:00:12','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3006010,3000284,'LAR',0,'N','N','N','Indicates the unique line for a document. It will also control the display order of the lines within a document.','N',10,'N',11,'N',439,'N','Y','N','Unique line for this document','Line No','Line',100,100,TO_TIMESTAMP('2026-06-08 12:00:12','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');

INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID,Name,IsTranslated,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,UpdatedBy)
SELECT l.AD_Language,t.AD_Column_ID,t.Name,'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.CreatedBy,t.Updated,t.UpdatedBy
FROM AD_Language l, AD_Column t
WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N'
  AND t.AD_Column_ID BETWEEN 3005989 AND 3006010
  AND NOT EXISTS (SELECT 1 FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID);

-- =========================================================
-- Window + tabs
-- =========================================================

INSERT INTO AD_Tab (AD_Tab_ID,AD_Window_ID,SeqNo,AD_Table_ID,IsSingleRow,IsTranslationTab,IsSortTab,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive,Processing)
VALUES (3000321,3000149,10,3000288,'Y','N','N','N','N','N','N',0,'Y','N','LAR','Cabecera Liquidación Tarjetas',0,0,100,100,TO_TIMESTAMP('2026-06-08 12:00:21','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:21','YYYY-MM-DD HH24:MI:SS'),'Y','N');

INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID,Help,CommitWarning,Name,Description,IsTranslated,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,UpdatedBy)
SELECT l.AD_Language,t.AD_Tab_ID,t.Help,t.CommitWarning,t.Name,t.Description,'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.CreatedBy,t.Updated,t.UpdatedBy
FROM AD_Language l, AD_Tab t
WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N'
  AND t.AD_Tab_ID IN (3000321)
  AND NOT EXISTS (SELECT 1 FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID);

-- =========================================================
-- Fields
-- =========================================================

INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009522,3000321,3005989,10,'N',0,'N','N','N','Y','N','N','LAR','Cabecera Liquidación Operativa Tarjetas',NULL,NULL,0,0,100,100,TO_TIMESTAMP('2026-06-08 12:00:29','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:29','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009523,3000321,3005990,10,'N',0,'N','N','N','Y','N','N','LAR','Client','Client/Tenant for this installation.','A Client is a company or a legal entity.',0,0,100,100,TO_TIMESTAMP('2026-06-08 12:00:29','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:29','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009524,3000321,3005992,1,'N',0,'N','N','N','Y','N','N','LAR','Active','The record is active in the system','The record is active in the system',0,0,100,100,TO_TIMESTAMP('2026-06-08 12:00:29','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:29','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009525,3000321,3006000,1,'N',0,'N','N','N','Y','N','N','LAR','Process Now',NULL,NULL,0,0,100,100,TO_TIMESTAMP('2026-06-08 12:00:29','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:29','YYYY-MM-DD HH24:MI:SS'),'Y');

INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009510,3000321,3005991,10,'Y',10,'N','N','N','Y','N','N','LAR','Organization','Organizational entity within client','An organization is a unit of your client or legal entity.',0,0,100,100,TO_TIMESTAMP('2026-06-08 12:00:30','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:30','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009511,3000321,3005997,30,'Y',20,'Y','N','N','Y','Y','N','LAR','Document No','Document sequence number of the document','Document sequence number of the document',0,0,100,100,TO_TIMESTAMP('2026-06-08 12:00:30','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:30','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009512,3000321,3005998,2,'Y',30,'N','N','N','Y','Y','N','LAR','Document Status','The current status of the document','The current status of the document',0,0,100,100,TO_TIMESTAMP('2026-06-08 12:00:30','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:30','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009513,3000321,3005999,2,'Y',40,'Y','N','N','Y','N','N','LAR','Document Action','The targeted status of the document','The targeted status of the document',0,0,100,100,TO_TIMESTAMP('2026-06-08 12:00:30','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:30','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009514,3000321,3006002,20,'Y',50,'N','N','N','Y','N','N','LAR','Document Date','Date of the Document','The Document Date indicates the date the document was generated.',0,0,100,100,TO_TIMESTAMP('2026-06-08 12:00:30','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:30','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009515,3000321,3006003,20,'Y',60,'Y','N','N','Y','N','N','LAR','Account Date','Accounting Date','The Accounting Date indicates the date to be used on the General Ledger account entries generated from this document.',0,0,100,100,TO_TIMESTAMP('2026-06-08 12:00:30','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:30','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009516,3000321,3006004,10,'Y',70,'N','N','N','Y','N','N','LAR','Business Partner','Identifies a Business Partner','A Business Partner is anyone with whom you transact.',0,0,100,100,TO_TIMESTAMP('2026-06-08 12:00:31','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:31','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009517,3000321,3006005,10,'Y',80,'Y','N','N','Y','N','N','LAR','Tipo de Operación','Cheque o transferencia bancaria',NULL,0,0,100,100,TO_TIMESTAMP('2026-06-08 12:00:31','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:31','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009518,3000321,3006006,22,'Y',90,'N','N','N','N','Y','N','LAR','Total Liquidado','Total liquidado vigente de la operación',NULL,0,0,100,100,TO_TIMESTAMP('2026-06-08 12:00:31','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:31','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009519,3000321,3006007,255,'Y',100,'N','N','N','Y','N','N','LAR','Description','Optional short description of the record','A description is limited to 255 characters.',0,0,100,100,TO_TIMESTAMP('2026-06-08 12:00:31','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:31','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009520,3000321,3006008,80,'Y',110,'N','N','N','Y','Y','N','LAR','Mensaje de Proceso','Mensaje técnico o funcional del procesamiento del documento',NULL,0,0,100,100,TO_TIMESTAMP('2026-06-08 12:00:31','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:31','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009521,3000321,3006001,1,'Y',120,'N','N','N','Y','Y','N','LAR','Processed','The document has been processed',NULL,0,0,100,100,TO_TIMESTAMP('2026-06-08 12:00:31','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:31','YYYY-MM-DD HH24:MI:SS'),'Y');

INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID,Help,Description,Name,IsTranslated,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,UpdatedBy)
SELECT l.AD_Language,t.AD_Field_ID,t.Help,t.Description,t.Name,'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.CreatedBy,t.Updated,t.UpdatedBy
FROM AD_Language l, AD_Field t
WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N'
  AND t.AD_Field_ID BETWEEN 3009510 AND 3009525
  AND NOT EXISTS (SELECT 1 FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID);

-- =========================================================
-- Header workflow/process
-- =========================================================

INSERT INTO AD_Workflow (Cost,WorkingTime,AccessLevel,Author,AD_Workflow_ID,Duration,DurationUnit,EntityType,IsDefault,IsValid,PublishStatus,Version,AD_Table_ID,DocumentNo,WaitingTime,IsBetaFunctionality,WorkflowType,Name,Value,Description,UpdatedBy,Updated,Created,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive)
VALUES (0,0,'1','Ergio',3000016,0,'D','LAR','N','N','R',0,3000288,'4000004',0,'N','P','Process_LAR_CardSettlement_Hdr','Process_LAR_CardSettlement_Hdr','(Standard Process LAR_CardSettlement_Hdr)',100,TO_TIMESTAMP('2026-06-08 12:00:41','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 12:00:41','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y');

INSERT INTO AD_Process (AD_Workflow_ID,AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Value,Name,AD_Org_ID,AD_Client_ID,Created,CreatedBy,Updated,UpdatedBy,IsActive)
VALUES (3000016,3000635,'N','N','1','N','N','Y','LAR',0,0,'LAR_CardSettlement_Hdr_Process','Process LAR_CardSettlement_Hdr',0,0,TO_TIMESTAMP('2026-06-08 12:00:41','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2026-06-08 12:00:41','YYYY-MM-DD HH24:MI:SS'),100,'Y');

INSERT INTO AD_Workflow_Trl (AD_Language,AD_Workflow_ID,Help,Name,Description,IsTranslated,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,UpdatedBy)
SELECT l.AD_Language,t.AD_Workflow_ID,t.Help,t.Name,t.Description,'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.CreatedBy,t.Updated,t.UpdatedBy
FROM AD_Language l, AD_Workflow t
WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N'
  AND t.AD_Workflow_ID=3000016
  AND NOT EXISTS (SELECT 1 FROM AD_Workflow_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Workflow_ID=t.AD_Workflow_ID);

INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID,Help,Description,Name,IsTranslated,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,UpdatedBy)
SELECT l.AD_Language,t.AD_Process_ID,t.Help,t.Description,t.Name,'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.CreatedBy,t.Updated,t.UpdatedBy
FROM AD_Language l, AD_Process t
WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N'
  AND t.AD_Process_ID=3000635
  AND NOT EXISTS (SELECT 1 FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID);

INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,"limit",WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,AD_Workflow_ID,"action",SplitElement,Value,Name,Description,UpdatedBy,AD_Org_ID,Created,CreatedBy,IsActive,Updated,AD_Client_ID) VALUES (3000067,0,0,0,'CO',0,'LAR','Y','X',0,0,0,0,0,0,3000016,'Z','X','(Start)','(Start)','(Standard Node)',100,0,TO_TIMESTAMP('2026-06-08 12:00:42','YYYY-MM-DD HH24:MI:SS'),100,'Y',TO_TIMESTAMP('2026-06-08 12:00:42','YYYY-MM-DD HH24:MI:SS'),0);
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,"limit",WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,AD_Workflow_ID,"action",SplitElement,Value,Name,Description,UpdatedBy,AD_Org_ID,Created,CreatedBy,IsActive,Updated,AD_Client_ID) VALUES (3000068,0,0,0,'--',0,'LAR','Y','X',0,0,0,0,0,0,3000016,'D','X','(DocAuto)','(DocAuto)','(Standard Node)',100,0,TO_TIMESTAMP('2026-06-08 12:00:42','YYYY-MM-DD HH24:MI:SS'),100,'Y',TO_TIMESTAMP('2026-06-08 12:00:42','YYYY-MM-DD HH24:MI:SS'),0);
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,"limit",WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,AD_Workflow_ID,"action",SplitElement,Value,Name,Description,UpdatedBy,AD_Org_ID,Created,CreatedBy,IsActive,Updated,AD_Client_ID) VALUES (3000069,0,0,0,'PR',0,'LAR','Y','X',0,0,0,0,0,0,3000016,'D','X','(DocPrepare)','(DocPrepare)','(Standard Node)',100,0,TO_TIMESTAMP('2026-06-08 12:00:42','YYYY-MM-DD HH24:MI:SS'),100,'Y',TO_TIMESTAMP('2026-06-08 12:00:42','YYYY-MM-DD HH24:MI:SS'),0);
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,"limit",WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,AD_Workflow_ID,"action",SplitElement,Value,Name,Description,UpdatedBy,AD_Org_ID,Created,CreatedBy,IsActive,Updated,AD_Client_ID) VALUES (3000070,0,0,0,'CO',0,'LAR','Y','X',0,0,0,0,0,0,3000016,'D','X','(DocComplete)','(DocComplete)','(Standard Node)',100,0,TO_TIMESTAMP('2026-06-08 12:00:42','YYYY-MM-DD HH24:MI:SS'),100,'Y',TO_TIMESTAMP('2026-06-08 12:00:42','YYYY-MM-DD HH24:MI:SS'),0);

INSERT INTO AD_WF_Node_Trl (AD_Language,AD_WF_Node_ID,Help,Name,Description,IsTranslated,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,UpdatedBy)
SELECT l.AD_Language,t.AD_WF_Node_ID,t.Help,t.Name,t.Description,'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.CreatedBy,t.Updated,t.UpdatedBy
FROM AD_Language l, AD_WF_Node t
WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N'
  AND t.AD_WF_Node_ID IN (3000067,3000068,3000069,3000070)
  AND NOT EXISTS (SELECT 1 FROM AD_WF_Node_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_WF_Node_ID=t.AD_WF_Node_ID);

INSERT INTO AD_WF_NodeNext (EntityType,IsStdUserWorkflow,AD_WF_NodeNext_ID,AD_WF_Node_ID,SeqNo,AD_WF_Next_ID,Description,Created,UpdatedBy,CreatedBy,AD_Org_ID,IsActive,Updated,AD_Client_ID) VALUES ('LAR','N',3000053,3000069,100,3000070,'(Standard Transition)',TO_TIMESTAMP('2026-06-08 12:00:43','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',TO_TIMESTAMP('2026-06-08 12:00:43','YYYY-MM-DD HH24:MI:SS'),0);
INSERT INTO AD_WF_NodeNext (EntityType,IsStdUserWorkflow,AD_WF_NodeNext_ID,AD_WF_Node_ID,SeqNo,AD_WF_Next_ID,Description,Created,UpdatedBy,CreatedBy,AD_Org_ID,IsActive,Updated,AD_Client_ID) VALUES ('LAR','Y',3000054,3000067,10,3000069,'(Standard Approval)',TO_TIMESTAMP('2026-06-08 12:00:43','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',TO_TIMESTAMP('2026-06-08 12:00:43','YYYY-MM-DD HH24:MI:SS'),0);
INSERT INTO AD_WF_NodeNext (EntityType,IsStdUserWorkflow,AD_WF_NodeNext_ID,AD_WF_Node_ID,SeqNo,AD_WF_Next_ID,Description,Created,UpdatedBy,CreatedBy,AD_Org_ID,IsActive,Updated,AD_Client_ID) VALUES ('LAR','N',3000055,3000067,100,3000068,'(Standard Transition)',TO_TIMESTAMP('2026-06-08 12:00:43','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',TO_TIMESTAMP('2026-06-08 12:00:43','YYYY-MM-DD HH24:MI:SS'),0);

UPDATE AD_WF_Node
SET DocAction='--', Updated=CURRENT_TIMESTAMP, UpdatedBy=100
WHERE AD_WF_Node_ID=3000068;

UPDATE AD_Workflow
SET IsValid='Y', AD_WF_Node_ID=3000067, Updated=CURRENT_TIMESTAMP, UpdatedBy=100
WHERE AD_Workflow_ID=3000016;

-- =========================================================
-- DD adjustments and menu routing
-- =========================================================

UPDATE AD_Column
SET AD_Reference_ID=17,
    AD_Reference_Value_ID=131,
    DefaultValue='DR',
    IsMandatory='Y',
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Column_ID=3005998;

UPDATE AD_Column
SET AD_Reference_ID=28,
    AD_Reference_Value_ID=135,
    DefaultValue='CO',
    IsMandatory='Y',
    AD_Process_ID=3000635,
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Column_ID=3005999;

UPDATE AD_Column
SET DefaultValue='@#Date@',
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Column_ID IN (3006002,3006003);

UPDATE AD_Column
SET DefaultValue='Y',
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Column_ID=3005992;

UPDATE AD_Column
SET DefaultValue='N',
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Column_ID IN (3006000,3006001);

UPDATE AD_Column
SET DefaultValue='C',
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Column_ID=3006005;

UPDATE AD_Column
SET AD_Reference_ID=30,
    AD_Reference_Value_ID=NULL,
    IsMandatory='Y',
    IsParent='Y',
    IsUpdateable='N',
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Column_ID=3006009;

UPDATE AD_Column
SET DefaultValue='@SQL=SELECT COALESCE(MAX(Line),0)+10 AS DefaultValue FROM LAR_CardSettlement WHERE LAR_CardSettlement_Hdr_ID=@LAR_CardSettlement_Hdr_ID@',
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Column_ID=3006010;

UPDATE AD_Table
SET AD_Window_ID=3000149, Updated=CURRENT_TIMESTAMP, UpdatedBy=100
WHERE AD_Table_ID=3000288;

UPDATE AD_Tab
SET AD_Window_ID=3000149,
    SeqNo=20,
    TabLevel=1,
    Parent_Column_ID=3006009,
    AD_Column_ID=3006009,
    Name='Detalle de Liquidación',
    Description='Líneas operativas de cheques o transferencias para la misma liquidación.',
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Tab_ID=3000319;

UPDATE AD_Tab
SET AD_Column_ID=NULL,
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Tab_ID=3000321;

INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive)
VALUES (3001549,'VoidLine','LAR','Anular Línea','Anular Línea',0,0,100,100,TO_TIMESTAMP('2026-06-09 14:10:00','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-09 14:10:00','YYYY-MM-DD HH24:MI:SS'),'Y');

INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID,Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name,IsTranslated,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,UpdatedBy)
SELECT l.AD_Language,t.AD_Element_ID,t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name,'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.CreatedBy,t.Updated,t.UpdatedBy
FROM AD_Language l, AD_Element t
WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N'
  AND t.AD_Element_ID=3001549
  AND NOT EXISTS (SELECT 1 FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID);

INSERT INTO AD_Process (AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Classname,Value,Name,Description,AD_Org_ID,AD_Client_ID,Created,CreatedBy,Updated,UpdatedBy,IsActive)
VALUES (3000636,'N','N','1','N','N','Y','LAR',0,0,'ar.com.ergio.process.LAR_VoidCardSettlementLine','LAR_VoidCardSettlementLine','Anular Línea Liquidación Tarjetas','Anula individualmente una línea de liquidación operativa de tarjetas ya completada.',0,0,TO_TIMESTAMP('2026-06-09 14:10:01','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2026-06-09 14:10:01','YYYY-MM-DD HH24:MI:SS'),100,'Y');

INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID,Help,Description,Name,IsTranslated,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,UpdatedBy)
SELECT l.AD_Language,t.AD_Process_ID,t.Help,t.Description,t.Name,'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.CreatedBy,t.Updated,t.UpdatedBy
FROM AD_Language l, AD_Process t
WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N'
  AND t.AD_Process_ID=3000636
  AND NOT EXISTS (SELECT 1 FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID);

INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,IsSyncDatabase,AD_Process_ID,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive)
VALUES (3006011,3000284,'LAR',0,'N','N','N','N',1,'N',28,'N',3001549,'N','Y','N','N',3000636,'Anular Línea','VoidLine',100,100,TO_TIMESTAMP('2026-06-09 14:10:02','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-09 14:10:02','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');

INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID,Name,IsTranslated,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,UpdatedBy)
SELECT l.AD_Language,t.AD_Column_ID,t.Name,'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.CreatedBy,t.Updated,t.UpdatedBy
FROM AD_Language l, AD_Column t
WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N'
  AND t.AD_Column_ID=3006011
  AND NOT EXISTS (SELECT 1 FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID);

INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive)
VALUES (3009526,3000319,3006009,10,'N',0,'N','N','N','Y','N','N','LAR','Cabecera Liquidación Operativa Tarjetas',NULL,NULL,0,0,100,100,TO_TIMESTAMP('2026-06-09 12:35:00','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-09 12:35:00','YYYY-MM-DD HH24:MI:SS'),'Y');

INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,DisplayLogic,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive)
VALUES (3009527,3000319,3006011,1,'Y',255,'Y','N','N','Y','N','N','@DocStatus@=''CO''','LAR','Anular Línea','Anula en forma individual la línea seleccionada de la liquidación.','Disponible solo para líneas completadas.',0,0,100,100,TO_TIMESTAMP('2026-06-09 14:10:03','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-09 14:10:03','YYYY-MM-DD HH24:MI:SS'),'Y');

INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID,Help,Description,Name,IsTranslated,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,UpdatedBy)
SELECT l.AD_Language,t.AD_Field_ID,t.Help,t.Description,t.Name,'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.CreatedBy,t.Updated,t.UpdatedBy
FROM AD_Language l, AD_Field t
WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N'
  AND t.AD_Field_ID IN (3009526,3009527)
  AND NOT EXISTS (SELECT 1 FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID);

UPDATE AD_Window
SET Description='Cabecera operativa para liquidaciones con múltiples cheques o transferencias.',
    Help='La cabecera agrupa varias líneas del mismo tipo de operación. Al completar, el sistema genera y procesa los documentos de cada línea en una sola acción.',
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Window_ID=3000149;

UPDATE AD_Menu
SET AD_Window_ID=3000149,
    Name='Liquidación Operativa Tarjetas',
    Description='Cabecera operativa para liquidaciones con múltiples cheques o transferencias.',
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Menu_ID=3000577;

INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID,Name,Description,IsTranslated,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,UpdatedBy)
SELECT l.AD_Language,t.AD_Menu_ID,t.Name,t.Description,'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.CreatedBy,t.Updated,t.UpdatedBy
FROM AD_Language l, AD_Menu t
WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N'
  AND t.AD_Menu_ID=3000577
  AND NOT EXISTS (SELECT 1 FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID);

UPDATE AD_Table_Trl
SET Name='Cabecera Liquidación Operativa Tarjetas',
    IsTranslated='Y',
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Table_ID=3000288
  AND AD_Language='es_AR';

UPDATE AD_Element_Trl
SET Name='Cabecera Liquidación Operativa Tarjetas',
    PrintName='Cabecera Liquidación Operativa Tarjetas',
    IsTranslated='Y',
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Element_ID=3001548
  AND AD_Language='es_AR';

UPDATE AD_Column_Trl
SET Name='Cabecera Liquidación Operativa Tarjetas',
    IsTranslated='Y',
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Column_ID IN (3005989,3006009)
  AND AD_Language='es_AR';

UPDATE AD_Column_Trl
SET Name='Total Liquidado',
    IsTranslated='Y',
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Column_ID=3006006
  AND AD_Language='es_AR';

UPDATE AD_Column_Trl
SET Name='Línea',
    IsTranslated='Y',
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Column_ID=3006010
  AND AD_Language='es_AR';

UPDATE AD_Window_Trl
SET Name='Liquidación Operativa Tarjetas',
    Description='Cabecera operativa para liquidaciones con múltiples cheques o transferencias.',
    Help='La cabecera agrupa varias líneas del mismo tipo de operación. Al completar, el sistema genera y procesa los documentos de cada línea en una sola acción.',
    IsTranslated='Y',
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Window_ID=3000149
  AND AD_Language='es_AR';

UPDATE AD_Tab_Trl
SET Name='Cabecera Liquidación Tarjetas',
    IsTranslated='Y',
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Tab_ID=3000321
  AND AD_Language='es_AR';

UPDATE AD_Tab_Trl
SET Name='Detalle de Liquidación',
    Description='Líneas operativas de cheques o transferencias para la misma liquidación.',
    IsTranslated='Y',
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Tab_ID=3000319
  AND AD_Language='es_AR';

UPDATE AD_Field_Trl
SET Name='Total Liquidado',
    Description='Total liquidado vigente de la operación',
    IsTranslated='Y',
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Field_ID=3009518
  AND AD_Language='es_AR';

UPDATE AD_Field_Trl
SET Name='Anular Línea',
    Description='Anula en forma individual la línea seleccionada de la liquidación.',
    Help='Disponible solo para líneas completadas.',
    IsTranslated='Y',
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Field_ID=3009527
  AND AD_Language='es_AR';

UPDATE AD_Process_Trl
SET Name='Procesar Cabecera Liquidación Operativa Tarjetas',
    Description='Proceso documental de la cabecera de liquidación operativa de tarjetas',
    IsTranslated='Y',
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Process_ID=3000635
  AND AD_Language='es_AR';

UPDATE AD_Process_Trl
SET Name='Anular Línea Liquidación Tarjetas',
    Description='Anula individualmente una línea de liquidación operativa de tarjetas ya completada.',
    IsTranslated='Y',
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Process_ID=3000636
  AND AD_Language='es_AR';

UPDATE AD_Process
SET IsServerProcess='N',
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Process_ID=3000636;

UPDATE AD_Element_Trl
SET Name='Anular Línea',
    PrintName='Anular Línea',
    IsTranslated='Y',
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Element_ID=3001549
  AND AD_Language='es_AR';

UPDATE AD_Column_Trl
SET Name='Anular Línea',
    IsTranslated='Y',
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Column_ID=3006011
  AND AD_Language='es_AR';

UPDATE AD_Field
SET IsDisplayed='N',
    SeqNo=0,
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Field_ID=3009485;

UPDATE AD_Workflow_Trl
SET Name='Procesar Cabecera Liquidación Operativa Tarjetas',
    Description='Workflow documental de la cabecera de liquidación operativa de tarjetas',
    IsTranslated='Y',
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Workflow_ID=3000016
  AND AD_Language='es_AR';

UPDATE AD_Menu_Trl
SET Name='Liquidación Operativa Tarjetas',
    Description='Cabecera operativa para liquidaciones con múltiples cheques o transferencias.',
    IsTranslated='Y',
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Menu_ID=3000577 AND AD_Language='es_AR';

-- 09/06/2026 12:12:14 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET DefaultValue='@SQL=SELECT C_Bpartner_ID FROM LAR_CardSettlement_Hdr hdr WHERE hdr.LAR_CardSettlement_Hdr_ID = @LAR_CardSettlement_Hdr_ID@',Updated=TO_TIMESTAMP('2026-06-09 12:12:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009488
;

-- 09/06/2026 12:13:07 ART
-- ADP #2: Migracion de datos
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_TIMESTAMP('2026-06-09 12:13:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005974
;

-- 09/06/2026 12:13:18 ART
-- ADP #2: Migracion de datos
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_TIMESTAMP('2026-06-09 12:13:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005985
;

-- 09/06/2026 12:13:24 ART
-- ADP #2: Migracion de datos
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_TIMESTAMP('2026-06-09 12:13:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005981
;

-- 09/06/2026 12:13:39 ART
-- ADP #2: Migracion de datos
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_TIMESTAMP('2026-06-09 12:13:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005967
;

-- 09/06/2026 12:13:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_TIMESTAMP('2026-06-09 12:13:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005966
;

-- 09/06/2026 12:13:50 ART
-- ADP #2: Migracion de datos
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_TIMESTAMP('2026-06-09 12:13:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005965
;

-- 09/06/2026 12:14:10 ART
-- ADP #2: Migracion de datos
UPDATE AD_Column SET IsUpdateable='N', IsAllowCopy='N',Updated=TO_TIMESTAMP('2026-06-09 12:14:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005957
;

-- 09/06/2026 12:14:14 ART
-- ADP #2: Migracion de datos
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_TIMESTAMP('2026-06-09 12:14:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3006010
;

-- 09/06/2026 12:14:20 ART
-- ADP #2: Migracion de datos
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_TIMESTAMP('2026-06-09 12:14:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005984
;

-- 09/06/2026 12:14:23 ART
-- ADP #2: Migracion de datos
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_TIMESTAMP('2026-06-09 12:14:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005969
;

-- 09/06/2026 12:14:26 ART
-- ADP #2: Migracion de datos
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_TIMESTAMP('2026-06-09 12:14:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005968
;

-- 09/06/2026 12:14:29 ART
-- ADP #2: Migracion de datos
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_TIMESTAMP('2026-06-09 12:14:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005986
;

-- 09/06/2026 12:14:34 ART
-- ADP #2: Migracion de datos
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_TIMESTAMP('2026-06-09 12:14:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005983
;

-- 09/06/2026 12:14:57 ART
-- ADP #2: Migracion de datos
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_TIMESTAMP('2026-06-09 12:14:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005988
;

-- 09/06/2026 12:20:46 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3009523
;

-- 09/06/2026 12:20:46 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3009511
;

-- 09/06/2026 12:20:46 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3009512
;

-- 09/06/2026 12:20:46 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3009513
;

-- 09/06/2026 12:20:46 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3009514
;

-- 09/06/2026 12:20:46 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3009515
;

-- 09/06/2026 12:20:46 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3009516
;

-- 09/06/2026 12:20:46 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3009517
;

-- 09/06/2026 12:20:46 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3009518
;

-- 09/06/2026 12:20:46 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3009519
;

-- 09/06/2026 12:20:46 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3009520
;

-- 09/06/2026 12:20:46 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3009521
;

-- 09/06/2026 12:20:57 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2026-06-09 12:20:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009523
;

-- 09/06/2026 12:21:01 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2026-06-09 12:21:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009511
;

-- 09/06/2026 12:21:31 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3009514
;

-- 09/06/2026 12:21:31 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3009515
;

-- 09/06/2026 12:21:31 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3009511
;

-- 09/06/2026 12:21:31 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3009512
;

-- 09/06/2026 12:21:31 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3009513
;

-- 09/06/2026 12:22:00 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3009505
;

-- 09/06/2026 12:22:00 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3009482
;

-- 09/06/2026 12:22:00 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3009483
;

-- 09/06/2026 12:22:00 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3009489
;

-- 09/06/2026 12:22:00 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3009488
;

-- 09/06/2026 12:22:00 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3009490
;

-- 09/06/2026 12:22:00 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3009491
;

-- 09/06/2026 12:22:00 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3009508
;

-- 09/06/2026 12:22:00 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3009492
;

-- 09/06/2026 12:22:00 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3009493
;

-- 09/06/2026 12:22:00 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3009494
;

-- 09/06/2026 12:22:00 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3009495
;

-- 09/06/2026 12:22:00 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3009496
;

-- 09/06/2026 12:22:00 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3009497
;

-- 09/06/2026 12:22:00 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3009509
;

-- 09/06/2026 12:22:00 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3009498
;

-- 09/06/2026 12:22:00 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3009499
;

-- 09/06/2026 12:22:00 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3009500
;

-- 09/06/2026 12:22:00 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3009501
;

-- 09/06/2026 12:22:00 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3009502
;

-- 09/06/2026 12:22:00 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3009503
;

-- 09/06/2026 12:22:00 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3009484
;

-- 09/06/2026 12:22:00 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3009485
;

-- 09/06/2026 12:22:13 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2026-06-09 12:22:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009483
;

-- 09/06/2026 12:22:19 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2026-06-09 12:22:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009482
;

-- 09/06/2026 12:22:30 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3009523
;

-- 09/06/2026 12:22:30 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3009510
;

-- 09/06/2026 12:22:37 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2026-06-09 12:22:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009523
;

-- 09/06/2026 12:22:40 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2026-06-09 12:22:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009510
;

-- 09/06/2026 12:24:07 ART
-- ADP #2: Migracion de datos
UPDATE AD_Field SET DisplayLogic='@DocStatus@ = ''CO''',Updated=TO_TIMESTAMP('2026-06-09 12:24:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009485
;

-- 09/06/2026 12:26:34 ART
-- ADP #2: Migracion de datos
UPDATE AD_Column SET IsMandatory='Y',Updated=TO_TIMESTAMP('2026-06-09 12:26:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005981
;

-- 09/06/2026 12:26:46 ART
-- ADP #2: Migracion de datos
UPDATE AD_Column SET IsMandatory='Y',Updated=TO_TIMESTAMP('2026-06-09 12:26:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005988
;

-- 09/06/2026 14:11:00 ART
-- ISSUE #174: ocultar DocAction estandar en lineas y usar boton propio
UPDATE AD_Field
SET IsDisplayed='N',
    SeqNo=0,
    DisplayLogic=NULL,
    Updated=TO_TIMESTAMP('2026-06-09 14:11:00','YYYY-MM-DD HH24:MI:SS'),
    UpdatedBy=100
WHERE AD_Field_ID=3009485
;


-- 09/06/2026 14:48:56 ART
-- ADP #2: Migracion de datos
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_TIMESTAMP('2026-06-09 14:48:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3006011
;

SELECT register_migration_script_lar('0251_ISSUE-174.sql', 'LAR', '');
