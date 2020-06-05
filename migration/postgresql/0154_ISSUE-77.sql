-- Tabla que define los parametros de conexión para FE.
CREATE TABLE LAR_ConfiguracionFE
(
  AD_Client_ID numeric(10,0) NOT NULL,
  AD_Org_ID numeric(10,0) NOT NULL,
  Created timestamp without time zone NOT NULL,
  CreatedBy numeric(10,0),
  Updated timestamp without time zone NOT NULL,
  UpdatedBy numeric(10,0) NOT NULL,
  IsActive character(1) NOT NULL,
  LAR_ConfiguracionFE_ID numeric(10,0) NOT NULL,
  Servicio character varying(20) NOT NULL,
  TiempoVidaTicket numeric(20,0) NOT NULL,
  Description character varying(255),
  Signer character varying(40) NOT NULL,
  ClaveCifrado character varying(40) NOT NULL,
  DstDN character varying(255) NOT NULL,
  CMS character varying(255) NOT NULL,
  WSDL character varying(255) NOT NULL,
  IsDefault character(1),
  Certificado character varying(40),
  Concepto numeric(2,0) NOT NULL,
  CONSTRAINT LAR_ConfiguracionFE_PKey PRIMARY KEY (LAR_ConfiguracionFE_ID),
  CONSTRAINT adclient_larconfiguracionfe FOREIGN KEY (AD_Client_ID)
      REFERENCES AD_Client (AD_Client_ID) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT adorg_larconfiguracionfe FOREIGN KEY (AD_Org_ID)
      REFERENCES AD_Org (AD_Org_ID) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT isactive_larconfiguracionfe_check CHECK (IsActive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])),
  CONSTRAINT isdefault_larconfiguracionfe_check CHECK (IsDefault = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
)
WITH (
  OIDS=FALSE
);
ALTER TABLE LAR_ConfiguracionFE
  OWNER TO ADempiere;

-- 28/05/2020 19:33:58 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,ImportTable,IsHighVolume,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','3',0,3000137,'N','N','N','N','N','LAR','Y','Y','L','LAR_ConfiguracionFE','Configuración de Facturación Eléctronica',0,'Y',0,100,TO_TIMESTAMP('2020-05-28 19:33:58','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2020-05-28 19:33:58','YYYY-MM-DD HH24:MI:SS'))
;

-- 28/05/2020 19:33:58 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000137 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- 28/05/2020 19:33:59 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,UpdatedBy,AD_Client_ID,Updated,Created,CreatedBy,IsActive) VALUES (1,'N',200000,'Y',1000000,1000000,'N','Y',3000932,'Table LAR_ConfiguracionFE','LAR_ConfiguracionFE',0,100,0,TO_TIMESTAMP('2020-05-28 19:33:58','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2020-05-28 19:33:58','YYYY-MM-DD HH24:MI:SS'),100,'Y')
;

-- 28/05/2020 19:36:00 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003616,3000137,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,TO_TIMESTAMP('2020-05-28 19:35:59','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-05-28 19:35:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/05/2020 19:36:00 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003616 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/05/2020 19:36:00 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003617,3000137,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',100,TO_TIMESTAMP('2020-05-28 19:36:00','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-05-28 19:36:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/05/2020 19:36:00 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003617 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/05/2020 19:36:00 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003618,3000137,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,TO_TIMESTAMP('2020-05-28 19:36:00','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-05-28 19:36:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/05/2020 19:36:00 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003618 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/05/2020 19:36:00 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003619,3000137,'LAR',0,110,'N','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,TO_TIMESTAMP('2020-05-28 19:36:00','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-05-28 19:36:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/05/2020 19:36:00 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003619 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/05/2020 19:36:01 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003620,3000137,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,TO_TIMESTAMP('2020-05-28 19:36:00','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-05-28 19:36:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/05/2020 19:36:01 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003620 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/05/2020 19:36:01 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003621,3000137,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,TO_TIMESTAMP('2020-05-28 19:36:01','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-05-28 19:36:01','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/05/2020 19:36:01 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003621 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/05/2020 19:36:01 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003622,3000137,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,TO_TIMESTAMP('2020-05-28 19:36:01','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-05-28 19:36:01','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/05/2020 19:36:01 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003622 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/05/2020 19:36:01 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001069,'LAR_ConfiguracionFE_ID','LAR','Configuración de Facturación Eléctronica','Configuración de Facturación Eléctronica',0,TO_TIMESTAMP('2020-05-28 19:36:01','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2020-05-28 19:36:01','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 28/05/2020 19:36:02 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001069 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 28/05/2020 19:36:02 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003623,3000137,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3001069,'N','N','N','Configuración de Facturación Eléctronica','LAR_ConfiguracionFE_ID',100,TO_TIMESTAMP('2020-05-28 19:36:01','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-05-28 19:36:01','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/05/2020 19:36:02 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003623 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/05/2020 19:36:02 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001070,'servicio','LAR','servicio','servicio',0,TO_TIMESTAMP('2020-05-28 19:36:02','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2020-05-28 19:36:02','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 28/05/2020 19:36:02 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001070 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 28/05/2020 19:36:02 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003624,3000137,'LAR',0,'Y','N','N','N',20,'N',10,'N',3001070,'N','Y','N','servicio','servicio',100,TO_TIMESTAMP('2020-05-28 19:36:02','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-05-28 19:36:02','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/05/2020 19:36:02 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003624 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/05/2020 19:36:02 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001071,'tiempovidaticket','LAR','tiempovidaticket','tiempovidaticket',0,TO_TIMESTAMP('2020-05-28 19:36:02','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2020-05-28 19:36:02','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 28/05/2020 19:36:02 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001071 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 28/05/2020 19:36:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003625,3000137,'LAR',0,'Y','N','N','N',20,'N',22,'N',3001071,'N','Y','N','tiempovidaticket','tiempovidaticket',100,TO_TIMESTAMP('2020-05-28 19:36:02','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-05-28 19:36:02','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/05/2020 19:36:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003625 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/05/2020 19:36:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003626,3000137,'LAR',0,'N','N','N','A description is limited to 255 characters.','N',255,'Y',10,'N',275,'N','Y','N','Optional short description of the record','Description','Description',100,TO_TIMESTAMP('2020-05-28 19:36:03','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-05-28 19:36:03','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/05/2020 19:36:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003626 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/05/2020 19:36:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001072,'signer','LAR','signer','signer',0,TO_TIMESTAMP('2020-05-28 19:36:03','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2020-05-28 19:36:03','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 28/05/2020 19:36:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001072 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 28/05/2020 19:36:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003627,3000137,'LAR',0,'Y','N','N','N',40,'N',10,'N',3001072,'N','Y','N','signer','signer',100,TO_TIMESTAMP('2020-05-28 19:36:03','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-05-28 19:36:03','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/05/2020 19:36:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003627 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/05/2020 19:36:04 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001073,'clavecifrado','LAR','clavecifrado','clavecifrado',0,TO_TIMESTAMP('2020-05-28 19:36:03','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2020-05-28 19:36:03','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 28/05/2020 19:36:04 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001073 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 28/05/2020 19:36:04 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003628,3000137,'LAR',0,'Y','N','N','N',40,'N',10,'N',3001073,'N','Y','N','clavecifrado','clavecifrado',100,TO_TIMESTAMP('2020-05-28 19:36:03','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-05-28 19:36:03','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/05/2020 19:36:04 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003628 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/05/2020 19:36:04 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001074,'dstdn','LAR','dstdn','dstdn',0,TO_TIMESTAMP('2020-05-28 19:36:04','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2020-05-28 19:36:04','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 28/05/2020 19:36:04 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001074 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 28/05/2020 19:36:04 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003629,3000137,'LAR',0,'Y','N','N','N',255,'N',10,'N',3001074,'N','Y','N','dstdn','dstdn',100,TO_TIMESTAMP('2020-05-28 19:36:04','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-05-28 19:36:04','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/05/2020 19:36:04 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003629 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/05/2020 19:36:05 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001075,'cms','LAR','cms','cms',0,TO_TIMESTAMP('2020-05-28 19:36:04','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2020-05-28 19:36:04','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 28/05/2020 19:36:05 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001075 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 28/05/2020 19:36:05 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003630,3000137,'LAR',0,'Y','N','N','N',255,'N',10,'N',3001075,'N','Y','N','cms','cms',100,TO_TIMESTAMP('2020-05-28 19:36:04','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-05-28 19:36:04','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/05/2020 19:36:05 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003630 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/05/2020 19:36:05 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003631,3000137,'LAR',0,'N','N','N','The Default Checkbox indicates if this record will be used as a default value.','N',1,'N',20,'N',1103,'N','Y','N','Default value','Default','IsDefault',100,TO_TIMESTAMP('2020-05-28 19:36:05','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-05-28 19:36:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/05/2020 19:36:05 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003631 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/05/2020 19:36:05 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001076,'certificado','LAR','certificado','certificado',0,TO_TIMESTAMP('2020-05-28 19:36:05','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2020-05-28 19:36:05','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 28/05/2020 19:36:05 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001076 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 28/05/2020 19:36:06 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003632,3000137,'LAR',0,'N','N','N','N',40,'N',10,'N',3001076,'N','Y','N','certificado','certificado',100,TO_TIMESTAMP('2020-05-28 19:36:05','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-05-28 19:36:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/05/2020 19:36:06 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003632 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/05/2020 19:36:45 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column SET Name='Certificado', ColumnName='Certificado',Updated=TO_TIMESTAMP('2020-05-28 19:36:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003632
;

-- 28/05/2020 19:36:45 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003632
;

-- 28/05/2020 19:36:45 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET Name='Certificado', Description=NULL, Help=NULL WHERE AD_Column_ID=3003632 AND IsCentrallyMaintained='Y'
;

-- 28/05/2020 19:36:51 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column_Trl SET Name='Certificado',Updated=TO_TIMESTAMP('2020-05-28 19:36:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003632 AND AD_Language='es_AR'
;

-- 28/05/2020 19:37:10 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Element SET ColumnName='Certificado', Name='Certificado', PrintName='Certificado',Updated=TO_TIMESTAMP('2020-05-28 19:37:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001076
;

-- 28/05/2020 19:37:10 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001076
;

-- 28/05/2020 19:37:10 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column SET ColumnName='Certificado', Name='Certificado', Description=NULL, Help=NULL WHERE AD_Element_ID=3001076
;

-- 28/05/2020 19:37:10 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='Certificado', Name='Certificado', Description=NULL, Help=NULL, AD_Element_ID=3001076 WHERE UPPER(ColumnName)='CERTIFICADO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 28/05/2020 19:37:10 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='Certificado', Name='Certificado', Description=NULL, Help=NULL WHERE AD_Element_ID=3001076 AND IsCentrallyMaintained='Y'
;

-- 28/05/2020 19:37:10 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET Name='Certificado', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001076) AND IsCentrallyMaintained='Y'
;

-- 28/05/2020 19:37:10 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_PrintFormatItem SET PrintName='Certificado', Name='Certificado' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001076)
;

-- 28/05/2020 19:38:46 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column SET Name='Clave de Cifrado', ColumnName='ClaveCifrado',Updated=TO_TIMESTAMP('2020-05-28 19:38:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003628
;

-- 28/05/2020 19:38:46 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003628
;

-- 28/05/2020 19:38:46 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET Name='Clave de Cifrado', Description=NULL, Help=NULL WHERE AD_Column_ID=3003628 AND IsCentrallyMaintained='Y'
;

-- 28/05/2020 19:38:51 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column_Trl SET Name='Clave de Cifrado',Updated=TO_TIMESTAMP('2020-05-28 19:38:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003628 AND AD_Language='es_AR'
;

-- 28/05/2020 19:39:08 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Element SET ColumnName='ClaveCifrado', Name='Clave de Cifrado', PrintName='Clave de Cifrado',Updated=TO_TIMESTAMP('2020-05-28 19:39:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001073
;

-- 28/05/2020 19:39:08 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001073
;

-- 28/05/2020 19:39:08 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column SET ColumnName='ClaveCifrado', Name='Clave de Cifrado', Description=NULL, Help=NULL WHERE AD_Element_ID=3001073
;

-- 28/05/2020 19:39:08 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='ClaveCifrado', Name='Clave de Cifrado', Description=NULL, Help=NULL, AD_Element_ID=3001073 WHERE UPPER(ColumnName)='CLAVECIFRADO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 28/05/2020 19:39:08 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='ClaveCifrado', Name='Clave de Cifrado', Description=NULL, Help=NULL WHERE AD_Element_ID=3001073 AND IsCentrallyMaintained='Y'
;

-- 28/05/2020 19:39:08 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET Name='Clave de Cifrado', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001073) AND IsCentrallyMaintained='Y'
;

-- 28/05/2020 19:39:08 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_PrintFormatItem SET PrintName='Clave de Cifrado', Name='Clave de Cifrado' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001073)
;

-- 28/05/2020 19:39:14 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Element_Trl SET Name='Clave de Cifrado',PrintName='Clave de Cifrado',Updated=TO_TIMESTAMP('2020-05-28 19:39:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001073 AND AD_Language='es_AR'
;

-- 28/05/2020 19:39:49 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column SET Name='Cms', ColumnName='Cms',Updated=TO_TIMESTAMP('2020-05-28 19:39:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003630
;

-- 28/05/2020 19:39:49 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003630
;

-- 28/05/2020 19:39:49 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET Name='Cms', Description=NULL, Help=NULL WHERE AD_Column_ID=3003630 AND IsCentrallyMaintained='Y'
;

-- 28/05/2020 19:39:55 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column_Trl SET Name='Cms',Updated=TO_TIMESTAMP('2020-05-28 19:39:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003630 AND AD_Language='es_AR'
;

-- 28/05/2020 19:40:05 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Element SET ColumnName='Cms', Name='Cms', PrintName='Cms',Updated=TO_TIMESTAMP('2020-05-28 19:40:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001075
;

-- 28/05/2020 19:40:05 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001075
;

-- 28/05/2020 19:40:05 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column SET ColumnName='Cms', Name='Cms', Description=NULL, Help=NULL WHERE AD_Element_ID=3001075
;

-- 28/05/2020 19:40:05 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='Cms', Name='Cms', Description=NULL, Help=NULL, AD_Element_ID=3001075 WHERE UPPER(ColumnName)='CMS' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 28/05/2020 19:40:05 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='Cms', Name='Cms', Description=NULL, Help=NULL WHERE AD_Element_ID=3001075 AND IsCentrallyMaintained='Y'
;

-- 28/05/2020 19:40:05 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET Name='Cms', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001075) AND IsCentrallyMaintained='Y'
;

-- 28/05/2020 19:40:05 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_PrintFormatItem SET PrintName='Cms', Name='Cms' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001075)
;

-- 28/05/2020 19:40:10 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Element_Trl SET Name='Cms',PrintName='Cms',Updated=TO_TIMESTAMP('2020-05-28 19:40:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001075 AND AD_Language='es_AR'
;

-- 28/05/2020 19:40:45 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column SET Name='DstDN', ColumnName='DstDN',Updated=TO_TIMESTAMP('2020-05-28 19:40:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003629
;

-- 28/05/2020 19:40:45 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003629
;

-- 28/05/2020 19:40:45 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET Name='DstDN', Description=NULL, Help=NULL WHERE AD_Column_ID=3003629 AND IsCentrallyMaintained='Y'
;

-- 28/05/2020 19:40:50 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column_Trl SET Name='DstDN',Updated=TO_TIMESTAMP('2020-05-28 19:40:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003629 AND AD_Language='es_AR'
;

-- 28/05/2020 19:40:59 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Element SET ColumnName='DstDN', Name='DstDN', PrintName='DstDN',Updated=TO_TIMESTAMP('2020-05-28 19:40:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001074
;

-- 28/05/2020 19:40:59 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001074
;

-- 28/05/2020 19:40:59 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column SET ColumnName='DstDN', Name='DstDN', Description=NULL, Help=NULL WHERE AD_Element_ID=3001074
;

-- 28/05/2020 19:40:59 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='DstDN', Name='DstDN', Description=NULL, Help=NULL, AD_Element_ID=3001074 WHERE UPPER(ColumnName)='DSTDN' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 28/05/2020 19:40:59 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='DstDN', Name='DstDN', Description=NULL, Help=NULL WHERE AD_Element_ID=3001074 AND IsCentrallyMaintained='Y'
;

-- 28/05/2020 19:40:59 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET Name='DstDN', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001074) AND IsCentrallyMaintained='Y'
;

-- 28/05/2020 19:40:59 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_PrintFormatItem SET PrintName='DstDN', Name='DstDN' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001074)
;

-- 28/05/2020 19:41:04 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Element_Trl SET Name='DstDN',PrintName='DstDN',Updated=TO_TIMESTAMP('2020-05-28 19:41:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001074 AND AD_Language='es_AR'
;

-- 28/05/2020 19:41:52 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column SET Name='Servicio', ColumnName='Servicio',Updated=TO_TIMESTAMP('2020-05-28 19:41:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003624
;

-- 28/05/2020 19:41:52 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003624
;

-- 28/05/2020 19:41:52 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET Name='Servicio', Description=NULL, Help=NULL WHERE AD_Column_ID=3003624 AND IsCentrallyMaintained='Y'
;

-- 28/05/2020 19:41:56 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column_Trl SET Name='Servicio',Updated=TO_TIMESTAMP('2020-05-28 19:41:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003624 AND AD_Language='es_AR'
;

-- 28/05/2020 19:42:10 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Element SET ColumnName='Servicio', Name='Servicio', PrintName='Servicio',Updated=TO_TIMESTAMP('2020-05-28 19:42:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001070
;

-- 28/05/2020 19:42:10 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001070
;

-- 28/05/2020 19:42:10 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column SET ColumnName='Servicio', Name='Servicio', Description=NULL, Help=NULL WHERE AD_Element_ID=3001070
;

-- 28/05/2020 19:42:10 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='Servicio', Name='Servicio', Description=NULL, Help=NULL, AD_Element_ID=3001070 WHERE UPPER(ColumnName)='SERVICIO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 28/05/2020 19:42:10 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='Servicio', Name='Servicio', Description=NULL, Help=NULL WHERE AD_Element_ID=3001070 AND IsCentrallyMaintained='Y'
;

-- 28/05/2020 19:42:10 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET Name='Servicio', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001070) AND IsCentrallyMaintained='Y'
;

-- 28/05/2020 19:42:10 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_PrintFormatItem SET PrintName='Servicio', Name='Servicio' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001070)
;

-- 28/05/2020 19:42:16 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Element_Trl SET Name='Servicio',PrintName='Servicio',Updated=TO_TIMESTAMP('2020-05-28 19:42:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001070 AND AD_Language='es_AR'
;

-- 28/05/2020 19:42:30 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column SET Name='Signer', ColumnName='Signer',Updated=TO_TIMESTAMP('2020-05-28 19:42:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003627
;

-- 28/05/2020 19:42:30 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003627
;

-- 28/05/2020 19:42:30 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET Name='Signer', Description=NULL, Help=NULL WHERE AD_Column_ID=3003627 AND IsCentrallyMaintained='Y'
;

-- 28/05/2020 19:42:35 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column_Trl SET Name='Signer',Updated=TO_TIMESTAMP('2020-05-28 19:42:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003627 AND AD_Language='es_AR'
;

-- 28/05/2020 19:42:45 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Element SET ColumnName='Signer', Name='Signer', PrintName='Signer',Updated=TO_TIMESTAMP('2020-05-28 19:42:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001072
;

-- 28/05/2020 19:42:45 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001072
;

-- 28/05/2020 19:42:45 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column SET ColumnName='Signer', Name='Signer', Description=NULL, Help=NULL WHERE AD_Element_ID=3001072
;

-- 28/05/2020 19:42:45 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='Signer', Name='Signer', Description=NULL, Help=NULL, AD_Element_ID=3001072 WHERE UPPER(ColumnName)='SIGNER' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 28/05/2020 19:42:45 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='Signer', Name='Signer', Description=NULL, Help=NULL WHERE AD_Element_ID=3001072 AND IsCentrallyMaintained='Y'
;

-- 28/05/2020 19:42:45 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET Name='Signer', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001072) AND IsCentrallyMaintained='Y'
;

-- 28/05/2020 19:42:45 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_PrintFormatItem SET PrintName='Signer', Name='Signer' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001072)
;

-- 28/05/2020 19:43:36 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column SET Name='Tiempo de Vida de Ticket', ColumnName='TiempoVidaTicket',Updated=TO_TIMESTAMP('2020-05-28 19:43:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003625
;

-- 28/05/2020 19:43:36 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003625
;

-- 28/05/2020 19:43:36 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET Name='Tiempo de Vida de Ticket', Description=NULL, Help=NULL WHERE AD_Column_ID=3003625 AND IsCentrallyMaintained='Y'
;

-- 28/05/2020 19:43:41 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column_Trl SET Name='Tiempo de Vida de Ticket',Updated=TO_TIMESTAMP('2020-05-28 19:43:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003625 AND AD_Language='es_AR'
;

-- 28/05/2020 19:44:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Element SET ColumnName='TiempoVidaTicket', Name='Tiempo de Vida de Ticket', PrintName='Tiempo de Vida de Ticket',Updated=TO_TIMESTAMP('2020-05-28 19:44:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001071
;

-- 28/05/2020 19:44:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001071
;

-- 28/05/2020 19:44:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column SET ColumnName='TiempoVidaTicket', Name='Tiempo de Vida de Ticket', Description=NULL, Help=NULL WHERE AD_Element_ID=3001071
;

-- 28/05/2020 19:44:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='TiempoVidaTicket', Name='Tiempo de Vida de Ticket', Description=NULL, Help=NULL, AD_Element_ID=3001071 WHERE UPPER(ColumnName)='TIEMPOVIDATICKET' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 28/05/2020 19:44:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='TiempoVidaTicket', Name='Tiempo de Vida de Ticket', Description=NULL, Help=NULL WHERE AD_Element_ID=3001071 AND IsCentrallyMaintained='Y'
;

-- 28/05/2020 19:44:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET Name='Tiempo de Vida de Ticket', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001071) AND IsCentrallyMaintained='Y'
;

-- 28/05/2020 19:44:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_PrintFormatItem SET PrintName='Tiempo de Vida de Ticket', Name='Tiempo de Vida de Ticket' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001071)
;

-- 28/05/2020 19:44:13 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Element_Trl SET Name='Tiempo de Vida de Ticket',PrintName='Tiempo de Vida de Ticket',Updated=TO_TIMESTAMP('2020-05-28 19:44:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001071 AND AD_Language='es_AR'
;

-- 28/05/2020 19:48:21 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Window (AD_Window_ID,WindowType,IsSOTrx,IsDefault,IsBetaFunctionality,WinHeight,WinWidth,EntityType,Name,IsActive,Created,UpdatedBy,CreatedBy,Updated,AD_Org_ID,AD_Client_ID,Processing) VALUES (3000099,'M','Y','N','N',0,0,'LAR','Configuración de Facturación Eléctronica','Y',TO_TIMESTAMP('2020-05-28 19:48:21','YYYY-MM-DD HH24:MI:SS'),100,100,TO_TIMESTAMP('2020-05-28 19:48:21','YYYY-MM-DD HH24:MI:SS'),0,0,'N')
;

-- 28/05/2020 19:48:21 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Window_Trl (AD_Language,AD_Window_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Window_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Window t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Window_ID=3000099 AND NOT EXISTS (SELECT * FROM AD_Window_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Window_ID=t.AD_Window_ID)
;

-- 28/05/2020 19:54:00 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('N',3000099,10,'N','N',3000137,3000228,'N','N','N','N',0,'Y','N','LAR','Parámetros',0,0,TO_TIMESTAMP('2020-05-28 19:54:00','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2020-05-28 19:54:00','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 28/05/2020 19:54:00 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000228 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 28/05/2020 19:54:17 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006877,1,'Y','N','N',3003622,'N','Y',3000228,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,TO_TIMESTAMP('2020-05-28 19:54:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2020-05-28 19:54:17','YYYY-MM-DD HH24:MI:SS'))
;

-- 28/05/2020 19:54:17 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006877 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/05/2020 19:54:17 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006878,40,'Y','N','N',3003632,'N','Y',3000228,'N','LAR','Certificado',100,0,TO_TIMESTAMP('2020-05-28 19:54:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2020-05-28 19:54:17','YYYY-MM-DD HH24:MI:SS'))
;

-- 28/05/2020 19:54:17 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006878 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/05/2020 19:54:18 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006879,40,'Y','N','N',3003628,'N','Y',3000228,'N','LAR','Clave de Cifrado',100,0,TO_TIMESTAMP('2020-05-28 19:54:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2020-05-28 19:54:17','YYYY-MM-DD HH24:MI:SS'))
;

-- 28/05/2020 19:54:18 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006879 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/05/2020 19:54:18 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006880,10,'Y','N','N',3003616,'N','Y',3000228,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,TO_TIMESTAMP('2020-05-28 19:54:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2020-05-28 19:54:18','YYYY-MM-DD HH24:MI:SS'))
;

-- 28/05/2020 19:54:18 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006880 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/05/2020 19:54:18 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006881,255,'Y','N','N',3003630,'N','Y',3000228,'N','LAR','Cms',100,0,TO_TIMESTAMP('2020-05-28 19:54:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2020-05-28 19:54:18','YYYY-MM-DD HH24:MI:SS'))
;

-- 28/05/2020 19:54:18 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006881 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/05/2020 19:54:18 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006882,10,'N','N','N',3003623,'N','Y',3000228,'N','LAR','Configuración de Facturación Eléctronica',100,0,TO_TIMESTAMP('2020-05-28 19:54:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2020-05-28 19:54:18','YYYY-MM-DD HH24:MI:SS'))
;

-- 28/05/2020 19:54:18 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006882 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/05/2020 19:54:18 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006883,1,'Y','N','N',3003631,'N','Y',3000228,'N','The Default Checkbox indicates if this record will be used as a default value.','LAR','Default value','Default',100,0,TO_TIMESTAMP('2020-05-28 19:54:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2020-05-28 19:54:18','YYYY-MM-DD HH24:MI:SS'))
;

-- 28/05/2020 19:54:18 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006883 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/05/2020 19:54:19 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006884,255,'Y','N','N',3003626,'N','Y',3000228,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,TO_TIMESTAMP('2020-05-28 19:54:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2020-05-28 19:54:18','YYYY-MM-DD HH24:MI:SS'))
;

-- 28/05/2020 19:54:19 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006884 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/05/2020 19:54:19 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006885,255,'Y','N','N',3003629,'N','Y',3000228,'N','LAR','DstDN',100,0,TO_TIMESTAMP('2020-05-28 19:54:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2020-05-28 19:54:19','YYYY-MM-DD HH24:MI:SS'))
;

-- 28/05/2020 19:54:19 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006885 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/05/2020 19:54:19 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006886,10,'Y','N','N',3003617,'N','Y',3000228,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,TO_TIMESTAMP('2020-05-28 19:54:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2020-05-28 19:54:19','YYYY-MM-DD HH24:MI:SS'))
;

-- 28/05/2020 19:54:19 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006886 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/05/2020 19:54:19 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006887,20,'Y','N','N',3003624,'N','Y',3000228,'N','LAR','Servicio',100,0,TO_TIMESTAMP('2020-05-28 19:54:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2020-05-28 19:54:19','YYYY-MM-DD HH24:MI:SS'))
;

-- 28/05/2020 19:54:19 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006887 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/05/2020 19:54:20 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006888,40,'Y','N','N',3003627,'N','Y',3000228,'N','LAR','Signer',100,0,TO_TIMESTAMP('2020-05-28 19:54:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2020-05-28 19:54:19','YYYY-MM-DD HH24:MI:SS'))
;

-- 28/05/2020 19:54:20 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006888 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/05/2020 19:54:20 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006889,20,'Y','N','N',3003625,'N','Y',3000228,'N','LAR','Tiempo de Vida de Ticket',100,0,TO_TIMESTAMP('2020-05-28 19:54:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2020-05-28 19:54:20','YYYY-MM-DD HH24:MI:SS'))
;

-- 28/05/2020 19:54:20 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006889 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/05/2020 19:58:05 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3006880
;

-- 28/05/2020 19:58:05 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3006886
;

-- 28/05/2020 19:58:05 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3006884
;

-- 28/05/2020 19:58:05 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3006878
;

-- 28/05/2020 19:58:05 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3006879
;

-- 28/05/2020 19:58:05 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3006888
;

-- 28/05/2020 19:58:05 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3006887
;

-- 28/05/2020 19:58:05 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3006881
;

-- 28/05/2020 19:58:05 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3006885
;

-- 28/05/2020 19:58:05 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3006889
;

-- 28/05/2020 19:58:05 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3006883
;

-- 28/05/2020 19:58:05 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3006877
;

-- 28/05/2020 19:58:14 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2020-05-28 19:58:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006886
;

-- 28/05/2020 19:58:27 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2020-05-28 19:58:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006879
;

-- 28/05/2020 19:58:33 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2020-05-28 19:58:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006887
;

-- 28/05/2020 19:58:39 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2020-05-28 19:58:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006885
;

-- 28/05/2020 19:59:10 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2020-05-28 19:59:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006877
;

-- 28/05/2020 20:08:05 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Menu (AD_Window_ID,AD_Menu_ID,IsSummary,"action",IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000099,3000367,'N','W','Y','N','LAR','Y','Configuración de Facturación Eléctronica',TO_TIMESTAMP('2020-05-28 20:08:04','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_TIMESTAMP('2020-05-28 20:08:04','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 28/05/2020 20:08:05 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000367 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 28/05/2020 20:08:05 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100,t.AD_Tree_ID, 3000367, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000367)
;

-- 28/05/2020 20:15:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=218
;

-- 28/05/2020 20:15:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=153
;

-- 28/05/2020 20:15:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=263
;

-- 28/05/2020 20:15:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=166
;

-- 28/05/2020 20:15:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=203
;

-- 28/05/2020 20:15:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53242
;

-- 28/05/2020 20:15:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=236
;

-- 28/05/2020 20:15:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=7, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=183
;

-- 28/05/2020 20:15:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=8, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=160
;

-- 28/05/2020 20:15:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=9, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=278
;

-- 28/05/2020 20:15:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=10, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53296
;

-- 28/05/2020 20:15:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=11, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=345
;

-- 28/05/2020 20:15:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=12, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53014
;

-- 28/05/2020 20:15:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=13, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000000
;

-- 28/05/2020 20:15:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=14, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000367
;

-- 28/05/2020 20:15:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=15, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53108
;

-- 28/05/2020 20:15:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=16, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53066
;

-- 28/05/2020 20:15:03 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=17, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000367
;

-- 28/05/2020 20:17:33 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2020-05-28 20:17:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006878
;

-- 28/05/2020 20:17:40 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2020-05-28 20:17:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006879
;

-- 28/05/2020 20:17:45 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2020-05-28 20:17:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006888
;

-- 28/05/2020 20:17:52 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2020-05-28 20:17:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006881
;

-- 28/05/2020 20:17:56 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2020-05-28 20:17:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006885
;

-- 28/05/2020 20:20:45 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column SET IsMandatory='Y',Updated=TO_TIMESTAMP('2020-05-28 20:20:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003632
;

-- 28/05/2020 20:21:30 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Tab SET IsSingleRow='Y',Updated=TO_TIMESTAMP('2020-05-28 20:21:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000228
;

-- 04/06/2020 18:54:49 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001079,'concepto','LAR','concepto','concepto',0,TO_TIMESTAMP('2020-06-04 18:54:48','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2020-06-04 18:54:48','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 04/06/2020 18:54:49 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001079 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 04/06/2020 18:54:49 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003639,3000137,'LAR',0,'Y','N','N','N',2,'N',22,'N',3001079,'N','Y','N','concepto','concepto',100,TO_TIMESTAMP('2020-06-04 18:54:48','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-06-04 18:54:48','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 04/06/2020 18:54:49 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003639 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 04/06/2020 18:54:50 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001080,'wsdl','LAR','wsdl','wsdl',0,TO_TIMESTAMP('2020-06-04 18:54:49','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2020-06-04 18:54:49','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 04/06/2020 18:54:50 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001080 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 04/06/2020 18:54:50 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003640,3000137,'LAR',0,'N','N','N','N',255,'N',10,'N',3001080,'N','Y','N','wsdl','wsdl',100,TO_TIMESTAMP('2020-06-04 18:54:49','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-06-04 18:54:49','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 04/06/2020 18:54:50 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003640 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 04/06/2020 18:55:50 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column SET Name='Concepto', ColumnName='Concepto',Updated=TO_TIMESTAMP('2020-06-04 18:55:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003639
;

-- 04/06/2020 18:55:50 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003639
;

-- 04/06/2020 18:55:50 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET Name='Concepto', Description=NULL, Help=NULL WHERE AD_Column_ID=3003639 AND IsCentrallyMaintained='Y'
;

-- 04/06/2020 18:55:57 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column_Trl SET Name='Concepto',Updated=TO_TIMESTAMP('2020-06-04 18:55:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003639 AND AD_Language='es_AR'
;

-- 04/06/2020 18:56:09 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Element SET ColumnName='Concepto', Name='Concepto', PrintName='Concepto',Updated=TO_TIMESTAMP('2020-06-04 18:56:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001079
;

-- 04/06/2020 18:56:09 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001079
;

-- 04/06/2020 18:56:09 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column SET ColumnName='Concepto', Name='Concepto', Description=NULL, Help=NULL WHERE AD_Element_ID=3001079
;

-- 04/06/2020 18:56:09 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='Concepto', Name='Concepto', Description=NULL, Help=NULL, AD_Element_ID=3001079 WHERE UPPER(ColumnName)='CONCEPTO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 04/06/2020 18:56:09 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='Concepto', Name='Concepto', Description=NULL, Help=NULL WHERE AD_Element_ID=3001079 AND IsCentrallyMaintained='Y'
;

-- 04/06/2020 18:56:09 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET Name='Concepto', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001079) AND IsCentrallyMaintained='Y'
;

-- 04/06/2020 18:56:09 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_PrintFormatItem SET PrintName='Concepto', Name='Concepto' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001079)
;

-- 04/06/2020 18:56:15 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Element_Trl SET Name='Concepto',PrintName='Concepto',Updated=TO_TIMESTAMP('2020-06-04 18:56:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001079 AND AD_Language='es_AR'
;

-- 04/06/2020 18:58:40 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column SET Name='WSDL', ColumnName='WSDL',Updated=TO_TIMESTAMP('2020-06-04 18:58:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003640
;

-- 04/06/2020 18:58:40 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003640
;

-- 04/06/2020 18:58:40 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET Name='WSDL', Description=NULL, Help=NULL WHERE AD_Column_ID=3003640 AND IsCentrallyMaintained='Y'
;

-- 04/06/2020 18:58:45 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column_Trl SET Name='WSDL',Updated=TO_TIMESTAMP('2020-06-04 18:58:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003640 AND AD_Language='es_AR'
;

-- 04/06/2020 18:58:53 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Element SET ColumnName='WSDL', Name='WSDL', PrintName='WSDL',Updated=TO_TIMESTAMP('2020-06-04 18:58:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001080
;

-- 04/06/2020 18:58:53 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001080
;

-- 04/06/2020 18:58:53 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column SET ColumnName='WSDL', Name='WSDL', Description=NULL, Help=NULL WHERE AD_Element_ID=3001080
;

-- 04/06/2020 18:58:53 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='WSDL', Name='WSDL', Description=NULL, Help=NULL, AD_Element_ID=3001080 WHERE UPPER(ColumnName)='WSDL' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 04/06/2020 18:58:53 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='WSDL', Name='WSDL', Description=NULL, Help=NULL WHERE AD_Element_ID=3001080 AND IsCentrallyMaintained='Y'
;

-- 04/06/2020 18:58:53 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET Name='WSDL', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001080) AND IsCentrallyMaintained='Y'
;

-- 04/06/2020 18:58:53 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_PrintFormatItem SET PrintName='WSDL', Name='WSDL' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001080)
;

-- 04/06/2020 18:58:58 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Element_Trl SET Name='WSDL',PrintName='WSDL',Updated=TO_TIMESTAMP('2020-06-04 18:58:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001080 AND AD_Language='es_AR'
;

-- 04/06/2020 19:00:15 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Column SET IsMandatory='Y',Updated=TO_TIMESTAMP('2020-06-04 19:00:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003640
;

-- 04/06/2020 19:01:34 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006890,2,'Y','N','N',3003639,'N','Y',3000228,'N','LAR','Concepto',100,0,TO_TIMESTAMP('2020-06-04 19:01:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2020-06-04 19:01:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 04/06/2020 19:01:34 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006890 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/06/2020 19:01:35 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006891,255,'Y','N','N',3003640,'N','Y',3000228,'N','LAR','WSDL',100,0,TO_TIMESTAMP('2020-06-04 19:01:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2020-06-04 19:01:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 04/06/2020 19:01:35 ART
-- ISSUE #77: Configuración Facturación Electronica.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006891 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/06/2020 19:10:10 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3006891
;

-- 04/06/2020 19:10:10 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3006890
;

-- 04/06/2020 19:10:10 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3006883
;

-- 04/06/2020 19:10:10 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3006877
;

-- 04/06/2020 19:10:25 ART
-- ISSUE #77: Configuración Facturación Electronica.
UPDATE AD_Field SET DisplayLength=20, IsSameLine='Y',Updated=TO_TIMESTAMP('2020-06-04 19:10:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006891
;

-- Registración de script
SELECT register_migration_script_lar('0154_ISSUE-77.sql', 'LAR', '')
;
