ALTER TABLE C_DocType ADD COLUMN IsFiscal character(1) NOT NULL DEFAULT 'N';
ALTER TABLE C_DocType ADD COLUMN IsFiscalDocument character(1) NOT NULL DEFAULT 'N';
ALTER TABLE C_DocType ADD COLUMN FiscalDocument character(1);
ALTER TABLE C_DocType ADD COLUMN LAR_Fiscal_Printer_ID numeric(10,0);
ALTER TABLE C_DocType ADD COLUMN DocSubTypeCAE character(2);
ALTER TABLE C_DocType ADD COLUMN DocSubTypeINV character(2);
ALTER TABLE C_DocType ADD COLUMN IsElectronic character(1) NOT NULL DEFAULT 'N';
ALTER TABLE C_DocType ADD CONSTRAINT larfiscalprinter_cdoctype FOREIGN KEY (LAR_Fiscal_Printer_ID)
    REFERENCES LAR_Fiscal_Printer (LAR_Fiscal_Printer_ID);

ALTER TABLE C_DocType ADD COLUMN LAR_DocumentLetter_ID numeric(10,0);
ALTER TABLE C_DocType ADD CONSTRAINT lardocumentletter_cdoctype FOREIGN KEY (LAR_DocumentLetter_ID)
    REFERENCES LAR_DocumentLetter (LAR_DocumentLetter_ID);
ALTER TABLE C_DocType ADD COLUMN C_POS_ID numeric(10,0);
ALTER TABLE C_DocType ADD CONSTRAINT cpos_cdoctype FOREIGN KEY (C_POS_ID)
    REFERENCES C_POS (C_POS_ID);

CREATE UNIQUE INDEX LAR_Letter_DocType_Idx ON C_DocType (AD_Client_ID, AD_Org_ID, IsActive, DocBaseType,
        FiscalDocument, LAR_DocumentLetter_ID, C_POS_ID);
