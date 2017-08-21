-- 18/08/2017 19:13:33 ART
-- ISSUE #89: Sobrescribir DocumentNo del pago/cobro.
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,AD_Client_ID,AD_Org_ID,Created,Updated,CreatedBy,UpdatedBy,IsActive) VALUES (3000022,'LAR','S','N','Ingresar Y, si desea sobrescribir el DocumentNo del cobro/pago con el nro de cupon de posnet. Caso contrario, ingrese N.','LAR_Sobrescribir_DocumentNo_Pago/Cobro',0,0,TO_DATE('2017-08-18 19:13:33','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2017-08-18 19:13:33','YYYY-MM-DD HH24:MI:SS'),100,100,'Y')
;

-- Registración de script
SELECT register_migration_script_lar('0094_ISSUE-89.sql', 'LAR', '')
;
