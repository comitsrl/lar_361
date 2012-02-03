
CREATE TABLE lar_paymentwithholding  (
	ad_client_id             	numeric(10,0) NOT NULL,
	ad_org_id                	numeric(10,0) NOT NULL,
	created                  	timestamp NOT NULL,
	createdby                	numeric(10,0) NOT NULL,
	updated                  	timestamp NOT NULL,
	updatedby                	numeric(10,0) NOT NULL,
	isactive                 	char(1) NOT NULL DEFAULT 'Y'::bpchar,
	lar_paymentwithholding_id	numeric(10,0) NOT NULL,
	c_invoice_id             	numeric(10,0) NOT NULL,
	c_payment_id             	numeric(10,0) NOT NULL,
	c_tax_id                 	numeric(10,0) NULL DEFAULT NULL::numeric,
	dateacct                 	timestamp NULL,
	datetrx                  	timestamp NULL,
	lco_withholdingrule_id   	numeric(10,0) NULL DEFAULT NULL::numeric,
	lco_withholdingtype_id   	numeric(10,0) NOT NULL,
	percent                  	numeric NULL,
	processed                	char(1) NOT NULL DEFAULT 'N'::bpchar,
	taxamt                   	numeric NOT NULL,
	taxbaseamt               	numeric NOT NULL,
	PRIMARY KEY(lar_paymentwithholding_id)
);

ALTER TABLE adempiere.lar_paymentwithholding
	ADD CONSTRAINT lar_paymentwithholding_processed_check
	CHECK (processed = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]));

ALTER TABLE adempiere.lar_paymentwithholding
	ADD CONSTRAINT lar_paymentwithholding_isactive_check
	CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]));

ALTER TABLE adempiere.lar_paymentwithholding
	ADD CONSTRAINT lcowithholdingtype_larpaymentw
	FOREIGN KEY(lco_withholdingtype_id)
	REFERENCES adempiere.lco_withholdingtype(lco_withholdingtype_id)
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION;

ALTER TABLE adempiere.lar_paymentwithholding
	ADD CONSTRAINT lcowithholdingrule_larpaymentw
	FOREIGN KEY(lco_withholdingrule_id)
	REFERENCES adempiere.lco_withholdingrule(lco_withholdingrule_id)
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION;

ALTER TABLE adempiere.lar_paymentwithholding
	ADD CONSTRAINT ctax_larpaymentwithholding
	FOREIGN KEY(c_tax_id)
	REFERENCES adempiere.c_tax(c_tax_id)
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION;

ALTER TABLE adempiere.lar_paymentwithholding
	ADD CONSTRAINT cinvoice_larpaymentwithholding
	FOREIGN KEY(c_invoice_id)
	REFERENCES adempiere.c_invoice(c_invoice_id)
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION;

ALTER TABLE adempiere.lar_paymentwithholding
	ADD CONSTRAINT cpayment_larpaymentwithholding
	FOREIGN KEY(c_payment_id)
	REFERENCES adempiere.c_payment(c_payment_id)
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION;
