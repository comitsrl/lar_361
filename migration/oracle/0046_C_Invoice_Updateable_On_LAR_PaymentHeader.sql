-- 31/08/2012 21:06:49 ART
-- Validación para Doctype, solo lista los que pertenezcan a la Org con la que se loggeó
UPDATE AD_Column SET IsUpdateable='Y',Updated=TO_DATE('2012-08-31 21:06:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000253
;

-- 31/08/2012 21:06:49 ART
-- Se permite la actualizacion de la factura en la cabecera de pagos
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'CannotChangePaymentHeaderInvoice', 'Can not change invoice payment header', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'No se puede cambiar la factura de la cabezera de pagos', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;
