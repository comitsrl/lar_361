-- Se agrega el tipo de tarjeta Actual (Reemplazo por la Inactiva ATM)

-- 06/01/2017 15:56:07 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Ref_List SET Name='Actual', IsActive='Y',Updated=TO_TIMESTAMP('2017-01-06 15:56:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=213
;

-- 06/01/2017 15:56:07 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Ref_List_Trl SET IsTranslated='N' WHERE AD_Ref_List_ID=213
;

-- 06/01/2017 15:56:13 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Ref_List_Trl SET IsTranslated='Y',Name='Actual',Updated=TO_TIMESTAMP('2017-01-06 15:56:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=213 AND AD_Language='es_AR'
;

-- 07/01/2017 10:11:38 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnSQL='(SELECT (C_BankStatement.ScrutinizedCashAmt - (COALESCE(Sum(TrxAmt),0) + C_BankStatement.SaldoInicial)) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''X''))',Updated=TO_TIMESTAMP('2017-01-07 10:11:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000158
;

-- Registración de script
SELECT register_migration_script_lar('0084_ISSUE-80', 'LAR', '')
;
