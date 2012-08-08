-- 07/08/2012 21:39:34 ART
-- Add new callout to fix credit note behavior
UPDATE AD_Column SET Callout='org.compiere.model.CalloutInvoice.docType;ar.com.ergio.model.LAR_Callouts.documentLetter',Updated=TO_TIMESTAMP('2012-08-07 21:39:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3781
;

-- 07/08/2012 23:10:49 ART
-- Avoid updates values set by fiscal printer
UPDATE AD_Column SET IsUpdateable='N',Updated=TO_TIMESTAMP('2012-08-07 23:10:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000039
;

-- 07/08/2012 23:11:24 ART
-- Avoid updates values set by fiscal printer
UPDATE AD_Column SET IsUpdateable='N',Updated=TO_TIMESTAMP('2012-08-07 23:11:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000038
;
