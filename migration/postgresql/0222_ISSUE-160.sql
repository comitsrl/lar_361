-- Table: adempiere.LAR_OrdenGarantia

-- DROP TABLE IF EXISTS adempiere.LAR_OrdenGarantia;

CREATE TABLE IF NOT EXISTS adempiere.lar_ordengarantia
(
    lar_ordengarantia_id numeric(10,0) NOT NULL,
    ad_client_id numeric(10,0) NOT NULL,
    ad_org_id numeric(10,0) NOT NULL,
    isactive character(1) COLLATE pg_catalog."default" NOT NULL DEFAULT 'Y'::bpchar,
    created timestamp without time zone NOT NULL DEFAULT now(),
    createdby numeric(10,0) NOT NULL,
    updated timestamp without time zone NOT NULL DEFAULT now(),
    updatedby numeric(10,0) NOT NULL,
    documentno character varying(30) COLLATE pg_catalog."default" NOT NULL,
    description character varying(255) COLLATE pg_catalog."default",
    fechacambio timestamp without time zone NOT NULL,
    m_warehousesalida_id numeric(10,0) NOT NULL,
    m_warehouseingreso_id numeric(10,0) NOT NULL,
    c_bpartner_id numeric(10,0) NOT NULL,
    docstatus character(2) COLLATE pg_catalog."default" NOT NULL,
    docaction character(2) COLLATE pg_catalog."default" NOT NULL,
    processing character(1) COLLATE pg_catalog."default",
    processed character(1) COLLATE pg_catalog."default" NOT NULL DEFAULT 'N'::bpchar,
    c_doctype_id numeric(10,0) NOT NULL,
    c_invoice_id numeric(10,0),
    c_order_id numeric(10,0),
    m_rma_id numeric(10,0),
    CONSTRAINT lar_ordengarantia_pkey PRIMARY KEY (lar_ordengarantia_id),
    CONSTRAINT adclient_larordengarantia FOREIGN KEY (ad_client_id)
        REFERENCES adempiere.ad_client (ad_client_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT adorg_larordengarantia FOREIGN KEY (ad_org_id)
        REFERENCES adempiere.ad_org (ad_org_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT c_doctype_larordengarantia FOREIGN KEY (c_doctype_id)
        REFERENCES adempiere.c_doctype (c_doctype_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT cbpartner_larordengarantia FOREIGN KEY (c_bpartner_id)
        REFERENCES adempiere.c_bpartner (c_bpartner_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT cinvoice_larordengarantia FOREIGN KEY (c_invoice_id)
        REFERENCES adempiere.c_invoice (c_invoice_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT corder_larordengarantia FOREIGN KEY (c_order_id)
        REFERENCES adempiere.c_order (c_order_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT mrmra_larordengarantia FOREIGN KEY (m_rma_id)
        REFERENCES adempiere.m_rma (m_rma_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT mwarehouseingreso_larordengarantia FOREIGN KEY (m_warehousesalida_id)
        REFERENCES adempiere.m_warehouse (m_warehouse_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT mwarehousesalida_larordengarantia FOREIGN KEY (m_warehouseingreso_id)
        REFERENCES adempiere.m_warehouse (m_warehouse_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT larordengarantia_isactive_check CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS adempiere.lar_ordengarantia
    OWNER to adempiere;

-- Table: adempiere.LAR_OrdenGarantiaLine

-- DROP TABLE IF EXISTS adempiere.LAR_OrdenGarantiaLine;

CREATE TABLE IF NOT EXISTS adempiere.lar_ordengarantialine
(
    lar_ordengarantialine_id numeric(10,0) NOT NULL,
    ad_client_id numeric(10,0) NOT NULL,
    ad_org_id numeric(10,0) NOT NULL,
    isactive character(1) COLLATE pg_catalog."default" NOT NULL DEFAULT 'Y'::bpchar,
    created timestamp without time zone NOT NULL DEFAULT now(),
    createdby numeric(10,0) NOT NULL,
    updated timestamp without time zone NOT NULL DEFAULT now(),
    updatedby numeric(10,0) NOT NULL,
    lar_ordengarantia_id numeric(10,0) NOT NULL,
    line numeric(10,0) NOT NULL,
    description character varying(255) COLLATE pg_catalog."default",
    m_product_id numeric(10,0),
    c_uom_id numeric(10,0) NOT NULL,
    cantidad numeric NOT NULL DEFAULT 0,
    c_orderline_id numeric(10,0),
    m_rmaline_id numeric(10,0),
    CONSTRAINT lar_ordengarantialine_pkey PRIMARY KEY (lar_ordengarantialine_id),
    CONSTRAINT adclient_larordengarantialine FOREIGN KEY (ad_client_id)
        REFERENCES adempiere.ad_client (ad_client_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT adorg_larordengarantialine FOREIGN KEY (ad_org_id)
        REFERENCES adempiere.ad_org (ad_org_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT corderline_larordengarantialine FOREIGN KEY (c_orderline_id)
        REFERENCES adempiere.c_orderline (c_orderline_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT cuom_larordengarantialine FOREIGN KEY (c_uom_id)
        REFERENCES adempiere.c_uom (c_uom_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT larordengarantia_larordengarantialine FOREIGN KEY (lar_ordengarantia_id)
        REFERENCES adempiere.lar_ordengarantia (lar_ordengarantia_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT mproduct_larordengarantialine FOREIGN KEY (m_product_id)
        REFERENCES adempiere.m_product (m_product_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT mrmraline_larordengarantia FOREIGN KEY (m_rmaline_id)
        REFERENCES adempiere.m_rmaline (m_rmaline_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT lar_ordengarantialine_isactive_check CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS adempiere.lar_ordengarantialine
    OWNER to adempiere;

-- Index: LAR_OrdenGarantiaLine_unique

-- DROP INDEX IF EXISTS adempiere.LAR_OrdenGarantiaLine_unique;

CREATE UNIQUE INDEX LAR_OrdenGarantiaLine_unique
    ON adempiere.LAR_OrdenGarantiaLine USING btree
    (LAR_OrdenGarantia_ID ASC NULLS LAST, C_OrderLine_ID ASC NULLS LAST)
    TABLESPACE pg_default;

ALTER TABLE M_InOut ADD COLUMN LAR_OrdenGarantia_ID numeric(10,0);
ALTER TABLE M_InOut ADD CONSTRAINT larordengarantia_minout FOREIGN KEY (LAR_OrdenGarantia_ID)
        REFERENCES adempiere.LAR_OrdenGarantia (LAR_OrdenGarantia_ID) MATCH SIMPLE;

ALTER TABLE LAR_OrdenGarantia ADD COLUMN M_RMA_ID numeric(10,0);
ALTER TABLE LAR_OrdenGarantia ADD CONSTRAINT mrmra_larordengarantia FOREIGN KEY (M_RMA_ID)
        REFERENCES adempiere.M_RMA (M_RMA_ID) MATCH SIMPLE;

ALTER TABLE LAR_OrdenGarantiaLine ADD COLUMN M_RMALine_ID numeric(10,0);
ALTER TABLE LAR_OrdenGarantiaLine ADD CONSTRAINT mrmraline_larordengarantia FOREIGN KEY (M_RMALine_ID)
        REFERENCES adempiere.M_RMALine (M_RMALine_ID) MATCH SIMPLE;

ALTER TABLE C_BPartner ADD COLUMN MesesGarantia numeric(3,0) NOT NULL DEFAULT 14;

ALTER TABLE LAR_OrdenGarantiaLine ADD COLUMN FechaBorne timestamp without time zone;
ALTER TABLE LAR_OrdenGarantiaLine ADD COLUMN FechaCaja timestamp without time zone;

-- 15/08/2023 21:52:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,ImportTable,IsHighVolume,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','3',0,3000268,'N','N','N','N','N','LAR','Y','Y','L','LAR_OrdenGarantia','Ordenes de Garantía',0,'Y',0,100,TO_TIMESTAMP('2023-08-15 21:52:27','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2023-08-15 21:52:27','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2023 21:52:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000268 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- 15/08/2023 21:52:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,UpdatedBy,AD_Client_ID,Updated,Created,CreatedBy,IsActive) VALUES (1,'N',200000,'Y',1000000,1000000,'N','Y',3002202,'Table LAR_OrdenGarantia','LAR_OrdenGarantia',0,100,0,TO_TIMESTAMP('2023-08-15 21:52:28','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2023-08-15 21:52:28','YYYY-MM-DD HH24:MI:SS'),100,'Y')
;

-- 15/08/2023 21:57:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001397,'LAR_OrdenGarantia_ID','LAR','Ordenes de Garantía','Ordenes de Garantía',0,TO_TIMESTAMP('2023-08-15 21:57:06','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2023-08-15 21:57:06','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 15/08/2023 21:57:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001397 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 15/08/2023 21:57:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005579,3000268,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3001397,'N','N','N','Ordenes de Garantía','LAR_OrdenGarantia_ID',100,TO_TIMESTAMP('2023-08-15 21:57:06','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 21:57:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 21:57:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005579 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 21:57:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005580,3000268,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,TO_TIMESTAMP('2023-08-15 21:57:06','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 21:57:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 21:57:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005580 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 21:57:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005581,3000268,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',100,TO_TIMESTAMP('2023-08-15 21:57:06','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 21:57:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 21:57:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005581 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 21:57:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005582,3000268,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,TO_TIMESTAMP('2023-08-15 21:57:06','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 21:57:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 21:57:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005582 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 21:57:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005583,3000268,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,TO_TIMESTAMP('2023-08-15 21:57:07','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 21:57:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 21:57:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005583 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 21:57:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005584,3000268,'LAR',0,110,'Y','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,TO_TIMESTAMP('2023-08-15 21:57:07','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 21:57:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 21:57:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005584 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 21:57:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005585,3000268,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,TO_TIMESTAMP('2023-08-15 21:57:07','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 21:57:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 21:57:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005585 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 21:57:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005586,3000268,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,TO_TIMESTAMP('2023-08-15 21:57:07','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 21:57:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 21:57:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005586 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 21:57:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005587,3000268,'LAR',0,'Y','N','N','The document number is usually automatically generated by the system and determined by the document type of the document. If the document is not saved, the preliminary number is displayed in "<>".

If the document type of your document has no automatic document sequence defined, the field is empty if you create a new document. This is for documents which usually have an external number (like vendor invoice).  If you leave the field empty, the system will generate a document number for you. The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).','N',30,'Y',10,'N',290,'N','Y','N','Document sequence number of the document','Document No','DocumentNo',100,TO_TIMESTAMP('2023-08-15 21:57:08','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 21:57:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 21:57:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005587 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 21:57:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005588,3000268,'LAR',0,'N','N','N','A description is limited to 255 characters.','N',255,'Y',10,'N',275,'N','Y','N','Optional short description of the record','Description','Description',100,TO_TIMESTAMP('2023-08-15 21:57:08','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 21:57:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 21:57:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005588 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 21:57:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001398,'fechacambio','LAR','fechacambio','fechacambio',0,TO_TIMESTAMP('2023-08-15 21:57:08','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2023-08-15 21:57:08','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 15/08/2023 21:57:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001398 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 15/08/2023 21:57:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005589,3000268,'LAR',0,'Y','N','N','N',29,'N',16,'N',3001398,'N','Y','N','fechacambio','fechacambio',100,TO_TIMESTAMP('2023-08-15 21:57:08','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 21:57:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 21:57:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005589 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 21:57:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001399,'m_warehousesalida_id','LAR','m_warehousesalida_id','m_warehousesalida_id',0,TO_TIMESTAMP('2023-08-15 21:57:08','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2023-08-15 21:57:08','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 15/08/2023 21:57:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001399 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 15/08/2023 21:57:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005590,3000268,'LAR',0,'Y','N','N','N',10,'N',19,'N',3001399,'N','Y','N','m_warehousesalida_id','m_warehousesalida_id',100,TO_TIMESTAMP('2023-08-15 21:57:08','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 21:57:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 21:57:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005590 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 21:57:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001400,'m_warehouseingreso_id','LAR','m_warehouseingreso_id','m_warehouseingreso_id',0,TO_TIMESTAMP('2023-08-15 21:57:09','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2023-08-15 21:57:09','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 15/08/2023 21:57:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001400 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 15/08/2023 21:57:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005591,3000268,'LAR',0,'Y','N','N','N',10,'N',19,'N',3001400,'N','Y','N','m_warehouseingreso_id','m_warehouseingreso_id',100,TO_TIMESTAMP('2023-08-15 21:57:09','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 21:57:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 21:57:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005591 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 21:57:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005592,3000268,'LAR',0,'Y','N','N','A Business Partner is anyone with whom you transact.  This can include Vendor, Customer, Employee or Salesperson','N',10,'N',19,'N',187,'N','Y','N','Identifies a Business Partner','Business Partner ','C_BPartner_ID',100,TO_TIMESTAMP('2023-08-15 21:57:09','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 21:57:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 21:57:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005592 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 21:57:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005593,3000268,'LAR',0,'Y','N','N','The Document Status indicates the status of a document at this time.  If you want to change the document status, use the Document Action field','N',2,'N',17,'N',289,'N','Y','N','The current status of the document','Document Status','DocStatus',100,TO_TIMESTAMP('2023-08-15 21:57:09','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 21:57:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 21:57:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005593 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 21:57:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005594,3000268,'LAR',0,'Y','N','N','You find the current status in the Document Status field. The options are listed in a popup','N',2,'N',17,'N',287,'N','Y','N','The targeted status of the document','Document Action','DocAction',100,TO_TIMESTAMP('2023-08-15 21:57:09','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 21:57:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 21:57:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005594 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 21:57:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005595,3000268,'LAR',0,'N','N','N','N',1,'N',20,'N',524,'N','Y','N','Process Now','Processing',100,TO_TIMESTAMP('2023-08-15 21:57:09','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 21:57:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 21:57:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005595 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 21:57:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005596,3000268,'LAR',0,'Y','N','N','The Processed checkbox indicates that a document has been processed.','N',1,'N',20,'N',1047,'N','Y','N','The document has been processed','Processed','Processed',100,TO_TIMESTAMP('2023-08-15 21:57:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 21:57:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 21:57:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005596 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 21:57:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005597,3000268,'LAR',0,'Y','N','N','The Document Type determines document sequence and processing rules','N',10,'N',19,'N',196,'N','Y','N','Document type or rules','Document Type','C_DocType_ID',100,TO_TIMESTAMP('2023-08-15 21:57:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 21:57:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 21:57:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005597 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 21:57:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005598,3000268,'LAR',0,'Y','N','N','The Invoice Document.','N',10,'N',19,'N',1008,'N','Y','N','Invoice Identifier','Invoice','C_Invoice_ID',100,TO_TIMESTAMP('2023-08-15 21:57:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 21:57:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 21:57:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005598 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 21:57:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005599,3000268,'LAR',0,'Y','N','N','The Order is a control document.  The  Order is complete when the quantity ordered is the same as the quantity shipped and invoiced.  When you close an order, unshipped (backordered) quantities are cancelled.','N',10,'N',19,'N',558,'N','Y','N','Order','Order','C_Order_ID',100,TO_TIMESTAMP('2023-08-15 21:57:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 21:57:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 21:57:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005599 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 21:58:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Element SET ColumnName='FechaCambio', Name='Fecha de Cambio', PrintName='Fecha de Cambio',Updated=TO_TIMESTAMP('2023-08-15 21:58:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001398
;

-- 15/08/2023 21:58:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001398
;

-- 15/08/2023 21:58:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET ColumnName='FechaCambio', Name='Fecha de Cambio', Description=NULL, Help=NULL WHERE AD_Element_ID=3001398
;

-- 15/08/2023 21:58:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Process_Para SET ColumnName='FechaCambio', Name='Fecha de Cambio', Description=NULL, Help=NULL, AD_Element_ID=3001398 WHERE UPPER(ColumnName)='FECHACAMBIO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 15/08/2023 21:58:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Process_Para SET ColumnName='FechaCambio', Name='Fecha de Cambio', Description=NULL, Help=NULL WHERE AD_Element_ID=3001398 AND IsCentrallyMaintained='Y'
;

-- 15/08/2023 21:58:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET Name='Fecha de Cambio', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001398) AND IsCentrallyMaintained='Y'
;

-- 15/08/2023 21:58:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_PrintFormatItem SET PrintName='Fecha de Cambio', Name='Fecha de Cambio' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001398)
;

-- 15/08/2023 21:59:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column_Trl SET Name='Fecha de Cambio',Updated=TO_TIMESTAMP('2023-08-15 21:59:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005589 AND AD_Language='es_AR'
;

-- 15/08/2023 22:00:42 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET AD_Reference_ID=18, Name='Depósito de Ingreso', ColumnName='M_WareHouseIngreso_ID',Updated=TO_TIMESTAMP('2023-08-15 22:00:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005591
;

-- 15/08/2023 22:00:42 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3005591
;

-- 15/08/2023 22:00:42 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET Name='Depósito de Ingreso', Description=NULL, Help=NULL WHERE AD_Column_ID=3005591 AND IsCentrallyMaintained='Y'
;

-- 15/08/2023 22:02:18 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET AD_Reference_Value_ID=197,Updated=TO_TIMESTAMP('2023-08-15 22:02:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005591
;

-- 15/08/2023 22:02:43 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Element SET ColumnName='M_WareHouseIngreso_ID', Name='Depósito de Ingreso', PrintName='Depósito de Ingreso',Updated=TO_TIMESTAMP('2023-08-15 22:02:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001400
;

-- 15/08/2023 22:02:43 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001400
;

-- 15/08/2023 22:02:43 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET ColumnName='M_WareHouseIngreso_ID', Name='Depósito de Ingreso', Description=NULL, Help=NULL WHERE AD_Element_ID=3001400
;

-- 15/08/2023 22:02:43 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Process_Para SET ColumnName='M_WareHouseIngreso_ID', Name='Depósito de Ingreso', Description=NULL, Help=NULL, AD_Element_ID=3001400 WHERE UPPER(ColumnName)='M_WAREHOUSEINGRESO_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 15/08/2023 22:02:43 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Process_Para SET ColumnName='M_WareHouseIngreso_ID', Name='Depósito de Ingreso', Description=NULL, Help=NULL WHERE AD_Element_ID=3001400 AND IsCentrallyMaintained='Y'
;

-- 15/08/2023 22:02:43 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET Name='Depósito de Ingreso', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001400) AND IsCentrallyMaintained='Y'
;

-- 15/08/2023 22:02:43 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_PrintFormatItem SET PrintName='Depósito de Ingreso', Name='Depósito de Ingreso' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001400)
;

-- 15/08/2023 22:02:51 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Element_Trl SET Name='Depósito de Ingreso',PrintName='Depósito de Ingreso',Updated=TO_TIMESTAMP('2023-08-15 22:02:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001400 AND AD_Language='es_AR'
;

-- 15/08/2023 22:03:18 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column_Trl SET Name='Depósito de Ingreso',Updated=TO_TIMESTAMP('2023-08-15 22:03:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005591 AND AD_Language='es_AR'
;

-- 15/08/2023 22:04:21 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET AD_Reference_Value_ID=197, AD_Reference_ID=18, Name='Depósito de Salida', ColumnName='M_WareHouseSalida_ID',Updated=TO_TIMESTAMP('2023-08-15 22:04:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005590
;

-- 15/08/2023 22:04:21 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3005590
;

-- 15/08/2023 22:04:21 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET Name='Depósito de Salida', Description=NULL, Help=NULL WHERE AD_Column_ID=3005590 AND IsCentrallyMaintained='Y'
;

-- 15/08/2023 22:04:31 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column_Trl SET Name='Depósito de Salida',Updated=TO_TIMESTAMP('2023-08-15 22:04:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005590 AND AD_Language='es_AR'
;

-- 15/08/2023 22:04:45 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Element SET ColumnName='M_WareHouseSalida_ID', Name='Depósito de Salida', PrintName='Depósito de Salida',Updated=TO_TIMESTAMP('2023-08-15 22:04:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001399
;

-- 15/08/2023 22:04:45 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001399
;

-- 15/08/2023 22:04:45 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET ColumnName='M_WareHouseSalida_ID', Name='Depósito de Salida', Description=NULL, Help=NULL WHERE AD_Element_ID=3001399
;

-- 15/08/2023 22:04:45 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Process_Para SET ColumnName='M_WareHouseSalida_ID', Name='Depósito de Salida', Description=NULL, Help=NULL, AD_Element_ID=3001399 WHERE UPPER(ColumnName)='M_WAREHOUSESALIDA_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 15/08/2023 22:04:45 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Process_Para SET ColumnName='M_WareHouseSalida_ID', Name='Depósito de Salida', Description=NULL, Help=NULL WHERE AD_Element_ID=3001399 AND IsCentrallyMaintained='Y'
;

-- 15/08/2023 22:04:45 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET Name='Depósito de Salida', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001399) AND IsCentrallyMaintained='Y'
;

-- 15/08/2023 22:04:45 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_PrintFormatItem SET PrintName='Depósito de Salida', Name='Depósito de Salida' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001399)
;

-- 15/08/2023 22:04:57 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Element_Trl SET Name='Depósito de Salida',PrintName='Depósito de Salida',Updated=TO_TIMESTAMP('2023-08-15 22:04:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001399 AND AD_Language='es_AR'
;

-- 15/08/2023 22:10:02 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,ImportTable,IsHighVolume,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','3',0,3000269,'N','N','N','N','N','LAR','Y','Y','L','LAR_OrdenGarantiaLine','Línea de OG',0,'Y',0,100,TO_TIMESTAMP('2023-08-15 22:10:02','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2023-08-15 22:10:02','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2023 22:10:02 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000269 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- 15/08/2023 22:10:02 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,UpdatedBy,AD_Client_ID,Updated,Created,CreatedBy,IsActive) VALUES (1,'N',200000,'Y',1000000,1000000,'N','Y',3002203,'Table LAR_OrdenGarantiaLine','LAR_OrdenGarantiaLine',0,100,0,TO_TIMESTAMP('2023-08-15 22:10:02','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2023-08-15 22:10:02','YYYY-MM-DD HH24:MI:SS'),100,'Y')
;

-- 15/08/2023 22:10:12 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001401,'LAR_OrdenGarantiaLine_ID','LAR','Línea de OG','Línea de OG',0,TO_TIMESTAMP('2023-08-15 22:10:12','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2023-08-15 22:10:12','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 15/08/2023 22:10:12 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001401 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 15/08/2023 22:10:12 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005600,3000269,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3001401,'N','N','N','Línea de OG','LAR_OrdenGarantiaLine_ID',100,TO_TIMESTAMP('2023-08-15 22:10:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 22:10:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 22:10:12 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005600 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 22:10:12 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005601,3000269,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,TO_TIMESTAMP('2023-08-15 22:10:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 22:10:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 22:10:12 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005601 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 22:10:12 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005602,3000269,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',100,TO_TIMESTAMP('2023-08-15 22:10:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 22:10:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 22:10:12 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005602 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 22:10:12 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005603,3000269,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,TO_TIMESTAMP('2023-08-15 22:10:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 22:10:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 22:10:12 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005603 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 22:10:13 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005604,3000269,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,TO_TIMESTAMP('2023-08-15 22:10:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 22:10:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 22:10:13 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005604 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 22:10:13 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005605,3000269,'LAR',0,110,'Y','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,TO_TIMESTAMP('2023-08-15 22:10:13','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 22:10:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 22:10:13 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005605 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 22:10:13 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005606,3000269,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,TO_TIMESTAMP('2023-08-15 22:10:13','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 22:10:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 22:10:13 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005606 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 22:10:13 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005607,3000269,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,TO_TIMESTAMP('2023-08-15 22:10:13','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 22:10:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 22:10:13 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005607 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 22:10:13 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005608,3000269,'LAR',0,'Y','N','N','N',10,'N',19,'N',3001397,'N','Y','N','Ordenes de Garantía','LAR_OrdenGarantia_ID',100,TO_TIMESTAMP('2023-08-15 22:10:13','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 22:10:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 22:10:13 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005608 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 22:10:13 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005609,3000269,'LAR',0,'Y','N','N','Indicates the unique line for a document.  It will also control the display order of the lines within a document.','N',10,'N',11,'N',439,'N','Y','N','Unique line for this document','Line No','Line',100,TO_TIMESTAMP('2023-08-15 22:10:13','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 22:10:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 22:10:13 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005609 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 22:10:14 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005610,3000269,'LAR',0,'N','N','N','A description is limited to 255 characters.','N',255,'Y',10,'N',275,'N','Y','N','Optional short description of the record','Description','Description',100,TO_TIMESTAMP('2023-08-15 22:10:13','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 22:10:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 22:10:14 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005610 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 22:10:14 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005611,3000269,'LAR',0,'N','N','N','Identifies an item which is either purchased or sold in this organization.','N',10,'N',19,'N',454,'N','Y','N','Product, Service, Item','Product','M_Product_ID',100,TO_TIMESTAMP('2023-08-15 22:10:14','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 22:10:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 22:10:14 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005611 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 22:10:14 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005612,3000269,'LAR',0,'Y','N','N','The UOM defines a unique non monetary Unit of Measure','N',10,'N',19,'N',215,'N','Y','N','Unit of Measure','UOM','C_UOM_ID',100,TO_TIMESTAMP('2023-08-15 22:10:14','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 22:10:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 22:10:14 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005612 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 22:10:14 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005613,3000269,'LAR',0,'Y','N','N','N',14,'N',22,'N',3001061,'N','Y','N','Cantidad','Cantidad',100,TO_TIMESTAMP('2023-08-15 22:10:14','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 22:10:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 22:10:14 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005613 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 22:10:14 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005614,3000269,'LAR',0,'Y','N','N','The Sales Order Line is a unique identifier for a line in an order.','N',10,'N',19,'N',561,'N','Y','N','Sales Order Line','Sales Order Line','C_OrderLine_ID',100,TO_TIMESTAMP('2023-08-15 22:10:14','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-15 22:10:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2023 22:10:14 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005614 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2023 22:10:37 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET IsParent='Y', IsUpdateable='N',Updated=TO_TIMESTAMP('2023-08-15 22:10:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005608
;

-- 15/08/2023 22:11:44 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Window (AD_Window_ID,WindowType,IsSOTrx,IsDefault,IsBetaFunctionality,WinHeight,WinWidth,EntityType,Name,IsActive,Created,UpdatedBy,CreatedBy,Updated,AD_Org_ID,AD_Client_ID,Processing) VALUES (3000141,'M','Y','N','N',0,0,'LAR','Ordenes de Garantía','Y',TO_TIMESTAMP('2023-08-15 22:11:44','YYYY-MM-DD HH24:MI:SS'),100,100,TO_TIMESTAMP('2023-08-15 22:11:44','YYYY-MM-DD HH24:MI:SS'),0,0,'N')
;

-- 15/08/2023 22:11:44 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Window_Trl (AD_Language,AD_Window_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Window_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Window t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Window_ID=3000141 AND NOT EXISTS (SELECT * FROM AD_Window_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Window_ID=t.AD_Window_ID)
;

-- 15/08/2023 22:12:56 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('Y',3000141,10,'N','N',3000268,3000301,'N','N','N','N',0,'Y','N','LAR','Ordenes de Garantía',0,0,TO_TIMESTAMP('2023-08-15 22:12:56','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2023-08-15 22:12:56','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 15/08/2023 22:12:56 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000301 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 15/08/2023 22:13:17 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008816,1,'Y','N','N',3005582,'N','Y',3000301,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,TO_TIMESTAMP('2023-08-15 22:13:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-15 22:13:17','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2023 22:13:17 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008816 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2023 22:13:17 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008817,10,'Y','N','N',3005592,'N','Y',3000301,'N','A Business Partner is anyone with whom you transact.  This can include Vendor, Customer, Employee or Salesperson','LAR','Identifies a Business Partner','Business Partner ',100,0,TO_TIMESTAMP('2023-08-15 22:13:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-15 22:13:17','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2023 22:13:17 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008817 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2023 22:13:17 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008818,10,'Y','N','N',3005580,'N','Y',3000301,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,TO_TIMESTAMP('2023-08-15 22:13:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-15 22:13:17','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2023 22:13:17 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008818 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2023 22:13:18 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008819,10,'Y','N','N',3005591,'N','Y',3000301,'N','LAR','Depósito de Ingreso',100,0,TO_TIMESTAMP('2023-08-15 22:13:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-15 22:13:17','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2023 22:13:18 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008819 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2023 22:13:18 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008820,10,'Y','N','N',3005590,'N','Y',3000301,'N','LAR','Depósito de Salida',100,0,TO_TIMESTAMP('2023-08-15 22:13:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-15 22:13:18','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2023 22:13:18 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008820 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2023 22:13:18 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008821,255,'Y','N','N',3005588,'N','Y',3000301,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,TO_TIMESTAMP('2023-08-15 22:13:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-15 22:13:18','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2023 22:13:18 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008821 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2023 22:13:18 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008822,2,'Y','N','N',3005594,'N','Y',3000301,'N','You find the current status in the Document Status field. The options are listed in a popup','LAR','The targeted status of the document','Document Action',100,0,TO_TIMESTAMP('2023-08-15 22:13:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-15 22:13:18','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2023 22:13:18 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008822 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2023 22:13:18 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008823,30,'Y','N','N',3005587,'N','Y',3000301,'N','The document number is usually automatically generated by the system and determined by the document type of the document. If the document is not saved, the preliminary number is displayed in "<>".

If the document type of your document has no automatic document sequence defined, the field is empty if you create a new document. This is for documents which usually have an external number (like vendor invoice).  If you leave the field empty, the system will generate a document number for you. The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).','LAR','Document sequence number of the document','Document No',100,0,TO_TIMESTAMP('2023-08-15 22:13:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-15 22:13:18','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2023 22:13:18 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008823 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2023 22:13:19 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008824,2,'Y','N','N',3005593,'N','Y',3000301,'N','The Document Status indicates the status of a document at this time.  If you want to change the document status, use the Document Action field','LAR','The current status of the document','Document Status',100,0,TO_TIMESTAMP('2023-08-15 22:13:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-15 22:13:18','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2023 22:13:19 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008824 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2023 22:13:19 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008825,10,'Y','N','N',3005597,'N','Y',3000301,'N','The Document Type determines document sequence and processing rules','LAR','Document type or rules','Document Type',100,0,TO_TIMESTAMP('2023-08-15 22:13:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-15 22:13:19','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2023 22:13:19 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008825 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2023 22:13:19 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008826,29,'Y','N','N',3005589,'N','Y',3000301,'N','LAR','Fecha de Cambio',100,0,TO_TIMESTAMP('2023-08-15 22:13:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-15 22:13:19','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2023 22:13:19 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008826 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2023 22:13:19 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008827,10,'Y','N','N',3005598,'N','Y',3000301,'N','The Invoice Document.','LAR','Invoice Identifier','Invoice',100,0,TO_TIMESTAMP('2023-08-15 22:13:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-15 22:13:19','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2023 22:13:19 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008827 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2023 22:13:19 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008828,10,'N','N','N',3005579,'N','Y',3000301,'N','LAR','Ordenes de Garantía',100,0,TO_TIMESTAMP('2023-08-15 22:13:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-15 22:13:19','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2023 22:13:19 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008828 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2023 22:13:19 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008829,10,'Y','N','N',3005599,'N','Y',3000301,'N','The Order is a control document.  The  Order is complete when the quantity ordered is the same as the quantity shipped and invoiced.  When you close an order, unshipped (backordered) quantities are cancelled.','LAR','Order','Order',100,0,TO_TIMESTAMP('2023-08-15 22:13:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-15 22:13:19','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2023 22:13:19 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008829 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2023 22:13:20 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008830,10,'Y','N','N',3005581,'N','Y',3000301,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,TO_TIMESTAMP('2023-08-15 22:13:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-15 22:13:19','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2023 22:13:20 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008830 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2023 22:13:20 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008831,1,'Y','N','N',3005595,'N','Y',3000301,'N','LAR','Process Now',100,0,TO_TIMESTAMP('2023-08-15 22:13:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-15 22:13:20','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2023 22:13:20 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008831 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2023 22:13:20 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008832,1,'Y','N','N',3005596,'N','Y',3000301,'N','The Processed checkbox indicates that a document has been processed.','LAR','The document has been processed','Processed',100,0,TO_TIMESTAMP('2023-08-15 22:13:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-15 22:13:20','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2023 22:13:20 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008832 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2023 22:15:14 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3008818
;

-- 15/08/2023 22:15:14 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3008830
;

-- 15/08/2023 22:15:14 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3008823
;

-- 15/08/2023 22:15:14 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3008821
;

-- 15/08/2023 22:15:14 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3008829
;

-- 15/08/2023 22:15:14 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3008827
;

-- 15/08/2023 22:15:14 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3008825
;

-- 15/08/2023 22:15:14 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3008816
;

-- 15/08/2023 22:15:14 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3008817
;

-- 15/08/2023 22:15:14 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3008826
;

-- 15/08/2023 22:15:14 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3008819
;

-- 15/08/2023 22:15:14 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3008820
;

-- 15/08/2023 22:15:14 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3008824
;

-- 15/08/2023 22:15:14 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3008822
;

-- 15/08/2023 22:15:14 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3008831
;

-- 15/08/2023 22:15:14 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3008832
;

-- 15/08/2023 22:15:25 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2023-08-15 22:15:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008830
;

-- 15/08/2023 22:15:56 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2023-08-15 22:15:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008827
;

-- 15/08/2023 22:16:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2023-08-15 22:16:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008816
;

-- 15/08/2023 22:16:14 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2023-08-15 22:16:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008826
;

-- 15/08/2023 22:16:23 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2023-08-15 22:16:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008820
;

-- 15/08/2023 22:16:32 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2023-08-15 22:16:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008822
;

-- 15/08/2023 22:16:43 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET IsSameLine='Y', IsReadOnly='Y',Updated=TO_TIMESTAMP('2023-08-15 22:16:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008832
;

-- 15/08/2023 22:16:47 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2023-08-15 22:16:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008831
;

-- 15/08/2023 22:16:55 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2023-08-15 22:16:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008824
;

-- 15/08/2023 22:18:16 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Parent_Column_ID,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('Y',3000141,20,'N','N',3000269,3000302,'N','N','N','N',1,'Y','N','LAR',3005579,'Línea de OG',0,0,TO_TIMESTAMP('2023-08-15 22:18:16','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2023-08-15 22:18:16','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 15/08/2023 22:18:16 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000302 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 15/08/2023 22:18:27 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008833,1,'Y','N','N',3005603,'N','Y',3000302,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,TO_TIMESTAMP('2023-08-15 22:18:27','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-15 22:18:27','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2023 22:18:27 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008833 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2023 22:18:27 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008834,14,'Y','N','N',3005613,'N','Y',3000302,'N','LAR','Cantidad',100,0,TO_TIMESTAMP('2023-08-15 22:18:27','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-15 22:18:27','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2023 22:18:27 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008834 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2023 22:18:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008835,10,'Y','N','N',3005601,'N','Y',3000302,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,TO_TIMESTAMP('2023-08-15 22:18:27','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-15 22:18:27','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2023 22:18:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008835 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2023 22:18:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008836,255,'Y','N','N',3005610,'N','Y',3000302,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,TO_TIMESTAMP('2023-08-15 22:18:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-15 22:18:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2023 22:18:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008836 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2023 22:18:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008837,10,'Y','N','N',3005609,'N','Y',3000302,'N','Indicates the unique line for a document.  It will also control the display order of the lines within a document.','LAR','Unique line for this document','Line No',100,0,TO_TIMESTAMP('2023-08-15 22:18:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-15 22:18:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2023 22:18:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008837 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2023 22:18:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008838,10,'N','N','N',3005600,'N','Y',3000302,'N','LAR','Línea de OG',100,0,TO_TIMESTAMP('2023-08-15 22:18:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-15 22:18:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2023 22:18:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008838 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2023 22:18:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008839,10,'Y','N','N',3005608,'N','Y',3000302,'N','LAR','Ordenes de Garantía',100,0,TO_TIMESTAMP('2023-08-15 22:18:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-15 22:18:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2023 22:18:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008839 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2023 22:18:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008840,10,'Y','N','N',3005602,'N','Y',3000302,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,TO_TIMESTAMP('2023-08-15 22:18:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-15 22:18:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2023 22:18:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008840 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2023 22:18:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008841,10,'Y','N','N',3005611,'N','Y',3000302,'N','Identifies an item which is either purchased or sold in this organization.','LAR','Product, Service, Item','Product',100,0,TO_TIMESTAMP('2023-08-15 22:18:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-15 22:18:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2023 22:18:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008841 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2023 22:18:29 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008842,10,'Y','N','N',3005614,'N','Y',3000302,'N','The Sales Order Line is a unique identifier for a line in an order.','LAR','Sales Order Line','Sales Order Line',100,0,TO_TIMESTAMP('2023-08-15 22:18:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-15 22:18:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2023 22:18:29 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008842 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2023 22:18:29 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008843,10,'Y','N','N',3005612,'N','Y',3000302,'N','The UOM defines a unique non monetary Unit of Measure','LAR','Unit of Measure','UOM',100,0,TO_TIMESTAMP('2023-08-15 22:18:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-15 22:18:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2023 22:18:29 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008843 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2023 22:20:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3008835
;

-- 15/08/2023 22:20:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3008840
;

-- 15/08/2023 22:20:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3008839
;

-- 15/08/2023 22:20:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3008833
;

-- 15/08/2023 22:20:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3008837
;

-- 15/08/2023 22:20:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3008842
;

-- 15/08/2023 22:20:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3008836
;

-- 15/08/2023 22:20:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3008841
;

-- 15/08/2023 22:20:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3008843
;

-- 15/08/2023 22:20:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3008834
;

-- 15/08/2023 22:20:14 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2023-08-15 22:20:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008840
;

-- 15/08/2023 22:20:36 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2023-08-15 22:20:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008833
;

-- 15/08/2023 22:20:45 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2023-08-15 22:20:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008842
;

-- 15/08/2023 22:20:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2023-08-15 22:20:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008843
;

-- 15/08/2023 22:21:47 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET AD_FieldGroup_ID=101,Updated=TO_TIMESTAMP('2023-08-15 22:21:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008824
;

-- 15/08/2023 22:22:00 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET AD_FieldGroup_ID=108,Updated=TO_TIMESTAMP('2023-08-15 22:22:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008819
;

-- 15/08/2023 22:23:05 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET AD_FieldGroup_ID=107,Updated=TO_TIMESTAMP('2023-08-15 22:23:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008817
;

-- 15/08/2023 22:23:32 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET AD_FieldGroup_ID=104,Updated=TO_TIMESTAMP('2023-08-15 22:23:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008829
;

-- 15/08/2023 22:24:01 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET AD_FieldGroup_ID=104,Updated=TO_TIMESTAMP('2023-08-15 22:24:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008837
;

-- 15/08/2023 22:24:17 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET AD_FieldGroup_ID=106,Updated=TO_TIMESTAMP('2023-08-15 22:24:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008841
;

-- 15/08/2023 22:25:26 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Menu (AD_Window_ID,AD_Menu_ID,IsSummary,"action",IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000141,3000498,'N','W','N','N','LAR','Y','Ordenes de Garantía',TO_TIMESTAMP('2023-08-15 22:25:26','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_TIMESTAMP('2023-08-15 22:25:26','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 15/08/2023 22:25:26 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000498 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 15/08/2023 22:25:26 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100,t.AD_Tree_ID, 3000498, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000498)
;

-- 15/08/2023 22:25:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000006
;

-- 15/08/2023 22:25:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=52001
;

-- 15/08/2023 22:25:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=460
;

-- 15/08/2023 22:25:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=301
;

-- 15/08/2023 22:25:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53249
;

-- 15/08/2023 22:25:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=129
;

-- 15/08/2023 22:25:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000498
;

-- 15/08/2023 22:25:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=7, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000364
;

-- 15/08/2023 22:25:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=8, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=543
;

-- 15/08/2023 22:25:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=9, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=195
;

-- 15/08/2023 22:25:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=10, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53223
;

-- 15/08/2023 22:25:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=11, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=407
;

-- 15/08/2023 22:25:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=12, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=406
;

-- 15/08/2023 22:25:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=13, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=335
;

-- 15/08/2023 22:25:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=14, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=436
;

-- 15/08/2023 22:25:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=15, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=507
;

-- 15/08/2023 22:25:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=16, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=448
;

-- 15/08/2023 22:25:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=17, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=449
;

-- 15/08/2023 22:25:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=18, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=492
;

-- 15/08/2023 22:25:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=19, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53269
;

-- 15/08/2023 22:25:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=20, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=491
;

-- 15/08/2023 22:25:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=21, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=419
;

-- 15/08/2023 22:26:02 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Menu SET IsSOTrx='Y',Updated=TO_TIMESTAMP('2023-08-15 22:26:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=3000498
;

-- 15/08/2023 22:26:29 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Table SET AD_Window_ID=3000141,Updated=TO_TIMESTAMP('2023-08-15 22:26:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000268
;

-- 15/08/2023 23:25:14 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET AD_Reference_ID=30,Updated=TO_TIMESTAMP('2023-08-15 23:25:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005592
;

-- 15/08/2023 23:26:22 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET AD_Val_Rule_ID=230,Updated=TO_TIMESTAMP('2023-08-15 23:26:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005592
;

-- 15/08/2023 23:26:36 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET AD_Reference_ID=30,Updated=TO_TIMESTAMP('2023-08-15 23:26:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005598
;

-- 15/08/2023 23:26:47 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET AD_Reference_ID=30,Updated=TO_TIMESTAMP('2023-08-15 23:26:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005599
;

-- 15/08/2023 23:27:43 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET IsIdentifier='Y', SeqNo=1,Updated=TO_TIMESTAMP('2023-08-15 23:27:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005587
;

-- 15/08/2023 23:27:58 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET IsIdentifier='Y', SeqNo=2,Updated=TO_TIMESTAMP('2023-08-15 23:27:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005589
;

-- 15/08/2023 23:28:03 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_TIMESTAMP('2023-08-15 23:28:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005589
;

-- 15/08/2023 23:28:23 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_TIMESTAMP('2023-08-15 23:28:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005592
;

-- 15/08/2023 23:28:34 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_TIMESTAMP('2023-08-15 23:28:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005593
;

-- 15/08/2023 23:28:48 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Table SET IsChangeLog='Y',Updated=TO_TIMESTAMP('2023-08-15 23:28:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000268
;

-- 15/08/2023 23:29:22 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Table SET IsChangeLog='Y',Updated=TO_TIMESTAMP('2023-08-15 23:29:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000269
;

-- 15/08/2023 23:29:52 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET AD_Reference_ID=30,Updated=TO_TIMESTAMP('2023-08-15 23:29:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005611
;

-- 15/08/2023 23:30:38 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET AD_Val_Rule_ID=231,Updated=TO_TIMESTAMP('2023-08-15 23:30:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005611
;

-- 15/08/2023 23:35:25 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET DefaultValue='CO', AD_Reference_Value_ID=135, AD_Reference_ID=28,Updated=TO_TIMESTAMP('2023-08-15 23:35:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005594
;

-- 15/08/2023 23:38:36 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Workflow (Cost,WorkingTime,AccessLevel,Author,AD_Workflow_ID,Duration,DurationUnit,EntityType,IsDefault,IsValid,PublishStatus,Version,AD_Table_ID,DocumentNo,WaitingTime,IsBetaFunctionality,WorkflowType,Name,Value,Description,UpdatedBy,Updated,Created,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive) VALUES (0,0,'1','Adempiere, Inc.',3000010,1,'D','LAR','N','N','R',0,3000268,'4000000',0,'N','P','LAR_OrdenGarantia_Procesar','LAR_OrdenGarantia_Procesar','(Procesar Orden de Garantía)',100,TO_TIMESTAMP('2023-08-15 23:38:35','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2023-08-15 23:38:35','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y')
;

-- 15/08/2023 23:38:36 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Workflow_Trl (AD_Language,AD_Workflow_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Workflow_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Workflow t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Workflow_ID=3000010 AND NOT EXISTS (SELECT * FROM AD_Workflow_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Workflow_ID=t.AD_Workflow_ID)
;

-- 15/08/2023 23:41:50 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,"limit",WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,AD_Workflow_ID,"action",SplitElement,Value,Name,UpdatedBy,AD_Org_ID,Created,CreatedBy,IsActive,Updated,AD_Client_ID) VALUES (3000046,0,0,0,'--',0,'LAR','Y','X',0,0,0,0,0,0,3000010,'D','X','(DocAuto)','(DocAuto)',100,0,TO_TIMESTAMP('2023-08-15 23:41:50','YYYY-MM-DD HH24:MI:SS'),100,'Y',TO_TIMESTAMP('2023-08-15 23:41:50','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 15/08/2023 23:41:50 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_WF_Node_Trl (AD_Language,AD_WF_Node_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_WF_Node_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_WF_Node t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_WF_Node_ID=3000046 AND NOT EXISTS (SELECT * FROM AD_WF_Node_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_WF_Node_ID=t.AD_WF_Node_ID)
;

-- 15/08/2023 23:43:00 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,"limit",WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,AD_Workflow_ID,"action",SplitElement,Value,Name,UpdatedBy,AD_Org_ID,Created,CreatedBy,IsActive,Updated,AD_Client_ID) VALUES (3000047,0,0,0,'CO',0,'LAR','Y','X',0,0,0,0,0,0,3000010,'D','X','(DocComplete)','(DocComplete)',100,0,TO_TIMESTAMP('2023-08-15 23:43:00','YYYY-MM-DD HH24:MI:SS'),100,'Y',TO_TIMESTAMP('2023-08-15 23:43:00','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 15/08/2023 23:43:00 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_WF_Node_Trl (AD_Language,AD_WF_Node_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_WF_Node_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_WF_Node t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_WF_Node_ID=3000047 AND NOT EXISTS (SELECT * FROM AD_WF_Node_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_WF_Node_ID=t.AD_WF_Node_ID)
;

-- 15/08/2023 23:43:43 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,"limit",WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,AD_Workflow_ID,"action",SplitElement,Value,Name,UpdatedBy,AD_Org_ID,Created,CreatedBy,IsActive,Updated,AD_Client_ID) VALUES (3000048,0,0,0,'PR',0,'LAR','Y','X',0,0,0,0,0,0,3000010,'D','X','(DocPrepare)','(DocPrepare)',100,0,TO_TIMESTAMP('2023-08-15 23:43:43','YYYY-MM-DD HH24:MI:SS'),100,'Y',TO_TIMESTAMP('2023-08-15 23:43:43','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 15/08/2023 23:43:43 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_WF_Node_Trl (AD_Language,AD_WF_Node_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_WF_Node_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_WF_Node t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_WF_Node_ID=3000048 AND NOT EXISTS (SELECT * FROM AD_WF_Node_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_WF_Node_ID=t.AD_WF_Node_ID)
;

-- 15/08/2023 23:44:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_WF_NodeNext (EntityType,IsStdUserWorkflow,AD_WF_NodeNext_ID,AD_WF_Node_ID,SeqNo,AD_WF_Next_ID,Created,UpdatedBy,CreatedBy,AD_Org_ID,IsActive,Updated,AD_Client_ID) VALUES ('LAR','N',3000037,3000048,10,3000047,TO_TIMESTAMP('2023-08-15 23:44:07','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',TO_TIMESTAMP('2023-08-15 23:44:07','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 15/08/2023 23:44:58 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,"limit",WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,AD_Workflow_ID,"action",SplitElement,Value,Name,UpdatedBy,AD_Org_ID,Created,CreatedBy,IsActive,Updated,AD_Client_ID) VALUES (3000049,0,0,0,'CO',0,'LAR','Y','X',0,0,0,0,0,0,3000010,'Z','X','(Start)','(Start)',100,0,TO_TIMESTAMP('2023-08-15 23:44:58','YYYY-MM-DD HH24:MI:SS'),100,'Y',TO_TIMESTAMP('2023-08-15 23:44:58','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 15/08/2023 23:44:58 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_WF_Node_Trl (AD_Language,AD_WF_Node_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_WF_Node_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_WF_Node t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_WF_Node_ID=3000049 AND NOT EXISTS (SELECT * FROM AD_WF_Node_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_WF_Node_ID=t.AD_WF_Node_ID)
;

-- 15/08/2023 23:45:26 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_WF_NodeNext (EntityType,IsStdUserWorkflow,AD_WF_NodeNext_ID,AD_WF_Node_ID,SeqNo,AD_WF_Next_ID,Created,UpdatedBy,CreatedBy,AD_Org_ID,IsActive,Updated,AD_Client_ID) VALUES ('LAR','N',3000038,3000049,10,3000048,TO_TIMESTAMP('2023-08-15 23:45:26','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',TO_TIMESTAMP('2023-08-15 23:45:26','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 15/08/2023 23:45:47 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_WF_NodeNext (EntityType,IsStdUserWorkflow,AD_WF_NodeNext_ID,AD_WF_Node_ID,SeqNo,AD_WF_Next_ID,Created,UpdatedBy,CreatedBy,AD_Org_ID,IsActive,Updated,AD_Client_ID) VALUES ('LAR','N',3000039,3000049,100,3000046,TO_TIMESTAMP('2023-08-15 23:45:47','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',TO_TIMESTAMP('2023-08-15 23:45:47','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 15/08/2023 23:46:30 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Workflow SET IsValid='Y', AD_WF_Node_ID=3000049,Updated=TO_TIMESTAMP('2023-08-15 23:46:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Workflow_ID=3000010
;

-- 15/08/2023 23:47:16 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Process (AD_Workflow_ID,AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Value,Name,AD_Org_ID,AD_Client_ID,UpdatedBy,Created,CreatedBy,Updated,IsActive) VALUES (3000010,3000551,'N','N','1','N','N','Y','LAR',0,0,'LAR_OrdenGarantia_Procesar','LAR_OrdenGarantia_Procesar',0,0,100,TO_TIMESTAMP('2023-08-15 23:47:16','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2023-08-15 23:47:16','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 15/08/2023 23:47:16 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000551 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 15/08/2023 23:48:03 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET AD_Process_ID=3000551,Updated=TO_TIMESTAMP('2023-08-15 23:48:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005594
;

-- 15/08/2023 23:49:17 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET DefaultValue='DR', AD_Reference_Value_ID=131,Updated=TO_TIMESTAMP('2023-08-15 23:49:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005593
;

-- 15/08/2023 23:56:59 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('C_OrderLine.C_Order_ID=@C_Order_ID@','S',3000137,'LAR','C_OrderLine Sin Cambio',100,100,TO_TIMESTAMP('2023-08-15 23:56:59','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_TIMESTAMP('2023-08-15 23:56:59','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2023 23:57:16 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET AD_Val_Rule_ID=3000137,Updated=TO_TIMESTAMP('2023-08-15 23:57:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005614
;

-- 16/08/2023 0:32:11 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET Callout='ar.com.ergio.model.CallOrdenGarantia.orderLine',Updated=TO_TIMESTAMP('2023-08-16 00:32:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005614
;

-- 16/08/2023 0:32:45 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET Callout='ar.com.ergio.model.CallOrdenGarantia.product',Updated=TO_TIMESTAMP('2023-08-16 00:32:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005611
;

-- 16/08/2023 0:33:05 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET Callout='ar.com.ergio.model.CallOrdenGarantia.qty',Updated=TO_TIMESTAMP('2023-08-16 00:33:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005613
;

-- 16/08/2023 0:33:36 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET Callout='ar.com.ergio.model.CallOrdenGarantia.order',Updated=TO_TIMESTAMP('2023-08-16 00:33:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005599
;

-- 16/08/2023 0:34:04 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET Callout='ar.com.ergio.model.CallOrdenGarantia.invoice',Updated=TO_TIMESTAMP('2023-08-16 00:34:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005598
;

-- 23/08/2023 20:32:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005615,319,'LAR',0,'N','N','N','N',10,'N',19,'N',3001397,'N','Y','N','Ordenes de Garantía','LAR_OrdenGarantia_ID',100,TO_TIMESTAMP('2023-08-23 20:32:07','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-23 20:32:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/08/2023 20:32:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005615 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/08/2023 20:32:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008844,10,'Y','N','N',3005615,'N','Y',257,'N','LAR','Ordenes de Garantía',100,0,TO_TIMESTAMP('2023-08-23 20:32:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:32:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:32:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008844 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:33:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3008844
;

-- 23/08/2023 20:35:59 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,AD_Column_ID,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Parent_Column_ID,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('N',3000141,30,'N','N',319,3000303,'N','N',3005615,'N','N',1,'Y','N','LAR',3005579,'Remito de Ingreso',0,0,TO_TIMESTAMP('2023-08-23 20:35:58','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2023-08-23 20:35:58','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 23/08/2023 20:35:59 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000303 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 23/08/2023 20:36:23 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Tab SET IsReadOnly='Y', IsInsertRecord='N',Updated=TO_TIMESTAMP('2023-08-23 20:36:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000303
;

-- 23/08/2023 20:39:51 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Tab SET WhereClause='M_InOut.LAR_OrdenGarantia_ID=@LAR_OrdenGarantia_ID@ AND M_InOut.MovementType=''C+''',Updated=TO_TIMESTAMP('2023-08-23 20:39:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000303
;

-- 23/08/2023 20:41:00 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008845,26,'N','N','N',5402,'N',0,'Y',3000303,'N','The Invoice Document.','LAR','Invoice Identifier','Invoice',100,0,TO_TIMESTAMP('2023-08-23 20:40:59','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:40:59','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:00 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008845 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:00 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008846,23,'N','Y','N',3519,'N',0,'Y',3000303,'N',101,'LAR','Process Now',100,0,TO_TIMESTAMP('2023-08-23 20:41:00','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:00','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:00 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008846 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:00 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008847,1,'N','N','N',3793,'N',0,'Y',3000303,'N','The Printed checkbox indicates if this document or line will included when printing.','LAR','Indicates if this document / line is printed','Printed',100,0,TO_TIMESTAMP('2023-08-23 20:41:00','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:00','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:00 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008847 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:00 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008848,14,'N','N','N',3808,'N',0,'Y',3000303,'N','Indicates the Date that a document was printed.','LAR','Date the document was printed.','Date printed',100,0,TO_TIMESTAMP('2023-08-23 20:41:00','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:00','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:00 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008848 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:01 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008849,1,'N','N','N',3790,'N',0,'Y',3000303,'N','The Sales Transaction checkbox indicates if this item is a Sales Transaction.','LAR','This is a Sales Transaction','Sales Transaction',100,0,TO_TIMESTAMP('2023-08-23 20:41:00','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:00','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:01 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008849 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:01 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008850,14,'N','N','N',3521,'N',0,'Y',3000303,'N','The Material Shipment / Receipt ','LAR','Material Shipment Document','Shipment/Receipt',100,0,TO_TIMESTAMP('2023-08-23 20:41:01','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:01','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:01 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008850 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:01 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008851,1,'N','Y','N',3524,'N',0,'Y',3000303,'Y','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,TO_TIMESTAMP('2023-08-23 20:41:01','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:01','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:01 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008851 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:01 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008852,1,'N','N','N',8132,'N',0,'Y',3000303,'N','Send emails with document attached (e.g. Invoice, Delivery Note, etc.)','LAR','Enable sending Document EMail','Send EMail',100,0,TO_TIMESTAMP('2023-08-23 20:41:01','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:01','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:01 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008852 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:01 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008853,23,'N','N','N',12113,'N',0,'Y',3000303,'N','@DeliveryViaRule@=S','LAR','Create Package',100,0,TO_TIMESTAMP('2023-08-23 20:41:01','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:01','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:01 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008853 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:01 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008854,14,'N','N','N',10791,'N',0,'Y',3000303,'N','LAR','Referenced Shipment','N',100,0,TO_TIMESTAMP('2023-08-23 20:41:01','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:01','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:01 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008854 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:02 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008855,22,'N','N','N',15903,'N',0,'Y',3000303,'N','The Volume indicates the volume of the product in the Volume UOM of the Client','LAR','Volume of a product','Volume',100,0,TO_TIMESTAMP('2023-08-23 20:41:01','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:01','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:02 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008855 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:02 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008856,22,'N','N','N',15904,'N',0,'Y',3000303,'N','The Weight indicates the weight  of the product in the Weight UOM of the Client','LAR','Weight of a product','Weight',100,0,TO_TIMESTAMP('2023-08-23 20:41:02','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:02','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:02 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008856 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:02 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008857,14,'N','N','N',3801,'N',0,'Y',3000303,'N','The Freight Cost Rule indicates the method used when charging for freight.',124,'LAR','Method for charging Freight','Freight Cost Rule',100,0,TO_TIMESTAMP('2023-08-23 20:41:02','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:02','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:02 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008857 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:02 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008858,11,'N','N','N',9336,'N',0,'Y',3000303,'N',124,'@DeliveryViaRule@=S','LAR','Number of packages shipped','No Packages',100,0,TO_TIMESTAMP('2023-08-23 20:41:02','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:02','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:02 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008858 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:02 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008859,20,'N','Y','N',9335,'N',0,'Y',3000303,'N',124,'@DeliveryViaRule@=S','LAR','Number to track the shipment','Tracking No',100,0,TO_TIMESTAMP('2023-08-23 20:41:02','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:02','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:02 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008859 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:02 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008860,20,'N','Y','N',9337,'N',0,'Y',3000303,'N','Actual Date/Time of Shipment (pick up)',124,'@DeliveryViaRule@=S','LAR','Shipment Date/Time','Ship Date',100,0,TO_TIMESTAMP('2023-08-23 20:41:02','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:02','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:02 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008860 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:03 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3008861,0,'N','N','N',55318,'N',0,'Y',3000303,'N','If empty the business partner will be shipped to.',124,'@IsDropShip@=''Y''','LAR','Business Partner to ship to','Drop Shipment Partner',100,0,TO_TIMESTAMP('2023-08-23 20:41:02','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:02','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:03 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008861 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:03 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3008862,14,'N','Y','N',55319,'N',0,'Y',3000303,'N',124,'@IsDropShip@=''Y''','LAR','Business Partner Location for shipping to','Drop Shipment Location',100,0,TO_TIMESTAMP('2023-08-23 20:41:03','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:03','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:03 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008862 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:03 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3008863,14,'N','N','N',55320,'N',0,'Y',3000303,'N',124,'@IsDropShip@=''Y''','LAR','Business Partner Contact for drop shipment','Drop Shipment Contact',100,0,TO_TIMESTAMP('2023-08-23 20:41:03','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:03','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:03 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008863 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:03 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008864,1,'N','N','N',3518,'N',0,'Y',3000303,'N','The Processed checkbox indicates that a document has been processed.','LAR','The document has been processed','Processed','N',100,0,TO_TIMESTAMP('2023-08-23 20:41:03','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:03','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:03 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008864 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:03 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008865,1,'N','N','N',12123,'N',0,'Y',3000303,'N','The Approved checkbox indicates if this document requires approval before it can be processed.','LAR','Indicates if this document requires approval','Approved','N',100,0,TO_TIMESTAMP('2023-08-23 20:41:03','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:03','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:03 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008865 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:03 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008866,22,'N','N','N',55303,'N',0,'Y',3000303,'N','LAR','ID of document reversal','Reversal ID',100,0,TO_TIMESTAMP('2023-08-23 20:41:03','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:03','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:03 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008866 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:04 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008867,20,'N','N','N',59044,'N',0,'Y',3000303,'N','The ProcessedOn Date+Time save the exact moment (nanoseconds precision if allowed by the DB) when a document has been processed.','LAR','The date+time (expressed in decimal format) when the document has been processed','Processed On',100,0,TO_TIMESTAMP('2023-08-23 20:41:03','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:03','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:04 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008867 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:04 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008868,20,'N','Y','N',3003699,'N',0,'Y',3000303,'N',124,'@DeliveryViaRule@=S','LAR','Condición del Flete',100,0,TO_TIMESTAMP('2023-08-23 20:41:04','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:04','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:04 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008868 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:04 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3008869,0,'N','N','N',55317,'N',0,'Y',3000303,'N','Drop Shipments do not cause any Inventory reservations or movements as the Shipment is from the Vendor''s inventory. The Shipment of the Vendor to the Customer must be confirmed.',124,'LAR','Drop Shipments are sent from the Vendor directly to the Customer','Drop Shipment',100,0,TO_TIMESTAMP('2023-08-23 20:41:04','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:04','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:04 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008869 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:04 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008870,20,'N','N','N',3003700,'N',0,'Y',3000303,'N',124,'@DeliveryViaRule@=S','LAR','Domicilio del Transporte',100,0,TO_TIMESTAMP('2023-08-23 20:41:04','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:04','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:04 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008870 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:04 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008871,60,'N','N','N',3003728,'N',0,'Y',3000303,'N','LAR','Codigo de Integridad COT',100,0,TO_TIMESTAMP('2023-08-23 20:41:04','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:04','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:04 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008871 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:04 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008872,30,'N','N','N',3003729,'N',0,'Y',3000303,'N','LAR','Número de Comprobante COT',100,0,TO_TIMESTAMP('2023-08-23 20:41:04','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:04','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:04 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008872 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:04 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008873,2,'N','N','N',3003917,'N',0,'Y',3000303,'N','LAR','Nro. de Conexion COT',100,0,TO_TIMESTAMP('2023-08-23 20:41:04','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:04','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:04 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008873 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:05 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008874,10,'N','N','N',3005615,'N',0,'Y',3000303,'N','LAR','Ordenes de Garantía',100,0,TO_TIMESTAMP('2023-08-23 20:41:04','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:04','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:05 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008874 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:05 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008875,14,'Y','Y','N',3522,'N',10,'Y',3000303,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,TO_TIMESTAMP('2023-08-23 20:41:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:05','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:05 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008875 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:05 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008876,14,'Y','Y','N',3523,'N',20,'Y',3000303,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,TO_TIMESTAMP('2023-08-23 20:41:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:05','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:05 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008876 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:05 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_Reference_ID,EntityType,AD_Val_Rule_ID,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008877,26,'Y','N','N',3809,'N',30,'Y',3000303,'N','The Order is a control document.  The  Order is complete when the quantity ordered is the same as the quantity shipped and invoiced.  When you close an order, unshipped (backordered) quantities are cancelled.',30,'LAR',3000090,'Order','Order',100,0,TO_TIMESTAMP('2023-08-23 20:41:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:05','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:05 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008877 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:05 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008878,14,'Y','Y','N',4249,'N',40,'Y',3000303,'Y','Indicates the Date an item was ordered.','LAR','Date of Order','Date Ordered',100,0,TO_TIMESTAMP('2023-08-23 20:41:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:05','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:05 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008878 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:05 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008879,22,'Y','N','N',52009,'N',50,'Y',3000303,'N','A Return Material Authorization may be required to accept returns and to create Credit Memos','@M_RMA_ID@!0','LAR','Return Material Authorization','RMA',100,0,TO_TIMESTAMP('2023-08-23 20:41:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:05','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:05 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008879 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (-1,'N',3008880,20,'Y','N','N',3791,'N',60,'Y',3000303,'N','The document number is usually automatically generated by the system and determined by the document type of the document. If the document is not saved, the preliminary number is displayed in "<>".

If the document type of your document has no automatic document sequence defined, the field is empty if you create a new document. This is for documents which usually have an external number (like vendor invoice).  If you leave the field empty, the system will generate a document number for you. The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).','LAR','Document sequence number of the document','Document No','N',100,0,TO_TIMESTAMP('2023-08-23 20:41:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:05','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008880 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008881,20,'Y','Y','N',3799,'N',70,'Y',3000303,'N','The business partner order reference is the order reference for this specific transaction; Often Purchase Order numbers are given to print on Invoices for easier reference.  A standard number can be defined in the Business Partner (Customer) window.','LAR','Transaction Reference Number (Sales Order, Purchase Order) of your Business Partner','Order Reference',100,0,TO_TIMESTAMP('2023-08-23 20:41:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008881 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008882,60,'Y','N','N',3515,'N',80,'Y',3000303,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,TO_TIMESTAMP('2023-08-23 20:41:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008882 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_Reference_ID,EntityType,AD_Val_Rule_ID,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008883,14,'Y','N','N',3792,'N',90,'Y',3000303,'N','The Document Type determines document sequence and processing rules',19,'LAR',52053,'Document type or rules','Document Type',100,0,TO_TIMESTAMP('2023-08-23 20:41:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008883 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008884,14,'Y','N','N',3517,'N',100,'Y',3000303,'N','The Movement Date indicates the date that a product moved in or out of inventory.  This is the result of a shipment, receipt or inventory movement.','LAR','Date a product was moved in or out of inventory','Movement Date',100,0,TO_TIMESTAMP('2023-08-23 20:41:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008884 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('Y',3008885,14,'Y','Y','N',3794,'N',110,'Y',3000303,'N','The Accounting Date indicates the date to be used on the General Ledger account entries generated from this document. It is also used for any currency conversion.','LAR','Accounting Date','Account Date',100,0,TO_TIMESTAMP('2023-08-23 20:41:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008885 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008886,26,'Y','N','N',3795,'N',120,'Y',3000303,'N','A Business Partner is anyone with whom you transact.  This can include Vendor, Customer, Employee or Salesperson','LAR','Identifies a Business Partner','Business Partner ',100,0,TO_TIMESTAMP('2023-08-23 20:41:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008886 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008887,14,'Y','Y','N',3796,'N',130,'Y',3000303,'N','The Partner address indicates the location of a Business Partner','LAR','Identifies the (ship to) address for this Business Partner','Partner Location',100,0,TO_TIMESTAMP('2023-08-23 20:41:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:07','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008887 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008888,14,'Y','N','N',3797,'N',140,'Y',3000303,'N','The User identifies a unique user in the system. This could be an internal user or a business partner contact','LAR','User within the system - Internal or Business Partner Contact','User/Contact',100,0,TO_TIMESTAMP('2023-08-23 20:41:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:07','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008888 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008889,14,'Y','N','N',3798,'N',150,'Y',3000303,'N','The Warehouse identifies a unique Warehouse where products are stored or Services are provided.',108,'LAR','Storage Warehouse and Service Point','Warehouse',100,0,TO_TIMESTAMP('2023-08-23 20:41:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:07','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008889 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008890,14,'Y','Y','N',3807,'N',160,'Y',3000303,'N','The Priority indicates the importance (high, medium, low) of this document',108,'LAR','Priority of a document','Priority',100,0,TO_TIMESTAMP('2023-08-23 20:41:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:07','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008890 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008891,14,'Y','N','N',3800,'N',170,'Y',3000303,'N','The Delivery Rule indicates when an order should be delivered. For example should the order be delivered when the entire order is complete, when a line is complete or as the products become available.',108,'LAR','Defines the timing of Delivery','Delivery Rule',100,0,TO_TIMESTAMP('2023-08-23 20:41:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:07','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008891 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008892,14,'Y','N','N',8771,'N',180,'Y',3000303,'N','The Sales Representative indicates the Sales Rep for this Region.  Any Sales Rep must be a valid internal user.',108,'LAR','Sales Representative or Company Agent','Sales Representative',100,0,TO_TIMESTAMP('2023-08-23 20:41:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:07','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008892 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008893,14,'Y','N','N',3803,'N',190,'Y',3000303,'N','The Delivery Via indicates how the products should be delivered. For example, will the order be picked up or shipped.',124,'LAR','How the order will be delivered','Delivery Via',100,0,TO_TIMESTAMP('2023-08-23 20:41:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:08','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008893 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,IsMandatory,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008894,14,'Y','Y','N',3804,'N',200,'Y',3000303,'N','The Shipper indicates the method of delivering product',124,'@DeliveryViaRule@=S','Y','LAR','Method or manner of product delivery','Shipper',100,0,TO_TIMESTAMP('2023-08-23 20:41:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:08','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008894 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008895,26,'Y','Y','N',3802,'N',210,'Y',3000303,'N','The Freight Amount indicates the amount charged for Freight in the document currency.',124,'@FreightCostRule@=''F''','LAR','Freight Amount ','Freight Amount',100,0,TO_TIMESTAMP('2023-08-23 20:41:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:08','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008895 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008896,23,'Y','N','N',5352,'N',220,'Y',3000303,'N','The Create From process will create a new document based on information in an existing document selected by the user.','@MovementType@=''C+''','LAR','Process which will generate a new document lines based on an existing document','Create lines from',100,0,TO_TIMESTAMP('2023-08-23 20:41:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:08','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008896 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008897,20,'Y','N','N',3003696,'N',230,'Y',3000303,'N',124,'@DeliveryViaRule@=S','LAR','Chofer',100,0,TO_TIMESTAMP('2023-08-23 20:41:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:08','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008897 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008898,10,'Y','N','N',3003702,'N',240,'Y',3000303,'N',124,'@DeliveryViaRule@=S','LAR','Tipo de Identificación',100,0,TO_TIMESTAMP('2023-08-23 20:41:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:08','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008898 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008899,15,'Y','Y','N',3003701,'N',250,'Y',3000303,'N',124,'@DeliveryViaRule@=S','LAR','Nro. Identificación',100,0,TO_TIMESTAMP('2023-08-23 20:41:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:09','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008899 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008900,10,'Y','N','N',3003697,'N',260,'Y',3000303,'N',124,'@DeliveryViaRule@=S','LAR','Patente',100,0,TO_TIMESTAMP('2023-08-23 20:41:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:09','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008900 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008901,10,'Y','Y','N',3003698,'N',270,'Y',3000303,'N',124,'@DeliveryViaRule@=S','LAR','Patente Acoplado',100,0,TO_TIMESTAMP('2023-08-23 20:41:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:09','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008901 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008902,20,'Y','N','N',9334,'N',280,'N',3000303,'Y',124,'@DeliveryViaRule@=S','LAR','Date/Time when picked for Shipment','Pick Date',100,0,TO_TIMESTAMP('2023-08-23 20:41:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:09','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008902 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008903,1,'Y','Y','N',3003692,'N',290,'Y',3000303,'N',124,'@DeliveryViaRule@=S & @EsCOTManual@=N & @DocStatus@=CO | @DocStatus@=CL','LAR','Solicitar COT',100,0,TO_TIMESTAMP('2023-08-23 20:41:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:09','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008903 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008904,20,'Y','N','N',3003703,'N',300,'Y',3000303,'N',124,'@DeliveryViaRule@=S','LAR','COT',100,0,TO_TIMESTAMP('2023-08-23 20:41:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:09','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008904 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008905,1,'Y','Y','N',3003916,'N',310,'Y',3000303,'Y',124,'1=0','LAR','COT Autorizado',100,0,TO_TIMESTAMP('2023-08-23 20:41:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:09','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008905 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008906,1,'Y','N','N',3003912,'N',320,'Y',3000303,'N','@COTAutorizado@=N & @DeliveryViaRule@=S','LAR','EsCOTManual',100,0,TO_TIMESTAMP('2023-08-23 20:41:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:10','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008906 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008907,1,'Y','N','N',3003921,'N',330,'Y',3000303,'N',124,'@DeliveryViaRule@=S','LAR','Entrega en Transporte',100,0,TO_TIMESTAMP('2023-08-23 20:41:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:10','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008907 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008908,10,'Y','N','N',3003922,'N',340,'Y',3000303,'N',124,'@EntregaTransporte@=Y','LAR','Transporte Intermediario',100,0,TO_TIMESTAMP('2023-08-23 20:41:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:10','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008908 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008909,10,'Y','Y','N',3003923,'N',350,'Y',3000303,'N',124,'@EntregaTransporte@=Y','LAR','Dirección del Transporte',100,0,TO_TIMESTAMP('2023-08-23 20:41:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:10','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008909 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008910,255,'Y','N','N',3003730,'N',360,'Y',3000303,'Y','@DeliveryViaRule@=S','LAR','Error COT',100,0,TO_TIMESTAMP('2023-08-23 20:41:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:10','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008910 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:11 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008911,23,'Y','Y','N',5353,'N',370,'Y',3000303,'N','@MovementType@=''C+''','LAR','Generate To','Generate To',100,0,TO_TIMESTAMP('2023-08-23 20:41:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:10','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:11 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008911 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:11 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008912,14,'Y','N','N',3805,'N',380,'Y',3000303,'N','The Charge indicates a type of Charge (Handling, Shipping, Restocking)',124,'@HasCharges@=''Y''','LAR','Additional document charges','Charge',100,0,TO_TIMESTAMP('2023-08-23 20:41:11','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:11','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:11 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008912 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:11 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008913,26,'Y','N','N',3806,'N',390,'Y',3000303,'N','The Charge Amount indicates the amount for an additional charge.',124,'@HasCharges@=''Y''','LAR','Charge Amount','Charge amount',100,0,TO_TIMESTAMP('2023-08-23 20:41:11','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:11','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:11 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008913 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:11 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008914,14,'Y','N','N',9585,'N',400,'Y',3000303,'N','A Project allows you to track and control internal or external activities.',104,'@$Element_PJ@=Y','LAR','Financial Project','Project',100,0,TO_TIMESTAMP('2023-08-23 20:41:11','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:11','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:11 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008914 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:11 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008915,14,'Y','Y','N',9583,'N',410,'Y',3000303,'N','Activities indicate tasks that are performed and used to utilize Activity based Costing',104,'@$Element_AY@=Y','LAR','Business Activity','Activity',100,0,TO_TIMESTAMP('2023-08-23 20:41:11','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:11','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:11 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008915 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:11 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008916,14,'Y','N','N',9584,'N',420,'Y',3000303,'N','The Campaign defines a unique marketing program.  Projects can be associated with a pre defined Marketing Campaign.  You can then report based on a specific Campaign.',104,'@$Element_MC@=Y','LAR','Marketing Campaign','Campaign',100,0,TO_TIMESTAMP('2023-08-23 20:41:11','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:11','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:11 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008916 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:12 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008917,14,'Y','Y','N',9586,'N',430,'Y',3000303,'N','The organization which performs or initiates this transaction (for another organization).  The owning Organization may not be the transaction organization in a service bureau environment, with centralized services, and inter-organization transactions.',104,'@$Element_OT@=Y','LAR','Performing or initiating organization','Trx Organization',100,0,TO_TIMESTAMP('2023-08-23 20:41:11','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:11','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:12 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008917 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:12 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008918,14,'Y','N','N',9582,'N',440,'Y',3000303,'N','The user defined element displays the optional elements that have been defined for this account combination.',104,'@$Element_U1@=Y','LAR','User defined list element #1','User List 1',100,0,TO_TIMESTAMP('2023-08-23 20:41:12','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:12','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:12 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008918 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:12 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008919,14,'Y','Y','N',9581,'N',450,'Y',3000303,'N','The user defined element displays the optional elements that have been defined for this account combination.',104,'@$Element_U2@=Y','LAR','User defined list element #2','User List 2',100,0,TO_TIMESTAMP('2023-08-23 20:41:12','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:12','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:12 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008919 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:12 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008920,14,'Y','N','N',3516,'N',460,'Y',3000303,'Y','The Movement Type indicates the type of movement (in, out, to production, etc)',101,'LAR','Method of moving the inventory','Movement Type',100,0,TO_TIMESTAMP('2023-08-23 20:41:12','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:12','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:12 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008920 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:12 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008921,23,'Y','Y','N',12079,'N',470,'Y',3000303,'N',101,'LAR','Create Confirm',100,0,TO_TIMESTAMP('2023-08-23 20:41:12','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:12','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:12 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008921 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:12 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008922,1,'Y','N','N',10790,'N',480,'Y',3000303,'Y','Material Movement is in transit - shipped, but not received.
The transaction is completed, if confirmed.',101,'LAR','Movement is in transit','In Transit',100,0,TO_TIMESTAMP('2023-08-23 20:41:12','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:12','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:12 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008922 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:13 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008923,14,'Y','Y','N',10789,'N',490,'Y',3000303,'Y','The Date Received indicates the date that product was received.',101,'LAR','Date a product was received','Date received',100,0,TO_TIMESTAMP('2023-08-23 20:41:12','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:12','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:13 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008923 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:13 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008924,14,'Y','N','N',4323,'N',500,'Y',3000303,'Y','The Document Status indicates the status of a document at this time.  If you want to change the document status, use the Document Action field',101,'LAR','The current status of the document','Document Status','N',100,0,TO_TIMESTAMP('2023-08-23 20:41:13','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:13','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:13 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008924 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:13 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008925,23,'Y','Y','N',4324,'N',510,'Y',3000303,'N','You find the current status in the Document Status field. The options are listed in a popup',101,'LAR','The targeted status of the document','Document Action','N',100,0,TO_TIMESTAMP('2023-08-23 20:41:13','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:13','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:13 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008925 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:13 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008926,1,'Y','N','N',12410,'N',520,'Y',3000303,'N','The document is in dispute. Use Requests to track details.',101,'LAR','Document is in dispute','In Dispute',100,0,TO_TIMESTAMP('2023-08-23 20:41:13','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:13','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:13 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008926 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:13 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008927,23,'Y','Y','N',6534,'N',530,'Y',3000303,'N','The Posted field indicates the status of the Generation of General Ledger Accounting Lines ',101,'@Processed@=Y & @#ShowAcct@=Y','LAR','Posting status','Posted','N',100,0,TO_TIMESTAMP('2023-08-23 20:41:13','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:13','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:13 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008927 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:13 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008928,1,'Y','N','N',3000884,'N',540,'Y',3000303,'Y','LAR','IsFiscalPrinted',100,0,TO_TIMESTAMP('2023-08-23 20:41:13','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:13','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:13 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008928 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:13 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008929,30,'Y','Y','N',3000885,'N',550,'Y',3000303,'Y','LAR','FiscalReceiptNumber',100,0,TO_TIMESTAMP('2023-08-23 20:41:13','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:13','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:13 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008929 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:41:14 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008930,14,'Y','N','N',3003727,'N',560,'Y',3000303,'N','LAR','CAI',100,0,TO_TIMESTAMP('2023-08-23 20:41:13','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:41:13','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:41:14 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008930 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:44:18 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,AD_Column_ID,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('N',3000141,40,'N','N',320,3000304,'N','N',3538,'N','Y',2,'N','N','LAR','Línea de RI',0,0,TO_TIMESTAMP('2023-08-23 20:44:17','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2023-08-23 20:44:17','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 23/08/2023 20:44:18 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000304 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 23/08/2023 20:45:46 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,AD_Column_ID,IsInfoTab,WhereClause,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('N',3000141,50,'N','N',319,3000305,'N','N',3005615,'N','M_InOut.LAR_OrdenGarantia_ID=@LAR_OrdenGarantia_ID@ AND M_InOut.MovementType=''C-''','Y',1,'N','N','LAR','Remito de Egreso',0,0,TO_TIMESTAMP('2023-08-23 20:45:46','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2023-08-23 20:45:46','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 23/08/2023 20:45:46 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000305 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 23/08/2023 20:46:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008931,26,'N','N','N',5402,'N',0,'Y',3000305,'N','The Invoice Document.','LAR','Invoice Identifier','Invoice',100,0,TO_TIMESTAMP('2023-08-23 20:46:27','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:27','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008931 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008932,23,'N','Y','N',3519,'N',0,'Y',3000305,'N',101,'LAR','Process Now',100,0,TO_TIMESTAMP('2023-08-23 20:46:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008932 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008933,1,'N','N','N',3793,'N',0,'Y',3000305,'N','The Printed checkbox indicates if this document or line will included when printing.','LAR','Indicates if this document / line is printed','Printed',100,0,TO_TIMESTAMP('2023-08-23 20:46:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008933 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008934,14,'N','N','N',3808,'N',0,'Y',3000305,'N','Indicates the Date that a document was printed.','LAR','Date the document was printed.','Date printed',100,0,TO_TIMESTAMP('2023-08-23 20:46:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008934 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008935,1,'N','N','N',3790,'N',0,'Y',3000305,'N','The Sales Transaction checkbox indicates if this item is a Sales Transaction.','LAR','This is a Sales Transaction','Sales Transaction',100,0,TO_TIMESTAMP('2023-08-23 20:46:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008935 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008936,14,'N','N','N',3521,'N',0,'Y',3000305,'N','The Material Shipment / Receipt ','LAR','Material Shipment Document','Shipment/Receipt',100,0,TO_TIMESTAMP('2023-08-23 20:46:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008936 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:29 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008937,1,'N','Y','N',3524,'N',0,'Y',3000305,'Y','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,TO_TIMESTAMP('2023-08-23 20:46:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:29 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008937 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:29 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008938,1,'N','N','N',8132,'N',0,'Y',3000305,'N','Send emails with document attached (e.g. Invoice, Delivery Note, etc.)','LAR','Enable sending Document EMail','Send EMail',100,0,TO_TIMESTAMP('2023-08-23 20:46:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:29 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008938 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:29 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008939,23,'N','N','N',12113,'N',0,'Y',3000305,'N','@DeliveryViaRule@=S','LAR','Create Package',100,0,TO_TIMESTAMP('2023-08-23 20:46:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:29 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008939 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:29 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008940,14,'N','N','N',10791,'N',0,'Y',3000305,'N','LAR','Referenced Shipment','N',100,0,TO_TIMESTAMP('2023-08-23 20:46:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:29 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008940 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:29 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008941,22,'N','N','N',15903,'N',0,'Y',3000305,'N','The Volume indicates the volume of the product in the Volume UOM of the Client','LAR','Volume of a product','Volume',100,0,TO_TIMESTAMP('2023-08-23 20:46:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:29 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008941 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:29 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008942,22,'N','N','N',15904,'N',0,'Y',3000305,'N','The Weight indicates the weight  of the product in the Weight UOM of the Client','LAR','Weight of a product','Weight',100,0,TO_TIMESTAMP('2023-08-23 20:46:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:29 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008942 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:30 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008943,14,'N','N','N',3801,'N',0,'Y',3000305,'N','The Freight Cost Rule indicates the method used when charging for freight.',124,'LAR','Method for charging Freight','Freight Cost Rule',100,0,TO_TIMESTAMP('2023-08-23 20:46:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:30 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008943 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:30 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008944,11,'N','N','N',9336,'N',0,'Y',3000305,'N',124,'@DeliveryViaRule@=S','LAR','Number of packages shipped','No Packages',100,0,TO_TIMESTAMP('2023-08-23 20:46:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:30 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008944 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:30 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008945,20,'N','Y','N',9335,'N',0,'Y',3000305,'N',124,'@DeliveryViaRule@=S','LAR','Number to track the shipment','Tracking No',100,0,TO_TIMESTAMP('2023-08-23 20:46:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:30 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008945 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:30 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008946,20,'N','Y','N',9337,'N',0,'Y',3000305,'N','Actual Date/Time of Shipment (pick up)',124,'@DeliveryViaRule@=S','LAR','Shipment Date/Time','Ship Date',100,0,TO_TIMESTAMP('2023-08-23 20:46:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:30 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008946 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:30 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3008947,0,'N','N','N',55318,'N',0,'Y',3000305,'N','If empty the business partner will be shipped to.',124,'@IsDropShip@=''Y''','LAR','Business Partner to ship to','Drop Shipment Partner',100,0,TO_TIMESTAMP('2023-08-23 20:46:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:30 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008947 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:30 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3008948,14,'N','Y','N',55319,'N',0,'Y',3000305,'N',124,'@IsDropShip@=''Y''','LAR','Business Partner Location for shipping to','Drop Shipment Location',100,0,TO_TIMESTAMP('2023-08-23 20:46:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:30 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008948 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:30 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3008949,14,'N','N','N',55320,'N',0,'Y',3000305,'N',124,'@IsDropShip@=''Y''','LAR','Business Partner Contact for drop shipment','Drop Shipment Contact',100,0,TO_TIMESTAMP('2023-08-23 20:46:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:30 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008949 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:31 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008950,1,'N','N','N',3518,'N',0,'Y',3000305,'N','The Processed checkbox indicates that a document has been processed.','LAR','The document has been processed','Processed','N',100,0,TO_TIMESTAMP('2023-08-23 20:46:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:31 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008950 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:31 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008951,1,'N','N','N',12123,'N',0,'Y',3000305,'N','The Approved checkbox indicates if this document requires approval before it can be processed.','LAR','Indicates if this document requires approval','Approved','N',100,0,TO_TIMESTAMP('2023-08-23 20:46:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:31 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008951 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:31 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008952,22,'N','N','N',55303,'N',0,'Y',3000305,'N','LAR','ID of document reversal','Reversal ID',100,0,TO_TIMESTAMP('2023-08-23 20:46:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:31 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008952 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:31 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008953,20,'N','N','N',59044,'N',0,'Y',3000305,'N','The ProcessedOn Date+Time save the exact moment (nanoseconds precision if allowed by the DB) when a document has been processed.','LAR','The date+time (expressed in decimal format) when the document has been processed','Processed On',100,0,TO_TIMESTAMP('2023-08-23 20:46:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:31 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008953 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:31 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008954,20,'N','Y','N',3003699,'N',0,'Y',3000305,'N',124,'@DeliveryViaRule@=S','LAR','Condición del Flete',100,0,TO_TIMESTAMP('2023-08-23 20:46:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:31 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008954 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:31 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3008955,0,'N','N','N',55317,'N',0,'Y',3000305,'N','Drop Shipments do not cause any Inventory reservations or movements as the Shipment is from the Vendor''s inventory. The Shipment of the Vendor to the Customer must be confirmed.',124,'LAR','Drop Shipments are sent from the Vendor directly to the Customer','Drop Shipment',100,0,TO_TIMESTAMP('2023-08-23 20:46:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:31 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008955 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:32 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008956,20,'N','N','N',3003700,'N',0,'Y',3000305,'N',124,'@DeliveryViaRule@=S','LAR','Domicilio del Transporte',100,0,TO_TIMESTAMP('2023-08-23 20:46:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:32 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008956 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:32 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008957,60,'N','N','N',3003728,'N',0,'Y',3000305,'N','LAR','Codigo de Integridad COT',100,0,TO_TIMESTAMP('2023-08-23 20:46:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:32 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008957 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:32 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008958,30,'N','N','N',3003729,'N',0,'Y',3000305,'N','LAR','Número de Comprobante COT',100,0,TO_TIMESTAMP('2023-08-23 20:46:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:32 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008958 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:32 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008959,2,'N','N','N',3003917,'N',0,'Y',3000305,'N','LAR','Nro. de Conexion COT',100,0,TO_TIMESTAMP('2023-08-23 20:46:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:32 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008959 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:32 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008960,10,'N','N','N',3005615,'N',0,'Y',3000305,'N','LAR','Ordenes de Garantía',100,0,TO_TIMESTAMP('2023-08-23 20:46:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:32 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008960 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:32 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008961,14,'Y','Y','N',3522,'N',10,'Y',3000305,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,TO_TIMESTAMP('2023-08-23 20:46:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:32 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008961 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:33 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008962,14,'Y','Y','N',3523,'N',20,'Y',3000305,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,TO_TIMESTAMP('2023-08-23 20:46:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:33 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008962 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:33 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_Reference_ID,EntityType,AD_Val_Rule_ID,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008963,26,'Y','N','N',3809,'N',30,'Y',3000305,'N','The Order is a control document.  The  Order is complete when the quantity ordered is the same as the quantity shipped and invoiced.  When you close an order, unshipped (backordered) quantities are cancelled.',30,'LAR',3000090,'Order','Order',100,0,TO_TIMESTAMP('2023-08-23 20:46:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:33 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008963 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:33 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008964,14,'Y','Y','N',4249,'N',40,'Y',3000305,'Y','Indicates the Date an item was ordered.','LAR','Date of Order','Date Ordered',100,0,TO_TIMESTAMP('2023-08-23 20:46:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:33 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008964 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:33 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008965,22,'Y','N','N',52009,'N',50,'Y',3000305,'N','A Return Material Authorization may be required to accept returns and to create Credit Memos','@M_RMA_ID@!0','LAR','Return Material Authorization','RMA',100,0,TO_TIMESTAMP('2023-08-23 20:46:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:33 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008965 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:33 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (-1,'N',3008966,20,'Y','N','N',3791,'N',60,'Y',3000305,'N','The document number is usually automatically generated by the system and determined by the document type of the document. If the document is not saved, the preliminary number is displayed in "<>".

If the document type of your document has no automatic document sequence defined, the field is empty if you create a new document. This is for documents which usually have an external number (like vendor invoice).  If you leave the field empty, the system will generate a document number for you. The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).','LAR','Document sequence number of the document','Document No','N',100,0,TO_TIMESTAMP('2023-08-23 20:46:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:33 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008966 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:33 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008967,20,'Y','Y','N',3799,'N',70,'Y',3000305,'N','The business partner order reference is the order reference for this specific transaction; Often Purchase Order numbers are given to print on Invoices for easier reference.  A standard number can be defined in the Business Partner (Customer) window.','LAR','Transaction Reference Number (Sales Order, Purchase Order) of your Business Partner','Order Reference',100,0,TO_TIMESTAMP('2023-08-23 20:46:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:33 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008967 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:33 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008968,60,'Y','N','N',3515,'N',80,'Y',3000305,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,TO_TIMESTAMP('2023-08-23 20:46:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:33 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008968 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:34 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_Reference_ID,EntityType,AD_Val_Rule_ID,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008969,14,'Y','N','N',3792,'N',90,'Y',3000305,'N','The Document Type determines document sequence and processing rules',19,'LAR',52053,'Document type or rules','Document Type',100,0,TO_TIMESTAMP('2023-08-23 20:46:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:34 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008969 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:34 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008970,14,'Y','N','N',3517,'N',100,'Y',3000305,'N','The Movement Date indicates the date that a product moved in or out of inventory.  This is the result of a shipment, receipt or inventory movement.','LAR','Date a product was moved in or out of inventory','Movement Date',100,0,TO_TIMESTAMP('2023-08-23 20:46:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:34 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008970 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:34 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('Y',3008971,14,'Y','Y','N',3794,'N',110,'Y',3000305,'N','The Accounting Date indicates the date to be used on the General Ledger account entries generated from this document. It is also used for any currency conversion.','LAR','Accounting Date','Account Date',100,0,TO_TIMESTAMP('2023-08-23 20:46:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:34 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008971 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:34 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008972,26,'Y','N','N',3795,'N',120,'Y',3000305,'N','A Business Partner is anyone with whom you transact.  This can include Vendor, Customer, Employee or Salesperson','LAR','Identifies a Business Partner','Business Partner ',100,0,TO_TIMESTAMP('2023-08-23 20:46:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:34 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008972 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:34 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008973,14,'Y','Y','N',3796,'N',130,'Y',3000305,'N','The Partner address indicates the location of a Business Partner','LAR','Identifies the (ship to) address for this Business Partner','Partner Location',100,0,TO_TIMESTAMP('2023-08-23 20:46:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:34 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008973 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:34 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008974,14,'Y','N','N',3797,'N',140,'Y',3000305,'N','The User identifies a unique user in the system. This could be an internal user or a business partner contact','LAR','User within the system - Internal or Business Partner Contact','User/Contact',100,0,TO_TIMESTAMP('2023-08-23 20:46:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:34 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008974 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:35 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008975,14,'Y','N','N',3798,'N',150,'Y',3000305,'N','The Warehouse identifies a unique Warehouse where products are stored or Services are provided.',108,'LAR','Storage Warehouse and Service Point','Warehouse',100,0,TO_TIMESTAMP('2023-08-23 20:46:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:35 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008975 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:35 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008976,14,'Y','Y','N',3807,'N',160,'Y',3000305,'N','The Priority indicates the importance (high, medium, low) of this document',108,'LAR','Priority of a document','Priority',100,0,TO_TIMESTAMP('2023-08-23 20:46:35','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:35','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:35 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008976 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:35 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008977,14,'Y','N','N',3800,'N',170,'Y',3000305,'N','The Delivery Rule indicates when an order should be delivered. For example should the order be delivered when the entire order is complete, when a line is complete or as the products become available.',108,'LAR','Defines the timing of Delivery','Delivery Rule',100,0,TO_TIMESTAMP('2023-08-23 20:46:35','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:35','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:35 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008977 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:35 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008978,14,'Y','N','N',8771,'N',180,'Y',3000305,'N','The Sales Representative indicates the Sales Rep for this Region.  Any Sales Rep must be a valid internal user.',108,'LAR','Sales Representative or Company Agent','Sales Representative',100,0,TO_TIMESTAMP('2023-08-23 20:46:35','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:35','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:35 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008978 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:35 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008979,14,'Y','N','N',3803,'N',190,'Y',3000305,'N','The Delivery Via indicates how the products should be delivered. For example, will the order be picked up or shipped.',124,'LAR','How the order will be delivered','Delivery Via',100,0,TO_TIMESTAMP('2023-08-23 20:46:35','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:35','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:35 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008979 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:35 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,IsMandatory,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008980,14,'Y','Y','N',3804,'N',200,'Y',3000305,'N','The Shipper indicates the method of delivering product',124,'@DeliveryViaRule@=S','Y','LAR','Method or manner of product delivery','Shipper',100,0,TO_TIMESTAMP('2023-08-23 20:46:35','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:35','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:35 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008980 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:36 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008981,26,'Y','Y','N',3802,'N',210,'Y',3000305,'N','The Freight Amount indicates the amount charged for Freight in the document currency.',124,'@FreightCostRule@=''F''','LAR','Freight Amount ','Freight Amount',100,0,TO_TIMESTAMP('2023-08-23 20:46:35','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:35','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:36 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008981 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:36 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008982,23,'Y','N','N',5352,'N',220,'Y',3000305,'N','The Create From process will create a new document based on information in an existing document selected by the user.','@MovementType@=''C+''','LAR','Process which will generate a new document lines based on an existing document','Create lines from',100,0,TO_TIMESTAMP('2023-08-23 20:46:36','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:36','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:36 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008982 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:36 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008983,20,'Y','N','N',3003696,'N',230,'Y',3000305,'N',124,'@DeliveryViaRule@=S','LAR','Chofer',100,0,TO_TIMESTAMP('2023-08-23 20:46:36','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:36','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:36 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008983 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:36 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008984,10,'Y','N','N',3003702,'N',240,'Y',3000305,'N',124,'@DeliveryViaRule@=S','LAR','Tipo de Identificación',100,0,TO_TIMESTAMP('2023-08-23 20:46:36','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:36','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:36 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008984 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:36 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008985,15,'Y','Y','N',3003701,'N',250,'Y',3000305,'N',124,'@DeliveryViaRule@=S','LAR','Nro. Identificación',100,0,TO_TIMESTAMP('2023-08-23 20:46:36','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:36','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:36 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008985 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:36 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008986,10,'Y','N','N',3003697,'N',260,'Y',3000305,'N',124,'@DeliveryViaRule@=S','LAR','Patente',100,0,TO_TIMESTAMP('2023-08-23 20:46:36','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:36','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:36 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008986 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:37 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008987,10,'Y','Y','N',3003698,'N',270,'Y',3000305,'N',124,'@DeliveryViaRule@=S','LAR','Patente Acoplado',100,0,TO_TIMESTAMP('2023-08-23 20:46:36','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:36','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:37 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008987 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:37 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008988,20,'Y','N','N',9334,'N',280,'N',3000305,'Y',124,'@DeliveryViaRule@=S','LAR','Date/Time when picked for Shipment','Pick Date',100,0,TO_TIMESTAMP('2023-08-23 20:46:37','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:37','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:37 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008988 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:37 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008989,1,'Y','Y','N',3003692,'N',290,'Y',3000305,'N',124,'@DeliveryViaRule@=S & @EsCOTManual@=N & @DocStatus@=CO | @DocStatus@=CL','LAR','Solicitar COT',100,0,TO_TIMESTAMP('2023-08-23 20:46:37','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:37','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:37 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008989 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:37 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008990,20,'Y','N','N',3003703,'N',300,'Y',3000305,'N',124,'@DeliveryViaRule@=S','LAR','COT',100,0,TO_TIMESTAMP('2023-08-23 20:46:37','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:37','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:37 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008990 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:37 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008991,1,'Y','Y','N',3003916,'N',310,'Y',3000305,'Y',124,'1=0','LAR','COT Autorizado',100,0,TO_TIMESTAMP('2023-08-23 20:46:37','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:37','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:37 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008991 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:37 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008992,1,'Y','N','N',3003912,'N',320,'Y',3000305,'N','@COTAutorizado@=N & @DeliveryViaRule@=S','LAR','EsCOTManual',100,0,TO_TIMESTAMP('2023-08-23 20:46:37','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:37','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:37 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008992 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:38 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008993,1,'Y','N','N',3003921,'N',330,'Y',3000305,'N',124,'@DeliveryViaRule@=S','LAR','Entrega en Transporte',100,0,TO_TIMESTAMP('2023-08-23 20:46:37','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:37','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:38 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008993 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:38 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008994,10,'Y','N','N',3003922,'N',340,'Y',3000305,'N',124,'@EntregaTransporte@=Y','LAR','Transporte Intermediario',100,0,TO_TIMESTAMP('2023-08-23 20:46:38','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:38','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:38 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008994 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:38 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008995,10,'Y','Y','N',3003923,'N',350,'Y',3000305,'N',124,'@EntregaTransporte@=Y','LAR','Dirección del Transporte',100,0,TO_TIMESTAMP('2023-08-23 20:46:38','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:38','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:38 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008995 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:38 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008996,255,'Y','N','N',3003730,'N',360,'Y',3000305,'Y','@DeliveryViaRule@=S','LAR','Error COT',100,0,TO_TIMESTAMP('2023-08-23 20:46:38','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:38','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:38 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008996 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:38 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008997,23,'Y','Y','N',5353,'N',370,'Y',3000305,'N','@MovementType@=''C+''','LAR','Generate To','Generate To',100,0,TO_TIMESTAMP('2023-08-23 20:46:38','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:38','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:38 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008997 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:38 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008998,14,'Y','N','N',3805,'N',380,'Y',3000305,'N','The Charge indicates a type of Charge (Handling, Shipping, Restocking)',124,'@HasCharges@=''Y''','LAR','Additional document charges','Charge',100,0,TO_TIMESTAMP('2023-08-23 20:46:38','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:38','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:38 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008998 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:39 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008999,26,'Y','N','N',3806,'N',390,'Y',3000305,'N','The Charge Amount indicates the amount for an additional charge.',124,'@HasCharges@=''Y''','LAR','Charge Amount','Charge amount',100,0,TO_TIMESTAMP('2023-08-23 20:46:38','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:38','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:39 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008999 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:39 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009000,14,'Y','N','N',9585,'N',400,'Y',3000305,'N','A Project allows you to track and control internal or external activities.',104,'@$Element_PJ@=Y','LAR','Financial Project','Project',100,0,TO_TIMESTAMP('2023-08-23 20:46:39','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:39','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:39 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009000 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:39 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009001,14,'Y','Y','N',9583,'N',410,'Y',3000305,'N','Activities indicate tasks that are performed and used to utilize Activity based Costing',104,'@$Element_AY@=Y','LAR','Business Activity','Activity',100,0,TO_TIMESTAMP('2023-08-23 20:46:39','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:39','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:39 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009001 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:39 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009002,14,'Y','N','N',9584,'N',420,'Y',3000305,'N','The Campaign defines a unique marketing program.  Projects can be associated with a pre defined Marketing Campaign.  You can then report based on a specific Campaign.',104,'@$Element_MC@=Y','LAR','Marketing Campaign','Campaign',100,0,TO_TIMESTAMP('2023-08-23 20:46:39','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:39','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:39 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009002 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:39 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009003,14,'Y','Y','N',9586,'N',430,'Y',3000305,'N','The organization which performs or initiates this transaction (for another organization).  The owning Organization may not be the transaction organization in a service bureau environment, with centralized services, and inter-organization transactions.',104,'@$Element_OT@=Y','LAR','Performing or initiating organization','Trx Organization',100,0,TO_TIMESTAMP('2023-08-23 20:46:39','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:39','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:39 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009003 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:39 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009004,14,'Y','N','N',9582,'N',440,'Y',3000305,'N','The user defined element displays the optional elements that have been defined for this account combination.',104,'@$Element_U1@=Y','LAR','User defined list element #1','User List 1',100,0,TO_TIMESTAMP('2023-08-23 20:46:39','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:39','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:39 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009004 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:39 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009005,14,'Y','Y','N',9581,'N',450,'Y',3000305,'N','The user defined element displays the optional elements that have been defined for this account combination.',104,'@$Element_U2@=Y','LAR','User defined list element #2','User List 2',100,0,TO_TIMESTAMP('2023-08-23 20:46:39','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:39','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:39 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009005 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:40 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009006,14,'Y','N','N',3516,'N',460,'Y',3000305,'Y','The Movement Type indicates the type of movement (in, out, to production, etc)',101,'LAR','Method of moving the inventory','Movement Type',100,0,TO_TIMESTAMP('2023-08-23 20:46:39','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:39','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:40 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009006 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:40 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009007,23,'Y','Y','N',12079,'N',470,'Y',3000305,'N',101,'LAR','Create Confirm',100,0,TO_TIMESTAMP('2023-08-23 20:46:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:40','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:40 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009007 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:40 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009008,1,'Y','N','N',10790,'N',480,'Y',3000305,'Y','Material Movement is in transit - shipped, but not received.
The transaction is completed, if confirmed.',101,'LAR','Movement is in transit','In Transit',100,0,TO_TIMESTAMP('2023-08-23 20:46:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:40','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:40 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009008 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:40 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009009,14,'Y','Y','N',10789,'N',490,'Y',3000305,'Y','The Date Received indicates the date that product was received.',101,'LAR','Date a product was received','Date received',100,0,TO_TIMESTAMP('2023-08-23 20:46:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:40','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:40 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009009 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:40 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009010,14,'Y','N','N',4323,'N',500,'Y',3000305,'Y','The Document Status indicates the status of a document at this time.  If you want to change the document status, use the Document Action field',101,'LAR','The current status of the document','Document Status','N',100,0,TO_TIMESTAMP('2023-08-23 20:46:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:40','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:40 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009010 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:40 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009011,23,'Y','Y','N',4324,'N',510,'Y',3000305,'N','You find the current status in the Document Status field. The options are listed in a popup',101,'LAR','The targeted status of the document','Document Action','N',100,0,TO_TIMESTAMP('2023-08-23 20:46:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:40','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:40 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009011 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:41 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009012,1,'Y','N','N',12410,'N',520,'Y',3000305,'N','The document is in dispute. Use Requests to track details.',101,'LAR','Document is in dispute','In Dispute',100,0,TO_TIMESTAMP('2023-08-23 20:46:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:40','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:41 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009012 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:41 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009013,23,'Y','Y','N',6534,'N',530,'Y',3000305,'N','The Posted field indicates the status of the Generation of General Ledger Accounting Lines ',101,'@Processed@=Y & @#ShowAcct@=Y','LAR','Posting status','Posted','N',100,0,TO_TIMESTAMP('2023-08-23 20:46:41','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:41','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:41 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009013 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:41 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009014,1,'Y','N','N',3000884,'N',540,'Y',3000305,'Y','LAR','IsFiscalPrinted',100,0,TO_TIMESTAMP('2023-08-23 20:46:41','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:41','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:41 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009014 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:41 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009015,30,'Y','Y','N',3000885,'N',550,'Y',3000305,'Y','LAR','FiscalReceiptNumber',100,0,TO_TIMESTAMP('2023-08-23 20:46:41','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:41','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:41 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009015 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:46:41 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009016,14,'Y','N','N',3003727,'N',560,'Y',3000305,'N','LAR','CAI',100,0,TO_TIMESTAMP('2023-08-23 20:46:41','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:46:41','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:46:41 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009016 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009017,1,'N','N','N',9869,'N',0,'Y',3000304,'N','If a line is Description Only, e.g. Product Inventory is not corrected. No accounting transactions are created and the amount or totals are not included in the document.  This for including descriptive detail lines, e.g. for an Work Order.','LAR','if true, the line is just description and no transaction','Description Only',100,0,TO_TIMESTAMP('2023-08-23 20:47:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:47:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:47:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009017 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009018,14,'N','N','N',11407,'N',0,'Y',3000304,'N','LAR','Referenced Shipment Line','N',100,0,TO_TIMESTAMP('2023-08-23 20:47:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:47:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:47:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009018 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009019,14,'N','N','N',3529,'N',0,'Y',3000304,'N','The Shipment/Receipt Line indicates a unique line in a Shipment/Receipt document','LAR','Line on Shipment or Receipt document','Shipment/Receipt Line',100,0,TO_TIMESTAMP('2023-08-23 20:47:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:47:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:47:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009019 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009020,1,'N','N','N',4250,'N',0,'Y',3000304,'N','If selected, invoices are created','LAR','Is this invoiced?','Invoiced',100,0,TO_TIMESTAMP('2023-08-23 20:47:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:47:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:47:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009020 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009021,1,'N','N','N',3532,'N',0,'Y',3000304,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,TO_TIMESTAMP('2023-08-23 20:47:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:47:07','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:47:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009021 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009022,1,'N','N','N',12070,'N',0,'Y',3000304,'N','The Processed checkbox indicates that a document has been processed.','LAR','The document has been processed','Processed','N',100,0,TO_TIMESTAMP('2023-08-23 20:47:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:47:07','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:47:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009022 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009023,14,'Y','N','N',3530,'N',10,'Y',3000304,'Y','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,TO_TIMESTAMP('2023-08-23 20:47:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:47:07','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:47:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009023 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009024,14,'Y','Y','N',3531,'N',20,'Y',3000304,'Y','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,TO_TIMESTAMP('2023-08-23 20:47:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:47:07','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:47:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009024 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009025,26,'Y','N','N',3538,'N',30,'Y',3000304,'Y','The Material Shipment / Receipt ','LAR','Material Shipment Document','Shipment/Receipt',100,0,TO_TIMESTAMP('2023-08-23 20:47:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:47:07','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:47:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009025 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009026,14,'Y','Y','N',3811,'N',40,'Y',3000304,'N','The Sales Order Line is a unique identifier for a line in an order.','LAR','Sales Order Line','Sales Order Line',100,0,TO_TIMESTAMP('2023-08-23 20:47:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:47:07','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:47:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009026 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (1,'N',3009027,11,'Y','N','N',3810,'N',50,'Y',3000304,'N','Indicates the unique line for a document.  It will also control the display order of the lines within a document.','LAR','Unique line for this document','Line No','N',100,0,TO_TIMESTAMP('2023-08-23 20:47:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:47:08','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:47:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009027 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009028,26,'Y','N','N',3539,'N',60,'Y',3000304,'N','Identifies an item which is either purchased or sold in this organization.','LAR','Product, Service, Item','Product',100,0,TO_TIMESTAMP('2023-08-23 20:47:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:47:08','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:47:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009028 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009029,26,'Y','Y','N',8772,'N',70,'Y',3000304,'N','The values of the actual Product Attribute Instances.  The product level attributes are defined on Product level.','LAR','Product Attribute Set Instance','Attribute Set Instance',100,0,TO_TIMESTAMP('2023-08-23 20:47:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:47:08','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:47:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009029 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,IsMandatory,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009030,14,'Y','N','N',3537,'N',80,'Y',3000304,'N','The Locator indicates where in a Warehouse a product is located.','Y','LAR','Warehouse Locator','Locator',100,0,TO_TIMESTAMP('2023-08-23 20:47:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:47:08','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:47:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009030 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009031,14,'Y','Y','N',13434,'N',90,'Y',3000304,'N','The Charge indicates a type of Charge (Handling, Shipping, Restocking)','@C_Charge_ID@!0','LAR','Additional document charges','Charge',100,0,TO_TIMESTAMP('2023-08-23 20:47:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:47:08','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:47:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009031 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009032,60,'Y','N','N',3541,'N',100,'Y',3000304,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,TO_TIMESTAMP('2023-08-23 20:47:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:47:08','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:47:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009032 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009033,26,'Y','N','N',12868,'N',110,'Y',3000304,'N','The Quantity Entered is converted to base product UoM quantity',102,'LAR','The Quantity Entered is based on the selected UoM','Quantity',100,0,TO_TIMESTAMP('2023-08-23 20:47:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:47:09','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:47:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009033 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009034,14,'Y','Y','N',3812,'N',120,'Y',3000304,'N','The UOM defines a unique non monetary Unit of Measure',102,'LAR','Unit of Measure','UOM',100,0,TO_TIMESTAMP('2023-08-23 20:47:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:47:09','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:47:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009034 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009035,26,'Y','N','N',3540,'N',130,'Y',3000304,'N','The Movement Quantity indicates the quantity of a product that has been moved.',102,'@UOMConversion@=Y | @Processed@=Y','LAR','Quantity of a product moved.','Movement Quantity',100,0,TO_TIMESTAMP('2023-08-23 20:47:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:47:09','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:47:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009035 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009036,26,'Y','N','N',10794,'N',140,'Y',3000304,'Y','LAR','Picked Quantity',100,0,TO_TIMESTAMP('2023-08-23 20:47:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:47:09','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:47:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009036 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009037,26,'Y','Y','N',10796,'N',150,'Y',3000304,'Y','The Quantity which should have been received','LAR','Target Movement Quantity','Target Quantity',100,0,TO_TIMESTAMP('2023-08-23 20:47:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:47:09','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:47:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009037 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009038,26,'Y','N','N',10792,'N',160,'Y',3000304,'Y','Confirmation of a received quantity','LAR','Confirmation of a received quantity','Confirmed Quantity',100,0,TO_TIMESTAMP('2023-08-23 20:47:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:47:09','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:47:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009038 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009039,26,'Y','Y','N',10795,'N',170,'Y',3000304,'Y','LAR','The Quantity scrapped due to QA issues','Scrapped Quantity',100,0,TO_TIMESTAMP('2023-08-23 20:47:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:47:10','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:47:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009039 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009040,10,'Y','N','N',14094,'N',180,'Y',3000304,'N','A Project allows you to track and control internal or external activities.',104,'@$Element_PJ@=Y','LAR','Financial Project','Project',100,0,TO_TIMESTAMP('2023-08-23 20:47:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:47:10','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:47:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009040 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009041,10,'Y','Y','N',15858,'N',190,'Y',3000304,'N','Activities indicate tasks that are performed and used to utilize Activity based Costing',104,'@$Element_AY@=''Y''','LAR','Business Activity','Activity',100,0,TO_TIMESTAMP('2023-08-23 20:47:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:47:10','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:47:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009041 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009042,10,'Y','N','N',15855,'N',200,'Y',3000304,'N',104,'@$Element_PJ@=Y','LAR','Phase of a Project','Project Phase',100,0,TO_TIMESTAMP('2023-08-23 20:47:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:47:10','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:47:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009042 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009043,10,'Y','Y','N',15856,'N',210,'Y',3000304,'N','A Project Task in a Project Phase represents the actual work.',104,'@$Element_PJ@=Y','LAR','Actual Project Task in a Phase','Project Task',100,0,TO_TIMESTAMP('2023-08-23 20:47:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:47:10','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:47:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009043 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009044,10,'Y','N','N',15857,'N',220,'Y',3000304,'N','The Campaign defines a unique marketing program.  Projects can be associated with a pre defined Marketing Campaign.  You can then report based on a specific Campaign.',104,'@$Element_MC@=''Y''','LAR','Marketing Campaign','Campaign',100,0,TO_TIMESTAMP('2023-08-23 20:47:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:47:10','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:47:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009044 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:11 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009045,10,'Y','Y','N',15863,'N',230,'Y',3000304,'N','The organization which performs or initiates this transaction (for another organization).  The owning Organization may not be the transaction organization in a service bureau environment, with centralized services, and inter-organization transactions.',104,'@$Element_OT@=Y','LAR','Performing or initiating organization','Trx Organization',100,0,TO_TIMESTAMP('2023-08-23 20:47:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:47:10','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:47:11 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009045 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:11 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009046,10,'Y','N','N',15859,'N',240,'Y',3000304,'N','The user defined element displays the optional elements that have been defined for this account combination.',104,'@$Element_U1@=''Y''','LAR','User defined list element #1','User List 1',100,0,TO_TIMESTAMP('2023-08-23 20:47:11','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:47:11','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:47:11 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009046 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:11 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009047,10,'Y','Y','N',15860,'N',250,'Y',3000304,'N','The user defined element displays the optional elements that have been defined for this account combination.',104,'@$Element_U2@=''Y''','LAR','User defined list element #2','User List 2',100,0,TO_TIMESTAMP('2023-08-23 20:47:11','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:47:11','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:47:11 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009047 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:47:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,AD_Column_ID,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('N',3000141,60,'N','N',320,3000306,'N','N',3538,'N','Y',0,'N','N','LAR','Línea RE',0,0,TO_TIMESTAMP('2023-08-23 20:47:54','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2023-08-23 20:47:54','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 23/08/2023 20:47:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000306 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 23/08/2023 20:48:05 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009048,1,'N','N','N',9869,'N',0,'Y',3000306,'N','If a line is Description Only, e.g. Product Inventory is not corrected. No accounting transactions are created and the amount or totals are not included in the document.  This for including descriptive detail lines, e.g. for an Work Order.','LAR','if true, the line is just description and no transaction','Description Only',100,0,TO_TIMESTAMP('2023-08-23 20:48:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:48:05','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:48:05 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009048 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:48:05 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009049,14,'N','N','N',11407,'N',0,'Y',3000306,'N','LAR','Referenced Shipment Line','N',100,0,TO_TIMESTAMP('2023-08-23 20:48:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:48:05','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:48:05 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009049 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:48:05 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009050,14,'N','N','N',3529,'N',0,'Y',3000306,'N','The Shipment/Receipt Line indicates a unique line in a Shipment/Receipt document','LAR','Line on Shipment or Receipt document','Shipment/Receipt Line',100,0,TO_TIMESTAMP('2023-08-23 20:48:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:48:05','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:48:05 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009050 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:48:05 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009051,1,'N','N','N',4250,'N',0,'Y',3000306,'N','If selected, invoices are created','LAR','Is this invoiced?','Invoiced',100,0,TO_TIMESTAMP('2023-08-23 20:48:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:48:05','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:48:05 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009051 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:48:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009052,1,'N','N','N',3532,'N',0,'Y',3000306,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,TO_TIMESTAMP('2023-08-23 20:48:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:48:05','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:48:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009052 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:48:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009053,1,'N','N','N',12070,'N',0,'Y',3000306,'N','The Processed checkbox indicates that a document has been processed.','LAR','The document has been processed','Processed','N',100,0,TO_TIMESTAMP('2023-08-23 20:48:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:48:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:48:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009053 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:48:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009054,14,'Y','N','N',3530,'N',10,'Y',3000306,'Y','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,TO_TIMESTAMP('2023-08-23 20:48:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:48:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:48:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009054 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:48:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009055,14,'Y','Y','N',3531,'N',20,'Y',3000306,'Y','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,TO_TIMESTAMP('2023-08-23 20:48:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:48:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:48:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009055 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:48:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009056,26,'Y','N','N',3538,'N',30,'Y',3000306,'Y','The Material Shipment / Receipt ','LAR','Material Shipment Document','Shipment/Receipt',100,0,TO_TIMESTAMP('2023-08-23 20:48:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:48:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:48:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009056 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:48:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009057,14,'Y','Y','N',3811,'N',40,'Y',3000306,'N','The Sales Order Line is a unique identifier for a line in an order.','LAR','Sales Order Line','Sales Order Line',100,0,TO_TIMESTAMP('2023-08-23 20:48:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:48:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:48:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009057 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:48:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (1,'N',3009058,11,'Y','N','N',3810,'N',50,'Y',3000306,'N','Indicates the unique line for a document.  It will also control the display order of the lines within a document.','LAR','Unique line for this document','Line No','N',100,0,TO_TIMESTAMP('2023-08-23 20:48:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:48:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:48:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009058 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:48:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009059,26,'Y','N','N',3539,'N',60,'Y',3000306,'N','Identifies an item which is either purchased or sold in this organization.','LAR','Product, Service, Item','Product',100,0,TO_TIMESTAMP('2023-08-23 20:48:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:48:07','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:48:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009059 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:48:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009060,26,'Y','Y','N',8772,'N',70,'Y',3000306,'N','The values of the actual Product Attribute Instances.  The product level attributes are defined on Product level.','LAR','Product Attribute Set Instance','Attribute Set Instance',100,0,TO_TIMESTAMP('2023-08-23 20:48:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:48:07','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:48:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009060 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:48:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,IsMandatory,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009061,14,'Y','N','N',3537,'N',80,'Y',3000306,'N','The Locator indicates where in a Warehouse a product is located.','Y','LAR','Warehouse Locator','Locator',100,0,TO_TIMESTAMP('2023-08-23 20:48:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:48:07','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:48:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009061 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:48:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009062,14,'Y','Y','N',13434,'N',90,'Y',3000306,'N','The Charge indicates a type of Charge (Handling, Shipping, Restocking)','@C_Charge_ID@!0','LAR','Additional document charges','Charge',100,0,TO_TIMESTAMP('2023-08-23 20:48:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:48:07','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:48:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009062 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:48:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009063,60,'Y','N','N',3541,'N',100,'Y',3000306,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,TO_TIMESTAMP('2023-08-23 20:48:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:48:07','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:48:07 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009063 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:48:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009064,26,'Y','N','N',12868,'N',110,'Y',3000306,'N','The Quantity Entered is converted to base product UoM quantity',102,'LAR','The Quantity Entered is based on the selected UoM','Quantity',100,0,TO_TIMESTAMP('2023-08-23 20:48:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:48:07','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:48:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009064 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:48:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009065,14,'Y','Y','N',3812,'N',120,'Y',3000306,'N','The UOM defines a unique non monetary Unit of Measure',102,'LAR','Unit of Measure','UOM',100,0,TO_TIMESTAMP('2023-08-23 20:48:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:48:08','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:48:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009065 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:48:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009066,26,'Y','N','N',3540,'N',130,'Y',3000306,'N','The Movement Quantity indicates the quantity of a product that has been moved.',102,'@UOMConversion@=Y | @Processed@=Y','LAR','Quantity of a product moved.','Movement Quantity',100,0,TO_TIMESTAMP('2023-08-23 20:48:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:48:08','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:48:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009066 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:48:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009067,26,'Y','N','N',10794,'N',140,'Y',3000306,'Y','LAR','Picked Quantity',100,0,TO_TIMESTAMP('2023-08-23 20:48:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:48:08','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:48:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009067 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:48:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009068,26,'Y','Y','N',10796,'N',150,'Y',3000306,'Y','The Quantity which should have been received','LAR','Target Movement Quantity','Target Quantity',100,0,TO_TIMESTAMP('2023-08-23 20:48:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:48:08','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:48:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009068 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:48:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009069,26,'Y','N','N',10792,'N',160,'Y',3000306,'Y','Confirmation of a received quantity','LAR','Confirmation of a received quantity','Confirmed Quantity',100,0,TO_TIMESTAMP('2023-08-23 20:48:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:48:08','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:48:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009069 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:48:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009070,26,'Y','Y','N',10795,'N',170,'Y',3000306,'Y','LAR','The Quantity scrapped due to QA issues','Scrapped Quantity',100,0,TO_TIMESTAMP('2023-08-23 20:48:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:48:08','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:48:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009070 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:48:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009071,10,'Y','N','N',14094,'N',180,'Y',3000306,'N','A Project allows you to track and control internal or external activities.',104,'@$Element_PJ@=Y','LAR','Financial Project','Project',100,0,TO_TIMESTAMP('2023-08-23 20:48:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:48:09','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:48:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009071 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:48:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009072,10,'Y','Y','N',15858,'N',190,'Y',3000306,'N','Activities indicate tasks that are performed and used to utilize Activity based Costing',104,'@$Element_AY@=''Y''','LAR','Business Activity','Activity',100,0,TO_TIMESTAMP('2023-08-23 20:48:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:48:09','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:48:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009072 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:48:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009073,10,'Y','N','N',15855,'N',200,'Y',3000306,'N',104,'@$Element_PJ@=Y','LAR','Phase of a Project','Project Phase',100,0,TO_TIMESTAMP('2023-08-23 20:48:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:48:09','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:48:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009073 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:48:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009074,10,'Y','Y','N',15856,'N',210,'Y',3000306,'N','A Project Task in a Project Phase represents the actual work.',104,'@$Element_PJ@=Y','LAR','Actual Project Task in a Phase','Project Task',100,0,TO_TIMESTAMP('2023-08-23 20:48:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:48:09','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:48:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009074 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:48:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009075,10,'Y','N','N',15857,'N',220,'Y',3000306,'N','The Campaign defines a unique marketing program.  Projects can be associated with a pre defined Marketing Campaign.  You can then report based on a specific Campaign.',104,'@$Element_MC@=''Y''','LAR','Marketing Campaign','Campaign',100,0,TO_TIMESTAMP('2023-08-23 20:48:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:48:09','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:48:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009075 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:48:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009076,10,'Y','Y','N',15863,'N',230,'Y',3000306,'N','The organization which performs or initiates this transaction (for another organization).  The owning Organization may not be the transaction organization in a service bureau environment, with centralized services, and inter-organization transactions.',104,'@$Element_OT@=Y','LAR','Performing or initiating organization','Trx Organization',100,0,TO_TIMESTAMP('2023-08-23 20:48:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:48:09','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:48:09 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009076 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:48:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009077,10,'Y','N','N',15859,'N',240,'Y',3000306,'N','The user defined element displays the optional elements that have been defined for this account combination.',104,'@$Element_U1@=''Y''','LAR','User defined list element #1','User List 1',100,0,TO_TIMESTAMP('2023-08-23 20:48:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:48:09','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:48:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009077 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:48:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009078,10,'Y','Y','N',15860,'N',250,'Y',3000306,'N','The user defined element displays the optional elements that have been defined for this account combination.',104,'@$Element_U2@=''Y''','LAR','User defined list element #2','User List 2',100,0,TO_TIMESTAMP('2023-08-23 20:48:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-23 20:48:10','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/08/2023 20:48:10 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009078 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2023 20:51:56 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET Callout=NULL,Updated=TO_TIMESTAMP('2023-08-23 20:51:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005611
;

-- 23/08/2023 20:52:32 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Tab SET TabLevel=2,Updated=TO_TIMESTAMP('2023-08-23 20:52:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000306
;

-- 24/08/2023 0:33:44 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET Callout='ar.com.ergio.model.CalloutOrdenGarantia.order',Updated=TO_TIMESTAMP('2023-08-24 00:33:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005599
;

-- 24/08/2023 0:33:55 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET Callout='ar.com.ergio.model.CalloutOrdenGarantia.invoice',Updated=TO_TIMESTAMP('2023-08-24 00:33:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005598
;

-- 24/08/2023 0:34:25 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET Callout='ar.com.ergio.model.CalloutOrdenGarantia.qty',Updated=TO_TIMESTAMP('2023-08-24 00:34:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005613
;

-- 24/08/2023 0:34:34 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET Callout='ar.com.ergio.model.CalloutOrdenGarantia.orderLine',Updated=TO_TIMESTAMP('2023-08-24 00:34:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005614
;

-- 24/08/2023 0:40:53 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET DefaultValue='@SQL=SELECT COALESCE(MAX(Line),0)+10 AS DefaultValue FROM LAR_OrdenGarantiaLine WHERE LAR_OrdenGarantia_ID=@LAR_OrdenGarantia_ID@',Updated=TO_TIMESTAMP('2023-08-24 00:40:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005609
;

-- 24/08/2023 0:41:38 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET DefaultValue='@AD_Client_ID@', IsAllowCopy='N',Updated=TO_TIMESTAMP('2023-08-24 00:41:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005580
;

-- 24/08/2023 0:42:26 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET DefaultValue='@AD_Org_ID@', IsAllowCopy='N',Updated=TO_TIMESTAMP('2023-08-24 00:42:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005581
;

-- 24/08/2023 0:43:23 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET AD_Val_Rule_ID=130,Updated=TO_TIMESTAMP('2023-08-24 00:43:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005581
;

-- 24/08/2023 0:43:36 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET AD_Val_Rule_ID=129,Updated=TO_TIMESTAMP('2023-08-24 00:43:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005580
;

-- 24/08/2023 0:44:36 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET DefaultValue='@#AD_Org_ID@',Updated=TO_TIMESTAMP('2023-08-24 00:44:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005581
;

-- 24/08/2023 0:44:52 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET DefaultValue='@#AD_Client_ID@',Updated=TO_TIMESTAMP('2023-08-24 00:44:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005580
;

-- 24/08/2023 0:45:35 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET DefaultValue='@AD_Client_ID@', AD_Val_Rule_ID=129, IsAllowCopy='N',Updated=TO_TIMESTAMP('2023-08-24 00:45:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005601
;

-- 24/08/2023 0:45:56 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET DefaultValue='@AD_Org_ID@', AD_Val_Rule_ID=130, IsAllowCopy='N',Updated=TO_TIMESTAMP('2023-08-24 00:45:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005602
;

-- 24/08/2023 0:49:35 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET IsIdentifier='N', SeqNo=0, IsUpdateable='N',Updated=TO_TIMESTAMP('2023-08-24 00:49:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=2213
;

-- 24/08/2023 0:49:56 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET SeqNo=1,Updated=TO_TIMESTAMP('2023-08-24 00:49:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=2214
;

-- 24/08/2023 0:50:23 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET SeqNo=NULL, IsUpdateable='N',Updated=TO_TIMESTAMP('2023-08-24 00:50:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=2213
;

-- 24/08/2023 0:50:41 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET IsIdentifier='N', SeqNo=NULL,Updated=TO_TIMESTAMP('2023-08-24 00:50:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3723
;

-- 24/08/2023 0:52:20 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET IsIdentifier='Y', SeqNo=2,Updated=TO_TIMESTAMP('2023-08-24 00:52:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=2221
;

-- 24/08/2023 0:52:51 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET IsIdentifier='Y', SeqNo=3,Updated=TO_TIMESTAMP('2023-08-24 00:52:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=12876
;

-- 25/08/2023 16:46:49 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005616,3000268,'LAR',0,'N','N','N','A Return Material Authorization may be required to accept returns and to create Credit Memos','N',10,'N',19,'N',2412,'N','Y','N','Return Material Authorization','RMA','M_RMA_ID',100,TO_TIMESTAMP('2023-08-25 16:46:47','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-25 16:46:47','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 25/08/2023 16:46:49 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005616 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 25/08/2023 16:47:05 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005617,3000269,'LAR',0,'N','N','N','Detail information about the returned goods','N',10,'N',19,'N',2413,'N','Y','N','Return Material Authorization Line','RMA Line','M_RMALine_ID',100,TO_TIMESTAMP('2023-08-25 16:47:05','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-08-25 16:47:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 25/08/2023 16:47:05 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005617 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 25/08/2023 16:47:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009079,10,'Y','N','N',3005616,'N','Y',3000301,'N','A Return Material Authorization may be required to accept returns and to create Credit Memos','LAR','Return Material Authorization','RMA',100,0,TO_TIMESTAMP('2023-08-25 16:47:27','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-25 16:47:27','YYYY-MM-DD HH24:MI:SS'))
;

-- 25/08/2023 16:47:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009079 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 25/08/2023 16:47:45 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3009079
;

-- 25/08/2023 16:47:56 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009080,10,'Y','N','N',3005617,'N','Y',3000302,'N','Detail information about the returned goods','LAR','Return Material Authorization Line','RMA Line',100,0,TO_TIMESTAMP('2023-08-25 16:47:55','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-08-25 16:47:55','YYYY-MM-DD HH24:MI:SS'))
;

-- 25/08/2023 16:47:56 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009080 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 25/08/2023 16:55:58 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3009080
;

-- 25/08/2023 17:02:40 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('C_DocType.DocBaseType=''WCE''','S',3000138,'LAR','C_DocType Ordenes de Garantía',100,100,TO_TIMESTAMP('2023-08-25 17:02:40','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_TIMESTAMP('2023-08-25 17:02:40','YYYY-MM-DD HH24:MI:SS'))
;

-- 25/08/2023 17:03:21 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET AD_Val_Rule_ID=3000138,Updated=TO_TIMESTAMP('2023-08-25 17:03:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005597
;

-- 25/08/2023 17:07:48 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET AD_Reference_ID=15,Updated=TO_TIMESTAMP('2023-08-25 17:07:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005589
;

-- 25/08/2023 17:42:31 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2023-08-25 17:42:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008823
;

-- 28/08/2023 16:39:46 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,AD_Client_ID,AD_Org_ID,Created,Updated,CreatedBy,UpdatedBy,IsActive) VALUES (3000085,'LAR','C','14','Ingrese la cantidad de meses en la que sera valída la garantía de sus productos. Si no se ingresa ningún valor, se tomara como referencia el valor cero, lo cual indicara que no producto no tiene feche limite de garantía.','LAR_MesesDeGarantia',1000000,0,TO_TIMESTAMP('2023-08-28 16:39:46','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2023-08-28 16:39:46','YYYY-MM-DD HH24:MI:SS'),100,100,'Y')
;

-- 28/08/2023 17:58:38 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET AD_Val_Rule_ID=189,Updated=TO_TIMESTAMP('2023-08-28 17:58:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005591
;

-- 28/08/2023 17:58:46 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET AD_Val_Rule_ID=189,Updated=TO_TIMESTAMP('2023-08-28 17:58:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005590
;

-- 25/09/2023 18:01:36 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET IsMandatory='N',Updated=TO_TIMESTAMP('2023-09-25 18:01:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005598
;

-- 25/09/2023 18:01:49 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET IsMandatory='N',Updated=TO_TIMESTAMP('2023-09-25 18:01:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005599
;

-- 25/09/2023 18:02:02 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET IsMandatory='N',Updated=TO_TIMESTAMP('2023-09-25 18:02:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005614
;

-- 25/09/2023 19:44:43 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2023-09-25 19:44:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008829
;

-- 25/09/2023 19:45:23 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2023-09-25 19:45:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008826
;

-- 25/09/2023 19:46:05 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET DefaultValue='@#Date@',Updated=TO_TIMESTAMP('2023-09-25 19:46:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008826
;

-- 25/09/2023 19:47:13 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2023-09-25 19:47:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008819
;

-- 25/09/2023 19:47:18 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2023-09-25 19:47:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008820
;

-- 25/09/2023 19:48:22 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET IsMandatory='Y',Updated=TO_TIMESTAMP('2023-09-25 19:48:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005610
;

-- 25/09/2023 19:48:52 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_TIMESTAMP('2023-09-25 19:48:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005610
;

-- 25/09/2023 19:49:17 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_TIMESTAMP('2023-09-25 19:49:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005588
;

-- 25/09/2023 19:59:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET DefaultValue='4000065',Updated=TO_TIMESTAMP('2023-09-25 19:59:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008825
;

-- 25/09/2023 20:42:12 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001402,'mesesgarantia','LAR','mesesgarantia','mesesgarantia',0,TO_TIMESTAMP('2023-09-25 20:42:12','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2023-09-25 20:42:12','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 25/09/2023 20:42:12 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001402 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 25/09/2023 20:42:13 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005618,291,'LAR',0,'Y','N','N','N',3,'N',22,'N',3001402,'N','Y','N','mesesgarantia','mesesgarantia',100,TO_TIMESTAMP('2023-09-25 20:42:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-09-25 20:42:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 25/09/2023 20:42:13 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005618 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 25/09/2023 20:42:56 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Element SET ColumnName='MesesGarantia', Name='Meses de Garantía', PrintName='Meses de Garantía',Updated=TO_TIMESTAMP('2023-09-25 20:42:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001402
;

-- 25/09/2023 20:42:56 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001402
;

-- 25/09/2023 20:42:56 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET ColumnName='MesesGarantia', Name='Meses de Garantía', Description=NULL, Help=NULL WHERE AD_Element_ID=3001402
;

-- 25/09/2023 20:42:56 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Process_Para SET ColumnName='MesesGarantia', Name='Meses de Garantía', Description=NULL, Help=NULL, AD_Element_ID=3001402 WHERE UPPER(ColumnName)='MESESGARANTIA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 25/09/2023 20:42:56 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Process_Para SET ColumnName='MesesGarantia', Name='Meses de Garantía', Description=NULL, Help=NULL WHERE AD_Element_ID=3001402 AND IsCentrallyMaintained='Y'
;

-- 25/09/2023 20:42:56 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET Name='Meses de Garantía', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001402) AND IsCentrallyMaintained='Y'
;

-- 25/09/2023 20:42:56 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_PrintFormatItem SET PrintName='Meses de Garantía', Name='Meses de Garantía' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001402)
;

-- 25/09/2023 20:43:03 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Element_Trl SET Name='Meses de Garantía',PrintName='Meses de Garantía',Updated=TO_TIMESTAMP('2023-09-25 20:43:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001402 AND AD_Language='es_AR'
;

-- 25/09/2023 20:43:18 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column_Trl SET Name='Meses de Garantía',Updated=TO_TIMESTAMP('2023-09-25 20:43:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005618 AND AD_Language='es_AR'
;

-- 25/09/2023 20:44:17 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009242,10,'Y','N','N',3005507,'N','Y',223,'N','LAR','LAR_Fecha_Ingreso',100,0,TO_TIMESTAMP('2023-09-25 20:44:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-09-25 20:44:17','YYYY-MM-DD HH24:MI:SS'))
;

-- 25/09/2023 20:44:17 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009242 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 25/09/2023 20:44:17 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009243,10,'Y','N','N',3005508,'N','Y',223,'N','LAR','LAR_Vacaciones_Dias_Corridos',100,0,TO_TIMESTAMP('2023-09-25 20:44:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-09-25 20:44:17','YYYY-MM-DD HH24:MI:SS'))
;

-- 25/09/2023 20:44:17 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009243 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 25/09/2023 20:44:17 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009244,10,'Y','N','N',3005509,'N','Y',223,'N','LAR','LAR_Vacaciones_Dias_Habiles',100,0,TO_TIMESTAMP('2023-09-25 20:44:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-09-25 20:44:17','YYYY-MM-DD HH24:MI:SS'))
;

-- 25/09/2023 20:44:17 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009244 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 25/09/2023 20:44:17 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009245,3,'Y','N','N',3005618,'N','Y',223,'N','LAR','Meses de Garantía',100,0,TO_TIMESTAMP('2023-09-25 20:44:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-09-25 20:44:17','YYYY-MM-DD HH24:MI:SS'))
;

-- 25/09/2023 20:44:17 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009245 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 25/09/2023 20:44:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3009242
;

-- 25/09/2023 20:44:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3009243
;

-- 25/09/2023 20:44:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3009244
;

-- 25/09/2023 20:44:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3009245
;

-- 25/09/2023 21:06:36 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('C_Invoice.DateInvoiced >= (SELECT (@Fecha@ - interval ''1 month'' * (SELECT MesesGarantia FROM C_BPartner WHERE C_BPartner_ID = @C_BPartner_ID@)))','S',3000141,'LAR','C_Invoice Meses de Garantía',100,100,TO_TIMESTAMP('2023-09-25 21:06:36','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_TIMESTAMP('2023-09-25 21:06:36','YYYY-MM-DD HH24:MI:SS'))
;

-- 25/09/2023 21:08:41 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET AD_Val_Rule_ID=3000141,Updated=TO_TIMESTAMP('2023-09-25 21:08:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005598
;

-- 25/09/2023 21:12:45 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Val_Rule SET Code='C_Invoice.DateInvoiced >= (SELECT (@FechaCambio@ - interval ''1 month'' * (SELECT MesesGarantia FROM C_BPartner WHERE C_BPartner_ID = @C_BPartner_ID@)))',Updated=TO_TIMESTAMP('2023-09-25 21:12:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000141
;

-- 25/09/2023 21:17:08 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Val_Rule SET Code='C_Invoice.DateInvoiced::DATE >= (SELECT (@FechaCambio@::DATE - interval ''1 month'' * (SELECT MesesGarantia FROM C_BPartner WHERE C_BPartner_ID = @C_BPartner_ID@)))',Updated=TO_TIMESTAMP('2023-09-25 21:17:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000141
;

-- 25/09/2023 21:23:50 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Val_Rule SET Code='C_Invoice.DateInvoiced::DATE >= (SELECT (''@FechaCambio@''::DATE - interval ''1 month'' * (SELECT MesesGarantia FROM C_BPartner WHERE C_BPartner_ID = @C_BPartner_ID@)))',Updated=TO_TIMESTAMP('2023-09-25 21:23:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000141
;

-- 26/09/2023 0:10:47 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_SysConfig SET Value='4136632', Description='ID del presupuesto generico utilizado en la generación de Ordenes de Garantía, que no estan vinculadas con una venta realizada por la compañia (venta de terceros/revendedores).', Name='LAR_OG_PresupuestoGenerico',Updated=TO_TIMESTAMP('2023-09-26 00:10:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_SysConfig_ID=3000085
;

-- 26/09/2023 0:12:59 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,AD_Client_ID,AD_Org_ID,Created,Updated,CreatedBy,UpdatedBy,IsActive) VALUES (3000086,'LAR','C','4000067','ID del tipo de documento utilizado para la generación de remitos de ingreso, dentro de la Orden de Garantías.','LAR_OG_TipoDoc_Ingreso',1000000,0,TO_TIMESTAMP('2023-09-26 00:12:57','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2023-09-26 00:12:57','YYYY-MM-DD HH24:MI:SS'),100,100,'Y')
;

-- 26/09/2023 0:14:02 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,AD_Client_ID,AD_Org_ID,Created,Updated,CreatedBy,UpdatedBy,IsActive) VALUES (3000087,'LAR','C','4000066','ID del tipo de documento utilizado para la generación de remitos de egreso, dentro de la Orden de Garantías.','LAR_OG_TipoDoc_Egreso',1000000,0,TO_TIMESTAMP('2023-09-26 00:14:02','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2023-09-26 00:14:02','YYYY-MM-DD HH24:MI:SS'),100,100,'Y')
;

-- 26/09/2023 0:15:48 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,AD_Client_ID,AD_Org_ID,Created,Updated,CreatedBy,UpdatedBy,IsActive) VALUES (3000088,'LAR','C','1000123','ID del tipo de documento utilizado para la generación de la Orden de Devolución (RMA), utilizada dentro de la Orden de Garantía.','LAR_OG_TipoDoc_OrdenDevolucion',1000000,0,TO_TIMESTAMP('2023-09-26 00:15:48','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2023-09-26 00:15:48','YYYY-MM-DD HH24:MI:SS'),100,100,'Y')
;

-- 26/09/2023 0:30:16 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001403,'fechaborne','LAR','fechaborne','fechaborne',0,TO_TIMESTAMP('2023-09-26 00:30:15','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2023-09-26 00:30:15','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 26/09/2023 0:30:16 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001403 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 26/09/2023 0:30:16 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005619,3000269,'LAR',0,'N','N','N','N',29,'N',16,'N',3001403,'N','Y','N','fechaborne','fechaborne',100,TO_TIMESTAMP('2023-09-26 00:30:15','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-09-26 00:30:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/09/2023 0:30:16 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005619 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 26/09/2023 0:30:17 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001404,'fechacaja','LAR','fechacaja','fechacaja',0,TO_TIMESTAMP('2023-09-26 00:30:16','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2023-09-26 00:30:16','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 26/09/2023 0:30:17 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001404 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 26/09/2023 0:30:17 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005620,3000269,'LAR',0,'N','N','N','N',29,'N',16,'N',3001404,'N','Y','N','fechacaja','fechacaja',100,TO_TIMESTAMP('2023-09-26 00:30:16','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2023-09-26 00:30:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/09/2023 0:30:17 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005620 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 26/09/2023 0:30:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Element SET ColumnName='FechaBorne', Name='Fecha Borne', PrintName='Fecha Borne',Updated=TO_TIMESTAMP('2023-09-26 00:30:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001403
;

-- 26/09/2023 0:30:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001403
;

-- 26/09/2023 0:30:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET ColumnName='FechaBorne', Name='Fecha Borne', Description=NULL, Help=NULL WHERE AD_Element_ID=3001403
;

-- 26/09/2023 0:30:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Process_Para SET ColumnName='FechaBorne', Name='Fecha Borne', Description=NULL, Help=NULL, AD_Element_ID=3001403 WHERE UPPER(ColumnName)='FECHABORNE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 26/09/2023 0:30:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Process_Para SET ColumnName='FechaBorne', Name='Fecha Borne', Description=NULL, Help=NULL WHERE AD_Element_ID=3001403 AND IsCentrallyMaintained='Y'
;

-- 26/09/2023 0:30:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET Name='Fecha Borne', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001403) AND IsCentrallyMaintained='Y'
;

-- 26/09/2023 0:30:54 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_PrintFormatItem SET PrintName='Fecha Borne', Name='Fecha Borne' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001403)
;

-- 26/09/2023 0:30:59 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Element_Trl SET Name='Fecha Borne',PrintName='Fecha Borne',Updated=TO_TIMESTAMP('2023-09-26 00:30:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001403 AND AD_Language='es_AR'
;

-- 26/09/2023 0:31:20 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column_Trl SET Name='Fecha Borne',Updated=TO_TIMESTAMP('2023-09-26 00:31:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005619 AND AD_Language='es_AR'
;

-- 26/09/2023 0:31:28 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET AD_Reference_ID=15,Updated=TO_TIMESTAMP('2023-09-26 00:31:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005619
;

-- 26/09/2023 0:32:30 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Element SET ColumnName='FechaCaja', Name='Fecha Caja', PrintName='Fecha Caja',Updated=TO_TIMESTAMP('2023-09-26 00:32:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001404
;

-- 26/09/2023 0:32:30 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001404
;

-- 26/09/2023 0:32:30 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET ColumnName='FechaCaja', Name='Fecha Caja', Description=NULL, Help=NULL WHERE AD_Element_ID=3001404
;

-- 26/09/2023 0:32:30 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Process_Para SET ColumnName='FechaCaja', Name='Fecha Caja', Description=NULL, Help=NULL, AD_Element_ID=3001404 WHERE UPPER(ColumnName)='FECHACAJA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 26/09/2023 0:32:30 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Process_Para SET ColumnName='FechaCaja', Name='Fecha Caja', Description=NULL, Help=NULL WHERE AD_Element_ID=3001404 AND IsCentrallyMaintained='Y'
;

-- 26/09/2023 0:32:30 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET Name='Fecha Caja', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001404) AND IsCentrallyMaintained='Y'
;

-- 26/09/2023 0:32:30 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_PrintFormatItem SET PrintName='Fecha Caja', Name='Fecha Caja' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001404)
;

-- 26/09/2023 0:32:36 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Element_Trl SET Name='Fecha Caja',PrintName='Fecha Caja',Updated=TO_TIMESTAMP('2023-09-26 00:32:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001404 AND AD_Language='es_AR'
;

-- 26/09/2023 0:32:42 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column SET AD_Reference_ID=15, Name='Fecha Caja', ColumnName='FechaCaja',Updated=TO_TIMESTAMP('2023-09-26 00:32:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005620
;

-- 26/09/2023 0:32:47 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Column_Trl SET Name='Fecha Caja',Updated=TO_TIMESTAMP('2023-09-26 00:32:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005620 AND AD_Language='es_AR'
;

-- 26/09/2023 0:33:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009246,29,'Y','N','N',3005619,'N','Y',3000302,'N','LAR','Fecha Borne',100,0,TO_TIMESTAMP('2023-09-26 00:33:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-09-26 00:33:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 26/09/2023 0:33:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009246 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 26/09/2023 0:33:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3009247,29,'Y','N','N',3005620,'N','Y',3000302,'N','LAR','Fecha Caja',100,0,TO_TIMESTAMP('2023-09-26 00:33:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2023-09-26 00:33:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 26/09/2023 0:33:06 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009247 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 26/09/2023 0:34:33 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2023-09-26 00:34:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009247
;

-- 26/09/2023 0:35:50 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3009246
;

-- 26/09/2023 0:35:50 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3009247
;

-- 26/09/2023 0:35:50 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3008834
;

-- 26/09/2023 0:35:52 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3008834
;

-- 26/09/2023 0:35:52 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3009246
;

-- 26/09/2023 0:35:52 ART
-- ISSUE #160: Ventana de Ordenes de Garantía.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3009247
;

-- Registración de script
SELECT register_migration_script_lar('0222_ISSUE-160.sql', 'LAR', '')
;
