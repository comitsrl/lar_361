CREATE OR REPLACE VIEW c_order_linetax_v AS 
(        
           SELECT ol.ad_client_id
                , ol.ad_org_id
                , ol.isactive
                , ol.created
                , ol.createdby
                , ol.updated
                , ol.updatedby
                , 'en_US' AS ad_language
                , ol.c_order_id
                , ol.c_orderline_id
                , ol.c_tax_id
                , t.taxindicator
                , ol.c_bpartner_id
                , ol.c_bpartner_location_id
                , bp.name AS bpname
                , bpl.c_location_id
                , ol.line
                , p.m_product_id
                , po.vendorproductno
                , CASE
                      WHEN ol.qtyordered <> 0::numeric OR ol.m_product_id IS NOT NULL THEN ol.qtyordered
                      ELSE NULL::numeric
                  END AS qtyordered 
                , CASE
                      WHEN ol.qtyentered <> 0::numeric OR ol.m_product_id IS NOT NULL THEN ol.qtyentered
                      ELSE NULL::numeric
                  END AS qtyentered 
                , CASE
                      WHEN ol.qtyentered <> 0::numeric OR ol.m_product_id IS NOT NULL THEN uom.uomsymbol
                      ELSE NULL::character varying
                  END AS uomsymbol
                , COALESCE(c.name, (p.name::text || productattribute(ol.m_attributesetinstance_id)::text)::character varying, ol.description) AS name 
                , CASE
                      WHEN COALESCE(c.name, p.name) IS NOT NULL THEN ol.description
                      ELSE NULL::character varying
                  END AS description
                , p.documentnote
                , p.upc
                , p.sku
                , COALESCE(pp.vendorproductno, p.value) AS productvalue
                , ra.description AS resourcedescription
                , CASE
                      WHEN i.isdiscountprinted = 'Y'::bpchar AND ol.pricelist <> 0::numeric THEN ol.pricelist
                      ELSE NULL::numeric
                  END AS pricelist
                , CASE
                      WHEN i.isdiscountprinted = 'Y'::bpchar AND ol.pricelist <> 0::numeric AND ol.qtyentered <> 0::numeric THEN ol.pricelist * ol.qtyordered / ol.qtyentered
                      ELSE NULL::numeric
                  END AS priceenteredlist
                , CASE
                      WHEN i.isdiscountprinted = 'Y'::bpchar AND ol.pricelist > ol.priceactual AND ol.pricelist <> 0::numeric THEN (ol.pricelist - ol.priceactual) / ol.pricelist * 100::numeric
                      ELSE NULL::numeric
                  END AS discount
                , CASE
                      WHEN ol.priceactual <> 0::numeric OR ol.m_product_id IS NOT NULL THEN ol.priceactual
                      ELSE NULL::numeric
                  END AS priceactual
                , CASE
                      WHEN ol.priceentered <> 0::numeric OR ol.m_product_id IS NOT NULL THEN ol.priceentered
                      ELSE NULL::numeric
                  END AS priceentered
                , CASE
                      WHEN ol.linenetamt <> 0::numeric OR ol.m_product_id IS NOT NULL THEN ol.linenetamt
                      ELSE NULL::numeric
                  END AS linenetamt
                , p.description AS productdescription
                , p.imageurl
                , ol.c_campaign_id
                , ol.c_project_id
                , ol.c_activity_id
                , ol.c_projectphase_id
                , ol.c_projecttask_id
             FROM c_orderline ol
             JOIN c_uom uom ON ol.c_uom_id = uom.c_uom_id
             JOIN c_order i ON ol.c_order_id = i.c_order_id
             LEFT JOIN m_product p ON ol.m_product_id = p.m_product_id
             LEFT JOIN m_product_po po ON p.m_product_id = po.m_product_id AND i.c_bpartner_id = po.c_bpartner_id
             LEFT JOIN s_resourceassignment ra ON ol.s_resourceassignment_id = ra.s_resourceassignment_id
             LEFT JOIN c_charge c ON ol.c_charge_id = c.c_charge_id
             LEFT JOIN c_bpartner_product pp ON ol.m_product_id = pp.m_product_id AND i.c_bpartner_id = pp.c_bpartner_id
             JOIN c_bpartner bp ON ol.c_bpartner_id = bp.c_bpartner_id
             JOIN c_bpartner_location bpl ON ol.c_bpartner_location_id = bpl.c_bpartner_location_id
             LEFT JOIN c_tax t ON ol.c_tax_id = t.c_tax_id
UNION 
           SELECT ol.ad_client_id
                , ol.ad_org_id
                , ol.isactive
                , ol.created
                , ol.createdby
                , ol.updated
                , ol.updatedby
                , 'en_US' AS ad_language
                , ol.c_order_id
                , ol.c_orderline_id
                , ol.c_tax_id
                , NULL::unknown AS taxindicator
                , NULL::unknown AS c_bpartner_id
                , NULL::unknown AS c_bpartner_location_id
                , NULL::unknown AS bpname
                , NULL::unknown AS c_location_id
                , ol.line + bl.line / 100::numeric AS line
                , p.m_product_id, po.vendorproductno 
                , CASE
                      WHEN bl.isqtypercentage = 'N'::bpchar THEN ol.qtyordered * bl.qtybom
                      ELSE ol.qtyordered * (bl.qtybatch / 100::numeric)
                  END AS qtyordered 
                , CASE
                      WHEN bl.isqtypercentage = 'N'::bpchar THEN ol.qtyentered * bl.qtybom
                      ELSE ol.qtyentered * (bl.qtybatch / 100::numeric)
                  END AS qtyentered
                , uom.uomsymbol
                , p.name
                , bl.description
                , p.documentnote
                , p.upc
                , p.sku
                , p.value AS productvalue
                , NULL::unknown AS resourcedescription
                , NULL::unknown AS pricelist
                , NULL::unknown AS priceenteredlist
                , NULL::unknown AS discount
                , NULL::unknown AS priceactual
                , NULL::unknown AS priceentered
                , NULL::unknown AS linenetamt
                , p.description AS productdescription
                , p.imageurl
                , ol.c_campaign_id
                , ol.c_project_id
                , ol.c_activity_id
                , ol.c_projectphase_id
                , ol.c_projecttask_id
             FROM pp_product_bom b
             JOIN c_orderline ol ON b.m_product_id = ol.m_product_id
             JOIN c_order i ON ol.c_order_id = i.c_order_id
             JOIN m_product bp ON bp.m_product_id = ol.m_product_id AND bp.isbom = 'Y'::bpchar AND bp.isverified = 'Y'::bpchar AND bp.isinvoiceprintdetails = 'Y'::bpchar
             JOIN pp_product_bomline bl ON bl.pp_product_bom_id = b.pp_product_bom_id
             JOIN m_product p ON p.m_product_id = bl.m_product_id
             LEFT JOIN m_product_po po ON p.m_product_id = po.m_product_id AND i.c_bpartner_id = po.c_bpartner_id
             JOIN c_uom uom ON p.c_uom_id = uom.c_uom_id
UNION 
           SELECT c_order.ad_client_id
                , c_order.ad_org_id
                , c_order.isactive
                , c_order.created
                , c_order.createdby
                , c_order.updated
                , c_order.updatedby
                , 'en_US' AS ad_language
                , c_order.c_order_id
                , NULL::unknown AS c_orderline_id
                , NULL::unknown AS c_tax_id
                , NULL::unknown AS taxindicator
                , NULL::unknown AS c_bpartner_id
                , NULL::unknown AS c_bpartner_location_id
                , NULL::unknown AS bpname
                , NULL::unknown AS c_location_id
                , NULL::unknown AS line
                , NULL::unknown AS m_product_id
                , NULL::unknown AS vendorproductno
                , NULL::unknown AS qtyordered
                , NULL::unknown AS qtyentered
                , NULL::unknown AS uomsymbol
                , NULL::unknown AS name
                , NULL::unknown AS description
                , NULL::unknown AS documentnote
                , NULL::unknown AS upc
                , NULL::unknown AS sku
                , NULL::unknown AS productvalue
                , NULL::unknown AS resourcedescription
                , NULL::unknown AS pricelist
                , NULL::unknown AS priceenteredlist
                , NULL::unknown AS discount
                , NULL::unknown AS priceactual
                , NULL::unknown AS priceentered
                , NULL::unknown AS linenetamt
                , NULL::unknown AS productdescription
                , NULL::unknown AS imageurl
                , NULL::unknown AS c_campaign_id
                , NULL::unknown AS c_project_id
                , NULL::unknown AS c_activity_id
                , NULL::unknown AS c_projectphase_id
                , NULL::unknown AS c_projecttask_id
             FROM c_order
UNION 
           SELECT ot.ad_client_id
                , ot.ad_org_id
                , ot.isactive
                , ot.created
                , ot.createdby
                , ot.updated
                , ot.updatedby
                , 'en_US' AS ad_language
                , ot.c_order_id
                , NULL::unknown AS c_orderline_id
                , ot.c_tax_id
                , t.taxindicator
                , NULL::unknown AS c_bpartner_id
                , NULL::unknown AS c_bpartner_location_id
                , NULL::unknown AS bpname
                , NULL::unknown AS c_location_id
                , NULL::unknown AS line
                , NULL::unknown AS m_product_id
                , NULL::unknown AS vendorproductno
                , NULL::unknown AS qtyordered
                , NULL::unknown AS qtyentered
                , NULL::unknown AS uomsymbol
                , t.name
                , NULL::unknown AS description
                , NULL::unknown AS documentnote
                , NULL::unknown AS upc
                , NULL::unknown AS sku
                , NULL::unknown AS productvalue
                , NULL::unknown AS resourcedescription
                , NULL::unknown AS pricelist
                , NULL::unknown AS priceenteredlist
                , NULL::unknown AS discount
                , CASE
                      WHEN ot.istaxincluded = 'Y'::bpchar THEN ot.taxamt
                      ELSE ot.taxbaseamt
                  END AS priceactual
                , CASE
                      WHEN ot.istaxincluded = 'Y'::bpchar THEN ot.taxamt
                      ELSE ot.taxbaseamt
                  END AS priceentered
                , CASE
                      WHEN ot.istaxincluded = 'Y'::bpchar THEN NULL::numeric
                      ELSE ot.taxamt
                  END AS linenetamt
                , NULL::unknown AS productdescription
                , NULL::unknown AS imageurl
                , NULL::unknown AS c_campaign_id
                , NULL::unknown AS c_project_id
                , NULL::unknown AS c_activity_id
                , NULL::unknown AS c_projectphase_id
                , NULL::unknown AS c_projecttask_id
             FROM c_ordertax ot
             JOIN c_tax t ON ot.c_tax_id = t.c_tax_id
UNION 
           SELECT op.ad_client_id
                , op.ad_org_id
                , op.isactive
                , op.created
                , op.createdby
                , op.updated
                , op.updatedby
                , 'en_US' AS ad_language
                , op.c_order_id
                , NULL::unknown AS c_orderline_id
                , op.c_tax_id
                , t.taxindicator
                , NULL::unknown AS c_bpartner_id
                , NULL::unknown AS c_bpartner_location_id
                , NULL::unknown AS bpname
                , NULL::unknown AS c_location_id
                , NULL::unknown AS line
                , NULL::unknown AS m_product_id
                , NULL::unknown AS vendorproductno
                , NULL::unknown AS qtyordered
                , NULL::unknown AS qtyentered
                , NULL::unknown AS uomsymbol
                , t.name
                , NULL::unknown AS description
                , NULL::unknown AS documentnote
                , NULL::unknown AS upc
                , NULL::unknown AS sku
                , NULL::unknown AS productvalue
                , NULL::unknown AS resourcedescription
                , NULL::unknown AS pricelist
                , NULL::unknown AS priceenteredlist
                , NULL::unknown AS discount
                , CASE
                      WHEN op.istaxincluded = 'Y'::bpchar THEN op.taxamt
                      ELSE op.taxbaseamt
                  END AS priceactual
                , CASE
                      WHEN op.istaxincluded = 'Y'::bpchar THEN op.taxamt
                      ELSE op.taxbaseamt
                  END AS priceentered
                , CASE
                      WHEN op.istaxincluded = 'Y'::bpchar THEN NULL::numeric
                      ELSE op.taxamt
                  END AS linenetamt
                , NULL::unknown AS productdescription
                , NULL::unknown AS imageurl
                , NULL::unknown AS c_campaign_id
                , NULL::unknown AS c_project_id
                , NULL::unknown AS c_activity_id
                , NULL::unknown AS c_projectphase_id
                , NULL::unknown AS c_projecttask_id
             FROM lar_orderperception op 
             JOIN c_tax t ON op.c_tax_id = t.c_tax_id
)
