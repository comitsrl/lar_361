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

-- 14/05/2012 9:53:27 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Menu (AD_Window_ID,AD_Menu_ID,IsSummary,Action,IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Description,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000012,3000018,'N','W','Y','N','LAR','Y','Receipt -> Invoices','Process Receipts (Allocated to several Invoices)',TO_DATE('2012-05-14 09:53:26','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,0,TO_DATE('2012-05-14 09:53:26','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 14/05/2012 9:53:27 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000018 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 14/05/2012 9:53:27 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', SysDate, 0, SysDate, 0,t.AD_Tree_ID, 3000018, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000018)
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=0, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000015
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=1, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000013
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=2, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000018
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=3, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000014
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=4, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=235
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=5, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=241
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=6, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=288
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=7, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=432
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=8, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=243
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=9, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=413
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=10, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=538
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=11, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=462
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=12, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=505
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=13, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=511
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=14, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=245
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=15, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=251
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=16, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=246
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=17, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=509
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=18, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=510
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=19, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=496
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=20, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=497
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=21, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=304
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=22, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=255
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=23, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=286
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=24, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=287
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=25, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=438
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=26, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=234
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=27, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=244
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=28, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53313
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=29, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53314
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=30, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53190
;

-- 14/05/2012 9:53:34 ART
-- Add Receipt -> Invocies and Payment -> Invoices Windows
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=31, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=53187
;

