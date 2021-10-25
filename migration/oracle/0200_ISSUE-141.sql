-- Cambiar a 14 dígitos el CAI
ALTER TABLE C_DocType_CAI
ALTER COLUMN CAI TYPE character varying(14)
;
-- 25/10/2021 11:12:33 ART
-- ISSUE #141: Autoimpresor de Remitos
UPDATE AD_Column SET FieldLength=14, VFormat='00000000000000',Updated=TO_DATE('2021-10-25 11:12:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003716
;

-- Registración de script
SELECT register_migration_script_lar('0200_ISSUE-141.sql', 'LAR', '') FROM dual
;
