/* Tipos de Documento a Emitir según el Tipo de Contribuyente
Author: ACF - OPENBIZ
Fecha: 12/11/2008
*/

-- Inserta regla de validacion para dropdown de Tipo de documento (ventana Facturas) segun sea el tipo de contribuyente que emite y recibe la factura
INSERT INTO AD_Val_Rule(ad_val_rule_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, type, code, entitytype)
  VALUES (
           (SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID = 26),
 0, 0, 'Y', '2011-01-10 16:59:24.0', 100, '2011-01-11 12:49:14.0', 100, 'C_DocType segun Contribuyente', NULL, 'S', 'C_DocType.DocBaseType IN (''ARI'', ''API'',''ARC'',''APC'') AND (((C_DocType.C_DocType_ID IN (SELECT dt.C_DocType_ID FROM C_DocType dt INNER JOIN LAR_DocTypeRule dtr ON (dtr.C_DocType_ID = dt.C_DocType_ID) WHERE dtr.LAR_TipoContribTo_ID = (SELECT LAR_TipoContribuyente_ID FROM C_BPartner WHERE C_BPartner_ID=@C_BPartner_ID@) AND dtr.LAR_TipoContribFrom_ID =(SELECT LAR_TipoContribuyente_ID FROM AD_OrgInfo WHERE AD_Org_ID=@#AD_Org_ID@) ) AND C_DocType.DocBaseType IN (''ARI'',''ARC'')) AND ''@IsSOTrx@''=''Y'') OR ((C_DocType.C_DocType_ID IN (SELECT dt.C_DocType_ID FROM C_DocType dt INNER JOIN LAR_DocTypeRule dtr ON (dtr.C_DocType_ID = dt.C_DocType_ID) WHERE dtr.LAR_TipoContribFrom_ID = (SELECT LAR_TipoContribuyente_ID FROM C_BPartner WHERE C_BPartner_ID=@C_BPartner_ID@) AND dtr.LAR_TipoContribTo_ID =(SELECT LAR_TipoContribuyente_ID FROM AD_OrgInfo WHERE AD_Org_ID=@#AD_Org_ID@) ) AND C_DocType.DocBaseType IN (''API'',''APC'')) AND ''@IsSOTrx@''=''N''))', 'LAR');


-- Actualiza la regla de validacion de la columna C_Invoice.C_DocTypeTarget_ID
UPDATE AD_Column SET  AD_Val_Rule_ID = (SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID = 26)
 WHERE AD_Table_ID=318 AND ColumnName = 'C_DocTypeTarget_ID';

-- Incrementa AD_Sequence para AD_Val_Rule
UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID = 26;
