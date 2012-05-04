-- Add drawer transfer behavior
ALTER TABLE C_BankStatementLine ADD COLUMN IsTransferred Character(1) NOT NULL DEFAULT 'N';
ALTER TABLE C_BankAccount       ADD COLUMN IsDrawer      Character(1) NOT NULL DEFAULT 'N';
ALTER TABLE C_BankStatement     ADD COLUMN ScrutinizedCheckAmt       Numeric NOT NULL DEFAULT 0;
ALTER TABLE C_BankStatement     ADD COLUMN ScrutinizedCashAmt        Numeric NOT NULL DEFAULT 0;
ALTER TABLE C_BankStatement     ADD COLUMN ScrutinizedCreditCardAmt  Numeric NOT NULL DEFAULT 0;
ALTER TABLE C_BankStatement     ADD COLUMN ScrutinizedDirectDebitAmt Numeric NOT NULL DEFAULT 0;

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

-- 16/04/2012 16:54:01 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000037,'isdrawer','LAR','isdrawer','isdrawer',0,TO_DATE('2012-04-16 16:54:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-04-16 16:54:00','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 16/04/2012 16:54:01 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000037 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 16/04/2012 16:54:01 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000147,297,'LAR',0,'Y','N','N','N',1,'N',20,'N',3000037,'N','Y','N','isdrawer','isdrawer',100,TO_DATE('2012-04-16 16:54:00','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-16 16:54:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 16/04/2012 16:54:01 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000147 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 16/04/2012 16:54:42 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Element SET ColumnName='IsDrawer', Name='IsDrawer', PrintName='IsDrawer',Updated=TO_DATE('2012-04-16 16:54:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000037
;

-- 16/04/2012 16:54:42 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000037
;

-- 16/04/2012 16:54:42 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Column SET ColumnName='IsDrawer', Name='IsDrawer', Description=NULL, Help=NULL WHERE AD_Element_ID=3000037
;

-- 16/04/2012 16:54:42 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Process_Para SET ColumnName='IsDrawer', Name='IsDrawer', Description=NULL, Help=NULL, AD_Element_ID=3000037 WHERE UPPER(ColumnName)='ISDRAWER' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 16/04/2012 16:54:42 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Process_Para SET ColumnName='IsDrawer', Name='IsDrawer', Description=NULL, Help=NULL WHERE AD_Element_ID=3000037 AND IsCentrallyMaintained='Y'
;

-- 16/04/2012 16:54:42 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET Name='IsDrawer', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000037) AND IsCentrallyMaintained='Y'
;

-- 16/04/2012 16:54:42 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_PrintFormatItem pi SET PrintName='IsDrawer', Name='IsDrawer' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000037)
;

-- 16/04/2012 16:57:41 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,Created,AD_Org_ID,CreatedBy,Updated,IsActive,UpdatedBy) VALUES (3000009,'T','LAR','N','LAR_BankAccount',0,TO_DATE('2012-04-16 16:57:40','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 16:57:40','YYYY-MM-DD HH24:MI:SS'),'Y',100)
;

-- 16/04/2012 16:57:41 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000009 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 16/04/2012 16:59:16 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Ref_Table (IsValueDisplayed,WhereClause,AD_Table_ID,AD_Reference_ID,AD_Key,AD_Display,EntityType,CreatedBy,Updated,Created,AD_Client_ID,UpdatedBy,AD_Org_ID,IsActive) VALUES ('N','C_BankAccount.IsActive=''Y'' AND C_BankAccount.IsDrawer=''Y''',297,3000009,3077,3074,'LAR',100,TO_DATE('2012-04-16 16:59:16','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-04-16 16:59:16','YYYY-MM-DD HH24:MI:SS'),0,100,0,'Y')
;

-- 16/04/2012 17:00:03 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Reference SET Name='LAR_BankAccount_Drawer',Updated=TO_DATE('2012-04-16 17:00:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=3000009
;

-- 16/04/2012 17:00:03 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Reference_Trl SET IsTranslated='N' WHERE AD_Reference_ID=3000009
;

-- 16/04/2012 17:00:35 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Process_Para SET AD_Reference_Value_ID=3000009,Updated=TO_DATE('2012-04-16 17:00:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000000
;

-- 16/04/2012 17:00:47 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Process_Para SET AD_Reference_Value_ID=3000009,Updated=TO_DATE('2012-04-16 17:00:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000001
;

-- 16/04/2012 17:09:24 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000089,1,'Y','N','N',3000147,'N','Y',228,'N','LAR','IsDrawer',100,0,'Y',TO_DATE('2012-04-16 17:09:20','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:09:20','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:09:24 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000089 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:04 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Window (AD_Window_ID,WindowType,Help,IsSOTrx,IsDefault,IsBetaFunctionality,WinHeight,WinWidth,EntityType,Name,IsActive,Created,UpdatedBy,CreatedBy,Updated,AD_Org_ID,AD_Client_ID,Processing) VALUES (3000005,'M','The Process Drawer Closing window allows you to reconcile your Drawer.  Once you have completed reconciling, select the ''Process Statement'' button to mark the payments as reconciled and update the appropriate GL accounts.','Y','N','N',0,0,'LAR','Drawer Closing','Y',TO_DATE('2012-04-16 17:48:03','YYYY-MM-DD HH24:MI:SS'),100,100,TO_DATE('2012-04-16 17:48:03','YYYY-MM-DD HH24:MI:SS'),0,0,'N')
;

-- 16/04/2012 17:48:04 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Window_Trl (AD_Language,AD_Window_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Window_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Window t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Window_ID=3000005 AND NOT EXISTS (SELECT * FROM AD_Window_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Window_ID=t.AD_Window_ID)
;

-- 16/04/2012 17:48:15 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,Help,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,Description,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('Y',3000005,10,'The Bank Statement Tab defines the Bank Statement to be reconciled.','N','N',392,3000007,'N','N','N',0,'Y','N','LAR','Bank Statement','Bank Statement',0,0,TO_DATE('2012-04-16 17:48:15','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2012-04-16 17:48:15','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 16/04/2012 17:48:15 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000007 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 16/04/2012 17:48:15 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000149,14,'N','Y','N',4909,'N',0,'Y',3000007,'N','The Bank Statement identifies a unique Bank Statement for a defined time period.  The statement defines all transactions that occurred','LAR','Bank Statement of account','Bank Statement',100,0,'Y',TO_DATE('2012-04-16 17:48:15','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:15','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:15 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000149 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:16 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000150,1,'N','N','N',4923,'N',0,'Y',3000007,'N',101,'LAR','Process Now',100,0,'Y',TO_DATE('2012-04-16 17:48:15','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:15','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:16 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000150 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:16 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000151,1,'N','N','N',4924,'N',0,'Y',3000007,'Y','The Processed checkbox indicates that a document has been processed.','LAR','The document has been processed','Processed','N',100,0,'Y',TO_DATE('2012-04-16 17:48:16','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:16','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:16 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000151 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:17 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000152,14,'Y','N','N',4910,'N',10,'Y',3000007,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,'Y',TO_DATE('2012-04-16 17:48:16','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:16','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:17 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000152 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:17 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000153,14,'Y','Y','N',4911,'N',20,'Y',3000007,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,'Y',TO_DATE('2012-04-16 17:48:17','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:17','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:17 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000153 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:18 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000154,14,'Y','N','N',4917,'N',30,'Y',3000007,'N','The Bank Account identifies an account at this Bank.','LAR','Account at the Bank','Bank Account',100,0,'Y',TO_DATE('2012-04-16 17:48:17','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:17','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:18 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000154 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:18 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES (-1,'N',3000155,60,'Y','N','N',5214,'N',40,'Y',3000007,'N','The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.','LAR','Alphanumeric identifier of the entity','Name',100,0,'Y',TO_DATE('2012-04-16 17:48:18','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:18','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:18 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000155 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:18 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000156,14,'Y','N','N',4918,'N',50,'Y',3000007,'N','The Statement Date field defines the date of the statement.','LAR','Date of the statement','Statement date',100,0,'Y',TO_DATE('2012-04-16 17:48:18','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:18','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:18 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000156 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:19 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000157,60,'Y','N','N',4921,'N',60,'Y',3000007,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,'Y',TO_DATE('2012-04-16 17:48:18','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:18','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:19 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000157 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:19 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000158,1,'Y','N','N',4912,'N',70,'Y',3000007,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,'Y',TO_DATE('2012-04-16 17:48:19','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:19','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:19 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000158 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:20 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000159,1,'Y','Y','N',5213,'N',80,'Y',3000007,'Y','The Manual check box indicates if the process will done manually.','LAR','This is a manual process','Manual',100,0,'Y',TO_DATE('2012-04-16 17:48:19','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:19','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:20 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000159 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:20 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000160,26,'Y','N','N',4919,'N',90,'Y',3000007,'N','The Beginning Balance is the balance prior to making any adjustments for payments or disbursements.','LAR','Balance prior to any transactions','Beginning Balance',100,0,'Y',TO_DATE('2012-04-16 17:48:20','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:20','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:20 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000160 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:20 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000161,23,'Y','Y','N',5515,'N',100,'Y',3000007,'N','The Create From process will create a new document based on information in an existing document selected by the user.','LAR','Process which will generate a new document lines based on an existing document','Create lines from',100,0,'Y',TO_DATE('2012-04-16 17:48:20','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:20','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:20 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000161 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:21 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000162,26,'Y','N','N',4922,'N',110,'Y',3000007,'Y','The Statement Difference reflects the difference between the Statement Ending Balance and the Actual Ending Balance.','LAR','Difference between statement ending balance and actual ending balance','Statement difference',100,0,'Y',TO_DATE('2012-04-16 17:48:20','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:20','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:21 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000162 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:21 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000163,23,'Y','Y','N',10778,'N',120,'Y',3000007,'N','LAR','Match Statement',100,0,'Y',TO_DATE('2012-04-16 17:48:21','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:21','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:21 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000163 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:21 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000164,26,'Y','N','N',4920,'N',130,'Y',3000007,'Y','The Ending Balance is the result of adjusting the Beginning Balance by any payments or disbursements.','LAR','Ending  or closing balance','Ending balance',100,0,'Y',TO_DATE('2012-04-16 17:48:21','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:21','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:21 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000164 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:21 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000165,20,'Y','N','N',10334,'N',140,'Y',3000007,'Y','Information from EFT media',104,'LAR','Electronic Funds Transfer Statement Reference','EFT Statement Reference',100,0,'Y',TO_DATE('2012-04-16 17:48:21','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:21','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:21 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000165 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:22 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000166,14,'Y','Y','N',10333,'N',150,'Y',3000007,'Y','Information from EFT media',104,'LAR','Electronic Funds Transfer Statement Date','EFT Statement Date',100,0,'Y',TO_DATE('2012-04-16 17:48:21','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:21','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:22 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000166 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:22 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000167,14,'Y','N','N',12460,'N',160,'Y',3000007,'Y','The Document Status indicates the status of a document at this time.  If you want to change the document status, use the Document Action field',101,'LAR','The current status of the document','Document Status','N',100,0,'Y',TO_DATE('2012-04-16 17:48:22','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:22','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:22 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000167 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:22 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000168,23,'Y','Y','N',12461,'N',170,'Y',3000007,'N','You find the current status in the Document Status field. The options are listed in a popup','LAR','The targeted status of the document','Document Action','N',100,0,'Y',TO_DATE('2012-04-16 17:48:22','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:22','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:22 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000168 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:22 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000169,1,'Y','N','N',12462,'N',180,'Y',3000007,'Y','The Approved checkbox indicates if this document requires approval before it can be processed.','LAR','Indicates if this document requires approval','Approved','N',100,0,'Y',TO_DATE('2012-04-16 17:48:22','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:22','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:22 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000169 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:23 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000170,23,'Y','Y','N',4925,'N',190,'Y',3000007,'N','The Posted field indicates the status of the Generation of General Ledger Accounting Lines ','@Processed@=Y & @#ShowAcct@=Y','LAR','Posting status','Posted','N',100,0,'Y',TO_DATE('2012-04-16 17:48:22','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:22','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:23 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000170 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:23 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,Help,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,Description,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('Y',3000005,20,'The Statement Line Tab defines the individual line items on the Bank Statement.  They can be entered manually or generated from payments entered.
<br>For Posting, the bank account organization is used, if it is not a charge.','N','N',393,3000008,'N','N','N',1,'Y','N','LAR','Statement Line','Statement Line',0,0,TO_DATE('2012-04-16 17:48:23','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2012-04-16 17:48:23','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 16/04/2012 17:48:23 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000008 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 16/04/2012 17:48:23 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000171,14,'N','N','N',4926,'N',0,'Y',3000008,'N','The Bank Statement Line identifies a unique transaction (Payment, Withdrawal, Charge) for the defined time period at this Bank.','LAR','Line on a statement from this Bank','Bank statement line',100,0,'Y',TO_DATE('2012-04-16 17:48:23','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:23','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:23 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000171 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:23 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000172,1,'N','Y','N',5218,'N',0,'Y',3000008,'N','The Reversal check box indicates if this is a reversal of a prior transaction.','LAR','This is a reversing transaction','Reversal',100,0,'Y',TO_DATE('2012-04-16 17:48:23','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:23','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:23 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000172 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:24 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000173,1,'N','N','N',12463,'N',0,'Y',3000008,'N','The Processed checkbox indicates that a document has been processed.','LAR','The document has been processed','Processed','N',100,0,'Y',TO_DATE('2012-04-16 17:48:23','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:23','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:24 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000173 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:24 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000174,14,'Y','N','N',4927,'N',10,'Y',3000008,'Y','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,'Y',TO_DATE('2012-04-16 17:48:24','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:24','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:24 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000174 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:24 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000175,14,'Y','Y','N',4928,'N',20,'Y',3000008,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,'Y',TO_DATE('2012-04-16 17:48:24','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:24','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:24 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000175 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:25 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000176,14,'Y','N','N',4934,'N',30,'Y',3000008,'Y','The Bank Statement identifies a unique Bank Statement for a defined time period.  The statement defines all transactions that occurred','LAR','Bank Statement of account','Bank Statement',100,0,'Y',TO_DATE('2012-04-16 17:48:24','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:24','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:25 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000176 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:25 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES (1,'N',3000177,11,'Y','N','N',5219,'N',40,'Y',3000008,'N','Indicates the unique line for a document.  It will also control the display order of the lines within a document.','LAR','Unique line for this document','Line No','N',100,0,'Y',TO_DATE('2012-04-16 17:48:25','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:25','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:25 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000177 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:25 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000178,60,'Y','N','N',4936,'N',50,'Y',3000008,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,'Y',TO_DATE('2012-04-16 17:48:25','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:25','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:25 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000178 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:26 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000179,1,'Y','N','N',4929,'N',60,'Y',3000008,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,'Y',TO_DATE('2012-04-16 17:48:25','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:25','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:26 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000179 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:26 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000180,1,'Y','Y','N',10025,'N',70,'Y',3000008,'Y','The Manual check box indicates if the process will done manually.','LAR','This is a manual process','Manual',100,0,'Y',TO_DATE('2012-04-16 17:48:26','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:26','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:26 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000180 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:26 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000181,14,'Y','N','N',10337,'N',80,'Y',3000008,'N','LAR','Date of the Statement Line','Statement Line Date',100,0,'Y',TO_DATE('2012-04-16 17:48:26','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:26','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:26 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000181 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:26 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000182,14,'Y','Y','N',5216,'N',90,'Y',3000008,'N','The Accounting Date indicates the date to be used on the General Ledger account entries generated from this document. It is also used for any currency conversion.','LAR','Accounting Date','Account Date',100,0,'Y',TO_DATE('2012-04-16 17:48:26','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:26','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:26 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000182 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:27 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000183,14,'Y','N','N',5222,'N',100,'Y',3000008,'N','The Effective Date indicates the date that money is available from the bank.','LAR','Date when money is available','Effective date',100,0,'Y',TO_DATE('2012-04-16 17:48:26','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:26','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:27 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000183 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:27 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000184,26,'Y','N','N',5220,'N',110,'Y',3000008,'N','The Statement Amount indicates the amount of a single statement line.','LAR','Statement Amount','Statement amount',100,0,'Y',TO_DATE('2012-04-16 17:48:27','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:27','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:27 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000184 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:27 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000185,26,'Y','Y','N',4937,'N',120,'Y',3000008,'N','The Payment is a unique identifier of this payment.','LAR','Payment identifier','Payment','N',100,0,'Y',TO_DATE('2012-04-16 17:48:27','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:27','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:27 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000185 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:27 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000186,26,'Y','N','N',5221,'N',130,'Y',3000008,'N','The Transaction Amount indicates the amount for a single transaction.','LAR','Amount of a transaction','Transaction Amount',100,0,'Y',TO_DATE('2012-04-16 17:48:27','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:27','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:27 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000186 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:28 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000187,14,'Y','Y','N',5217,'N',140,'Y',3000008,'N','Indicates the Currency to be used when processing or reporting on this record','LAR','The Currency for this record','Currency',100,0,'Y',TO_DATE('2012-04-16 17:48:27','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:27','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:28 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000187 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:28 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000188,26,'Y','N','N',5160,'N',150,'Y',3000008,'N','The Charge Amount indicates the amount for an additional charge.','LAR','Charge Amount','Charge amount',100,0,'Y',TO_DATE('2012-04-16 17:48:28','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:28 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000188 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:28 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000189,14,'Y','Y','N',4939,'N',160,'Y',3000008,'N','The Charge indicates a type of Charge (Handling, Shipping, Restocking)','@ChargeAmt@!0','LAR','Additional document charges','Charge',100,0,'Y',TO_DATE('2012-04-16 17:48:28','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:28 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000189 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:28 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000190,26,'Y','N','N',5161,'N',170,'Y',3000008,'N','The Interest Amount indicates any interest charged or received on a Bank Statement.','LAR','Interest Amount','Interest Amount',100,0,'Y',TO_DATE('2012-04-16 17:48:28','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:28 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000190 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:29 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000191,40,'Y','N','N',8986,'N',180,'Y',3000008,'N','The reference number can be printed on orders and invoices to allow your business partner to faster identify your records.','LAR','Your customer or vendor number at the Business Partner''s site','Reference No','N',100,0,'Y',TO_DATE('2012-04-16 17:48:28','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:29 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000191 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:29 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000192,60,'Y','N','N',8987,'N',190,'Y',3000008,'N','LAR','Memo Text','Memo',100,0,'Y',TO_DATE('2012-04-16 17:48:29','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:29 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000192 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:29 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000193,23,'Y','N','N',10781,'N',200,'Y',3000008,'N','LAR','Match Statement',100,0,'Y',TO_DATE('2012-04-16 17:48:29','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:29 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000193 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:29 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000194,23,'Y','Y','N',10027,'N',210,'Y',3000008,'N','LAR','Create Payment',100,0,'Y',TO_DATE('2012-04-16 17:48:29','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:29 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000194 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:30 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000195,26,'Y','N','N',10780,'N',220,'Y',3000008,'N','A Business Partner is anyone with whom you transact.  This can include Vendor, Customer, Employee or Salesperson',104,'LAR','Identifies a Business Partner','Business Partner ',100,0,'Y',TO_DATE('2012-04-16 17:48:29','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:30 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000195 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:30 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000196,26,'Y','Y','N',10779,'N',230,'Y',3000008,'N','The Invoice Document.',104,'LAR','Invoice Identifier','Invoice',100,0,'Y',TO_DATE('2012-04-16 17:48:30','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:30 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000196 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:30 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000197,20,'Y','N','N',10024,'N',240,'Y',3000008,'Y','Information from EFT media',104,'LAR','Electronic Funds Transfer Transaction ID','EFT Trx ID',100,0,'Y',TO_DATE('2012-04-16 17:48:30','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:30 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000197 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:30 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000198,20,'Y','Y','N',10026,'N',250,'Y',3000008,'Y','Information from EFT media',104,'LAR','Electronic Funds Transfer Transaction Type','EFT Trx Type',100,0,'Y',TO_DATE('2012-04-16 17:48:30','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:30 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000198 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:31 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000199,20,'Y','N','N',10383,'N',260,'Y',3000008,'Y','Information from EFT media','LAR','Electronic Funds Transfer Check No','EFT Check No',100,0,'Y',TO_DATE('2012-04-16 17:48:30','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:31 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000199 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:31 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000200,20,'Y','Y','N',10339,'N',270,'Y',3000008,'Y','Information from EFT media','LAR','Electronic Funds Transfer Reference','EFT Reference',100,0,'Y',TO_DATE('2012-04-16 17:48:31','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:31 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000200 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:31 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000201,60,'Y','N','N',10029,'N',280,'Y',3000008,'Y','Information from EFT media',104,'LAR','Electronic Funds Transfer Memo','EFT Memo',100,0,'Y',TO_DATE('2012-04-16 17:48:31','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:31 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000201 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:31 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000202,20,'Y','N','N',10028,'N',290,'Y',3000008,'Y','Information from EFT media',104,'LAR','Electronic Funds Transfer Payee information','EFT Payee',100,0,'Y',TO_DATE('2012-04-16 17:48:31','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:31 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000202 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:32 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000203,20,'Y','Y','N',10030,'N',300,'Y',3000008,'Y','Information from EFT media','LAR','Electronic Funds Transfer Payee Account Information','EFT Payee Account',100,0,'Y',TO_DATE('2012-04-16 17:48:31','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:32 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000203 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:32 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000204,14,'Y','N','N',10338,'N',310,'Y',3000008,'Y','Information from EFT media','LAR','Electronic Funds Transfer Statement Line Date','EFT Statement Line Date',100,0,'Y',TO_DATE('2012-04-16 17:48:32','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:32 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000204 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:32 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000205,14,'Y','Y','N',10336,'N',320,'Y',3000008,'Y','Information from EFT media','LAR','Electronic Funds Transfer Valuta (effective) Date','EFT Effective Date',100,0,'Y',TO_DATE('2012-04-16 17:48:32','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:32 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000205 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:32 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000206,20,'Y','N','N',10341,'N',330,'Y',3000008,'Y','Information from EFT media','LAR','Electronic Funds Transfer Currency','EFT Currency',100,0,'Y',TO_DATE('2012-04-16 17:48:32','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:32 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000206 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 17:48:33 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000207,26,'Y','Y','N',10340,'N',340,'Y',3000008,'Y','LAR','Electronic Funds Transfer Amount','EFT Amount',100,0,'Y',TO_DATE('2012-04-16 17:48:32','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 17:48:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 17:48:33 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000207 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 18:06:22 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Tab SET Help='The Drawer Closing Tab defines the Drawer to be reconciled/closed.', Name='Drawer Closing ', Description='Drawer Closing',Updated=TO_DATE('2012-04-16 18:06:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000007
;

-- 16/04/2012 18:06:22 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Tab_Trl SET IsTranslated='N' WHERE AD_Tab_ID=3000007
;

-- 16/04/2012 18:07:09 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Tab SET Help='Drawer Closing Line (The Drawer Closing Tab defines the individual line items on the Drawer Closing.  They can be entered manually or generated from payments entered.
<br>For Posting, the bank account organization is used, if it is not a charge.', Name='Drawer Closing Line', Description='Drawer Closing Line',Updated=TO_DATE('2012-04-16 18:07:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000008
;

-- 16/04/2012 18:07:09 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Tab_Trl SET IsTranslated='N' WHERE AD_Tab_ID=3000008
;

-- 16/04/2012 19:29:17 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET Description='Drawer to be closed', Name='Drawer',Updated=TO_DATE('2012-04-16 19:29:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000154
;

-- 16/04/2012 19:29:17 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field_Trl SET IsTranslated='N' WHERE AD_Field_ID=3000154
;

-- 16/04/2012 19:30:18 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET Description='Change prior to any transactions', Name='Inicial Change',Updated=TO_DATE('2012-04-16 19:30:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000160
;

-- 16/04/2012 19:30:18 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field_Trl SET IsTranslated='N' WHERE AD_Field_ID=3000160
;

-- 16/04/2012 19:31:03 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET Description='Date of the Drawer Closing', Name='Drawer Closing Date',Updated=TO_DATE('2012-04-16 19:31:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000156
;

-- 16/04/2012 19:31:03 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field_Trl SET IsTranslated='N' WHERE AD_Field_ID=3000156
;

-- 16/04/2012 19:32:36 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2012-04-16 19:32:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000152
;

-- 16/04/2012 19:32:41 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2012-04-16 19:32:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000153
;

-- 16/04/2012 19:32:50 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsCentrallyMaintained='N', Help=NULL,Updated=TO_DATE('2012-04-16 19:32:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000154
;

-- 16/04/2012 19:32:50 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field_Trl SET IsTranslated='N' WHERE AD_Field_ID=3000154
;

-- 16/04/2012 19:32:54 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2012-04-16 19:32:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000155
;

-- 16/04/2012 19:33:05 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsCentrallyMaintained='N', Help=NULL,Updated=TO_DATE('2012-04-16 19:33:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000156
;

-- 16/04/2012 19:33:05 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field_Trl SET IsTranslated='N' WHERE AD_Field_ID=3000156
;

-- 16/04/2012 19:33:16 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2012-04-16 19:33:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000157
;

-- 16/04/2012 19:33:26 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2012-04-16 19:33:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000158
;

-- 16/04/2012 19:33:30 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2012-04-16 19:33:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000159
;

-- 16/04/2012 19:34:03 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsCentrallyMaintained='N', Help=NULL,Updated=TO_DATE('2012-04-16 19:34:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000160
;

-- 16/04/2012 19:34:03 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field_Trl SET IsTranslated='N' WHERE AD_Field_ID=3000160
;

-- 16/04/2012 19:34:25 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2012-04-16 19:34:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000161
;

-- 16/04/2012 19:34:53 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsCentrallyMaintained='N', Help=NULL, Description='Drawer Closing Total', Name='Drawer Closing Total',Updated=TO_DATE('2012-04-17 10:07:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000162
;

-- 16/04/2012 19:34:53 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field_Trl SET IsTranslated='N' WHERE AD_Field_ID=3000162
;

-- 16/04/2012 19:35:00 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsActive='N',Updated=TO_DATE('2012-04-16 19:35:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000163
;

-- 16/04/2012 19:35:05 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2012-04-16 19:35:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000164
;

-- 16/04/2012 19:35:11 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2012-04-16 19:35:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000165
;

-- 16/04/2012 19:35:15 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2012-04-16 19:35:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000166
;

-- 16/04/2012 19:35:19 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2012-04-16 19:35:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000167
;

-- 16/04/2012 19:35:22 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2012-04-16 19:35:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000168
;

-- 16/04/2012 19:35:26 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2012-04-16 19:35:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000169
;

-- 16/04/2012 19:35:32 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2012-04-16 19:35:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000170
;

-- 16/04/2012 19:38:42 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET Help=NULL, Description='Drawer Closing', Name='Drawer Closing',Updated=TO_DATE('2012-04-16 19:38:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000176
;

-- 16/04/2012 19:38:42 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field_Trl SET IsTranslated='N' WHERE AD_Field_ID=3000176
;

-- 16/04/2012 19:39:24 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET Description='Drawer Closing Line Date', Name='Drawer Closing Line Date ',Updated=TO_DATE('2012-04-16 19:39:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000181
;

-- 16/04/2012 19:39:24 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field_Trl SET IsTranslated='N' WHERE AD_Field_ID=3000181
;

-- 16/04/2012 23:44:02 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,SeqNo,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('(SELECT p.TenderType FROM C_Payment p WHERE C_BankStatementLine.C_Payment_ID = p.C_Payment_ID)',3000148,393,'U',0,214,'N','N','N',0,'The Tender Type indicates the method of payment (ACH or Direct Deposit, Credit Card, Check, Direct Debit)','N',20,'N',17,'N','N',1441,'N','Y','N','N','N','Method of Payment','Tender type','TenderType','N',100,TO_DATE('2012-04-16 23:44:01','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-16 23:44:01','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 16/04/2012 23:44:02 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000148 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 16/04/2012 23:49:38 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3000208,0,'Y','N','N',3000148,'N',350,'N',3000008,'Y','LAR','Tender Type',100,0,'Y',TO_DATE('2012-04-16 23:49:38','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-16 23:49:38','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/04/2012 23:49:38 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000208 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/04/2012 23:50:10 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000208
;

-- 16/04/2012 23:50:10 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000187
;

-- 16/04/2012 23:50:11 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000188
;

-- 16/04/2012 23:50:11 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000189
;

-- 16/04/2012 23:50:11 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000190
;

-- 16/04/2012 23:50:11 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000191
;

-- 16/04/2012 23:50:11 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000192
;

-- 16/04/2012 23:50:11 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000193
;

-- 16/04/2012 23:50:11 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000194
;

-- 16/04/2012 23:50:11 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000195
;

-- 16/04/2012 23:50:11 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000196
;

-- 16/04/2012 23:50:11 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000197
;

-- 16/04/2012 23:50:11 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000198
;

-- 16/04/2012 23:50:11 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000199
;

-- 16/04/2012 23:50:11 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000200
;

-- 16/04/2012 23:50:11 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3000201
;

-- 16/04/2012 23:50:11 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000202
;

-- 16/04/2012 23:50:11 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000203
;

-- 16/04/2012 23:50:11 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000204
;

-- 16/04/2012 23:50:11 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000205
;

-- 16/04/2012 23:50:11 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000206
;

-- 16/04/2012 23:50:11 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000207
;

-- 16/04/2012 23:51:34 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsActive='N',Updated=TO_DATE('2012-04-16 23:51:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000193
;

-- 16/04/2012 23:51:45 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsActive='N',Updated=TO_DATE('2012-04-16 23:51:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000194
;

-- 17/04/2012 0:05:27 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000038,'CheckTotalAmt','LAR','CheckTotalAmt','CheckTotalAmt',0,TO_DATE('2012-04-17 00:05:26','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-04-17 00:05:26','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 17/04/2012 0:05:27 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000038 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 17/04/2012 0:10:36 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('(SELECT COALESCE(Sum(TrxAmt),0) FROM C_BankStatementLine sl JOIN C_Payment p ON sl.C_Payment_ID = p.C_Payment_ID WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''K'' AND p.IsReceipt = ''Y''))',3000149,392,'U',0,'N','N','N',0,'N',14,'N',12,'N','N',3000038,'N','Y','N','N','N','CheckTotalAmt','CheckTotalAmt','N',100,TO_DATE('2012-04-17 00:10:36','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-17 00:10:36','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 17/04/2012 0:10:36 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000149 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 17/04/2012 0:16:08 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000039,'CashTotalAmt','LAR','CashTotalAmt','CashTotalAmt',0,TO_DATE('2012-04-17 00:16:07','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-04-17 00:16:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 17/04/2012 0:16:08 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000039 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 17/04/2012 0:19:06 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('(SELECT COALESCE(Sum(TrxAmt),0) FROM C_BankStatementLine sl JOIN C_Payment p ON sl.C_Payment_ID = p.C_Payment_ID WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''X''))',3000150,392,'U',0,'N','N','N',0,'N',22,'N',12,'N','N',3000039,'N','Y','N','N','N','CashTotalAmt','CashTotalAmt','N',100,TO_DATE('2012-04-17 00:19:04','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-17 00:19:04','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 17/04/2012 0:19:06 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000150 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 17/04/2012 0:20:56 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000040,'CreditCardTotalAmt','LAR','CreditCardTotalAmt','CreditCardTotalAmt',0,TO_DATE('2012-04-17 00:20:55','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-04-17 00:20:55','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 17/04/2012 0:20:56 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000040 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 17/04/2012 0:22:23 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('(SELECT COALESCE(Sum(TrxAmt),0) FROM C_BankStatementLine sl JOIN C_Payment p ON sl.C_Payment_ID = p.C_Payment_ID WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''C''))',3000151,392,'U',0,'N','N','N',0,'N',14,'N',12,'N','N',3000040,'N','Y','N','N','N','CreditCardTotalAmt','CreditCardTotalAmt','N',100,TO_DATE('2012-04-17 00:22:22','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-17 00:22:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 17/04/2012 0:22:23 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000151 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 17/04/2012 0:22:33 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Column SET FieldLength=22,Updated=TO_DATE('2012-04-17 00:22:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000151
;

-- 17/04/2012 0:22:42 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Column SET FieldLength=22,Updated=TO_DATE('2012-04-17 00:22:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000149
;

-- 17/04/2012 0:24:21 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000041,'DirectDebitTotalAmt','LAR','DirectDebitTotalAmt','DirectDebitTotalAmt',0,TO_DATE('2012-04-17 00:24:20','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-04-17 00:24:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 17/04/2012 0:24:21 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000041 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 17/04/2012 0:25:15 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('(SELECT COALESCE(Sum(TrxAmt),0) FROM C_BankStatementLine sl JOIN C_Payment p ON sl.C_Payment_ID = p.C_Payment_ID WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''D''))',3000152,392,'U',0,'N','N','N',0,'N',22,'N',12,'N','N',3000041,'N','Y','N','N','N','DirectDebitTotalAmt','DirectDebitTotalAmt','N',100,TO_DATE('2012-04-17 00:25:09','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-17 00:25:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 17/04/2012 0:25:15 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000152 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 17/04/2012 11:08:04 ART
-- Add drawer transfer behavior
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000042,'scrutinizedcheckamt','LAR','scrutinizedcheckamt','scrutinizedcheckamt',0,TO_DATE('2012-04-17 11:08:03','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-04-17 11:08:03','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 17/04/2012 11:08:04 ART
-- Add drawer transfer behavior
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000042 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 17/04/2012 11:08:04 ART
-- Add drawer transfer behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000153,392,'LAR',0,'Y','N','N','N',131089,'N',12,'N',3000042,'N','Y','N','scrutinizedcheckamt','scrutinizedcheckamt',100,TO_DATE('2012-04-17 11:08:03','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-17 11:08:03','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 17/04/2012 11:08:04 ART
-- Add drawer transfer behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000153 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 17/04/2012 11:08:05 ART
-- Add drawer transfer behavior
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000043,'scrutinizedcashamt','LAR','scrutinizedcashamt','scrutinizedcashamt',0,TO_DATE('2012-04-17 11:08:04','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-04-17 11:08:04','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 17/04/2012 11:08:05 ART
-- Add drawer transfer behavior
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000043 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 17/04/2012 11:08:05 ART
-- Add drawer transfer behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000154,392,'LAR',0,'Y','N','N','N',131089,'N',12,'N',3000043,'N','Y','N','scrutinizedcashamt','scrutinizedcashamt',100,TO_DATE('2012-04-17 11:08:04','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-17 11:08:04','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 17/04/2012 11:08:05 ART
-- Add drawer transfer behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000154 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 17/04/2012 11:08:06 ART
-- Add drawer transfer behavior
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000044,'scrutinizedcreditcardamt','LAR','scrutinizedcreditcardamt','scrutinizedcreditcardamt',0,TO_DATE('2012-04-17 11:08:05','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-04-17 11:08:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 17/04/2012 11:08:06 ART
-- Add drawer transfer behavior
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000044 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 17/04/2012 11:08:06 ART
-- Add drawer transfer behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000155,392,'LAR',0,'Y','N','N','N',131089,'N',12,'N',3000044,'N','Y','N','scrutinizedcreditcardamt','scrutinizedcreditcardamt',100,TO_DATE('2012-04-17 11:08:05','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-17 11:08:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 17/04/2012 11:08:06 ART
-- Add drawer transfer behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000155 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 17/04/2012 11:08:06 ART
-- Add drawer transfer behavior
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000045,'scrutinizeddirectdebitamt','LAR','scrutinizeddirectdebitamt','scrutinizeddirectdebitamt',0,TO_DATE('2012-04-17 11:08:06','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-04-17 11:08:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 17/04/2012 11:08:06 ART
-- Add drawer transfer behavior
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000045 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 17/04/2012 11:08:06 ART
-- Add drawer transfer behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000156,392,'LAR',0,'Y','N','N','N',131089,'N',12,'N',3000045,'N','Y','N','scrutinizeddirectdebitamt','scrutinizeddirectdebitamt',100,TO_DATE('2012-04-17 11:08:06','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-17 11:08:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 17/04/2012 11:08:06 ART
-- Add drawer transfer behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000156 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 17/04/2012 11:09:01 ART
-- Add drawer transfer behavior
UPDATE AD_Element SET ColumnName='ScrutinizedCashAmt', Name='ScrutinizedCashAmt', PrintName='ScrutinizedCashAmt',Updated=TO_DATE('2012-04-17 11:09:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000043
;

-- 17/04/2012 11:09:01 ART
-- Add drawer transfer behavior
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000043
;

-- 17/04/2012 11:09:01 ART
-- Add drawer transfer behavior
UPDATE AD_Column SET ColumnName='ScrutinizedCashAmt', Name='ScrutinizedCashAmt', Description=NULL, Help=NULL WHERE AD_Element_ID=3000043
;

-- 17/04/2012 11:09:01 ART
-- Add drawer transfer behavior
UPDATE AD_Process_Para SET ColumnName='ScrutinizedCashAmt', Name='ScrutinizedCashAmt', Description=NULL, Help=NULL, AD_Element_ID=3000043 WHERE UPPER(ColumnName)='SCRUTINIZEDCASHAMT' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 17/04/2012 11:09:01 ART
-- Add drawer transfer behavior
UPDATE AD_Process_Para SET ColumnName='ScrutinizedCashAmt', Name='ScrutinizedCashAmt', Description=NULL, Help=NULL WHERE AD_Element_ID=3000043 AND IsCentrallyMaintained='Y'
;

-- 17/04/2012 11:09:01 ART
-- Add drawer transfer behavior
UPDATE AD_Field SET Name='ScrutinizedCashAmt', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000043) AND IsCentrallyMaintained='Y'
;

-- 17/04/2012 11:09:01 ART
-- Add drawer transfer behavior
UPDATE AD_PrintFormatItem pi SET PrintName='ScrutinizedCashAmt', Name='ScrutinizedCashAmt' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000043)
;

-- 17/04/2012 11:10:37 ART
-- Add drawer transfer behavior
UPDATE AD_Column SET FieldLength=22,Updated=TO_DATE('2012-04-17 11:10:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000154
;

-- 17/04/2012 11:12:32 ART
-- Add drawer transfer behavior
UPDATE AD_Element SET ColumnName='ScrutinizedCheckAmt', Name='ScrutinizedCheckAmt', PrintName='ScrutinizedCheckAmt',Updated=TO_DATE('2012-04-17 11:12:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000042
;

-- 17/04/2012 11:12:32 ART
-- Add drawer transfer behavior
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000042
;

-- 17/04/2012 11:12:32 ART
-- Add drawer transfer behavior
UPDATE AD_Column SET ColumnName='ScrutinizedCheckAmt', Name='ScrutinizedCheckAmt', Description=NULL, Help=NULL WHERE AD_Element_ID=3000042
;

-- 17/04/2012 11:12:32 ART
-- Add drawer transfer behavior
UPDATE AD_Process_Para SET ColumnName='ScrutinizedCheckAmt', Name='ScrutinizedCheckAmt', Description=NULL, Help=NULL, AD_Element_ID=3000042 WHERE UPPER(ColumnName)='SCRUTINIZEDCHECKAMT' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 17/04/2012 11:12:32 ART
-- Add drawer transfer behavior
UPDATE AD_Process_Para SET ColumnName='ScrutinizedCheckAmt', Name='ScrutinizedCheckAmt', Description=NULL, Help=NULL WHERE AD_Element_ID=3000042 AND IsCentrallyMaintained='Y'
;

-- 17/04/2012 11:12:32 ART
-- Add drawer transfer behavior
UPDATE AD_Field SET Name='ScrutinizedCheckAmt', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000042) AND IsCentrallyMaintained='Y'
;

-- 17/04/2012 11:12:32 ART
-- Add drawer transfer behavior
UPDATE AD_PrintFormatItem pi SET PrintName='ScrutinizedCheckAmt', Name='ScrutinizedCheckAmt' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000042)
;

-- 17/04/2012 11:12:43 ART
-- Add drawer transfer behavior
UPDATE AD_Column SET FieldLength=22,Updated=TO_DATE('2012-04-17 11:12:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000153
;

-- 17/04/2012 11:13:06 ART
-- Add drawer transfer behavior
UPDATE AD_Element SET ColumnName='ScrutinizedCreditCardAmt', Name='ScrutinizedCreditCardAmt', PrintName='ScrutinizedCreditCardAmt',Updated=TO_DATE('2012-04-17 11:13:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000044
;

-- 17/04/2012 11:13:06 ART
-- Add drawer transfer behavior
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000044
;

-- 17/04/2012 11:13:06 ART
-- Add drawer transfer behavior
UPDATE AD_Column SET ColumnName='ScrutinizedCreditCardAmt', Name='ScrutinizedCreditCardAmt', Description=NULL, Help=NULL WHERE AD_Element_ID=3000044
;

-- 17/04/2012 11:13:06 ART
-- Add drawer transfer behavior
UPDATE AD_Process_Para SET ColumnName='ScrutinizedCreditCardAmt', Name='ScrutinizedCreditCardAmt', Description=NULL, Help=NULL, AD_Element_ID=3000044 WHERE UPPER(ColumnName)='SCRUTINIZEDCREDITCARDAMT' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 17/04/2012 11:13:06 ART
-- Add drawer transfer behavior
UPDATE AD_Process_Para SET ColumnName='ScrutinizedCreditCardAmt', Name='ScrutinizedCreditCardAmt', Description=NULL, Help=NULL WHERE AD_Element_ID=3000044 AND IsCentrallyMaintained='Y'
;

-- 17/04/2012 11:13:06 ART
-- Add drawer transfer behavior
UPDATE AD_Field SET Name='ScrutinizedCreditCardAmt', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000044) AND IsCentrallyMaintained='Y'
;

-- 17/04/2012 11:13:06 ART
-- Add drawer transfer behavior
UPDATE AD_PrintFormatItem pi SET PrintName='ScrutinizedCreditCardAmt', Name='ScrutinizedCreditCardAmt' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000044)
;

-- 17/04/2012 11:13:14 ART
-- Add drawer transfer behavior
UPDATE AD_Column SET FieldLength=22,Updated=TO_DATE('2012-04-17 11:13:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000155
;

-- 17/04/2012 11:13:40 ART
-- Add drawer transfer behavior
UPDATE AD_Element SET ColumnName='ScrutinizedDirectDebitAmt', Name='ScrutinizedDirectDebitAmt', PrintName='ScrutinizedDirectDebitAmt',Updated=TO_DATE('2012-04-17 11:13:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000045
;

-- 17/04/2012 11:13:40 ART
-- Add drawer transfer behavior
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000045
;

-- 17/04/2012 11:13:40 ART
-- Add drawer transfer behavior
UPDATE AD_Column SET ColumnName='ScrutinizedDirectDebitAmt', Name='ScrutinizedDirectDebitAmt', Description=NULL, Help=NULL WHERE AD_Element_ID=3000045
;

-- 17/04/2012 11:13:40 ART
-- Add drawer transfer behavior
UPDATE AD_Process_Para SET ColumnName='ScrutinizedDirectDebitAmt', Name='ScrutinizedDirectDebitAmt', Description=NULL, Help=NULL, AD_Element_ID=3000045 WHERE UPPER(ColumnName)='SCRUTINIZEDDIRECTDEBITAMT' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 17/04/2012 11:13:40 ART
-- Add drawer transfer behavior
UPDATE AD_Process_Para SET ColumnName='ScrutinizedDirectDebitAmt', Name='ScrutinizedDirectDebitAmt', Description=NULL, Help=NULL WHERE AD_Element_ID=3000045 AND IsCentrallyMaintained='Y'
;

-- 17/04/2012 11:13:40 ART
-- Add drawer transfer behavior
UPDATE AD_Field SET Name='ScrutinizedDirectDebitAmt', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000045) AND IsCentrallyMaintained='Y'
;

-- 17/04/2012 11:13:40 ART
-- Add drawer transfer behavior
UPDATE AD_PrintFormatItem pi SET PrintName='ScrutinizedDirectDebitAmt', Name='ScrutinizedDirectDebitAmt' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000045)
;

-- 17/04/2012 11:13:49 ART
-- Add drawer transfer behavior
UPDATE AD_Column SET FieldLength=22,Updated=TO_DATE('2012-04-17 11:13:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000156
;

-- 17/04/2012 18:18:20 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000047,'CheckDifference','LAR','CheckDifference','CheckDifference',0,TO_DATE('2012-04-17 18:18:19','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-04-17 18:18:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 17/04/2012 18:18:20 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000047 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 17/04/2012 18:19:37 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('(SELECT (C_BankStatement.ScrutinizedCheckAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON sl.C_Payment_ID = p.C_Payment_ID WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''K'' AND IsReceipt = ''Y''))',3000157,392,'U',0,'N','N','N',0,'N',14,'N',12,'N','N',3000047,'N','Y','N','N','N','CheckDifference','CheckDifference','N',100,TO_DATE('2012-04-17 18:19:36','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-17 18:19:36','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 17/04/2012 18:19:37 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000157 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 17/04/2012 18:22:22 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000048,'CashDifference','LAR','CashDifference','CashDifference',0,TO_DATE('2012-04-17 18:22:22','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-04-17 18:22:22','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 17/04/2012 18:22:22 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000048 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 17/04/2012 18:23:25 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('(SELECT (C_BankStatement.ScrutinizedCashAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON sl.C_Payment_ID = p.C_Payment_ID WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''X''))',3000158,392,'U',0,'N','N','N',0,'N',22,'N',12,'N','N',3000048,'N','Y','N','N','N','CashDifference','CashDifference','N',100,TO_DATE('2012-04-17 18:23:24','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-17 18:23:24','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 17/04/2012 18:23:25 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000158 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 17/04/2012 18:23:47 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Column SET FieldLength=22,Updated=TO_DATE('2012-04-17 18:23:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000157
;

-- 17/04/2012 18:25:11 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000049,'CreditCardDifference','LAR','CreditCardDifference','CreditCardDifference',0,TO_DATE('2012-04-17 18:25:10','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-04-17 18:25:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 17/04/2012 18:25:11 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000049 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 17/04/2012 18:25:48 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (' (SELECT (C_BankStatement.ScrutinizedCreditCardAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON sl.C_Payment_ID = p.C_Payment_ID WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''C''))',3000159,392,'U',0,'N','N','N',0,'N',14,'N',12,'N','N',3000049,'N','Y','N','N','N','CreditCardDifference','CreditCardDifference','N',100,TO_DATE('2012-04-17 18:25:48','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-17 18:25:48','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 17/04/2012 18:25:48 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000159 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 17/04/2012 18:25:57 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Column SET FieldLength=22,Updated=TO_DATE('2012-04-17 18:25:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000159
;

-- 17/04/2012 18:27:21 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000050,'DirectDebitDifference','LAR','DirectDebitDifference','DirectDebitDifference',0,TO_DATE('2012-04-17 18:27:20','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-04-17 18:27:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 17/04/2012 18:27:21 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000050 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 17/04/2012 18:27:56 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('(SELECT (C_BankStatement.ScrutinizedDirectDebitAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON sl.C_Payment_ID = p.C_Payment_ID WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''D''))',3000160,392,'U',0,'N','N','N',0,'N',22,'N',12,'N','N',3000050,'N','Y','N','N','N','DirectDebitDifference','DirectDebitDifference','N',100,TO_DATE('2012-04-17 18:27:55','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-17 18:27:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 17/04/2012 18:27:56 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000160 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 17/04/2012 18:28:45 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000051,'TotalDifference','LAR','TotalDifference','TotalDifference',0,TO_DATE('2012-04-17 18:28:45','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-04-17 18:28:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 17/04/2012 18:28:45 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000051 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 17/04/2012 18:29:33 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('(SELECT ((C_BankStatement.ScrutinizedCheckAmt + C_BankStatement.ScrutinizedCashAmt + C_BankStatement.ScrutinizedCreditCardAmt + C_BankStatement.ScrutinizedDirectDebitAmt) - (COALESCE(Sum(TrxAmt),0))) FROM (C_BankStatementLine sl JOIN C_Payment p ON sl.C_Payment_ID = p.C_Payment_ID) WHERE ((C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID) AND (p.TenderType IN (‘X’,’K’,’C’,’D’))))',3000161,392,'U',0,'N','N','N',0,'N',22,'N',12,'N','N',3000051,'N','Y','N','N','N','TotalDifference','TotalDifference','N',100,TO_DATE('2012-04-17 18:29:33','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-04-17 18:29:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 17/04/2012 18:29:33 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000161 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 17/04/2012 18:30:53 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Column SET ColumnSQL='(SELECT ((C_BankStatement.ScrutinizedCheckAmt + C_BankStatement.ScrutinizedCashAmt + C_BankStatement.ScrutinizedCreditCardAmt + C_BankStatement.ScrutinizedDirectDebitAmt) - (COALESCE(Sum(TrxAmt),0))) FROM (C_BankStatementLine sl JOIN C_Payment p ON sl.C_Payment_ID = p.C_Payment_ID) WHERE ((C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID) AND (p.TenderType IN (''X'',''K'',''C'',''D''))))',Updated=TO_DATE('2012-04-17 18:30:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000161
;

-- 17/04/2012 19:16:32 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000209,22,'Y','N','N',3000158,'N','Y',3000007,'N','U','CashDifference',100,0,'Y',TO_DATE('2012-04-17 19:16:31','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-17 19:16:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 17/04/2012 19:16:32 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000209 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 17/04/2012 19:16:33 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000210,22,'Y','N','N',3000150,'N','Y',3000007,'N','U','CashTotalAmt',100,0,'Y',TO_DATE('2012-04-17 19:16:32','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-17 19:16:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 17/04/2012 19:16:33 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000210 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 17/04/2012 19:16:33 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000211,22,'Y','N','N',3000157,'N','Y',3000007,'N','U','CheckDifference',100,0,'Y',TO_DATE('2012-04-17 19:16:33','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-17 19:16:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 17/04/2012 19:16:33 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000211 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 17/04/2012 19:16:33 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000212,22,'Y','N','N',3000149,'N','Y',3000007,'N','U','CheckTotalAmt',100,0,'Y',TO_DATE('2012-04-17 19:16:33','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-17 19:16:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 17/04/2012 19:16:33 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000212 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 17/04/2012 19:16:33 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000213,22,'Y','N','N',3000159,'N','Y',3000007,'N','U','CreditCardDifference',100,0,'Y',TO_DATE('2012-04-17 19:16:33','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-17 19:16:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 17/04/2012 19:16:33 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000213 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 17/04/2012 19:16:34 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000214,22,'Y','N','N',3000151,'N','Y',3000007,'N','U','CreditCardTotalAmt',100,0,'Y',TO_DATE('2012-04-17 19:16:33','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-17 19:16:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 17/04/2012 19:16:34 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000214 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 17/04/2012 19:16:34 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000215,22,'Y','N','N',3000160,'N','Y',3000007,'N','U','DirectDebitDifference',100,0,'Y',TO_DATE('2012-04-17 19:16:34','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-17 19:16:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 17/04/2012 19:16:34 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000215 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 17/04/2012 19:16:34 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000216,22,'Y','N','N',3000152,'N','Y',3000007,'N','U','DirectDebitTotalAmt',100,0,'Y',TO_DATE('2012-04-17 19:16:34','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-17 19:16:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 17/04/2012 19:16:34 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000216 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 17/04/2012 19:16:34 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000217,20,'Y','N','N',59035,'N','Y',3000007,'N','The ProcessedOn Date+Time save the exact moment (nanoseconds precision if allowed by the DB) when a document has been processed.','LAR','The date+time (expressed in decimal format) when the document has been processed','Processed On',100,0,'Y',TO_DATE('2012-04-17 19:16:34','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-17 19:16:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 17/04/2012 19:16:34 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000217 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 17/04/2012 19:16:35 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000218,22,'Y','N','N',3000154,'N','Y',3000007,'N','LAR','ScrutinizedCashAmt',100,0,'Y',TO_DATE('2012-04-17 19:16:34','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-17 19:16:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 17/04/2012 19:16:35 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000218 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 17/04/2012 19:16:35 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000219,22,'Y','N','N',3000153,'N','Y',3000007,'N','LAR','ScrutinizedCheckAmt',100,0,'Y',TO_DATE('2012-04-17 19:16:35','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-17 19:16:35','YYYY-MM-DD HH24:MI:SS'))
;

-- 17/04/2012 19:16:35 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000219 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 17/04/2012 19:16:35 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000220,22,'Y','N','N',3000155,'N','Y',3000007,'N','LAR','ScrutinizedCreditCardAmt',100,0,'Y',TO_DATE('2012-04-17 19:16:35','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-17 19:16:35','YYYY-MM-DD HH24:MI:SS'))
;

-- 17/04/2012 19:16:35 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000220 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 17/04/2012 19:16:35 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000221,22,'Y','N','N',3000156,'N','Y',3000007,'N','LAR','ScrutinizedDirectDebitAmt',100,0,'Y',TO_DATE('2012-04-17 19:16:35','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-17 19:16:35','YYYY-MM-DD HH24:MI:SS'))
;

-- 17/04/2012 19:16:35 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000221 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 17/04/2012 19:16:36 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000222,22,'Y','N','N',3000161,'N','Y',3000007,'N','U','TotalDifference',100,0,'Y',TO_DATE('2012-04-17 19:16:35','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-04-17 19:16:35','YYYY-MM-DD HH24:MI:SS'))
;

-- 17/04/2012 19:16:36 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000222 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 17/04/2012 19:36:40 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000217
;

-- 17/04/2012 19:36:40 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000212
;

-- 17/04/2012 19:36:40 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000219
;

-- 17/04/2012 19:36:40 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000211
;

-- 17/04/2012 19:36:40 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000210
;

-- 17/04/2012 19:36:40 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000218
;

-- 17/04/2012 19:36:40 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000209
;

-- 17/04/2012 19:36:40 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000214
;

-- 17/04/2012 19:36:40 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000220
;

-- 17/04/2012 19:36:40 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000213
;

-- 17/04/2012 19:36:40 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000216
;

-- 17/04/2012 19:36:40 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000221
;

-- 17/04/2012 19:36:40 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000215
;

-- 17/04/2012 19:36:40 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000222
;

-- 17/04/2012 19:36:40 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000165
;

-- 17/04/2012 19:36:40 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000166
;

-- 17/04/2012 19:36:40 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3000167
;

-- 17/04/2012 19:36:40 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000168
;

-- 17/04/2012 19:36:40 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000169
;

-- 17/04/2012 19:36:40 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000170
;

-- 17/04/2012 19:38:49 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsCentrallyMaintained='N', IsReadOnly='Y', AD_FieldGroup_ID=117, EntityType='LAR',Updated=TO_DATE('2012-04-17 19:38:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000212
;

-- 17/04/2012 19:39:01 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2012-04-17 19:39:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000219
;

-- 17/04/2012 19:39:14 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsCentrallyMaintained='N', IsReadOnly='Y', EntityType='LAR',Updated=TO_DATE('2012-04-17 19:39:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000211
;

-- 17/04/2012 19:39:30 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2012-04-17 19:39:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000219
;

-- 17/04/2012 19:39:35 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2012-04-17 19:39:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000211
;

-- 17/04/2012 19:39:53 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsCentrallyMaintained='N', IsReadOnly='Y', EntityType='LAR',Updated=TO_DATE('2012-04-17 19:39:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000210
;

-- 17/04/2012 19:40:12 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsSameLine='Y', IsCentrallyMaintained='N',Updated=TO_DATE('2012-04-17 19:40:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000218
;

-- 17/04/2012 19:40:24 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsSameLine='Y', IsCentrallyMaintained='N', IsReadOnly='Y', EntityType='LAR',Updated=TO_DATE('2012-04-17 19:40:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000209
;

-- 17/04/2012 19:40:51 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsCentrallyMaintained='N', IsReadOnly='Y', EntityType='LAR',Updated=TO_DATE('2012-04-17 19:40:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000214
;

-- 17/04/2012 19:40:59 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsSameLine='Y', IsCentrallyMaintained='N',Updated=TO_DATE('2012-04-17 19:40:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000220
;

-- 17/04/2012 19:41:14 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsSameLine='Y', IsCentrallyMaintained='N', IsReadOnly='Y', EntityType='LAR',Updated=TO_DATE('2012-04-17 19:41:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000213
;

-- 17/04/2012 19:41:32 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsCentrallyMaintained='N', IsReadOnly='Y', EntityType='LAR',Updated=TO_DATE('2012-04-17 19:41:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000216
;

-- 17/04/2012 19:42:12 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsSameLine='Y', IsCentrallyMaintained='N',Updated=TO_DATE('2012-04-17 19:42:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000221
;

-- 17/04/2012 19:42:20 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsSameLine='Y', IsCentrallyMaintained='N', IsReadOnly='Y',Updated=TO_DATE('2012-04-17 19:42:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000215
;

-- 17/04/2012 19:42:57 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET AD_FieldGroup_ID=117,Updated=TO_DATE('2012-04-17 19:42:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000219
;

-- 17/04/2012 19:43:02 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET AD_FieldGroup_ID=117,Updated=TO_DATE('2012-04-17 19:43:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000211
;

-- 17/04/2012 19:43:10 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET AD_FieldGroup_ID=117,Updated=TO_DATE('2012-04-17 19:43:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000210
;

-- 17/04/2012 19:43:20 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET AD_FieldGroup_ID=117,Updated=TO_DATE('2012-04-17 19:43:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000218
;

-- 17/04/2012 19:43:28 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET AD_FieldGroup_ID=117,Updated=TO_DATE('2012-04-17 19:43:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000209
;

-- 17/04/2012 19:43:35 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET AD_FieldGroup_ID=117,Updated=TO_DATE('2012-04-17 19:43:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000214
;

-- 17/04/2012 19:43:44 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET AD_FieldGroup_ID=117,Updated=TO_DATE('2012-04-17 19:43:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000220
;

-- 17/04/2012 19:43:50 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET AD_FieldGroup_ID=117,Updated=TO_DATE('2012-04-17 19:43:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000213
;

-- 17/04/2012 19:43:56 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET AD_FieldGroup_ID=117,Updated=TO_DATE('2012-04-17 19:43:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000216
;

-- 17/04/2012 19:44:02 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET AD_FieldGroup_ID=117,Updated=TO_DATE('2012-04-17 19:44:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000221
;

-- 17/04/2012 19:44:08 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET AD_FieldGroup_ID=117,Updated=TO_DATE('2012-04-17 19:44:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000215
;

-- 17/04/2012 19:45:39 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3000222
;

-- 17/04/2012 19:45:39 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3000163
;

-- 17/04/2012 19:45:39 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000164
;

-- 17/04/2012 19:45:39 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000212
;

-- 17/04/2012 19:45:39 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000219
;

-- 17/04/2012 19:45:39 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000211
;

-- 17/04/2012 19:45:39 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000210
;

-- 17/04/2012 19:45:39 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000218
;

-- 17/04/2012 19:45:39 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000209
;

-- 17/04/2012 19:45:39 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000214
;

-- 17/04/2012 19:45:39 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000220
;

-- 17/04/2012 19:45:39 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000213
;

-- 17/04/2012 19:45:39 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000216
;

-- 17/04/2012 19:45:39 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000221
;

-- 17/04/2012 19:45:39 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000215
;

-- 17/04/2012 19:46:05 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_Field SET IsCentrallyMaintained='N', IsReadOnly='Y', EntityType='LAR',Updated=TO_DATE('2012-04-17 19:46:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000222
;

-- 17/04/2012 20:38:35 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Menu (AD_Menu_ID,IsSummary,IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000008,'Y','N','N','LAR','Y','Cajas',TO_DATE('2012-04-17 20:38:34','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_DATE('2012-04-17 20:38:34','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 17/04/2012 20:38:35 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000008 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 17/04/2012 20:38:35 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', SysDate, 100, SysDate, 100,t.AD_Tree_ID, 3000008, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000008)
;

-- 17/04/2012 20:39:59 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Menu (AD_Window_ID,AD_Menu_ID,IsSummary,Action,IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000005,3000009,'N','W','N','N','LAR','N','Drawer Closing',TO_DATE('2012-04-17 20:39:58','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_DATE('2012-04-17 20:39:58','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 17/04/2012 20:39:59 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000009 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 17/04/2012 20:39:59 GMT-03:00
-- Add drawer transfer behavior
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', SysDate, 100, SysDate, 100,t.AD_Tree_ID, 3000009, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000009)
;

-- 17/04/2012 20:40:04 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=3000008, SeqNo=0, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000009
;

-- 17/04/2012 20:40:16 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=3000008, SeqNo=0, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000007
;

-- 17/04/2012 20:40:16 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=3000008, SeqNo=1, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000009
;

-- 17/04/2012 20:43:18 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=3000008, SeqNo=0, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000007
;

-- 17/04/2012 20:43:18 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=3000008, SeqNo=1, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000009
;

-- 17/04/2012 20:43:18 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=3000000, SeqNo=0, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000008
;

-- 17/04/2012 20:43:18 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=3000000, SeqNo=1, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000002
;

-- 17/04/2012 20:43:18 GMT-03:00
-- Add drawer transfer behavior
UPDATE AD_TreeNodeMM SET Parent_ID=3000000, SeqNo=2, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000001
;
