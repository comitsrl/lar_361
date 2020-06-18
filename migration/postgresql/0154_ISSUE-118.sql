-- Actualizar secuencia de la tabla C_Conversion_Rate
UPDATE AD_Sequence SET currentNext = (SELECT MAX(C_Conversion_Rate_ID) FROM C_Conversion_Rate) + 1 WHERE AD_Sequence_ID = 40;

-- Registración de script
SELECT register_migration_script_lar('0154_ISSUE-118.sql', 'LAR', '')
;
