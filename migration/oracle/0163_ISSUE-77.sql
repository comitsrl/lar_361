-- 12/02/2021 13:27:43 ART
-- Traducción Columna Source_Invoice_ID en la ventana Facturas (Cliente)
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Factura Origen',PrintName='Factura Origen',Description='Factura que origina el documento actual',Updated=TO_DATE('2021-02-12 13:27:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000079 AND AD_Language='es_AR'
;

-- Registración de script
SELECT register_migration_script_lar('0163_ISSUE-77.sql', 'LAR', '') FROM dual
;
