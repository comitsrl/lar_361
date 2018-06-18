-- Indices para las tablas LAR_PaymentHeader, C_Payment.
CREATE INDEX c_payment_doctype
  ON c_payment
  USING btree
  (c_doctype_id);

CREATE INDEX c_payment_created
  ON c_payment
  USING btree
  (created);

CREATE INDEX lar_paymentheader_created
  ON lar_paymentheader
  USING btree
  (created);

CREATE INDEX lar_paymentheader_bpartner
  ON lar_paymentheader
  USING btree
  (c_bpartner_id);

CREATE INDEX lar_paymentheader_bankaccount
  ON lar_paymentheader
  USING btree
  (c_bankaccount_id);

CREATE INDEX lar_paymentheader_doctype
  ON lar_paymentheader
  USING btree
  (c_doctype_id);

CREATE INDEX lar_paymentheader_invoice
  ON lar_paymentheader
  USING btree
  (c_invoice_id);

CREATE INDEX c_payment_receipt
  ON c_payment
  USING btree
  (isReceipt);

CREATE INDEX lar_paymentheader_receipt
  ON lar_paymentheader
  USING btree
  (isReceipt);

-- 18/06/2018 15:49:21 ART
-- ISSUE #112: Otimizar rendimiento ventana recibos.
UPDATE AD_Field SET IsActive='N',Updated=TO_DATE('2018-06-18 15:49:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000601
;

-- 18/06/2018 15:49:27 ART
-- ISSUE #112: Otimizar rendimiento ventana recibos.
UPDATE AD_Field SET IsActive='N',Updated=TO_DATE('2018-06-18 15:49:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3004050
;

-- 18/06/2018 15:55:12 ART
-- ISSUE #112: Otimizar rendimiento ventana recibos.
UPDATE AD_Field SET IsActive='N',Updated=TO_DATE('2018-06-18 15:55:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000765
;

-- 18/06/2018 15:55:40 ART
-- ISSUE #112: Otimizar rendimiento ventana recibos.
UPDATE AD_Field SET IsActive='N',Updated=TO_DATE('2018-06-18 15:55:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001299
;

-- Registración de script
SELECT register_migration_script_lar('0110_ISSUE-112.sql', 'LAR', '') FROM dual
;
