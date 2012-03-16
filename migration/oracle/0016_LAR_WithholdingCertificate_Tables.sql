CREATE TABLE adempiere.lar_withholdingcertificate  (
	ad_client_id                 	numeric(10,0) NOT NULL,
	ad_org_id                    	numeric(10,0) NOT NULL,
	created                      	timestamp NOT NULL,
	createdby                    	numeric(10,0) NULL,
	updated                      	timestamp NOT NULL,
	updatedby                    	numeric(10,0) NOT NULL,
	isactive                     	char(1) NOT NULL,
	lar_withholdingcertificate_id	numeric(10,0) NOT NULL,
	documentno                   	varchar(30) NOT NULL,
	c_invoice_id                 	numeric(10,0) NOT NULL,
	c_payment_id                 	numeric(10,0) NOT NULL,
	c_doctype_id                 	numeric(10,0) NULL,
	c_doctypetarget_id           	numeric(10,0) NULL,
	PRIMARY KEY(lar_withholdingcertificate_id)
);

ALTER TABLE adempiere.lar_withholdingcertificate
	ADD CONSTRAINT lar_withholdingcertificate_isactive_check
	CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]));

ALTER TABLE adempiere.lar_withholdingcertificate
	ADD CONSTRAINT cpayment_larwithholdingcertificate
	FOREIGN KEY(c_payment_id)
	REFERENCES adempiere.c_payment(c_payment_id)
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION;

ALTER TABLE adempiere.lar_withholdingcertificate
	ADD CONSTRAINT cinvoice_larwithholdingcertificate
	FOREIGN KEY(c_invoice_id)
	REFERENCES adempiere.c_invoice(c_invoice_id)
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION;

ALTER TABLE adempiere.lar_withholdingcertificate
	ADD CONSTRAINT cdoctype_larwithholdingcertificate
	FOREIGN KEY(c_doctype_id)
	REFERENCES adempiere.c_doctype(c_doctype_id)
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION;

ALTER TABLE adempiere.lar_withholdingcertificate
	ADD CONSTRAINT cdoctypetarget_larwithholdingcertificate
	FOREIGN KEY(c_doctypetarget_id)
	REFERENCES adempiere.c_doctype(c_doctype_id)
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION;
