-- 30/08/2018 15:38:37 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Window (AD_Window_ID,WindowType,Help,IsSOTrx,IsDefault,IsBetaFunctionality,AD_Image_ID,EntityType,Name,Description,IsActive,Created,UpdatedBy,CreatedBy,Updated,AD_Org_ID,AD_Client_ID,Processing) VALUES (3000089,'T',NULL,'Y','N','N',106,'LAR','Cobros/Pagos','Cobros/Pagos','Y',TO_TIMESTAMP('2018-08-30 15:38:34','YYYY-MM-DD HH24:MI:SS'),100,100,TO_TIMESTAMP('2018-08-30 15:38:34','YYYY-MM-DD HH24:MI:SS'),0,0,'N')
;

-- 30/08/2018 15:38:37 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Window_Trl (AD_Language,AD_Window_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Window_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Window t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Window_ID=3000089 AND NOT EXISTS (SELECT * FROM AD_Window_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Window_ID=t.AD_Window_ID)
;

-- 30/08/2018 15:39:02 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,Help,IsTranslationTab,AD_Process_ID,IsSortTab,AD_Table_ID,AD_Tab_ID,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,Description,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('Y',3000089,10,'Enter Receipt for a Business Partner.  If it is for a single invoice it can be allocated directly to that invoice using this screen. You can also apply over/under payments:<br>
You have an over-payment, if you received more money than due for a single invoice. Instead of writing the difference off (i.e. would be a gain), you can leave the amount unallocated and use it for later invoices or credit memos. Please note that the Amount is the payment amount, so you need to enter the over-payment as a negative amount.<br>
You can also receive a partial payment (under-payment). If you decide not to write off the remaining invoice amount, enter the under-payment as a positive amount.<br>
Note that printed payments are archived in Payment Selection (Prepared Payment).
<br>For Posting, the bank account organization is used, if it is not a charge.','N',313,'N',335,3000200,'N','N','N',0,'Y','N','LAR','Receipt -> Invoices','A Receipt can be allocated to several Invoices',0,0,TO_TIMESTAMP('2018-08-30 15:39:02','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2018-08-30 15:39:02','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 30/08/2018 15:39:02 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000200 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 30/08/2018 15:39:03 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005581,20,'N','Y','N',3000104,'N',0,'Y',3000200,'N','LAR','WithholdingPercent',100,0,TO_TIMESTAMP('2018-08-30 15:39:02','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:02','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:03 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005581 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:03 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005582,11,'N','N','N',8980,'N',0,'Y',3000200,'N','The Charge Amount indicates the amount for an additional charge.','LAR','Charge Amount','Charge amount',100,0,TO_TIMESTAMP('2018-08-30 15:39:03','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:03','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:03 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005582 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:03 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005583,10,'N','N','N',13705,'N',0,'Y',3000200,'N','LAR','Referenced Payment','N',100,0,TO_TIMESTAMP('2018-08-30 15:39:03','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:03','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:03 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005583 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:03 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005584,1,'N','N','N',3878,'N',0,'Y',3000200,'N','The Processed checkbox indicates that a document has been processed.','LAR','The document has been processed','Processed','N',100,0,TO_TIMESTAMP('2018-08-30 15:39:03','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:03','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:03 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005584 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:04 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005585,1,'N','N','N',8982,'N',0,'Y',3000200,'N','The Credit Card Verification Code was matched','LAR','Credit Card Verification Code Match','CVV Match',100,0,TO_TIMESTAMP('2018-08-30 15:39:03','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:03','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:04 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005585 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:04 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005586,60,'N','N','N',8985,'N',0,'Y',3000200,'Y','Swiped information for Credit Card Presence Transactions','LAR','Track 1 and 2 of the Credit Card','Swipe',100,0,TO_TIMESTAMP('2018-08-30 15:39:04','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:04','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:04 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005586 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:04 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005587,20,'N','N','N',8983,'N',0,'Y',3000200,'N','The Payment Reference indicates the reference returned from the Credit Card Company for a payment','LAR','Payment Reference Delayed Capture','Reference (DC)',100,0,TO_TIMESTAMP('2018-08-30 15:39:04','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:04','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:04 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005587 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:04 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005588,22,'N','N','N',55309,'N',0,'Y',3000200,'N','LAR','ID of document reversal','Reversal ID',100,0,TO_TIMESTAMP('2018-08-30 15:39:04','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:04','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:04 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005588 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:04 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005589,20,'N','N','N',5041,'N',0,'Y',3000200,'Y','The Info indicates any response information returned from the Credit Card Company.',101,'@IsOnline@=Y','LAR','Response info','Info',100,0,TO_TIMESTAMP('2018-08-30 15:39:04','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:04','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:04 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005589 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:05 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005590,20,'N','N','N',59039,'N',0,'Y',3000200,'N','The ProcessedOn Date+Time save the exact moment (nanoseconds precision if allowed by the DB) when a document has been processed.','LAR','The date+time (expressed in decimal format) when the document has been processed','Processed On',100,0,TO_TIMESTAMP('2018-08-30 15:39:04','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:04','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:05 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005590 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:05 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES (1,'N',3005591,14,'N','N','N',5043,'N',0,'Y',3000200,'N','The Payment is a unique identifier of this payment.','LAR','Payment identifier','Payment',100,0,TO_TIMESTAMP('2018-08-30 15:39:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:05 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005591 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:05 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005592,14,'N','N','N',5298,'N',0,'Y',3000200,'N','The Partner Bank Account identifies the bank account to be used for this Business Partner','LAR','Bank Account of the Business Partner','Partner Bank Account',100,0,TO_TIMESTAMP('2018-08-30 15:39:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:05 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005592 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:05 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005593,1,'N','N','N',3879,'N',0,'Y',3000200,'N','LAR','Payment is reconciled with bank statement','Reconciled','N',100,0,TO_TIMESTAMP('2018-08-30 15:39:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:05 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005593 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:06 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005594,20,'N','N','N',8981,'N',0,'Y',3000200,'N','The Authorization Code indicates the code returned from the electronic transmission.','LAR','Authorization Code Delayed Capture returned','Authorization Code (DC)',100,0,TO_TIMESTAMP('2018-08-30 15:39:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:06 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005594 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:06 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005595,1,'N','N','N',8979,'N',0,'Y',3000200,'N','Delayed Capture is required, if you ship products.  The first credit card transaction is the Authorization, the second is the actual transaction after the shipment of the product.','LAR','Charge after Shipment','Delayed Capture',100,0,TO_TIMESTAMP('2018-08-30 15:39:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:06 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005595 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:06 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005596,14,'N','Y','N',5044,'N',0,'Y',3000200,'N','The Transaction Type indicates the type of transaction to be submitted to the Credit Card Company.','@TenderType@=C','LAR','Type of credit card transaction','Transaction Type',100,0,TO_TIMESTAMP('2018-08-30 15:39:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:06 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005596 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:06 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005597,14,'N','N','N',3869,'N',0,'Y',3000200,'N','The Credit Card drop down list box is used for selecting the type of Credit Card presented for payment.','@TenderType@=C','LAR','Credit Card (Visa, MC, AmEx)','Credit Card',100,0,TO_TIMESTAMP('2018-08-30 15:39:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:06 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005597 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:06 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005598,14,'N','N','N',5300,'N',0,'Y',3000200,'N','Electronic Fund Transfer Payment Batch.','LAR','Payment batch for EFT','Payment Batch',100,0,TO_TIMESTAMP('2018-08-30 15:39:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:06 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005598 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:07 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005599,1,'N','N','N',3864,'N',0,'Y',3000200,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,TO_TIMESTAMP('2018-08-30 15:39:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:07 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005599 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:08 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005600,20,'N','N','N',3000103,'N',0,'Y',3000200,'N','LAR','Withholding Amount',100,0,TO_TIMESTAMP('2018-08-30 15:39:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:08 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005600 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:08 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005601,23,'N','N','N',3877,'N',0,'Y',3000200,'N','LAR','Process Now',100,0,TO_TIMESTAMP('2018-08-30 15:39:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:08 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005601 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:08 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005602,14,'Y','N','N',3862,'N',10,'Y',3000200,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,TO_TIMESTAMP('2018-08-30 15:39:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:08 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005602 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:09 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,DefaultValue,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005603,14,'Y','Y','N',3863,'N',20,'Y',3000200,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','@#AD_Org_ID@','Organizational entity within client','Organization',100,0,TO_TIMESTAMP('2018-08-30 15:39:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:09 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005603 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:09 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES (-1,'N',3005604,20,'Y','N','N',5401,'N',30,'Y',3000200,'N','The document number is usually automatically generated by the system and determined by the document type of the document. If the document is not saved, the preliminary number is displayed in "<>".

If the document type of your document has no automatic document sequence defined, the field is empty if you create a new document. This is for documents which usually have an external number (like vendor invoice).  If you leave the field empty, the system will generate a document number for you. The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).','LAR','Document sequence number of the document','Document No','N',100,0,TO_TIMESTAMP('2018-08-30 15:39:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:09 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005604 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:09 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005605,14,'Y','Y','N',3880,'N',40,'N',3000200,'N','The Bank Account identifies an account at this Bank.','LAR','Account at the Bank','Bank Account',100,0,TO_TIMESTAMP('2018-08-30 15:39:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:09 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005605 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:09 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_Reference_ID,EntityType,AD_Val_Rule_ID,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005606,14,'Y','N','N',5302,'N',50,'Y',3000200,'N','The Document Type determines document sequence and processing rules',19,'LAR',3000001,'Document type or rules','Document Type',100,0,TO_TIMESTAMP('2018-08-30 15:39:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:09 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005606 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:09 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005607,1,'Y','Y','N',6216,'N',60,'Y',3000200,'Y','LAR','This is a sales transaction (receipt)','Receipt',100,0,TO_TIMESTAMP('2018-08-30 15:39:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:09 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005607 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:10 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005608,14,'Y','N','N',5399,'N',70,'Y',3000200,'N','The Transaction Date indicates the date of the transaction.','LAR','Transaction Date','Transaction Date',100,0,TO_TIMESTAMP('2018-08-30 15:39:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:10 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005608 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:10 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005609,14,'Y','Y','N',12128,'N',80,'Y',3000200,'N','The Accounting Date indicates the date to be used on the General Ledger account entries generated from this document. It is also used for any currency conversion.','LAR','Accounting Date','Account Date',100,0,TO_TIMESTAMP('2018-08-30 15:39:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:10 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005609 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:10 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005610,60,'Y','N','N',12127,'N',90,'Y',3000200,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,TO_TIMESTAMP('2018-08-30 15:39:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:10 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005610 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:10 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005611,26,'Y','N','N',5398,'N',100,'Y',3000200,'N','A Business Partner is anyone with whom you transact.  This can include Vendor, Customer, Employee or Salesperson',104,'LAR','Identifies a Business Partner','Business Partner ',100,0,TO_TIMESTAMP('2018-08-30 15:39:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:10 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005611 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:10 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005612,26,'Y','Y','N',5355,'N',110,'Y',3000200,'N','The Invoice Document.','LAR','Invoice Identifier','Invoice',100,0,TO_TIMESTAMP('2018-08-30 15:39:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:10 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005612 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:11 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005613,26,'Y','N','N',12925,'N',120,'Y',3000200,'N','The Order is a control document.  The  Order is complete when the quantity ordered is the same as the quantity shipped and invoiced.  When you close an order, unshipped (backordered) quantities are cancelled.','LAR','Order','Order',100,0,TO_TIMESTAMP('2018-08-30 15:39:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:11 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005613 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:11 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005614,14,'Y','Y','N',8554,'N',130,'Y',3000200,'N','A Project allows you to track and control internal or external activities.','@$Element_PJ@=Y & @C_Invoice_ID@=0 | @C_Invoice_ID@=''''','LAR','Financial Project','Project',100,0,TO_TIMESTAMP('2018-08-30 15:39:11','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:11 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005614 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:11 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005615,14,'Y','N','N',8984,'N',140,'Y',3000200,'N','The Charge indicates a type of Charge (Handling, Shipping, Restocking)',104,'LAR','Additional document charges','Charge',100,0,TO_TIMESTAMP('2018-08-30 15:39:11','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:11 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005615 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:11 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005616,1,'Y','Y','N',13045,'N',150,'Y',3000200,'Y','Payments not allocated to an invoice with a charge are posted to Unallocated Payments. When setting this flag, the payment is posted to the Customer or Vendor Prepayment account.',104,'LAR','The Payment/Receipt is a Prepayment','Prepayment',100,0,TO_TIMESTAMP('2018-08-30 15:39:11','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:11 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005616 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:11 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005617,14,'Y','N','N',9566,'N',160,'Y',3000200,'N','Activities indicate tasks that are performed and used to utilize Activity based Costing','@$Element_AY@=Y','LAR','Business Activity','Activity',100,0,TO_TIMESTAMP('2018-08-30 15:39:11','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:11 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005617 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:12 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005618,14,'Y','N','N',9564,'N',170,'Y',3000200,'N','The Campaign defines a unique marketing program.  Projects can be associated with a pre defined Marketing Campaign.  You can then report based on a specific Campaign.','@$Element_MC@=Y','LAR','Marketing Campaign','Campaign',100,0,TO_TIMESTAMP('2018-08-30 15:39:11','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:12 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005618 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:12 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005619,14,'Y','N','N',9565,'N',180,'Y',3000200,'N','The organization which performs or initiates this transaction (for another organization).  The owning Organization may not be the transaction organization in a service bureau environment, with centralized services, and inter-organization transactions.','@$Element_OT@=Y','LAR','Performing or initiating organization','Trx Organization',100,0,TO_TIMESTAMP('2018-08-30 15:39:12','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:12 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005619 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:12 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005620,14,'Y','N','N',9563,'N',190,'Y',3000200,'N','The user defined element displays the optional elements that have been defined for this account combination.','@$Element_U1@=Y','LAR','User defined list element #1','User List 1',100,0,TO_TIMESTAMP('2018-08-30 15:39:12','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:12 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005620 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:12 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005621,14,'Y','Y','N',9567,'N',200,'Y',3000200,'N','The user defined element displays the optional elements that have been defined for this account combination.','@$Element_U2@=Y','LAR','User defined list element #2','User List 2',100,0,TO_TIMESTAMP('2018-08-30 15:39:12','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:12 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005621 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:12 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005622,26,'Y','N','N',5303,'N',210,'Y',3000200,'N','Indicates the amount this payment is for.  The payment amount can be for single or multiple invoices or a partial payment for an invoice.',103,'LAR','Amount being paid','Payment amount',100,0,TO_TIMESTAMP('2018-08-30 15:39:12','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:12 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005622 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:13 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005623,14,'Y','Y','N',5299,'N',220,'Y',3000200,'N','Indicates the Currency to be used when processing or reporting on this record','LAR','The Currency for this record','Currency',100,0,TO_TIMESTAMP('2018-08-30 15:39:12','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:13 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005623 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:13 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005624,14,'Y','N','N',10265,'N',230,'Y',3000200,'N','The Currency Conversion Rate Type lets you define different type of rates, e.g. Spot, Corporate and/or Sell/Buy rates.','@C_Currency_ID@!@$C_Currency_ID@','LAR','Currency Conversion Rate Type','Currency Type',100,0,TO_TIMESTAMP('2018-08-30 15:39:13','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:13 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005624 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:13 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005625,26,'Y','N','N',5301,'N',240,'Y',3000200,'N','The Discount Amount indicates the discount amount for a document or line.','@C_Invoice_ID@^''''','LAR','Calculated amount of discount','Discount Amount',100,0,TO_TIMESTAMP('2018-08-30 15:39:13','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:13 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005625 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:13 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005626,26,'Y','Y','N',6475,'N',250,'Y',3000200,'N','The Write Off Amount indicates the amount to be written off as uncollectible.','@C_Invoice_ID@^''''','LAR','Amount to write-off','Write-off Amount',100,0,TO_TIMESTAMP('2018-08-30 15:39:13','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:13 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005626 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:13 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES (0,'N',3005627,0,'Y','N','N',3000816,'N',260,'Y',3000200,'N','@C_Invoice_ID@^'''' & @WriteOffAmt@!0','LAR','C_TaxWithholding_ID',100,0,TO_TIMESTAMP('2018-08-30 15:39:13','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:13 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005627 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:14 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES (0,'N',3005628,0,'Y','Y','N',3000820,'N',270,'Y',3000200,'N','@C_Invoice_ID@^'''' & @WriteOffAmt@!0','LAR','WithholdingCertNo',100,0,TO_TIMESTAMP('2018-08-30 15:39:13','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:14 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005628 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:14 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005629,1,'Y','N','N',7035,'N',280,'Y',3000200,'N','Overpayments (negative) are unallocated amounts and allow you to receive money for more than the particular invoice. 
Underpayments (positive) is a partial payment for the invoice. You do not write off the unpaid amount.','@C_Invoice_ID@^''''','LAR','Over-Payment (unallocated) or Under-Payment (partial payment)','Over/Under Payment',100,0,TO_TIMESTAMP('2018-08-30 15:39:14','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:14 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005629 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:14 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005630,26,'Y','Y','N',7034,'N',290,'Y',3000200,'N','Overpayments (negative) are unallocated amounts and allow you to receive money for more than the particular invoice. 
Underpayments (positive) is a partial payment for the invoice. You do not write off the unpaid amount.','@IsOverUnderPayment@=Y & @C_Invoice_ID@^''''','LAR','Over-Payment (unallocated) or Under-Payment (partial payment) Amount','Over/Under Payment',100,0,TO_TIMESTAMP('2018-08-30 15:39:14','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:14 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005630 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:14 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005631,14,'Y','N','N',5046,'N',300,'Y',3000200,'N','The Tender Type indicates the method of payment (ACH or Direct Deposit, Credit Card, Check, Direct Debit)',125,'LAR','Method of Payment','Tender type',100,0,TO_TIMESTAMP('2018-08-30 15:39:14','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:14 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005631 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:14 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005632,1,'Y','Y','N',5495,'N',310,'Y',3000200,'N','The Online Access check box indicates if the application can be accessed via the web. ','LAR','Can be accessed online ','Online Access',100,0,TO_TIMESTAMP('2018-08-30 15:39:14','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:14 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005632 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:15 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005633,20,'Y','N','N',3873,'N',320,'Y',3000200,'N','The Bank Routing Number (ABA Number) identifies a legal Bank.  It is used in routing checks and electronic transactions.','@TenderType@=K | @TenderType@=Z','LAR','Bank Routing Number','Routing No',100,0,TO_TIMESTAMP('2018-08-30 15:39:14','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:15 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005633 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:15 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005634,20,'Y','Y','N',3874,'N',330,'Y',3000200,'N','The Account Number indicates the Number assigned to this bank account. ','@TenderType@=K | @TenderType@=Z','LAR','Account Number','Account No',100,0,TO_TIMESTAMP('2018-08-30 15:39:15','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:15 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005634 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:15 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005635,20,'Y','N','N',5049,'N',340,'Y',3000200,'N','The Check Number indicates the number on the check.','@TenderType@=K | @TenderType@=Z','LAR','Check Number','Check No',100,0,TO_TIMESTAMP('2018-08-30 15:39:15','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:15 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005635 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:15 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005636,20,'Y','Y','N',5048,'N',350,'Y',3000200,'N','The Micr number is the combination of the bank routing number, account number and check number','@TenderType@=K | @TenderType@=Z','LAR','Combination of routing no, account and check no','Micr',100,0,TO_TIMESTAMP('2018-08-30 15:39:15','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:15 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005636 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,ObscureType,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005637,20,'Y','N','N',3870,'N',390,'Y',3000200,'N','The Credit Card number indicates the number on the credit card, without blanks or spaces.','904','@TenderType@=C | @TenderType@=D','LAR','Credit Card Number ','Number',100,0,TO_TIMESTAMP('2018-08-30 15:39:15','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005637 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005638,5,'Y','Y','N',5047,'N',400,'Y',3000200,'N','The Credit Card Verification indicates the verification code on the credit card (AMEX 4 digits on front; MC,Visa 3 digits back)','@TenderType@=C','LAR','Credit Card Verification code on credit card','Verification Code',100,0,TO_TIMESTAMP('2018-08-30 15:39:16','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005638 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005639,11,'Y','N','N',3871,'N',410,'Y',3000200,'N','The Expiry Month indicates the expiry month for this credit card.','@TenderType@=C','LAR','Expiry Month','Exp. Month',100,0,TO_TIMESTAMP('2018-08-30 15:39:16','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005639 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005640,11,'Y','Y','N',3872,'N',420,'Y',3000200,'N','The Expiry Year indicates the expiry year for this credit card.','@TenderType@=C','LAR','Expiry Year','Exp. Year',100,0,TO_TIMESTAMP('2018-08-30 15:39:16','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005640 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005641,20,'Y','N','N',5050,'N',430,'Y',3000200,'N','The Name of the Credit Card or Account holder.','@TenderType@=C | @TenderType@=K | @TenderType@=Z','LAR','Name on Credit Card or Account holder','Account Name',100,0,TO_TIMESTAMP('2018-08-30 15:39:16','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005641 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:17 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005642,20,'Y','Y','N',5051,'N',440,'Y',3000200,'N','The Street Address of the Credit Card or Account holder.','@TenderType@=C | @TenderType@=K | @TenderType@=Z & @IsOnline@=Y','LAR','Street address of the Credit Card or Account holder','Account Street',100,0,TO_TIMESTAMP('2018-08-30 15:39:16','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:17 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005642 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:17 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005643,20,'Y','N','N',5052,'N',450,'Y',3000200,'N','The Account City indicates the City of the Credit Card or Account holder','@TenderType@=C | @TenderType@=K | @TenderType@=Z & @IsOnline@=Y','LAR','City or the Credit Card or Account Holder','Account City',100,0,TO_TIMESTAMP('2018-08-30 15:39:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:17','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:17 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005643 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:17 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005644,11,'Y','Y','N',5026,'N',460,'Y',3000200,'N','The Zip Code of the Credit Card or Account Holder.','@TenderType@=C | @TenderType@=K | @TenderType@=Z & @IsOnline@=Y','LAR','Zip Code of the Credit Card or Account Holder','Account Zip/Postal',100,0,TO_TIMESTAMP('2018-08-30 15:39:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:17','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:17 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005644 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:17 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005645,11,'Y','N','N',5053,'N',470,'Y',3000200,'N','The State of the Credit Card or Account holder','@TenderType@=C | @TenderType@=K | @TenderType@=Z & @IsOnline@=Y','LAR','State of the Credit Card or Account holder','Account State',100,0,TO_TIMESTAMP('2018-08-30 15:39:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:17','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:17 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005645 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:17 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005646,20,'Y','Y','N',8213,'N',480,'Y',3000200,'N','Account Country Name','@TenderType@=C | @TenderType@=K | @TenderType@=Z & @IsOnline@=Y','LAR','Country','Account Country',100,0,TO_TIMESTAMP('2018-08-30 15:39:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:17','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:17 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005646 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:18 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005647,20,'Y','N','N',5027,'N',490,'Y',3000200,'N','The Driver''s License being used as identification.','@TenderType@=K | @TenderType@=Z & @IsOnline@=Y','LAR','Payment Identification - Driver License','Driver License',100,0,TO_TIMESTAMP('2018-08-30 15:39:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:17','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:18 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005647 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:18 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005648,20,'Y','Y','N',5028,'N',500,'Y',3000200,'N','The Social Security number being used as identification.','@TenderType@=K | @TenderType@=Z & @IsOnline@=Y','LAR','Payment Identification - Social Security No','Social Security No',100,0,TO_TIMESTAMP('2018-08-30 15:39:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:18 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005648 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:18 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005649,20,'Y','N','N',5029,'N',510,'Y',3000200,'N','The EMail Address indicates the EMail address off the Credit Card or Account holder.','@TenderType@=K | @TenderType@=Z & @IsOnline@=Y','LAR','Email Address','Account EMail',100,0,TO_TIMESTAMP('2018-08-30 15:39:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:18 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005649 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:18 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005650,26,'Y','N','N',5034,'N',520,'N',3000200,'N','The Tax Amount displays the total tax amount. The tax amount is only used for credit card processing.','@CreditCardType@=P & @IsOnline@=Y','LAR','Tax Amount for Credit Card transaction','Tax Amount',100,0,TO_TIMESTAMP('2018-08-30 15:39:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:18 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005650 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:18 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005651,20,'Y','Y','N',5032,'N',530,'Y',3000200,'N','The PO Number indicates the number assigned to a purchase order','@CreditCardType@=P & @IsOnline@=Y','LAR','Purchase Order Number','PO Number',100,0,TO_TIMESTAMP('2018-08-30 15:39:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:18 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005651 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:19 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005652,20,'Y','N','N',5030,'N',540,'Y',3000200,'N','The Voice Authorization Code indicates the code received from the Credit Card Company.','@IsOnline@=Y','LAR','Voice Authorization Code from credit card company','Voice authorization code',100,0,TO_TIMESTAMP('2018-08-30 15:39:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:19 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005652 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:19 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005653,20,'Y','Y','N',5031,'N',550,'Y',3000200,'N','The Original Transaction ID is used for reversing transactions and indicates the transaction that has been reversed.','@IsOnline@=Y','LAR','Original Transaction ID','Original Transaction ID',100,0,TO_TIMESTAMP('2018-08-30 15:39:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:19','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:19 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005653 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:19 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005654,23,'Y','N','N',5356,'N',560,'Y',3000200,'N','The Online Processing indicates if the payment can be processed online.','@IsOnline@=Y','LAR','This payment can be processed online','Online Processing',100,0,TO_TIMESTAMP('2018-08-30 15:39:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:19','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:19 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005654 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:19 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005655,1,'Y','Y','N',3875,'N',570,'Y',3000200,'Y','The Approved checkbox indicates if this document requires approval before it can be processed.',101,'@IsOnline@=Y','LAR','Indicates if this document requires approval','Approved','N',100,0,TO_TIMESTAMP('2018-08-30 15:39:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:19','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:19 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005655 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:19 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005656,20,'Y','N','N',5036,'N',580,'Y',3000200,'Y','The Response Result indicates the result of the transmission to the Credit Card Company.',101,'@IsOnline@=Y','LAR','Result of transmission','Result',100,0,TO_TIMESTAMP('2018-08-30 15:39:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:19','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:19 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005656 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:20 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005657,20,'Y','Y','N',5037,'N',590,'Y',3000200,'Y','The Response Message indicates the message returned from the Credit Card Company as the result of a transmission',101,'@IsOnline@=Y','LAR','Response message','Response Message',100,0,TO_TIMESTAMP('2018-08-30 15:39:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:19','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:20 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005657 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:20 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005658,20,'Y','N','N',5035,'N',600,'Y',3000200,'Y','The Payment Reference indicates the reference returned from the Credit Card Company for a payment',101,'@IsOnline@=Y','LAR','Payment reference','Reference',100,0,TO_TIMESTAMP('2018-08-30 15:39:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:20','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:20 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005658 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:20 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005659,20,'Y','Y','N',5038,'N',610,'Y',3000200,'Y','The Authorization Code indicates the code returned from the electronic transmission.',101,'@IsOnline@=Y','LAR','Authorization Code returned','Authorization Code',100,0,TO_TIMESTAMP('2018-08-30 15:39:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:20','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:20 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005659 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:20 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005660,14,'Y','N','N',5040,'N',620,'Y',3000200,'Y','The Zip Verified indicates if the zip code has been verified by the Credit Card Company.',101,'@IsOnline@=Y','LAR','The Zip Code has been verified','Zip verified',100,0,TO_TIMESTAMP('2018-08-30 15:39:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:20','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:20 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005660 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:20 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005661,14,'Y','Y','N',5039,'N',630,'Y',3000200,'Y','The Address Verified indicates if the address has been verified by the Credit Card Company.',101,'@IsOnline@=Y','LAR','This address has been verified','Address verified',100,0,TO_TIMESTAMP('2018-08-30 15:39:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:20','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:20 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005661 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:21 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005662,14,'Y','N','N',5496,'N',640,'Y',3000200,'Y','The Document Status indicates the status of a document at this time.  If you want to change the document status, use the Document Action field',101,'LAR','The current status of the document','Document Status','N',100,0,TO_TIMESTAMP('2018-08-30 15:39:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:20','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:21 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005662 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:21 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005663,23,'Y','Y','N',5497,'N',650,'Y',3000200,'N','You find the current status in the Document Status field. The options are listed in a popup',101,'LAR','The targeted status of the document','Document Action','N',100,0,TO_TIMESTAMP('2018-08-30 15:39:21','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:21 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005663 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:21 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005664,1,'Y','N','N',8775,'N',660,'Y',3000200,'Y','Self-Service allows users to enter data or update their data.  The flag indicates, that this record was entered or created via Self-Service or that the user can change it via the Self-Service functionality.','LAR','This is a Self-Service entry or this entry can be changed via Self-Service','Self-Service','N',100,0,TO_TIMESTAMP('2018-08-30 15:39:21','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:21 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005664 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:21 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005665,23,'Y','Y','N',5042,'N',670,'Y',3000200,'N','The Posted field indicates the status of the Generation of General Ledger Accounting Lines ','@Processed@=Y & @#ShowAcct@=Y','LAR','Posting status','Posted','N',100,0,TO_TIMESTAMP('2018-08-30 15:39:21','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:21 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005665 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:21 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005666,1,'Y','N','N',5400,'N',680,'Y',3000200,'Y','The Allocated checkbox indicates if a payment has been allocated or associated with an invoice or invoices.','@Processed@=Y','LAR','Indicates if the payment has been allocated','Allocated','N',100,0,TO_TIMESTAMP('2018-08-30 15:39:21','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:21 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005666 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:22 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,DisplayLogic,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005667,14,'Y','Y','N',52117,'N',690,'Y',3000200,'N','The Cash Book identifies a unique cash book.  The cash book is used to record cash transactions.','1=0','LAR','Cash Book for recording petty cash transactions','Cash Book',100,0,TO_TIMESTAMP('2018-08-30 15:39:21','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:22 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005667 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:22 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005668,1,'Y','N','N',3000260,'N',700,'Y',3000200,'N','LAR','Allocation',100,0,TO_TIMESTAMP('2018-08-30 15:39:22','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:22 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005668 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:22 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005669,60,'Y','N','N',3000824,'N',710,'Y',3000200,'N','LAR','TargetAccount',100,0,TO_TIMESTAMP('2018-08-30 15:39:22','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:22 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005669 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:22 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005670,1,'Y','N','N',3001179,'N',720,'Y',3000200,'N','@TenderType@=D','LAR','DebitCardType',100,0,TO_TIMESTAMP('2018-08-30 15:39:22','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:22 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005670 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:22 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005671,1,'Y','N','N',3000826,'N',730,'Y',3000200,'N','LAR','IsDeposited',100,0,TO_TIMESTAMP('2018-08-30 15:39:22','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:22 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005671 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:23 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005672,1,'Y','N','N',3000261,'N',740,'Y',3000200,'N','LAR','IsOnDrawer',100,0,TO_TIMESTAMP('2018-08-30 15:39:22','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:23 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005672 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:23 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005673,1,'Y','N','N',3000832,'N',750,'Y',3000200,'N','LAR','EsRetencionIIBB',100,0,TO_TIMESTAMP('2018-08-30 15:39:23','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:23','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:23 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005673 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:23 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005674,1,'Y','N','N',3000965,'N',760,'Y',3000200,'N','LAR','EsRetencionSufrida',100,0,TO_TIMESTAMP('2018-08-30 15:39:23','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:23','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:23 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005674 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:23 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005675,10,'Y','N','N',3000258,'N',770,'Y',3000200,'N','LAR','Cabecera de Pago/Cobro',100,0,TO_TIMESTAMP('2018-08-30 15:39:23','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:23','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:23 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005675 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:24 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005676,10,'Y','N','N',3000259,'N',780,'Y',3000200,'N','LAR','Pago/Cobro Origen',100,0,TO_TIMESTAMP('2018-08-30 15:39:23','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:23','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:24 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005676 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:24 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005677,1,'Y','N','N',3000825,'N',790,'Y',3000200,'N','LAR','IsBounced',100,0,TO_TIMESTAMP('2018-08-30 15:39:24','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:24','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:24 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005677 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:24 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,Help,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,ReadOnlyLogic,IsInsertRecord,IsAdvancedTab,EntityType,Name,Description,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('Y',3000089,15,'You can directly allocate payments to invoices with the same currency when creating the Payment. 
Note that you can over- or under-allocate the payment.<b>
When processing the payment, the allocation is created.<b>
The Organization is set to the invoice organization','N','N',812,3000201,'N','N','N','N',1,'@Processed@=Y','Y','Y','LAR','Allocate to Invoices','Allocate Payments to Invoices',0,0,TO_TIMESTAMP('2018-08-30 15:39:24','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2018-08-30 15:39:24','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 30/08/2018 15:39:24 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000201 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 30/08/2018 15:39:24 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005678,10,'N','N','N',14319,'N',0,'Y',3000201,'N','You can directly allocate payments to invoices when creating the Payment. 
Note that you can over- or under-allocate the payment.  When processing the payment, the allocation is created.','LAR','Allocate Payment to Invoices','Allocate Payment',100,0,TO_TIMESTAMP('2018-08-30 15:39:24','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:24','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:24 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005678 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:24 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005679,10,'Y','N','N',14320,'N',10,'Y',3000201,'Y','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,TO_TIMESTAMP('2018-08-30 15:39:24','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:24','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:24 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005679 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:25 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005680,10,'Y','Y','N',14321,'N',20,'Y',3000201,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,TO_TIMESTAMP('2018-08-30 15:39:24','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:24','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:25 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005680 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:25 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005681,10,'Y','N','N',14327,'N',30,'Y',3000201,'Y','The Payment is a unique identifier of this payment.','LAR','Payment identifier','Payment','N',100,0,TO_TIMESTAMP('2018-08-30 15:39:25','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:25 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005681 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:25 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005682,1,'Y','N','N',14322,'N',40,'Y',3000201,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,TO_TIMESTAMP('2018-08-30 15:39:25','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:25 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005682 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:25 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005683,10,'Y','N','N',14328,'N',50,'Y',3000201,'N','The Invoice Document.','LAR','Invoice Identifier','Invoice',100,0,TO_TIMESTAMP('2018-08-30 15:39:25','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:25 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005683 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:25 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005684,22,'Y','Y','N',14334,'N',60,'Y',3000201,'Y','LAR','Invoice Amt',100,0,TO_TIMESTAMP('2018-08-30 15:39:25','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:25 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005684 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:26 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005685,22,'Y','N','N',14329,'N',70,'Y',3000201,'N','The Amount indicates the amount for this document line.','LAR','Amount in a defined currency','Amount',100,0,TO_TIMESTAMP('2018-08-30 15:39:25','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:26 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005685 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:26 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005686,22,'Y','Y','N',14330,'N',80,'Y',3000201,'N','The Discount Amount indicates the discount amount for a document or line.','LAR','Calculated amount of discount','Discount Amount',100,0,TO_TIMESTAMP('2018-08-30 15:39:26','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:26','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:26 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005686 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:26 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005687,22,'Y','N','N',14331,'N',90,'Y',3000201,'N','The Write Off Amount indicates the amount to be written off as uncollectible.','LAR','Amount to write-off','Write-off Amount',100,0,TO_TIMESTAMP('2018-08-30 15:39:26','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:26','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:26 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005687 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:26 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005688,22,'Y','Y','N',14332,'N',100,'Y',3000201,'N','Overpayments (negative) are unallocated amounts and allow you to receive money for more than the particular invoice. 
Underpayments (positive) is a partial payment for the invoice. You do not write off the unpaid amount.','LAR','Over-Payment (unallocated) or Under-Payment (partial payment) Amount','Over/Under Payment',100,0,TO_TIMESTAMP('2018-08-30 15:39:26','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:26','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:26 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005688 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:26 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005689,0,'Y','N','N',14335,'N',110,'Y',3000201,'Y',104,'LAR','Remaining Amount','Remaining Amt',100,0,TO_TIMESTAMP('2018-08-30 15:39:26','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:26','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:26 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005689 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:27 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005690,10,'Y','Y','N',14333,'N',120,'Y',3000201,'Y','Allocation of Cash/Payment to Invoice',104,'LAR','Allocation Line','Allocation Line',100,0,TO_TIMESTAMP('2018-08-30 15:39:26','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:26','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:27 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005690 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:27 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,AD_Column_ID,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,Description,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('N',3000089,20,'N','N',390,3000202,'N','N',4884,'N','Y',1,'N','N','LAR','Allocations','Display Allocation of the Payment/Receipt to Invoices',0,0,TO_TIMESTAMP('2018-08-30 15:39:27','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2018-08-30 15:39:27','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 30/08/2018 15:39:27 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000202 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 30/08/2018 15:39:27 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005691,26,'N','N','N',5494,'N',0,'Y',3000202,'N','A Business Partner is anyone with whom you transact.  This can include Vendor, Customer, Employee or Salesperson','LAR','Identifies a Business Partner','Business Partner ',100,0,TO_TIMESTAMP('2018-08-30 15:39:27','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:27','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:27 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005691 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:27 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005692,14,'N','N','N',12331,'N',0,'Y',3000202,'N','Allocation of Cash/Payment to Invoice','LAR','Allocation Line','Allocation Line',100,0,TO_TIMESTAMP('2018-08-30 15:39:27','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:27','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:27 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005692 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:27 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005693,1,'N','N','N',5520,'N',0,'Y',3000202,'N','The Manual check box indicates if the process will done manually.','LAR','This is a manual process','Manual',100,0,TO_TIMESTAMP('2018-08-30 15:39:27','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:27','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:27 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005693 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:28 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005694,26,'N','N','N',5210,'N',0,'Y',3000202,'N','The Cash Journal Line indicates a unique line in a cash journal.','LAR','Cash Journal Line','Cash Journal Line','N',100,0,TO_TIMESTAMP('2018-08-30 15:39:27','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:27','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:28 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005694 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:28 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005695,1,'N','N','N',4877,'N',0,'Y',3000202,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,TO_TIMESTAMP('2018-08-30 15:39:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:28','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:28 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005695 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:28 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005696,14,'Y','N','N',4875,'N',10,'Y',3000202,'Y','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,TO_TIMESTAMP('2018-08-30 15:39:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:28','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:28 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005696 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:28 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005697,14,'Y','Y','N',4876,'N',20,'Y',3000202,'Y','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,TO_TIMESTAMP('2018-08-30 15:39:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:28','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:28 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005697 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:28 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,IsAllowCopy,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005698,26,'Y','N','N',4884,'N',30,'Y',3000202,'Y','The Payment is a unique identifier of this payment.','LAR','Payment identifier','Payment','N',100,0,TO_TIMESTAMP('2018-08-30 15:39:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:28','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:28 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005698 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:29 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005699,14,'Y','N','N',4874,'N',40,'Y',3000202,'Y','LAR','Payment allocation','Allocation',100,0,TO_TIMESTAMP('2018-08-30 15:39:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:28','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:29 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005699 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:29 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES (1,'N',3005700,14,'Y','Y','N',5519,'N',50,'Y',3000202,'Y','The Transaction Date indicates the date of the transaction.','LAR','Transaction Date','Transaction Date',100,0,TO_TIMESTAMP('2018-08-30 15:39:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:29','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:29 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005700 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:29 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005701,26,'Y','N','N',4882,'N',60,'Y',3000202,'Y','The Invoice Document.','LAR','Invoice Identifier','Invoice',100,0,TO_TIMESTAMP('2018-08-30 15:39:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:29','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:29 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005701 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:29 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005702,26,'Y','Y','N',4883,'N',70,'Y',3000202,'Y','The Order is a control document.  The  Order is complete when the quantity ordered is the same as the quantity shipped and invoiced.  When you close an order, unshipped (backordered) quantities are cancelled.','LAR','Order','Order',100,0,TO_TIMESTAMP('2018-08-30 15:39:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:29','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:29 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005702 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:29 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005703,26,'Y','N','N',4885,'N',80,'Y',3000202,'Y','The Amount indicates the amount for this document line.','LAR','Amount in a defined currency','Amount',100,0,TO_TIMESTAMP('2018-08-30 15:39:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:29','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:29 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005703 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:30 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005704,26,'Y','N','N',4886,'N',100,'Y',3000202,'Y','The Discount Amount indicates the discount amount for a document or line.','LAR','Calculated amount of discount','Discount Amount',100,0,TO_TIMESTAMP('2018-08-30 15:39:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:29','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:30 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005704 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:30 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005705,26,'Y','Y','N',4887,'N',110,'Y',3000202,'Y','The Write Off Amount indicates the amount to be written off as uncollectible.','LAR','Amount to write-off','Write-off Amount',100,0,TO_TIMESTAMP('2018-08-30 15:39:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:30','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:30 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005705 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:30 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005706,26,'Y','N','N',10762,'N',120,'Y',3000202,'Y','Overpayments (negative) are unallocated amounts and allow you to receive money for more than the particular invoice. 
Underpayments (positive) is a partial payment for the invoice. You do not write off the unpaid amount.','LAR','Over-Payment (unallocated) or Under-Payment (partial payment) Amount','Over/Under Payment',100,0,TO_TIMESTAMP('2018-08-30 15:39:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:30','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:30 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005706 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:30 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,HasTree,AD_Column_ID,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('N',3000089,30,'N','N',1000007,3000203,'N',1000115,'N','N',2,'Y','N','LAR','Withholding',0,0,TO_TIMESTAMP('2018-08-30 15:39:30','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2018-08-30 15:39:30','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 30/08/2018 15:39:30 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000203 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 30/08/2018 15:39:30 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES (0,'N',3005707,1,'N','N','N',1000123,'N',0,'Y',3000203,'N','The Tax Included checkbox indicates if the prices include tax.  This is also known as the gross price.','LAR','Tax is included in the price ','Price includes Tax',100,0,TO_TIMESTAMP('2018-08-30 15:39:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:30','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:30 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005707 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:31 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES (0,'N',3005708,10,'N','N','N',1000124,'N',0,'Y',3000203,'N','LAR','Invoice Withholding',100,0,TO_TIMESTAMP('2018-08-30 15:39:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:30','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:31 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005708 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:31 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES (0,'N',3005709,20,'Y','N','N',1000113,'N',10,'Y',3000203,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,TO_TIMESTAMP('2018-08-30 15:39:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:31','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:31 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005709 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:31 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES (0,'N',3005710,20,'Y','Y','N',1000132,'N',20,'Y',3000203,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,TO_TIMESTAMP('2018-08-30 15:39:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:31','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:31 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005710 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:31 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES (0,'N',3005711,20,'Y','N','N',1000115,'N',30,'Y',3000203,'N','The Invoice Document.','LAR','Invoice Identifier','Invoice',100,0,TO_TIMESTAMP('2018-08-30 15:39:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:31','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:31 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005711 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:31 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES (0,'N',3005712,20,'Y','N','N',1000126,'N',40,'Y',3000203,'N','LAR','Withholding Type',100,0,TO_TIMESTAMP('2018-08-30 15:39:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:31','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:31 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005712 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:32 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES (0,'N',3005713,10,'Y','Y','N',1000116,'N',50,'Y',3000203,'N','The Tax indicates the type of tax used in document line.','LAR','Tax identifier','Tax',100,0,TO_TIMESTAMP('2018-08-30 15:39:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:31','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:32 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005713 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:32 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES (0,'N',3005714,22,'Y','N','N',1000130,'N',60,'Y',3000203,'N','The Tax Base Amount indicates the base amount used for calculating the tax amount.','LAR','Base for calculating the tax amount','Tax base Amount',100,0,TO_TIMESTAMP('2018-08-30 15:39:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:32 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005714 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:32 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES (0,'N',3005715,20,'Y','Y','N',1000127,'N',70,'Y',3000203,'N','The Percent indicates the percentage used.','LAR','Percentage','Percent',100,0,TO_TIMESTAMP('2018-08-30 15:39:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:32 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005715 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:32 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES (0,'N',3005716,20,'Y','N','N',1000129,'N',80,'Y',3000203,'N','The Tax Amount displays the total tax amount for a document.','LAR','Tax Amount for a document','Tax Amount',100,0,TO_TIMESTAMP('2018-08-30 15:39:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:32 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005716 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:32 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES (0,'N',3005717,7,'Y','N','N',1000120,'N',90,'Y',3000203,'Y','The Transaction Date indicates the date of the transaction.','LAR','Transaction Date','Transaction Date',100,0,TO_TIMESTAMP('2018-08-30 15:39:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:32 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005717 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:33 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES (0,'N',3005718,7,'Y','Y','N',1000119,'N',100,'Y',3000203,'Y','The Accounting Date indicates the date to be used on the General Ledger account entries generated from this document. It is also used for any currency conversion.','LAR','Accounting Date','Account Date',100,0,TO_TIMESTAMP('2018-08-30 15:39:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:33 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005718 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:33 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES (0,'N',3005719,10,'Y','N','N',1000125,'N',110,'Y',3000203,'Y','LAR','Withholding Rule',100,0,TO_TIMESTAMP('2018-08-30 15:39:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:33 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005719 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:33 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES (0,'N',3005720,1,'Y','Y','N',1000122,'N',120,'Y',3000203,'Y','LAR','Is Calc On Payment',100,0,TO_TIMESTAMP('2018-08-30 15:39:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:33 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005720 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:33 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES (0,'N',3005721,1,'Y','N','N',1000128,'N',130,'Y',3000203,'Y','The Processed checkbox indicates that a document has been processed.','LAR','The document has been processed','Processed',100,0,TO_TIMESTAMP('2018-08-30 15:39:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:33 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005721 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:39:33 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES (0,'N',3005722,1,'Y','Y','N',1000121,'N',140,'Y',3000203,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,TO_TIMESTAMP('2018-08-30 15:39:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-08-30 15:39:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/08/2018 15:39:33 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005722 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/08/2018 15:40:38 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Tab SET IsInsertRecord='N', Name='Cobro/Pago', Description='Cobro/Pago',Updated=TO_TIMESTAMP('2018-08-30 15:40:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000200
;

-- 30/08/2018 15:40:38 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Tab_Trl SET IsTranslated='N' WHERE AD_Tab_ID=3000200
;

-- 30/08/2018 15:40:55 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Tab_Trl SET IsTranslated='Y',Name='Cobro/Pago',Description='Cobro/Pago',Updated=TO_TIMESTAMP('2018-08-30 15:40:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000200 AND AD_Language='es_AR'
;

-- 30/08/2018 15:42:47 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Menu (AD_Window_ID,AD_Menu_ID,IsSummary,"action",IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Description,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000089,3000306,'N','W','Y','N','LAR','Y','Cobro/Pago','Cobro/Pago',TO_TIMESTAMP('2018-08-30 15:42:47','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_TIMESTAMP('2018-08-30 15:42:47','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 30/08/2018 15:42:47 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000306 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 30/08/2018 15:42:47 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100,t.AD_Tree_ID, 3000306, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000306)
;

-- 30/08/2018 15:43:02 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Menu_Trl SET Name='Cobros/Pagos',Description='Cobros/Pagos',Updated=TO_TIMESTAMP('2018-08-30 15:43:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=3000306 AND AD_Language='es_AR'
;

-- 30/08/2018 15:43:07 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Menu SET IsCentrallyMaintained='N',Updated=TO_TIMESTAMP('2018-08-30 15:43:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=3000306
;

-- 30/08/2018 15:44:00 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Table SET AD_Window_ID=3000089,Updated=TO_TIMESTAMP('2018-08-30 15:44:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=335
;

-- 30/08/2018 16:15:11 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Tab SET Name='Asignar Facturas', Description='Asignar Facturas',Updated=TO_TIMESTAMP('2018-08-30 16:15:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000201
;

-- 30/08/2018 16:15:11 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Tab_Trl SET IsTranslated='N' WHERE AD_Tab_ID=3000201
;

-- 30/08/2018 16:15:18 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Tab_Trl SET IsTranslated='Y',Name='Asignar Facturas',Description='Asignar Facturas',Updated=TO_TIMESTAMP('2018-08-30 16:15:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000201 AND AD_Language='es_AR'
;

-- 30/08/2018 16:15:35 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Tab SET Name='Asignaciones',Updated=TO_TIMESTAMP('2018-08-30 16:15:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000202
;

-- 30/08/2018 16:15:35 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Tab_Trl SET IsTranslated='N' WHERE AD_Tab_ID=3000202
;

-- 30/08/2018 16:15:48 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Tab_Trl SET IsTranslated='Y',Name='Asignaciones',Description='Asignaciones',Updated=TO_TIMESTAMP('2018-08-30 16:15:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000202 AND AD_Language='es_AR'
;

-- 30/08/2018 16:16:03 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Tab_Trl SET IsTranslated='Y',Name='Retenciones',Updated=TO_TIMESTAMP('2018-08-30 16:16:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000203 AND AD_Language='es_AR'
;

-- 30/08/2018 16:16:12 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Tab SET Name='Retenciones',Updated=TO_TIMESTAMP('2018-08-30 16:16:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000203
;

-- 30/08/2018 16:16:12 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Tab_Trl SET IsTranslated='N' WHERE AD_Tab_ID=3000203
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000013
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=243
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=512
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000092
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000015
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000011
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000060
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=7, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000101
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=8, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000013
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=9, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000024
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=10, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000008
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=11, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000014
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=12, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=288
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=13, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000048
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=14, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=432
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=15, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=235
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=16, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000306
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=17, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=241
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=18, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000099
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=19, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000102
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=20, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=462
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=21, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=245
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=22, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000301
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=23, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=251
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=24, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=413
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=25, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=255
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=26, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=538
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=27, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=286
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=28, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=287
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=29, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=438
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=30, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=234
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=31, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53313
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=32, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=505
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=33, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=511
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=34, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=496
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=35, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=497
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=36, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=304
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=37, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=246
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=38, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53190
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=39, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=509
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=40, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53187
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=41, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=510
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=42, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=244
;

-- 30/08/2018 16:29:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_TreeNodeMM SET Parent_ID=236, SeqNo=43, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53314
;

-- Registración de script
SELECT register_migration_script_lar('0115_ISSUE-80.sql', 'LAR', '')
;
