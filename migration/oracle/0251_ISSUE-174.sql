-- 2026-06-08
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas.
--
-- Mantener este script alineado con migration/postgresql/0251_ISSUE-174.sql.
-- La implementación funcional se valida primero en PostgreSQL.

CREATE TABLE LAR_CardSettlement_Hdr
(
    LAR_CardSettlement_Hdr_ID NUMBER(10,0) NOT NULL,
    AD_Client_ID              NUMBER(10,0) NOT NULL,
    AD_Org_ID                 NUMBER(10,0) NOT NULL,
    IsActive                  CHAR(1) DEFAULT 'Y' NOT NULL,
    Created                   DATE NOT NULL,
    CreatedBy                 NUMBER(10,0) NOT NULL,
    Updated                   DATE NOT NULL,
    UpdatedBy                 NUMBER(10,0) NOT NULL,
    DocumentNo                VARCHAR2(30) NOT NULL,
    DocStatus                 VARCHAR2(2) DEFAULT 'DR' NOT NULL,
    DocAction                 VARCHAR2(2) DEFAULT 'CO' NOT NULL,
    Processing                CHAR(1) DEFAULT 'N' NOT NULL,
    Processed                 CHAR(1) DEFAULT 'N' NOT NULL,
    DateDoc                   DATE NOT NULL,
    DateAcct                  DATE NOT NULL,
    C_BPartner_ID             NUMBER(10,0) NOT NULL,
    OperationType             VARCHAR2(1) NOT NULL,
    TotalAmt                  NUMBER DEFAULT 0 NOT NULL,
    Description               VARCHAR2(255),
    ProcessMsg                VARCHAR2(2000),
    CONSTRAINT LAR_CardSettlement_Hdr_Key PRIMARY KEY (LAR_CardSettlement_Hdr_ID),
    CONSTRAINT LAR_CardSettlement_Hdr_Op_chk CHECK (OperationType IN ('C','T')),
    CONSTRAINT LAR_CardSettlement_Hdr_IsActive_chk CHECK (IsActive IN ('Y','N')),
    CONSTRAINT LAR_CardSettlement_Hdr_Processing_chk CHECK (Processing IN ('Y','N')),
    CONSTRAINT LAR_CardSettlement_Hdr_Processed_chk CHECK (Processed IN ('Y','N'))
);

ALTER TABLE LAR_CardSettlement_Hdr
    ADD CONSTRAINT LARCardSettlementHdr_Client
    FOREIGN KEY (AD_Client_ID) REFERENCES AD_Client(AD_Client_ID);

ALTER TABLE LAR_CardSettlement_Hdr
    ADD CONSTRAINT LARCardSettlementHdr_Org
    FOREIGN KEY (AD_Org_ID) REFERENCES AD_Org(AD_Org_ID);

ALTER TABLE LAR_CardSettlement_Hdr
    ADD CONSTRAINT LARCardSettlementHdr_BPartner
    FOREIGN KEY (C_BPartner_ID) REFERENCES C_BPartner(C_BPartner_ID);

ALTER TABLE LAR_CardSettlement ADD (LAR_CardSettlement_Hdr_ID NUMBER(10,0), Line NUMBER(10,0));

ALTER TABLE LAR_CardSettlement
    ADD CONSTRAINT larcardsettlement_hdr
    FOREIGN KEY (LAR_CardSettlement_Hdr_ID)
    REFERENCES LAR_CardSettlement_Hdr(LAR_CardSettlement_Hdr_ID);

CREATE INDEX LAR_CardSettlement_Hdr_DocumentNo ON LAR_CardSettlement_Hdr(DocumentNo);
CREATE INDEX LAR_CardSettlement_Hdr_BPartner ON LAR_CardSettlement_Hdr(C_BPartner_ID);
CREATE INDEX LAR_CardSettlement_Hdr_OperationType ON LAR_CardSettlement_Hdr(OperationType);
CREATE INDEX LAR_CardSettlement_Header ON LAR_CardSettlement(LAR_CardSettlement_Hdr_ID);
CREATE INDEX LAR_CardSettlement_Line ON LAR_CardSettlement(LAR_CardSettlement_Hdr_ID, Line);

-- Metadata DD
INSERT INTO AD_Table (AD_Table_ID,TableName,Name,AccessLevel,LoadSeq,ImportTable,IsView,IsHighVolume,IsSecurityEnabled,IsDeleteable,IsChangeLog,IsCentrallyMaintained,CopyColumnsFromTable,ReplicationType,EntityType,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive)
VALUES (3000285,'LAR_CardSettlement_Hdr','Cabecera Liquidación Operativa Tarjetas','3',0,'N','N','Y','N','Y','N','Y','N','L','LAR',0,0,100,100,TO_DATE('2026-06-08 12:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-06-08 12:00:00','YYYY-MM-DD HH24:MI:SS'),'Y');

INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID,Name,IsTranslated,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,UpdatedBy)
SELECT l.AD_Language,t.AD_Table_ID,t.Name,'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.CreatedBy,t.Updated,t.UpdatedBy
FROM AD_Language l, AD_Table t
WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N'
  AND t.AD_Table_ID=3000285
  AND NOT EXISTS (SELECT 1 FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID);

INSERT INTO AD_Sequence (AD_Sequence_ID,Name,Description,IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive)
VALUES (3008239,'LAR_CardSettlement_Hdr','Table LAR_CardSettlement_Hdr',1,'N',200000,'Y',1000000,1000000,'N','Y',0,0,100,100,TO_DATE('2026-06-08 12:00:01','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-06-08 12:00:01','YYYY-MM-DD HH24:MI:SS'),'Y');

INSERT INTO AD_Sequence (AD_Sequence_ID,Name,Description,IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive)
VALUES (3008240,'LAR_CardSettlement_Hdr','Document sequence for card settlement headers',1,'N',1,'N',1,1,'N','Y',0,0,100,100,TO_DATE('2026-06-08 12:00:01','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-06-08 12:00:01','YYYY-MM-DD HH24:MI:SS'),'Y');

INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3001547,'LAR_CardSettlement_Hdr_ID','LAR','Cabecera Liquidación Operativa Tarjetas','Cabecera Liquidación Operativa Tarjetas',0,0,100,100,TO_DATE('2026-06-08 12:00:02','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-06-08 12:00:02','YYYY-MM-DD HH24:MI:SS'),'Y');
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive) VALUES (3001550,'TotalAmt','LAR','Total Liquidado','Total Liquidado',0,0,100,100,TO_DATE('2026-06-08 12:00:02','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2026-06-08 12:00:02','YYYY-MM-DD HH24:MI:SS'),'Y');

INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID,Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name,IsTranslated,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,UpdatedBy)
SELECT l.AD_Language,t.AD_Element_ID,t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name,'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.CreatedBy,t.Updated,t.UpdatedBy
FROM AD_Language l, AD_Element t
WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N'
  AND t.AD_Element_ID IN (3001547,3001550)
  AND NOT EXISTS (SELECT 1 FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID);

-- Nota: la metadata DD restante replica el script PostgreSQL 0251 con sustituciones Oracle:
-- TO_TIMESTAMP -> TO_DATE
-- CURRENT_TIMESTAMP -> SYSDATE
-- Además, el flujo funcional y los IDs deben mantenerse idénticos.
-- Generar la contraparte final desde el script PostgreSQL validado antes de desplegar en Oracle.

-- 09/06/2026 12:12:14 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET DefaultValue='@SQL=SELECT C_Bpartner_ID FROM LAR_CardSettlement_Hdr hdr WHERE hdr.LAR_CardSettlement_Hdr_ID = @LAR_CardSettlement_Hdr_ID@',Updated=TO_DATE('2026-06-09 12:12:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009488
;

-- 09/06/2026 12:13:07 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2026-06-09 12:13:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005974
;

-- 09/06/2026 12:13:18 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2026-06-09 12:13:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005985
;

-- 09/06/2026 12:13:24 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2026-06-09 12:13:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005981
;

-- 09/06/2026 12:13:39 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2026-06-09 12:13:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005967
;

-- 09/06/2026 12:13:47 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2026-06-09 12:13:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005966
;

-- 09/06/2026 12:13:50 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2026-06-09 12:13:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005965
;

-- 09/06/2026 12:14:10 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsUpdateable='N', IsAllowCopy='N',Updated=TO_DATE('2026-06-09 12:14:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005957
;

-- 09/06/2026 12:14:14 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2026-06-09 12:14:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3006010
;

-- 09/06/2026 12:14:20 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2026-06-09 12:14:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005984
;

-- 09/06/2026 12:14:23 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2026-06-09 12:14:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005969
;

-- 09/06/2026 12:14:26 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2026-06-09 12:14:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005968
;

-- 09/06/2026 12:14:29 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2026-06-09 12:14:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005986
;

-- 09/06/2026 12:14:34 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2026-06-09 12:14:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005983
;

-- 09/06/2026 12:14:57 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2026-06-09 12:14:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005988
;

-- 09/06/2026 12:20:46 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3009523
;

-- 09/06/2026 12:20:46 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3009511
;

-- 09/06/2026 12:20:46 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3009512
;

-- 09/06/2026 12:20:46 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3009513
;

-- 09/06/2026 12:20:46 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3009514
;

-- 09/06/2026 12:20:46 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3009515
;

-- 09/06/2026 12:20:46 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3009516
;

-- 09/06/2026 12:20:46 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3009517
;

-- 09/06/2026 12:20:46 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3009518
;

-- 09/06/2026 12:20:46 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3009519
;

-- 09/06/2026 12:20:46 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3009520
;

-- 09/06/2026 12:20:46 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3009521
;

-- 09/06/2026 12:20:57 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2026-06-09 12:20:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009523
;

-- 09/06/2026 12:21:01 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2026-06-09 12:21:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009511
;

-- 09/06/2026 12:21:31 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3009514
;

-- 09/06/2026 12:21:31 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3009515
;

-- 09/06/2026 12:21:31 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3009511
;

-- 09/06/2026 12:21:31 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3009512
;

-- 09/06/2026 12:21:31 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3009513
;

-- 09/06/2026 12:22:00 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3009505
;

-- 09/06/2026 12:22:00 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3009482
;

-- 09/06/2026 12:22:00 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3009483
;

-- 09/06/2026 12:22:00 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3009489
;

-- 09/06/2026 12:22:00 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3009488
;

-- 09/06/2026 12:22:00 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3009490
;

-- 09/06/2026 12:22:00 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3009491
;

-- 09/06/2026 12:22:00 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3009508
;

-- 09/06/2026 12:22:00 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3009492
;

-- 09/06/2026 12:22:00 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3009493
;

-- 09/06/2026 12:22:00 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3009494
;

-- 09/06/2026 12:22:00 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3009495
;

-- 09/06/2026 12:22:00 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3009496
;

-- 09/06/2026 12:22:00 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3009497
;

-- 09/06/2026 12:22:00 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3009509
;

-- 09/06/2026 12:22:00 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3009498
;

-- 09/06/2026 12:22:00 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3009499
;

-- 09/06/2026 12:22:00 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3009500
;

-- 09/06/2026 12:22:00 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3009501
;

-- 09/06/2026 12:22:00 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3009502
;

-- 09/06/2026 12:22:00 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3009503
;

-- 09/06/2026 12:22:00 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3009484
;

-- 09/06/2026 12:22:00 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3009485
;

-- 09/06/2026 12:22:13 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2026-06-09 12:22:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009483
;

-- 09/06/2026 12:22:19 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2026-06-09 12:22:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009482
;

-- 09/06/2026 12:22:30 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3009523
;

-- 09/06/2026 12:22:30 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3009510
;

-- 09/06/2026 12:22:37 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2026-06-09 12:22:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009523
;

-- 09/06/2026 12:22:40 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2026-06-09 12:22:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009510
;

-- 09/06/2026 12:24:07 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET DisplayLogic='@DocStatus@ = ''CO''',Updated=TO_DATE('2026-06-09 12:24:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009485
;

-- 09/06/2026 12:26:34 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsMandatory='Y',Updated=TO_DATE('2026-06-09 12:26:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005981
;

-- 09/06/2026 12:26:46 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsMandatory='Y',Updated=TO_DATE('2026-06-09 12:26:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005988
;

-- 09/06/2026 14:48:56 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_DATE('2026-06-09 14:48:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3006011
;

-- 09/06/2026 15:54:24 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2026-06-09 15:54:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3006001
;

-- 09/06/2026 15:54:32 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2026-06-09 15:54:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3006000
;

-- 09/06/2026 15:54:37 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2026-06-09 15:54:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3006008
;

-- 09/06/2026 15:54:41 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2026-06-09 15:54:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3006006
;

-- 09/06/2026 15:54:49 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2026-06-09 15:54:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005995
;

-- 09/06/2026 15:54:52 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2026-06-09 15:54:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005996
;

-- 09/06/2026 15:55:16 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsUpdateable='N', IsAllowCopy='N',Updated=TO_DATE('2026-06-09 15:55:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005989
;

-- 09/06/2026 15:55:21 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2026-06-09 15:55:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005997
;

-- 09/06/2026 15:55:25 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2026-06-09 15:55:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005998
;

-- 09/06/2026 15:55:29 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2026-06-09 15:55:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005999
;

-- 09/06/2026 15:55:36 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2026-06-09 15:55:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3006007
;

-- 09/06/2026 15:55:43 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2026-06-09 15:55:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005994
;

-- 09/06/2026 15:55:45 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2026-06-09 15:55:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005993
;

-- 09/06/2026 15:57:41 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Field SET DefaultValue='@SQL=SELECT OperationType FROM LAR_CardSettlement_Hdr hdr WHERE hdr.LAR_CardSettlement_Hdr_ID = @LAR_CardSettlement_Hdr_ID@',Updated=TO_DATE('2026-06-09 15:57:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009489
;

-- 09/06/2026 15:58:47 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET MandatoryLogic='@OperationType@=C',Updated=TO_DATE('2026-06-09 15:58:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005987
;

-- 09/06/2026 15:59:00 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET MandatoryLogic='@OperationType@=C',Updated=TO_DATE('2026-06-09 15:59:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005976
;

-- 09/06/2026 15:59:29 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET MandatoryLogic='@OperationType@=T',Updated=TO_DATE('2026-06-09 15:59:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005977
;

-- 09/06/2026 15:59:41 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET MandatoryLogic='@OperationType@=C',Updated=TO_DATE('2026-06-09 15:59:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005978
;

-- 09/06/2026 16:02:15 ART
-- ISSUE #174: Rediseño cabecera + líneas para Liquidación Operativa Tarjetas
UPDATE AD_Column SET MandatoryLogic='@OperationType@=T',Updated=TO_DATE('2026-06-09 16:02:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005978
;

SELECT register_migration_script_lar('0251_ISSUE-174.sql', 'LAR', '') FROM dual;
