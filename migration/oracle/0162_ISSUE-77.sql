-- 14/01/2021 19:27:26 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Process_Para SET ColumnName='PDV',Updated=TO_DATE('2021-01-14 19:27:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000664
;

-- 14/01/2021 19:27:39 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Process_Para SET ColumnName='TipoCbte',Updated=TO_DATE('2021-01-14 19:27:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000665
;

-- 14/01/2021 19:30:46 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_TreeNodeMM SET Parent_ID=3000369, SeqNo=0, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000377
;

-- 14/01/2021 19:30:46 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_TreeNodeMM SET Parent_ID=3000369, SeqNo=1, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000367
;

-- 14/01/2021 19:30:49 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_TreeNodeMM SET Parent_ID=3000369, SeqNo=0, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000367
;

-- 14/01/2021 19:30:49 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_TreeNodeMM SET Parent_ID=3000369, SeqNo=1, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000377
;

-- 14/01/2021 19:30:49 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_TreeNodeMM SET Parent_ID=3000369, SeqNo=2, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000367
;

-- Registración de script
SELECT register_migration_script_lar('0162_ISSUE-77.sql', 'LAR', '') FROM dual
;
