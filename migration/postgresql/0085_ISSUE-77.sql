-- Este índice puede falla si la funcionalidad de FE ya está en producción,
-- por lo que previamente se tienen que eliminar los CAEs incorrectos
CREATE UNIQUE INDEX c_invoice_cae ON c_invoice (cae) WHERE vtocae IS NOT NULL
;

-- Registración de script
SELECT register_migration_script_lar('0085_ISSUE-77.sql', 'LAR', '')
;
