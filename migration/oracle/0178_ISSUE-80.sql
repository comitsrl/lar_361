ALTER TABLE LAR_Tarjeta_Credito ADD COLUMN EsQR character(1) NOT NULL DEFAULT 'N'::bpchar;
ALTER TABLE LAR_Tarjeta_Credito ADD CONSTRAINT lar_tarjeta_credito_esqr_check CHECK (EsQR = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]));
ALTER TABLE C_Payment ADD COLUMN LAR_Quick_Response_ID numeric(10,0);
ALTER TABLE C_Payment ADD CONSTRAINT cpayment_quickresponse_fkey FOREIGN KEY (LAR_Quick_Response_ID)
      REFERENCES LAR_Tarjeta_Credito (LAR_Tarjeta_Credito_ID) MATCH SIMPLE;
ALTER TABLE LAR_TenderType_BankAccount ADD COLUMN LAR_Quick_Response_ID numeric(10,0);
ALTER TABLE LAR_TenderType_BankAccount ADD CONSTRAINT lartendertypebankaccount_quickresponse_fkey FOREIGN KEY (LAR_Quick_Response_ID)
      REFERENCES LAR_Tarjeta_Credito (LAR_Tarjeta_Credito_ID) MATCH SIMPLE;

-- 10/06/2021 20:39:11 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001140,'esqr','LAR','esqr','esqr',0,TO_DATE('2021-06-10 20:39:10','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-06-10 20:39:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 10/06/2021 20:39:11 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, PO_Description,Help,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.PO_Description,t.Help,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001140 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 10/06/2021 20:39:11 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,IsMandatory,Version,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003928,3000031,'LAR','Y',0,'N','N','N',1,'N',20,'N',3001140,'N','Y','N','esqr','esqr',TO_DATE('2021-06-10 20:39:10','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2021-06-10 20:39:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/06/2021 20:39:11 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003928 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 10/06/2021 20:39:42 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Column SET Name='Es QR', ColumnName='EsQR',Updated=TO_DATE('2021-06-10 20:39:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003928
;

-- 10/06/2021 20:39:42 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003928
;

-- 10/06/2021 20:39:42 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET Name='Es QR', Description=NULL, Help=NULL WHERE AD_Column_ID=3003928 AND IsCentrallyMaintained='Y'
;

-- 10/06/2021 20:39:57 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Element SET ColumnName='EsQR', Name='Es QR', PrintName='Es QR',Updated=TO_DATE('2021-06-10 20:39:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001140
;

-- 10/06/2021 20:39:57 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001140
;

-- 10/06/2021 20:39:57 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Column SET ColumnName='EsQR', Name='Es QR', Description=NULL, Help=NULL WHERE AD_Element_ID=3001140
;

-- 10/06/2021 20:39:57 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Process_Para SET ColumnName='EsQR', Name='Es QR', Description=NULL, Help=NULL, AD_Element_ID=3001140 WHERE UPPER(ColumnName)='ESQR' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 10/06/2021 20:39:57 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Process_Para SET ColumnName='EsQR', Name='Es QR', Description=NULL, Help=NULL WHERE AD_Element_ID=3001140 AND IsCentrallyMaintained='Y'
;

-- 10/06/2021 20:39:57 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET Name='Es QR', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001140) AND IsCentrallyMaintained='Y'
;

-- 10/06/2021 20:39:57 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_PrintFormatItem pi SET PrintName='Es QR', Name='Es QR' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001140)
;

-- 10/06/2021 20:40:05 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Element_Trl SET Name='Es QR',PrintName='Es QR',Updated=TO_DATE('2021-06-10 20:40:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001140 AND AD_Language='es_AR'
;

-- 10/06/2021 20:40:12 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Column_Trl SET Name='Es QR',Updated=TO_DATE('2021-06-10 20:40:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003928 AND AD_Language='es_AR'
;

-- 10/06/2021 20:40:43 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007055,1,'Y','N','N',3003928,'N','Y',3000052,'N','LAR','Es QR',100,0,'Y',TO_DATE('2021-06-10 20:40:42','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2021-06-10 20:40:42','YYYY-MM-DD HH24:MI:SS'))
;

-- 10/06/2021 20:40:43 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007055 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/06/2021 20:40:52 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3007055
;

-- 10/06/2021 20:40:52 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3001860
;

-- 10/06/2021 20:42:17 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2021-06-10 20:42:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007055
;

-- 10/06/2021 20:45:54 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2021-06-10 20:45:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003310
;

-- 10/06/2021 20:47:32 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001141,'lar_quick_response_id','LAR','lar_quick_response_id','lar_quick_response_id',0,TO_DATE('2021-06-10 20:47:31','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-06-10 20:47:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 10/06/2021 20:47:32 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, PO_Description,Help,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.PO_Description,t.Help,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001141 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 10/06/2021 20:47:32 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,IsMandatory,Version,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003929,335,'LAR','N',0,'N','N','N',10,'N',19,'N',3001141,'N','Y','N','lar_quick_response_id','lar_quick_response_id',TO_DATE('2021-06-10 20:47:31','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2021-06-10 20:47:31','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/06/2021 20:47:32 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003929 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 10/06/2021 21:08:00 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Element SET ColumnName='LAR_Quick_Response_ID', Name='Billetera Digital', PrintName='Billetera Digital',Updated=TO_DATE('2021-06-10 21:08:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001141
;

-- 10/06/2021 21:08:00 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001141
;

-- 10/06/2021 21:08:00 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Column SET ColumnName='LAR_Quick_Response_ID', Name='Billetera Digital', Description=NULL, Help=NULL WHERE AD_Element_ID=3001141
;

-- 10/06/2021 21:08:00 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Process_Para SET ColumnName='LAR_Quick_Response_ID', Name='Billetera Digital', Description=NULL, Help=NULL, AD_Element_ID=3001141 WHERE UPPER(ColumnName)='LAR_QUICK_RESPONSE_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 10/06/2021 21:08:00 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Process_Para SET ColumnName='LAR_Quick_Response_ID', Name='Billetera Digital', Description=NULL, Help=NULL WHERE AD_Element_ID=3001141 AND IsCentrallyMaintained='Y'
;

-- 10/06/2021 21:08:00 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET Name='Billetera Digital', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001141) AND IsCentrallyMaintained='Y'
;

-- 10/06/2021 21:08:00 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_PrintFormatItem pi SET PrintName='Billetera Digital', Name='Billetera Digital' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001141)
;

-- 10/06/2021 21:08:10 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Element_Trl SET Name='Billetera Digital',PrintName='Billetera Digital',Updated=TO_DATE('2021-06-10 21:08:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001141 AND AD_Language='es_AR'
;

-- 10/06/2021 21:09:04 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000124,'T','LAR','N','Billetera Digital',0,0,100,TO_DATE('2021-06-10 21:09:04','YYYY-MM-DD HH24:MI:SS'),'Y',TO_DATE('2021-06-10 21:09:04','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/06/2021 21:09:04 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000124 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 10/06/2021 21:10:15 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Ref_Table (IsValueDisplayed,WhereClause,OrderByClause,AD_Table_ID,AD_Reference_ID,AD_Key,AD_Display,EntityType,CreatedBy,Updated,Created,AD_Client_ID,UpdatedBy,AD_Org_ID,IsActive) VALUES ('N','EsQR = ''Y''','Description',3000031,3000124,3001045,3001055,'LAR',100,TO_DATE('2021-06-10 21:10:15','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-06-10 21:10:15','YYYY-MM-DD HH24:MI:SS'),0,100,0,'Y')
;

-- 10/06/2021 21:12:02 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Column SET AD_Reference_Value_ID=3000124, AD_Reference_ID=18, Name='Billetera Digital', ColumnName='LAR_Quick_Response_ID',Updated=TO_DATE('2021-06-10 21:12:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003929
;

-- 10/06/2021 21:12:11 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Column_Trl SET Name='Billetera Digital',Updated=TO_DATE('2021-06-10 21:12:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003929 AND AD_Language='es_AR'
;

-- 10/06/2021 21:12:42 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007056,10,'Y','N','N',3003929,'N','Y',3000200,'N','LAR','Billetera Digital',100,0,'Y',TO_DATE('2021-06-10 21:12:42','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2021-06-10 21:12:42','YYYY-MM-DD HH24:MI:SS'))
;

-- 10/06/2021 21:12:42 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007056 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/06/2021 21:12:43 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007058,1,'Y','N','N',3003533,'N','Y',3000200,'N','LAR','Es Electrónico',100,0,'Y',TO_DATE('2021-06-10 21:12:43','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2021-06-10 21:12:43','YYYY-MM-DD HH24:MI:SS'))
;

-- 10/06/2021 21:12:43 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007058 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/06/2021 21:12:43 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007059,29,'Y','N','N',3001958,'N','Y',3000200,'N','LAR','Fecha de Venc. Cheque',100,0,'Y',TO_DATE('2021-06-10 21:12:43','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2021-06-10 21:12:43','YYYY-MM-DD HH24:MI:SS'))
;

-- 10/06/2021 21:12:43 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007059 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/06/2021 21:12:44 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007062,2,'Y','N','N',3002077,'N','Y',3000200,'N','LAR','Nro. Cuotas',100,0,'Y',TO_DATE('2021-06-10 21:12:43','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2021-06-10 21:12:43','YYYY-MM-DD HH24:MI:SS'))
;

-- 10/06/2021 21:12:44 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007062 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/06/2021 21:12:44 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007063,10,'Y','N','N',3001205,'N','Y',3000200,'N','LAR','Plan de Pago',100,0,'Y',TO_DATE('2021-06-10 21:12:44','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2021-06-10 21:12:44','YYYY-MM-DD HH24:MI:SS'))
;

-- 10/06/2021 21:12:44 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007063 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/06/2021 21:12:44 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007066,10,'Y','N','N',3001188,'N','Y',3000200,'N','LAR','Tarjeta de Crédito',100,0,'Y',TO_DATE('2021-06-10 21:12:44','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2021-06-10 21:12:44','YYYY-MM-DD HH24:MI:SS'))
;

-- 10/06/2021 21:12:44 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007066 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/06/2021 21:12:45 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007067,10,'Y','N','N',3001772,'N','Y',3000200,'N','LAR','Tarjeta de Debito',100,0,'Y',TO_DATE('2021-06-10 21:12:44','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2021-06-10 21:12:44','YYYY-MM-DD HH24:MI:SS'))
;

-- 10/06/2021 21:12:45 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007067 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/06/2021 21:12:45 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007068,10,'Y','N','N',3002109,'N','Y',3000200,'N','LAR','Tipo de Cheque Emitido',100,0,'Y',TO_DATE('2021-06-10 21:12:45','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2021-06-10 21:12:45','YYYY-MM-DD HH24:MI:SS'))
;

-- 10/06/2021 21:12:45 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007068 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/06/2021 21:12:45 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007069,10,'Y','N','N',3001865,'N','Y',3000200,'N','LAR','Tipo de Depósito Directo',100,0,'Y',TO_DATE('2021-06-10 21:12:45','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2021-06-10 21:12:45','YYYY-MM-DD HH24:MI:SS'))
;

-- 10/06/2021 21:12:45 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007069 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007056
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007057
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007058
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007059
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007060
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007061
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007062
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007063
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007064
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007065
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007066
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007067
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007068
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007069
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3005637
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3005638
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3005639
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3005640
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3005641
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3005642
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3005643
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3005644
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3005645
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3005646
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3005647
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3005648
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3005649
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3005650
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3005651
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3005652
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3005653
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3005654
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3005655
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3005656
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3005657
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3005658
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3005659
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3005660
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3005661
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3005662
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3005663
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3005664
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3005665
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3005666
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3005667
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=3005668
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=680,IsDisplayed='Y' WHERE AD_Field_ID=3005670
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=690,IsDisplayed='Y' WHERE AD_Field_ID=3005672
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=700,IsDisplayed='Y' WHERE AD_Field_ID=3005673
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=710,IsDisplayed='Y' WHERE AD_Field_ID=3005674
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=720,IsDisplayed='Y' WHERE AD_Field_ID=3005675
;

-- 10/06/2021 21:13:29 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=730,IsDisplayed='Y' WHERE AD_Field_ID=3005676
;

-- 10/06/2021 21:15:35 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007070,10,'Y','N','N',3003929,'N','Y',3000013,'N','LAR','Billetera Digital',100,0,'Y',TO_DATE('2021-06-10 21:15:34','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2021-06-10 21:15:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 10/06/2021 21:15:35 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007070 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/06/2021 21:15:35 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007072,10,'Y','N','N',3002109,'N','Y',3000013,'N','LAR','Tipo de Cheque Emitido',100,0,'Y',TO_DATE('2021-06-10 21:15:35','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2021-06-10 21:15:35','YYYY-MM-DD HH24:MI:SS'))
;

-- 10/06/2021 21:15:35 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007072 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/06/2021 21:15:52 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007070
;

-- 10/06/2021 21:15:52 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007071
;

-- 10/06/2021 21:15:52 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007072
;

-- 10/06/2021 21:19:39 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,IsMandatory,Version,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003930,3000034,'LAR','N',0,'N','N','N',10,'N',19,'N',3001141,'N','Y','N','Billetera Digital','LAR_Quick_Response_ID',TO_DATE('2021-06-10 21:19:39','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2021-06-10 21:19:39','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/06/2021 21:19:39 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003930 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 10/06/2021 21:20:02 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Column SET AD_Reference_Value_ID=3000124, AD_Reference_ID=18,Updated=TO_DATE('2021-06-10 21:20:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003930
;

-- 10/06/2021 21:21:09 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Table SET AD_Window_ID=3000028,Updated=TO_DATE('2021-06-10 21:21:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000034
;

-- 10/06/2021 21:21:22 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007073,10,'Y','N','N',3003930,'N','Y',3000055,'N','LAR','Billetera Digital',100,0,'Y',TO_DATE('2021-06-10 21:21:21','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2021-06-10 21:21:21','YYYY-MM-DD HH24:MI:SS'))
;

-- 10/06/2021 21:21:22 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007073 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/06/2021 21:22:57 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000265,214,'LAR','Q','Billetera Digital',TO_DATE('2021-06-10 21:22:57','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2021-06-10 21:22:57','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 10/06/2021 21:22:57 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000265 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 10/06/2021 21:23:53 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET DisplayLogic='@TenderType@=Q',Updated=TO_DATE('2021-06-10 21:23:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007073
;

-- 10/06/2021 21:24:58 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Column SET ReadOnlyLogic=NULL,Updated=TO_DATE('2021-06-10 21:24:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001086
;

-- 10/06/2021 21:37:41 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Ref_Table SET AD_Display=3001053,Updated=TO_DATE('2021-06-10 21:37:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=3000124
;

-- 11/06/2021 20:12:10 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001142,'BilleteraDigitalTotalAmt','LAR','Total Billetera Digital','Total Billetera Digital',0,TO_DATE('2021-06-11 20:12:07','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-06-11 20:12:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 11/06/2021 20:12:10 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, PO_Description,Help,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.PO_Description,t.Help,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001142 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 11/06/2021 20:14:19 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,IsMandatory,Version,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,IsAllowCopy,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('(SELECT COALESCE(Sum(TrxAmt),0) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''Q''))',3003931,392,'LAR','N',0,'N','N',0,'N',10,'N',12,'N','N',3001142,'N','N','N','N','N','Total Billetera Digital','BilleteraDigitalTotalAmt','N',TO_DATE('2021-06-11 20:14:13','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2021-06-11 20:14:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/06/2021 20:14:19 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003931 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/06/2021 20:15:26 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007074,10,'Y','N','N',3003931,'N','Y',3000007,'N','LAR','Total Billetera Digital',100,0,'Y',TO_DATE('2021-06-11 20:15:24','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2021-06-11 20:15:24','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/06/2021 20:15:26 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007074 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/06/2021 20:15:40 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007074
;

-- 11/06/2021 21:17:14 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Ref_List SET IsActive='N',Updated=TO_DATE('2021-06-11 21:17:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000265
;

-- Registración de script
SELECT register_migration_script_lar('0178_ISSUE-80.sql', 'LAR', '') FROM dual
;
