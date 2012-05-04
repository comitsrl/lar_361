-- 10/03/2012 21:03:10 GMT-03:00
-- Definición de entidad LAR
INSERT INTO AD_EntityType (Help,ModelPackage,Version,EntityType,Name,Description,IsActive,Updated,UpdatedBy,AD_Org_ID,AD_Client_ID,Processing,Created,CreatedBy,AD_EntityType_ID) VALUES ('Localizacion Argentina, basada en la LCO, incluye las modificaciones necesarias en para el manejo de impresoras fiscales, retenciones calculadas sobre los pagos, percepciones, y la puesta a punto del POS. Desarrollada por http://www.ergio.com.ar','ar.com.ergio.model','1.0.0.RC1','LAR','Localizacion Argentina','Localizacion Argentina desarrollada por Ergio','Y',TO_DATE('2012-03-10 21:03:09','YYYY-MM-DD HH24:MI:SS'),100,0,0,'N',TO_DATE('2012-03-10 21:03:09','YYYY-MM-DD HH24:MI:SS'),100,3000000)
;

-- Mar 21, 2012 11:01:18 PM GMT-03:00
-- Definición de entidad LAR
INSERT INTO AD_ModelValidator (ModelValidationClass,EntityType,AD_ModelValidator_ID,Name,CreatedBy,AD_Client_ID,AD_Org_ID,Created,Updated,UpdatedBy,IsActive) VALUES ('ar.com.ergio.model.LAR_Validator','LAR',3000000,'Model Validator para Localizacion Argentina',100,0,0,TO_DATE('2012-03-21 23:01:17','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-03-21 23:01:17','YYYY-MM-DD HH24:MI:SS'),100,'Y')
;

