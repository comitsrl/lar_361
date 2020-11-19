-- 03/11/2020 20:10:46 ART
-- ISSUE #136: Parametro cambio automatico de campos en Collaut.
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,AD_Client_ID,AD_Org_ID,Created,Updated,CreatedBy,UpdatedBy,IsActive) VALUES (3000070,'LAR','C','Y','Ingresando Y se activa el cambio automatico de los campos PaymentRule y PaymentTerm en los CalloutOrder y CalloutInvoice','LAR_PaymentRule_PaymentTerm_Automatico',1000000,0,TO_DATE('2020-11-03 20:10:46','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2020-11-03 20:10:46','YYYY-MM-DD HH24:MI:SS'),100,100,'Y')
;

-- Registración de script
SELECT register_migration_script_lar('0159_ISSUE-136.sql', 'LAR', '') FROM dual
;
