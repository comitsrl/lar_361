-- Funcion que calcula el precio final del producto (precio estandar + impuesto interno + iva)
CREATE OR REPLACE FUNCTION bompreciofinal(
    product_id numeric,
    pricelist_version_id numeric)
  RETURNS numeric AS
$BODY$
DECLARE
	v_Price	NUMERIC;
	v_ProductPrice	NUMERIC;
	v_Rate NUMERIC;
	bom RECORD;

BEGIN
	--	Try to get price from PriceList directly
	SELECT	t.Rate
	INTO	v_Rate
	FROM	M_Product p
	JOIN    C_Tax t ON p.C_TaxCategory_ID=t.C_TaxCategory_ID
	WHERE   M_Product_ID = Product_ID AND t.IsDefault = 'Y';

	v_ProductPrice = bomPriceStd(Product_ID, PriceList_Version_ID);

	IF (v_ProductPrice > 0) THEN
		v_Price = ROUND(v_ProductPrice + (v_ProductPrice * v_rate / 100), 2);
	END IF;
	--
	RETURN v_Price;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION bompreciofinal(numeric, numeric)
  OWNER TO adempiere;

-- 05/01/2018 21:22:50 ART
-- ISSUE #104: Corrección traducción columna Value.
UPDATE AD_Message_Trl SET MsgText='Código',Updated=TO_DATE('2018-01-05 21:22:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Message_ID=592 AND AD_Language='es_AR'
;

-- Registración de script
SELECT register_migration_script_lar('0102_ISSUE-104.sql', 'LAR', '') FROM dual
;
