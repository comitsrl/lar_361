-- 03/08/2020 21:22:59 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_TIMESTAMP('2020-08-03 21:22:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=5496
;

-- 03/08/2020 21:23:17 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_TIMESTAMP('2020-08-03 21:23:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3879
;

-- Registración de script
SELECT register_migration_script_lar('0156_ISSUE-80.sql', 'LAR', '')
;
