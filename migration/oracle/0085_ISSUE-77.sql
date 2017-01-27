-- Este índice puede fallar si la funcionalidad de FE ya está en producción,
-- por lo que previamente se tienen que eliminar los CAEs incorrectos
CREATE UNIQUE INDEX c_invoice_cae ON c_invoice (cae) WHERE vtocae IS NOT NULL
;

-- Este índice puede fallar si en la tabla de facturas existen documentos duplicados,
-- por lo que previamente se tienen que eliminar esos documentos duplicados
CREATE UNIQUE INDEX c_invoice_documentno_lar ON c_invoice(documentno, c_doctype_id) WHERE isSOTrx = 'Y'
;

-- http://2.bp.blogspot.com/-5OckJuD3WT4/Tmg2U1-8vuI/AAAAAAAAAIs/yQeSsE9Sjdo/s1600/muestra%2Btusam%255B1%255D.JPG
-- :-D

-- Registración de script
SELECT register_migration_script_lar('0085_ISSUE-77.sql', 'LAR', '')
;
