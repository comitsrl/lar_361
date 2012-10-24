
CREATE TABLE lar_orderperception
(
  lar_orderperception_id number(10,0) NOT NULL,
  ad_client_id number(10,0) NOT NULL,
  ad_org_id number(10,0) NOT NULL,
  created timestamp NOT NULL,
  createdby number(10,0) NOT NULL,
  updated timestamp NOT NULL,
  updatedby number(10,0) NOT NULL,
  isactive character(1) DEFAULT 'Y' NOT NULL,
  c_order_id number(10,0) NOT NULL,
  c_tax_id number(10,0) DEFAULT NULL,
  lco_withholdingrule_id number(10,0) DEFAULT NULL,
  lco_withholdingtype_id number(10,0) NOT NULL,
  --c_allocationline_id number(10,0) DEFAULT NULL,
  dateacct timestamp,
  datetrx timestamp,
  iscalconpayment character(1) DEFAULT 'N',
  istaxincluded character(1) DEFAULT 'N' NOT NULL,
  percent number,
  processed character(1) DEFAULT 'N' NOT NULL,
  taxamt number NOT NULL,
  taxbaseamt number NOT NULL
);

ALTER TABLE lar_orderperception ADD
  CONSTRAINT lar_perception_key PRIMARY KEY (lar_orderperception_id);

ALTER TABLE lar_orderperception ADD
  CONSTRAINT corder_fkx FOREIGN KEY (c_order_id)
      REFERENCES c_order (c_order_id);

ALTER TABLE lar_orderperception ADD
  CONSTRAINT ctax_fkx FOREIGN KEY (c_tax_id)
      REFERENCES c_tax (c_tax_id);

ALTER TABLE lar_orderperception ADD
  CONSTRAINT whrule_fkx FOREIGN KEY (lco_withholdingrule_id)
      REFERENCES lco_withholdingrule (lco_withholdingrule_id);

ALTER TABLE lar_orderperception ADD
  CONSTRAINT whtype_fkx FOREIGN KEY (lco_withholdingtype_id)
      REFERENCES lco_withholdingtype (lco_withholdingtype_id);

ALTER TABLE lar_orderperception ADD
  CONSTRAINT op_active_ck CHECK (isactive IN ('Y', 'N'));

ALTER TABLE lar_orderperception ADD
  CONSTRAINT op_calc_ck CHECK (iscalconpayment IN ('Y', 'N'));

ALTER TABLE lar_orderperception ADD
  CONSTRAINT op_tax_ck CHECK (istaxincluded IN ('Y', 'N'));

ALTER TABLE lar_orderperception ADD
  CONSTRAINT op_processed_ck CHECK (processed IN ('Y', 'N'));
