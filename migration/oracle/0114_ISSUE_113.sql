-- 14/08/2018 12:15:17 ART
-- ISSUE_#113: Ajuse de contabilidad en corbos/pagos
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,AD_Client_ID,AD_Org_ID,Created,Updated,CreatedBy,UpdatedBy,IsActive) VALUES (3000034,'LAR','C','0','ID de la combinación contable de la cuenta valores a depositar','LAR_Combinacion_ID_Valores_a_Depositar',1000000,0,TO_DATE('2018-08-14 12:15:17','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2018-08-14 12:15:17','YYYY-MM-DD HH24:MI:SS'),100,100,'Y')
;

-- Registración de script
SELECT register_migration_script_lar('0114_ISSUE-113.sql', 'LAR', '') FROM dual
;
