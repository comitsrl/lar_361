 -- DROP TABLE IF EXISTS adempiere.lar_disposicionfinal;

CREATE TABLE IF NOT EXISTS adempiere.lar_disposicionfinal
(
    lar_disposicionfinal_id numeric(10,0) NOT NULL,
    ad_client_id numeric(10,0) NOT NULL,
    ad_org_id numeric(10,0) NOT NULL,
    isactive character(1) COLLATE pg_catalog."default" NOT NULL DEFAULT 'Y'::bpchar,
    created timestamp without time zone NOT NULL DEFAULT now(),
    createdby numeric(10,0) NOT NULL,
    updated timestamp without time zone NOT NULL DEFAULT now(),
    updatedby numeric(10,0) NOT NULL,
    documentno character varying(30) COLLATE pg_catalog."default" NOT NULL,
    description character varying(255) COLLATE pg_catalog."default",
    fecha timestamp without time zone NOT NULL,
    c_bpartner_id numeric(10,0) NOT NULL,
    docstatus character(2) COLLATE pg_catalog."default" NOT NULL,
    docaction character(2) COLLATE pg_catalog."default" NOT NULL,
    processing character(1) COLLATE pg_catalog."default",
    processed character(1) COLLATE pg_catalog."default" NOT NULL DEFAULT 'N'::bpchar,
    c_doctype_id numeric(10,0) NOT NULL,
	direccion character varying(60) COLLATE pg_catalog."default" NOT NULL,
	peso numeric(10,2),
	generarNC character(1) COLLATE pg_catalog."default",
	c_invoice_id numeric(10,0),
    CONSTRAINT lar_disposicionfinal_pkey PRIMARY KEY (lar_disposicionfinal_id),
    CONSTRAINT adclient_lardisposicionfinal FOREIGN KEY (ad_client_id)
        REFERENCES adempiere.ad_client (ad_client_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT adorg_lardisposicionfinal FOREIGN KEY (ad_org_id)
        REFERENCES adempiere.ad_org (ad_org_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT c_doctype_lardisposicionfinal FOREIGN KEY (c_doctype_id)
        REFERENCES adempiere.c_doctype (c_doctype_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
	CONSTRAINT cinvoice_lardisposicionfinal FOREIGN KEY (c_invoice_id)
        REFERENCES adempiere.c_invoice (c_invoice_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT cbpartner_lardisposicionfinal FOREIGN KEY (c_bpartner_id)
        REFERENCES adempiere.c_bpartner (c_bpartner_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT lardisposicionfinal_isactive_check CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS adempiere.lar_disposicionfinal
    OWNER to adempiere;

-- DROP TABLE IF EXISTS adempiere.lar_disposicionfinalline;

CREATE TABLE IF NOT EXISTS adempiere.lar_disposicionfinalline
(
    lar_disposicionfinalline_id numeric(10,0) NOT NULL,
    ad_client_id numeric(10,0) NOT NULL,
    ad_org_id numeric(10,0) NOT NULL,
    isactive character(1) COLLATE pg_catalog."default" NOT NULL DEFAULT 'Y'::bpchar,
    created timestamp without time zone NOT NULL DEFAULT now(),
    createdby numeric(10,0) NOT NULL,
    updated timestamp without time zone NOT NULL DEFAULT now(),
    updatedby numeric(10,0) NOT NULL,
    lar_disposicionfinal_id numeric(10,0) NOT NULL,
    line numeric(10,0) NOT NULL,
    description character varying(255) COLLATE pg_catalog."default",
    m_product_id numeric(10,0) NOT NULL,
    c_uom_id numeric(10,0) NOT NULL,
    cantidad numeric NOT NULL DEFAULT 1,
    CONSTRAINT lar_disposicionfinalline_pkey PRIMARY KEY (lar_disposicionfinalline_id),
    CONSTRAINT adclient_lardisposicionfinalline FOREIGN KEY (ad_client_id)
        REFERENCES adempiere.ad_client (ad_client_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT adorg_lardisposicionfinalline FOREIGN KEY (ad_org_id)
        REFERENCES adempiere.ad_org (ad_org_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT cuom_lardisposicionfinalline FOREIGN KEY (c_uom_id)
        REFERENCES adempiere.c_uom (c_uom_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT lardisposicionfinal_lardisposicionfinalline FOREIGN KEY (lar_disposicionfinal_id)
        REFERENCES adempiere.lar_disposicionfinal (lar_disposicionfinal_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT mproduct_lar_disposicionfinalline FOREIGN KEY (m_product_id)
        REFERENCES adempiere.m_product (m_product_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT lar_disposicionfinalline_isactive_check CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS adempiere.lar_disposicionfinalline
    OWNER to adempiere;

-- 31/10/2023 22:52:49 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,ImportTable,IsHighVolume,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','3',0,3000271,'N','N','N','Y','N','LAR','Y','Y','L','LAR_DisposicionFinal','Disposición Final',0,'Y',0,100,TO_DATE('2023-10-31 22:52:48','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2023-10-31 22:52:48','YYYY-MM-DD HH24:MI:SS'))
;

-- 31/10/2023 22:52:49 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000271 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- 31/10/2023 22:52:49 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,UpdatedBy,AD_Client_ID,Updated,Created,CreatedBy,IsActive) VALUES (1,'N',200000,'Y',1000000,1000000,'N','Y',3002217,'Table LAR_DisposicionFinal','LAR_DisposicionFinal',0,100,0,TO_DATE('2023-10-31 22:52:49','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023-10-31 22:52:49','YYYY-MM-DD HH24:MI:SS'),100,'Y')
;

-- 31/10/2023 22:53:57 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001409,'LAR_DisposicionFinal_ID','LAR','Disposición Final','Disposición Final',0,TO_DATE('2023-10-31 22:53:57','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023-10-31 22:53:57','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 31/10/2023 22:53:57 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001409 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 31/10/2023 22:53:57 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005642,3000271,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3001409,'N','N','N','Disposición Final','LAR_DisposicionFinal_ID',100,TO_DATE('2023-10-31 22:53:57','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:53:57','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:53:57 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005642 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:53:57 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005643,3000271,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,TO_DATE('2023-10-31 22:53:57','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:53:57','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:53:57 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005643 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:53:57 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005644,3000271,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',100,TO_DATE('2023-10-31 22:53:57','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:53:57','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:53:57 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005644 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:53:58 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005645,3000271,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,TO_DATE('2023-10-31 22:53:57','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:53:57','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:53:58 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005645 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:53:58 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005646,3000271,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,TO_DATE('2023-10-31 22:53:58','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:53:58','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:53:58 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005646 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:53:58 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005647,3000271,'LAR',0,110,'Y','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,TO_DATE('2023-10-31 22:53:58','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:53:58','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:53:58 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005647 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:53:58 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005648,3000271,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,TO_DATE('2023-10-31 22:53:58','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:53:58','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:53:58 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005648 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:53:58 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005649,3000271,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,TO_DATE('2023-10-31 22:53:58','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:53:58','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:53:58 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005649 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:53:58 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005650,3000271,'LAR',0,'Y','N','N','The document number is usually automatically generated by the system and determined by the document type of the document. If the document is not saved, the preliminary number is displayed in "<>".

If the document type of your document has no automatic document sequence defined, the field is empty if you create a new document. This is for documents which usually have an external number (like vendor invoice).  If you leave the field empty, the system will generate a document number for you. The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).','N',30,'Y',10,'N',290,'N','Y','N','Document sequence number of the document','Document No','DocumentNo',100,TO_DATE('2023-10-31 22:53:58','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:53:58','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:53:58 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005650 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:53:59 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005651,3000271,'LAR',0,'N','N','N','A description is limited to 255 characters.','N',255,'Y',10,'N',275,'N','Y','N','Optional short description of the record','Description','Description',100,TO_DATE('2023-10-31 22:53:59','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:53:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:53:59 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005651 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:53:59 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005652,3000271,'LAR',0,'Y','N','N','N',29,'N',16,'N',3000370,'N','Y','N','Fecha','Fecha',100,TO_DATE('2023-10-31 22:53:59','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:53:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:53:59 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005652 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:53:59 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005653,3000271,'LAR',0,'Y','N','N','A Business Partner is anyone with whom you transact.  This can include Vendor, Customer, Employee or Salesperson','N',10,'N',19,'N',187,'N','Y','N','Identifies a Business Partner','Business Partner ','C_BPartner_ID',100,TO_DATE('2023-10-31 22:53:59','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:53:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:53:59 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005653 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:53:59 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005654,3000271,'LAR',0,'Y','N','N','The Document Status indicates the status of a document at this time.  If you want to change the document status, use the Document Action field','N',2,'N',17,'N',289,'N','Y','N','The current status of the document','Document Status','DocStatus',100,TO_DATE('2023-10-31 22:53:59','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:53:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:53:59 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005654 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:53:59 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005655,3000271,'LAR',0,'Y','N','N','You find the current status in the Document Status field. The options are listed in a popup','N',2,'N',17,'N',287,'N','Y','N','The targeted status of the document','Document Action','DocAction',100,TO_DATE('2023-10-31 22:53:59','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:53:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:53:59 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005655 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:54:00 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005656,3000271,'LAR',0,'N','N','N','N',1,'N',20,'N',524,'N','Y','N','Process Now','Processing',100,TO_DATE('2023-10-31 22:53:59','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:53:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:54:00 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005656 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:54:00 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005657,3000271,'LAR',0,'Y','N','N','The Processed checkbox indicates that a document has been processed.','N',1,'N',20,'N',1047,'N','Y','N','The document has been processed','Processed','Processed',100,TO_DATE('2023-10-31 22:54:00','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:54:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:54:00 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005657 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:54:00 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005658,3000271,'LAR',0,'Y','N','N','The Document Type determines document sequence and processing rules','N',10,'N',19,'N',196,'N','Y','N','Document type or rules','Document Type','C_DocType_ID',100,TO_DATE('2023-10-31 22:54:00','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:54:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:54:00 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005658 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:54:00 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001410,'direccion','LAR','direccion','direccion',0,TO_DATE('2023-10-31 22:54:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023-10-31 22:54:00','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 31/10/2023 22:54:00 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001410 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 31/10/2023 22:54:00 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005659,3000271,'LAR',0,'Y','N','N','N',60,'N',10,'N',3001410,'N','Y','N','direccion','direccion',100,TO_DATE('2023-10-31 22:54:00','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:54:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:54:00 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005659 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:54:00 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001411,'peso','LAR','peso','peso',0,TO_DATE('2023-10-31 22:54:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023-10-31 22:54:00','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 31/10/2023 22:54:00 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001411 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 31/10/2023 22:54:01 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005660,3000271,'LAR',0,'N','N','N','N',10,'N',11,'N',3001411,'N','Y','N','peso','peso',100,TO_DATE('2023-10-31 22:54:00','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:54:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:54:01 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005660 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:54:01 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001412,'generarnc','LAR','generarnc','generarnc',0,TO_DATE('2023-10-31 22:54:01','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023-10-31 22:54:01','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 31/10/2023 22:54:01 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001412 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 31/10/2023 22:54:01 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005661,3000271,'LAR',0,'N','N','N','N',1,'N',20,'N',3001412,'N','Y','N','generarnc','generarnc',100,TO_DATE('2023-10-31 22:54:01','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:54:01','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:54:01 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005661 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:54:01 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005662,3000271,'LAR',0,'N','N','N','The Invoice Document.','N',10,'N',19,'N',1008,'N','Y','N','Invoice Identifier','Invoice','C_Invoice_ID',100,TO_DATE('2023-10-31 22:54:01','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:54:01','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:54:01 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005662 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:55:13 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Element SET ColumnName='Direccion', Name='Dirección de Procedencia', PrintName='Dirección de Procedencia',Updated=TO_DATE('2023-10-31 22:55:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001410
;

-- 31/10/2023 22:55:13 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001410
;

-- 31/10/2023 22:55:13 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET ColumnName='Direccion', Name='Dirección de Procedencia', Description=NULL, Help=NULL WHERE AD_Element_ID=3001410
;

-- 31/10/2023 22:55:13 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Process_Para SET ColumnName='Direccion', Name='Dirección de Procedencia', Description=NULL, Help=NULL, AD_Element_ID=3001410 WHERE UPPER(ColumnName)='DIRECCION' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 31/10/2023 22:55:13 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Process_Para SET ColumnName='Direccion', Name='Dirección de Procedencia', Description=NULL, Help=NULL WHERE AD_Element_ID=3001410 AND IsCentrallyMaintained='Y'
;

-- 31/10/2023 22:55:13 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET Name='Dirección de Procedencia', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001410) AND IsCentrallyMaintained='Y'
;

-- 31/10/2023 22:55:13 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_PrintFormatItem pi SET PrintName='Dirección de Procedencia', Name='Dirección de Procedencia' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001410)
;

-- 31/10/2023 22:55:18 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Element_Trl SET Name='Dirección de Procedencia',PrintName='Dirección de Procedencia',Updated=TO_DATE('2023-10-31 22:55:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001410 AND AD_Language='es_AR'
;

-- 31/10/2023 22:55:36 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column_Trl SET Name='Dirección de Procedencia',Updated=TO_DATE('2023-10-31 22:55:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005659 AND AD_Language='es_AR'
;

-- 31/10/2023 22:56:24 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Element SET ColumnName='GenerarNC', Name='Generar Nota de Crédito', PrintName='Generar Nota de Crédito',Updated=TO_DATE('2023-10-31 22:56:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001412
;

-- 31/10/2023 22:56:24 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001412
;

-- 31/10/2023 22:56:24 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET ColumnName='GenerarNC', Name='Generar Nota de Crédito', Description=NULL, Help=NULL WHERE AD_Element_ID=3001412
;

-- 31/10/2023 22:56:24 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Process_Para SET ColumnName='GenerarNC', Name='Generar Nota de Crédito', Description=NULL, Help=NULL, AD_Element_ID=3001412 WHERE UPPER(ColumnName)='GENERARNC' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 31/10/2023 22:56:24 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Process_Para SET ColumnName='GenerarNC', Name='Generar Nota de Crédito', Description=NULL, Help=NULL WHERE AD_Element_ID=3001412 AND IsCentrallyMaintained='Y'
;

-- 31/10/2023 22:56:24 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET Name='Generar Nota de Crédito', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001412) AND IsCentrallyMaintained='Y'
;

-- 31/10/2023 22:56:24 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_PrintFormatItem pi SET PrintName='Generar Nota de Crédito', Name='Generar Nota de Crédito' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001412)
;

-- 31/10/2023 22:56:30 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Element_Trl SET Name='Generar Nota de Crédito',PrintName='Generar Nota de Crédito',Updated=TO_DATE('2023-10-31 22:56:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001412 AND AD_Language='es_AR'
;

-- 31/10/2023 22:56:51 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET AD_Reference_ID=28, Name='Generar Nota de Crédito', ColumnName='GenerarNC',Updated=TO_DATE('2023-10-31 22:56:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005661
;

-- 31/10/2023 22:57:02 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column_Trl SET Name='Generar Nota de Crédito',Updated=TO_DATE('2023-10-31 22:57:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005661 AND AD_Language='es_AR'
;

-- 31/10/2023 22:57:40 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Element SET ColumnName='Peso', Name='Peso (Kg)', PrintName='Peso (Kg)',Updated=TO_DATE('2023-10-31 22:57:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001411
;

-- 31/10/2023 22:57:40 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001411
;

-- 31/10/2023 22:57:40 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET ColumnName='Peso', Name='Peso (Kg)', Description=NULL, Help=NULL WHERE AD_Element_ID=3001411
;

-- 31/10/2023 22:57:40 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Process_Para SET ColumnName='Peso', Name='Peso (Kg)', Description=NULL, Help=NULL, AD_Element_ID=3001411 WHERE UPPER(ColumnName)='PESO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 31/10/2023 22:57:40 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Process_Para SET ColumnName='Peso', Name='Peso (Kg)', Description=NULL, Help=NULL WHERE AD_Element_ID=3001411 AND IsCentrallyMaintained='Y'
;

-- 31/10/2023 22:57:40 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET Name='Peso (Kg)', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001411) AND IsCentrallyMaintained='Y'
;

-- 31/10/2023 22:57:40 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_PrintFormatItem pi SET PrintName='Peso (Kg)', Name='Peso (Kg)' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001411)
;

-- 31/10/2023 22:57:45 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Element_Trl SET Name='Peso (Kg)',PrintName='Peso (Kg)',Updated=TO_DATE('2023-10-31 22:57:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001411 AND AD_Language='es_AR'
;

-- 31/10/2023 22:58:00 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column_Trl SET Name='Peso (Kg)',Updated=TO_DATE('2023-10-31 22:58:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005660 AND AD_Language='es_AR'
;

-- 31/10/2023 22:59:16 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,ImportTable,IsHighVolume,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','3',0,3000272,'N','N','N','Y','N','LAR','Y','Y','L','LAR_DisposicionFinalLine','Línea DF',0,'Y',0,100,TO_DATE('2023-10-31 22:59:16','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2023-10-31 22:59:16','YYYY-MM-DD HH24:MI:SS'))
;

-- 31/10/2023 22:59:16 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000272 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- 31/10/2023 22:59:16 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,UpdatedBy,AD_Client_ID,Updated,Created,CreatedBy,IsActive) VALUES (1,'N',200000,'Y',1000000,1000000,'N','Y',3002218,'Table LAR_DisposicionFinalLine','LAR_DisposicionFinalLine',0,100,0,TO_DATE('2023-10-31 22:59:16','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023-10-31 22:59:16','YYYY-MM-DD HH24:MI:SS'),100,'Y')
;

-- 31/10/2023 22:59:23 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001413,'LAR_DisposicionFinalLine_ID','LAR','Línea DF','Línea DF',0,TO_DATE('2023-10-31 22:59:23','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023-10-31 22:59:23','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 31/10/2023 22:59:23 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001413 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 31/10/2023 22:59:23 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005663,3000272,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3001413,'N','N','N','Línea DF','LAR_DisposicionFinalLine_ID',100,TO_DATE('2023-10-31 22:59:23','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:59:23','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:59:23 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005663 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:59:23 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005664,3000272,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,TO_DATE('2023-10-31 22:59:23','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:59:23','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:59:23 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005664 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:59:24 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005665,3000272,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',100,TO_DATE('2023-10-31 22:59:23','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:59:23','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:59:24 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005665 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:59:24 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005666,3000272,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,TO_DATE('2023-10-31 22:59:24','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:59:24','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:59:24 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005666 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:59:24 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005667,3000272,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,TO_DATE('2023-10-31 22:59:24','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:59:24','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:59:24 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005667 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:59:24 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005668,3000272,'LAR',0,110,'Y','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,TO_DATE('2023-10-31 22:59:24','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:59:24','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:59:24 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005668 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:59:24 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005669,3000272,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,TO_DATE('2023-10-31 22:59:24','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:59:24','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:59:24 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005669 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:59:25 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005670,3000272,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,TO_DATE('2023-10-31 22:59:24','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:59:24','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:59:25 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005670 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:59:25 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005671,3000272,'LAR',0,'Y','N','N','N',10,'N',19,'N',3001409,'N','Y','N','Disposición Final','LAR_DisposicionFinal_ID',100,TO_DATE('2023-10-31 22:59:25','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:59:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:59:25 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005671 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:59:25 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005672,3000272,'LAR',0,'Y','N','N','Indicates the unique line for a document.  It will also control the display order of the lines within a document.','N',10,'N',11,'N',439,'N','Y','N','Unique line for this document','Line No','Line',100,TO_DATE('2023-10-31 22:59:25','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:59:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:59:25 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005672 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:59:25 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005673,3000272,'LAR',0,'N','N','N','A description is limited to 255 characters.','N',255,'Y',10,'N',275,'N','Y','N','Optional short description of the record','Description','Description',100,TO_DATE('2023-10-31 22:59:25','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:59:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:59:25 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005673 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:59:25 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005674,3000272,'LAR',0,'Y','N','N','Identifies an item which is either purchased or sold in this organization.','N',10,'N',19,'N',454,'N','Y','N','Product, Service, Item','Product','M_Product_ID',100,TO_DATE('2023-10-31 22:59:25','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:59:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:59:25 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005674 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:59:25 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005675,3000272,'LAR',0,'Y','N','N','The UOM defines a unique non monetary Unit of Measure','N',10,'N',19,'N',215,'N','Y','N','Unit of Measure','UOM','C_UOM_ID',100,TO_DATE('2023-10-31 22:59:25','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:59:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:59:25 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005675 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 22:59:26 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005676,3000272,'LAR',0,'Y','N','N','N',14,'N',22,'N',3001061,'N','Y','N','Cantidad','Cantidad',100,TO_DATE('2023-10-31 22:59:25','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-10-31 22:59:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 22:59:26 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005676 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2023 23:00:04 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET AD_Reference_ID=29,Updated=TO_DATE('2023-10-31 23:00:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005676
;

-- 31/10/2023 23:00:48 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET IsParent='Y', IsUpdateable='N',Updated=TO_DATE('2023-10-31 23:00:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005671
;

-- 31/10/2023 23:01:25 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET IsIdentifier='Y', SeqNo=1,Updated=TO_DATE('2023-10-31 23:01:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005650
;

-- 31/10/2023 23:02:04 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_DATE('2023-10-31 23:02:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005652
;

-- 31/10/2023 23:02:12 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_DATE('2023-10-31 23:02:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005654
;

-- 31/10/2023 23:02:19 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_DATE('2023-10-31 23:02:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005653
;

-- 31/10/2023 23:02:26 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_DATE('2023-10-31 23:02:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005658
;

-- 31/10/2023 23:04:37 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET DefaultValue='@SQL=SELECT COALESCE(MAX(Line),0)+10 AS DefaultValue FROM LAR_DisposicionFinalLine WHERE LAR_DisposicionFinal_ID=@LAR_DisposicionFinal_ID@',Updated=TO_DATE('2023-10-31 23:04:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005672
;

-- 31/10/2023 23:06:32 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET DefaultValue='@AD_Client_ID@', AD_Val_Rule_ID=129, IsAllowCopy='N',Updated=TO_DATE('2023-10-31 23:06:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005664
;

-- 31/10/2023 23:07:19 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET DefaultValue='@AD_Org_ID@', AD_Val_Rule_ID=130, IsAllowCopy='N',Updated=TO_DATE('2023-10-31 23:07:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005665
;

-- 31/10/2023 23:08:51 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET AD_Reference_ID=30, AD_Val_Rule_ID=231,Updated=TO_DATE('2023-10-31 23:08:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005674
;

-- 31/10/2023 23:09:37 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET DefaultValue='@#AD_Client_ID@', AD_Val_Rule_ID=129, IsAllowCopy='N',Updated=TO_DATE('2023-10-31 23:09:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005643
;

-- 31/10/2023 23:09:59 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET DefaultValue='@#AD_Org_ID@', AD_Val_Rule_ID=130, IsAllowCopy='N',Updated=TO_DATE('2023-10-31 23:09:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005644
;

-- 31/10/2023 23:10:58 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET AD_Reference_ID=30, AD_Val_Rule_ID=230,Updated=TO_DATE('2023-10-31 23:10:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005653
;

-- 31/10/2023 23:11:47 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET DefaultValue='CO', AD_Reference_Value_ID=135,Updated=TO_DATE('2023-10-31 23:11:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005655
;

-- 31/10/2023 23:14:57 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Workflow (Cost,WorkingTime,AccessLevel,Author,AD_Workflow_ID,Duration,DurationUnit,EntityType,IsDefault,IsValid,PublishStatus,Version,AD_Table_ID,AD_WF_Node_ID,DocumentNo,WaitingTime,IsBetaFunctionality,WorkflowType,Name,Value,Description,UpdatedBy,Updated,Created,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive) VALUES (0,0,'1','Adempiere, Inc.',3000011,1,'D','LAR','N','Y','R',0,3000271,3000049,'4000000',0,'N','P','LAR_DisposicionFinal_Procesar','LAR_DisposicionFinal_Procesar','(Procesar Disposición Final)',100,TO_DATE('2023-10-31 23:14:56','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023-10-31 23:14:56','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y')
;

-- 31/10/2023 23:14:57 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Workflow_Trl (AD_Language,AD_Workflow_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Workflow_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Workflow t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Workflow_ID=3000011 AND NOT EXISTS (SELECT * FROM AD_Workflow_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Workflow_ID=t.AD_Workflow_ID)
;

-- 31/10/2023 23:16:11 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,Limit,WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,AD_Workflow_ID,Action,SplitElement,Value,Name,UpdatedBy,AD_Org_ID,Created,CreatedBy,IsActive,Updated,AD_Client_ID) VALUES (3000050,0,0,0,'--',0,'LAR','Y','X',0,0,0,0,0,0,3000011,'D','X','(DocAuto)','(DocAuto)',100,0,TO_DATE('2023-10-31 23:16:11','YYYY-MM-DD HH24:MI:SS'),100,'Y',TO_DATE('2023-10-31 23:16:11','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 31/10/2023 23:16:11 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_WF_Node_Trl (AD_Language,AD_WF_Node_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_WF_Node_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_WF_Node t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_WF_Node_ID=3000050 AND NOT EXISTS (SELECT * FROM AD_WF_Node_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_WF_Node_ID=t.AD_WF_Node_ID)
;

-- 31/10/2023 23:16:51 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,Limit,WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,AD_Workflow_ID,Action,SplitElement,Value,Name,UpdatedBy,AD_Org_ID,Created,CreatedBy,IsActive,Updated,AD_Client_ID) VALUES (3000051,0,0,0,'CO',0,'LAR','Y','X',0,0,0,0,0,0,3000011,'D','X','(DocComplete)','(DocComplete)',100,0,TO_DATE('2023-10-31 23:16:50','YYYY-MM-DD HH24:MI:SS'),100,'Y',TO_DATE('2023-10-31 23:16:50','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 31/10/2023 23:16:51 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_WF_Node_Trl (AD_Language,AD_WF_Node_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_WF_Node_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_WF_Node t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_WF_Node_ID=3000051 AND NOT EXISTS (SELECT * FROM AD_WF_Node_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_WF_Node_ID=t.AD_WF_Node_ID)
;

-- 31/10/2023 23:17:31 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,Limit,WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,AD_Workflow_ID,Action,SplitElement,Value,Name,UpdatedBy,AD_Org_ID,Created,CreatedBy,IsActive,Updated,AD_Client_ID) VALUES (3000052,0,0,0,'PR',0,'LAR','Y','X',0,0,0,0,0,0,3000011,'D','X','(DocPrepare)','(DocPrepare)',100,0,TO_DATE('2023-10-31 23:17:30','YYYY-MM-DD HH24:MI:SS'),100,'Y',TO_DATE('2023-10-31 23:17:30','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 31/10/2023 23:17:31 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_WF_Node_Trl (AD_Language,AD_WF_Node_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_WF_Node_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_WF_Node t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_WF_Node_ID=3000052 AND NOT EXISTS (SELECT * FROM AD_WF_Node_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_WF_Node_ID=t.AD_WF_Node_ID)
;

-- 31/10/2023 23:17:54 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_WF_NodeNext (EntityType,IsStdUserWorkflow,AD_WF_NodeNext_ID,AD_WF_Node_ID,SeqNo,AD_WF_Next_ID,Created,UpdatedBy,CreatedBy,AD_Org_ID,IsActive,Updated,AD_Client_ID) VALUES ('LAR','N',3000040,3000052,10,3000051,TO_DATE('2023-10-31 23:17:54','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',TO_DATE('2023-10-31 23:17:54','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 31/10/2023 23:18:23 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,Limit,WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,AD_Workflow_ID,Action,SplitElement,Value,Name,UpdatedBy,AD_Org_ID,Created,CreatedBy,IsActive,Updated,AD_Client_ID) VALUES (3000053,0,0,0,'CO',0,'LAR','Y','X',0,0,0,0,0,0,3000011,'Z','X','(Start)','(Start)',100,0,TO_DATE('2023-10-31 23:18:23','YYYY-MM-DD HH24:MI:SS'),100,'Y',TO_DATE('2023-10-31 23:18:23','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 31/10/2023 23:18:23 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_WF_Node_Trl (AD_Language,AD_WF_Node_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_WF_Node_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_WF_Node t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_WF_Node_ID=3000053 AND NOT EXISTS (SELECT * FROM AD_WF_Node_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_WF_Node_ID=t.AD_WF_Node_ID)
;

-- 31/10/2023 23:18:41 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_WF_NodeNext (EntityType,IsStdUserWorkflow,AD_WF_NodeNext_ID,AD_WF_Node_ID,SeqNo,AD_WF_Next_ID,Created,UpdatedBy,CreatedBy,AD_Org_ID,IsActive,Updated,AD_Client_ID) VALUES ('LAR','N',3000041,3000053,10,3000052,TO_DATE('2023-10-31 23:18:41','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',TO_DATE('2023-10-31 23:18:41','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 31/10/2023 23:19:01 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_WF_NodeNext (EntityType,IsStdUserWorkflow,AD_WF_NodeNext_ID,AD_WF_Node_ID,SeqNo,AD_WF_Next_ID,Created,UpdatedBy,CreatedBy,AD_Org_ID,IsActive,Updated,AD_Client_ID) VALUES ('LAR','N',3000042,3000053,100,3000050,TO_DATE('2023-10-31 23:19:00','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',TO_DATE('2023-10-31 23:19:00','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 31/10/2023 23:19:31 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Process (AD_Workflow_ID,AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Value,Name,AD_Org_ID,AD_Client_ID,UpdatedBy,Created,CreatedBy,Updated,IsActive) VALUES (3000011,3000561,'N','N','1','N','N','Y','LAR',0,0,'LAR_DisposicionFinal_Procesar','LAR_DisposicionFinal_Procesar',0,0,100,TO_DATE('2023-10-31 23:19:31','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2023-10-31 23:19:31','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 31/10/2023 23:19:32 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000561 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 31/10/2023 23:20:00 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET AD_Reference_Value_ID=NULL, AD_Reference_ID=28, AD_Process_ID=3000561,Updated=TO_DATE('2023-10-31 23:20:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005655
;

-- 31/10/2023 23:20:35 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET DefaultValue='DR', AD_Reference_Value_ID=131,Updated=TO_DATE('2023-10-31 23:20:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005654
;

-- 31/10/2023 23:25:55 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Window (AD_Window_ID,WindowType,IsSOTrx,IsDefault,IsBetaFunctionality,WinHeight,WinWidth,EntityType,Name,IsActive,Created,UpdatedBy,CreatedBy,Updated,AD_Org_ID,AD_Client_ID,Processing) VALUES (3000143,'M','Y','N','N',0,0,'LAR','Disposición Final','Y',TO_DATE('2023-10-31 23:25:54','YYYY-MM-DD HH24:MI:SS'),100,100,TO_DATE('2023-10-31 23:25:54','YYYY-MM-DD HH24:MI:SS'),0,0,'N')
;

-- 31/10/2023 23:25:55 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Window_Trl (AD_Language,AD_Window_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Window_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Window t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Window_ID=3000143 AND NOT EXISTS (SELECT * FROM AD_Window_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Window_ID=t.AD_Window_ID)
;

-- 31/10/2023 23:26:44 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Table SET AD_Window_ID=3000143,Updated=TO_DATE('2023-10-31 23:26:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000271
;

-- 31/10/2023 23:27:58 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('Y',3000143,10,'N','N',3000271,3000309,'N','N','N','N',0,'Y','N','LAR','Disposición Final',0,0,TO_DATE('2023-10-31 23:27:58','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2023-10-31 23:27:58','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 31/10/2023 23:27:58 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000309 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 31/10/2023 23:28:05 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009248,1,'Y','N','N',3005645,'N','Y',3000309,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,TO_DATE('2023-10-31 23:28:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2023-10-31 23:28:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 23:28:05 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009248 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/10/2023 23:28:05 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009249,10,'Y','N','N',3005653,'N','Y',3000309,'N','A Business Partner is anyone with whom you transact.  This can include Vendor, Customer, Employee or Salesperson','LAR','Identifies a Business Partner','Business Partner ',100,0,TO_DATE('2023-10-31 23:28:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2023-10-31 23:28:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 23:28:05 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009249 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/10/2023 23:28:06 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009250,10,'Y','N','N',3005643,'N','Y',3000309,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,TO_DATE('2023-10-31 23:28:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2023-10-31 23:28:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 23:28:06 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009250 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/10/2023 23:28:06 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009251,255,'Y','N','N',3005651,'N','Y',3000309,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,TO_DATE('2023-10-31 23:28:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2023-10-31 23:28:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 23:28:06 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009251 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/10/2023 23:28:06 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009252,60,'Y','N','N',3005659,'N','Y',3000309,'N','LAR','Dirección de Procedencia',100,0,TO_DATE('2023-10-31 23:28:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2023-10-31 23:28:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 23:28:06 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009252 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/10/2023 23:28:06 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009253,10,'N','N','N',3005642,'N','Y',3000309,'N','LAR','Disposición Final',100,0,TO_DATE('2023-10-31 23:28:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2023-10-31 23:28:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 23:28:06 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009253 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/10/2023 23:28:06 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009254,2,'Y','N','N',3005655,'N','Y',3000309,'N','You find the current status in the Document Status field. The options are listed in a popup','LAR','The targeted status of the document','Document Action',100,0,TO_DATE('2023-10-31 23:28:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2023-10-31 23:28:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 23:28:06 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009254 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/10/2023 23:28:06 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009255,30,'Y','N','N',3005650,'N','Y',3000309,'N','The document number is usually automatically generated by the system and determined by the document type of the document. If the document is not saved, the preliminary number is displayed in "<>".

If the document type of your document has no automatic document sequence defined, the field is empty if you create a new document. This is for documents which usually have an external number (like vendor invoice).  If you leave the field empty, the system will generate a document number for you. The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).','LAR','Document sequence number of the document','Document No',100,0,TO_DATE('2023-10-31 23:28:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2023-10-31 23:28:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 23:28:07 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009255 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/10/2023 23:28:07 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009256,2,'Y','N','N',3005654,'N','Y',3000309,'N','The Document Status indicates the status of a document at this time.  If you want to change the document status, use the Document Action field','LAR','The current status of the document','Document Status',100,0,TO_DATE('2023-10-31 23:28:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2023-10-31 23:28:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 23:28:07 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009256 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/10/2023 23:28:07 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009257,10,'Y','N','N',3005658,'N','Y',3000309,'N','The Document Type determines document sequence and processing rules','LAR','Document type or rules','Document Type',100,0,TO_DATE('2023-10-31 23:28:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2023-10-31 23:28:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 23:28:07 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009257 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/10/2023 23:28:07 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009258,29,'Y','N','N',3005652,'N','Y',3000309,'N','LAR','Fecha',100,0,TO_DATE('2023-10-31 23:28:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2023-10-31 23:28:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 23:28:07 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009258 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/10/2023 23:28:07 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009259,1,'Y','N','N',3005661,'N','Y',3000309,'N','LAR','Generar Nota de Crédito',100,0,TO_DATE('2023-10-31 23:28:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2023-10-31 23:28:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 23:28:07 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009259 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/10/2023 23:28:07 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009260,10,'Y','N','N',3005662,'N','Y',3000309,'N','The Invoice Document.','LAR','Invoice Identifier','Invoice',100,0,TO_DATE('2023-10-31 23:28:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2023-10-31 23:28:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 23:28:07 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009260 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/10/2023 23:28:08 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009261,10,'Y','N','N',3005644,'N','Y',3000309,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,TO_DATE('2023-10-31 23:28:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2023-10-31 23:28:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 23:28:08 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009261 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/10/2023 23:28:08 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009262,10,'Y','N','N',3005660,'N','Y',3000309,'N','LAR','Peso (Kg)',100,0,TO_DATE('2023-10-31 23:28:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2023-10-31 23:28:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 23:28:08 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009262 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/10/2023 23:28:08 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009263,1,'Y','N','N',3005656,'N','Y',3000309,'N','LAR','Process Now',100,0,TO_DATE('2023-10-31 23:28:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2023-10-31 23:28:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 23:28:08 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009263 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/10/2023 23:28:08 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009264,1,'Y','N','N',3005657,'N','Y',3000309,'N','The Processed checkbox indicates that a document has been processed.','LAR','The document has been processed','Processed',100,0,TO_DATE('2023-10-31 23:28:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2023-10-31 23:28:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 23:28:08 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009264 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/10/2023 23:29:42 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Parent_Column_ID,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('Y',3000143,20,'N','N',3000272,3000310,'N','N','N','N',1,'Y','N','LAR',3005642,'Línea DF',0,0,TO_DATE('2023-10-31 23:29:42','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2023-10-31 23:29:42','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 31/10/2023 23:29:42 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000310 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 31/10/2023 23:29:45 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009265,1,'Y','N','N',3005666,'N','Y',3000310,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,TO_DATE('2023-10-31 23:29:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2023-10-31 23:29:45','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 23:29:45 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009265 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/10/2023 23:29:45 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009266,14,'Y','N','N',3005676,'N','Y',3000310,'N','LAR','Cantidad',100,0,TO_DATE('2023-10-31 23:29:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2023-10-31 23:29:45','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 23:29:45 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009266 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/10/2023 23:29:45 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009267,10,'Y','N','N',3005664,'N','Y',3000310,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,TO_DATE('2023-10-31 23:29:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2023-10-31 23:29:45','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 23:29:45 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009267 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/10/2023 23:29:45 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009268,255,'Y','N','N',3005673,'N','Y',3000310,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,TO_DATE('2023-10-31 23:29:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2023-10-31 23:29:45','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 23:29:45 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009268 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/10/2023 23:29:45 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009269,10,'Y','N','N',3005671,'N','Y',3000310,'N','LAR','Disposición Final',100,0,TO_DATE('2023-10-31 23:29:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2023-10-31 23:29:45','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 23:29:45 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009269 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/10/2023 23:29:46 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009270,10,'Y','N','N',3005672,'N','Y',3000310,'N','Indicates the unique line for a document.  It will also control the display order of the lines within a document.','LAR','Unique line for this document','Line No',100,0,TO_DATE('2023-10-31 23:29:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2023-10-31 23:29:45','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 23:29:46 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009270 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/10/2023 23:29:46 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009271,10,'N','N','N',3005663,'N','Y',3000310,'N','LAR','Línea DF',100,0,TO_DATE('2023-10-31 23:29:46','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2023-10-31 23:29:46','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 23:29:46 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009271 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/10/2023 23:29:46 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009272,10,'Y','N','N',3005665,'N','Y',3000310,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,TO_DATE('2023-10-31 23:29:46','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2023-10-31 23:29:46','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 23:29:46 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009272 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/10/2023 23:29:46 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009273,10,'Y','N','N',3005674,'N','Y',3000310,'N','Identifies an item which is either purchased or sold in this organization.','LAR','Product, Service, Item','Product',100,0,TO_DATE('2023-10-31 23:29:46','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2023-10-31 23:29:46','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 23:29:46 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009273 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/10/2023 23:29:46 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009274,10,'Y','N','N',3005675,'N','Y',3000310,'N','The UOM defines a unique non monetary Unit of Measure','LAR','Unit of Measure','UOM',100,0,TO_DATE('2023-10-31 23:29:46','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2023-10-31 23:29:46','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2023 23:29:46 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009274 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/10/2023 23:32:23 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3009250
;

-- 31/10/2023 23:32:23 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3009261
;

-- 31/10/2023 23:32:23 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3009255
;

-- 31/10/2023 23:32:23 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3009248
;

-- 31/10/2023 23:32:23 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3009251
;

-- 31/10/2023 23:32:23 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3009257
;

-- 31/10/2023 23:32:23 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3009249
;

-- 31/10/2023 23:32:23 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3009252
;

-- 31/10/2023 23:32:23 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3009258
;

-- 31/10/2023 23:32:23 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3009262
;

-- 31/10/2023 23:32:23 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3009259
;

-- 31/10/2023 23:32:23 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3009260
;

-- 31/10/2023 23:32:23 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3009254
;

-- 31/10/2023 23:32:23 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3009256
;

-- 31/10/2023 23:32:23 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3009263
;

-- 31/10/2023 23:32:23 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3009264
;

-- 31/10/2023 23:32:34 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2023-10-31 23:32:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009261
;

-- 31/10/2023 23:32:44 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2023-10-31 23:32:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009248
;

-- 31/10/2023 23:32:59 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2023-10-31 23:32:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009252
;

-- 31/10/2023 23:33:10 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET DisplayLength=30,Updated=TO_DATE('2023-10-31 23:33:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009252
;

-- 31/10/2023 23:33:24 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET DefaultValue='@#Date@',Updated=TO_DATE('2023-10-31 23:33:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009258
;

-- 31/10/2023 23:33:38 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2023-10-31 23:33:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009262
;

-- 31/10/2023 23:34:37 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET IsSameLine='Y', DisplayLogic='@C_Invoice_ID@>0',Updated=TO_DATE('2023-10-31 23:34:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009260
;

-- 31/10/2023 23:34:49 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2023-10-31 23:34:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009256
;

-- 31/10/2023 23:34:56 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2023-10-31 23:34:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009264
;

-- 31/10/2023 23:35:52 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3009265
;

-- 31/10/2023 23:35:52 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3009267
;

-- 31/10/2023 23:35:52 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3009272
;

-- 31/10/2023 23:35:52 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3009270
;

-- 31/10/2023 23:35:52 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3009269
;

-- 31/10/2023 23:35:52 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3009268
;

-- 31/10/2023 23:35:52 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3009273
;

-- 31/10/2023 23:35:52 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3009274
;

-- 31/10/2023 23:35:52 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3009266
;

-- 31/10/2023 23:36:09 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2023-10-31 23:36:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009272
;

-- 31/10/2023 23:36:40 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2023-10-31 23:36:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009269
;

-- 31/10/2023 23:36:48 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2023-10-31 23:36:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009274
;

-- 31/10/2023 23:38:32 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET DefaultValue='@#C_UOM_ID@', AD_Val_Rule_ID=210,Updated=TO_DATE('2023-10-31 23:38:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005675
;

-- 31/10/2023 23:40:40 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Menu (AD_Window_ID,AD_Menu_ID,IsSummary,Action,IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000143,3000507,'N','W','Y','N','LAR','Y','Disposición Final',TO_DATE('2023-10-31 23:40:39','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_DATE('2023-10-31 23:40:39','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 31/10/2023 23:40:40 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000507 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 31/10/2023 23:40:40 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', SysDate, 100, SysDate, 100,t.AD_Tree_ID, 3000507, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000507)
;

-- 31/10/2023 23:40:50 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=0, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=1000006
;

-- 31/10/2023 23:40:50 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=1, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=52001
;

-- 31/10/2023 23:40:50 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=2, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=460
;

-- 31/10/2023 23:40:50 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=3, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=301
;

-- 31/10/2023 23:40:50 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=4, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53249
;

-- 31/10/2023 23:40:50 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=5, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=129
;

-- 31/10/2023 23:40:50 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=6, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000498
;

-- 31/10/2023 23:40:50 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=7, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000507
;

-- 31/10/2023 23:40:50 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=8, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000364
;

-- 31/10/2023 23:40:50 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=9, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=543
;

-- 31/10/2023 23:40:50 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=10, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=195
;

-- 31/10/2023 23:40:50 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=11, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53223
;

-- 31/10/2023 23:40:50 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=12, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=407
;

-- 31/10/2023 23:40:50 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=13, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=406
;

-- 31/10/2023 23:40:50 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=14, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=335
;

-- 31/10/2023 23:40:50 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=15, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=436
;

-- 31/10/2023 23:40:50 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=16, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=507
;

-- 31/10/2023 23:40:50 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=17, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=448
;

-- 31/10/2023 23:40:50 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=18, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=449
;

-- 31/10/2023 23:40:50 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=19, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=492
;

-- 31/10/2023 23:40:50 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=20, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53269
;

-- 31/10/2023 23:40:50 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=21, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=491
;

-- 31/10/2023 23:40:50 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=22, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=419
;

-- 31/10/2023 23:45:09 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2023-10-31 23:45:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009256
;

-- 31/10/2023 23:45:35 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET AD_Reference_ID=15,Updated=TO_DATE('2023-10-31 23:45:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005652
;

-- 31/10/2023 23:46:14 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2023-10-31 23:46:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009263
;

-- 31/10/2023 23:46:17 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2023-10-31 23:46:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009264
;

-- 31/10/2023 23:46:55 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET DisplayLength=20,Updated=TO_DATE('2023-10-31 23:46:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009255
;

-- 31/10/2023 23:48:08 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2023-10-31 23:48:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009255
;

-- 31/10/2023 23:52:07 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2023-10-31 23:52:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009267
;

-- 31/10/2023 23:52:10 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2023-10-31 23:52:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009272
;

-- 01/11/2023 0:44:22 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET DisplayLogic='@DocStatus@=''CO''',Updated=TO_DATE('2023-11-01 00:44:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009259
;

-- 01/11/2023 0:45:15 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET ReadOnlyLogic='@C_Invoice_ID@ > 0',Updated=TO_DATE('2023-11-01 00:45:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005661
;

-- 01/11/2023 0:45:51 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_DATE('2023-11-01 00:45:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005661
;

-- 01/11/2023 0:46:07 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_DATE('2023-11-01 00:46:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005662
;

-- 01/11/2023 0:46:18 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2023-11-01 00:46:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009260
;

-- 01/11/2023 0:50:19 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Workflow SET AccessLevel='3', IsValid='Y',Updated=TO_DATE('2023-11-01 00:50:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Workflow_ID=3000011
;

-- 01/11/2023 0:50:25 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Process SET AccessLevel='3',Updated=TO_DATE('2023-11-01 00:50:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000561
;

-- 01/11/2023 0:55:19 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Workflow SET IsValid='Y', AD_WF_Node_ID=3000053,Updated=TO_DATE('2023-11-01 00:55:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Workflow_ID=3000011
;

-- 01/11/2023 0:58:28 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Process (AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,CopyFromProcess,Value,Name,AD_Org_ID,AD_Client_ID,UpdatedBy,Created,CreatedBy,Updated,IsActive) VALUES (3000562,'N','N','3','N','N','Y','LAR',0,0,'N','LAR_GenerarNC_DF','LAR_GenerarNC_DF',0,0,100,TO_DATE('2023-11-01 00:58:27','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2023-11-01 00:58:27','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 01/11/2023 0:58:28 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000562 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 01/11/2023 1:07:17 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,AD_Val_Rule_ID,SeqNo,IsMandatory,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000982,10,3000562,100,'N',19,3000013,10,'N','LAR','Terminal PDV','C_POS_ID','Y',0,100,TO_DATE('2023-11-01 01:07:17','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023-11-01 01:07:17','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 01/11/2023 1:07:17 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000982 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 01/11/2023 1:09:30 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,AD_Val_Rule_ID,SeqNo,IsMandatory,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000983,0,3000562,100,'N',30,231,20,'N','LAR','Producto','M_Product_ID','Y',0,100,TO_DATE('2023-11-01 01:09:30','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023-11-01 01:09:30','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 01/11/2023 1:09:30 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000983 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 01/11/2023 1:10:55 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,AD_Val_Rule_ID,SeqNo,IsMandatory,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000984,0,3000562,100,'N',19,3000109,30,'N','LAR','Lista de Precios','M_PriceList_ID','Y',0,100,TO_DATE('2023-11-01 01:10:54','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023-11-01 01:10:54','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 01/11/2023 1:10:55 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000984 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 01/11/2023 1:11:06 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Process_Para SET IsMandatory='Y',Updated=TO_DATE('2023-11-01 01:11:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000982
;

-- 01/11/2023 1:11:11 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Process_Para SET IsMandatory='Y',Updated=TO_DATE('2023-11-01 01:11:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000983
;

-- 01/11/2023 1:11:14 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Process_Para SET IsMandatory='Y',Updated=TO_DATE('2023-11-01 01:11:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000984
;

-- 01/11/2023 1:13:22 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,AD_Val_Rule_ID,SeqNo,IsMandatory,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000985,0,3000562,100,'N',30,220,40,'N','LAR','Factura Origen','C_Invoice_ID','Y',0,100,TO_DATE('2023-11-01 01:13:22','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023-11-01 01:13:22','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 01/11/2023 1:13:22 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000985 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 01/11/2023 1:14:49 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,DefaultValue,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000986,0,3000562,100,'N',29,50,'N','@Peso@','LAR','Peso (Kg)','Peso','Y',0,100,TO_DATE('2023-11-01 01:14:49','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023-11-01 01:14:49','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 01/11/2023 1:14:49 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000986 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 01/11/2023 1:20:47 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Process SET Classname='ar.com.ergio.process.LAR_GenerarNC_DF',Updated=TO_DATE('2023-11-01 01:20:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000562
;

-- 01/11/2023 1:21:14 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET AD_Process_ID=3000562,Updated=TO_DATE('2023-11-01 01:21:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005661
;

-- 02/11/2023 23:05:07 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,AD_Val_Rule_ID,SeqNo,IsMandatory,AD_Reference_Value_ID,DefaultValue,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000987,2,3000562,100,'N',17,219,60,'N',135,'''CO''','LAR','Acción sobre el Documento','DocStatus','Y',0,100,TO_DATE('2023-11-02 23:05:06','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023-11-02 23:05:06','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 02/11/2023 23:05:07 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000987 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 02/11/2023 23:05:17 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Process_Para SET SeqNo=35,Updated=TO_DATE('2023-11-02 23:05:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000987
;

-- 02/11/2023 23:16:15 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET AD_Reference_ID=29,Updated=TO_DATE('2023-11-02 23:16:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005660
;

-- 02/11/2023 23:33:28 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Process_Para SET ColumnName='DocAction',Updated=TO_DATE('2023-11-02 23:33:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000987
;

-- 02/11/2023 23:57:32 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('M_Product.IsSummary=''N'' AND M_Product.IsActive=''Y'' AND M_Product.M_Product_Category_ID=4000021','S',3000142,'LAR','M_Product - Categoria Rezagos',100,100,TO_DATE('2023-11-02 23:57:31','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_DATE('2023-11-02 23:57:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/11/2023 23:57:50 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Process_Para SET AD_Val_Rule_ID=3000142,Updated=TO_DATE('2023-11-02 23:57:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000983
;

-- 02/11/2023 23:59:30 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Process_Para SET AD_Val_Rule_ID=271,Updated=TO_DATE('2023-11-02 23:59:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000984
;

-- 03/11/2023 0:02:10 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Process_Para SET AD_Reference_Value_ID=166,Updated=TO_DATE('2023-11-03 00:02:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000984
;

-- 14/11/2023 22:06:22 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET AD_Reference_ID=30,Updated=TO_DATE('2023-11-14 22:06:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005662
;

-- 14/11/2023 22:10:54 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET ReadOnlyLogic='@C_Invoice_ID@>0',Updated=TO_DATE('2023-11-14 22:10:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005662
;

-- 14/11/2023 22:12:12 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET IsAlwaysUpdateable='N',Updated=TO_DATE('2023-11-14 22:12:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005661
;

-- 14/11/2023 22:13:32 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET IsAlwaysUpdateable='N',Updated=TO_DATE('2023-11-14 22:13:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005662
;

-- 14/11/2023 22:13:40 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_DATE('2023-11-14 22:13:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005661
;

-- 14/11/2023 22:26:19 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_DATE('2023-11-14 22:26:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005651
;

-- 14/11/2023 22:26:40 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_DATE('2023-11-14 22:26:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005673
;

-- 14/11/2023 22:40:16 ART
-- ISSUE #161: Ventana de Disposición Final
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('C_DocType.DocBaseType = ''MQO''','S',3000143,'LAR','C_DocType Orden de Calidad',100,100,TO_DATE('2023-11-14 22:40:15','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_DATE('2023-11-14 22:40:15','YYYY-MM-DD HH24:MI:SS'))
;

-- 14/11/2023 22:40:36 ART
-- ISSUE #161: Ventana de Disposición Final
UPDATE AD_Column SET AD_Val_Rule_ID=3000143,Updated=TO_DATE('2023-11-14 22:40:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005658
;

-- Registración de script
SELECT register_migration_script_lar('0223_ISSUE-161.sql', 'LAR', '') FROM dual
;
