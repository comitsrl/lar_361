-- Se agrega columna IsOnDrawer a vista C_Payment_V
CREATE OR REPLACE VIEW c_payment_v AS 
 SELECT c_payment.c_payment_id,
    c_payment.ad_client_id,
    c_payment.ad_org_id,
    c_payment.isactive,
    c_payment.created,
    c_payment.createdby,
    c_payment.updated,
    c_payment.updatedby,
    c_payment.documentno,
    c_payment.datetrx,
    c_payment.isreceipt,
    c_payment.c_doctype_id,
    c_payment.trxtype,
    c_payment.c_bankaccount_id,
    c_payment.c_bpartner_id,
    c_payment.c_invoice_id,
    c_payment.c_bp_bankaccount_id,
    c_payment.c_paymentbatch_id,
    c_payment.tendertype,
    c_payment.creditcardtype,
    c_payment.creditcardnumber,
    c_payment.creditcardvv,
    c_payment.creditcardexpmm,
    c_payment.creditcardexpyy,
    c_payment.micr,
    c_payment.routingno,
    c_payment.accountno,
    c_payment.checkno,
    c_payment.a_name,
    c_payment.a_street,
    c_payment.a_city,
    c_payment.a_state,
    c_payment.a_zip,
    c_payment.a_ident_dl,
    c_payment.a_ident_ssn,
    c_payment.a_email,
    c_payment.voiceauthcode,
    c_payment.orig_trxid,
    c_payment.ponum,
    c_payment.c_currency_id,
    c_payment.c_conversiontype_id,
        CASE c_payment.isreceipt
            WHEN 'Y'::bpchar THEN c_payment.payamt
            ELSE c_payment.payamt * (-1)::numeric
        END AS payamt,
        CASE c_payment.isreceipt
            WHEN 'Y'::bpchar THEN c_payment.discountamt
            ELSE c_payment.discountamt * (-1)::numeric
        END AS discountamt,
        CASE c_payment.isreceipt
            WHEN 'Y'::bpchar THEN c_payment.writeoffamt
            ELSE c_payment.writeoffamt * (-1)::numeric
        END AS writeoffamt,
        CASE c_payment.isreceipt
            WHEN 'Y'::bpchar THEN c_payment.taxamt
            ELSE c_payment.taxamt * (-1)::numeric
        END AS taxamt,
        CASE c_payment.isreceipt
            WHEN 'Y'::bpchar THEN c_payment.overunderamt
            ELSE c_payment.overunderamt * (-1)::numeric
        END AS overunderamt,
        CASE c_payment.isreceipt
            WHEN 'Y'::bpchar THEN 1
            ELSE (-1)
        END AS multiplierap,
    c_payment.isoverunderpayment,
    c_payment.isapproved,
    c_payment.r_pnref,
    c_payment.r_result,
    c_payment.r_respmsg,
    c_payment.r_authcode,
    c_payment.r_avsaddr,
    c_payment.r_avszip,
    c_payment.r_info,
    c_payment.processing,
    c_payment.oprocessing,
    c_payment.docstatus,
    c_payment.docaction,
    c_payment.isprepayment,
    c_payment.c_charge_id,
    c_payment.isreconciled,
    c_payment.isallocated,
    c_payment.isonline,
    c_payment.processed,
    c_payment.posted,
    c_payment.c_campaign_id,
    c_payment.c_project_id,
    c_payment.c_activity_id,
    c_payment.esretencioniibb,
    c_payment.isondrawer
   FROM c_payment;

ALTER TABLE c_payment_v
  OWNER TO adempiere;

ALTER TABLE LAR_RetiroCajaLine ADD COLUMN C_Payment_ID numeric(10,0);

-- 02/10/2018 16:18:12 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003016,3000082,'LAR',0,'N','N','N','The Payment is a unique identifier of this payment.','N',10,'N',19,'N',1384,'N','Y','N','Payment identifier','Payment','C_Payment_ID',100,TO_TIMESTAMP('2018-10-02 16:18:09','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2018-10-02 16:18:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/10/2018 16:18:12 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003016 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/10/2018 16:19:23 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005761,10,'Y','N','N',3003016,'N','Y',3000128,'N','The Payment is a unique identifier of this payment.','LAR','Payment identifier','Payment',100,0,TO_TIMESTAMP('2018-10-02 16:19:23','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-10-02 16:19:23','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/10/2018 16:19:23 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005761 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/10/2018 16:19:35 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3005761
;

-- 02/10/2018 16:19:35 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3002798
;

-- 02/10/2018 16:19:35 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3002794
;

-- 02/10/2018 16:20:48 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=''Z''',Updated=TO_TIMESTAMP('2018-10-02 16:20:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005761
;

-- 02/10/2018 16:31:28 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Cheque',Description='Cheque Original',Help=NULL,Updated=TO_TIMESTAMP('2018-10-02 16:31:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005761 AND AD_Language='es_AR'
;

-- 02/10/2018 16:31:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET IsCentrallyMaintained='N', IsReadOnly='Y',Updated=TO_TIMESTAMP('2018-10-02 16:31:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005761
;

-- Registración de script
SELECT register_migration_script_lar('0116_ISSUE-80.sql', 'LAR', '')
;
