-- 11/09/2012 18:44:48 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
ALTER TABLE LAR_PaymentHeader ADD COLUMN DocAction Character Varying(2);
ALTER TABLE LAR_PaymentHeader DROP COLUMN ProcessIt;

-- 11/09/2012 18:44:48 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
INSERT INTO AD_Workflow (Cost,WorkingTime,AccessLevel,Author,Duration,DurationUnit,EntityType,IsDefault,IsValid,"limit",Priority,PublishStatus,ValidateWorkflow,Version,AD_Table_ID,DocumentNo,AD_Workflow_ID,WaitingTime,IsBetaFunctionality,WorkflowType,Value,Name,Description,UpdatedBy,Updated,Created,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive) VALUES (0,0,'1','Ergio',0,'D','LAR','N','N',0,0,'R','N',0,3000010,'10000001',3000000,0,'N','P','Process_LAR_PaymentHeader','Process_LAR_PaymentHeader','(Standard Process LAR_PaymentHeader)',100,TO_TIMESTAMP('2012-09-11 18:44:47','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-09-11 18:44:47','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y')
;

-- 11/09/2012 18:44:48 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
INSERT INTO AD_Workflow_Trl (AD_Language,AD_Workflow_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Workflow_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Workflow t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Workflow_ID=3000000 AND NOT EXISTS (SELECT * FROM AD_Workflow_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Workflow_ID=t.AD_Workflow_ID)
;

-- 11/09/2012 18:49:06 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,"limit",WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,AD_Workflow_ID,"action",SplitElement,Value,Name,Description,UpdatedBy,AD_Org_ID,Created,CreatedBy,IsActive,Updated,AD_Client_ID) VALUES (3000001,0,0,0,'CO',0,'LAR','Y','X',0,0,0,0,0,0,3000000,'Z','X','(Start)','(Start)','(Standard Node)',100,0,TO_TIMESTAMP('2012-09-11 18:49:04','YYYY-MM-DD HH24:MI:SS'),100,'Y',TO_TIMESTAMP('2012-09-11 18:49:04','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 11/09/2012 18:49:06 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
INSERT INTO AD_WF_Node_Trl (AD_Language,AD_WF_Node_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_WF_Node_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_WF_Node t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_WF_Node_ID=3000001 AND NOT EXISTS (SELECT * FROM AD_WF_Node_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_WF_Node_ID=t.AD_WF_Node_ID)
;

-- 11/09/2012 18:50:33 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,"limit",WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,AD_Workflow_ID,"action",SplitElement,Value,Name,Description,UpdatedBy,AD_Org_ID,Created,CreatedBy,IsActive,Updated,AD_Client_ID) VALUES (3000002,0,0,0,'--',0,'LAR','Y','X',0,0,0,0,0,0,3000000,'D','X','(DocAuto)','(DocAuto)','(Standard Node)',100,0,TO_TIMESTAMP('2012-09-11 18:50:32','YYYY-MM-DD HH24:MI:SS'),100,'Y',TO_TIMESTAMP('2012-09-11 18:50:32','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 11/09/2012 18:50:33 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
INSERT INTO AD_WF_Node_Trl (AD_Language,AD_WF_Node_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_WF_Node_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_WF_Node t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_WF_Node_ID=3000002 AND NOT EXISTS (SELECT * FROM AD_WF_Node_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_WF_Node_ID=t.AD_WF_Node_ID)
;

-- 11/09/2012 18:52:28 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,"limit",WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,AD_Workflow_ID,"action",SplitElement,Value,Name,Description,UpdatedBy,AD_Org_ID,Created,CreatedBy,IsActive,Updated,AD_Client_ID) VALUES (3000003,0,0,0,'CO',0,'LAR','Y','X',0,0,0,0,0,0,3000000,'D','X','(DocComplete)','(DocComplete)','(Standard Node)',100,0,TO_TIMESTAMP('2012-09-11 18:52:27','YYYY-MM-DD HH24:MI:SS'),100,'Y',TO_TIMESTAMP('2012-09-11 18:52:27','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 11/09/2012 18:52:28 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
INSERT INTO AD_WF_Node_Trl (AD_Language,AD_WF_Node_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_WF_Node_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_WF_Node t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_WF_Node_ID=3000003 AND NOT EXISTS (SELECT * FROM AD_WF_Node_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_WF_Node_ID=t.AD_WF_Node_ID)
;

-- 11/09/2012 18:53:37 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,"limit",WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,AD_Workflow_ID,"action",SplitElement,Value,Name,Description,UpdatedBy,AD_Org_ID,Created,CreatedBy,IsActive,Updated,AD_Client_ID) VALUES (3000004,0,0,0,'PR',0,'LAR','Y','X',0,0,0,0,0,0,3000000,'D','X','(DocPrepare)','(DocPrepare)','(Standard Node)',100,0,TO_TIMESTAMP('2012-09-11 18:53:36','YYYY-MM-DD HH24:MI:SS'),100,'Y',TO_TIMESTAMP('2012-09-11 18:53:36','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 11/09/2012 18:53:37 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
INSERT INTO AD_WF_Node_Trl (AD_Language,AD_WF_Node_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_WF_Node_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_WF_Node t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_WF_Node_ID=3000004 AND NOT EXISTS (SELECT * FROM AD_WF_Node_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_WF_Node_ID=t.AD_WF_Node_ID)
;

-- 11/09/2012 18:54:24 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
INSERT INTO AD_WF_NodeNext (EntityType,IsStdUserWorkflow,AD_WF_NodeNext_ID,AD_WF_Node_ID,SeqNo,AD_WF_Next_ID,Description,Created,UpdatedBy,CreatedBy,AD_Org_ID,IsActive,Updated,AD_Client_ID) VALUES ('LAR','N',3000001,3000004,100,3000003,'(Standard Transaction)',TO_TIMESTAMP('2012-09-11 18:54:23','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',TO_TIMESTAMP('2012-09-11 18:54:23','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 11/09/2012 18:56:16 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
INSERT INTO AD_WF_NodeNext (EntityType,IsStdUserWorkflow,AD_WF_NodeNext_ID,AD_WF_Node_ID,SeqNo,AD_WF_Next_ID,Created,UpdatedBy,CreatedBy,AD_Org_ID,IsActive,Updated,AD_Client_ID) VALUES ('LAR','N',3000002,3000001,100,3000002,TO_TIMESTAMP('2012-09-11 18:56:15','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',TO_TIMESTAMP('2012-09-11 18:56:15','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 11/09/2012 18:57:02 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
INSERT INTO AD_WF_NodeNext (EntityType,IsStdUserWorkflow,AD_WF_NodeNext_ID,AD_WF_Node_ID,SeqNo,AD_WF_Next_ID,Description,Created,UpdatedBy,CreatedBy,AD_Org_ID,IsActive,Updated,AD_Client_ID) VALUES ('LAR','N',3000003,3000001,10,3000004,'(DocPrepare)',TO_TIMESTAMP('2012-09-11 18:57:01','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',TO_TIMESTAMP('2012-09-11 18:57:01','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 11/09/2012 19:41:59 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
DELETE FROM AD_Field_Trl WHERE AD_Field_ID=3000277
;

-- 11/09/2012 19:41:59 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
DELETE FROM AD_Field WHERE AD_Field_ID=3000277
;

-- 11/09/2012 19:42:50 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
DELETE FROM AD_Field_Trl WHERE AD_Field_ID=3000762
;

-- 11/09/2012 19:42:50 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
DELETE FROM AD_Field WHERE AD_Field_ID=3000762
;

-- 11/09/2012 19:44:39 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
DELETE FROM AD_Field_Trl WHERE AD_Field_ID=3000399
;

-- 11/09/2012 19:44:39 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
DELETE FROM AD_Field WHERE AD_Field_ID=3000399
;

-- 11/09/2012 19:45:40 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
DELETE FROM AD_Column_Trl WHERE AD_Column_ID=3000241
;

-- 11/09/2012 19:45:40 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
DELETE FROM AD_Column WHERE AD_Column_ID=3000241
;

-- 11/09/2012 19:46:25 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
DELETE FROM AD_Element_Trl WHERE AD_Element_ID=3000069
;

-- 11/09/2012 19:46:25 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
DELETE FROM AD_Element WHERE AD_Element_ID=3000069
;

-- 11/09/2012 19:48:45 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000827,3000010,'LAR',0,'N','N','N','You find the current status in the Document Status field. The options are listed in a popup','N',2,'N',10,'N',287,'N','Y','N','The targeted status of the document','Document Action','DocAction',100,TO_TIMESTAMP('2012-09-11 19:48:44','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-09-11 19:48:44','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/09/2012 19:48:45 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000827 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/09/2012 20:02:34 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
INSERT INTO AD_Process (AD_Workflow_ID,AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Value,Name,AD_Org_ID,AD_Client_ID,Created,CreatedBy,Updated,UpdatedBy,IsActive) VALUES (3000000,3000036,'N','N','1','N','N','Y','LAR',0,0,'LAR_PaymentHeader_Process','Process LAR_PaymentHeader',0,0,TO_TIMESTAMP('2012-09-11 20:02:33','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-09-11 20:02:33','YYYY-MM-DD HH24:MI:SS'),100,'Y')
;

-- 11/09/2012 20:02:34 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000036 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 11/09/2012 20:13:16 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
UPDATE AD_Column SET DefaultValue='CO', AD_Reference_Value_ID=135, IsMandatory='Y', AD_Reference_ID=28, AD_Process_ID=3000036,Updated=TO_TIMESTAMP('2012-09-11 20:13:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000827
;

-- 11/09/2012 20:19:25 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000899,2,'Y','N','N',3000827,'N','Y',3000015,'N','You find the current status in the Document Status field. The options are listed in a popup','LAR','The targeted status of the document','Document Action',100,0,TO_TIMESTAMP('2012-09-11 20:19:24','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2012-09-11 20:19:24','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/09/2012 20:19:25 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000899 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/09/2012 20:20:55 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3000899
;

-- 11/09/2012 20:21:28 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2012-09-11 20:21:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000899
;

-- 11/09/2012 20:23:59 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000900,2,'Y','N','N',3000827,'N','Y',3000023,'N','You find the current status in the Document Status field. The options are listed in a popup','LAR','The targeted status of the document','Document Action',100,0,TO_TIMESTAMP('2012-09-11 20:23:52','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2012-09-11 20:23:52','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/09/2012 20:23:59 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000900 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/09/2012 20:24:29 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3000900
;

-- 11/09/2012 20:24:30 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3000761
;

-- 11/09/2012 20:24:44 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2012-09-11 20:24:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000900
;

-- 11/09/2012 20:27:12 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000901,2,'Y','N','N',3000827,'N','Y',3000012,'N','You find the current status in the Document Status field. The options are listed in a popup','LAR','The targeted status of the document','Document Action',100,0,TO_TIMESTAMP('2012-09-11 20:27:12','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2012-09-11 20:27:12','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/09/2012 20:27:12 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000901 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/09/2012 20:27:31 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3000901
;

-- 11/09/2012 20:27:31 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3000271
;

-- 11/09/2012 20:27:58 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2012-09-11 20:27:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000901
;

-- 11/09/2012 21:05:12 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
UPDATE AD_Workflow SET IsValid='Y', AD_WF_Node_ID=3000001,Updated=TO_TIMESTAMP('2012-09-11 21:05:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Workflow_ID=3000000
;

-- 12/09/2012 11:45:54 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
DELETE FROM AD_Process_Trl WHERE AD_Process_ID=3000007
;

-- 12/09/2012 11:45:54 ART
-- Incorporar flujo de trabajo para las cabeceras de pagos/cobros
DELETE FROM AD_Process WHERE AD_Process_ID=3000007
;
