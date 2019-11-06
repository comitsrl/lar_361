-- Corrección de conversión de moneda, en función que determina el saldo abierto de un cobro/pago.
CREATE OR REPLACE FUNCTION paymentavailable_lar(p_c_payment_id numeric)
  RETURNS numeric AS
$BODY$
/*************************************************************************
 * The contents of this file are subject to the Compiere License.  You may
 * obtain a copy of the License at    http://www.compiere.org/license.html
 * Software is on an  "AS IS" basis,  WITHOUT WARRANTY OF ANY KIND, either
 * express or implied. See the License for details. Code: Compiere ERP+CRM
 * Copyright (C) 1999-2001 Jorg Janke, ComPiere, Inc. All Rights Reserved.
 *
 * converted to postgreSQL by Karsten Thiemann (Schaeffer AG),
 * kthiemann@adempiere.org
 *************************************************************************
 * Título: Calcula el importe de pago disponible (sin asignar),
 *         considerando a los cargos por retenciones como pago normales.
 *         Esta función solo se utiliza en la ventana de asignaciones
 *         de LAR (Allocation.java)
 * Descripcion:
 *    similar a PaymentAvailable
 ************************************************************************/
DECLARE
  v_Currency_ID   NUMERIC(10);
  v_AvailableAmt  NUMERIC := 0;
  v_IsReceipt     C_Payment.IsReceipt%TYPE;
  v_Amt           NUMERIC := 0;
  r               RECORD;
BEGIN
  --  Charge - fully allocated
  SELECT MAX(PayAmt)
    INTO v_Amt
    FROM C_Payment
   WHERE C_Payment_ID=p_C_Payment_ID
     AND C_Charge_ID > 0
     AND EsRetencionIIBB = 'N';
  IF (v_Amt IS NOT NULL) THEN
      RETURN 0;
  END IF;

  --  Get Currency
  SELECT C_Currency_ID, PayAmt, IsReceipt
    INTO v_Currency_ID, v_AvailableAmt, v_IsReceipt
    FROM C_Payment_v     -- corrected for AP/AR
   WHERE C_Payment_ID = p_C_Payment_ID;
--  DBMS_OUTPUT.PUT_LINE('== C_Payment_ID=' || p_C_Payment_ID || ', PayAmt=' || v_AvailableAmt || ', Receipt=' || v_IsReceipt);

  --  Calculate Allocated Amount
  FOR r IN
    SELECT a.AD_Client_ID, a.AD_Org_ID, al.Amount, a.C_Currency_ID, a.DateTrx, al.TasaDeCambio
      FROM C_AllocationLine al
     INNER JOIN C_AllocationHdr a ON (al.C_AllocationHdr_ID=a.C_AllocationHdr_ID)
     WHERE al.C_Payment_ID = p_C_Payment_ID
       AND a.IsActive='Y'
  LOOP
      v_Amt := currencyConvertRate(r.Amount, r.C_Currency_ID, v_Currency_ID, r.TasaDeCambio);
      v_AvailableAmt := v_AvailableAmt - v_Amt;
--      DBMS_OUTPUT.PUT_LINE('  Allocation=' || a.Amount || ' - Available=' || v_AvailableAmt);
  END LOOP;
  --  Ignore Rounding
  IF (v_AvailableAmt BETWEEN -0.00999 AND 0.00999) THEN
    v_AvailableAmt := 0;
  END IF;
  --  Round to penny
  v_AvailableAmt := ROUND(COALESCE(v_AvailableAmt,0), 2);
  RETURN  v_AvailableAmt;
END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION paymentavailable_lar(numeric)
  OWNER TO adempiere;

-- Registración de script
SELECT register_migration_script_lar('0141_ISSUE-114.sql', 'LAR', '')
;
