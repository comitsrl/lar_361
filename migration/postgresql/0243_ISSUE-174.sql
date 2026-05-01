CREATE TABLE LAR_TenderType_Acct
(
    --------------------------------------------------------------------------
    -- Clave primaria
    --------------------------------------------------------------------------
    LAR_TenderType_Acct_ID     NUMERIC(10,0) NOT NULL,

    --------------------------------------------------------------------------
    -- Columnas estándar ADempiere
    --------------------------------------------------------------------------
    AD_Client_ID               NUMERIC(10,0) NOT NULL,
    AD_Org_ID                  NUMERIC(10,0) NOT NULL,
    IsActive                   CHAR(1)       NOT NULL DEFAULT 'Y',

    Created                    TIMESTAMP     NOT NULL DEFAULT now(),
    CreatedBy                  NUMERIC(10,0)  NOT NULL,
    Updated                    TIMESTAMP     NOT NULL DEFAULT now(),
    UpdatedBy                  NUMERIC(10,0)  NOT NULL,

    --------------------------------------------------------------------------
    -- Claves funcionales
    --------------------------------------------------------------------------
    C_AcctSchema_ID            NUMERIC(10,0) NOT NULL,
    TenderType                 CHAR(1)       NOT NULL,
    IsSOTrx                    CHAR(1)       NOT NULL,

    --------------------------------------------------------------------------
    -- Cuentas contables (C_ValidCombination)
    --------------------------------------------------------------------------
    tt_available_acct          NUMERIC(10,0),
    tt_intransit_acct          NUMERIC(10,0),
    tt_unallocated_acct        NUMERIC(10,0),

    --------------------------------------------------------------------------
    -- Constraints
    --------------------------------------------------------------------------
    CONSTRAINT LAR_TenderType_Acct_PK
        PRIMARY KEY (LAR_TenderType_Acct_ID),

    CONSTRAINT LAR_TenderType_Acct_IsActive_Check
        CHECK (IsActive IN ('Y','N')),

    CONSTRAINT LAR_TenderType_Acct_IsSOTrx_Check
        CHECK (IsSOTrx IN ('Y','N')),

    CONSTRAINT LAR_TenderType_Acct_Unique
        UNIQUE
        (
            AD_Client_ID,
            AD_Org_ID,
            C_AcctSchema_ID,
            TenderType,
            IsSOTrx
        ),

    --------------------------------------------------------------------------
    -- Foreign Keys
    --------------------------------------------------------------------------
    CONSTRAINT ADClient_LARTenderTypeAcct
        FOREIGN KEY (AD_Client_ID)
        REFERENCES AD_Client (AD_Client_ID)
        DEFERRABLE INITIALLY DEFERRED,

    CONSTRAINT ADOrg_LARTenderTypeAcct
        FOREIGN KEY (AD_Org_ID)
        REFERENCES AD_Org (AD_Org_ID)
        DEFERRABLE INITIALLY DEFERRED,

    CONSTRAINT AcctSchema_LARTenderTypeAcct
        FOREIGN KEY (C_AcctSchema_ID)
        REFERENCES C_AcctSchema (C_AcctSchema_ID)
        ON DELETE CASCADE
        DEFERRABLE INITIALLY DEFERRED,

    CONSTRAINT VCTTAvailable_LARTenderTypeAcct
        FOREIGN KEY (tt_available_acct)
        REFERENCES C_ValidCombination (C_ValidCombination_ID)
        DEFERRABLE INITIALLY DEFERRED,

    CONSTRAINT VCTTInTransit_LARTenderTypeAcct
        FOREIGN KEY (tt_intransit_acct)
        REFERENCES C_ValidCombination (C_ValidCombination_ID)
        DEFERRABLE INITIALLY DEFERRED,

    CONSTRAINT VCTTUnallocated_LARTenderTypeAcct
        FOREIGN KEY (tt_unallocated_acct)
        REFERENCES C_ValidCombination (C_ValidCombination_ID)
        DEFERRABLE INITIALLY DEFERRED
);

------------------------------------------------------------------------------
-- Índices
------------------------------------------------------------------------------

CREATE INDEX LAR_TenderType_Acct_Main
    ON LAR_TenderType_Acct
    (
        AD_Client_ID,
        AD_Org_ID,
        C_AcctSchema_ID,
        TenderType,
        IsSOTrx
    );

CREATE INDEX LAR_TenderType_Acct_Org
    ON LAR_TenderType_Acct
    (
        AD_Client_ID,
        AD_Org_ID
    );

-- 22/01/2026 14:05:34 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,Help,LoadSeq,AD_Table_ID,ImportTable,IsHighVolume,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Description,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','3','Accounting configuration by payment method (tender type), defining available, in‑transit, and unallocated accounts per organization and accounting schema.',0,3000283,'N','Y','N','N','N','LAR','Y','Y','L','LAR_TenderType_Acct','Accounting configuration by payment method (tender type).','Cabecera Lote de Sueldos',0,'Y',0,100,TO_TIMESTAMP('2026-01-22 14:05:34','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2026-01-22 14:05:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/01/2026 14:05:34 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000283 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- 22/01/2026 14:05:34 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,UpdatedBy,AD_Client_ID,Updated,Created,CreatedBy,IsActive) VALUES (1,'N',200000,'Y',1000000,1000000,'N','Y',3008159,'Table LAR_TenderType_Acct','LAR_TenderType_Acct',0,100,0,TO_TIMESTAMP('2026-01-22 14:05:34','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-01-22 14:05:34','YYYY-MM-DD HH24:MI:SS'),100,'Y')
;

-- 22/01/2026 14:06:01 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Table_Trl SET Name='Configuración contable por forma de pago',IsTranslated='Y',Updated=TO_TIMESTAMP('2026-01-22 14:06:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000283 AND AD_Language='es_AR'
;

-- 22/01/2026 14:06:30 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001528,'LAR_TenderType_Acct_ID','LAR','Cabecera Lote de Sueldos','Cabecera Lote de Sueldos',0,TO_TIMESTAMP('2026-01-22 14:06:30','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-01-22 14:06:30','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 22/01/2026 14:06:30 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001528 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 22/01/2026 14:06:30 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005937,3000283,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3001528,'N','N','N','Cabecera Lote de Sueldos','LAR_TenderType_Acct_ID',100,TO_TIMESTAMP('2026-01-22 14:06:30','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2026-01-22 14:06:30','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/01/2026 14:06:30 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005937 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/01/2026 14:06:30 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005938,3000283,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,TO_TIMESTAMP('2026-01-22 14:06:30','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2026-01-22 14:06:30','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/01/2026 14:06:30 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005938 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/01/2026 14:06:30 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005939,3000283,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',100,TO_TIMESTAMP('2026-01-22 14:06:30','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2026-01-22 14:06:30','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/01/2026 14:06:30 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005939 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/01/2026 14:06:31 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005940,3000283,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,TO_TIMESTAMP('2026-01-22 14:06:30','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2026-01-22 14:06:30','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/01/2026 14:06:31 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005940 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/01/2026 14:06:31 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005941,3000283,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,TO_TIMESTAMP('2026-01-22 14:06:31','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2026-01-22 14:06:31','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/01/2026 14:06:31 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005941 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/01/2026 14:06:31 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005942,3000283,'LAR',0,110,'Y','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,TO_TIMESTAMP('2026-01-22 14:06:31','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2026-01-22 14:06:31','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/01/2026 14:06:31 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005942 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/01/2026 14:06:31 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005943,3000283,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,TO_TIMESTAMP('2026-01-22 14:06:31','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2026-01-22 14:06:31','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/01/2026 14:06:31 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005943 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/01/2026 14:06:31 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005944,3000283,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,TO_TIMESTAMP('2026-01-22 14:06:31','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2026-01-22 14:06:31','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/01/2026 14:06:31 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005944 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/01/2026 14:06:31 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005945,3000283,'LAR',0,'Y','N','N','An Accounting Schema defines the rules used in accounting such as costing method, currency and calendar','N',10,'N',19,'N',181,'N','Y','N','Rules for accounting','Accounting Schema','C_AcctSchema_ID',100,TO_TIMESTAMP('2026-01-22 14:06:31','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2026-01-22 14:06:31','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/01/2026 14:06:31 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005945 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/01/2026 14:06:31 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005946,3000283,'LAR',0,'Y','N','N','The Tender Type indicates the method of payment (ACH or Direct Deposit, Credit Card, Check, Direct Debit)','N',1,'N',20,'N',1441,'N','Y','N','Method of Payment','Tender type','TenderType',100,TO_TIMESTAMP('2026-01-22 14:06:31','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2026-01-22 14:06:31','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/01/2026 14:06:31 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005946 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/01/2026 14:06:31 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005947,3000283,'LAR',0,'Y','N','N','The Sales Transaction checkbox indicates if this item is a Sales Transaction.','N',1,'N',20,'N',1106,'N','Y','N','This is a Sales Transaction','Sales Transaction','IsSOTrx',100,TO_TIMESTAMP('2026-01-22 14:06:31','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2026-01-22 14:06:31','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/01/2026 14:06:31 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005947 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/01/2026 14:06:32 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001529,'tt_available_acct','LAR','tt_available_acct','tt_available_acct',0,TO_TIMESTAMP('2026-01-22 14:06:31','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-01-22 14:06:31','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 22/01/2026 14:06:32 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001529 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 22/01/2026 14:06:32 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005948,3000283,'LAR',0,'N','N','N','N',10,'N',25,'N',3001529,'N','Y','N','tt_available_acct','tt_available_acct',100,TO_TIMESTAMP('2026-01-22 14:06:31','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2026-01-22 14:06:31','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/01/2026 14:06:32 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005948 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/01/2026 14:06:32 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001530,'tt_intransit_acct','LAR','tt_intransit_acct','tt_intransit_acct',0,TO_TIMESTAMP('2026-01-22 14:06:32','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-01-22 14:06:32','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 22/01/2026 14:06:32 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001530 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 22/01/2026 14:06:32 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005949,3000283,'LAR',0,'N','N','N','N',10,'N',25,'N',3001530,'N','Y','N','tt_intransit_acct','tt_intransit_acct',100,TO_TIMESTAMP('2026-01-22 14:06:32','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2026-01-22 14:06:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/01/2026 14:06:32 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005949 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/01/2026 14:06:32 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001531,'tt_unallocated_acct','LAR','tt_unallocated_acct','tt_unallocated_acct',0,TO_TIMESTAMP('2026-01-22 14:06:32','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-01-22 14:06:32','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 22/01/2026 14:06:32 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001531 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 22/01/2026 14:06:32 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005950,3000283,'LAR',0,'N','N','N','N',10,'N',25,'N',3001531,'N','Y','N','tt_unallocated_acct','tt_unallocated_acct',100,TO_TIMESTAMP('2026-01-22 14:06:32','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2026-01-22 14:06:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/01/2026 14:06:32 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005950 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/01/2026 14:07:41 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Element SET ColumnName='TT_Available_Acct', Name='TT_Available_Acct', PrintName='TT_Available_Acct',Updated=TO_TIMESTAMP('2026-01-22 14:07:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001529
;

-- 22/01/2026 14:07:41 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001529
;

-- 22/01/2026 14:07:41 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Column SET ColumnName='TT_Available_Acct', Name='TT_Available_Acct', Description=NULL, Help=NULL WHERE AD_Element_ID=3001529
;

-- 22/01/2026 14:07:41 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Process_Para SET ColumnName='TT_Available_Acct', Name='TT_Available_Acct', Description=NULL, Help=NULL, AD_Element_ID=3001529 WHERE UPPER(ColumnName)='TT_AVAILABLE_ACCT' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 22/01/2026 14:07:41 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Process_Para SET ColumnName='TT_Available_Acct', Name='TT_Available_Acct', Description=NULL, Help=NULL WHERE AD_Element_ID=3001529 AND IsCentrallyMaintained='Y'
;

-- 22/01/2026 14:07:41 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Field SET Name='TT_Available_Acct', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001529) AND IsCentrallyMaintained='Y'
;

-- 22/01/2026 14:07:41 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_PrintFormatItem SET PrintName='TT_Available_Acct', Name='TT_Available_Acct' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001529)
;

-- 22/01/2026 14:08:01 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Element SET Description='Available account for this tender type (cash only)',Updated=TO_TIMESTAMP('2026-01-22 14:08:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001529
;

-- 22/01/2026 14:08:01 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001529
;

-- 22/01/2026 14:08:01 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Column SET ColumnName='TT_Available_Acct', Name='TT_Available_Acct', Description='Available account for this tender type (cash only)', Help=NULL WHERE AD_Element_ID=3001529
;

-- 22/01/2026 14:08:01 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Process_Para SET ColumnName='TT_Available_Acct', Name='TT_Available_Acct', Description='Available account for this tender type (cash only)', Help=NULL, AD_Element_ID=3001529 WHERE UPPER(ColumnName)='TT_AVAILABLE_ACCT' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 22/01/2026 14:08:01 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Process_Para SET ColumnName='TT_Available_Acct', Name='TT_Available_Acct', Description='Available account for this tender type (cash only)', Help=NULL WHERE AD_Element_ID=3001529 AND IsCentrallyMaintained='Y'
;

-- 22/01/2026 14:08:01 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Field SET Name='TT_Available_Acct', Description='Available account for this tender type (cash only)', Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001529) AND IsCentrallyMaintained='Y'
;

-- 22/01/2026 14:08:58 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Cuenta Disponible',PrintName='Cuenta Disponible',Description='Cuenta disponible para esta forma de pago (solo efectivo)',Updated=TO_TIMESTAMP('2026-01-22 14:08:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001529 AND AD_Language='es_AR'
;

-- 22/01/2026 14:10:55 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Element SET ColumnName='TT_InTransit_Acct', Name='TT_InTransit_Acct', Description='In‑transit account for this tender type (non‑cash)', PrintName='TT_InTransit_Acct',Updated=TO_TIMESTAMP('2026-01-22 14:10:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001530
;

-- 22/01/2026 14:10:55 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001530
;

-- 22/01/2026 14:10:55 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Column SET ColumnName='TT_InTransit_Acct', Name='TT_InTransit_Acct', Description='In‑transit account for this tender type (non‑cash)', Help=NULL WHERE AD_Element_ID=3001530
;

-- 22/01/2026 14:10:55 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Process_Para SET ColumnName='TT_InTransit_Acct', Name='TT_InTransit_Acct', Description='In‑transit account for this tender type (non‑cash)', Help=NULL, AD_Element_ID=3001530 WHERE UPPER(ColumnName)='TT_INTRANSIT_ACCT' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 22/01/2026 14:10:55 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Process_Para SET ColumnName='TT_InTransit_Acct', Name='TT_InTransit_Acct', Description='In‑transit account for this tender type (non‑cash)', Help=NULL WHERE AD_Element_ID=3001530 AND IsCentrallyMaintained='Y'
;

-- 22/01/2026 14:10:55 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Field SET Name='TT_InTransit_Acct', Description='In‑transit account for this tender type (non‑cash)', Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001530) AND IsCentrallyMaintained='Y'
;

-- 22/01/2026 14:10:55 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_PrintFormatItem SET PrintName='TT_InTransit_Acct', Name='TT_InTransit_Acct' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001530)
;

-- 22/01/2026 14:11:31 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Cuenta en Tránsito',PrintName='Cuenta en Tránsito',Description='Cuenta en tránsito para esta forma de pago (no efectivo)',Updated=TO_TIMESTAMP('2026-01-22 14:11:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001530 AND AD_Language='es_AR'
;

-- 22/01/2026 14:12:16 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Element SET ColumnName='TT_Unallocated_Acct', Name='TT_Unallocated_Acct', Description='Unallocated account for this tender type (payments/receipts not yet allocated)', PrintName='TT_Unallocated_Acct',Updated=TO_TIMESTAMP('2026-01-22 14:12:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001531
;

-- 22/01/2026 14:12:16 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001531
;

-- 22/01/2026 14:12:16 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Column SET ColumnName='TT_Unallocated_Acct', Name='TT_Unallocated_Acct', Description='Unallocated account for this tender type (payments/receipts not yet allocated)', Help=NULL WHERE AD_Element_ID=3001531
;

-- 22/01/2026 14:12:16 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Process_Para SET ColumnName='TT_Unallocated_Acct', Name='TT_Unallocated_Acct', Description='Unallocated account for this tender type (payments/receipts not yet allocated)', Help=NULL, AD_Element_ID=3001531 WHERE UPPER(ColumnName)='TT_UNALLOCATED_ACCT' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 22/01/2026 14:12:16 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Process_Para SET ColumnName='TT_Unallocated_Acct', Name='TT_Unallocated_Acct', Description='Unallocated account for this tender type (payments/receipts not yet allocated)', Help=NULL WHERE AD_Element_ID=3001531 AND IsCentrallyMaintained='Y'
;

-- 22/01/2026 14:12:16 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Field SET Name='TT_Unallocated_Acct', Description='Unallocated account for this tender type (payments/receipts not yet allocated)', Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001531) AND IsCentrallyMaintained='Y'
;

-- 22/01/2026 14:12:16 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_PrintFormatItem SET PrintName='TT_Unallocated_Acct', Name='TT_Unallocated_Acct' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001531)
;

-- 22/01/2026 14:12:42 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Cuenta No Imputada',PrintName='Cuenta No Imputada',Description='Cuenta no asignada para esta forma de pago (pagos/cobros sin imputar)',Updated=TO_TIMESTAMP('2026-01-22 14:12:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001531 AND AD_Language='es_AR'
;

-- 22/01/2026 14:16:08 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Window (AD_Window_ID,WindowType,Help,IsSOTrx,IsDefault,IsBetaFunctionality,WinHeight,WinWidth,EntityType,Name,Description,IsActive,Created,UpdatedBy,CreatedBy,Updated,AD_Org_ID,AD_Client_ID,Processing) VALUES (3000148,'M','Use this window to set the accounts used when posting payments/receipts by tender type. Cash uses the Available account;
  other tender types use the In‑Transit account. The Unallocated account is used for payments/receipts not yet allocated.','Y','N','N',0,0,'LAR','Tender Type Accounting','Maintain the accounting configuration by tender type, defining available, in‑transit, and unallocated accounts per   organization and accounting schema.','Y',TO_TIMESTAMP('2026-01-22 14:16:08','YYYY-MM-DD HH24:MI:SS'),100,100,TO_TIMESTAMP('2026-01-22 14:16:08','YYYY-MM-DD HH24:MI:SS'),0,0,'N')
;

-- 22/01/2026 14:16:08 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Window_Trl (AD_Language,AD_Window_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Window_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Window t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Window_ID=3000148 AND NOT EXISTS (SELECT * FROM AD_Window_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Window_ID=t.AD_Window_ID)
;

-- 22/01/2026 14:16:53 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Window_Trl SET IsTranslated='Y',Description='Mantiene la configuración contable por forma de pago, definiendo cuentas disponibles, en tránsito y no imputadas por   organización y esquema contable.',Help='“Use esta ventana para definir las cuentas utilizadas al contabilizar pagos/cobros por forma de pago. Efectivo usa la cuenta Disponible; otras formas de pago usan la cuenta En Tránsito. La cuenta No Imputada se usa para pagos/cobros aún no
  imputados.”',Updated=TO_TIMESTAMP('2026-01-22 14:16:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Window_ID=3000148 AND AD_Language='es_AR'
;

-- 22/01/2026 14:17:07 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Window SET Help='Use this window to set the accounts used when posting payments/receipts by tender type. Cash uses the Available account; other tender types use the In‑Transit account. The Unallocated account is used for payments/receipts not yet allocated.',Updated=TO_TIMESTAMP('2026-01-22 14:17:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Window_ID=3000148
;

-- 22/01/2026 14:17:07 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Window_Trl SET IsTranslated='N' WHERE AD_Window_ID=3000148
;

-- 22/01/2026 14:18:02 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Window_Trl SET IsTranslated='Y',Name='Contabilidad por Forma de Pago',Help='Use esta ventana para definir las cuentas utilizadas al contabilizar pagos/cobros por forma de pago. Efectivo usa la cuenta Disponible; otras formas de pago usan la cuenta En Tránsito. La cuenta No Imputada se usa para pagos/cobros aún no
  imputados.',Updated=TO_TIMESTAMP('2026-01-22 14:18:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Window_ID=3000148 AND AD_Language='es_AR'
;

-- 22/01/2026 14:19:30 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('N',3000148,10,'N','N',3000283,3000318,'N','N','Y','N',0,'Y','N','LAR','Contabilidad por Forma de Pago',0,0,TO_TIMESTAMP('2026-01-22 14:19:30','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2026-01-22 14:19:30','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 22/01/2026 14:19:30 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000318 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 22/01/2026 14:19:40 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009463,10,'Y','N','N',3005945,'N','Y',3000318,'N','An Accounting Schema defines the rules used in accounting such as costing method, currency and calendar','LAR','Rules for accounting','Accounting Schema',100,0,TO_TIMESTAMP('2026-01-22 14:19:39','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2026-01-22 14:19:39','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/01/2026 14:19:40 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009463 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/01/2026 14:19:40 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009464,1,'Y','N','N',3005940,'N','Y',3000318,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,TO_TIMESTAMP('2026-01-22 14:19:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2026-01-22 14:19:40','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/01/2026 14:19:40 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009464 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/01/2026 14:19:40 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009465,10,'N','N','N',3005937,'N','Y',3000318,'N','LAR','Cabecera Lote de Sueldos',100,0,TO_TIMESTAMP('2026-01-22 14:19:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2026-01-22 14:19:40','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/01/2026 14:19:40 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009465 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/01/2026 14:19:40 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009466,10,'Y','N','N',3005938,'N','Y',3000318,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,TO_TIMESTAMP('2026-01-22 14:19:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2026-01-22 14:19:40','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/01/2026 14:19:40 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009466 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/01/2026 14:19:40 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009467,10,'Y','N','N',3005939,'N','Y',3000318,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,TO_TIMESTAMP('2026-01-22 14:19:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2026-01-22 14:19:40','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/01/2026 14:19:40 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009467 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/01/2026 14:19:41 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009468,1,'Y','N','N',3005947,'N','Y',3000318,'N','The Sales Transaction checkbox indicates if this item is a Sales Transaction.','LAR','This is a Sales Transaction','Sales Transaction',100,0,TO_TIMESTAMP('2026-01-22 14:19:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2026-01-22 14:19:40','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/01/2026 14:19:41 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009468 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/01/2026 14:19:41 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009469,1,'Y','N','N',3005946,'N','Y',3000318,'N','The Tender Type indicates the method of payment (ACH or Direct Deposit, Credit Card, Check, Direct Debit)','LAR','Method of Payment','Tender type',100,0,TO_TIMESTAMP('2026-01-22 14:19:41','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2026-01-22 14:19:41','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/01/2026 14:19:41 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009469 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/01/2026 14:19:41 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009470,10,'Y','N','N',3005948,'N','Y',3000318,'N','LAR','Available account for this tender type (cash only)','TT_Available_Acct',100,0,TO_TIMESTAMP('2026-01-22 14:19:41','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2026-01-22 14:19:41','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/01/2026 14:19:41 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009470 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/01/2026 14:19:41 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009471,10,'Y','N','N',3005949,'N','Y',3000318,'N','LAR','In‑transit account for this tender type (non‑cash)','TT_InTransit_Acct',100,0,TO_TIMESTAMP('2026-01-22 14:19:41','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2026-01-22 14:19:41','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/01/2026 14:19:41 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009471 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/01/2026 14:19:41 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009472,10,'Y','N','N',3005950,'N','Y',3000318,'N','LAR','Unallocated account for this tender type (payments/receipts not yet allocated)','TT_Unallocated_Acct',100,0,TO_TIMESTAMP('2026-01-22 14:19:41','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2026-01-22 14:19:41','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/01/2026 14:19:41 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009472 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/01/2026 14:20:39 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3009466
;

-- 22/01/2026 14:20:39 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3009467
;

-- 22/01/2026 14:20:39 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3009464
;

-- 22/01/2026 14:20:39 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3009463
;

-- 22/01/2026 14:20:39 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3009468
;

-- 22/01/2026 14:20:39 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3009469
;

-- 22/01/2026 14:20:39 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3009470
;

-- 22/01/2026 14:20:39 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3009471
;

-- 22/01/2026 14:20:39 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3009472
;

-- 22/01/2026 14:20:59 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2026-01-22 14:20:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009467
;

-- 22/01/2026 14:21:16 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2026-01-22 14:21:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009469
;

-- 22/01/2026 14:23:37 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('AD_Ref_List.IsActive = ''Y''','S',3000161,'LAR','Tender Type - All Active',100,100,TO_TIMESTAMP('2026-01-22 14:23:37','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_TIMESTAMP('2026-01-22 14:23:37','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/01/2026 14:23:54 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Column SET AD_Reference_ID=17, AD_Val_Rule_ID=3000161,Updated=TO_TIMESTAMP('2026-01-22 14:23:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005946
;

-- 22/01/2026 14:27:05 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Menu (AD_Window_ID,AD_Menu_ID,IsSummary,"action",IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Description,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000148,3000571,'N','W','Y','N','LAR','Y','Contabilidad por Forma de Pago','Mantiene la configuración contable por forma de pago, definiendo cuentas disponibles, en tránsito y no imputadas por   organización y esquema contable.',TO_TIMESTAMP('2026-01-22 14:27:05','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_TIMESTAMP('2026-01-22 14:27:05','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 22/01/2026 14:27:05 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000571 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 22/01/2026 14:27:05 ART
-- ISSUE #174: Funcionalidad Contable Argentina
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100,t.AD_Tree_ID, 3000571, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000571)
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000571
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000569
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=512
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000011
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000013
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=243
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000015
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=7, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000092
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=8, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000028
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=9, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000101
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=10, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000060
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=11, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000013
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=12, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000024
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=13, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000014
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=14, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000489
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=15, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=288
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=16, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=432
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=17, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000008
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=18, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=235
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=19, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=241
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=20, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000048
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=21, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000099
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=22, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000469
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=23, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000470
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=24, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=462
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=25, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000102
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=26, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=245
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=27, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000306
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=28, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=251
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=29, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=255
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=30, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000301
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=31, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=413
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=32, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=538
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=33, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=286
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=34, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=287
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=35, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=438
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=36, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=234
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=37, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53313
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=38, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=511
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=39, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=505
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=40, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=496
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=41, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=497
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=42, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=304
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=43, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53190
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=44, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=246
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=45, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=509
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=46, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53187
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=47, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=510
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=48, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=244
;

-- 22/01/2026 14:27:22 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=49, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53314
;

-- 22/01/2026 14:29:35 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Column SET DefaultValue='0', IsAllowCopy='N',Updated=TO_TIMESTAMP('2026-01-22 14:29:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005939
;

-- 22/01/2026 14:42:12 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Table SET Name='LAR_TenderType_Acct',Updated=TO_TIMESTAMP('2026-01-22 14:42:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000283
;

-- 22/01/2026 14:42:12 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Table_Trl SET IsTranslated='N' WHERE AD_Table_ID=3000283
;

-- 22/01/2026 14:42:31 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Table_Trl SET IsTranslated='Y',Updated=TO_TIMESTAMP('2026-01-22 14:42:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000283 AND AD_Language='es_AR'
;

-- 22/01/2026 14:42:58 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Column SET AD_Reference_Value_ID=214,Updated=TO_TIMESTAMP('2026-01-22 14:42:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005946
;

-- 22/01/2026 14:52:29 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Field SET AD_FieldGroup_ID=50007,Updated=TO_TIMESTAMP('2026-01-22 14:52:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009470
;

-- 22/01/2026 14:52:33 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Field SET AD_FieldGroup_ID=50007,Updated=TO_TIMESTAMP('2026-01-22 14:52:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009471
;

-- 22/01/2026 14:52:36 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Field SET AD_FieldGroup_ID=50007,Updated=TO_TIMESTAMP('2026-01-22 14:52:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009472
;

-- 22/01/2026 14:53:49 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Field SET AD_FieldGroup_ID=50001,Updated=TO_TIMESTAMP('2026-01-22 14:53:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009472
;

-- 22/01/2026 14:53:53 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Field SET AD_FieldGroup_ID=50001,Updated=TO_TIMESTAMP('2026-01-22 14:53:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009471
;

-- 22/01/2026 14:53:57 ART
-- ISSUE #174: Funcionalidad Contable Argentina
UPDATE AD_Field SET AD_FieldGroup_ID=50001,Updated=TO_TIMESTAMP('2026-01-22 14:53:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009470
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=265
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=104
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=105
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=384
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=111
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=106
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000571
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=7, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=117
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=8, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=418
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=9, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=102
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=10, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=103
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=11, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=270
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=12, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=121
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=13, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=476
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=14, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=409
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=15, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=151
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=16, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53087
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=17, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=464
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=18, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=124
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=19, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=123
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=20, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=547
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=21, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53189
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=22, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=174
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=23, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=254
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=24, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=120
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=25, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=135
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=26, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=550
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=27, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=551
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=28, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=306
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=29, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53091
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=30, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=417
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=31, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=307
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=32, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=393
;

-- 17/02/2026 17:08:47 ART
-- ADP #2: Migracion de datos
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=33, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53248
;

-- Registración de script
SELECT register_migration_script_lar('0243_ISSUE-174.sql', 'LAR', '')
;
