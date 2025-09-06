-- =====================================
-- LAR_LoteSueldos (Header)
-- =====================================
CREATE TABLE adempiere.LAR_LoteSueldos
(
    LAR_LoteSueldos_ID NUMBER(10) NOT NULL,
    AD_Client_ID NUMBER(10),
    AD_Org_ID NUMBER(10),
    UpdatedBy NUMBER(10),
    Updated TIMESTAMP,
    CreatedBy NUMBER(10),
    Created TIMESTAMP,
    IsActive CHAR(1) DEFAULT 'Y',
    Description VARCHAR2(255),
    C_DocType_ID NUMBER(10),
    DocAction VARCHAR2(2),
    DocStatus VARCHAR2(2),
    DocumentNo VARCHAR2(50),
    DateTrx TIMESTAMP,
    RecuperarSueldos CHAR(1),
    Processed CHAR(1) DEFAULT 'N',
    LoteImporte NUMBER,
    C_BankAccount_ID NUMBER(10),
    LAR_ConceptoCaja_ID NUMBER(10),
    DocStatusPagos VARCHAR2(2), -- DocAction a usar al crear pagos

    CONSTRAINT LAR_LoteSueldos_pkey PRIMARY KEY (LAR_LoteSueldos_ID),
    CONSTRAINT adclient_LoteSueldos FOREIGN KEY (AD_Client_ID)
        REFERENCES adempiere.ad_client (ad_client_id),
    CONSTRAINT adorg_LoteSueldos FOREIGN KEY (AD_Org_ID)
        REFERENCES adempiere.ad_org (ad_org_id),
    CONSTRAINT cdoctype_LoteSueldos FOREIGN KEY (C_DocType_ID)
        REFERENCES adempiere.c_doctype (c_doctype_id),
    CONSTRAINT larconceptocaja_LoteSueldos FOREIGN KEY (LAR_ConceptoCaja_ID)
        REFERENCES adempiere.LAR_ConceptoCaja (LAR_ConceptoCaja_ID)
);

-- Índices adicionales
CREATE INDEX LAR_LoteSueldos_CDocType
    ON adempiere.LAR_LoteSueldos (C_DocType_ID);

CREATE INDEX LAR_LoteSueldos_LARConceptoCaja
    ON adempiere.LAR_LoteSueldos (LAR_ConceptoCaja_ID);

CREATE INDEX LAR_LoteSueldos_CBankAccount
    ON adempiere.LAR_LoteSueldos (C_BankAccount_ID);


-- =====================================
-- LAR_LoteSueldosLine (Lines)
-- =====================================
CREATE TABLE adempiere.LAR_LoteSueldosLine
(
    LAR_LoteSueldosLine_ID NUMBER(10) NOT NULL,
    LAR_LoteSueldos_ID NUMBER(10) NOT NULL,
    AD_Client_ID NUMBER(10),
    AD_Org_ID NUMBER(10),
    Created TIMESTAMP,
    CreatedBy NUMBER(10),
    Updated TIMESTAMP,
    UpdatedBy NUMBER(10),
    IsActive CHAR(1) DEFAULT 'Y',
    Description VARCHAR2(255),
    C_BankAccount_ID NUMBER(10),
    C_BPartner_ID NUMBER(10),                -- Empleado
    ImportePPal NUMBER,                      -- Importe Principal
    ImporteMiles NUMBER,                     -- Importe Miles
    C_Remuneration_ID NUMBER(10) NOT NULL,   -- Tipo Sueldo (Mensual - SAC)
    TenderType CHAR(1) NOT NULL,
    LAR_Deposito_Directo_ID NUMBER(10),

    CONSTRAINT LAR_LoteSueldosLine_pkey PRIMARY KEY (LAR_LoteSueldosLine_ID),
    CONSTRAINT LAR_LoteSueldosLine_Header FOREIGN KEY (LAR_LoteSueldos_ID)
        REFERENCES adempiere.LAR_LoteSueldos (LAR_LoteSueldos_ID)
        ON DELETE CASCADE,
    CONSTRAINT adclient_LoteSueldosLine FOREIGN KEY (AD_Client_ID)
        REFERENCES adempiere.ad_client (ad_client_id),
    CONSTRAINT adorg_LoteSueldosLine FOREIGN KEY (AD_Org_ID)
        REFERENCES adempiere.ad_org (ad_org_id),
    CONSTRAINT cbankaccount_LoteSueldosLine FOREIGN KEY (C_BankAccount_ID)
        REFERENCES adempiere.C_BankAccount (C_BankAccount_ID),
    CONSTRAINT cbpartner_LoteSueldosLine FOREIGN KEY (C_BPartner_ID)
        REFERENCES adempiere.C_BPartner (C_BPartner_ID),
    CONSTRAINT cremuneration_LoteSueldosLine FOREIGN KEY (C_Remuneration_ID)
        REFERENCES adempiere.c_remuneration (c_remuneration_id),
    CONSTRAINT lardepositod_LoteSueldosLine FOREIGN KEY (LAR_Deposito_Directo_ID)
        REFERENCES adempiere.lar_tarjeta_credito (lar_tarjeta_credito_id)
);

-- Índices adicionales
CREATE INDEX LAR_LoteSueldosLine_Header
    ON adempiere.LAR_LoteSueldosLine (LAR_LoteSueldos_ID);

CREATE INDEX LAR_LoteSueldosLine_BPartner
    ON adempiere.LAR_LoteSueldosLine (C_BPartner_ID);

CREATE INDEX LAR_LoteSueldosLine_Remuneration
    ON adempiere.LAR_LoteSueldosLine (C_Remuneration_ID);

CREATE INDEX LAR_LoteSueldosLine_BankAccount
    ON adempiere.LAR_LoteSueldosLine (C_BankAccount_ID);


-- =====================================
-- Agregar columnas de referencia a LAR_PaymentHeader en LAR_LoteSueldosLine
-- =====================================

ALTER TABLE adempiere.LAR_LoteSueldosLine
    ADD (
        LAR_PaymentHeader_ID NUMBER(10),
        LAR_PaymentHeaderMiles_ID NUMBER(10)
    );

-- Crear constraints
ALTER TABLE adempiere.LAR_LoteSueldosLine
    ADD CONSTRAINT larpaymentheader_LoteSueldosLine
        FOREIGN KEY (LAR_PaymentHeader_ID)
        REFERENCES adempiere.LAR_PaymentHeader (LAR_PaymentHeader_ID);

ALTER TABLE adempiere.LAR_LoteSueldosLine
    ADD CONSTRAINT larpaymentheadermiles_LoteSueldosLine
        FOREIGN KEY (LAR_PaymentHeaderMiles_ID)
        REFERENCES adempiere.LAR_PaymentHeader (LAR_PaymentHeader_ID);

-- Crear índices
CREATE INDEX LAR_LoteSueldosLine_PaymentHeader
    ON adempiere.LAR_LoteSueldosLine (LAR_PaymentHeader_ID);

CREATE INDEX LAR_LoteSueldosLine_PaymentHeaderMiles
    ON adempiere.LAR_LoteSueldosLine (LAR_PaymentHeaderMiles_ID);


-- =====================================
-- Agregar columnas de Forma de Pago LAR_LoteSueldos
-- =====================================

ALTER TABLE adempiere.LAR_LoteSueldos
    ADD (
        TenderType CHAR(1) NOT NULL,
        LAR_Deposito_Directo_ID NUMBER(10),
        TenderTypeMiles CHAR(1) NOT NULL,
        GenerarArchivoExportacion CHAR(1),
        Processing CHAR(1)
    );

ALTER TABLE adempiere.LAR_LoteSueldos
    ADD CONSTRAINT lardepositod_LoteSueldos
        FOREIGN KEY (LAR_Deposito_Directo_ID)
        REFERENCES adempiere.lar_tarjeta_credito (lar_tarjeta_credito_id);
        

ALTER TABLE adempiere.LAR_LoteSueldosLine
    ADD (
        Processed CHAR(1) DEFAULT 'N'
    );

-- =====================================
-- Agregar columna de Forma de Pago LAR_LoteSueldosLine
-- =====================================

ALTER TABLE adempiere.LAR_LoteSueldosLine
    ADD (
        TenderTypeMiles CHAR(1) NOT NULL
    );



-- 15/08/2025 21:35:06 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,ImportTable,IsHighVolume,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','3',0,3000278,'N','Y','N','N','N','LAR','Y','Y','L','LAR_LoteSueldos','Cabecera Lote de Sueldos',0,'Y',0,100,TO_DATE('2025-08-15 21:35:05','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2025-08-15 21:35:05','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2025 21:35:06 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000278 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- 15/08/2025 21:35:06 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,UpdatedBy,AD_Client_ID,Updated,Created,CreatedBy,IsActive) VALUES (1,'N',200000,'Y',1000000,1000000,'N','Y',3008079,'Table LAR_LoteSueldos','LAR_LoteSueldos',0,100,0,TO_DATE('2025-08-15 21:35:06','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-08-15 21:35:06','YYYY-MM-DD HH24:MI:SS'),100,'Y')
;

-- 15/08/2025 21:37:13 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001508,'LAR_LoteSueldos_ID','LAR','Cabecera Lote de Sueldos','Cabecera Lote de Sueldos',0,TO_DATE('2025-08-15 21:37:13','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-08-15 21:37:13','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 15/08/2025 21:37:13 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001508 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 15/08/2025 21:37:13 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005857,3000278,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3001508,'N','N','N','Cabecera Lote de Sueldos','LAR_LoteSueldos_ID',100,TO_DATE('2025-08-15 21:37:13','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:37:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:37:13 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005857 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:37:13 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005858,3000278,'LAR',0,'N','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,TO_DATE('2025-08-15 21:37:13','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:37:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:37:13 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005858 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:37:14 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005859,3000278,'LAR',0,'N','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',100,TO_DATE('2025-08-15 21:37:13','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:37:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:37:14 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005859 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:37:14 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005860,3000278,'LAR',0,110,'N','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,TO_DATE('2025-08-15 21:37:14','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:37:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:37:14 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005860 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:37:14 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005861,3000278,'LAR',0,'N','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,TO_DATE('2025-08-15 21:37:14','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:37:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:37:14 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005861 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:37:14 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005862,3000278,'LAR',0,110,'N','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,TO_DATE('2025-08-15 21:37:14','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:37:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:37:14 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005862 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:37:15 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005863,3000278,'LAR',0,'N','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,TO_DATE('2025-08-15 21:37:14','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:37:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:37:15 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005863 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:37:15 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005864,3000278,'LAR',0,'N','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,TO_DATE('2025-08-15 21:37:15','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:37:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:37:15 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005864 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:37:15 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005865,3000278,'LAR',0,'N','N','N','A description is limited to 255 characters.','N',255,'Y',10,'N',275,'N','Y','N','Optional short description of the record','Description','Description',100,TO_DATE('2025-08-15 21:37:15','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:37:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:37:15 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005865 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:37:15 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005866,3000278,'LAR',0,'N','N','N','The Document Type determines document sequence and processing rules','N',10,'N',19,'N',196,'N','Y','N','Document type or rules','Document Type','C_DocType_ID',100,TO_DATE('2025-08-15 21:37:15','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:37:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:37:15 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005866 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:37:16 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005867,3000278,'LAR',0,'N','N','N','You find the current status in the Document Status field. The options are listed in a popup','N',2,'N',10,'N',287,'N','Y','N','The targeted status of the document','Document Action','DocAction',100,TO_DATE('2025-08-15 21:37:15','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:37:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:37:16 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005867 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:37:16 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005868,3000278,'LAR',0,'N','N','N','The Document Status indicates the status of a document at this time.  If you want to change the document status, use the Document Action field','N',2,'N',10,'N',289,'N','Y','N','The current status of the document','Document Status','DocStatus',100,TO_DATE('2025-08-15 21:37:16','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:37:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:37:16 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005868 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:37:16 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005869,3000278,'LAR',0,'N','N','N','The document number is usually automatically generated by the system and determined by the document type of the document. If the document is not saved, the preliminary number is displayed in "<>".

If the document type of your document has no automatic document sequence defined, the field is empty if you create a new document. This is for documents which usually have an external number (like vendor invoice).  If you leave the field empty, the system will generate a document number for you. The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).','N',50,'Y',10,'N',290,'N','Y','N','Document sequence number of the document','Document No','DocumentNo',100,TO_DATE('2025-08-15 21:37:16','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:37:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:37:16 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005869 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:37:16 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005870,3000278,'LAR',0,'N','N','N','The Transaction Date indicates the date of the transaction.','N',29,'N',16,'N',1297,'N','Y','N','Transaction Date','Transaction Date','DateTrx',100,TO_DATE('2025-08-15 21:37:16','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:37:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:37:16 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005870 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:37:17 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001509,'recuperarsueldos','LAR','recuperarsueldos','recuperarsueldos',0,TO_DATE('2025-08-15 21:37:16','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-08-15 21:37:16','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 15/08/2025 21:37:17 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001509 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 15/08/2025 21:37:17 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005871,3000278,'LAR',0,'N','N','N','N',1,'N',20,'N',3001509,'N','Y','N','recuperarsueldos','recuperarsueldos',100,TO_DATE('2025-08-15 21:37:16','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:37:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:37:17 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005871 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:37:17 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005872,3000278,'LAR',0,'N','N','N','The Processed checkbox indicates that a document has been processed.','N',1,'N',20,'N',1047,'N','Y','N','The document has been processed','Processed','Processed',100,TO_DATE('2025-08-15 21:37:17','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:37:17','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:37:17 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005872 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:37:17 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001510,'loteimporte','LAR','loteimporte','loteimporte',0,TO_DATE('2025-08-15 21:37:17','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-08-15 21:37:17','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 15/08/2025 21:37:17 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001510 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 15/08/2025 21:37:18 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005873,3000278,'LAR',0,'N','N','N','N',14,'N',22,'N',3001510,'N','Y','N','loteimporte','loteimporte',100,TO_DATE('2025-08-15 21:37:17','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:37:17','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:37:18 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005873 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:37:18 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005874,3000278,'LAR',0,'N','N','N','The Bank Account identifies an account at this Bank.','N',10,'N',19,'N',836,'N','Y','N','Account at the Bank','Bank Account','C_BankAccount_ID',100,TO_DATE('2025-08-15 21:37:18','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:37:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:37:18 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005874 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:37:18 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005875,3000278,'LAR',0,'N','N','N','N',10,'N',19,'N',3000351,'N','Y','N','Conceptos de Caja','LAR_ConceptoCaja_ID',100,TO_DATE('2025-08-15 21:37:18','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:37:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:37:18 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005875 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:37:18 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001511,'docstatuspagos','LAR','docstatuspagos','docstatuspagos',0,TO_DATE('2025-08-15 21:37:18','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-08-15 21:37:18','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 15/08/2025 21:37:18 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001511 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 15/08/2025 21:37:19 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005876,3000278,'LAR',0,'N','N','N','N',2,'N',10,'N',3001511,'N','Y','N','docstatuspagos','docstatuspagos',100,TO_DATE('2025-08-15 21:37:18','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:37:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:37:19 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005876 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:37:56 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Element SET ColumnName='DocStatusPagos', Name='DocStatusPagos', PrintName='DocStatusPagos',Updated=TO_DATE('2025-08-15 21:37:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001511
;

-- 15/08/2025 21:37:56 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001511
;

-- 15/08/2025 21:37:56 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET ColumnName='DocStatusPagos', Name='DocStatusPagos', Description=NULL, Help=NULL WHERE AD_Element_ID=3001511
;

-- 15/08/2025 21:37:56 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Process_Para SET ColumnName='DocStatusPagos', Name='DocStatusPagos', Description=NULL, Help=NULL, AD_Element_ID=3001511 WHERE UPPER(ColumnName)='DOCSTATUSPAGOS' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 15/08/2025 21:37:56 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Process_Para SET ColumnName='DocStatusPagos', Name='DocStatusPagos', Description=NULL, Help=NULL WHERE AD_Element_ID=3001511 AND IsCentrallyMaintained='Y'
;

-- 15/08/2025 21:37:56 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET Name='DocStatusPagos', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001511) AND IsCentrallyMaintained='Y'
;

-- 15/08/2025 21:37:56 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_PrintFormatItem pi SET PrintName='DocStatusPagos', Name='DocStatusPagos' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001511)
;

-- 15/08/2025 21:38:40 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Element SET ColumnName='LoteImporte', Name='LoteImporte', PrintName='LoteImporte',Updated=TO_DATE('2025-08-15 21:38:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001510
;

-- 15/08/2025 21:38:40 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001510
;

-- 15/08/2025 21:38:40 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET ColumnName='LoteImporte', Name='LoteImporte', Description=NULL, Help=NULL WHERE AD_Element_ID=3001510
;

-- 15/08/2025 21:38:40 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Process_Para SET ColumnName='LoteImporte', Name='LoteImporte', Description=NULL, Help=NULL, AD_Element_ID=3001510 WHERE UPPER(ColumnName)='LOTEIMPORTE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 15/08/2025 21:38:40 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Process_Para SET ColumnName='LoteImporte', Name='LoteImporte', Description=NULL, Help=NULL WHERE AD_Element_ID=3001510 AND IsCentrallyMaintained='Y'
;

-- 15/08/2025 21:38:40 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET Name='LoteImporte', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001510) AND IsCentrallyMaintained='Y'
;

-- 15/08/2025 21:38:40 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_PrintFormatItem pi SET PrintName='LoteImporte', Name='LoteImporte' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001510)
;

-- 15/08/2025 21:38:51 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Total Lote',PrintName='Total Lote',Updated=TO_DATE('2025-08-15 21:38:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001510 AND AD_Language='es_AR'
;

-- 15/08/2025 21:39:50 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Estado del Documento',PrintName='Estado del Documento',Description='Estado en el que se generarán los documentos',Updated=TO_DATE('2025-08-15 21:39:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001511 AND AD_Language='es_AR'
;

-- 15/08/2025 21:40:05 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Element_Trl SET Description='Estado en el que quedarán los documentos',Updated=TO_DATE('2025-08-15 21:40:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001511 AND AD_Language='es_AR'
;

-- 15/08/2025 21:40:32 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Element SET ColumnName='RecuperarSueldos', Name='RecuperarSueldos', PrintName='RecuperarSueldos',Updated=TO_DATE('2025-08-15 21:40:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001509
;

-- 15/08/2025 21:40:32 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001509
;

-- 15/08/2025 21:40:32 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET ColumnName='RecuperarSueldos', Name='RecuperarSueldos', Description=NULL, Help=NULL WHERE AD_Element_ID=3001509
;

-- 15/08/2025 21:40:32 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Process_Para SET ColumnName='RecuperarSueldos', Name='RecuperarSueldos', Description=NULL, Help=NULL, AD_Element_ID=3001509 WHERE UPPER(ColumnName)='RECUPERARSUELDOS' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 15/08/2025 21:40:32 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Process_Para SET ColumnName='RecuperarSueldos', Name='RecuperarSueldos', Description=NULL, Help=NULL WHERE AD_Element_ID=3001509 AND IsCentrallyMaintained='Y'
;

-- 15/08/2025 21:40:32 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET Name='RecuperarSueldos', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001509) AND IsCentrallyMaintained='Y'
;

-- 15/08/2025 21:40:32 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_PrintFormatItem pi SET PrintName='RecuperarSueldos', Name='RecuperarSueldos' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001509)
;

-- 15/08/2025 21:41:10 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Recuperar Sueldos',PrintName='Recuperar Sueldos',Description='Rescupera el importe a partir de la previsión',Updated=TO_DATE('2025-08-15 21:41:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001509 AND AD_Language='es_AR'
;

-- 15/08/2025 21:43:07 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET AD_Reference_ID=28,Updated=TO_DATE('2025-08-15 21:43:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005871
;

-- 15/08/2025 21:43:45 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,ImportTable,IsHighVolume,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','3',0,3000279,'N','Y','N','N','N','LAR','Y','Y','L','LAR_LoteSueldosLine','Detalle de Sueldos',0,'Y',0,100,TO_DATE('2025-08-15 21:43:45','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2025-08-15 21:43:45','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/08/2025 21:43:45 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000279 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- 15/08/2025 21:43:46 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,UpdatedBy,AD_Client_ID,Updated,Created,CreatedBy,IsActive) VALUES (1,'N',200000,'Y',1000000,1000000,'N','Y',3008080,'Table LAR_LoteSueldosLine','LAR_LoteSueldosLine',0,100,0,TO_DATE('2025-08-15 21:43:45','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-08-15 21:43:45','YYYY-MM-DD HH24:MI:SS'),100,'Y')
;

-- 15/08/2025 21:43:50 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001512,'LAR_LoteSueldosLine_ID','LAR','Detalle de Sueldos','Detalle de Sueldos',0,TO_DATE('2025-08-15 21:43:50','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-08-15 21:43:50','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 15/08/2025 21:43:50 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001512 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 15/08/2025 21:43:51 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005877,3000279,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3001512,'N','N','N','Detalle de Sueldos','LAR_LoteSueldosLine_ID',100,TO_DATE('2025-08-15 21:43:50','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:43:50','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:43:51 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005877 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:43:51 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005878,3000279,'LAR',0,'Y','N','N','N',10,'N',19,'N',3001508,'N','Y','N','Cabecera Lote de Sueldos','LAR_LoteSueldos_ID',100,TO_DATE('2025-08-15 21:43:51','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:43:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:43:51 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005878 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:43:51 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005879,3000279,'LAR',0,'N','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,TO_DATE('2025-08-15 21:43:51','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:43:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:43:51 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005879 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:43:51 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005880,3000279,'LAR',0,'N','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',100,TO_DATE('2025-08-15 21:43:51','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:43:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:43:51 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005880 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:43:52 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005881,3000279,'LAR',0,'N','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,TO_DATE('2025-08-15 21:43:51','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:43:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:43:52 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005881 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:43:52 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005882,3000279,'LAR',0,110,'N','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,TO_DATE('2025-08-15 21:43:52','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:43:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:43:52 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005882 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:43:52 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005883,3000279,'LAR',0,'N','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,TO_DATE('2025-08-15 21:43:52','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:43:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:43:52 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005883 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:43:52 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005884,3000279,'LAR',0,110,'N','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,TO_DATE('2025-08-15 21:43:52','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:43:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:43:52 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005884 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:43:53 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005885,3000279,'LAR',0,'N','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,TO_DATE('2025-08-15 21:43:52','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:43:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:43:53 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005885 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:43:53 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005886,3000279,'LAR',0,'N','N','N','A description is limited to 255 characters.','N',255,'Y',10,'N',275,'N','Y','N','Optional short description of the record','Description','Description',100,TO_DATE('2025-08-15 21:43:53','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:43:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:43:53 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005886 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:43:53 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005887,3000279,'LAR',0,'N','N','N','The Bank Account identifies an account at this Bank.','N',10,'N',19,'N',836,'N','Y','N','Account at the Bank','Bank Account','C_BankAccount_ID',100,TO_DATE('2025-08-15 21:43:53','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:43:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:43:53 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005887 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:43:53 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005888,3000279,'LAR',0,'N','N','N','A Business Partner is anyone with whom you transact.  This can include Vendor, Customer, Employee or Salesperson','N',10,'N',19,'N',187,'N','Y','N','Identifies a Business Partner','Business Partner ','C_BPartner_ID',100,TO_DATE('2025-08-15 21:43:53','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:43:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:43:53 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005888 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:43:54 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001513,'importeppal','LAR','importeppal','importeppal',0,TO_DATE('2025-08-15 21:43:53','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-08-15 21:43:53','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 15/08/2025 21:43:54 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001513 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 15/08/2025 21:43:54 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005889,3000279,'LAR',0,'N','N','N','N',14,'N',22,'N',3001513,'N','Y','N','importeppal','importeppal',100,TO_DATE('2025-08-15 21:43:53','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:43:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:43:54 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005889 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:43:54 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001514,'importemiles','LAR','importemiles','importemiles',0,TO_DATE('2025-08-15 21:43:54','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-08-15 21:43:54','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 15/08/2025 21:43:54 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001514 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 15/08/2025 21:43:54 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005890,3000279,'LAR',0,'N','N','N','N',14,'N',22,'N',3001514,'N','Y','N','importemiles','importemiles',100,TO_DATE('2025-08-15 21:43:54','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:43:54','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:43:54 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005890 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:43:55 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005891,3000279,'LAR',0,'Y','N','N','N',10,'N',19,'N',2764,'N','Y','N','Wage or Salary','Remuneration','C_Remuneration_ID',100,TO_DATE('2025-08-15 21:43:54','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:43:54','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:43:55 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005891 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:43:55 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005892,3000279,'LAR',0,'Y','N','N','The Tender Type indicates the method of payment (ACH or Direct Deposit, Credit Card, Check, Direct Debit)','N',1,'N',20,'N',1441,'N','Y','N','Method of Payment','Tender type','TenderType',100,TO_DATE('2025-08-15 21:43:55','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:43:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:43:55 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005892 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:43:55 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005893,3000279,'LAR',0,'N','N','N','N',10,'N',19,'N',3000368,'N','Y','N','Tipo de Depósito Directo','LAR_Deposito_Directo_ID',100,TO_DATE('2025-08-15 21:43:55','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 21:43:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:43:55 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005893 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 21:44:33 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Element SET ColumnName='ImporteMiles', Name='ImporteMiles', PrintName='ImporteMiles',Updated=TO_DATE('2025-08-15 21:44:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001514
;

-- 15/08/2025 21:44:33 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001514
;

-- 15/08/2025 21:44:33 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET ColumnName='ImporteMiles', Name='ImporteMiles', Description=NULL, Help=NULL WHERE AD_Element_ID=3001514
;

-- 15/08/2025 21:44:33 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Process_Para SET ColumnName='ImporteMiles', Name='ImporteMiles', Description=NULL, Help=NULL, AD_Element_ID=3001514 WHERE UPPER(ColumnName)='IMPORTEMILES' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 15/08/2025 21:44:33 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Process_Para SET ColumnName='ImporteMiles', Name='ImporteMiles', Description=NULL, Help=NULL WHERE AD_Element_ID=3001514 AND IsCentrallyMaintained='Y'
;

-- 15/08/2025 21:44:33 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET Name='ImporteMiles', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001514) AND IsCentrallyMaintained='Y'
;

-- 15/08/2025 21:44:33 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_PrintFormatItem pi SET PrintName='ImporteMiles', Name='ImporteMiles' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001514)
;

-- 15/08/2025 21:44:44 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Importe Miles',PrintName='Importe Miles',Updated=TO_DATE('2025-08-15 21:44:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001514 AND AD_Language='es_AR'
;

-- 15/08/2025 21:45:17 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Element SET ColumnName='ImportePpal', Name='ImportePpal', PrintName='ImportePpal',Updated=TO_DATE('2025-08-15 21:45:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001513
;

-- 15/08/2025 21:45:17 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001513
;

-- 15/08/2025 21:45:17 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET ColumnName='ImportePpal', Name='ImportePpal', Description=NULL, Help=NULL WHERE AD_Element_ID=3001513
;

-- 15/08/2025 21:45:17 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Process_Para SET ColumnName='ImportePpal', Name='ImportePpal', Description=NULL, Help=NULL, AD_Element_ID=3001513 WHERE UPPER(ColumnName)='IMPORTEPPAL' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 15/08/2025 21:45:17 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Process_Para SET ColumnName='ImportePpal', Name='ImportePpal', Description=NULL, Help=NULL WHERE AD_Element_ID=3001513 AND IsCentrallyMaintained='Y'
;

-- 15/08/2025 21:45:17 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET Name='ImportePpal', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001513) AND IsCentrallyMaintained='Y'
;

-- 15/08/2025 21:45:17 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_PrintFormatItem pi SET PrintName='ImportePpal', Name='ImportePpal' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001513)
;

-- 15/08/2025 21:45:33 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Importe Principal ',PrintName='Importe Principal',Updated=TO_DATE('2025-08-15 21:45:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001513 AND AD_Language='es_AR'
;

-- 15/08/2025 21:47:30 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Window (AD_Window_ID,WindowType,IsSOTrx,IsDefault,IsBetaFunctionality,WinHeight,WinWidth,EntityType,Name,Description,IsActive,Created,UpdatedBy,CreatedBy,Updated,AD_Org_ID,AD_Client_ID,Processing) VALUES (3000146,'M','N','N','N',0,0,'LAR','Lote Sueldos','Generación de Pago de Sueldos por Lote','Y',TO_DATE('2025-08-15 21:47:30','YYYY-MM-DD HH24:MI:SS'),100,100,TO_DATE('2025-08-15 21:47:30','YYYY-MM-DD HH24:MI:SS'),0,0,'N')
;

-- 15/08/2025 21:47:30 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Window_Trl (AD_Language,AD_Window_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Window_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Window t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Window_ID=3000146 AND NOT EXISTS (SELECT * FROM AD_Window_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Window_ID=t.AD_Window_ID)
;

-- 15/08/2025 21:49:37 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,Description,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('Y',3000146,10,'N','N',3000278,3000315,'N','N','N','N',0,'Y','Y','LAR','Lote Sueldos','Información del Lote',0,0,TO_DATE('2025-08-15 21:49:37','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2025-08-15 21:49:37','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 15/08/2025 21:49:37 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000315 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 15/08/2025 21:49:42 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009403,1,'Y','N','N',3005864,'N','Y',3000315,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,TO_DATE('2025-08-15 21:49:42','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 21:49:42','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:49:42 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009403 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 21:49:42 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009404,10,'Y','N','N',3005874,'N','Y',3000315,'N','The Bank Account identifies an account at this Bank.','LAR','Account at the Bank','Bank Account',100,0,TO_DATE('2025-08-15 21:49:42','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 21:49:42','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:49:42 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009404 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 21:49:42 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009405,10,'N','N','N',3005857,'N','Y',3000315,'N','LAR','Cabecera Lote de Sueldos',100,0,TO_DATE('2025-08-15 21:49:42','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 21:49:42','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:49:42 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009405 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 21:49:43 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009406,10,'Y','N','N',3005858,'N','Y',3000315,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,TO_DATE('2025-08-15 21:49:42','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 21:49:42','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:49:43 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009406 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 21:49:43 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009407,10,'Y','N','N',3005875,'N','Y',3000315,'N','LAR','Conceptos de Caja',100,0,TO_DATE('2025-08-15 21:49:43','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 21:49:43','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:49:43 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009407 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 21:49:43 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009408,255,'Y','N','N',3005865,'N','Y',3000315,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,TO_DATE('2025-08-15 21:49:43','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 21:49:43','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:49:43 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009408 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 21:49:43 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009409,2,'Y','N','N',3005876,'N','Y',3000315,'N','LAR','DocStatusPagos',100,0,TO_DATE('2025-08-15 21:49:43','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 21:49:43','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:49:43 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009409 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 21:49:44 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009410,2,'Y','N','N',3005867,'N','Y',3000315,'N','You find the current status in the Document Status field. The options are listed in a popup','LAR','The targeted status of the document','Document Action',100,0,TO_DATE('2025-08-15 21:49:43','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 21:49:43','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:49:44 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009410 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 21:49:44 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009411,50,'Y','N','N',3005869,'N','Y',3000315,'N','The document number is usually automatically generated by the system and determined by the document type of the document. If the document is not saved, the preliminary number is displayed in "<>".

If the document type of your document has no automatic document sequence defined, the field is empty if you create a new document. This is for documents which usually have an external number (like vendor invoice).  If you leave the field empty, the system will generate a document number for you. The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).','LAR','Document sequence number of the document','Document No',100,0,TO_DATE('2025-08-15 21:49:44','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 21:49:44','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:49:44 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009411 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 21:49:44 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009412,2,'Y','N','N',3005868,'N','Y',3000315,'N','The Document Status indicates the status of a document at this time.  If you want to change the document status, use the Document Action field','LAR','The current status of the document','Document Status',100,0,TO_DATE('2025-08-15 21:49:44','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 21:49:44','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:49:44 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009412 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 21:49:44 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009413,10,'Y','N','N',3005866,'N','Y',3000315,'N','The Document Type determines document sequence and processing rules','LAR','Document type or rules','Document Type',100,0,TO_DATE('2025-08-15 21:49:44','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 21:49:44','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:49:44 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009413 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 21:49:45 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009414,14,'Y','N','N',3005873,'N','Y',3000315,'N','LAR','LoteImporte',100,0,TO_DATE('2025-08-15 21:49:44','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 21:49:44','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:49:45 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009414 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 21:49:45 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009415,10,'Y','N','N',3005859,'N','Y',3000315,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,TO_DATE('2025-08-15 21:49:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 21:49:45','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:49:45 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009415 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 21:49:45 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009416,1,'Y','N','N',3005872,'N','Y',3000315,'N','The Processed checkbox indicates that a document has been processed.','LAR','The document has been processed','Processed',100,0,TO_DATE('2025-08-15 21:49:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 21:49:45','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:49:45 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009416 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 21:49:45 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009417,1,'Y','N','N',3005871,'N','Y',3000315,'N','LAR','RecuperarSueldos',100,0,TO_DATE('2025-08-15 21:49:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 21:49:45','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:49:45 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009417 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 21:49:46 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009418,29,'Y','N','N',3005870,'N','Y',3000315,'N','The Transaction Date indicates the date of the transaction.','LAR','Transaction Date','Transaction Date',100,0,TO_DATE('2025-08-15 21:49:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 21:49:45','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 21:49:46 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009418 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 21:52:26 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,Description,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('Y',3000146,20,'N','N',3000279,3000316,'N','N','N','N',0,'Y','Y','LAR','Detalle Sueldos','Detalle de los sueldos a partir del Lote',0,0,TO_DATE('2025-08-15 21:52:25','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2025-08-15 21:52:25','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 15/08/2025 21:52:26 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000316 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 15/08/2025 21:52:37 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Tab SET TabLevel=1,Updated=TO_DATE('2025-08-15 21:52:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000316
;

-- 15/08/2025 22:07:45 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009419,1,'Y','N','N',3005885,'N','Y',3000316,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,TO_DATE('2025-08-15 22:07:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 22:07:45','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 22:07:45 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009419 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 22:07:46 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009420,10,'Y','N','N',3005887,'N','Y',3000316,'N','The Bank Account identifies an account at this Bank.','LAR','Account at the Bank','Bank Account',100,0,TO_DATE('2025-08-15 22:07:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 22:07:45','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 22:07:46 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009420 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 22:07:46 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009421,10,'Y','N','N',3005888,'N','Y',3000316,'N','A Business Partner is anyone with whom you transact.  This can include Vendor, Customer, Employee or Salesperson','LAR','Identifies a Business Partner','Business Partner ',100,0,TO_DATE('2025-08-15 22:07:46','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 22:07:46','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 22:07:46 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009421 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 22:07:46 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009422,10,'Y','N','N',3005878,'N','Y',3000316,'N','LAR','Cabecera Lote de Sueldos',100,0,TO_DATE('2025-08-15 22:07:46','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 22:07:46','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 22:07:46 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009422 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 22:07:46 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009423,10,'Y','N','N',3005879,'N','Y',3000316,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,TO_DATE('2025-08-15 22:07:46','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 22:07:46','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 22:07:46 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009423 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 22:07:47 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009424,255,'Y','N','N',3005886,'N','Y',3000316,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,TO_DATE('2025-08-15 22:07:46','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 22:07:46','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 22:07:47 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009424 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 22:07:47 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009425,10,'N','N','N',3005877,'N','Y',3000316,'N','LAR','Detalle de Sueldos',100,0,TO_DATE('2025-08-15 22:07:47','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 22:07:47','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 22:07:47 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009425 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 22:07:47 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009426,14,'Y','N','N',3005890,'N','Y',3000316,'N','LAR','ImporteMiles',100,0,TO_DATE('2025-08-15 22:07:47','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 22:07:47','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 22:07:47 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009426 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 22:07:47 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009427,14,'Y','N','N',3005889,'N','Y',3000316,'N','LAR','ImportePpal',100,0,TO_DATE('2025-08-15 22:07:47','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 22:07:47','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 22:07:47 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009427 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 22:07:48 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009428,10,'Y','N','N',3005880,'N','Y',3000316,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,TO_DATE('2025-08-15 22:07:47','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 22:07:47','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 22:07:48 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009428 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 22:07:48 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009429,10,'Y','N','N',3005891,'N','Y',3000316,'N','LAR','Wage or Salary','Remuneration',100,0,TO_DATE('2025-08-15 22:07:48','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 22:07:48','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 22:07:48 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009429 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 22:07:48 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009430,1,'Y','N','N',3005892,'N','Y',3000316,'N','The Tender Type indicates the method of payment (ACH or Direct Deposit, Credit Card, Check, Direct Debit)','LAR','Method of Payment','Tender type',100,0,TO_DATE('2025-08-15 22:07:48','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 22:07:48','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 22:07:48 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009430 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 22:07:48 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009431,10,'Y','N','N',3005893,'N','Y',3000316,'N','LAR','Tipo de Depósito Directo',100,0,TO_DATE('2025-08-15 22:07:48','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 22:07:48','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 22:07:48 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009431 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 22:08:11 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005894,3000279,'LAR',0,'N','N','N','N',10,'N',19,'N',3000068,'N','Y','N','Cabecera de Pago/Cobro','LAR_PaymentHeader_ID',100,TO_DATE('2025-08-15 22:08:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 22:08:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 22:08:11 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005894 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 22:08:11 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001515,'lar_paymentheadermiles_id','LAR','lar_paymentheadermiles_id','lar_paymentheadermiles_id',0,TO_DATE('2025-08-15 22:08:11','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-08-15 22:08:11','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 15/08/2025 22:08:11 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001515 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 15/08/2025 22:08:12 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005895,3000279,'LAR',0,'N','N','N','N',10,'N',19,'N',3001515,'N','Y','N','lar_paymentheadermiles_id','lar_paymentheadermiles_id',100,TO_DATE('2025-08-15 22:08:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 22:08:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 22:08:12 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005895 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 22:08:19 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009432,10,'Y','N','N',3005894,'N','Y',3000316,'N','LAR','Cabecera de Pago/Cobro',100,0,TO_DATE('2025-08-15 22:08:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 22:08:19','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 22:08:19 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009432 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 22:08:19 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009433,10,'Y','N','N',3005895,'N','Y',3000316,'N','LAR','lar_paymentheadermiles_id',100,0,TO_DATE('2025-08-15 22:08:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 22:08:19','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 22:08:19 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009433 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 22:09:04 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Element SET ColumnName='Lar_PaymentHeaderMiles_ID', Name='Lar_PaymentHeaderMiles_ID', PrintName='Lar_PaymentHeaderMiles_ID',Updated=TO_DATE('2025-08-15 22:09:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001515
;

-- 15/08/2025 22:09:04 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001515
;

-- 15/08/2025 22:09:04 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET ColumnName='Lar_PaymentHeaderMiles_ID', Name='Lar_PaymentHeaderMiles_ID', Description=NULL, Help=NULL WHERE AD_Element_ID=3001515
;

-- 15/08/2025 22:09:04 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Process_Para SET ColumnName='Lar_PaymentHeaderMiles_ID', Name='Lar_PaymentHeaderMiles_ID', Description=NULL, Help=NULL, AD_Element_ID=3001515 WHERE UPPER(ColumnName)='LAR_PAYMENTHEADERMILES_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 15/08/2025 22:09:04 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Process_Para SET ColumnName='Lar_PaymentHeaderMiles_ID', Name='Lar_PaymentHeaderMiles_ID', Description=NULL, Help=NULL WHERE AD_Element_ID=3001515 AND IsCentrallyMaintained='Y'
;

-- 15/08/2025 22:09:04 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET Name='Lar_PaymentHeaderMiles_ID', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001515) AND IsCentrallyMaintained='Y'
;

-- 15/08/2025 22:09:04 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_PrintFormatItem pi SET PrintName='Lar_PaymentHeaderMiles_ID', Name='Lar_PaymentHeaderMiles_ID' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001515)
;

-- 15/08/2025 22:09:28 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Referencia Pago Miles',PrintName='Referencia Pago Miles',Updated=TO_DATE('2025-08-15 22:09:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001515 AND AD_Language='es_AR'
;

-- 15/08/2025 22:10:09 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field_Trl SET Name='Referencia Pago Miles',Updated=TO_DATE('2025-08-15 22:10:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009433 AND AD_Language='es_AR'
;

-- 15/08/2025 22:10:13 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2025-08-15 22:10:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009433
;

-- 15/08/2025 22:10:17 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET IsCentrallyMaintained='Y',Updated=TO_DATE('2025-08-15 22:10:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009433
;

-- 15/08/2025 22:13:17 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3009406
;

-- 15/08/2025 22:13:17 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3009415
;

-- 15/08/2025 22:13:17 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3009413
;

-- 15/08/2025 22:13:17 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3009411
;

-- 15/08/2025 22:13:17 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3009403
;

-- 15/08/2025 22:13:17 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3009408
;

-- 15/08/2025 22:13:17 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3009418
;

-- 15/08/2025 22:13:17 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3009404
;

-- 15/08/2025 22:13:17 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3009407
;

-- 15/08/2025 22:13:17 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3009417
;

-- 15/08/2025 22:13:17 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3009414
;

-- 15/08/2025 22:13:17 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3009409
;

-- 15/08/2025 22:13:17 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3009410
;

-- 15/08/2025 22:13:17 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3009412
;

-- 15/08/2025 22:13:17 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3009416
;

-- 15/08/2025 22:13:29 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2025-08-15 22:13:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009415
;

-- 15/08/2025 22:13:51 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2025-08-15 22:13:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009403
;

-- 15/08/2025 22:14:10 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2025-08-15 22:14:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009404
;

-- 15/08/2025 22:14:39 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2025-08-15 22:14:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009407
;

-- 15/08/2025 22:14:44 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2025-08-15 22:14:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009407
;

-- 15/08/2025 22:14:48 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2025-08-15 22:14:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009417
;

-- 15/08/2025 22:14:56 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2025-08-15 22:14:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009410
;

-- 15/08/2025 22:16:20 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2025-08-15 22:16:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009409
;

-- 15/08/2025 22:16:31 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2025-08-15 22:16:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009410
;

-- 15/08/2025 22:16:40 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3009412
;

-- 15/08/2025 22:16:40 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3009410
;

-- 15/08/2025 22:16:59 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2025-08-15 22:16:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009410
;

-- 15/08/2025 22:18:59 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3009423
;

-- 15/08/2025 22:18:59 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3009428
;

-- 15/08/2025 22:18:59 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3009422
;

-- 15/08/2025 22:18:59 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3009419
;

-- 15/08/2025 22:18:59 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3009424
;

-- 15/08/2025 22:18:59 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3009421
;

-- 15/08/2025 22:18:59 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3009420
;

-- 15/08/2025 22:18:59 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3009429
;

-- 15/08/2025 22:18:59 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3009430
;

-- 15/08/2025 22:18:59 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3009431
;

-- 15/08/2025 22:18:59 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3009427
;

-- 15/08/2025 22:18:59 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3009432
;

-- 15/08/2025 22:18:59 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3009426
;

-- 15/08/2025 22:18:59 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3009433
;

-- 15/08/2025 22:19:04 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2025-08-15 22:19:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009428
;

-- 15/08/2025 22:19:12 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2025-08-15 22:19:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009419
;

-- 15/08/2025 22:19:22 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2025-08-15 22:19:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009420
;

-- 15/08/2025 22:19:27 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2025-08-15 22:19:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009420
;

-- 15/08/2025 22:19:36 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field_Trl SET Name='Caja',Description=NULL,Help=NULL,Updated=TO_DATE('2025-08-15 22:19:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009420 AND AD_Language='es_AR'
;

-- 15/08/2025 22:19:45 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2025-08-15 22:19:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009404
;

-- 15/08/2025 22:19:53 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Caja',Description=NULL,Help=NULL,Updated=TO_DATE('2025-08-15 22:19:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009404 AND AD_Language='es_AR'
;

-- 15/08/2025 22:20:21 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2025-08-15 22:20:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009431
;

-- 15/08/2025 22:20:27 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2025-08-15 22:20:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009432
;

-- 15/08/2025 22:20:31 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2025-08-15 22:20:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009433
;

-- 15/08/2025 22:22:17 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Menu (AD_Window_ID,AD_Menu_ID,IsSummary,Action,IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Description,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000146,3000561,'N','W','N','N','LAR','Y','Lote Pago Sueldos','Lote de Pago de Sueldos',TO_DATE('2025-08-15 22:22:16','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_DATE('2025-08-15 22:22:16','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 15/08/2025 22:22:17 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000561 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 15/08/2025 22:22:17 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', SysDate, 100, SysDate, 100,t.AD_Tree_ID, 3000561, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000561)
;

-- 15/08/2025 22:22:25 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=3000415, SeqNo=0, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000432
;

-- 15/08/2025 22:22:25 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=3000415, SeqNo=1, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000438
;

-- 15/08/2025 22:22:25 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=3000415, SeqNo=2, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=532
;

-- 15/08/2025 22:22:25 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=3000415, SeqNo=3, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000561
;

-- 15/08/2025 22:22:25 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=3000415, SeqNo=4, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000417
;

-- 15/08/2025 22:22:26 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=3000415, SeqNo=0, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000432
;

-- 15/08/2025 22:22:26 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=3000415, SeqNo=1, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000438
;

-- 15/08/2025 22:22:26 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=3000415, SeqNo=2, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=532
;

-- 15/08/2025 22:22:26 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=3000415, SeqNo=3, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000417
;

-- 15/08/2025 22:22:26 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=3000415, SeqNo=4, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000561
;

-- 15/08/2025 22:22:26 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_TreeNodeMM SET Parent_ID=3000415, SeqNo=5, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000417
;


-- 15/08/2025 23:27:03 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005896,3000278,'LAR',0,'Y','N','N','The Tender Type indicates the method of payment (ACH or Direct Deposit, Credit Card, Check, Direct Debit)','N',1,'N',20,'N',1441,'N','Y','N','Method of Payment','Tender type','TenderType',100,TO_DATE('2025-08-15 23:27:03','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 23:27:03','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 23:27:03 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005896 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 23:27:03 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005897,3000278,'LAR',0,'N','N','N','N',10,'N',19,'N',3000368,'N','Y','N','Tipo de Depósito Directo','LAR_Deposito_Directo_ID',100,TO_DATE('2025-08-15 23:27:03','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 23:27:03','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 23:27:03 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005897 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 23:27:04 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001516,'tendertypemiles','LAR','tendertypemiles','tendertypemiles',0,TO_DATE('2025-08-15 23:27:03','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-08-15 23:27:03','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 15/08/2025 23:27:04 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001516 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 15/08/2025 23:27:04 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005898,3000278,'LAR',0,'Y','N','N','N',1,'N',20,'N',3001516,'N','Y','N','tendertypemiles','tendertypemiles',100,TO_DATE('2025-08-15 23:27:03','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 23:27:03','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 23:27:04 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005898 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 23:27:04 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001517,'generararchivoexportacion','LAR','generararchivoexportacion','generararchivoexportacion',0,TO_DATE('2025-08-15 23:27:04','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-08-15 23:27:04','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 15/08/2025 23:27:04 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001517 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 15/08/2025 23:27:04 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005899,3000278,'LAR',0,'N','N','N','N',1,'N',20,'N',3001517,'N','Y','N','generararchivoexportacion','generararchivoexportacion',100,TO_DATE('2025-08-15 23:27:04','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 23:27:04','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 23:27:04 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005899 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 23:27:56 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Element SET ColumnName='TenderTypeMiles', Name='TenderTypeMiles', PrintName='TenderTypeMiles',Updated=TO_DATE('2025-08-15 23:27:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001516
;

-- 15/08/2025 23:27:56 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001516
;

-- 15/08/2025 23:27:56 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET ColumnName='TenderTypeMiles', Name='TenderTypeMiles', Description=NULL, Help=NULL WHERE AD_Element_ID=3001516
;

-- 15/08/2025 23:27:56 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Process_Para SET ColumnName='TenderTypeMiles', Name='TenderTypeMiles', Description=NULL, Help=NULL, AD_Element_ID=3001516 WHERE UPPER(ColumnName)='TENDERTYPEMILES' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 15/08/2025 23:27:56 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Process_Para SET ColumnName='TenderTypeMiles', Name='TenderTypeMiles', Description=NULL, Help=NULL WHERE AD_Element_ID=3001516 AND IsCentrallyMaintained='Y'
;

-- 15/08/2025 23:27:56 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET Name='TenderTypeMiles', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001516) AND IsCentrallyMaintained='Y'
;

-- 15/08/2025 23:27:56 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_PrintFormatItem pi SET PrintName='TenderTypeMiles', Name='TenderTypeMiles' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001516)
;

-- 15/08/2025 23:28:09 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Forma Pago Miles',PrintName='Forma Pago Miles',Updated=TO_DATE('2025-08-15 23:28:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001516 AND AD_Language='es_AR'
;

-- 15/08/2025 23:28:49 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Element SET ColumnName='GenerarArchivoExportacion', Name='GenerarArchivoExportacion', PrintName='GenerarArchivoExportacion',Updated=TO_DATE('2025-08-15 23:28:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001517
;

-- 15/08/2025 23:28:49 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001517
;

-- 15/08/2025 23:28:49 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET ColumnName='GenerarArchivoExportacion', Name='GenerarArchivoExportacion', Description=NULL, Help=NULL WHERE AD_Element_ID=3001517
;

-- 15/08/2025 23:28:49 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Process_Para SET ColumnName='GenerarArchivoExportacion', Name='GenerarArchivoExportacion', Description=NULL, Help=NULL, AD_Element_ID=3001517 WHERE UPPER(ColumnName)='GENERARARCHIVOEXPORTACION' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 15/08/2025 23:28:49 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Process_Para SET ColumnName='GenerarArchivoExportacion', Name='GenerarArchivoExportacion', Description=NULL, Help=NULL WHERE AD_Element_ID=3001517 AND IsCentrallyMaintained='Y'
;

-- 15/08/2025 23:28:49 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET Name='GenerarArchivoExportacion', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001517) AND IsCentrallyMaintained='Y'
;

-- 15/08/2025 23:28:49 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_PrintFormatItem pi SET PrintName='GenerarArchivoExportacion', Name='GenerarArchivoExportacion' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001517)
;

-- 15/08/2025 23:29:00 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Generar Archivo Exportacion',PrintName='Generar Archivo Exportacion',Updated=TO_DATE('2025-08-15 23:29:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001517 AND AD_Language='es_AR'
;

-- 15/08/2025 23:29:29 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET AD_Reference_ID=28,Updated=TO_DATE('2025-08-15 23:29:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005899
;

-- 15/08/2025 23:30:32 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005900,3000279,'LAR',0,'Y','N','N','N',1,'N',20,'N',3001516,'N','Y','N','TenderTypeMiles','TenderTypeMiles',100,TO_DATE('2025-08-15 23:30:32','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-15 23:30:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 23:30:32 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005900 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/08/2025 23:32:05 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET DefaultValue='X', AD_Reference_Value_ID=214, AD_Reference_ID=17, AD_Val_Rule_ID=3000038,Updated=TO_DATE('2025-08-15 23:32:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005900
;

-- 15/08/2025 23:33:05 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET DefaultValue='A', AD_Reference_Value_ID=214, AD_Reference_ID=17, AD_Val_Rule_ID=3000038,Updated=TO_DATE('2025-08-15 23:33:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005892
;

-- 15/08/2025 23:34:27 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET AD_Reference_Value_ID=3000054, AD_Reference_ID=18, AD_Val_Rule_ID=3000118, MandatoryLogic='@TenderType@=''A''',Updated=TO_DATE('2025-08-15 23:34:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005893
;

-- 15/08/2025 23:38:41 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET DefaultValue='4000007', AD_Val_Rule_ID=3000140,Updated=TO_DATE('2025-08-15 23:38:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005875
;

-- 15/08/2025 23:41:07 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET AD_Reference_Value_ID=3000054, AD_Reference_ID=18, AD_Val_Rule_ID=3000118, ReadOnlyLogic='@TenderType@=''A''',Updated=TO_DATE('2025-08-15 23:41:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005897
;

-- 15/08/2025 23:42:56 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET DefaultValue='X', AD_Reference_Value_ID=214, AD_Reference_ID=17, AD_Val_Rule_ID=3000038,Updated=TO_DATE('2025-08-15 23:42:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005896
;

-- 15/08/2025 23:43:17 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET AD_Reference_Value_ID=214, AD_Reference_ID=17, AD_Val_Rule_ID=3000038,Updated=TO_DATE('2025-08-15 23:43:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005898
;

-- 15/08/2025 23:45:05 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009434,1,'Y','N','N',3005899,'N','Y',3000315,'N','LAR','GenerarArchivoExportacion',100,0,TO_DATE('2025-08-15 23:45:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 23:45:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 23:45:05 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009434 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 23:45:06 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009435,1,'Y','N','N',3005896,'N','Y',3000315,'N','The Tender Type indicates the method of payment (ACH or Direct Deposit, Credit Card, Check, Direct Debit)','LAR','Method of Payment','Tender type',100,0,TO_DATE('2025-08-15 23:45:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 23:45:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 23:45:06 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009435 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 23:45:06 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009436,1,'Y','N','N',3005898,'N','Y',3000315,'N','LAR','TenderTypeMiles',100,0,TO_DATE('2025-08-15 23:45:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 23:45:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 23:45:06 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009436 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 23:45:06 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009437,10,'Y','N','N',3005897,'N','Y',3000315,'N','LAR','Tipo de Depósito Directo',100,0,TO_DATE('2025-08-15 23:45:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 23:45:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 23:45:06 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009437 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 23:45:13 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009438,1,'Y','N','N',3005900,'N','Y',3000316,'N','LAR','TenderTypeMiles',100,0,TO_DATE('2025-08-15 23:45:13','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-15 23:45:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/08/2025 23:45:13 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009438 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/08/2025 23:45:25 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3009438
;

-- 15/08/2025 23:45:25 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3009427
;

-- 15/08/2025 23:45:25 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3009432
;

-- 15/08/2025 23:45:25 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3009426
;

-- 15/08/2025 23:45:25 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3009433
;

-- 15/08/2025 23:47:09 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3009427
;

-- 15/08/2025 23:47:09 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3009432
;

-- 15/08/2025 23:47:09 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3009438
;

-- 15/08/2025 23:48:01 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3009435
;

-- 15/08/2025 23:48:01 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3009436
;

-- 15/08/2025 23:48:01 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3009437
;

-- 15/08/2025 23:48:01 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3009417
;

-- 15/08/2025 23:48:01 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3009414
;

-- 15/08/2025 23:48:01 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3009409
;

-- 15/08/2025 23:48:01 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3009412
;

-- 15/08/2025 23:48:01 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3009410
;

-- 15/08/2025 23:48:01 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3009416
;

-- 15/08/2025 23:48:01 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3009434
;

-- 15/08/2025 23:48:23 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3009437
;

-- 15/08/2025 23:48:23 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3009436
;

-- 15/08/2025 23:48:35 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2025-08-15 23:48:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009437
;

-- 15/08/2025 23:57:11 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Tab SET AD_Column_ID=3005878,Updated=TO_DATE('2025-08-15 23:57:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000316
;

-- 15/08/2025 23:58:46 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET AD_Reference_ID=18,Updated=TO_DATE('2025-08-15 23:58:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005895
;

-- 16/08/2025 0:01:24 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000177,'T','LAR','N','LAR_PaymentHeader Miles',0,0,100,TO_DATE('2025-08-16 00:01:24','YYYY-MM-DD HH24:MI:SS'),'Y',TO_DATE('2025-08-16 00:01:24','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 16/08/2025 0:01:24 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000177 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 16/08/2025 0:02:09 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Ref_Table (IsValueDisplayed,AD_Table_ID,AD_Reference_ID,AD_Key,AD_Display,EntityType,CreatedBy,Created,Updated,AD_Client_ID,UpdatedBy,AD_Org_ID,IsActive) VALUES ('N',3000010,3000177,3000235,3000235,'LAR',100,TO_DATE('2025-08-16 00:02:09','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-08-16 00:02:09','YYYY-MM-DD HH24:MI:SS'),0,100,0,'Y')
;

-- 16/08/2025 0:02:22 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET AD_Reference_Value_ID=3000177,Updated=TO_DATE('2025-08-16 00:02:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005895
;

-- 16/08/2025 0:07:27 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2025-08-16 00:07:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009433
;

-- 16/08/2025 0:07:35 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2025-08-16 00:07:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009432
;

-- 16/08/2025 0:08:41 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET AD_Val_Rule_ID=3000004,Updated=TO_DATE('2025-08-16 00:08:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005887
;

-- 16/08/2025 0:09:07 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET AD_Val_Rule_ID=3000004,Updated=TO_DATE('2025-08-16 00:09:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005874
;

-- 16/08/2025 0:09:55 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET DefaultValue='@Date@', IsSelectionColumn='Y',Updated=TO_DATE('2025-08-16 00:09:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005870
;

-- 16/08/2025 0:10:07 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_DATE('2025-08-16 00:10:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005868
;

-- 16/08/2025 0:13:42 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET AD_Reference_ID=30, AD_Val_Rule_ID=230,Updated=TO_DATE('2025-08-16 00:13:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005888
;

-- 16/08/2025 0:15:33 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET AD_Reference_ID=30, AD_Reference_Value_ID=252,Updated=TO_DATE('2025-08-16 00:15:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009421
;

-- 16/08/2025 0:26:09 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET ReadOnlyLogic=NULL, MandatoryLogic='@TenderType@=''A''',Updated=TO_DATE('2025-08-16 00:26:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005897
;

-- 16/08/2025 0:26:50 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET DisplayLogic='@TenderType@=''A''',Updated=TO_DATE('2025-08-16 00:26:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009437
;

-- 16/08/2025 0:27:08 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET DisplayLogic='@TenderType@=''A''',Updated=TO_DATE('2025-08-16 00:27:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009431
;

-- 16/08/2025 0:29:26 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET DefaultValue='CO', AD_Reference_Value_ID=135, AD_Reference_ID=28,Updated=TO_DATE('2025-08-16 00:29:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005867
;

-- 16/08/2025 0:36:50 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET DefaultValue='DR', AD_Reference_Value_ID=131, AD_Reference_ID=17,Updated=TO_DATE('2025-08-16 00:36:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005876
;

-- 16/08/2025 0:37:08 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET AD_Reference_Value_ID=131, AD_Reference_ID=17,Updated=TO_DATE('2025-08-16 00:37:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005868
;

-- 16/08/2025 0:37:37 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2025-08-16 00:37:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009412
;

-- 16/08/2025 0:38:45 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET DefaultValue='DR',Updated=TO_DATE('2025-08-16 00:38:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009412
;

-- Registrar el proceso y asociarlo al botón
-- 22/08/2025 16:52:15 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Process (AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Classname,CopyFromProcess,Description,Value,Name,AD_Org_ID,AD_Client_ID,UpdatedBy,Created,CreatedBy,Updated,IsActive) VALUES (3000614,'N','N','3','N','N','Y','LAR',776248,4675,'ar.com.ergio.process.LAR_RecuperarImportes','N','Recupera el importe de los sueldos según la previsión','LAR_RecuperarImportes','Recuperar Importes Sueldos',0,0,100,TO_DATE('2025-08-22 16:52:14','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2025-08-22 16:52:14','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 22/08/2025 16:52:15 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000614 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 22/08/2025 16:56:42 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,AD_Element_ID,EntityType,Name,ColumnName,Description,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3001125,0,3000614,100,'Y',19,10,'Y',2764,'LAR','Remuneration','C_Remuneration_ID','Wage or Salary','Y',0,100,TO_DATE('2025-08-22 16:56:42','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-08-22 16:56:42','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 22/08/2025 16:56:42 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3001125 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 22/08/2025 16:58:21 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,Help,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,AD_Val_Rule_ID,SeqNo,IsMandatory,AD_Reference_Value_ID,DefaultValue,AD_Element_ID,EntityType,Name,ColumnName,Description,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3001126,0,'An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.',3000614,100,'Y',19,148,20,'N',3000018,'0',113,'LAR','Organization','AD_Org_ID','Organizational entity within client','Y',0,100,TO_DATE('2025-08-22 16:58:21','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-08-22 16:58:21','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 22/08/2025 16:58:21 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3001126 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 22/08/2025 16:59:21 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET AD_Process_ID=3000614,Updated=TO_DATE('2025-08-22 16:59:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005871
;

-- 22/08/2025 17:06:26 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,Description,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000178,'L','LAR','N','Tipo Sueldo','PPal Miles',0,0,100,TO_DATE('2025-08-22 17:06:25','YYYY-MM-DD HH24:MI:SS'),'Y',TO_DATE('2025-08-22 17:06:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/08/2025 17:06:26 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000178 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 22/08/2025 17:06:52 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Description,Value,Name,Updated,Created,CreatedBy,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000377,3000178,'LAR','Principal','P','Principal',TO_DATE('2025-08-22 17:06:52','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-08-22 17:06:52','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',0)
;

-- 22/08/2025 17:06:52 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000377 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 22/08/2025 17:07:07 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Description,Value,Name,Updated,Created,CreatedBy,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000378,3000178,'LAR','Miles','M','Miles',TO_DATE('2025-08-22 17:07:07','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-08-22 17:07:07','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',0)
;

-- 22/08/2025 17:07:07 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000378 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 22/08/2025 17:07:16 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Reference SET Description='PPal / Miles',Updated=TO_DATE('2025-08-22 17:07:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=3000178
;

-- 22/08/2025 17:07:16 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Reference_Trl SET IsTranslated='N' WHERE AD_Reference_ID=3000178
;

-- 22/08/2025 17:10:08 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Process_Para SET IsCentrallyMaintained='N', AD_Reference_ID=17, AD_Reference_Value_ID=3000178, AD_Element_ID=NULL, Name='TipoSueldo', ColumnName='TipoSueldo', Description='Tipo de Sueldo',Updated=TO_DATE('2025-08-22 17:10:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3001125
;

-- 22/08/2025 17:10:08 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Process_Para_Trl SET IsTranslated='N' WHERE AD_Process_Para_ID=3001125
;

-- 22/08/2025 17:36:36 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,DefaultValue,AD_Element_ID,EntityType,Name,ColumnName,Description,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3001128,0,3000614,100,'Y',19,40,'Y','4000000',2764,'LAR','Remuneration','C_Remuneration_ID','Wage or Salary','Y',0,100,TO_DATE('2025-08-22 17:36:36','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-08-22 17:36:36','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 22/08/2025 17:36:36 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3001128 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;


-- 23/08/2025 10:50:25 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005901,3000278,'LAR',0,'N','N','N','N',1,'N',20,'N',524,'N','Y','N','Process Now','Processing',100,TO_DATE('2025-08-23 10:50:25','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-23 10:50:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/08/2025 10:50:25 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005901 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/08/2025 10:53:40 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009439,1,'Y','N','N',3005901,'N','Y',3000315,'N','LAR','Process Now',100,0,TO_DATE('2025-08-23 10:53:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-23 10:53:40','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/08/2025 10:53:40 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009439 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;


--Registrar Flujo de trabajao en el documento
-- 23/08/2025 11:24:45 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Workflow (Cost,WorkingTime,AccessLevel,Author,AD_Workflow_ID,Duration,DurationUnit,EntityType,IsDefault,IsValid,PublishStatus,Version,AD_Table_ID,AD_WF_Node_ID,DocumentNo,WaitingTime,IsBetaFunctionality,WorkflowType,Name,Value,Description,UpdatedBy,Updated,Created,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive) VALUES (0,0,'1','Adempiere, Inc.',3000012,1,'D','LAR','N','Y','R',0,3000278,191,'4000000',0,'N','P','Process_LotePagoSueldos','Process_LotePagoSueldos','(Standard Process LotePagoSueldos)',100,TO_DATE('2025-08-23 11:24:44','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-08-23 11:24:44','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y')
;

-- 23/08/2025 11:24:45 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Workflow_Trl (AD_Language,AD_Workflow_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Workflow_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Workflow t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Workflow_ID=3000012 AND NOT EXISTS (SELECT * FROM AD_Workflow_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Workflow_ID=t.AD_Workflow_ID)
;

-- 23/08/2025 11:25:49 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Process (AD_Workflow_ID,AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Value,Name,AD_Org_ID,AD_Client_ID,UpdatedBy,Created,CreatedBy,Updated,IsActive) VALUES (3000012,3000615,'N','N','1','N','N','Y','LAR',0,0,'C_Invoice Process','Process Lote',0,0,100,TO_DATE('2025-08-23 11:25:49','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2025-08-23 11:25:49','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 23/08/2025 11:25:49 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000615 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 23/08/2025 11:26:25 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,Limit,WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,AD_Workflow_ID,Action,SplitElement,Value,Name,Description,UpdatedBy,AD_Org_ID,Created,CreatedBy,IsActive,Updated,AD_Client_ID) VALUES (3000054,0,0,0,'CO',0,'LAR','Y','X',0,0,0,0,0,0,3000012,'Z','X','(DocAuto)','(DocAuto)','(Standard Node)',100,0,TO_DATE('2025-08-23 11:26:25','YYYY-MM-DD HH24:MI:SS'),100,'Y',TO_DATE('2025-08-23 11:26:25','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 23/08/2025 11:26:25 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_WF_Node_Trl (AD_Language,AD_WF_Node_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_WF_Node_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_WF_Node t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_WF_Node_ID=3000054 AND NOT EXISTS (SELECT * FROM AD_WF_Node_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_WF_Node_ID=t.AD_WF_Node_ID)
;

-- 23/08/2025 11:26:46 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,Limit,WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,AD_Workflow_ID,Action,SplitElement,Value,Name,UpdatedBy,AD_Org_ID,Created,CreatedBy,IsActive,Updated,AD_Client_ID) VALUES (3000055,0,0,0,'CO',0,'LAR','Y','X',0,0,0,0,0,0,3000012,'D','X','(DocComplete)','(DocComplete)',100,0,TO_DATE('2025-08-23 11:26:46','YYYY-MM-DD HH24:MI:SS'),100,'Y',TO_DATE('2025-08-23 11:26:46','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 23/08/2025 11:26:46 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_WF_Node_Trl (AD_Language,AD_WF_Node_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_WF_Node_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_WF_Node t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_WF_Node_ID=3000055 AND NOT EXISTS (SELECT * FROM AD_WF_Node_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_WF_Node_ID=t.AD_WF_Node_ID)
;

-- 23/08/2025 11:26:59 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_WF_Node SET DocAction='--', Action='D',Updated=TO_DATE('2025-08-23 11:26:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_WF_Node_ID=3000054
;

-- 23/08/2025 11:27:38 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,Limit,WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,AD_Workflow_ID,Action,SplitElement,Value,Name,Description,UpdatedBy,AD_Org_ID,Created,CreatedBy,IsActive,Updated,AD_Client_ID) VALUES (3000056,0,0,0,'PR',0,'LAR','Y','X',0,0,0,0,0,0,3000012,'D','X','(DocPrepare)','(DocPrepare)','(Standard Node)',100,0,TO_DATE('2025-08-23 11:27:37','YYYY-MM-DD HH24:MI:SS'),100,'Y',TO_DATE('2025-08-23 11:27:37','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 23/08/2025 11:27:38 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_WF_Node_Trl (AD_Language,AD_WF_Node_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_WF_Node_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_WF_Node t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_WF_Node_ID=3000056 AND NOT EXISTS (SELECT * FROM AD_WF_Node_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_WF_Node_ID=t.AD_WF_Node_ID)
;

-- 23/08/2025 11:27:58 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,Limit,WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,AD_Workflow_ID,Action,SplitElement,Value,Name,Description,UpdatedBy,AD_Org_ID,Created,CreatedBy,IsActive,Updated,AD_Client_ID) VALUES (3000057,0,0,0,'CO',0,'LAR','Y','X',0,0,0,0,0,0,3000012,'Z','X','(Start)','(Start)','(Standard Node)',100,0,TO_DATE('2025-08-23 11:27:58','YYYY-MM-DD HH24:MI:SS'),100,'Y',TO_DATE('2025-08-23 11:27:58','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 23/08/2025 11:27:58 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_WF_Node_Trl (AD_Language,AD_WF_Node_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_WF_Node_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_WF_Node t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_WF_Node_ID=3000057 AND NOT EXISTS (SELECT * FROM AD_WF_Node_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_WF_Node_ID=t.AD_WF_Node_ID)
;

-- 23/08/2025 11:30:01 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Process SET Value='LAR_LoteSueldos_Procesar',Updated=TO_DATE('2025-08-23 11:30:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000615
;

-- 23/08/2025 11:30:19 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET AD_Process_ID=3000615,Updated=TO_DATE('2025-08-23 11:30:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005867
;

-- 26/08/2025 13:35:05 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_WF_NodeNext (EntityType,IsStdUserWorkflow,AD_WF_NodeNext_ID,AD_WF_Node_ID,SeqNo,AD_WF_Next_ID,Description,Created,UpdatedBy,CreatedBy,AD_Org_ID,IsActive,Updated,AD_Client_ID) VALUES ('LAR','N',3000043,3000056,10,3000055,'Localizacion Argentina',TO_DATE('2025-08-26 13:35:04','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',TO_DATE('2025-08-26 13:35:04','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 26/08/2025 13:56:29 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_WF_NodeNext SET Description='(Standard Transition)',Updated=TO_DATE('2025-08-26 13:56:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_WF_NodeNext_ID=3000043
;

-- 26/08/2025 13:57:03 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_WF_NodeNext (EntityType,IsStdUserWorkflow,AD_WF_NodeNext_ID,AD_WF_Node_ID,SeqNo,AD_WF_Next_ID,Description,Created,UpdatedBy,CreatedBy,AD_Org_ID,IsActive,Updated,AD_Client_ID) VALUES ('LAR','N',3000044,3000057,10,3000056,'(Standard Approval)',TO_DATE('2025-08-26 13:57:02','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',TO_DATE('2025-08-26 13:57:02','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 26/08/2025 13:57:20 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_WF_NodeNext (EntityType,IsStdUserWorkflow,AD_WF_NodeNext_ID,AD_WF_Node_ID,SeqNo,AD_WF_Next_ID,Description,Created,UpdatedBy,CreatedBy,AD_Org_ID,IsActive,Updated,AD_Client_ID) VALUES ('LAR','N',3000045,3000057,10,3000054,'(Standard Transition)',TO_DATE('2025-08-26 13:57:20','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',TO_DATE('2025-08-26 13:57:20','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 26/08/2025 13:57:30 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_WF_NodeNext SET IsStdUserWorkflow='Y',Updated=TO_DATE('2025-08-26 13:57:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_WF_NodeNext_ID=3000044
;

-- 26/08/2025 14:07:27 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_WF_NodeNext SET SeqNo=100,Updated=TO_DATE('2025-08-26 14:07:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_WF_NodeNext_ID=3000045
;

-- 26/08/2025 14:16:43 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_WF_Node SET XPosition=12, YPosition=108,Updated=TO_DATE('2025-08-26 14:16:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_WF_Node_ID=3000054
;

-- 26/08/2025 14:16:43 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_WF_Node SET XPosition=210, YPosition=107,Updated=TO_DATE('2025-08-26 14:16:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_WF_Node_ID=3000055
;

-- 26/08/2025 14:16:43 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_WF_Node SET XPosition=209, YPosition=0,Updated=TO_DATE('2025-08-26 14:16:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_WF_Node_ID=3000056
;

-- 26/08/2025 14:16:43 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_WF_Node SET XPosition=11, YPosition=0,Updated=TO_DATE('2025-08-26 14:16:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_WF_Node_ID=3000057
;

-- 26/08/2025 14:22:31 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_WF_NodeNext SET SeqNo=100,Updated=TO_DATE('2025-08-26 14:22:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_WF_NodeNext_ID=3000043
;

-- 26/08/2025 14:24:41 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Table SET AD_Window_ID=3000146, TableName='LAR_LoteSueldos',Updated=TO_DATE('2025-08-26 14:24:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000278
;


-- 26/08/2025 14:54:31 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Workflow (Cost,WorkingTime,AccessLevel,Author,AD_Workflow_ID,Duration,DurationUnit,EntityType,IsDefault,IsValid,Limit,Priority,PublishStatus,ValidateWorkflow,Version,AD_Table_ID,DocumentNo,WaitingTime,IsBetaFunctionality,WorkflowType,Name,Value,UpdatedBy,Updated,Created,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive) VALUES (0,0,'1','Adempiere, Inc.',3000013,0,'D','LAR','N','N',0,0,'R','N',0,3000278,'4000001',0,'N','P','Procesar_LotePagoSueldos','4000002',100,TO_DATE('2025-08-26 14:54:31','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-08-26 14:54:31','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y')
;

-- 26/08/2025 14:54:31 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Workflow_Trl (AD_Language,AD_Workflow_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Workflow_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Workflow t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Workflow_ID=3000013 AND NOT EXISTS (SELECT * FROM AD_Workflow_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Workflow_ID=t.AD_Workflow_ID)
;

-- 26/08/2025 14:54:55 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,Limit,WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,AD_Workflow_ID,Action,SplitElement,Value,Name,Description,UpdatedBy,AD_Org_ID,Created,CreatedBy,IsActive,Updated,AD_Client_ID) VALUES (3000058,0,0,0,'CO',0,'LAR','Y','X',0,0,0,0,0,0,3000013,'Z','X','(Start)','(Start)','(Standard Node)',100,0,TO_DATE('2025-08-26 14:54:54','YYYY-MM-DD HH24:MI:SS'),100,'Y',TO_DATE('2025-08-26 14:54:54','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 26/08/2025 14:54:55 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_WF_Node_Trl (AD_Language,AD_WF_Node_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_WF_Node_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_WF_Node t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_WF_Node_ID=3000058 AND NOT EXISTS (SELECT * FROM AD_WF_Node_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_WF_Node_ID=t.AD_WF_Node_ID)
;

-- 26/08/2025 14:55:28 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,Limit,WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,AD_Workflow_ID,Action,SplitElement,Value,Name,Description,UpdatedBy,AD_Org_ID,Created,CreatedBy,IsActive,Updated,AD_Client_ID) VALUES (3000059,0,0,0,'CO',0,'LAR','Y','X',0,0,0,0,0,0,3000013,'D','X','(DocAuto)','(DocAuto)','(Standard Node)',100,0,TO_DATE('2025-08-26 14:55:27','YYYY-MM-DD HH24:MI:SS'),100,'Y',TO_DATE('2025-08-26 14:55:27','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 26/08/2025 14:55:28 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_WF_Node_Trl (AD_Language,AD_WF_Node_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_WF_Node_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_WF_Node t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_WF_Node_ID=3000059 AND NOT EXISTS (SELECT * FROM AD_WF_Node_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_WF_Node_ID=t.AD_WF_Node_ID)
;

-- 26/08/2025 14:55:51 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,Limit,WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,AD_Workflow_ID,Action,SplitElement,Value,Name,Description,UpdatedBy,AD_Org_ID,Created,CreatedBy,IsActive,Updated,AD_Client_ID) VALUES (3000060,0,0,0,'PR',0,'LAR','Y','X',0,0,0,0,0,0,3000013,'D','X','(DocPrepare)','(DocPrepare)','(Standard Node)',100,0,TO_DATE('2025-08-26 14:55:51','YYYY-MM-DD HH24:MI:SS'),100,'Y',TO_DATE('2025-08-26 14:55:51','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 26/08/2025 14:55:51 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_WF_Node_Trl (AD_Language,AD_WF_Node_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_WF_Node_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_WF_Node t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_WF_Node_ID=3000060 AND NOT EXISTS (SELECT * FROM AD_WF_Node_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_WF_Node_ID=t.AD_WF_Node_ID)
;

-- 26/08/2025 14:56:02 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_WF_Node SET DocAction='--',Updated=TO_DATE('2025-08-26 14:56:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_WF_Node_ID=3000059
;

-- 26/08/2025 14:56:29 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,Limit,WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,AD_Workflow_ID,Action,SplitElement,Value,Name,UpdatedBy,AD_Org_ID,Created,CreatedBy,IsActive,Updated,AD_Client_ID) VALUES (3000061,0,0,0,'CO',0,'LAR','Y','X',0,0,0,0,0,0,3000013,'D','X','(DocComplete)','(DocComplete)',100,0,TO_DATE('2025-08-26 14:56:28','YYYY-MM-DD HH24:MI:SS'),100,'Y',TO_DATE('2025-08-26 14:56:28','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 26/08/2025 14:56:29 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_WF_Node_Trl (AD_Language,AD_WF_Node_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_WF_Node_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_WF_Node t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_WF_Node_ID=3000061 AND NOT EXISTS (SELECT * FROM AD_WF_Node_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_WF_Node_ID=t.AD_WF_Node_ID)
;

-- 26/08/2025 14:56:56 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_WF_NodeNext (EntityType,IsStdUserWorkflow,AD_WF_NodeNext_ID,AD_WF_Node_ID,SeqNo,AD_WF_Next_ID,Created,UpdatedBy,CreatedBy,AD_Org_ID,IsActive,Updated,AD_Client_ID) VALUES ('LAR','N',3000046,3000060,10,3000061,TO_DATE('2025-08-26 14:56:56','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',TO_DATE('2025-08-26 14:56:56','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 26/08/2025 14:57:30 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_WF_NodeNext (EntityType,IsStdUserWorkflow,AD_WF_NodeNext_ID,AD_WF_Node_ID,SeqNo,AD_WF_Next_ID,Description,Created,UpdatedBy,CreatedBy,AD_Org_ID,IsActive,Updated,AD_Client_ID) VALUES ('LAR','Y',3000047,3000058,10,3000060,'(Standard Approval)',TO_DATE('2025-08-26 14:57:30','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',TO_DATE('2025-08-26 14:57:30','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 26/08/2025 14:57:48 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_WF_NodeNext (EntityType,IsStdUserWorkflow,AD_WF_NodeNext_ID,AD_WF_Node_ID,SeqNo,AD_WF_Next_ID,Description,Created,UpdatedBy,CreatedBy,AD_Org_ID,IsActive,Updated,AD_Client_ID) VALUES ('LAR','N',3000048,3000058,100,3000059,'(Standard Transition)',TO_DATE('2025-08-26 14:57:47','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',TO_DATE('2025-08-26 14:57:47','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 26/08/2025 15:05:27 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Process SET AD_Workflow_ID=3000013,Updated=TO_DATE('2025-08-26 15:05:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000615
;

-- 26/08/2025 15:08:12 ART
-- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Workflow SET IsValid='Y', AD_WF_Node_ID=3000058,Updated=TO_DATE('2025-08-26 15:08:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Workflow_ID=3000013
;

-- 26/08/2025 15:46:22 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005902,3000279,'LAR',0,'N','N','N','The Processed checkbox indicates that a document has been processed.','N',1,'N',20,'N',1047,'N','Y','N','The document has been processed','Processed','Processed',100,TO_DATE('2025-08-26 15:46:22','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2025-08-26 15:46:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/08/2025 15:46:22 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005902 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 26/08/2025 15:46:41 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009440,1,'Y','N','N',3005902,'N','Y',3000316,'N','The Processed checkbox indicates that a document has been processed.','LAR','The document has been processed','Processed',100,0,TO_DATE('2025-08-26 15:46:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2025-08-26 15:46:40','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/08/2025 15:46:41 ART
-- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009440 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/09/2025 17:17:05 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET IsIdentifier='Y', IsUpdateable='N', IsAllowCopy='N',Updated=TO_DATE('2025-09-02 17:17:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005857
;

-- 02/09/2025 17:17:52 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET AD_Reference_ID=15,Updated=TO_DATE('2025-09-02 17:17:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005870
;

-- 02/09/2025 17:18:32 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2025-09-02 17:18:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009414
;

-- 02/09/2025 17:20:33 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET DisplayLogic='@Processed@=Y',Updated=TO_DATE('2025-09-02 17:20:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009434
;

-- 02/09/2025 17:22:29 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Process_Para SET IsMandatory='N',Updated=TO_DATE('2025-09-02 17:22:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3001125
;

-- 02/09/2025 17:25:23 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3009439
;

-- 02/09/2025 17:27:30 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2025-09-02 17:27:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009416
;

-- 02/09/2025 17:31:05 ART
-- -- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,Description,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('AD_Org.IsSummary=''N'' AND AD_Org.AD_Client_ID = @AD_Client_ID@','S',3000156,'LAR','AD_Org  NO Summary','Not Summary - Not 0',100,100,TO_DATE('2025-09-02 17:31:05','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_DATE('2025-09-02 17:31:05','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/09/2025 17:31:12 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Process_Para SET AD_Val_Rule_ID=3000156,Updated=TO_DATE('2025-09-02 17:31:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3001126
;

-- 03/09/2025 14:19:01 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET IsMandatory='Y',Updated=TO_DATE('2025-09-03 14:19:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009404
;

-- 03/09/2025 14:19:18 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET IsMandatory='Y',Updated=TO_DATE('2025-09-03 14:19:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009420
;

-- 03/09/2025 14:21:31 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET AD_Reference_ID=30,Updated=TO_DATE('2025-09-03 14:21:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005894
;

-- 03/09/2025 14:22:19 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET AD_Reference_ID=30,Updated=TO_DATE('2025-09-03 14:22:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005895
;


-- Se Configura la ventana de Sueldos en LAR_PaymentHeader como Ventas
-- ya que al no tener IsSOTrx la tabla siempre devuelve la ventana de ventas al realizar el zoom
-- 04/09/2025 9:13:31 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Table SET AD_Window_ID=3000140,Updated=TO_DATE('2025-09-04 09:13:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000010
;

-- 06/09/2025 9:04:38 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2025-09-06 09:04:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005867
;

-- 06/09/2025 9:05:38 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2025-09-06 09:05:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005868
;

-- 06/09/2025 9:05:46 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2025-09-06 09:05:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005869
;

-- 06/09/2025 9:05:59 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2025-09-06 09:05:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005899
;

-- 06/09/2025 9:06:01 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2025-09-06 09:06:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005864
;

-- 06/09/2025 9:06:10 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2025-09-06 09:06:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005873
;

-- 06/09/2025 9:06:13 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2025-09-06 09:06:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005872
;

-- 06/09/2025 9:06:15 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2025-09-06 09:06:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005901
;

-- 06/09/2025 9:06:20 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2025-09-06 09:06:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005871
;

-- 06/09/2025 9:07:51 ART
-- -- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,VFormat,EntityType,IsOrderByValue,Name,Description,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000179,'L','LL','LAR','N','Document Status only CO, DR','Document Status list',0,0,100,TO_DATE('2025-09-06 09:07:50','YYYY-MM-DD HH24:MI:SS'),'Y',TO_DATE('2025-09-06 09:07:50','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 06/09/2025 9:07:51 ART
-- -- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000179 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 06/09/2025 9:08:22 ART
-- -- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,Created,CreatedBy,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000379,3000179,'LAR','CO','Completed',TO_DATE('2025-09-06 09:08:22','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-09-06 09:08:22','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',0)
;

-- 06/09/2025 9:08:22 ART
-- -- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000379 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 06/09/2025 9:08:34 ART
-- -- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,Created,CreatedBy,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000380,3000179,'LAR','DR','Drafted',TO_DATE('2025-09-06 09:08:34','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-09-06 09:08:34','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',0)
;

-- 06/09/2025 9:08:34 ART
-- -- ISSUE #155: RRHH Lote Sueldos
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000380 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 06/09/2025 9:08:41 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Ref_List_Trl SET IsTranslated='Y',Name='Borrador',Updated=TO_DATE('2025-09-06 09:08:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000380 AND AD_Language='es_AR'
;

-- 06/09/2025 9:08:56 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Ref_List_Trl SET IsTranslated='Y',Name='Completar',Updated=TO_DATE('2025-09-06 09:08:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000379 AND AD_Language='es_AR'
;

-- 06/09/2025 9:09:09 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET AD_Reference_Value_ID=3000179,Updated=TO_DATE('2025-09-06 09:09:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005876
;

-- 06/09/2025 9:10:33 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET DefaultValue='X',Updated=TO_DATE('2025-09-06 09:10:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005898
;

-- 06/09/2025 9:10:38 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET DefaultValue='A',Updated=TO_DATE('2025-09-06 09:10:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005896
;

-- 06/09/2025 9:13:24 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET DefaultValue='1000047',Updated=TO_DATE('2025-09-06 09:13:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005897
;

-- 06/09/2025 9:14:08 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2025-09-06 09:14:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005890
;

-- 06/09/2025 9:14:11 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2025-09-06 09:14:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005889
;

-- 06/09/2025 9:14:15 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2025-09-06 09:14:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005885
;

-- 06/09/2025 9:14:24 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET IsUpdateable='N', IsAllowCopy='N',Updated=TO_DATE('2025-09-06 09:14:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005877
;

-- 06/09/2025 9:14:30 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2025-09-06 09:14:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005894
;

-- 06/09/2025 9:14:33 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2025-09-06 09:14:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005895
;

-- 06/09/2025 9:14:36 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2025-09-06 09:14:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005902
;

-- 06/09/2025 11:00:10 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2025-09-06 11:00:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009409
;

-- 06/09/2025 11:01:28 ART
-- -- ISSUE #155: RRHH Lote Sueldos
UPDATE AD_Field_Trl SET Name='Generar Pagos en',Description='Estado en el que quedarán los documentos generados a partir del Lote',Updated=TO_DATE('2025-09-06 11:01:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009409 AND AD_Language='es_AR'
;

-- Registración de script
SELECT register_migration_script_lar('0238_ISSUE-155.sql', 'LAR', '') FROM dual
;
