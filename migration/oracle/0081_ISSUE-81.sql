-- ISSUE #81: Retenciones
-- Se agrega la tabla que contiene los "Conceptos Sujeto a Retención"

-- REVER Tipos de Datos para ORACLE
CREATE TABLE LAR_Concepto_Ret_Ganancias 
( 
    LAR_Concepto_Ret_Ganancias_ID           numeric(10,0) NOT NULL,
    ad_client_id                            numeric(10,0) NOT NULL,
    ad_org_id                               numeric(10,0) NOT NULL,
    isactive                                character(1) NOT NULL DEFAULT 'Y'::bpchar,
    created                                 timestamp without time zone NOT NULL DEFAULT now(),
    createdby                               numeric(10,0) NOT NULL,
    updated                                 timestamp without time zone NOT NULL DEFAULT now(),
    updatedby                               numeric(10,0) NOT NULL,
    value                                   character varying(40) NOT NULL,
    name                                    character varying(255) NOT NULL,
    description                             character varying(255),
    Calculo_Por_Escala                      character(1) NOT NULL DEFAULT 'N'::bpchar,
    Alicuota_Inscripto                      numeric NOT NULL,
    Alicuota_NO_Inscripto                   numeric NOT NULL,
    Importe_No_Sujeto_Inscripto             numeric DEFAULT 0,
    Importe_No_Sujeto_No_Insc               numeric DEFAULT 0,
    Importe_Ret_Minima_Inscripto            numeric DEFAULT 0,
    Importe_Ret_Minima_No_Insc              numeric DEFAULT 0,
    CONSTRAINT LAR_Concepto_Ret_Ganancias_pkey PRIMARY KEY (LAR_Concepto_Ret_Ganancias_ID),
    CONSTRAINT LAR_Concepto_Ret_Ganancias_isactive_check CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])),
    CONSTRAINT LAR_Concepto_Ret_Ganancias_CalculoPorEscala_check CHECK (Calculo_Por_Escala = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
);

-- Indice: LAR_Concepto_Ret_Ganancias_Value
CREATE UNIQUE INDEX LAR_Concepto_Ret_Ganancias_Value
  ON LAR_Concepto_Ret_Ganancias
  USING btree
  (ad_client_id, value COLLATE pg_catalog."default");

-- Se agregan columnas relacionada que referencia el "Concepto Sujeto a Retención"
-- REVER Tipos de Datos para ORACLE
ALTER TABLE C_BPartner 
    ADD COLUMN LAR_Concepto_Ret_Ganancias_ID   numeric(10,0),
    ADD CONSTRAINT LAR_Concepto_Ret_Ganancias_ID_CBPartner FOREIGN KEY (LAR_Concepto_Ret_Ganancias_ID)
      REFERENCES LAR_Concepto_Ret_Ganancias (LAR_Concepto_Ret_Ganancias_ID) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED;


-- Se agrega la tabla que contiene la Escala
-- Se aplica "de acuerdo al código de régimen asignado al concepto que se paga".
-- REVER Tipos de Datos para ORACLE
CREATE TABLE LAR_Escala_Ret_Ganancias 
( 
    LAR_Escala_Ret_Ganancias_ID             numeric(10,0) NOT NULL,
    ad_client_id                            numeric(10,0) NOT NULL,
    ad_org_id                               numeric(10,0) NOT NULL,
    isactive                                character(1) NOT NULL DEFAULT 'Y'::bpchar,
    created                                 timestamp without time zone NOT NULL DEFAULT now(),
    createdby                               numeric(10,0) NOT NULL,
    updated                                 timestamp without time zone NOT NULL DEFAULT now(),
    updatedby                               numeric(10,0) NOT NULL,
    value                                   character varying(40) NOT NULL,
    name                                    character varying(255) NOT NULL,
    description                             character varying(255),
    Importe_Desde                           numeric DEFAULT 0,
    Importe_Hasta                           numeric DEFAULT 0,
    Importe_Fijo                            numeric DEFAULT 0,
    Alicuota                                numeric NOT NULL,
    Importe_No_Sujeto                       numeric DEFAULT 0,
    CONSTRAINT LAR_Escala_Ret_Ganancias_pkey PRIMARY KEY (LAR_Escala_Ret_Ganancias_ID)
);

-- Indice: LAR_Escala_Ret_Ganancias_Value
CREATE UNIQUE INDEX LAR_Escala_Ret_Ganancias_Value
  ON LAR_Escala_Ret_Ganancias
  USING btree
  (ad_client_id, value COLLATE pg_catalog."default");

-- Modificaciones en el DA
-- Creacion de Tablas y Ventanas correspondientes

-- 22/12/2016 10:53:50 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,IsHighVolume,ImportTable,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','3',0,3000084,'N','N','N','N','N','LAR','Y','Y','L','LAR_Concepto_Ret_Ganancias','Conceptos Retencion Ganancias',0,'Y',0,100,TO_DATE('2016-12-22 10:53:45','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 10:53:45','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/12/2016 10:53:50 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000084 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- 22/12/2016 10:53:51 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,AD_Client_ID,Updated,UpdatedBy,Created,CreatedBy,IsActive,StartNo) VALUES (1,'N',200000,'Y',1000000,'N','Y',3000331,'Table LAR_Concepto_Ret_Ganancias','LAR_Concepto_Ret_Ganancias',0,0,TO_DATE('2016-12-22 10:53:50','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 10:53:50','YYYY-MM-DD HH24:MI:SS'),100,'Y',1000000)
;

-- 22/12/2016 10:54:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000404,'LAR_Concepto_Ret_Ganancias_ID','LAR','Conceptos Retencion Ganancias','Conceptos Retencion Ganancias',0,TO_DATE('2016-12-22 10:54:05','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-12-22 10:54:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 22/12/2016 10:54:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000404 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 22/12/2016 10:54:06 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001921,3000084,'LAR',0,'Y','N','N',10,'N','N',13,'Y',3000404,'N','N','N','Conceptos Retencion Ganancias','LAR_Concepto_Ret_Ganancias_ID',100,TO_DATE('2016-12-22 10:54:05','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 10:54:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 10:54:06 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001921 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 10:54:06 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001922,3000084,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.',10,'N','N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,TO_DATE('2016-12-22 10:54:06','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 10:54:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 10:54:06 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001922 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 10:54:06 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001923,3000084,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.',10,'N','N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',100,TO_DATE('2016-12-22 10:54:06','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 10:54:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 10:54:06 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001923 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 10:54:06 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001924,3000084,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.',1,'N','N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,TO_DATE('2016-12-22 10:54:06','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 10:54:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 10:54:06 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001924 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 10:54:06 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001925,3000084,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.',29,'N','N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,TO_DATE('2016-12-22 10:54:06','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 10:54:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 10:54:06 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001925 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 10:54:07 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001926,3000084,'LAR',0,110,'Y','N','N','The Created By field indicates the user who created this record.',10,'N','N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,TO_DATE('2016-12-22 10:54:06','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 10:54:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 10:54:07 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001926 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 10:54:07 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001927,3000084,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.',29,'N','N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,TO_DATE('2016-12-22 10:54:07','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 10:54:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 10:54:07 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001927 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 10:54:07 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001928,3000084,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.',10,'N','N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,TO_DATE('2016-12-22 10:54:07','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 10:54:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 10:54:07 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001928 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 10:54:07 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001929,3000084,'LAR',0,'Y','N','N','A search key allows you a fast method of finding a particular record.
If you leave the search key empty, the system automatically creates a numeric number.  The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).',40,'N','Y',10,'N',620,'N','Y','N','Search key for the record in the format required - must be unique','Search Key','Value',100,TO_DATE('2016-12-22 10:54:07','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 10:54:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 10:54:07 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001929 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 10:54:07 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,Help,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001930,3000084,'LAR',0,'Y','N','Y',1,'The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.',255,'N','Y',10,'N',469,'N','Y','N','Alphanumeric identifier of the entity','Name','Name',100,TO_DATE('2016-12-22 10:54:07','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 10:54:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 10:54:07 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001930 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 10:54:07 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001931,3000084,'LAR',0,'N','N','N','A description is limited to 255 characters.',255,'N','Y',10,'N',275,'N','Y','N','Optional short description of the record','Description','Description',100,TO_DATE('2016-12-22 10:54:07','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 10:54:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 10:54:07 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001931 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 10:54:07 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000405,'calculo_por_escala','LAR','calculo_por_escala','calculo_por_escala',0,TO_DATE('2016-12-22 10:54:07','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-12-22 10:54:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 22/12/2016 10:54:07 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000405 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 22/12/2016 10:54:08 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001932,3000084,'LAR',0,'Y','N','N',1,'N','N',20,'N',3000405,'N','Y','N','calculo_por_escala','calculo_por_escala',100,TO_DATE('2016-12-22 10:54:07','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 10:54:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 10:54:08 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001932 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 10:54:08 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000406,'alicuota_inscripto','LAR','alicuota_inscripto','alicuota_inscripto',0,TO_DATE('2016-12-22 10:54:08','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-12-22 10:54:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 22/12/2016 10:54:08 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000406 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 22/12/2016 10:54:08 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001933,3000084,'LAR',0,'Y','N','N',131089,'N','N',22,'N',3000406,'N','Y','N','alicuota_inscripto','alicuota_inscripto',100,TO_DATE('2016-12-22 10:54:08','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 10:54:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 10:54:08 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001933 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 10:54:08 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000407,'alicuota_no_inscripto','LAR','alicuota_no_inscripto','alicuota_no_inscripto',0,TO_DATE('2016-12-22 10:54:08','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-12-22 10:54:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 22/12/2016 10:54:08 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000407 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 22/12/2016 10:54:08 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001934,3000084,'LAR',0,'Y','N','N',131089,'N','N',22,'N',3000407,'N','Y','N','alicuota_no_inscripto','alicuota_no_inscripto',100,TO_DATE('2016-12-22 10:54:08','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 10:54:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 10:54:08 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001934 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 10:54:08 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000408,'importe_no_sujeto_inscripto','LAR','importe_no_sujeto_inscripto','importe_no_sujeto_inscripto',0,TO_DATE('2016-12-22 10:54:08','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-12-22 10:54:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 22/12/2016 10:54:08 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000408 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 22/12/2016 10:54:09 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001935,3000084,'LAR',0,'N','N','N',131089,'N','N',22,'N',3000408,'N','Y','N','importe_no_sujeto_inscripto','importe_no_sujeto_inscripto',100,TO_DATE('2016-12-22 10:54:08','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 10:54:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 10:54:09 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001935 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 10:54:09 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000409,'importe_no_sujeto_no_insc','LAR','importe_no_sujeto_no_insc','importe_no_sujeto_no_insc',0,TO_DATE('2016-12-22 10:54:09','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-12-22 10:54:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 22/12/2016 10:54:09 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000409 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 22/12/2016 10:54:09 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001936,3000084,'LAR',0,'N','N','N',131089,'N','N',22,'N',3000409,'N','Y','N','importe_no_sujeto_no_insc','importe_no_sujeto_no_insc',100,TO_DATE('2016-12-22 10:54:09','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 10:54:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 10:54:09 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001936 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 10:54:09 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000410,'importe_ret_minima_inscripto','LAR','importe_ret_minima_inscripto','importe_ret_minima_inscripto',0,TO_DATE('2016-12-22 10:54:09','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-12-22 10:54:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 22/12/2016 10:54:09 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000410 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 22/12/2016 10:54:09 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001937,3000084,'LAR',0,'N','N','N',131089,'N','N',22,'N',3000410,'N','Y','N','importe_ret_minima_inscripto','importe_ret_minima_inscripto',100,TO_DATE('2016-12-22 10:54:09','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 10:54:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 10:54:09 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001937 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 10:54:09 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000411,'importe_ret_minima_no_insc','LAR','importe_ret_minima_no_insc','importe_ret_minima_no_insc',0,TO_DATE('2016-12-22 10:54:09','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-12-22 10:54:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 22/12/2016 10:54:09 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000411 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 22/12/2016 10:54:09 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001938,3000084,'LAR',0,'N','N','N',131089,'N','N',22,'N',3000411,'N','Y','N','importe_ret_minima_no_insc','importe_ret_minima_no_insc',100,TO_DATE('2016-12-22 10:54:09','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 10:54:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 10:54:09 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001938 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 10:54:34 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element SET ColumnName='Alicuota_Inscripto', Name='Alicuota_Inscripto', PrintName='Alicuota_Inscripto',Updated=TO_DATE('2016-12-22 10:54:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000406
;

-- 22/12/2016 10:54:34 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000406
;

-- 22/12/2016 10:54:34 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET ColumnName='Alicuota_Inscripto', Name='Alicuota_Inscripto', Description=NULL, Help=NULL WHERE AD_Element_ID=3000406
;

-- 22/12/2016 10:54:34 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Process_Para SET ColumnName='Alicuota_Inscripto', Name='Alicuota_Inscripto', Description=NULL, Help=NULL, AD_Element_ID=3000406 WHERE UPPER(ColumnName)='ALICUOTA_INSCRIPTO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 22/12/2016 10:54:34 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Process_Para SET ColumnName='Alicuota_Inscripto', Name='Alicuota_Inscripto', Description=NULL, Help=NULL WHERE AD_Element_ID=3000406 AND IsCentrallyMaintained='Y'
;

-- 22/12/2016 10:54:34 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET Name='Alicuota_Inscripto', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000406) AND IsCentrallyMaintained='Y'
;

-- 22/12/2016 10:54:34 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_PrintFormatItem pi SET PrintName='Alicuota_Inscripto', Name='Alicuota_Inscripto' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000406)
;

-- 22/12/2016 10:54:45 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Alicuota Inscripto',PrintName='Alicuota Inscripto',Updated=TO_DATE('2016-12-22 10:54:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000406 AND AD_Language='es_AR'
;

-- 22/12/2016 10:54:57 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET FieldLength=22, Name='Alicuota_Inscripto', ColumnName='Alicuota_Inscripto',Updated=TO_DATE('2016-12-22 10:54:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001933
;

-- 22/12/2016 10:55:17 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element SET ColumnName='Alicuota_No_Inscripto', Name='Alicuota_No_Inscripto', PrintName='Alicuota_No_Inscripto',Updated=TO_DATE('2016-12-22 10:55:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000407
;

-- 22/12/2016 10:55:17 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000407
;

-- 22/12/2016 10:55:17 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET ColumnName='Alicuota_No_Inscripto', Name='Alicuota_No_Inscripto', Description=NULL, Help=NULL WHERE AD_Element_ID=3000407
;

-- 22/12/2016 10:55:17 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Process_Para SET ColumnName='Alicuota_No_Inscripto', Name='Alicuota_No_Inscripto', Description=NULL, Help=NULL, AD_Element_ID=3000407 WHERE UPPER(ColumnName)='ALICUOTA_NO_INSCRIPTO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 22/12/2016 10:55:17 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Process_Para SET ColumnName='Alicuota_No_Inscripto', Name='Alicuota_No_Inscripto', Description=NULL, Help=NULL WHERE AD_Element_ID=3000407 AND IsCentrallyMaintained='Y'
;

-- 22/12/2016 10:55:17 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET Name='Alicuota_No_Inscripto', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000407) AND IsCentrallyMaintained='Y'
;

-- 22/12/2016 10:55:17 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_PrintFormatItem pi SET PrintName='Alicuota_No_Inscripto', Name='Alicuota_No_Inscripto' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000407)
;

-- 22/12/2016 10:55:22 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Alicuota_No_Inscripto',PrintName='Alicuota_No_Inscripto',Updated=TO_DATE('2016-12-22 10:55:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000407 AND AD_Language='es_AR'
;

-- 22/12/2016 10:55:43 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element_Trl SET Name='Alicuota No Inscripto',PrintName='Alicuota No Inscripto',Updated=TO_DATE('2016-12-22 10:55:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000407 AND AD_Language='es_AR'
;

-- 22/12/2016 10:55:57 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET FieldLength=22, Name='Alicuota_No_Inscripto', ColumnName='Alicuota_No_Inscripto',Updated=TO_DATE('2016-12-22 10:55:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001934
;

-- 22/12/2016 10:56:21 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element SET ColumnName='Calculo_Por_Escala', Name='Calculo_Por_Escala',Updated=TO_DATE('2016-12-22 10:56:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000405
;

-- 22/12/2016 10:56:21 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000405
;

-- 22/12/2016 10:56:21 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET ColumnName='Calculo_Por_Escala', Name='Calculo_Por_Escala', Description=NULL, Help=NULL WHERE AD_Element_ID=3000405
;

-- 22/12/2016 10:56:21 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Process_Para SET ColumnName='Calculo_Por_Escala', Name='Calculo_Por_Escala', Description=NULL, Help=NULL, AD_Element_ID=3000405 WHERE UPPER(ColumnName)='CALCULO_POR_ESCALA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 22/12/2016 10:56:21 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Process_Para SET ColumnName='Calculo_Por_Escala', Name='Calculo_Por_Escala', Description=NULL, Help=NULL WHERE AD_Element_ID=3000405 AND IsCentrallyMaintained='Y'
;

-- 22/12/2016 10:56:21 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET Name='Calculo_Por_Escala', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000405) AND IsCentrallyMaintained='Y'
;

-- 22/12/2016 10:56:21 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_PrintFormatItem pi SET PrintName='calculo_por_escala', Name='Calculo_Por_Escala' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000405)
;

-- 22/12/2016 10:56:35 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Calculo por Escala',PrintName='Calculo por Escala',Updated=TO_DATE('2016-12-22 10:56:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000405 AND AD_Language='es_AR'
;

-- 22/12/2016 10:57:27 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element SET ColumnName='Importe_No_Sujeto_Inscripto', Name='Importe_No_Sujeto_Inscripto', PrintName='Importe_No_Sujeto_Inscripto',Updated=TO_DATE('2016-12-22 10:57:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000408
;

-- 22/12/2016 10:57:27 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000408
;

-- 22/12/2016 10:57:27 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET ColumnName='Importe_No_Sujeto_Inscripto', Name='Importe_No_Sujeto_Inscripto', Description=NULL, Help=NULL WHERE AD_Element_ID=3000408
;

-- 22/12/2016 10:57:27 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Process_Para SET ColumnName='Importe_No_Sujeto_Inscripto', Name='Importe_No_Sujeto_Inscripto', Description=NULL, Help=NULL, AD_Element_ID=3000408 WHERE UPPER(ColumnName)='IMPORTE_NO_SUJETO_INSCRIPTO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 22/12/2016 10:57:27 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Process_Para SET ColumnName='Importe_No_Sujeto_Inscripto', Name='Importe_No_Sujeto_Inscripto', Description=NULL, Help=NULL WHERE AD_Element_ID=3000408 AND IsCentrallyMaintained='Y'
;

-- 22/12/2016 10:57:27 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET Name='Importe_No_Sujeto_Inscripto', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000408) AND IsCentrallyMaintained='Y'
;

-- 22/12/2016 10:57:27 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_PrintFormatItem pi SET PrintName='Importe_No_Sujeto_Inscripto', Name='Importe_No_Sujeto_Inscripto' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000408)
;

-- 22/12/2016 10:57:44 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Importe No Sujeto Inscripto',PrintName='Importe No Sujeto Inscripto',Updated=TO_DATE('2016-12-22 10:57:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000408 AND AD_Language='es_AR'
;

-- 22/12/2016 10:57:56 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET FieldLength=22, Name='Importe_No_Sujeto_Inscripto', ColumnName='Importe_No_Sujeto_Inscripto',Updated=TO_DATE('2016-12-22 10:57:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001935
;

-- 22/12/2016 10:59:00 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element SET ColumnName='Importe_No_Sujeto_No_Insc', Name='Importe_No_Sujeto_No_Insc', PrintName='Importe_No_Sujeto_No_Insc',Updated=TO_DATE('2016-12-22 10:59:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000409
;

-- 22/12/2016 10:59:00 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000409
;

-- 22/12/2016 10:59:00 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET ColumnName='Importe_No_Sujeto_No_Insc', Name='Importe_No_Sujeto_No_Insc', Description=NULL, Help=NULL WHERE AD_Element_ID=3000409
;

-- 22/12/2016 10:59:00 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Process_Para SET ColumnName='Importe_No_Sujeto_No_Insc', Name='Importe_No_Sujeto_No_Insc', Description=NULL, Help=NULL, AD_Element_ID=3000409 WHERE UPPER(ColumnName)='IMPORTE_NO_SUJETO_NO_INSC' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 22/12/2016 10:59:00 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Process_Para SET ColumnName='Importe_No_Sujeto_No_Insc', Name='Importe_No_Sujeto_No_Insc', Description=NULL, Help=NULL WHERE AD_Element_ID=3000409 AND IsCentrallyMaintained='Y'
;

-- 22/12/2016 10:59:00 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET Name='Importe_No_Sujeto_No_Insc', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000409) AND IsCentrallyMaintained='Y'
;

-- 22/12/2016 10:59:00 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_PrintFormatItem pi SET PrintName='Importe_No_Sujeto_No_Insc', Name='Importe_No_Sujeto_No_Insc' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000409)
;

-- 22/12/2016 10:59:16 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Importe No Sujeto No Insc',PrintName='Importe No Sujeto No Insc',Updated=TO_DATE('2016-12-22 10:59:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000409 AND AD_Language='es_AR'
;

-- 22/12/2016 10:59:26 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET FieldLength=22, Name='Importe_No_Sujeto_No_Insc', ColumnName='Importe_No_Sujeto_No_Insc',Updated=TO_DATE('2016-12-22 10:59:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001936
;

-- 22/12/2016 11:00:01 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element SET ColumnName='Importe_Ret_Minima_Inscripto', Name='Importe_Ret_Minima_Inscripto', PrintName='Importe_Ret_Minima_Inscripto',Updated=TO_DATE('2016-12-22 11:00:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000410
;

-- 22/12/2016 11:00:01 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000410
;

-- 22/12/2016 11:00:01 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET ColumnName='Importe_Ret_Minima_Inscripto', Name='Importe_Ret_Minima_Inscripto', Description=NULL, Help=NULL WHERE AD_Element_ID=3000410
;

-- 22/12/2016 11:00:01 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Process_Para SET ColumnName='Importe_Ret_Minima_Inscripto', Name='Importe_Ret_Minima_Inscripto', Description=NULL, Help=NULL, AD_Element_ID=3000410 WHERE UPPER(ColumnName)='IMPORTE_RET_MINIMA_INSCRIPTO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 22/12/2016 11:00:01 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Process_Para SET ColumnName='Importe_Ret_Minima_Inscripto', Name='Importe_Ret_Minima_Inscripto', Description=NULL, Help=NULL WHERE AD_Element_ID=3000410 AND IsCentrallyMaintained='Y'
;

-- 22/12/2016 11:00:01 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET Name='Importe_Ret_Minima_Inscripto', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000410) AND IsCentrallyMaintained='Y'
;

-- 22/12/2016 11:00:01 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_PrintFormatItem pi SET PrintName='Importe_Ret_Minima_Inscripto', Name='Importe_Ret_Minima_Inscripto' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000410)
;

-- 22/12/2016 11:00:32 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Importe Ret Min Insc',PrintName='Importe Ret Min Insc',Updated=TO_DATE('2016-12-22 11:00:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000410 AND AD_Language='es_AR'
;

-- 22/12/2016 11:00:47 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET FieldLength=22, Name='Importe_Ret_Minima_Inscripto', ColumnName='Importe_Ret_Minima_Inscripto',Updated=TO_DATE('2016-12-22 11:00:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001937
;

-- 22/12/2016 11:01:20 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element SET ColumnName='Importe_Ret_Minima_No_Insc', Name='Importe_Ret_Minima_No_Insc', PrintName='Importe_Ret_Minima_No_Insc',Updated=TO_DATE('2016-12-22 11:01:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000411
;

-- 22/12/2016 11:01:20 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000411
;

-- 22/12/2016 11:01:20 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET ColumnName='Importe_Ret_Minima_No_Insc', Name='Importe_Ret_Minima_No_Insc', Description=NULL, Help=NULL WHERE AD_Element_ID=3000411
;

-- 22/12/2016 11:01:20 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Process_Para SET ColumnName='Importe_Ret_Minima_No_Insc', Name='Importe_Ret_Minima_No_Insc', Description=NULL, Help=NULL, AD_Element_ID=3000411 WHERE UPPER(ColumnName)='IMPORTE_RET_MINIMA_NO_INSC' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 22/12/2016 11:01:20 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Process_Para SET ColumnName='Importe_Ret_Minima_No_Insc', Name='Importe_Ret_Minima_No_Insc', Description=NULL, Help=NULL WHERE AD_Element_ID=3000411 AND IsCentrallyMaintained='Y'
;

-- 22/12/2016 11:01:20 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET Name='Importe_Ret_Minima_No_Insc', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000411) AND IsCentrallyMaintained='Y'
;

-- 22/12/2016 11:01:20 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_PrintFormatItem pi SET PrintName='Importe_Ret_Minima_No_Insc', Name='Importe_Ret_Minima_No_Insc' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000411)
;

-- 22/12/2016 11:01:37 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Importe Ret Min No Insc',PrintName='Importe Ret Min No Insc',Updated=TO_DATE('2016-12-22 11:01:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000411 AND AD_Language='es_AR'
;

-- 22/12/2016 11:01:46 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET FieldLength=22, Name='Importe_Ret_Minima_No_Insc', ColumnName='Importe_Ret_Minima_No_Insc',Updated=TO_DATE('2016-12-22 11:01:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001938
;

-- 22/12/2016 11:04:02 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,IsHighVolume,ImportTable,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','3',0,3000085,'N','N','N','N','N','LAR','Y','Y','L','LAR_Escala_Ret_Ganancias','Escala Retencion Ganancias',0,'Y',0,100,TO_DATE('2016-12-22 11:04:01','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 11:04:01','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/12/2016 11:04:02 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000085 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- 22/12/2016 11:04:02 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,AD_Client_ID,Updated,UpdatedBy,Created,CreatedBy,IsActive,StartNo) VALUES (1,'N',200000,'Y',1000000,'N','Y',3000332,'Table LAR_Escala_Ret_Ganancias','LAR_Escala_Ret_Ganancias',0,0,TO_DATE('2016-12-22 11:04:02','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 11:04:02','YYYY-MM-DD HH24:MI:SS'),100,'Y',1000000)
;

-- 22/12/2016 11:04:12 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Table_Trl SET Name='Escala Retención Ganancia',IsTranslated='Y',Updated=TO_DATE('2016-12-22 11:04:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000085 AND AD_Language='es_AR'
;

-- 22/12/2016 11:04:20 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Table_Trl SET Name='Conceptos Retención Ganancias',IsTranslated='Y',Updated=TO_DATE('2016-12-22 11:04:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000084 AND AD_Language='es_AR'
;

-- 22/12/2016 11:04:48 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000412,'LAR_Escala_Ret_Ganancias_ID','LAR','Escala Retencion Ganancias','Escala Retencion Ganancias',0,TO_DATE('2016-12-22 11:04:47','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-12-22 11:04:47','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 22/12/2016 11:04:48 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000412 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 22/12/2016 11:04:48 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001939,3000085,'LAR',0,'Y','N','N',10,'N','N',13,'Y',3000412,'N','N','N','Escala Retencion Ganancias','LAR_Escala_Ret_Ganancias_ID',100,TO_DATE('2016-12-22 11:04:47','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 11:04:47','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 11:04:48 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001939 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 11:04:48 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001940,3000085,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.',10,'N','N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,TO_DATE('2016-12-22 11:04:48','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 11:04:48','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 11:04:48 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001940 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 11:04:49 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001941,3000085,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.',10,'N','N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',100,TO_DATE('2016-12-22 11:04:48','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 11:04:48','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 11:04:49 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001941 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 11:04:49 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001942,3000085,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.',1,'N','N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,TO_DATE('2016-12-22 11:04:49','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 11:04:49','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 11:04:49 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001942 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 11:04:49 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001943,3000085,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.',29,'N','N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,TO_DATE('2016-12-22 11:04:49','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 11:04:49','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 11:04:49 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001943 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 11:04:49 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001944,3000085,'LAR',0,110,'Y','N','N','The Created By field indicates the user who created this record.',10,'N','N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,TO_DATE('2016-12-22 11:04:49','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 11:04:49','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 11:04:49 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001944 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 11:04:49 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001945,3000085,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.',29,'N','N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,TO_DATE('2016-12-22 11:04:49','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 11:04:49','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 11:04:49 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001945 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 11:04:49 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001946,3000085,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.',10,'N','N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,TO_DATE('2016-12-22 11:04:49','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 11:04:49','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 11:04:49 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001946 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 11:04:50 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001947,3000085,'LAR',0,'Y','N','N','A search key allows you a fast method of finding a particular record.
If you leave the search key empty, the system automatically creates a numeric number.  The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).',40,'N','Y',10,'N',620,'N','Y','N','Search key for the record in the format required - must be unique','Search Key','Value',100,TO_DATE('2016-12-22 11:04:49','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 11:04:49','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 11:04:50 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001947 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 11:04:50 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,Help,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001948,3000085,'LAR',0,'Y','N','Y',1,'The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.',255,'N','Y',10,'N',469,'N','Y','N','Alphanumeric identifier of the entity','Name','Name',100,TO_DATE('2016-12-22 11:04:50','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 11:04:50','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 11:04:50 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001948 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 11:04:50 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001949,3000085,'LAR',0,'N','N','N','A description is limited to 255 characters.',255,'N','Y',10,'N',275,'N','Y','N','Optional short description of the record','Description','Description',100,TO_DATE('2016-12-22 11:04:50','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 11:04:50','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 11:04:50 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001949 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 11:04:50 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000413,'importe_desde','LAR','importe_desde','importe_desde',0,TO_DATE('2016-12-22 11:04:50','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-12-22 11:04:50','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 22/12/2016 11:04:50 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000413 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 22/12/2016 11:04:50 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001950,3000085,'LAR',0,'N','N','N',131089,'N','N',22,'N',3000413,'N','Y','N','importe_desde','importe_desde',100,TO_DATE('2016-12-22 11:04:50','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 11:04:50','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 11:04:50 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001950 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 11:04:50 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000414,'importe_hasta','LAR','importe_hasta','importe_hasta',0,TO_DATE('2016-12-22 11:04:50','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-12-22 11:04:50','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 22/12/2016 11:04:50 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000414 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 22/12/2016 11:04:51 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001951,3000085,'LAR',0,'N','N','N',131089,'N','N',22,'N',3000414,'N','Y','N','importe_hasta','importe_hasta',100,TO_DATE('2016-12-22 11:04:50','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 11:04:50','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 11:04:51 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001951 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 11:04:51 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000415,'importe_fijo','LAR','importe_fijo','importe_fijo',0,TO_DATE('2016-12-22 11:04:51','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-12-22 11:04:51','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 22/12/2016 11:04:51 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000415 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 22/12/2016 11:04:51 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001952,3000085,'LAR',0,'N','N','N',131089,'N','N',22,'N',3000415,'N','Y','N','importe_fijo','importe_fijo',100,TO_DATE('2016-12-22 11:04:51','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 11:04:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 11:04:51 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001952 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 11:04:51 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000416,'alicuota','LAR','alicuota','alicuota',0,TO_DATE('2016-12-22 11:04:51','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-12-22 11:04:51','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 22/12/2016 11:04:51 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000416 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 22/12/2016 11:04:51 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001953,3000085,'LAR',0,'Y','N','N',131089,'N','N',22,'N',3000416,'N','Y','N','alicuota','alicuota',100,TO_DATE('2016-12-22 11:04:51','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 11:04:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 11:04:51 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001953 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 11:04:51 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000417,'importe_no_sujeto','LAR','importe_no_sujeto','importe_no_sujeto',0,TO_DATE('2016-12-22 11:04:51','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-12-22 11:04:51','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 22/12/2016 11:04:51 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000417 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 22/12/2016 11:04:52 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001954,3000085,'LAR',0,'N','N','N',131089,'N','N',22,'N',3000417,'N','Y','N','importe_no_sujeto','importe_no_sujeto',100,TO_DATE('2016-12-22 11:04:51','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 11:04:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 11:04:52 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001954 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 11:06:01 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element SET ColumnName='Alicuota', Name='Alicuota',Updated=TO_DATE('2016-12-22 11:06:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000416
;

-- 22/12/2016 11:06:01 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000416
;

-- 22/12/2016 11:06:01 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET ColumnName='Alicuota', Name='Alicuota', Description=NULL, Help=NULL WHERE AD_Element_ID=3000416
;

-- 22/12/2016 11:06:01 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Process_Para SET ColumnName='Alicuota', Name='Alicuota', Description=NULL, Help=NULL, AD_Element_ID=3000416 WHERE UPPER(ColumnName)='ALICUOTA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 22/12/2016 11:06:01 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Process_Para SET ColumnName='Alicuota', Name='Alicuota', Description=NULL, Help=NULL WHERE AD_Element_ID=3000416 AND IsCentrallyMaintained='Y'
;

-- 22/12/2016 11:06:01 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET Name='Alicuota', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000416) AND IsCentrallyMaintained='Y'
;

-- 22/12/2016 11:06:01 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_PrintFormatItem pi SET PrintName='alicuota', Name='Alicuota' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000416)
;

-- 22/12/2016 11:06:13 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Alícuota',PrintName='Alícuota',Updated=TO_DATE('2016-12-22 11:06:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000416 AND AD_Language='es_AR'
;

-- 22/12/2016 11:06:34 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element SET PrintName='Alicuota',Updated=TO_DATE('2016-12-22 11:06:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000416
;

-- 22/12/2016 11:06:34 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000416
;

-- 22/12/2016 11:06:34 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_PrintFormatItem pi SET PrintName='Alicuota', Name='Alicuota' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000416)
;

-- 22/12/2016 11:06:44 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET FieldLength=22, Name='Alicuota', ColumnName='Alicuota',Updated=TO_DATE('2016-12-22 11:06:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001953
;

-- 22/12/2016 11:07:02 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element SET ColumnName='Importe Desde', Name='Importe Desde',Updated=TO_DATE('2016-12-22 11:07:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000413
;

-- 22/12/2016 11:07:02 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000413
;

-- 22/12/2016 11:07:02 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET ColumnName='Importe Desde', Name='Importe Desde', Description=NULL, Help=NULL WHERE AD_Element_ID=3000413
;

-- 22/12/2016 11:07:02 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Process_Para SET ColumnName='Importe Desde', Name='Importe Desde', Description=NULL, Help=NULL, AD_Element_ID=3000413 WHERE UPPER(ColumnName)='IMPORTE DESDE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 22/12/2016 11:07:02 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Process_Para SET ColumnName='Importe Desde', Name='Importe Desde', Description=NULL, Help=NULL WHERE AD_Element_ID=3000413 AND IsCentrallyMaintained='Y'
;

-- 22/12/2016 11:07:02 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET Name='Importe Desde', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000413) AND IsCentrallyMaintained='Y'
;

-- 22/12/2016 11:07:02 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_PrintFormatItem pi SET PrintName='importe_desde', Name='Importe Desde' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000413)
;

-- 22/12/2016 11:07:13 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element SET PrintName='importe_Desde',Updated=TO_DATE('2016-12-22 11:07:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000413
;

-- 22/12/2016 11:07:13 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000413
;

-- 22/12/2016 11:07:13 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_PrintFormatItem pi SET PrintName='importe_Desde', Name='Importe Desde' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000413)
;

-- 22/12/2016 11:07:20 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Importe Desde',PrintName='Importe Desde',Updated=TO_DATE('2016-12-22 11:07:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000413 AND AD_Language='es_AR'
;

-- 22/12/2016 11:07:29 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element SET ColumnName='Importe_Desde', Name='Importe_Desde',Updated=TO_DATE('2016-12-22 11:07:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000413
;

-- 22/12/2016 11:07:29 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000413
;

-- 22/12/2016 11:07:29 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET ColumnName='Importe_Desde', Name='Importe_Desde', Description=NULL, Help=NULL WHERE AD_Element_ID=3000413
;

-- 22/12/2016 11:07:29 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Process_Para SET ColumnName='Importe_Desde', Name='Importe_Desde', Description=NULL, Help=NULL, AD_Element_ID=3000413 WHERE UPPER(ColumnName)='IMPORTE_DESDE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 22/12/2016 11:07:29 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Process_Para SET ColumnName='Importe_Desde', Name='Importe_Desde', Description=NULL, Help=NULL WHERE AD_Element_ID=3000413 AND IsCentrallyMaintained='Y'
;

-- 22/12/2016 11:07:29 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET Name='Importe_Desde', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000413) AND IsCentrallyMaintained='Y'
;

-- 22/12/2016 11:07:29 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_PrintFormatItem pi SET PrintName='importe_Desde', Name='Importe_Desde' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000413)
;

-- 22/12/2016 11:08:36 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET FieldLength=22,Updated=TO_DATE('2016-12-22 11:08:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001950
;

-- 22/12/2016 11:09:00 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element SET ColumnName='Importe_Fijo', Name='Importe_Fijo', PrintName='Importe_Fijo',Updated=TO_DATE('2016-12-22 11:09:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000415
;

-- 22/12/2016 11:09:00 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000415
;

-- 22/12/2016 11:09:00 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET ColumnName='Importe_Fijo', Name='Importe_Fijo', Description=NULL, Help=NULL WHERE AD_Element_ID=3000415
;

-- 22/12/2016 11:09:00 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Process_Para SET ColumnName='Importe_Fijo', Name='Importe_Fijo', Description=NULL, Help=NULL, AD_Element_ID=3000415 WHERE UPPER(ColumnName)='IMPORTE_FIJO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 22/12/2016 11:09:00 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Process_Para SET ColumnName='Importe_Fijo', Name='Importe_Fijo', Description=NULL, Help=NULL WHERE AD_Element_ID=3000415 AND IsCentrallyMaintained='Y'
;

-- 22/12/2016 11:09:00 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET Name='Importe_Fijo', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000415) AND IsCentrallyMaintained='Y'
;

-- 22/12/2016 11:09:01 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_PrintFormatItem pi SET PrintName='Importe_Fijo', Name='Importe_Fijo' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000415)
;

-- 22/12/2016 11:09:14 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Importe Fijo',PrintName='Importe Fijo',Updated=TO_DATE('2016-12-22 11:09:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000415 AND AD_Language='es_AR'
;

-- 22/12/2016 11:09:23 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET FieldLength=22, Name='Importe_Fijo', ColumnName='Importe_Fijo',Updated=TO_DATE('2016-12-22 11:09:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001952
;

-- 22/12/2016 11:09:44 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element SET ColumnName='Importe_Hasta', Name='Importe_Hasta', PrintName='Importe_Hasta',Updated=TO_DATE('2016-12-22 11:09:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000414
;

-- 22/12/2016 11:09:44 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000414
;

-- 22/12/2016 11:09:44 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET ColumnName='Importe_Hasta', Name='Importe_Hasta', Description=NULL, Help=NULL WHERE AD_Element_ID=3000414
;

-- 22/12/2016 11:09:44 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Process_Para SET ColumnName='Importe_Hasta', Name='Importe_Hasta', Description=NULL, Help=NULL, AD_Element_ID=3000414 WHERE UPPER(ColumnName)='IMPORTE_HASTA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 22/12/2016 11:09:44 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Process_Para SET ColumnName='Importe_Hasta', Name='Importe_Hasta', Description=NULL, Help=NULL WHERE AD_Element_ID=3000414 AND IsCentrallyMaintained='Y'
;

-- 22/12/2016 11:09:44 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET Name='Importe_Hasta', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000414) AND IsCentrallyMaintained='Y'
;

-- 22/12/2016 11:09:44 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_PrintFormatItem pi SET PrintName='Importe_Hasta', Name='Importe_Hasta' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000414)
;

-- 22/12/2016 11:09:54 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Importe Hasta',PrintName='Importe Hasta',Updated=TO_DATE('2016-12-22 11:09:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000414 AND AD_Language='es_AR'
;

-- 22/12/2016 11:10:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET FieldLength=22, Name='Importe_Hasta', ColumnName='Importe_Hasta',Updated=TO_DATE('2016-12-22 11:10:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001951
;

-- 22/12/2016 11:10:25 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element SET ColumnName='Importe_No_Sujeto', Name='Importe_No_Sujeto', PrintName='Importe_No_Sujeto',Updated=TO_DATE('2016-12-22 11:10:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000417
;

-- 22/12/2016 11:10:25 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000417
;

-- 22/12/2016 11:10:25 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET ColumnName='Importe_No_Sujeto', Name='Importe_No_Sujeto', Description=NULL, Help=NULL WHERE AD_Element_ID=3000417
;

-- 22/12/2016 11:10:25 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Process_Para SET ColumnName='Importe_No_Sujeto', Name='Importe_No_Sujeto', Description=NULL, Help=NULL, AD_Element_ID=3000417 WHERE UPPER(ColumnName)='IMPORTE_NO_SUJETO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 22/12/2016 11:10:25 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Process_Para SET ColumnName='Importe_No_Sujeto', Name='Importe_No_Sujeto', Description=NULL, Help=NULL WHERE AD_Element_ID=3000417 AND IsCentrallyMaintained='Y'
;

-- 22/12/2016 11:10:25 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET Name='Importe_No_Sujeto', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000417) AND IsCentrallyMaintained='Y'
;

-- 22/12/2016 11:10:25 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_PrintFormatItem pi SET PrintName='Importe_No_Sujeto', Name='Importe_No_Sujeto' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000417)
;

-- 22/12/2016 11:10:37 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Importe No Sujeto',PrintName='Importe No Sujeto',Updated=TO_DATE('2016-12-22 11:10:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000417 AND AD_Language='es_AR'
;

-- 22/12/2016 11:10:47 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET FieldLength=22, Name='Importe_No_Sujeto', ColumnName='Importe_No_Sujeto',Updated=TO_DATE('2016-12-22 11:10:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001954
;

-- 22/12/2016 11:11:22 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001955,291,'LAR',0,'N','N','N',10,'N','N',19,'N',3000404,'N','Y','N','Conceptos Retencion Ganancias','LAR_Concepto_Ret_Ganancias_ID',100,TO_DATE('2016-12-22 11:11:21','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-22 11:11:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2016 11:11:22 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001955 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2016 11:12:06 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Conceptos Retención Ganancias',PrintName='Conceptos Retención Ganancias',Updated=TO_DATE('2016-12-22 11:12:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000404 AND AD_Language='es_AR'
;

-- 22/12/2016 11:13:26 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002975,10,'Y','N','N',3001955,'N','Y',220,'N','LAR','Conceptos Retencion Ganancias',100,0,'Y',TO_DATE('2016-12-22 11:13:26','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-12-22 11:13:26','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/12/2016 11:13:26 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002975 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/12/2016 11:16:41 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3002975
;

-- 22/12/2016 11:16:41 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3002972
;

-- 22/12/2016 11:16:41 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3002958
;

-- 22/12/2016 11:16:41 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3002962
;

-- 22/12/2016 11:16:41 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3002965
;

-- 22/12/2016 11:16:41 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3002968
;

-- 22/12/2016 11:16:41 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3955
;

-- 22/12/2016 11:16:41 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=2124
;

-- 22/12/2016 11:16:41 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=2164
;

-- 22/12/2016 11:16:41 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=2139
;

-- 22/12/2016 11:16:41 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=2149
;

-- 22/12/2016 11:16:41 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3001605
;

-- 22/12/2016 11:16:41 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=2144
;

-- 22/12/2016 11:16:41 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=2162
;

-- 22/12/2016 11:16:41 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=2148
;

-- 22/12/2016 11:16:41 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=2128
;

-- 22/12/2016 11:16:41 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=2127
;

-- 22/12/2016 11:16:41 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=2146
;

-- 22/12/2016 11:16:41 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=2154
;

-- 22/12/2016 11:16:42 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=2153
;

-- 22/12/2016 11:16:42 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=54555
;

-- 22/12/2016 11:16:42 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=2135
;

-- 22/12/2016 11:16:42 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=9620
;

-- 22/12/2016 11:16:42 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=57533
;

-- 22/12/2016 11:16:59 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2016-12-22 11:16:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002972
;

-- 22/12/2016 11:17:22 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2016-12-22 11:17:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002975
;

-- 22/12/2016 11:22:14 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Window (AD_Window_ID,WindowType,IsSOTrx,IsDefault,IsBetaFunctionality,WinHeight,WinWidth,EntityType,Name,Description,IsActive,Created,CreatedBy,UpdatedBy,Updated,AD_Org_ID,AD_Client_ID,Processing) VALUES (3000064,'M','N','N','N',0,0,'LAR','Conceptos Retención de Ganancias','Conceptos Sujetos a Retención de Ganancias','Y',TO_DATE('2016-12-22 11:22:13','YYYY-MM-DD HH24:MI:SS'),100,100,TO_DATE('2016-12-22 11:22:13','YYYY-MM-DD HH24:MI:SS'),0,0,'N')
;

-- 22/12/2016 11:22:14 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Window_Trl (AD_Language,AD_Window_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Window_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Window t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Window_ID=3000064 AND NOT EXISTS (SELECT * FROM AD_Window_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Window_ID=t.AD_Window_ID)
;

-- 22/12/2016 11:22:29 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Window_Trl SET IsTranslated='Y',Updated=TO_DATE('2016-12-22 11:22:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Window_ID=3000064 AND AD_Language='es_AR'
;

-- 22/12/2016 11:24:02 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,Description,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('N',3000064,10,'N','N',3000084,3000132,'N','N','N','N',0,'Y','N','LAR','Conceptos','Conceptos Sujetos a Retención de Ganancias',0,0,TO_DATE('2016-12-22 11:24:02','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 11:24:02','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 22/12/2016 11:24:02 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000132 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 22/12/2016 11:24:24 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002976,1,'Y','N','N',3001924,'N','Y',3000132,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,'Y',TO_DATE('2016-12-22 11:24:23','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-12-22 11:24:23','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/12/2016 11:24:24 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002976 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/12/2016 11:24:24 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002977,22,'Y','N','N',3001933,'N','Y',3000132,'N','LAR','Alicuota_Inscripto',100,0,'Y',TO_DATE('2016-12-22 11:24:24','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-12-22 11:24:24','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/12/2016 11:24:24 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002977 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/12/2016 11:24:24 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002978,22,'Y','N','N',3001934,'N','Y',3000132,'N','LAR','Alicuota_No_Inscripto',100,0,'Y',TO_DATE('2016-12-22 11:24:24','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-12-22 11:24:24','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/12/2016 11:24:24 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002978 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/12/2016 11:24:24 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002979,1,'Y','N','N',3001932,'N','Y',3000132,'N','LAR','Calculo_Por_Escala',100,0,'Y',TO_DATE('2016-12-22 11:24:24','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-12-22 11:24:24','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/12/2016 11:24:24 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002979 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/12/2016 11:24:24 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002980,10,'Y','N','N',3001922,'N','Y',3000132,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,'Y',TO_DATE('2016-12-22 11:24:24','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-12-22 11:24:24','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/12/2016 11:24:24 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002980 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/12/2016 11:24:24 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002981,10,'N','N','N',3001921,'N','Y',3000132,'N','LAR','Conceptos Retencion Ganancias',100,0,'Y',TO_DATE('2016-12-22 11:24:24','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-12-22 11:24:24','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/12/2016 11:24:24 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002981 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/12/2016 11:24:25 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002982,255,'Y','N','N',3001931,'N','Y',3000132,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,'Y',TO_DATE('2016-12-22 11:24:24','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-12-22 11:24:24','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/12/2016 11:24:25 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002982 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/12/2016 11:24:25 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002983,22,'Y','N','N',3001935,'N','Y',3000132,'N','LAR','Importe_No_Sujeto_Inscripto',100,0,'Y',TO_DATE('2016-12-22 11:24:25','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-12-22 11:24:25','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/12/2016 11:24:25 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002983 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/12/2016 11:24:25 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002984,22,'Y','N','N',3001936,'N','Y',3000132,'N','LAR','Importe_No_Sujeto_No_Insc',100,0,'Y',TO_DATE('2016-12-22 11:24:25','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-12-22 11:24:25','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/12/2016 11:24:25 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002984 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/12/2016 11:24:25 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002985,22,'Y','N','N',3001937,'N','Y',3000132,'N','LAR','Importe_Ret_Minima_Inscripto',100,0,'Y',TO_DATE('2016-12-22 11:24:25','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-12-22 11:24:25','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/12/2016 11:24:25 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002985 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/12/2016 11:24:25 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002986,22,'Y','N','N',3001938,'N','Y',3000132,'N','LAR','Importe_Ret_Minima_No_Insc',100,0,'Y',TO_DATE('2016-12-22 11:24:25','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-12-22 11:24:25','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/12/2016 11:24:25 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002986 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/12/2016 11:24:26 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002987,255,'Y','N','N',3001930,'N','Y',3000132,'N','The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.','LAR','Alphanumeric identifier of the entity','Name',100,0,'Y',TO_DATE('2016-12-22 11:24:25','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-12-22 11:24:25','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/12/2016 11:24:26 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002987 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/12/2016 11:24:26 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002988,10,'Y','N','N',3001923,'N','Y',3000132,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,'Y',TO_DATE('2016-12-22 11:24:26','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-12-22 11:24:26','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/12/2016 11:24:26 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002988 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/12/2016 11:24:26 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002989,40,'Y','N','N',3001929,'N','Y',3000132,'N','A search key allows you a fast method of finding a particular record.
If you leave the search key empty, the system automatically creates a numeric number.  The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).','LAR','Search key for the record in the format required - must be unique','Search Key',100,0,'Y',TO_DATE('2016-12-22 11:24:26','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-12-22 11:24:26','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/12/2016 11:24:26 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002989 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/12/2016 11:28:07 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3002980
;

-- 22/12/2016 11:28:07 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3002988
;

-- 22/12/2016 11:28:07 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3002989
;

-- 22/12/2016 11:28:07 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3002987
;

-- 22/12/2016 11:28:07 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3002976
;

-- 22/12/2016 11:28:07 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3002982
;

-- 22/12/2016 11:28:07 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3002979
;

-- 22/12/2016 11:28:07 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3002977
;

-- 22/12/2016 11:28:07 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3002978
;

-- 22/12/2016 11:28:07 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3002983
;

-- 22/12/2016 11:28:07 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3002984
;

-- 22/12/2016 11:28:07 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3002985
;

-- 22/12/2016 11:28:07 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3002986
;

-- 22/12/2016 11:28:28 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2016-12-22 11:28:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002988
;

-- 22/12/2016 11:28:52 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2016-12-22 11:28:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002978
;

-- 22/12/2016 11:28:58 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2016-12-22 11:28:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002984
;

-- 22/12/2016 11:29:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2016-12-22 11:29:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002986
;

-- 22/12/2016 11:30:11 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Menu (AD_Window_ID,AD_Menu_ID,IsSummary,Action,IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000064,3000199,'N','W','N','N','LAR','Y','Conceptos Retención de Ganancias',TO_DATE('2016-12-22 11:30:11','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_DATE('2016-12-22 11:30:11','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 22/12/2016 11:30:11 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000199 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 22/12/2016 11:30:11 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', SysDate, 100, SysDate, 100,t.AD_Tree_ID, 3000199, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000199)
;

-- 22/12/2016 11:30:20 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=0, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000110
;

-- 22/12/2016 11:30:20 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=1, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000005
;

-- 22/12/2016 11:30:20 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=2, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000006
;

-- 22/12/2016 11:30:20 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=3, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=1000005
;

-- 22/12/2016 11:30:20 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=4, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=1000002
;

-- 22/12/2016 11:30:20 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=5, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000199
;

-- 22/12/2016 11:30:20 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=6, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=1000001
;

-- 22/12/2016 11:30:20 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=7, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=1000003
;

-- 22/12/2016 11:30:20 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=8, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=1000004
;

-- 22/12/2016 11:32:48 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Window (AD_Window_ID,WindowType,IsSOTrx,IsDefault,IsBetaFunctionality,WinHeight,WinWidth,EntityType,Name,Description,IsActive,Created,CreatedBy,UpdatedBy,Updated,AD_Org_ID,AD_Client_ID,Processing) VALUES (3000065,'M','N','N','N',0,0,'LAR','Escala Retención de Ganancias','Escala Retención de Ganancias','Y',TO_DATE('2016-12-22 11:32:47','YYYY-MM-DD HH24:MI:SS'),100,100,TO_DATE('2016-12-22 11:32:47','YYYY-MM-DD HH24:MI:SS'),0,0,'N')
;

-- 22/12/2016 11:32:48 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Window_Trl (AD_Language,AD_Window_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Window_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Window t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Window_ID=3000065 AND NOT EXISTS (SELECT * FROM AD_Window_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Window_ID=t.AD_Window_ID)
;

-- 22/12/2016 11:33:56 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Table_Trl SET Name='Escala Retención Ganancias',Updated=TO_DATE('2016-12-22 11:33:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000085 AND AD_Language='es_AR'
;

-- 22/12/2016 11:34:14 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('N',3000065,10,'N','N',3000085,3000133,'N','N','N','N',0,'Y','N','U','Escala Ret. Ganancias',0,0,TO_DATE('2016-12-22 11:34:14','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 11:34:14','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 22/12/2016 11:34:14 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000133 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 22/12/2016 11:34:18 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002990,1,'Y','N','N',3001942,'N','Y',3000133,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,'Y',TO_DATE('2016-12-22 11:34:18','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-12-22 11:34:18','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/12/2016 11:34:18 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002990 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/12/2016 11:34:18 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002991,22,'Y','N','N',3001953,'N','Y',3000133,'N','LAR','Alicuota',100,0,'Y',TO_DATE('2016-12-22 11:34:18','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-12-22 11:34:18','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/12/2016 11:34:18 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002991 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/12/2016 11:34:18 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002992,10,'Y','N','N',3001940,'N','Y',3000133,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,'Y',TO_DATE('2016-12-22 11:34:18','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-12-22 11:34:18','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/12/2016 11:34:18 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002992 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/12/2016 11:34:18 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002993,255,'Y','N','N',3001949,'N','Y',3000133,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,'Y',TO_DATE('2016-12-22 11:34:18','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-12-22 11:34:18','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/12/2016 11:34:18 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002993 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/12/2016 11:34:18 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002994,10,'N','N','N',3001939,'N','Y',3000133,'N','LAR','Escala Retencion Ganancias',100,0,'Y',TO_DATE('2016-12-22 11:34:18','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-12-22 11:34:18','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/12/2016 11:34:18 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002994 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/12/2016 11:34:19 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002995,22,'Y','N','N',3001950,'N','Y',3000133,'N','LAR','Importe_Desde',100,0,'Y',TO_DATE('2016-12-22 11:34:18','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-12-22 11:34:18','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/12/2016 11:34:19 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002995 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/12/2016 11:34:19 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002996,22,'Y','N','N',3001952,'N','Y',3000133,'N','LAR','Importe_Fijo',100,0,'Y',TO_DATE('2016-12-22 11:34:19','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-12-22 11:34:19','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/12/2016 11:34:19 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002996 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/12/2016 11:34:19 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002997,22,'Y','N','N',3001951,'N','Y',3000133,'N','LAR','Importe_Hasta',100,0,'Y',TO_DATE('2016-12-22 11:34:19','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-12-22 11:34:19','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/12/2016 11:34:19 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002997 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/12/2016 11:34:19 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002998,22,'Y','N','N',3001954,'N','Y',3000133,'N','LAR','Importe_No_Sujeto',100,0,'Y',TO_DATE('2016-12-22 11:34:19','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-12-22 11:34:19','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/12/2016 11:34:19 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002998 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/12/2016 11:34:19 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002999,255,'Y','N','N',3001948,'N','Y',3000133,'N','The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.','LAR','Alphanumeric identifier of the entity','Name',100,0,'Y',TO_DATE('2016-12-22 11:34:19','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-12-22 11:34:19','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/12/2016 11:34:19 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002999 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/12/2016 11:34:19 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003000,10,'Y','N','N',3001941,'N','Y',3000133,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,'Y',TO_DATE('2016-12-22 11:34:19','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-12-22 11:34:19','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/12/2016 11:34:19 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003000 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/12/2016 11:34:20 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003001,40,'Y','N','N',3001947,'N','Y',3000133,'N','A search key allows you a fast method of finding a particular record.
If you leave the search key empty, the system automatically creates a numeric number.  The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).','LAR','Search key for the record in the format required - must be unique','Search Key',100,0,'Y',TO_DATE('2016-12-22 11:34:19','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-12-22 11:34:19','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/12/2016 11:34:20 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003001 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/12/2016 11:35:45 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3002992
;

-- 22/12/2016 11:35:45 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3003000
;

-- 22/12/2016 11:35:45 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3003001
;

-- 22/12/2016 11:35:45 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3002999
;

-- 22/12/2016 11:35:45 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3002993
;

-- 22/12/2016 11:35:45 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3002990
;

-- 22/12/2016 11:35:45 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3002995
;

-- 22/12/2016 11:35:45 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3002997
;

-- 22/12/2016 11:35:45 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3002996
;

-- 22/12/2016 11:35:45 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3002991
;

-- 22/12/2016 11:35:45 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3002998
;

-- 22/12/2016 11:35:52 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2016-12-22 11:35:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003000
;

-- 22/12/2016 11:36:02 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2016-12-22 11:36:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002997
;

-- 22/12/2016 11:36:13 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2016-12-22 11:36:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002991
;

-- 22/12/2016 11:36:56 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Menu (AD_Window_ID,AD_Menu_ID,IsSummary,Action,IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000065,3000200,'N','W','N','N','LAR','Y','Escala Retención de Ganancias',TO_DATE('2016-12-22 11:36:55','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_DATE('2016-12-22 11:36:55','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 22/12/2016 11:36:56 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000200 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 22/12/2016 11:36:56 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', SysDate, 100, SysDate, 100,t.AD_Tree_ID, 3000200, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000200)
;

-- 22/12/2016 11:36:59 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=0, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000110
;

-- 22/12/2016 11:36:59 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=1, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000005
;

-- 22/12/2016 11:36:59 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=2, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000006
;

-- 22/12/2016 11:36:59 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=3, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=1000005
;

-- 22/12/2016 11:36:59 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=4, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=1000002
;

-- 22/12/2016 11:36:59 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=5, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000199
;

-- 22/12/2016 11:36:59 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=6, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000200
;

-- 22/12/2016 11:36:59 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=7, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=1000001
;

-- 22/12/2016 11:36:59 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=8, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=1000003
;

-- 22/12/2016 11:36:59 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=9, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=1000004
;

-- 22/12/2016 13:42:26 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Table SET AD_Window_ID=3000064,Updated=TO_DATE('2016-12-22 13:42:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000084
;

-- 22/12/2016 13:42:42 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Table SET AD_Window_ID=3000065,Updated=TO_DATE('2016-12-22 13:42:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000085
;

-- 22/12/2016 13:45:49 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET DisplayLength=60,Updated=TO_DATE('2016-12-22 13:45:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002982
;

-- 22/12/2016 13:49:16 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET AD_Reference_ID=14,Updated=TO_DATE('2016-12-22 13:49:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001931
;

-- Tabla I_BPartner: Se agrega columna relacionada que referencia el "Concepto Sujeto a Retención"
ALTER TABLE I_BPartner 
    ADD COLUMN LAR_Concepto_Ret_Ganancias_ID   numeric(10,0),
    ADD CONSTRAINT LAR_Concepto_Ret_Ganancias_ID_IBPartner FOREIGN KEY (LAR_Concepto_Ret_Ganancias_ID)
      REFERENCES LAR_Concepto_Ret_Ganancias (LAR_Concepto_Ret_Ganancias_ID) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED;

-- 30/12/2016 17:18:47 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001959,533,'LAR',0,'N','N','N',10,'N','N',19,'N',3000404,'N','Y','N','Conceptos Retencion Ganancias','LAR_Concepto_Ret_Ganancias_ID',100,TO_DATE('2016-12-30 17:18:41','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-12-30 17:18:41','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/12/2016 17:18:47 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001959 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 30/12/2016 17:19:58 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003011,10,'Y','N','N',3001959,'N','Y',441,'N','LAR','Conceptos Retencion Ganancias',100,0,'Y',TO_DATE('2016-12-30 17:19:58','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-12-30 17:19:58','YYYY-MM-DD HH24:MI:SS'))
;

-- 30/12/2016 17:19:59 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003011 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/12/2016 17:22:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3003011
;

-- 30/12/2016 17:22:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=5943
;

-- 30/12/2016 17:22:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=5948
;

-- 30/12/2016 17:22:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=5947
;

-- 30/12/2016 17:22:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=5927
;

-- 30/12/2016 17:22:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=5933
;

-- 30/12/2016 17:22:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=5945
;

-- 30/12/2016 17:22:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=5951
;

-- 30/12/2016 17:22:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=5954
;

-- 30/12/2016 17:22:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=5918
;

-- 30/12/2016 17:22:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=5949
;

-- 30/12/2016 17:22:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=5922
;

-- 30/12/2016 17:22:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=5929
;

-- 30/12/2016 17:22:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=5956
;

-- 30/12/2016 17:22:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=5946
;

-- 30/12/2016 17:22:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=5920
;

-- 30/12/2016 17:22:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=5921
;

-- 30/12/2016 17:22:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=5923
;

-- 30/12/2016 17:22:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=5952
;

-- 30/12/2016 17:22:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=5930
;

-- 30/12/2016 17:22:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=5944
;

-- 30/12/2016 17:22:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=5940
;

-- 30/12/2016 17:22:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=13015
;

-- 30/12/2016 17:22:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=13008
;

-- 30/12/2016 17:22:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=5919
;

-- 30/12/2016 17:22:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=5934
;

-- 30/12/2016 17:22:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3002028
;

-- 30/12/2016 17:22:06 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3002029
;

-- 30/12/2016 17:22:06 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3002030
;

-- 30/12/2016 17:22:06 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3002031
;

-- 30/12/2016 17:22:06 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3002032
;

-- 30/12/2016 17:22:06 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=58038
;

-- 30/12/2016 17:22:06 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=58039
;

-- 30/12/2016 17:22:06 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=58040
;

-- 30/12/2016 17:22:06 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=5941
;

-- 30/12/2016 17:22:06 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=5924
;


-- Tabla I_BPartner: Se agregan las columnas relacionadas a Exencion de retenciones
ALTER TABLE I_BPartner
-- Ganancias
ADD COLUMN LAR_TipoGanancias character(1) DEFAULT 'I'::bpchar,
ADD COLUMN LAR_Exento_Ret_Ganancias character(1) DEFAULT 'N'::bpchar,
ADD COLUMN LAR_Exencion_Ganancias numeric,
ADD COLUMN LAR_Importe_Exencion_Ganancias numeric DEFAULT 0,
ADD COLUMN LAR_NroCertificado_Ganancias character varying(30),
ADD COLUMN LAR_Vencimiento_Cert_Ganancias timestamp without time zone,
ADD CONSTRAINT C_BPartner_LAR_Exento_Ret_Ganancias_check CHECK ((LAR_Exento_Ret_Ganancias = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
-- IIBB
ADD COLUMN LAR_Exento_Ret_IIBB character(1) DEFAULT 'N'::bpchar,
ADD COLUMN LAR_Exencion_IIBB numeric,
ADD COLUMN LAR_Importe_Exencion_IIBB numeric DEFAULT 0,
ADD COLUMN LAR_NroCertificado_IIBB character varying(30),
ADD COLUMN LAR_Inicio_Cert_IIBB timestamp without time zone,
ADD COLUMN LAR_Vencimiento_Cert_IIBB timestamp without time zone,
ADD CONSTRAINT C_BPartner_LAR_Exento_Ret_IIBB_check CHECK ((LAR_Exento_Ret_IIBB = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
-- IVA
ADD COLUMN LAR_Exento_Retenciones_IVA character(1) DEFAULT 'N'::bpchar,
ADD COLUMN LAR_Exencion_IVA numeric,
ADD COLUMN LAR_Importe_Exencion_IVA numeric DEFAULT 0,
ADD COLUMN LAR_NroCertificado_IVA character varying(30),
ADD COLUMN LAR_Vencimiento_Cert_IVA timestamp without time zone,
ADD CONSTRAINT C_BPartner_LAR_Exento_Retenciones_IVA_check CHECK ((LAR_Exento_Retenciones_IVA = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
--SUSS
ADD COLUMN LAR_Exento_Retenciones_SUSS character(1) DEFAULT 'N'::bpchar,
ADD COLUMN LAR_Exencion_SUSS numeric,
ADD COLUMN LAR_Importe_Exencion_SUSS numeric DEFAULT 0,
ADD COLUMN LAR_NroCertificado_SUSS character varying(30),
ADD COLUMN LAR_Inicio_Cert_SUSS timestamp without time zone,
ADD COLUMN LAR_Vencimiento_Cert_SUSS timestamp without time zone,
ADD CONSTRAINT C_BPartner_LAR_Exento_Retenciones_SUSS_check CHECK ((LAR_Exento_Retenciones_SUSS = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])))
;

-- 02/01/2017 12:04:09 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001967,533,'LAR',0,'N','N','N',1,'N','N',20,'N',3000374,'N','Y','N','LAR_TipoGanancias','LAR_TipoGanancias',100,TO_DATE('2017-01-02 12:04:08','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-01-02 12:04:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/01/2017 12:04:09 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001967 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/01/2017 12:04:09 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001968,533,'LAR',0,'N','N','N',1,'N','N',20,'N',3000395,'N','Y','N','LAR_Exento_Ret_Ganancias','LAR_Exento_Ret_Ganancias',100,TO_DATE('2017-01-02 12:04:09','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-01-02 12:04:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/01/2017 12:04:09 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001968 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/01/2017 12:04:09 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001969,533,'LAR',0,'N','N','N',131089,'N','N',22,'N',3000378,'N','Y','N','LAR_Exencion_Ganancias','LAR_Exencion_Ganancias',100,TO_DATE('2017-01-02 12:04:09','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-01-02 12:04:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/01/2017 12:04:09 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001969 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/01/2017 12:04:09 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001970,533,'LAR',0,'N','N','N',131089,'N','N',22,'N',3000379,'N','Y','N','LAR_Importe_Exencion_Ganancias','LAR_Importe_Exencion_Ganancias',100,TO_DATE('2017-01-02 12:04:09','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-01-02 12:04:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/01/2017 12:04:09 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001970 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/01/2017 12:04:09 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001971,533,'LAR',0,'N','N','N',30,'N','N',10,'N',3000380,'N','Y','N','LAR_NroCertificado_Ganancias','LAR_NroCertificado_Ganancias',100,TO_DATE('2017-01-02 12:04:09','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-01-02 12:04:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/01/2017 12:04:09 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001971 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/01/2017 12:04:09 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001972,533,'LAR',0,'N','N','N',29,'N','N',16,'N',3000381,'N','Y','N','LAR_Vencimiento_Cert_Ganancias','LAR_Vencimiento_Cert_Ganancias',100,TO_DATE('2017-01-02 12:04:09','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-01-02 12:04:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/01/2017 12:04:09 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001972 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/01/2017 12:04:10 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001973,533,'LAR',0,'N','N','N',1,'N','N',20,'N',3000394,'N','Y','N','LAR_Exento_Ret_IIBB','LAR_Exento_Ret_IIBB',100,TO_DATE('2017-01-02 12:04:09','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-01-02 12:04:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/01/2017 12:04:10 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001973 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/01/2017 12:04:10 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001974,533,'LAR',0,'N','N','N',131089,'N','N',22,'N',3000382,'N','Y','N','LAR_Exencion_IIBB','LAR_Exencion_IIBB',100,TO_DATE('2017-01-02 12:04:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-01-02 12:04:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/01/2017 12:04:10 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001974 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/01/2017 12:04:10 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001975,533,'LAR',0,'N','N','N',131089,'N','N',22,'N',3000383,'N','Y','N','LAR_Importe_Exencion_IIBB','LAR_Importe_Exencion_IIBB',100,TO_DATE('2017-01-02 12:04:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-01-02 12:04:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/01/2017 12:04:10 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001975 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/01/2017 12:04:10 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001976,533,'LAR',0,'N','N','N',30,'N','N',10,'N',3000384,'N','Y','N','LAR_NroCertificado_IIBB','LAR_NroCertificado_IIBB',100,TO_DATE('2017-01-02 12:04:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-01-02 12:04:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/01/2017 12:04:10 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001976 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/01/2017 12:04:10 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001977,533,'LAR',0,'N','N','N',29,'N','N',16,'N',3000426,'N','Y','N','LAR_Inicio_Cert_IIBB','LAR_Inicio_Cert_IIBB',100,TO_DATE('2017-01-02 12:04:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-01-02 12:04:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/01/2017 12:04:10 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001977 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/01/2017 12:04:10 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001978,533,'LAR',0,'N','N','N',29,'N','N',16,'N',3000385,'N','Y','N','LAR_Vencimiento_Cert_IIBB','LAR_Vencimiento_Cert_IIBB',100,TO_DATE('2017-01-02 12:04:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-01-02 12:04:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/01/2017 12:04:10 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001978 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/01/2017 12:04:11 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001979,533,'LAR',0,'N','N','N',1,'N','N',20,'N',3000386,'N','Y','N','El Socio del Negocio está exento a recibir Retenciones de IVA','LAR_Exento_Retenciones_IVA','LAR_Exento_Retenciones_IVA',100,TO_DATE('2017-01-02 12:04:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-01-02 12:04:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/01/2017 12:04:11 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001979 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/01/2017 12:04:11 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001980,533,'LAR',0,'N','N','N',131089,'N','N',22,'N',3000387,'N','Y','N','LAR_Exencion_IVA','LAR_Exencion_IVA',100,TO_DATE('2017-01-02 12:04:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-01-02 12:04:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/01/2017 12:04:11 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001980 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/01/2017 12:04:11 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001981,533,'LAR',0,'N','N','N',131089,'N','N',22,'N',3000388,'N','Y','N','LAR_Importe_Exencion_IVA','LAR_Importe_Exencion_IVA',100,TO_DATE('2017-01-02 12:04:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-01-02 12:04:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/01/2017 12:04:11 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001981 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/01/2017 12:04:11 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001982,533,'LAR',0,'N','N','N',30,'N','N',10,'N',3000389,'N','Y','N','LAR_NroCertificado_IVA','LAR_NroCertificado_IVA',100,TO_DATE('2017-01-02 12:04:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-01-02 12:04:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/01/2017 12:04:11 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001982 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/01/2017 12:04:11 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001983,533,'LAR',0,'N','N','N',29,'N','N',16,'N',3000390,'N','Y','N','LAR_Vencimiento_Cert_IVA','LAR_Vencimiento_Cert_IVA',100,TO_DATE('2017-01-02 12:04:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-01-02 12:04:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/01/2017 12:04:11 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001983 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/01/2017 12:04:11 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001984,533,'LAR',0,'N','N','N',1,'N','N',20,'N',3000420,'N','Y','N','LAR_Exento_Retenciones_SUSS','LAR_Exento_Retenciones_SUSS',100,TO_DATE('2017-01-02 12:04:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-01-02 12:04:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/01/2017 12:04:11 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001984 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/01/2017 12:04:12 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001985,533,'LAR',0,'N','N','N',131089,'N','N',22,'N',3000421,'N','Y','N','LAR_Exencion_SUSS','LAR_Exencion_SUSS',100,TO_DATE('2017-01-02 12:04:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-01-02 12:04:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/01/2017 12:04:12 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001985 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/01/2017 12:04:12 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001986,533,'LAR',0,'N','N','N',131089,'N','N',22,'N',3000422,'N','Y','N','LAR_Importe_Exencion_SUSS','LAR_Importe_Exencion_SUSS',100,TO_DATE('2017-01-02 12:04:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-01-02 12:04:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/01/2017 12:04:12 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001986 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/01/2017 12:04:12 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001987,533,'LAR',0,'N','N','N',30,'N','N',10,'N',3000423,'N','Y','N','LAR_NroCertificado_SUSS','LAR_NroCertificado_SUSS',100,TO_DATE('2017-01-02 12:04:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-01-02 12:04:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/01/2017 12:04:12 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001987 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/01/2017 12:04:13 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001988,533,'LAR',0,'N','N','N',29,'N','N',16,'N',3000424,'N','Y','N','LAR_Inicio_Cert_SUSS','LAR_Inicio_Cert_SUSS',100,TO_DATE('2017-01-02 12:04:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-01-02 12:04:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/01/2017 12:04:13 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001988 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/01/2017 12:04:13 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001989,533,'LAR',0,'N','N','N',29,'N','N',16,'N',3000425,'N','Y','N','LAR_Vencimiento_Cert_SUSS','LAR_Vencimiento_Cert_SUSS',100,TO_DATE('2017-01-02 12:04:13','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-01-02 12:04:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/01/2017 12:04:13 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001989 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/01/2017 12:05:11 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003019,131089,'Y','N','N',3001969,'N','Y',441,'N','LAR','LAR_Exencion_Ganancias',100,0,'Y',TO_DATE('2017-01-02 12:05:10','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-01-02 12:05:10','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/01/2017 12:05:11 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003019 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/01/2017 12:05:11 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003020,131089,'Y','N','N',3001974,'N','Y',441,'N','LAR','LAR_Exencion_IIBB',100,0,'Y',TO_DATE('2017-01-02 12:05:11','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-01-02 12:05:11','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/01/2017 12:05:11 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003020 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/01/2017 12:05:11 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003021,131089,'Y','N','N',3001980,'N','Y',441,'N','LAR','LAR_Exencion_IVA',100,0,'Y',TO_DATE('2017-01-02 12:05:11','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-01-02 12:05:11','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/01/2017 12:05:11 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003021 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/01/2017 12:05:11 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003022,131089,'Y','N','N',3001985,'N','Y',441,'N','LAR','LAR_Exencion_SUSS',100,0,'Y',TO_DATE('2017-01-02 12:05:11','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-01-02 12:05:11','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/01/2017 12:05:11 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003022 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/01/2017 12:05:11 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003023,1,'Y','N','N',3001979,'N','Y',441,'N','LAR','El Socio del Negocio está exento a recibir Retenciones de IVA','LAR_Exento_Retenciones_IVA',100,0,'Y',TO_DATE('2017-01-02 12:05:11','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-01-02 12:05:11','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/01/2017 12:05:11 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003023 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/01/2017 12:05:12 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003024,1,'Y','N','N',3001984,'N','Y',441,'N','LAR','LAR_Exento_Retenciones_SUSS',100,0,'Y',TO_DATE('2017-01-02 12:05:11','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-01-02 12:05:11','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/01/2017 12:05:12 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003024 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/01/2017 12:05:12 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003025,1,'Y','N','N',3001968,'N','Y',441,'N','LAR','LAR_Exento_Ret_Ganancias',100,0,'Y',TO_DATE('2017-01-02 12:05:12','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-01-02 12:05:12','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/01/2017 12:05:12 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003025 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/01/2017 12:05:12 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003026,1,'Y','N','N',3001973,'N','Y',441,'N','LAR','LAR_Exento_Ret_IIBB',100,0,'Y',TO_DATE('2017-01-02 12:05:12','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-01-02 12:05:12','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/01/2017 12:05:12 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003026 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/01/2017 12:05:12 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003027,131089,'Y','N','N',3001970,'N','Y',441,'N','LAR','LAR_Importe_Exencion_Ganancias',100,0,'Y',TO_DATE('2017-01-02 12:05:12','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-01-02 12:05:12','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/01/2017 12:05:12 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003027 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/01/2017 12:05:12 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003028,131089,'Y','N','N',3001975,'N','Y',441,'N','LAR','LAR_Importe_Exencion_IIBB',100,0,'Y',TO_DATE('2017-01-02 12:05:12','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-01-02 12:05:12','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/01/2017 12:05:12 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003028 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/01/2017 12:05:12 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003029,131089,'Y','N','N',3001981,'N','Y',441,'N','LAR','LAR_Importe_Exencion_IVA',100,0,'Y',TO_DATE('2017-01-02 12:05:12','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-01-02 12:05:12','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/01/2017 12:05:12 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003029 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/01/2017 12:05:13 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003030,131089,'Y','N','N',3001986,'N','Y',441,'N','LAR','LAR_Importe_Exencion_SUSS',100,0,'Y',TO_DATE('2017-01-02 12:05:12','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-01-02 12:05:12','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/01/2017 12:05:13 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003030 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/01/2017 12:05:13 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003031,29,'Y','N','N',3001977,'N','Y',441,'N','LAR','LAR_Inicio_Cert_IIBB',100,0,'Y',TO_DATE('2017-01-02 12:05:13','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-01-02 12:05:13','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/01/2017 12:05:13 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003031 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/01/2017 12:05:13 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003032,29,'Y','N','N',3001988,'N','Y',441,'N','LAR','LAR_Inicio_Cert_SUSS',100,0,'Y',TO_DATE('2017-01-02 12:05:13','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-01-02 12:05:13','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/01/2017 12:05:13 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003032 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/01/2017 12:05:13 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003033,30,'Y','N','N',3001971,'N','Y',441,'N','LAR','LAR_NroCertificado_Ganancias',100,0,'Y',TO_DATE('2017-01-02 12:05:13','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-01-02 12:05:13','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/01/2017 12:05:13 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003033 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/01/2017 12:05:13 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003034,30,'Y','N','N',3001976,'N','Y',441,'N','LAR','LAR_NroCertificado_IIBB',100,0,'Y',TO_DATE('2017-01-02 12:05:13','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-01-02 12:05:13','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/01/2017 12:05:13 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003034 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/01/2017 12:05:14 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003035,30,'Y','N','N',3001982,'N','Y',441,'N','LAR','LAR_NroCertificado_IVA',100,0,'Y',TO_DATE('2017-01-02 12:05:13','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-01-02 12:05:13','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/01/2017 12:05:14 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003035 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/01/2017 12:05:14 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003036,30,'Y','N','N',3001987,'N','Y',441,'N','LAR','LAR_NroCertificado_SUSS',100,0,'Y',TO_DATE('2017-01-02 12:05:14','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-01-02 12:05:14','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/01/2017 12:05:14 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003036 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/01/2017 12:05:14 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003037,1,'Y','N','N',3001967,'N','Y',441,'N','LAR','LAR_TipoGanancias',100,0,'Y',TO_DATE('2017-01-02 12:05:14','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-01-02 12:05:14','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/01/2017 12:05:14 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003037 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/01/2017 12:05:14 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003038,29,'Y','N','N',3001972,'N','Y',441,'N','LAR','LAR_Vencimiento_Cert_Ganancias',100,0,'Y',TO_DATE('2017-01-02 12:05:14','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-01-02 12:05:14','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/01/2017 12:05:14 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003038 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/01/2017 12:05:14 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003039,29,'Y','N','N',3001978,'N','Y',441,'N','LAR','LAR_Vencimiento_Cert_IIBB',100,0,'Y',TO_DATE('2017-01-02 12:05:14','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-01-02 12:05:14','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/01/2017 12:05:14 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003039 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/01/2017 12:05:14 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003040,29,'Y','N','N',3001983,'N','Y',441,'N','LAR','LAR_Vencimiento_Cert_IVA',100,0,'Y',TO_DATE('2017-01-02 12:05:14','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-01-02 12:05:14','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/01/2017 12:05:14 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003040 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/01/2017 12:05:15 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003041,29,'Y','N','N',3001989,'N','Y',441,'N','LAR','LAR_Vencimiento_Cert_SUSS',100,0,'Y',TO_DATE('2017-01-02 12:05:14','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-01-02 12:05:14','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/01/2017 12:05:15 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003041 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/01/2017 12:09:40 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3003023
;

-- 02/01/2017 12:09:40 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3003021
;

-- 02/01/2017 12:09:40 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3003029
;

-- 02/01/2017 12:09:40 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3003040
;

-- 02/01/2017 12:09:40 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3003035
;

-- 02/01/2017 12:09:40 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3003037
;

-- 02/01/2017 12:09:40 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3003025
;

-- 02/01/2017 12:09:40 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3003019
;

-- 02/01/2017 12:09:40 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3003027
;

-- 02/01/2017 12:09:40 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3003038
;

-- 02/01/2017 12:09:40 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3003033
;

-- 02/01/2017 12:09:40 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3003026
;

-- 02/01/2017 12:09:40 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3003020
;

-- 02/01/2017 12:09:40 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3003028
;

-- 02/01/2017 12:09:40 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3003031
;

-- 02/01/2017 12:09:40 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=3003039
;

-- 02/01/2017 12:09:40 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=680,IsDisplayed='Y' WHERE AD_Field_ID=3003034
;

-- 02/01/2017 12:09:41 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=690,IsDisplayed='Y' WHERE AD_Field_ID=3003024
;

-- 02/01/2017 12:09:41 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=700,IsDisplayed='Y' WHERE AD_Field_ID=3003022
;

-- 02/01/2017 12:09:41 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=710,IsDisplayed='Y' WHERE AD_Field_ID=3003030
;

-- 02/01/2017 12:09:41 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=720,IsDisplayed='Y' WHERE AD_Field_ID=3003032
;

-- 02/01/2017 12:09:41 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=730,IsDisplayed='Y' WHERE AD_Field_ID=3003041
;

-- 02/01/2017 12:09:41 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET SeqNo=740,IsDisplayed='Y' WHERE AD_Field_ID=3003036
;

-- 02/01/2017 12:10:22 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2017-01-02 12:10:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003029
;

-- 02/01/2017 12:10:53 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2017-01-02 12:10:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003019
;

-- 02/01/2017 12:11:02 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2017-01-02 12:11:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003019
;

-- 02/01/2017 12:11:39 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2017-01-02 12:11:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003028
;

-- 02/01/2017 12:11:54 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2017-01-02 12:11:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003039
;

-- 02/01/2017 12:12:02 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2017-01-02 12:12:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003041
;

-- 02/01/2017 12:12:16 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2017-01-02 12:12:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003030
;

-- 02/01/2017 12:14:47 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET DisplayLength=22,Updated=TO_DATE('2017-01-02 12:14:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003028
;

-- 02/01/2017 12:14:54 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET DisplayLength=22,Updated=TO_DATE('2017-01-02 12:14:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003029
;

-- 02/01/2017 12:14:59 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET DisplayLength=22,Updated=TO_DATE('2017-01-02 12:14:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003030
;

-- 02/01/2017 12:15:31 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET FieldLength=22,Updated=TO_DATE('2017-01-02 12:15:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001969
;

-- 02/01/2017 12:15:35 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET FieldLength=22,Updated=TO_DATE('2017-01-02 12:15:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001974
;

-- 02/01/2017 12:15:38 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET FieldLength=22,Updated=TO_DATE('2017-01-02 12:15:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001980
;

-- 02/01/2017 12:15:42 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET FieldLength=22,Updated=TO_DATE('2017-01-02 12:15:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001985
;

-- 02/01/2017 12:15:52 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET FieldLength=22,Updated=TO_DATE('2017-01-02 12:15:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001970
;

-- 02/01/2017 12:15:54 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET FieldLength=22,Updated=TO_DATE('2017-01-02 12:15:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001975
;

-- 02/01/2017 12:15:57 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET FieldLength=22,Updated=TO_DATE('2017-01-02 12:15:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001981
;

-- 02/01/2017 12:16:02 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET FieldLength=22,Updated=TO_DATE('2017-01-02 12:16:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001986
;

-- 02/01/2017 12:16:15 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET FieldLength=14, AD_Reference_ID=15,Updated=TO_DATE('2017-01-02 12:16:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001977
;

-- 02/01/2017 12:16:21 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET FieldLength=14, AD_Reference_ID=15,Updated=TO_DATE('2017-01-02 12:16:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001988
;

-- 02/01/2017 12:16:44 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET FieldLength=22, AD_Reference_ID=15,Updated=TO_DATE('2017-01-02 12:16:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001972
;

-- 02/01/2017 12:16:52 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET FieldLength=14, AD_Reference_ID=15,Updated=TO_DATE('2017-01-02 12:16:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001978
;

-- 02/01/2017 12:17:00 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET FieldLength=14, AD_Reference_ID=15,Updated=TO_DATE('2017-01-02 12:17:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001983
;

-- 02/01/2017 12:17:08 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET FieldLength=14, AD_Reference_ID=15,Updated=TO_DATE('2017-01-02 12:17:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001989
;

-- 02/01/2017 12:17:28 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET DisplayLength=20,Updated=TO_DATE('2017-01-02 12:17:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003033
;

-- 02/01/2017 12:17:32 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET DisplayLength=20,Updated=TO_DATE('2017-01-02 12:17:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003034
;

-- 02/01/2017 12:17:35 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET DisplayLength=20,Updated=TO_DATE('2017-01-02 12:17:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003035
;

-- 02/01/2017 12:17:38 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET DisplayLength=20,Updated=TO_DATE('2017-01-02 12:17:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003036
;

-- 02/01/2017 12:18:35 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET DisplayLength=22,Updated=TO_DATE('2017-01-02 12:18:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003019
;

-- 02/01/2017 12:18:37 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET DisplayLength=22,Updated=TO_DATE('2017-01-02 12:18:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003020
;

-- 02/01/2017 12:18:40 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET DisplayLength=22,Updated=TO_DATE('2017-01-02 12:18:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003021
;

-- 02/01/2017 12:18:42 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET DisplayLength=22,Updated=TO_DATE('2017-01-02 12:18:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003022
;

-- 02/01/2017 12:18:49 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET DisplayLength=22,Updated=TO_DATE('2017-01-02 12:18:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003027
;

-- 02/01/2017 12:19:01 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET DisplayLength=14,Updated=TO_DATE('2017-01-02 12:19:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003031
;

-- 02/01/2017 12:19:03 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET DisplayLength=14,Updated=TO_DATE('2017-01-02 12:19:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003032
;

-- 02/01/2017 12:19:19 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET DisplayLength=14,Updated=TO_DATE('2017-01-02 12:19:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003038
;

-- 02/01/2017 12:19:21 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET DisplayLength=14,Updated=TO_DATE('2017-01-02 12:19:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003039
;

-- 02/01/2017 12:19:27 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET DisplayLength=14,Updated=TO_DATE('2017-01-02 12:19:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003040
;

-- 02/01/2017 12:19:30 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET DisplayLength=14,Updated=TO_DATE('2017-01-02 12:19:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003041
;

-- 02/01/2017 12:26:33 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2017-01-02 12:26:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003027
;

-- 02/01/2017 12:26:55 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2017-01-02 12:26:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003033
;

-- 02/01/2017 12:27:23 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2017-01-02 12:27:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003035
;

-- 02/01/2017 12:29:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE AD_Column SET AD_Reference_Value_ID=3000055, AD_Reference_ID=17,Updated=TO_DATE('2017-01-02 12:29:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001967
;

-- Registración de script
SELECT register_migration_script_lar('0081_ISSUE-81.sql', 'LAR', '') FROM dual
;
