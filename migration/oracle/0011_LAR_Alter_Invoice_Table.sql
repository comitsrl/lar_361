ALTER TABLE C_Invoice ADD COLUMN IsFiscalPrinted character(1) NOT NULL DEFAULT 'N';
ALTER TABLE C_Invoice ADD COLUMN FiscalReceiptNumber character varying(30);
ALTER TABLE C_Invoice ADD COLUMN CAI character varying(14);
ALTER TABLE C_Invoice ADD COLUMN CAIDate timestamp without time zone;

ALTER TABLE C_Invoice ADD COLUMN LAR_DocumentLetter_ID numeric(10,0);
ALTER TABLE C_Invoice ADD CONSTRAINT lardocumentletter_cinvoice FOREIGN KEY (LAR_DocumentLetter_ID)
    REFERENCES LAR_DocumentLetter (LAR_DocumentLetter_ID);
ALTER TABLE C_Invoice ADD COLUMN C_POS_ID numeric(10,0);
ALTER TABLE C_Invoice ADD CONSTRAINT cpos_cinvoice FOREIGN KEY (C_POS_ID)
    REFERENCES C_POS (C_POS_ID);
