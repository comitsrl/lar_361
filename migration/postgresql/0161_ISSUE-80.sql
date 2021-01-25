-- 11/01/2021 20:23:04 ART
-- ISSUE #80: Parametro para tipo de Doc. Depositos.
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,AD_Client_ID,AD_Org_ID,Created,Updated,CreatedBy,UpdatedBy,IsActive) VALUES (3000072,'LAR','C','0','Ingresar el ID del tipo de documento a utilizar para depositos bancarios.','LAR_TipoDocDeposito_ID',1000000,0,TO_TIMESTAMP('2021-01-11 20:23:02','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2021-01-11 20:23:02','YYYY-MM-DD HH24:MI:SS'),100,100,'Y')
;

-- Registración de script
SELECT register_migration_script_lar('0161_ISSUE-80.sql', 'LAR', '')
;
