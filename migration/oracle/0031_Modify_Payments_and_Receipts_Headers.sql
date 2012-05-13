-- 12/05/2012 10:05:45 ART
-- Add Invoice Field to Payment Header
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('(SELECT GrandTotal FROM C_Invoice i WHERE i.C_Invoice_ID = LAR_PaymentHeader.C_Invoice_ID)',3000263,3000010,'U',0,'N','N','N',0,'N',14,'N',12,'N','N',2833,'N','Y','N','N','N','Invoice Amt','InvoiceAmt','N',0,TO_DATE('2012-05-12 10:05:45','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-05-12 10:05:45','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 12/05/2012 10:05:45 ART
-- Add Invoice Field to Payment Header
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000263 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 12/05/2012 10:19:46 ART
-- Add Invoice Field to Payment Header
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('(SELECT (SELECT GrandTotal FROM C_Invoice i WHERE i.C_Invoice_ID = LAR_PaymentHeader.C_Invoice_ID)-(SELECT COALESCE(Sum(PayAmt),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID))',3000264,3000010,'U',0,'N','N','N',0,'N',14,'N',12,'N','N',2834,'N','Y','N','N','N','Remaining Amount','Remaining Amt','RemainingAmt','N',0,TO_DATE('2012-05-12 10:19:44','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-05-12 10:19:44','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 12/05/2012 10:19:46 ART
-- Add Invoice Field to Payment Header
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000264 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 12/05/2012 10:24:11 ART
-- Add Invoice Field to Payment Header
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000599,14,'Y','N','N',3000263,'N','Y',3000015,'N','U','Invoice Amt',0,0,TO_DATE('2012-05-12 10:24:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-12 10:24:09','YYYY-MM-DD HH24:MI:SS'))
;

-- 12/05/2012 10:24:11 ART
-- Add Invoice Field to Payment Header
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000599 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 12/05/2012 10:24:12 ART
-- Add Invoice Field to Payment Header
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000600,14,'Y','N','N',3000264,'N','Y',3000015,'N','U','Remaining Amount','Remaining Amt',0,0,TO_DATE('2012-05-12 10:24:11','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-12 10:24:11','YYYY-MM-DD HH24:MI:SS'))
;

-- 12/05/2012 10:24:12 ART
-- Add Invoice Field to Payment Header
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000600 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 12/05/2012 10:25:04 ART
-- Add Invoice Field to Payment Header
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3000387
;

-- 12/05/2012 10:25:04 ART
-- Add Invoice Field to Payment Header
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3000400
;

-- 12/05/2012 10:25:04 ART
-- Add Invoice Field to Payment Header
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000599
;

-- 12/05/2012 10:25:04 ART
-- Add Invoice Field to Payment Header
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000401
;

-- 12/05/2012 10:25:04 ART
-- Add Invoice Field to Payment Header
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000600
;

-- 12/05/2012 10:25:04 ART
-- Add Invoice Field to Payment Header
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000402
;

-- 12/05/2012 10:26:39 ART
-- Add Invoice Field to Payment Header
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2012-05-12 10:26:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000400
;

-- 12/05/2012 10:31:48 ART
-- Add Invoice Field to Payment Header
UPDATE AD_Field SET DisplayLogic='@C_Invoice_ID@>0',Updated=TO_DATE('2012-05-12 10:31:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000599
;

-- 12/05/2012 10:32:03 ART
-- Add Invoice Field to Payment Header
UPDATE AD_Field SET DisplayLogic='@C_Invoice_ID@>0',Updated=TO_DATE('2012-05-12 10:32:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000600
;

-- 12/05/2012 10:36:18 ART
-- Add Invoice Field to Payment Header
UPDATE AD_Field SET IsReadOnly='Y', DefaultValue='@SQL=SELECT C_Invoice_ID FROM LAR_PaymentHeader ph WHERE ph.LAR_PaymentHeader_ID = @LAR_PaymentHeader_ID@',Updated=TO_DATE('2012-05-12 10:36:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000429
;

-- 12/05/2012 10:36:50 ART
-- Add Invoice Field to Payment Header
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2012-05-12 10:36:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000430
;

-- 12/05/2012 10:39:21 ART
-- Add Invoice Field to Payment Header
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000601,14,'Y','N','N',3000263,'N','Y',3000012,'N','U','Invoice Amt',0,0,TO_DATE('2012-05-12 10:39:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-12 10:39:20','YYYY-MM-DD HH24:MI:SS'))
;

-- 12/05/2012 10:39:21 ART
-- Add Invoice Field to Payment Header
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000601 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 12/05/2012 10:39:21 ART
-- Add Invoice Field to Payment Header
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000602,14,'Y','N','N',3000264,'N','Y',3000012,'N','U','Remaining Amount','Remaining Amt',0,0,TO_DATE('2012-05-12 10:39:21','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_DATE('2012-05-12 10:39:21','YYYY-MM-DD HH24:MI:SS'))
;

-- 12/05/2012 10:39:21 ART
-- Add Invoice Field to Payment Header
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000602 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 12/05/2012 10:42:11 ART
-- Add Invoice Field to Payment Header
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3000273
;

-- 12/05/2012 10:42:11 ART
-- Add Invoice Field to Payment Header
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3000276
;

-- 12/05/2012 10:42:11 ART
-- Add Invoice Field to Payment Header
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3000601
;

-- 12/05/2012 10:42:11 ART
-- Add Invoice Field to Payment Header
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000386
;

-- 12/05/2012 10:42:11 ART
-- Add Invoice Field to Payment Header
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000602
;

-- 12/05/2012 10:42:11 ART
-- Add Invoice Field to Payment Header
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000269
;

-- 12/05/2012 10:42:20 ART
-- Add Invoice Field to Payment Header
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2012-05-12 10:42:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000276
;

-- 12/05/2012 10:43:15 ART
-- Add Invoice Field to Payment Header
UPDATE AD_Field SET DisplayLogic='@C_Invoice_ID@>0',Updated=TO_DATE('2012-05-12 10:43:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000602
;

-- 12/05/2012 10:43:34 ART
-- Add Invoice Field to Payment Header
UPDATE AD_Field SET DisplayLogic='@C_Invoice_ID@>0',Updated=TO_DATE('2012-05-12 10:43:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000601
;

-- 12/05/2012 10:44:49 ART
-- Add Invoice Field to Payment Header
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2012-05-12 10:44:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000309
;

-- 12/05/2012 10:44:59 ART
-- Add Invoice Field to Payment Header
UPDATE AD_Field SET IsReadOnly='Y', DefaultValue='@SQL=SELECT C_Invoice_ID FROM LAR_PaymentHeader ph WHERE ph.LAR_PaymentHeader_ID = @LAR_PaymentHeader_ID@',Updated=TO_DATE('2012-05-12 10:44:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000308
;

-- 12/05/2012 20:48:49 ART
-- Add Validation to allow only drawer Bank Accounts on C_Payment
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,Updated,UpdatedBy,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('C_BankAccount.IsDrawer=''Y''','S',3000004,'LAR','C_BankAccount is Drawer',0,TO_DATE('2012-05-12 20:48:47','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',0,TO_DATE('2012-05-12 20:48:47','YYYY-MM-DD HH24:MI:SS'))
;

-- 12/05/2012 20:49:21 ART
-- Add Validation to allow only drawer Bank Accounts on C_Payment
UPDATE AD_Column SET AD_Val_Rule_ID=3000004,Updated=TO_DATE('2012-05-12 20:49:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3880
;

-- 13/05/2012 16:27:27 ART
-- Reoganize fields and Add Read Only Logic to ProcessIt Button
UPDATE AD_Field SET IsDisplayed='N',Updated=TO_DATE('2012-05-13 16:27:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000367
;

-- 13/05/2012 16:28:03 ART
-- Reoganize fields and Add Read Only Logic to ProcessIt Button
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2012-05-13 16:28:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000364
;

-- 13/05/2012 16:28:19 ART
-- Reoganize fields and Add Read Only Logic to ProcessIt Button
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000367
;

-- 13/05/2012 16:28:19 ART
-- Reoganize fields and Add Read Only Logic to ProcessIt Button
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000368
;

-- 13/05/2012 16:28:19 ART
-- Reoganize fields and Add Read Only Logic to ProcessIt Button
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000369
;

-- 13/05/2012 16:28:19 ART
-- Reoganize fields and Add Read Only Logic to ProcessIt Button
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000362
;

-- 13/05/2012 16:28:19 ART
-- Reoganize fields and Add Read Only Logic to ProcessIt Button
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000289
;

-- 13/05/2012 16:28:19 ART
-- Reoganize fields and Add Read Only Logic to ProcessIt Button
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000364
;

-- 13/05/2012 16:28:19 ART
-- Reoganize fields and Add Read Only Logic to ProcessIt Button
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3000366
;

-- 13/05/2012 16:32:58 ART
-- Reoganize fields and Add Read Only Logic to ProcessIt Button
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000491
;

-- 13/05/2012 16:32:58 ART
-- Reoganize fields and Add Read Only Logic to ProcessIt Button
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3000486
;

-- 13/05/2012 16:32:58 ART
-- Reoganize fields and Add Read Only Logic to ProcessIt Button
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=3000492
;

-- 13/05/2012 16:33:10 ART
-- Reoganize fields and Add Read Only Logic to ProcessIt Button
UPDATE AD_Field SET IsDisplayed='N',Updated=TO_DATE('2012-05-13 16:33:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000486
;

-- 13/05/2012 16:33:20 ART
-- Reoganize fields and Add Read Only Logic to ProcessIt Button
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2012-05-13 16:33:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000491
;

-- 13/05/2012 16:34:06 ART
-- Reoganize fields and Add Read Only Logic to ProcessIt Button
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000491
;

-- 13/05/2012 16:34:06 ART
-- Reoganize fields and Add Read Only Logic to ProcessIt Button
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000486
;

-- 13/05/2012 16:34:07 ART
-- Reoganize fields and Add Read Only Logic to ProcessIt Button
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000492
;

-- 13/05/2012 16:34:34 ART
-- Reoganize fields and Add Read Only Logic to ProcessIt Button
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000487
;

-- 13/05/2012 16:34:34 ART
-- Reoganize fields and Add Read Only Logic to ProcessIt Button
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000491
;

-- 13/05/2012 16:35:42 ART
-- Reoganize fields and Add Read Only Logic to ProcessIt Button
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2012-05-13 16:35:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000491
;

-- 13/05/2012 16:36:35 ART
-- Reoganize fields and Add Read Only Logic to ProcessIt Button
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3000486
;

-- 13/05/2012 16:36:43 ART
-- Reoganize fields and Add Read Only Logic to ProcessIt Button
UPDATE AD_Field SET IsDisplayed='N',Updated=TO_DATE('2012-05-13 16:36:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000486
;

-- 13/05/2012 16:37:50 ART
-- Reoganize fields and Add Read Only Logic to ProcessIt Button
UPDATE AD_Column SET DefaultValue='@RemainingAmt@<0',Updated=TO_DATE('2012-05-13 16:37:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3000241
;

-- 13/05/2012 16:38:53 ART
-- Reoganize fields and Add Read Only Logic to ProcessIt Button
UPDATE AD_Process_Para SET DefaultValue='CO',Updated=TO_DATE('2012-05-13 16:38:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Process_Para_ID=3000011
;

