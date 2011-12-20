ALTER TABLE c_doctype ADD COLUMN isfiscal character(1) NOT NULL DEFAULT 'N';
ALTER TABLE c_doctype ADD COLUMN isfiscaldocument character(1) NOT NULL DEFAULT 'N';
ALTER TABLE c_doctype ADD COLUMN fiscaldocument character(1);
ALTER TABLE c_doctype ADD COLUMN lar_fiscal_printer_id numeric(10,0);
ALTER TABLE c_doctype ADD COLUMN docsubtypecae character(2);
ALTER TABLE c_doctype ADD COLUMN docsubtypeinv character(2);
ALTER TABLE c_doctype ADD COLUMN iselectronic character(1) NOT NULL DEFAULT 'N';
ALTER TABLE c_doctype ADD CONSTRAINT larfiscalprinter_cdoctype FOREIGN KEY (lar_fiscal_printer_id)
    REFERENCES lar_fiscal_printer (lar_fiscal_printer_id) DEFERRABLE INITIALLY DEFERRED;
