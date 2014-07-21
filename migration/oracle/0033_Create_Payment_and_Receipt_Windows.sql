-- 14/05/2012 9:26:59 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_Window SET Help='The Process Payments Window allows you to enter payments for invoices.  If the payment is for a single invoice then it can be processed here.  If it is for multiple invoices or is a partial payment then it should be processed in the Payment Allocation Window.', Name='Payment -> Invoices', Description='Process Payments',Updated=TO_DATE('2012-05-14 09:26:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Window_ID=195
;

-- 14/05/2012 9:26:59 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_Window_Trl SET IsTranslated='N' WHERE AD_Window_ID=195
;

-- 14/05/2012 9:26:59 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_Menu SET Name='Payment -> Invoices', Description='Process Payments', IsActive='Y',Updated=TO_DATE('2012-05-14 09:26:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Menu_ID=235
;

-- 14/05/2012 9:26:59 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_Menu_Trl SET IsTranslated='N' WHERE AD_Menu_ID=235
;

-- 14/05/2012 9:30:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_Tab SET Help='Enter payment for a Business Partner.  If it is for a single invoice it can be allocated directly to that invoice using this screen. You can also apply over/under payments:<br>
You have an over-payment, if you received more money than due for a single invoice. Instead of writing the difference off (i.e. would be a gain), you can leave the amount unallocated and use it for later invoices or credit memos. Please note that the Amount is the payment amount, so you need to enter the over-payment as a negative amount.<br>
You can also receive a partial payment (under-payment). If you decide not to write off the remaining invoice amount, enter the under-payment as a positive amount.<br>
Note that printed payments are archived in Payment Selection (Prepared Payment).
<br>For Posting, the bank account organization is used, if it is not a charge.', WhereClause='(C_Payment.C_BPartner_ID IS NOT NULL) AND (C_Payment.IsReceipt=''N'')', Name='Payment -> Invoices', Description='A Payment can be allocated to several Invoices',Updated=TO_DATE('2012-05-14 09:30:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Tab_ID=330
;

-- 14/05/2012 9:30:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_Tab_Trl SET IsTranslated='N' WHERE AD_Tab_ID=330
;

-- 14/05/2012 9:52:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_Menu SET Name='Payment -> Invoices', Description='Process Payments (Allocated to several Invoices)',Updated=TO_DATE('2012-05-14 09:52:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Menu_ID=235
;

-- 14/05/2012 9:52:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_Menu_Trl SET IsTranslated='N' WHERE AD_Menu_ID=235
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=0, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000015
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=1, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000013
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=2, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000014
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=3, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=235
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=4, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=241
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=5, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=288
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=6, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=432
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=7, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=235
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=8, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=243
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=9, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=413
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=10, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=538
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=11, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=462
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=12, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=505
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=13, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=511
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=14, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=245
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=15, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=251
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=16, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=246
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=17, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=509
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=18, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=510
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=19, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=496
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=20, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=497
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=21, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=304
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=22, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=255
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=23, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=286
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=24, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=287
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=25, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=438
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=26, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=234
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=27, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=244
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=28, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53313
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=29, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53314
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=30, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53190
;

-- 14/05/2012 9:52:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=31, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53187
;
---MODIF Payment ->

-- 15/05/2012 11:24:01 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_Tab SET Name='Allocate to Invoices',Updated=TO_DATE('2012-05-15 11:24:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Tab_ID=755
;

-- 15/05/2012 11:24:01 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_Tab_Trl SET IsTranslated='N' WHERE AD_Tab_ID=755
;

-- 15/05/2012 11:24:27 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_Tab_Trl SET IsTranslated='Y',Name='Asignación a Facturas',Updated=TO_DATE('2012-05-15 11:24:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Tab_ID=755 AND AD_Language='es_AR'
;

-- 15/05/2012 11:34:59 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_Field SET AD_Reference_ID=19, AD_Val_Rule_ID=3000002,Updated=TO_DATE('2012-05-15 11:34:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=4132
;
--Creacion de Receipt -> Invoices

-- 15/05/2012 11:42:09 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Window (AD_Window_ID,WindowType,Help,IsSOTrx,IsDefault,IsBetaFunctionality,AD_Image_ID,EntityType,Name,Description,IsActive,Created,UpdatedBy,CreatedBy,Updated,AD_Org_ID,AD_Client_ID,Processing) VALUES (1000005,'T','The Receipt -> Invoices Window allows you to enter a recipt and allocate it to several invoices.','Y','N','N',106,'LAR','Receipt -> Invoices','Process Receipts','Y',TO_DATE('2012-05-15 11:42:09','YYYY-MM-DD HH24:MI:SS'),0,0,TO_DATE('2012-05-15 11:42:09','YYYY-MM-DD HH24:MI:SS'),0,0,'N')
;

-- 15/05/2012 11:42:09 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Window_Trl (AD_Language,AD_Window_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Window_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Window t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Window_ID=1000005 AND NOT EXISTS (SELECT * FROM AD_Window_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Window_ID=t.AD_Window_ID)
;

-- 15/05/2012 11:42:27 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,Help,IsTranslationTab,AD_Process_ID,IsSortTab,AD_Table_ID,AD_Tab_ID,HasTree,IsInfoTab,WhereClause,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,Description,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('Y',1000005,10,'Enter payment for a Business Partner.  If it is for a single invoice it can be allocated directly to that invoice using this screen. You can also apply over/under payments:<br>
You have an over-payment, if you received more money than due for a single invoice. Instead of writing the difference off (i.e. would be a gain), you can leave the amount unallocated and use it for later invoices or credit memos. Please note that the Amount is the payment amount, so you need to enter the over-payment as a negative amount.<br>
You can also receive a partial payment (under-payment). If you decide not to write off the remaining invoice amount, enter the under-payment as a positive amount.<br>
Note that printed payments are archived in Payment Selection (Prepared Payment).
<br>For Posting, the bank account organization is used, if it is not a charge.','N',313,'N',335,3000026,'N','N','(C_Payment.C_BPartner_ID IS NOT NULL) AND (C_Payment.IsReceipt=''N'')','N',0,'Y','N','LAR','Payment -> Invoices','A Payment can be allocated to several Invoices',0,0,TO_DATE('2012-05-15 11:42:27','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2012-05-15 11:42:27','YYYY-MM-DD HH24:MI:SS'),'Y','N',0)
;

-- 15/05/2012 11:42:27 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000026 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 15/05/2012 11:42:27 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000902,1,'N','N','N',8982,'N',0,'Y',3000026,'N','The Credit Card Verification Code was matched','LAR','Credit Card Verification Code Match','CVV Match',0,0,TO_DATE('2012-05-15 11:42:27','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:27','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:27 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000902 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:27 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000903,60,'N','N','N',8985,'N',0,'Y',3000026,'Y','Swiped information for Credit Card Presence Transactions','LAR','Track 1 and 2 of the Credit Card','Swipe',0,0,TO_DATE('2012-05-15 11:42:27','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:27','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:27 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000903 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:27 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000904,20,'N','N','N',8983,'N',0,'Y',3000026,'N','The Payment Reference indicates the reference returned from the Credit Card Company for a payment','LAR','Payment Reference Delayed Capture','Reference (DC)',0,0,TO_DATE('2012-05-15 11:42:27','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:27','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:27 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000904 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:27 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001031,22,'N','N','N',55309,'N',0,'Y',3000026,'N','LAR','ID of document reversal','Reversal ID',0,0,TO_DATE('2012-05-15 11:42:27','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:27','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:27 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001031 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:27 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000905,20,'N','N','N',5041,'N',0,'Y',3000026,'Y','The Info indicates any response information returned from the Credit Card Company.',101,'@IsOnline@=Y','LAR','Response info','Info',0,0,TO_DATE('2012-05-15 11:42:27','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:27','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:27 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000905 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:27 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000906,20,'N','N','N',59039,'N',0,'Y',3000026,'N','The ProcessedOn Date+Time save the exact moment (nanoseconds precision if allowed by the DB) when a document has been processed.','LAR','The date+time (expressed in decimal format) when the document has been processed','Processed On',0,0,TO_DATE('2012-05-15 11:42:27','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:27','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:27 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000906 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:27 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (1,'N',3000907,14,'N','N','N',5043,'N',0,'Y',3000026,'N','The Payment is a unique identifier of this payment.','LAR','Payment identifier','Payment',0,0,TO_DATE('2012-05-15 11:42:27','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:27','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:27 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000907 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:27 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000908,14,'N','N','N',5300,'N',0,'Y',3000026,'N','Electronic Fund Transfer Payment Batch.','LAR','Payment batch for EFT','Payment Batch',0,0,TO_DATE('2012-05-15 11:42:27','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:27','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:27 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000908 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000909,1,'N','N','N',3878,'N',0,'Y',3000026,'N','The Processed checkbox indicates that a document has been processed.','LAR','The document has been processed','Processed','N',0,0,TO_DATE('2012-05-15 11:42:27','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:27','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000909 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000910,14,'N','N','N',5298,'N',0,'Y',3000026,'N','The Partner Bank Account identifies the bank account to be used for this Business Partner','LAR','Bank Account of the Business Partner','Partner Bank Account',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000910 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000911,1,'N','N','N',3879,'N',0,'Y',3000026,'N','LAR','Payment is reconciled with bank statement','Reconciled','N',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000911 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000912,20,'N','N','N',8981,'N',0,'Y',3000026,'N','The Authorization Code indicates the code returned from the electronic transmission.','LAR','Authorization Code Delayed Capture returned','Authorization Code (DC)',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000912 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000913,1,'N','N','N',8979,'N',0,'Y',3000026,'N','Delayed Capture is required, if you ship products.  The first credit card transaction is the Authorization, the second is the actual transaction after the shipment of the product.','LAR','Charge after Shipment','Delayed Capture',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000913 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000914,1,'N','N','N',3864,'N',0,'Y',3000026,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000914 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000915,11,'N','N','N',8980,'N',0,'Y',3000026,'N','The Charge Amount indicates the amount for an additional charge.','LAR','Charge Amount','Charge amount',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000915 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000916,10,'N','N','N',13705,'N',0,'Y',3000026,'N','LAR','Referenced Payment','N',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000916 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000917,23,'N','N','N',3877,'N',0,'Y',3000026,'N','LAR','Process Now',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000917 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000918,14,'Y','N','N',3862,'N',10,'Y',3000026,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000918 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000919,14,'Y','Y','N',3863,'N',20,'Y',3000026,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000919 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (-1,'N',3000920,20,'Y','N','N',5401,'N',30,'Y',3000026,'N','The document number is usually automatically generated by the system and determined by the document type of the document. If the document is not saved, the preliminary number is displayed in "<>".

If the document type of your document has no automatic document sequence defined, the field is empty if you create a new document. This is for documents which usually have an external number (like vendor invoice).  If you leave the field empty, the system will generate a document number for you. The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).','LAR','Document sequence number of the document','Document No','N',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000920 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000921,14,'Y','Y','N',3880,'N',40,'Y',3000026,'N','The Bank Account identifies an account at this Bank.','@TenderType@ !''X''','LAR','Account at the Bank','Bank Account',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000921 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_Reference_ID,EntityType,AD_Val_Rule_ID,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000922,14,'Y','N','N',5302,'N',50,'Y',3000026,'N','The Document Type determines document sequence and processing rules',19,'LAR',3000002,'Document type or rules','Document Type',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000922 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000923,1,'Y','Y','N',6216,'N',60,'Y',3000026,'Y','LAR','This is a sales transaction (receipt)','Receipt',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000923 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000924,14,'Y','N','N',5399,'N',70,'Y',3000026,'N','The Transaction Date indicates the date of the transaction.','LAR','Transaction Date','Transaction Date',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000924 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000925,14,'Y','Y','N',12128,'N',80,'Y',3000026,'N','The Accounting Date indicates the date to be used on the General Ledger account entries generated from this document. It is also used for any currency conversion.','LAR','Accounting Date','Account Date',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000925 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000926,60,'Y','N','N',12127,'N',90,'Y',3000026,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000926 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:28 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000927,26,'Y','N','N',5398,'N',100,'Y',3000026,'N','A Business Partner is anyone with whom you transact.  This can include Vendor, Customer, Employee or Salesperson',104,'LAR','Identifies a Business Partner','Business Partner ',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000927 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000928,26,'Y','Y','N',5355,'N',110,'Y',3000026,'N','The Invoice Document.','LAR','Invoice Identifier','Invoice',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000928 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000929,26,'Y','N','N',12925,'N',120,'Y',3000026,'N','The Order is a control document.  The  Order is complete when the quantity ordered is the same as the quantity shipped and invoiced.  When you close an order, unshipped (backordered) quantities are cancelled.','LAR','Order','Order',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000929 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000930,14,'Y','Y','N',8554,'N',130,'Y',3000026,'N','A Project allows you to track and control internal or external activities.','@$Element_PJ@=Y & @C_Invoice_ID@=0 | @C_Invoice_ID@=''''','LAR','Financial Project','Project',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000930 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000931,14,'Y','N','N',8984,'N',140,'Y',3000026,'N','The Charge indicates a type of Charge (Handling, Shipping, Restocking)',104,'LAR','Additional document charges','Charge',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000931 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000932,1,'Y','Y','N',13045,'N',150,'Y',3000026,'Y','Payments not allocated to an invoice with a charge are posted to Unallocated Payments. When setting this flag, the payment is posted to the Customer or Vendor Prepayment account.',104,'LAR','The Payment/Receipt is a Prepayment','Prepayment',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000932 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000933,14,'Y','N','N',9566,'N',160,'Y',3000026,'N','Activities indicate tasks that are performed and used to utilize Activity based Costing','@$Element_AY@=Y','LAR','Business Activity','Activity',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000933 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000934,14,'Y','N','N',9564,'N',170,'Y',3000026,'N','The Campaign defines a unique marketing program.  Projects can be associated with a pre defined Marketing Campaign.  You can then report based on a specific Campaign.','@$Element_MC@=Y','LAR','Marketing Campaign','Campaign',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000934 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000935,14,'Y','N','N',9565,'N',180,'Y',3000026,'N','The organization which performs or initiates this transaction (for another organization).  The owning Organization may not be the transaction organization in a service bureau environment, with centralized services, and inter-organization transactions.','@$Element_OT@=Y','LAR','Performing or initiating organization','Trx Organization',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000935 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000936,14,'Y','N','N',9563,'N',190,'Y',3000026,'N','The user defined element displays the optional elements that have been defined for this account combination.','@$Element_U1@=Y','LAR','User defined list element #1','User List 1',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000936 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000937,14,'Y','Y','N',9567,'N',200,'Y',3000026,'N','The user defined element displays the optional elements that have been defined for this account combination.','@$Element_U2@=Y','LAR','User defined list element #2','User List 2',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000937 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000938,26,'Y','N','N',5303,'N',210,'Y',3000026,'N','Indicates the amount this payment is for.  The payment amount can be for single or multiple invoices or a partial payment for an invoice.',103,'LAR','Amount being paid','Payment amount',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000938 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000939,14,'Y','Y','N',5299,'N',220,'Y',3000026,'N','Indicates the Currency to be used when processing or reporting on this record','LAR','The Currency for this record','Currency',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000939 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000940,14,'Y','N','N',10265,'N',230,'Y',3000026,'N','The Currency Conversion Rate Type lets you define different type of rates, e.g. Spot, Corporate and/or Sell/Buy rates.','@C_Currency_ID@!@$C_Currency_ID@','LAR','Currency Conversion Rate Type','Currency Type',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000940 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000941,26,'Y','N','N',5301,'N',240,'Y',3000026,'N','The Discount Amount indicates the discount amount for a document or line.','@C_Invoice_ID@^''''','LAR','Calculated amount of discount','Discount Amount',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000941 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000942,26,'Y','Y','N',6475,'N',250,'Y',3000026,'N','The Write Off Amount indicates the amount to be written off as uncollectible.','@C_Invoice_ID@^''''','LAR','Amount to write-off','Write-off Amount',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000942 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000943,1,'Y','N','N',7035,'N',260,'Y',3000026,'N','Overpayments (negative) are unallocated amounts and allow you to receive money for more than the particular invoice.
Underpayments (positive) is a partial payment for the invoice. You do not write off the unpaid amount.','@C_Invoice_ID@^''''','LAR','Over-Payment (unallocated) or Under-Payment (partial payment)','Over/Under Payment',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000943 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000944,26,'Y','Y','N',7034,'N',270,'Y',3000026,'N','Overpayments (negative) are unallocated amounts and allow you to receive money for more than the particular invoice.
Underpayments (positive) is a partial payment for the invoice. You do not write off the unpaid amount.','@IsOverUnderPayment@=Y & @C_Invoice_ID@^''''','LAR','Over-Payment (unallocated) or Under-Payment (partial payment) Amount','Over/Under Payment',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000944 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000945,20,'Y','N','N',3000103,'N',280,'Y',3000026,'N','LAR','Withholding Amount',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000945 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000946,20,'Y','Y','N',3000104,'N',290,'Y',3000026,'N','LAR','WithholdingPercent',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000946 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000947,14,'Y','N','N',5046,'N',300,'Y',3000026,'N','The Tender Type indicates the method of payment (ACH or Direct Deposit, Credit Card, Check, Direct Debit)',125,'LAR','Method of Payment','Tender type',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000947 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000948,1,'Y','Y','N',5495,'N',310,'Y',3000026,'N','The Online Access check box indicates if the application can be accessed via the web. ','LAR','Can be accessed online ','Online Access',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000948 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000949,20,'Y','N','N',3873,'N',320,'Y',3000026,'N','The Bank Routing Number (ABA Number) identifies a legal Bank.  It is used in routing checks and electronic transactions.','@TenderType@=A | @TenderType@=K','LAR','Bank Routing Number','Routing No',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000949 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000950,20,'Y','Y','N',3874,'N',330,'Y',3000026,'N','The Account Number indicates the Number assigned to this bank account. ','@TenderType@=A | @TenderType@=K','LAR','Account Number','Account No',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000950 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000951,20,'Y','N','N',5049,'N',340,'Y',3000026,'N','The Check Number indicates the number on the check.','@TenderType@=K','LAR','Check Number','Check No',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000951 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000952,20,'Y','Y','N',5048,'N',350,'Y',3000026,'N','The Micr number is the combination of the bank routing number, account number and check number','@TenderType@=K','LAR','Combination of routing no, account and check no','Micr',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000952 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000953,14,'Y','N','N',3869,'N',360,'Y',3000026,'N','The Credit Card drop down list box is used for selecting the type of Credit Card presented for payment.','@TenderType@=C','LAR','Credit Card (Visa, MC, AmEx)','Credit Card',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000953 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000954,14,'Y','Y','N',5044,'N',370,'Y',3000026,'N','The Transaction Type indicates the type of transaction to be submitted to the Credit Card Company.','@TenderType@=C','LAR','Type of credit card transaction','Transaction Type',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000954 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,ObscureType,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000955,20,'Y','N','N',3870,'N',380,'Y',3000026,'N','The Credit Card number indicates the number on the credit card, without blanks or spaces.','904','@TenderType@=C','LAR','Credit Card Number ','Number',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000955 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000956,5,'Y','Y','N',5047,'N',390,'Y',3000026,'N','The Credit Card Verification indicates the verification code on the credit card (AMEX 4 digits on front; MC,Visa 3 digits back)','@TenderType@=C','LAR','Credit Card Verification code on credit card','Verification Code',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000956 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000957,11,'Y','N','N',3871,'N',400,'Y',3000026,'N','The Expiry Month indicates the expiry month for this credit card.','@TenderType@=C','LAR','Expiry Month','Exp. Month',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000957 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000958,11,'Y','Y','N',3872,'N',410,'Y',3000026,'N','The Expiry Year indicates the expiry year for this credit card.','@TenderType@=C','LAR','Expiry Year','Exp. Year',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000958 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000959,20,'Y','N','N',5050,'N',420,'Y',3000026,'N','The Name of the Credit Card or Account holder.','@TenderType@=C | @TenderType@=K','LAR','Name on Credit Card or Account holder','Account Name',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000959 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000960,20,'Y','Y','N',5051,'N',430,'Y',3000026,'N','The Street Address of the Credit Card or Account holder.','@TenderType@=C | @TenderType@=K & @IsOnline@=Y','LAR','Street address of the Credit Card or Account holder','Account Street',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000960 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000961,20,'Y','N','N',5052,'N',440,'Y',3000026,'N','The Account City indicates the City of the Credit Card or Account holder','@TenderType@=C | @TenderType@=K & @IsOnline@=Y','LAR','City or the Credit Card or Account Holder','Account City',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000961 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000962,11,'Y','Y','N',5026,'N',450,'Y',3000026,'N','The Zip Code of the Credit Card or Account Holder.','@TenderType@=C | @TenderType@=K & @IsOnline@=Y','LAR','Zip Code of the Credit Card or Account Holder','Account Zip/Postal',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000962 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000963,11,'Y','N','N',5053,'N',460,'Y',3000026,'N','The State of the Credit Card or Account holder','@TenderType@=C | @TenderType@=K & @IsOnline@=Y','LAR','State of the Credit Card or Account holder','Account State',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000963 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:30 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000964,20,'Y','Y','N',8213,'N',470,'Y',3000026,'N','Account Country Name','@TenderType@=C | @TenderType@=K & @IsOnline@=Y','LAR','Country','Account Country',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000964 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000965,20,'Y','N','N',5027,'N',480,'Y',3000026,'N','The Driver''s License being used as identification.','@TenderType@=K & @IsOnline@=Y','LAR','Payment Identification - Driver License','Driver License',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000965 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000966,20,'Y','Y','N',5028,'N',490,'Y',3000026,'N','The Social Security number being used as identification.','@TenderType@=K & @IsOnline@=Y','LAR','Payment Identification - Social Security No','Social Security No',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000966 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000967,20,'Y','N','N',5029,'N',500,'Y',3000026,'N','The EMail Address indicates the EMail address off the Credit Card or Account holder.','@TenderType@=K & @IsOnline@=Y','LAR','Email Address','Account EMail',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000967 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000968,26,'Y','N','N',5034,'N',510,'N',3000026,'N','The Tax Amount displays the total tax amount. The tax amount is only used for credit card processing.','@CreditCardType@=P & @IsOnline@=Y','LAR','Tax Amount for Credit Card transaction','Tax Amount',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000968 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000969,20,'Y','Y','N',5032,'N',520,'Y',3000026,'N','The PO Number indicates the number assigned to a purchase order','@CreditCardType@=P & @IsOnline@=Y','LAR','Purchase Order Number','PO Number',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000969 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000970,20,'Y','N','N',5030,'N',530,'Y',3000026,'N','The Voice Authorization Code indicates the code received from the Credit Card Company.','@IsOnline@=Y','LAR','Voice Authorization Code from credit card company','Voice authorization code',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000970 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000971,20,'Y','Y','N',5031,'N',540,'Y',3000026,'N','The Original Transaction ID is used for reversing transactions and indicates the transaction that has been reversed.','@IsOnline@=Y','LAR','Original Transaction ID','Original Transaction ID',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000971 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000972,23,'Y','N','N',5356,'N',550,'Y',3000026,'N','The Online Processing indicates if the payment can be processed online.','@IsOnline@=Y','LAR','This payment can be processed online','Online Processing',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000972 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000973,1,'Y','Y','N',3875,'N',560,'Y',3000026,'Y','The Approved checkbox indicates if this document requires approval before it can be processed.',101,'@IsOnline@=Y','LAR','Indicates if this document requires approval','Approved','N',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000973 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000974,20,'Y','N','N',5036,'N',570,'Y',3000026,'Y','The Response Result indicates the result of the transmission to the Credit Card Company.',101,'@IsOnline@=Y','LAR','Result of transmission','Result',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000974 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000975,20,'Y','Y','N',5037,'N',580,'Y',3000026,'Y','The Response Message indicates the message returned from the Credit Card Company as the result of a transmission',101,'@IsOnline@=Y','LAR','Response message','Response Message',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000975 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000976,20,'Y','N','N',5035,'N',590,'Y',3000026,'Y','The Payment Reference indicates the reference returned from the Credit Card Company for a payment',101,'@IsOnline@=Y','LAR','Payment reference','Reference',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000976 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000977,20,'Y','Y','N',5038,'N',600,'Y',3000026,'Y','The Authorization Code indicates the code returned from the electronic transmission.',101,'@IsOnline@=Y','LAR','Authorization Code returned','Authorization Code',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000977 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000978,14,'Y','N','N',5040,'N',610,'Y',3000026,'Y','The Zip Verified indicates if the zip code has been verified by the Credit Card Company.',101,'@IsOnline@=Y','LAR','The Zip Code has been verified','Zip verified',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000978 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000979,14,'Y','Y','N',5039,'N',620,'Y',3000026,'Y','The Address Verified indicates if the address has been verified by the Credit Card Company.',101,'@IsOnline@=Y','LAR','This address has been verified','Address verified',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:31 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000979 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:32 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000980,14,'Y','N','N',5496,'N',630,'Y',3000026,'Y','The Document Status indicates the status of a document at this time.  If you want to change the document status, use the Document Action field',101,'LAR','The current status of the document','Document Status','N',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:32 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000980 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:32 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000981,23,'Y','Y','N',5497,'N',640,'Y',3000026,'N','You find the current status in the Document Status field. The options are listed in a popup',101,'LAR','The targeted status of the document','Document Action','N',0,0,TO_DATE('2012-05-15 11:42:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:32 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000981 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:32 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000982,1,'Y','N','N',8775,'N',650,'Y',3000026,'Y','Self-Service allows users to enter data or update their data.  The flag indicates, that this record was entered or created via Self-Service or that the user can change it via the Self-Service functionality.','LAR','This is a Self-Service entry or this entry can be changed via Self-Service','Self-Service','N',0,0,TO_DATE('2012-05-15 11:42:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:32 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000982 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:32 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000983,23,'Y','Y','N',5042,'N',660,'Y',3000026,'N','The Posted field indicates the status of the Generation of General Ledger Accounting Lines ','@Processed@=Y & @#ShowAcct@=Y','LAR','Posting status','Posted','N',0,0,TO_DATE('2012-05-15 11:42:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:32 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000983 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:32 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000984,1,'Y','N','N',5400,'N',670,'Y',3000026,'Y','The Allocated checkbox indicates if a payment has been allocated or associated with an invoice or invoices.','@Processed@=Y','LAR','Indicates if the payment has been allocated','Allocated','N',0,0,TO_DATE('2012-05-15 11:42:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:32 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000984 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:32 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000985,14,'Y','Y','N',52117,'N',680,'Y',3000026,'N','The Cash Book identifies a unique cash book.  The cash book is used to record cash transactions.','@TenderType@=''X''','LAR','Cash Book for recording petty cash transactions','Cash Book',0,0,TO_DATE('2012-05-15 11:42:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:32 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000985 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:32 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,Help,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,ReadOnlyLogic,IsInsertRecord,IsAdvancedTab,EntityType,Name,Description,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('Y',1000005,15,'You can directly allocate payments to invoices with the same currency when creating the Payment.
Note that you can over- or under-allocate the payment.<b>
When processing the payment, the allocation is created.<b>
The Organization is set to the invoice organization','N','N',812,1000013,'N','N','N','N',1,'@Processed@=Y','Y','Y','LAR','Allocate to Invoices','Allocate Payments to Invoices',0,0,TO_DATE('2012-05-15 11:42:32','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2012-05-15 11:42:32','YYYY-MM-DD HH24:MI:SS'),'Y','N',0)
;

-- 15/05/2012 11:42:32 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=1000013 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000986,10,'N','N','N',14319,'N',0,'Y',1000013,'N','You can directly allocate payments to invoices when creating the Payment.
Note that you can over- or under-allocate the payment.  When processing the payment, the allocation is created.','LAR','Allocate Payment to Invoices','Allocate Payment',0,0,TO_DATE('2012-05-15 11:42:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000986 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000987,10,'Y','N','N',14320,'N',10,'Y',1000013,'Y','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000987 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000988,10,'Y','Y','N',14321,'N',20,'Y',1000013,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000988 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000989,10,'Y','N','N',14327,'N',30,'Y',1000013,'Y','The Payment is a unique identifier of this payment.','LAR','Payment identifier','Payment','N',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000989 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000990,1,'Y','N','N',14322,'N',40,'Y',1000013,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000990 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000991,10,'Y','N','N',14328,'N',50,'Y',1000013,'N','The Invoice Document.','LAR','Invoice Identifier','Invoice',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000991 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000992,22,'Y','Y','N',14334,'N',60,'Y',1000013,'Y','LAR','Invoice Amt',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000992 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000993,22,'Y','N','N',14329,'N',70,'Y',1000013,'N','The Amount indicates the amount for this document line.','LAR','Amount in a defined currency','Amount',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000993 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000994,22,'Y','Y','N',14330,'N',80,'Y',1000013,'N','The Discount Amount indicates the discount amount for a document or line.','LAR','Calculated amount of discount','Discount Amount',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000994 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000995,22,'Y','N','N',14331,'N',90,'Y',1000013,'N','The Write Off Amount indicates the amount to be written off as uncollectible.','LAR','Amount to write-off','Write-off Amount',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000995 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000996,22,'Y','Y','N',14332,'N',100,'Y',1000013,'N','Overpayments (negative) are unallocated amounts and allow you to receive money for more than the particular invoice.
Underpayments (positive) is a partial payment for the invoice. You do not write off the unpaid amount.','LAR','Over-Payment (unallocated) or Under-Payment (partial payment) Amount','Over/Under Payment',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000996 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000997,0,'Y','N','N',14335,'N',110,'Y',1000013,'Y',104,'LAR','Remaining Amount','Remaining Amt',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000997 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000998,10,'Y','Y','N',14333,'N',120,'Y',1000013,'Y','Allocation of Cash/Payment to Invoice',104,'LAR','Allocation Line','Allocation Line',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000998 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,AD_Column_ID,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,Description,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('N',1000005,20,'N','N',390,1000014,'N','N',4884,'N','Y',1,'N','N','LAR','Allocations','Display Allocation of the Payment/Receipt to Invoices',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'),'Y','N',0)
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=1000014 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000999,26,'N','N','N',5494,'N',0,'Y',1000014,'N','A Business Partner is anyone with whom you transact.  This can include Vendor, Customer, Employee or Salesperson','LAR','Identifies a Business Partner','Business Partner ',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000999 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001000,14,'N','N','N',12331,'N',0,'Y',1000014,'N','Allocation of Cash/Payment to Invoice','LAR','Allocation Line','Allocation Line',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001000 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001001,1,'N','N','N',5520,'N',0,'Y',1000014,'N','The Manual check box indicates if the process will done manually.','LAR','This is a manual process','Manual',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001001 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:33 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001002,26,'N','N','N',5210,'N',0,'Y',1000014,'N','The Cash Journal Line indicates a unique line in a cash journal.','LAR','Cash Journal Line','Cash Journal Line','N',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001002 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001003,1,'N','N','N',4877,'N',0,'Y',1000014,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001003 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001004,14,'Y','N','N',4875,'N',10,'Y',1000014,'Y','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001004 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001005,14,'Y','Y','N',4876,'N',20,'Y',1000014,'Y','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001005 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001006,26,'Y','N','N',4884,'N',30,'Y',1000014,'Y','The Payment is a unique identifier of this payment.','LAR','Payment identifier','Payment','N',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001006 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001007,14,'Y','N','N',4874,'N',40,'Y',1000014,'Y','LAR','Payment allocation','Allocation',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001007 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (1,'N',3001008,14,'Y','Y','N',5519,'N',50,'Y',1000014,'Y','The Transaction Date indicates the date of the transaction.','LAR','Transaction Date','Transaction Date',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001008 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001009,26,'Y','N','N',4882,'N',60,'Y',1000014,'Y','The Invoice Document.','LAR','Invoice Identifier','Invoice',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001009 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001010,26,'Y','Y','N',4883,'N',70,'Y',1000014,'Y','The Order is a control document.  The  Order is complete when the quantity ordered is the same as the quantity shipped and invoiced.  When you close an order, unshipped (backordered) quantities are cancelled.','LAR','Order','Order',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001010 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001011,26,'Y','N','N',4885,'N',80,'Y',1000014,'Y','The Amount indicates the amount for this document line.','LAR','Amount in a defined currency','Amount',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001011 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001012,26,'Y','N','N',4886,'N',100,'Y',1000014,'Y','The Discount Amount indicates the discount amount for a document or line.','LAR','Calculated amount of discount','Discount Amount',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001012 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001013,26,'Y','Y','N',4887,'N',110,'Y',1000014,'Y','The Write Off Amount indicates the amount to be written off as uncollectible.','LAR','Amount to write-off','Write-off Amount',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001013 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001014,26,'Y','N','N',10762,'N',120,'Y',1000014,'Y','Overpayments (negative) are unallocated amounts and allow you to receive money for more than the particular invoice.
Underpayments (positive) is a partial payment for the invoice. You do not write off the unpaid amount.','LAR','Over-Payment (unallocated) or Under-Payment (partial payment) Amount','Over/Under Payment',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001014 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,HasTree,AD_Column_ID,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('N',1000005,30,'N','N',1000007,1000015,'N',1000115,'N','N',2,'Y','N','LAR','Withholding',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'),'Y','N',0)
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=1000015 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3001015,1,'N','N','N',1000123,'N',0,'Y',1000015,'N','The Tax Included checkbox indicates if the prices include tax.  This is also known as the gross price.','LAR','Tax is included in the price ','Price includes Tax',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001015 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3001016,10,'N','N','N',1000124,'N',0,'Y',1000015,'N','LAR','Invoice Withholding',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001016 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3001017,20,'Y','N','N',1000113,'N',10,'Y',1000015,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001017 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3001018,20,'Y','Y','N',1000132,'N',20,'Y',1000015,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001018 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3001019,20,'Y','N','N',1000115,'N',30,'Y',1000015,'N','The Invoice Document.','LAR','Invoice Identifier','Invoice',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001019 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3001020,20,'Y','N','N',1000126,'N',40,'Y',1000015,'N','LAR','Withholding Type',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001020 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:35 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3001021,10,'Y','Y','N',1000116,'N',50,'Y',1000015,'N','The Tax indicates the type of tax used in document line.','LAR','Tax identifier','Tax',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:35 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001021 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:35 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3001022,22,'Y','N','N',1000130,'N',60,'Y',1000015,'N','The Tax Base Amount indicates the base amount used for calculating the tax amount.','LAR','Base for calculating the tax amount','Tax base Amount',0,0,TO_DATE('2012-05-15 11:42:35','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:35','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:35 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001022 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:35 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3001023,20,'Y','Y','N',1000127,'N',70,'Y',1000015,'N','The Percent indicates the percentage used.','LAR','Percentage','Percent',0,0,TO_DATE('2012-05-15 11:42:35','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:35','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:35 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001023 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:35 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3001024,20,'Y','N','N',1000129,'N',80,'Y',1000015,'N','The Tax Amount displays the total tax amount for a document.','LAR','Tax Amount for a document','Tax Amount',0,0,TO_DATE('2012-05-15 11:42:35','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:35','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:35 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001024 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:35 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3001025,7,'Y','N','N',1000120,'N',90,'Y',1000015,'Y','The Transaction Date indicates the date of the transaction.','LAR','Transaction Date','Transaction Date',0,0,TO_DATE('2012-05-15 11:42:35','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:35','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:35 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001025 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:35 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3001026,7,'Y','Y','N',1000119,'N',100,'Y',1000015,'Y','The Accounting Date indicates the date to be used on the General Ledger account entries generated from this document. It is also used for any currency conversion.','LAR','Accounting Date','Account Date',0,0,TO_DATE('2012-05-15 11:42:35','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:35','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:35 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001026 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:35 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3001027,10,'Y','N','N',1000125,'N',110,'Y',1000015,'Y','LAR','Withholding Rule',0,0,TO_DATE('2012-05-15 11:42:35','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:35','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:35 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001027 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:35 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3001028,1,'Y','Y','N',1000122,'N',120,'Y',1000015,'Y','LAR','Is Calc On Payment',0,0,TO_DATE('2012-05-15 11:42:35','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:35','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:35 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001028 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:35 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3001029,1,'Y','N','N',1000128,'N',130,'Y',1000015,'Y','The Processed checkbox indicates that a document has been processed.','LAR','The document has been processed','Processed',0,0,TO_DATE('2012-05-15 11:42:35','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:35','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:35 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001029 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:42:35 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',3001030,1,'Y','Y','N',1000121,'N',140,'Y',1000015,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',0,0,TO_DATE('2012-05-15 11:42:35','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-15 11:42:35','YYYY-MM-DD HH24:MI:SS'))
;

-- 15/05/2012 11:42:35 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001030 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/05/2012 11:44:08 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_Tab SET Help='Enter Receipt for a Business Partner.  If it is for a single invoice it can be allocated directly to that invoice using this screen. You can also apply over/under payments:<br>
You have an over-payment, if you received more money than due for a single invoice. Instead of writing the difference off (i.e. would be a gain), you can leave the amount unallocated and use it for later invoices or credit memos. Please note that the Amount is the payment amount, so you need to enter the over-payment as a negative amount.<br>
You can also receive a partial payment (under-payment). If you decide not to write off the remaining invoice amount, enter the under-payment as a positive amount.<br>
Note that printed payments are archived in Payment Selection (Prepared Payment).
<br>For Posting, the bank account organization is used, if it is not a charge.', WhereClause='(C_Payment.C_BPartner_ID IS NOT NULL) AND (C_Payment.IsReceipt=''Y'')', Name='Receipt -> Invoices', Description='A Receipt can be allocated to several Invoices',Updated=TO_DATE('2012-05-15 11:44:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Tab_ID=3000026
;

-- 15/05/2012 11:44:08 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_Tab_Trl SET IsTranslated='N' WHERE AD_Tab_ID=3000026
;

-- 15/05/2012 11:44:53 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_Field SET AD_Val_Rule_ID=3000001,Updated=TO_DATE('2012-05-15 11:44:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000922
;

-- 15/05/2012 11:45:24 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_Menu SET IsSOTrx='N', Name='Payment -> Invoices',Updated=TO_DATE('2012-05-15 11:45:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Menu_ID=235
;

--Modificación en Menú de Nombre y Ubicación Cobros/Pagos (ex Payments)
-- 15/05/2012 11:45:24 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_Menu_Trl SET IsTranslated='N' WHERE AD_Menu_ID=235
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=0, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000015
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=1, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000013
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=2, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000014
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=3, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=235
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=4, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=241
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=5, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=288
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=6, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=235
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=7, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=432
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=8, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=243
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=9, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=413
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=10, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=538
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=11, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=462
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=12, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=505
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=13, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=511
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=14, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=245
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=15, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=251
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=16, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=246
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=17, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=509
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=18, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=510
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=19, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=496
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=20, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=497
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=21, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=304
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=22, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=255
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=23, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=286
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=24, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=287
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=25, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=438
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=26, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=234
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=27, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=244
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=28, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53313
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=29, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53314
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=30, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53190
;

-- 15/05/2012 11:45:29 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=31, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53187
;

--Entrada de Menú para Receipt -> Invoices
-- 15/05/2012 11:45:59 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Menu (AD_Window_ID,AD_Menu_ID,IsSummary,Action,IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Description,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (1000005,3000028,'N','W','Y','N','LAR','Y','Receipt -> Invoices','Process Payments (Allocated to several Invoices)',TO_DATE('2012-05-15 11:45:59','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,0,TO_DATE('2012-05-15 11:45:59','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 15/05/2012 11:45:59 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000028 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 15/05/2012 11:45:59 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', SysDate, 0, SysDate, 0,t.AD_Tree_ID, 3000028, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000028)
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=0, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000015
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=1, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000013
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=2, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000028
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=3, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000014
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=4, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=235
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=5, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=241
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=6, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=288
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=7, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=432
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=8, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=243
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=9, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=413
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=10, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=538
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=11, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=462
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=12, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=505
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=13, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=511
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=14, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=245
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=15, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=251
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=16, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=246
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=17, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=509
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=18, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=510
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=19, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=496
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=20, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=497
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=21, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=304
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=22, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=255
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=23, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=286
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=24, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=287
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=25, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=438
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=26, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=234
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=27, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=244
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=28, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53313
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=29, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53314
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=30, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53190
;

-- 15/05/2012 11:46:06 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=31, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53187
;

