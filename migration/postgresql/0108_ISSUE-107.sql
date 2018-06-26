-- 18/05/2018 15:42:23 ART
-- ISSUE #107: Eliminar nodo de Impresión fiscal en Workflow DocAction
DELETE FROM AD_WF_NodeNext WHERE AD_WF_NodeNext_ID=3000000
;

-- 18/05/2018 15:44:21 ART
-- ISSUE #107: Eliminar nodo de Impresión fiscal en Workflow DocAction
UPDATE AD_WF_Node SET IsActive='N',Updated=TO_TIMESTAMP('2018-05-18 15:44:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_WF_Node_ID=3000000
;

-- 04/06/2018 17:23:49 ART
-- ISSUE #107: Eliminar nodo de Impresión fiscal en Workflow DocAction
UPDATE AD_WF_Node SET IsActive='N',Updated=TO_TIMESTAMP('2018-06-04 17:23:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_WF_Node_ID=3000008
;

-- 04/06/2018 17:23:55 ART
-- ISSUE #107: Eliminar nodo de Impresión fiscal en Workflow DocAction
UPDATE AD_WF_Node SET IsActive='N',Updated=TO_TIMESTAMP('2018-06-04 17:23:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_WF_Node_ID=3000016
;

-- 04/06/2018 17:24:32 ART
-- ISSUE #107: Eliminar nodo de Impresión fiscal en Workflow DocAction
DELETE FROM AD_WF_NodeNext WHERE AD_WF_NodeNext_ID=3000006
;

-- Registración de script
SELECT register_migration_script_lar('0108_ISSUE-107.sql', 'LAR', '')
;
