ALTER TABLE C_DocType ADD IsFiscal character(1) DEFAULT 'N' NOT NULL;
ALTER TABLE C_DocType ADD IsFiscalDocument character(1) DEFAULT 'N' NOT NULL;
ALTER TABLE C_DocType ADD FiscalDocument character(1);
ALTER TABLE C_DocType ADD LAR_Fiscal_Printer_ID number(10,0);
ALTER TABLE C_DocType ADD DocSubTypeCAE character(2);
ALTER TABLE C_DocType ADD DocSubTypeINV character(2);
ALTER TABLE C_DocType ADD IsElectronic character(1) DEFAULT 'N' NOT NULL;
ALTER TABLE C_DocType ADD CONSTRAINT dt_fiscalprinter_fkx FOREIGN KEY (LAR_Fiscal_Printer_ID)
    REFERENCES LAR_Fiscal_Printer (LAR_Fiscal_Printer_ID);

ALTER TABLE C_DocType ADD LAR_DocumentLetter_ID number(10,0);
ALTER TABLE C_DocType ADD CONSTRAINT dt_letter_fkx FOREIGN KEY (LAR_DocumentLetter_ID)
    REFERENCES LAR_DocumentLetter (LAR_DocumentLetter_ID);
ALTER TABLE C_DocType ADD C_POS_ID number(10,0);
ALTER TABLE C_DocType ADD CONSTRAINT dt_pos_fkx FOREIGN KEY (C_POS_ID)
    REFERENCES C_POS (C_POS_ID);

CREATE UNIQUE INDEX Letter_DocType_Idx ON C_DocType (AD_Client_ID, AD_Org_ID, IsActive, DocBaseType,
        FiscalDocument, LAR_DocumentLetter_ID, C_POS_ID);
