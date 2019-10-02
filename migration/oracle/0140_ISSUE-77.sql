-- 02/10/2019 18:19:25 ART
-- ISSUE #77: Tasa de Cambio en Asignaciones.
UPDATE AD_Column SET IsMandatory='N',Updated=TO_DATE('2019-10-02 18:19:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003527
;

-- Registración de script
SELECT register_migration_script_lar('0140_ISSUE-77.sql', 'LAR', '') FROM dual
;
