-- 18/05/2018 15:42:23 ART
-- ISSUE #107: Eliminar nodo de Impresión fiscal en Workflow DocAction
DELETE FROM AD_WF_NodeNext WHERE AD_WF_NodeNext_ID=3000000
;

-- 18/05/2018 15:44:21 ART
-- ISSUE #107: Eliminar nodo de Impresión fiscal en Workflow DocAction
UPDATE AD_WF_Node SET IsActive='N',Updated=TO_TIMESTAMP('2018-05-18 15:44:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_WF_Node_ID=3000000
;

-- Registración de script
SELECT register_migration_script_lar('0108_ISSUE-107.sql', 'LAR', '')
;
