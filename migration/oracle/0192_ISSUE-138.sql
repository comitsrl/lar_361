-- 24/08/2021 17:05:52 ART
-- ISSUE #138: Corrección validación de facturas en C_PaymentAllocate
UPDATE AD_Val_Rule SET Code='C_Invoice.DocStatus IN (''CO'', ''CL'') AND C_Invoice.C_BPartner_ID=@C_BPartner_ID@ AND C_Invoice.IsSOTrx=''@IsSOTrx@'' AND C_Invoice.C_Invoice_ID NOT IN (SELECT C_Invoice_ID FROM C_PaymentAllocate WHERE LAR_PaymentHeader_ID = @LAR_PaymentHeader_ID@) AND C_Invoice.C_DocType_ID NOT IN (SELECT C_DocType_ID FROM C_DocType WHERE DocBaseType IN (''APC'', ''ARC''))',Updated=TO_DATE('2021-08-24 17:05:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000025
;

-- Registración de script
SELECT register_migration_script_lar('0192_ISSUE-138.sql', 'LAR', '') FROM dual
;
