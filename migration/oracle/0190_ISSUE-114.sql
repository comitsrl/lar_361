-- 06/08/2021 13:49:32 ART
-- ISSUE #114: Restricciones de tasas, en circuito de compras
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2021-08-06 13:49:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=8649
;

-- 06/08/2021 13:49:45 ART
-- ISSUE #114: Restricciones de tasas, en circuito de compras
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2021-08-06 13:49:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=8652
;

-- 06/08/2021 13:51:41 ART
-- ISSUE #114: Restricciones de tasas, en circuito de compras
UPDATE AD_Column SET IsUpdateable='N',Updated=TO_DATE('2021-08-06 13:51:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=10294
;

-- 06/08/2021 13:52:07 ART
-- ISSUE #114: Restricciones de tasas, en circuito de compras
UPDATE AD_Column SET IsUpdateable='N',Updated=TO_DATE('2021-08-06 13:52:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=786
;

-- 06/08/2021 13:52:13 ART
-- ISSUE #114: Restricciones de tasas, en circuito de compras
UPDATE AD_Column SET IsUpdateable='N',Updated=TO_DATE('2021-08-06 13:52:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=787
;

-- 06/08/2021 13:52:26 ART
-- ISSUE #114: Restricciones de tasas, en circuito de compras
UPDATE AD_Column SET IsUpdateable='N',Updated=TO_DATE('2021-08-06 13:52:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=456
;

-- 06/08/2021 13:52:33 ART
-- ISSUE #114: Restricciones de tasas, en circuito de compras
UPDATE AD_Column SET IsUpdateable='N',Updated=TO_DATE('2021-08-06 13:52:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=455
;

-- 06/08/2021 13:52:39 ART
-- ISSUE #114: Restricciones de tasas, en circuito de compras
UPDATE AD_Column SET IsUpdateable='N',Updated=TO_DATE('2021-08-06 13:52:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=453
;

-- 06/08/2021 13:52:44 ART
-- ISSUE #114: Restricciones de tasas, en circuito de compras
UPDATE AD_Column SET IsUpdateable='N',Updated=TO_DATE('2021-08-06 13:52:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=454
;

-- 06/08/2021 14:10:47 ART
-- ISSUE #114: Restricciones de tasas, en circuito de compras
UPDATE AD_Field SET DefaultValue='-1',Updated=TO_DATE('2021-08-06 14:10:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=1342
;

-- 06/08/2021 14:11:55 ART
-- ISSUE #114: Restricciones de tasas, en circuito de compras
UPDATE AD_Field SET DefaultValue='118',Updated=TO_DATE('2021-08-06 14:11:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=1343
;

-- 06/08/2021 14:15:59 ART
-- ISSUE #114: Restricciones de tasas, en circuito de compras
UPDATE AD_Field SET DefaultValue='@$C_Currency_ID@',Updated=TO_DATE('2021-08-06 14:15:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=1343
;

-- Registración de script
SELECT register_migration_script_lar('0190_ISSUE-114.sql', 'LAR', '') FROM dual
;
