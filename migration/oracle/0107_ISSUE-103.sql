-- Corrección tipo de columna
﻿ALTER TABLE M_RmaLine ALTER COLUMN PriceList TYPE numeric;

-- Registración de script
SELECT register_migration_script_lar('0107_ISSUE-103.sql', 'LAR', '') FROM dual
;
