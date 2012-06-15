-- 08/06/2012 11:30:28 ART
-- Add ergio Payment Terms
UPDATE C_PaymentTerm SET Name=Name ||'.', Description='(OBSOLETO - FUERA DE USO)', IsActive='N' Where AD_Client_ID=1000000 AND C_PaymentTerm_ID=1000000
;

-- 08/06/2012 11:30:28 ART
-- Add ergio Payment Terms
INSERT INTO C_PaymentTerm (IsDefault,DiscountDays2,Discount2,AfterDelivery,C_PaymentTerm_ID,GraceDays,NetDays,Discount,DiscountDays,IsDueFixed,IsNextBusinessDay,IsValid,PaymentTermUsage,Name,Value,CreatedBy,Updated,UpdatedBy,AD_Org_ID,IsActive,Processing,Created,AD_Client_ID) VALUES ('Y',0,0,'N',3000000,0,0,0,0,'N','N','Y','B','Cuenta Corriente','CC',100,TO_TIMESTAMP('2012-06-08 11:30:28','YYYY-MM-DD HH24:MI:SS'),100,0,'Y','N',TO_TIMESTAMP('2012-06-08 11:30:28','YYYY-MM-DD HH24:MI:SS'),1000000)
;

-- 08/06/2012 11:30:28 ART
-- Add ergio Payment Terms
INSERT INTO C_PaymentTerm_Trl (AD_Language,C_PaymentTerm_ID, DocumentNote,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.C_PaymentTerm_ID, t.DocumentNote,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, C_PaymentTerm t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.C_PaymentTerm_ID=3000000 AND NOT EXISTS (SELECT * FROM C_PaymentTerm_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.C_PaymentTerm_ID=t.C_PaymentTerm_ID)
;

-- 08/06/2012 11:30:47 ART
-- Add ergio Payment Terms
INSERT INTO C_PaymentTerm (IsDefault,DiscountDays2,Discount2,AfterDelivery,C_PaymentTerm_ID,GraceDays,NetDays,Discount,DiscountDays,IsDueFixed,IsNextBusinessDay,IsValid,PaymentTermUsage,Name,Value,CreatedBy,Updated,UpdatedBy,AD_Org_ID,IsActive,Processing,Created,AD_Client_ID) VALUES ('Y',0,0,'N',3000001,0,0,0,0,'N','N','Y','B','Contado','CO',100,TO_TIMESTAMP('2012-06-08 11:30:47','YYYY-MM-DD HH24:MI:SS'),100,0,'Y','N',TO_TIMESTAMP('2012-06-08 11:30:47','YYYY-MM-DD HH24:MI:SS'),1000000)
;

-- 08/06/2012 11:30:47 ART
-- Add ergio Payment Terms
INSERT INTO C_PaymentTerm_Trl (AD_Language,C_PaymentTerm_ID, DocumentNote,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.C_PaymentTerm_ID, t.DocumentNote,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, C_PaymentTerm t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.C_PaymentTerm_ID=3000001 AND NOT EXISTS (SELECT * FROM C_PaymentTerm_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.C_PaymentTerm_ID=t.C_PaymentTerm_ID)
;
