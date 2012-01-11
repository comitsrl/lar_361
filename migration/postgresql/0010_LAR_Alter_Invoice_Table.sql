ALTER TABLE c_invoice ADD COLUMN isfiscalprinted character(1) NOT NULL DEFAULT 'N';
ALTER TABLE c_invoice ADD COLUMN fiscalreceiptnumber character varying(30);
ALTER TABLE c_invoice ADD COLUMN cai character varying(14);
ALTER TABLE c_invoice ADD COLUMN caidate timestamp without time zone;
