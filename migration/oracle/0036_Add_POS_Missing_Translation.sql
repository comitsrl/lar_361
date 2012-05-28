-- PrintingFiscalDocument
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'PrintingFiscalDocument', 'Printing fiscal document', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Imprimiendo documento fiscal', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9; -- AD_Message

-- VoidInvoice
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'VoidInvoice', 'Void invoice', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Anular factura', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- VoidingInvoice
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'VoidingInvoice', 'Voiding invoice', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Anulando factura', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- PleaseWait
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'PleaseWait', 'Please wait', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Por favor espere', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- SavePosOrderChanges?
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'SavePosOrderChanges?', 'Save POS Order changes?', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, '¿Desea guardar los cambios de la orden PDV?', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- AttributeSetInstanceSaved
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'AttributeSetInstanceSaved', 'Attribute set instance saved', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Conjuto de atributos de instancia guardados', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- AttributeSetInstanceSavedError
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'AttributeSetInstanceSavedError', 'Attribute set instance saved error', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Error al guardar conjuto de atributos de instancia', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- PrintingTicket
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'PrintingTicket', 'Printing ticket', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Imprimiendo factura fiscal', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- PosPaymentCancel
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'PosPaymentCancel', 'Cancel payment', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Pago cancelado', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- Cashier
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Cashier', 'Cashier', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Cajero', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- Customer
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Customer', 'Customer', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Cliente', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- TOTAL
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'TOTAL', 'TOTAL', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'TOTAL', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- Reprint
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Reprint', 'Reprint', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Reimprimir', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- PaymentTerms
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'PaymentTerms', 'Payment terms', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Términos de pago', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- CVC
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'CVC', 'Verification code', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Código de verificación', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- CheckingFiscalPrinterStatus
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'CheckingFiscalPrinterStatus', 'Checking fiscal printer status', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Verificando estado de impresora fiscal', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- WaitingFiscalPrinterConnection
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'WaitingFiscalPrinterConnection', 'Waiting fiscal printer connection', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Esperando conexión con impresora fiscal', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- FiscalPrinterBusy
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'FiscalPrinterBusy', 'Fiscal printer busy', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Impresora fiscal opcupada', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- ConnectingFiscalPrinter
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'ConnectingFiscalPrinter', 'Connecting fiscal printer', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Conectando con impresora fiscal', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- UnexpectedIOError
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'UnexpectedIOError', 'Unexpected communication error', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Error de comunicación inesperado', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- FiscalPrinterStatusError
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'FiscalPrinterStatusError', 'Fiscal printer status error', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Error en el estado de la impresora fiscal.', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- FiscalPrinterClassNotFound
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'FiscalPrinterClassNotFound', 'Fiscal printer driver not found', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'No se encontró el controlador para la impresora fiscal', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- FiscalPrinterInstanciationError
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'FiscalPrinterInstanciationError', 'Fiscal printer driver instanciation error', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Error en la instanciación del controlador para la impresora fiscal', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- FiscalPrinterIOError
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'FiscalPrinterIOError', 'Fiscal printer communication error', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Error en la comunicación con la impresora fiscal', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- FiscalPrinterBusyTimeoutError
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'FiscalPrinterBusyTimeoutError', 'Fiscal printer busy timeout exhausted. Try again', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Tiempo de espera por impresora fiscal ocupada agotado. Intente nuevamente', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- FiscalPrinterIdle
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'FiscalPrinterIdle', 'Fiscal printer idle', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Impresora fiscal disponible', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- FiscalPrinterControlPanel
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'FiscalPrinterControlPanel', 'Fiscal printer control panel', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Panel de control de impresoras fiscales', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- FiscalPrinterConnected
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'FiscalPrinterConnected', 'Fiscal printer connected', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Impresora fiscal conectada', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- PrintFiscalDocumentError
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'PrintFiscalDocumentError', 'Print fiscal document error', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Error al imprimir el documento fiscal.', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- DocumentValidationError
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'DocumentValidationError', 'Document validation error', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Error al validar documento fiscal', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- FiscalPrintEndedOk
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'FiscalPrintEndedOk', 'Fiscal print ended ok', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Impresión fiscal finalizada con éxito', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- DeletePosOrder?
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'DeletePosOrder?', 'Delete POS Order?', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, '¿Desea eliminar la orden PDV?', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- ProductWithoutAttributSet
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'ProductWithoutAttributSet', 'Product without attribut set', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Producto sin conjunto de atributos', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- FiscalTicketCheckPayment
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'FiscalTicketCheckPayment', 'Check', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Cheque', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- FiscalTicketTransferPayment
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'FiscalTicketTransferPayment', 'Transfer', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Transferencia', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- FiscalTicketOthersPayment
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'FiscalTicketOthersPayment', 'Others', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Otro', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- FiscalAlreadyPrintedError
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'FiscalAlreadyPrintedError', 'Fiscal ticket already printed', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Documento fiscal ya impreso', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- MandatoryDataFiscalCloseError
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'MandatoryDataFiscalCloseError', 'Missing mandatory fiscal closed data', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Faltan datos para realizar el cierre fiscal', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- DocTypeNotFiscalError
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'DocTypeNotFiscalError', 'Document type is no fiscal', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Tipo de documento no fiscal', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- FiscalCloseError
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'FiscalCloseError', 'Fiscal close error', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Error en cierre fiscal', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- ExecutingFiscalCommands
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'ExecutingFiscalCommands', 'Executing fiscal commands', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Ejecución de comandos fiscales', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- PrinterErrorConfirm
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'PrinterErrorConfirm', 'Fiscal printer in error state', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'La impresora fiscal se encuentra en estado de error', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- PrinterErrorConfirmMsg
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'PrinterErrorConfirmMsg', 'The fiscal printer was in error state after its last use. It is possible that the device has been recovered from this error and can continue printing. Attempt to continue printing?', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'La impresora fiscal quedó en estado de error luego de su última utilización. Es posible que el dispositivo se haya recuperado de este error y se pueda continuar con la impresión. Desea intentar continuar con la impresión?', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- ActionEndedOk
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'ActionEndedOk', 'Action completed ok', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Acción completada correctamente', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- ActionEndedWrong
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'ActionEndedWrong', 'Action completed wrong', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Acción completada incorrectamente', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- FiscalCloseType
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'FiscalCloseType', 'Fiscal close type', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgtext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'Tipo de cierre fiscal', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;

-- CannotDeletePosOrder
INSERT INTO ad_message(ad_message_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, msgtext, msgtip, msgtype, entitytype)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'CannotDeletePosOrder', 'Can not delete POS order', null, 'I', 'LAR');

INSERT INTO ad_message_trl(ad_message_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, msgt
ext, msgtip, istranslated)
    VALUES ((SELECT CurrentNext FROM AD_Sequence WHERE AD_Sequence_ID=9), 'es_AR', 1000000, 0, 'Y', getdate(), 100, getdate(), 100, 'No se puedo eliminar la orden PDV', null, 'Y');

UPDATE AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=9;
