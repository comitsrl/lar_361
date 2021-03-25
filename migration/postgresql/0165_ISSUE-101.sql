-- Corrección función bompreciofinal. De esta manera, se recupera el precio final directamente de la versión de lista de precios.
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
	SELECT	COALESCE(SUM(PrecioStd_Final), 0)
	INTO	v_Price
	FROM	M_ProductPrice
	WHERE M_PriceList_Version_ID=PriceList_Version_ID AND M_Product_ID=Product_ID;

	--	No Price - Check if BOM
	IF (v_Price = 0) THEN
		FOR bom IN  
			SELECT b.M_ProductBOM_ID, b.BOMQty, p.IsBOM
			FROM M_Product_BOM b, M_Product p
			WHERE b.M_ProductBOM_ID=p.M_Product_ID
		  	AND b.M_Product_ID=Product_ID
		LOOP
			v_ProductPrice := bompreciofinal (bom.M_ProductBOM_ID, PriceList_Version_ID);
			v_Price := v_Price + (bom.BOMQty * v_ProductPrice);
		END LOOP;
	END IF;
	--
	RETURN v_Price;
	
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION bompreciofinal(numeric, numeric)
  OWNER TO adempiere;

-- Registración de script
SELECT register_migration_script_lar('0165_ISSUE-101.sql', 'LAR', '')
;
