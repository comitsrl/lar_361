-- 30/04/2020 19:37:10 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@DocSubtypeCAE@ = 203 | @DocSubtypeCAE@ = 208 | @DocSubtypeCAE@ = 213',Updated=TO_DATE('2020-04-30 19:37:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006572
;

-- Registración de script
SELECT register_migration_script_lar('0153_ISSUE-77.sql', 'LAR', '') FROM dual
;
