-- 03/12/2019 13:27:46 ART
-- ISSUE #114: Moneda dolar con 4 decimales.
UPDATE C_Currency SET StdPrecision=4,Updated=TO_DATE('2019-12-03 13:27:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_Currency_ID=100
;

-- Registración de script
SELECT register_migration_script_lar('0145_ISSUE-114.sql', 'LAR', '') FROM dual
;
