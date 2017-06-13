-- 19/04/2017 18:04:01 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Tab SET WhereClause='C_BankStatement.EsCierreCaja=''Y'' AND C_BankStatement.Description!=''Compensacion Transferencia''',Updated=TO_DATE('2017-04-19 18:04:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000007
;

-- Registración de script
SELECT register_migration_script_lar('0087_ISSUE-80.sql', 'LAR', '')
;
