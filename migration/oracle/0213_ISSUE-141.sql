ALTER TABLE M_InOut ALTER COLUMN cai TYPE character varying(14);


-- 22/06/2022 13:35:18 ART
-- ISSUE #141: Autoimpresor Remito
UPDATE AD_Column SET FieldLength=14,Updated=TO_DATE('2022-06-22 13:35:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003727
;

-- 22/06/2022 13:35:44 ART
-- ISSUE #141: Autoimpresor Remito
UPDATE AD_Field SET DisplayLength=14,Updated=TO_DATE('2022-06-22 13:35:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007035
;

-- Registración de script
SELECT register_migration_script_lar('0213_ISSUE-141.sql', 'LAR', '') FROM dual
;
