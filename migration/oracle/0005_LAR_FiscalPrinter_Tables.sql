/*
 * Table for fiscal printer type configuration
 */
CREATE TABLE lar_fiscal_printer_type (
    lar_fiscal_printer_type_id number(10) NOT NULL,
    ad_client_id number(10) NOT NULL,
    ad_org_id number(10) NOT NULL,
    isactive character(1) DEFAULT 'Y' NOT NULL,
    created timestamp  DEFAULT sysdate  NOT NULL,
    createdby number(10) NOT NULL,
    updated timestamp  DEFAULT sysdate  NOT NULL,
    updatedby number(10) NOT NULL,
    name varchar2(100) NOT NULL,
    description varchar2(200),
    parameters varchar2(500),
    clazz varchar2(100) NOT NULL
);


ALTER TABLE lar_fiscal_printer_type
    ADD CONSTRAINT lar_fiscal_printer_type_key PRIMARY KEY (lar_fiscal_printer_type_id);

/*
 * Table for fiscal printer spooler configuration
 */
CREATE TABLE lar_fiscal_printer (
    lar_fiscal_printer_id number(10) NOT NULL,
    ad_client_id number(10) NOT NULL,
    ad_org_id number(10) NOT NULL,
    isactive character(1) DEFAULT 'Y' NOT NULL,
    created timestamp  DEFAULT sysdate  NOT NULL,
    createdby number(10) NOT NULL,
    updated timestamp  DEFAULT sysdate  NOT NULL,
    updatedby number(10) NOT NULL,
    lar_fiscal_printer_type_id number(10) NOT NULL,
    name varchar2(100),
    description varchar2(200),
    host varchar2(100) NOT NULL,
    port number(10) NOT NULL,
    status varchar2(3),
    usedby_id number(10),
    operation_date timestamp ,
    isremote character(1) DEFAULT 'N' NOT NULL,
    onprintproductformat varchar2(2) DEFAULT 'NV' NOT NULL,
    onprintuseproductreference character(1) DEFAULT 'N' NOT NULL
);


ALTER TABLE lar_fiscal_printer
    ADD CONSTRAINT lar_fiscal_printer_key PRIMARY KEY (lar_fiscal_printer_id);

ALTER TABLE lar_fiscal_printer
    ADD CONSTRAINT larfptype_larfp FOREIGN KEY (lar_fiscal_printer_type_id)
    REFERENCES lar_fiscal_printer_type(lar_fiscal_printer_type_id)  DEFERRABLE INITIALLY DEFERRED;

