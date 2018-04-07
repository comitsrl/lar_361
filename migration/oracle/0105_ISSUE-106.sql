-- View: m_rma_candidate_v

CREATE OR REPLACE VIEW m_rma_candidate_v AS 
 SELECT
    rma.ad_client_id,
    rma.ad_org_id,
    rma.c_bpartner_id,
    rma.m_rma_id,
    rma.inout_id,
    rma.documentno,
    rma.created,
    rma.c_doctype_id,
    rma.amt
   FROM m_rma rma
   JOIN C_DocType dt ON rma.C_DocType_ID=dt.C_DocType_ID
   JOIN m_rmaline l ON rma.m_rma_id = l.m_rma_id
WHERE rma.DocStatus='CO' 
AND dt.DocBaseType = 'SOO' 
AND NOT EXISTS (SELECT * 
                FROM C_Invoice i 
                WHERE i.M_RMA_ID=rma.M_RMA_ID 
                AND i.DocStatus IN ('IP', 'CO', 'CL')) 
                AND EXISTS (SELECT * 
                            FROM C_InvoiceLine il 
                            INNER JOIN M_InOutLine iol ON il.M_InOutLine_ID=iol.M_InOutLine_ID AND iol.M_InOutLine_ID = l.M_InOutLine_ID
                            INNER JOIN C_Invoice i ON i.C_Invoice_ID=il.C_Invoice_ID 
                            WHERE i.DocStatus IN ('CO', 'CL')) 
GROUP BY rma.m_rma_id
;

-- Registración de script
SELECT register_migration_script_lar('0105_ISSUE-106.sql', 'LAR', '') FROM dual
;
