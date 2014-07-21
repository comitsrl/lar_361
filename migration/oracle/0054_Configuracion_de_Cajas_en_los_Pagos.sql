-- 27/06/2013 18:27:23 ART
-- Configuración de Cajas en los Pagos
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3000389
;

-- 27/06/2013 18:27:23 ART
-- Configuración de Cajas en los Pagos
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3000397
;

-- 27/06/2013 18:27:23 ART
-- Configuración de Cajas en los Pagos
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3000388
;

-- 27/06/2013 18:27:23 ART
-- Configuración de Cajas en los Pagos
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3000398
;

-- 27/06/2013 18:27:23 ART
-- Configuración de Cajas en los Pagos
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3000899
;

-- 27/06/2013 18:27:23 ART
-- Configuración de Cajas en los Pagos
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3000387
;

-- 27/06/2013 18:27:23 ART
-- Configuración de Cajas en los Pagos
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000400
;

-- 27/06/2013 18:27:23 ART
-- Configuración de Cajas en los Pagos
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000599
;

-- 27/06/2013 18:27:23 ART
-- Configuración de Cajas en los Pagos
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000401
;

-- 27/06/2013 18:27:23 ART
-- Configuración de Cajas en los Pagos
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000600
;

-- 27/06/2013 18:27:23 ART
-- Configuración de Cajas en los Pagos
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3001147
;

-- 27/06/2013 18:27:23 ART
-- Configuración de Cajas en los Pagos
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3001142
;

-- 27/06/2013 18:27:23 ART
-- Configuración de Cajas en los Pagos
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000402
;

-- 27/06/2013 18:27:34 ART
-- Configuración de Cajas en los Pagos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2013-06-27 18:27:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000389
;

-- 27/06/2013 18:31:41 ART
-- Configuración de Cajas en los Pagos
UPDATE AD_Val_Rule SET Code='C_BankAccount.IsDrawer=''Y'' AND C_BankAccount.AD_Org_ID=@AD_Org_ID@', Name='C_BankAccount is Drawer Org',Updated=TO_DATE('2013-06-27 18:31:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000004
;

-- 27/06/2013 18:31:55 ART
-- Configuración de Cajas en los Pagos
UPDATE AD_Column SET AD_Val_Rule_ID=3000004,Updated=TO_DATE('2013-06-27 18:31:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000254
;

-- 27/06/2013 18:41:58 ART
-- Configuración de Cajas en los Pagos
UPDATE AD_Field SET DefaultValue='@SQL=SELECT C_BankAccount_ID FROM LAR_PaymentHeader ph WHERE ph.LAR_PaymentHeader_ID = @LAR_PaymentHeader_ID@',Updated=TO_DATE('2013-06-27 18:41:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000426
;

-- 27/06/2013 18:43:38 ART
-- Configuración de Cajas en los Pagos
UPDATE AD_Field SET IsMandatory='Y',Updated=TO_DATE('2013-06-27 18:43:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000389
;

-- 27/06/2013 18:45:11 ART
-- Configuración de Cajas en los Pagos
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2013-06-27 18:45:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000426
;

SELECT register_migration_script_lar('0054_Configuracion_de_Cajas_en_los_Pagos.sql','LAR','') FROM dual;
