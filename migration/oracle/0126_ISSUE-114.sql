-- Utilizar precisión standart de la moneda, para realizar el redondeo.
CREATE OR REPLACE FUNCTION currencyconvertrate(
    p_amount numeric,
    p_curfrom_id numeric,
    p_curto_id numeric,
    p_rate numeric)
  RETURNS numeric AS
$BODY$	

BEGIN
	        --	Return Amount
		IF (p_Amount = 0 OR p_Rate = 0 OR p_CurFrom_ID = p_CurTo_ID) THEN
			RETURN p_Amount;
		END IF;
		--	Return NULL
		IF (p_Amount IS NULL OR p_Rate IS NULL OR p_CurFrom_ID IS NULL OR p_CurTo_ID IS NULL) THEN
			RETURN NULL;
		END IF;

		-- Standart Precision
		RETURN currencyRound(p_Amount * p_Rate, p_CurTo_ID, 'N');
END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION currencyconvertrate(numeric, numeric, numeric, numeric)
  OWNER TO adempiere;

-- Registración de script
SELECT register_migration_script_lar('0126_ISSUE-114.sql', 'LAR', '') FROM dual
;
