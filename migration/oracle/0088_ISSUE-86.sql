ALTER TABLE ad_orginfo ADD fecha_inicio_act Timestamp Without Time Zone
;

DROP VIEW ad_org_v
;

DROP VIEW rv_bpartner
;

DROP VIEW m_inout_header_v
;

DROP VIEW m_inout_header_vt
;

DROP VIEW dd_order_header_v
;

DROP VIEW dd_order_header_vt
;

DROP VIEW c_project_header_v
;

DROP VIEW c_project_header_vt
;

DROP VIEW c_payselection_check_v
;

DROP VIEW c_payselection_check_vt
;

DROP VIEW c_order_header_v
;

DROP VIEW c_order_header_vt
;

DROP VIEW c_invoice_header_v
;

DROP VIEW c_invoice_header_vt
;

DROP VIEW c_dunning_header_v
;

DROP VIEW c_dunning_header_vt
;

ALTER TABLE ad_orginfo ALTER COLUMN duns TYPE VARCHAR(16)
;

ALTER TABLE c_bpartner ALTER COLUMN duns TYPE VARCHAR(16)
;

CREATE OR REPLACE VIEW ad_org_v AS
 SELECT o.ad_client_id,
    o.ad_org_id,
    o.isactive,
    o.created,
    o.createdby,
    o.updated,
    o.updatedby,
    o.value,
    o.name,
    o.description,
    o.issummary,
    i.c_location_id,
    i.duns,
    i.taxid,
    i.supervisor_id,
    i.parent_org_id,
    i.ad_orgtype_id,
    i.m_warehouse_id,
    bp.c_bpartner_id
   FROM ad_org o
     JOIN ad_orginfo i ON o.ad_org_id = i.ad_org_id
     LEFT JOIN c_bpartner bp ON o.ad_org_id = bp.ad_orgbp_id
;

CREATE OR REPLACE VIEW rv_bpartner AS
 SELECT bp.ad_client_id,
    bp.ad_org_id,
    bp.isactive,
    bp.created,
    bp.createdby,
    bp.updated,
    bp.updatedby,
    bp.c_bpartner_id,
    bp.value,
    bp.name,
    bp.name2,
    bp.description,
    bp.issummary,
    bp.c_bp_group_id,
    bp.isonetime,
    bp.isprospect,
    bp.isvendor,
    bp.iscustomer,
    bp.isemployee,
    bp.issalesrep,
    bp.referenceno,
    bp.duns,
    bp.url,
    bp.ad_language,
    bp.taxid,
    bp.istaxexempt,
    bp.c_invoiceschedule_id,
    bp.rating,
    bp.salesvolume,
    bp.numberemployees,
    bp.naics,
    bp.firstsale,
    bp.acqusitioncost,
    bp.potentiallifetimevalue,
    bp.actuallifetimevalue,
    bp.shareofcustomer,
    bp.paymentrule,
    bp.so_creditlimit,
    bp.so_creditused,
    bp.so_creditused - bp.so_creditlimit AS so_creditavailable,
    bp.c_paymentterm_id,
    bp.m_pricelist_id,
    bp.m_discountschema_id,
    bp.c_dunning_id,
    bp.isdiscountprinted,
    bp.so_description,
    bp.poreference,
    bp.paymentrulepo,
    bp.po_pricelist_id,
    bp.po_discountschema_id,
    bp.po_paymentterm_id,
    bp.documentcopies,
    bp.c_greeting_id,
    bp.invoicerule,
    bp.deliveryrule,
    bp.freightcostrule,
    bp.deliveryviarule,
    bp.salesrep_id,
    bp.sendemail,
    bp.bpartner_parent_id,
    bp.invoice_printformat_id,
    bp.socreditstatus,
    bp.shelflifeminpct,
    bp.ad_orgbp_id,
    bp.flatdiscount,
    bp.totalopenbalance,
    c.ad_user_id,
    c.name AS contactname,
    c.description AS contactdescription,
    c.email,
    c.supervisor_id,
    c.emailuser,
    c.c_greeting_id AS bpcontactgreeting,
    c.title,
    c.comments,
    c.phone,
    c.phone2,
    c.fax,
    c.lastcontact,
    c.lastresult,
    c.birthday,
    c.ad_orgtrx_id,
    c.emailverify,
    c.ldapuser,
    c.emailverifydate,
    c.notificationtype,
    l.c_bpartner_location_id,
    a.postal,
    a.city,
    a.address1,
    a.address2,
    a.address3,
    a.c_region_id,
    COALESCE(r.name, a.regionname) AS regionname,
    a.c_country_id,
    cc.name AS countryname
   FROM c_bpartner bp
     LEFT JOIN c_bpartner_location l ON bp.c_bpartner_id = l.c_bpartner_id AND l.isactive = 'Y'::bpchar
     LEFT JOIN ad_user c ON bp.c_bpartner_id = c.c_bpartner_id AND (c.c_bpartner_location_id IS NULL OR c.c_bpartner_location_id = l.c_bpartner_location_id) AND c.isactive = 'Y'::bpchar
     LEFT JOIN c_location a ON l.c_location_id = a.c_location_id
     LEFT JOIN c_region r ON a.c_region_id = r.c_region_id
     JOIN c_country cc ON a.c_country_id = cc.c_country_id
;

CREATE OR REPLACE VIEW m_inout_header_v AS
 SELECT io.ad_client_id,
    io.ad_org_id,
    io.isactive,
    io.created,
    io.createdby,
    io.updated,
    io.updatedby,
    'en_US'::character varying AS ad_language,
    io.m_inout_id,
    io.issotrx,
    io.documentno,
    io.docstatus,
    io.c_doctype_id,
    io.c_bpartner_id,
    bp.value AS bpvalue,
    bp.taxid AS bptaxid,
    bp.naics,
    bp.duns,
    oi.c_location_id AS org_location_id,
    oi.taxid,
    io.m_warehouse_id,
    wh.c_location_id AS warehouse_location_id,
    dt.printname AS documenttype,
    dt.documentnote AS documenttypenote,
    io.c_order_id,
    io.movementdate,
    io.movementtype,
    bpg.greeting AS bpgreeting,
    bp.name,
    bp.name2,
    bpcg.greeting AS bpcontactgreeting,
    bpc.title,
    bpc.phone,
    NULLIF(bpc.name::text, bp.name::text) AS contactname,
    bpl.c_location_id,
    l.postal::text || l.postal_add::text AS postal,
    bp.referenceno,
    io.description,
    io.poreference,
    io.dateordered,
    io.volume,
    io.weight,
    io.m_shipper_id,
    io.deliveryrule,
    io.deliveryviarule,
    io.priorityrule,
    COALESCE(oi.logo_id, ci.logo_id) AS logo_id
   FROM m_inout io
     JOIN c_doctype dt ON io.c_doctype_id = dt.c_doctype_id
     JOIN c_bpartner bp ON io.c_bpartner_id = bp.c_bpartner_id
     LEFT JOIN c_greeting bpg ON bp.c_greeting_id = bpg.c_greeting_id
     JOIN c_bpartner_location bpl ON io.c_bpartner_location_id = bpl.c_bpartner_location_id
     JOIN c_location l ON bpl.c_location_id = l.c_location_id
     LEFT JOIN ad_user bpc ON io.ad_user_id = bpc.ad_user_id
     LEFT JOIN c_greeting bpcg ON bpc.c_greeting_id = bpcg.c_greeting_id
     JOIN ad_orginfo oi ON io.ad_org_id = oi.ad_org_id
     JOIN ad_clientinfo ci ON io.ad_client_id = ci.ad_client_id
     JOIN m_warehouse wh ON io.m_warehouse_id = wh.m_warehouse_id
;

CREATE OR REPLACE VIEW m_inout_header_vt AS
 SELECT io.ad_client_id,
    io.ad_org_id,
    io.isactive,
    io.created,
    io.createdby,
    io.updated,
    io.updatedby,
    dt.ad_language,
    io.m_inout_id,
    io.issotrx,
    io.documentno,
    io.docstatus,
    io.c_doctype_id,
    io.c_bpartner_id,
    bp.value AS bpvalue,
    bp.taxid AS bptaxid,
    bp.naics,
    bp.duns,
    oi.c_location_id AS org_location_id,
    oi.taxid,
    io.m_warehouse_id,
    wh.c_location_id AS warehouse_location_id,
    dt.printname AS documenttype,
    dt.documentnote AS documenttypenote,
    io.c_order_id,
    bpc.phone,
    io.movementdate,
    io.movementtype,
    bpg.greeting AS bpgreeting,
    bp.name,
    bp.name2,
    bpcg.greeting AS bpcontactgreeting,
    bpc.title,
    NULLIF(bpc.name::text, bp.name::text) AS contactname,
    bpl.c_location_id,
    l.postal::text || l.postal_add::text AS postal,
    bp.referenceno,
    io.description,
    io.poreference,
    io.dateordered,
    io.volume,
    io.weight,
    io.m_shipper_id,
    io.deliveryrule,
    io.deliveryviarule,
    io.priorityrule,
    COALESCE(oi.logo_id, ci.logo_id) AS logo_id
   FROM m_inout io
     JOIN c_doctype_trl dt ON io.c_doctype_id = dt.c_doctype_id
     JOIN c_bpartner bp ON io.c_bpartner_id = bp.c_bpartner_id
     LEFT JOIN c_greeting_trl bpg ON bp.c_greeting_id = bpg.c_greeting_id AND dt.ad_language::text = bpg.ad_language::text
     JOIN c_bpartner_location bpl ON io.c_bpartner_location_id = bpl.c_bpartner_location_id
     JOIN c_location l ON bpl.c_location_id = l.c_location_id
     LEFT JOIN ad_user bpc ON io.ad_user_id = bpc.ad_user_id
     LEFT JOIN c_greeting_trl bpcg ON bpc.c_greeting_id = bpcg.c_greeting_id AND dt.ad_language::text = bpcg.ad_language::text
     JOIN ad_orginfo oi ON io.ad_org_id = oi.ad_org_id
     JOIN ad_clientinfo ci ON io.ad_client_id = ci.ad_client_id
     JOIN m_warehouse wh ON io.m_warehouse_id = wh.m_warehouse_id
;

CREATE OR REPLACE VIEW dd_order_header_v AS
 SELECT o.ad_client_id,
    o.ad_org_id,
    o.isactive,
    o.created,
    o.createdby,
    o.updated,
    o.updatedby,
    'en_US'::character varying AS ad_language,
    o.dd_order_id,
    o.c_order_id,
    o.issotrx,
    o.documentno,
    o.docstatus,
    o.c_doctype_id,
    o.c_bpartner_id,
    bp.value AS bpvalue,
    bp.taxid AS bptaxid,
    bp.naics,
    bp.duns,
    oi.c_location_id AS org_location_id,
    oi.taxid,
    o.m_warehouse_id,
    wh.c_location_id AS warehouse_location_id,
    dt.printname AS documenttype,
    dt.documentnote AS documenttypenote,
    o.salesrep_id,
    COALESCE(ubp.name, u.name) AS salesrep_name,
    o.dateordered,
    o.datepromised,
    bpg.greeting AS bpgreeting,
    bp.name,
    bp.name2,
    bpcg.greeting AS bpcontactgreeting,
    bpc.title,
    bpc.phone,
    NULLIF(bpc.name::text, bp.name::text) AS contactname,
    bpl.c_location_id,
    l.postal::text || l.postal_add::text AS postal,
    bp.referenceno,
    o.description,
    o.poreference,
    o.c_charge_id,
    o.chargeamt,
    o.volume,
    o.weight,
    o.c_campaign_id,
    o.c_project_id,
    o.c_activity_id,
    o.m_shipper_id,
    o.deliveryrule,
    o.deliveryviarule,
    o.priorityrule,
    COALESCE(oi.logo_id, ci.logo_id) AS logo_id
   FROM dd_order o
     JOIN c_doctype dt ON o.c_doctype_id = dt.c_doctype_id
     JOIN m_warehouse wh ON o.m_warehouse_id = wh.m_warehouse_id
     JOIN c_bpartner bp ON o.c_bpartner_id = bp.c_bpartner_id
     LEFT JOIN c_greeting bpg ON bp.c_greeting_id = bpg.c_greeting_id
     JOIN c_bpartner_location bpl ON o.c_bpartner_location_id = bpl.c_bpartner_location_id
     JOIN c_location l ON bpl.c_location_id = l.c_location_id
     LEFT JOIN ad_user bpc ON o.ad_user_id = bpc.ad_user_id
     LEFT JOIN c_greeting bpcg ON bpc.c_greeting_id = bpcg.c_greeting_id
     JOIN ad_orginfo oi ON o.ad_org_id = oi.ad_org_id
     JOIN ad_clientinfo ci ON o.ad_client_id = ci.ad_client_id
     LEFT JOIN ad_user u ON o.salesrep_id = u.ad_user_id
     LEFT JOIN c_bpartner ubp ON u.c_bpartner_id = ubp.c_bpartner_id
;

CREATE OR REPLACE VIEW dd_order_header_vt AS
 SELECT o.ad_client_id,
    o.ad_org_id,
    o.isactive,
    o.created,
    o.createdby,
    o.updated,
    o.updatedby,
    dt.ad_language,
    o.dd_order_id,
    o.c_order_id,
    o.issotrx,
    o.documentno,
    o.docstatus,
    o.c_doctype_id,
    o.c_bpartner_id,
    bp.value AS bpvalue,
    bp.taxid AS bptaxid,
    bp.naics,
    bp.duns,
    oi.c_location_id AS org_location_id,
    oi.taxid,
    o.m_warehouse_id,
    wh.c_location_id AS warehouse_location_id,
    dt.printname AS documenttype,
    dt.documentnote AS documenttypenote,
    o.salesrep_id,
    COALESCE(ubp.name, u.name) AS salesrep_name,
    o.dateordered,
    o.datepromised,
    bpg.greeting AS bpgreeting,
    bp.name,
    bp.name2,
    bpcg.greeting AS bpcontactgreeting,
    bpc.title,
    bpc.phone,
    NULLIF(bpc.name::text, bp.name::text) AS contactname,
    bpl.c_location_id,
    l.postal::text || l.postal_add::text AS postal,
    bp.referenceno,
    o.description,
    o.poreference,
    o.c_charge_id,
    o.chargeamt,
    o.volume,
    o.weight,
    o.c_campaign_id,
    o.c_project_id,
    o.c_activity_id,
    o.m_shipper_id,
    o.deliveryrule,
    o.deliveryviarule,
    o.priorityrule,
    COALESCE(oi.logo_id, ci.logo_id) AS logo_id
   FROM dd_order o
     JOIN c_doctype_trl dt ON o.c_doctype_id = dt.c_doctype_id
     JOIN m_warehouse wh ON o.m_warehouse_id = wh.m_warehouse_id
     JOIN c_bpartner bp ON o.c_bpartner_id = bp.c_bpartner_id
     LEFT JOIN c_greeting_trl bpg ON bp.c_greeting_id = bpg.c_greeting_id AND dt.ad_language::text = bpg.ad_language::text
     JOIN c_bpartner_location bpl ON o.c_bpartner_location_id = bpl.c_bpartner_location_id
     JOIN c_location l ON bpl.c_location_id = l.c_location_id
     LEFT JOIN ad_user bpc ON o.ad_user_id = bpc.ad_user_id
     LEFT JOIN c_greeting_trl bpcg ON bpc.c_greeting_id = bpcg.c_greeting_id AND dt.ad_language::text = bpcg.ad_language::text
     JOIN ad_orginfo oi ON o.ad_org_id = oi.ad_org_id
     JOIN ad_clientinfo ci ON o.ad_client_id = ci.ad_client_id
     LEFT JOIN ad_user u ON o.salesrep_id = u.ad_user_id
     LEFT JOIN c_bpartner ubp ON u.c_bpartner_id = ubp.c_bpartner_id
;

CREATE OR REPLACE VIEW c_project_header_v AS
 SELECT p.ad_client_id,
    p.ad_org_id,
    p.isactive,
    p.created,
    p.createdby,
    p.updated,
    p.updatedby,
    'en_US'::character varying AS ad_language,
    p.c_project_id,
    p.value,
    p.name AS projectname,
    p.description,
    p.note,
    p.issummary,
    p.projectcategory,
    oi.c_location_id AS org_location_id,
    oi.taxid,
    p.c_projecttype_id,
    pjt.name AS projecttypename,
    p.c_phase_id,
    pjp.name AS projectphasename,
    p.salesrep_id,
    COALESCE(ubp.name, u.name) AS salesrep_name,
    p.c_bpartner_id,
    bp.value AS bpvalue,
    bp.taxid AS bptaxid,
    bp.naics,
    bp.duns,
    bpg.greeting AS bpgreeting,
    bp.name,
    bp.name2,
    bpcg.greeting AS bpcontactgreeting,
    bpc.title,
    bpc.phone,
    NULLIF(bpc.name::text, bp.name::text) AS contactname,
    bpl.c_location_id,
    bp.referenceno,
    pt.name AS paymentterm,
    pt.documentnote AS paymenttermnote,
    p.poreference,
    p.c_currency_id,
    p.m_pricelist_version_id,
    p.c_campaign_id,
    p.plannedamt,
    p.plannedqty,
    p.plannedmarginamt,
    p.invoicedamt,
    p.invoicedqty,
    p.projectbalanceamt,
    p.iscommitment,
    p.committedamt,
    p.committedqty,
    p.datecontract,
    p.datefinish,
    p.iscommitceiling,
    p.m_warehouse_id,
    COALESCE(oi.logo_id, ci.logo_id) AS logo_id
   FROM c_project p
     LEFT JOIN c_bpartner bp ON p.c_bpartner_id = bp.c_bpartner_id
     JOIN ad_orginfo oi ON p.ad_org_id = oi.ad_org_id
     JOIN ad_clientinfo ci ON p.ad_client_id = ci.ad_client_id
     LEFT JOIN c_projecttype pjt ON p.c_projecttype_id = pjt.c_projecttype_id
     LEFT JOIN c_phase pjp ON p.c_phase_id = pjp.c_phase_id
     LEFT JOIN ad_user u ON p.salesrep_id = u.ad_user_id
     LEFT JOIN c_bpartner ubp ON u.c_bpartner_id = ubp.c_bpartner_id
     LEFT JOIN c_greeting bpg ON bp.c_greeting_id = bpg.c_greeting_id
     LEFT JOIN ad_user bpc ON p.ad_user_id = bpc.ad_user_id
     LEFT JOIN c_greeting bpcg ON bpc.c_greeting_id = bpcg.c_greeting_id
     LEFT JOIN c_bpartner_location bpl ON p.c_bpartner_location_id = bpl.c_bpartner_location_id
     LEFT JOIN c_paymentterm pt ON p.c_paymentterm_id = pt.c_paymentterm_id
;

CREATE OR REPLACE VIEW c_project_header_vt AS
 SELECT p.ad_client_id,
    p.ad_org_id,
    p.isactive,
    p.created,
    p.createdby,
    p.updated,
    p.updatedby,
    pt.ad_language,
    p.c_project_id,
    p.value,
    p.name AS projectname,
    p.description,
    p.note,
    p.issummary,
    p.projectcategory,
    oi.c_location_id AS org_location_id,
    oi.taxid,
    p.c_projecttype_id,
    pjt.name AS projecttypename,
    p.c_phase_id,
    pjp.name AS projectphasename,
    p.salesrep_id,
    COALESCE(ubp.name, u.name) AS salesrep_name,
    p.c_bpartner_id,
    bp.value AS bpvalue,
    bp.taxid AS bptaxid,
    bp.naics,
    bp.duns,
    bpg.greeting AS bpgreeting,
    bp.name,
    bp.name2,
    bpcg.greeting AS bpcontactgreeting,
    bpc.title,
    bpc.phone,
    NULLIF(bpc.name::text, bp.name::text) AS contactname,
    bpl.c_location_id,
    bp.referenceno,
    pt.name AS paymentterm,
    pt.documentnote AS paymenttermnote,
    p.poreference,
    p.c_currency_id,
    p.m_pricelist_version_id,
    p.c_campaign_id,
    p.plannedamt,
    p.plannedqty,
    p.plannedmarginamt,
    p.invoicedamt,
    p.invoicedqty,
    p.projectbalanceamt,
    p.iscommitment,
    p.committedamt,
    p.committedqty,
    p.datecontract,
    p.datefinish,
    p.iscommitceiling,
    p.m_warehouse_id,
    COALESCE(oi.logo_id, ci.logo_id) AS logo_id
   FROM c_project p
     LEFT JOIN c_bpartner bp ON p.c_bpartner_id = bp.c_bpartner_id
     JOIN ad_orginfo oi ON p.ad_org_id = oi.ad_org_id
     JOIN ad_clientinfo ci ON p.ad_client_id = ci.ad_client_id
     LEFT JOIN c_paymentterm_trl pt ON p.c_paymentterm_id = pt.c_paymentterm_id
     LEFT JOIN c_projecttype pjt ON p.c_projecttype_id = pjt.c_projecttype_id
     LEFT JOIN c_phase pjp ON p.c_phase_id = pjp.c_phase_id
     LEFT JOIN ad_user u ON p.salesrep_id = u.ad_user_id
     LEFT JOIN c_bpartner ubp ON u.c_bpartner_id = ubp.c_bpartner_id
     LEFT JOIN c_greeting bpg ON bp.c_greeting_id = bpg.c_greeting_id
     LEFT JOIN ad_user bpc ON p.ad_user_id = bpc.ad_user_id
     LEFT JOIN c_greeting bpcg ON bpc.c_greeting_id = bpcg.c_greeting_id
     LEFT JOIN c_bpartner_location bpl ON p.c_bpartner_location_id = bpl.c_bpartner_location_id
;

CREATE OR REPLACE VIEW c_payselection_check_v AS
 SELECT psc.ad_client_id,
    psc.ad_org_id,
    'en_US'::character varying AS ad_language,
    psc.c_payselection_id,
    psc.c_payselectioncheck_id,
    oi.c_location_id AS org_location_id,
    oi.taxid,
    p.c_doctype_id,
    p.tendertype,
    p.a_name,
    p.accountno,
    p.checkno,
    p.creditcardtype,
    p.creditcardnumber,
    p.micr,
    p.routingno,
    bp.c_bpartner_id,
    bp.value AS bpvalue,
    bp.taxid AS bptaxid,
    bp.naics,
    bp.duns,
    bpg.greeting AS bpgreeting,
    bp.name,
    bp.name2,
    bpartnerremitlocation(bp.c_bpartner_id) AS c_location_id,
    bp.referenceno,
    bp.poreference,
    ps.paydate,
    psc.payamt,
    psc.payamt AS amtinwords,
    psc.qty,
    psc.paymentrule,
    psc.documentno,
    COALESCE(oi.logo_id, ci.logo_id) AS logo_id,
    dt.printname AS documenttype,
    dt.documentnote AS documenttypenote,
    p.description,
    ba.description AS bankaccountdescription
   FROM c_payselectioncheck psc
     JOIN c_payselection ps ON psc.c_payselection_id = ps.c_payselection_id
     LEFT JOIN c_payment p ON psc.c_payment_id = p.c_payment_id
     LEFT JOIN c_bankaccount ba ON p.c_bankaccount_id = ba.c_bankaccount_id
     LEFT JOIN c_doctype dt ON p.c_doctype_id = dt.c_doctype_id
     JOIN c_bpartner bp ON psc.c_bpartner_id = bp.c_bpartner_id
     LEFT JOIN c_greeting bpg ON bp.c_greeting_id = bpg.c_greeting_id
     JOIN ad_orginfo oi ON psc.ad_org_id = oi.ad_org_id
     JOIN ad_clientinfo ci ON psc.ad_client_id = ci.ad_client_id
;

CREATE OR REPLACE VIEW c_payselection_check_vt AS
 SELECT psc.ad_client_id,
    psc.ad_org_id,
    l.ad_language,
    psc.c_payselection_id,
    psc.c_payselectioncheck_id,
    oi.c_location_id AS org_location_id,
    oi.taxid,
    p.c_doctype_id,
    p.tendertype,
    p.a_name,
    p.accountno,
    p.checkno,
    p.creditcardtype,
    p.creditcardnumber,
    p.micr,
    p.routingno,
    bp.c_bpartner_id,
    bp.value AS bpvalue,
    bp.taxid AS bptaxid,
    bp.naics,
    bp.duns,
    bpg.greeting AS bpgreeting,
    bp.name,
    bp.name2,
    bpartnerremitlocation(bp.c_bpartner_id) AS c_location_id,
    bp.referenceno,
    bp.poreference,
    ps.paydate,
    psc.payamt,
    psc.payamt AS amtinwords,
    psc.qty,
    psc.paymentrule,
    psc.documentno,
    COALESCE(oi.logo_id, ci.logo_id) AS logo_id,
    dt.printname AS documenttype,
    dt.documentnote AS documenttypenote,
    p.description,
    ba.description AS bankaccountdescription
   FROM c_payselectioncheck psc
     JOIN c_payselection ps ON psc.c_payselection_id = ps.c_payselection_id
     LEFT JOIN c_payment p ON psc.c_payment_id = p.c_payment_id
     LEFT JOIN c_bankaccount ba ON p.c_bankaccount_id = ba.c_bankaccount_id
     LEFT JOIN c_doctype_trl dt ON p.c_doctype_id = dt.c_doctype_id
     JOIN c_bpartner bp ON psc.c_bpartner_id = bp.c_bpartner_id
     JOIN ad_orginfo oi ON psc.ad_org_id = oi.ad_org_id
     JOIN ad_clientinfo ci ON psc.ad_client_id = ci.ad_client_id
     LEFT JOIN ad_language l ON l.issystemlanguage = 'Y'::bpchar
     LEFT JOIN c_greeting_trl bpg ON bp.c_greeting_id = bpg.c_greeting_id AND bpg.ad_language::text = l.ad_language::text
;

CREATE OR REPLACE VIEW c_order_header_v AS
 SELECT o.ad_client_id,
    o.ad_org_id,
    o.isactive,
    o.created,
    o.createdby,
    o.updated,
    o.updatedby,
    'en_US'::character varying AS ad_language,
    o.c_order_id,
    o.issotrx,
    o.documentno,
    o.docstatus,
    o.c_doctype_id,
    o.c_bpartner_id,
    bp.value AS bpvalue,
    bp.taxid AS bptaxid,
    bp.naics,
    bp.duns,
    oi.c_location_id AS org_location_id,
    oi.taxid,
    o.m_warehouse_id,
    wh.c_location_id AS warehouse_location_id,
    dt.printname AS documenttype,
    dt.documentnote AS documenttypenote,
    o.salesrep_id,
    COALESCE(ubp.name, u.name) AS salesrep_name,
    o.dateordered,
    o.datepromised,
    bpg.greeting AS bpgreeting,
    bp.name,
    bp.name2,
    bpcg.greeting AS bpcontactgreeting,
    bpc.title,
    bpc.phone,
    NULLIF(bpc.name::text, bp.name::text) AS contactname,
    bpl.c_location_id,
    l.postal::text || l.postal_add::text AS postal,
    bp.referenceno,
    o.bill_bpartner_id,
    o.bill_location_id,
    o.bill_user_id,
    bbp.value AS bill_bpvalue,
    bbp.taxid AS bill_bptaxid,
    bbp.name AS bill_name,
    bbp.name2 AS bill_name2,
    bbpc.title AS bill_title,
    bbpc.phone AS bill_phone,
    NULLIF(bbpc.name::text, bbp.name::text) AS bill_contactname,
    bbpl.c_location_id AS bill_c_location_id,
    o.description,
    o.poreference,
    o.c_currency_id,
    pt.name AS paymentterm,
    pt.documentnote AS paymenttermnote,
    o.c_charge_id,
    o.chargeamt,
    o.totallines,
    o.grandtotal,
    o.grandtotal AS amtinwords,
    o.m_pricelist_id,
    o.istaxincluded,
    o.volume,
    o.weight,
    o.c_campaign_id,
    o.c_project_id,
    o.c_activity_id,
    o.m_shipper_id,
    o.deliveryrule,
    o.deliveryviarule,
    o.priorityrule,
    o.invoicerule,
    COALESCE(oi.logo_id, ci.logo_id) AS logo_id
   FROM c_order o
     JOIN c_doctype dt ON o.c_doctype_id = dt.c_doctype_id
     JOIN m_warehouse wh ON o.m_warehouse_id = wh.m_warehouse_id
     JOIN c_paymentterm pt ON o.c_paymentterm_id = pt.c_paymentterm_id
     JOIN c_bpartner bp ON o.c_bpartner_id = bp.c_bpartner_id
     LEFT JOIN c_greeting bpg ON bp.c_greeting_id = bpg.c_greeting_id
     JOIN c_bpartner_location bpl ON o.c_bpartner_location_id = bpl.c_bpartner_location_id
     JOIN c_location l ON bpl.c_location_id = l.c_location_id
     LEFT JOIN ad_user bpc ON o.ad_user_id = bpc.ad_user_id
     LEFT JOIN c_greeting bpcg ON bpc.c_greeting_id = bpcg.c_greeting_id
     JOIN ad_orginfo oi ON o.ad_org_id = oi.ad_org_id
     JOIN ad_clientinfo ci ON o.ad_client_id = ci.ad_client_id
     LEFT JOIN ad_user u ON o.salesrep_id = u.ad_user_id
     LEFT JOIN c_bpartner ubp ON u.c_bpartner_id = ubp.c_bpartner_id
     JOIN c_bpartner bbp ON o.bill_bpartner_id = bbp.c_bpartner_id
     JOIN c_bpartner_location bbpl ON o.bill_location_id = bbpl.c_bpartner_location_id
     LEFT JOIN ad_user bbpc ON o.bill_user_id = bbpc.ad_user_id
;

CREATE OR REPLACE VIEW c_order_header_vt AS
 SELECT o.ad_client_id,
    o.ad_org_id,
    o.isactive,
    o.created,
    o.createdby,
    o.updated,
    o.updatedby,
    dt.ad_language,
    o.c_order_id,
    o.issotrx,
    o.documentno,
    o.docstatus,
    o.c_doctype_id,
    o.c_bpartner_id,
    bp.value AS bpvalue,
    bp.taxid AS bptaxid,
    bp.naics,
    bp.duns,
    oi.c_location_id AS org_location_id,
    oi.taxid,
    o.m_warehouse_id,
    wh.c_location_id AS warehouse_location_id,
    dt.printname AS documenttype,
    dt.documentnote AS documenttypenote,
    o.salesrep_id,
    COALESCE(ubp.name, u.name) AS salesrep_name,
    o.dateordered,
    o.datepromised,
    bpg.greeting AS bpgreeting,
    bp.name,
    bp.name2,
    bpcg.greeting AS bpcontactgreeting,
    bpc.title,
    bpc.phone,
    NULLIF(bpc.name::text, bp.name::text) AS contactname,
    bpl.c_location_id,
    l.postal::text || l.postal_add::text AS postal,
    bp.referenceno,
    o.bill_bpartner_id,
    o.bill_location_id,
    o.bill_user_id,
    bbp.value AS bill_bpvalue,
    bbp.taxid AS bill_bptaxid,
    bbp.name AS bill_name,
    bbp.name2 AS bill_name2,
    bbpc.title AS bill_title,
    bbpc.phone AS bill_phone,
    NULLIF(bbpc.name::text, bbp.name::text) AS bill_contactname,
    bbpl.c_location_id AS bill_c_location_id,
    o.description,
    o.poreference,
    o.c_currency_id,
    pt.name AS paymentterm,
    pt.documentnote AS paymenttermnote,
    o.c_charge_id,
    o.chargeamt,
    o.totallines,
    o.grandtotal,
    o.grandtotal AS amtinwords,
    o.m_pricelist_id,
    o.istaxincluded,
    o.volume,
    o.weight,
    o.c_campaign_id,
    o.c_project_id,
    o.c_activity_id,
    o.m_shipper_id,
    o.deliveryrule,
    o.deliveryviarule,
    o.priorityrule,
    o.invoicerule,
    COALESCE(oi.logo_id, ci.logo_id) AS logo_id
   FROM c_order o
     JOIN c_doctype_trl dt ON o.c_doctype_id = dt.c_doctype_id
     JOIN m_warehouse wh ON o.m_warehouse_id = wh.m_warehouse_id
     JOIN c_paymentterm_trl pt ON o.c_paymentterm_id = pt.c_paymentterm_id AND dt.ad_language::text = pt.ad_language::text
     JOIN c_bpartner bp ON o.c_bpartner_id = bp.c_bpartner_id
     LEFT JOIN c_greeting_trl bpg ON bp.c_greeting_id = bpg.c_greeting_id AND dt.ad_language::text = bpg.ad_language::text
     JOIN c_bpartner_location bpl ON o.c_bpartner_location_id = bpl.c_bpartner_location_id
     JOIN c_location l ON bpl.c_location_id = l.c_location_id
     LEFT JOIN ad_user bpc ON o.ad_user_id = bpc.ad_user_id
     LEFT JOIN c_greeting_trl bpcg ON bpc.c_greeting_id = bpcg.c_greeting_id AND dt.ad_language::text = bpcg.ad_language::text
     JOIN ad_orginfo oi ON o.ad_org_id = oi.ad_org_id
     JOIN ad_clientinfo ci ON o.ad_client_id = ci.ad_client_id
     LEFT JOIN ad_user u ON o.salesrep_id = u.ad_user_id
     LEFT JOIN c_bpartner ubp ON u.c_bpartner_id = ubp.c_bpartner_id
     JOIN c_bpartner bbp ON o.bill_bpartner_id = bbp.c_bpartner_id
     JOIN c_bpartner_location bbpl ON o.bill_location_id = bbpl.c_bpartner_location_id
     LEFT JOIN ad_user bbpc ON o.bill_user_id = bbpc.ad_user_id
;

CREATE OR REPLACE VIEW c_invoice_header_v AS
 SELECT i.ad_client_id,
    i.ad_org_id,
    i.isactive,
    i.created,
    i.createdby,
    i.updated,
    i.updatedby,
    'en_US'::character varying AS ad_language,
    i.c_invoice_id,
    i.issotrx,
    i.documentno,
    i.docstatus,
    i.c_doctype_id,
    i.c_bpartner_id,
    bp.value AS bpvalue,
    bp.taxid AS bptaxid,
    bp.naics,
    bp.duns,
    oi.c_location_id AS org_location_id,
    oi.taxid,
    dt.printname AS documenttype,
    dt.documentnote AS documenttypenote,
    i.c_order_id,
    i.salesrep_id,
    COALESCE(ubp.name, u.name) AS salesrep_name,
    i.dateinvoiced,
    bpg.greeting AS bpgreeting,
    bp.name,
    bp.name2,
    bpcg.greeting AS bpcontactgreeting,
    bpc.title,
    bpc.phone,
    NULLIF(bpc.name::text, bp.name::text) AS contactname,
    bpl.c_location_id,
    bp.referenceno,
    l.postal::text || l.postal_add::text AS postal,
    i.description,
    i.poreference,
    i.dateordered,
    i.c_currency_id,
    pt.name AS paymentterm,
    pt.documentnote AS paymenttermnote,
    i.c_charge_id,
    i.chargeamt,
    i.totallines,
    i.grandtotal,
    i.grandtotal AS amtinwords,
    i.m_pricelist_id,
    i.istaxincluded,
    i.c_campaign_id,
    i.c_project_id,
    i.c_activity_id,
    i.ispaid,
    COALESCE(oi.logo_id, ci.logo_id) AS logo_id,
    i.cae,
    i.vtocae,
    i.paymentrule
   FROM c_invoice i
     JOIN c_doctype dt ON i.c_doctype_id = dt.c_doctype_id
     JOIN c_paymentterm pt ON i.c_paymentterm_id = pt.c_paymentterm_id
     JOIN c_bpartner bp ON i.c_bpartner_id = bp.c_bpartner_id
     LEFT JOIN c_greeting bpg ON bp.c_greeting_id = bpg.c_greeting_id
     JOIN c_bpartner_location bpl ON i.c_bpartner_location_id = bpl.c_bpartner_location_id
     JOIN c_location l ON bpl.c_location_id = l.c_location_id
     LEFT JOIN ad_user bpc ON i.ad_user_id = bpc.ad_user_id
     LEFT JOIN c_greeting bpcg ON bpc.c_greeting_id = bpcg.c_greeting_id
     JOIN ad_orginfo oi ON i.ad_org_id = oi.ad_org_id
     JOIN ad_clientinfo ci ON i.ad_client_id = ci.ad_client_id
     LEFT JOIN ad_user u ON i.salesrep_id = u.ad_user_id
     LEFT JOIN c_bpartner ubp ON u.c_bpartner_id = ubp.c_bpartner_id
;

CREATE OR REPLACE VIEW c_invoice_header_vt AS
 SELECT i.ad_client_id,
    i.ad_org_id,
    i.isactive,
    i.created,
    i.createdby,
    i.updated,
    i.updatedby,
    dt.ad_language,
    i.c_invoice_id,
    i.issotrx,
    i.documentno,
    i.docstatus,
    i.c_doctype_id,
    i.c_bpartner_id,
    bp.value AS bpvalue,
    bp.taxid AS bptaxid,
    bp.naics,
    bp.duns,
    oi.c_location_id AS org_location_id,
    oi.taxid,
    dt.printname AS documenttype,
    dt.documentnote AS documenttypenote,
    i.c_order_id,
    i.salesrep_id,
    COALESCE(ubp.name, u.name) AS salesrep_name,
    i.dateinvoiced,
    bpg.greeting AS bpgreeting,
    bp.name,
    bp.name2,
    bpcg.greeting AS bpcontactgreeting,
    bpc.title,
    bpc.phone,
    NULLIF(bpc.name::text, bp.name::text) AS contactname,
    bpl.c_location_id,
    bp.referenceno,
    l.postal::text || l.postal_add::text AS postal,
    i.description,
    i.poreference,
    i.dateordered,
    i.c_currency_id,
    pt.name AS paymentterm,
    pt.documentnote AS paymenttermnote,
    i.c_charge_id,
    i.chargeamt,
    i.totallines,
    i.grandtotal,
    i.grandtotal AS amtinwords,
    i.m_pricelist_id,
    i.istaxincluded,
    i.c_campaign_id,
    i.c_project_id,
    i.c_activity_id,
    i.ispaid,
    COALESCE(oi.logo_id, ci.logo_id) AS logo_id
   FROM c_invoice i
     JOIN c_doctype_trl dt ON i.c_doctype_id = dt.c_doctype_id
     JOIN c_paymentterm_trl pt ON i.c_paymentterm_id = pt.c_paymentterm_id AND dt.ad_language::text = pt.ad_language::text
     JOIN c_bpartner bp ON i.c_bpartner_id = bp.c_bpartner_id
     LEFT JOIN c_greeting_trl bpg ON bp.c_greeting_id = bpg.c_greeting_id AND dt.ad_language::text = bpg.ad_language::text
     JOIN c_bpartner_location bpl ON i.c_bpartner_location_id = bpl.c_bpartner_location_id
     JOIN c_location l ON bpl.c_location_id = l.c_location_id
     LEFT JOIN ad_user bpc ON i.ad_user_id = bpc.ad_user_id
     LEFT JOIN c_greeting_trl bpcg ON bpc.c_greeting_id = bpcg.c_greeting_id AND dt.ad_language::text = bpcg.ad_language::text
     JOIN ad_orginfo oi ON i.ad_org_id = oi.ad_org_id
     JOIN ad_clientinfo ci ON i.ad_client_id = ci.ad_client_id
     LEFT JOIN ad_user u ON i.salesrep_id = u.ad_user_id
     LEFT JOIN c_bpartner ubp ON u.c_bpartner_id = ubp.c_bpartner_id
;

CREATE OR REPLACE VIEW c_dunning_header_v AS
 SELECT dr.ad_client_id,
    dr.ad_org_id,
    dr.isactive,
    dr.created,
    dr.createdby,
    dr.updated,
    dr.updatedby,
    'en_US'::character varying AS ad_language,
    dr.c_dunningrun_id,
    dre.c_dunningrunentry_id,
    dr.dunningdate,
    dl.printname,
    dl.note AS documentnote,
    dre.c_bpartner_id,
    bp.value AS bpvalue,
    bp.taxid AS bptaxid,
    bp.naics,
    bp.duns,
    oi.c_location_id AS org_location_id,
    oi.taxid,
    dre.salesrep_id,
    COALESCE(ubp.name, u.name) AS salesrep_name,
    bpg.greeting AS bpgreeting,
    bp.name,
    bp.name2,
    bpcg.greeting AS bpcontactgreeting,
    bpc.title,
    bpc.phone,
    NULLIF(bpc.name::text, bp.name::text) AS contactname,
    bpl.c_location_id,
    bp.referenceno,
    l.postal::text || l.postal_add::text AS postal,
    dre.amt,
    dre.qty,
    dre.note,
    COALESCE(oi.logo_id, ci.logo_id) AS logo_id
   FROM c_dunningrun dr
     JOIN c_dunningrunentry dre ON dr.c_dunningrun_id = dre.c_dunningrun_id
     JOIN c_dunninglevel dl ON dre.c_dunninglevel_id = dl.c_dunninglevel_id
     JOIN c_bpartner bp ON dre.c_bpartner_id = bp.c_bpartner_id
     LEFT JOIN c_greeting bpg ON bp.c_greeting_id = bpg.c_greeting_id
     JOIN c_bpartner_location bpl ON dre.c_bpartner_location_id = bpl.c_bpartner_location_id
     JOIN c_location l ON bpl.c_location_id = l.c_location_id
     LEFT JOIN ad_user bpc ON dre.ad_user_id = bpc.ad_user_id
     LEFT JOIN c_greeting bpcg ON bpc.c_greeting_id = bpcg.c_greeting_id
     JOIN ad_orginfo oi ON dr.ad_org_id = oi.ad_org_id
     JOIN ad_clientinfo ci ON dr.ad_client_id = ci.ad_client_id
     LEFT JOIN ad_user u ON dre.salesrep_id = u.ad_user_id
     LEFT JOIN c_bpartner ubp ON u.c_bpartner_id = ubp.c_bpartner_id
;

CREATE OR REPLACE VIEW c_dunning_header_vt AS
 SELECT dr.ad_client_id,
    dr.ad_org_id,
    dr.isactive,
    dr.created,
    dr.createdby,
    dr.updated,
    dr.updatedby,
    dlt.ad_language,
    dr.c_dunningrun_id,
    dre.c_dunningrunentry_id,
    dr.dunningdate,
    dlt.printname,
    dlt.note AS documentnote,
    dre.c_bpartner_id,
    bp.value AS bpvalue,
    bp.taxid AS bptaxid,
    bp.naics,
    bp.duns,
    oi.c_location_id AS org_location_id,
    oi.taxid,
    dre.salesrep_id,
    COALESCE(ubp.name, u.name) AS salesrep_name,
    bpg.greeting AS bpgreeting,
    bp.name,
    bp.name2,
    bpcg.greeting AS bpcontactgreeting,
    bpc.title,
    bpc.phone,
    NULLIF(bpc.name::text, bp.name::text) AS contactname,
    bpl.c_location_id,
    bp.referenceno,
    l.postal::text || l.postal_add::text AS postal,
    dre.amt,
    dre.qty,
    dre.note,
    COALESCE(oi.logo_id, ci.logo_id) AS logo_id
   FROM c_dunningrun dr
     JOIN c_dunningrunentry dre ON dr.c_dunningrun_id = dre.c_dunningrun_id
     JOIN c_dunninglevel dl ON dre.c_dunninglevel_id = dl.c_dunninglevel_id
     JOIN c_dunninglevel_trl dlt ON dl.c_dunninglevel_id = dlt.c_dunninglevel_id
     JOIN c_bpartner bp ON dre.c_bpartner_id = bp.c_bpartner_id
     LEFT JOIN c_greeting_trl bpg ON bp.c_greeting_id = bpg.c_greeting_id AND dlt.ad_language::text = bpg.ad_language::text
     JOIN c_bpartner_location bpl ON dre.c_bpartner_location_id = bpl.c_bpartner_location_id
     JOIN c_location l ON bpl.c_location_id = l.c_location_id
     LEFT JOIN ad_user bpc ON dre.ad_user_id = bpc.ad_user_id
     LEFT JOIN c_greeting_trl bpcg ON bpc.c_greeting_id = bpcg.c_greeting_id AND dlt.ad_language::text = bpcg.ad_language::text
     JOIN ad_orginfo oi ON dr.ad_org_id = oi.ad_org_id
     JOIN ad_clientinfo ci ON dr.ad_client_id = ci.ad_client_id
     LEFT JOIN ad_user u ON dre.salesrep_id = u.ad_user_id
     LEFT JOIN c_bpartner ubp ON u.c_bpartner_id = ubp.c_bpartner_id
;





-- 02/05/2017 9:06:46 ART
-- ISSUE #86: Implementación de JavaPOS
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3002034,228,'LAR',0,'N','N','N','The Performance Goal indicates what this users performance will be measured against.','N',10,'N',19,'N',1594,'N','Y','N','Performance Goal','Goal','PA_Goal_ID',100,TO_DATE('2017-05-02 09:06:43','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-05-02 09:06:43','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/05/2017 9:06:46 ART
-- ISSUE #86: Implementación de JavaPOS
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3002034 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/05/2017 9:06:47 ART
-- ISSUE #86: Implementación de JavaPOS
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000437,'fecha_inicio_act','LAR','fecha_inicio_act','fecha_inicio_act',0,TO_DATE('2017-05-02 09:06:46','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2017-05-02 09:06:46','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 02/05/2017 9:06:47 ART
-- ISSUE #86: Implementación de JavaPOS
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000437 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 02/05/2017 9:06:47 ART
-- ISSUE #86: Implementación de JavaPOS
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3002035,228,'LAR',0,'N','N','N','N',29,'N',16,'N',3000437,'N','Y','N','fecha_inicio_act','fecha_inicio_act',100,TO_DATE('2017-05-02 09:06:46','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-05-02 09:06:46','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/05/2017 9:06:47 ART
-- ISSUE #86: Implementación de JavaPOS
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3002035 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/05/2017 9:07:50 ART
-- ISSUE #86: Implementación de JavaPOS
UPDATE AD_Element SET ColumnName='Fecha_Inicio_Act', Name='Fecha_Inicio_Act', PrintName='Fecha_Inicio_Act',Updated=TO_DATE('2017-05-02 09:07:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000437
;

-- 02/05/2017 9:07:50 ART
-- ISSUE #86: Implementación de JavaPOS
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000437
;

-- 02/05/2017 9:07:50 ART
-- ISSUE #86: Implementación de JavaPOS
UPDATE AD_Column SET ColumnName='Fecha_Inicio_Act', Name='Fecha_Inicio_Act', Description=NULL, Help=NULL WHERE AD_Element_ID=3000437
;

-- 02/05/2017 9:07:50 ART
-- ISSUE #86: Implementación de JavaPOS
UPDATE AD_Process_Para SET ColumnName='Fecha_Inicio_Act', Name='Fecha_Inicio_Act', Description=NULL, Help=NULL, AD_Element_ID=3000437 WHERE UPPER(ColumnName)='FECHA_INICIO_ACT' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 02/05/2017 9:07:50 ART
-- ISSUE #86: Implementación de JavaPOS
UPDATE AD_Process_Para SET ColumnName='Fecha_Inicio_Act', Name='Fecha_Inicio_Act', Description=NULL, Help=NULL WHERE AD_Element_ID=3000437 AND IsCentrallyMaintained='Y'
;

-- 02/05/2017 9:07:50 ART
-- ISSUE #86: Implementación de JavaPOS
UPDATE AD_Field SET Name='Fecha_Inicio_Act', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000437) AND IsCentrallyMaintained='Y'
;

-- 02/05/2017 9:07:50 ART
-- ISSUE #86: Implementación de JavaPOS
UPDATE AD_PrintFormatItem pi SET PrintName='Fecha_Inicio_Act', Name='Fecha_Inicio_Act' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000437)
;

-- 02/05/2017 9:11:50 ART
-- ISSUE #86: Implementación de JavaPOS
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003218,29,'Y','N','N',3002035,'N','Y',170,'N','LAR','Fecha_Inicio_Act',100,0,'Y',TO_DATE('2017-05-02 09:11:49','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-05-02 09:11:49','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2017 9:11:50 ART
-- ISSUE #86: Implementación de JavaPOS
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003218 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2017 9:11:50 ART
-- ISSUE #86: Implementación de JavaPOS
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003219,10,'Y','N','N',3002034,'N','Y',170,'N','The Performance Goal indicates what this users performance will be measured against.','LAR','Performance Goal','Goal',100,0,'Y',TO_DATE('2017-05-02 09:11:50','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2017-05-02 09:11:50','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/05/2017 9:11:50 ART
-- ISSUE #86: Implementación de JavaPOS
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003219 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/05/2017 9:12:20 ART
-- ISSUE #86: Implementación de JavaPOS
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3003219
;

-- 02/05/2017 9:12:20 ART
-- ISSUE #86: Implementación de JavaPOS
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3003218
;

-- 02/05/2017 9:15:55 ART
-- ISSUE #86: Implementación de JavaPOS
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3003218
;

-- 02/05/2017 9:15:55 ART
-- ISSUE #86: Implementación de JavaPOS
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=8728
;

-- 02/05/2017 9:15:55 ART
-- ISSUE #86: Implementación de JavaPOS
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=1000000
;

-- 02/05/2017 9:15:55 ART
-- ISSUE #86: Implementación de JavaPOS
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=1000001
;

-- 02/05/2017 9:15:55 ART
-- ISSUE #86: Implementación de JavaPOS
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=56622
;

-- 02/05/2017 9:15:55 ART
-- ISSUE #86: Implementación de JavaPOS
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=58855
;

-- 02/05/2017 9:15:55 ART
-- ISSUE #86: Implementación de JavaPOS
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=58852
;

-- 02/05/2017 9:15:55 ART
-- ISSUE #86: Implementación de JavaPOS
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=58854
;

-- 02/05/2017 9:15:55 ART
-- ISSUE #86: Implementación de JavaPOS
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=58853
;

-- 02/05/2017 9:15:55 ART
-- ISSUE #86: Implementación de JavaPOS
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=57532
;

-- 02/05/2017 9:16:25 ART
-- ISSUE #86: Implementación de JavaPOS
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2017-05-02 09:16:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=8728
;

-- 02/05/2017 9:16:52 ART
-- ISSUE #86: Implementación de JavaPOS
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Fecha Inicio Actividades',Updated=TO_DATE('2017-05-02 09:16:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003218 AND AD_Language='es_AR'
;

-- 02/05/2017 11:55:12 ART
-- ISSUE #86: Implementación de JavaPOS
UPDATE AD_Column SET FieldLength=16,Updated=TO_DATE('2017-05-02 11:55:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=2352
;

-- 02/05/2017 11:55:49 ART
-- ISSUE #86: Implementación de JavaPOS
UPDATE AD_Column SET FieldLength=16,Updated=TO_DATE('2017-05-02 11:55:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=2906
;

-- Registración de script
SELECT register_migration_script_lar('0088_ISSUE-86.sql', 'LAR', '')
;
