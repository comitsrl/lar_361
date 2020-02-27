CREATE TABLE LAR_Caja_Billete
(
  AD_Client_ID numeric(10,0) NOT NULL,
  AD_Org_ID numeric(10,0) NOT NULL,
  Created timestamp without time zone NOT NULL,
  CreatedBy numeric(10,0),
  Updated timestamp without time zone NOT NULL,
  UpdatedBy numeric(10,0) NOT NULL,
  IsActive character(1) NOT NULL,
  LAR_Caja_Billete_ID numeric(10,0) NOT NULL,
  C_BankStatement_ID numeric(10,0) NOT NULL,
  Valor numeric(10,2) NOT NULL,
  Description character varying(255),
  Cantidad numeric(10,0) NOT NULL,
  CONSTRAINT LAR_Caja_Billete_PKey PRIMARY KEY (LAR_Caja_Billete_ID),
  CONSTRAINT ADClient_LARCajaBillete FOREIGN KEY (AD_Client_ID)
      REFERENCES AD_Client (AD_Client_ID) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT ADOrg_LARCajaBillete FOREIGN KEY (AD_Org_ID)
      REFERENCES AD_Org (AD_Org_ID) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT Valor_BankStatment UNIQUE (Valor, C_BankStatement_ID),
  CONSTRAINT IsActive_LARCajaBillete_Check CHECK (IsActive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
)
WITH (
  OIDS=FALSE
);
ALTER TABLE LAR_Caja_Billete
  OWNER TO ADempiere;

-- 21/02/2020 11:53:11 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,ImportTable,IsHighVolume,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','3',0,3000134,'N','N','N','N','N','LAR','Y','Y','L','LAR_Caja_Billete','Billete',0,'Y',0,100,TO_TIMESTAMP('2020-02-21 11:53:08','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2020-02-21 11:53:08','YYYY-MM-DD HH24:MI:SS'))
;

-- 21/02/2020 11:53:11 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000134 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- 21/02/2020 11:53:11 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,UpdatedBy,AD_Client_ID,Updated,Created,CreatedBy,IsActive) VALUES (1,'N',200000,'Y',1000000,1000000,'N','Y',3000887,'Table LAR_Caja_Billete','LAR_Caja_Billete',0,100,0,TO_TIMESTAMP('2020-02-21 11:53:11','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2020-02-21 11:53:11','YYYY-MM-DD HH24:MI:SS'),100,'Y')
;

-- 21/02/2020 11:53:33 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003564,3000134,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,TO_TIMESTAMP('2020-02-21 11:53:33','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-02-21 11:53:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/02/2020 11:53:33 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003564 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/02/2020 11:53:33 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003565,3000134,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',100,TO_TIMESTAMP('2020-02-21 11:53:33','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-02-21 11:53:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/02/2020 11:53:33 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003565 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/02/2020 11:53:34 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003566,3000134,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,TO_TIMESTAMP('2020-02-21 11:53:33','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-02-21 11:53:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/02/2020 11:53:34 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003566 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/02/2020 11:53:34 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003567,3000134,'LAR',0,110,'N','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,TO_TIMESTAMP('2020-02-21 11:53:34','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-02-21 11:53:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/02/2020 11:53:34 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003567 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/02/2020 11:53:34 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003568,3000134,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,TO_TIMESTAMP('2020-02-21 11:53:34','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-02-21 11:53:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/02/2020 11:53:34 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003568 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/02/2020 11:53:34 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003569,3000134,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,TO_TIMESTAMP('2020-02-21 11:53:34','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-02-21 11:53:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/02/2020 11:53:34 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003569 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/02/2020 11:53:35 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003570,3000134,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,TO_TIMESTAMP('2020-02-21 11:53:34','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-02-21 11:53:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/02/2020 11:53:35 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003570 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/02/2020 11:53:35 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001059,'LAR_Caja_Billete_ID','LAR','Billete','Billete',0,TO_TIMESTAMP('2020-02-21 11:53:35','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2020-02-21 11:53:35','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 21/02/2020 11:53:35 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001059 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 21/02/2020 11:53:35 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003571,3000134,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3001059,'N','N','N','Billete','LAR_Caja_Billete_ID',100,TO_TIMESTAMP('2020-02-21 11:53:35','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-02-21 11:53:35','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/02/2020 11:53:35 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003571 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/02/2020 11:53:35 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003572,3000134,'LAR',0,'Y','N','N','The Bank Statement identifies a unique Bank Statement for a defined time period.  The statement defines all transactions that occurred','N',10,'N',19,'N',1381,'N','Y','N','Bank Statement of account','Bank Statement','C_BankStatement_ID',100,TO_TIMESTAMP('2020-02-21 11:53:35','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-02-21 11:53:35','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/02/2020 11:53:35 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003572 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/02/2020 11:53:35 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001060,'valor','LAR','valor','valor',0,TO_TIMESTAMP('2020-02-21 11:53:35','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2020-02-21 11:53:35','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 21/02/2020 11:53:35 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001060 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 21/02/2020 11:53:36 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003573,3000134,'LAR',0,'Y','N','N','N',10,'N',11,'N',3001060,'N','Y','N','valor','valor',100,TO_TIMESTAMP('2020-02-21 11:53:35','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-02-21 11:53:35','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/02/2020 11:53:36 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003573 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/02/2020 11:53:36 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003574,3000134,'LAR',0,'N','N','N','A description is limited to 255 characters.','N',255,'Y',10,'N',275,'N','Y','N','Optional short description of the record','Description','Description',100,TO_TIMESTAMP('2020-02-21 11:53:36','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-02-21 11:53:36','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/02/2020 11:53:36 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003574 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/02/2020 11:53:36 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001061,'cantidad','LAR','cantidad','cantidad',0,TO_TIMESTAMP('2020-02-21 11:53:36','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2020-02-21 11:53:36','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 21/02/2020 11:53:36 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001061 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 21/02/2020 11:53:36 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003575,3000134,'LAR',0,'Y','N','N','N',10,'N',11,'N',3001061,'N','Y','N','cantidad','cantidad',100,TO_TIMESTAMP('2020-02-21 11:53:36','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-02-21 11:53:36','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/02/2020 11:53:36 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003575 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/02/2020 11:54:08 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Element SET ColumnName='Valor', Name='Valor', PrintName='Valor',Updated=TO_TIMESTAMP('2020-02-21 11:54:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001060
;

-- 21/02/2020 11:54:08 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001060
;

-- 21/02/2020 11:54:08 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Column SET ColumnName='Valor', Name='Valor', Description=NULL, Help=NULL WHERE AD_Element_ID=3001060
;

-- 21/02/2020 11:54:08 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Process_Para SET ColumnName='Valor', Name='Valor', Description=NULL, Help=NULL, AD_Element_ID=3001060 WHERE UPPER(ColumnName)='VALOR' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 21/02/2020 11:54:08 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Process_Para SET ColumnName='Valor', Name='Valor', Description=NULL, Help=NULL WHERE AD_Element_ID=3001060 AND IsCentrallyMaintained='Y'
;

-- 21/02/2020 11:54:08 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Field SET Name='Valor', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001060) AND IsCentrallyMaintained='Y'
;

-- 21/02/2020 11:54:08 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_PrintFormatItem SET PrintName='Valor', Name='Valor' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001060)
;

-- 21/02/2020 11:54:23 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Element_Trl SET Name='Valor',PrintName='Valor',Updated=TO_TIMESTAMP('2020-02-21 11:54:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001060 AND AD_Language='es_AR'
;

-- 21/02/2020 11:54:41 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Column_Trl SET Name='Valor',Updated=TO_TIMESTAMP('2020-02-21 11:54:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003573 AND AD_Language='es_AR'
;

-- 21/02/2020 11:55:21 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Column SET Name='Cantidad', ColumnName='Cantidad',Updated=TO_TIMESTAMP('2020-02-21 11:55:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003575
;

-- 21/02/2020 11:55:21 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003575
;

-- 21/02/2020 11:55:21 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Field SET Name='Cantidad', Description=NULL, Help=NULL WHERE AD_Column_ID=3003575 AND IsCentrallyMaintained='Y'
;

-- 21/02/2020 11:55:25 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Column_Trl SET Name='Cantidad',Updated=TO_TIMESTAMP('2020-02-21 11:55:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003575 AND AD_Language='es_AR'
;

-- 21/02/2020 11:55:33 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Element SET ColumnName='Cantidad', Name='Cantidad', PrintName='Cantidad',Updated=TO_TIMESTAMP('2020-02-21 11:55:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001061
;

-- 21/02/2020 11:55:33 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001061
;

-- 21/02/2020 11:55:33 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Column SET ColumnName='Cantidad', Name='Cantidad', Description=NULL, Help=NULL WHERE AD_Element_ID=3001061
;

-- 21/02/2020 11:55:33 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Process_Para SET ColumnName='Cantidad', Name='Cantidad', Description=NULL, Help=NULL, AD_Element_ID=3001061 WHERE UPPER(ColumnName)='CANTIDAD' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 21/02/2020 11:55:33 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Process_Para SET ColumnName='Cantidad', Name='Cantidad', Description=NULL, Help=NULL WHERE AD_Element_ID=3001061 AND IsCentrallyMaintained='Y'
;

-- 21/02/2020 11:55:33 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Field SET Name='Cantidad', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001061) AND IsCentrallyMaintained='Y'
;

-- 21/02/2020 11:55:33 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_PrintFormatItem SET PrintName='Cantidad', Name='Cantidad' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001061)
;

-- 21/02/2020 11:55:39 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Element_Trl SET Name='Cantidad',PrintName='Cantidad',Updated=TO_TIMESTAMP('2020-02-21 11:55:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001061 AND AD_Language='es_AR'
;

-- 21/02/2020 12:16:10 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('N',3000005,30,'N','N',3000134,3000221,'N','N','N','N',0,'Y','N','LAR','Detalle de Billetes',0,0,TO_TIMESTAMP('2020-02-21 12:16:09','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2020-02-21 12:16:09','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 21/02/2020 12:16:10 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000221 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 21/02/2020 12:16:43 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Tab SET TabLevel=1,Updated=TO_TIMESTAMP('2020-02-21 12:16:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000221
;

-- 21/02/2020 12:17:52 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Tab SET AD_Column_ID=4934,Updated=TO_TIMESTAMP('2020-02-21 12:17:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000008
;

-- 21/02/2020 12:17:59 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Tab SET AD_Column_ID=NULL,Updated=TO_TIMESTAMP('2020-02-21 12:17:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000008
;

-- 21/02/2020 12:18:13 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Tab SET AD_Column_ID=3003572,Updated=TO_TIMESTAMP('2020-02-21 12:18:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000221
;

-- 21/02/2020 12:19:20 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Tab SET IsSingleRow='Y',Updated=TO_TIMESTAMP('2020-02-21 12:19:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000221
;

-- 21/02/2020 12:19:26 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006665,1,'Y','N','N',3003570,'N','Y',3000221,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,TO_TIMESTAMP('2020-02-21 12:19:26','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2020-02-21 12:19:26','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/02/2020 12:19:26 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006665 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/02/2020 12:19:26 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006666,10,'Y','N','N',3003572,'N','Y',3000221,'N','The Bank Statement identifies a unique Bank Statement for a defined time period.  The statement defines all transactions that occurred','LAR','Bank Statement of account','Bank Statement',100,0,TO_TIMESTAMP('2020-02-21 12:19:26','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2020-02-21 12:19:26','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/02/2020 12:19:26 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006666 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/02/2020 12:19:26 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006667,10,'N','N','N',3003571,'N','Y',3000221,'N','LAR','Billete',100,0,TO_TIMESTAMP('2020-02-21 12:19:26','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2020-02-21 12:19:26','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/02/2020 12:19:26 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006667 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/02/2020 12:19:27 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006668,10,'Y','N','N',3003575,'N','Y',3000221,'N','LAR','Cantidad',100,0,TO_TIMESTAMP('2020-02-21 12:19:26','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2020-02-21 12:19:26','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/02/2020 12:19:27 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006668 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/02/2020 12:19:27 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006669,10,'Y','N','N',3003564,'N','Y',3000221,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,TO_TIMESTAMP('2020-02-21 12:19:27','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2020-02-21 12:19:27','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/02/2020 12:19:27 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006669 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/02/2020 12:19:27 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006670,255,'Y','N','N',3003574,'N','Y',3000221,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,TO_TIMESTAMP('2020-02-21 12:19:27','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2020-02-21 12:19:27','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/02/2020 12:19:27 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006670 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/02/2020 12:19:27 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006671,10,'Y','N','N',3003565,'N','Y',3000221,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,TO_TIMESTAMP('2020-02-21 12:19:27','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2020-02-21 12:19:27','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/02/2020 12:19:27 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006671 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/02/2020 12:19:27 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006672,10,'Y','N','N',3003573,'N','Y',3000221,'N','LAR','Valor',100,0,TO_TIMESTAMP('2020-02-21 12:19:27','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2020-02-21 12:19:27','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/02/2020 12:19:27 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006672 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 21/02/2020 12:20:16 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006665
;

-- 21/02/2020 12:20:16 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006666
;

-- 21/02/2020 12:20:16 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3006669
;

-- 21/02/2020 12:20:16 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3006671
;

-- 21/02/2020 12:20:16 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3006670
;

-- 21/02/2020 12:20:16 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3006672
;

-- 21/02/2020 12:20:16 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3006668
;

-- 21/02/2020 12:20:35 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2020-02-21 12:20:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006671
;

-- 21/02/2020 12:20:44 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2020-02-21 12:20:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006672
;

-- 21/02/2020 12:22:42 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2020-02-21 12:22:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006672
;

-- 21/02/2020 12:22:47 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2020-02-21 12:22:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006668
;

-- 21/02/2020 12:24:36 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2020-02-21 12:24:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006671
;

-- 21/02/2020 12:24:39 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2020-02-21 12:24:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006669
;

-- 21/02/2020 12:25:56 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Tab SET SeqNo=15,Updated=TO_TIMESTAMP('2020-02-21 12:25:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000221
;

-- 26/02/2020 21:25:14 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Column SET AD_Reference_ID=37,Updated=TO_TIMESTAMP('2020-02-26 21:25:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003573
;

-- 27/02/2020 19:06:36 ART
-- ISSUE #80: Discriminación de billetes en cierre de cajas.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2020-02-27 19:06:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000218
;

-- Registración de script
SELECT register_migration_script_lar('0149_ISSUE-80.sql', 'LAR', '')
;
