
CREATE TABLE lar_paymentwithholding  (
	ad_client_id             	number(10,0) NOT NULL,
	ad_org_id                	number(10,0) NOT NULL,
	created                  	timestamp NOT NULL,
	createdby                	number(10,0) NOT NULL,
	updated                  	timestamp NOT NULL,
	updatedby                	number(10,0) NOT NULL,
	isactive                 	char(1) DEFAULT 'Y' NOT NULL,
	lar_paymentwithholding_id	number(10,0) NOT NULL,
	c_invoice_id             	number(10,0) NOT NULL,
	c_payment_id             	number(10,0) NOT NULL,
	c_tax_id                 	number(10,0) NULL,
	dateacct                 	timestamp NULL,
	datetrx                  	timestamp NULL,
	lco_withholdingrule_id   	number(10,0) NULL,
	lco_withholdingtype_id   	number(10,0) NOT NULL,
	percent                  	number NULL,
	processed                	char(1) DEFAULT 'N' NOT NULL,
	taxamt                   	number NOT NULL,
	taxbaseamt               	number NOT NULL,
	PRIMARY KEY(lar_paymentwithholding_id)
);

ALTER TABLE adempiere.lar_paymentwithholding
	ADD CONSTRAINT pwh_processed_ck
	CHECK (processed IN ('Y', 'N'));

ALTER TABLE adempiere.lar_paymentwithholding
	ADD CONSTRAINT pwh_active_ck
	CHECK (isactive IN ('Y', 'N'));

ALTER TABLE adempiere.lar_paymentwithholding
	ADD CONSTRAINT pwh_type_fkx
	FOREIGN KEY(lco_withholdingtype_id)
	REFERENCES adempiere.lco_withholdingtype(lco_withholdingtype_id);

ALTER TABLE adempiere.lar_paymentwithholding
	ADD CONSTRAINT pwh_rule_fkx
	FOREIGN KEY(lco_withholdingrule_id)
	REFERENCES adempiere.lco_withholdingrule(lco_withholdingrule_id);

ALTER TABLE adempiere.lar_paymentwithholding
	ADD CONSTRAINT pwh_tax_fkx
	FOREIGN KEY(c_tax_id)
	REFERENCES adempiere.c_tax(c_tax_id);

ALTER TABLE adempiere.lar_paymentwithholding
	ADD CONSTRAINT pwh_invoice_fkx
	FOREIGN KEY(c_invoice_id)
	REFERENCES adempiere.c_invoice(c_invoice_id);

ALTER TABLE adempiere.lar_paymentwithholding
	ADD CONSTRAINT pwh_pay_fkx
	FOREIGN KEY(c_payment_id)
	REFERENCES adempiere.c_payment(c_payment_id);
