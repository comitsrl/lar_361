CREATE TABLE lar_withholdingcertificate  (
	ad_client_id                 	number(10,0) NOT NULL,
	ad_org_id                    	number(10,0) NOT NULL,
	created                      	timestamp NOT NULL,
	createdby                    	number(10,0) NULL,
	updated                      	timestamp NOT NULL,
	updatedby                    	number(10,0) NOT NULL,
	isactive                     	char(1) NOT NULL,
	lar_withholdingcertificate_id	number(10,0) NOT NULL,
	documentno                   	varchar(30) NOT NULL,
	c_invoice_id                 	number(10,0) NOT NULL,
	c_payment_id                 	number(10,0) NOT NULL,
	c_doctype_id                 	number(10,0) NULL,
	c_doctypetarget_id           	number(10,0) NULL,
	PRIMARY KEY(lar_withholdingcertificate_id)
);

ALTER TABLE lar_withholdingcertificate
	ADD CONSTRAINT whc_active_ck
	CHECK (isactive IN ('Y', 'N'));

ALTER TABLE lar_withholdingcertificate
	ADD CONSTRAINT whc_payment_fkx
	FOREIGN KEY(c_payment_id)
	REFERENCES c_payment(c_payment_id);

ALTER TABLE lar_withholdingcertificate
	ADD CONSTRAINT whc_invoice_fkx
	FOREIGN KEY(c_invoice_id)
	REFERENCES c_invoice(c_invoice_id);

ALTER TABLE lar_withholdingcertificate
	ADD CONSTRAINT whc_doctype_fkx
	FOREIGN KEY(c_doctype_id)
	REFERENCES c_doctype(c_doctype_id);

ALTER TABLE lar_withholdingcertificate
	ADD CONSTRAINT whc_doctypetarget_fkx
	FOREIGN KEY(c_doctypetarget_id)
	REFERENCES c_doctype(c_doctype_id);
