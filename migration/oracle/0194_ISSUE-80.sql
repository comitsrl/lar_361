-- 05/09/2021 10:37:34 ART
-- ISSUE #80: Movimiento de Cajas
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,AD_Client_ID,AD_Org_ID,Created,Updated,CreatedBy,UpdatedBy,IsActive) VALUES (3000074,'LAR','C','1000000','Tipo de documento con configuración contable para la salida de caja cuando se realiza un depósito. Si nulo utiliza el predeterminado para la Org.','LAR_Tipo_Documeto_ID_Depositos_Salida_Caja',1000000,0,TO_DATE('2021-09-05 10:37:33','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-09-05 10:37:33','YYYY-MM-DD HH24:MI:SS'),100,100,'Y')
;

-- 05/09/2021 10:37:54 ART
-- ISSUE #80: Movimiento de Cajas
UPDATE AD_SysConfig SET Value='0', Description='Tipo de documento con configuración contable para la salida de caja cuando se realiza un depósito. Si 0 utiliza el predeterminado para la Org.',Updated=TO_DATE('2021-09-05 10:37:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_SysConfig_ID=3000074
;

-- Registración de script
SELECT register_migration_script_lar('0194_ISSUE-80.sql', 'LAR', '') FROM dual
;
