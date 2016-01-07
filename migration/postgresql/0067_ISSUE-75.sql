-- 06/01/2016 23:01:20 ART
-- ISSUE #75: Orden de Nota de Crédito
INSERT INTO AD_Process (AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Classname,CopyFromProcess,Value,Name,AD_Org_ID,AD_Client_ID,UpdatedBy,Created,CreatedBy,Updated,IsActive) VALUES (3000109,'N','N','3','N','N','Y','LAR',31493,3002,'ar.com.ergio.process.OrderFiscalPrinting','N','LAR_OrderFiscalPrinting','LAR_OrderFiscalPrinting',0,0,100,TO_TIMESTAMP('2016-01-06 23:01:14','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2016-01-06 23:01:14','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 06/01/2016 23:01:20 ART
-- ISSUE #75: Orden de Nota de Crédito
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000109 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 06/01/2016 23:07:26 ART
-- ISSUE #75: Orden de Nota de Crédito
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,WaitTime,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,"limit",WorkingTime,XPosition,YPosition,WaitingTime,AD_Process_ID,AD_Workflow_ID,"action",SplitElement,Value,Name,UpdatedBy,AD_Org_ID,Created,CreatedBy,IsActive,Updated,AD_Client_ID) VALUES (3000016,0,0,0,0,'CO',0,'LAR','Y','X',0,0,0,0,0,3000109,116,'P','X','(DocInvFiscalPrinting)','LAR_OrdertFiscalPrinting',100,0,TO_TIMESTAMP('2016-01-06 23:07:20','YYYY-MM-DD HH24:MI:SS'),100,'Y',TO_TIMESTAMP('2016-01-06 23:07:20','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 06/01/2016 23:07:27 ART
-- ISSUE #75: Orden de Nota de Crédito
INSERT INTO AD_WF_Node_Trl (AD_Language,AD_WF_Node_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_WF_Node_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_WF_Node t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_WF_Node_ID=3000016 AND NOT EXISTS (SELECT * FROM AD_WF_Node_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_WF_Node_ID=t.AD_WF_Node_ID)
;

-- 06/01/2016 23:30:28 ART
-- ISSUE #75: Orden de Nota de Crédito
INSERT INTO AD_WF_NodeNext (EntityType,IsStdUserWorkflow,AD_WF_NodeNext_ID,AD_WF_Node_ID,SeqNo,AD_WF_Next_ID,Created,UpdatedBy,CreatedBy,AD_Org_ID,IsActive,Updated,AD_Client_ID) VALUES ('LAR','N',3000016,3000008,10,3000016,TO_TIMESTAMP('2016-01-06 23:30:27','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',TO_TIMESTAMP('2016-01-06 23:30:27','YYYY-MM-DD HH24:MI:SS'),0)
;

-- Evita error SQL en la columna Source_Order_ID
-- 06/01/2016 23:56:27 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Column SET AD_Reference_ID=30,Updated=TO_TIMESTAMP('2016-01-06 23:56:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000888
;

-- 07/01/2016 0:02:15 ART
-- ISSUE #75: Orden de Nota de Crédito
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,Description,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000039,'T','LAR','N','C_Order C_Order_ID','Order',0,0,100,TO_TIMESTAMP('2016-01-07 00:02:14','YYYY-MM-DD HH24:MI:SS'),'Y',TO_TIMESTAMP('2016-01-07 00:02:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 07/01/2016 0:02:15 ART
-- ISSUE #75: Orden de Nota de Crédito
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000039 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 07/01/2016 0:04:02 ART
-- ISSUE #75: Orden de Nota de Crédito
INSERT INTO AD_Ref_Table (IsValueDisplayed,WhereClause,AD_Table_ID,AD_Reference_ID,AD_Key,AD_Display,EntityType,CreatedBy,Created,Updated,AD_Client_ID,UpdatedBy,AD_Org_ID,IsActive) VALUES ('N','C_Order.IsSoTrx = ''Y''',259,3000039,2161,2161,'LAR',100,TO_TIMESTAMP('2016-01-07 00:04:02','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-01-07 00:04:02','YYYY-MM-DD HH24:MI:SS'),0,100,0,'Y')
;

-- 07/01/2016 0:04:23 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Column SET AD_Reference_Value_ID=3000039,Updated=TO_TIMESTAMP('2016-01-07 00:04:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000888
;


-- Registración de Script
SELECT register_migration_script_lar('0067_ISSUE-75.sql','LAR','')
;
