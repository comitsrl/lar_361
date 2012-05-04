-- 26/04/2012 16:43:30 GMT-03:00
-- Add fiscal printing code to Process_Invoice WF
INSERT INTO AD_Process (AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Classname,CopyFromProcess,Value,Name,AD_Org_ID,AD_Client_ID,Updated,UpdatedBy,CreatedBy,Created,IsActive) VALUES (3000004,'N','N','3','N','N','Y','LAR',0,0,'ar.com.ergio.process.InvoiceFiscalPrinting','N','LAR_InvoiceFiscalPrinting','LAR_InvoiceFiscalPrinting',0,0,TO_TIMESTAMP('2012-04-26 16:43:29','YYYY-MM-DD HH24:MI:SS'),100,100,TO_TIMESTAMP('2012-04-26 16:43:29','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 26/04/2012 16:43:30 GMT-03:00
-- Add fiscal printing code to Process_Invoice WF
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000004 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 26/04/2012 17:10:47 GMT-03:00
-- Add fiscal printing code to Process_Invoice WF
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,"limit",XPosition,YPosition,WaitingTime,AD_Process_ID,AD_Workflow_ID,"action",SplitElement,Value,Name,Description,IsActive,Updated,AD_Org_ID,UpdatedBy,Created,CreatedBy,AD_Client_ID) VALUES (3000000,0,'CO',0,'LAR','Y','X',0,230,105,0,3000004,118,'P','X','(DocFiscalPrinting)','(DocFiscalPrinting)','(LAR Customized Node)','Y',TO_TIMESTAMP('2012-04-26 17:10:46','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-04-26 17:10:46','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- 26/04/2012 17:10:47 GMT-03:00
-- Add fiscal printing code to Process_Invoice WF
INSERT INTO AD_WF_Node_Trl (AD_Language,AD_WF_Node_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_WF_Node_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_WF_Node t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_WF_Node_ID=3000000 AND NOT EXISTS (SELECT * FROM AD_WF_Node_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_WF_Node_ID=t.AD_WF_Node_ID)
;

-- 26/04/2012 17:11:31 GMT-03:00
-- Add fiscal printing code to Process_Invoice WF
INSERT INTO AD_WF_NodeNext (EntityType,IsStdUserWorkflow,AD_WF_NodeNext_ID,AD_WF_Node_ID,SeqNo,AD_WF_Next_ID,Created,CreatedBy,UpdatedBy,AD_Org_ID,IsActive,Updated,AD_Client_ID) VALUES ('LAR','N',3000000,194,10,3000000,TO_TIMESTAMP('2012-04-26 17:11:31','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',TO_TIMESTAMP('2012-04-26 17:11:31','YYYY-MM-DD HH24:MI:SS'),0)
;
