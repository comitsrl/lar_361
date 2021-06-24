-- ISSUE #80: Se contempla la forma de pago Billetera Digital QR "Q"

-- Function: adempiere.suma_pagos_por_tt_cierre_caja(numeric, character varying)

-- DROP FUNCTION adempiere.suma_pagos_por_tt_cierre_caja(numeric, character varying);

CREATE OR REPLACE FUNCTION adempiere.suma_pagos_por_tt_cierre_caja(
    p_c_bankstatement_id numeric,
    p_tendertype character varying)
  RETURNS numeric AS
$BODY$
DECLARE
    v_saldo NUMERIC(10,2) := 0;
BEGIN
    SELECT COALESCE(SUM(sl.TrxAmt),0)
      INTO v_saldo
    FROM C_BankStatement bs
    JOIN C_BankStatementLine sl ON bs.C_BankStatement_ID = sl.C_BankStatement_ID
    JOIN C_Payment p ON sl.C_Payment_ID = p.C_Payment_ID
    WHERE sl.C_BankStatement_ID = p_c_bankstatement_id 
          AND p.TenderType = ANY(
                                CASE p_tendertype
                                            WHEN 'K' THEN (ARRAY['K'::character varying, 'Z'::character varying, 'O'::character varying])
                                            WHEN 'C' THEN (ARRAY['C'::character varying, 'D'::character varying])
                                            WHEN 'A' THEN (ARRAY['A'::character varying])
                                            WHEN 'X' THEN (ARRAY['X'::character varying, 'N'::character varying])
                                            WHEN 'Q' THEN (ARRAY['Q'::character varying])
                                END)
         AND (p.LAR_Tarjeta_Credito_ID IS NULL OR p.LAR_Tarjeta_Credito_ID NOT IN (1000059)) -- Mercado Pago Otra
    ;
    RETURN v_saldo;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- Registración de script
SELECT register_migration_script_lar('0180_ISSUE-80.sql', 'LAR', '')
;
