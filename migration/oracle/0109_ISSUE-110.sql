-- 06/06/2018 20:45:46 ART
-- ISSUE #110: Generar Factura desde Remito
UPDATE AD_Field SET DisplayLogic='@MovementType@=''C+'' | @MovementType@=''C-''',Updated=TO_DATE('2018-06-06 20:45:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=4243
;

-- Registración de script
SELECT register_migration_script_lar('0109_ISSUE-110.sql', 'LAR', '') FROM dual
;
