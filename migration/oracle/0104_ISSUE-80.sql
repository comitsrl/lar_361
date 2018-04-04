-- No permitir ingresar cheques duplicados en el movimiento de caja.
CREATE UNIQUE INDEX LAR_RetiroCajaLine_Unique ON LAR_RetiroCajaLine USING btree (LAR_RetiroCaja_ID, Cobro_ID);

-- 04/04/2018 18:27:24 ART
-- ISSUE #80: Corrección ventana Movimientos de Caja
UPDATE AD_Column SET IsUpdateable='N',Updated=TO_DATE('2018-04-04 18:27:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001817
;

-- 04/04/2018 18:27:40 ART
-- ISSUE #80: Corrección ventana Movimientos de Caja
UPDATE AD_Column SET IsUpdateable='N',Updated=TO_DATE('2018-04-04 18:27:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002121
;

-- Registración de script
SELECT register_migration_script_lar('0104_ISSUE-80.sql', 'LAR', '') FROM dual
;
