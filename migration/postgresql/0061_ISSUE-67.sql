-- 23/11/2015 10:52:41 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Column SET IsIdentifier='Y', IsUpdateable='N', IsAllowCopy='N',Updated=TO_TIMESTAMP('2015-11-23 10:52:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000235
;

-- Registración de Script
SELECT register_migration_script_lar('0061_ISSUE-67.sql','LAR','');
