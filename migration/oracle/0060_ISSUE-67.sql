ALTER TABLE C_PaymentAllocate ADD COLUMN LAR_PaymentHeader_ID NUMERIC(10)
;

ALTER TABLE C_PaymentAllocate ADD CONSTRAINT paymentallocate_larpaymentheaderid
    FOREIGN KEY (LAR_PaymentHeader_ID) REFERENCES LAR_PaymentHeader (LAR_PaymentHeader_ID)
;

ALTER TABLE C_PaymentAllocate ALTER COLUMN C_Payment_ID  DROP NOT NULL
;

CREATE UNIQUE INDEX paymentallocate_invoiceid
  ON C_PaymentAllocate
  USING btree
  (LAR_PaymentHeader_ID , C_Invoice_ID)
;

-- 30/01/2015 10:34:06 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,Description,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('Y',3000009,40,'N','N',812,3000045,'N','N','N','N',0,'Y','N','LAR','Invoice Detail','Facturas para asignar los pagos',0,0,TO_DATE('2015-01-30 10:34:05','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2015-01-30 10:34:05','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 30/01/2015 10:34:06 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000045 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 30/01/2015 11:36:58 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Tab SET SeqNo=15,Updated=TO_DATE('2015-01-30 11:36:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000045
;

-- 30/01/2015 11:38:34 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000966,812,'LAR',0,'N','N','N','N',10,'N',19,'N',3000068,'N','Y','N','LAR_PaymentHeader','LAR_PaymentHeader_ID',100,TO_DATE('2015-01-30 11:38:34','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2015-01-30 11:38:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/01/2015 11:38:34 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000966 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 30/01/2015 11:39:15 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001628,1,'Y','N','N',14322,'N','Y',3000045,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,TO_DATE('2015-01-30 11:39:15','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-01-30 11:39:15','YYYY-MM-DD HH24:MI:SS'))
;

-- 30/01/2015 11:39:15 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001628 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/01/2015 11:39:17 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001629,10,'N','N','N',14319,'N','Y',3000045,'N','You can directly allocate payments to invoices when creating the Payment. 
Note that you can over- or under-allocate the payment.  When processing the payment, the allocation is created.','LAR','Allocate Payment to Invoices','Allocate Payment',100,0,TO_DATE('2015-01-30 11:39:15','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-01-30 11:39:15','YYYY-MM-DD HH24:MI:SS'))
;

-- 30/01/2015 11:39:17 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001629 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/01/2015 11:39:17 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001630,10,'Y','N','N',14333,'N','Y',3000045,'N','Allocation of Cash/Payment to Invoice','LAR','Allocation Line','Allocation Line',100,0,TO_DATE('2015-01-30 11:39:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-01-30 11:39:17','YYYY-MM-DD HH24:MI:SS'))
;

-- 30/01/2015 11:39:17 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001630 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/01/2015 11:39:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001631,22,'Y','N','N',14329,'N','Y',3000045,'N','The Amount indicates the amount for this document line.','LAR','Amount in a defined currency','Amount',100,0,TO_DATE('2015-01-30 11:39:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-01-30 11:39:17','YYYY-MM-DD HH24:MI:SS'))
;

-- 30/01/2015 11:39:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001631 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/01/2015 11:39:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001632,10,'Y','N','N',14320,'N','Y',3000045,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,TO_DATE('2015-01-30 11:39:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-01-30 11:39:18','YYYY-MM-DD HH24:MI:SS'))
;

-- 30/01/2015 11:39:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001632 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/01/2015 11:39:19 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001633,22,'Y','N','N',14330,'N','Y',3000045,'N','The Discount Amount indicates the discount amount for a document or line.','LAR','Calculated amount of discount','Discount Amount',100,0,TO_DATE('2015-01-30 11:39:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-01-30 11:39:18','YYYY-MM-DD HH24:MI:SS'))
;

-- 30/01/2015 11:39:19 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001633 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/01/2015 11:39:19 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001634,10,'Y','N','N',14328,'N','Y',3000045,'N','The Invoice Document.','LAR','Invoice Identifier','Invoice',100,0,TO_DATE('2015-01-30 11:39:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-01-30 11:39:19','YYYY-MM-DD HH24:MI:SS'))
;

-- 30/01/2015 11:39:19 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001634 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/01/2015 11:39:20 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001635,22,'Y','N','N',14334,'N','Y',3000045,'N','LAR','Invoice Amt',100,0,TO_DATE('2015-01-30 11:39:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-01-30 11:39:19','YYYY-MM-DD HH24:MI:SS'))
;

-- 30/01/2015 11:39:20 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001635 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/01/2015 11:39:21 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001636,10,'Y','N','N',3000966,'N','Y',3000045,'N','LAR','LAR_PaymentHeader',100,0,TO_DATE('2015-01-30 11:39:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-01-30 11:39:20','YYYY-MM-DD HH24:MI:SS'))
;

-- 30/01/2015 11:39:21 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001636 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/01/2015 11:39:21 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001637,10,'Y','N','N',14321,'N','Y',3000045,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,TO_DATE('2015-01-30 11:39:21','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-01-30 11:39:21','YYYY-MM-DD HH24:MI:SS'))
;

-- 30/01/2015 11:39:21 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001637 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/01/2015 11:39:22 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001638,22,'Y','N','N',14332,'N','Y',3000045,'N','Overpayments (negative) are unallocated amounts and allow you to receive money for more than the particular invoice. 
Underpayments (positive) is a partial payment for the invoice. You do not write off the unpaid amount.','LAR','Over-Payment (unallocated) or Under-Payment (partial payment) Amount','Over/Under Payment',100,0,TO_DATE('2015-01-30 11:39:21','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-01-30 11:39:21','YYYY-MM-DD HH24:MI:SS'))
;

-- 30/01/2015 11:39:22 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001638 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/01/2015 11:39:22 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001639,10,'Y','N','N',14327,'N','Y',3000045,'N','The Payment is a unique identifier of this payment.','LAR','Payment identifier','Payment',100,0,TO_DATE('2015-01-30 11:39:22','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-01-30 11:39:22','YYYY-MM-DD HH24:MI:SS'))
;

-- 30/01/2015 11:39:22 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001639 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/01/2015 11:39:23 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001640,22,'Y','N','N',14335,'N','Y',3000045,'N','LAR','Remaining Amount','Remaining Amt',100,0,TO_DATE('2015-01-30 11:39:22','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-01-30 11:39:22','YYYY-MM-DD HH24:MI:SS'))
;

-- 30/01/2015 11:39:23 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001640 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/01/2015 11:39:23 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001641,22,'Y','N','N',14331,'N','Y',3000045,'N','The Write Off Amount indicates the amount to be written off as uncollectible.','LAR','Amount to write-off','Write-off Amount',100,0,TO_DATE('2015-01-30 11:39:23','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2015-01-30 11:39:23','YYYY-MM-DD HH24:MI:SS'))
;

-- 30/01/2015 11:39:23 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001641 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/01/2015 11:40:47 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Tab SET IsAdvancedTab='Y',Updated=TO_DATE('2015-01-30 11:40:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000045
;

-- 30/01/2015 11:50:38 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001636
;

-- 30/01/2015 11:50:38 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001639
;

-- 30/01/2015 11:50:38 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3001632
;

-- 30/01/2015 11:50:38 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3001637
;

-- 30/01/2015 11:50:38 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3001628
;

-- 30/01/2015 11:50:38 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3001634
;

-- 30/01/2015 11:50:38 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3001635
;

-- 30/01/2015 11:50:38 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3001631
;

-- 30/01/2015 11:50:38 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3001633
;

-- 30/01/2015 11:50:38 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3001641
;

-- 30/01/2015 11:50:38 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3001638
;

-- 30/01/2015 11:50:38 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3001640
;

-- 30/01/2015 11:50:38 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3001630
;

-- 30/01/2015 12:00:54 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Tab SET TabLevel=1,Updated=TO_DATE('2015-01-30 12:00:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000045
;

-- 30/01/2015 12:05:31 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2015-01-30 12:05:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001637
;

-- 30/01/2015 12:05:42 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET IsSameLine='Y', IsReadOnly='Y',Updated=TO_DATE('2015-01-30 12:05:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001635
;

-- 30/01/2015 12:05:48 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2015-01-30 12:05:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001633
;

-- 30/01/2015 12:05:56 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2015-01-30 12:05:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001638
;

-- 30/01/2015 12:06:03 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2015-01-30 12:06:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001630
;

-- 30/01/2015 12:07:46 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Tab SET AD_Column_ID=3000966,Updated=TO_DATE('2015-01-30 12:07:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000045
;

-- 30/01/2015 12:09:35 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET DefaultValue='@SQL=SELECT AD_Org_ID FROM LAR_PaymentHeader ph WHERE ph.LAR_PaymentHeader_ID = @LAR_PaymentHeader_ID@',Updated=TO_DATE('2015-01-30 12:09:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001637
;

-- 30/01/2015 12:11:19 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET IsReadOnly='Y', AD_FieldGroup_ID=104,Updated=TO_DATE('2015-01-30 12:11:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001630
;

-- 30/01/2015 12:11:25 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET AD_FieldGroup_ID=104,Updated=TO_DATE('2015-01-30 12:11:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001640
;

-- 30/01/2015 18:14:16 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000273
;

-- 30/01/2015 18:14:16 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000276
;

-- 30/01/2015 18:14:16 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3000601
;

-- 30/01/2015 18:14:16 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3000602
;

-- 30/01/2015 18:14:16 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3000269
;

-- 30/01/2015 18:14:16 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3001296
;

-- 30/01/2015 18:15:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Element SET ColumnName='ReceiptHeaderTotalInvAmt', Name='ReceiptHeaderTotalInvAmt', PrintName='ReceiptHeaderTotalInvAmt',Updated=TO_DATE('2015-01-30 18:15:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000152
;

-- 30/01/2015 18:15:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000152
;

-- 30/01/2015 18:15:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Column SET ColumnName='ReceiptHeaderTotalInvAmt', Name='ReceiptHeaderTotalInvAmt', Description=NULL, Help=NULL WHERE AD_Element_ID=3000152
;

-- 30/01/2015 18:15:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Process_Para SET ColumnName='ReceiptHeaderTotalInvAmt', Name='ReceiptHeaderTotalInvAmt', Description=NULL, Help=NULL, AD_Element_ID=3000152 WHERE UPPER(ColumnName)='RECEIPTHEADERTOTALINVAMT' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 30/01/2015 18:15:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Process_Para SET ColumnName='ReceiptHeaderTotalInvAmt', Name='ReceiptHeaderTotalInvAmt', Description=NULL, Help=NULL WHERE AD_Element_ID=3000152 AND IsCentrallyMaintained='Y'
;

-- 30/01/2015 18:15:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET Name='ReceiptHeaderTotalInvAmt', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000152) AND IsCentrallyMaintained='Y'
;

-- 30/01/2015 18:15:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_PrintFormatItem pi SET PrintName='ReceiptHeaderTotalInvAmt', Name='ReceiptHeaderTotalInvAmt' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000152)
;

-- 30/01/2015 18:17:11 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Element SET ColumnName='ReceiptHeaderTotalAmt', Name='ReceiptHeaderTotalAmt', PrintName='ReceiptHeaderTotalAmt',Updated=TO_DATE('2015-01-30 18:17:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000152
;

-- 30/01/2015 18:17:11 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000152
;

-- 30/01/2015 18:17:11 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Column SET ColumnName='ReceiptHeaderTotalAmt', Name='ReceiptHeaderTotalAmt', Description=NULL, Help=NULL WHERE AD_Element_ID=3000152
;

-- 30/01/2015 18:17:11 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Process_Para SET ColumnName='ReceiptHeaderTotalAmt', Name='ReceiptHeaderTotalAmt', Description=NULL, Help=NULL, AD_Element_ID=3000152 WHERE UPPER(ColumnName)='RECEIPTHEADERTOTALAMT' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 30/01/2015 18:17:11 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Process_Para SET ColumnName='ReceiptHeaderTotalAmt', Name='ReceiptHeaderTotalAmt', Description=NULL, Help=NULL WHERE AD_Element_ID=3000152 AND IsCentrallyMaintained='Y'
;

-- 30/01/2015 18:17:11 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET Name='ReceiptHeaderTotalAmt', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000152) AND IsCentrallyMaintained='Y'
;

-- 30/01/2015 18:17:11 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_PrintFormatItem pi SET PrintName='ReceiptHeaderTotalAmt', Name='ReceiptHeaderTotalAmt' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000152)
;

-- 30/01/2015 18:17:37 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000179,'ReceiptHeaderTotalInvAmt','LAR','ReceiptHeaderTotalInvAmt','ReceiptHeaderTotalInvAmt',0,TO_DATE('2015-01-30 18:17:37','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2015-01-30 18:17:37','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 30/01/2015 18:17:37 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000179 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 30/01/2015 18:18:37 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('(SELECT COALESCE(Sum(Amount),0) FROM C_PaymentAllocate i WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = i.LAR_PaymentHeader_ID)',3000969,3000010,'U',0,'N','N','N',0,'N',14,'N',12,'N','N',3000179,'N','Y','N','N','N','ReceiptHeaderTotalInvAmt','ReceiptHeaderTotalInvAmt','N',100,TO_DATE('2015-01-30 18:18:37','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2015-01-30 18:18:37','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/01/2015 18:18:37 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000969 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 30/01/2015 18:20:15 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET AD_Column_ID=3000969, IsReadOnly='Y', Help=NULL, Description=NULL, Name='ReceiptHeaderTotalInvAmt',Updated=TO_DATE('2015-01-30 18:20:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001296
;

-- 30/01/2015 18:20:15 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field_Trl SET IsTranslated='N' WHERE AD_Field_ID=3001296
;

-- 30/01/2015 18:20:48 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2015-01-30 18:20:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001296
;

-- 30/01/2015 18:23:55 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000601
;

-- 30/01/2015 18:23:55 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3000602
;

-- 30/01/2015 18:23:55 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3001296
;

-- 30/01/2015 18:25:04 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000602
;

-- 30/01/2015 18:25:04 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3001296
;

-- 30/01/2015 18:25:04 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3000269
;

-- 30/01/2015 18:26:03 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Total Facturas',Updated=TO_DATE('2015-01-30 18:26:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001296 AND AD_Language='es_AR'
;

-- 30/01/2015 18:26:15 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3000386
;

-- 30/01/2015 18:26:15 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3001296
;

-- 30/01/2015 18:26:15 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3000269
;

-- 30/01/2015 18:26:28 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field_Trl SET Name='Total Cobros',Updated=TO_DATE('2015-01-30 18:26:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000386 AND AD_Language='es_AR'
;

-- 30/01/2015 18:27:26 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2015-01-30 18:27:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000386
;

-- 30/01/2015 18:28:05 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2015-01-30 18:28:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000386
;

-- 30/01/2015 18:30:17 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000308
;

-- 30/01/2015 18:30:17 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000309
;

-- 30/01/2015 18:30:17 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000285
;

-- 30/01/2015 18:30:17 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3000307
;

-- 30/01/2015 18:30:17 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3000310
;

-- 30/01/2015 18:30:17 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3000311
;

-- 30/01/2015 18:30:17 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3000312
;

-- 30/01/2015 18:30:17 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3000313
;

-- 30/01/2015 18:30:17 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3000314
;

-- 30/01/2015 18:30:17 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3000315
;

-- 30/01/2015 18:30:17 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3000316
;

-- 30/01/2015 18:30:17 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3000317
;

-- 30/01/2015 18:30:17 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3001624
;

-- 30/01/2015 18:30:17 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000318
;

-- 30/01/2015 18:30:17 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000319
;

-- 30/01/2015 18:30:17 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000320
;

-- 30/01/2015 18:30:17 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000321
;

-- 30/01/2015 18:30:17 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000322
;

-- 30/01/2015 18:30:17 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000886
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000888
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000323
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000324
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000327
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000328
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000329
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000330
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000331
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3000332
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000333
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000334
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000335
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000336
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000337
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000338
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000339
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000340
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000341
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000342
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000343
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000344
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000345
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000346
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000347
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000348
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000349
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000350
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000351
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000352
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000353
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000354
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000355
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000356
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000357
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000358
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000359
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000360
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000363
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000302
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000364
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000362
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000289
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000366
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000368
;

-- 30/01/2015 18:30:18 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000369
;

-- 30/01/2015 18:32:28 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Column SET ColumnSQL='((SELECT COALESCE(Sum(PayAmt),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID) + (SELECT COALESCE(Sum(WriteOffAmt),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID))', IsUpdateable='N',Updated=TO_DATE('2015-01-30 18:32:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000262
;

-- 31/01/2015 13:23:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000368
;

-- 31/01/2015 13:23:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000369
;

-- 31/01/2015 13:31:56 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3000308
;

-- 31/01/2015 13:31:56 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3000310
;

-- 31/01/2015 13:31:56 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3000311
;

-- 31/01/2015 13:31:56 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3000312
;

-- 31/01/2015 13:31:56 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3000313
;

-- 31/01/2015 13:31:56 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3000314
;

-- 31/01/2015 13:31:56 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3000315
;

-- 31/01/2015 13:31:56 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3000316
;

-- 31/01/2015 13:31:56 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000317
;

-- 31/01/2015 13:31:56 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3001624
;

-- 31/01/2015 13:31:56 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000318
;

-- 31/01/2015 13:31:56 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000319
;

-- 31/01/2015 13:31:56 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000320
;

-- 31/01/2015 13:31:56 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000321
;

-- 31/01/2015 13:31:56 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000322
;

-- 31/01/2015 13:31:56 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000886
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000888
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000323
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000324
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000327
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000328
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000329
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000330
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3000331
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000332
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000333
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000334
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000335
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000336
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000337
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000338
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000339
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000340
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000341
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000342
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000343
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000344
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000345
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000346
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000347
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000348
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000349
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000350
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000351
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000352
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000353
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000354
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000355
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000356
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000357
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000358
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000359
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000360
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000363
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000302
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000364
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000362
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000289
;

-- 31/01/2015 13:31:57 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000366
;

-- 31/01/2015 13:34:32 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET IsReadOnly='Y', DefaultValue=NULL,Updated=TO_DATE('2015-01-31 13:34:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000308
;

-- 31/01/2015 13:38:06 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2015-01-31 13:38:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001631
;

-- 31/01/2015 13:46:10 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001630
;

-- 31/01/2015 13:46:10 ART
-- ISSUE#67 Agrega Tab Facturas a Ventana Recibo (Varios Cobros)
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001640
;

-- Registración de script
SELECT register_migration_script_lar('0060_ISSUE-67.sql', 'LAR', '') FROM DUAL
;
