-- 25/09/2017 23:49:36 ART
-- ISSUE #87: Parametros globales para validación de CUIT/DNI
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,AD_Client_ID,AD_Org_ID,Created,Updated,CreatedBy,UpdatedBy,IsActive) VALUES (3000024,'LAR','S','Y','Ingresar Y, si desea chuequear que el CUIT ingresado es Valido. Caso contrario, ingresar N.','LAR_ValidarCuitSdN',0,0,TO_TIMESTAMP('2017-09-25 23:49:35','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2017-09-25 23:49:35','YYYY-MM-DD HH24:MI:SS'),100,100,'Y')
;

-- 25/09/2017 23:51:28 ART
-- ISSUE #87: Parametros globales para validación de CUIT/DNI
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,AD_Client_ID,AD_Org_ID,Created,Updated,CreatedBy,UpdatedBy,IsActive) VALUES (3000025,'LAR','S','N','Ingresar Y, si desea perimitir que se ingrese el mismo CUIT/DNI para mas de un SdN. Caso contrario, ingresar N.','LAR_PermitirDuplicidadCuit/Dni',0,0,TO_TIMESTAMP('2017-09-25 23:51:28','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2017-09-25 23:51:28','YYYY-MM-DD HH24:MI:SS'),100,100,'Y')
;

-- Registración de script
SELECT register_migration_script_lar('0097_ISSUE-87.sql', 'LAR', '')
;
