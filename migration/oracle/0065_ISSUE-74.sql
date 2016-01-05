-- Corrección a la columna RemainingAmt (ya no se utiliza en la nueva ventana)

-- 04/01/2016 20:18:52 ART
-- ISSUE #74: Pagos : Varias Facturas -> Varios Pagos
UPDATE AD_Column SET ColumnSQL=NULL, DefaultValue=NULL, IsActive='N',Updated=TO_DATE('2016-01-04 20:18:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=14335
;

-- 04/01/2016 20:29:46 ART
-- ISSUE #74: Pagos : Varias Facturas -> Varios Pagos
UPDATE AD_Column SET ReadOnlyLogic='@C_Invoice_ID@!0 | @C_Order_ID@!0',Updated=TO_DATE('2016-01-04 20:29:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=8984
;

-- Registración de script
SELECT register_migration_script_lar('0065_ISSUE-74.sql', 'LAR', '') FROM dual
;

