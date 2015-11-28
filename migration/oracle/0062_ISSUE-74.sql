-- 23/11/2015 12:35:14 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,Description,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('Y',3000010,15,'N','N',812,3000063,'N','N','N','N',1,'Y','Y','LAR','Facturas','Facturas para asignar los pagos',0,0,TO_DATE('2015-11-23 12:35:13','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2015-11-23 12:35:13','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 23/11/2015 12:35:14 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000063 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 23/11/2015 12:38:45 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001995,22,'N','N','N',14335,'N',0,'Y',3000063,'N',104,'LAR','Remaining Amount','Remaining Amt',100,0,TO_DATE('2015-11-23 12:38:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-11-23 12:38:40','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/11/2015 12:38:45 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001995 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/11/2015 12:38:45 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001996,10,'N','N','N',3000966,'N',0,'Y',3000063,'N','LAR','LAR_PaymentHeader',100,0,TO_DATE('2015-11-23 12:38:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-11-23 12:38:45','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/11/2015 12:38:45 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001996 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/11/2015 12:38:45 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001997,10,'N','N','N',14327,'N',0,'Y',3000063,'N','The Payment is a unique identifier of this payment.','LAR','Payment identifier','Payment',100,0,TO_DATE('2015-11-23 12:38:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-11-23 12:38:45','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/11/2015 12:38:45 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001997 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/11/2015 12:38:46 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001998,10,'N','Y','N',14333,'N',0,'Y',3000063,'Y','Allocation of Cash/Payment to Invoice',104,'LAR','Allocation Line','Allocation Line',100,0,TO_DATE('2015-11-23 12:38:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-11-23 12:38:45','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/11/2015 12:38:46 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001998 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/11/2015 12:38:46 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001999,10,'Y','N','N',14320,'N',10,'Y',3000063,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,TO_DATE('2015-11-23 12:38:46','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-11-23 12:38:46','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/11/2015 12:38:46 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001999 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/11/2015 12:38:46 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,DefaultValue,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002000,10,'Y','Y','N',14321,'N',20,'Y',3000063,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','@SQL=SELECT AD_Org_ID FROM LAR_PaymentHeader ph WHERE ph.LAR_PaymentHeader_ID = @LAR_PaymentHeader_ID@','Organizational entity within client','Organization',100,0,TO_DATE('2015-11-23 12:38:46','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-11-23 12:38:46','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/11/2015 12:38:46 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002000 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/11/2015 12:38:46 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002001,1,'Y','N','N',14322,'N',30,'Y',3000063,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,TO_DATE('2015-11-23 12:38:46','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-11-23 12:38:46','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/11/2015 12:38:46 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002001 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/11/2015 12:38:46 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002002,10,'Y','N','N',14328,'N',40,'Y',3000063,'N','The Invoice Document.','LAR','Invoice Identifier','Invoice',100,0,TO_DATE('2015-11-23 12:38:46','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-11-23 12:38:46','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/11/2015 12:38:46 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002002 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/11/2015 12:38:46 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002003,22,'Y','Y','N',14334,'N',50,'Y',3000063,'Y','LAR','Invoice Amt',100,0,TO_DATE('2015-11-23 12:38:46','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-11-23 12:38:46','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/11/2015 12:38:46 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002003 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/11/2015 12:38:47 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002004,22,'Y','N','N',14329,'N',60,'Y',3000063,'Y','The Amount indicates the amount for this document line.','LAR','Amount in a defined currency','Amount',100,0,TO_DATE('2015-11-23 12:38:46','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-11-23 12:38:46','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/11/2015 12:38:47 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002004 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/11/2015 12:38:47 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002005,22,'Y','Y','N',14330,'N',70,'Y',3000063,'N','The Discount Amount indicates the discount amount for a document or line.','LAR','Calculated amount of discount','Discount Amount',100,0,TO_DATE('2015-11-23 12:38:47','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-11-23 12:38:47','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/11/2015 12:38:47 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002005 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/11/2015 12:38:47 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002006,22,'Y','N','N',14331,'N',80,'Y',3000063,'N','The Write Off Amount indicates the amount to be written off as uncollectible.','LAR','Amount to write-off','Write-off Amount',100,0,TO_DATE('2015-11-23 12:38:47','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-11-23 12:38:47','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/11/2015 12:38:47 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002006 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/11/2015 12:38:47 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002007,22,'Y','Y','N',14332,'N',90,'Y',3000063,'N','Overpayments (negative) are unallocated amounts and allow you to receive money for more than the particular invoice. 
Underpayments (positive) is a partial payment for the invoice. You do not write off the unpaid amount.','LAR','Over-Payment (unallocated) or Under-Payment (partial payment) Amount','Over/Under Payment',100,0,TO_DATE('2015-11-23 12:38:47','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-11-23 12:38:47','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/11/2015 12:38:47 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002007 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/11/2015 12:38:47 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002008,10,'N','N','N',14319,'N','Y',3000063,'N','You can directly allocate payments to invoices when creating the Payment. 
Note that you can over- or under-allocate the payment.  When processing the payment, the allocation is created.','LAR','Allocate Payment to Invoices','Allocate Payment',100,0,TO_DATE('2015-11-23 12:38:47','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-11-23 12:38:47','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/11/2015 12:38:47 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002008 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/11/2015 17:45:26 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
UPDATE AD_Tab SET AD_Column_ID=3000966,Updated=TO_DATE('2015-11-23 17:45:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000063
;

-- 23/11/2015 17:51:38 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
UPDATE AD_Field SET IsDisplayed='N',Updated=TO_DATE('2015-11-23 17:51:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000387
;

-- 23/11/2015 17:51:52 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
UPDATE AD_Field SET DisplayLogic='@Processed@=N',Updated=TO_DATE('2015-11-23 17:51:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000600
;

-- 24/11/2015 9:17:25 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
UPDATE AD_Column SET ReadOnlyLogic='@C_Invoice_ID@!0 | @C_Order_ID@!0 | ((@LAR_PaymentSource_ID@!0) & (@C_DocType_ID@!1000126 | @C_DocType_ID@!1000127))',Updated=TO_DATE('2015-11-24 09:17:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=8984
;

-- 24/11/2015 9:21:20 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2015-11-24 09:21:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000429
;

-- 24/11/2015 10:00:35 ART
-- ISSUE #74: Pagos: Varias Facturas - Varios Pagos
UPDATE AD_Column SET IsSelectionColumn='N',Updated=TO_DATE('2015-11-24 10:00:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000253
;

-- Registración de script
SELECT register_migration_script_lar('0062_ISSUE-74.sql', 'LAR', '') FROM DUAL
;
