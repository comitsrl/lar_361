-- 25/05/2025 11:43:05 ART
-- ISSUE #169: Régimen de Retenciones: Nuevas config.
INSERT INTO LAR_Concepto_Ret_Ganancias (LAR_Concepto_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Alicuota_Inscripto,Alicuota_No_Inscripto,Calculo_Por_Escala,Importe_No_Sujeto_Inscripto,Importe_No_Sujeto_No_Insc,Importe_Ret_Minima_Inscripto,Importe_Ret_Minima_No_Insc,Description) VALUES (1000025,1000000,0,'Y',TO_DATE('2025-05-25 11:43:05','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2025-05-25 11:43:05','YYYY-MM-DD HH24:MI:SS'),100,'M','Proveedores que emiten comprobantes M',6.000000000000,6.000000000000,'N',0,0,0,0,'Proveedores que emiten comprobantes M')
;

-- Registración de script
SELECT register_migration_script_lar('0235_ISSUE-169.sql', 'LAR', '') FROM dual
;
