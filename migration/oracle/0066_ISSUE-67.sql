-- 04/01/2016 21:18:24 ART
-- ISSUE #67: Cobros : Varias Facturas -> Varios Pagos
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,Description,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('C_Invoice.DocStatus IN (''CO'', ''CL'') AND C_Invoice.C_Currency_ID=@C_Currency_ID@ AND C_Invoice.C_BPartner_ID=@C_BPartner_ID@ AND C_Invoice.IsSOTrx=''Y''','S',3000025,'LAR','C_Invoice de Vs Facturas vs Cobros','Completa, cerrada, Transacción de Ventas',100,100,TO_DATE('2016-01-04 21:18:23','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_DATE('2016-01-04 21:18:23','YYYY-MM-DD HH24:MI:SS'))
;

-- 04/01/2016 21:21:10 ART
-- ISSUE #67: Cobros : Varias Facturas -> Varios Pagos
UPDATE AD_Val_Rule SET Code='C_Invoice.DocStatus IN (''CO'', ''CL'') AND C_Invoice.C_BPartner_ID=@C_BPartner_ID@ AND C_Invoice.IsSOTrx=''@IsSOTrx@''',Updated=TO_DATE('2016-01-04 21:21:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000025
;

-- 04/01/2016 21:21:36 ART
-- ISSUE #67: Cobros : Varias Facturas -> Varios Pagos
UPDATE AD_Column SET AD_Val_Rule_ID=3000025,Updated=TO_DATE('2016-01-04 21:21:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=14328
;

-- Registración de script
SELECT register_migration_script_lar('0066_ISSUE-67.sql', 'LAR', '') FROM dual
;

