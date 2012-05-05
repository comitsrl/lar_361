-- 05/05/2012 10:17:20 GMT-03:00
-- Add fiscal closing process
INSERT INTO AD_Process (AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Classname,CopyFromProcess,Value,Name,AD_Org_ID,AD_Client_ID,Updated,UpdatedBy,CreatedBy,Created,IsActive) VALUES (3000013,'N','N','3','N','N','Y','LAR',0,0,'ar.com.ergio.process.FiscalPrinterClosing','N','LAR_FiscalPrinterClosing','LAR_FiscalPrinterClosing',0,0,TO_TIMESTAMP('2012-05-05 10:17:19','YYYY-MM-DD HH24:MI:SS'),100,100,TO_TIMESTAMP('2012-05-05 10:17:19','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 05/05/2012 10:17:20 GMT-03:00
-- Add fiscal closing process
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000013 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 05/05/2012 10:22:04 GMT-03:00
-- Add fiscal closing process
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,Created,AD_Org_ID,CreatedBy,Updated,IsActive,UpdatedBy) VALUES (3000011,'L','LAR','N','LAR_FiscalClose_Types',0,TO_TIMESTAMP('2012-05-05 10:22:03','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-05-05 10:22:03','YYYY-MM-DD HH24:MI:SS'),'Y',100)
;

-- 05/05/2012 10:22:04 GMT-03:00
-- Add fiscal closing process
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000011 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 05/05/2012 10:22:23 GMT-03:00
-- Add fiscal closing process
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,UpdatedBy,Created,CreatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000031,3000011,'LAR','X','Cierre X',TO_TIMESTAMP('2012-05-05 10:22:23','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-05-05 10:22:23','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 05/05/2012 10:22:23 GMT-03:00
-- Add fiscal closing process
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000031 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 05/05/2012 10:22:42 GMT-03:00
-- Add fiscal closing process
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,UpdatedBy,Created,CreatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000032,3000011,'LAR','Z','Cierre Z',TO_TIMESTAMP('2012-05-05 10:22:41','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-05-05 10:22:41','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 05/05/2012 10:22:42 GMT-03:00
-- Add fiscal closing process
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000032 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 05/05/2012 10:23:04 GMT-03:00
-- Add fiscal closing process
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,AD_Reference_Value_ID,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID) VALUES ('N',3000012,0,3000013,100,'Y',17,10,'Y',3000011,'LAR','CloseType','CloseType','Y',0,100,TO_TIMESTAMP('2012-05-05 10:23:04','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-05-05 10:23:04','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 05/05/2012 10:23:04 GMT-03:00
-- Add fiscal closing process
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000012 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 05/05/2012 10:27:16 GMT-03:00
-- Add fiscal closing process
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,AD_Element_ID,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID) VALUES ('N',3000013,0,3000013,100,'Y',19,20,'Y',3000003,'LAR','LAR_Fiscal_Printer_ID','LAR_Fiscal_Printer_ID','Y',0,100,TO_TIMESTAMP('2012-05-05 10:27:16','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-05-05 10:27:16','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 05/05/2012 10:27:16 GMT-03:00
-- Add fiscal closing process
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000013 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 05/05/2012 10:29:01 GMT-03:00
-- Add fiscal closing process
INSERT INTO AD_Menu (AD_Menu_ID,IsSummary,"action",IsSOTrx,IsReadOnly,AD_Process_ID,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000016,'N','P','N','N',3000013,'LAR','Y','Fiscal Closing',TO_TIMESTAMP('2012-05-05 10:29:01','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_TIMESTAMP('2012-05-05 10:29:01','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 05/05/2012 10:29:01 GMT-03:00
-- Add fiscal closing process
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000016 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 05/05/2012 10:29:01 GMT-03:00
-- Add fiscal closing process
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100,t.AD_Tree_ID, 3000016, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000016)
;

-- 05/05/2012 10:29:08 GMT-03:00
-- Add fiscal closing process
UPDATE AD_TreeNodeMM SET Parent_ID=3000008, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000016
;

-- 05/05/2012 10:29:08 GMT-03:00
-- Add fiscal closing process
UPDATE AD_TreeNodeMM SET Parent_ID=3000008, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000007
;

-- 05/05/2012 10:29:08 GMT-03:00
-- Add fiscal closing process
UPDATE AD_TreeNodeMM SET Parent_ID=3000008, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000009
;
