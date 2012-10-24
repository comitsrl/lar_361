ALTER TABLE C_Invoice ADD IsFiscalPrinted character(1) DEFAULT 'N' NOT NULL;
ALTER TABLE C_Invoice ADD FiscalReceiptNumber character varying(30);
ALTER TABLE C_Invoice ADD CAI character varying(14);
ALTER TABLE C_Invoice ADD CAIDate timestamp;

ALTER TABLE C_Invoice ADD LAR_DocumentLetter_ID numeric(10,0);
ALTER TABLE C_Invoice ADD CONSTRAINT iv_letter_fkx FOREIGN KEY (LAR_DocumentLetter_ID)
    REFERENCES LAR_DocumentLetter (LAR_DocumentLetter_ID);
ALTER TABLE C_Invoice ADD C_POS_ID numeric(10,0);
ALTER TABLE C_Invoice ADD CONSTRAINT iv_pos_fkx FOREIGN KEY (C_POS_ID)
    REFERENCES C_POS (C_POS_ID);
