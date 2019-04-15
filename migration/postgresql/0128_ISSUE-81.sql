-- Table: lar_paymentwithholdingLine

CREATE TABLE lar_paymentwithholdingLine
(
  ad_client_id numeric(10,0) NOT NULL,
  ad_org_id numeric(10,0) NOT NULL,
  created timestamp without time zone NOT NULL,
  createdby numeric(10,0) NOT NULL,
  updated timestamp without time zone NOT NULL,
  updatedby numeric(10,0) NOT NULL,
  isactive character(1) NOT NULL DEFAULT 'Y'::bpchar,
  lar_paymentwithholdingLine_id numeric(10,0) NOT NULL,
  lar_paymentwithholding_id numeric NOT NULL,
  c_invoice_id numeric(10,0),
  percent numeric,
  processed character(1) NOT NULL DEFAULT 'N'::bpchar,
  c_tax_id numeric(10,0) DEFAULT NULL::numeric,
  taxamt numeric NOT NULL,
  taxbaseamt numeric NOT NULL,
  c_payment_id numeric(10,0),
  description character varying(255),
  CONSTRAINT lar_paymentwithholdingline_pkey PRIMARY KEY (lar_paymentwithholdingLine_id),
  CONSTRAINT cinvoice_larpwline FOREIGN KEY (c_invoice_id)
      REFERENCES c_invoice (c_invoice_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT ctax_larpwline FOREIGN KEY (c_tax_id)
      REFERENCES c_tax (c_tax_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_larpwline_c_payment_id FOREIGN KEY (c_payment_id)
      REFERENCES c_payment (c_payment_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT paymentwithholding_pwline_fk FOREIGN KEY (lar_paymentwithholding_id)
      REFERENCES lar_paymentwithholding (lar_paymentwithholding_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lar_paymentwithholding_isactive_check CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])),
  CONSTRAINT lar_paymentwithholding_processed_check CHECK (processed = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
)
WITH (
  OIDS=FALSE
);


-- 14/04/2019 19:25:57 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,ImportTable,IsHighVolume,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','3',0,3000131,'N','N','N','N','N','LAR','Y','Y','L','LAR_PaymentWithholdingLine','LAR_PaymentWithholdingLine',0,'Y',0,100,TO_TIMESTAMP('2019-04-14 19:25:56','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2019-04-14 19:25:56','YYYY-MM-DD HH24:MI:SS'))
;

-- 14/04/2019 19:25:57 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000131 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- 14/04/2019 19:25:57 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,UpdatedBy,AD_Client_ID,Updated,Created,CreatedBy,IsActive) VALUES (1,'N',200000,'Y',1000000,1000000,'N','Y',3000703,'Table LAR_PaymentWithholdingLine','LAR_PaymentWithholdingLine',0,100,0,TO_TIMESTAMP('2019-04-14 19:25:57','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2019-04-14 19:25:57','YYYY-MM-DD HH24:MI:SS'),100,'Y')
;

-- 14/04/2019 19:26:24 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003452,3000131,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,TO_TIMESTAMP('2019-04-14 19:26:24','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2019-04-14 19:26:24','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/04/2019 19:26:24 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003452 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 14/04/2019 19:26:25 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003453,3000131,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',100,TO_TIMESTAMP('2019-04-14 19:26:24','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2019-04-14 19:26:24','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/04/2019 19:26:25 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003453 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 14/04/2019 19:26:25 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003454,3000131,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,TO_TIMESTAMP('2019-04-14 19:26:25','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2019-04-14 19:26:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/04/2019 19:26:25 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003454 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 14/04/2019 19:26:25 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003455,3000131,'LAR',0,110,'Y','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,TO_TIMESTAMP('2019-04-14 19:26:25','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2019-04-14 19:26:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/04/2019 19:26:25 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003455 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 14/04/2019 19:26:26 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003456,3000131,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,TO_TIMESTAMP('2019-04-14 19:26:25','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2019-04-14 19:26:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/04/2019 19:26:26 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003456 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 14/04/2019 19:26:26 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003457,3000131,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,TO_TIMESTAMP('2019-04-14 19:26:26','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2019-04-14 19:26:26','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/04/2019 19:26:26 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003457 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 14/04/2019 19:26:26 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003458,3000131,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,TO_TIMESTAMP('2019-04-14 19:26:26','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2019-04-14 19:26:26','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/04/2019 19:26:26 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003458 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 14/04/2019 19:26:26 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001015,'LAR_PaymentWithholdingLine_ID','LAR','LAR_PaymentWithholdingLine','LAR_PaymentWithholdingLine',0,TO_TIMESTAMP('2019-04-14 19:26:26','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2019-04-14 19:26:26','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 14/04/2019 19:26:26 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001015 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 14/04/2019 19:26:27 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003459,3000131,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3001015,'N','N','N','LAR_PaymentWithholdingLine','LAR_PaymentWithholdingLine_ID',100,TO_TIMESTAMP('2019-04-14 19:26:26','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2019-04-14 19:26:26','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/04/2019 19:26:27 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003459 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 14/04/2019 19:26:27 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003460,3000131,'LAR',0,'Y','N','N','N',131089,'N',19,'N',3000026,'N','Y','N','LAR_PaymentWithholding','LAR_PaymentWithholding_ID',100,TO_TIMESTAMP('2019-04-14 19:26:27','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2019-04-14 19:26:27','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/04/2019 19:26:27 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003460 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 14/04/2019 19:26:27 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003461,3000131,'LAR',0,'N','N','N','The Invoice Document.','N',10,'N',19,'N',1008,'N','Y','N','Invoice Identifier','Invoice','C_Invoice_ID',100,TO_TIMESTAMP('2019-04-14 19:26:27','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2019-04-14 19:26:27','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/04/2019 19:26:27 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003461 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 14/04/2019 19:26:28 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003462,3000131,'LAR',0,'N','N','N','The Percent indicates the percentage used.','N',131089,'N',22,'N',951,'N','Y','N','Percentage','Percent','Percent',100,TO_TIMESTAMP('2019-04-14 19:26:27','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2019-04-14 19:26:27','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/04/2019 19:26:28 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003462 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 14/04/2019 19:26:28 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003463,3000131,'LAR',0,'Y','N','N','The Processed checkbox indicates that a document has been processed.','N',1,'N',20,'N',1047,'N','Y','N','The document has been processed','Processed','Processed',100,TO_TIMESTAMP('2019-04-14 19:26:28','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2019-04-14 19:26:28','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/04/2019 19:26:28 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003463 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 14/04/2019 19:26:28 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003464,3000131,'LAR',0,'N','N','N','The Tax indicates the type of tax used in document line.','N',10,'N',19,'N',213,'N','Y','N','Tax identifier','Tax','C_Tax_ID',100,TO_TIMESTAMP('2019-04-14 19:26:28','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2019-04-14 19:26:28','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/04/2019 19:26:28 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003464 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 14/04/2019 19:26:28 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003465,3000131,'LAR',0,'Y','N','N','The Tax Amount displays the total tax amount for a document.','N',131089,'N',12,'N',1133,'N','Y','N','Tax Amount for a document','Tax Amount','TaxAmt',100,TO_TIMESTAMP('2019-04-14 19:26:28','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2019-04-14 19:26:28','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/04/2019 19:26:28 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003465 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 14/04/2019 19:26:28 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003466,3000131,'LAR',0,'Y','N','N','The Tax Base Amount indicates the base amount used for calculating the tax amount.','N',131089,'N',12,'N',1134,'N','Y','N','Base for calculating the tax amount','Tax base Amount','TaxBaseAmt',100,TO_TIMESTAMP('2019-04-14 19:26:28','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2019-04-14 19:26:28','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/04/2019 19:26:28 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003466 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 14/04/2019 19:26:29 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003467,3000131,'LAR',0,'N','N','N','The Payment is a unique identifier of this payment.','N',10,'N',19,'N',1384,'N','Y','N','Payment identifier','Payment','C_Payment_ID',100,TO_TIMESTAMP('2019-04-14 19:26:28','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2019-04-14 19:26:28','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/04/2019 19:26:29 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003467 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 14/04/2019 19:26:29 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003468,3000131,'LAR',0,'N','N','N','A description is limited to 255 characters.','N',255,'Y',10,'N',275,'N','Y','N','Optional short description of the record','Description','Description',100,TO_TIMESTAMP('2019-04-14 19:26:29','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2019-04-14 19:26:29','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/04/2019 19:26:29 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003468 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 14/04/2019 19:27:11 ART
-- ISSUE #81: Retenciones IIBB Río Negro
UPDATE AD_Column SET FieldLength=10,Updated=TO_TIMESTAMP('2019-04-14 19:27:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003460
;

-- 14/04/2019 19:27:23 ART
-- ISSUE #81: Retenciones IIBB Río Negro
UPDATE AD_Column SET FieldLength=22,Updated=TO_TIMESTAMP('2019-04-14 19:27:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003462
;

-- 14/04/2019 19:27:28 ART
-- ISSUE #81: Retenciones IIBB Río Negro
UPDATE AD_Column SET FieldLength=22,Updated=TO_TIMESTAMP('2019-04-14 19:27:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003465
;

-- 14/04/2019 19:27:31 ART
-- ISSUE #81: Retenciones IIBB Río Negro
UPDATE AD_Column SET FieldLength=22,Updated=TO_TIMESTAMP('2019-04-14 19:27:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003466
;

-- 14/04/2019 19:38:45 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,AD_Column_ID,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Parent_Column_ID,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('Y',3000010,50,'N','N',3000131,3000219,'N','N',3003460,'N','Y',2,'N','N','LAR',3000078,'Linea Certificado',0,0,TO_TIMESTAMP('2019-04-14 19:38:45','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2019-04-14 19:38:45','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 14/04/2019 19:38:45 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000219 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 14/04/2019 19:38:53 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006488,1,'Y','N','N',3003458,'N','Y',3000219,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,TO_TIMESTAMP('2019-04-14 19:38:53','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-04-14 19:38:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/04/2019 19:38:53 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006488 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/04/2019 19:38:53 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006489,10,'Y','N','N',3003452,'N','Y',3000219,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,TO_TIMESTAMP('2019-04-14 19:38:53','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-04-14 19:38:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/04/2019 19:38:53 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006489 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/04/2019 19:38:54 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006490,255,'Y','N','N',3003468,'N','Y',3000219,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,TO_TIMESTAMP('2019-04-14 19:38:53','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-04-14 19:38:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/04/2019 19:38:54 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006490 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/04/2019 19:38:54 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006491,10,'Y','N','N',3003461,'N','Y',3000219,'N','The Invoice Document.','LAR','Invoice Identifier','Invoice',100,0,TO_TIMESTAMP('2019-04-14 19:38:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-04-14 19:38:54','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/04/2019 19:38:54 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006491 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/04/2019 19:38:54 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006492,10,'Y','N','N',3003460,'N','Y',3000219,'N','LAR','LAR_PaymentWithholding',100,0,TO_TIMESTAMP('2019-04-14 19:38:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-04-14 19:38:54','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/04/2019 19:38:54 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006492 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/04/2019 19:38:55 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006493,10,'N','N','N',3003459,'N','Y',3000219,'N','LAR','LAR_PaymentWithholdingLine',100,0,TO_TIMESTAMP('2019-04-14 19:38:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-04-14 19:38:54','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/04/2019 19:38:55 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006493 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/04/2019 19:38:56 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006494,10,'Y','N','N',3003453,'N','Y',3000219,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,TO_TIMESTAMP('2019-04-14 19:38:55','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-04-14 19:38:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/04/2019 19:38:56 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006494 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/04/2019 19:38:56 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006495,10,'Y','N','N',3003467,'N','Y',3000219,'N','The Payment is a unique identifier of this payment.','LAR','Payment identifier','Payment',100,0,TO_TIMESTAMP('2019-04-14 19:38:56','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-04-14 19:38:56','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/04/2019 19:38:56 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006495 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/04/2019 19:38:56 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006496,22,'Y','N','N',3003462,'N','Y',3000219,'N','The Percent indicates the percentage used.','LAR','Percentage','Percent',100,0,TO_TIMESTAMP('2019-04-14 19:38:56','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-04-14 19:38:56','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/04/2019 19:38:56 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006496 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/04/2019 19:38:56 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006497,1,'Y','N','N',3003463,'N','Y',3000219,'N','The Processed checkbox indicates that a document has been processed.','LAR','The document has been processed','Processed',100,0,TO_TIMESTAMP('2019-04-14 19:38:56','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-04-14 19:38:56','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/04/2019 19:38:56 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006497 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/04/2019 19:38:56 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006498,10,'Y','N','N',3003464,'N','Y',3000219,'N','The Tax indicates the type of tax used in document line.','LAR','Tax identifier','Tax',100,0,TO_TIMESTAMP('2019-04-14 19:38:56','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-04-14 19:38:56','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/04/2019 19:38:56 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006498 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/04/2019 19:38:57 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006499,22,'Y','N','N',3003465,'N','Y',3000219,'N','The Tax Amount displays the total tax amount for a document.','LAR','Tax Amount for a document','Tax Amount',100,0,TO_TIMESTAMP('2019-04-14 19:38:56','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-04-14 19:38:56','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/04/2019 19:38:57 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006499 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/04/2019 19:38:57 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006500,22,'Y','N','N',3003466,'N','Y',3000219,'N','The Tax Base Amount indicates the base amount used for calculating the tax amount.','LAR','Base for calculating the tax amount','Tax base Amount',100,0,TO_TIMESTAMP('2019-04-14 19:38:57','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-04-14 19:38:57','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/04/2019 19:38:57 ART
-- ISSUE #81: Retenciones IIBB Río Negro
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006500 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/04/2019 19:41:15 ART
-- ISSUE #81: Retenciones IIBB Río Negro
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3006489
;

-- 14/04/2019 19:41:17 ART
-- ISSUE #81: Retenciones IIBB Río Negro
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3006494
;

-- 14/04/2019 19:41:17 ART
-- ISSUE #81: Retenciones IIBB Río Negro
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3006492
;

-- 14/04/2019 19:41:17 ART
-- ISSUE #81: Retenciones IIBB Río Negro
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3006488
;

-- 14/04/2019 19:41:17 ART
-- ISSUE #81: Retenciones IIBB Río Negro
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3006490
;

-- 14/04/2019 19:41:17 ART
-- ISSUE #81: Retenciones IIBB Río Negro
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3006491
;

-- 14/04/2019 19:41:17 ART
-- ISSUE #81: Retenciones IIBB Río Negro
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3006498
;

-- 14/04/2019 19:41:17 ART
-- ISSUE #81: Retenciones IIBB Río Negro
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3006496
;

-- 14/04/2019 19:41:17 ART
-- ISSUE #81: Retenciones IIBB Río Negro
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3006500
;

-- 14/04/2019 19:41:17 ART
-- ISSUE #81: Retenciones IIBB Río Negro
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3006499
;

-- 14/04/2019 19:41:17 ART
-- ISSUE #81: Retenciones IIBB Río Negro
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3006495
;

-- 14/04/2019 19:41:17 ART
-- ISSUE #81: Retenciones IIBB Río Negro
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3006497
;

-- 14/04/2019 19:41:24 ART
-- ISSUE #81: Retenciones IIBB Río Negro
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2019-04-14 19:41:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006494
;

-- 14/04/2019 19:41:28 ART
-- ISSUE #81: Retenciones IIBB Río Negro
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2019-04-14 19:41:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006488
;

-- 14/04/2019 19:41:34 ART
-- ISSUE #81: Retenciones IIBB Río Negro
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2019-04-14 19:41:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006496
;

-- 14/04/2019 19:41:40 ART
-- ISSUE #81: Retenciones IIBB Río Negro
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2019-04-14 19:41:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006499
;

-- 14/04/2019 19:41:44 ART
-- ISSUE #81: Retenciones IIBB Río Negro
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2019-04-14 19:41:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006497
;

-- 14/04/2019 19:44:32 ART
-- ISSUE #81: Retenciones IIBB Río Negro
UPDATE AD_Column SET IsIdentifier='Y',Updated=TO_TIMESTAMP('2019-04-14 19:44:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000083
;

-- 14/04/2019 19:44:49 ART
-- ISSUE #81: Retenciones IIBB Río Negro
UPDATE AD_Column SET IsIdentifier='Y',Updated=TO_TIMESTAMP('2019-04-14 19:44:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003219
;

-- 14/04/2019 19:45:05 ART
-- ISSUE #81: Retenciones IIBB Río Negro
UPDATE AD_Column SET IsIdentifier='Y',Updated=TO_TIMESTAMP('2019-04-14 19:45:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000086
;

-- 14/04/2019 19:45:12 ART
-- ISSUE #81: Retenciones IIBB Río Negro
UPDATE AD_Column SET IsIdentifier='Y',Updated=TO_TIMESTAMP('2019-04-14 19:45:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000088
;

-- Registración de script
SELECT register_migration_script_lar('0128_ISSUE-81.sql', 'LAR', '')
;
