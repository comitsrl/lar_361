-- 22/07/2016 21:13:43 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET IsAllowCopy='N',Updated=TO_DATE('2016-07-22 21:13:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002136
;

-- 22/07/2016 21:13:49 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET IsAllowCopy='N',Updated=TO_DATE('2016-07-22 21:13:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002142
;

-- 22/07/2016 21:13:56 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET IsAllowCopy='N',Updated=TO_DATE('2016-07-22 21:13:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002138
;

-- Registración de script
SELECT register_migration_script_lar('0074_ISSUE-77.sql', 'LAR', '') FROM dual
;
