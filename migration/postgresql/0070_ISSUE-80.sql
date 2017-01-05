CREATE TABLE LAR_Tarjeta_Credito
(
  LAR_Tarjeta_Credito_ID numeric(10,0) NOT NULL,
  ad_client_id numeric(10,0) NOT NULL,
  ad_org_id numeric(10,0) NOT NULL,
  isactive character(1) NOT NULL DEFAULT 'Y'::bpchar,
  created timestamp without time zone NOT NULL DEFAULT now(),
  createdby numeric(10,0) NOT NULL,
  updated timestamp without time zone NOT NULL DEFAULT now(),
  updatedby numeric(10,0) NOT NULL,
  name character varying(60) NOT NULL,
  description character varying(255),
  CONSTRAINT LAR_Tarjeta_Credito_pkey PRIMARY KEY (LAR_Tarjeta_Credito_ID),
  CONSTRAINT LAR_Tarjeta_Credito_isactive_check CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
);

CREATE TABLE LAR_Medio_Pago(
  LAR_Medio_Pago_id numeric(10,0) NOT NULL,
  ad_client_id numeric(10,0) NOT NULL,
  ad_org_id numeric(10,0) NOT NULL,
  isactive character(1) NOT NULL DEFAULT 'Y'::bpchar,
  created timestamp without time zone NOT NULL DEFAULT now(),
  createdby numeric(10,0) NOT NULL,
  updated timestamp without time zone NOT NULL DEFAULT now(),
  updatedby numeric(10,0) NOT NULL,
  TenderType character(1) NOT NULL,
  LAR_Tarjeta_Credito_ID numeric(10,0),
  CONSTRAINT LAR_Medio_Pago_pkey PRIMARY KEY (LAR_Medio_Pago_id),
  CONSTRAINT LAR_Medio_Pago_isactive_check CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])),
  CONSTRAINT LARMedioPago_LARTajetaCredito FOREIGN KEY (LAR_Tarjeta_Credito_ID)
      REFERENCES LAR_Tarjeta_Credito (LAR_Tarjeta_Credito_ID)
);

CREATE TABLE LAR_Plan_Pago(
  LAR_Plan_Pago_ID numeric(10,0) NOT NULL,
  ad_client_id numeric(10,0) NOT NULL,
  ad_org_id numeric(10,0) NOT NULL,
  isactive character(1) NOT NULL DEFAULT 'Y'::bpchar,
  created timestamp without time zone NOT NULL DEFAULT now(),
  createdby numeric(10,0) NOT NULL,
  updated timestamp without time zone NOT NULL DEFAULT now(),
  updatedby numeric(10,0) NOT NULL,
  LAR_Medio_Pago_ID numeric(10,0) NOT NULL,
  cuota_inicial numeric(2,0) NOT NULL,
  cuota_final numeric (2,0)NOT NULL,
  descuento numeric(10,2) NOT NULL,
  CONSTRAINT LAR_Plan_Pago_pkey PRIMARY KEY (LAR_Plan_Pago_ID),
  CONSTRAINT LAR_Plan_Pago_isactive_check CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])),
  CONSTRAINT LARPlanPago_LARMedioPago FOREIGN KEY (LAR_Medio_Pago_ID)
      REFERENCES LAR_Medio_Pago (LAR_Medio_Pago_ID)
);

ALTER TABLE LAR_Tarjeta_Credito ADD COLUMN CreditCardType character(1);

ALTER TABLE C_Payment ADD COLUMN LAR_Tarjeta_Credito_ID numeric(10,0),
ADD FOREIGN KEY (LAR_Tarjeta_Credito_ID)
      REFERENCES LAR_Tarjeta_Credito (LAR_Tarjeta_Credito_ID) MATCH SIMPLE;

ALTER TABLE C_Payment ADD COLUMN LAR_Plan_Pago_ID numeric(10,0),
ADD FOREIGN KEY (LAR_Plan_Pago_ID)
      REFERENCES LAR_Plan_Pago (LAR_Plan_Pago_ID) MATCH SIMPLE;

ALTER TABLE LAR_Plan_Pago ADD COLUMN Name character varying(40);

ALTER TABLE C_Order ADD COLUMN Importe_Descuento numeric(10,2) DEFAULT 0.00;

CREATE UNIQUE INDEX LAR_Plan_Pago_Unique ON LAR_Plan_Pago (LAR_Medio_Pago_ID, Cuota_Inicial, Cuota_Final);

ALTER TABLE C_Invoice ADD COLUMN Descuento numeric(10,2) DEFAULT 0.00;

-- 24/06/2015 14:41:52 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,IsHighVolume,ImportTable,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','3',0,3000031,'N','N','N','N','N','LAR','Y','Y','L','LAR_Tarjeta_Credito','LAR_Tarjeta_Credito',0,'Y',0,100,TO_TIMESTAMP('2015-06-24 14:41:52','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2015-06-24 14:41:52','YYYY-MM-DD HH24:MI:SS'))
;

-- 24/06/2015 14:41:52 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000031 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- 24/06/2015 14:41:53 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,AD_Client_ID,Updated,UpdatedBy,Created,CreatedBy,IsActive,StartNo) VALUES (1,'N',200000,'Y',1000000,'N','Y',3000139,'Table LAR_Tarjeta_Credito','LAR_Tarjeta_Credito',0,0,TO_TIMESTAMP('2015-06-24 14:41:52','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2015-06-24 14:41:52','YYYY-MM-DD HH24:MI:SS'),100,'Y',1000000)
;

-- 24/06/2015 14:42:38 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000209,'LAR_Tarjeta_Credito_ID','LAR','LAR_Tarjeta_Credito','LAR_Tarjeta_Credito',0,TO_TIMESTAMP('2015-06-24 14:42:38','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2015-06-24 14:42:38','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 24/06/2015 14:42:38 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000209 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 24/06/2015 14:42:38 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001045,3000031,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3000209,'N','N','N','LAR_Tarjeta_Credito','LAR_Tarjeta_Credito_ID',100,TO_TIMESTAMP('2015-06-24 14:42:38','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 14:42:38','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 14:42:38 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001045 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 14:42:38 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001046,3000031,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,TO_TIMESTAMP('2015-06-24 14:42:38','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 14:42:38','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 14:42:38 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001046 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 14:42:39 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001047,3000031,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',100,TO_TIMESTAMP('2015-06-24 14:42:38','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 14:42:38','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 14:42:39 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001047 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 14:42:39 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001048,3000031,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,TO_TIMESTAMP('2015-06-24 14:42:39','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 14:42:39','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 14:42:39 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001048 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 14:42:39 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001049,3000031,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,TO_TIMESTAMP('2015-06-24 14:42:39','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 14:42:39','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 14:42:39 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001049 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 14:42:39 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001050,3000031,'LAR',0,110,'Y','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,TO_TIMESTAMP('2015-06-24 14:42:39','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 14:42:39','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 14:42:39 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001050 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 14:42:39 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001051,3000031,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,TO_TIMESTAMP('2015-06-24 14:42:39','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 14:42:39','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 14:42:39 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001051 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 14:42:39 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001052,3000031,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,TO_TIMESTAMP('2015-06-24 14:42:39','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 14:42:39','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 14:42:39 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001052 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 14:42:40 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001053,3000031,'LAR',0,'Y','N','Y',1,'The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.','N',60,'Y',10,'N',469,'N','Y','N','Alphanumeric identifier of the entity','Name','Name',100,TO_TIMESTAMP('2015-06-24 14:42:39','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 14:42:39','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 14:42:40 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001053 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 14:42:40 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001054,3000031,'LAR',0,'Y','N','N','A search key allows you a fast method of finding a particular record.
If you leave the search key empty, the system automatically creates a numeric number.  The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).','N',40,'Y',10,'N',620,'N','Y','N','Search key for the record in the format required - must be unique','Search Key','Value',100,TO_TIMESTAMP('2015-06-24 14:42:40','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 14:42:40','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 14:42:40 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001054 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 14:42:40 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001055,3000031,'LAR',0,'N','N','N','A description is limited to 255 characters.','N',255,'Y',10,'N',275,'N','Y','N','Optional short description of the record','Description','Description',100,TO_TIMESTAMP('2015-06-24 14:42:40','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 14:42:40','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 14:42:40 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001055 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 14:44:26 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Column SET IsUpdateable='N', Name='Tarjeta de Crédito', IsAllowCopy='N',Updated=TO_TIMESTAMP('2015-06-24 14:44:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001045
;

-- 24/06/2015 14:44:26 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001045
;

-- 24/06/2015 14:44:26 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET Name='Tarjeta de Crédito', Description=NULL, Help=NULL WHERE AD_Column_ID=3001045 AND IsCentrallyMaintained='Y'
;

-- 24/06/2015 14:47:25 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Element SET Name='Tarjeta de Crédito', PrintName='Tarjeta de Crédito',Updated=TO_TIMESTAMP('2015-06-24 14:47:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000209
;

-- 24/06/2015 14:47:25 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000209
;

-- 24/06/2015 14:47:25 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Column SET ColumnName='LAR_Tarjeta_Credito_ID', Name='Tarjeta de Crédito', Description=NULL, Help=NULL WHERE AD_Element_ID=3000209
;

-- 24/06/2015 14:47:25 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Process_Para SET ColumnName='LAR_Tarjeta_Credito_ID', Name='Tarjeta de Crédito', Description=NULL, Help=NULL, AD_Element_ID=3000209 WHERE UPPER(ColumnName)='LAR_TARJETA_CREDITO_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 24/06/2015 14:47:25 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Process_Para SET ColumnName='LAR_Tarjeta_Credito_ID', Name='Tarjeta de Crédito', Description=NULL, Help=NULL WHERE AD_Element_ID=3000209 AND IsCentrallyMaintained='Y'
;

-- 24/06/2015 14:47:25 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET Name='Tarjeta de Crédito', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000209) AND IsCentrallyMaintained='Y'
;

-- 24/06/2015 14:47:25 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_PrintFormatItem SET PrintName='Tarjeta de Crédito', Name='Tarjeta de Crédito' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000209)
;

-- 24/06/2015 14:51:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Window (AD_Window_ID,WindowType,IsSOTrx,IsDefault,IsBetaFunctionality,WinHeight,WinWidth,EntityType,Name,IsActive,Created,CreatedBy,UpdatedBy,Updated,AD_Org_ID,AD_Client_ID,Processing) VALUES (3000026,'M','Y','N','N',0,0,'U','Tarjetas de Crédito','Y',TO_TIMESTAMP('2015-06-24 14:51:44','YYYY-MM-DD HH24:MI:SS'),100,100,TO_TIMESTAMP('2015-06-24 14:51:44','YYYY-MM-DD HH24:MI:SS'),0,0,'N')
;

-- 24/06/2015 14:51:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Window_Trl (AD_Language,AD_Window_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Window_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Window t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Window_ID=3000026 AND NOT EXISTS (SELECT * FROM AD_Window_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Window_ID=t.AD_Window_ID)
;

-- 24/06/2015 14:52:26 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('N',3000026,10,'N','N',3000031,3000052,'N','N','N','N',0,'Y','N','U','Tarjetas de Crédito',0,0,TO_TIMESTAMP('2015-06-24 14:52:26','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2015-06-24 14:52:26','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 24/06/2015 14:52:26 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000052 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 24/06/2015 14:52:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001860,1,'Y','N','N',3001048,'N','Y',3000052,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,'Y',TO_TIMESTAMP('2015-06-24 14:52:33','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-06-24 14:52:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 24/06/2015 14:52:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001860 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 24/06/2015 14:52:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001861,10,'Y','N','N',3001046,'N','Y',3000052,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,'Y',TO_TIMESTAMP('2015-06-24 14:52:33','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-06-24 14:52:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 24/06/2015 14:52:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001861 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 24/06/2015 14:52:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001862,255,'Y','N','N',3001055,'N','Y',3000052,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,'Y',TO_TIMESTAMP('2015-06-24 14:52:33','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-06-24 14:52:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 24/06/2015 14:52:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001862 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 24/06/2015 14:52:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001863,60,'Y','N','N',3001053,'N','Y',3000052,'N','The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.','LAR','Alphanumeric identifier of the entity','Name',100,0,'Y',TO_TIMESTAMP('2015-06-24 14:52:33','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-06-24 14:52:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 24/06/2015 14:52:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001863 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 24/06/2015 14:52:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001864,10,'Y','N','N',3001047,'N','Y',3000052,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,'Y',TO_TIMESTAMP('2015-06-24 14:52:33','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-06-24 14:52:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 24/06/2015 14:52:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001864 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 24/06/2015 14:52:34 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001865,40,'Y','N','N',3001054,'N','Y',3000052,'N','A search key allows you a fast method of finding a particular record.
If you leave the search key empty, the system automatically creates a numeric number.  The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).','LAR','Search key for the record in the format required - must be unique','Search Key',100,0,'Y',TO_TIMESTAMP('2015-06-24 14:52:33','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-06-24 14:52:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 24/06/2015 14:52:34 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001865 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 24/06/2015 14:52:34 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001866,10,'N','N','N',3001045,'N','Y',3000052,'N','LAR','Tarjeta de Crédito',100,0,'Y',TO_TIMESTAMP('2015-06-24 14:52:34','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-06-24 14:52:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 24/06/2015 14:52:34 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001866 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 24/06/2015 14:53:12 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Tab SET EntityType='LAR',Updated=TO_TIMESTAMP('2015-06-24 14:53:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000052
;

-- 24/06/2015 14:53:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3001861
;

-- 24/06/2015 14:53:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3001864
;

-- 24/06/2015 14:53:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3001863
;

-- 24/06/2015 14:53:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3001865
;

-- 24/06/2015 14:53:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3001862
;

-- 24/06/2015 14:53:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3001860
;

-- 24/06/2015 14:54:19 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2015-06-24 14:54:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001864
;

-- 24/06/2015 14:54:20 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2015-06-24 14:54:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001865
;

-- 24/06/2015 14:54:27 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2015-06-24 14:54:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001863
;

-- 24/06/2015 14:54:37 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2015-06-24 14:54:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001865
;

-- 24/06/2015 14:57:05 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Menu (AD_Window_ID,AD_Menu_ID,IsSummary,"action",IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000026,3000099,'N','W','N','N','LAR','Y','Tarjetas de Crédito',TO_TIMESTAMP('2015-06-24 14:57:05','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_TIMESTAMP('2015-06-24 14:57:05','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 24/06/2015 14:57:05 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000099 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 24/06/2015 14:57:05 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100,t.AD_Tree_ID, 3000099, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000099)
;

-- 24/06/2015 15:58:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,IsHighVolume,ImportTable,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','3',0,3000032,'N','N','N','N','N','LAR','Y','Y','L','LAR_Medio_Pago','LAR_Medio_Pago',0,'Y',0,100,TO_TIMESTAMP('2015-06-24 15:58:44','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2015-06-24 15:58:44','YYYY-MM-DD HH24:MI:SS'))
;

-- 24/06/2015 15:58:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000032 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- 24/06/2015 15:58:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,AD_Client_ID,Updated,UpdatedBy,Created,CreatedBy,IsActive,StartNo) VALUES (1,'N',200000,'Y',1000000,'N','Y',3000140,'Table LAR_Medio_Pago','LAR_Medio_Pago',0,0,TO_TIMESTAMP('2015-06-24 15:58:45','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2015-06-24 15:58:45','YYYY-MM-DD HH24:MI:SS'),100,'Y',1000000)
;

-- 24/06/2015 15:59:18 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000210,'LAR_Medio_Pago_ID','LAR','LAR_Medio_Pago','LAR_Medio_Pago',0,TO_TIMESTAMP('2015-06-24 15:59:18','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2015-06-24 15:59:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 24/06/2015 15:59:18 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000210 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 24/06/2015 15:59:18 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001056,3000032,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3000210,'N','N','N','LAR_Medio_Pago','LAR_Medio_Pago_ID',100,TO_TIMESTAMP('2015-06-24 15:59:18','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 15:59:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 15:59:18 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001056 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 15:59:19 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001057,3000032,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,TO_TIMESTAMP('2015-06-24 15:59:18','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 15:59:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 15:59:19 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001057 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 15:59:19 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001058,3000032,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',100,TO_TIMESTAMP('2015-06-24 15:59:19','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 15:59:19','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 15:59:19 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001058 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 15:59:19 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001059,3000032,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,TO_TIMESTAMP('2015-06-24 15:59:19','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 15:59:19','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 15:59:19 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001059 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 15:59:19 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001060,3000032,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,TO_TIMESTAMP('2015-06-24 15:59:19','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 15:59:19','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 15:59:19 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001060 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 15:59:19 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001061,3000032,'LAR',0,110,'Y','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,TO_TIMESTAMP('2015-06-24 15:59:19','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 15:59:19','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 15:59:19 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001061 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 15:59:19 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001062,3000032,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,TO_TIMESTAMP('2015-06-24 15:59:19','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 15:59:19','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 15:59:19 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001062 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 15:59:20 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001063,3000032,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,TO_TIMESTAMP('2015-06-24 15:59:19','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 15:59:19','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 15:59:20 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001063 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 15:59:20 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001064,3000032,'LAR',0,'Y','N','N','The Tender Type indicates the method of payment (ACH or Direct Deposit, Credit Card, Check, Direct Debit)','N',1,'N',20,'N',1441,'N','Y','N','Method of Payment','Tender type','TenderType',100,TO_TIMESTAMP('2015-06-24 15:59:20','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 15:59:20','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 15:59:20 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001064 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 15:59:20 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001065,3000032,'LAR',0,'N','N','N','N',10,'N',19,'N',3000209,'N','Y','N','Tarjeta de Crédito','LAR_Tarjeta_Credito_ID',100,TO_TIMESTAMP('2015-06-24 15:59:20','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 15:59:20','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 15:59:20 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001065 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 16:01:52 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,IsHighVolume,ImportTable,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','3',0,3000033,'N','N','N','N','N','LAR','Y','Y','L','LAR_Plan_Pago','LAR_Plan_Pago',0,'Y',0,100,TO_TIMESTAMP('2015-06-24 16:01:52','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2015-06-24 16:01:52','YYYY-MM-DD HH24:MI:SS'))
;

-- 24/06/2015 16:01:52 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000033 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- 24/06/2015 16:01:52 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,AD_Client_ID,Updated,UpdatedBy,Created,CreatedBy,IsActive,StartNo) VALUES (1,'N',200000,'Y',1000000,'N','Y',3000141,'Table LAR_Plan_Pago','LAR_Plan_Pago',0,0,TO_TIMESTAMP('2015-06-24 16:01:52','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2015-06-24 16:01:52','YYYY-MM-DD HH24:MI:SS'),100,'Y',1000000)
;

-- 24/06/2015 16:01:58 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000211,'LAR_Plan_Pago_ID','LAR','LAR_Plan_Pago','LAR_Plan_Pago',0,TO_TIMESTAMP('2015-06-24 16:01:58','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2015-06-24 16:01:58','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 24/06/2015 16:01:58 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000211 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 24/06/2015 16:01:58 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001066,3000033,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3000211,'N','N','N','LAR_Plan_Pago','LAR_Plan_Pago_ID',100,TO_TIMESTAMP('2015-06-24 16:01:58','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 16:01:58','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 16:01:58 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001066 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 16:01:58 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001067,3000033,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,TO_TIMESTAMP('2015-06-24 16:01:58','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 16:01:58','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 16:01:58 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001067 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 16:01:58 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001068,3000033,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',100,TO_TIMESTAMP('2015-06-24 16:01:58','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 16:01:58','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 16:01:58 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001068 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 16:01:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001069,3000033,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,TO_TIMESTAMP('2015-06-24 16:01:58','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 16:01:58','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 16:01:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001069 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 16:01:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001070,3000033,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,TO_TIMESTAMP('2015-06-24 16:01:59','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 16:01:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 16:01:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001070 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 16:01:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001071,3000033,'LAR',0,110,'Y','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,TO_TIMESTAMP('2015-06-24 16:01:59','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 16:01:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 16:01:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001071 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 16:01:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001072,3000033,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,TO_TIMESTAMP('2015-06-24 16:01:59','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 16:01:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 16:01:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001072 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 16:01:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001073,3000033,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,TO_TIMESTAMP('2015-06-24 16:01:59','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 16:01:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 16:01:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001073 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 16:01:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001074,3000033,'LAR',0,'Y','N','N','N',10,'N',19,'N',3000210,'N','Y','N','LAR_Medio_Pago','LAR_Medio_Pago_ID',100,TO_TIMESTAMP('2015-06-24 16:01:59','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 16:01:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 16:01:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001074 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 16:02:00 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000212,'cuota_inicial','LAR','cuota_inicial','cuota_inicial',0,TO_TIMESTAMP('2015-06-24 16:01:59','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2015-06-24 16:01:59','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 24/06/2015 16:02:00 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000212 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 24/06/2015 16:02:00 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001075,3000033,'LAR',0,'Y','N','N','N',2,'N',22,'N',3000212,'N','Y','N','cuota_inicial','cuota_inicial',100,TO_TIMESTAMP('2015-06-24 16:01:59','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 16:01:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 16:02:00 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001075 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 16:02:00 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000213,'cuota_final','LAR','cuota_final','cuota_final',0,TO_TIMESTAMP('2015-06-24 16:02:00','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2015-06-24 16:02:00','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 24/06/2015 16:02:00 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000213 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 24/06/2015 16:02:00 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001076,3000033,'LAR',0,'Y','N','N','N',2,'N',22,'N',3000213,'N','Y','N','cuota_final','cuota_final',100,TO_TIMESTAMP('2015-06-24 16:02:00','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 16:02:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 16:02:00 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001076 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 16:02:00 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000214,'descuento','LAR','descuento','descuento',0,TO_TIMESTAMP('2015-06-24 16:02:00','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2015-06-24 16:02:00','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 24/06/2015 16:02:00 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000214 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 24/06/2015 16:02:00 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001077,3000033,'LAR',0,'Y','N','N','N',10,'N',11,'N',3000214,'N','Y','N','descuento','descuento',100,TO_TIMESTAMP('2015-06-24 16:02:00','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-06-24 16:02:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/06/2015 16:02:00 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001077 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/06/2015 16:02:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Column SET Name='Cuota Final', ColumnName='Cuota_Final',Updated=TO_TIMESTAMP('2015-06-24 16:02:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001076
;

-- 24/06/2015 16:02:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001076
;

-- 24/06/2015 16:02:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET Name='Cuota Final', Description=NULL, Help=NULL WHERE AD_Column_ID=3001076 AND IsCentrallyMaintained='Y'
;

-- 24/06/2015 16:03:14 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Element SET ColumnName='Cuota_Final', Name='Cuota Final', PrintName='Cuota Final',Updated=TO_TIMESTAMP('2015-06-24 16:03:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000213
;

-- 24/06/2015 16:03:14 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000213
;

-- 24/06/2015 16:03:14 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Column SET ColumnName='Cuota_Final', Name='Cuota Final', Description=NULL, Help=NULL WHERE AD_Element_ID=3000213
;

-- 24/06/2015 16:03:14 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Process_Para SET ColumnName='Cuota_Final', Name='Cuota Final', Description=NULL, Help=NULL, AD_Element_ID=3000213 WHERE UPPER(ColumnName)='CUOTA_FINAL' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 24/06/2015 16:03:14 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Process_Para SET ColumnName='Cuota_Final', Name='Cuota Final', Description=NULL, Help=NULL WHERE AD_Element_ID=3000213 AND IsCentrallyMaintained='Y'
;

-- 24/06/2015 16:03:14 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET Name='Cuota Final', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000213) AND IsCentrallyMaintained='Y'
;

-- 24/06/2015 16:03:14 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_PrintFormatItem SET PrintName='Cuota Final', Name='Cuota Final' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000213)
;

-- 24/06/2015 16:03:47 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Column SET ColumnName='Cuota_Inicial',Updated=TO_TIMESTAMP('2015-06-24 16:03:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001075
;

-- 24/06/2015 16:03:57 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Element SET ColumnName='Cuota_Inicial',Updated=TO_TIMESTAMP('2015-06-24 16:03:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000212
;

-- 24/06/2015 16:03:57 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Column SET ColumnName='Cuota_Inicial', Name='cuota_inicial', Description=NULL, Help=NULL WHERE AD_Element_ID=3000212
;

-- 24/06/2015 16:03:57 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Process_Para SET ColumnName='Cuota_Inicial', Name='cuota_inicial', Description=NULL, Help=NULL, AD_Element_ID=3000212 WHERE UPPER(ColumnName)='CUOTA_INICIAL' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 24/06/2015 16:03:57 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Process_Para SET ColumnName='Cuota_Inicial', Name='cuota_inicial', Description=NULL, Help=NULL WHERE AD_Element_ID=3000212 AND IsCentrallyMaintained='Y'
;

-- 24/06/2015 16:04:15 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Element SET Name='Cuota Inicial', PrintName='Cuota Inicial',Updated=TO_TIMESTAMP('2015-06-24 16:04:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000212
;

-- 24/06/2015 16:04:15 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000212
;

-- 24/06/2015 16:04:15 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Column SET ColumnName='Cuota_Inicial', Name='Cuota Inicial', Description=NULL, Help=NULL WHERE AD_Element_ID=3000212
;

-- 24/06/2015 16:04:15 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Process_Para SET ColumnName='Cuota_Inicial', Name='Cuota Inicial', Description=NULL, Help=NULL, AD_Element_ID=3000212 WHERE UPPER(ColumnName)='CUOTA_INICIAL' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 24/06/2015 16:04:15 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Process_Para SET ColumnName='Cuota_Inicial', Name='Cuota Inicial', Description=NULL, Help=NULL WHERE AD_Element_ID=3000212 AND IsCentrallyMaintained='Y'
;

-- 24/06/2015 16:04:15 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET Name='Cuota Inicial', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000212) AND IsCentrallyMaintained='Y'
;

-- 24/06/2015 16:04:15 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_PrintFormatItem SET PrintName='Cuota Inicial', Name='Cuota Inicial' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000212)
;

-- 24/06/2015 16:06:18 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Element SET ColumnName='Descuento', Name='Descuento', PrintName='Descuento',Updated=TO_TIMESTAMP('2015-06-24 16:06:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000214
;

-- 24/06/2015 16:06:18 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000214
;

-- 24/06/2015 16:06:18 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Column SET ColumnName='Descuento', Name='Descuento', Description=NULL, Help=NULL WHERE AD_Element_ID=3000214
;

-- 24/06/2015 16:06:18 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Process_Para SET ColumnName='Descuento', Name='Descuento', Description=NULL, Help=NULL, AD_Element_ID=3000214 WHERE UPPER(ColumnName)='DESCUENTO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 24/06/2015 16:06:18 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Process_Para SET ColumnName='Descuento', Name='Descuento', Description=NULL, Help=NULL WHERE AD_Element_ID=3000214 AND IsCentrallyMaintained='Y'
;

-- 24/06/2015 16:06:18 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET Name='Descuento', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000214) AND IsCentrallyMaintained='Y'
;

-- 24/06/2015 16:06:18 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_PrintFormatItem SET PrintName='Descuento', Name='Descuento' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000214)
;

-- 02/07/2015 17:48:50 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Column SET AD_Reference_ID=22,Updated=TO_TIMESTAMP('2015-07-02 17:48:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001077
;

-- 02/07/2015 17:48:52 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Column SET AD_Reference_ID=11,Updated=TO_TIMESTAMP('2015-07-02 17:48:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001075
;

-- 02/07/2015 17:49:22 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Column SET AD_Reference_ID=11,Updated=TO_TIMESTAMP('2015-07-02 17:49:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001076
;

-- 02/07/2015 17:51:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET DisplayLogic='@TenderType@=''C''',Updated=TO_TIMESTAMP('2015-07-02 17:51:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001871
;

-- 02/07/2015 18:29:47 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001879
;

-- 02/07/2015 18:29:47 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3001873
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=243
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=512
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000011
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000092
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000015
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000060
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000013
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=7, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000024
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=8, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=288
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=9, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000014
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=10, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=432
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=11, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000100
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=12, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000048
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=13, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=235
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=14, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=413
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=15, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=538
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=16, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=241
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=17, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=462
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=18, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=245
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=19, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=251
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=20, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=511
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=21, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=255
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=22, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=286
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=23, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=287
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=24, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=246
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=25, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=509
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=26, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=438
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=27, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=234
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=28, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=510
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=29, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53313
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=30, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=505
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=31, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=496
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=32, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=497
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=33, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=304
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=34, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53190
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=35, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53187
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=36, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=244
;

-- 02/07/2015 19:01:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=37, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53314
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=243
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=512
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000011
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000092
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000015
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000060
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000013
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=7, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000024
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=8, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=288
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=9, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000014
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=10, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=432
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=11, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000099
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=12, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000100
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=13, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000048
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=14, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=235
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=15, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=413
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=16, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=538
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=17, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=241
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=18, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=462
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=19, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=245
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=20, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=251
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=21, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=511
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=22, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=255
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=23, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=286
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=24, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=287
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=25, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=246
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=26, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=509
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=27, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=438
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=28, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=234
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=29, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=510
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=30, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53313
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=31, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=505
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=32, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=496
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=33, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=497
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=34, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=304
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=35, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53190
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=36, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53187
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=37, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=244
;

-- 02/07/2015 19:02:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=38, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53314
;

-- 03/07/2015 12:33:53 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Element SET Help='Ingresar valores negativos para generar un Recargo.', Description='Ingresar valores negativos para generar un Recargo.',Updated=TO_TIMESTAMP('2015-07-03 12:33:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000214
;

-- 03/07/2015 12:33:53 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000214
;

-- 03/07/2015 12:33:53 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Column SET ColumnName='Descuento', Name='Descuento', Description='Ingresar valores negativos para generar un Recargo.', Help='Ingresar valores negativos para generar un Recargo.' WHERE AD_Element_ID=3000214
;

-- 03/07/2015 12:33:53 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Process_Para SET ColumnName='Descuento', Name='Descuento', Description='Ingresar valores negativos para generar un Recargo.', Help='Ingresar valores negativos para generar un Recargo.', AD_Element_ID=3000214 WHERE UPPER(ColumnName)='DESCUENTO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 03/07/2015 12:33:53 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Process_Para SET ColumnName='Descuento', Name='Descuento', Description='Ingresar valores negativos para generar un Recargo.', Help='Ingresar valores negativos para generar un Recargo.' WHERE AD_Element_ID=3000214 AND IsCentrallyMaintained='Y'
;

-- 03/07/2015 12:33:53 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET Name='Descuento', Description='Ingresar valores negativos para generar un Recargo.', Help='Ingresar valores negativos para generar un Recargo.' WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000214) AND IsCentrallyMaintained='Y'
;

-- 03/07/2015 12:58:41 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Window SET EntityType='LAR',Updated=TO_TIMESTAMP('2015-07-03 12:58:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Window_ID=3000026
;

-- 03/07/2015 12:59:50 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Window (AD_Window_ID,WindowType,IsSOTrx,IsDefault,IsBetaFunctionality,WinHeight,WinWidth,EntityType,Name,IsActive,Created,CreatedBy,UpdatedBy,Updated,AD_Org_ID,AD_Client_ID,Processing) VALUES (3000029,'M','Y','N','N',0,0,'LAR','Planes de Pago','Y',TO_TIMESTAMP('2015-07-03 12:59:49','YYYY-MM-DD HH24:MI:SS'),100,100,TO_TIMESTAMP('2015-07-03 12:59:49','YYYY-MM-DD HH24:MI:SS'),0,0,'N')
;

-- 03/07/2015 12:59:50 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Window_Trl (AD_Language,AD_Window_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Window_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Window t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Window_ID=3000029 AND NOT EXISTS (SELECT * FROM AD_Window_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Window_ID=t.AD_Window_ID)
;

-- 03/07/2015 13:00:49 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('N',3000029,10,'N','N',3000032,3000056,'N','N','N','N',0,'Y','N','LAR','Medio de Pago',0,0,TO_TIMESTAMP('2015-07-03 13:00:48','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2015-07-03 13:00:48','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 03/07/2015 13:00:49 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000056 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 03/07/2015 13:00:57 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001888,1,'Y','N','N',3001059,'N','Y',3000056,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,'Y',TO_TIMESTAMP('2015-07-03 13:00:57','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-07-03 13:00:57','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/07/2015 13:00:57 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001888 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/07/2015 13:00:58 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001889,10,'Y','N','N',3001057,'N','Y',3000056,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,'Y',TO_TIMESTAMP('2015-07-03 13:00:57','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-07-03 13:00:57','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/07/2015 13:00:58 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001889 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/07/2015 13:00:58 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001890,10,'N','N','N',3001056,'N','Y',3000056,'N','LAR','LAR_Medio_Pago',100,0,'Y',TO_TIMESTAMP('2015-07-03 13:00:58','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-07-03 13:00:58','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/07/2015 13:00:58 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001890 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/07/2015 13:00:58 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001891,10,'Y','N','N',3001058,'N','Y',3000056,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,'Y',TO_TIMESTAMP('2015-07-03 13:00:58','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-07-03 13:00:58','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/07/2015 13:00:58 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001891 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/07/2015 13:00:58 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001892,10,'Y','N','N',3001065,'N','Y',3000056,'N','LAR','Tarjeta de Crédito',100,0,'Y',TO_TIMESTAMP('2015-07-03 13:00:58','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-07-03 13:00:58','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/07/2015 13:00:58 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001892 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/07/2015 13:00:58 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001893,1,'Y','N','N',3001064,'N','Y',3000056,'N','The Tender Type indicates the method of payment (ACH or Direct Deposit, Credit Card, Check, Direct Debit)','LAR','Method of Payment','Tender type',100,0,'Y',TO_TIMESTAMP('2015-07-03 13:00:58','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-07-03 13:00:58','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/07/2015 13:00:58 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001893 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/07/2015 13:01:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3001889
;

-- 03/07/2015 13:01:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3001891
;

-- 03/07/2015 13:01:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3001893
;

-- 03/07/2015 13:01:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3001892
;

-- 03/07/2015 13:01:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3001888
;

-- 03/07/2015 13:01:49 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET DisplayLogic='@TenderType@=''C''',Updated=TO_TIMESTAMP('2015-07-03 13:01:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001892
;

-- 03/07/2015 13:03:57 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('N',3000029,20,'N','N',3000033,3000057,'N','N','N','N',0,'Y','N','U','Planes de Pago',0,0,TO_TIMESTAMP('2015-07-03 13:03:57','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2015-07-03 13:03:57','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 03/07/2015 13:03:57 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000057 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 03/07/2015 13:04:16 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Tab SET TabLevel=1, EntityType='LAR',Updated=TO_TIMESTAMP('2015-07-03 13:04:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000057
;

-- 03/07/2015 13:04:28 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001894,1,'Y','N','N',3001069,'N','Y',3000057,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,'Y',TO_TIMESTAMP('2015-07-03 13:04:28','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-07-03 13:04:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/07/2015 13:04:28 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001894 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/07/2015 13:04:28 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001895,10,'Y','N','N',3001067,'N','Y',3000057,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,'Y',TO_TIMESTAMP('2015-07-03 13:04:28','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-07-03 13:04:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/07/2015 13:04:28 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001895 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/07/2015 13:04:28 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001896,2,'Y','N','N',3001076,'N','Y',3000057,'N','LAR','Cuota Final',100,0,'Y',TO_TIMESTAMP('2015-07-03 13:04:28','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-07-03 13:04:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/07/2015 13:04:28 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001896 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/07/2015 13:04:28 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001897,2,'Y','N','N',3001075,'N','Y',3000057,'N','LAR','Cuota Inicial',100,0,'Y',TO_TIMESTAMP('2015-07-03 13:04:28','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-07-03 13:04:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/07/2015 13:04:28 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001897 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/07/2015 13:04:28 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001898,10,'Y','N','N',3001077,'N','Y',3000057,'N','Ingresar valores negativos para generar un Recargo.','LAR','Ingresar valores negativos para generar un Recargo.','Descuento',100,0,'Y',TO_TIMESTAMP('2015-07-03 13:04:28','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-07-03 13:04:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/07/2015 13:04:28 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001898 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/07/2015 13:04:29 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001899,10,'Y','N','N',3001074,'N','Y',3000057,'N','LAR','LAR_Medio_Pago',100,0,'Y',TO_TIMESTAMP('2015-07-03 13:04:28','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-07-03 13:04:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/07/2015 13:04:29 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001899 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/07/2015 13:04:29 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001900,10,'N','N','N',3001066,'N','Y',3000057,'N','LAR','LAR_Plan_Pago',100,0,'Y',TO_TIMESTAMP('2015-07-03 13:04:29','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-07-03 13:04:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/07/2015 13:04:29 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001900 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/07/2015 13:04:29 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001901,10,'Y','N','N',3001068,'N','Y',3000057,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,'Y',TO_TIMESTAMP('2015-07-03 13:04:29','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-07-03 13:04:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/07/2015 13:04:29 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001901 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/07/2015 13:04:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001899
;

-- 03/07/2015 13:04:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3001895
;

-- 03/07/2015 13:04:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3001901
;

-- 03/07/2015 13:04:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3001897
;

-- 03/07/2015 13:04:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3001896
;

-- 03/07/2015 13:04:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3001898
;

-- 03/07/2015 13:04:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3001894
;

-- 03/07/2015 13:05:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Tab SET AD_Column_ID=3001074,Updated=TO_TIMESTAMP('2015-07-03 13:05:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000057
;

-- 03/07/2015 13:05:49 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2015-07-03 13:05:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001901
;

-- 03/07/2015 13:06:15 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2015-07-03 13:06:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001896
;

-- 03/07/2015 13:06:42 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2015-07-03 13:06:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001891
;

-- 03/07/2015 13:06:51 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2015-07-03 13:06:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001892
;

-- 03/07/2015 13:09:30 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Menu (AD_Menu_ID,IsSummary,"action",IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000102,'N','W','N','N','LAR','Y','Planes de Pago',TO_TIMESTAMP('2015-07-03 13:09:30','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_TIMESTAMP('2015-07-03 13:09:30','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 03/07/2015 13:09:30 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000102 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 03/07/2015 13:09:30 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100,t.AD_Tree_ID, 3000102, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000102)
;

-- 03/07/2015 13:09:52 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Menu SET AD_Window_ID=3000029,Updated=TO_TIMESTAMP('2015-07-03 13:09:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=3000102
;

-- 03/07/2015 13:23:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Column SET AD_Reference_Value_ID=214, AD_Reference_ID=17,Updated=TO_TIMESTAMP('2015-07-03 13:23:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001064
;

-- 03/07/2015 13:33:02 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2015-07-03 13:33:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001898
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=243
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=512
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000011
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000092
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000015
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000060
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000013
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=7, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000024
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=8, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=288
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=9, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000014
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=10, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=432
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=11, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000099
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=12, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000102
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=13, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000048
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=14, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=235
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=15, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=413
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=16, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=538
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=17, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=241
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=18, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=462
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=19, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=245
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=20, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=251
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=21, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=511
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=22, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=255
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=23, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=286
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=24, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=287
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=25, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=246
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=26, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=509
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=27, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=438
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=28, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=234
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=29, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=510
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=30, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53313
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=31, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=505
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=32, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=496
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=33, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=497
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=34, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=304
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=35, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53190
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=36, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53187
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=37, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=244
;

-- 03/07/2015 14:36:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=38, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53314
;

-- 07/07/2015 15:58:36 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Tarjeta de Crédito',PrintName='Tarjeta de Crédito',Updated=TO_TIMESTAMP('2015-07-07 15:58:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000209 AND AD_Language='es_AR'
;

-- 07/07/2015 16:01:54 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Cuota Final',PrintName='Cuota Final',Updated=TO_TIMESTAMP('2015-07-07 16:01:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000213 AND AD_Language='es_AR'
;

-- 07/07/2015 16:02:23 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Cuota Inicial',PrintName='Cuota Inicial',Updated=TO_TIMESTAMP('2015-07-07 16:02:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000212 AND AD_Language='es_AR'
;

-- 07/07/2015 16:03:29 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Descuento',PrintName='Descuento',Updated=TO_TIMESTAMP('2015-07-07 16:03:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000214 AND AD_Language='es_AR'
;

-- 07/07/2015 16:03:43 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Element_Trl SET Description='Ingresar valores negativos para generar un Recargo.',Help='Ingresar valores negativos para generar un Recargo.',Updated=TO_TIMESTAMP('2015-07-07 16:03:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000214 AND AD_Language='es_AR'
;

-- 13/09/2015 17:31:34 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Ref_List SET IsActive='N',Updated=TO_TIMESTAMP('2015-09-13 17:31:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000035
;

-- 13/09/2015 17:31:53 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Ref_List SET IsActive='N',Updated=TO_TIMESTAMP('2015-09-13 17:31:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000036
;

-- 13/09/2015 17:31:56 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Ref_List SET IsActive='N',Updated=TO_TIMESTAMP('2015-09-13 17:31:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000041
;

-- 13/09/2015 17:31:58 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Ref_List SET IsActive='N',Updated=TO_TIMESTAMP('2015-09-13 17:31:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000038
;

-- 13/09/2015 17:32:12 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Ref_List SET IsActive='N',Updated=TO_TIMESTAMP('2015-09-13 17:32:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000037
;

-- 13/09/2015 17:32:19 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Ref_List SET IsActive='N',Updated=TO_TIMESTAMP('2015-09-13 17:32:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=419
;

-- 13/09/2015 17:32:26 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Ref_List SET IsActive='N',Updated=TO_TIMESTAMP('2015-09-13 17:32:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000034
;

-- 13/09/2015 17:32:29 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Ref_List SET IsActive='N',Updated=TO_TIMESTAMP('2015-09-13 17:32:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000039
;

-- 13/09/2015 17:32:35 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Ref_List SET IsActive='N',Updated=TO_TIMESTAMP('2015-09-13 17:32:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000040
;

-- 13/09/2015 17:32:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Ref_List SET IsActive='N',Updated=TO_TIMESTAMP('2015-09-13 17:32:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000042
;

-- 13/09/2015 17:32:49 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Ref_List SET IsActive='N',Updated=TO_TIMESTAMP('2015-09-13 17:32:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000043
;

-- 13/09/2015 17:33:11 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Ref_List SET IsActive='Y',Updated=TO_TIMESTAMP('2015-09-13 17:33:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=417
;

-- 13/09/2015 17:44:15 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000065,149,'LAR','W','Otra',TO_TIMESTAMP('2015-09-13 17:44:14','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2015-09-13 17:44:14','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 13/09/2015 17:44:15 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000065 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 13/09/2015 18:03:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001185,3000031,'LAR',0,'N','N','N','The Credit Card drop down list box is used for selecting the type of Credit Card presented for payment.','N',1,'N',20,'N',1012,'N','Y','N','Credit Card (Visa, MC, AmEx)','Credit Card','CreditCardType',100,TO_TIMESTAMP('2015-09-13 18:03:44','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-09-13 18:03:44','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 13/09/2015 18:03:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001185 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 13/09/2015 18:04:21 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Column SET AD_Reference_ID=17,Updated=TO_TIMESTAMP('2015-09-13 18:04:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001185
;

-- 13/09/2015 18:05:31 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Column SET AD_Reference_Value_ID=149,Updated=TO_TIMESTAMP('2015-09-13 18:05:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001185
;

-- 13/09/2015 18:12:39 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001957,1,'Y','N','N',3001185,'N','Y',3000052,'N','The Credit Card drop down list box is used for selecting the type of Credit Card presented for payment.','LAR','Credit Card (Visa, MC, AmEx)','Credit Card',100,0,'Y',TO_TIMESTAMP('2015-09-13 18:12:39','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-09-13 18:12:39','YYYY-MM-DD HH24:MI:SS'))
;

-- 13/09/2015 18:12:39 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001957 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 13/09/2015 18:19:19 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3001865
;

-- 13/09/2015 18:19:19 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3001863
;

-- 13/09/2015 18:19:19 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3001957
;

-- 13/09/2015 18:19:19 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3001862
;

-- 13/09/2015 18:19:19 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3001860
;

-- 13/09/2015 18:19:41 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2015-09-13 18:19:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001865
;

-- 13/09/2015 18:25:05 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2015-09-13 18:25:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001957
;

-- 13/09/2015 18:30:00 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Column SET IsIdentifier='Y',Updated=TO_TIMESTAMP('2015-09-13 18:30:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001185
;

-- 14/09/2015 13:55:20 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Column SET IsMandatory='Y',Updated=TO_TIMESTAMP('2015-09-14 13:55:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001185
;

-- 14/09/2015 13:59:37 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001188,335,'LAR',0,'N','N','N','N',10,'N',19,'N',3000209,'N','Y','N','Tarjeta de Crédito','LAR_Tarjeta_Credito_ID',100,TO_TIMESTAMP('2015-09-14 13:59:36','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-09-14 13:59:36','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/09/2015 13:59:37 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001188 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 14/09/2015 14:01:20 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001970,1,'Y','N','N',3000260,'N','Y',330,'N','LAR','Allocation',100,0,'Y',TO_TIMESTAMP('2015-09-14 14:01:19','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-09-14 14:01:19','YYYY-MM-DD HH24:MI:SS'))
;

-- 14/09/2015 14:01:20 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001970 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/09/2015 14:01:20 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001971,10,'Y','N','N',3000816,'N','Y',330,'N','LAR','C_TaxWithholding_ID',100,0,'Y',TO_TIMESTAMP('2015-09-14 14:01:20','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-09-14 14:01:20','YYYY-MM-DD HH24:MI:SS'))
;

-- 14/09/2015 14:01:20 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001971 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/09/2015 14:01:20 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001972,1,'Y','N','N',3000832,'N','Y',330,'N','LAR','EsRetencionIIBB',100,0,'Y',TO_TIMESTAMP('2015-09-14 14:01:20','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-09-14 14:01:20','YYYY-MM-DD HH24:MI:SS'))
;

-- 14/09/2015 14:01:20 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001972 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/09/2015 14:01:20 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001973,1,'Y','N','N',3000965,'N','Y',330,'N','LAR','EsRetencionSufrida',100,0,'Y',TO_TIMESTAMP('2015-09-14 14:01:20','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-09-14 14:01:20','YYYY-MM-DD HH24:MI:SS'))
;

-- 14/09/2015 14:01:20 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001973 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/09/2015 14:01:21 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001974 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/09/2015 14:01:27 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001975 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/09/2015 14:01:27 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001976,1,'Y','N','N',3000261,'N','Y',330,'N','LAR','IsOnDrawer',100,0,'Y',TO_TIMESTAMP('2015-09-14 14:01:27','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-09-14 14:01:27','YYYY-MM-DD HH24:MI:SS'))
;

-- 14/09/2015 14:01:27 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001976 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/09/2015 14:01:28 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001977,10,'Y','N','N',3000258,'N','Y',330,'N','LAR','LAR_PaymentHeader',100,0,'Y',TO_TIMESTAMP('2015-09-14 14:01:27','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-09-14 14:01:27','YYYY-MM-DD HH24:MI:SS'))
;

-- 14/09/2015 14:01:28 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001977 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/09/2015 14:01:28 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001978,10,'Y','N','N',3000259,'N','Y',330,'N','LAR','LAR_PaymentSource_ID',100,0,'Y',TO_TIMESTAMP('2015-09-14 14:01:28','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-09-14 14:01:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 14/09/2015 14:01:28 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001978 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/09/2015 14:01:28 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001979 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/09/2015 14:01:28 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001980,10,'Y','N','N',3001188,'N','Y',330,'N','LAR','Tarjeta de Crédito',100,0,'Y',TO_TIMESTAMP('2015-09-14 14:01:28','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-09-14 14:01:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 14/09/2015 14:01:28 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001980 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/09/2015 14:01:28 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001981,20,'Y','N','N',3000820,'N','Y',330,'N','LAR','WithholdingCertNo',100,0,'Y',TO_TIMESTAMP('2015-09-14 14:01:28','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-09-14 14:01:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 14/09/2015 14:01:28 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001981 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/09/2015 14:02:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001970
;

-- 14/09/2015 14:02:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001971
;

-- 14/09/2015 14:02:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001972
;

-- 14/09/2015 14:02:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001973
;

-- 14/09/2015 14:02:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001974
;

-- 14/09/2015 14:02:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001975
;

-- 14/09/2015 14:02:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001976
;

-- 14/09/2015 14:02:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001977
;

-- 14/09/2015 14:02:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001978
;

-- 14/09/2015 14:02:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001979
;

-- 14/09/2015 14:02:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=4036
;

-- 14/09/2015 14:02:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001981
;

-- 14/09/2015 14:02:45 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3001980
;

-- 14/09/2015 16:27:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET DisplayLogic='@TenderType@=C',Updated=TO_TIMESTAMP('2015-09-14 16:27:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001980
;

-- 17/09/2015 18:19:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001194,3000033,'LAR',0,'N','N','Y',1,'The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.','N',40,'Y',10,'N',469,'N','Y','N','Alphanumeric identifier of the entity','Name','Name',100,TO_TIMESTAMP('2015-09-17 18:19:44','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-09-17 18:19:44','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 17/09/2015 18:19:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001194 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 17/09/2015 18:20:58 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001985,40,'Y','N','N',3001194,'N','Y',3000057,'N','The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.','LAR','Alphanumeric identifier of the entity','Name',100,0,'Y',TO_TIMESTAMP('2015-09-17 18:20:58','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-09-17 18:20:58','YYYY-MM-DD HH24:MI:SS'))
;

-- 17/09/2015 18:20:58 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001985 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 17/09/2015 18:22:04 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2015-09-17 18:22:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001985
;

-- 17/09/2015 20:39:58 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3001985
;

-- 17/09/2015 20:39:58 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3001894
;

-- 17/09/2015 20:40:12 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2015-09-17 20:40:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001894
;

-- 17/09/2015 20:40:18 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2015-09-17 20:40:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001985
;

-- 23/09/2015 17:39:55 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001205,335,'LAR',0,'N','N','N','N',10,'N',19,'N',3000211,'N','Y','N','LAR_Plan_Pago','LAR_Plan_Pago_ID',100,TO_TIMESTAMP('2015-09-23 17:39:54','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-09-23 17:39:54','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/09/2015 17:39:55 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001205 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/09/2015 17:40:51 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Column SET Name='Plan de Pago',Updated=TO_TIMESTAMP('2015-09-23 17:40:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001205
;

-- 23/09/2015 17:40:51 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001205
;

-- 23/09/2015 17:40:51 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET Name='Plan de Pago', Description=NULL, Help=NULL WHERE AD_Column_ID=3001205 AND IsCentrallyMaintained='Y'
;

-- 23/09/2015 17:41:23 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Element SET Name='Plan de Pago', PrintName='Plan de Pago',Updated=TO_TIMESTAMP('2015-09-23 17:41:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000211
;

-- 23/09/2015 17:41:23 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000211
;

-- 23/09/2015 17:41:23 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Column SET ColumnName='LAR_Plan_Pago_ID', Name='Plan de Pago', Description=NULL, Help=NULL WHERE AD_Element_ID=3000211
;

-- 23/09/2015 17:41:24 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Process_Para SET ColumnName='LAR_Plan_Pago_ID', Name='Plan de Pago', Description=NULL, Help=NULL, AD_Element_ID=3000211 WHERE UPPER(ColumnName)='LAR_PLAN_PAGO_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 23/09/2015 17:41:24 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Process_Para SET ColumnName='LAR_Plan_Pago_ID', Name='Plan de Pago', Description=NULL, Help=NULL WHERE AD_Element_ID=3000211 AND IsCentrallyMaintained='Y'
;

-- 23/09/2015 17:41:24 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET Name='Plan de Pago', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000211) AND IsCentrallyMaintained='Y'
;

-- 23/09/2015 17:41:24 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_PrintFormatItem SET PrintName='Plan de Pago', Name='Plan de Pago' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000211)
;

-- 23/09/2015 17:41:31 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Element_Trl SET Name='Plan de Pago',PrintName='Plan de Pago',Updated=TO_TIMESTAMP('2015-09-23 17:41:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000211 AND AD_Language='es_AR'
;

-- 23/09/2015 17:42:20 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001992,10,'Y','N','N',3001205,'N','Y',330,'N','LAR','Plan de Pago',100,0,'Y',TO_TIMESTAMP('2015-09-23 17:42:19','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-09-23 17:42:19','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/09/2015 17:42:20 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001992 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/09/2015 17:44:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3001992
;

-- 23/09/2015 17:44:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=4057
;

-- 23/09/2015 17:44:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=4025
;

-- 23/09/2015 17:44:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=4019
;

-- 23/09/2015 17:44:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=4026
;

-- 23/09/2015 17:44:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=4024
;

-- 23/09/2015 17:44:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=6299
;

-- 23/09/2015 17:44:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=4021
;

-- 23/09/2015 17:44:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=4022
;

-- 23/09/2015 17:44:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=4020
;

-- 23/09/2015 17:44:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=4055
;

-- 23/09/2015 17:44:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=4043
;

-- 23/09/2015 17:44:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=4058
;

-- 23/09/2015 17:44:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=4042
;

-- 23/09/2015 17:44:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=4258
;

-- 23/09/2015 17:44:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=4039
;

-- 23/09/2015 17:44:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=4053
;

-- 23/09/2015 17:44:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=4052
;

-- 23/09/2015 17:44:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=4051
;

-- 23/09/2015 17:44:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=4047
;

-- 23/09/2015 17:44:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=4049
;

-- 23/09/2015 17:44:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=4048
;

-- 23/09/2015 17:44:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=4362
;

-- 23/09/2015 17:44:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=4361
;

-- 23/09/2015 17:44:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=6552
;

-- 23/09/2015 17:44:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=4044
;

-- 23/09/2015 17:44:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=680,IsDisplayed='Y' WHERE AD_Field_ID=4266
;

-- 23/09/2015 17:44:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=690,IsDisplayed='Y' WHERE AD_Field_ID=52052
;

-- 23/09/2015 17:45:14 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET IsSameLine='Y', DisplayLogic='@TenderType@=C',Updated=TO_TIMESTAMP('2015-09-23 17:45:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001992
;

-- 24/09/2015 12:41:35 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000230,'importe_descuento','LAR','importe_descuento','importe_descuento',0,TO_TIMESTAMP('2015-09-24 12:41:34','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2015-09-24 12:41:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 24/09/2015 12:41:35 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000230 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 24/09/2015 12:41:37 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001206,259,'LAR',0,'N','N','N','N',10,'N',11,'N',3000230,'N','Y','N','importe_descuento','importe_descuento',100,TO_TIMESTAMP('2015-09-24 12:41:34','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-09-24 12:41:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 24/09/2015 12:41:37 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001206 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 24/09/2015 12:51:08 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Column SET Name='Descuento de la Orden', ColumnName='Importe_Descuento',Updated=TO_TIMESTAMP('2015-09-24 12:51:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001206
;

-- 24/09/2015 12:51:08 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001206
;

-- 24/09/2015 12:51:08 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET Name='Descuento de la Orden', Description=NULL, Help=NULL WHERE AD_Column_ID=3001206 AND IsCentrallyMaintained='Y'
;

-- 24/09/2015 12:51:40 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Element SET ColumnName='Importe_Descuento', Name='Descuento de la Orden', PrintName='Descuento de la Orden',Updated=TO_TIMESTAMP('2015-09-24 12:51:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000230
;

-- 24/09/2015 12:51:40 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000230
;

-- 24/09/2015 12:51:40 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Column SET ColumnName='Importe_Descuento', Name='Descuento de la Orden', Description=NULL, Help=NULL WHERE AD_Element_ID=3000230
;

-- 24/09/2015 12:51:40 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Process_Para SET ColumnName='Importe_Descuento', Name='Descuento de la Orden', Description=NULL, Help=NULL, AD_Element_ID=3000230 WHERE UPPER(ColumnName)='IMPORTE_DESCUENTO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 24/09/2015 12:51:40 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Process_Para SET ColumnName='Importe_Descuento', Name='Descuento de la Orden', Description=NULL, Help=NULL WHERE AD_Element_ID=3000230 AND IsCentrallyMaintained='Y'
;

-- 24/09/2015 12:51:40 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET Name='Descuento de la Orden', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000230) AND IsCentrallyMaintained='Y'
;

-- 24/09/2015 12:51:40 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_PrintFormatItem SET PrintName='Descuento de la Orden', Name='Descuento de la Orden' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000230)
;

-- 24/09/2015 12:51:47 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Element_Trl SET Name='Descuento de la Orden',PrintName='Descuento de la Orden',Updated=TO_TIMESTAMP('2015-09-24 12:51:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000230 AND AD_Language='es_AR'
;

-- 24/09/2015 12:52:43 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001993,10,'Y','N','N',3001206,'N','Y',186,'N','LAR','Descuento de la Orden',100,0,'Y',TO_TIMESTAMP('2015-09-24 12:52:43','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-09-24 12:52:43','YYYY-MM-DD HH24:MI:SS'))
;

-- 24/09/2015 12:52:43 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001993 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 24/09/2015 13:42:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3001993
;

-- 24/09/2015 13:42:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=2593
;

-- 24/09/2015 13:42:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=2589
;

-- 24/09/2015 13:42:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=1324
;

-- 24/09/2015 13:42:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=7038
;

-- 24/09/2015 13:42:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=7826
;

-- 24/09/2015 13:42:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=7825
;

-- 24/09/2015 13:42:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=1112
;

-- 24/09/2015 13:42:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=1113
;

-- 24/09/2015 13:42:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=1082
;

-- 24/09/2015 13:42:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=1084
;

-- 24/09/2015 13:42:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=60922
;

-- 24/09/2015 13:42:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=6560
;

-- 24/09/2015 13:42:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=1083
;

-- 24/09/2015 13:42:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3660
;

-- 24/09/2015 13:42:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3001597
;

-- 24/09/2015 13:42:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3001852
;

-- 24/09/2015 13:43:20 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2015-09-24 13:43:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001993
;

-- 24/09/2015 15:16:21 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Column SET AD_Reference_ID=22,Updated=TO_TIMESTAMP('2015-09-24 15:16:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001206
;

-- 25/09/2015 18:55:42 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Column SET IsIdentifier='N',Updated=TO_TIMESTAMP('2015-09-25 18:55:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001053
;

-- 25/09/2015 18:55:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Column SET IsIdentifier='N',Updated=TO_TIMESTAMP('2015-09-25 18:55:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001185
;

-- 25/09/2015 18:55:57 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Column SET IsIdentifier='Y',Updated=TO_TIMESTAMP('2015-09-25 18:55:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001055
;

-- 25/09/2015 18:56:57 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2015-09-25 18:56:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001862
;

-- 25/09/2015 18:59:38 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2015-09-25 18:59:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001898
;

-- 25/09/2015 18:59:49 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET DisplayLength=40,Updated=TO_TIMESTAMP('2015-09-25 18:59:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001985
;

-- 25/09/2015 19:00:06 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET IsSameLine='N', Help='There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports. There are two reasons for de-activating and not deleting records: (1) The system requires the record for audit purposes. (2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.',Updated=TO_TIMESTAMP('2015-09-25 19:00:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001894
;

-- 25/09/2015 19:00:06 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field_Trl SET IsTranslated='N' WHERE AD_Field_ID=3001894
;

-- 25/09/2015 19:04:27 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
DELETE FROM AD_Field_Trl WHERE AD_Field_ID=3001865
;

-- 25/09/2015 19:04:28 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
DELETE FROM AD_Field WHERE AD_Field_ID=3001865
;

-- 25/09/2015 19:05:11 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
DELETE FROM AD_Column_Trl WHERE AD_Column_ID=3001054
;

-- 25/09/2015 19:05:11 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
DELETE FROM AD_Column WHERE AD_Column_ID=3001054
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001992
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=4035
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=4037
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=4033
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=4034
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=4023
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=4057
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=4025
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=4019
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=4026
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=4024
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=6299
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=4021
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=4022
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=4020
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=4055
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=4043
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=4058
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=4042
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=4258
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=4039
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=4053
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=4052
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=4051
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=4047
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=4049
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=4048
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=4362
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=4361
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=6552
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=4044
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=4266
;

-- 01/10/2015 14:58:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=680,IsDisplayed='Y' WHERE AD_Field_ID=52052
;

-- 01/10/2015 15:00:15 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=4057
;

-- 01/10/2015 15:00:15 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=4035
;

-- 01/10/2015 15:00:15 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=4037
;

-- 01/10/2015 15:00:15 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=4033
;

-- 01/10/2015 15:00:15 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=4034
;

-- 01/10/2015 15:00:15 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=4023
;

-- 08/10/2015 16:32:58 ART
-- BUG #192: ABM - Maestro de planes de tarjeta 
UPDATE AD_Column SET AD_Reference_ID=12,Updated=TO_TIMESTAMP('2015-10-08 16:32:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001206
;

-- 19/10/2015 12:21:43 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001208,318,'LAR',0,'N','N','N','Ingresar valores negativos para generar un Recargo.','N',10,'N',11,'N',3000214,'N','Y','N','Ingresar valores negativos para generar un Recargo.','Descuento','Descuento',100,TO_TIMESTAMP('2015-10-19 12:21:43','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-10-19 12:21:43','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 19/10/2015 12:21:43 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001208 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 19/10/2015 12:22:40 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Column SET AD_Reference_ID=12,Updated=TO_TIMESTAMP('2015-10-19 12:22:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001208
;

-- 26/10/2015 13:50:46 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2015-10-26 13:50:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001993
;

-- 26/10/2015 15:39:35 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001994,10,'Y','N','N',3001208,'N','Y',263,'N','Ingresar valores negativos para generar un Recargo.','LAR','Ingresar valores negativos para generar un Recargo.','Descuento',100,0,'Y',TO_TIMESTAMP('2015-10-26 15:39:34','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2015-10-26 15:39:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 26/10/2015 15:39:35 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001994 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 26/10/2015 15:40:14 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2015-10-26 15:40:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001994
;

-- 26/10/2015 16:17:58 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3001994
;

-- 26/10/2015 16:17:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=2786
;

-- 26/10/2015 16:17:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=2780
;

-- 26/10/2015 16:17:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=2778
;

-- 26/10/2015 16:17:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=2771
;

-- 26/10/2015 16:17:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=8657
;

-- 26/10/2015 16:17:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=10485
;

-- 26/10/2015 16:17:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=1000016
;

-- 26/10/2015 16:17:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=1000017
;

-- 26/10/2015 16:17:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000603
;

-- 26/10/2015 16:17:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=6564
;

-- 26/10/2015 16:17:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=2777
;

-- 26/10/2015 16:17:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3663
;

-- 26/10/2015 16:17:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3899
;

-- 26/10/2015 16:17:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=13700
;

-- 26/10/2015 16:17:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=53257
;

-- 26/10/2015 16:17:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=53258
;

-- 26/10/2015 16:17:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=60970
;

-- 26/10/2015 16:17:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000027
;

-- 26/10/2015 16:17:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000028
;

-- 26/10/2015 16:17:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000025
;

-- 26/10/2015 16:17:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000026
;

-- 26/10/2015 16:17:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000605
;

-- 26/10/2015 16:17:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=200050
;

-- 26/10/2015 16:22:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3001994
;

-- 26/10/2015 16:22:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=2775
;

-- 26/10/2015 16:22:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=2764
;

-- 26/10/2015 16:22:02 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=2768
;

-- 26/10/2015 16:22:02 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=6935
;

-- 26/10/2015 16:22:02 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=7794
;

-- 26/10/2015 16:22:02 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=7795
;

-- 26/10/2015 16:23:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=2775
;

-- 26/10/2015 16:23:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=2764
;

-- 26/10/2015 16:23:18 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=2768
;

-- 26/10/2015 16:23:18 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=6935
;

-- 26/10/2015 16:23:18 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=7794
;

-- 26/10/2015 16:23:18 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=7795
;

-- 26/10/2015 16:23:18 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3001994
;

-- 26/10/2015 16:25:25 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3001994
;

-- 26/10/2015 16:25:25 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=2775
;

-- 26/10/2015 16:25:25 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=2764
;

-- 26/10/2015 16:25:25 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=2768
;

-- 26/10/2015 16:25:25 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=6935
;

-- 26/10/2015 16:25:25 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=7794
;

-- 26/10/2015 16:25:25 ART
-- BUG #192: ABM - Maestro de planes de tarjeta
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=7795
;

ALTER TABLE LAR_Tarjeta_Credito ADD COLUMN EsDebito character(1) NOT NULL DEFAULT 'N'::bpchar;
ALTER TABLE LAR_Tarjeta_Credito ADD CONSTRAINT lar_tarjeta_credito_esdebito_check CHECK (EsDebito = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]));

ALTER TABLE C_Payment ADD COLUMN LAR_Tarjeta_Debito_ID numeric(10,0);
ALTER TABLE C_Payment ADD CONSTRAINT c_payment_lar_tarjeta_debito_id_fkey FOREIGN KEY (lar_tarjeta_debito_id)
      REFERENCES lar_tarjeta_credito (lar_tarjeta_credito_id) MATCH SIMPLE;

ALTER TABLE LAR_Medio_Pago ADD COLUMN LAR_Tarjeta_Debito_ID numeric(10,0);
ALTER TABLE LAR_Medio_Pago ADD CONSTRAINT lar_medio_pago_lar_tarjeta_debito_id_fkey FOREIGN KEY (lar_tarjeta_debito_id)
      REFERENCES lar_tarjeta_credito (lar_tarjeta_credito_id) MATCH SIMPLE;

CREATE UNIQUE INDEX LAR_Tarjeta_Unique ON LAR_Tarjeta_Credito (Name, CreditCardType, EsDebito);

-- 16/06/2016 19:16:12 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET AD_Reference_ID=18,Updated=TO_TIMESTAMP('2016-06-16 19:16:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001980
;

-- 16/06/2016 19:17:23 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('LAR_Tarjeta_Credito.EsDebito=''N''','S',3000031,'LAR','Tarjetas de Credito',100,100,TO_TIMESTAMP('2016-06-16 19:17:23','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_TIMESTAMP('2016-06-16 19:17:23','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/06/2016 19:17:41 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET AD_Val_Rule_ID=3000031,Updated=TO_TIMESTAMP('2016-06-16 19:17:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001980
;

-- 16/06/2016 19:18:09 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000337,'esdebito','LAR','esdebito','esdebito',0,TO_TIMESTAMP('2016-06-16 19:18:08','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-06-16 19:18:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 16/06/2016 19:18:09 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000337 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 16/06/2016 19:18:09 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001771,3000031,'LAR',0,'Y','N','N','N',1,'N',20,'N',3000337,'N','Y','N','esdebito','esdebito',100,TO_TIMESTAMP('2016-06-16 19:18:08','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-06-16 19:18:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 16/06/2016 19:18:09 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001771 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 16/06/2016 19:18:38 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Column SET Name='Es Debito', ColumnName='EsDebito',Updated=TO_TIMESTAMP('2016-06-16 19:18:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001771
;

-- 16/06/2016 19:18:38 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001771
;

-- 16/06/2016 19:18:38 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET Name='Es Debito', Description=NULL, Help=NULL WHERE AD_Column_ID=3001771 AND IsCentrallyMaintained='Y'
;

-- 16/06/2016 19:18:48 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Column_Trl SET Name='Es Debito',Updated=TO_TIMESTAMP('2016-06-16 19:18:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001771 AND AD_Language='es_AR'
;

-- 16/06/2016 19:19:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Element SET ColumnName='EsDebito', Name='Es Debito', PrintName='Es Debito',Updated=TO_TIMESTAMP('2016-06-16 19:19:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000337
;

-- 16/06/2016 19:19:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000337
;

-- 16/06/2016 19:19:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Column SET ColumnName='EsDebito', Name='Es Debito', Description=NULL, Help=NULL WHERE AD_Element_ID=3000337
;

-- 16/06/2016 19:19:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Process_Para SET ColumnName='EsDebito', Name='Es Debito', Description=NULL, Help=NULL, AD_Element_ID=3000337 WHERE UPPER(ColumnName)='ESDEBITO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 16/06/2016 19:19:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Process_Para SET ColumnName='EsDebito', Name='Es Debito', Description=NULL, Help=NULL WHERE AD_Element_ID=3000337 AND IsCentrallyMaintained='Y'
;

-- 16/06/2016 19:19:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET Name='Es Debito', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000337) AND IsCentrallyMaintained='Y'
;

-- 16/06/2016 19:19:01 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_PrintFormatItem SET PrintName='Es Debito', Name='Es Debito' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000337)
;

-- 16/06/2016 19:19:06 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Element_Trl SET Name='Es Debito',PrintName='Es Debito',Updated=TO_TIMESTAMP('2016-06-16 19:19:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000337 AND AD_Language='es_AR'
;

-- 16/06/2016 19:20:07 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002677,1,'Y','N','N',3001771,'N','Y',3000052,'N','LAR','Es Debito',100,0,'Y',TO_TIMESTAMP('2016-06-16 19:20:07','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2016-06-16 19:20:07','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/06/2016 19:20:07 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002677 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/06/2016 19:20:19 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3001863
;

-- 16/06/2016 19:20:19 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3001957
;

-- 16/06/2016 19:20:19 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3001862
;

-- 16/06/2016 19:20:19 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3002677
;

-- 16/06/2016 19:20:39 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET IsSameLine='Y', Help='There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports. There are two reasons for de-activating and not deleting records: (1) The system requires the record for audit purposes. (2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.',Updated=TO_TIMESTAMP('2016-06-16 19:20:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001860
;

-- 16/06/2016 19:20:39 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field_Trl SET IsTranslated='N' WHERE AD_Field_ID=3001860
;

-- 16/06/2016 19:26:12 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET AD_Reference_ID=18, AD_Val_Rule_ID=3000031,Updated=TO_TIMESTAMP('2016-06-16 19:26:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001892
;

-- 16/06/2016 19:37:09 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000338,'lar_tarjeta_debito_id','LAR','lar_tarjeta_debito_id','lar_tarjeta_debito_id',0,TO_TIMESTAMP('2016-06-16 19:37:09','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-06-16 19:37:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 16/06/2016 19:37:09 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000338 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 16/06/2016 19:37:09 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001772,335,'LAR',0,'N','N','N','N',10,'N',19,'N',3000338,'N','Y','N','lar_tarjeta_debito_id','lar_tarjeta_debito_id',100,TO_TIMESTAMP('2016-06-16 19:37:09','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-06-16 19:37:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 16/06/2016 19:37:09 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001772 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 16/06/2016 19:37:57 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Column SET Name='Tarjeta de Debito', ColumnName='LAR_Tarjeta_Debito_ID',Updated=TO_TIMESTAMP('2016-06-16 19:37:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001772
;

-- 16/06/2016 19:37:57 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001772
;

-- 16/06/2016 19:37:57 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET Name='Tarjeta de Debito', Description=NULL, Help=NULL WHERE AD_Column_ID=3001772 AND IsCentrallyMaintained='Y'
;

-- 16/06/2016 19:38:02 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Column_Trl SET Name='Tarjeta de Debito',Updated=TO_TIMESTAMP('2016-06-16 19:38:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001772 AND AD_Language='es_AR'
;

-- 16/06/2016 19:38:26 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Element SET ColumnName='LAR_Tarjeta_Debito_ID', Name='Tarjeta de Debito', PrintName='Tarjeta de Debito',Updated=TO_TIMESTAMP('2016-06-16 19:38:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000338
;

-- 16/06/2016 19:38:26 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000338
;

-- 16/06/2016 19:38:26 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Column SET ColumnName='LAR_Tarjeta_Debito_ID', Name='Tarjeta de Debito', Description=NULL, Help=NULL WHERE AD_Element_ID=3000338
;

-- 16/06/2016 19:38:26 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Process_Para SET ColumnName='LAR_Tarjeta_Debito_ID', Name='Tarjeta de Debito', Description=NULL, Help=NULL, AD_Element_ID=3000338 WHERE UPPER(ColumnName)='LAR_TARJETA_DEBITO_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 16/06/2016 19:38:26 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Process_Para SET ColumnName='LAR_Tarjeta_Debito_ID', Name='Tarjeta de Debito', Description=NULL, Help=NULL WHERE AD_Element_ID=3000338 AND IsCentrallyMaintained='Y'
;

-- 16/06/2016 19:38:26 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET Name='Tarjeta de Debito', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000338) AND IsCentrallyMaintained='Y'
;

-- 16/06/2016 19:38:26 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_PrintFormatItem SET PrintName='Tarjeta de Debito', Name='Tarjeta de Debito' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000338)
;

-- 16/06/2016 19:38:33 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Element_Trl SET Name='Tarjeta de Debito',PrintName='Tarjeta de Debito',Updated=TO_TIMESTAMP('2016-06-16 19:38:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000338 AND AD_Language='es_AR'
;

-- 16/06/2016 19:40:29 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('LAR_Tarjeta_Credito.EsDebito=''Y''','S',3000032,'LAR','Tarjeta de Debito',100,100,TO_TIMESTAMP('2016-06-16 19:40:29','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_TIMESTAMP('2016-06-16 19:40:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/06/2016 19:40:43 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Column SET AD_Val_Rule_ID=3000032,Updated=TO_TIMESTAMP('2016-06-16 19:40:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001772
;

-- 16/06/2016 19:42:32 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002678 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/06/2016 19:42:32 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002679,10,'Y','N','N',3001772,'N','Y',330,'N','LAR','Tarjeta de Debito',100,0,'Y',TO_TIMESTAMP('2016-06-16 19:42:32','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2016-06-16 19:42:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/06/2016 19:42:32 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002679 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002678
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3002679
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=4057
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=4035
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=4037
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=4033
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=4034
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=4023
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=4025
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=4019
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=4026
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=4024
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=6299
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=4021
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=4022
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=4020
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=4055
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=4043
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=4058
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=4042
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=4258
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=4039
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=4053
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=4052
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=4051
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=4047
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=4049
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=4048
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=4362
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=4361
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=6552
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=4044
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=680,IsDisplayed='Y' WHERE AD_Field_ID=4266
;

-- 16/06/2016 19:43:17 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=690,IsDisplayed='Y' WHERE AD_Field_ID=52052
;

-- 16/06/2016 19:43:59 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET DisplayLogic='@TenderType@=D',Updated=TO_TIMESTAMP('2016-06-16 19:43:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002679
;

-- 16/06/2016 19:44:15 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-06-16 19:44:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002679
;

-- 16/06/2016 19:46:34 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000046,'T','LAR','N','Tarjeta de Debito',0,0,100,TO_TIMESTAMP('2016-06-16 19:46:34','YYYY-MM-DD HH24:MI:SS'),'Y',TO_TIMESTAMP('2016-06-16 19:46:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 16/06/2016 19:46:34 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000046 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 16/06/2016 19:47:21 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
INSERT INTO AD_Ref_Table (IsValueDisplayed,AD_Table_ID,AD_Reference_ID,AD_Key,AD_Display,EntityType,CreatedBy,Updated,Created,AD_Client_ID,UpdatedBy,AD_Org_ID,IsActive) VALUES ('N',3000031,3000046,3001045,3001055,'LAR',100,TO_TIMESTAMP('2016-06-16 19:47:21','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-06-16 19:47:21','YYYY-MM-DD HH24:MI:SS'),0,100,0,'Y')
;

-- 16/06/2016 19:47:37 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET AD_Reference_ID=18, AD_Reference_Value_ID=3000046,Updated=TO_TIMESTAMP('2016-06-16 19:47:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002679
;

-- 16/06/2016 19:52:06 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001773,3000032,'LAR',0,'N','N','N','N',10,'N',19,'N',3000338,'N','Y','N','Tarjeta de Debito','LAR_Tarjeta_Debito_ID',100,TO_TIMESTAMP('2016-06-16 19:52:06','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-06-16 19:52:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 16/06/2016 19:52:06 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001773 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 16/06/2016 19:52:30 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Column SET AD_Reference_Value_ID=3000046, AD_Reference_ID=18, AD_Val_Rule_ID=3000032, IsAllowCopy='N',Updated=TO_TIMESTAMP('2016-06-16 19:52:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001057
;

-- 16/06/2016 19:53:21 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002680,10,'Y','N','N',3001773,'N','Y',3000056,'N','LAR','Tarjeta de Debito',100,0,'Y',TO_TIMESTAMP('2016-06-16 19:53:21','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2016-06-16 19:53:21','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/06/2016 19:53:21 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002680 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/06/2016 19:53:32 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3002680
;

-- 16/06/2016 19:53:32 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3001888
;

-- 16/06/2016 19:53:44 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-06-16 19:53:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002680
;

-- 16/06/2016 19:53:50 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET DisplayLogic='@TenderType@=''C''',Updated=TO_TIMESTAMP('2016-06-16 19:53:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002680
;

-- 16/06/2016 19:53:56 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET DisplayLogic='@TenderType@=''D''',Updated=TO_TIMESTAMP('2016-06-16 19:53:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002680
;

-- 16/06/2016 19:56:47 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Field SET AD_Reference_ID=18, AD_Reference_Value_ID=3000046, AD_Val_Rule_ID=3000032,Updated=TO_TIMESTAMP('2016-06-16 19:56:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002680
;

-- 16/06/2016 19:59:03 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Column SET AD_Reference_Value_ID=NULL, AD_Val_Rule_ID=NULL,Updated=TO_TIMESTAMP('2016-06-16 19:59:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001057
;

-- 16/06/2016 19:59:08 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Column SET AD_Reference_ID=19,Updated=TO_TIMESTAMP('2016-06-16 19:59:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001057
;

-- 21/06/2016 19:42:00 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Column SET AD_Val_Rule_ID=3000031,Updated=TO_TIMESTAMP('2016-06-21 19:42:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001188
;

-- 21/06/2016 19:42:19 ART
-- BUG #192: ABM - Maestro de planes de tarjeta.
UPDATE AD_Column SET AD_Reference_Value_ID=3000046, AD_Reference_ID=18,Updated=TO_TIMESTAMP('2016-06-21 19:42:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001772
;

-- Registración de script
SELECT register_migration_script_lar('0070_ISSUE-80', 'LAR', '')
;
