-- ISSUE #174: Permite volver a la lógica contable nativa previa a ISSUE-174
-- para clientes específicos, sin desactivar la funcionalidad para el resto.

INSERT INTO AD_SysConfig
(
    AD_SysConfig_ID,
    EntityType,
    ConfigurationLevel,
    Value,
    Description,
    Name,
    AD_Client_ID,
    AD_Org_ID,
    Created,
    Updated,
    CreatedBy,
    UpdatedBy,
    IsActive
)
SELECT
    3000091,
    'LAR',
    'C',
    'N',
    'Ingresar Y para utilizar la contabilidad nativa previa a ISSUE-174 en Pagos, Asignaciones y Estados de Cuenta.',
    'LAR_UseLegacyNativeAccounting',
    1000000,
    0,
    now(),
    now(),
    100,
    100,
    'Y'
WHERE NOT EXISTS
(
    SELECT 1
      FROM AD_SysConfig
     WHERE Name = 'LAR_UseLegacyNativeAccounting'
       AND AD_Client_ID = 1000000
       AND AD_Org_ID = 0
);

UPDATE AD_SysConfig
   SET Value = COALESCE(Value, 'N'),
       Description = 'Ingresar Y para utilizar la contabilidad nativa previa a ISSUE-174 en Pagos, Asignaciones y Estados de Cuenta.',
       Updated = now(),
       UpdatedBy = 100
 WHERE Name = 'LAR_UseLegacyNativeAccounting'
   AND AD_Client_ID = 1000000
   AND AD_Org_ID = 0;

SELECT register_migration_script_lar('0247_ISSUE-174.sql', 'LAR', '')
;
