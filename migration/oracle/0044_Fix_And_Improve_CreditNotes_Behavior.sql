-- 07/08/2012 21:39:34 ART
-- Add new callout to fix credit note behavior
UPDATE AD_Column SET Callout='org.compiere.model.CalloutInvoice.docType;ar.com.ergio.model.LAR_Callouts.documentLetter',Updated=TO_DATE('2012-08-07 21:39:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3781
;

-- 08/08/2012 11:44:49 ART
-- Avoid updates values setted by fiscal printer
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2012-08-08 11:44:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000025
;

-- 08/08/2012 11:45:02 ART
-- Avoid updates values setted by fiscal printer
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2012-08-08 11:45:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000026
;
