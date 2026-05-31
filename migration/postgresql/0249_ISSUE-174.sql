-- 30/05/2026
-- ISSUE #174: Operatoria de liquidación mixta de tarjetas

SET search_path TO adempiere, pg_catalog;

CREATE TABLE IF NOT EXISTS adempiere.LAR_CardSettlement
(
    LAR_CardSettlement_ID            numeric(10,0)   NOT NULL,
    AD_Client_ID                     numeric(10,0)   NOT NULL,
    AD_Org_ID                        numeric(10,0)   NOT NULL,
    IsActive                         char(1)         NOT NULL DEFAULT 'Y',
    Created                          timestamp       NOT NULL DEFAULT now(),
    CreatedBy                        numeric(10,0)   NOT NULL,
    Updated                          timestamp       NOT NULL DEFAULT now(),
    UpdatedBy                        numeric(10,0)   NOT NULL,
    DocumentNo                       varchar(30)     NOT NULL,
    DocStatus                        varchar(2)      NOT NULL DEFAULT 'DR',
    DocAction                        varchar(2)      NOT NULL DEFAULT 'CO',
    Processing                       char(1)         NOT NULL DEFAULT 'N',
    Processed                        char(1)         NOT NULL DEFAULT 'N',
    DateDoc                          timestamp       NOT NULL,
    DateAcct                         timestamp       NOT NULL,
    C_BPartner_ID                    numeric(10,0)   NOT NULL,
    OperationType                    char(1)         NOT NULL,
    Amount                           numeric(18,2)   NOT NULL,
    Description                      varchar(255),
    Compensation_C_BankAccount_ID    numeric(10,0),
    From_C_BankAccount_ID            numeric(10,0),
    To_C_BankAccount_ID              numeric(10,0),
    RoutingNo                        varchar(20),
    AccountNo                        varchar(20),
    CheckNo                          varchar(20),
    A_Name                           varchar(60),
    Receipt_C_Payment_ID             numeric(10,0),
    Payment_C_Payment_ID             numeric(10,0),
    C_AllocationHdr_ID               numeric(10,0),
    ProcessMsg                       varchar(2000),
    CONSTRAINT LAR_CardSettlement_Key PRIMARY KEY (LAR_CardSettlement_ID),
    CONSTRAINT LAR_CardSettlement_OperationType_chk CHECK (OperationType IN ('C','T')),
    CONSTRAINT LAR_CardSettlement_IsActive_chk CHECK (IsActive IN ('Y','N')),
    CONSTRAINT LAR_CardSettlement_Processing_chk CHECK (Processing IN ('Y','N')),
    CONSTRAINT LAR_CardSettlement_Processed_chk CHECK (Processed IN ('Y','N'))
)
;

ALTER TABLE adempiere.LAR_CardSettlement
    ADD CONSTRAINT LARCardSettlement_Client FOREIGN KEY (AD_Client_ID) REFERENCES adempiere.AD_Client(AD_Client_ID)
;

ALTER TABLE adempiere.LAR_CardSettlement
    ADD CONSTRAINT LARCardSettlement_Org FOREIGN KEY (AD_Org_ID) REFERENCES adempiere.AD_Org(AD_Org_ID)
;

ALTER TABLE adempiere.LAR_CardSettlement
    ADD CONSTRAINT LARCardSettlement_BPartner FOREIGN KEY (C_BPartner_ID) REFERENCES adempiere.C_BPartner(C_BPartner_ID)
;

ALTER TABLE adempiere.LAR_CardSettlement
    ADD CONSTRAINT LARCardSettlement_BankComp FOREIGN KEY (Compensation_C_BankAccount_ID) REFERENCES adempiere.C_BankAccount(C_BankAccount_ID)
;

ALTER TABLE adempiere.LAR_CardSettlement
    ADD CONSTRAINT LARCardSettlement_BankFrom FOREIGN KEY (From_C_BankAccount_ID) REFERENCES adempiere.C_BankAccount(C_BankAccount_ID)
;

ALTER TABLE adempiere.LAR_CardSettlement
    ADD CONSTRAINT LARCardSettlement_BankTo FOREIGN KEY (To_C_BankAccount_ID) REFERENCES adempiere.C_BankAccount(C_BankAccount_ID)
;

ALTER TABLE adempiere.LAR_CardSettlement
    ADD CONSTRAINT LARCardSettlement_PaymentReceipt FOREIGN KEY (Receipt_C_Payment_ID) REFERENCES adempiere.C_Payment(C_Payment_ID)
;

ALTER TABLE adempiere.LAR_CardSettlement
    ADD CONSTRAINT LARCardSettlement_PaymentOut FOREIGN KEY (Payment_C_Payment_ID) REFERENCES adempiere.C_Payment(C_Payment_ID)
;

ALTER TABLE adempiere.LAR_CardSettlement
    ADD CONSTRAINT LARCardSettlement_Allocation FOREIGN KEY (C_AllocationHdr_ID) REFERENCES adempiere.C_AllocationHdr(C_AllocationHdr_ID)
;

CREATE INDEX IF NOT EXISTS LAR_CardSettlement_DocumentNo ON adempiere.LAR_CardSettlement(DocumentNo);
CREATE INDEX IF NOT EXISTS LAR_CardSettlement_BPartner ON adempiere.LAR_CardSettlement(C_BPartner_ID);
CREATE INDEX IF NOT EXISTS LAR_CardSettlement_OperationType ON adempiere.LAR_CardSettlement(OperationType);

INSERT INTO AD_Table (AD_Table_ID,TableName,Name,AccessLevel,LoadSeq,IsSecurityEnabled,ImportTable,IsHighVolume,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive)
VALUES (3000284,'LAR_CardSettlement','Liquidación Operativa Tarjetas','3',0,'N','N','Y','N','N','N','LAR','Y','Y','L',0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:00','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:00','YYYY-MM-DD HH24:MI:SS'),'Y')
;

INSERT INTO AD_Sequence (AD_Sequence_ID,Name,Description,IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Org_ID,AD_Client_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive)
VALUES (3008236,'LAR_CardSettlement','Table LAR_CardSettlement',1,'N',200000,'Y',1000000,1000000,'N','Y',0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:01','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:01','YYYY-MM-DD HH24:MI:SS'),'Y')
;

INSERT INTO AD_Sequence (AD_Sequence_ID,Name,Description,IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Org_ID,AD_Client_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive)
VALUES (3008237,'LAR_CardSettlement_Check','Document sequence for cheque settlements',1,'N',1,'N',1,1,'N','Y',0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:01','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:01','YYYY-MM-DD HH24:MI:SS'),'Y')
;

INSERT INTO AD_Sequence (AD_Sequence_ID,Name,Description,IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Org_ID,AD_Client_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive)
VALUES (3008238,'LAR_CardSettlement_Transfer','Document sequence for transfer settlements',1,'N',1,'N',1,1,'N','Y',0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:01','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:01','YYYY-MM-DD HH24:MI:SS'),'Y')
;

INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3001538,'LAR_CardSettlement_ID','LAR','Liquidación Operativa Tarjetas','Liquidación Operativa Tarjetas',0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:02','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:02','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,Description,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3001539,'OperationType','LAR','Tipo de Operación','Tipo de Operación','Cheque o transferencia bancaria',0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:02','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:02','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,Description,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3001540,'Compensation_C_BankAccount_ID','LAR','Cuenta a Compensar','Cuenta a Compensar','Cuenta bancaria origen para compensación del cheque',0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:02','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:02','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,Description,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3001541,'From_C_BankAccount_ID','LAR','Cuenta Bancaria Origen','Cuenta Bancaria Origen','Cuenta bancaria origen para transferencia',0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:02','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:02','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,Description,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3001542,'To_C_BankAccount_ID','LAR','Cuenta Bancaria Destino','Cuenta Bancaria Destino','Cuenta bancaria destino o cartera del cheque',0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:02','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:02','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,Description,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3001543,'Receipt_C_Payment_ID','LAR','Cobro Generado','Cobro Generado','Referencia al recibo/cobro generado automáticamente',0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:03','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:03','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,Description,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3001544,'Payment_C_Payment_ID','LAR','Pago Generado','Pago Generado','Referencia al pago/egreso generado automáticamente',0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:03','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:03','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,Description,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3001545,'ProcessMsg','LAR','Mensaje de Proceso','Mensaje de Proceso','Mensaje técnico o funcional del procesamiento del documento',0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:03','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:03','YYYY-MM-DD HH24:MI:SS'),'Y');

INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,VFormat,EntityType,IsOrderByValue,Name,Description,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive)
VALUES (3000182,'L','L','LAR','N','LAR Tipo Operación Tarjetas','Cheque o transferencia bancaria',0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:04','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:04','YYYY-MM-DD HH24:MI:SS'),'Y')
;

INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Description,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive)
VALUES (3000383,3000182,'LAR','C','Cobro con Cheque','Ingreso de cheque en cartera con compensación automática',0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:04','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:04','YYYY-MM-DD HH24:MI:SS'),'Y')
;

INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Description,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive)
VALUES (3000384,3000182,'LAR','T','Transferencia Bancaria','Cobro por transferencia bancaria con generación automática de documentos',0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:04','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:04','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- Columnas
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005957,3000284,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3001538,'N','N','N','Liquidación Operativa Tarjetas','LAR_CardSettlement_ID',100,100,TO_TIMESTAMP('2026-05-30 11:00:10','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005958,3000284,'LAR',0,'Y','N','N','A Client is a company or a legal entity.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,100,TO_TIMESTAMP('2026-05-30 11:00:10','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005959,3000284,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity.','N',10,'N',19,'N',113,'N','Y','N','Organizational entity within client','Organization','AD_Org_ID',100,100,TO_TIMESTAMP('2026-05-30 11:00:10','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005960,3000284,'LAR',0,'Y','N','N','The record is active in the system','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,100,TO_TIMESTAMP('2026-05-30 11:00:10','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005961,3000284,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,100,TO_TIMESTAMP('2026-05-30 11:00:10','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005962,3000284,'LAR',0,110,'Y','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,100,TO_TIMESTAMP('2026-05-30 11:00:10','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005963,3000284,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,100,TO_TIMESTAMP('2026-05-30 11:00:10','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005964,3000284,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,100,TO_TIMESTAMP('2026-05-30 11:00:10','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005965,3000284,'LAR',0,'Y','N','Y','Document sequence number of the document','N',30,'Y',10,'N',290,'N','N','N','Document sequence number of the document','Document No','DocumentNo',100,100,TO_TIMESTAMP('2026-05-30 11:00:10','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005966,3000284,'LAR',0,'Y','N','N','The Document Status indicates the status of a document at this time.','N',2,'N',10,'N',289,'N','Y','N','The current status of the document','Document Status','DocStatus',100,100,TO_TIMESTAMP('2026-05-30 11:00:11','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005967,3000284,'LAR',0,'Y','N','N','You find the current status in the Document Status field.','N',2,'N',10,'N',287,'N','Y','N','The targeted status of the document','Document Action','DocAction',100,100,TO_TIMESTAMP('2026-05-30 11:00:11','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005968,3000284,'LAR',0,'N','N','N','N',1,'N',20,'N',524,'N','Y','N','Process Now','Processing',100,100,TO_TIMESTAMP('2026-05-30 11:00:11','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005969,3000284,'LAR',0,'Y','N','N','The Processed checkbox indicates that a document has been processed.','N',1,'N',20,'N',1047,'N','Y','N','The document has been processed','Processed','Processed',100,100,TO_TIMESTAMP('2026-05-30 11:00:11','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005970,3000284,'LAR',0,'Y','N','N','The Document Date indicates the date the document was generated.','N',29,'N',15,'N',265,'N','Y','N','Date of the Document','Document Date','DateDoc',100,100,TO_TIMESTAMP('2026-05-30 11:00:11','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005971,3000284,'LAR',0,'Y','N','N','The Accounting Date indicates the date to be used on the General Ledger account entries generated from this document.','N',29,'N',15,'N',263,'N','Y','N','Accounting Date','Account Date','DateAcct',100,100,TO_TIMESTAMP('2026-05-30 11:00:11','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005972,3000284,'LAR',0,'Y','N','N','A Business Partner is anyone with whom you transact.','N',10,'N',19,'N',187,'N','Y','N','Identifies a Business Partner','Business Partner','C_BPartner_ID',100,100,TO_TIMESTAMP('2026-05-30 11:00:11','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005973,3000284,'LAR',0,3000182,'Y','N','N',NULL,'N',1,'N',17,'N',3001539,'N','Y','N','Cheque o transferencia bancaria','Tipo de Operación','OperationType',100,100,TO_TIMESTAMP('2026-05-30 11:00:11','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005974,3000284,'LAR',0,'Y','N','N','The Amount indicates the amount for this document line.','N',22,'N',12,'N',1367,'N','Y','N','Amount in a defined currency','Amount','Amount',100,100,TO_TIMESTAMP('2026-05-30 11:00:11','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005975,3000284,'LAR',0,'N','N','N','A description is limited to 255 characters.','N',255,'Y',10,'N',275,'N','Y','N','Optional short description of the record','Description','Description',100,100,TO_TIMESTAMP('2026-05-30 11:00:11','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005976,3000284,'LAR',0,'N','N','N','The Bank Account identifies an account at this Bank.','N',10,'N',19,'N',3001540,'N','Y','N','Cuenta bancaria origen para compensación del cheque','Cuenta a Compensar','Compensation_C_BankAccount_ID',100,100,TO_TIMESTAMP('2026-05-30 11:00:12','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005977,3000284,'LAR',0,'N','N','N','The Bank Account identifies an account at this Bank.','N',10,'N',19,'N',3001541,'N','Y','N','Cuenta bancaria origen para transferencia','Cuenta Bancaria Origen','From_C_BankAccount_ID',100,100,TO_TIMESTAMP('2026-05-30 11:00:12','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005978,3000284,'LAR',0,'N','N','N','The Bank Account identifies an account at this Bank.','N',10,'N',19,'N',3001542,'N','Y','N','Cuenta bancaria destino o cartera del cheque','Cuenta Bancaria Destino','To_C_BankAccount_ID',100,100,TO_TIMESTAMP('2026-05-30 11:00:12','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005979,3000284,'LAR',0,'N','N','N','The Bank Routing Number (ABA Number) identifies a legal Bank.','N',20,'N',10,'N',964,'N','Y','N','Bank Routing Number','Routing No','RoutingNo',100,100,TO_TIMESTAMP('2026-05-30 11:00:12','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005980,3000284,'LAR',0,'N','N','N','The Account Number indicates the Number assigned to this bank account.','N',20,'N',10,'N',840,'N','Y','N','Account Number','Account No','AccountNo',100,100,TO_TIMESTAMP('2026-05-30 11:00:12','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005981,3000284,'LAR',0,'N','N','N','The Check Number indicates the number on the check.','N',20,'N',10,'N',1389,'N','Y','N','Check Number','Check No','CheckNo',100,100,TO_TIMESTAMP('2026-05-30 11:00:12','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005982,3000284,'LAR',0,'N','N','N','The Name of the Credit Card or Account holder.','N',60,'N',10,'N',1354,'N','Y','N','Name on Credit Card or Account holder','Account Name','A_Name',100,100,TO_TIMESTAMP('2026-05-30 11:00:12','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005983,3000284,'LAR',0,'N','N','N','The Payment is a unique identifier of this payment.','N',10,'N',19,'N',3001543,'N','Y','N','Referencia al cobro generado automáticamente','Cobro Generado','Receipt_C_Payment_ID',100,100,TO_TIMESTAMP('2026-05-30 11:00:13','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:13','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005984,3000284,'LAR',0,'N','N','N','The Payment is a unique identifier of this payment.','N',10,'N',19,'N',3001544,'N','Y','N','Referencia al pago/egreso generado automáticamente','Pago Generado','Payment_C_Payment_ID',100,100,TO_TIMESTAMP('2026-05-30 11:00:13','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:13','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005985,3000284,'LAR',0,'N','N','N','Allocation of Cash/Payment to Invoice','N',10,'N',19,'N',1380,'N','Y','N','Asignación generada automáticamente','Allocation','C_AllocationHdr_ID',100,100,TO_TIMESTAMP('2026-05-30 11:00:13','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:13','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive) VALUES (3005986,3000284,'LAR',0,'N','N','N','N',2000,'N',10,'N',3001545,'N','Y','N','Mensaje de Proceso','ProcessMsg',100,100,TO_TIMESTAMP('2026-05-30 11:00:13','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:13','YYYY-MM-DD HH24:MI:SS'),0,0,'Y');

INSERT INTO AD_Window (AD_Window_ID,WindowType,EntityType,Name,Description,Help,IsSOTrx,IsDefault,IsBetaFunctionality,WinHeight,WinWidth,Processing,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive)
VALUES (3000149,'M','LAR','Liquidación Operativa Tarjetas','Genera y anula la operatoria documental de cheques y transferencias bancarias.','Use esta ventana para registrar operaciones de liquidación con cheque o transferencia. El sistema genera automáticamente pagos, cobros y asignación.', 'N','N','N',0,0,'N',0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:20','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:20','YYYY-MM-DD HH24:MI:SS'),'Y')
;

INSERT INTO AD_Tab (AD_Tab_ID,AD_Window_ID,SeqNo,AD_Table_ID,IsSingleRow,IsTranslationTab,IsSortTab,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive,Processing)
VALUES (3000319,3000149,10,3000284,'Y','N','N','N','N','N','N',0,'Y','N','LAR','Liquidación Operativa Tarjetas',0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:21','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:21','YYYY-MM-DD HH24:MI:SS'),'Y','N')
;

-- Campos de la pestaña
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009482,3000319,3005959,10,'Y',10,'N','N','N','Y','N','N','LAR','Organization','Organizational entity within client','An organization is a unit of your client or legal entity.',0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:30','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:30','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009483,3000319,3005965,30,'Y',20,'Y','N','N','Y','Y','N','LAR','Document No','Document sequence number of the document','Document sequence number of the document',0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:30','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:30','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009484,3000319,3005966,2,'Y',30,'N','N','N','Y','Y','N','LAR','Document Status','The current status of the document','The current status of the document',0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:30','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:30','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009485,3000319,3005967,2,'Y',40,'Y','N','N','Y','N','N','LAR','Document Action','The targeted status of the document','The targeted status of the document',0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:30','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:30','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009486,3000319,3005970,20,'Y',50,'N','N','N','Y','N','N','LAR','Document Date','Date of the Document','The Document Date indicates the date the document was generated.',0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:30','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:30','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009487,3000319,3005971,20,'Y',60,'Y','N','N','Y','N','N','LAR','Account Date','Accounting Date','The Accounting Date indicates the date to be used on the General Ledger account entries generated from this document.',0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:30','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:30','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009488,3000319,3005972,10,'Y',70,'N','N','N','Y','N','N','LAR','Business Partner','Identifies a Business Partner','A Business Partner is anyone with whom you transact.',0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:31','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:31','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009489,3000319,3005973,10,'Y',80,'Y','N','N','Y','N','N','LAR','Tipo de Operación','Cheque o transferencia bancaria',NULL,0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:31','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:31','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009490,3000319,3005974,22,'Y',90,'N','N','N','Y','N','N','LAR','Amount','Amount in a defined currency','The Amount indicates the amount for this document line.',0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:31','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:31','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009491,3000319,3005975,255,'Y',100,'N','N','N','Y','N','N','LAR','Description','Optional short description of the record','A description is limited to 255 characters.',0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:31','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:31','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009492,3000319,3005976,10,'Y',110,'N','N','N','Y','N','N','LAR','Cuenta a Compensar','Cuenta bancaria origen para compensación del cheque',NULL,0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:31','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:31','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009493,3000319,3005977,10,'Y',120,'N','N','N','Y','N','N','LAR','Cuenta Bancaria Origen','Cuenta bancaria origen para transferencia',NULL,0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:31','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:31','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009494,3000319,3005978,10,'Y',130,'Y','N','N','Y','N','N','LAR','Cuenta Bancaria Destino','Cuenta bancaria destino o cartera del cheque',NULL,0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:31','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:31','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009495,3000319,3005979,20,'Y',140,'N','N','N','Y','N','N','LAR','Routing No','Bank Routing Number',NULL,0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:32','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:32','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009496,3000319,3005980,20,'Y',150,'Y','N','N','Y','N','N','LAR','Account No','Account Number',NULL,0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:32','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:32','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009497,3000319,3005981,20,'Y',160,'Y','N','N','Y','N','N','LAR','Check No','Check Number',NULL,0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:32','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:32','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009498,3000319,3005982,60,'Y',170,'N','N','N','Y','N','N','LAR','Account Name','Name on Credit Card or Account holder',NULL,0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:32','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:32','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009499,3000319,3005983,10,'Y',180,'N','N','N','Y','Y','N','LAR','Cobro Generado','Referencia al cobro generado automáticamente',NULL,0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:32','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:32','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009500,3000319,3005984,10,'Y',190,'Y','N','N','Y','Y','N','LAR','Pago Generado','Referencia al pago/egreso generado automáticamente',NULL,0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:32','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:32','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009501,3000319,3005985,10,'Y',200,'Y','N','N','Y','Y','N','LAR','Allocation','Asignación generada automáticamente',NULL,0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:32','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:32','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009502,3000319,3005986,80,'Y',210,'N','N','N','Y','Y','N','LAR','Mensaje de Proceso','Mensaje técnico o funcional del procesamiento del documento',NULL,0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:32','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:32','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3009503,3000319,3005969,1,'Y',220,'N','N','N','Y','Y','N','LAR','Processed','The document has been processed',NULL,0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:32','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:32','YYYY-MM-DD HH24:MI:SS'),'Y');

UPDATE AD_Field SET DisplayLogic='@OperationType@=''C''' WHERE AD_Field_ID IN (3009492,3009495,3009496,3009497,3009498);
UPDATE AD_Field SET DisplayLogic='@OperationType@=''T''' WHERE AD_Field_ID=3009493;
UPDATE AD_Field SET DisplayLogic='@Processed@=''Y''' WHERE AD_Field_ID IN (3009499,3009500,3009501,3009502);

INSERT INTO AD_Menu (AD_Menu_ID,AD_Window_ID,IsSummary,Action,IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Description,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive)
VALUES (3000577,3000149,'N','W','N','N','LAR','Y','Liquidación Operativa Tarjetas','Genera y anula la operatoria documental de cheques y transferencias bancarias.',0,0,100,100,TO_TIMESTAMP('2026-05-30 11:00:40','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:40','YYYY-MM-DD HH24:MI:SS'),'Y')
;

UPDATE AD_Table
SET AD_Window_ID=3000149, Updated=CURRENT_TIMESTAMP, UpdatedBy=100
WHERE AD_Table_ID=3000284
;

INSERT INTO AD_Workflow (Cost,WorkingTime,AccessLevel,Author,AD_Workflow_ID,Duration,DurationUnit,EntityType,IsDefault,IsValid,PublishStatus,Version,AD_Table_ID,DocumentNo,WaitingTime,IsBetaFunctionality,WorkflowType,Name,Value,Description,UpdatedBy,Updated,Created,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive)
VALUES (0,0,'1','Ergio',3000014,0,'D','LAR','N','N','R',0,3000284,'4000003',0,'N','P','Process_LAR_CardSettlement','Process_LAR_CardSettlement','(Standard Process LAR_CardSettlement)',100,TO_TIMESTAMP('2026-05-30 11:00:41','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-30 11:00:41','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y')
;

INSERT INTO AD_Process (AD_Workflow_ID,AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Value,Name,AD_Org_ID,AD_Client_ID,Created,CreatedBy,Updated,UpdatedBy,IsActive)
VALUES (3000014,3000633,'N','N','1','N','N','Y','LAR',0,0,'LAR_CardSettlement_Process','Process LAR_CardSettlement',0,0,TO_TIMESTAMP('2026-05-30 11:00:41','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2026-05-30 11:00:41','YYYY-MM-DD HH24:MI:SS'),100,'Y')
;

INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,"limit",WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,AD_Workflow_ID,"action",SplitElement,Value,Name,Description,UpdatedBy,AD_Org_ID,Created,CreatedBy,IsActive,Updated,AD_Client_ID) VALUES (3000062,0,0,0,'CO',0,'LAR','Y','X',0,0,0,0,0,0,3000014,'Z','X','(Start)','(Start)','(Standard Node)',100,0,TO_TIMESTAMP('2026-05-30 11:00:42','YYYY-MM-DD HH24:MI:SS'),100,'Y',TO_TIMESTAMP('2026-05-30 11:00:42','YYYY-MM-DD HH24:MI:SS'),0);
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,"limit",WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,AD_Workflow_ID,"action",SplitElement,Value,Name,Description,UpdatedBy,AD_Org_ID,Created,CreatedBy,IsActive,Updated,AD_Client_ID) VALUES (3000063,0,0,0,'--',0,'LAR','Y','X',0,0,0,0,0,0,3000014,'D','X','(DocAuto)','(DocAuto)','(Standard Node)',100,0,TO_TIMESTAMP('2026-05-30 11:00:42','YYYY-MM-DD HH24:MI:SS'),100,'Y',TO_TIMESTAMP('2026-05-30 11:00:42','YYYY-MM-DD HH24:MI:SS'),0);
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,"limit",WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,AD_Workflow_ID,"action",SplitElement,Value,Name,Description,UpdatedBy,AD_Org_ID,Created,CreatedBy,IsActive,Updated,AD_Client_ID) VALUES (3000064,0,0,0,'PR',0,'LAR','Y','X',0,0,0,0,0,0,3000014,'D','X','(DocPrepare)','(DocPrepare)','(Standard Node)',100,0,TO_TIMESTAMP('2026-05-30 11:00:42','YYYY-MM-DD HH24:MI:SS'),100,'Y',TO_TIMESTAMP('2026-05-30 11:00:42','YYYY-MM-DD HH24:MI:SS'),0);
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,"limit",WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,AD_Workflow_ID,"action",SplitElement,Value,Name,Description,UpdatedBy,AD_Org_ID,Created,CreatedBy,IsActive,Updated,AD_Client_ID) VALUES (3000065,0,0,0,'CO',0,'LAR','Y','X',0,0,0,0,0,0,3000014,'D','X','(DocComplete)','(DocComplete)','(Standard Node)',100,0,TO_TIMESTAMP('2026-05-30 11:00:42','YYYY-MM-DD HH24:MI:SS'),100,'Y',TO_TIMESTAMP('2026-05-30 11:00:42','YYYY-MM-DD HH24:MI:SS'),0);

INSERT INTO AD_WF_NodeNext (EntityType,IsStdUserWorkflow,AD_WF_NodeNext_ID,AD_WF_Node_ID,SeqNo,AD_WF_Next_ID,Description,Created,UpdatedBy,CreatedBy,AD_Org_ID,IsActive,Updated,AD_Client_ID) VALUES ('LAR','N',3000049,3000064,100,3000065,'(Standard Transition)',TO_TIMESTAMP('2026-05-30 11:00:43','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',TO_TIMESTAMP('2026-05-30 11:00:43','YYYY-MM-DD HH24:MI:SS'),0);
INSERT INTO AD_WF_NodeNext (EntityType,IsStdUserWorkflow,AD_WF_NodeNext_ID,AD_WF_Node_ID,SeqNo,AD_WF_Next_ID,Description,Created,UpdatedBy,CreatedBy,AD_Org_ID,IsActive,Updated,AD_Client_ID) VALUES ('LAR','Y',3000050,3000062,10,3000064,'(Standard Approval)',TO_TIMESTAMP('2026-05-30 11:00:43','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',TO_TIMESTAMP('2026-05-30 11:00:43','YYYY-MM-DD HH24:MI:SS'),0);
INSERT INTO AD_WF_NodeNext (EntityType,IsStdUserWorkflow,AD_WF_NodeNext_ID,AD_WF_Node_ID,SeqNo,AD_WF_Next_ID,Description,Created,UpdatedBy,CreatedBy,AD_Org_ID,IsActive,Updated,AD_Client_ID) VALUES ('LAR','N',3000051,3000062,100,3000063,'(Standard Transition)',TO_TIMESTAMP('2026-05-30 11:00:43','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',TO_TIMESTAMP('2026-05-30 11:00:43','YYYY-MM-DD HH24:MI:SS'),0);

UPDATE AD_WF_Node
SET DocAction='--', Updated=CURRENT_TIMESTAMP, UpdatedBy=100
WHERE AD_WF_Node_ID=3000063
;

UPDATE AD_Workflow
SET IsValid='Y', AD_WF_Node_ID=3000062, Updated=CURRENT_TIMESTAMP, UpdatedBy=100
WHERE AD_Workflow_ID=3000014
;

-- Correcciones de referencias/lookups y comportamiento documental
UPDATE AD_Column
SET AD_Reference_ID=30,
    AD_Reference_Value_ID=193,
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Column_ID IN (3005976,3005977,3005978)
;

UPDATE AD_Column
SET AD_Reference_ID=19,
    AD_Reference_Value_ID=NULL,
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Column_ID=3005972
;

UPDATE AD_Column
SET AD_Reference_ID=30,
    AD_Reference_Value_ID=343,
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Column_ID IN (3005983,3005984)
;

UPDATE AD_Column
SET AD_Reference_ID=30,
    AD_Reference_Value_ID=323,
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Column_ID=3005985
;

UPDATE AD_Column
SET AD_Reference_ID=17,
    AD_Reference_Value_ID=131,
    DefaultValue='DR',
    IsMandatory='Y',
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Column_ID=3005966
;

UPDATE AD_Column
SET AD_Reference_ID=28,
    AD_Reference_Value_ID=135,
    DefaultValue='CO',
    IsMandatory='Y',
    AD_Process_ID=3000633,
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Column_ID=3005967
;

UPDATE AD_Column
SET DefaultValue='@#Date@',
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Column_ID IN (3005970,3005971)
;

UPDATE AD_Column
SET DefaultValue='C',
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Column_ID=3005973
;

UPDATE AD_Column
SET DefaultValue='0',
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Column_ID=3005974
;

UPDATE AD_Column
SET AD_Reference_ID=16,
    AD_Reference_Value_ID=NULL,
    DefaultValue=NULL,
    AD_Process_ID=NULL,
    Updated=CURRENT_TIMESTAMP,
    UpdatedBy=100
WHERE AD_Column_ID=3005961
;

-- Ajuste de layout (referencia: ventana de pagos AD_Window_ID=195)
UPDATE AD_Field SET SeqNo=30, IsSameLine='N' WHERE AD_Field_ID=3009486; -- DateDoc
UPDATE AD_Field SET SeqNo=40, IsSameLine='Y' WHERE AD_Field_ID=3009487; -- DateAcct
UPDATE AD_Field SET SeqNo=50, IsSameLine='N' WHERE AD_Field_ID=3009489; -- OperationType
UPDATE AD_Field SET SeqNo=60, IsSameLine='Y' WHERE AD_Field_ID=3009488; -- C_BPartner_ID
UPDATE AD_Field SET SeqNo=70, IsSameLine='N' WHERE AD_Field_ID=3009490; -- Amount
UPDATE AD_Field SET SeqNo=80, IsSameLine='N' WHERE AD_Field_ID=3009491; -- Description
UPDATE AD_Field SET SeqNo=90, IsSameLine='N' WHERE AD_Field_ID=3009492; -- Compensation
UPDATE AD_Field SET SeqNo=100, IsSameLine='N' WHERE AD_Field_ID=3009493; -- From
UPDATE AD_Field SET SeqNo=110, IsSameLine='Y' WHERE AD_Field_ID=3009494; -- To
UPDATE AD_Field SET SeqNo=120, IsSameLine='N' WHERE AD_Field_ID=3009495; -- Routing
UPDATE AD_Field SET SeqNo=130, IsSameLine='Y' WHERE AD_Field_ID=3009496; -- AccountNo
UPDATE AD_Field SET SeqNo=140, IsSameLine='Y' WHERE AD_Field_ID=3009497; -- CheckNo
UPDATE AD_Field SET SeqNo=150, IsSameLine='N' WHERE AD_Field_ID=3009498; -- A_Name
UPDATE AD_Field SET SeqNo=160, IsSameLine='N' WHERE AD_Field_ID=3009499; -- Receipt
UPDATE AD_Field SET SeqNo=170, IsSameLine='Y' WHERE AD_Field_ID=3009500; -- Payment
UPDATE AD_Field SET SeqNo=180, IsSameLine='Y' WHERE AD_Field_ID=3009501; -- Allocation
UPDATE AD_Field SET SeqNo=190, IsSameLine='N' WHERE AD_Field_ID=3009502; -- ProcessMsg
UPDATE AD_Field SET SeqNo=200, IsSameLine='N' WHERE AD_Field_ID=3009503; -- Processed
UPDATE AD_Field SET SeqNo=210, IsSameLine='N', IsReadOnly='Y' WHERE AD_Field_ID=3009484; -- DocStatus
UPDATE AD_Field SET SeqNo=220, IsSameLine='Y' WHERE AD_Field_ID=3009485; -- DocAction
UPDATE AD_Field SET DisplayLogic='@OperationType@=''T''' WHERE AD_Field_ID=3009494; -- To solo transferencia
UPDATE AD_Field SET IsReadOnly='N' WHERE AD_Field_ID IN (3009486,3009487,3009488,3009489); -- Fecha doc/contab, Socio, Tipo Op
UPDATE AD_Field SET IsReadOnly='Y' WHERE AD_Field_ID=3009484; -- DocStatus
UPDATE AD_Field SET IsReadOnly='N' WHERE AD_Field_ID=3009485; -- DocAction

INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,AD_Tree_ID,Node_ID,Parent_ID,SeqNo)
SELECT t.AD_Client_ID,0,'Y',CURRENT_TIMESTAMP,100,CURRENT_TIMESTAMP,100,t.AD_Tree_ID,3000577,0,999
FROM AD_Tree t
WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM'
  AND NOT EXISTS (SELECT 1 FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND e.Node_ID=3000577)
;

UPDATE AD_TreeNodeMM
SET Parent_ID=236, SeqNo=14, Updated=CURRENT_TIMESTAMP
WHERE AD_Tree_ID=10 AND Node_ID=3000577
;

-- Traducciones necesarias para objetos de Diccionario
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID,Name,IsTranslated,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,UpdatedBy)
SELECT l.AD_Language,t.AD_Table_ID,t.Name,'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.CreatedBy,t.Updated,t.UpdatedBy
FROM AD_Language l, AD_Table t
WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N'
  AND t.AD_Table_ID=3000284
  AND NOT EXISTS (SELECT 1 FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID,Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name,IsTranslated,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,UpdatedBy)
SELECT l.AD_Language,t.AD_Element_ID,t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name,'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.CreatedBy,t.Updated,t.UpdatedBy
FROM AD_Language l, AD_Element t
WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N'
  AND t.AD_Element_ID IN (3001538,3001539,3001540,3001541,3001542,3001543,3001544,3001545)
  AND NOT EXISTS (SELECT 1 FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID,Help,Name,Description,IsTranslated,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,UpdatedBy)
SELECT l.AD_Language,t.AD_Reference_ID,t.Help,t.Name,t.Description,'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.CreatedBy,t.Updated,t.UpdatedBy
FROM AD_Language l, AD_Reference t
WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N'
  AND t.AD_Reference_ID=3000182
  AND NOT EXISTS (SELECT 1 FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID,Name,Description,IsTranslated,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,UpdatedBy)
SELECT l.AD_Language,t.AD_Ref_List_ID,t.Name,t.Description,'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.CreatedBy,t.Updated,t.UpdatedBy
FROM AD_Language l, AD_Ref_List t
WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N'
  AND t.AD_Ref_List_ID IN (3000383,3000384)
  AND NOT EXISTS (SELECT 1 FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID,Name,IsTranslated,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,UpdatedBy)
SELECT l.AD_Language,t.AD_Column_ID,t.Name,'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.CreatedBy,t.Updated,t.UpdatedBy
FROM AD_Language l, AD_Column t
WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N'
  AND t.AD_Column_ID BETWEEN 3005957 AND 3005986
  AND NOT EXISTS (SELECT 1 FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

INSERT INTO AD_Window_Trl (AD_Language,AD_Window_ID,Help,Name,Description,IsTranslated,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,UpdatedBy)
SELECT l.AD_Language,t.AD_Window_ID,t.Help,t.Name,t.Description,'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.CreatedBy,t.Updated,t.UpdatedBy
FROM AD_Language l, AD_Window t
WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N'
  AND t.AD_Window_ID=3000149
  AND NOT EXISTS (SELECT 1 FROM AD_Window_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Window_ID=t.AD_Window_ID)
;

INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID,Help,CommitWarning,Name,Description,IsTranslated,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,UpdatedBy)
SELECT l.AD_Language,t.AD_Tab_ID,t.Help,t.CommitWarning,t.Name,t.Description,'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.CreatedBy,t.Updated,t.UpdatedBy
FROM AD_Language l, AD_Tab t
WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N'
  AND t.AD_Tab_ID=3000319
  AND NOT EXISTS (SELECT 1 FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID,Help,Description,Name,IsTranslated,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,UpdatedBy)
SELECT l.AD_Language,t.AD_Field_ID,t.Help,t.Description,t.Name,'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.CreatedBy,t.Updated,t.UpdatedBy
FROM AD_Language l, AD_Field t
WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N'
  AND t.AD_Field_ID BETWEEN 3009482 AND 3009503
  AND NOT EXISTS (SELECT 1 FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID,Name,Description,IsTranslated,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,UpdatedBy)
SELECT l.AD_Language,t.AD_Menu_ID,t.Name,t.Description,'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.CreatedBy,t.Updated,t.UpdatedBy
FROM AD_Language l, AD_Menu t
WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N'
  AND t.AD_Menu_ID=3000577
  AND NOT EXISTS (SELECT 1 FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

INSERT INTO AD_Workflow_Trl (AD_Language,AD_Workflow_ID,Help,Name,Description,IsTranslated,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,UpdatedBy)
SELECT l.AD_Language,t.AD_Workflow_ID,t.Help,t.Name,t.Description,'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.CreatedBy,t.Updated,t.UpdatedBy
FROM AD_Language l, AD_Workflow t
WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N'
  AND t.AD_Workflow_ID=3000014
  AND NOT EXISTS (SELECT 1 FROM AD_Workflow_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Workflow_ID=t.AD_Workflow_ID)
;

INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID,Help,Description,Name,IsTranslated,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,UpdatedBy)
SELECT l.AD_Language,t.AD_Process_ID,t.Help,t.Description,t.Name,'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.CreatedBy,t.Updated,t.UpdatedBy
FROM AD_Language l, AD_Process t
WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N'
  AND t.AD_Process_ID=3000633
  AND NOT EXISTS (SELECT 1 FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

SELECT register_migration_script_lar('0249_ISSUE-174.sql', 'LAR', '')
;
