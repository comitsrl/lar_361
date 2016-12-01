CREATE TABLE LAR_ConceptoCaja
(
  LAR_ConceptoCaja_ID numeric(10,0) NOT NULL,
  ad_client_id numeric(10,0) NOT NULL,
  ad_org_id numeric(10,0) NOT NULL,
  isactive character(1) NOT NULL DEFAULT 'Y'::bpchar,
  created timestamp without time zone NOT NULL DEFAULT now(),
  createdby numeric(10,0) NOT NULL,
  updated timestamp without time zone NOT NULL DEFAULT now(),
  updatedby numeric(10,0) NOT NULL,
  value character varying(40) NOT NULL,
  name character varying(60) NOT NULL,
  description character varying(255),
  CONSTRAINT LAR_ConceptoCaja_key PRIMARY KEY (LAR_ConceptoCaja_ID),
  CONSTRAINT lar_conceptocaja_isactive_check CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
);

CREATE TABLE LAR_RetiroCaja
(
  LAR_RetiroCaja_ID numeric(10,0) NOT NULL,
  ad_client_id numeric(10,0) NOT NULL,
  ad_org_id numeric(10,0) NOT NULL,
  isactive character(1) NOT NULL DEFAULT 'Y'::bpchar,
  created timestamp without time zone NOT NULL DEFAULT now(),
  createdby numeric(10,0) NOT NULL,
  updated timestamp without time zone NOT NULL DEFAULT now(),
  updatedby numeric(10,0) NOT NULL,
  C_BankAccountFrom_ID numeric(10,0) NOT NULL,
  C_BankAccountTo_ID numeric(10,0),
  LAR_ConceptoCaja_ID numeric(10,0) NOT NULL,
  description character varying(255),
  Monto numeric NOT NULL DEFAULT 0,
  C_Currency_ID numeric(10,0) NOT NULL,
  Retiro character(1) NOT NULL DEFAULT 'N'::bpchar,
  Transferencia character(1) NOT NULL DEFAULT 'N'::bpchar,
  DocStatus character(2) NOT NULL,
  DocAction character(2) NOT NULL,
  Processed character(1) NOT NULL DEFAULT 'N'::bpchar,
  C_DocType_ID numeric(10,0) NOT NULL,
  Pago_ID numeric(10,0),
  Cobro_ID numeric(10,0),
  CONSTRAINT LAR_RetiroCaja_key PRIMARY KEY (LAR_RetiroCaja_ID),
  CONSTRAINT cbankaccountfrom_laretirocaja FOREIGN KEY (C_BankAccountFrom_ID)
      REFERENCES C_BankAccount (C_BankAccount_ID) MATCH SIMPLE,
  CONSTRAINT cbankaccountto_laretirocaja FOREIGN KEY (C_BankAccountTo_ID)
      REFERENCES C_BankAccount (C_BankAccount_ID) MATCH SIMPLE,
  CONSTRAINT larconceptocaja_laretirocaja FOREIGN KEY (LAR_ConceptoCaja_ID)
      REFERENCES LAR_ConceptoCaja (LAR_ConceptoCaja_ID) MATCH SIMPLE,
  CONSTRAINT ccurrency_laretirocaja FOREIGN KEY (C_Currency_ID)
      REFERENCES C_Currency (C_Currency_ID) MATCH SIMPLE,
  CONSTRAINT cdoctype_laretirocaja FOREIGN KEY (C_DocType_ID)
      REFERENCES C_DocType (C_DocType_ID) MATCH SIMPLE,
  CONSTRAINT pagoid_laretirocaja FOREIGN KEY (Pago_ID)
      REFERENCES C_Payment (C_Payment_ID) MATCH SIMPLE,
  CONSTRAINT cobroid_laretirocaja FOREIGN KEY (Cobro_ID)
      REFERENCES C_Payment (C_Payment_ID) MATCH SIMPLE,
  CONSTRAINT lar_retirocaja_isactive_check CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])),
  CONSTRAINT lar_retirocaja_retiro_check CHECK (Retiro = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])),
  CONSTRAINT lar_retirocaja_transferencia_check CHECK (Transferencia = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])),
  CONSTRAINT lar_retirocaja_processed_check CHECK (Processed = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
);

-- 27/07/2016 20:39:56 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,ImportTable,IsHighVolume,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','3',0,3000080,'N','N','N','N','N','LAR','Y','Y','L','LAR_ConceptoCaja','Conceptos de Caja',0,'Y',0,100,TO_TIMESTAMP('2016-07-27 20:39:55','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2016-07-27 20:39:55','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/07/2016 20:39:56 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000080 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- 27/07/2016 20:39:56 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,UpdatedBy,AD_Client_ID,Updated,Created,CreatedBy,IsActive) VALUES (1,'N',200000,'Y',1000000,1000000,'N','Y',3000299,'Table LAR_ConceptoCaja','LAR_ConceptoCaja',0,100,0,TO_TIMESTAMP('2016-07-27 20:39:56','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-07-27 20:39:56','YYYY-MM-DD HH24:MI:SS'),100,'Y')
;

-- 27/07/2016 20:40:04 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000351,'LAR_ConceptoCaja_ID','LAR','Conceptos de Caja','Conceptos de Caja',0,TO_TIMESTAMP('2016-07-27 20:40:03','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-07-27 20:40:03','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 27/07/2016 20:40:04 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000351 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 27/07/2016 20:40:04 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001798,3000080,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3000351,'N','N','N','Conceptos de Caja','LAR_ConceptoCaja_ID',100,TO_TIMESTAMP('2016-07-27 20:40:03','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-07-27 20:40:03','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/07/2016 20:40:04 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001798 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/07/2016 20:40:04 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001799,3000080,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,TO_TIMESTAMP('2016-07-27 20:40:04','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-07-27 20:40:04','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/07/2016 20:40:04 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001799 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/07/2016 20:40:04 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001800,3000080,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',100,TO_TIMESTAMP('2016-07-27 20:40:04','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-07-27 20:40:04','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/07/2016 20:40:04 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001800 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/07/2016 20:40:04 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001801,3000080,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,TO_TIMESTAMP('2016-07-27 20:40:04','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-07-27 20:40:04','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/07/2016 20:40:04 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001801 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/07/2016 20:40:05 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001802,3000080,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,TO_TIMESTAMP('2016-07-27 20:40:04','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-07-27 20:40:04','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/07/2016 20:40:05 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001802 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/07/2016 20:40:05 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001803,3000080,'LAR',0,110,'Y','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,TO_TIMESTAMP('2016-07-27 20:40:05','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-07-27 20:40:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/07/2016 20:40:05 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001803 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/07/2016 20:40:05 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001804,3000080,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,TO_TIMESTAMP('2016-07-27 20:40:05','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-07-27 20:40:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/07/2016 20:40:05 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001804 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/07/2016 20:40:05 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001805,3000080,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,TO_TIMESTAMP('2016-07-27 20:40:05','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-07-27 20:40:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/07/2016 20:40:05 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001805 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/07/2016 20:40:05 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001806,3000080,'LAR',0,'Y','N','N','A search key allows you a fast method of finding a particular record.
If you leave the search key empty, the system automatically creates a numeric number.  The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).','N',40,'Y',10,'N',620,'N','Y','N','Search key for the record in the format required - must be unique','Search Key','Value',100,TO_TIMESTAMP('2016-07-27 20:40:05','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-07-27 20:40:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/07/2016 20:40:05 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001806 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/07/2016 20:40:05 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001807,3000080,'LAR',0,'Y','N','Y',1,'The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.','N',60,'Y',10,'N',469,'N','Y','N','Alphanumeric identifier of the entity','Name','Name',100,TO_TIMESTAMP('2016-07-27 20:40:05','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-07-27 20:40:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/07/2016 20:40:05 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001807 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/07/2016 20:40:05 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001808,3000080,'LAR',0,'N','N','N','A description is limited to 255 characters.','N',255,'Y',10,'N',275,'N','Y','N','Optional short description of the record','Description','Description',100,TO_TIMESTAMP('2016-07-27 20:40:05','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-07-27 20:40:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/07/2016 20:40:05 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001808 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/07/2016 20:41:09 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET IsIdentifier='Y',Updated=TO_TIMESTAMP('2016-07-27 20:41:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001806
;

-- 27/07/2016 20:42:44 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Window (AD_Window_ID,WindowType,IsSOTrx,IsDefault,IsBetaFunctionality,WinHeight,WinWidth,EntityType,Name,IsActive,Created,UpdatedBy,CreatedBy,Updated,AD_Org_ID,AD_Client_ID,Processing) VALUES (3000062,'M','Y','N','N',0,0,'LAR','Conceptos de Caja','Y',TO_TIMESTAMP('2016-07-27 20:42:44','YYYY-MM-DD HH24:MI:SS'),100,100,TO_TIMESTAMP('2016-07-27 20:42:44','YYYY-MM-DD HH24:MI:SS'),0,0,'N')
;

-- 27/07/2016 20:42:44 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Window_Trl (AD_Language,AD_Window_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Window_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Window t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Window_ID=3000062 AND NOT EXISTS (SELECT * FROM AD_Window_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Window_ID=t.AD_Window_ID)
;

-- 27/07/2016 20:43:00 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Table SET AD_Window_ID=3000062,Updated=TO_TIMESTAMP('2016-07-27 20:43:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000080
;

-- 27/07/2016 20:43:44 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('N',3000062,10,'N','N',3000080,3000126,'N','N','N','N',0,'Y','N','LAR','Conceptos de Caja',0,0,TO_TIMESTAMP('2016-07-27 20:43:44','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2016-07-27 20:43:44','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 27/07/2016 20:43:44 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000126 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 27/07/2016 20:43:53 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002732,1,'Y','N','N',3001801,'N','Y',3000126,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,TO_TIMESTAMP('2016-07-27 20:43:53','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-07-27 20:43:53','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/07/2016 20:43:53 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002732 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/07/2016 20:43:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002733,10,'Y','N','N',3001799,'N','Y',3000126,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,TO_TIMESTAMP('2016-07-27 20:43:53','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-07-27 20:43:53','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/07/2016 20:43:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002733 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/07/2016 20:43:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002734,10,'N','N','N',3001798,'N','Y',3000126,'N','LAR','Conceptos de Caja',100,0,TO_TIMESTAMP('2016-07-27 20:43:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-07-27 20:43:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/07/2016 20:43:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002734 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/07/2016 20:43:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002735,255,'Y','N','N',3001808,'N','Y',3000126,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,TO_TIMESTAMP('2016-07-27 20:43:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-07-27 20:43:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/07/2016 20:43:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002735 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/07/2016 20:43:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002736,60,'Y','N','N',3001807,'N','Y',3000126,'N','The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.','LAR','Alphanumeric identifier of the entity','Name',100,0,TO_TIMESTAMP('2016-07-27 20:43:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-07-27 20:43:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/07/2016 20:43:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002736 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/07/2016 20:43:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002737,10,'Y','N','N',3001800,'N','Y',3000126,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,TO_TIMESTAMP('2016-07-27 20:43:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-07-27 20:43:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/07/2016 20:43:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002737 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/07/2016 20:43:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002738,40,'Y','N','N',3001806,'N','Y',3000126,'N','A search key allows you a fast method of finding a particular record.
If you leave the search key empty, the system automatically creates a numeric number.  The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).','LAR','Search key for the record in the format required - must be unique','Search Key',100,0,TO_TIMESTAMP('2016-07-27 20:43:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-07-27 20:43:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/07/2016 20:43:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002738 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/07/2016 20:44:29 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3002733
;

-- 27/07/2016 20:44:29 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3002737
;

-- 27/07/2016 20:44:30 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3002736
;

-- 27/07/2016 20:44:30 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3002738
;

-- 27/07/2016 20:44:30 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3002735
;

-- 27/07/2016 20:44:30 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3002732
;

-- 27/07/2016 20:45:07 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-07-27 20:45:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002738
;

-- 27/07/2016 20:49:14 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Menu (AD_Window_ID,AD_Menu_ID,IsSummary,"action",IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000062,3000182,'N','W','N','N','LAR','Y','Conceptos de Caja',TO_TIMESTAMP('2016-07-27 20:49:13','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_TIMESTAMP('2016-07-27 20:49:13','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 27/07/2016 20:49:14 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000182 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 27/07/2016 20:49:14 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100,t.AD_Tree_ID, 3000182, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000182)
;

-- 27/07/2016 20:49:22 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=3000008, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000016
;

-- 27/07/2016 20:49:22 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=3000008, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000007
;

-- 27/07/2016 20:49:22 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=3000008, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000066
;

-- 27/07/2016 20:49:22 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=3000008, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000182
;

-- 27/07/2016 20:49:22 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=3000008, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000009
;

-- 27/07/2016 20:51:19 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2016-07-27 20:51:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002736
;

-- 27/07/2016 20:51:24 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2016-07-27 20:51:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002738
;

-- 27/07/2016 20:52:38 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-07-27 20:52:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002737
;

-- 27/07/2016 20:53:37 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Tab SET IsSingleRow='Y',Updated=TO_TIMESTAMP('2016-07-27 20:53:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000126
;

-- 27/07/2016 20:57:24 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,ImportTable,IsHighVolume,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','3',0,3000081,'N','N','N','N','N','LAR','Y','Y','L','LAR_RetiroCaja','Retiros de Caja',0,'Y',0,100,TO_TIMESTAMP('2016-07-27 20:57:24','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2016-07-27 20:57:24','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/07/2016 20:57:24 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000081 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- 27/07/2016 20:57:24 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,UpdatedBy,AD_Client_ID,Updated,Created,CreatedBy,IsActive) VALUES (1,'N',200000,'Y',1000000,1000000,'N','Y',3000301,'Table LAR_RetiroCaja','LAR_RetiroCaja',0,100,0,TO_TIMESTAMP('2016-07-27 20:57:24','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-07-27 20:57:24','YYYY-MM-DD HH24:MI:SS'),100,'Y')
;

-- 27/07/2016 20:57:35 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000352,'LAR_RetiroCaja_ID','LAR','Retiros de Caja','Retiros de Caja',0,TO_TIMESTAMP('2016-07-27 20:57:34','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-07-27 20:57:34','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 27/07/2016 20:57:35 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000352 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 27/07/2016 20:57:35 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001809,3000081,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3000352,'N','N','N','Retiros de Caja','LAR_RetiroCaja_ID',100,TO_TIMESTAMP('2016-07-27 20:57:34','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-07-27 20:57:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/07/2016 20:57:35 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001809 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/07/2016 20:57:35 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001810,3000081,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,TO_TIMESTAMP('2016-07-27 20:57:35','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-07-27 20:57:35','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/07/2016 20:57:35 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001810 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/07/2016 20:57:35 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001811,3000081,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',100,TO_TIMESTAMP('2016-07-27 20:57:35','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-07-27 20:57:35','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/07/2016 20:57:35 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001811 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/07/2016 20:57:35 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001812,3000081,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,TO_TIMESTAMP('2016-07-27 20:57:35','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-07-27 20:57:35','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/07/2016 20:57:35 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001812 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/07/2016 20:57:35 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001813,3000081,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,TO_TIMESTAMP('2016-07-27 20:57:35','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-07-27 20:57:35','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/07/2016 20:57:35 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001813 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/07/2016 20:57:35 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001814,3000081,'LAR',0,110,'Y','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,TO_TIMESTAMP('2016-07-27 20:57:35','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-07-27 20:57:35','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/07/2016 20:57:35 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001814 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/07/2016 20:57:36 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001815,3000081,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,TO_TIMESTAMP('2016-07-27 20:57:35','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-07-27 20:57:35','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/07/2016 20:57:36 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001815 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/07/2016 20:57:36 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001816,3000081,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,TO_TIMESTAMP('2016-07-27 20:57:36','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-07-27 20:57:36','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/07/2016 20:57:36 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001816 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/07/2016 20:57:36 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000353,'c_bankaccountfrom_id','LAR','c_bankaccountfrom_id','c_bankaccountfrom_id',0,TO_TIMESTAMP('2016-07-27 20:57:36','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-07-27 20:57:36','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 27/07/2016 20:57:36 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000353 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 27/07/2016 20:57:36 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001817,3000081,'LAR',0,'Y','N','N','N',10,'N',19,'N',3000353,'N','Y','N','c_bankaccountfrom_id','c_bankaccountfrom_id',100,TO_TIMESTAMP('2016-07-27 20:57:36','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-07-27 20:57:36','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/07/2016 20:57:36 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001817 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/07/2016 20:57:36 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000354,'c_bankaccountto_id','LAR','c_bankaccountto_id','c_bankaccountto_id',0,TO_TIMESTAMP('2016-07-27 20:57:36','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-07-27 20:57:36','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 27/07/2016 20:57:36 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000354 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 27/07/2016 20:57:36 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001818,3000081,'LAR',0,'N','N','N','N',10,'N',19,'N',3000354,'N','Y','N','c_bankaccountto_id','c_bankaccountto_id',100,TO_TIMESTAMP('2016-07-27 20:57:36','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-07-27 20:57:36','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/07/2016 20:57:36 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001818 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/07/2016 20:57:37 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001819,3000081,'LAR',0,'Y','N','N','N',10,'N',19,'N',3000351,'N','Y','N','Conceptos de Caja','LAR_ConceptoCaja_ID',100,TO_TIMESTAMP('2016-07-27 20:57:36','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-07-27 20:57:36','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/07/2016 20:57:37 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001819 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/07/2016 20:57:37 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001820,3000081,'LAR',0,'N','N','N','A description is limited to 255 characters.','N',255,'Y',10,'N',275,'N','Y','N','Optional short description of the record','Description','Description',100,TO_TIMESTAMP('2016-07-27 20:57:37','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-07-27 20:57:37','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/07/2016 20:57:37 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001820 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/07/2016 20:57:37 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000355,'monto','LAR','monto','monto',0,TO_TIMESTAMP('2016-07-27 20:57:37','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-07-27 20:57:37','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 27/07/2016 20:57:37 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000355 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 27/07/2016 20:57:37 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001821,3000081,'LAR',0,'Y','N','N','N',131089,'N',22,'N',3000355,'N','Y','N','monto','monto',100,TO_TIMESTAMP('2016-07-27 20:57:37','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-07-27 20:57:37','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/07/2016 20:57:37 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001821 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/07/2016 20:57:37 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001822,3000081,'LAR',0,'Y','N','N','Indicates the Currency to be used when processing or reporting on this record','N',10,'N',19,'N',193,'N','Y','N','The Currency for this record','Currency','C_Currency_ID',100,TO_TIMESTAMP('2016-07-27 20:57:37','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-07-27 20:57:37','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/07/2016 20:57:37 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001822 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/07/2016 20:57:37 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000356,'retiro','LAR','retiro','retiro',0,TO_TIMESTAMP('2016-07-27 20:57:37','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-07-27 20:57:37','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 27/07/2016 20:57:37 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000356 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 27/07/2016 20:57:37 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001823,3000081,'LAR',0,'Y','N','N','N',1,'N',20,'N',3000356,'N','Y','N','retiro','retiro',100,TO_TIMESTAMP('2016-07-27 20:57:37','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-07-27 20:57:37','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/07/2016 20:57:37 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001823 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/07/2016 20:57:38 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000357,'transferencia','LAR','transferencia','transferencia',0,TO_TIMESTAMP('2016-07-27 20:57:38','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-07-27 20:57:38','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 27/07/2016 20:57:38 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000357 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 27/07/2016 20:57:38 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001824,3000081,'LAR',0,'Y','N','N','N',1,'N',20,'N',3000357,'N','Y','N','transferencia','transferencia',100,TO_TIMESTAMP('2016-07-27 20:57:38','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-07-27 20:57:38','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/07/2016 20:57:38 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001824 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/07/2016 20:57:38 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001825,3000081,'LAR',0,'Y','N','N','The Document Status indicates the status of a document at this time.  If you want to change the document status, use the Document Action field','N',2,'N',17,'N',289,'N','Y','N','The current status of the document','Document Status','DocStatus',100,TO_TIMESTAMP('2016-07-27 20:57:38','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-07-27 20:57:38','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/07/2016 20:57:38 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001825 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/07/2016 20:57:38 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001826,3000081,'LAR',0,'Y','N','N','You find the current status in the Document Status field. The options are listed in a popup','N',2,'N',17,'N',287,'N','Y','N','The targeted status of the document','Document Action','DocAction',100,TO_TIMESTAMP('2016-07-27 20:57:38','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-07-27 20:57:38','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/07/2016 20:57:38 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001826 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/07/2016 20:59:12 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET Name='Cuenta Origen', ColumnName='C_BankAccountFrom_ID',Updated=TO_TIMESTAMP('2016-07-27 20:59:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001817
;

-- 27/07/2016 20:59:12 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001817
;

-- 27/07/2016 20:59:12 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET Name='Cuenta Origen', Description=NULL, Help=NULL WHERE AD_Column_ID=3001817 AND IsCentrallyMaintained='Y'
;

-- 27/07/2016 20:59:18 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column_Trl SET Name='Cuenta Origen',Updated=TO_TIMESTAMP('2016-07-27 20:59:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001817 AND AD_Language='es_AR'
;

-- 27/07/2016 20:59:40 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element SET ColumnName='C_BankAccountFrom_ID', Name='Cuenta Origen', PrintName='Cuenta Origen',Updated=TO_TIMESTAMP('2016-07-27 20:59:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000353
;

-- 27/07/2016 20:59:40 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000353
;

-- 27/07/2016 20:59:40 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET ColumnName='C_BankAccountFrom_ID', Name='Cuenta Origen', Description=NULL, Help=NULL WHERE AD_Element_ID=3000353
;

-- 27/07/2016 20:59:40 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='C_BankAccountFrom_ID', Name='Cuenta Origen', Description=NULL, Help=NULL, AD_Element_ID=3000353 WHERE UPPER(ColumnName)='C_BANKACCOUNTFROM_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 27/07/2016 20:59:40 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='C_BankAccountFrom_ID', Name='Cuenta Origen', Description=NULL, Help=NULL WHERE AD_Element_ID=3000353 AND IsCentrallyMaintained='Y'
;

-- 27/07/2016 20:59:40 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET Name='Cuenta Origen', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000353) AND IsCentrallyMaintained='Y'
;

-- 27/07/2016 20:59:40 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_PrintFormatItem SET PrintName='Cuenta Origen', Name='Cuenta Origen' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000353)
;

-- 27/07/2016 20:59:50 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Cuenta Origen',PrintName='Cuenta Origen',Updated=TO_TIMESTAMP('2016-07-27 20:59:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000353 AND AD_Language='es_AR'
;

-- 27/07/2016 21:00:27 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Caja Origen',PrintName='Caja Origen',Updated=TO_TIMESTAMP('2016-07-27 21:00:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000353 AND AD_Language='es_AR'
;

-- 27/07/2016 21:00:37 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element SET Name='Caja Origen', PrintName='Caja Origen',Updated=TO_TIMESTAMP('2016-07-27 21:00:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000353
;

-- 27/07/2016 21:00:37 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000353
;

-- 27/07/2016 21:00:37 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET ColumnName='C_BankAccountFrom_ID', Name='Caja Origen', Description=NULL, Help=NULL WHERE AD_Element_ID=3000353
;

-- 27/07/2016 21:00:37 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='C_BankAccountFrom_ID', Name='Caja Origen', Description=NULL, Help=NULL, AD_Element_ID=3000353 WHERE UPPER(ColumnName)='C_BANKACCOUNTFROM_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 27/07/2016 21:00:37 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='C_BankAccountFrom_ID', Name='Caja Origen', Description=NULL, Help=NULL WHERE AD_Element_ID=3000353 AND IsCentrallyMaintained='Y'
;

-- 27/07/2016 21:00:37 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET Name='Caja Origen', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000353) AND IsCentrallyMaintained='Y'
;

-- 27/07/2016 21:00:37 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_PrintFormatItem SET PrintName='Caja Origen', Name='Caja Origen' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000353)
;

-- 27/07/2016 21:00:54 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column_Trl SET Name='Caja Origen',Updated=TO_TIMESTAMP('2016-07-27 21:00:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001817 AND AD_Language='es_AR'
;

-- 27/07/2016 21:01:46 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET Name='Caja Destino', ColumnName='C_BankAccountTo_ID',Updated=TO_TIMESTAMP('2016-07-27 21:01:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001818
;

-- 27/07/2016 21:01:46 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001818
;

-- 27/07/2016 21:01:46 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET Name='Caja Destino', Description=NULL, Help=NULL WHERE AD_Column_ID=3001818 AND IsCentrallyMaintained='Y'
;

-- 27/07/2016 21:01:55 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column_Trl SET Name='Caja Destino',Updated=TO_TIMESTAMP('2016-07-27 21:01:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001818 AND AD_Language='es_AR'
;

-- 27/07/2016 21:02:26 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element SET ColumnName='C_BankAccountTo_ID', Name='Caja Destino', PrintName='Caja Destino',Updated=TO_TIMESTAMP('2016-07-27 21:02:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000354
;

-- 27/07/2016 21:02:26 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000354
;

-- 27/07/2016 21:02:26 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET ColumnName='C_BankAccountTo_ID', Name='Caja Destino', Description=NULL, Help=NULL WHERE AD_Element_ID=3000354
;

-- 27/07/2016 21:02:26 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='C_BankAccountTo_ID', Name='Caja Destino', Description=NULL, Help=NULL, AD_Element_ID=3000354 WHERE UPPER(ColumnName)='C_BANKACCOUNTTO_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 27/07/2016 21:02:26 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='C_BankAccountTo_ID', Name='Caja Destino', Description=NULL, Help=NULL WHERE AD_Element_ID=3000354 AND IsCentrallyMaintained='Y'
;

-- 27/07/2016 21:02:26 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET Name='Caja Destino', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000354) AND IsCentrallyMaintained='Y'
;

-- 27/07/2016 21:02:26 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_PrintFormatItem SET PrintName='Caja Destino', Name='Caja Destino' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000354)
;

-- 27/07/2016 21:02:35 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Caja Destino',PrintName='Caja Destino',Updated=TO_TIMESTAMP('2016-07-27 21:02:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000354 AND AD_Language='es_AR'
;

-- 27/07/2016 21:04:28 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET Name='Monto', ColumnName='Monto',Updated=TO_TIMESTAMP('2016-07-27 21:04:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001821
;

-- 27/07/2016 21:04:28 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001821
;

-- 27/07/2016 21:04:28 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET Name='Monto', Description=NULL, Help=NULL WHERE AD_Column_ID=3001821 AND IsCentrallyMaintained='Y'
;

-- 27/07/2016 21:04:47 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET AD_Reference_ID=12,Updated=TO_TIMESTAMP('2016-07-27 21:04:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001821
;

-- 27/07/2016 21:04:56 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column_Trl SET Name='Monto',Updated=TO_TIMESTAMP('2016-07-27 21:04:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001821 AND AD_Language='es_AR'
;

-- 27/07/2016 21:05:20 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element SET ColumnName='Monto', Name='Monto', PrintName='Monto',Updated=TO_TIMESTAMP('2016-07-27 21:05:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000355
;

-- 27/07/2016 21:05:20 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000355
;

-- 27/07/2016 21:05:20 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET ColumnName='Monto', Name='Monto', Description=NULL, Help=NULL WHERE AD_Element_ID=3000355
;

-- 27/07/2016 21:05:20 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='Monto', Name='Monto', Description=NULL, Help=NULL, AD_Element_ID=3000355 WHERE UPPER(ColumnName)='MONTO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 27/07/2016 21:05:20 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='Monto', Name='Monto', Description=NULL, Help=NULL WHERE AD_Element_ID=3000355 AND IsCentrallyMaintained='Y'
;

-- 27/07/2016 21:05:20 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET Name='Monto', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000355) AND IsCentrallyMaintained='Y'
;

-- 27/07/2016 21:05:20 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_PrintFormatItem SET PrintName='Monto', Name='Monto' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000355)
;

-- 27/07/2016 21:05:27 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Monto',PrintName='Monto',Updated=TO_TIMESTAMP('2016-07-27 21:05:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000355 AND AD_Language='es_AR'
;

-- 27/07/2016 21:06:41 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET Name='Retiro', ColumnName='Retiro',Updated=TO_TIMESTAMP('2016-07-27 21:06:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001823
;

-- 27/07/2016 21:06:41 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001823
;

-- 27/07/2016 21:06:41 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET Name='Retiro', Description=NULL, Help=NULL WHERE AD_Column_ID=3001823 AND IsCentrallyMaintained='Y'
;

-- 27/07/2016 21:06:45 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column_Trl SET Name='Retiro',Updated=TO_TIMESTAMP('2016-07-27 21:06:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001823 AND AD_Language='es_AR'
;

-- 27/07/2016 21:06:53 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element SET ColumnName='Retiro', Name='Retiro', PrintName='Retiro',Updated=TO_TIMESTAMP('2016-07-27 21:06:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000356
;

-- 27/07/2016 21:06:53 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000356
;

-- 27/07/2016 21:06:53 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET ColumnName='Retiro', Name='Retiro', Description=NULL, Help=NULL WHERE AD_Element_ID=3000356
;

-- 27/07/2016 21:06:53 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='Retiro', Name='Retiro', Description=NULL, Help=NULL, AD_Element_ID=3000356 WHERE UPPER(ColumnName)='RETIRO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 27/07/2016 21:06:53 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='Retiro', Name='Retiro', Description=NULL, Help=NULL WHERE AD_Element_ID=3000356 AND IsCentrallyMaintained='Y'
;

-- 27/07/2016 21:06:53 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET Name='Retiro', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000356) AND IsCentrallyMaintained='Y'
;

-- 27/07/2016 21:06:53 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_PrintFormatItem SET PrintName='Retiro', Name='Retiro' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000356)
;

-- 27/07/2016 21:06:58 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Retiro',PrintName='Retiro',Updated=TO_TIMESTAMP('2016-07-27 21:06:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000356 AND AD_Language='es_AR'
;

-- 27/07/2016 21:07:52 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET Name='Transferencia', ColumnName='Transferencia',Updated=TO_TIMESTAMP('2016-07-27 21:07:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001824
;

-- 27/07/2016 21:07:52 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001824
;

-- 27/07/2016 21:07:52 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET Name='Transferencia', Description=NULL, Help=NULL WHERE AD_Column_ID=3001824 AND IsCentrallyMaintained='Y'
;

-- 27/07/2016 21:07:58 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column_Trl SET Name='Transferencia',Updated=TO_TIMESTAMP('2016-07-27 21:07:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001824 AND AD_Language='es_AR'
;

-- 27/07/2016 21:08:08 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element SET ColumnName='Transferencia', Name='Transferencia', PrintName='Transferencia',Updated=TO_TIMESTAMP('2016-07-27 21:08:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000357
;

-- 27/07/2016 21:08:08 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000357
;

-- 27/07/2016 21:08:08 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET ColumnName='Transferencia', Name='Transferencia', Description=NULL, Help=NULL WHERE AD_Element_ID=3000357
;

-- 27/07/2016 21:08:08 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='Transferencia', Name='Transferencia', Description=NULL, Help=NULL, AD_Element_ID=3000357 WHERE UPPER(ColumnName)='TRANSFERENCIA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 27/07/2016 21:08:08 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='Transferencia', Name='Transferencia', Description=NULL, Help=NULL WHERE AD_Element_ID=3000357 AND IsCentrallyMaintained='Y'
;

-- 27/07/2016 21:08:08 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET Name='Transferencia', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000357) AND IsCentrallyMaintained='Y'
;

-- 27/07/2016 21:08:08 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_PrintFormatItem SET PrintName='Transferencia', Name='Transferencia' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000357)
;

-- 27/07/2016 21:08:13 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Transferencia',PrintName='Transferencia',Updated=TO_TIMESTAMP('2016-07-27 21:08:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000357 AND AD_Language='es_AR'
;

-- 27/07/2016 21:09:13 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Window (AD_Window_ID,WindowType,IsSOTrx,IsDefault,IsBetaFunctionality,WinHeight,WinWidth,EntityType,Name,IsActive,Created,UpdatedBy,CreatedBy,Updated,AD_Org_ID,AD_Client_ID,Processing) VALUES (3000063,'M','Y','N','N',0,0,'LAR','Retiros de Caja','Y',TO_TIMESTAMP('2016-07-27 21:09:13','YYYY-MM-DD HH24:MI:SS'),100,100,TO_TIMESTAMP('2016-07-27 21:09:13','YYYY-MM-DD HH24:MI:SS'),0,0,'N')
;

-- 27/07/2016 21:09:13 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Window_Trl (AD_Language,AD_Window_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Window_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Window t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Window_ID=3000063 AND NOT EXISTS (SELECT * FROM AD_Window_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Window_ID=t.AD_Window_ID)
;

-- 27/07/2016 21:09:49 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('N',3000063,10,'N','N',3000081,3000127,'N','N','N','N',0,'Y','N','LAR','Retiro de Caja',0,0,TO_TIMESTAMP('2016-07-27 21:09:49','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2016-07-27 21:09:49','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 27/07/2016 21:09:49 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000127 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 27/07/2016 21:09:53 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002739,1,'Y','N','N',3001812,'N','Y',3000127,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,TO_TIMESTAMP('2016-07-27 21:09:53','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-07-27 21:09:53','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/07/2016 21:09:53 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002739 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/07/2016 21:09:53 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002740,10,'Y','N','N',3001818,'N','Y',3000127,'N','LAR','Caja Destino',100,0,TO_TIMESTAMP('2016-07-27 21:09:53','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-07-27 21:09:53','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/07/2016 21:09:53 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002740 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/07/2016 21:09:53 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002741,10,'Y','N','N',3001817,'N','Y',3000127,'N','LAR','Caja Origen',100,0,TO_TIMESTAMP('2016-07-27 21:09:53','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-07-27 21:09:53','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/07/2016 21:09:53 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002741 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/07/2016 21:09:53 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002742,10,'Y','N','N',3001810,'N','Y',3000127,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,TO_TIMESTAMP('2016-07-27 21:09:53','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-07-27 21:09:53','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/07/2016 21:09:53 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002742 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/07/2016 21:09:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002743,10,'Y','N','N',3001819,'N','Y',3000127,'N','LAR','Conceptos de Caja',100,0,TO_TIMESTAMP('2016-07-27 21:09:53','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-07-27 21:09:53','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/07/2016 21:09:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002743 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/07/2016 21:09:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002744,10,'Y','N','N',3001822,'N','Y',3000127,'N','Indicates the Currency to be used when processing or reporting on this record','LAR','The Currency for this record','Currency',100,0,TO_TIMESTAMP('2016-07-27 21:09:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-07-27 21:09:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/07/2016 21:09:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002744 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/07/2016 21:09:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002745,255,'Y','N','N',3001820,'N','Y',3000127,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,TO_TIMESTAMP('2016-07-27 21:09:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-07-27 21:09:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/07/2016 21:09:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002745 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/07/2016 21:09:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002746,2,'Y','N','N',3001826,'N','Y',3000127,'N','You find the current status in the Document Status field. The options are listed in a popup','LAR','The targeted status of the document','Document Action',100,0,TO_TIMESTAMP('2016-07-27 21:09:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-07-27 21:09:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/07/2016 21:09:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002746 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/07/2016 21:09:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002747,2,'Y','N','N',3001825,'N','Y',3000127,'N','The Document Status indicates the status of a document at this time.  If you want to change the document status, use the Document Action field','LAR','The current status of the document','Document Status',100,0,TO_TIMESTAMP('2016-07-27 21:09:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-07-27 21:09:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/07/2016 21:09:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002747 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/07/2016 21:09:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002748,131089,'Y','N','N',3001821,'N','Y',3000127,'N','LAR','Monto',100,0,TO_TIMESTAMP('2016-07-27 21:09:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-07-27 21:09:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/07/2016 21:09:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002748 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/07/2016 21:09:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002749,10,'Y','N','N',3001811,'N','Y',3000127,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,TO_TIMESTAMP('2016-07-27 21:09:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-07-27 21:09:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/07/2016 21:09:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002749 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/07/2016 21:09:55 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002750,1,'Y','N','N',3001823,'N','Y',3000127,'N','LAR','Retiro',100,0,TO_TIMESTAMP('2016-07-27 21:09:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-07-27 21:09:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/07/2016 21:09:55 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002750 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/07/2016 21:09:55 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002751,10,'N','N','N',3001809,'N','Y',3000127,'N','LAR','Retiros de Caja',100,0,TO_TIMESTAMP('2016-07-27 21:09:55','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-07-27 21:09:55','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/07/2016 21:09:55 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002751 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/07/2016 21:09:55 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002752,1,'Y','N','N',3001824,'N','Y',3000127,'N','LAR','Transferencia',100,0,TO_TIMESTAMP('2016-07-27 21:09:55','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-07-27 21:09:55','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/07/2016 21:09:55 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002752 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/07/2016 21:10:11 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Table SET AD_Window_ID=3000063,Updated=TO_TIMESTAMP('2016-07-27 21:10:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000081
;

-- 27/07/2016 21:15:02 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Menu (AD_Window_ID,AD_Menu_ID,IsSummary,"action",IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000063,3000183,'N','W','N','N','LAR','Y','Retiros de Caja',TO_TIMESTAMP('2016-07-27 21:15:01','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_TIMESTAMP('2016-07-27 21:15:01','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 27/07/2016 21:15:02 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000183 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 27/07/2016 21:15:02 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100,t.AD_Tree_ID, 3000183, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000183)
;

-- 27/07/2016 21:15:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=3000008, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000016
;

-- 27/07/2016 21:15:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=3000008, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000007
;

-- 27/07/2016 21:15:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=3000008, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000066
;

-- 27/07/2016 21:15:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=3000008, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000183
;

-- 27/07/2016 21:15:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=3000008, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000182
;

-- 27/07/2016 21:15:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=3000008, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000009
;

-- 27/07/2016 21:16:18 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3002742
;

-- 27/07/2016 21:16:18 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3002749
;

-- 27/07/2016 21:16:18 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3002739
;

-- 27/07/2016 21:16:18 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3002740
;

-- 27/07/2016 21:16:18 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3002741
;

-- 27/07/2016 21:16:18 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3002743
;

-- 27/07/2016 21:16:18 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3002744
;

-- 27/07/2016 21:16:18 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3002745
;

-- 27/07/2016 21:16:18 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3002746
;

-- 27/07/2016 21:16:18 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3002747
;

-- 27/07/2016 21:16:18 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3002748
;

-- 27/07/2016 21:16:18 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3002750
;

-- 27/07/2016 21:16:18 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3002752
;

-- 27/07/2016 21:16:42 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-07-27 21:16:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002749
;

-- 27/07/2016 21:17:19 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3002745
;

-- 27/07/2016 21:17:19 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3002748
;

-- 27/07/2016 21:17:19 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3002750
;

-- 27/07/2016 21:17:19 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3002752
;

-- 27/07/2016 21:17:20 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3002747
;

-- 27/07/2016 21:17:20 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3002746
;

-- 27/07/2016 21:17:20 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3002739
;

-- 27/07/2016 21:17:37 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-07-27 21:17:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002746
;

-- 27/07/2016 21:17:56 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-07-27 21:17:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002752
;

-- 27/07/2016 21:18:05 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-07-27 21:18:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002748
;

-- 27/07/2016 21:20:47 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET IsIdentifier='Y', IsUpdateable='N', IsAllowCopy='N',Updated=TO_TIMESTAMP('2016-07-27 21:20:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001809
;

-- 27/07/2016 21:21:15 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-07-27 21:21:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002741
;

-- 27/07/2016 21:22:09 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET AD_Val_Rule_ID=3000034,Updated=TO_TIMESTAMP('2016-07-27 21:22:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001817
;

-- 27/07/2016 21:22:19 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET AD_Val_Rule_ID=3000034,Updated=TO_TIMESTAMP('2016-07-27 21:22:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001818
;

-- 27/07/2016 21:23:42 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3002741
;

-- 27/07/2016 21:23:42 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3002740
;

-- 27/07/2016 21:23:52 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2016-07-27 21:23:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002741
;

-- 27/07/2016 21:23:57 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-07-27 21:23:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002740
;

-- 27/07/2016 21:29:10 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET AD_Reference_Value_ID=53283, AD_Reference_ID=18,Updated=TO_TIMESTAMP('2016-07-27 21:29:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001818
;

-- 27/07/2016 21:29:24 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET AD_Reference_Value_ID=53283, AD_Reference_ID=18,Updated=TO_TIMESTAMP('2016-07-27 21:29:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001817
;

-- 27/07/2016 21:31:12 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET AD_Reference_ID=28,Updated=TO_TIMESTAMP('2016-07-27 21:31:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001826
;

-- 27/07/2016 21:31:27 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET AD_Reference_Value_ID=135,Updated=TO_TIMESTAMP('2016-07-27 21:31:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001826
;

-- 27/07/2016 21:31:48 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET AD_Reference_Value_ID=131,Updated=TO_TIMESTAMP('2016-07-27 21:31:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001825
;

-- 27/07/2016 21:32:11 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET IsUpdateable='N',Updated=TO_TIMESTAMP('2016-07-27 21:32:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001825
;

-- 27/07/2016 21:33:32 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET DefaultValue='CO', AD_Process_ID=104,Updated=TO_TIMESTAMP('2016-07-27 21:33:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001826
;

-- 27/07/2016 21:37:03 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET AD_Reference_Value_ID=NULL,Updated=TO_TIMESTAMP('2016-07-27 21:37:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001826
;

-- 27/07/2016 21:37:55 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET DefaultValue='DR',Updated=TO_TIMESTAMP('2016-07-27 21:37:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001825
;

-- 27/07/2016 21:39:40 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET AD_Reference_Value_ID=135, AD_Process_ID=NULL,Updated=TO_TIMESTAMP('2016-07-27 21:39:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001826
;

-- 27/07/2016 21:40:52 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Process (AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,CopyFromProcess,Value,Name,AD_Org_ID,AD_Client_ID,UpdatedBy,Created,CreatedBy,Updated,IsActive) VALUES (3000165,'N','N','3','N','N','Y','LAR',0,0,'N','10000000','RetiroDeCaja_Completar',0,0,100,TO_TIMESTAMP('2016-07-27 21:40:51','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2016-07-27 21:40:51','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 27/07/2016 21:40:52 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000165 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 27/07/2016 21:43:58 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Workflow (Cost,WorkingTime,AccessLevel,Author,AD_Workflow_ID,Duration,DurationUnit,EntityType,IsDefault,IsValid,"limit",Priority,PublishStatus,ValidateWorkflow,Version,AD_Table_ID,DocumentNo,WaitingTime,IsBetaFunctionality,WorkflowType,Name,Value,UpdatedBy,Updated,Created,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive) VALUES (0,0,'1','Comit',3000003,0,'D','LAR','N','N',0,0,'R','N',0,3000081,'10000001',0,'N','P','Proceso Retiro de Caja','10000002',100,TO_TIMESTAMP('2016-07-27 21:43:58','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-07-27 21:43:58','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y')
;

-- 27/07/2016 21:43:58 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Workflow_Trl (AD_Language,AD_Workflow_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Workflow_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Workflow t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Workflow_ID=3000003 AND NOT EXISTS (SELECT * FROM AD_Workflow_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Workflow_ID=t.AD_Workflow_ID)
;

-- 27/07/2016 21:45:06 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,"limit",WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,AD_Workflow_ID,"action",SplitElement,Value,Name,UpdatedBy,AD_Org_ID,Created,CreatedBy,IsActive,Updated,AD_Client_ID) VALUES (3000025,0,0,0,'CO',0,'LAR','Y','X',0,0,0,0,0,0,3000003,'D','X','(DocComplete)','(DocComplete)',100,0,TO_TIMESTAMP('2016-07-27 21:45:06','YYYY-MM-DD HH24:MI:SS'),100,'Y',TO_TIMESTAMP('2016-07-27 21:45:06','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 27/07/2016 21:45:06 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_WF_Node_Trl (AD_Language,AD_WF_Node_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_WF_Node_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_WF_Node t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_WF_Node_ID=3000025 AND NOT EXISTS (SELECT * FROM AD_WF_Node_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_WF_Node_ID=t.AD_WF_Node_ID)
;

-- 27/07/2016 21:46:05 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,"limit",WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,AD_Workflow_ID,"action",SplitElement,Value,Name,UpdatedBy,AD_Org_ID,Created,CreatedBy,IsActive,Updated,AD_Client_ID) VALUES (3000026,0,0,0,'CO',0,'LAR','Y','X',0,0,0,0,0,0,3000003,'Z','X','(Start)','(Start)',100,0,TO_TIMESTAMP('2016-07-27 21:46:00','YYYY-MM-DD HH24:MI:SS'),100,'Y',TO_TIMESTAMP('2016-07-27 21:46:00','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 27/07/2016 21:46:05 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_WF_Node_Trl (AD_Language,AD_WF_Node_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_WF_Node_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_WF_Node t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_WF_Node_ID=3000026 AND NOT EXISTS (SELECT * FROM AD_WF_Node_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_WF_Node_ID=t.AD_WF_Node_ID)
;

-- 27/07/2016 21:46:40 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_WF_NodeNext (EntityType,IsStdUserWorkflow,AD_WF_NodeNext_ID,AD_WF_Node_ID,SeqNo,AD_WF_Next_ID,Created,UpdatedBy,CreatedBy,AD_Org_ID,IsActive,Updated,AD_Client_ID) VALUES ('LAR','N',3000024,3000026,10,3000025,TO_TIMESTAMP('2016-07-27 21:46:39','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',TO_TIMESTAMP('2016-07-27 21:46:39','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 27/07/2016 21:46:49 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Workflow SET IsValid='Y', AD_WF_Node_ID=3000026,Updated=TO_TIMESTAMP('2016-07-27 21:46:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Workflow_ID=3000003
;

-- 27/07/2016 21:47:29 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Process SET AD_Workflow_ID=3000003,Updated=TO_TIMESTAMP('2016-07-27 21:47:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000165
;

-- 27/07/2016 21:48:10 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET AD_Process_ID=3000165,Updated=TO_TIMESTAMP('2016-07-27 21:48:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001826
;

-- 27/07/2016 21:49:31 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2016-07-27 21:49:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002747
;

-- 31/07/2016 23:57:44 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@Transferencia@=Y',Updated=TO_TIMESTAMP('2016-07-31 23:57:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002740
;

-- 31/07/2016 23:59:19 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@Transferencia@=N',Updated=TO_TIMESTAMP('2016-07-31 23:59:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002750
;

-- 01/08/2016 15:32:07 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001828,3000081,'LAR',0,'Y','N','N','The Processed checkbox indicates that a document has been processed.','N',1,'N',20,'N',1047,'N','Y','N','The document has been processed','Processed','Processed',100,TO_TIMESTAMP('2016-08-01 15:32:06','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-08-01 15:32:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 01/08/2016 15:32:07 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001828 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 01/08/2016 15:32:37 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002753,1,'Y','N','N',3001828,'N','Y',3000127,'N','The Processed checkbox indicates that a document has been processed.','LAR','The document has been processed','Processed',100,0,TO_TIMESTAMP('2016-08-01 15:32:37','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-08-01 15:32:37','YYYY-MM-DD HH24:MI:SS'))
;

-- 01/08/2016 15:32:37 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002753 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 01/08/2016 15:36:18 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002753
;

-- 01/08/2016 17:50:29 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO C_DocType (GL_Category_ID,GenerateWithholding,IsElectronic,IsFiscal,IsFiscaldocument,C_DocType_ID,IsDefault,IsDocNoControlled,DocBaseType,IsSOTrx,DocumentCopies,HasCharges,HasProforma,IsCreateCounter,IsSplitWhenDifference,IsDefaultCounterDoc,IsInTransit,IsPickQAConfirm,IsIndexed,IsShipConfirm,IsOverwriteSeqOnComplete,IsOverwriteDateOnComplete,IsPrepareSplitDocument,PrintName,Name,Updated,IsChargeOrProductMandatory,CreatedBy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID) VALUES (1000007,'N','N','N','N',3000159,'N','Y','APP','N',1,'N','N','Y','N','N','N','N','N','N','N','N','Y','Retiro de Caja','Retiro de Caja',TO_TIMESTAMP('2016-08-01 17:50:29','YYYY-MM-DD HH24:MI:SS'),'N',100,100,0,TO_TIMESTAMP('2016-08-01 17:50:29','YYYY-MM-DD HH24:MI:SS'),'Y',1000000)
;

-- 01/08/2016 17:50:29 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO C_DocType_Trl (AD_Language,C_DocType_ID, DocumentNote,PrintName,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.C_DocType_ID, t.DocumentNote,t.PrintName,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, C_DocType t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.C_DocType_ID=3000159 AND NOT EXISTS (SELECT * FROM C_DocType_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.C_DocType_ID=t.C_DocType_ID)
;

-- 01/08/2016 17:50:29 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Document_Action_Access (AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,C_DocType_ID , AD_Ref_List_ID, AD_Role_ID) (SELECT 1000000,0,'Y', CURRENT_TIMESTAMP,100, CURRENT_TIMESTAMP,100, doctype.C_DocType_ID, "action".AD_Ref_List_ID, rol.AD_Role_ID FROM AD_Client client INNER JOIN C_DocType doctype ON (doctype.AD_Client_ID=client.AD_Client_ID) INNER JOIN AD_Ref_List "action" ON ("action".AD_Reference_ID=135) INNER JOIN AD_Role rol ON (rol.AD_Client_ID=client.AD_Client_ID) WHERE client.AD_Client_ID=1000000 AND doctype.C_DocType_ID=3000159 AND rol.IsManual='N')
;

-- 01/08/2016 18:42:30 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001829,3000081,'LAR',0,'Y','N','N','The Document Type determines document sequence and processing rules','N',10,'N',19,'N',196,'N','Y','N','Document type or rules','Document Type','C_DocType_ID',100,TO_TIMESTAMP('2016-08-01 18:42:29','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-08-01 18:42:29','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 01/08/2016 18:42:30 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001829 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 01/08/2016 18:44:20 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET DefaultValue='3000159', IsUpdateable='N',Updated=TO_TIMESTAMP('2016-08-01 18:44:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001829
;

-- 01/08/2016 18:44:42 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002754,10,'Y','N','N',3001829,'N','Y',3000127,'N','The Document Type determines document sequence and processing rules','LAR','Document type or rules','Document Type',100,0,TO_TIMESTAMP('2016-08-01 18:44:42','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-08-01 18:44:42','YYYY-MM-DD HH24:MI:SS'))
;

-- 01/08/2016 18:44:42 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002754 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 01/08/2016 18:45:13 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2016-08-01 18:45:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002754
;

-- 01/08/2016 18:47:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3002754
;

-- 01/08/2016 18:47:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3002743
;

-- 01/08/2016 18:47:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3002744
;

-- 01/08/2016 18:47:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3002748
;

-- 01/08/2016 18:47:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3002750
;

-- 01/08/2016 18:47:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3002752
;

-- 01/08/2016 18:47:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3002747
;

-- 01/08/2016 18:47:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3002746
;

-- 01/08/2016 18:47:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3002739
;

-- 01/08/2016 18:47:21 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-08-01 18:47:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002743
;

-- 01/08/2016 18:49:20 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Tab SET IsSingleRow='Y',Updated=TO_TIMESTAMP('2016-08-01 18:49:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000127
;

-- 02/08/2016 20:56:38 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000359,'pago_id','LAR','pago_id','pago_id',0,TO_TIMESTAMP('2016-08-02 20:56:28','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-08-02 20:56:28','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 02/08/2016 20:56:39 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000359 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 02/08/2016 20:56:39 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001831,3000081,'LAR',0,'N','N','N','N',10,'N',19,'N',3000359,'N','Y','N','pago_id','pago_id',100,TO_TIMESTAMP('2016-08-02 20:56:28','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-08-02 20:56:28','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2016 20:56:39 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001831 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/08/2016 20:56:39 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000360,'cobro_id','LAR','cobro_id','cobro_id',0,TO_TIMESTAMP('2016-08-02 20:56:39','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-08-02 20:56:39','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 02/08/2016 20:56:39 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000360 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 02/08/2016 20:56:39 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001832,3000081,'LAR',0,'N','N','N','N',10,'N',19,'N',3000360,'N','Y','N','cobro_id','cobro_id',100,TO_TIMESTAMP('2016-08-02 20:56:39','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-08-02 20:56:39','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2016 20:56:39 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001832 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/08/2016 20:57:56 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET Name='Cobro Caja Destino', ColumnName='Cobro_ID',Updated=TO_TIMESTAMP('2016-08-02 20:57:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001832
;

-- 02/08/2016 20:57:56 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001832
;

-- 02/08/2016 20:57:56 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET Name='Cobro Caja Destino', Description=NULL, Help=NULL WHERE AD_Column_ID=3001832 AND IsCentrallyMaintained='Y'
;

-- 02/08/2016 20:58:02 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column_Trl SET Name='Cobro Caja Destino',Updated=TO_TIMESTAMP('2016-08-02 20:58:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001832 AND AD_Language='es_AR'
;

-- 02/08/2016 20:58:31 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element SET ColumnName='Cobro_ID', Name='Cobro Caja Destino', PrintName='Cobro Caja Destino',Updated=TO_TIMESTAMP('2016-08-02 20:58:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000360
;

-- 02/08/2016 20:58:31 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000360
;

-- 02/08/2016 20:58:31 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET ColumnName='Cobro_ID', Name='Cobro Caja Destino', Description=NULL, Help=NULL WHERE AD_Element_ID=3000360
;

-- 02/08/2016 20:58:31 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='Cobro_ID', Name='Cobro Caja Destino', Description=NULL, Help=NULL, AD_Element_ID=3000360 WHERE UPPER(ColumnName)='COBRO_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 02/08/2016 20:58:32 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='Cobro_ID', Name='Cobro Caja Destino', Description=NULL, Help=NULL WHERE AD_Element_ID=3000360 AND IsCentrallyMaintained='Y'
;

-- 02/08/2016 20:58:32 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET Name='Cobro Caja Destino', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000360) AND IsCentrallyMaintained='Y'
;

-- 02/08/2016 20:58:32 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_PrintFormatItem SET PrintName='Cobro Caja Destino', Name='Cobro Caja Destino' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000360)
;

-- 02/08/2016 20:58:38 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Cobro Caja Destino',PrintName='Cobro Caja Destino',Updated=TO_TIMESTAMP('2016-08-02 20:58:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000360 AND AD_Language='es_AR'
;

-- 02/08/2016 21:00:12 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET AD_Reference_Value_ID=343, AD_Reference_ID=18,Updated=TO_TIMESTAMP('2016-08-02 21:00:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001832
;

-- 02/08/2016 21:01:07 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET AD_Reference_Value_ID=343, AD_Reference_ID=18, Name='Pago Caja Origen', ColumnName='Pago_ID',Updated=TO_TIMESTAMP('2016-08-02 21:01:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001831
;

-- 02/08/2016 21:01:07 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001831
;

-- 02/08/2016 21:01:07 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET Name='Pago Caja Origen', Description=NULL, Help=NULL WHERE AD_Column_ID=3001831 AND IsCentrallyMaintained='Y'
;

-- 02/08/2016 21:01:17 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column_Trl SET Name='Pago Caja Origen',Updated=TO_TIMESTAMP('2016-08-02 21:01:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001831 AND AD_Language='es_AR'
;

-- 02/08/2016 21:01:38 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element SET ColumnName='Pago_ID', Name='Pago Caja Origen', PrintName='Pago Caja Origen',Updated=TO_TIMESTAMP('2016-08-02 21:01:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000359
;

-- 02/08/2016 21:01:38 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000359
;

-- 02/08/2016 21:01:38 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET ColumnName='Pago_ID', Name='Pago Caja Origen', Description=NULL, Help=NULL WHERE AD_Element_ID=3000359
;

-- 02/08/2016 21:01:38 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='Pago_ID', Name='Pago Caja Origen', Description=NULL, Help=NULL, AD_Element_ID=3000359 WHERE UPPER(ColumnName)='PAGO_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 02/08/2016 21:01:38 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='Pago_ID', Name='Pago Caja Origen', Description=NULL, Help=NULL WHERE AD_Element_ID=3000359 AND IsCentrallyMaintained='Y'
;

-- 02/08/2016 21:01:38 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET Name='Pago Caja Origen', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000359) AND IsCentrallyMaintained='Y'
;

-- 02/08/2016 21:01:38 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_PrintFormatItem SET PrintName='Pago Caja Origen', Name='Pago Caja Origen' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000359)
;

-- 02/08/2016 21:01:44 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Pago Caja Origen',PrintName='Pago Caja Origen',Updated=TO_TIMESTAMP('2016-08-02 21:01:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000359 AND AD_Language='es_AR'
;

-- 02/08/2016 21:03:18 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002756,10,'Y','N','N',3001832,'N','Y',3000127,'N','LAR','Cobro Caja Destino',100,0,TO_TIMESTAMP('2016-08-02 21:03:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-08-02 21:03:17','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/08/2016 21:03:18 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002756 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2016 21:03:18 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002757,10,'Y','N','N',3001831,'N','Y',3000127,'N','LAR','Pago Caja Origen',100,0,TO_TIMESTAMP('2016-08-02 21:03:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-08-02 21:03:18','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/08/2016 21:03:18 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002757 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2016 21:04:32 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-08-02 21:04:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002756
;

-- 02/08/2016 21:16:07 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@Cobro_ID@!0',Updated=TO_TIMESTAMP('2016-08-02 21:16:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002756
;

-- 02/08/2016 21:16:18 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@Pago_ID@!0',Updated=TO_TIMESTAMP('2016-08-02 21:16:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002757
;

-- 02/08/2016 21:23:34 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3002757
;

-- 02/08/2016 21:23:34 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3002756
;

ALTER TABLE LAR_RetiroCaja ADD COLUMN TenderType character(1) NOT NULL;
ALTER TABLE LAR_RetiroCaja ADD COLUMN SearchPayments character(1);

ALTER TABLE LAR_RetiroCaja ADD COLUMN RoutingNo character varying(20);
ALTER TABLE LAR_RetiroCaja ADD COLUMN AccountNo character varying(20);
ALTER TABLE LAR_RetiroCaja ADD COLUMN CheckNo character varying(20);
ALTER TABLE LAR_RetiroCaja ADD COLUMN A_Name character varying(60);

-- 12/08/2016 18:19:48 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001841,3000081,'LAR',0,'Y','N','N','The Tender Type indicates the method of payment (ACH or Direct Deposit, Credit Card, Check, Direct Debit)','N',1,'N',20,'N',1441,'N','Y','N','Method of Payment','Tender type','TenderType',100,TO_TIMESTAMP('2016-08-12 18:19:47','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-08-12 18:19:47','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 12/08/2016 18:19:48 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001841 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 12/08/2016 18:19:48 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001842,3000081,'LAR',0,'N','N','N','N',1,'N',20,'N',3000070,'N','Y','N','SearchPayments','SearchPayments',100,TO_TIMESTAMP('2016-08-12 18:19:48','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-08-12 18:19:48','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 12/08/2016 18:19:48 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001842 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 12/08/2016 18:19:48 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001843,3000081,'LAR',0,'N','N','N','The Bank Routing Number (ABA Number) identifies a legal Bank.  It is used in routing checks and electronic transactions.','N',20,'N',10,'N',964,'N','Y','N','Bank Routing Number','Routing No','RoutingNo',100,TO_TIMESTAMP('2016-08-12 18:19:48','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-08-12 18:19:48','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 12/08/2016 18:19:48 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001843 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 12/08/2016 18:19:48 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001844,3000081,'LAR',0,'N','N','N','The Account Number indicates the Number assigned to this bank account. ','N',20,'N',10,'N',840,'N','Y','N','Account Number','Account No','AccountNo',100,TO_TIMESTAMP('2016-08-12 18:19:48','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-08-12 18:19:48','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 12/08/2016 18:19:48 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001844 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 12/08/2016 18:19:49 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001845,3000081,'LAR',0,'N','N','N','The Check Number indicates the number on the check.','N',20,'N',10,'N',1389,'N','Y','N','Check Number','Check No','CheckNo',100,TO_TIMESTAMP('2016-08-12 18:19:48','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-08-12 18:19:48','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 12/08/2016 18:19:49 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001845 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 12/08/2016 18:19:49 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001846,3000081,'LAR',0,'N','N','N','The Name of the Credit Card or Account holder.','N',60,'Y',10,'N',1354,'N','Y','N','Name on Credit Card or Account holder','Account Name','A_Name',100,TO_TIMESTAMP('2016-08-12 18:19:49','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-08-12 18:19:49','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 12/08/2016 18:19:49 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001846 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 12/08/2016 18:20:45 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002783,60,'Y','N','N',3001846,'N','Y',3000127,'N','The Name of the Credit Card or Account holder.','LAR','Name on Credit Card or Account holder','Account Name',100,0,TO_TIMESTAMP('2016-08-12 18:20:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-08-12 18:20:45','YYYY-MM-DD HH24:MI:SS'))
;

-- 12/08/2016 18:20:45 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002783 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 12/08/2016 18:20:45 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002784,20,'Y','N','N',3001844,'N','Y',3000127,'N','The Account Number indicates the Number assigned to this bank account. ','LAR','Account Number','Account No',100,0,TO_TIMESTAMP('2016-08-12 18:20:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-08-12 18:20:45','YYYY-MM-DD HH24:MI:SS'))
;

-- 12/08/2016 18:20:45 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002784 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 12/08/2016 18:20:45 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002785,20,'Y','N','N',3001845,'N','Y',3000127,'N','The Check Number indicates the number on the check.','LAR','Check Number','Check No',100,0,TO_TIMESTAMP('2016-08-12 18:20:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-08-12 18:20:45','YYYY-MM-DD HH24:MI:SS'))
;

-- 12/08/2016 18:20:45 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002785 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 12/08/2016 18:20:45 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002786,20,'Y','N','N',3001843,'N','Y',3000127,'N','The Bank Routing Number (ABA Number) identifies a legal Bank.  It is used in routing checks and electronic transactions.','LAR','Bank Routing Number','Routing No',100,0,TO_TIMESTAMP('2016-08-12 18:20:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-08-12 18:20:45','YYYY-MM-DD HH24:MI:SS'))
;

-- 12/08/2016 18:20:45 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002786 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 12/08/2016 18:20:46 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002787,1,'Y','N','N',3001842,'N','Y',3000127,'N','LAR','SearchPayments',100,0,TO_TIMESTAMP('2016-08-12 18:20:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-08-12 18:20:45','YYYY-MM-DD HH24:MI:SS'))
;

-- 12/08/2016 18:20:46 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002787 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 12/08/2016 18:20:46 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002788,1,'Y','N','N',3001841,'N','Y',3000127,'N','The Tender Type indicates the method of payment (ACH or Direct Deposit, Credit Card, Check, Direct Debit)','LAR','Method of Payment','Tender type',100,0,TO_TIMESTAMP('2016-08-12 18:20:46','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-08-12 18:20:46','YYYY-MM-DD HH24:MI:SS'))
;

-- 12/08/2016 18:20:46 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002788 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 12/08/2016 18:22:31 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3002788
;

-- 12/08/2016 18:22:31 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3002787
;

-- 12/08/2016 18:22:31 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3002786
;

-- 12/08/2016 18:22:31 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3002784
;

-- 12/08/2016 18:22:31 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3002785
;

-- 12/08/2016 18:22:31 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3002783
;

-- 12/08/2016 18:22:31 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3002750
;

-- 12/08/2016 18:22:31 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3002752
;

-- 12/08/2016 18:22:31 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3002747
;

-- 12/08/2016 18:22:31 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3002746
;

-- 12/08/2016 18:22:31 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3002739
;

-- 12/08/2016 18:22:31 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3002757
;

-- 12/08/2016 18:22:31 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3002756
;

-- 12/08/2016 18:22:58 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-08-12 18:22:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002787
;

-- 12/08/2016 18:23:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-08-12 18:23:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002784
;

-- 12/08/2016 18:23:23 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-08-12 18:23:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002783
;

-- 12/08/2016 18:33:13 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('AD_Ref_List.Value <> ''N'' AND AD_Ref_List.Value <> ''O'' AND AD_Ref_List.Value <> ''Y'' AND AD_Ref_List.Value <> ''A'' AND AD_Ref_List.Value <> ''C'' AND AD_Ref_List.Value <> ''D'' AND AD_Ref_List.Value <> ''K'' AND AD_Ref_List.Value <> ''T''','S',3000039,'LAR','TenderType_RetiroCaja',100,100,TO_TIMESTAMP('2016-08-12 18:33:13','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_TIMESTAMP('2016-08-12 18:33:13','YYYY-MM-DD HH24:MI:SS'))
;

-- 12/08/2016 18:33:26 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET AD_Reference_Value_ID=214, AD_Reference_ID=17, AD_Val_Rule_ID=3000039,Updated=TO_TIMESTAMP('2016-08-12 18:33:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001841
;

-- 12/08/2016 18:38:22 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=Z',Updated=TO_TIMESTAMP('2016-08-12 18:38:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002787
;

-- 12/08/2016 18:38:24 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=Z',Updated=TO_TIMESTAMP('2016-08-12 18:38:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002786
;

-- 12/08/2016 18:38:25 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=Z',Updated=TO_TIMESTAMP('2016-08-12 18:38:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002784
;

-- 12/08/2016 18:38:31 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=Z',Updated=TO_TIMESTAMP('2016-08-12 18:38:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002785
;

-- 12/08/2016 18:39:30 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=Z',Updated=TO_TIMESTAMP('2016-08-12 18:39:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002783
;

-- 12/08/2016 18:41:07 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET AD_Reference_ID=28,Updated=TO_TIMESTAMP('2016-08-12 18:41:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001842
;

-- 12/08/2016 18:48:27 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002757
;

-- 12/08/2016 18:48:27 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3002756
;

-- 12/08/2016 20:46:26 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Process (AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Classname,CopyFromProcess,Value,Name,AD_Org_ID,AD_Client_ID,UpdatedBy,Created,CreatedBy,Updated,IsActive) VALUES (3000171,'N','N','3','N','N','S','LAR',0,0,'ar.com.ergio.process.LAR_ChequeEnCarteraPorCaja','N','10000001','Buscar Cheques por Caja',0,0,100,TO_TIMESTAMP('2016-08-12 20:46:25','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2016-08-12 20:46:25','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 12/08/2016 20:46:26 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000171 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 12/08/2016 20:47:50 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000285,0,3000171,100,'N',13,10,'N','LAR','LAR_RetiroCaja_ID','LAR_RetiroCaja_ID','Y',0,100,TO_TIMESTAMP('2016-08-12 20:47:50','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-08-12 20:47:50','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 12/08/2016 20:47:50 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000285 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 12/08/2016 20:53:01 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET AD_Process_ID=3000171,Updated=TO_TIMESTAMP('2016-08-12 20:53:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001842
;

-- 12/08/2016 20:57:09 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Process_Para SET IsMandatory='Y', DefaultValue='@LAR_RetiroCaja_ID@', AD_Element_ID=3000352,Updated=TO_TIMESTAMP('2016-08-12 20:57:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000285
;

-- 16/08/2016 17:00:45 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Val_Rule SET Code='AD_Ref_List.Value <> ''N'' AND AD_Ref_List.Value <> ''O'' AND AD_Ref_List.Value <> ''Y'' AND AD_Ref_List.Value <> ''A'' AND AD_Ref_List.Value <> ''C'' AND AD_Ref_List.Value <> ''D'' AND AD_Ref_List.Value <> ''Z'' AND AD_Ref_List.Value <> ''T''',Updated=TO_TIMESTAMP('2016-08-16 17:00:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000039
;

-- 16/08/2016 17:01:17 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET IsUpdateable='N',Updated=TO_TIMESTAMP('2016-08-16 17:01:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001831
;

-- 16/08/2016 17:01:37 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET IsUpdateable='N',Updated=TO_TIMESTAMP('2016-08-16 17:01:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001832
;

-- 16/08/2016 17:04:26 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=K',Updated=TO_TIMESTAMP('2016-08-16 17:04:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002787
;

-- 16/08/2016 17:04:31 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=K',Updated=TO_TIMESTAMP('2016-08-16 17:04:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002786
;

-- 16/08/2016 17:04:34 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=K',Updated=TO_TIMESTAMP('2016-08-16 17:04:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002784
;

-- 16/08/2016 17:04:37 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=K',Updated=TO_TIMESTAMP('2016-08-16 17:04:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002785
;

-- 16/08/2016 17:04:40 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=K',Updated=TO_TIMESTAMP('2016-08-16 17:04:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002783
;

-- 16/08/2016 19:44:25 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET IsUpdateable='Y',Updated=TO_TIMESTAMP('2016-08-16 19:44:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001832
;

-- 16/08/2016 19:44:48 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET IsUpdateable='Y',Updated=TO_TIMESTAMP('2016-08-16 19:44:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001831
;

-- 16/08/2016 19:45:15 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2016-08-16 19:45:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002756
;

-- 24/08/2016 15:49:07 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3002750
;

-- 24/08/2016 15:49:08 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3002752
;

-- 24/08/2016 15:49:08 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3002754
;

-- 24/08/2016 15:49:08 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3002743
;

-- 24/08/2016 15:49:08 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3002744
;

-- 24/08/2016 15:49:08 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3002748
;

-- 24/08/2016 15:49:08 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3002788
;

-- 24/08/2016 15:49:08 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3002787
;

-- 24/08/2016 15:49:08 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3002786
;

-- 24/08/2016 15:49:08 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3002784
;

-- 24/08/2016 15:49:08 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3002785
;

-- 24/08/2016 15:49:08 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3002783
;

-- 24/08/2016 16:06:38 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET AD_Val_Rule_ID=3000038,Updated=TO_TIMESTAMP('2016-08-24 16:06:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=5046
;

-- 24/08/2016 16:12:33 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Val_Rule SET Code='(C_BankAccount.IsDrawer=''Y'' AND C_BankAccount.AD_Org_ID=@AD_Org_ID@)',Updated=TO_TIMESTAMP('2016-08-24 16:12:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000004
;

ALTER TABLE LAR_RetiroCaja DROP COLUMN Pago_ID;
ALTER TABLE LAR_RetiroCaja DROP COLUMN Cobro_ID;
ALTER TABLE LAR_RetiroCaja DROP COLUMN TenderType;
ALTER TABLE LAR_RetiroCaja DROP COLUMN RoutingNo;
ALTER TABLE LAR_RetiroCaja DROP COLUMN AccountNo;
ALTER TABLE LAR_RetiroCaja DROP COLUMN CheckNo;
ALTER TABLE LAR_RetiroCaja DROP COLUMN A_Name;

CREATE TABLE LAR_RetiroCajaLine
(
  LAR_RetiroCajaLine_ID numeric(10,0) NOT NULL,
  AD_Client_ID numeric(10,0) NOT NULL,
  AD_Org_ID numeric(10,0) NOT NULL,
  IsActive character(1) NOT NULL DEFAULT 'Y'::bpchar,
  Created timestamp without time zone NOT NULL DEFAULT now(),
  CreatedBy numeric(10,0) NOT NULL,
  Updated timestamp without time zone NOT NULL DEFAULT now(),
  UpdatedBy numeric(10,0) NOT NULL,
  LAR_RetiroCaja_ID numeric(10,0) NOT NULL,
  Pago_ID numeric(10,0),
  Cobro_ID numeric(10,0),
  TenderType character(1) NOT NULL,
  RoutingNo character varying(20),
  AccountNo character varying(20),
  CheckNo character varying(20),
  A_Name character varying(60),
  Monto numeric NOT NULL DEFAULT 0,
  CONSTRAINT lar_retirocajaline_key PRIMARY KEY (LAR_RetiroCajaLine_ID),
  CONSTRAINT cobroid_laretirocaja FOREIGN KEY (cobro_id)
      REFERENCES c_payment (c_payment_id) MATCH SIMPLE,
  CONSTRAINT pagoid_laretirocaja FOREIGN KEY (pago_id)
      REFERENCES c_payment (c_payment_id) MATCH SIMPLE,
  CONSTRAINT larretirocjaline_larretirocaja FOREIGN KEY (LAR_RetiroCaja_ID)
      REFERENCES LAR_RetiroCaja (LAR_RetiroCaja_ID) MATCH SIMPLE
);

-- 05/09/2016 16:19:39 ART
-- BUG #334: Cierre de Cajas.
DELETE FROM AD_Field_Trl WHERE AD_Field_ID=3002756
;

-- 05/09/2016 16:19:39 ART
-- BUG #334: Cierre de Cajas.
DELETE FROM AD_Field WHERE AD_Field_ID=3002756
;

-- 05/09/2016 16:19:47 ART
-- BUG #334: Cierre de Cajas.
DELETE FROM AD_Field_Trl WHERE AD_Field_ID=3002783
;

-- 05/09/2016 16:19:47 ART
-- BUG #334: Cierre de Cajas.
DELETE FROM AD_Field WHERE AD_Field_ID=3002783
;

-- 05/09/2016 16:19:50 ART
-- BUG #334: Cierre de Cajas.
DELETE FROM AD_Field_Trl WHERE AD_Field_ID=3002785
;

-- 05/09/2016 16:19:50 ART
-- BUG #334: Cierre de Cajas.
DELETE FROM AD_Field WHERE AD_Field_ID=3002785
;

-- 05/09/2016 16:19:54 ART
-- BUG #334: Cierre de Cajas.
DELETE FROM AD_Field_Trl WHERE AD_Field_ID=3002784
;

-- 05/09/2016 16:19:54 ART
-- BUG #334: Cierre de Cajas.
DELETE FROM AD_Field WHERE AD_Field_ID=3002784
;

-- 05/09/2016 16:19:59 ART
-- BUG #334: Cierre de Cajas.
DELETE FROM AD_Field_Trl WHERE AD_Field_ID=3002786
;

-- 05/09/2016 16:19:59 ART
-- BUG #334: Cierre de Cajas.
DELETE FROM AD_Field WHERE AD_Field_ID=3002786
;

-- 05/09/2016 16:20:02 ART
-- BUG #334: Cierre de Cajas.
DELETE FROM AD_Field_Trl WHERE AD_Field_ID=3002788
;

-- 05/09/2016 16:20:02 ART
-- BUG #334: Cierre de Cajas.
DELETE FROM AD_Field WHERE AD_Field_ID=3002788
;

-- 05/09/2016 16:20:56 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic=NULL,Updated=TO_TIMESTAMP('2016-09-05 16:20:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002787
;

-- 05/09/2016 16:21:42 ART
-- BUG #334: Cierre de Cajas.
DELETE FROM AD_Column_Trl WHERE AD_Column_ID=3001841
;

-- 05/09/2016 16:21:42 ART
-- BUG #334: Cierre de Cajas.
DELETE FROM AD_Column WHERE AD_Column_ID=3001841
;

-- 05/09/2016 16:21:56 ART
-- BUG #334: Cierre de Cajas.
DELETE FROM AD_Column_Trl WHERE AD_Column_ID=3001843
;

-- 05/09/2016 16:21:56 ART
-- BUG #334: Cierre de Cajas.
DELETE FROM AD_Column WHERE AD_Column_ID=3001843
;

-- 05/09/2016 16:23:01 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3002787
;

-- 05/09/2016 16:23:01 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3002747
;

-- 05/09/2016 16:23:01 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3002746
;

-- 05/09/2016 16:23:01 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3002739
;

-- 05/09/2016 16:23:01 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3002757
;

-- 05/09/2016 16:23:07 ART
-- BUG #334: Cierre de Cajas.
DELETE FROM AD_Field_Trl WHERE AD_Field_ID=3002757
;

-- 05/09/2016 16:23:07 ART
-- BUG #334: Cierre de Cajas.
DELETE FROM AD_Field WHERE AD_Field_ID=3002757
;

-- 05/09/2016 16:23:27 ART
-- BUG #334: Cierre de Cajas.
DELETE FROM AD_Column_Trl WHERE AD_Column_ID=3001831
;

-- 05/09/2016 16:23:27 ART
-- BUG #334: Cierre de Cajas.
DELETE FROM AD_Column WHERE AD_Column_ID=3001831
;

-- 05/09/2016 16:23:45 ART
-- BUG #334: Cierre de Cajas.
DELETE FROM AD_Column_Trl WHERE AD_Column_ID=3001832
;

-- 05/09/2016 16:23:45 ART
-- BUG #334: Cierre de Cajas.
DELETE FROM AD_Column WHERE AD_Column_ID=3001832
;

-- 05/09/2016 16:23:52 ART
-- BUG #334: Cierre de Cajas.
DELETE FROM AD_Column_Trl WHERE AD_Column_ID=3001845
;

-- 05/09/2016 16:23:52 ART
-- BUG #334: Cierre de Cajas.
DELETE FROM AD_Column WHERE AD_Column_ID=3001845
;

-- 05/09/2016 16:23:57 ART
-- BUG #334: Cierre de Cajas.
DELETE FROM AD_Column_Trl WHERE AD_Column_ID=3001846
;

-- 05/09/2016 16:23:57 ART
-- BUG #334: Cierre de Cajas.
DELETE FROM AD_Column WHERE AD_Column_ID=3001846
;

-- 05/09/2016 16:25:42 ART
-- BUG #334: Cierre de Cajas.
DELETE FROM AD_Column_Trl WHERE AD_Column_ID=3001844
;

-- 05/09/2016 16:25:42 ART
-- BUG #334: Cierre de Cajas.
DELETE FROM AD_Column WHERE AD_Column_ID=3001844
;

-- 05/09/2016 16:37:31 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,ImportTable,IsHighVolume,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','3',0,3000082,'N','N','N','N','N','LAR','Y','Y','L','LAR_RetiroCajaLine','LAR_RetiroCajaLine',0,'Y',0,100,TO_TIMESTAMP('2016-09-05 16:37:30','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2016-09-05 16:37:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/09/2016 16:37:31 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000082 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- 05/09/2016 16:37:31 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,UpdatedBy,AD_Client_ID,Updated,Created,CreatedBy,IsActive) VALUES (1,'N',200000,'Y',1000000,1000000,'N','Y',3000306,'Table LAR_RetiroCajaLine','LAR_RetiroCajaLine',0,100,0,TO_TIMESTAMP('2016-09-05 16:37:31','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-09-05 16:37:31','YYYY-MM-DD HH24:MI:SS'),100,'Y')
;

-- 05/09/2016 16:38:13 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000366,'LAR_RetiroCajaLine_ID','LAR','LAR_RetiroCajaLine','LAR_RetiroCajaLine',0,TO_TIMESTAMP('2016-09-05 16:38:12','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-09-05 16:38:12','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 05/09/2016 16:38:13 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000366 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 05/09/2016 16:38:13 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001847,3000082,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3000366,'N','N','N','LAR_RetiroCajaLine','LAR_RetiroCajaLine_ID',100,TO_TIMESTAMP('2016-09-05 16:38:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-09-05 16:38:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/09/2016 16:38:13 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001847 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 05/09/2016 16:38:13 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001848,3000082,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,TO_TIMESTAMP('2016-09-05 16:38:13','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-09-05 16:38:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/09/2016 16:38:13 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001848 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 05/09/2016 16:38:13 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001849,3000082,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',100,TO_TIMESTAMP('2016-09-05 16:38:13','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-09-05 16:38:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/09/2016 16:38:13 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001849 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 05/09/2016 16:38:13 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001850,3000082,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,TO_TIMESTAMP('2016-09-05 16:38:13','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-09-05 16:38:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/09/2016 16:38:13 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001850 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 05/09/2016 16:38:13 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001851,3000082,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,TO_TIMESTAMP('2016-09-05 16:38:13','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-09-05 16:38:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/09/2016 16:38:13 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001851 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 05/09/2016 16:38:14 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001852,3000082,'LAR',0,110,'Y','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,TO_TIMESTAMP('2016-09-05 16:38:13','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-09-05 16:38:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/09/2016 16:38:14 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001852 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 05/09/2016 16:38:14 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001853,3000082,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,TO_TIMESTAMP('2016-09-05 16:38:14','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-09-05 16:38:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/09/2016 16:38:14 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001853 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 05/09/2016 16:38:14 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001854,3000082,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,TO_TIMESTAMP('2016-09-05 16:38:14','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-09-05 16:38:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/09/2016 16:38:14 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001854 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 05/09/2016 16:38:14 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001855,3000082,'LAR',0,'Y','N','N','N',10,'N',19,'N',3000352,'N','Y','N','Retiros de Caja','LAR_RetiroCaja_ID',100,TO_TIMESTAMP('2016-09-05 16:38:14','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-09-05 16:38:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/09/2016 16:38:14 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001855 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 05/09/2016 16:38:14 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001856,3000082,'LAR',0,'N','N','N','N',10,'N',19,'N',3000359,'N','Y','N','Pago Caja Origen','Pago_ID',100,TO_TIMESTAMP('2016-09-05 16:38:14','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-09-05 16:38:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/09/2016 16:38:14 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001856 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 05/09/2016 16:38:14 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001857,3000082,'LAR',0,'N','N','N','N',10,'N',19,'N',3000360,'N','Y','N','Cobro Caja Destino','Cobro_ID',100,TO_TIMESTAMP('2016-09-05 16:38:14','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-09-05 16:38:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/09/2016 16:38:14 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001857 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 05/09/2016 16:38:15 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001858,3000082,'LAR',0,'Y','N','N','The Tender Type indicates the method of payment (ACH or Direct Deposit, Credit Card, Check, Direct Debit)','N',1,'N',20,'N',1441,'N','Y','N','Method of Payment','Tender type','TenderType',100,TO_TIMESTAMP('2016-09-05 16:38:14','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-09-05 16:38:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/09/2016 16:38:15 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001858 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 05/09/2016 16:38:15 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001859,3000082,'LAR',0,'N','N','N','The Bank Routing Number (ABA Number) identifies a legal Bank.  It is used in routing checks and electronic transactions.','N',20,'N',10,'N',964,'N','Y','N','Bank Routing Number','Routing No','RoutingNo',100,TO_TIMESTAMP('2016-09-05 16:38:15','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-09-05 16:38:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/09/2016 16:38:15 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001859 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 05/09/2016 16:38:15 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001860,3000082,'LAR',0,'N','N','N','The Account Number indicates the Number assigned to this bank account. ','N',20,'N',10,'N',840,'N','Y','N','Account Number','Account No','AccountNo',100,TO_TIMESTAMP('2016-09-05 16:38:15','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-09-05 16:38:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/09/2016 16:38:15 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001860 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 05/09/2016 16:38:15 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001861,3000082,'LAR',0,'N','N','N','The Check Number indicates the number on the check.','N',20,'N',10,'N',1389,'N','Y','N','Check Number','Check No','CheckNo',100,TO_TIMESTAMP('2016-09-05 16:38:15','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-09-05 16:38:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/09/2016 16:38:15 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001861 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 05/09/2016 16:38:15 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001862,3000082,'LAR',0,'N','N','N','The Name of the Credit Card or Account holder.','N',60,'Y',10,'N',1354,'N','Y','N','Name on Credit Card or Account holder','Account Name','A_Name',100,TO_TIMESTAMP('2016-09-05 16:38:15','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-09-05 16:38:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/09/2016 16:38:15 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001862 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 05/09/2016 16:38:15 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001863,3000082,'LAR',0,'Y','N','N','N',131089,'N',22,'N',3000355,'N','Y','N','Monto','Monto',100,TO_TIMESTAMP('2016-09-05 16:38:15','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-09-05 16:38:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/09/2016 16:38:15 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001863 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 05/09/2016 16:42:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('N',3000063,20,'N','N',3000082,3000128,'N','N','N','N',1,'Y','N','LAR','Detalle',0,0,TO_TIMESTAMP('2016-09-05 16:42:54','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2016-09-05 16:42:54','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 05/09/2016 16:42:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000128 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 05/09/2016 16:43:53 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002789,60,'Y','N','N',3001862,'N','Y',3000128,'N','The Name of the Credit Card or Account holder.','LAR','Name on Credit Card or Account holder','Account Name',100,0,TO_TIMESTAMP('2016-09-05 16:43:53','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-09-05 16:43:53','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/09/2016 16:43:53 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002789 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/09/2016 16:43:53 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002790,20,'Y','N','N',3001860,'N','Y',3000128,'N','The Account Number indicates the Number assigned to this bank account. ','LAR','Account Number','Account No',100,0,TO_TIMESTAMP('2016-09-05 16:43:53','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-09-05 16:43:53','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/09/2016 16:43:53 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002790 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/09/2016 16:43:53 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002791,1,'Y','N','N',3001850,'N','Y',3000128,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,TO_TIMESTAMP('2016-09-05 16:43:53','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-09-05 16:43:53','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/09/2016 16:43:53 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002791 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/09/2016 16:43:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002792,20,'Y','N','N',3001861,'N','Y',3000128,'N','The Check Number indicates the number on the check.','LAR','Check Number','Check No',100,0,TO_TIMESTAMP('2016-09-05 16:43:53','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-09-05 16:43:53','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/09/2016 16:43:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002792 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/09/2016 16:43:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002793,10,'Y','N','N',3001848,'N','Y',3000128,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,TO_TIMESTAMP('2016-09-05 16:43:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-09-05 16:43:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/09/2016 16:43:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002793 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/09/2016 16:43:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002794,10,'Y','N','N',3001857,'N','Y',3000128,'N','LAR','Cobro Caja Destino',100,0,TO_TIMESTAMP('2016-09-05 16:43:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-09-05 16:43:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/09/2016 16:43:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002794 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/09/2016 16:43:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002795,10,'N','N','N',3001847,'N','Y',3000128,'N','LAR','LAR_RetiroCajaLine',100,0,TO_TIMESTAMP('2016-09-05 16:43:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-09-05 16:43:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/09/2016 16:43:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002795 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/09/2016 16:43:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002796,131089,'Y','N','N',3001863,'N','Y',3000128,'N','LAR','Monto',100,0,TO_TIMESTAMP('2016-09-05 16:43:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-09-05 16:43:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/09/2016 16:43:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002796 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/09/2016 16:43:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002797,10,'Y','N','N',3001849,'N','Y',3000128,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,TO_TIMESTAMP('2016-09-05 16:43:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-09-05 16:43:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/09/2016 16:43:54 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002797 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/09/2016 16:43:55 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002798,10,'Y','N','N',3001856,'N','Y',3000128,'N','LAR','Pago Caja Origen',100,0,TO_TIMESTAMP('2016-09-05 16:43:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-09-05 16:43:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/09/2016 16:43:55 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002798 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/09/2016 16:43:55 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002799,10,'Y','N','N',3001855,'N','Y',3000128,'N','LAR','Retiros de Caja',100,0,TO_TIMESTAMP('2016-09-05 16:43:55','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-09-05 16:43:55','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/09/2016 16:43:55 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002799 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/09/2016 16:43:55 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002800,20,'Y','N','N',3001859,'N','Y',3000128,'N','The Bank Routing Number (ABA Number) identifies a legal Bank.  It is used in routing checks and electronic transactions.','LAR','Bank Routing Number','Routing No',100,0,TO_TIMESTAMP('2016-09-05 16:43:55','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-09-05 16:43:55','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/09/2016 16:43:55 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002800 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/09/2016 16:43:55 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002801,1,'Y','N','N',3001858,'N','Y',3000128,'N','The Tender Type indicates the method of payment (ACH or Direct Deposit, Credit Card, Check, Direct Debit)','LAR','Method of Payment','Tender type',100,0,TO_TIMESTAMP('2016-09-05 16:43:55','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-09-05 16:43:55','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/09/2016 16:43:55 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002801 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/09/2016 16:46:29 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002791
;

-- 05/09/2016 16:46:29 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002799
;

-- 05/09/2016 16:46:29 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3002793
;

-- 05/09/2016 16:46:29 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3002797
;

-- 05/09/2016 16:46:29 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3002801
;

-- 05/09/2016 16:46:29 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3002796
;

-- 05/09/2016 16:46:29 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3002789
;

-- 05/09/2016 16:46:29 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3002790
;

-- 05/09/2016 16:46:29 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3002792
;

-- 05/09/2016 16:46:29 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3002800
;

-- 05/09/2016 16:46:29 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3002798
;

-- 05/09/2016 16:46:29 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3002794
;

-- 05/09/2016 16:46:55 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-09-05 16:46:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002797
;

-- 05/09/2016 16:47:08 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-09-05 16:47:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002796
;

-- 05/09/2016 16:47:10 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-09-05 16:47:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002790
;

-- 05/09/2016 16:47:11 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-09-05 16:47:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002800
;

-- 05/09/2016 16:47:24 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-09-05 16:47:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002794
;

-- 05/09/2016 16:52:39 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET AD_Reference_Value_ID=214, AD_Reference_ID=17, AD_Val_Rule_ID=3000039,Updated=TO_TIMESTAMP('2016-09-05 16:52:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001858
;

-- 05/09/2016 16:53:20 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Val_Rule SET Code='AD_Ref_List.Value <> ''N'' AND AD_Ref_List.Value <> ''O'' AND AD_Ref_List.Value <> ''Y'' AND AD_Ref_List.Value <> ''A'' AND AD_Ref_List.Value <> ''C'' AND AD_Ref_List.Value <> ''D'' AND AD_Ref_List.Value <> ''K'' AND AD_Ref_List.Value <> ''T''',Updated=TO_TIMESTAMP('2016-09-05 16:53:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000039
;

-- 05/09/2016 16:55:14 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DisplayLength=60,Updated=TO_TIMESTAMP('2016-09-05 16:55:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002796
;

-- 05/09/2016 16:56:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2016-09-05 16:56:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002789
;

-- 05/09/2016 16:56:18 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Tab SET IsSingleRow='Y',Updated=TO_TIMESTAMP('2016-09-05 16:56:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000128
;

-- 05/09/2016 16:57:01 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Table SET AD_Window_ID=3000063,Updated=TO_TIMESTAMP('2016-09-05 16:57:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000082
;

-- 05/09/2016 17:00:48 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2016-09-05 17:00:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002748
;

-- 05/09/2016 17:07:17 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET ReadOnlyLogic='@TenderType@=''Z''',Updated=TO_TIMESTAMP('2016-09-05 17:07:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001863
;

-- 05/09/2016 17:30:22 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET AD_Reference_Value_ID=343, AD_Reference_ID=18,Updated=TO_TIMESTAMP('2016-09-05 17:30:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001856
;

-- 05/09/2016 17:30:45 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET AD_Reference_Value_ID=343, AD_Reference_ID=18,Updated=TO_TIMESTAMP('2016-09-05 17:30:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001857
;

-- 05/09/2016 17:31:09 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET IsIdentifier='Y', IsUpdateable='N', IsAllowCopy='N',Updated=TO_TIMESTAMP('2016-09-05 17:31:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001847
;

-- 05/09/2016 17:32:30 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2016-09-05 17:32:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002798
;

-- 05/09/2016 17:32:36 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2016-09-05 17:32:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002794
;

-- 05/09/2016 17:33:14 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@Cobro_ID@!0',Updated=TO_TIMESTAMP('2016-09-05 17:33:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002794
;

-- 05/09/2016 17:33:35 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@Pago_ID@!0',Updated=TO_TIMESTAMP('2016-09-05 17:33:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002798
;

-- 05/09/2016 23:04:44 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=Z',Updated=TO_TIMESTAMP('2016-09-05 23:04:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002789
;

-- 05/09/2016 23:05:00 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=Z',Updated=TO_TIMESTAMP('2016-09-05 23:05:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002790
;

-- 05/09/2016 23:05:07 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=Z',Updated=TO_TIMESTAMP('2016-09-05 23:05:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002792
;

-- 05/09/2016 23:05:13 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=Z',Updated=TO_TIMESTAMP('2016-09-05 23:05:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002800
;

-- 05/09/2016 23:10:14 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET ColumnSQL='(SELECT SUM(Monto) FROM LAR_RetiroCajaLine WHERE LAR_RetiroCaja_ID=@LAR_RetiroCaja_ID@)', IsMandatory='N', IsUpdateable='N', IsAllowCopy='N',Updated=TO_TIMESTAMP('2016-09-05 23:10:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001821
;

-- 05/09/2016 23:14:35 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET ColumnSQL='(SELECT SUM(Monto) FROM LAR_RetiroCajaLine l WHERE l.LAR_RetiroCaja_ID=LAR_RetiroCaja.LAR_RetiroCaja_ID)',Updated=TO_TIMESTAMP('2016-09-05 23:14:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001821
;

-- 06/09/2016 16:01:09 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Tab SET AD_Column_ID=3001855,Updated=TO_TIMESTAMP('2016-09-06 16:01:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000128
;

-- 06/09/2016 16:13:13 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,AD_Client_ID,AD_Org_ID,Created,Updated,CreatedBy,UpdatedBy,IsActive) VALUES (3000016,'LAR','C','0','Ingresar ID del SdN destinado a movimientos de caja.','LAR_SdN_MovimientosDeCaja',1000000,0,TO_TIMESTAMP('2016-09-06 16:13:12','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-09-06 16:13:12','YYYY-MM-DD HH24:MI:SS'),100,100,'Y')
;

ALTER TABLE LAR_RetiroCaja ADD COLUMN Deposito character(1) NOT NULL DEFAULT 'N'::bpchar;
ALTER TABLE LAR_RetiroCaja ADD CONSTRAINT lar_retirocaja_deposito_check CHECK (Deposito = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]));
ALTER TABLE LAR_RetiroCaja ADD COLUMN Fecha timestamp without time zone;
ALTER TABLE LAR_RetiroCaja ADD COLUMN CuentaDestino_ID numeric(10,0);
ALTER TABLE LAR_RetiroCaja ADD CONSTRAINT cuentadestinoid_larretirocaja FOREIGN KEY (CuentaDestino_ID)
      REFERENCES C_BankAccount (C_BankAccount_ID) MATCH SIMPLE;

-- 12/09/2016 15:18:12 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000369,'deposito','LAR','deposito','deposito',0,TO_TIMESTAMP('2016-09-12 15:18:10','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-09-12 15:18:10','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 12/09/2016 15:18:12 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000369 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 12/09/2016 15:18:12 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001867,3000081,'LAR',0,'Y','N','N','N',1,'N',20,'N',3000369,'N','Y','N','deposito','deposito',100,TO_TIMESTAMP('2016-09-12 15:18:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-09-12 15:18:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 12/09/2016 15:18:12 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001867 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 12/09/2016 15:18:12 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000370,'fecha','LAR','fecha','fecha',0,TO_TIMESTAMP('2016-09-12 15:18:12','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-09-12 15:18:12','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 12/09/2016 15:18:12 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000370 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 12/09/2016 15:18:12 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001868,3000081,'LAR',0,'N','N','N','N',29,'N',16,'N',3000370,'N','Y','N','fecha','fecha',100,TO_TIMESTAMP('2016-09-12 15:18:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-09-12 15:18:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 12/09/2016 15:18:12 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001868 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 12/09/2016 15:20:22 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET DefaultValue='@Date@', AD_Reference_ID=15, Name='Fecha', ColumnName='Fecha',Updated=TO_TIMESTAMP('2016-09-12 15:20:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001868
;

-- 12/09/2016 15:20:22 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001868
;

-- 12/09/2016 15:20:22 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET Name='Fecha', Description=NULL, Help=NULL WHERE AD_Column_ID=3001868 AND IsCentrallyMaintained='Y'
;

-- 12/09/2016 15:20:30 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column_Trl SET Name='Fecha',Updated=TO_TIMESTAMP('2016-09-12 15:20:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001868 AND AD_Language='es_AR'
;

-- 12/09/2016 15:20:48 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element SET ColumnName='Fecha', Name='Fecha', PrintName='Fecha',Updated=TO_TIMESTAMP('2016-09-12 15:20:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000370
;

-- 12/09/2016 15:20:48 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000370
;

-- 12/09/2016 15:20:48 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET ColumnName='Fecha', Name='Fecha', Description=NULL, Help=NULL WHERE AD_Element_ID=3000370
;

-- 12/09/2016 15:20:48 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='Fecha', Name='Fecha', Description=NULL, Help=NULL, AD_Element_ID=3000370 WHERE UPPER(ColumnName)='FECHA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 12/09/2016 15:20:48 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='Fecha', Name='Fecha', Description=NULL, Help=NULL WHERE AD_Element_ID=3000370 AND IsCentrallyMaintained='Y'
;

-- 12/09/2016 15:20:48 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET Name='Fecha', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000370) AND IsCentrallyMaintained='Y'
;

-- 12/09/2016 15:20:48 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_PrintFormatItem SET PrintName='Fecha', Name='Fecha' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000370)
;

-- 12/09/2016 15:20:54 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Fecha',PrintName='Fecha',Updated=TO_TIMESTAMP('2016-09-12 15:20:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000370 AND AD_Language='es_AR'
;

-- 12/09/2016 15:24:32 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element SET ColumnName='Deposito', Name='Depósito', PrintName='Depósito',Updated=TO_TIMESTAMP('2016-09-12 15:24:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000369
;

-- 12/09/2016 15:24:32 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000369
;

-- 12/09/2016 15:24:32 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET ColumnName='Deposito', Name='Depósito', Description=NULL, Help=NULL WHERE AD_Element_ID=3000369
;

-- 12/09/2016 15:24:32 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='Deposito', Name='Depósito', Description=NULL, Help=NULL, AD_Element_ID=3000369 WHERE UPPER(ColumnName)='DEPOSITO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 12/09/2016 15:24:32 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='Deposito', Name='Depósito', Description=NULL, Help=NULL WHERE AD_Element_ID=3000369 AND IsCentrallyMaintained='Y'
;

-- 12/09/2016 15:24:32 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET Name='Depósito', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000369) AND IsCentrallyMaintained='Y'
;

-- 12/09/2016 15:24:32 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_PrintFormatItem SET PrintName='Depósito', Name='Depósito' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000369)
;

-- 12/09/2016 15:24:37 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Depósito',PrintName='Depósito',Updated=TO_TIMESTAMP('2016-09-12 15:24:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000369 AND AD_Language='es_AR'
;

-- 12/09/2016 15:24:48 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column_Trl SET Name='Depósito',Updated=TO_TIMESTAMP('2016-09-12 15:24:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001867 AND AD_Language='es_AR'
;

-- 12/09/2016 15:25:16 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002814,1,'Y','N','N',3001867,'N','Y',3000127,'N','LAR','Depósito',100,0,TO_TIMESTAMP('2016-09-12 15:25:15','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-09-12 15:25:15','YYYY-MM-DD HH24:MI:SS'))
;

-- 12/09/2016 15:25:16 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002814 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 12/09/2016 15:25:16 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002815,29,'Y','N','N',3001868,'N','Y',3000127,'N','LAR','Fecha',100,0,TO_TIMESTAMP('2016-09-12 15:25:16','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-09-12 15:25:16','YYYY-MM-DD HH24:MI:SS'))
;

-- 12/09/2016 15:25:16 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002815 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 12/09/2016 15:25:31 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3002814
;

-- 12/09/2016 15:25:31 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3002754
;

-- 12/09/2016 15:25:31 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3002743
;

-- 12/09/2016 15:25:31 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3002744
;

-- 12/09/2016 15:25:31 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3002748
;

-- 12/09/2016 15:25:31 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3002787
;

-- 12/09/2016 15:25:31 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3002747
;

-- 12/09/2016 15:25:31 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3002746
;

-- 12/09/2016 15:25:31 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3002739
;

-- 12/09/2016 15:25:31 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3002815
;

-- 12/09/2016 15:27:13 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-09-12 15:27:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002814
;

-- 12/09/2016 15:28:35 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2016-09-12 15:28:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002814
;

-- 12/09/2016 15:28:38 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2016-09-12 15:28:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002752
;

-- 12/09/2016 15:34:25 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3002815
;

-- 12/09/2016 15:34:25 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3002754
;

-- 12/09/2016 15:34:25 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3002744
;

-- 12/09/2016 15:34:25 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3002787
;

-- 12/09/2016 15:34:25 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3002747
;

-- 12/09/2016 15:34:25 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3002746
;

-- 12/09/2016 15:34:25 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3002739
;

-- 12/09/2016 15:37:23 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@Retiro@=N',Updated=TO_TIMESTAMP('2016-09-12 15:37:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002752
;

-- 12/09/2016 15:37:26 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@Retiro@=N',Updated=TO_TIMESTAMP('2016-09-12 15:37:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002814
;

-- 12/09/2016 15:38:19 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@Transferencia@=N & @Deposito@=N',Updated=TO_TIMESTAMP('2016-09-12 15:38:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002750
;

-- 12/09/2016 15:39:54 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@Retiro@=N & @Deposito@N',Updated=TO_TIMESTAMP('2016-09-12 15:39:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002752
;

-- 12/09/2016 15:40:13 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@Retiro@=N & @Transferencia@=N',Updated=TO_TIMESTAMP('2016-09-12 15:40:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002814
;

-- 12/09/2016 15:41:41 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@Retiro@=N & @Deposito@=N',Updated=TO_TIMESTAMP('2016-09-12 15:41:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002752
;

-- 12/09/2016 22:37:59 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000371,'cuentadestino_id','LAR','cuentadestino_id','cuentadestino_id',0,TO_TIMESTAMP('2016-09-12 22:37:58','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-09-12 22:37:58','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 12/09/2016 22:37:59 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000371 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 12/09/2016 22:37:59 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001869,3000081,'LAR',0,'N','N','N','N',10,'N',19,'N',3000371,'N','Y','N','cuentadestino_id','cuentadestino_id',100,TO_TIMESTAMP('2016-09-12 22:37:58','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-09-12 22:37:58','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 12/09/2016 22:37:59 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001869 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 12/09/2016 22:39:24 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET AD_Reference_Value_ID=53283, AD_Reference_ID=18, AD_Val_Rule_ID=3000033, Name='Cuenta Bancaria Destino', ColumnName='CuentaDestino_ID',Updated=TO_TIMESTAMP('2016-09-12 22:39:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001869
;

-- 12/09/2016 22:39:24 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001869
;

-- 12/09/2016 22:39:24 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET Name='Cuenta Bancaria Destino', Description=NULL, Help=NULL WHERE AD_Column_ID=3001869 AND IsCentrallyMaintained='Y'
;

-- 12/09/2016 22:39:48 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column_Trl SET Name='Cuenta Bancaria Destino',Updated=TO_TIMESTAMP('2016-09-12 22:39:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001869 AND AD_Language='es_AR'
;

-- 12/09/2016 22:39:55 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element SET Name='Cuenta Bancaria Destino', PrintName='Cuenta Bancaria Destino',Updated=TO_TIMESTAMP('2016-09-12 22:39:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000371
;

-- 12/09/2016 22:39:55 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000371
;

-- 12/09/2016 22:39:55 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET ColumnName='cuentadestino_id', Name='Cuenta Bancaria Destino', Description=NULL, Help=NULL WHERE AD_Element_ID=3000371
;

-- 12/09/2016 22:39:55 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='cuentadestino_id', Name='Cuenta Bancaria Destino', Description=NULL, Help=NULL, AD_Element_ID=3000371 WHERE UPPER(ColumnName)='CUENTADESTINO_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 12/09/2016 22:39:55 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='cuentadestino_id', Name='Cuenta Bancaria Destino', Description=NULL, Help=NULL WHERE AD_Element_ID=3000371 AND IsCentrallyMaintained='Y'
;

-- 12/09/2016 22:39:55 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET Name='Cuenta Bancaria Destino', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000371) AND IsCentrallyMaintained='Y'
;

-- 12/09/2016 22:39:55 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_PrintFormatItem SET PrintName='Cuenta Bancaria Destino', Name='Cuenta Bancaria Destino' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000371)
;

-- 12/09/2016 22:40:09 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element SET ColumnName='CuentaDestino_ID',Updated=TO_TIMESTAMP('2016-09-12 22:40:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000371
;

-- 12/09/2016 22:40:09 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET ColumnName='CuentaDestino_ID', Name='Cuenta Bancaria Destino', Description=NULL, Help=NULL WHERE AD_Element_ID=3000371
;

-- 12/09/2016 22:40:09 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='CuentaDestino_ID', Name='Cuenta Bancaria Destino', Description=NULL, Help=NULL, AD_Element_ID=3000371 WHERE UPPER(ColumnName)='CUENTADESTINO_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 12/09/2016 22:40:09 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='CuentaDestino_ID', Name='Cuenta Bancaria Destino', Description=NULL, Help=NULL WHERE AD_Element_ID=3000371 AND IsCentrallyMaintained='Y'
;

-- 12/09/2016 22:40:18 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Cuenta Bancaria Destino',PrintName='Cuenta Bancaria Destino',Updated=TO_TIMESTAMP('2016-09-12 22:40:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000371 AND AD_Language='es_AR'
;

-- 12/09/2016 22:40:44 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002816,10,'Y','N','N',3001869,'N','Y',3000127,'N','LAR','Cuenta Bancaria Destino',100,0,TO_TIMESTAMP('2016-09-12 22:40:44','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2016-09-12 22:40:44','YYYY-MM-DD HH24:MI:SS'))
;

-- 12/09/2016 22:40:44 ART
-- BUG #334: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002816 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 12/09/2016 22:41:05 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3002816
;

-- 12/09/2016 22:41:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3002750
;

-- 12/09/2016 22:41:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3002752
;

-- 12/09/2016 22:41:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3002814
;

-- 12/09/2016 22:41:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3002815
;

-- 12/09/2016 22:41:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3002743
;

-- 12/09/2016 22:41:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3002754
;

-- 12/09/2016 22:41:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3002748
;

-- 12/09/2016 22:41:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3002744
;

-- 12/09/2016 22:41:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3002787
;

-- 12/09/2016 22:41:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3002747
;

-- 12/09/2016 22:41:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3002746
;

-- 12/09/2016 22:41:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3002739
;

-- 12/09/2016 22:41:35 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET IsSameLine='Y', DisplayLogic='@Deposito@=Y',Updated=TO_TIMESTAMP('2016-09-12 22:41:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002816
;

-- 13/09/2016 18:57:58 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET DefaultValue='X',Updated=TO_TIMESTAMP('2016-09-13 18:57:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002801
;

-- 14/09/2016 17:00:57 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element SET Name='Pago/Cobro Origen', PrintName='Pago/Cobro Origen',Updated=TO_TIMESTAMP('2016-09-14 17:00:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000074
;

-- 14/09/2016 17:00:57 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000074
;

-- 14/09/2016 17:00:57 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET ColumnName='LAR_PaymentSource_ID', Name='Pago/Cobro Origen', Description=NULL, Help=NULL WHERE AD_Element_ID=3000074
;

-- 14/09/2016 17:00:57 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='LAR_PaymentSource_ID', Name='Pago/Cobro Origen', Description=NULL, Help=NULL, AD_Element_ID=3000074 WHERE UPPER(ColumnName)='LAR_PAYMENTSOURCE_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 14/09/2016 17:00:57 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='LAR_PaymentSource_ID', Name='Pago/Cobro Origen', Description=NULL, Help=NULL WHERE AD_Element_ID=3000074 AND IsCentrallyMaintained='Y'
;

-- 14/09/2016 17:00:57 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET Name='Pago/Cobro Origen', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000074) AND IsCentrallyMaintained='Y'
;

-- 14/09/2016 17:00:57 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_PrintFormatItem SET PrintName='Pago/Cobro Origen', Name='Pago/Cobro Origen' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000074)
;

-- 14/09/2016 17:01:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Pago/Cobro Origen',PrintName='Pago/Cobro Origen',Updated=TO_TIMESTAMP('2016-09-14 17:01:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000074 AND AD_Language='es_AR'
;

-- 14/09/2016 17:01:27 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column_Trl SET Name='Pago/Cobro Origen',Updated=TO_TIMESTAMP('2016-09-14 17:01:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000259 AND AD_Language='es_AR'
;

-- 14/09/2016 17:57:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET Name='Cabecera de Pago/Cobro',Updated=TO_TIMESTAMP('2016-09-14 17:57:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000258
;

-- 14/09/2016 17:57:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3000258
;

-- 14/09/2016 17:57:06 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET Name='Cabecera de Pago/Cobro', Description=NULL, Help=NULL WHERE AD_Column_ID=3000258 AND IsCentrallyMaintained='Y'
;

-- 14/09/2016 17:57:10 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column_Trl SET Name='Cabecera de Pago/Cobro',Updated=TO_TIMESTAMP('2016-09-14 17:57:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000258 AND AD_Language='es_AR'
;

-- 14/09/2016 17:57:18 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element SET Name='Cabecera de Pago/Cobro', PrintName='Cabecera de Pago/Cobro',Updated=TO_TIMESTAMP('2016-09-14 17:57:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000068
;

-- 14/09/2016 17:57:18 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000068
;

-- 14/09/2016 17:57:18 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Column SET ColumnName='LAR_PaymentHeader_ID', Name='Cabecera de Pago/Cobro', Description=NULL, Help=NULL WHERE AD_Element_ID=3000068
;

-- 14/09/2016 17:57:18 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='LAR_PaymentHeader_ID', Name='Cabecera de Pago/Cobro', Description=NULL, Help=NULL, AD_Element_ID=3000068 WHERE UPPER(ColumnName)='LAR_PAYMENTHEADER_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 14/09/2016 17:57:18 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='LAR_PaymentHeader_ID', Name='Cabecera de Pago/Cobro', Description=NULL, Help=NULL WHERE AD_Element_ID=3000068 AND IsCentrallyMaintained='Y'
;

-- 14/09/2016 17:57:18 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Field SET Name='Cabecera de Pago/Cobro', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000068) AND IsCentrallyMaintained='Y'
;

-- 14/09/2016 17:57:18 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_PrintFormatItem SET PrintName='Cabecera de Pago/Cobro', Name='Cabecera de Pago/Cobro' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000068)
;

-- 14/09/2016 17:57:27 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Cabecera de Pago/Cobro',PrintName='Cabecera de Pago/Cobro',Updated=TO_TIMESTAMP('2016-09-14 17:57:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000068 AND AD_Language='es_AR'
;

-- 14/09/2016 22:08:40 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Tab SET IsReadOnly='Y', IsInsertRecord='N',Updated=TO_TIMESTAMP('2016-09-14 22:08:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000047
;

-- 14/09/2016 22:08:47 ART
-- BUG #334: Cierre de Cajas.
UPDATE AD_Tab SET IsReadOnly='Y', IsInsertRecord='N',Updated=TO_TIMESTAMP('2016-09-14 22:08:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000048
;

-- Registración de script
SELECT register_migration_script_lar('0075_ISSUE-80', 'LAR', '')
;
