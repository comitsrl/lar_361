-- 29/03/2019 16:35:08 ART
-- ISSUE #114: Tasa del dia editable en recibos.
UPDATE AD_Column SET ColumnSQL=NULL,Updated=TO_DATE('2019-03-29 16:35:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003028
;

-- 29/03/2019 16:37:04 ART
-- ISSUE #114: Tasa del dia editable en recibos.
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Tasa Fecha de Acreditación',Updated=TO_DATE('2019-03-29 16:37:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005876 AND AD_Language='es_AR'
;

-- 29/03/2019 16:37:13 ART
-- ISSUE #114: Tasa del dia editable en recibos.
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2019-03-29 16:37:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005876
;

-- 29/03/2019 16:38:04 ART
-- ISSUE #114: Tasa del dia editable en recibos.
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Tasa Fecha de Acreditación',Updated=TO_DATE('2019-03-29 16:38:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005880 AND AD_Language='es_AR'
;

-- 29/03/2019 16:38:29 ART
-- ISSUE #114: Tasa del dia editable en recibos.
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2019-03-29 16:38:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005880
;

-- 29/03/2019 16:48:19 ART
-- ISSUE #114: Tasa del dia editable en recibos.
UPDATE AD_Column SET ColumnSQL='(CurrencyConvertRate ((SELECT COALESCE(Sum(Amount),0) FROM C_PaymentAllocate i WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = i.LAR_PaymentHeader_ID), 100, 118, LAR_PaymentHeader.TasaDelDia) - CurrencyConvertRate ((SELECT COALESCE(Sum(Amount),0) FROM C_PaymentAllocate i WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = i.LAR_PaymentHeader_ID), 100, 118, LAR_PaymentHeader.TasaDeCambio))',Updated=TO_DATE('2019-03-29 16:48:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003029
;

-- 29/03/2019 16:52:10 ART
-- ISSUE #114: Tasa del dia editable en recibos.
UPDATE AD_Column SET ColumnSQL='((LAR_TasaDelDia - LAR_PaymentHeader.TasaDeCambio) * 100 / CASE WHEN LAR_PaymentHeader.TasaDeCambio > 0 THEN LAR_PaymentHeader.TasaDeCambio ELSE 100 END)',Updated=TO_DATE('2019-03-29 16:52:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003363
;

-- 29/03/2019 16:57:30 ART
-- ISSUE #114: Tasa del dia editable en recibos.
UPDATE AD_Column SET ColumnSQL='((LAR_PaymentHeader.TasaDelDia - LAR_PaymentHeader.TasaDeCambio) * 100 / CASE WHEN LAR_PaymentHeader.TasaDeCambio > 0 THEN LAR_PaymentHeader.TasaDeCambio ELSE 100 END)',Updated=TO_DATE('2019-03-29 16:57:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003363
;

-- 29/03/2019 16:59:49 ART
-- ISSUE #114: Tasa del dia editable en recibos.
UPDATE AD_Column SET ColumnSQL='((LAR_PaymentHeader.TasaDelDia - LAR_PaymentHeader.TasaDeCambio) * 100 / CASE WHEN LAR_PaymentHeader.TasaDeCambio > 0 THEN LAR_PaymentHeader.TasaDeCambio ELSE 1 END)',Updated=TO_DATE('2019-03-29 16:59:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003363
;

-- 29/03/2019 17:03:31 ART
-- ISSUE #114: Tasa del dia editable en recibos.
UPDATE AD_Field SET DisplayLogic='@TasaDelDia@>0',Updated=TO_DATE('2019-03-29 17:03:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006245
;

-- Registración de script
SELECT register_migration_script_lar('0127_ISSUE-114.sql', 'LAR', '') FROM dual
;

