-- 12/08/2021 14:51:53 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Val_Rule SET Code='LAR_Tarjeta_Credito.EsDebito=''N'' AND LAR_Tarjeta_Credito.EsDeposito=''N'' AND LAR_Tarjeta_Credito.EsChequeEmitido=''N'' AND LAR_Tarjeta_Credito.EsQR = ''N''',Updated=TO_TIMESTAMP('2021-08-12 14:51:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000031
;

-- Registración de script
SELECT register_migration_script_lar('0191_ISSUE-80.sql', 'LAR', '')
;
