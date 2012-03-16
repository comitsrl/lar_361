/*
 * Table for fiscal printer type configuration
 */
CREATE TABLE lar_fiscal_printer_type (
    lar_fiscal_printer_type_id numeric(10) NOT NULL,
    ad_client_id numeric(10) NOT NULL,
    ad_org_id numeric(10) NOT NULL,
    isactive character(1) DEFAULT 'Y'::bpchar NOT NULL,
    created timestamp without time zone DEFAULT ('now'::text)::timestamp(6) with time zone NOT NULL,
    createdby numeric(10) NOT NULL,
    updated timestamp without time zone DEFAULT ('now'::text)::timestamp(6) with time zone NOT NULL,
    updatedby numeric(10) NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200),
    parameters character varying(500),
    clazz character varying(100) NOT NULL
);


ALTER TABLE adempiere.lar_fiscal_printer_type OWNER TO adempiere;

ALTER TABLE ONLY lar_fiscal_printer_type 
    ADD CONSTRAINT lar_fiscal_printer_type_key PRIMARY KEY (lar_fiscal_printer_type_id);

/*
 * Table for fiscal printer spooler configuration
 */
CREATE TABLE lar_fiscal_printer (
    lar_fiscal_printer_id numeric(10) NOT NULL,
    ad_client_id numeric(10) NOT NULL,
    ad_org_id numeric(10) NOT NULL,
    isactive character(1) DEFAULT 'Y'::bpchar NOT NULL,
    created timestamp without time zone DEFAULT ('now'::text)::timestamp(6) with time zone NOT NULL,
    createdby numeric(10) NOT NULL,
    updated timestamp without time zone DEFAULT ('now'::text)::timestamp(6) with time zone NOT NULL,
    updatedby numeric(10) NOT NULL,
    lar_fiscal_printer_type_id numeric(10) NOT NULL,
    name character varying(100),
    description character varying(200),
    host character varying(100) NOT NULL,
    port numeric(10) NOT NULL,
    status character varying(3),
    usedby_id numeric(10),
    operation_date timestamp without time zone,
    isremote character(1) DEFAULT 'N'::bpchar NOT NULL,
    onprintproductformat character varying(2) DEFAULT 'NV'::character varying NOT NULL,
    onprintuseproductreference character(1) DEFAULT 'N'::bpchar NOT NULL
);


ALTER TABLE adempiere.lar_fiscal_printer OWNER TO adempiere;

ALTER TABLE ONLY lar_fiscal_printer 
    ADD CONSTRAINT lar_fiscal_printer_key PRIMARY KEY (lar_fiscal_printer_id);

ALTER TABLE ONLY lar_fiscal_printer 
    ADD CONSTRAINT larfiscalprintertype_larfiscalprinter FOREIGN KEY (lar_fiscal_printer_type_id) 
    REFERENCES lar_fiscal_printer_type(lar_fiscal_printer_type_id)  DEFERRABLE INITIALLY DEFERRED;

