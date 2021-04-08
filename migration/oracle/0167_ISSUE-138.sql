-- 08/04/2021 10:24:34 ART
-- ISSUE #138: Ajustes en DA - Campos, Ventanas y Pestañas
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Fecha Inicio Activ.',PrintName='Fecha Inicio Activ.',Updated=TO_DATE('2021-04-08 10:24:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000437 AND AD_Language='es_AR'
;

-- 08/04/2021 10:25:58 ART
-- ISSUE #138: Ajustes en DA - Campos, Ventanas y Pestañas
UPDATE AD_Column SET AD_Reference_ID=15,Updated=TO_DATE('2021-04-08 10:25:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002035
;

-- 08/04/2021 14:28:55 ART
-- ISSUE #138: Ajustes en DA - Campos, Ventanas y Pestañas
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Factura de Activos',PrintName='Factura de Activos',Updated=TO_DATE('2021-04-08 14:28:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=55168 AND AD_Language='es_AR'
;

-- 08/04/2021 14:29:28 ART
-- ISSUE #138: Ajustes en DA - Campos, Ventanas y Pestañas
UPDATE AD_Field SET IsDisplayed='N',Updated=TO_DATE('2021-04-08 14:29:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=200050
;

-- 08/04/2021 14:29:54 ART
-- ISSUE #138: Ajustes en DA - Campos, Ventanas y Pestañas
UPDATE AD_Field SET DisplayLogic=NULL,Updated=TO_DATE('2021-04-08 14:29:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007000
;

-- 08/04/2021 14:30:08 ART
-- ISSUE #138: Ajustes en DA - Campos, Ventanas y Pestañas
UPDATE AD_Field SET DisplayLogic=NULL,Updated=TO_DATE('2021-04-08 14:30:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006608
;

-- 08/04/2021 15:34:32 ART
-- ISSUE #138: Ajustes en DA - Campos, Ventanas y Pestañas
UPDATE AD_Element_Trl SET Name='Plazo Pago FCE',PrintName='Plazo Pago FCE',Updated=TO_DATE('2021-04-08 15:34:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000349 AND AD_Language='es_AR'
;

-- Registración de script
SELECT register_migration_script_lar('0167_ISSUE-138.sql', 'LAR', '') FROM dual
;
