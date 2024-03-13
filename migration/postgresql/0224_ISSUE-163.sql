UPDATE
 AD_Message_Trl
 SET msgtext = 'Existen cantidades disponibles Negativas en este Depósito'
 WHERE
 AD_Language='es_AR'
 AND ad_message_id = 53118
 ;

-- Registración de script
SELECT register_migration_script_lar('0224_ISSUE-163.sql', 'LAR', '')
;
