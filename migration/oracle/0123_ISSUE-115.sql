-- 13/12/2018 16:54:04 ART
-- ISSUE #115: Permitir facturar remitos con distintas direcciones.
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,AD_Client_ID,AD_Org_ID,Created,Updated,CreatedBy,UpdatedBy,IsActive) VALUES (3000041,'LAR','C','N','Ingresar ''Y'', si se desea permitir facturar remitos con distintas direcciones dentro de una misma factura, en ventana "Generar Factura". Caso contrario, ingresar ''N''.','LAR_Permite_Facturar_Remitos_Distintas_Direcciones',1000000,0,TO_DATE('2018-12-13 16:54:03','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2018-12-13 16:54:03','YYYY-MM-DD HH24:MI:SS'),100,100,'Y')
;

-- Registración de script
SELECT register_migration_script_lar('0123_ISSUE-115.sql', 'LAR', '') FROM dual
;
