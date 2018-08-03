-- 01/08/2018 16:26:11 ART
-- ISSUE #115: Filtrar RMA por org de factura origen.
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,Created,Updated,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,IsActive) VALUES (3000033,'LAR','S','Y','Ingresar ''Y'', si se desea filtrar las RMA candidatas a facturar, por la organización de la factura origen (Ventana Generar Factura). Caso contrario, ingresar ''N''.','LAR_FiltraRMA_OrgFacturaOrigen',TO_TIMESTAMP('2018-08-01 16:26:10','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2018-08-01 16:26:10','YYYY-MM-DD HH24:MI:SS'),0,0,100,100,'Y')
;

-- Registración de script
SELECT register_migration_script_lar('0112_ISSUE-115.sql', 'LAR', '')
;
