ALTER TABLE C_Remuneration
ADD COLUMN generarmovimientos character(1)
ADD COLUMN c_period_id numeric(10,0) NOT NULL;

CREATE TABLE LAR_Registro_Remuneraciones (
    LAR_Registro_Remuneraciones_ID numeric(10,0) NOT NULL,
    ad_client_id numeric(10,0) NOT NULL,
    ad_org_id numeric(10,0) NOT NULL,
    isactive character(1) DEFAULT 'Y'::bpchar NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdby numeric(10,0) NOT NULL,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    updatedby numeric(10,0) NOT NULL,
    issotrx character(1) DEFAULT 'N'::bpchar NOT NULL,
    ismanual character(1) DEFAULT 'Y'::bpchar NOT NULL,
    processed character(1) DEFAULT 'N'::bpchar NOT NULL,
    description character varying(255),
    C_Remuneration_ID numeric(10,0) NOT NULL,
    c_period_id numeric(10,0) NOT NULL,  
    c_bpartner_id numeric(10,0) NOT NULL,
    importe numeric DEFAULT 0 NOT NULL,
    CONSTRAINT LARRegistroRem_isactive_check CHECK ((isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    CONSTRAINT LARRegistroRem_issotrx_check CHECK ((issotrx = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    CONSTRAINT LARRegistroRem_ismanual_check CHECK ((ismanual = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    CONSTRAINT LARRegistroRem_processed_check CHECK ((processed = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
    CONSTRAINT LARRegistroRem_adorg FOREIGN KEY (ad_org_id) REFERENCES adempiere.ad_org(ad_org_id) DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT LARRegistroRem_cbpartner FOREIGN KEY (c_bpartner_id) REFERENCES adempiere.c_bpartner(c_bpartner_id) DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT LARRegistroRem_cperiod FOREIGN KEY (c_period_id) REFERENCES adempiere.c_period(c_period_id) DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT CUserRemuneration_LARRegistroRem FOREIGN KEY (c_userremuneration_id) REFERENCES adempiere.c_userremuneration(c_userremuneration_id) DEFERRABLE INITIALLY DEFERRED
;

-- Evitar que se genere movimiento con mismo periodo, empleado y tipo de remuneración. (Ver como manejar las "Desactivaciones")
CREATE UNIQUE INDEX LARRegistroRem_periodo ON adempiere.gl_journal USING btree (C_Remuneration_ID, c_period_id, c_bpartner_id) WHERE (isactive = 'Y'::bpchar AND IsManual = 'N');

CREATE INDEX LARRegistroRem_idx_bpartner ON LAR_Registro_Remuneraciones USING btree (c_bpartner_id);

CREATE INDEX LARRegistroRem_idx_c_userrem ON LAR_Registro_Remuneraciones USING btree (c_userremuneration_id);


-- 21/03/2022 9:07:23 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,ImportTable,IsHighVolume,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','3',0,3000176,'N','N','N','N','N','LAR','Y','Y','L','LAR_Registro_Remuneraciones','LAR_Registro_Remuneraciones',0,'Y',0,100,TO_DATE('2022-03-21 09:07:22','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2022-03-21 09:07:22','YYYY-MM-DD HH24:MI:SS'))
;

-- 21/03/2022 9:07:23 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000176 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- 21/03/2022 9:07:23 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,UpdatedBy,AD_Client_ID,Updated,Created,CreatedBy,IsActive) VALUES (1,'N',200000,'Y',1000000,1000000,'N','Y',3001277,'Table LAR_Registro_Remuneraciones','LAR_Registro_Remuneraciones',0,100,0,TO_DATE('2022-03-21 09:07:23','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-03-21 09:07:23','YYYY-MM-DD HH24:MI:SS'),100,'Y')
;

-- 21/03/2022 9:07:36 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001240,'LAR_Registro_Remuneraciones_ID','LAR','LAR_Registro_Remuneraciones','LAR_Registro_Remuneraciones',0,TO_DATE('2022-03-21 09:07:36','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-03-21 09:07:36','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 21/03/2022 9:07:36 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001240 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 21/03/2022 9:07:36 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004438,3000176,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3001240,'N','N','N','LAR_Registro_Remuneraciones','LAR_Registro_Remuneraciones_ID',100,TO_DATE('2022-03-21 09:07:36','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2022-03-21 09:07:36','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/03/2022 9:07:36 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004438 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/03/2022 9:07:36 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004439,3000176,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,TO_DATE('2022-03-21 09:07:36','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2022-03-21 09:07:36','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/03/2022 9:07:36 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004439 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/03/2022 9:07:36 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004440,3000176,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',100,TO_DATE('2022-03-21 09:07:36','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2022-03-21 09:07:36','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/03/2022 9:07:36 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004440 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/03/2022 9:07:36 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004441,3000176,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,TO_DATE('2022-03-21 09:07:36','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2022-03-21 09:07:36','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/03/2022 9:07:36 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004441 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/03/2022 9:07:37 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004442,3000176,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,TO_DATE('2022-03-21 09:07:36','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2022-03-21 09:07:36','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/03/2022 9:07:37 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004442 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/03/2022 9:07:37 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004443,3000176,'LAR',0,110,'Y','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,TO_DATE('2022-03-21 09:07:37','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2022-03-21 09:07:37','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/03/2022 9:07:37 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004443 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/03/2022 9:07:37 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004444,3000176,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,TO_DATE('2022-03-21 09:07:37','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2022-03-21 09:07:37','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/03/2022 9:07:37 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004444 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/03/2022 9:07:37 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004445,3000176,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,TO_DATE('2022-03-21 09:07:37','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2022-03-21 09:07:37','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/03/2022 9:07:37 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004445 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/03/2022 9:07:38 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004446,3000176,'LAR',0,'Y','N','N','The Sales Transaction checkbox indicates if this item is a Sales Transaction.','N',1,'N',20,'N',1106,'N','Y','N','This is a Sales Transaction','Sales Transaction','IsSOTrx',100,TO_DATE('2022-03-21 09:07:37','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2022-03-21 09:07:37','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/03/2022 9:07:38 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004446 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/03/2022 9:07:39 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004447,3000176,'LAR',0,'Y','N','N','The Manual check box indicates if the process will done manually.','N',1,'N',20,'N',1474,'N','Y','N','This is a manual process','Manual','IsManual',100,TO_DATE('2022-03-21 09:07:38','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2022-03-21 09:07:38','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/03/2022 9:07:39 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004447 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/03/2022 9:07:39 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004448,3000176,'LAR',0,'Y','N','N','The Processed checkbox indicates that a document has been processed.','N',1,'N',20,'N',1047,'N','Y','N','The document has been processed','Processed','Processed',100,TO_DATE('2022-03-21 09:07:39','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2022-03-21 09:07:39','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/03/2022 9:07:39 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004448 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/03/2022 9:07:39 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004449,3000176,'LAR',0,'N','N','N','A description is limited to 255 characters.','N',255,'Y',10,'N',275,'N','Y','N','Optional short description of the record','Description','Description',100,TO_DATE('2022-03-21 09:07:39','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2022-03-21 09:07:39','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/03/2022 9:07:39 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004449 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/03/2022 9:07:39 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004450,3000176,'LAR',0,'Y','N','N','N',10,'N',19,'N',2764,'N','Y','N','Wage or Salary','Remuneration','C_Remuneration_ID',100,TO_DATE('2022-03-21 09:07:39','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2022-03-21 09:07:39','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/03/2022 9:07:39 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004450 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/03/2022 9:07:39 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004451,3000176,'LAR',0,'Y','N','N','The Period indicates an exclusive range of dates for a calendar.','N',10,'N',19,'N',206,'N','Y','N','Period of the Calendar','Period','C_Period_ID',100,TO_DATE('2022-03-21 09:07:39','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2022-03-21 09:07:39','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/03/2022 9:07:39 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004451 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/03/2022 9:07:39 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004452,3000176,'LAR',0,'Y','N','N','A Business Partner is anyone with whom you transact.  This can include Vendor, Customer, Employee or Salesperson','N',10,'N',19,'N',187,'N','Y','N','Identifies a Business Partner','Business Partner ','C_BPartner_ID',100,TO_DATE('2022-03-21 09:07:39','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2022-03-21 09:07:39','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/03/2022 9:07:39 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004452 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/03/2022 9:07:40 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001241,'importe','LAR','importe','importe',0,TO_DATE('2022-03-21 09:07:39','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-03-21 09:07:39','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 21/03/2022 9:07:40 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001241 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 21/03/2022 9:07:40 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004453,3000176,'LAR',0,'Y','N','N','N',131089,'N',22,'N',3001241,'N','Y','N','importe','importe',100,TO_DATE('2022-03-21 09:07:39','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2022-03-21 09:07:39','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/03/2022 9:07:40 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004453 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/03/2022 9:08:33 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Element SET ColumnName='Importe', Name='Importe', PrintName='Importe',Updated=TO_DATE('2022-03-21 09:08:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001241
;

-- 21/03/2022 9:08:33 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001241
;

-- 21/03/2022 9:08:33 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Column SET ColumnName='Importe', Name='Importe', Description=NULL, Help=NULL WHERE AD_Element_ID=3001241
;

-- 21/03/2022 9:08:33 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Process_Para SET ColumnName='Importe', Name='Importe', Description=NULL, Help=NULL, AD_Element_ID=3001241 WHERE UPPER(ColumnName)='IMPORTE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 21/03/2022 9:08:33 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Process_Para SET ColumnName='Importe', Name='Importe', Description=NULL, Help=NULL WHERE AD_Element_ID=3001241 AND IsCentrallyMaintained='Y'
;

-- 21/03/2022 9:08:33 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Field SET Name='Importe', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001241) AND IsCentrallyMaintained='Y'
;

-- 21/03/2022 9:08:33 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_PrintFormatItem pi SET PrintName='Importe', Name='Importe' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001241)
;

-- 21/03/2022 9:08:36 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Importe',PrintName='Importe',Updated=TO_DATE('2022-03-21 09:08:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001241 AND AD_Language='es_AR'
;

-- 21/03/2022 9:08:42 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Column SET AD_Reference_ID=12, Name='Importe', ColumnName='Importe',Updated=TO_DATE('2022-03-21 09:08:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004453
;

-- 21/03/2022 9:09:22 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001242,'generarmovimientos','LAR','generarmovimientos','generarmovimientos',0,TO_DATE('2022-03-21 09:09:22','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-03-21 09:09:22','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 21/03/2022 9:09:22 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001242 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 21/03/2022 9:09:22 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004454,792,'LAR',0,'N','N','N','N',1,'N',20,'N',3001242,'N','Y','N','generarmovimientos','generarmovimientos',100,TO_DATE('2022-03-21 09:09:22','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2022-03-21 09:09:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/03/2022 9:09:22 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004454 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/03/2022 9:09:23 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004455,792,'LAR',0,'N','N','N','The Period indicates an exclusive range of dates for a calendar.','N',131089,'N',19,'N',206,'N','Y','N','Period of the Calendar','Period','C_Period_ID',100,TO_DATE('2022-03-21 09:09:22','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2022-03-21 09:09:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/03/2022 9:09:23 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004455 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/03/2022 9:09:56 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Element SET ColumnName='GenerarMovimientos', Name='GenerarMovimientos', PrintName='GenerarMovimientos',Updated=TO_DATE('2022-03-21 09:09:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001242
;

-- 21/03/2022 9:09:56 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001242
;

-- 21/03/2022 9:09:56 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Column SET ColumnName='GenerarMovimientos', Name='GenerarMovimientos', Description=NULL, Help=NULL WHERE AD_Element_ID=3001242
;

-- 21/03/2022 9:09:56 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Process_Para SET ColumnName='GenerarMovimientos', Name='GenerarMovimientos', Description=NULL, Help=NULL, AD_Element_ID=3001242 WHERE UPPER(ColumnName)='GENERARMOVIMIENTOS' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 21/03/2022 9:09:56 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Process_Para SET ColumnName='GenerarMovimientos', Name='GenerarMovimientos', Description=NULL, Help=NULL WHERE AD_Element_ID=3001242 AND IsCentrallyMaintained='Y'
;

-- 21/03/2022 9:09:56 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Field SET Name='GenerarMovimientos', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001242) AND IsCentrallyMaintained='Y'
;

-- 21/03/2022 9:09:56 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_PrintFormatItem pi SET PrintName='GenerarMovimientos', Name='GenerarMovimientos' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001242)
;

-- 21/03/2022 9:10:05 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Generar Movimientos',PrintName='Generar Movimientos',Updated=TO_DATE('2022-03-21 09:10:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001242 AND AD_Language='es_AR'
;

-- 21/03/2022 9:10:32 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Column SET AD_Reference_ID=28, Name='GenerarMovimientos', ColumnName='GenerarMovimientos',Updated=TO_DATE('2022-03-21 09:10:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004454
;

-- 21/03/2022 9:13:17 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Process (Help,AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Classname,CopyFromProcess,Description,Value,Name,AD_Org_ID,AD_Client_ID,UpdatedBy,Created,CreatedBy,Updated,IsActive) VALUES ('Al iniciar el proceso, se generarán los movimientos de sueldos según el detalle por empleado y período seleccionado.',3000467,'N','N','3','N','N','Y','LAR',22781,279,'ar.com.ergio.process.LAR_GenerarMovimientosSueldos','N','Genera los movimienbtos de los sueldos para el periodo seleccionado.','4000000','Generar Movimientos de Sueldos',0,0,100,TO_DATE('2022-03-21 09:13:16','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2022-03-21 09:13:16','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 21/03/2022 9:13:17 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000467 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 21/03/2022 9:13:31 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Process SET Value='Generar Movimientos de Sueldos',Updated=TO_DATE('2022-03-21 09:13:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000467
;

-- 21/03/2022 9:15:14 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Window (AD_Window_ID,WindowType,IsSOTrx,IsDefault,IsBetaFunctionality,WinHeight,WinWidth,EntityType,Name,Description,IsActive,Created,UpdatedBy,CreatedBy,Updated,AD_Org_ID,AD_Client_ID,Processing) VALUES (3000118,'M','Y','N','N',0,0,'LAR','Movimientos Remuneraciones','Registro de remuneraciones por período y empleado.','Y',TO_DATE('2022-03-21 09:15:14','YYYY-MM-DD HH24:MI:SS'),100,100,TO_DATE('2022-03-21 09:15:14','YYYY-MM-DD HH24:MI:SS'),0,0,'N')
;

-- 21/03/2022 9:15:14 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Window_Trl (AD_Language,AD_Window_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Window_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Window t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Window_ID=3000118 AND NOT EXISTS (SELECT * FROM AD_Window_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Window_ID=t.AD_Window_ID)
;

-- 21/03/2022 9:16:36 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('N',3000118,10,'N','N',3000176,3000253,'N','N','N','N',0,'Y','N','LAR','Movimientos',0,0,TO_DATE('2022-03-21 09:16:36','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2022-03-21 09:16:36','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 21/03/2022 9:16:36 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000253 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 21/03/2022 9:16:40 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007758,1,'Y','N','N',3004441,'N','Y',3000253,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,TO_DATE('2022-03-21 09:16:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2022-03-21 09:16:40','YYYY-MM-DD HH24:MI:SS'))
;

-- 21/03/2022 9:16:40 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007758 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/03/2022 9:16:41 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007759,10,'Y','N','N',3004452,'N','Y',3000253,'N','A Business Partner is anyone with whom you transact.  This can include Vendor, Customer, Employee or Salesperson','LAR','Identifies a Business Partner','Business Partner ',100,0,TO_DATE('2022-03-21 09:16:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2022-03-21 09:16:40','YYYY-MM-DD HH24:MI:SS'))
;

-- 21/03/2022 9:16:41 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007759 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/03/2022 9:16:41 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007760,10,'Y','N','N',3004439,'N','Y',3000253,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,TO_DATE('2022-03-21 09:16:41','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2022-03-21 09:16:41','YYYY-MM-DD HH24:MI:SS'))
;

-- 21/03/2022 9:16:41 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007760 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/03/2022 9:16:41 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007761,255,'Y','N','N',3004449,'N','Y',3000253,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,TO_DATE('2022-03-21 09:16:41','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2022-03-21 09:16:41','YYYY-MM-DD HH24:MI:SS'))
;

-- 21/03/2022 9:16:41 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007761 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/03/2022 9:16:41 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007762,131089,'Y','N','N',3004453,'N','Y',3000253,'N','LAR','Importe',100,0,TO_DATE('2022-03-21 09:16:41','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2022-03-21 09:16:41','YYYY-MM-DD HH24:MI:SS'))
;

-- 21/03/2022 9:16:41 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007762 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/03/2022 9:16:41 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007763,10,'N','N','N',3004438,'N','Y',3000253,'N','LAR','LAR_Registro_Remuneraciones',100,0,TO_DATE('2022-03-21 09:16:41','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2022-03-21 09:16:41','YYYY-MM-DD HH24:MI:SS'))
;

-- 21/03/2022 9:16:41 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007763 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/03/2022 9:16:41 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007764,1,'Y','N','N',3004447,'N','Y',3000253,'N','The Manual check box indicates if the process will done manually.','LAR','This is a manual process','Manual',100,0,TO_DATE('2022-03-21 09:16:41','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2022-03-21 09:16:41','YYYY-MM-DD HH24:MI:SS'))
;

-- 21/03/2022 9:16:41 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007764 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/03/2022 9:16:42 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007765,10,'Y','N','N',3004440,'N','Y',3000253,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,TO_DATE('2022-03-21 09:16:41','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2022-03-21 09:16:41','YYYY-MM-DD HH24:MI:SS'))
;

-- 21/03/2022 9:16:42 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007765 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/03/2022 9:16:42 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007766,10,'Y','N','N',3004451,'N','Y',3000253,'N','The Period indicates an exclusive range of dates for a calendar.','LAR','Period of the Calendar','Period',100,0,TO_DATE('2022-03-21 09:16:42','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2022-03-21 09:16:42','YYYY-MM-DD HH24:MI:SS'))
;

-- 21/03/2022 9:16:42 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007766 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/03/2022 9:16:42 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007767,1,'Y','N','N',3004448,'N','Y',3000253,'N','The Processed checkbox indicates that a document has been processed.','LAR','The document has been processed','Processed',100,0,TO_DATE('2022-03-21 09:16:42','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2022-03-21 09:16:42','YYYY-MM-DD HH24:MI:SS'))
;

-- 21/03/2022 9:16:42 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007767 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/03/2022 9:16:42 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007768,10,'Y','N','N',3004450,'N','Y',3000253,'N','LAR','Wage or Salary','Remuneration',100,0,TO_DATE('2022-03-21 09:16:42','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2022-03-21 09:16:42','YYYY-MM-DD HH24:MI:SS'))
;

-- 21/03/2022 9:16:42 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007768 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/03/2022 9:16:42 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007769,1,'Y','N','N',3004446,'N','Y',3000253,'N','The Sales Transaction checkbox indicates if this item is a Sales Transaction.','LAR','This is a Sales Transaction','Sales Transaction',100,0,TO_DATE('2022-03-21 09:16:42','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2022-03-21 09:16:42','YYYY-MM-DD HH24:MI:SS'))
;

-- 21/03/2022 9:16:42 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007769 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/03/2022 9:17:50 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3007760
;

-- 21/03/2022 9:17:50 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3007765
;

-- 21/03/2022 9:17:50 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3007759
;

-- 21/03/2022 9:17:50 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3007758
;

-- 21/03/2022 9:17:50 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3007764
;

-- 21/03/2022 9:17:50 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3007761
;

-- 21/03/2022 9:17:50 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3007768
;

-- 21/03/2022 9:17:50 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3007766
;

-- 21/03/2022 9:17:50 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3007762
;

-- 21/03/2022 9:17:50 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3007767
;

-- 21/03/2022 9:17:50 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3007769
;

-- 21/03/2022 9:17:57 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2022-03-21 09:17:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007765
;

-- 21/03/2022 9:18:04 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2022-03-21 09:18:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007764
;

-- 21/03/2022 9:18:17 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2022-03-21 09:18:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007766
;

-- 21/03/2022 9:18:26 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2022-03-21 09:18:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007767
;

-- 21/03/2022 9:19:55 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Menu (AD_Menu_ID,IsSummary,IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000414,'Y','N','N','LAR','Y','RRHH',TO_DATE('2022-03-21 09:19:53','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_DATE('2022-03-21 09:19:53','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 21/03/2022 9:19:55 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000414 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 21/03/2022 9:19:55 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', SysDate, 100, SysDate, 100,t.AD_Tree_ID, 3000414, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000414)
;

-- 21/03/2022 9:19:59 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=0, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=218
;

-- 21/03/2022 9:19:59 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=1, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=153
;

-- 21/03/2022 9:19:59 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=2, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=263
;

-- 21/03/2022 9:19:59 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=3, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000414
;

-- 21/03/2022 9:19:59 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=4, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=166
;

-- 21/03/2022 9:19:59 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=5, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=203
;

-- 21/03/2022 9:19:59 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=6, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53242
;

-- 21/03/2022 9:19:59 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=7, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=236
;

-- 21/03/2022 9:19:59 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=8, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=183
;

-- 21/03/2022 9:19:59 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=9, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=160
;

-- 21/03/2022 9:19:59 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=10, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=278
;

-- 21/03/2022 9:19:59 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=11, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53296
;

-- 21/03/2022 9:19:59 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=12, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=345
;

-- 21/03/2022 9:19:59 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=13, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53014
;

-- 21/03/2022 9:19:59 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=14, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000000
;

-- 21/03/2022 9:19:59 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=15, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53108
;

-- 21/03/2022 9:19:59 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=16, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53066
;

-- 21/03/2022 9:19:59 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=17, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000414
;

-- 21/03/2022 9:20:17 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Menu (AD_Menu_ID,IsSummary,IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000415,'Y','N','N','LAR','Y','Remuneraciones',TO_DATE('2022-03-21 09:20:17','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_DATE('2022-03-21 09:20:17','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 21/03/2022 9:20:17 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000415 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 21/03/2022 9:20:17 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', SysDate, 100, SysDate, 100,t.AD_Tree_ID, 3000415, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000415)
;

-- 21/03/2022 9:20:25 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Menu (AD_Menu_ID,IsSummary,IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000416,'Y','N','N','LAR','Y','Vacaciones',TO_DATE('2022-03-21 09:20:25','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_DATE('2022-03-21 09:20:25','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 21/03/2022 9:20:25 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000416 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 21/03/2022 9:20:25 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', SysDate, 100, SysDate, 100,t.AD_Tree_ID, 3000416, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000416)
;

-- 21/03/2022 9:20:28 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=3000414, SeqNo=0, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000415
;

-- 21/03/2022 9:20:31 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=3000414, SeqNo=0, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000416
;

-- 21/03/2022 9:20:31 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=3000414, SeqNo=1, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000415
;

-- 21/03/2022 9:21:01 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Menu (AD_Menu_ID,IsSummary,IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000417,'Y','N','N','LAR','Y','Movimientos Remuneraciones',TO_DATE('2022-03-21 09:21:01','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_DATE('2022-03-21 09:21:01','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 21/03/2022 9:21:01 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000417 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 21/03/2022 9:21:01 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', SysDate, 100, SysDate, 100,t.AD_Tree_ID, 3000417, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000417)
;

-- 21/03/2022 9:21:19 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Menu SET AD_Window_ID=3000118, IsSummary='N', Action='W',Updated=TO_DATE('2022-03-21 09:21:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=3000417
;

-- 21/03/2022 9:21:25 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=3000415, SeqNo=0, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000417
;

-- 21/03/2022 9:21:37 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=3000415, SeqNo=0, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=532
;

-- 21/03/2022 9:21:37 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=3000415, SeqNo=1, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000417
;

-- 21/03/2022 9:26:50 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Process SET Value='LAR_Generar_Movimientos_Sueldos',Updated=TO_DATE('2022-03-21 09:26:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000467
;

-- 21/03/2022 9:26:59 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Column SET AD_Process_ID=3000467,Updated=TO_DATE('2022-03-21 09:26:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004454
;

-- 21/03/2022 9:27:36 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Table SET AD_Window_ID=3000118,Updated=TO_DATE('2022-03-21 09:27:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000176
;

-- 21/03/2022 9:28:08 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Table SET PO_Window_ID=3000118,Updated=TO_DATE('2022-03-21 09:28:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000176
;

-- 21/03/2022 9:30:25 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007770,1,'Y','N','N',3004454,'N','Y',725,'N','LAR','GenerarMovimientos',100,0,TO_DATE('2022-03-21 09:30:25','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2022-03-21 09:30:25','YYYY-MM-DD HH24:MI:SS'))
;

-- 21/03/2022 9:30:25 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007770 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/03/2022 9:30:27 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007771,131089,'Y','N','N',3004455,'N','Y',725,'N','The Period indicates an exclusive range of dates for a calendar.','LAR','Period of the Calendar','Period',100,0,TO_DATE('2022-03-21 09:30:25','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2022-03-21 09:30:25','YYYY-MM-DD HH24:MI:SS'))
;

-- 21/03/2022 9:30:27 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007771 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/03/2022 9:30:37 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3007771
;

-- 21/03/2022 9:30:37 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3007770
;

-- 21/03/2022 9:30:43 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2022-03-21 09:30:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007770
;

-- 21/03/2022 9:31:50 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Column SET FieldLength=22,Updated=TO_DATE('2022-03-21 09:31:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004455
;

-- 21/03/2022 10:32:31 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,DefaultValue,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000780,0,3000467,100,'N',20,10,'N','N','LAR','Generar_SAC','Generar_SAC','Y',0,100,TO_DATE('2022-03-21 10:32:30','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-03-21 10:32:30','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 21/03/2022 10:32:31 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000780 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 21/03/2022 10:32:41 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Process_Para_Trl SET IsTranslated='Y',Name='Generar SAC',Updated=TO_DATE('2022-03-21 10:32:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000780 AND AD_Language='es_AR'
;

-- 29/03/2022 9:56:41 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,AD_Client_ID,AD_Org_ID,Created,Updated,CreatedBy,UpdatedBy,IsActive) VALUES (3000081,'LAR','C','0','C_Remuneration_ID de SAC','LAR_SAC_C_Remuneration_ID',1000000,0,TO_DATE('2022-03-29 09:56:41','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-03-29 09:56:41','YYYY-MM-DD HH24:MI:SS'),100,100,'Y')
;

-- 29/03/2022 11:38:15 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Window SET IsSOTrx='N',Updated=TO_DATE('2022-03-29 11:38:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Window_ID=3000118
;

-- 29/03/2022 11:40:05 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Column SET AD_Val_Rule_ID=52012,Updated=TO_DATE('2022-03-29 11:40:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004452
;

-- 29/03/2022 11:40:43 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_DATE('2022-03-29 11:40:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004448
;

-- 29/03/2022 11:40:56 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Column SET FieldLength=22,Updated=TO_DATE('2022-03-29 11:40:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004453
;

-- 29/03/2022 11:41:15 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Field SET DisplayLength=22,Updated=TO_DATE('2022-03-29 11:41:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007762
;

-- 29/03/2022 11:41:32 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2022-03-29 11:41:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007769
;

-- 29/03/2022 11:42:25 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Column SET AD_Reference_ID=15,Updated=TO_DATE('2022-03-29 11:42:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=13855
;

-- 29/03/2022 11:42:45 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=11745
;

-- 29/03/2022 11:42:45 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=11742
;

-- 29/03/2022 11:42:45 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=11744
;

-- 29/03/2022 11:42:45 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=11749
;

-- 29/03/2022 11:42:45 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=11748
;

-- 29/03/2022 11:42:45 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=11750
;

-- 29/03/2022 11:43:13 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Tab SET IsActive='N',Updated=TO_DATE('2022-03-29 11:43:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=726
;

-- 29/03/2022 11:45:03 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,UpdatedBy,Created,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000336,346,'LAR','S','Semestral',TO_DATE('2022-03-29 11:45:02','YYYY-MM-DD HH24:MI:SS'),100,100,TO_DATE('2022-03-29 11:45:02','YYYY-MM-DD HH24:MI:SS'),0,'Y',0)
;

-- 29/03/2022 11:45:03 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000336 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 29/03/2022 11:45:41 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,UpdatedBy,Created,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000337,346,'LAR','A','Annual',TO_DATE('2022-03-29 11:45:41','YYYY-MM-DD HH24:MI:SS'),100,100,TO_DATE('2022-03-29 11:45:41','YYYY-MM-DD HH24:MI:SS'),0,'Y',0)
;

-- 29/03/2022 11:45:41 ART
-- ISSUE #155: RRHH Registro Sueldos
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000337 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 29/03/2022 11:45:46 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Ref_List_Trl SET IsTranslated='Y',Name='Anual',Updated=TO_DATE('2022-03-29 11:45:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000337 AND AD_Language='es_AR'
;

-- 29/03/2022 11:46:20 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Ref_List SET Name='Biannual',Updated=TO_DATE('2022-03-29 11:46:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000336
;

-- 29/03/2022 11:46:20 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Ref_List_Trl SET IsTranslated='N' WHERE AD_Ref_List_ID=3000336
;

-- 29/03/2022 11:46:23 ART
-- ISSUE #155: RRHH Registro Sueldos
UPDATE AD_Ref_List_Trl SET IsTranslated='Y',Updated=TO_DATE('2022-03-29 11:46:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000336 AND AD_Language='es_AR'
;

-- Registración de script
SELECT register_migration_script_lar('0207_ISSUE-155.sql', 'LAR', '') FROM dual
;
-- 03/06/2022 10:57:45 ART
--  ISSUE #155: RRHH
UPDATE AD_Element_Trl SET Name='Generar Movimientos Remuneraciones',PrintName='Generar Movimientos Remuneraciones',Updated=TO_DATE('2022-06-03 10:57:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001242 AND AD_Language='es_AR'
;

-- 03/06/2022 10:58:56 ART
--  ISSUE #155: RRHH
UPDATE AD_Process SET Help='Al iniciar el proceso, se generarán los movimientos de remuneracionesegún el detalle por empleado y período seleccionado.', Description='Genera los movimientos de remuneraciones para el periodo seleccionado.', Name='Generar Movimientos de Remuneraciones',Updated=TO_DATE('2022-06-03 10:58:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000467
;

-- 03/06/2022 10:58:56 ART
--  ISSUE #155: RRHH
UPDATE AD_Process_Trl SET IsTranslated='N' WHERE AD_Process_ID=3000467
;

-- 03/06/2022 10:59:12 ART
--  ISSUE #155: RRHH
UPDATE AD_Process SET Name='Generar Movimientos Remuneraciones',Updated=TO_DATE('2022-06-03 10:59:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000467
;

-- 03/06/2022 10:59:12 ART
--  ISSUE #155: RRHH
UPDATE AD_Process_Trl SET IsTranslated='N' WHERE AD_Process_ID=3000467
;

-- 03/06/2022 10:59:20 ART
--  ISSUE #155: RRHH
UPDATE AD_Process_Trl SET Name='Generar Movimientos Remuneraciones',Updated=TO_DATE('2022-06-03 10:59:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000467 AND AD_Language='es_AR'
;

-- 03/06/2022 10:59:36 ART
--  ISSUE #155: RRHH
UPDATE AD_Process_Trl SET Description='Genera los movimientos de remuneraciones para el periodo seleccionado.',Updated=TO_DATE('2022-06-03 10:59:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000467 AND AD_Language='es_AR'
;

-- 03/06/2022 10:59:44 ART
--  ISSUE #155: RRHH
UPDATE AD_Process_Trl SET Help='Al iniciar el proceso, se generarán los movimientos de remuneracionesegún el detalle por empleado y período seleccionado.',Updated=TO_DATE('2022-06-03 10:59:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000467 AND AD_Language='es_AR'
;

-- 03/06/2022 10:59:54 ART
--  ISSUE #155: RRHH
UPDATE AD_Process_Trl SET Help='Al iniciar el proceso, se generarán los movimientos de remuneraciones según el detalle por empleado y período seleccionado.',Updated=TO_DATE('2022-06-03 10:59:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000467 AND AD_Language='es_AR'
;

-- 03/06/2022 11:00:02 ART
--  ISSUE #155: RRHH
UPDATE AD_Process SET Help='Al iniciar el proceso, se generarán los movimientos de remuneraciones según el detalle por empleado y período seleccionado.',Updated=TO_DATE('2022-06-03 11:00:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000467
;

-- 03/06/2022 11:00:02 ART
--  ISSUE #155: RRHH
UPDATE AD_Process_Trl SET IsTranslated='N' WHERE AD_Process_ID=3000467
;

-- 03/06/2022 11:01:00 ART
--  ISSUE #155: RRHH
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=11725
;

-- 03/06/2022 11:01:00 ART
--  ISSUE #155: RRHH
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=11728
;

-- 03/06/2022 11:01:00 ART
--  ISSUE #155: RRHH
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=11720
;

-- 03/06/2022 11:01:00 ART
--  ISSUE #155: RRHH
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=11721
;

-- 03/06/2022 11:01:00 ART
--  ISSUE #155: RRHH
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=11724
;

-- 03/06/2022 11:01:00 ART
--  ISSUE #155: RRHH
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3007771
;

-- 03/06/2022 11:01:00 ART
--  ISSUE #155: RRHH
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3007770
;

-- 03/06/2022 11:01:57 ART
--  ISSUE #155: RRHH
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2022-06-03 11:01:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=11747
;

-- 03/06/2022 11:05:00 ART
--  ISSUE #155: RRHH
UPDATE AD_Field_Trl SET Name='Empleado',Description='Empleado de la empresa.',Updated=TO_DATE('2022-06-03 11:05:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=11747 AND AD_Language='es_AR'
;

-- 03/06/2022 11:09:42 ART
--  ISSUE #155: RRHH
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2022-06-03 11:09:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=11741
;

-- 03/06/2022 11:10:19 ART
--  ISSUE #155: RRHH
UPDATE AD_Field_Trl SET Name='Importe',Description='Cantidad total de la remuneración.',Help='Cantidad total del sueldo o del salario.',Updated=TO_DATE('2022-06-03 11:10:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=11741 AND AD_Language='es_AR'
;

-- 03/06/2022 11:11:06 ART
--  ISSUE #155: RRHH
UPDATE AD_Element_Trl SET Name='Importe',Description='Importe total de la remuneración.',Help='Importe total del sueldo o salario.',Updated=TO_DATE('2022-06-03 11:11:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=2767 AND AD_Language='es_AR'
;

-- 03/06/2022 11:11:23 ART
--  ISSUE #155: RRHH
UPDATE AD_Field SET IsCentrallyMaintained='Y',Updated=TO_DATE('2022-06-03 11:11:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=11741
;

-- 05/06/2022 15:20:53 ART
--  ISSUE #155: RRHH
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2022-06-05 15:20:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007769
;

-- 05/06/2022 15:22:31 ART
--  ISSUE #155: RRHH
UPDATE AD_Field_Trl SET Name='Préstamo',Description='Este movimiento no es una obligación, es un préstamo al empleado.',Help='Se pueden registrar préstamos por importe total o registrando las cuotas de forma individual en el período correspondiente que se deseen debitar.',Updated=TO_DATE('2022-06-05 15:22:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007769 AND AD_Language='es_AR'
;

-- 05/06/2022 15:22:45 ART
--  ISSUE #155: RRHH
UPDATE AD_Field SET IsReadOnly='N',Updated=TO_DATE('2022-06-05 15:22:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007769
;

-- Registración de script
SELECT register_migration_script_lar('0207_ISSUE-155.sql', 'LAR', '') FROM dual
;
