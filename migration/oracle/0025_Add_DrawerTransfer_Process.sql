-- Add drawer transfer behavior
ALTER TABLE C_BankStatementLine ADD COLUMN IsTransferred Character(1) NOT NULL DEFAULT 'N';

-- 04/04/2012 9:13:21 ART
-- Add drawer transfer behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000145,393,'LAR',0,'Y','N','N','The transferred checkbox indicates if the transactions associated with this document should be transferred to the General Ledger.','N',1,'N',20,'N',419,'N','Y','N','Transferred to General Ledger (i.e. accounted)','Transferred','IsTransferred',100,TO_DATE('2012-04-04 09:13:20','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-04 09:13:20','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 04/04/2012 9:13:21 ART
-- Add drawer transfer behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000145 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 04/04/2012 10:10:32 ART
-- Add drawer transfer behavior
INSERT INTO AD_Process (AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Classname,CopyFromProcess,Value,Name,AD_Org_ID,AD_Client_ID,Updated,UpdatedBy,CreatedBy,Created,IsActive) VALUES (3000001,'N','N','3','N','N','Y','LAR',0,0,'ar.com.ergio.process.DrawerTransfer','N','LAR_DrawerTransfer','LAR_DrawerTransfer',0,0,TO_DATE('2012-04-04 10:10:30','YYYY-MM-DD HH24:MI:SS'),100,100,TO_DATE('2012-04-04 10:10:30','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 04/04/2012 10:10:32 ART
-- Add drawer transfer behavior
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000001 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 04/04/2012 12:22:05 ART
-- Add drawer transfer behavior
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,AD_Reference_Value_ID,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID) VALUES ('N',3000000,0,3000001,100,'Y',18,10,'Y',53283,'LAR','Bank Account From','From_C_BankAccount_ID','Y',0,100,TO_DATE('2012-04-04 12:22:03','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-04-04 12:22:03','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 04/04/2012 12:22:05 ART
-- Add drawer transfer behavior
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000000 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 04/04/2012 12:24:37 ART
-- Add drawer transfer behavior
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,AD_Reference_Value_ID,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID) VALUES ('N',3000001,0,3000001,100,'Y',18,20,'Y',53283,'LAR','Bank Account To','To_C_BankAccount_ID','Y',0,100,TO_DATE('2012-04-04 12:24:37','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-04-04 12:24:37','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 04/04/2012 12:24:37 ART
-- Add drawer transfer behavior
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000001 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 04/04/2012 12:31:13 ART
-- Add drawer transfer behavior
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,AD_Element_ID,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID) VALUES ('N',3000002,0,3000001,100,'Y',30,30,'Y',187,'LAR','Business Partner','C_BPartner_ID','Y',0,100,TO_DATE('2012-04-04 12:31:13','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-04-04 12:31:13','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 04/04/2012 12:31:13 ART
-- Add drawer transfer behavior
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000002 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 04/04/2012 12:31:50 ART
-- Add drawer transfer behavior
DELETE  FROM  AD_Process_Para_Trl WHERE AD_Process_Para_ID=3000002
;

-- 04/04/2012 12:31:50 ART
-- Add drawer transfer behavior
DELETE FROM AD_Process_Para WHERE AD_Process_Para_ID=3000002
;

-- 04/04/2012 12:33:35 ART
-- Add drawer transfer behavior
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,AD_Element_ID,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID) VALUES ('N',3000003,0,3000001,100,'Y',19,30,'Y',193,'LAR','Currency','C_Currency_ID','Y',0,100,TO_DATE('2012-04-04 12:33:35','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-04-04 12:33:35','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 04/04/2012 12:33:35 ART
-- Add drawer transfer behavior
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000003 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 04/04/2012 12:36:33 ART
-- Add drawer transfer behavior
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,AD_Element_ID,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID) VALUES ('N',3000004,0,3000001,100,'Y',10,40,'Y',275,'LAR','Description','Description','Y',0,100,TO_DATE('2012-04-04 12:36:31','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-04-04 12:36:31','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 04/04/2012 12:36:33 ART
-- Add drawer transfer behavior
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000004 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 04/04/2012 12:41:11 ART
-- Add drawer transfer behavior
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,AD_Element_ID,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID) VALUES ('N',3000005,0,3000001,100,'Y',10,50,'Y',290,'LAR','Document No','DocumentNo','Y',0,100,TO_DATE('2012-04-04 12:41:11','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-04-04 12:41:11','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 04/04/2012 12:41:11 ART
-- Add drawer transfer behavior
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000005 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 04/04/2012 12:42:28 ART
-- Add drawer transfer behavior
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,AD_Element_ID,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID) VALUES ('N',3000006,0,3000001,100,'Y',15,60,'Y',1434,'LAR','Statement Date','StatementDate','Y',0,100,TO_DATE('2012-04-04 12:42:26','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-04-04 12:42:26','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 04/04/2012 12:42:28 ART
-- Add drawer transfer behavior
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000006 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 04/04/2012 12:43:09 ART
-- Add drawer transfer behavior
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,AD_Element_ID,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID) VALUES ('N',3000007,0,3000001,100,'Y',15,70,'Y',263,'LAR','Account Date','DateAcct','Y',0,100,TO_DATE('2012-04-04 12:43:09','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-04-04 12:43:09','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 04/04/2012 12:43:09 ART
-- Add drawer transfer behavior
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000007 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 04/04/2012 12:46:01 ART
-- Add drawer transfer behavior
INSERT INTO AD_Menu (AD_Menu_ID,IsSummary,Action,IsSOTrx,IsReadOnly,AD_Process_ID,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000007,'N','P','N','N',3000001,'LAR','Y','Drawer Transfer',TO_DATE('2012-04-04 12:46:01','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_DATE('2012-04-04 12:46:01','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 04/04/2012 12:46:01 ART
-- Add drawer transfer behavior
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000007 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 04/04/2012 12:46:01 ART
-- Add drawer transfer behavior
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', SysDate, 100, SysDate, 100,t.AD_Tree_ID, 3000007, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000007)
;

-- 04/04/2012 12:46:11 ART
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=0, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=241
;

-- 04/04/2012 12:46:11 ART
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=1, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=288
;

-- 04/04/2012 12:46:11 ART
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=2, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=432
;

-- 04/04/2012 12:46:11 ART
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=3, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=243
;

-- 04/04/2012 12:46:11 ART
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=4, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=413
;

-- 04/04/2012 12:46:11 ART
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=5, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=538
;

-- 04/04/2012 12:46:11 ART
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=6, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=462
;

-- 04/04/2012 12:46:11 ART
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=7, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=505
;

-- 04/04/2012 12:46:11 ART
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=8, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=235
;

-- 04/04/2012 12:46:11 ART
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=9, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=511
;

-- 04/04/2012 12:46:11 ART
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=10, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=245
;

-- 04/04/2012 12:46:11 ART
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=11, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=251
;

-- 04/04/2012 12:46:11 ART
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=12, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=246
;

-- 04/04/2012 12:46:11 ART
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=13, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=509
;

-- 04/04/2012 12:46:11 ART
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=14, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=510
;

-- 04/04/2012 12:46:11 ART
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=15, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=496
;

-- 04/04/2012 12:46:11 ART
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=16, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=497
;

-- 04/04/2012 12:46:11 ART
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=17, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=304
;

-- 04/04/2012 12:46:11 ART
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=18, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=255
;

-- 04/04/2012 12:46:11 ART
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=19, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=286
;

-- 04/04/2012 12:46:11 ART
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=20, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=287
;

-- 04/04/2012 12:46:11 ART
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=21, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=438
;

-- 04/04/2012 12:46:11 ART
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=22, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=234
;

-- 04/04/2012 12:46:11 ART
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=23, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=244
;

-- 04/04/2012 12:46:11 ART
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=24, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53313
;

-- 04/04/2012 12:46:11 ART
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=25, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53314
;

-- 04/04/2012 12:46:11 ART
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=26, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000007
;

-- 04/04/2012 12:46:11 ART
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=27, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53190
;

-- 04/04/2012 12:46:11 ART
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=28, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53187
;
