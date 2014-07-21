-- 23/07/2012 23:04:11 ART
-- C_invoice_id not updateable on Payment and Receipt Headers
UPDATE AD_Column SET IsUpdateable='N',Updated=TO_DATE('2012-07-23 23:04:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000253
;

-- 24/07/2012 9:25:45 ART
-- Modify_RemainingAmt_SQL_to_include_witholdings_on_calc
UPDATE AD_Column SET ColumnSQL='(SELECT (SELECT GrandTotal FROM C_Invoice i WHERE i.C_Invoice_ID = LAR_PaymentHeader.C_Invoice_ID)-(SELECT COALESCE(Sum(PayAmt),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID) - (SELECT COALESCE(Sum(WriteOffAmt),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID))',Updated=TO_DATE('2012-07-24 09:25:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000264
;

