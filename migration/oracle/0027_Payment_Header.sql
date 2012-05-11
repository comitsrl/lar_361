--Add Payment Header
CREATE TABLE LAR_PaymentHeader 
( 
    LAR_PaymentHeader_ID    numeric(10,0) NOT NULL,
    c_doctype_id            numeric(10,0) NULL,
    documentno              varchar(50) NULL,
    datetrx                 timestamp NULL,
    c_bpartner_id           numeric(10,0) NULL,
    docstatus               varchar(2) NULL,
    processit               char(1) NULL,
    searchpayments          char(1) NULL,
    ad_org_id               numeric(10,0) NULL,
    ad_client_id            numeric(10,0) NULL,
    updatedby               numeric(10,0) NULL,
    updated                 timestamp NULL,
    createdby               numeric(10,0) NULL,
    created                 timestamp NULL,
    isactive                char(1) NULL DEFAULT 'Y'::character varying,
    detail                  char(1) NULL DEFAULT 'Y'::character varying,
    isreceipt               char(1) NULL DEFAULT 'Y'::character varying,
    processed               char(1) NULL DEFAULT 'N'::character varying,
	c_invoice_id			numeric(10,0) NULL,
	c_bankaccount_id		numeric(10,0) NULL,
    PRIMARY KEY(LAR_PaymentHeader_id)
);

ALTER TABLE LAR_PaymentHeader ADD CONSTRAINT cdoctype_payheader
    FOREIGN KEY (c_doctype_id) REFERENCES c_doctype (c_doctype_id);
ALTER TABLE LAR_PaymentHeader ADD CONSTRAINT cbpartner_payheader
    FOREIGN KEY (c_bpartner_id) REFERENCES c_bpartner (c_bpartner_id);
ALTER TABLE LAR_PaymentHeader ADD CONSTRAINT cinvoice_payheader 
    FOREIGN KEY (c_invoice_id) REFERENCES c_invoice (c_invoice_id);
ALTER TABLE LAR_PaymentHeader ADD CONSTRAINT cbankacc_payheader 
    FOREIGN KEY (c_bankaccount_id) REFERENCES c_bankaccount (c_bankaccount_id);

-- Apr 30, 2012 6:23:14 PM ART
--Add Payment Header
INSERT INTO AD_Table (LoadSeq,IsSecurityEnabled,AccessLevel,AD_Table_ID,ImportTable,IsHighVolume,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Description,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES (0,'N','3',3000010,'N','N','N','N','N','LAR','Y','Y','L','LAR_PaymentHeader','Header to group payments','LAR_PaymentHeader',0,'Y',0,0,TO_DATE('2012-04-30 18:23:13','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2012-04-30 18:23:13','YYYY-MM-DD HH24:MI:SS'))
;

-- Apr 30, 2012 6:23:14 PM ART
--Add Payment Header
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000010 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- Apr 30, 2012 6:23:14 PM ART
--Add Payment Header
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,AD_Client_ID,Updated,UpdatedBy,Created,CreatedBy,IsActive) VALUES (1,'N',50000,'Y',1000000,1000000,'N','Y',3000012,'Table LAR_PaymentHeader','LAR_PaymentHeader',0,0,TO_DATE('2012-04-30 18:23:14','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2012-04-30 18:23:14','YYYY-MM-DD HH24:MI:SS'),0,'Y')
;

-- Apr 30, 2012 6:23:39 PM ART
--Add Payment Header
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000068,'LAR_PaymentHeader_ID','LAR','LAR_PaymentHeader','LAR_PaymentHeader',0,TO_DATE('2012-04-30 18:23:39','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-04-30 18:23:39','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,0)
;

-- Apr 30, 2012 6:23:39 PM ART
--Add Payment Header
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,PO_Name,Name,Description,PrintName,PO_PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.PO_Name,t.Name,t.Description,t.PrintName,t.PO_PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000068 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Apr 30, 2012 6:23:39 PM ART
--Add Payment Header
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000235,3000010,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3000068,'N','N','N','LAR_PaymentHeader','LAR_PaymentHeader_ID',0,TO_DATE('2012-04-30 18:23:39','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-30 18:23:39','YYYY-MM-DD HH24:MI:SS'),0)
;

-- Apr 30, 2012 6:23:39 PM ART
--Add Payment Header
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000235 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Apr 30, 2012 6:23:40 PM ART
--Add Payment Header
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000236,3000010,'LAR',0,'N','N','N','The Document Type determines document sequence and processing rules','N',10,'N',19,'N',196,'N','Y','N','Document type or rules','Document Type','C_DocType_ID',0,TO_DATE('2012-04-30 18:23:39','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-30 18:23:39','YYYY-MM-DD HH24:MI:SS'),0)
;

-- Apr 30, 2012 6:23:40 PM ART
--Add Payment Header
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000236 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Apr 30, 2012 6:23:40 PM ART
--Add Payment Header
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000237,3000010,'LAR',0,'N','N','N','The document number is usually automatically generated by the system and determined by the document type of the document. If the document is not saved, the preliminary number is displayed in "<>".

If the document type of your document has no automatic document sequence defined, the field is empty if you create a new document. This is for documents which usually have an external number (like vendor invoice).  If you leave the field empty, the system will generate a document number for you. The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).','N',50,'Y',10,'N',290,'N','Y','N','Document sequence number of the document','Document No','DocumentNo',0,TO_DATE('2012-04-30 18:23:40','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-30 18:23:40','YYYY-MM-DD HH24:MI:SS'),0)
;

-- Apr 30, 2012 6:23:40 PM ART
--Add Payment Header
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000237 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Apr 30, 2012 6:23:40 PM ART
--Add Payment Header
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000238,3000010,'LAR',0,'N','N','N','The Transaction Date indicates the date of the transaction.','N',29,'N',16,'N',1297,'N','Y','N','Transaction Date','Transaction Date','DateTrx',0,TO_DATE('2012-04-30 18:23:40','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-30 18:23:40','YYYY-MM-DD HH24:MI:SS'),0)
;

-- Apr 30, 2012 6:23:40 PM ART
--Add Payment Header
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000238 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Apr 30, 2012 6:23:41 PM ART
--Add Payment Header
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000239,3000010,'LAR',0,'N','N','N','A Business Partner is anyone with whom you transact.  This can include Vendor, Customer, Employee or Salesperson','N',10,'N',19,'N',187,'N','Y','N','Identifies a Business Partner','Business Partner ','C_BPartner_ID',0,TO_DATE('2012-04-30 18:23:40','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-30 18:23:40','YYYY-MM-DD HH24:MI:SS'),0)
;

-- Apr 30, 2012 6:23:41 PM ART
--Add Payment Header
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000239 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Apr 30, 2012 6:23:41 PM ART
--Add Payment Header
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000240,3000010,'LAR',0,'N','N','N','The Document Status indicates the status of a document at this time.  If you want to change the document status, use the Document Action field','N',2,'N',10,'N',289,'N','Y','N','The current status of the document','Document Status','DocStatus',0,TO_DATE('2012-04-30 18:23:41','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-30 18:23:41','YYYY-MM-DD HH24:MI:SS'),0)
;

-- Apr 30, 2012 6:23:41 PM ART
--Add Payment Header
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000240 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Apr 30, 2012 6:23:41 PM ART
--Add Payment Header
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000069,'processit','LAR','processit','processit',0,TO_DATE('2012-04-30 18:23:41','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-04-30 18:23:41','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,0)
;

-- Apr 30, 2012 6:23:41 PM ART
--Add Payment Header
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,PO_Name,Name,Description,PrintName,PO_PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.PO_Name,t.Name,t.Description,t.PrintName,t.PO_PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000069 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Apr 30, 2012 6:23:42 PM ART
--Add Payment Header
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000241,3000010,'LAR',0,'N','N','N','N',1,'N',20,'N',3000069,'N','Y','N','processit','processit',0,TO_DATE('2012-04-30 18:23:41','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-30 18:23:41','YYYY-MM-DD HH24:MI:SS'),0)
;

-- Apr 30, 2012 6:23:42 PM ART
--Add Payment Header
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000241 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Apr 30, 2012 6:23:42 PM ART
--Add Payment Header
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000070,'searchpayments','LAR','searchpayments','searchpayments',0,TO_DATE('2012-04-30 18:23:42','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-04-30 18:23:42','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,0)
;

-- Apr 30, 2012 6:23:42 PM ART
--Add Payment Header
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,PO_Name,Name,Description,PrintName,PO_PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.PO_Name,t.Name,t.Description,t.PrintName,t.PO_PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000070 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Apr 30, 2012 6:23:42 PM ART
--Add Payment Header
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000242,3000010,'LAR',0,'N','N','N','N',1,'N',20,'N',3000070,'N','Y','N','searchpayments','searchpayments',0,TO_DATE('2012-04-30 18:23:42','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-30 18:23:42','YYYY-MM-DD HH24:MI:SS'),0)
;

-- Apr 30, 2012 6:23:42 PM ART
--Add Payment Header
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000242 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Apr 30, 2012 6:23:43 PM ART
--Add Payment Header
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000243,3000010,'LAR',0,'N','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',0,TO_DATE('2012-04-30 18:23:42','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-30 18:23:42','YYYY-MM-DD HH24:MI:SS'),0)
;

-- Apr 30, 2012 6:23:43 PM ART
--Add Payment Header
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000243 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Apr 30, 2012 6:23:43 PM ART
--Add Payment Header
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000244,3000010,'LAR',0,'N','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',0,TO_DATE('2012-04-30 18:23:43','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-30 18:23:43','YYYY-MM-DD HH24:MI:SS'),0)
;

-- Apr 30, 2012 6:23:43 PM ART
--Add Payment Header
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000244 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Apr 30, 2012 6:23:43 PM ART
--Add Payment Header
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000245,3000010,'LAR',0,110,'N','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',0,TO_DATE('2012-04-30 18:23:43','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-30 18:23:43','YYYY-MM-DD HH24:MI:SS'),0)
;

-- Apr 30, 2012 6:23:43 PM ART
--Add Payment Header
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000245 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Apr 30, 2012 6:23:44 PM ART
--Add Payment Header
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000246,3000010,'LAR',0,'N','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',0,TO_DATE('2012-04-30 18:23:43','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-30 18:23:43','YYYY-MM-DD HH24:MI:SS'),0)
;

-- Apr 30, 2012 6:23:44 PM ART
--Add Payment Header
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000246 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Apr 30, 2012 6:23:44 PM ART
--Add Payment Header
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000247,3000010,'LAR',0,110,'N','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',0,TO_DATE('2012-04-30 18:23:44','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-30 18:23:44','YYYY-MM-DD HH24:MI:SS'),0)
;

-- Apr 30, 2012 6:23:44 PM ART
--Add Payment Header
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000247 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Apr 30, 2012 6:23:45 PM ART
--Add Payment Header
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000248,3000010,'LAR',0,'N','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',0,TO_DATE('2012-04-30 18:23:44','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-30 18:23:44','YYYY-MM-DD HH24:MI:SS'),0)
;

-- Apr 30, 2012 6:23:45 PM ART
--Add Payment Header
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000248 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Apr 30, 2012 6:23:45 PM ART
--Add Payment Header
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000249,3000010,'LAR',0,'N','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',0,TO_DATE('2012-04-30 18:23:45','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-30 18:23:45','YYYY-MM-DD HH24:MI:SS'),0)
;

-- Apr 30, 2012 6:23:45 PM ART
--Add Payment Header
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000249 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Apr 30, 2012 6:23:46 PM ART
--Add Payment Header
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000071,'detail','LAR','detail','detail',0,TO_DATE('2012-04-30 18:23:45','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-04-30 18:23:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,0)
;

-- Apr 30, 2012 6:23:46 PM ART
--Add Payment Header
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,PO_Name,Name,Description,PrintName,PO_PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.PO_Name,t.Name,t.Description,t.PrintName,t.PO_PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000071 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Apr 30, 2012 6:23:46 PM ART
--Add Payment Header
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000250,3000010,'LAR',0,'N','N','N','N',1,'N',20,'N',3000071,'N','Y','N','detail','detail',0,TO_DATE('2012-04-30 18:23:45','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-30 18:23:45','YYYY-MM-DD HH24:MI:SS'),0)
;

-- Apr 30, 2012 6:23:46 PM ART
--Add Payment Header
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000250 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Apr 30, 2012 6:23:46 PM ART
--Add Payment Header
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000251,3000010,'LAR',0,'N','N','N','N',1,'N',20,'N',1634,'N','Y','N','This is a sales transaction (receipt)','Receipt','IsReceipt',0,TO_DATE('2012-04-30 18:23:46','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-30 18:23:46','YYYY-MM-DD HH24:MI:SS'),0)
;

-- Apr 30, 2012 6:23:46 PM ART
--Add Payment Header
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000251 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Apr 30, 2012 6:23:46 PM ART
--Add Payment Header
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000252,3000010,'LAR',0,'N','N','N','The Processed checkbox indicates that a document has been processed.','N',1,'N',20,'N',1047,'N','Y','N','The document has been processed','Processed','Processed',0,TO_DATE('2012-04-30 18:23:46','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-30 18:23:46','YYYY-MM-DD HH24:MI:SS'),0)
;

-- Apr 30, 2012 6:23:46 PM ART
--Add Payment Header
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000252 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Apr 30, 2012 6:23:47 PM ART
--Add Payment Header
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000253,3000010,'LAR',0,'N','N','N','The Invoice Document.','N',10,'N',19,'N',1008,'N','Y','N','Invoice Identifier','Invoice','C_Invoice_ID',0,TO_DATE('2012-04-30 18:23:46','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-30 18:23:46','YYYY-MM-DD HH24:MI:SS'),0)
;

-- Apr 30, 2012 6:23:47 PM ART
--Add Payment Header
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000253 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Apr 30, 2012 6:23:47 PM ART
--Add Payment Header
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000254,3000010,'LAR',0,'N','N','N','The Bank Account identifies an account at this Bank.','N',10,'N',19,'N',836,'N','Y','N','Account at the Bank','Bank Account','C_BankAccount_ID',0,TO_DATE('2012-04-30 18:23:47','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-30 18:23:47','YYYY-MM-DD HH24:MI:SS'),0)
;

-- Apr 30, 2012 6:23:47 PM ART
--Add Payment Header
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000254 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Apr 30, 2012 6:25:11 PM ART
--Add Payment Header
UPDATE AD_Element SET ColumnName='Detail', Name='Detail', PrintName='Detail',Updated=TO_DATE('2012-04-30 18:25:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Element_ID=3000071
;

-- Apr 30, 2012 6:25:11 PM ART
--Add Payment Header
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000071
;

-- Apr 30, 2012 6:25:11 PM ART
--Add Payment Header
UPDATE AD_Column SET ColumnName='Detail', Name='Detail', Description=NULL, Help=NULL WHERE AD_Element_ID=3000071
;

-- Apr 30, 2012 6:25:11 PM ART
--Add Payment Header
UPDATE AD_Process_Para SET ColumnName='Detail', Name='Detail', Description=NULL, Help=NULL, AD_Element_ID=3000071 WHERE UPPER(ColumnName)='DETAIL' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Apr 30, 2012 6:25:11 PM ART
--Add Payment Header
UPDATE AD_Process_Para SET ColumnName='Detail', Name='Detail', Description=NULL, Help=NULL WHERE AD_Element_ID=3000071 AND IsCentrallyMaintained='Y'
;

-- Apr 30, 2012 6:25:11 PM ART
--Add Payment Header
UPDATE AD_Field SET Name='Detail', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000071) AND IsCentrallyMaintained='Y'
;

-- Apr 30, 2012 6:25:11 PM ART
--Add Payment Header
UPDATE AD_PrintFormatItem pi SET PrintName='Detail', Name='Detail' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000071)
;

-- Apr 30, 2012 6:27:43 PM ART
--Add Payment Header
UPDATE AD_Element SET ColumnName='ProcessIt', Name='ProcessIt', PrintName='ProcessIt',Updated=TO_DATE('2012-04-30 18:27:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Element_ID=3000069
;

-- Apr 30, 2012 6:27:43 PM ART
--Add Payment Header
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000069
;

-- Apr 30, 2012 6:27:43 PM ART
--Add Payment Header
UPDATE AD_Column SET ColumnName='ProcessIt', Name='ProcessIt', Description=NULL, Help=NULL WHERE AD_Element_ID=3000069
;

-- Apr 30, 2012 6:27:43 PM ART
--Add Payment Header
UPDATE AD_Process_Para SET ColumnName='ProcessIt', Name='ProcessIt', Description=NULL, Help=NULL, AD_Element_ID=3000069 WHERE UPPER(ColumnName)='PROCESSIT' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Apr 30, 2012 6:27:43 PM ART
--Add Payment Header
UPDATE AD_Process_Para SET ColumnName='ProcessIt', Name='ProcessIt', Description=NULL, Help=NULL WHERE AD_Element_ID=3000069 AND IsCentrallyMaintained='Y'
;

-- Apr 30, 2012 6:27:43 PM ART
--Add Payment Header
UPDATE AD_Field SET Name='ProcessIt', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000069) AND IsCentrallyMaintained='Y'
;

-- Apr 30, 2012 6:27:43 PM ART
--Add Payment Header
UPDATE AD_PrintFormatItem pi SET PrintName='ProcessIt', Name='ProcessIt' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000069)
;

-- Apr 30, 2012 6:28:20 PM ART
--Add Payment Header
UPDATE AD_Element SET ColumnName='SearchPayments', Name='SearchPayments', PrintName='SearchPayments',Updated=TO_DATE('2012-04-30 18:28:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Element_ID=3000070
;

-- Apr 30, 2012 6:28:20 PM ART
--Add Payment Header
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000070
;

-- Apr 30, 2012 6:28:20 PM ART
--Add Payment Header
UPDATE AD_Column SET ColumnName='SearchPayments', Name='SearchPayments', Description=NULL, Help=NULL WHERE AD_Element_ID=3000070
;

-- Apr 30, 2012 6:28:20 PM ART
--Add Payment Header
UPDATE AD_Process_Para SET ColumnName='SearchPayments', Name='SearchPayments', Description=NULL, Help=NULL, AD_Element_ID=3000070 WHERE UPPER(ColumnName)='SEARCHPAYMENTS' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Apr 30, 2012 6:28:20 PM ART
--Add Payment Header
UPDATE AD_Process_Para SET ColumnName='SearchPayments', Name='SearchPayments', Description=NULL, Help=NULL WHERE AD_Element_ID=3000070 AND IsCentrallyMaintained='Y'
;

-- Apr 30, 2012 6:28:20 PM ART
--Add Payment Header
UPDATE AD_Field SET Name='SearchPayments', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000070) AND IsCentrallyMaintained='Y'
;

-- Apr 30, 2012 6:28:20 PM ART
--Add Payment Header
UPDATE AD_PrintFormatItem pi SET PrintName='SearchPayments', Name='SearchPayments' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000070)
;

--Alter C_Payment to integrate with Payment Header
ALTER TABLE C_Payment
ADD COLUMN LAR_PaymentHeader_ID numeric(10,0),
ADD COLUMN LAR_PaymentSource_ID numeric (10,0),
ADD COLUMN Allocation 			Char(1) NULL DEFAULT 'Y'::bpchar,
ADD COLUMN isondrawer 			Char(1) NULL DEFAULT 'Y'::bpchar;

--Agregamos restricción para el ID de documento fuente
ALTER TABLE C_Payment 
	ADD CONSTRAINT FKC_PaymentSource 
	FOREIGN KEY (LAR_PaymentSource_ID) 
	REFERENCES C_Payment;

-- Agregamos constraint en C_Payment para que los ID de LAR_PaymentHeader_ID coincidan con los de la tabla LAR_PaymentHeader
ALTER TABLE C_Payment 
ADD CONSTRAINT FK_CPayment_LARPaymentH 
	FOREIGN KEY (LAR_PaymentHeader_ID) REFERENCES LAR_PaymentHeader;

-- May 1, 2012 8:22:09 AM ART
--Alter C_Payment to integrate with Payment Header
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000258,335,'LAR',0,'N','N','N','N',10,'N',19,'N',3000068,'N','Y','N','LAR_PaymentHeader','LAR_PaymentHeader_ID',0,TO_DATE('2012-05-01 08:22:08','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-05-01 08:22:08','YYYY-MM-DD HH24:MI:SS'),0)
;

-- May 1, 2012 8:22:09 AM ART
--Alter C_Payment to integrate with Payment Header
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000258 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- May 1, 2012 8:22:09 AM ART
--Alter C_Payment to integrate with Payment Header
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000074,'lar_paymentsource_id','LAR','lar_paymentsource_id','lar_paymentsource_id',0,TO_DATE('2012-05-01 08:22:09','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-05-01 08:22:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,0)
;

-- May 1, 2012 8:22:09 AM ART
--Alter C_Payment to integrate with Payment Header
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,PO_Name,Name,Description,PrintName,PO_PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.PO_Name,t.Name,t.Description,t.PrintName,t.PO_PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000074 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- May 1, 2012 8:22:10 AM ART
--Alter C_Payment to integrate with Payment Header
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000259,335,'LAR',0,'N','N','N','N',10,'N',19,'N',3000074,'N','Y','N','lar_paymentsource_id','lar_paymentsource_id',0,TO_DATE('2012-05-01 08:22:09','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-05-01 08:22:09','YYYY-MM-DD HH24:MI:SS'),0)
;

-- May 1, 2012 8:22:10 AM ART
--Alter C_Payment to integrate with Payment Header
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000259 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- May 1, 2012 8:22:10 AM ART
--Alter C_Payment to integrate with Payment Header
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000075,'allocation','LAR','allocation','allocation',0,TO_DATE('2012-05-01 08:22:10','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-05-01 08:22:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,0)
;

-- May 1, 2012 8:22:10 AM ART
--Alter C_Payment to integrate with Payment Header
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,PO_Name,Name,Description,PrintName,PO_PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.PO_Name,t.Name,t.Description,t.PrintName,t.PO_PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000075 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- May 1, 2012 8:22:10 AM ART
--Alter C_Payment to integrate with Payment Header
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000260,335,'LAR',0,'N','N','N','N',1,'N',20,'N',3000075,'N','Y','N','allocation','allocation',0,TO_DATE('2012-05-01 08:22:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-05-01 08:22:10','YYYY-MM-DD HH24:MI:SS'),0)
;

-- May 1, 2012 8:22:10 AM ART
--Alter C_Payment to integrate with Payment Header
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000260 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- May 1, 2012 8:22:11 AM ART
--Alter C_Payment to integrate with Payment Header
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000076,'isondrawer','LAR','isondrawer','isondrawer',0,TO_DATE('2012-05-01 08:22:10','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-05-01 08:22:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,0)
;

-- May 1, 2012 8:22:11 AM ART
--Alter C_Payment to integrate with Payment Header
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,PO_Name,Name,Description,PrintName,PO_PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.PO_Name,t.Name,t.Description,t.PrintName,t.PO_PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000076 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- May 1, 2012 8:22:11 AM ART
--Alter C_Payment to integrate with Payment Header
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000261,335,'LAR',0,'N','N','N','N',1,'N',20,'N',3000076,'N','Y','N','isondrawer','isondrawer',0,TO_DATE('2012-05-01 08:22:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-05-01 08:22:10','YYYY-MM-DD HH24:MI:SS'),0)
;

-- May 1, 2012 8:22:11 AM ART
--Alter C_Payment to integrate with Payment Header
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000261 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- May 1, 2012 8:22:51 AM ART
--Alter C_Payment to integrate with Payment Header
UPDATE AD_Element SET ColumnName='Allocation', Name='Allocation', PrintName='Allocation',Updated=TO_DATE('2012-05-01 08:22:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Element_ID=3000075
;

-- May 1, 2012 8:22:51 AM ART
--Alter C_Payment to integrate with Payment Header
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000075
;

-- May 1, 2012 8:22:51 AM ART
--Alter C_Payment to integrate with Payment Header
UPDATE AD_Column SET ColumnName='Allocation', Name='Allocation', Description=NULL, Help=NULL WHERE AD_Element_ID=3000075
;

-- May 1, 2012 8:22:52 AM ART
--Alter C_Payment to integrate with Payment Header
UPDATE AD_Process_Para SET ColumnName='Allocation', Name='Allocation', Description=NULL, Help=NULL, AD_Element_ID=3000075 WHERE UPPER(ColumnName)='ALLOCATION' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- May 1, 2012 8:22:52 AM ART
--Alter C_Payment to integrate with Payment Header
UPDATE AD_Process_Para SET ColumnName='Allocation', Name='Allocation', Description=NULL, Help=NULL WHERE AD_Element_ID=3000075 AND IsCentrallyMaintained='Y'
;

-- May 1, 2012 8:22:52 AM ART
--Alter C_Payment to integrate with Payment Header
UPDATE AD_Field SET Name='Allocation', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000075) AND IsCentrallyMaintained='Y'
;

-- May 1, 2012 8:22:52 AM ART
--Alter C_Payment to integrate with Payment Header
UPDATE AD_PrintFormatItem pi SET PrintName='Allocation', Name='Allocation' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000075)
;

-- May 1, 2012 8:23:44 AM ART
--Alter C_Payment to integrate with Payment Header
UPDATE AD_Element SET ColumnName='IsOnDrawer', Name='IsOnDrawer', PrintName='IsOnDrawer',Updated=TO_DATE('2012-05-01 08:23:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Element_ID=3000076
;

-- May 1, 2012 8:23:44 AM ART
--Alter C_Payment to integrate with Payment Header
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000076
;

-- May 1, 2012 8:23:44 AM ART
--Alter C_Payment to integrate with Payment Header
UPDATE AD_Column SET ColumnName='IsOnDrawer', Name='IsOnDrawer', Description=NULL, Help=NULL WHERE AD_Element_ID=3000076
;

-- May 1, 2012 8:23:44 AM ART
--Alter C_Payment to integrate with Payment Header
UPDATE AD_Process_Para SET ColumnName='IsOnDrawer', Name='IsOnDrawer', Description=NULL, Help=NULL, AD_Element_ID=3000076 WHERE UPPER(ColumnName)='ISONDRAWER' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- May 1, 2012 8:23:44 AM ART
--Alter C_Payment to integrate with Payment Header
UPDATE AD_Process_Para SET ColumnName='IsOnDrawer', Name='IsOnDrawer', Description=NULL, Help=NULL WHERE AD_Element_ID=3000076 AND IsCentrallyMaintained='Y'
;

-- May 1, 2012 8:23:44 AM ART
--Alter C_Payment to integrate with Payment Header
UPDATE AD_Field SET Name='IsOnDrawer', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000076) AND IsCentrallyMaintained='Y'
;

-- May 1, 2012 8:23:44 AM ART
--Alter C_Payment to integrate with Payment Header
UPDATE AD_PrintFormatItem pi SET PrintName='IsOnDrawer', Name='IsOnDrawer' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000076)
;

-- May 1, 2012 8:24:31 AM ART
--Alter C_Payment to integrate with Payment Header
UPDATE AD_Element SET ColumnName='LAR_PaymentSource_ID', Name='LAR_PaymentSource_ID', PrintName='LAR_PaymentSource_ID',Updated=TO_DATE('2012-05-01 08:24:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Element_ID=3000074
;

-- May 1, 2012 8:24:31 AM ART
--Alter C_Payment to integrate with Payment Header
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000074
;

-- May 1, 2012 8:24:31 AM ART
--Alter C_Payment to integrate with Payment Header
UPDATE AD_Column SET ColumnName='LAR_PaymentSource_ID', Name='LAR_PaymentSource_ID', Description=NULL, Help=NULL WHERE AD_Element_ID=3000074
;

-- May 1, 2012 8:24:31 AM ART
--Alter C_Payment to integrate with Payment Header
UPDATE AD_Process_Para SET ColumnName='LAR_PaymentSource_ID', Name='LAR_PaymentSource_ID', Description=NULL, Help=NULL, AD_Element_ID=3000074 WHERE UPPER(ColumnName)='LAR_PAYMENTSOURCE_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- May 1, 2012 8:24:31 AM ART
--Alter C_Payment to integrate with Payment Header
UPDATE AD_Process_Para SET ColumnName='LAR_PaymentSource_ID', Name='LAR_PaymentSource_ID', Description=NULL, Help=NULL WHERE AD_Element_ID=3000074 AND IsCentrallyMaintained='Y'
;

-- May 1, 2012 8:24:31 AM ART
--Alter C_Payment to integrate with Payment Header
UPDATE AD_Field SET Name='LAR_PaymentSource_ID', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000074) AND IsCentrallyMaintained='Y'
;

-- May 1, 2012 8:24:32 AM ART
--Alter C_Payment to integrate with Payment Header
UPDATE AD_PrintFormatItem pi SET PrintName='LAR_PaymentSource_ID', Name='LAR_PaymentSource_ID' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000074)
;

-- May 1, 2012 8:39:58 AM ART
--Add Receipts window 
INSERT INTO AD_Window (AD_Window_ID,WindowType,IsSOTrx,IsDefault,IsBetaFunctionality,WinHeight,WinWidth,EntityType,Name,Description,IsActive,Created,UpdatedBy,CreatedBy,Updated,AD_Org_ID,AD_Client_ID,Processing) VALUES (3000009,'M','Y','N','N',0,0,'LAR','Receipts','Customers Receipts Registration','Y',TO_DATE('2012-05-01 08:39:52','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 08:39:52','YYYY-MM-DD HH24:MI:SS'),0,0,'N')
;

-- May 1, 2012 8:39:58 AM ART
--Add Receipts window 
INSERT INTO AD_Window_Trl (AD_Language,AD_Window_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Window_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Window t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Window_ID=3000009 AND NOT EXISTS (SELECT * FROM AD_Window_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Window_ID=t.AD_Window_ID)
;

-- May 1, 2012 8:42:17 AM ART
--Add Receipts window 
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,WhereClause,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('Y',3000009,10,'N','N',3000010,3000012,'N','N','N','IsReceipt=''Y'' AND C_BPartner_ID is not null','N',0,'Y','N','LAR','Receipt',0,0,TO_DATE('2012-05-01 08:42:17','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2012-05-01 08:42:17','YYYY-MM-DD HH24:MI:SS'),'Y','N',0)
;

-- May 1, 2012 8:42:17 AM ART
--Add Receipts window 
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000012 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- May 1, 2012 8:42:29 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000265,1,'Y','N','N',3000249,'N','Y',3000012,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',0,0,'Y',TO_DATE('2012-05-01 08:42:29','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 08:42:29','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 8:42:29 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000265 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 8:42:29 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000266,10,'Y','N','N',3000254,'N','Y',3000012,'N','The Bank Account identifies an account at this Bank.','LAR','Account at the Bank','Bank Account',0,0,'Y',TO_DATE('2012-05-01 08:42:29','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 08:42:29','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 8:42:29 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000266 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 8:42:30 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000267,10,'Y','N','N',3000239,'N','Y',3000012,'N','A Business Partner is anyone with whom you transact.  This can include Vendor, Customer, Employee or Salesperson','LAR','Identifies a Business Partner','Business Partner ',0,0,'Y',TO_DATE('2012-05-01 08:42:29','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 08:42:29','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 8:42:30 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000267 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 8:42:30 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000268,10,'Y','N','N',3000244,'N','Y',3000012,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',0,0,'Y',TO_DATE('2012-05-01 08:42:30','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 08:42:30','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 8:42:30 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000268 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 8:42:30 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000269,1,'Y','N','N',3000250,'N','Y',3000012,'N','LAR','Detail',0,0,'Y',TO_DATE('2012-05-01 08:42:30','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 08:42:30','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 8:42:30 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000269 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 8:42:31 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000270,50,'Y','N','N',3000237,'N','Y',3000012,'N','The document number is usually automatically generated by the system and determined by the document type of the document. If the document is not saved, the preliminary number is displayed in "<>".

If the document type of your document has no automatic document sequence defined, the field is empty if you create a new document. This is for documents which usually have an external number (like vendor invoice).  If you leave the field empty, the system will generate a document number for you. The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).','LAR','Document sequence number of the document','Document No',0,0,'Y',TO_DATE('2012-05-01 08:42:30','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 08:42:30','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 8:42:31 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000270 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 8:42:31 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000271,2,'Y','N','N',3000240,'N','Y',3000012,'N','The Document Status indicates the status of a document at this time.  If you want to change the document status, use the Document Action field','LAR','The current status of the document','Document Status',0,0,'Y',TO_DATE('2012-05-01 08:42:31','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 08:42:31','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 8:42:31 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000271 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 8:42:31 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000272,10,'Y','N','N',3000236,'N','Y',3000012,'N','The Document Type determines document sequence and processing rules','LAR','Document type or rules','Document Type',0,0,'Y',TO_DATE('2012-05-01 08:42:31','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 08:42:31','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 8:42:31 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000272 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 8:42:32 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000273,10,'Y','N','N',3000253,'N','Y',3000012,'N','The Invoice Document.','LAR','Invoice Identifier','Invoice',0,0,'Y',TO_DATE('2012-05-01 08:42:31','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 08:42:31','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 8:42:32 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000273 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 8:42:32 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000274,10,'N','N','N',3000235,'N','Y',3000012,'N','LAR','LAR_PaymentHeader',0,0,'Y',TO_DATE('2012-05-01 08:42:32','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 08:42:32','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 8:42:32 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000274 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 8:42:32 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000275,10,'Y','N','N',3000243,'N','Y',3000012,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',0,0,'Y',TO_DATE('2012-05-01 08:42:32','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 08:42:32','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 8:42:32 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000275 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 8:42:32 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000276,1,'Y','N','N',3000252,'N','Y',3000012,'N','The Processed checkbox indicates that a document has been processed.','LAR','The document has been processed','Processed',0,0,'Y',TO_DATE('2012-05-01 08:42:32','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 08:42:32','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 8:42:32 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000276 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 8:42:33 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000277,1,'Y','N','N',3000241,'N','Y',3000012,'N','LAR','ProcessIt',0,0,'Y',TO_DATE('2012-05-01 08:42:32','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 08:42:32','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 8:42:33 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000277 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 8:42:33 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000278,1,'Y','N','N',3000251,'N','Y',3000012,'N','LAR','This is a sales transaction (receipt)','Receipt',0,0,'Y',TO_DATE('2012-05-01 08:42:33','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 08:42:33','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 8:42:33 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000278 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 8:42:33 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000279,1,'Y','N','N',3000242,'N','Y',3000012,'N','LAR','SearchPayments',0,0,'Y',TO_DATE('2012-05-01 08:42:33','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 08:42:33','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 8:42:33 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000279 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 8:42:37 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000280,29,'Y','N','N',3000238,'N','Y',3000012,'N','The Transaction Date indicates the date of the transaction.','LAR','Transaction Date','Transaction Date',0,0,'Y',TO_DATE('2012-05-01 08:42:33','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 08:42:33','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 8:42:37 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000280 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 8:47:16 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000266
;

-- May 1, 2012 8:47:16 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000273
;

-- May 1, 2012 8:47:16 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000279
;

-- May 1, 2012 8:47:16 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3000268
;

-- May 1, 2012 8:47:17 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3000275
;

-- May 1, 2012 8:47:17 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3000272
;

-- May 1, 2012 8:47:17 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3000278
;

-- May 1, 2012 8:47:17 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3000270
;

-- May 1, 2012 8:47:17 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3000265
;

-- May 1, 2012 8:47:17 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3000280
;

-- May 1, 2012 8:47:17 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3000267
;

-- May 1, 2012 8:47:17 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3000271
;

-- May 1, 2012 8:47:17 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3000277
;

-- May 1, 2012 8:47:17 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3000276
;

-- May 1, 2012 8:47:17 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3000269
;

-- May 1, 2012 8:47:52 AM ART
--Add Receipts window 
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2012-05-01 08:47:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000275
;

-- May 1, 2012 8:51:23 AM ART
--Add Receipts window 
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,Updated,UpdatedBy,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('C_DocType.DocBaseType IN (''ARR'')','S',3000001,'LAR','C_DocType Receipts',0,TO_DATE('2012-05-01 08:51:23','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',0,TO_DATE('2012-05-01 08:51:23','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 8:55:47 AM ART
--Add Receipts window 
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,Updated,UpdatedBy,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('C_DocType.DocBaseType IN (''APP'')','S',3000002,'LAR','C_DocType Payments',0,TO_DATE('2012-05-01 08:55:46','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',0,TO_DATE('2012-05-01 08:55:46','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 8:59:53 AM ART
--Add Receipts window 
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,Updated,UpdatedBy,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('AD_Ref_List.Value IN (''CO'',''RC'',''VO'')','S',3000003,'LAR','List - DocAction - CO,RC,VO',0,TO_DATE('2012-05-01 08:59:48','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',0,TO_DATE('2012-05-01 08:59:48','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:05:57 AM ART
--Add Receipts window 
UPDATE AD_Field SET AD_Reference_ID=19, AD_Val_Rule_ID=3000001,Updated=TO_DATE('2012-05-01 09:05:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000272
;

-- May 1, 2012 9:06:56 AM ART
--Add Receipts window 
UPDATE AD_Field SET IsSameLine='Y', DefaultValue='Y',Updated=TO_DATE('2012-05-01 09:06:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000278
;

-- May 1, 2012 9:09:02 AM ART
--Add Receipts window 
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2012-05-01 09:09:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000265
;

-- May 1, 2012 9:10:36 AM ART
--Add Receipts window 
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2012-05-01 09:10:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000277
;

-- May 1, 2012 9:10:49 AM ART
--Add Receipts window 
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Procesar Cabecera',Updated=TO_DATE('2012-05-01 09:10:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000277 AND AD_Language='es_AR'
;

-- May 1, 2012 9:11:00 AM ART
--Add Receipts window 
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2012-05-01 09:11:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000277
;

-- May 1, 2012 9:18:34 AM ART
--Add Receipts window 
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,AD_Column_ID,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('Y',3000009,20,'N','N',335,3000013,'N','N',3000258,'N','N',0,'Y','N','LAR','Receipt Detail',0,0,TO_DATE('2012-05-01 09:18:29','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2012-05-01 09:18:29','YYYY-MM-DD HH24:MI:SS'),'Y','N',0)
;

-- May 1, 2012 9:18:34 AM ART
--Add Receipts window 
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000013 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- May 1, 2012 9:22:55 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000281,10,'N','N','N',13705,'N',0,'Y',3000013,'N','LAR','Referenced Payment','N',0,0,'Y',TO_DATE('2012-05-01 09:22:50','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:22:50','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:22:55 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000281 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:22:55 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000282,1,'N','N','N',8982,'N',0,'Y',3000013,'N','The Credit Card Verification Code was matched','LAR','Credit Card Verification Code Match','CVV Match',0,0,'Y',TO_DATE('2012-05-01 09:22:55','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:22:55','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:22:55 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000282 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:22:56 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000283,20,'N','N','N',59039,'N',0,'Y',3000013,'N','The ProcessedOn Date+Time save the exact moment (nanoseconds precision if allowed by the DB) when a document has been processed.','LAR','The date+time (expressed in decimal format) when the document has been processed','Processed On',0,0,'Y',TO_DATE('2012-05-01 09:22:55','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:22:55','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:22:56 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000283 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:22:56 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000284,11,'N','N','N',8980,'N',0,'Y',3000013,'N','The Charge Amount indicates the amount for an additional charge.','LAR','Charge Amount','Charge amount',0,0,'Y',TO_DATE('2012-05-01 09:22:56','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:22:56','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:22:56 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000284 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:22:56 AM ART
--Add Receipts window 
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES (1,'N',3000285,14,'N','N','N',5043,'N',0,'Y',3000013,'N','The Payment is a unique identifier of this payment.','LAR','Payment identifier','Payment',0,0,'Y',TO_DATE('2012-05-01 09:22:56','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:22:56','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:22:56 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000285 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:22:57 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000286,20,'N','N','N',5041,'N',0,'Y',3000013,'Y','The Info indicates any response information returned from the Credit Card Company.',101,'@IsOnline@=Y','LAR','Response info','Info',0,0,'Y',TO_DATE('2012-05-01 09:22:56','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:22:56','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:22:57 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000286 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:22:58 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000287,1,'N','N','N',3878,'N',0,'Y',3000013,'N','The Processed checkbox indicates that a document has been processed.','LAR','The document has been processed','Processed','N',0,0,'Y',TO_DATE('2012-05-01 09:22:57','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:22:57','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:22:58 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000287 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:22:58 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000288,14,'N','N','N',5300,'N',0,'Y',3000013,'N','Electronic Fund Transfer Payment Batch.','LAR','Payment batch for EFT','Payment Batch',0,0,'Y',TO_DATE('2012-05-01 09:22:58','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:22:58','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:22:58 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000288 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:22:58 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000289,1,'N','N','N',3879,'N',0,'Y',3000013,'N','LAR','Payment is reconciled with bank statement','Reconciled','N',0,0,'Y',TO_DATE('2012-05-01 09:22:58','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:22:58','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:22:58 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000289 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:22:59 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000290,14,'N','N','N',5298,'N',0,'Y',3000013,'N','The Partner Bank Account identifies the bank account to be used for this Business Partner','LAR','Bank Account of the Business Partner','Partner Bank Account',0,0,'Y',TO_DATE('2012-05-01 09:22:58','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:22:58','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:22:59 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000290 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:22:59 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000291,22,'N','N','N',55309,'N',0,'Y',3000013,'N','LAR','ID of document reversal','Reversal ID',0,0,'Y',TO_DATE('2012-05-01 09:22:59','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:22:59','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:22:59 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000291 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:22:59 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000292,60,'N','N','N',8985,'N',0,'Y',3000013,'Y','Swiped information for Credit Card Presence Transactions','LAR','Track 1 and 2 of the Credit Card','Swipe',0,0,'Y',TO_DATE('2012-05-01 09:22:59','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:22:59','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:22:59 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000292 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:00 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000293,20,'N','N','N',8983,'N',0,'Y',3000013,'N','The Payment Reference indicates the reference returned from the Credit Card Company for a payment','LAR','Payment Reference Delayed Capture','Reference (DC)',0,0,'Y',TO_DATE('2012-05-01 09:22:59','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:22:59','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:00 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000293 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:00 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000294,20,'N','N','N',8981,'N',0,'Y',3000013,'N','The Authorization Code indicates the code returned from the electronic transmission.','LAR','Authorization Code Delayed Capture returned','Authorization Code (DC)',0,0,'Y',TO_DATE('2012-05-01 09:23:00','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:00','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:00 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000294 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:00 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000295,23,'N','N','N',3877,'N',0,'Y',3000013,'N','LAR','Process Now',0,0,'Y',TO_DATE('2012-05-01 09:23:00','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:00','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:00 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000295 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:01 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000296,1,'N','N','N',8979,'N',0,'Y',3000013,'N','Delayed Capture is required, if you ship products.  The first credit card transaction is the Authorization, the second is the actual transaction after the shipment of the product.','LAR','Charge after Shipment','Delayed Capture',0,0,'Y',TO_DATE('2012-05-01 09:23:00','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:00','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:01 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000296 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:01 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000297,1,'N','N','N',3864,'N',0,'Y',3000013,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',0,0,'Y',TO_DATE('2012-05-01 09:23:01','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:01','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:01 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000297 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:01 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000298,14,'Y','N','N',3862,'N',10,'Y',3000013,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',0,0,'Y',TO_DATE('2012-05-01 09:23:01','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:01','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:01 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000298 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:02 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000299,14,'Y','Y','N',3863,'N',20,'Y',3000013,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',0,0,'Y',TO_DATE('2012-05-01 09:23:01','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:01','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:02 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000299 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:02 AM ART
--Add Receipts window 
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES (-1,'N',3000300,20,'Y','N','N',5401,'N',30,'Y',3000013,'N','The document number is usually automatically generated by the system and determined by the document type of the document. If the document is not saved, the preliminary number is displayed in "<>".

If the document type of your document has no automatic document sequence defined, the field is empty if you create a new document. This is for documents which usually have an external number (like vendor invoice).  If you leave the field empty, the system will generate a document number for you. The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).','LAR','Document sequence number of the document','Document No','N',0,0,'Y',TO_DATE('2012-05-01 09:23:02','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:02','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:02 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000300 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:02 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000301,14,'Y','Y','N',3880,'N',40,'Y',3000013,'N','The Bank Account identifies an account at this Bank.','@TenderType@ !''X''','LAR','Account at the Bank','Bank Account',0,0,'Y',TO_DATE('2012-05-01 09:23:02','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:02','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:02 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000301 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:06 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000302,14,'Y','N','N',5302,'N',50,'Y',3000013,'N','The Document Type determines document sequence and processing rules','LAR','Document type or rules','Document Type',0,0,'Y',TO_DATE('2012-05-01 09:23:02','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:02','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:06 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000302 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:06 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000303,1,'Y','Y','N',6216,'N',60,'Y',3000013,'Y','LAR','This is a sales transaction (receipt)','Receipt',0,0,'Y',TO_DATE('2012-05-01 09:23:06','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:06','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:06 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000303 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:06 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000304,14,'Y','N','N',5399,'N',70,'Y',3000013,'N','The Transaction Date indicates the date of the transaction.','LAR','Transaction Date','Transaction Date',0,0,'Y',TO_DATE('2012-05-01 09:23:06','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:06','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:06 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000304 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:07 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000305,14,'Y','Y','N',12128,'N',80,'Y',3000013,'N','The Accounting Date indicates the date to be used on the General Ledger account entries generated from this document. It is also used for any currency conversion.','LAR','Accounting Date','Account Date',0,0,'Y',TO_DATE('2012-05-01 09:23:06','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:06','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:07 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000305 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:07 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000306,60,'Y','N','N',12127,'N',90,'Y',3000013,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',0,0,'Y',TO_DATE('2012-05-01 09:23:07','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:07','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:07 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000306 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:07 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000307,26,'Y','N','N',5398,'N',100,'Y',3000013,'N','A Business Partner is anyone with whom you transact.  This can include Vendor, Customer, Employee or Salesperson',104,'LAR','Identifies a Business Partner','Business Partner ',0,0,'Y',TO_DATE('2012-05-01 09:23:07','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:07','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:07 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000307 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:08 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000308,26,'Y','Y','N',5355,'N',110,'Y',3000013,'N','The Invoice Document.','LAR','Invoice Identifier','Invoice',0,0,'Y',TO_DATE('2012-05-01 09:23:07','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:07','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:08 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000308 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:08 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000309,26,'Y','N','N',12925,'N',120,'Y',3000013,'N','The Order is a control document.  The  Order is complete when the quantity ordered is the same as the quantity shipped and invoiced.  When you close an order, unshipped (backordered) quantities are cancelled.','LAR','Order','Order',0,0,'Y',TO_DATE('2012-05-01 09:23:08','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:08','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:08 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000309 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:09 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000310,14,'Y','Y','N',8554,'N',130,'Y',3000013,'N','A Project allows you to track and control internal or external activities.','@$Element_PJ@=Y & @C_Invoice_ID@=0 | @C_Invoice_ID@=''''','LAR','Financial Project','Project',0,0,'Y',TO_DATE('2012-05-01 09:23:08','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:08','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:09 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000310 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:09 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000311,14,'Y','N','N',8984,'N',140,'Y',3000013,'N','The Charge indicates a type of Charge (Handling, Shipping, Restocking)',104,'LAR','Additional document charges','Charge',0,0,'Y',TO_DATE('2012-05-01 09:23:09','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:09','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:09 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000311 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:09 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000312,1,'Y','Y','N',13045,'N',150,'Y',3000013,'Y','Payments not allocated to an invoice with a charge are posted to Unallocated Payments. When setting this flag, the payment is posted to the Customer or Vendor Prepayment account.',104,'LAR','The Payment/Receipt is a Prepayment','Prepayment',0,0,'Y',TO_DATE('2012-05-01 09:23:09','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:09','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:09 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000312 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:09 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000313,14,'Y','N','N',9566,'N',160,'Y',3000013,'N','Activities indicate tasks that are performed and used to utilize Activity based Costing','@$Element_AY@=Y','LAR','Business Activity','Activity',0,0,'Y',TO_DATE('2012-05-01 09:23:09','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:09','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:09 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000313 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:10 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000314,14,'Y','N','N',9564,'N',170,'Y',3000013,'N','The Campaign defines a unique marketing program.  Projects can be associated with a pre defined Marketing Campaign.  You can then report based on a specific Campaign.','@$Element_MC@=Y','LAR','Marketing Campaign','Campaign',0,0,'Y',TO_DATE('2012-05-01 09:23:09','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:09','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:10 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000314 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:10 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000315,14,'Y','N','N',9565,'N',180,'Y',3000013,'N','The organization which performs or initiates this transaction (for another organization).  The owning Organization may not be the transaction organization in a service bureau environment, with centralized services, and inter-organization transactions.','@$Element_OT@=Y','LAR','Performing or initiating organization','Trx Organization',0,0,'Y',TO_DATE('2012-05-01 09:23:10','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:10','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:10 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000315 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:10 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000316,14,'Y','N','N',9563,'N',190,'Y',3000013,'N','The user defined element displays the optional elements that have been defined for this account combination.','@$Element_U1@=Y','LAR','User defined list element #1','User List 1',0,0,'Y',TO_DATE('2012-05-01 09:23:10','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:10','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:10 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000316 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:11 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000317,14,'Y','Y','N',9567,'N',200,'Y',3000013,'N','The user defined element displays the optional elements that have been defined for this account combination.','@$Element_U2@=Y','LAR','User defined list element #2','User List 2',0,0,'Y',TO_DATE('2012-05-01 09:23:10','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:10','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:11 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000317 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:11 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000318,26,'Y','N','N',5303,'N',210,'Y',3000013,'N','Indicates the amount this payment is for.  The payment amount can be for single or multiple invoices or a partial payment for an invoice.',103,'LAR','Amount being paid','Payment amount',0,0,'Y',TO_DATE('2012-05-01 09:23:11','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:11','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:11 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000318 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:11 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000319,14,'Y','Y','N',5299,'N',220,'Y',3000013,'N','Indicates the Currency to be used when processing or reporting on this record','LAR','The Currency for this record','Currency',0,0,'Y',TO_DATE('2012-05-01 09:23:11','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:11','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:11 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000319 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:12 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000320,14,'Y','N','N',10265,'N',230,'Y',3000013,'N','The Currency Conversion Rate Type lets you define different type of rates, e.g. Spot, Corporate and/or Sell/Buy rates.','@C_Currency_ID@!@$C_Currency_ID@','LAR','Currency Conversion Rate Type','Currency Type',0,0,'Y',TO_DATE('2012-05-01 09:23:11','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:11','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:12 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000320 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:12 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000321,26,'Y','N','N',5301,'N',240,'Y',3000013,'N','The Discount Amount indicates the discount amount for a document or line.','@C_Invoice_ID@^''''','LAR','Calculated amount of discount','Discount Amount',0,0,'Y',TO_DATE('2012-05-01 09:23:12','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:12','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:12 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000321 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:12 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000322,26,'Y','Y','N',6475,'N',250,'Y',3000013,'N','The Write Off Amount indicates the amount to be written off as uncollectible.','@C_Invoice_ID@^''''','LAR','Amount to write-off','Write-off Amount',0,0,'Y',TO_DATE('2012-05-01 09:23:12','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:12','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:12 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000322 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:13 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000323,1,'Y','N','N',7035,'N',260,'Y',3000013,'N','Overpayments (negative) are unallocated amounts and allow you to receive money for more than the particular invoice. 
Underpayments (positive) is a partial payment for the invoice. You do not write off the unpaid amount.','@C_Invoice_ID@^''''','LAR','Over-Payment (unallocated) or Under-Payment (partial payment)','Over/Under Payment',0,0,'Y',TO_DATE('2012-05-01 09:23:12','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:12','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:13 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000323 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:13 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000324,26,'Y','Y','N',7034,'N',270,'Y',3000013,'N','Overpayments (negative) are unallocated amounts and allow you to receive money for more than the particular invoice. 
Underpayments (positive) is a partial payment for the invoice. You do not write off the unpaid amount.','@IsOverUnderPayment@=Y & @C_Invoice_ID@^''''','LAR','Over-Payment (unallocated) or Under-Payment (partial payment) Amount','Over/Under Payment',0,0,'Y',TO_DATE('2012-05-01 09:23:13','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:13','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:13 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000324 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:13 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000325,20,'Y','N','N',3000103,'N',280,'Y',3000013,'N','LAR','Withholding Amount',0,0,'Y',TO_DATE('2012-05-01 09:23:13','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:13','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:13 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000325 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:14 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000326,20,'Y','Y','N',3000104,'N',290,'Y',3000013,'N','LAR','WithholdingPercent',0,0,'Y',TO_DATE('2012-05-01 09:23:13','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:13','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:14 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000326 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:14 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000327,14,'Y','N','N',5046,'N',300,'Y',3000013,'N','The Tender Type indicates the method of payment (ACH or Direct Deposit, Credit Card, Check, Direct Debit)',125,'LAR','Method of Payment','Tender type',0,0,'Y',TO_DATE('2012-05-01 09:23:14','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:14','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:14 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000327 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:14 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000328,1,'Y','Y','N',5495,'N',310,'Y',3000013,'N','The Online Access check box indicates if the application can be accessed via the web. ','LAR','Can be accessed online ','Online Access',0,0,'Y',TO_DATE('2012-05-01 09:23:14','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:14','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:14 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000328 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:15 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000329,20,'Y','N','N',3873,'N',320,'Y',3000013,'N','The Bank Routing Number (ABA Number) identifies a legal Bank.  It is used in routing checks and electronic transactions.','@TenderType@=A | @TenderType@=K','LAR','Bank Routing Number','Routing No',0,0,'Y',TO_DATE('2012-05-01 09:23:14','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:14','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:15 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000329 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:15 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000330,20,'Y','Y','N',3874,'N',330,'Y',3000013,'N','The Account Number indicates the Number assigned to this bank account. ','@TenderType@=A | @TenderType@=K','LAR','Account Number','Account No',0,0,'Y',TO_DATE('2012-05-01 09:23:15','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:15','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:15 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000330 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:15 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000331,20,'Y','N','N',5049,'N',340,'Y',3000013,'N','The Check Number indicates the number on the check.','@TenderType@=K','LAR','Check Number','Check No',0,0,'Y',TO_DATE('2012-05-01 09:23:15','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:15','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:15 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000331 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:16 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000332,20,'Y','Y','N',5048,'N',350,'Y',3000013,'N','The Micr number is the combination of the bank routing number, account number and check number','@TenderType@=K','LAR','Combination of routing no, account and check no','Micr',0,0,'Y',TO_DATE('2012-05-01 09:23:15','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:15','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:16 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000332 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:16 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000333,14,'Y','N','N',3869,'N',360,'Y',3000013,'N','The Credit Card drop down list box is used for selecting the type of Credit Card presented for payment.','@TenderType@=C','LAR','Credit Card (Visa, MC, AmEx)','Credit Card',0,0,'Y',TO_DATE('2012-05-01 09:23:16','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:16','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:16 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000333 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:17 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000334,14,'Y','Y','N',5044,'N',370,'Y',3000013,'N','The Transaction Type indicates the type of transaction to be submitted to the Credit Card Company.','@TenderType@=C','LAR','Type of credit card transaction','Transaction Type',0,0,'Y',TO_DATE('2012-05-01 09:23:16','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:16','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:17 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000334 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:17 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,ObscureType,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000335,20,'Y','N','N',3870,'N',380,'Y',3000013,'N','The Credit Card number indicates the number on the credit card, without blanks or spaces.','904','@TenderType@=C','LAR','Credit Card Number ','Number',0,0,'Y',TO_DATE('2012-05-01 09:23:17','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:17','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:17 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000335 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:17 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000336,5,'Y','Y','N',5047,'N',390,'Y',3000013,'N','The Credit Card Verification indicates the verification code on the credit card (AMEX 4 digits on front; MC,Visa 3 digits back)','@TenderType@=C','LAR','Credit Card Verification code on credit card','Verification Code',0,0,'Y',TO_DATE('2012-05-01 09:23:17','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:17','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:17 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000336 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:18 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000337,11,'Y','N','N',3871,'N',400,'Y',3000013,'N','The Expiry Month indicates the expiry month for this credit card.','@TenderType@=C','LAR','Expiry Month','Exp. Month',0,0,'Y',TO_DATE('2012-05-01 09:23:17','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:17','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:18 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000337 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:18 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000338,11,'Y','Y','N',3872,'N',410,'Y',3000013,'N','The Expiry Year indicates the expiry year for this credit card.','@TenderType@=C','LAR','Expiry Year','Exp. Year',0,0,'Y',TO_DATE('2012-05-01 09:23:18','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:18','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:18 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000338 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:18 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000339,20,'Y','N','N',5050,'N',420,'Y',3000013,'N','The Name of the Credit Card or Account holder.','@TenderType@=C | @TenderType@=K','LAR','Name on Credit Card or Account holder','Account Name',0,0,'Y',TO_DATE('2012-05-01 09:23:18','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:18','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:18 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000339 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:18 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000340,20,'Y','Y','N',5051,'N',430,'Y',3000013,'N','The Street Address of the Credit Card or Account holder.','@TenderType@=C | @TenderType@=K & @IsOnline@=Y','LAR','Street address of the Credit Card or Account holder','Account Street',0,0,'Y',TO_DATE('2012-05-01 09:23:18','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:18','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:18 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000340 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:19 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000341,20,'Y','N','N',5052,'N',440,'Y',3000013,'N','The Account City indicates the City of the Credit Card or Account holder','@TenderType@=C | @TenderType@=K & @IsOnline@=Y','LAR','City or the Credit Card or Account Holder','Account City',0,0,'Y',TO_DATE('2012-05-01 09:23:18','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:18','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:19 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000341 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:19 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000342,11,'Y','Y','N',5026,'N',450,'Y',3000013,'N','The Zip Code of the Credit Card or Account Holder.','@TenderType@=C | @TenderType@=K & @IsOnline@=Y','LAR','Zip Code of the Credit Card or Account Holder','Account Zip/Postal',0,0,'Y',TO_DATE('2012-05-01 09:23:19','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:19','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:19 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000342 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:19 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000343,11,'Y','N','N',5053,'N',460,'Y',3000013,'N','The State of the Credit Card or Account holder','@TenderType@=C | @TenderType@=K & @IsOnline@=Y','LAR','State of the Credit Card or Account holder','Account State',0,0,'Y',TO_DATE('2012-05-01 09:23:19','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:19','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:19 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000343 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:20 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000344,20,'Y','Y','N',8213,'N',470,'Y',3000013,'N','Account Country Name','@TenderType@=C | @TenderType@=K & @IsOnline@=Y','LAR','Country','Account Country',0,0,'Y',TO_DATE('2012-05-01 09:23:19','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:19','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:20 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000344 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:20 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000345,20,'Y','N','N',5027,'N',480,'Y',3000013,'N','The Driver''s License being used as identification.','@TenderType@=K & @IsOnline@=Y','LAR','Payment Identification - Driver License','Driver License',0,0,'Y',TO_DATE('2012-05-01 09:23:20','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:20','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:20 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000345 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:20 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000346,20,'Y','Y','N',5028,'N',490,'Y',3000013,'N','The Social Security number being used as identification.','@TenderType@=K & @IsOnline@=Y','LAR','Payment Identification - Social Security No','Social Security No',0,0,'Y',TO_DATE('2012-05-01 09:23:20','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:20','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:20 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000346 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:21 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000347,20,'Y','N','N',5029,'N',500,'Y',3000013,'N','The EMail Address indicates the EMail address off the Credit Card or Account holder.','@TenderType@=K & @IsOnline@=Y','LAR','Email Address','Account EMail',0,0,'Y',TO_DATE('2012-05-01 09:23:20','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:20','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:21 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000347 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:21 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000348,26,'Y','N','N',5034,'N',510,'N',3000013,'N','The Tax Amount displays the total tax amount. The tax amount is only used for credit card processing.','@CreditCardType@=P & @IsOnline@=Y','LAR','Tax Amount for Credit Card transaction','Tax Amount',0,0,'Y',TO_DATE('2012-05-01 09:23:21','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:21','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:21 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000348 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:21 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000349,20,'Y','Y','N',5032,'N',520,'Y',3000013,'N','The PO Number indicates the number assigned to a purchase order','@CreditCardType@=P & @IsOnline@=Y','LAR','Purchase Order Number','PO Number',0,0,'Y',TO_DATE('2012-05-01 09:23:21','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:21','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:21 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000349 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:22 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000350,20,'Y','N','N',5030,'N',530,'Y',3000013,'N','The Voice Authorization Code indicates the code received from the Credit Card Company.','@IsOnline@=Y','LAR','Voice Authorization Code from credit card company','Voice authorization code',0,0,'Y',TO_DATE('2012-05-01 09:23:21','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:21','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:22 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000350 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:22 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000351,20,'Y','Y','N',5031,'N',540,'Y',3000013,'N','The Original Transaction ID is used for reversing transactions and indicates the transaction that has been reversed.','@IsOnline@=Y','LAR','Original Transaction ID','Original Transaction ID',0,0,'Y',TO_DATE('2012-05-01 09:23:22','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:22','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:22 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000351 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:22 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000352,23,'Y','N','N',5356,'N',550,'Y',3000013,'N','The Online Processing indicates if the payment can be processed online.','@IsOnline@=Y','LAR','This payment can be processed online','Online Processing',0,0,'Y',TO_DATE('2012-05-01 09:23:22','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:22','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:22 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000352 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:23 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000353,1,'Y','Y','N',3875,'N',560,'Y',3000013,'Y','The Approved checkbox indicates if this document requires approval before it can be processed.',101,'@IsOnline@=Y','LAR','Indicates if this document requires approval','Approved','N',0,0,'Y',TO_DATE('2012-05-01 09:23:22','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:22','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:23 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000353 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:23 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000354,20,'Y','N','N',5036,'N',570,'Y',3000013,'Y','The Response Result indicates the result of the transmission to the Credit Card Company.',101,'@IsOnline@=Y','LAR','Result of transmission','Result',0,0,'Y',TO_DATE('2012-05-01 09:23:23','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:23','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:23 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000354 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:23 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000355,20,'Y','Y','N',5037,'N',580,'Y',3000013,'Y','The Response Message indicates the message returned from the Credit Card Company as the result of a transmission',101,'@IsOnline@=Y','LAR','Response message','Response Message',0,0,'Y',TO_DATE('2012-05-01 09:23:23','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:23','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:23 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000355 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:24 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000356,20,'Y','N','N',5035,'N',590,'Y',3000013,'Y','The Payment Reference indicates the reference returned from the Credit Card Company for a payment',101,'@IsOnline@=Y','LAR','Payment reference','Reference',0,0,'Y',TO_DATE('2012-05-01 09:23:23','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:23','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:24 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000356 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:24 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000357,20,'Y','Y','N',5038,'N',600,'Y',3000013,'Y','The Authorization Code indicates the code returned from the electronic transmission.',101,'@IsOnline@=Y','LAR','Authorization Code returned','Authorization Code',0,0,'Y',TO_DATE('2012-05-01 09:23:24','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:24','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:24 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000357 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:24 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000358,14,'Y','N','N',5040,'N',610,'Y',3000013,'Y','The Zip Verified indicates if the zip code has been verified by the Credit Card Company.',101,'@IsOnline@=Y','LAR','The Zip Code has been verified','Zip verified',0,0,'Y',TO_DATE('2012-05-01 09:23:24','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:24','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:24 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000358 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:25 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000359,14,'Y','Y','N',5039,'N',620,'Y',3000013,'Y','The Address Verified indicates if the address has been verified by the Credit Card Company.',101,'@IsOnline@=Y','LAR','This address has been verified','Address verified',0,0,'Y',TO_DATE('2012-05-01 09:23:24','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:24','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:25 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000359 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:25 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000360,14,'Y','N','N',5496,'N',630,'Y',3000013,'Y','The Document Status indicates the status of a document at this time.  If you want to change the document status, use the Document Action field',101,'LAR','The current status of the document','Document Status','N',0,0,'Y',TO_DATE('2012-05-01 09:23:25','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:25','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:25 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000360 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:25 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000361,23,'Y','Y','N',5497,'N',640,'Y',3000013,'N','You find the current status in the Document Status field. The options are listed in a popup',101,'LAR','The targeted status of the document','Document Action','N',0,0,'Y',TO_DATE('2012-05-01 09:23:25','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:25','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:25 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000361 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:26 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000362,1,'Y','N','N',8775,'N',650,'Y',3000013,'Y','Self-Service allows users to enter data or update their data.  The flag indicates, that this record was entered or created via Self-Service or that the user can change it via the Self-Service functionality.','LAR','This is a Self-Service entry or this entry can be changed via Self-Service','Self-Service','N',0,0,'Y',TO_DATE('2012-05-01 09:23:25','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:25','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:26 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000362 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:26 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000363,23,'Y','Y','N',5042,'N',660,'Y',3000013,'N','The Posted field indicates the status of the Generation of General Ledger Accounting Lines ','@Processed@=Y & @#ShowAcct@=Y','LAR','Posting status','Posted','N',0,0,'Y',TO_DATE('2012-05-01 09:23:26','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:26','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:26 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000363 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:26 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000364,1,'Y','N','N',5400,'N',670,'Y',3000013,'Y','The Allocated checkbox indicates if a payment has been allocated or associated with an invoice or invoices.','@Processed@=Y','LAR','Indicates if the payment has been allocated','Allocated','N',0,0,'Y',TO_DATE('2012-05-01 09:23:26','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:26','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:26 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000364 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:23:27 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000365,14,'Y','Y','N',52117,'N',680,'Y',3000013,'N','The Cash Book identifies a unique cash book.  The cash book is used to record cash transactions.','@TenderType@=''X''','LAR','Cash Book for recording petty cash transactions','Cash Book',0,0,'Y',TO_DATE('2012-05-01 09:23:26','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:23:26','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:23:27 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000365 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000365
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000298
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000361
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000299
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000303
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000304
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3000307
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3000301
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3000305
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3000306
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3000308
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3000309
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3000285
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3000310
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3000311
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3000300
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3000312
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3000313
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3000314
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000315
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000316
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000317
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000318
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000319
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000320
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000321
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000322
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000323
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000324
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000325
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000326
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000327
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000328
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000329
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3000330
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000331
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000332
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000333
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000334
;

-- May 1, 2012 9:42:44 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000335
;

-- May 1, 2012 9:42:45 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000336
;

-- May 1, 2012 9:42:45 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000337
;

-- May 1, 2012 9:42:45 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000338
;

-- May 1, 2012 9:42:45 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000339
;

-- May 1, 2012 9:42:45 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000340
;

-- May 1, 2012 9:42:45 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000341
;

-- May 1, 2012 9:42:45 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000342
;

-- May 1, 2012 9:42:45 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000343
;

-- May 1, 2012 9:42:45 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000344
;

-- May 1, 2012 9:42:45 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000345
;

-- May 1, 2012 9:42:45 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000346
;

-- May 1, 2012 9:42:45 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000347
;

-- May 1, 2012 9:42:45 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000348
;

-- May 1, 2012 9:42:45 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000349
;

-- May 1, 2012 9:42:45 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000350
;

-- May 1, 2012 9:42:45 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000351
;

-- May 1, 2012 9:42:45 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000352
;

-- May 1, 2012 9:42:45 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000353
;

-- May 1, 2012 9:42:45 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000354
;

-- May 1, 2012 9:42:45 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000355
;

-- May 1, 2012 9:42:45 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000356
;

-- May 1, 2012 9:42:45 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000357
;

-- May 1, 2012 9:42:45 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000358
;

-- May 1, 2012 9:42:45 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000359
;

-- May 1, 2012 9:42:45 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000360
;

-- May 1, 2012 9:42:45 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000362
;

-- May 1, 2012 9:42:45 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000363
;

-- May 1, 2012 9:42:45 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000364
;

-- May 1, 2012 9:42:45 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000302
;

-- May 1, 2012 9:43:06 AM ART
--Add Receipts window 
UPDATE AD_Field SET DisplayLogic=NULL,Updated=TO_DATE('2012-05-01 09:43:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000301
;

-- May 1, 2012 9:44:14 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000366,1,'Y','N','N',3000260,'N','Y',3000013,'N','LAR','Allocation',0,0,'Y',TO_DATE('2012-05-01 09:44:13','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:44:13','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:44:14 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000366 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:44:14 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000367,1,'Y','N','N',3000261,'N','Y',3000013,'N','LAR','IsOnDrawer',0,0,'Y',TO_DATE('2012-05-01 09:44:14','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:44:14','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:44:14 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000367 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:44:14 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000368,10,'Y','N','N',3000258,'N','Y',3000013,'N','LAR','LAR_PaymentHeader',0,0,'Y',TO_DATE('2012-05-01 09:44:14','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:44:14','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:44:14 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000368 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:44:15 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000369,10,'Y','N','N',3000259,'N','Y',3000013,'N','LAR','LAR_PaymentSource_ID',0,0,'Y',TO_DATE('2012-05-01 09:44:14','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:44:14','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:44:15 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000369 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:46:21 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000369
;

-- May 1, 2012 9:46:21 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000302
;

-- May 1, 2012 9:46:21 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000366
;

-- May 1, 2012 9:46:21 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000364
;

-- May 1, 2012 9:46:21 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000367
;

-- May 1, 2012 9:46:21 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3000368
;

-- May 1, 2012 9:46:35 AM ART
--Add Receipts window 
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2012-05-01 09:46:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000364
;

-- May 1, 2012 9:49:13 AM ART
--Add Receipts window 
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,AD_Column_ID,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('Y',3000009,30,'N','N',390,3000014,'N','N',4884,'N','Y',0,'N','N','LAR','Allocation',0,0,TO_DATE('2012-05-01 09:49:12','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2012-05-01 09:49:12','YYYY-MM-DD HH24:MI:SS'),'Y','N',0)
;

-- May 1, 2012 9:49:13 AM ART
--Add Receipts window 
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000014 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- May 1, 2012 9:51:30 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000370,26,'N','N','N',5494,'N',0,'Y',3000014,'N','A Business Partner is anyone with whom you transact.  This can include Vendor, Customer, Employee or Salesperson','LAR','Identifies a Business Partner','Business Partner ',0,0,'Y',TO_DATE('2012-05-01 09:51:30','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:51:30','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:51:30 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000370 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:51:31 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000371,14,'N','N','N',12331,'N',0,'Y',3000014,'N','Allocation of Cash/Payment to Invoice','LAR','Allocation Line','Allocation Line',0,0,'Y',TO_DATE('2012-05-01 09:51:30','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:51:30','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:51:31 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000371 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:51:31 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000372,1,'N','N','N',5520,'N',0,'Y',3000014,'N','The Manual check box indicates if the process will done manually.','LAR','This is a manual process','Manual',0,0,'Y',TO_DATE('2012-05-01 09:51:31','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:51:31','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:51:31 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000372 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:51:31 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000373,26,'N','N','N',5210,'N',0,'Y',3000014,'N','The Cash Journal Line indicates a unique line in a cash journal.','LAR','Cash Journal Line','Cash Journal Line','N',0,0,'Y',TO_DATE('2012-05-01 09:51:31','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:51:31','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:51:31 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000373 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:51:32 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000374,1,'N','N','N',4877,'N',0,'Y',3000014,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',0,0,'Y',TO_DATE('2012-05-01 09:51:31','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:51:31','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:51:32 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000374 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:51:32 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000375,14,'Y','N','N',4875,'N',10,'Y',3000014,'Y','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',0,0,'Y',TO_DATE('2012-05-01 09:51:32','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:51:32','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:51:32 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000375 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:51:32 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000376,14,'Y','Y','N',4876,'N',20,'Y',3000014,'Y','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',0,0,'Y',TO_DATE('2012-05-01 09:51:32','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:51:32','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:51:32 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000376 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:51:33 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000377,26,'Y','N','N',4884,'N',30,'Y',3000014,'Y','The Payment is a unique identifier of this payment.','LAR','Payment identifier','Payment','N',0,0,'Y',TO_DATE('2012-05-01 09:51:32','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:51:32','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:51:33 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000377 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:51:33 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000378,14,'Y','N','N',4874,'N',40,'Y',3000014,'Y','LAR','Payment allocation','Allocation',0,0,'Y',TO_DATE('2012-05-01 09:51:33','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:51:33','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:51:33 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000378 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:51:33 AM ART
--Add Receipts window 
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES (1,'N',3000379,14,'Y','Y','N',5519,'N',50,'Y',3000014,'Y','The Transaction Date indicates the date of the transaction.','LAR','Transaction Date','Transaction Date',0,0,'Y',TO_DATE('2012-05-01 09:51:33','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:51:33','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:51:33 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000379 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:51:34 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000380,26,'Y','N','N',4882,'N',60,'Y',3000014,'Y','The Invoice Document.','LAR','Invoice Identifier','Invoice',0,0,'Y',TO_DATE('2012-05-01 09:51:33','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:51:33','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:51:34 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000380 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:51:34 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000381,26,'Y','Y','N',4883,'N',70,'Y',3000014,'Y','The Order is a control document.  The  Order is complete when the quantity ordered is the same as the quantity shipped and invoiced.  When you close an order, unshipped (backordered) quantities are cancelled.','LAR','Order','Order',0,0,'Y',TO_DATE('2012-05-01 09:51:34','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:51:34','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:51:34 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000381 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:51:34 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000382,26,'Y','N','N',4885,'N',80,'Y',3000014,'Y','The Amount indicates the amount for this document line.','LAR','Amount in a defined currency','Amount',0,0,'Y',TO_DATE('2012-05-01 09:51:34','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:51:34','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:51:34 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000382 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:51:35 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000383,26,'Y','N','N',4886,'N',100,'Y',3000014,'Y','The Discount Amount indicates the discount amount for a document or line.','LAR','Calculated amount of discount','Discount Amount',0,0,'Y',TO_DATE('2012-05-01 09:51:34','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:51:34','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:51:35 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000383 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:51:35 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000384,26,'Y','Y','N',4887,'N',110,'Y',3000014,'Y','The Write Off Amount indicates the amount to be written off as uncollectible.','LAR','Amount to write-off','Write-off Amount',0,0,'Y',TO_DATE('2012-05-01 09:51:35','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:51:35','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:51:35 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000384 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 9:51:35 AM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000385,26,'Y','N','N',10762,'N',120,'Y',3000014,'Y','Overpayments (negative) are unallocated amounts and allow you to receive money for more than the particular invoice. 
Underpayments (positive) is a partial payment for the invoice. You do not write off the unpaid amount.','LAR','Over-Payment (unallocated) or Under-Payment (partial payment) Amount','Over/Under Payment',0,0,'Y',TO_DATE('2012-05-01 09:51:35','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 09:51:35','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 9:51:35 AM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000385 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 10:18:59 AM ART
--Add Receipts window 
UPDATE AD_Tab SET Name='Receipt Header',Updated=TO_DATE('2012-05-01 10:18:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Tab_ID=3000012
;

-- May 1, 2012 10:18:59 AM ART
--Add Receipts window 
UPDATE AD_Tab_Trl SET IsTranslated='N' WHERE AD_Tab_ID=3000012
;

-- May 1, 2012 10:23:31 AM ART
--Add Receipts window 
UPDATE AD_Field SET DisplayLogic='@LAR_PaymentHeader_ID@ > 0', Included_Tab_ID=3000013,Updated=TO_DATE('2012-05-01 10:23:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000269
;

-- May 1, 2012 10:24:12 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000364
;

-- May 1, 2012 10:24:12 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000367
;

-- May 1, 2012 10:24:12 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000368
;

-- May 1, 2012 10:24:12 AM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3000366
;

-- May 1, 2012 10:24:53 AM ART
--Add Receipts window 
UPDATE AD_Field SET DisplayLogic='@C_Payment_ID@ > 0', Included_Tab_ID=3000014,Updated=TO_DATE('2012-05-01 10:24:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000366
;

-- May 1, 2012 10:27:31 AM ART
--Add Receipts window 
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_DATE('2012-05-01 10:27:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3000239
;

-- May 1, 2012 10:27:52 AM ART
--Add Receipts window 
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_DATE('2012-05-01 10:27:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3000253
;

-- May 1, 2012 10:28:37 AM ART
--Add Receipts window 
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_DATE('2012-05-01 10:28:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3000238
;

-- May 1, 2012 10:28:50 AM ART
--Add Receipts window 
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_DATE('2012-05-01 10:28:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3000240
;

-- May 1, 2012 10:44:21 AM ART
--Add Receipts window 
UPDATE AD_Column SET DefaultValue='@#AD_Client_ID@', AD_Val_Rule_ID=129, IsAllowCopy='N',Updated=TO_DATE('2012-05-01 10:44:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3000244
;

-- May 1, 2012 10:44:48 AM ART
--Add Receipts window 
UPDATE AD_Column SET DefaultValue='@#AD_Org_ID@', AD_Val_Rule_ID=130, IsAllowCopy='N',Updated=TO_DATE('2012-05-01 10:44:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3000243
;

-- May 1, 2012 11:10:13 AM ART
--Add Receipts window 
UPDATE AD_Column SET DefaultValue='@Date@', AD_Reference_ID=15,Updated=TO_DATE('2012-05-01 11:10:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3000238
;

-- May 1, 2012 11:28:09 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:28:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3880
;

-- May 1, 2012 11:32:37 AM ART
--Add Receipts window 
UPDATE AD_Column SET DefaultValue='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:32:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5398
;

-- May 1, 2012 11:34:26 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:34:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3874
;

-- May 1, 2012 11:35:21 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:35:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5052
;

-- May 1, 2012 11:35:26 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:35:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=8213
;

-- May 1, 2012 11:35:32 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:35:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3862
;

-- May 1, 2012 11:35:36 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:35:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3863
;

-- May 1, 2012 11:36:00 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:36:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=9565
;

-- May 1, 2012 11:36:06 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:36:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5029
;

-- May 1, 2012 11:36:13 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:36:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5027
;

-- May 1, 2012 11:36:18 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:36:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5028
;

-- May 1, 2012 11:37:18 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:37:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5050
;

-- May 1, 2012 11:37:24 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:37:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5053
;

-- May 1, 2012 11:37:54 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:37:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5051
;

-- May 1, 2012 11:37:59 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:37:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5026
;

-- May 1, 2012 11:38:20 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:38:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=9566
;

-- May 1, 2012 11:38:33 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:38:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5298
;

-- May 1, 2012 11:38:46 AM ART
--Add Receipts window 
UPDATE AD_Column SET DefaultValue=NULL, ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:38:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5398
;

-- May 1, 2012 11:38:53 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:38:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=9564
;

-- May 1, 2012 11:39:35 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@C_Invoice_ID@!0 | @C_Order_ID@!0 | @LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:39:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=8984
;

-- May 1, 2012 11:39:56 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:39:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=10265
;

-- May 1, 2012 11:40:00 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:40:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5299
;

-- May 1, 2012 11:40:53 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:40:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5302
;

-- May 1, 2012 11:42:02 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0', IsUpdateable='N',Updated=TO_DATE('2012-05-01 11:42:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5043
;

-- May 1, 2012 11:42:06 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:42:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5300
;

-- May 1, 2012 11:42:10 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:42:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=8554
;

-- May 1, 2012 11:42:17 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:42:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=8980
;

-- May 1, 2012 11:42:21 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:42:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5049
;

-- May 1, 2012 11:43:54 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:43:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3865
;

-- May 1, 2012 11:43:59 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:43:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3866
;

-- May 1, 2012 11:44:09 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@IsApproved@=Y | @LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:44:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3871
;

-- May 1, 2012 11:44:35 AM ART
--Add Receipts window 
UPDATE AD_Column SET DefaultValue=NULL, ReadOnlyLogic='@IsApproved@=Y | @LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:44:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3872
;

-- May 1, 2012 11:45:48 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@C_Charge_ID@!0 | @C_Order_ID@!0 | @LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:45:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5301
;

-- May 1, 2012 11:46:25 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:46:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3864
;

-- May 1, 2012 11:46:44 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:46:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5400
;

-- May 1, 2012 11:46:48 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:46:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3875
;

-- May 1, 2012 11:46:53 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:46:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=8979
;

-- May 1, 2012 11:47:27 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:47:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3000261
;

-- May 1, 2012 11:47:39 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:47:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=13045
;

-- May 1, 2012 11:47:45 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:47:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=6216
;

-- May 1, 2012 11:47:54 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:47:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3879
;

-- May 1, 2012 11:47:57 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:47:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=8775
;

-- May 1, 2012 11:48:27 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:48:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3000259
;

-- May 1, 2012 11:48:31 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:48:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5048
;

-- May 1, 2012 11:48:43 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@C_Charge_ID@!0 | @C_Order_ID@!0 | @LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:48:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=7034
;

-- May 1, 2012 11:48:47 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:48:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5303
;

-- May 1, 2012 11:48:52 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:48:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5032
;

-- May 1, 2012 11:49:03 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:49:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3878
;

-- May 1, 2012 11:49:06 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:49:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=59039
;

-- May 1, 2012 11:49:10 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:49:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3877
;

-- May 1, 2012 11:49:14 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:49:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5038
;

-- May 1, 2012 11:49:18 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:49:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=8981
;

-- May 1, 2012 11:49:21 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:49:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5039
;

-- May 1, 2012 11:49:25 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:49:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5040
;

-- May 1, 2012 11:49:29 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:49:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=8982
;

-- May 1, 2012 11:49:32 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:49:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5041
;

-- May 1, 2012 11:49:36 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:49:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5035
;

-- May 1, 2012 11:49:40 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:49:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=8983
;

-- May 1, 2012 11:49:43 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:49:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5037
;

-- May 1, 2012 11:49:47 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:49:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5036
;

-- May 1, 2012 11:49:51 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:49:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=13705
;

-- May 1, 2012 11:49:55 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:49:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=55309
;

-- May 1, 2012 11:50:01 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:50:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3873
;

-- May 1, 2012 11:50:05 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:50:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=8985
;

-- May 1, 2012 11:50:09 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:50:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5034
;

-- May 1, 2012 11:50:18 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@IsApproved@=Y | @LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:50:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5046
;

-- May 1, 2012 11:50:25 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:50:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5044
;

-- May 1, 2012 11:50:29 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:50:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3867
;

-- May 1, 2012 11:51:19 AM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='@C_Charge_ID@!0 | @C_Order_ID@!0 | @LAR_PaymentSource_ID@!0',Updated=TO_DATE('2012-05-01 11:51:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=6475
;

-- May 1, 2012 1:08:56 PM ART
--Add Receipts window 
INSERT INTO AD_Process (AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Classname,CopyFromProcess,Description,Value,Name,AD_Org_ID,AD_Client_ID,Updated,UpdatedBy,CreatedBy,Created,IsActive) VALUES (3000006,'N','N','3','N','N','S','LAR',0,0,'ar.com.ergio.process.LAR_OnDrawerChecksSelection','N','Selects ARR receipts with Check Tender Type which are on drawer','LAR On Drawer Checks Selection','LAR On Drawer Checks Selection',0,0,TO_DATE('2012-05-01 13:08:55','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 13:08:55','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- May 1, 2012 1:08:56 PM ART
--Add Receipts window 
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000006 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- May 1, 2012 1:10:26 PM ART
--Add Receipts window 
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,DefaultValue,AD_Element_ID,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID) VALUES ('N',3000009,0,3000006,0,'Y',13,10,'Y','@LAR_PaymentHeader_ID@',3000068,'LAR','LAR_PaymentHeader_ID','LAR_PaymentHeader_ID','Y',0,0,TO_DATE('2012-05-01 13:10:21','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-05-01 13:10:21','YYYY-MM-DD HH24:MI:SS'),0)
;

-- May 1, 2012 1:10:26 PM ART
--Add Receipts window 
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000009 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- May 1, 2012 1:16:05 PM ART
--Add Receipts window 
INSERT INTO AD_Process (AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Classname,CopyFromProcess,Description,Value,Name,AD_Org_ID,AD_Client_ID,Updated,UpdatedBy,CreatedBy,Created,IsActive) VALUES (3000007,'N','N','3','N','N','Y','LAR',0,0,'ar.com.ergio.process.LAR_ProcessPaymentHeader','N','Process on batch all Payments under a Header','LAR Process Payment Header','LAR Process Payment Header',0,0,TO_DATE('2012-05-01 13:15:59','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 13:15:59','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- May 1, 2012 1:16:05 PM ART
--Add Receipts window 
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000007 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- May 1, 2012 1:20:03 PM ART
--Add Receipts window 
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,DefaultValue,AD_Element_ID,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID) VALUES ('N',3000010,0,3000007,0,'Y',13,10,'Y','@LAR_PaymentHeader_ID@',3000068,'LAR','LAR_PaymentHeader_ID','LAR_PaymentHeader_ID','Y',0,0,TO_DATE('2012-05-01 13:20:02','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-05-01 13:20:02','YYYY-MM-DD HH24:MI:SS'),0)
;

-- May 1, 2012 1:20:03 PM ART
--Add Receipts window 
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000010 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- May 1, 2012 1:30:00 PM ART
--Add Receipts window 
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,AD_Val_Rule_ID,SeqNo,IsMandatory,AD_Reference_Value_ID,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID) VALUES ('N',3000011,0,3000007,0,'N',17,3000003,20,'Y',135,'LAR','Accion','Accion','Y',0,0,TO_DATE('2012-05-01 13:29:55','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-05-01 13:29:55','YYYY-MM-DD HH24:MI:SS'),0)
;

-- May 1, 2012 1:30:00 PM ART
--Add Receipts window 
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000011 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- May 1, 2012 1:33:13 PM ART
--Add Receipts window 
UPDATE AD_Column SET AD_Reference_ID=28, AD_Process_ID=3000006,Updated=TO_DATE('2012-05-01 13:33:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3000242
;

-- May 1, 2012 1:34:07 PM ART
--Add Receipts window 
UPDATE AD_Column SET AD_Reference_ID=30,Updated=TO_DATE('2012-05-01 13:34:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3000239
;

-- May 1, 2012 1:34:31 PM ART
--Add Receipts window 
UPDATE AD_Column SET IsMandatory='Y',Updated=TO_DATE('2012-05-01 13:34:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3000236
;

-- May 1, 2012 1:35:04 PM ART
--Add Receipts window 
UPDATE AD_Column SET AD_Reference_ID=30,Updated=TO_DATE('2012-05-01 13:35:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3000253
;

-- May 1, 2012 1:38:11 PM ART
--Add Receipts window 
UPDATE AD_Column SET DefaultValue='DR', AD_Reference_Value_ID=131, IsMandatory='Y', AD_Reference_ID=17, ReadOnlyLogic='1=1',Updated=TO_DATE('2012-05-01 13:38:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3000240
;

-- May 1, 2012 1:44:22 PM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='1=1',Updated=TO_DATE('2012-05-01 13:44:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3000251
;

-- May 1, 2012 1:45:13 PM ART
--Add Receipts window 
UPDATE AD_Column SET ReadOnlyLogic='1=1',Updated=TO_DATE('2012-05-01 13:45:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3000252
;

-- May 1, 2012 1:46:10 PM ART
--Add Receipts window 
UPDATE AD_Column SET AD_Reference_ID=28, AD_Process_ID=3000007, IsAlwaysUpdateable='Y',Updated=TO_DATE('2012-05-01 13:46:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3000241
;

-- May 1, 2012 1:48:29 PM ART
--Add Receipts window 
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000077,'PayHeaderTotalAmt','LAR','PayHeaderTotalAmt','PayHeaderTotalAmt',0,TO_DATE('2012-05-01 13:48:28','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-05-01 13:48:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,0)
;

-- May 1, 2012 1:48:29 PM ART
--Add Receipts window 
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,PO_Name,Name,Description,PrintName,PO_PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.PO_Name,t.Name,t.Description,t.PrintName,t.PO_PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000077 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- May 1, 2012 1:51:10 PM ART
--Add Receipts window 
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('(SELECT COALESCE(Sum(PayAmt),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID)',3000262,3000010,'LAR',0,'N','N','N',0,'N',14,'N',12,'N','N',3000077,'N','Y','N','N','N','PayHeaderTotalAmt','PayHeaderTotalAmt','N',0,TO_DATE('2012-05-01 13:51:05','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-05-01 13:51:05','YYYY-MM-DD HH24:MI:SS'),0)
;

-- May 1, 2012 1:51:10 PM ART
--Add Receipts window 
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000262 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- May 1, 2012 2:50:19 PM ART
--Add Receipts window 
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000386,14,'Y','N','N',3000262,'N','Y',3000012,'N','LAR','PayHeaderTotalAmt',0,0,'Y',TO_DATE('2012-05-01 14:50:19','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-01 14:50:19','YYYY-MM-DD HH24:MI:SS'))
;

-- May 1, 2012 2:50:19 PM ART
--Add Receipts window 
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000386 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- May 1, 2012 2:50:37 PM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3000386
;

-- May 1, 2012 2:50:37 PM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3000269
;

-- May 1, 2012 2:50:46 PM ART
--Add Receipts window 
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2012-05-01 14:50:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000386
;
;

-- May 1, 2012 3:16:12 PM ART
--Add Receipts window 
UPDATE AD_Field SET IsReadOnly='Y', DefaultValue='@SQL=SELECT C_Bpartner_ID FROM LAR_PaymentHeader ph WHERE ph.LAR_PaymentHeader_ID = @LAR_PaymentHeader_ID@',Updated=TO_DATE('2012-05-01 15:16:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000307
;

-- May 1, 2012 3:20:28 PM ART
--Add Receipts window 
UPDATE AD_Field SET DefaultValue='@SQL=SELECT C_DocType_ID FROM LAR_PaymentHeader ph WHERE ph.LAR_PaymentHeader_ID = @LAR_PaymentHeader_ID@',Updated=TO_DATE('2012-05-01 15:20:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000320
;

-- May 1, 2012 3:22:32 PM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000367
;

-- May 1, 2012 3:22:32 PM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000368
;

-- May 1, 2012 3:22:32 PM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000369
;

-- May 1, 2012 3:22:32 PM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3000364
;

-- May 1, 2012 3:22:32 PM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=3000366
;

-- May 1, 2012 3:23:25 PM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000289
;

-- May 1, 2012 3:23:25 PM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000368
;

-- May 1, 2012 3:23:25 PM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3000369
;

-- May 1, 2012 3:23:25 PM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=3000364
;

-- May 1, 2012 3:23:25 PM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=680,IsDisplayed='Y' WHERE AD_Field_ID=3000366
;

-- May 1, 2012 3:23:52 PM ART
--Add Receipts window 
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2012-05-01 15:23:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000289
;

-- May 1, 2012 10:13:27 PM ART
--Add Receipts window 
UPDATE AD_Tab SET TabLevel=1,Updated=TO_DATE('2012-05-01 22:13:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Tab_ID=3000013
;

-- May 1, 2012 10:13:35 PM ART
--Add Receipts window 
UPDATE AD_Tab SET TabLevel=2,Updated=TO_DATE('2012-05-01 22:13:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Tab_ID=3000014
;

-- May 1, 2012 10:14:47 PM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3000301
;

-- May 1, 2012 10:14:47 PM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3000305
;

-- May 1, 2012 10:14:47 PM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3000306
;

-- May 1, 2012 10:14:47 PM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3000308
;

-- May 1, 2012 10:14:47 PM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3000309
;

-- May 1, 2012 10:14:47 PM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3000285
;

-- May 1, 2012 10:14:47 PM ART
--Add Receipts window 
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3000307
;

-- May 1, 2012 10:16:19 PM ART
--Add Receipts window 
UPDATE AD_Field SET IsReadOnly='Y', DefaultValue='@SQL=SELECT C_DocType_ID FROM LAR_PaymentHeader ph WHERE ph.LAR_PaymentHeader_ID = @LAR_PaymentHeader_ID@',Updated=TO_DATE('2012-05-01 22:16:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000302
;

-- May 1, 2012 10:17:43 PM ART
--Add Receipts window 
UPDATE AD_Column SET AD_Reference_Value_ID=343, AD_Reference_ID=18,Updated=TO_DATE('2012-05-01 22:17:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3000259
;

-- May 1, 2012 10:21:24 PM ART
--Add Receipts window 
INSERT INTO AD_Menu (AD_Window_ID,AD_Menu_ID,IsSummary,Action,IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Description,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000009,3000013,'N','W','N','N','LAR','Y','Receipts (Customers)','Registration of Customer Payments',TO_DATE('2012-05-01 22:21:23','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,0,TO_DATE('2012-05-01 22:21:23','YYYY-MM-DD HH24:MI:SS'),0)
;

-- May 1, 2012 10:21:24 PM ART
--Add Receipts window 
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000013 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- May 1, 2012 10:21:24 PM ART
--Add Receipts window 
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', SysDate, 0, SysDate, 0,t.AD_Tree_ID, 3000013, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000013)
;

-- May 1, 2012 10:21:48 PM ART
--Add Receipts window 
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=0, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000013
;

-- May 1, 2012 10:21:48 PM ART
--Add Receipts window 
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=1, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=241
;

-- May 1, 2012 10:21:48 PM ART
--Add Receipts window 
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=2, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=288
;

-- May 1, 2012 10:21:48 PM ART
--Add Receipts window 
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=3, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=432
;

-- May 1, 2012 10:21:48 PM ART
--Add Receipts window 
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=4, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=243
;

-- May 1, 2012 10:21:48 PM ART
--Add Receipts window 
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=5, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=413
;

-- May 1, 2012 10:21:48 PM ART
--Add Receipts window 
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=6, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=538
;

-- May 1, 2012 10:21:48 PM ART
--Add Receipts window 
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=7, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=462
;

-- May 1, 2012 10:21:48 PM ART
--Add Receipts window 
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=8, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=505
;

-- May 1, 2012 10:21:48 PM ART
--Add Receipts window 
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=9, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=235
;

-- May 1, 2012 10:21:48 PM ART
--Add Receipts window 
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=10, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=511
;

-- May 1, 2012 10:21:48 PM ART
--Add Receipts window 
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=11, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=245
;

-- May 1, 2012 10:21:48 PM ART
--Add Receipts window 
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=12, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=251
;

-- May 1, 2012 10:21:48 PM ART
--Add Receipts window 
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=13, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=246
;

-- May 1, 2012 10:21:48 PM ART
--Add Receipts window 
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=14, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=509
;

-- May 1, 2012 10:21:48 PM ART
--Add Receipts window 
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=15, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=510
;

-- May 1, 2012 10:21:48 PM ART
--Add Receipts window 
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=16, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=496
;

-- May 1, 2012 10:21:48 PM ART
--Add Receipts window 
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=17, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=497
;

-- May 1, 2012 10:21:48 PM ART
--Add Receipts window 
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=18, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=304
;

-- May 1, 2012 10:21:48 PM ART
--Add Receipts window 
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=19, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=255
;

-- May 1, 2012 10:21:48 PM ART
--Add Receipts window 
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=20, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=286
;

-- May 1, 2012 10:21:48 PM ART
--Add Receipts window 
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=21, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=287
;

-- May 1, 2012 10:21:48 PM ART
--Add Receipts window 
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=22, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=438
;

-- May 1, 2012 10:21:48 PM ART
--Add Receipts window 
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=23, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=234
;

-- May 1, 2012 10:21:48 PM ART
--Add Receipts window 
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=24, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=244
;

-- May 1, 2012 10:21:48 PM ART
--Add Receipts window 
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=25, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53313
;

-- May 1, 2012 10:21:48 PM ART
--Add Receipts window 
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=26, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53314
;

-- May 1, 2012 10:21:48 PM ART
--Add Receipts window 
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=27, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53190
;

-- May 1, 2012 10:21:48 PM ART
--Add Receipts window 
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=28, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53187
;

-- May 2, 2012 6:41:58 AM ART
-- Add Receipts window
UPDATE AD_Field SET DisplayLength=20,Updated=TO_DATE('2012-05-02 06:41:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000270
;

-- May 2, 2012 6:48:35 AM ART
-- Add Receipts window
UPDATE AD_Column SET IsMandatory='Y', AD_Val_Rule_ID=230,Updated=TO_DATE('2012-05-02 06:48:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3000239
;

-- May 2, 2012 6:49:23 AM ART
-- Add Receipts window
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2012-05-02 06:49:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000309
;

-- May 2, 2012 6:49:34 AM ART
-- Add Receipts window
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2012-05-02 06:49:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000307
;

-- May 2, 2012 6:50:27 AM ART
-- Add Receipts window
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2012-05-02 06:50:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000302
;

-- May 2, 2012 6:50:43 AM ART
-- Add Receipts window
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2012-05-02 06:50:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000369
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000300
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3000312
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3000313
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3000314
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3000315
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000316
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000317
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000318
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000319
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000320
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000321
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000322
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000323
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000324
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000325
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000326
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000327
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000328
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000329
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000330
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3000331
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000332
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000333
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000334
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000335
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000336
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000337
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000338
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000339
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000340
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000341
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000342
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000343
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000344
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000345
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000346
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000347
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000348
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000349
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000350
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000351
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000352
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000353
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000354
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000355
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000356
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000357
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000358
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000359
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000360
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000363
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000302
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000367
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000289
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000368
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000369
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000362
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3000364
;

-- May 2, 2012 6:51:36 AM ART
-- Add Receipts window
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=3000366
;

-- 02/05/2012 12:49:05 ART
-- Add Payments window
INSERT INTO AD_Window (AD_Window_ID,WindowType,IsSOTrx,IsDefault,IsBetaFunctionality,WinHeight,WinWidth,EntityType,Name,Description,IsActive,Created,UpdatedBy,CreatedBy,Updated,AD_Org_ID,AD_Client_ID,Processing) VALUES (3000010,'M','N','N','N',0,0,'LAR','Payments','Vendor Payments Registration','Y',TO_DATE('2012-05-02 12:49:04','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:49:04','YYYY-MM-DD HH24:MI:SS'),0,0,'N')
;

-- 02/05/2012 12:49:05 ART
-- Add Payments window
INSERT INTO AD_Window_Trl (AD_Language,AD_Window_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Window_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Window t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Window_ID=3000010 AND NOT EXISTS (SELECT * FROM AD_Window_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Window_ID=t.AD_Window_ID)
;

-- 02/05/2012 12:50:34 ART
-- Add Payments window
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,WhereClause,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('Y',3000010,10,'N','N',3000010,3000015,'N','N','N','IsReceipt=''Y'' AND C_BPartner_ID is not null','N',0,'Y','N','LAR','Payment Header',0,0,TO_DATE('2012-05-02 12:50:33','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2012-05-02 12:50:33','YYYY-MM-DD HH24:MI:SS'),'Y','N',0)
;

-- 02/05/2012 12:50:34 ART
-- Add Payments window
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000015 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 02/05/2012 12:50:37 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000387,10,'N','N','N',3000253,'N',0,'Y',3000015,'N','The Invoice Document.','LAR','Invoice Identifier','Invoice',0,0,'Y',TO_DATE('2012-05-02 12:50:34','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:38 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000387 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:38 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000388,1,'N','N','N',3000242,'N',0,'Y',3000015,'N','LAR','SearchPayments',0,0,'Y',TO_DATE('2012-05-02 12:50:38','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:38','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:38 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000388 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:38 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000389,10,'N','N','N',3000254,'N',0,'Y',3000015,'N','The Bank Account identifies an account at this Bank.','LAR','Account at the Bank','Bank Account',0,0,'Y',TO_DATE('2012-05-02 12:50:38','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:38','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:38 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000389 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:39 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000390,10,'Y','N','N',3000244,'N',10,'Y',3000015,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',0,0,'Y',TO_DATE('2012-05-02 12:50:38','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:38','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:39 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000390 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:39 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000391,10,'Y','Y','N',3000243,'N',20,'Y',3000015,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',0,0,'Y',TO_DATE('2012-05-02 12:50:39','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:39','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:39 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000391 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:39 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_Reference_ID,EntityType,AD_Val_Rule_ID,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000392,10,'Y','N','N',3000236,'N',30,'Y',3000015,'N','The Document Type determines document sequence and processing rules',19,'LAR',3000001,'Document type or rules','Document Type',0,0,'Y',TO_DATE('2012-05-02 12:50:39','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:39','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:39 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000392 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:40 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,DefaultValue,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000393,1,'Y','Y','N',3000251,'N',40,'Y',3000015,'N','LAR','Y','This is a sales transaction (receipt)','Receipt',0,0,'Y',TO_DATE('2012-05-02 12:50:39','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:39','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:40 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000393 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:41 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000394,20,'Y','N','N',3000237,'N',50,'Y',3000015,'N','The document number is usually automatically generated by the system and determined by the document type of the document. If the document is not saved, the preliminary number is displayed in "<>".

If the document type of your document has no automatic document sequence defined, the field is empty if you create a new document. This is for documents which usually have an external number (like vendor invoice).  If you leave the field empty, the system will generate a document number for you. The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).','LAR','Document sequence number of the document','Document No',0,0,'Y',TO_DATE('2012-05-02 12:50:40','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:40','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:41 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000394 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:41 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000395,1,'Y','Y','N',3000249,'N',60,'Y',3000015,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',0,0,'Y',TO_DATE('2012-05-02 12:50:41','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:41','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:41 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000395 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:41 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000396,29,'Y','N','N',3000238,'N',70,'Y',3000015,'N','The Transaction Date indicates the date of the transaction.','LAR','Transaction Date','Transaction Date',0,0,'Y',TO_DATE('2012-05-02 12:50:41','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:41','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:41 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000396 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:42 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000397,10,'Y','N','N',3000239,'N',80,'Y',3000015,'N','A Business Partner is anyone with whom you transact.  This can include Vendor, Customer, Employee or Salesperson','LAR','Identifies a Business Partner','Business Partner ',0,0,'Y',TO_DATE('2012-05-02 12:50:41','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:41','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:42 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000397 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:42 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000398,2,'Y','N','N',3000240,'N',90,'Y',3000015,'N','The Document Status indicates the status of a document at this time.  If you want to change the document status, use the Document Action field','LAR','The current status of the document','Document Status',0,0,'Y',TO_DATE('2012-05-02 12:50:42','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:42','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:42 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000398 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:42 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000399,1,'Y','Y','N',3000241,'N',100,'N',3000015,'N','LAR','ProcessIt',0,0,'Y',TO_DATE('2012-05-02 12:50:42','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:42','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:42 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000399 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:43 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000400,1,'Y','N','N',3000252,'N',110,'Y',3000015,'N','The Processed checkbox indicates that a document has been processed.','LAR','The document has been processed','Processed',0,0,'Y',TO_DATE('2012-05-02 12:50:42','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:42','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:43 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000400 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:43 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000401,14,'Y','Y','N',3000262,'N',120,'Y',3000015,'N','LAR','PayHeaderTotalAmt',0,0,'Y',TO_DATE('2012-05-02 12:50:43','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:43','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:43 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000401 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:43 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,DisplayLogic,EntityType,Included_Tab_ID,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000402,1,'Y','N','N',3000250,'N',130,'Y',3000015,'N','@LAR_PaymentHeader_ID@ > 0','LAR',3000013,'Detail',0,0,'Y',TO_DATE('2012-05-02 12:50:43','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:43','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:43 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000402 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:44 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000403,10,'N','N','N',3000235,'N','Y',3000015,'N','LAR','LAR_PaymentHeader',0,0,'Y',TO_DATE('2012-05-02 12:50:43','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:43','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:44 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000403 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:44 ART
-- Add Payments window
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,AD_Column_ID,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('Y',3000010,20,'N','N',335,3000016,'N','N',3000258,'N','N',1,'Y','N','LAR','Payment Detail',0,0,TO_DATE('2012-05-02 12:50:44','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2012-05-02 12:50:44','YYYY-MM-DD HH24:MI:SS'),'Y','N',0)
;

-- 02/05/2012 12:50:44 ART
-- Add Payments window
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000016 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 02/05/2012 12:50:44 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000404,20,'N','N','N',5041,'N',0,'Y',3000016,'Y','The Info indicates any response information returned from the Credit Card Company.',101,'@IsOnline@=Y','LAR','Response info','Info',0,0,'Y',TO_DATE('2012-05-02 12:50:44','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:44','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:44 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000404 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:45 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000405,14,'N','Y','N',3863,'N',0,'Y',3000016,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',0,0,'Y',TO_DATE('2012-05-02 12:50:44','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:44','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:45 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000405 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:48 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000406,1,'N','N','N',3864,'N',0,'Y',3000016,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',0,0,'Y',TO_DATE('2012-05-02 12:50:45','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:45','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:48 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000406 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:48 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000407,20,'N','N','N',59039,'N',0,'Y',3000016,'N','The ProcessedOn Date+Time save the exact moment (nanoseconds precision if allowed by the DB) when a document has been processed.','LAR','The date+time (expressed in decimal format) when the document has been processed','Processed On',0,0,'Y',TO_DATE('2012-05-02 12:50:48','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:48','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:48 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000407 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:49 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000408,22,'N','N','N',55309,'N',0,'Y',3000016,'N','LAR','ID of document reversal','Reversal ID',0,0,'Y',TO_DATE('2012-05-02 12:50:48','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:48','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:49 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000408 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:49 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000409,14,'N','Y','N',52117,'N',0,'Y',3000016,'N','The Cash Book identifies a unique cash book.  The cash book is used to record cash transactions.','@TenderType@=''X''','LAR','Cash Book for recording petty cash transactions','Cash Book',0,0,'Y',TO_DATE('2012-05-02 12:50:49','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:49','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:49 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000409 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:49 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000410,10,'N','N','N',13705,'N',0,'Y',3000016,'N','LAR','Referenced Payment','N',0,0,'Y',TO_DATE('2012-05-02 12:50:49','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:49','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:49 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000410 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:50 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000411,14,'N','N','N',3862,'N',0,'Y',3000016,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',0,0,'Y',TO_DATE('2012-05-02 12:50:49','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:49','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:50 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000411 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:50 ART
-- Add Payments window
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES (-1,'N',3000412,20,'N','N','N',5401,'N',0,'Y',3000016,'N','The document number is usually automatically generated by the system and determined by the document type of the document. If the document is not saved, the preliminary number is displayed in "<>".

If the document type of your document has no automatic document sequence defined, the field is empty if you create a new document. This is for documents which usually have an external number (like vendor invoice).  If you leave the field empty, the system will generate a document number for you. The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).','LAR','Document sequence number of the document','Document No','N',0,0,'Y',TO_DATE('2012-05-02 12:50:50','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:50','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:50 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000412 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:53 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000413,14,'N','N','N',5399,'N',0,'Y',3000016,'N','The Transaction Date indicates the date of the transaction.','LAR','Transaction Date','Transaction Date',0,0,'Y',TO_DATE('2012-05-02 12:50:50','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:50','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:53 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000413 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:54 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000414,14,'N','N','N',5300,'N',0,'Y',3000016,'N','Electronic Fund Transfer Payment Batch.','LAR','Payment batch for EFT','Payment Batch',0,0,'Y',TO_DATE('2012-05-02 12:50:53','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:53','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:54 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000414 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:54 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000415,14,'N','N','N',5298,'N',0,'Y',3000016,'N','The Partner Bank Account identifies the bank account to be used for this Business Partner','LAR','Bank Account of the Business Partner','Partner Bank Account',0,0,'Y',TO_DATE('2012-05-02 12:50:54','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:54 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000415 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:54 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000416,23,'N','N','N',3877,'N',0,'Y',3000016,'N','LAR','Process Now',0,0,'Y',TO_DATE('2012-05-02 12:50:54','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:54 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000416 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:55 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000417,1,'N','N','N',3878,'N',0,'Y',3000016,'N','The Processed checkbox indicates that a document has been processed.','LAR','The document has been processed','Processed','N',0,0,'Y',TO_DATE('2012-05-02 12:50:54','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:55 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000417 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:55 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000418,60,'N','N','N',8985,'N',0,'Y',3000016,'Y','Swiped information for Credit Card Presence Transactions','LAR','Track 1 and 2 of the Credit Card','Swipe',0,0,'Y',TO_DATE('2012-05-02 12:50:55','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:55','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:55 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000418 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:56 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000419,20,'N','N','N',8983,'N',0,'Y',3000016,'N','The Payment Reference indicates the reference returned from the Credit Card Company for a payment','LAR','Payment Reference Delayed Capture','Reference (DC)',0,0,'Y',TO_DATE('2012-05-02 12:50:55','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:55','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:56 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000419 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:56 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000420,1,'N','N','N',8982,'N',0,'Y',3000016,'N','The Credit Card Verification Code was matched','LAR','Credit Card Verification Code Match','CVV Match',0,0,'Y',TO_DATE('2012-05-02 12:50:56','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:56','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:56 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000420 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:56 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000421,20,'N','N','N',8981,'N',0,'Y',3000016,'N','The Authorization Code indicates the code returned from the electronic transmission.','LAR','Authorization Code Delayed Capture returned','Authorization Code (DC)',0,0,'Y',TO_DATE('2012-05-02 12:50:56','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:56','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:56 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000421 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:57 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000422,11,'N','N','N',8980,'N',0,'Y',3000016,'N','The Charge Amount indicates the amount for an additional charge.','LAR','Charge Amount','Charge amount',0,0,'Y',TO_DATE('2012-05-02 12:50:56','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:56','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:57 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000422 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:57 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000423,1,'N','N','N',8979,'N',0,'Y',3000016,'N','Delayed Capture is required, if you ship products.  The first credit card transaction is the Authorization, the second is the actual transaction after the shipment of the product.','LAR','Charge after Shipment','Delayed Capture',0,0,'Y',TO_DATE('2012-05-02 12:50:57','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:57','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:57 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000423 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:57 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000424,1,'N','Y','N',6216,'N',0,'Y',3000016,'Y','LAR','This is a sales transaction (receipt)','Receipt',0,0,'Y',TO_DATE('2012-05-02 12:50:57','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:57','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:57 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000424 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:58 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000425,23,'N','Y','N',5497,'N',0,'Y',3000016,'N','You find the current status in the Document Status field. The options are listed in a popup',101,'LAR','The targeted status of the document','Document Action','N',0,0,'Y',TO_DATE('2012-05-02 12:50:57','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:57','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:58 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000425 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:58 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000426,14,'Y','Y','N',3880,'N',10,'Y',3000016,'N','The Bank Account identifies an account at this Bank.','LAR','Account at the Bank','Bank Account',0,0,'Y',TO_DATE('2012-05-02 12:50:58','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:58','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:58 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000426 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:58 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000427,14,'Y','Y','N',12128,'N',20,'Y',3000016,'N','The Accounting Date indicates the date to be used on the General Ledger account entries generated from this document. It is also used for any currency conversion.','LAR','Accounting Date','Account Date',0,0,'Y',TO_DATE('2012-05-02 12:50:58','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:58','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:58 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000427 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:59 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000428,60,'Y','N','N',12127,'N',30,'Y',3000016,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',0,0,'Y',TO_DATE('2012-05-02 12:50:58','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:58','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:59 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000428 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:59 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000429,26,'Y','Y','N',5355,'N',40,'Y',3000016,'N','The Invoice Document.','LAR','Invoice Identifier','Invoice',0,0,'Y',TO_DATE('2012-05-02 12:50:59','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:59','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:59 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000429 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:50:59 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000430,26,'Y','Y','N',12925,'N',50,'Y',3000016,'N','The Order is a control document.  The  Order is complete when the quantity ordered is the same as the quantity shipped and invoiced.  When you close an order, unshipped (backordered) quantities are cancelled.','LAR','Order','Order',0,0,'Y',TO_DATE('2012-05-02 12:50:59','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:59','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:50:59 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000430 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:00 ART
-- Add Payments window
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES (1,'N',3000431,14,'Y','N','N',5043,'N',60,'Y',3000016,'N','The Payment is a unique identifier of this payment.','LAR','Payment identifier','Payment',0,0,'Y',TO_DATE('2012-05-02 12:50:59','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:50:59','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:00 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000431 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:00 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,DefaultValue,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000432,26,'Y','Y','N',5398,'N',70,'Y',3000016,'Y','A Business Partner is anyone with whom you transact.  This can include Vendor, Customer, Employee or Salesperson',104,'LAR','@SQL=SELECT C_Bpartner_ID FROM LAR_PaymentHeader ph WHERE ph.LAR_PaymentHeader_ID = @LAR_PaymentHeader_ID@','Identifies a Business Partner','Business Partner ',0,0,'Y',TO_DATE('2012-05-02 12:51:00','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:00','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:00 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000432 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:01 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000433,14,'Y','Y','N',8554,'N',80,'Y',3000016,'N','A Project allows you to track and control internal or external activities.','@$Element_PJ@=Y & @C_Invoice_ID@=0 | @C_Invoice_ID@=''''','LAR','Financial Project','Project',0,0,'Y',TO_DATE('2012-05-02 12:51:00','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:00','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:01 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000433 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:01 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000434,14,'Y','N','N',8984,'N',90,'Y',3000016,'N','The Charge indicates a type of Charge (Handling, Shipping, Restocking)',104,'LAR','Additional document charges','Charge',0,0,'Y',TO_DATE('2012-05-02 12:51:01','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:01','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:01 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000434 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:01 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000435,1,'Y','Y','N',13045,'N',100,'Y',3000016,'Y','Payments not allocated to an invoice with a charge are posted to Unallocated Payments. When setting this flag, the payment is posted to the Customer or Vendor Prepayment account.',104,'LAR','The Payment/Receipt is a Prepayment','Prepayment',0,0,'Y',TO_DATE('2012-05-02 12:51:01','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:01','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:02 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000435 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:02 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000436,14,'Y','N','N',9566,'N',110,'Y',3000016,'N','Activities indicate tasks that are performed and used to utilize Activity based Costing','@$Element_AY@=Y','LAR','Business Activity','Activity',0,0,'Y',TO_DATE('2012-05-02 12:51:02','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:02','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:02 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000436 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:02 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000437,14,'Y','N','N',9564,'N',120,'Y',3000016,'N','The Campaign defines a unique marketing program.  Projects can be associated with a pre defined Marketing Campaign.  You can then report based on a specific Campaign.','@$Element_MC@=Y','LAR','Marketing Campaign','Campaign',0,0,'Y',TO_DATE('2012-05-02 12:51:02','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:02','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:02 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000437 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:02 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000438,14,'Y','N','N',9565,'N',130,'Y',3000016,'N','The organization which performs or initiates this transaction (for another organization).  The owning Organization may not be the transaction organization in a service bureau environment, with centralized services, and inter-organization transactions.','@$Element_OT@=Y','LAR','Performing or initiating organization','Trx Organization',0,0,'Y',TO_DATE('2012-05-02 12:51:02','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:02','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:02 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000438 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:03 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000439,14,'Y','N','N',9563,'N',140,'Y',3000016,'N','The user defined element displays the optional elements that have been defined for this account combination.','@$Element_U1@=Y','LAR','User defined list element #1','User List 1',0,0,'Y',TO_DATE('2012-05-02 12:51:02','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:02','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:03 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000439 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:03 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000440,14,'Y','Y','N',9567,'N',150,'Y',3000016,'N','The user defined element displays the optional elements that have been defined for this account combination.','@$Element_U2@=Y','LAR','User defined list element #2','User List 2',0,0,'Y',TO_DATE('2012-05-02 12:51:03','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:03','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:03 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000440 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:04 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000441,26,'Y','N','N',5303,'N',160,'Y',3000016,'N','Indicates the amount this payment is for.  The payment amount can be for single or multiple invoices or a partial payment for an invoice.',103,'LAR','Amount being paid','Payment amount',0,0,'Y',TO_DATE('2012-05-02 12:51:03','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:03','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:04 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000441 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:04 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000442,14,'Y','Y','N',5299,'N',170,'Y',3000016,'N','Indicates the Currency to be used when processing or reporting on this record','LAR','The Currency for this record','Currency',0,0,'Y',TO_DATE('2012-05-02 12:51:04','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:04','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:04 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000442 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:05 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,DefaultValue,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000443,14,'Y','N','N',10265,'N',180,'Y',3000016,'N','The Currency Conversion Rate Type lets you define different type of rates, e.g. Spot, Corporate and/or Sell/Buy rates.','@C_Currency_ID@!@$C_Currency_ID@','LAR','@SQL=SELECT C_DocType_ID FROM LAR_PaymentHeader ph WHERE ph.LAR_PaymentHeader_ID = @LAR_PaymentHeader_ID@','Currency Conversion Rate Type','Currency Type',0,0,'Y',TO_DATE('2012-05-02 12:51:04','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:04','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:05 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000443 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:05 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000444,26,'Y','N','N',5301,'N',190,'Y',3000016,'N','The Discount Amount indicates the discount amount for a document or line.','@C_Invoice_ID@^''''','LAR','Calculated amount of discount','Discount Amount',0,0,'Y',TO_DATE('2012-05-02 12:51:05','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:05','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:05 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000444 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:05 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000445,26,'Y','Y','N',6475,'N',200,'Y',3000016,'N','The Write Off Amount indicates the amount to be written off as uncollectible.','@C_Invoice_ID@^''''','LAR','Amount to write-off','Write-off Amount',0,0,'Y',TO_DATE('2012-05-02 12:51:05','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:05','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:06 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000445 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:06 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000446,1,'Y','N','N',7035,'N',210,'Y',3000016,'N','Overpayments (negative) are unallocated amounts and allow you to receive money for more than the particular invoice. 
Underpayments (positive) is a partial payment for the invoice. You do not write off the unpaid amount.','@C_Invoice_ID@^''''','LAR','Over-Payment (unallocated) or Under-Payment (partial payment)','Over/Under Payment',0,0,'Y',TO_DATE('2012-05-02 12:51:06','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:06 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000446 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:06 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000447,26,'Y','Y','N',7034,'N',220,'Y',3000016,'N','Overpayments (negative) are unallocated amounts and allow you to receive money for more than the particular invoice. 
Underpayments (positive) is a partial payment for the invoice. You do not write off the unpaid amount.','@IsOverUnderPayment@=Y & @C_Invoice_ID@^''''','LAR','Over-Payment (unallocated) or Under-Payment (partial payment) Amount','Over/Under Payment',0,0,'Y',TO_DATE('2012-05-02 12:51:06','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:06 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000447 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:10 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000448,20,'Y','N','N',3000103,'N',230,'Y',3000016,'N','LAR','Withholding Amount',0,0,'Y',TO_DATE('2012-05-02 12:51:06','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:10 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000448 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:10 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000449,20,'Y','Y','N',3000104,'N',240,'Y',3000016,'N','LAR','WithholdingPercent',0,0,'Y',TO_DATE('2012-05-02 12:51:10','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:10','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:10 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000449 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:10 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000450,14,'Y','N','N',5046,'N',250,'Y',3000016,'N','The Tender Type indicates the method of payment (ACH or Direct Deposit, Credit Card, Check, Direct Debit)',125,'LAR','Method of Payment','Tender type',0,0,'Y',TO_DATE('2012-05-02 12:51:10','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:10','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:10 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000450 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:11 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000451,1,'Y','Y','N',5495,'N',260,'Y',3000016,'N','The Online Access check box indicates if the application can be accessed via the web. ','LAR','Can be accessed online ','Online Access',0,0,'Y',TO_DATE('2012-05-02 12:51:10','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:10','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:11 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000451 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:11 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000452,20,'Y','N','N',3873,'N',270,'Y',3000016,'N','The Bank Routing Number (ABA Number) identifies a legal Bank.  It is used in routing checks and electronic transactions.','@TenderType@=A | @TenderType@=K','LAR','Bank Routing Number','Routing No',0,0,'Y',TO_DATE('2012-05-02 12:51:11','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:11','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:11 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000452 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:11 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000453,20,'Y','Y','N',3874,'N',280,'Y',3000016,'N','The Account Number indicates the Number assigned to this bank account. ','@TenderType@=A | @TenderType@=K','LAR','Account Number','Account No',0,0,'Y',TO_DATE('2012-05-02 12:51:11','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:11','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:11 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000453 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:12 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000454,20,'Y','N','N',5049,'N',290,'Y',3000016,'N','The Check Number indicates the number on the check.','@TenderType@=K','LAR','Check Number','Check No',0,0,'Y',TO_DATE('2012-05-02 12:51:11','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:11','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:12 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000454 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:15 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000455,20,'Y','Y','N',5048,'N',300,'Y',3000016,'N','The Micr number is the combination of the bank routing number, account number and check number','@TenderType@=K','LAR','Combination of routing no, account and check no','Micr',0,0,'Y',TO_DATE('2012-05-02 12:51:12','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:12','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:15 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000455 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:15 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000456,14,'Y','N','N',3869,'N',310,'Y',3000016,'N','The Credit Card drop down list box is used for selecting the type of Credit Card presented for payment.','@TenderType@=C','LAR','Credit Card (Visa, MC, AmEx)','Credit Card',0,0,'Y',TO_DATE('2012-05-02 12:51:15','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:15','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:15 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000456 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:16 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000457,14,'Y','Y','N',5044,'N',320,'Y',3000016,'N','The Transaction Type indicates the type of transaction to be submitted to the Credit Card Company.','@TenderType@=C','LAR','Type of credit card transaction','Transaction Type',0,0,'Y',TO_DATE('2012-05-02 12:51:15','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:15','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:16 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000457 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:16 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,ObscureType,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000458,20,'Y','N','N',3870,'N',330,'Y',3000016,'N','The Credit Card number indicates the number on the credit card, without blanks or spaces.','904','@TenderType@=C','LAR','Credit Card Number ','Number',0,0,'Y',TO_DATE('2012-05-02 12:51:16','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:16','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:16 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000458 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:16 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000459,5,'Y','Y','N',5047,'N',340,'Y',3000016,'N','The Credit Card Verification indicates the verification code on the credit card (AMEX 4 digits on front; MC,Visa 3 digits back)','@TenderType@=C','LAR','Credit Card Verification code on credit card','Verification Code',0,0,'Y',TO_DATE('2012-05-02 12:51:16','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:16','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:16 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000459 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:17 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000460,11,'Y','N','N',3871,'N',350,'Y',3000016,'N','The Expiry Month indicates the expiry month for this credit card.','@TenderType@=C','LAR','Expiry Month','Exp. Month',0,0,'Y',TO_DATE('2012-05-02 12:51:16','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:16','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:17 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000460 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:20 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000461,11,'Y','Y','N',3872,'N',360,'Y',3000016,'N','The Expiry Year indicates the expiry year for this credit card.','@TenderType@=C','LAR','Expiry Year','Exp. Year',0,0,'Y',TO_DATE('2012-05-02 12:51:17','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:17','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:20 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000461 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:21 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000462,20,'Y','N','N',5050,'N',370,'Y',3000016,'N','The Name of the Credit Card or Account holder.','@TenderType@=C | @TenderType@=K','LAR','Name on Credit Card or Account holder','Account Name',0,0,'Y',TO_DATE('2012-05-02 12:51:20','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:20','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:21 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000462 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:21 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000463,20,'Y','Y','N',5051,'N',380,'Y',3000016,'N','The Street Address of the Credit Card or Account holder.','@TenderType@=C | @TenderType@=K & @IsOnline@=Y','LAR','Street address of the Credit Card or Account holder','Account Street',0,0,'Y',TO_DATE('2012-05-02 12:51:21','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:21','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:21 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000463 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:21 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000464,20,'Y','N','N',5052,'N',390,'Y',3000016,'N','The Account City indicates the City of the Credit Card or Account holder','@TenderType@=C | @TenderType@=K & @IsOnline@=Y','LAR','City or the Credit Card or Account Holder','Account City',0,0,'Y',TO_DATE('2012-05-02 12:51:21','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:21','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:21 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000464 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:22 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000465,11,'Y','Y','N',5026,'N',400,'Y',3000016,'N','The Zip Code of the Credit Card or Account Holder.','@TenderType@=C | @TenderType@=K & @IsOnline@=Y','LAR','Zip Code of the Credit Card or Account Holder','Account Zip/Postal',0,0,'Y',TO_DATE('2012-05-02 12:51:21','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:21','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:22 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000465 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:22 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000466,11,'Y','N','N',5053,'N',410,'Y',3000016,'N','The State of the Credit Card or Account holder','@TenderType@=C | @TenderType@=K & @IsOnline@=Y','LAR','State of the Credit Card or Account holder','Account State',0,0,'Y',TO_DATE('2012-05-02 12:51:22','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:22','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:22 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000466 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:25 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000467,20,'Y','Y','N',8213,'N',420,'Y',3000016,'N','Account Country Name','@TenderType@=C | @TenderType@=K & @IsOnline@=Y','LAR','Country','Account Country',0,0,'Y',TO_DATE('2012-05-02 12:51:22','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:22','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:25 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000467 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:26 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000468,20,'Y','N','N',5027,'N',430,'Y',3000016,'N','The Driver''s License being used as identification.','@TenderType@=K & @IsOnline@=Y','LAR','Payment Identification - Driver License','Driver License',0,0,'Y',TO_DATE('2012-05-02 12:51:25','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:25','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:26 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000468 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:26 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000469,20,'Y','Y','N',5028,'N',440,'Y',3000016,'N','The Social Security number being used as identification.','@TenderType@=K & @IsOnline@=Y','LAR','Payment Identification - Social Security No','Social Security No',0,0,'Y',TO_DATE('2012-05-02 12:51:26','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:26','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:26 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000469 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:26 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000470,20,'Y','N','N',5029,'N',450,'Y',3000016,'N','The EMail Address indicates the EMail address off the Credit Card or Account holder.','@TenderType@=K & @IsOnline@=Y','LAR','Email Address','Account EMail',0,0,'Y',TO_DATE('2012-05-02 12:51:26','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:26','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:26 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000470 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:27 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000471,26,'Y','N','N',5034,'N',460,'N',3000016,'N','The Tax Amount displays the total tax amount. The tax amount is only used for credit card processing.','@CreditCardType@=P & @IsOnline@=Y','LAR','Tax Amount for Credit Card transaction','Tax Amount',0,0,'Y',TO_DATE('2012-05-02 12:51:26','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:26','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:27 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000471 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:27 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000472,20,'Y','Y','N',5032,'N',470,'Y',3000016,'N','The PO Number indicates the number assigned to a purchase order','@CreditCardType@=P & @IsOnline@=Y','LAR','Purchase Order Number','PO Number',0,0,'Y',TO_DATE('2012-05-02 12:51:27','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:27','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:27 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000472 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:27 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000473,20,'Y','N','N',5030,'N',480,'Y',3000016,'N','The Voice Authorization Code indicates the code received from the Credit Card Company.','@IsOnline@=Y','LAR','Voice Authorization Code from credit card company','Voice authorization code',0,0,'Y',TO_DATE('2012-05-02 12:51:27','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:27','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:27 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000473 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:31 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000474,20,'Y','Y','N',5031,'N',490,'Y',3000016,'N','The Original Transaction ID is used for reversing transactions and indicates the transaction that has been reversed.','@IsOnline@=Y','LAR','Original Transaction ID','Original Transaction ID',0,0,'Y',TO_DATE('2012-05-02 12:51:27','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:27','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:31 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000474 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:31 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000475,23,'Y','N','N',5356,'N',500,'Y',3000016,'N','The Online Processing indicates if the payment can be processed online.','@IsOnline@=Y','LAR','This payment can be processed online','Online Processing',0,0,'Y',TO_DATE('2012-05-02 12:51:31','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:31 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000475 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:31 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000476,1,'Y','Y','N',3875,'N',510,'Y',3000016,'Y','The Approved checkbox indicates if this document requires approval before it can be processed.',101,'@IsOnline@=Y','LAR','Indicates if this document requires approval','Approved','N',0,0,'Y',TO_DATE('2012-05-02 12:51:31','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:31 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000476 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:32 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000477,20,'Y','N','N',5036,'N',520,'Y',3000016,'Y','The Response Result indicates the result of the transmission to the Credit Card Company.',101,'@IsOnline@=Y','LAR','Result of transmission','Result',0,0,'Y',TO_DATE('2012-05-02 12:51:31','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:32 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000477 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:32 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000478,20,'Y','Y','N',5037,'N',530,'Y',3000016,'Y','The Response Message indicates the message returned from the Credit Card Company as the result of a transmission',101,'@IsOnline@=Y','LAR','Response message','Response Message',0,0,'Y',TO_DATE('2012-05-02 12:51:32','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:32 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000478 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:32 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000479,20,'Y','N','N',5035,'N',540,'Y',3000016,'Y','The Payment Reference indicates the reference returned from the Credit Card Company for a payment',101,'@IsOnline@=Y','LAR','Payment reference','Reference',0,0,'Y',TO_DATE('2012-05-02 12:51:32','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:32 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000479 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:33 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000480,20,'Y','Y','N',5038,'N',550,'Y',3000016,'Y','The Authorization Code indicates the code returned from the electronic transmission.',101,'@IsOnline@=Y','LAR','Authorization Code returned','Authorization Code',0,0,'Y',TO_DATE('2012-05-02 12:51:32','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:33 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000480 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:33 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000481,14,'Y','N','N',5040,'N',560,'Y',3000016,'Y','The Zip Verified indicates if the zip code has been verified by the Credit Card Company.',101,'@IsOnline@=Y','LAR','The Zip Code has been verified','Zip verified',0,0,'Y',TO_DATE('2012-05-02 12:51:33','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:33 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000481 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:34 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000482,14,'Y','Y','N',5039,'N',570,'Y',3000016,'Y','The Address Verified indicates if the address has been verified by the Credit Card Company.',101,'@IsOnline@=Y','LAR','This address has been verified','Address verified',0,0,'Y',TO_DATE('2012-05-02 12:51:33','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:34 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000482 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:34 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000483,14,'Y','N','N',5496,'N',580,'Y',3000016,'Y','The Document Status indicates the status of a document at this time.  If you want to change the document status, use the Document Action field',101,'LAR','The current status of the document','Document Status','N',0,0,'Y',TO_DATE('2012-05-02 12:51:34','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:34 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000483 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:34 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000484,23,'Y','Y','N',5042,'N',590,'Y',3000016,'N','The Posted field indicates the status of the Generation of General Ledger Accounting Lines ','@Processed@=Y & @#ShowAcct@=Y','LAR','Posting status','Posted','N',0,0,'Y',TO_DATE('2012-05-02 12:51:34','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:34 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000484 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:35 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,DefaultValue,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000485,14,'Y','Y','N',5302,'N',600,'Y',3000016,'Y','The Document Type determines document sequence and processing rules','LAR','@SQL=SELECT C_DocType_ID FROM LAR_PaymentHeader ph WHERE ph.LAR_PaymentHeader_ID = @LAR_PaymentHeader_ID@','Document type or rules','Document Type',0,0,'Y',TO_DATE('2012-05-02 12:51:34','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:35 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000485 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:35 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000486,1,'Y','N','N',3000261,'N',610,'Y',3000016,'N','LAR','IsOnDrawer',0,0,'Y',TO_DATE('2012-05-02 12:51:35','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:35','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:35 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000486 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:35 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000487,1,'Y','Y','N',3879,'N',620,'Y',3000016,'N','LAR','Payment is reconciled with bank statement','Reconciled','N',0,0,'Y',TO_DATE('2012-05-02 12:51:35','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:35','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:35 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000487 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:36 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000488,10,'Y','N','N',3000258,'N',630,'Y',3000016,'N','LAR','LAR_PaymentHeader',0,0,'Y',TO_DATE('2012-05-02 12:51:35','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:35','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:36 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000488 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:36 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000489,10,'Y','Y','N',3000259,'N',640,'Y',3000016,'N','LAR','LAR_PaymentSource_ID',0,0,'Y',TO_DATE('2012-05-02 12:51:36','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:36','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:36 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000489 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:36 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000490,1,'Y','N','N',8775,'N',650,'Y',3000016,'Y','Self-Service allows users to enter data or update their data.  The flag indicates, that this record was entered or created via Self-Service or that the user can change it via the Self-Service functionality.','LAR','This is a Self-Service entry or this entry can be changed via Self-Service','Self-Service','N',0,0,'Y',TO_DATE('2012-05-02 12:51:36','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:36','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:36 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000490 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:37 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000491,1,'Y','Y','N',5400,'N',660,'Y',3000016,'Y','The Allocated checkbox indicates if a payment has been allocated or associated with an invoice or invoices.','@Processed@=Y','LAR','Indicates if the payment has been allocated','Allocated','N',0,0,'Y',TO_DATE('2012-05-02 12:51:36','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:36','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:37 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000491 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:37 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,DisplayLogic,EntityType,Included_Tab_ID,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000492,1,'Y','N','N',3000260,'N',670,'Y',3000016,'N','@C_Payment_ID@ > 0','LAR',3000014,'Allocation',0,0,'Y',TO_DATE('2012-05-02 12:51:37','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:37','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:37 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000492 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:37 ART
-- Add Payments window
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,AD_Column_ID,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('Y',3000010,30,'N','N',390,3000017,'N','N',4884,'N','Y',2,'N','N','LAR','Allocation',0,0,TO_DATE('2012-05-02 12:51:37','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2012-05-02 12:51:37','YYYY-MM-DD HH24:MI:SS'),'Y','N',0)
;

-- 02/05/2012 12:51:37 ART
-- Add Payments window
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000017 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 02/05/2012 12:51:38 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000493,26,'N','N','N',5494,'N',0,'Y',3000017,'N','A Business Partner is anyone with whom you transact.  This can include Vendor, Customer, Employee or Salesperson','LAR','Identifies a Business Partner','Business Partner ',0,0,'Y',TO_DATE('2012-05-02 12:51:37','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:37','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:38 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000493 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:38 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000494,14,'N','N','N',12331,'N',0,'Y',3000017,'N','Allocation of Cash/Payment to Invoice','LAR','Allocation Line','Allocation Line',0,0,'Y',TO_DATE('2012-05-02 12:51:38','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:38','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:38 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000494 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:41 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000495,1,'N','N','N',5520,'N',0,'Y',3000017,'N','The Manual check box indicates if the process will done manually.','LAR','This is a manual process','Manual',0,0,'Y',TO_DATE('2012-05-02 12:51:38','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:38','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:41 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000495 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:42 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000496,26,'N','N','N',5210,'N',0,'Y',3000017,'N','The Cash Journal Line indicates a unique line in a cash journal.','LAR','Cash Journal Line','Cash Journal Line','N',0,0,'Y',TO_DATE('2012-05-02 12:51:41','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:41','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:42 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000496 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:42 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000497,1,'N','N','N',4877,'N',0,'Y',3000017,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',0,0,'Y',TO_DATE('2012-05-02 12:51:42','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:42','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:42 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000497 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:42 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000498,14,'Y','N','N',4875,'N',10,'Y',3000017,'Y','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',0,0,'Y',TO_DATE('2012-05-02 12:51:42','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:42','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:42 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000498 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:43 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000499,14,'Y','Y','N',4876,'N',20,'Y',3000017,'Y','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',0,0,'Y',TO_DATE('2012-05-02 12:51:42','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:42','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:43 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000499 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:43 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000500,26,'Y','N','N',4884,'N',30,'Y',3000017,'Y','The Payment is a unique identifier of this payment.','LAR','Payment identifier','Payment','N',0,0,'Y',TO_DATE('2012-05-02 12:51:43','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:43','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:43 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000500 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:44 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000501,14,'Y','N','N',4874,'N',40,'Y',3000017,'Y','LAR','Payment allocation','Allocation',0,0,'Y',TO_DATE('2012-05-02 12:51:43','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:43','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:44 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000501 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:44 ART
-- Add Payments window
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES (1,'N',3000502,14,'Y','Y','N',5519,'N',50,'Y',3000017,'Y','The Transaction Date indicates the date of the transaction.','LAR','Transaction Date','Transaction Date',0,0,'Y',TO_DATE('2012-05-02 12:51:44','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:44','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:44 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000502 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:44 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000503,26,'Y','N','N',4882,'N',60,'Y',3000017,'Y','The Invoice Document.','LAR','Invoice Identifier','Invoice',0,0,'Y',TO_DATE('2012-05-02 12:51:44','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:44','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:44 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000503 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:45 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000504,26,'Y','Y','N',4883,'N',70,'Y',3000017,'Y','The Order is a control document.  The  Order is complete when the quantity ordered is the same as the quantity shipped and invoiced.  When you close an order, unshipped (backordered) quantities are cancelled.','LAR','Order','Order',0,0,'Y',TO_DATE('2012-05-02 12:51:44','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:44','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:45 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000504 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:45 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000505,26,'Y','N','N',4885,'N',80,'Y',3000017,'Y','The Amount indicates the amount for this document line.','LAR','Amount in a defined currency','Amount',0,0,'Y',TO_DATE('2012-05-02 12:51:45','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:45','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:45 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000505 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:45 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000506,26,'Y','N','N',4886,'N',100,'Y',3000017,'Y','The Discount Amount indicates the discount amount for a document or line.','LAR','Calculated amount of discount','Discount Amount',0,0,'Y',TO_DATE('2012-05-02 12:51:45','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:45','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:45 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000506 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:46 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000507,26,'Y','Y','N',4887,'N',110,'Y',3000017,'Y','The Write Off Amount indicates the amount to be written off as uncollectible.','LAR','Amount to write-off','Write-off Amount',0,0,'Y',TO_DATE('2012-05-02 12:51:45','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:45','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:46 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000507 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:51:46 ART
-- Add Payments window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000508,26,'Y','N','N',10762,'N',120,'Y',3000017,'Y','Overpayments (negative) are unallocated amounts and allow you to receive money for more than the particular invoice. 
Underpayments (positive) is a partial payment for the invoice. You do not write off the unpaid amount.','LAR','Over-Payment (unallocated) or Under-Payment (partial payment) Amount','Over/Under Payment',0,0,'Y',TO_DATE('2012-05-02 12:51:46','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-02 12:51:46','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2012 12:51:46 ART
-- Add Payments window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000508 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2012 12:55:31 ART
-- Add Payments window
UPDATE AD_Tab SET WhereClause='IsReceipt=''N'' AND C_BPartner_ID is not null', Name='Payment Header',Updated=TO_DATE('2012-05-02 12:55:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Tab_ID=3000015
;

-- 02/05/2012 12:55:31 ART
-- Add Payments window
UPDATE AD_Tab_Trl SET IsTranslated='N' WHERE AD_Tab_ID=3000015
;

-- 02/05/2012 12:55:57 ART
-- Add Payments window
UPDATE AD_Tab SET Name='Payment Detail',Updated=TO_DATE('2012-05-02 12:55:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Tab_ID=3000016
;

-- 02/05/2012 12:55:57 ART
-- Add Payments window
UPDATE AD_Tab_Trl SET IsTranslated='N' WHERE AD_Tab_ID=3000016
;

-- 02/05/2012 13:04:05 ART
-- Add Payments window
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3000388
;

-- 02/05/2012 13:04:05 ART
-- Add Payments window
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3000398
;

-- 02/05/2012 13:04:05 ART
-- Add Payments window
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3000399
;

-- 02/05/2012 13:04:05 ART
-- Add Payments window
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3000400
;

-- 02/05/2012 13:04:05 ART
-- Add Payments window
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3000401
;

-- 02/05/2012 13:04:05 ART
-- Add Payments window
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000402
;

-- 02/05/2012 13:07:14 ART
-- Add Payments window
UPDATE AD_Field SET IsSameLine='Y', Description='Search available ARR Receipts with tender type Check',Updated=TO_DATE('2012-05-02 13:07:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000388
;

-- 02/05/2012 13:07:14 ART
-- Add Payments window
UPDATE AD_Field_Trl SET IsTranslated='N' WHERE AD_Field_ID=3000388
;

-- 02/05/2012 13:13:23 ART
-- Add Payments window
INSERT INTO AD_Menu (AD_Window_ID,AD_Menu_ID,IsSummary,Action,IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000010,3000014,'N','W','N','N','LAR','Y','Payments (Vendor)',TO_DATE('2012-05-02 13:13:22','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,0,TO_DATE('2012-05-02 13:13:22','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 02/05/2012 13:13:23 ART
-- Add Payments window
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000014 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 02/05/2012 13:13:23 ART
-- Add Payments window
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', SysDate, 0, SysDate, 0,t.AD_Tree_ID, 3000014, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000014)
;

-- 02/05/2012 13:13:45 ART
-- Add Payments window
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=0, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000013
;

-- 02/05/2012 13:13:45 ART
-- Add Payments window
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=1, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000014
;

-- 02/05/2012 13:13:45 ART
-- Add Payments window
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=2, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=241
;

-- 02/05/2012 13:13:45 ART
-- Add Payments window
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=3, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=288
;

-- 02/05/2012 13:13:45 ART
-- Add Payments window
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=4, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=432
;

-- 02/05/2012 13:13:45 ART
-- Add Payments window
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=5, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=243
;

-- 02/05/2012 13:13:45 ART
-- Add Payments window
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=6, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=413
;

-- 02/05/2012 13:13:45 ART
-- Add Payments window
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=7, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=538
;

-- 02/05/2012 13:13:45 ART
-- Add Payments window
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=8, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=462
;

-- 02/05/2012 13:13:45 ART
-- Add Payments window
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=9, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=505
;

-- 02/05/2012 13:13:45 ART
-- Add Payments window
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=10, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=235
;

-- 02/05/2012 13:13:45 ART
-- Add Payments window
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=11, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=511
;

-- 02/05/2012 13:13:45 ART
-- Add Payments window
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=12, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=245
;

-- 02/05/2012 13:13:45 ART
-- Add Payments window
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=13, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=251
;

-- 02/05/2012 13:13:45 ART
-- Add Payments window
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=14, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=246
;

-- 02/05/2012 13:13:45 ART
-- Add Payments window
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=15, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=509
;

-- 02/05/2012 13:13:45 ART
-- Add Payments window
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=16, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=510
;

-- 02/05/2012 13:13:45 ART
-- Add Payments window
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=17, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=496
;

-- 02/05/2012 13:13:45 ART
-- Add Payments window
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=18, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=497
;

-- 02/05/2012 13:13:45 ART
-- Add Payments window
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=19, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=304
;

-- 02/05/2012 13:13:45 ART
-- Add Payments window
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=20, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=255
;

-- 02/05/2012 13:13:45 ART
-- Add Payments window
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=21, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=286
;

-- 02/05/2012 13:13:45 ART
-- Add Payments window
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=22, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=287
;

-- 02/05/2012 13:13:45 ART
-- Add Payments window
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=23, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=438
;

-- 02/05/2012 13:13:45 ART
-- Add Payments window
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=24, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=234
;

-- 02/05/2012 13:13:45 ART
-- Add Payments window
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=25, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=244
;

-- 02/05/2012 13:13:45 ART
-- Add Payments window
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=26, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53313
;

-- 02/05/2012 13:13:45 ART
-- Add Payments window
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=27, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53314
;

-- 02/05/2012 13:13:45 ART
-- Add Payments window
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=28, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53190
;

-- 02/05/2012 13:13:45 ART
-- Add Payments window
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=29, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53187
;

-- 02/05/2012 13:14:39 ART
-- Add Payments window
UPDATE AD_SysConfig SET Value='N',Updated=TO_DATE('2012-05-02 13:14:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_SysConfig_ID=50011
;

-- 02/05/2012 13:14:42 ART
-- Add Payments window
UPDATE AD_SysConfig SET Value='N',Updated=TO_DATE('2012-05-02 13:14:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_SysConfig_ID=50013
;

-- 02/05/2012 13:14:47 ART
-- Add Payments window
UPDATE AD_SysConfig SET Value='N',Updated=TO_DATE('2012-05-02 13:14:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_SysConfig_ID=50012
;

-- 03/05/2012 0:18:49 ART
-- Add Payments window
UPDATE AD_Field SET Included_Tab_ID=3000016,Updated=TO_DATE('2012-05-03 00:18:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000402
;

-- 03/05/2012 0:19:40 ART
-- Add Payments window
UPDATE AD_Field SET Included_Tab_ID=3000017,Updated=TO_DATE('2012-05-03 00:19:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000492
;

-- 03/05/2012 0:41:14 ART
-- Add Payments window
UPDATE AD_Field SET AD_Val_Rule_ID=3000002,Updated=TO_DATE('2012-05-03 00:41:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000392
;

-- 03/05/2012 0:41:56 ART
-- Add Payments window
UPDATE AD_Field SET DefaultValue='N',Updated=TO_DATE('2012-05-03 00:41:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000393
;

-- 03/05/2012 10:10:36 ART
--Mark some fields as Read Only on Receipts and Payment windows
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2012-05-03 10:10:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000367
;

-- 03/05/2012 10:10:52 ART
--Mark some fields as Read Only on Receipts and Payment windows
UPDATE AD_Field SET DefaultValue='Y',Updated=TO_DATE('2012-05-03 10:10:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000367
;

-- 03/05/2012 10:11:10 ART
--Mark some fields as Read Only on Receipts and Payment windows
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2012-05-03 10:11:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000289
;

-- 03/05/2012 10:12:36 ART
--Mark some fields as Read Only on Receipts and Payment windows
UPDATE AD_Field SET IsReadOnly='Y', DefaultValue='N',Updated=TO_DATE('2012-05-03 10:12:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000486
;

-- 03/05/2012 10:12:48 ART
--Mark some fields as Read Only on Receipts and Payment windows
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2012-05-03 10:12:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000487
;
-- 03/05/2012 11:10:19 ART
--Mark some fields as Read Only on Receipts and Payment windows
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2012-05-03 11:10:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000489
;

-- 03/05/2012 15:05:58 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Window (AD_Window_ID,WindowType,IsSOTrx,IsDefault,IsBetaFunctionality,WinHeight,WinWidth,EntityType,Name,Description,IsActive,Created,UpdatedBy,CreatedBy,Updated,AD_Org_ID,AD_Client_ID,Processing) VALUES (3000011,'M','Y','N','N',0,0,'LAR','On Drawer Checks','List all ARR Receipts with Check Tender Type which are on drawer','Y',TO_DATE('2012-05-03 15:05:47','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:05:47','YYYY-MM-DD HH24:MI:SS'),0,0,'N')
;

-- 03/05/2012 15:05:58 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Window_Trl (AD_Language,AD_Window_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Window_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Window t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Window_ID=3000011 AND NOT EXISTS (SELECT * FROM AD_Window_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Window_ID=t.AD_Window_ID)
;

-- 03/05/2012 15:09:51 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,WhereClause,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('N',3000011,10,'N','N',335,3000018,'N','N','N','IsReceipt=''Y'' AND C_BPartner_ID is not null AND TenderType=''K'' AND IsOnDrawer=''Y'' AND IsReconciled=''N'' AND Docstatus !=''DR''','N',0,'Y','N','LAR','On Drawer Checks',0,0,TO_DATE('2012-05-03 15:09:50','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2012-05-03 15:09:50','YYYY-MM-DD HH24:MI:SS'),'Y','N',0)
;

-- 03/05/2012 15:09:51 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000018 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 03/05/2012 15:10:44 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000509,10,'N','N','N',13705,'N',0,'Y',3000018,'N','LAR','Referenced Payment','N',0,0,'Y',TO_DATE('2012-05-03 15:10:41','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:10:41','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:10:44 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000509 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:10:44 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000510,1,'N','N','N',8982,'N',0,'Y',3000018,'N','The Credit Card Verification Code was matched','LAR','Credit Card Verification Code Match','CVV Match',0,0,'Y',TO_DATE('2012-05-03 15:10:44','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:10:44','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:10:44 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000510 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:10:45 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000511,20,'N','N','N',59039,'N',0,'Y',3000018,'N','The ProcessedOn Date+Time save the exact moment (nanoseconds precision if allowed by the DB) when a document has been processed.','LAR','The date+time (expressed in decimal format) when the document has been processed','Processed On',0,0,'Y',TO_DATE('2012-05-03 15:10:44','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:10:44','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:10:45 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000511 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:10:49 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000512,11,'N','N','N',8980,'N',0,'Y',3000018,'N','The Charge Amount indicates the amount for an additional charge.','LAR','Charge Amount','Charge amount',0,0,'Y',TO_DATE('2012-05-03 15:10:45','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:10:45','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:10:49 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000512 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:10:50 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES (1,'N',3000513,14,'N','N','N',5043,'N',0,'Y',3000018,'N','The Payment is a unique identifier of this payment.','LAR','Payment identifier','Payment',0,0,'Y',TO_DATE('2012-05-03 15:10:49','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:10:49','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:10:50 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000513 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:10:50 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000514,20,'N','N','N',5041,'N',0,'Y',3000018,'Y','The Info indicates any response information returned from the Credit Card Company.',101,'@IsOnline@=Y','LAR','Response info','Info',0,0,'Y',TO_DATE('2012-05-03 15:10:50','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:10:50','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:10:50 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000514 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:10:51 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000515,1,'N','N','N',3878,'N',0,'Y',3000018,'N','The Processed checkbox indicates that a document has been processed.','LAR','The document has been processed','Processed','N',0,0,'Y',TO_DATE('2012-05-03 15:10:50','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:10:50','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:10:51 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000515 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:10:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000516,14,'N','N','N',5300,'N',0,'Y',3000018,'N','Electronic Fund Transfer Payment Batch.','LAR','Payment batch for EFT','Payment Batch',0,0,'Y',TO_DATE('2012-05-03 15:10:51','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:10:51','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:10:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000516 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:10:53 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000517,1,'N','N','N',3879,'N',0,'Y',3000018,'N','LAR','Payment is reconciled with bank statement','Reconciled','N',0,0,'Y',TO_DATE('2012-05-03 15:10:52','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:10:52','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:10:53 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000517 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:10:53 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000518,14,'N','N','N',5298,'N',0,'Y',3000018,'N','The Partner Bank Account identifies the bank account to be used for this Business Partner','LAR','Bank Account of the Business Partner','Partner Bank Account',0,0,'Y',TO_DATE('2012-05-03 15:10:53','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:10:53','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:10:53 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000518 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:10:54 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000519,22,'N','N','N',55309,'N',0,'Y',3000018,'N','LAR','ID of document reversal','Reversal ID',0,0,'Y',TO_DATE('2012-05-03 15:10:53','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:10:53','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:10:54 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000519 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:10:55 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000520,60,'N','N','N',8985,'N',0,'Y',3000018,'Y','Swiped information for Credit Card Presence Transactions','LAR','Track 1 and 2 of the Credit Card','Swipe',0,0,'Y',TO_DATE('2012-05-03 15:10:54','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:10:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:10:55 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000520 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:10:56 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000521,20,'N','N','N',8983,'N',0,'Y',3000018,'N','The Payment Reference indicates the reference returned from the Credit Card Company for a payment','LAR','Payment Reference Delayed Capture','Reference (DC)',0,0,'Y',TO_DATE('2012-05-03 15:10:55','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:10:55','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:10:56 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000521 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:10:56 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000522,20,'N','N','N',8981,'N',0,'Y',3000018,'N','The Authorization Code indicates the code returned from the electronic transmission.','LAR','Authorization Code Delayed Capture returned','Authorization Code (DC)',0,0,'Y',TO_DATE('2012-05-03 15:10:56','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:10:56','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:10:56 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000522 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:00 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000523,23,'N','N','N',3877,'N',0,'Y',3000018,'N','LAR','Process Now',0,0,'Y',TO_DATE('2012-05-03 15:10:56','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:10:56','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:00 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000523 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:00 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000524,1,'N','N','N',8979,'N',0,'Y',3000018,'N','Delayed Capture is required, if you ship products.  The first credit card transaction is the Authorization, the second is the actual transaction after the shipment of the product.','LAR','Charge after Shipment','Delayed Capture',0,0,'Y',TO_DATE('2012-05-03 15:11:00','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:00','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:01 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000524 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:01 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000525,1,'N','N','N',3864,'N',0,'Y',3000018,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',0,0,'Y',TO_DATE('2012-05-03 15:11:01','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:01','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:01 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000525 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:02 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000526,14,'Y','N','N',3862,'N',10,'Y',3000018,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',0,0,'Y',TO_DATE('2012-05-03 15:11:01','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:01','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:02 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000526 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:03 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000527,14,'Y','Y','N',3863,'N',20,'Y',3000018,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',0,0,'Y',TO_DATE('2012-05-03 15:11:02','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:02','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:03 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000527 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES (-1,'N',3000528,20,'Y','N','N',5401,'N',30,'Y',3000018,'N','The document number is usually automatically generated by the system and determined by the document type of the document. If the document is not saved, the preliminary number is displayed in "<>".

If the document type of your document has no automatic document sequence defined, the field is empty if you create a new document. This is for documents which usually have an external number (like vendor invoice).  If you leave the field empty, the system will generate a document number for you. The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).','LAR','Document sequence number of the document','Document No','N',0,0,'Y',TO_DATE('2012-05-03 15:11:03','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:03','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000528 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:05 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000529,14,'Y','Y','N',3880,'N',40,'Y',3000018,'N','The Bank Account identifies an account at this Bank.','@TenderType@ !''X''','LAR','Account at the Bank','Bank Account',0,0,'Y',TO_DATE('2012-05-03 15:11:04','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:04','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:05 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000529 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:06 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000530,14,'Y','N','N',5302,'N',50,'Y',3000018,'N','The Document Type determines document sequence and processing rules','LAR','Document type or rules','Document Type',0,0,'Y',TO_DATE('2012-05-03 15:11:05','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:05','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:06 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000530 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:07 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000531,1,'Y','Y','N',6216,'N',60,'Y',3000018,'Y','LAR','This is a sales transaction (receipt)','Receipt',0,0,'Y',TO_DATE('2012-05-03 15:11:06','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:07 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000531 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:07 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000532,14,'Y','N','N',5399,'N',70,'Y',3000018,'N','The Transaction Date indicates the date of the transaction.','LAR','Transaction Date','Transaction Date',0,0,'Y',TO_DATE('2012-05-03 15:11:07','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:07','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:07 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000532 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:08 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000533,14,'Y','Y','N',12128,'N',80,'Y',3000018,'N','The Accounting Date indicates the date to be used on the General Ledger account entries generated from this document. It is also used for any currency conversion.','LAR','Accounting Date','Account Date',0,0,'Y',TO_DATE('2012-05-03 15:11:07','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:07','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:08 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000533 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:10 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000534,60,'Y','N','N',12127,'N',90,'Y',3000018,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',0,0,'Y',TO_DATE('2012-05-03 15:11:08','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:08','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:10 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000534 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:11 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000535,26,'Y','N','N',5398,'N',100,'Y',3000018,'N','A Business Partner is anyone with whom you transact.  This can include Vendor, Customer, Employee or Salesperson',104,'LAR','Identifies a Business Partner','Business Partner ',0,0,'Y',TO_DATE('2012-05-03 15:11:10','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:10','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:11 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000535 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:12 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000536,26,'Y','Y','N',5355,'N',110,'Y',3000018,'N','The Invoice Document.','LAR','Invoice Identifier','Invoice',0,0,'Y',TO_DATE('2012-05-03 15:11:11','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:11','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:12 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000536 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:13 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000537,26,'Y','N','N',12925,'N',120,'Y',3000018,'N','The Order is a control document.  The  Order is complete when the quantity ordered is the same as the quantity shipped and invoiced.  When you close an order, unshipped (backordered) quantities are cancelled.','LAR','Order','Order',0,0,'Y',TO_DATE('2012-05-03 15:11:12','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:12','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:13 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000537 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:14 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000538,14,'Y','Y','N',8554,'N',130,'Y',3000018,'N','A Project allows you to track and control internal or external activities.','@$Element_PJ@=Y & @C_Invoice_ID@=0 | @C_Invoice_ID@=''''','LAR','Financial Project','Project',0,0,'Y',TO_DATE('2012-05-03 15:11:13','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:13','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:14 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000538 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:18 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000539,14,'Y','N','N',8984,'N',140,'Y',3000018,'N','The Charge indicates a type of Charge (Handling, Shipping, Restocking)',104,'LAR','Additional document charges','Charge',0,0,'Y',TO_DATE('2012-05-03 15:11:14','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:14','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:18 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000539 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:19 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000540,1,'Y','Y','N',13045,'N',150,'Y',3000018,'Y','Payments not allocated to an invoice with a charge are posted to Unallocated Payments. When setting this flag, the payment is posted to the Customer or Vendor Prepayment account.',104,'LAR','The Payment/Receipt is a Prepayment','Prepayment',0,0,'Y',TO_DATE('2012-05-03 15:11:18','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:18','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:19 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000540 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:20 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000541,14,'Y','N','N',9566,'N',160,'Y',3000018,'N','Activities indicate tasks that are performed and used to utilize Activity based Costing','@$Element_AY@=Y','LAR','Business Activity','Activity',0,0,'Y',TO_DATE('2012-05-03 15:11:19','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:19','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:20 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000541 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:21 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000542,14,'Y','N','N',9564,'N',170,'Y',3000018,'N','The Campaign defines a unique marketing program.  Projects can be associated with a pre defined Marketing Campaign.  You can then report based on a specific Campaign.','@$Element_MC@=Y','LAR','Marketing Campaign','Campaign',0,0,'Y',TO_DATE('2012-05-03 15:11:20','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:20','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:21 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000542 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:21 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000543,14,'Y','N','N',9565,'N',180,'Y',3000018,'N','The organization which performs or initiates this transaction (for another organization).  The owning Organization may not be the transaction organization in a service bureau environment, with centralized services, and inter-organization transactions.','@$Element_OT@=Y','LAR','Performing or initiating organization','Trx Organization',0,0,'Y',TO_DATE('2012-05-03 15:11:21','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:21','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:21 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000543 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:22 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000544,14,'Y','N','N',9563,'N',190,'Y',3000018,'N','The user defined element displays the optional elements that have been defined for this account combination.','@$Element_U1@=Y','LAR','User defined list element #1','User List 1',0,0,'Y',TO_DATE('2012-05-03 15:11:21','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:21','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:22 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000544 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:23 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000545,14,'Y','Y','N',9567,'N',200,'Y',3000018,'N','The user defined element displays the optional elements that have been defined for this account combination.','@$Element_U2@=Y','LAR','User defined list element #2','User List 2',0,0,'Y',TO_DATE('2012-05-03 15:11:22','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:22','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:23 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000545 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:23 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000546,26,'Y','N','N',5303,'N',210,'Y',3000018,'N','Indicates the amount this payment is for.  The payment amount can be for single or multiple invoices or a partial payment for an invoice.',103,'LAR','Amount being paid','Payment amount',0,0,'Y',TO_DATE('2012-05-03 15:11:23','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:23','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:23 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000546 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:24 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000547,14,'Y','Y','N',5299,'N',220,'Y',3000018,'N','Indicates the Currency to be used when processing or reporting on this record','LAR','The Currency for this record','Currency',0,0,'Y',TO_DATE('2012-05-03 15:11:23','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:23','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:24 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000547 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:26 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000548,14,'Y','N','N',10265,'N',230,'Y',3000018,'N','The Currency Conversion Rate Type lets you define different type of rates, e.g. Spot, Corporate and/or Sell/Buy rates.','@C_Currency_ID@!@$C_Currency_ID@','LAR','Currency Conversion Rate Type','Currency Type',0,0,'Y',TO_DATE('2012-05-03 15:11:24','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:24','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:26 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000548 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:26 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000549,26,'Y','N','N',5301,'N',240,'Y',3000018,'N','The Discount Amount indicates the discount amount for a document or line.','@C_Invoice_ID@^''''','LAR','Calculated amount of discount','Discount Amount',0,0,'Y',TO_DATE('2012-05-03 15:11:26','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:26','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:26 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000549 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:27 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000550,26,'Y','Y','N',6475,'N',250,'Y',3000018,'N','The Write Off Amount indicates the amount to be written off as uncollectible.','@C_Invoice_ID@^''''','LAR','Amount to write-off','Write-off Amount',0,0,'Y',TO_DATE('2012-05-03 15:11:26','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:26','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:27 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000550 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:28 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000551,1,'Y','N','N',7035,'N',260,'Y',3000018,'N','Overpayments (negative) are unallocated amounts and allow you to receive money for more than the particular invoice. 
Underpayments (positive) is a partial payment for the invoice. You do not write off the unpaid amount.','@C_Invoice_ID@^''''','LAR','Over-Payment (unallocated) or Under-Payment (partial payment)','Over/Under Payment',0,0,'Y',TO_DATE('2012-05-03 15:11:27','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:27','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:28 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000551 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:29 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000552,26,'Y','Y','N',7034,'N',270,'Y',3000018,'N','Overpayments (negative) are unallocated amounts and allow you to receive money for more than the particular invoice. 
Underpayments (positive) is a partial payment for the invoice. You do not write off the unpaid amount.','@IsOverUnderPayment@=Y & @C_Invoice_ID@^''''','LAR','Over-Payment (unallocated) or Under-Payment (partial payment) Amount','Over/Under Payment',0,0,'Y',TO_DATE('2012-05-03 15:11:28','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:29 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000552 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:29 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000553,20,'Y','N','N',3000103,'N',280,'Y',3000018,'N','LAR','Withholding Amount',0,0,'Y',TO_DATE('2012-05-03 15:11:29','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:29 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000553 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:30 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000554,20,'Y','Y','N',3000104,'N',290,'Y',3000018,'N','LAR','WithholdingPercent',0,0,'Y',TO_DATE('2012-05-03 15:11:29','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:30 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000554 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:31 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000555,14,'Y','N','N',5046,'N',300,'Y',3000018,'N','The Tender Type indicates the method of payment (ACH or Direct Deposit, Credit Card, Check, Direct Debit)',125,'LAR','Method of Payment','Tender type',0,0,'Y',TO_DATE('2012-05-03 15:11:30','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:31 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000555 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:32 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000556,1,'Y','Y','N',5495,'N',310,'Y',3000018,'N','The Online Access check box indicates if the application can be accessed via the web. ','LAR','Can be accessed online ','Online Access',0,0,'Y',TO_DATE('2012-05-03 15:11:31','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:32 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000556 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:32 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000557,20,'Y','N','N',3873,'N',320,'Y',3000018,'N','The Bank Routing Number (ABA Number) identifies a legal Bank.  It is used in routing checks and electronic transactions.','@TenderType@=A | @TenderType@=K','LAR','Bank Routing Number','Routing No',0,0,'Y',TO_DATE('2012-05-03 15:11:32','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:32 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000557 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:33 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000558,20,'Y','Y','N',3874,'N',330,'Y',3000018,'N','The Account Number indicates the Number assigned to this bank account. ','@TenderType@=A | @TenderType@=K','LAR','Account Number','Account No',0,0,'Y',TO_DATE('2012-05-03 15:11:32','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:33 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000558 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:34 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000559,20,'Y','N','N',5049,'N',340,'Y',3000018,'N','The Check Number indicates the number on the check.','@TenderType@=K','LAR','Check Number','Check No',0,0,'Y',TO_DATE('2012-05-03 15:11:33','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:34 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000559 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:34 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000560,20,'Y','Y','N',5048,'N',350,'Y',3000018,'N','The Micr number is the combination of the bank routing number, account number and check number','@TenderType@=K','LAR','Combination of routing no, account and check no','Micr',0,0,'Y',TO_DATE('2012-05-03 15:11:34','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:34 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000560 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:35 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000561,14,'Y','N','N',3869,'N',360,'Y',3000018,'N','The Credit Card drop down list box is used for selecting the type of Credit Card presented for payment.','@TenderType@=C','LAR','Credit Card (Visa, MC, AmEx)','Credit Card',0,0,'Y',TO_DATE('2012-05-03 15:11:34','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:35 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000561 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:36 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000562,14,'Y','Y','N',5044,'N',370,'Y',3000018,'N','The Transaction Type indicates the type of transaction to be submitted to the Credit Card Company.','@TenderType@=C','LAR','Type of credit card transaction','Transaction Type',0,0,'Y',TO_DATE('2012-05-03 15:11:35','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:35','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:36 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000562 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:38 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,ObscureType,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000563,20,'Y','N','N',3870,'N',380,'Y',3000018,'N','The Credit Card number indicates the number on the credit card, without blanks or spaces.','904','@TenderType@=C','LAR','Credit Card Number ','Number',0,0,'Y',TO_DATE('2012-05-03 15:11:36','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:36','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:38 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000563 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:38 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000564,5,'Y','Y','N',5047,'N',390,'Y',3000018,'N','The Credit Card Verification indicates the verification code on the credit card (AMEX 4 digits on front; MC,Visa 3 digits back)','@TenderType@=C','LAR','Credit Card Verification code on credit card','Verification Code',0,0,'Y',TO_DATE('2012-05-03 15:11:38','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:38','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:38 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000564 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:39 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000565,11,'Y','N','N',3871,'N',400,'Y',3000018,'N','The Expiry Month indicates the expiry month for this credit card.','@TenderType@=C','LAR','Expiry Month','Exp. Month',0,0,'Y',TO_DATE('2012-05-03 15:11:38','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:38','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:39 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000565 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:40 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000566,11,'Y','Y','N',3872,'N',410,'Y',3000018,'N','The Expiry Year indicates the expiry year for this credit card.','@TenderType@=C','LAR','Expiry Year','Exp. Year',0,0,'Y',TO_DATE('2012-05-03 15:11:39','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:39','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:40 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000566 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:40 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000567,20,'Y','N','N',5050,'N',420,'Y',3000018,'N','The Name of the Credit Card or Account holder.','@TenderType@=C | @TenderType@=K','LAR','Name on Credit Card or Account holder','Account Name',0,0,'Y',TO_DATE('2012-05-03 15:11:40','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:40','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:41 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000567 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:45 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000568,20,'Y','Y','N',5051,'N',430,'Y',3000018,'N','The Street Address of the Credit Card or Account holder.','@TenderType@=C | @TenderType@=K & @IsOnline@=Y','LAR','Street address of the Credit Card or Account holder','Account Street',0,0,'Y',TO_DATE('2012-05-03 15:11:41','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:41','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:45 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000568 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000569,20,'Y','N','N',5052,'N',440,'Y',3000018,'N','The Account City indicates the City of the Credit Card or Account holder','@TenderType@=C | @TenderType@=K & @IsOnline@=Y','LAR','City or the Credit Card or Account Holder','Account City',0,0,'Y',TO_DATE('2012-05-03 15:11:45','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:45','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000569 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:53 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000570,11,'Y','Y','N',5026,'N',450,'Y',3000018,'N','The Zip Code of the Credit Card or Account Holder.','@TenderType@=C | @TenderType@=K & @IsOnline@=Y','LAR','Zip Code of the Credit Card or Account Holder','Account Zip/Postal',0,0,'Y',TO_DATE('2012-05-03 15:11:52','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:52','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:53 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000570 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:54 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000571,11,'Y','N','N',5053,'N',460,'Y',3000018,'N','The State of the Credit Card or Account holder','@TenderType@=C | @TenderType@=K & @IsOnline@=Y','LAR','State of the Credit Card or Account holder','Account State',0,0,'Y',TO_DATE('2012-05-03 15:11:53','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:53','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:54 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000571 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:54 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000572,20,'Y','Y','N',8213,'N',470,'Y',3000018,'N','Account Country Name','@TenderType@=C | @TenderType@=K & @IsOnline@=Y','LAR','Country','Account Country',0,0,'Y',TO_DATE('2012-05-03 15:11:54','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:54 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000572 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:55 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000573,20,'Y','N','N',5027,'N',480,'Y',3000018,'N','The Driver''s License being used as identification.','@TenderType@=K & @IsOnline@=Y','LAR','Payment Identification - Driver License','Driver License',0,0,'Y',TO_DATE('2012-05-03 15:11:54','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:55 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000573 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:11:56 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000574,20,'Y','Y','N',5028,'N',490,'Y',3000018,'N','The Social Security number being used as identification.','@TenderType@=K & @IsOnline@=Y','LAR','Payment Identification - Social Security No','Social Security No',0,0,'Y',TO_DATE('2012-05-03 15:11:55','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:55','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:11:56 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000574 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:12:00 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000575,20,'Y','N','N',5029,'N',500,'Y',3000018,'N','The EMail Address indicates the EMail address off the Credit Card or Account holder.','@TenderType@=K & @IsOnline@=Y','LAR','Email Address','Account EMail',0,0,'Y',TO_DATE('2012-05-03 15:11:56','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:11:56','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:12:00 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000575 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:12:00 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000576,26,'Y','N','N',5034,'N',510,'N',3000018,'N','The Tax Amount displays the total tax amount. The tax amount is only used for credit card processing.','@CreditCardType@=P & @IsOnline@=Y','LAR','Tax Amount for Credit Card transaction','Tax Amount',0,0,'Y',TO_DATE('2012-05-03 15:12:00','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:12:00','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:12:00 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000576 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:12:01 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000577,20,'Y','Y','N',5032,'N',520,'Y',3000018,'N','The PO Number indicates the number assigned to a purchase order','@CreditCardType@=P & @IsOnline@=Y','LAR','Purchase Order Number','PO Number',0,0,'Y',TO_DATE('2012-05-03 15:12:00','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:12:00','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:12:01 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000577 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:12:02 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000578,20,'Y','N','N',5030,'N',530,'Y',3000018,'N','The Voice Authorization Code indicates the code received from the Credit Card Company.','@IsOnline@=Y','LAR','Voice Authorization Code from credit card company','Voice authorization code',0,0,'Y',TO_DATE('2012-05-03 15:12:01','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:12:01','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:12:02 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000578 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:12:03 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000579,20,'Y','Y','N',5031,'N',540,'Y',3000018,'N','The Original Transaction ID is used for reversing transactions and indicates the transaction that has been reversed.','@IsOnline@=Y','LAR','Original Transaction ID','Original Transaction ID',0,0,'Y',TO_DATE('2012-05-03 15:12:02','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:12:02','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:12:03 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000579 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:12:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000580,23,'Y','N','N',5356,'N',550,'Y',3000018,'N','The Online Processing indicates if the payment can be processed online.','@IsOnline@=Y','LAR','This payment can be processed online','Online Processing',0,0,'Y',TO_DATE('2012-05-03 15:12:03','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:12:03','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:12:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000580 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:12:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000581,1,'Y','Y','N',3875,'N',560,'Y',3000018,'Y','The Approved checkbox indicates if this document requires approval before it can be processed.',101,'@IsOnline@=Y','LAR','Indicates if this document requires approval','Approved','N',0,0,'Y',TO_DATE('2012-05-03 15:12:04','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:12:04','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:12:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000581 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:12:05 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000582,20,'Y','N','N',5036,'N',570,'Y',3000018,'Y','The Response Result indicates the result of the transmission to the Credit Card Company.',101,'@IsOnline@=Y','LAR','Result of transmission','Result',0,0,'Y',TO_DATE('2012-05-03 15:12:04','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:12:04','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:12:05 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000582 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:12:06 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000583,20,'Y','Y','N',5037,'N',580,'Y',3000018,'Y','The Response Message indicates the message returned from the Credit Card Company as the result of a transmission',101,'@IsOnline@=Y','LAR','Response message','Response Message',0,0,'Y',TO_DATE('2012-05-03 15:12:05','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:12:05','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:12:06 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000583 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:12:06 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000584,20,'Y','N','N',5035,'N',590,'Y',3000018,'Y','The Payment Reference indicates the reference returned from the Credit Card Company for a payment',101,'@IsOnline@=Y','LAR','Payment reference','Reference',0,0,'Y',TO_DATE('2012-05-03 15:12:06','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:12:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:12:06 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000584 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:12:07 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000585,20,'Y','Y','N',5038,'N',600,'Y',3000018,'Y','The Authorization Code indicates the code returned from the electronic transmission.',101,'@IsOnline@=Y','LAR','Authorization Code returned','Authorization Code',0,0,'Y',TO_DATE('2012-05-03 15:12:06','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:12:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:12:07 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000585 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:12:12 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000586,14,'Y','N','N',5040,'N',610,'Y',3000018,'Y','The Zip Verified indicates if the zip code has been verified by the Credit Card Company.',101,'@IsOnline@=Y','LAR','The Zip Code has been verified','Zip verified',0,0,'Y',TO_DATE('2012-05-03 15:12:07','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:12:07','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:12:12 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000586 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:12:15 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000587,14,'Y','Y','N',5039,'N',620,'Y',3000018,'Y','The Address Verified indicates if the address has been verified by the Credit Card Company.',101,'@IsOnline@=Y','LAR','This address has been verified','Address verified',0,0,'Y',TO_DATE('2012-05-03 15:12:12','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:12:12','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:12:15 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000587 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:12:16 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000588,14,'Y','N','N',5496,'N',630,'Y',3000018,'Y','The Document Status indicates the status of a document at this time.  If you want to change the document status, use the Document Action field',101,'LAR','The current status of the document','Document Status','N',0,0,'Y',TO_DATE('2012-05-03 15:12:15','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:12:15','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:12:16 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000588 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:12:17 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000589,23,'Y','Y','N',5497,'N',640,'Y',3000018,'N','You find the current status in the Document Status field. The options are listed in a popup',101,'LAR','The targeted status of the document','Document Action','N',0,0,'Y',TO_DATE('2012-05-03 15:12:16','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:12:16','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:12:17 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000589 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:12:19 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000590,1,'Y','N','N',8775,'N',650,'Y',3000018,'Y','Self-Service allows users to enter data or update their data.  The flag indicates, that this record was entered or created via Self-Service or that the user can change it via the Self-Service functionality.','LAR','This is a Self-Service entry or this entry can be changed via Self-Service','Self-Service','N',0,0,'Y',TO_DATE('2012-05-03 15:12:17','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:12:17','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:12:19 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000590 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:12:20 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000591,23,'Y','Y','N',5042,'N',660,'Y',3000018,'N','The Posted field indicates the status of the Generation of General Ledger Accounting Lines ','@Processed@=Y & @#ShowAcct@=Y','LAR','Posting status','Posted','N',0,0,'Y',TO_DATE('2012-05-03 15:12:19','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:12:19','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:12:20 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000591 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:12:20 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000592,1,'Y','N','N',5400,'N',670,'Y',3000018,'Y','The Allocated checkbox indicates if a payment has been allocated or associated with an invoice or invoices.','@Processed@=Y','LAR','Indicates if the payment has been allocated','Allocated','N',0,0,'Y',TO_DATE('2012-05-03 15:12:20','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:12:20','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:12:20 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000592 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:12:21 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000593,14,'Y','Y','N',52117,'N',680,'Y',3000018,'N','The Cash Book identifies a unique cash book.  The cash book is used to record cash transactions.','@TenderType@=''X''','LAR','Cash Book for recording petty cash transactions','Cash Book',0,0,'Y',TO_DATE('2012-05-03 15:12:20','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:12:20','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:12:21 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000593 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:25:49 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Menu (AD_Window_ID,AD_Menu_ID,IsSummary,Action,IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000011,3000015,'N','W','N','N','LAR','Y','On Drawer Checks',TO_DATE('2012-05-03 15:25:38','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,0,TO_DATE('2012-05-03 15:25:38','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 03/05/2012 15:25:49 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000015 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 03/05/2012 15:25:49 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', SysDate, 0, SysDate, 0,t.AD_Tree_ID, 3000015, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000015)
;

-- 03/05/2012 15:39:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=0, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000015
;

-- 03/05/2012 15:39:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=1, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000013
;

-- 03/05/2012 15:39:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=2, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000014
;

-- 03/05/2012 15:39:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=3, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=241
;

-- 03/05/2012 15:39:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=4, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=288
;

-- 03/05/2012 15:39:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=5, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=432
;

-- 03/05/2012 15:39:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=6, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=243
;

-- 03/05/2012 15:39:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=7, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=413
;

-- 03/05/2012 15:39:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=8, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=538
;

-- 03/05/2012 15:39:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=9, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=462
;

-- 03/05/2012 15:39:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=10, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=505
;

-- 03/05/2012 15:39:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=11, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=235
;

-- 03/05/2012 15:39:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=12, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=511
;

-- 03/05/2012 15:39:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=13, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=245
;

-- 03/05/2012 15:39:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=14, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=251
;

-- 03/05/2012 15:39:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=15, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=246
;

-- 03/05/2012 15:39:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=16, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=509
;

-- 03/05/2012 15:39:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=17, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=510
;

-- 03/05/2012 15:39:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=18, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=496
;

-- 03/05/2012 15:39:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=19, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=497
;

-- 03/05/2012 15:39:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=20, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=304
;

-- 03/05/2012 15:39:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=21, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=255
;

-- 03/05/2012 15:39:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=22, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=286
;

-- 03/05/2012 15:39:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=23, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=287
;

-- 03/05/2012 15:39:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=24, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=438
;

-- 03/05/2012 15:39:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=25, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=234
;

-- 03/05/2012 15:39:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=26, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=244
;

-- 03/05/2012 15:39:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=27, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53313
;

-- 03/05/2012 15:39:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=28, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53314
;

-- 03/05/2012 15:39:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=29, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53190
;

-- 03/05/2012 15:39:52 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=30, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53187
;
-- 03/05/2012 15:57:29 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000594,1,'Y','N','N',3000260,'N','Y',3000018,'N','LAR','Allocation',0,0,'Y',TO_DATE('2012-05-03 15:57:27','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:57:27','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:57:29 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000594 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:57:29 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000595,1,'Y','N','N',3000261,'N','Y',3000018,'N','LAR','IsOnDrawer',0,0,'Y',TO_DATE('2012-05-03 15:57:29','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:57:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:57:29 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000595 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:57:30 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000596,10,'Y','N','N',3000258,'N','Y',3000018,'N','LAR','LAR_PaymentHeader',0,0,'Y',TO_DATE('2012-05-03 15:57:29','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:57:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:57:30 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000596 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 15:57:32 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000597,10,'Y','N','N',3000259,'N','Y',3000018,'N','LAR','LAR_PaymentSource_ID',0,0,'Y',TO_DATE('2012-05-03 15:57:30','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-03 15:57:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/05/2012 15:57:32 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000597 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000594
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000596
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000597
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000595
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000556
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000557
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000558
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000559
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000560
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000561
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000562
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000563
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000564
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000565
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000566
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000567
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000568
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000569
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000570
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000571
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000572
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000573
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000574
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000575
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000576
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000577
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000578
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000579
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000580
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000581
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000582
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000583
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000584
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000585
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000586
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000587
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000588
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000589
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3000590
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=3000591
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=680,IsDisplayed='Y' WHERE AD_Field_ID=3000592
;

-- 03/05/2012 16:01:04 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=690,IsDisplayed='Y' WHERE AD_Field_ID=3000593
;

-- 03/05/2012 16:01:23 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2012-05-03 16:01:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000595
;

-- 03/05/2012 16:03:18 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET ReadOnlyLogic=NULL,Updated=TO_DATE('2012-05-03 16:03:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3000261
;

-- 03/05/2012 16:09:07 ART
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_DATE('2012-05-03 16:09:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3000261
;

-- 11/05/2012 0:08:04 ART
-- Allow Tender Type Cash on C_Payment
UPDATE AD_Column SET AD_Val_Rule_ID=NULL,Updated=TO_DATE('2012-05-11 00:08:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=5046
;
