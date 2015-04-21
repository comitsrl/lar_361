-- 16/05/2014 10:19:59 ART
-- LAR #65: Completamiento e Impresion Fiscal de Factura desde Remito
UPDATE AD_Ref_Table SET WhereClause='C_POS.IsActive = ''Y'' AND C_POS.AD_Org_ID = @#AD_Org_ID@ AND C_POS.IsShipment=''N''',Updated=TO_DATE('2014-05-16 10:19:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=3000022
;
