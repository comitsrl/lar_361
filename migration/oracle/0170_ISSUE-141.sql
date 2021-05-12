CREATE TABLE C_DocType_CAI (
    c_doctype_cai_id numeric(10,0) NOT NULL,
    c_doctype_id numeric(10,0) NOT NULL,
    ad_client_id numeric(10,0) NOT NULL,
    ad_org_id numeric(10,0) NOT NULL,
    isactive character(1) NOT NULL DEFAULT 'Y'::bpchar,
    created timestamp without time zone NOT NULL DEFAULT now(),
    createdby numeric(10,0) NOT NULL,
    updated timestamp without time zone NOT NULL DEFAULT now(),
    updatedby numeric(10,0) NOT NULL,
    cantidad_autorizada numeric(10,0) not null,
    nro_desde numeric(10,0) not null,
    nro_hasta numeric(10,0) not null,
    cai character varying(12) not null,
    fecha_vencimiento timestamp without time zone not null,
    CONSTRAINT C_DocTypeCAI_pkey PRIMARY KEY (C_DocType_CAI_ID),
    CONSTRAINT C_DocTypeCAI_DocType FOREIGN KEY (c_doctype_id)
        REFERENCES c_doctype (c_doctype_id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT c_doctypeCAI_isactive_check CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
)
WITH (
  OIDS=FALSE
);

CREATE INDEX C_DocTypeCAI_DocType
  ON C_DocType_CAI
  USING btree
  (c_doctype_id);

-- Se agrega la marca de autoimpresor al tipo de documento
ALTER TABLE C_Doctype
    ADD COLUMN EsAutoimpresor character(1) NOT NULL DEFAULT 'N'::bpchar,
    ADD CONSTRAINT c_doctype_esautoimpresor_check CHECK (esautoimpresor = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
;

ALTER TABLE M_InOut
    ADD COLUMN cai character varying(12);


-- 27/04/2021 17:51:36 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Window_ID,AD_Table_ID,IsHighVolume,IsView,IsChangeLog,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Description,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','6',100,135,3000139,'N','N','N','LAR','Y','Y','L','C_DocType_CAI','Registro de Autorizaciones CAI para el tipo de documento','Autorizaciones CAI',0,'Y',0,100,TO_DATE('2021-04-27 17:51:36','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2021-04-27 17:51:36','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/04/2021 17:51:36 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000139 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- 27/04/2021 17:51:37 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,UpdatedBy,AD_Client_ID,Updated,Created,CreatedBy,IsActive) VALUES (1,'N',200000,'Y',1000000,1000000,'N','Y',3001091,'Table C_DocType_CAI','C_DocType_CAI',0,100,0,TO_DATE('2021-04-27 17:51:36','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-04-27 17:51:36','YYYY-MM-DD HH24:MI:SS'),100,'Y')
;

-- 27/04/2021 17:51:44 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001103,'C_DocType_CAI_ID','LAR','Autorizaciones CAI','Autorizaciones CAI',0,TO_DATE('2021-04-27 17:51:44','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-04-27 17:51:44','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 27/04/2021 17:51:44 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001103 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 27/04/2021 17:51:44 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003704,3000139,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3001103,'N','N','N','Autorizaciones CAI','C_DocType_CAI_ID',100,TO_DATE('2021-04-27 17:51:44','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2021-04-27 17:51:44','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 17:51:44 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003704 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/04/2021 17:51:45 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003705,3000139,'LAR',0,'Y','N','N','The Document Type determines document sequence and processing rules','N',10,'N',19,'N',196,'N','Y','N','Document type or rules','Document Type','C_DocType_ID',100,TO_DATE('2021-04-27 17:51:44','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2021-04-27 17:51:44','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 17:51:45 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003705 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/04/2021 17:51:45 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003706,3000139,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,TO_DATE('2021-04-27 17:51:45','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2021-04-27 17:51:45','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 17:51:45 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003706 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/04/2021 17:51:45 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003707,3000139,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',100,TO_DATE('2021-04-27 17:51:45','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2021-04-27 17:51:45','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 17:51:45 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003707 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/04/2021 17:51:45 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003708,3000139,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,TO_DATE('2021-04-27 17:51:45','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2021-04-27 17:51:45','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 17:51:45 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003708 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/04/2021 17:51:46 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003709,3000139,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,TO_DATE('2021-04-27 17:51:45','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2021-04-27 17:51:45','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 17:51:46 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003709 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/04/2021 17:51:46 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003710,3000139,'LAR',0,110,'Y','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,TO_DATE('2021-04-27 17:51:46','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2021-04-27 17:51:46','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 17:51:46 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003710 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/04/2021 17:51:46 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003711,3000139,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,TO_DATE('2021-04-27 17:51:46','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2021-04-27 17:51:46','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 17:51:46 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003711 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/04/2021 17:51:46 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003712,3000139,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,TO_DATE('2021-04-27 17:51:46','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2021-04-27 17:51:46','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 17:51:46 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003712 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/04/2021 17:51:46 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001104,'cantidad_autorizada','LAR','cantidad_autorizada','cantidad_autorizada',0,TO_DATE('2021-04-27 17:51:46','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-04-27 17:51:46','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 27/04/2021 17:51:46 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001104 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 27/04/2021 17:51:47 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003713,3000139,'LAR',0,'Y','N','N','N',10,'N',11,'N',3001104,'N','Y','N','cantidad_autorizada','cantidad_autorizada',100,TO_DATE('2021-04-27 17:51:46','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2021-04-27 17:51:46','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 17:51:47 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003713 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/04/2021 17:51:47 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001105,'nro_desde','LAR','nro_desde','nro_desde',0,TO_DATE('2021-04-27 17:51:47','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-04-27 17:51:47','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 27/04/2021 17:51:47 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001105 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 27/04/2021 17:51:47 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003714,3000139,'LAR',0,'Y','N','N','N',10,'N',11,'N',3001105,'N','Y','N','nro_desde','nro_desde',100,TO_DATE('2021-04-27 17:51:47','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2021-04-27 17:51:47','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 17:51:47 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003714 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/04/2021 17:51:47 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001106,'nro_hasta','LAR','nro_hasta','nro_hasta',0,TO_DATE('2021-04-27 17:51:47','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-04-27 17:51:47','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 27/04/2021 17:51:47 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001106 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 27/04/2021 17:51:47 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003715,3000139,'LAR',0,'Y','N','N','N',10,'N',11,'N',3001106,'N','Y','N','nro_hasta','nro_hasta',100,TO_DATE('2021-04-27 17:51:47','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2021-04-27 17:51:47','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 17:51:47 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003715 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/04/2021 17:51:48 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003716,3000139,'LAR',0,'Y','N','N','N',12,'N',10,'N',3000017,'N','Y','N','CAI','CAI',100,TO_DATE('2021-04-27 17:51:47','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2021-04-27 17:51:47','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 17:51:48 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003716 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/04/2021 17:51:48 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001107,'fecha_vencimiento','LAR','fecha_vencimiento','fecha_vencimiento',0,TO_DATE('2021-04-27 17:51:48','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-04-27 17:51:48','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 27/04/2021 17:51:48 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001107 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 27/04/2021 17:51:48 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003717,3000139,'LAR',0,'Y','N','N','N',29,'N',16,'N',3001107,'N','Y','N','fecha_vencimiento','fecha_vencimiento',100,TO_DATE('2021-04-27 17:51:48','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2021-04-27 17:51:48','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 17:51:48 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003717 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/04/2021 17:52:30 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Element SET ColumnName='Cantidad_Autorizada', Name='Cantidad_Autorizada', PrintName='Cantidad_Autorizada',Updated=TO_DATE('2021-04-27 17:52:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001104
;

-- 27/04/2021 17:52:30 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001104
;

-- 27/04/2021 17:52:30 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Column SET ColumnName='Cantidad_Autorizada', Name='Cantidad_Autorizada', Description=NULL, Help=NULL WHERE AD_Element_ID=3001104
;

-- 27/04/2021 17:52:30 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Process_Para SET ColumnName='Cantidad_Autorizada', Name='Cantidad_Autorizada', Description=NULL, Help=NULL, AD_Element_ID=3001104 WHERE UPPER(ColumnName)='CANTIDAD_AUTORIZADA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 27/04/2021 17:52:30 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Process_Para SET ColumnName='Cantidad_Autorizada', Name='Cantidad_Autorizada', Description=NULL, Help=NULL WHERE AD_Element_ID=3001104 AND IsCentrallyMaintained='Y'
;

-- 27/04/2021 17:52:30 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Field SET Name='Cantidad_Autorizada', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001104) AND IsCentrallyMaintained='Y'
;

-- 27/04/2021 17:52:30 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_PrintFormatItem pi SET PrintName='Cantidad_Autorizada', Name='Cantidad_Autorizada' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001104)
;

-- 27/04/2021 17:52:57 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Cantidad Autorizada',PrintName='Cantidad Autorizada',Description='Cantidad de comprobantes autorizados',Updated=TO_DATE('2021-04-27 17:52:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001104 AND AD_Language='es_AR'
;

-- 27/04/2021 17:53:36 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Element SET ColumnName='Nro_Desde', Name='Nro_Desde', PrintName='Nro_Desde',Updated=TO_DATE('2021-04-27 17:53:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001105
;

-- 27/04/2021 17:53:36 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001105
;

-- 27/04/2021 17:53:36 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Column SET ColumnName='Nro_Desde', Name='Nro_Desde', Description=NULL, Help=NULL WHERE AD_Element_ID=3001105
;

-- 27/04/2021 17:53:36 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Process_Para SET ColumnName='Nro_Desde', Name='Nro_Desde', Description=NULL, Help=NULL, AD_Element_ID=3001105 WHERE UPPER(ColumnName)='NRO_DESDE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 27/04/2021 17:53:36 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Process_Para SET ColumnName='Nro_Desde', Name='Nro_Desde', Description=NULL, Help=NULL WHERE AD_Element_ID=3001105 AND IsCentrallyMaintained='Y'
;

-- 27/04/2021 17:53:36 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Field SET Name='Nro_Desde', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001105) AND IsCentrallyMaintained='Y'
;

-- 27/04/2021 17:53:36 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_PrintFormatItem pi SET PrintName='Nro_Desde', Name='Nro_Desde' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001105)
;

-- 27/04/2021 17:53:49 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Nro. Desde',PrintName='Nro. Desde',Updated=TO_DATE('2021-04-27 17:53:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001105 AND AD_Language='es_AR'
;

-- 27/04/2021 17:54:11 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Element SET ColumnName='Nro_Hasta', Name='Nro_Hasta', PrintName='Nro_Hasta',Updated=TO_DATE('2021-04-27 17:54:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001106
;

-- 27/04/2021 17:54:11 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001106
;

-- 27/04/2021 17:54:11 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Column SET ColumnName='Nro_Hasta', Name='Nro_Hasta', Description=NULL, Help=NULL WHERE AD_Element_ID=3001106
;

-- 27/04/2021 17:54:11 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Process_Para SET ColumnName='Nro_Hasta', Name='Nro_Hasta', Description=NULL, Help=NULL, AD_Element_ID=3001106 WHERE UPPER(ColumnName)='NRO_HASTA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 27/04/2021 17:54:11 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Process_Para SET ColumnName='Nro_Hasta', Name='Nro_Hasta', Description=NULL, Help=NULL WHERE AD_Element_ID=3001106 AND IsCentrallyMaintained='Y'
;

-- 27/04/2021 17:54:11 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Field SET Name='Nro_Hasta', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001106) AND IsCentrallyMaintained='Y'
;

-- 27/04/2021 17:54:11 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_PrintFormatItem pi SET PrintName='Nro_Hasta', Name='Nro_Hasta' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001106)
;

-- 27/04/2021 17:54:30 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Nro. Hasta',PrintName='Nro. Hasta',Updated=TO_DATE('2021-04-27 17:54:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001106 AND AD_Language='es_AR'
;

-- 27/04/2021 17:56:42 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,Help,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,Description,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('N',135,30,'Registro de Autorizaciones CAI para controloar numeración y fecha de vencimiento','N','N',3000139,3000229,'N','N','N',0,'Y','N','LAR','Autorizaciones','Registro de Autorizaciones CAI',0,0,TO_DATE('2021-04-27 17:56:42','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2021-04-27 17:56:42','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 27/04/2021 17:56:42 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000229 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 27/04/2021 17:56:54 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007016,1,'Y','N','N',3003708,'N','Y',3000229,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,TO_DATE('2021-04-27 17:56:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-04-27 17:56:54','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 17:56:54 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007016 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/04/2021 17:56:54 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007017,10,'N','N','N',3003704,'N','Y',3000229,'N','LAR','Autorizaciones CAI',100,0,TO_DATE('2021-04-27 17:56:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-04-27 17:56:54','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 17:56:54 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007017 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/04/2021 17:56:54 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007018,12,'Y','N','N',3003716,'N','Y',3000229,'N','LAR','CAI',100,0,TO_DATE('2021-04-27 17:56:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-04-27 17:56:54','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 17:56:54 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007018 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/04/2021 17:56:54 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007019,10,'Y','N','N',3003713,'N','Y',3000229,'N','LAR','Cantidad_Autorizada',100,0,TO_DATE('2021-04-27 17:56:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-04-27 17:56:54','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 17:56:54 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007019 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/04/2021 17:56:55 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007020,10,'Y','N','N',3003706,'N','Y',3000229,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,TO_DATE('2021-04-27 17:56:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-04-27 17:56:54','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 17:56:55 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007020 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/04/2021 17:56:55 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007021,10,'Y','N','N',3003705,'N','Y',3000229,'N','The Document Type determines document sequence and processing rules','LAR','Document type or rules','Document Type',100,0,TO_DATE('2021-04-27 17:56:55','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-04-27 17:56:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 17:56:55 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007021 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/04/2021 17:56:55 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007022,29,'Y','N','N',3003717,'N','Y',3000229,'N','LAR','fecha_vencimiento',100,0,TO_DATE('2021-04-27 17:56:55','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-04-27 17:56:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 17:56:55 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007022 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/04/2021 17:56:55 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007023,10,'Y','N','N',3003714,'N','Y',3000229,'N','LAR','Nro_Desde',100,0,TO_DATE('2021-04-27 17:56:55','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-04-27 17:56:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 17:56:55 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007023 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/04/2021 17:56:55 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007024,10,'Y','N','N',3003715,'N','Y',3000229,'N','LAR','Nro_Hasta',100,0,TO_DATE('2021-04-27 17:56:55','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-04-27 17:56:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 17:56:55 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007024 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/04/2021 17:56:56 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007025,10,'Y','N','N',3003707,'N','Y',3000229,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,TO_DATE('2021-04-27 17:56:55','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-04-27 17:56:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 17:56:56 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007025 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/04/2021 17:57:59 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3007020
;

-- 27/04/2021 17:57:59 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3007025
;

-- 27/04/2021 17:57:59 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3007021
;

-- 27/04/2021 17:57:59 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3007016
;

-- 27/04/2021 17:57:59 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3007019
;

-- 27/04/2021 17:57:59 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3007023
;

-- 27/04/2021 17:57:59 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3007024
;

-- 27/04/2021 17:57:59 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3007022
;

-- 27/04/2021 17:57:59 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3007018
;

-- 27/04/2021 17:58:18 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2021-04-27 17:58:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007025
;

-- 27/04/2021 17:58:22 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2021-04-27 17:58:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007016
;

-- 27/04/2021 17:58:27 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2021-04-27 17:58:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007024
;

-- 27/04/2021 17:58:38 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2021-04-27 17:58:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007018
;

-- 27/04/2021 23:20:31 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Tab SET TabLevel=1,Updated=TO_DATE('2021-04-27 23:20:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000229
;

-- 27/04/2021 23:25:20 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Column SET IsParent='Y', IsUpdateable='N',Updated=TO_DATE('2021-04-27 23:25:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003705
;

-- 27/04/2021 23:28:28 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Field SET DisplayLength=14,Updated=TO_DATE('2021-04-27 23:28:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007022
;

-- 27/04/2021 23:28:44 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Column SET FieldLength=7, AD_Reference_ID=15,Updated=TO_DATE('2021-04-27 23:28:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003717
;

-- 27/04/2021 23:30:21 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Column SET VFormat='000000000000',Updated=TO_DATE('2021-04-27 23:30:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003716
;


-- C_Doctype EsAutoimpresor
-- 27/04/2021 23:13:21 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001108,'esautoimpresor','LAR','esautoimpresor','esautoimpresor',0,TO_DATE('2021-04-27 23:13:20','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-04-27 23:13:20','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 27/04/2021 23:13:21 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001108 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 27/04/2021 23:13:21 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003726,217,'LAR',0,'Y','N','N','N',1,'N',20,'N',3001108,'N','Y','N','esautoimpresor','esautoimpresor',100,TO_DATE('2021-04-27 23:13:20','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2021-04-27 23:13:20','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 23:13:21 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003726 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/04/2021 23:13:42 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Element SET ColumnName='EsAutoimpresor', Name='EsAutoimpresor', PrintName='EsAutoimpresor',Updated=TO_DATE('2021-04-27 23:13:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001108
;

-- 27/04/2021 23:13:42 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001108
;

-- 27/04/2021 23:13:42 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Column SET ColumnName='EsAutoimpresor', Name='EsAutoimpresor', Description=NULL, Help=NULL WHERE AD_Element_ID=3001108
;

-- 27/04/2021 23:13:42 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Process_Para SET ColumnName='EsAutoimpresor', Name='EsAutoimpresor', Description=NULL, Help=NULL, AD_Element_ID=3001108 WHERE UPPER(ColumnName)='ESAUTOIMPRESOR' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 27/04/2021 23:13:42 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Process_Para SET ColumnName='EsAutoimpresor', Name='EsAutoimpresor', Description=NULL, Help=NULL WHERE AD_Element_ID=3001108 AND IsCentrallyMaintained='Y'
;

-- 27/04/2021 23:13:42 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Field SET Name='EsAutoimpresor', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001108) AND IsCentrallyMaintained='Y'
;

-- 27/04/2021 23:13:42 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_PrintFormatItem pi SET PrintName='EsAutoimpresor', Name='EsAutoimpresor' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001108)
;

-- 27/04/2021 23:14:20 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Es Autoimpresor',PrintName='Es Autoimpresor',Description='El cliente está habilitado para solicitar autorizaciones de impresión CAI.',Updated=TO_DATE('2021-04-27 23:14:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001108 AND AD_Language='es_AR'
;

-- 27/04/2021 23:14:49 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007034,1,'Y','N','N',3003726,'N','Y',167,'N','LAR','EsAutoimpresor',100,0,TO_DATE('2021-04-27 23:14:49','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-04-27 23:14:49','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/04/2021 23:14:49 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007034 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/04/2021 23:15:07 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2021-04-27 23:15:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007034
;

-- 30/04/2021 14:05:57 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003727,319,'LAR',0,'N','N','N','N',12,'N',10,'N',3000017,'N','Y','N','CAI','CAI',100,TO_DATE('2021-04-30 14:05:57','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2021-04-30 14:05:57','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/04/2021 14:05:57 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003727 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 30/04/2021 14:06:22 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007035,12,'Y','N','N',3003727,'N','Y',257,'N','LAR','CAI',100,0,TO_DATE('2021-04-30 14:06:21','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-04-30 14:06:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/04/2021 14:06:22 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007035 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/04/2021 14:06:22 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007036,20,'Y','N','N',59044,'N','Y',257,'N','The ProcessedOn Date+Time save the exact moment (nanoseconds precision if allowed by the DB) when a document has been processed.','D','The date+time (expressed in decimal format) when the document has been processed','Processed On',100,0,TO_DATE('2021-04-30 14:06:22','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-04-30 14:06:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/04/2021 14:06:22 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007036 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/04/2021 14:06:22 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007037,22,'Y','N','N',55303,'N','Y',257,'N','D','ID of document reversal','Reversal ID',100,0,TO_DATE('2021-04-30 14:06:22','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-04-30 14:06:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/04/2021 14:06:22 ART
-- ISSUE #141: Autoimpresor Remitos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007037 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/04/2021 14:06:39 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007036
;

-- 30/04/2021 14:06:40 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007037
;

-- 30/04/2021 14:06:40 ART
-- ISSUE #141: Autoimpresor Remitos
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3007035
;

-- Registración de script
SELECT register_migration_script_lar('0170_ISSUE-141.sql', 'LAR', '') FROM dual
;
