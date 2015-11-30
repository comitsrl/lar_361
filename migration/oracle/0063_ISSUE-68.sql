-- 25/11/2015 9:32:39 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
UPDATE AD_Column SET Callout='org.compiere.model.CalloutPayment.esretencionsufrida',Updated=TO_DATE('2015-11-25 09:32:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000965
;

-- Registración de script
SELECT register_migration_script_lar('0063_ISSUE-68.sql', 'LAR', '') FROM DUAL
;
