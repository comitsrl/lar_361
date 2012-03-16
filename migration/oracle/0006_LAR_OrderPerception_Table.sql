
CREATE TABLE lar_orderperception
(
  lar_orderperception_id numeric(10,0) NOT NULL,
  ad_client_id numeric(10,0) NOT NULL,
  ad_org_id numeric(10,0) NOT NULL,
  created timestamp without time zone NOT NULL,
  createdby numeric(10,0) NOT NULL,
  updated timestamp without time zone NOT NULL,
  updatedby numeric(10,0) NOT NULL,
  isactive character(1) NOT NULL DEFAULT 'Y'::bpchar,
  c_order_id numeric(10,0) NOT NULL,
  c_tax_id numeric(10,0) DEFAULT NULL::numeric,
  lco_withholdingrule_id numeric(10,0) DEFAULT NULL::numeric,
  lco_withholdingtype_id numeric(10,0) NOT NULL,
  --c_allocationline_id numeric(10,0) DEFAULT NULL::numeric,
  dateacct timestamp without time zone,
  datetrx timestamp without time zone,
  iscalconpayment character(1) DEFAULT 'N'::bpchar,
  istaxincluded character(1) NOT NULL DEFAULT 'N'::bpchar,
  percent numeric,
  processed character(1) NOT NULL DEFAULT 'N'::bpchar,
  taxamt numeric NOT NULL,
  taxbaseamt numeric NOT NULL,

  CONSTRAINT lar_orderperception_key PRIMARY KEY (lar_orderperception_id),
  CONSTRAINT corder_larorderperception FOREIGN KEY (c_order_id)
      REFERENCES c_order (c_order_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT ctax_larorderperception FOREIGN KEY (c_tax_id)
      REFERENCES c_tax (c_tax_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lcowithholdingrule_lcoorderw FOREIGN KEY (lco_withholdingrule_id)
      REFERENCES lco_withholdingrule (lco_withholdingrule_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lcowithholdingtype_lcoorderw FOREIGN KEY (lco_withholdingtype_id)
      REFERENCES lco_withholdingtype (lco_withholdingtype_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lar_orderperception_isactive_check CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])),
  CONSTRAINT lar_orderperception_iscalconpayment_check CHECK (iscalconpayment = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])),
  CONSTRAINT lar_orderperception_istaxincluded_check CHECK (istaxincluded = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])),
  CONSTRAINT lar_orderperception_processed_check CHECK (processed = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
)
