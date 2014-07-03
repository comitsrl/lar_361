-- 03/07/2014 12:24:31 ART
-- LAR #65: Completamiento e Impresion Fiscal de Factura desde Remito
UPDATE AD_Ref_Table SET WhereClause='C_POS.IsActive=''Y'' AND C_POS.IsShipment=''N''',Updated=TO_DATE('2014-07-03 12:24:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=3000005
;

-- Registración de script
SELECT register_migration_script_lar('0058_ISSUE-65.sql', 'LAR', '') FROM DUAL
;
