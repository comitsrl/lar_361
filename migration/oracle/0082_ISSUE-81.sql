-- DATOS
-- Conceptos Sujetos a Retención de Ganancias

-- 22/12/2016 11:51:36 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Concepto_Ret_Ganancias (LAR_Concepto_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Description,Alicuota_Inscripto,Alicuota_No_Inscripto,Calculo_Por_Escala,Importe_No_Sujeto_Inscripto,Importe_No_Sujeto_No_Insc,Importe_Ret_Minima_Inscripto,Importe_Ret_Minima_No_Insc) VALUES (1000000,1000000,0,'Y',TO_DATE('2016-12-22 11:51:36','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 11:51:36','YYYY-MM-DD HH24:MI:SS'),100,'19','Intereses por operaciones realizadas en entidades financieras.','Intereses por operaciones realizadas en entidades financieras. Ley N° 21.526 y sus modificaciones o agentes de bolsa o mercado abierto. Anexo II, inc. a) pto 1)',3.000000000000,10.000000000000,'N',0,0,90.000000000000,450.000000000000)
;

-- 22/12/2016 11:53:38 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
DELETE FROM AD_Preference WHERE AD_Client_ID=1000000 AND AD_Org_ID=0 AND AD_User_ID IS NULL AND AD_Window_ID=3000064 AND Attribute='Importe_Ret_Minima_Inscripto'
;

-- 22/12/2016 11:53:38 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Preference (AD_Preference_ID, AD_Client_ID, AD_Org_ID, IsActive, Created,CreatedBy,Updated,UpdatedBy,AD_Window_ID, AD_User_ID, Attribute, Value) VALUES (1000023,1000000,0, 'Y',SysDate,100,SysDate,100, 3000064,NULL,'Importe_Ret_Minima_Inscripto','90.000000000000')
;

-- 22/12/2016 11:56:26 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Concepto_Ret_Ganancias (LAR_Concepto_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Description,Alicuota_Inscripto,Alicuota_No_Inscripto,Calculo_Por_Escala,Importe_No_Sujeto_Inscripto,Importe_No_Sujeto_No_Insc,Importe_Ret_Minima_Inscripto,Importe_Ret_Minima_No_Insc) VALUES (1000001,1000000,0,'Y',TO_DATE('2016-12-22 11:56:26','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 11:56:26','YYYY-MM-DD HH24:MI:SS'),100,'21','Intereses originados en operaciones no comprendidas en el punto 1.','Intereses originados en operaciones no comprendidas en el punto 1. Anexo II, inc. a) pto. 2)',6.000000000000,28.000000000000,'N',3500.000000000000,0,90.000000000000,90.000000000000)
;

-- 22/12/2016 11:56:43 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET Importe_Ret_Minima_No_Insc=90.000000000000,Updated=TO_DATE('2016-12-22 11:56:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000000
;

-- 22/12/2016 11:56:50 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
DELETE FROM AD_Preference WHERE AD_Client_ID=1000000 AND AD_Org_ID=0 AND AD_User_ID IS NULL AND AD_Window_ID=3000064 AND Attribute='Importe_Ret_Minima_No_Insc'
;

-- 22/12/2016 11:56:50 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO AD_Preference (AD_Preference_ID, AD_Client_ID, AD_Org_ID, IsActive, Created,CreatedBy,Updated,UpdatedBy,AD_Window_ID, AD_User_ID, Attribute, Value) VALUES (1000024,1000000,0, 'Y',SysDate,100,SysDate,100, 3000064,NULL,'Importe_Ret_Minima_No_Insc','90.000000000000')
;

-- 22/12/2016 12:02:56 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Concepto_Ret_Ganancias (LAR_Concepto_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Description,Alicuota_Inscripto,Alicuota_No_Inscripto,Calculo_Por_Escala,Importe_No_Sujeto_Inscripto,Importe_No_Sujeto_No_Insc,Importe_Ret_Minima_Inscripto,Importe_Ret_Minima_No_Insc) VALUES (1000002,1000000,0,'Y',TO_DATE('2016-12-22 12:02:55','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 12:02:55','YYYY-MM-DD HH24:MI:SS'),100,'30','Alquileres o arrendamientos de bienes muebles.','Alquileres o arrendamientos de bienes muebles. Anexo II, inc. b) pto. 1)',6.000000000000,28.000000000000,'N',5000.000000000000,0,90.000000000000,90.000000000000)
;

-- 22/12/2016 12:07:53 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Concepto_Ret_Ganancias (LAR_Concepto_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Description,Alicuota_Inscripto,Alicuota_No_Inscripto,Calculo_Por_Escala,Importe_No_Sujeto_Inscripto,Importe_No_Sujeto_No_Insc,Importe_Ret_Minima_Inscripto,Importe_Ret_Minima_No_Insc) VALUES (1000003,1000000,0,'Y',TO_DATE('2016-12-22 12:07:53','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 12:07:53','YYYY-MM-DD HH24:MI:SS'),100,'31','Alquileres o arrendamientos de bienes Inmuebles Urbanos','Bienes Inmuebles Urbanos, incluidos los efectuados bajo la modalidad de leasing, —incluye suburbanos— Anexo II, Inc. b) pto. 2)',6.000000000000,28.000000000000,'N',5000.000000000000,0,90.000000000000,450.000000000000)
;

-- 22/12/2016 12:08:03 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET IsActive='N',Updated=TO_DATE('2016-12-22 12:08:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000000
;

-- 22/12/2016 12:08:06 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET IsActive='N',Updated=TO_DATE('2016-12-22 12:08:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000001
;

-- 22/12/2016 12:10:56 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Concepto_Ret_Ganancias (LAR_Concepto_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Description,Alicuota_Inscripto,Alicuota_No_Inscripto,Calculo_Por_Escala,Importe_No_Sujeto_Inscripto,Importe_No_Sujeto_No_Insc,Importe_Ret_Minima_Inscripto,Importe_Ret_Minima_No_Insc) VALUES (1000004,1000000,0,'Y',TO_DATE('2016-12-22 12:10:56','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 12:10:56','YYYY-MM-DD HH24:MI:SS'),100,'32','Alquileres o arrendamientos de bienes Inmuebles Rurales','Bienes Inmuebles Rurales, incluidos los efectuados bajo la modalidad de leasing, —incluye subrurales— Anexo II, inc. b) pto. 3)',6.000000000000,28.000000000000,'N',5000.000000000000,0,90.000000000000,90.000000000000)
;

-- 22/12/2016 12:12:28 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Concepto_Ret_Ganancias (LAR_Concepto_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Description,Alicuota_Inscripto,Alicuota_No_Inscripto,Calculo_Por_Escala,Importe_No_Sujeto_Inscripto,Importe_No_Sujeto_No_Insc,Importe_Ret_Minima_Inscripto,Importe_Ret_Minima_No_Insc) VALUES (1000005,1000000,0,'N',TO_DATE('2016-12-22 12:12:28','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 12:12:28','YYYY-MM-DD HH24:MI:SS'),100,'35','Regalías','Anexo II, inc. c)',6.000000000000,28.000000000000,'N',3500.000000000000,0,90.000000000000,90.000000000000)
;

-- 22/12/2016 12:14:12 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Concepto_Ret_Ganancias (LAR_Concepto_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Description,Alicuota_Inscripto,Alicuota_No_Inscripto,Calculo_Por_Escala,Importe_No_Sujeto_Inscripto,Importe_No_Sujeto_No_Insc,Importe_Ret_Minima_Inscripto,Importe_Ret_Minima_No_Insc) VALUES (1000006,1000000,0,'N',TO_DATE('2016-12-22 12:14:12','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 12:14:12','YYYY-MM-DD HH24:MI:SS'),100,'43','Interés accionario, excedentes y retornos','Interés accionario, excedentes y retornos distribuidos entre asociados, cooperativas, —excepto consumo— Anexo II, inc. d)',6.000000000000,28.000000000000,'N',3500.000000000000,0,90.000000000000,90.000000000000)
;

-- 22/12/2016 12:15:50 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Concepto_Ret_Ganancias (LAR_Concepto_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Description,Alicuota_Inscripto,Alicuota_No_Inscripto,Calculo_Por_Escala,Importe_No_Sujeto_Inscripto,Importe_No_Sujeto_No_Insc,Importe_Ret_Minima_Inscripto,Importe_Ret_Minima_No_Insc) VALUES (1000007,1000000,0,'Y',TO_DATE('2016-12-22 12:15:50','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 12:15:50','YYYY-MM-DD HH24:MI:SS'),100,'51','Abandono o no ejercicio de una actividad','Obligaciones de no hacer, o por abandono o no ejercicio de una actividad. Anexo II, inc. e)',6.000000000000,28.000000000000,'N',3500.000000000000,0,90.000000000000,90.000000000000)
;

-- 22/12/2016 12:15:54 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET IsActive='N',Updated=TO_DATE('2016-12-22 12:15:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000007
;

-- 22/12/2016 12:16:54 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Concepto_Ret_Ganancias (LAR_Concepto_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Description,Alicuota_Inscripto,Alicuota_No_Inscripto,Calculo_Por_Escala,Importe_No_Sujeto_Inscripto,Importe_No_Sujeto_No_Insc,Importe_Ret_Minima_Inscripto,Importe_Ret_Minima_No_Insc) VALUES (1000008,1000000,0,'Y',TO_DATE('2016-12-22 12:16:54','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 12:16:54','YYYY-MM-DD HH24:MI:SS'),100,'78','Enajenación de bienes muebles y bienes de cambio.','Enajenación de bienes muebles y bienes de cambio. Anexo II, inc. f)',2.000000000000,10.000000000000,'N',100000.000000000000,0,90.000000000000,90.000000000000)
;

-- 22/12/2016 12:19:32 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Concepto_Ret_Ganancias (LAR_Concepto_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Description,Alicuota_Inscripto,Alicuota_No_Inscripto,Calculo_Por_Escala,Importe_No_Sujeto_Inscripto,Importe_No_Sujeto_No_Insc,Importe_Ret_Minima_Inscripto,Importe_Ret_Minima_No_Insc) VALUES (1000009,1000000,0,'N',TO_DATE('2016-12-22 12:19:32','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 12:19:32','YYYY-MM-DD HH24:MI:SS'),100,'86','Transferencia temporaria o definitiva de derechos','Transferencia temporaria o definitiva de derechos de llave, marcas, patentes de invención, regalías, concesiones y similares. Anexo II, inc. g)',2.000000000000,10.000000000000,'N',100000.000000000000,0,90.000000000000,90.000000000000)
;

-- 22/12/2016 12:22:09 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Concepto_Ret_Ganancias (LAR_Concepto_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Description,Alicuota_Inscripto,Alicuota_No_Inscripto,Calculo_Por_Escala,Importe_No_Sujeto_Inscripto,Importe_No_Sujeto_No_Insc,Importe_Ret_Minima_Inscripto,Importe_Ret_Minima_No_Insc) VALUES (1000010,1000000,0,'N',TO_DATE('2016-12-22 12:22:09','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 12:22:09','YYYY-MM-DD HH24:MI:SS'),100,'110','Explotación de derechos de autor (Ley N° 11.723)','Anexo II, inc. h)',0,28.000000000000,'Y',100000.000000000000,0,90.000000000000,90.000000000000)
;

-- 22/12/2016 12:26:46 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Concepto_Ret_Ganancias (LAR_Concepto_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Description,Alicuota_Inscripto,Alicuota_No_Inscripto,Calculo_Por_Escala,Importe_No_Sujeto_Inscripto,Importe_No_Sujeto_No_Insc,Importe_Ret_Minima_Inscripto,Importe_Ret_Minima_No_Insc) VALUES (1000011,1000000,0,'Y',TO_DATE('2016-12-22 12:26:46','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 12:26:46','YYYY-MM-DD HH24:MI:SS'),100,'94','Locaciones de obra y/o servicios','Locaciones de obra y/o servicios no ejecutados en relación de dependencia no mencionados expresamente en otros incisos. Anexo II, inc. I)',2.000000000000,28.000000000000,'Y',30000.000000000000,0,90.000000000000,90.000000000000)
;

-- 22/12/2016 12:29:15 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Concepto_Ret_Ganancias (LAR_Concepto_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Description,Alicuota_Inscripto,Alicuota_No_Inscripto,Calculo_Por_Escala,Importe_No_Sujeto_Inscripto,Importe_No_Sujeto_No_Insc,Importe_Ret_Minima_Inscripto,Importe_Ret_Minima_No_Insc) VALUES (1000012,1000000,0,'N',TO_DATE('2016-12-22 12:29:15','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 12:29:15','YYYY-MM-DD HH24:MI:SS'),100,'25','Comisiones u otras retribuciones','Comisiones u otras retribuciones derivadas de la actividad de comisionista, rematador, consignatario y demás auxiliares de comercio a que se refiere el inciso c) del artículo 49 de la LIG. Anexo II, inc. j)',0,28.000000000000,'Y',7500.000000000000,0,90.000000000000,90.000000000000)
;

-- 22/12/2016 12:29:21 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET Calculo_Por_Escala='N',Updated=TO_DATE('2016-12-22 12:29:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000011
;

-- 22/12/2016 12:34:30 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Concepto_Ret_Ganancias (LAR_Concepto_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Description,Alicuota_Inscripto,Alicuota_No_Inscripto,Calculo_Por_Escala,Importe_No_Sujeto_Inscripto,Importe_No_Sujeto_No_Insc,Importe_Ret_Minima_Inscripto,Importe_Ret_Minima_No_Insc) VALUES (1000013,1000000,0,'Y',TO_DATE('2016-12-22 12:34:30','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 12:34:30','YYYY-MM-DD HH24:MI:SS'),100,'116a','Honorarios de director','Honorarios de director de SAs, síndico, fiduciario, consejero de sociedades cooperativas, integrante de consejos de vigilancia y socios administradores de las SRL en comandita simple y en comandita por acciones.Anexo II, inc. k)',0,28.000000000000,'Y',30000.000000000000,0,90.000000000000,90.000000000000)
;

-- 22/12/2016 12:34:36 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET IsActive='N',Updated=TO_DATE('2016-12-22 12:34:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000013
;

-- 22/12/2016 12:35:33 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Concepto_Ret_Ganancias (LAR_Concepto_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Description,Alicuota_Inscripto,Alicuota_No_Inscripto,Calculo_Por_Escala,Importe_No_Sujeto_Inscripto,Importe_No_Sujeto_No_Insc,Importe_Ret_Minima_Inscripto,Importe_Ret_Minima_No_Insc) VALUES (1000014,1000000,0,'Y',TO_DATE('2016-12-22 12:35:33','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 12:35:33','YYYY-MM-DD HH24:MI:SS'),100,'116b','Profesionales liberales, oficios','Profesionales liberales, oficios, albacea, mandatario, gestor de negocio. Anexo II, inc. k)',0,28.000000000000,'Y',7500.000000000000,0,90.000000000000,90.000000000000)
;

-- 22/12/2016 12:37:03 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Concepto_Ret_Ganancias (LAR_Concepto_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Description,Alicuota_Inscripto,Alicuota_No_Inscripto,Calculo_Por_Escala,Importe_No_Sujeto_Inscripto,Importe_No_Sujeto_No_Insc,Importe_Ret_Minima_Inscripto,Importe_Ret_Minima_No_Insc) VALUES (1000015,1000000,0,'N',TO_DATE('2016-12-22 12:37:03','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 12:37:03','YYYY-MM-DD HH24:MI:SS'),100,'124','Corredor, viajante de comercio y despachante de aduana','Corredor, viajante de comercio y despachante de aduana. En todos los casos, con las salvedades mencionadas en dicho inciso. Anexo II, inc. k)',0,28.000000000000,'Y',7500.000000000000,0,90.000000000000,90.000000000000)
;

-- 22/12/2016 12:38:35 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Concepto_Ret_Ganancias (LAR_Concepto_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Description,Alicuota_Inscripto,Alicuota_No_Inscripto,Calculo_Por_Escala,Importe_No_Sujeto_Inscripto,Importe_No_Sujeto_No_Insc,Importe_Ret_Minima_Inscripto,Importe_Ret_Minima_No_Insc) VALUES (1000016,1000000,0,'Y',TO_DATE('2016-12-22 12:38:35','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 12:38:35','YYYY-MM-DD HH24:MI:SS'),100,'95','Transporte de carga nacional e internacional','Operaciones de transporte de carga nacional e internacional. Anexo II, inc. I)',0.250000000000,28.000000000000,'N',30000.000000000000,0,90.000000000000,90.000000000000)
;

-- 22/12/2016 12:41:03 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Concepto_Ret_Ganancias (LAR_Concepto_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Description,Alicuota_Inscripto,Alicuota_No_Inscripto,Calculo_Por_Escala,Importe_No_Sujeto_Inscripto,Importe_No_Sujeto_No_Insc,Importe_Ret_Minima_Inscripto,Importe_Ret_Minima_No_Insc) VALUES (1000017,1000000,0,'N',TO_DATE('2016-12-22 12:41:03','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 12:41:03','YYYY-MM-DD HH24:MI:SS'),100,'53','Operaciones realizadas por intermedio de mercados de cereales','Operaciones realizadas por intermedio de mercados de cereales a término que se resuelvan en el curso del término (arbitrajes) y de mercados de futuros y opciones. Anexo II, inc. m)',0.500000000000,2.000000000000,'N',0,0,90.000000000000,90.000000000000)
;

-- 22/12/2016 12:42:44 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Concepto_Ret_Ganancias (LAR_Concepto_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Description,Alicuota_Inscripto,Alicuota_No_Inscripto,Calculo_Por_Escala,Importe_No_Sujeto_Inscripto,Importe_No_Sujeto_No_Insc,Importe_Ret_Minima_Inscripto,Importe_Ret_Minima_No_Insc) VALUES (1000018,1000000,0,'Y',TO_DATE('2016-12-22 12:42:44','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 12:42:44','YYYY-MM-DD HH24:MI:SS'),100,'55','Distribución de películas. Transmisión de programación. Televisión vía satelital.','Distribución de películas. Transmisión de programación. Televisión vía satelital. Anexo II, inc. n)',0.500000000000,2.000000000000,'N',0,0,90.000000000000,90.000000000000)
;

-- 22/12/2016 12:42:50 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET IsActive='N',Updated=TO_DATE('2016-12-22 12:42:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000018
;

-- 22/12/2016 12:44:47 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Concepto_Ret_Ganancias (LAR_Concepto_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Description,Alicuota_Inscripto,Alicuota_No_Inscripto,Calculo_Por_Escala,Importe_No_Sujeto_Inscripto,Importe_No_Sujeto_No_Insc,Importe_Ret_Minima_Inscripto,Importe_Ret_Minima_No_Insc) VALUES (1000019,1000000,0,'Y',TO_DATE('2016-12-22 12:44:47','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 12:44:47','YYYY-MM-DD HH24:MI:SS'),100,'111','Cualquier otra cesión o locación de derechos','Cualquier otra cesión o locación de derechos, correspondientes a operaciones realizadas por intermedio de mercados de cereales a término que se resuelvan en el curso del término (arbitrajes) y de mercados de futuros y opciones. Anexo II, inc. ñ)',0.500000000000,2.000000000000,'N',0,0,90.000000000000,90.000000000000)
;

-- 22/12/2016 12:44:49 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET IsActive='N',Updated=TO_DATE('2016-12-22 12:44:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000019
;

-- 22/12/2016 12:50:05 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Concepto_Ret_Ganancias (LAR_Concepto_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Description,Alicuota_Inscripto,Alicuota_No_Inscripto,Calculo_Por_Escala,Importe_No_Sujeto_Inscripto,Importe_No_Sujeto_No_Insc,Importe_Ret_Minima_Inscripto,Importe_Ret_Minima_No_Insc) VALUES (1000020,1000000,0,'N',TO_DATE('2016-12-22 12:50:05','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 12:50:05','YYYY-MM-DD HH24:MI:SS'),100,'112','Beneficios planes de seguro de retiro privados','Beneficios provenientes del cumplimiento de los requisitos de los planes de seguro de retiro privados administrados por entidades sujetas al control de la SSN, ... Anexo II, inc. o)',3.000000000000,3.000000000000,'N',7500.000000000000,0,90.000000000000,90.000000000000)
;

-- 22/12/2016 12:51:12 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Concepto_Ret_Ganancias (LAR_Concepto_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Description,Alicuota_Inscripto,Alicuota_No_Inscripto,Calculo_Por_Escala,Importe_No_Sujeto_Inscripto,Importe_No_Sujeto_No_Insc,Importe_Ret_Minima_Inscripto,Importe_Ret_Minima_No_Insc) VALUES (1000021,1000000,0,'Y',TO_DATE('2016-12-22 12:51:12','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 12:51:12','YYYY-MM-DD HH24:MI:SS'),100,'113','Rescates —totales o parciales— por desistimiento de los planes de seguro','Rescates —totales o parciales— por desistimiento de los planes de seguro de retiro a que se refiere el inciso o), excepto que sea de aplicación lo normado en el artículo 101 de la LIG. Anexo II, inc. p)',3.000000000000,3.000000000000,'N',7500.000000000000,0,90.000000000000,90.000000000000)
;

-- 22/12/2016 12:53:41 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET IsActive='N',Updated=TO_DATE('2016-12-22 12:53:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000021
;

-- 22/12/2016 12:55:38 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Concepto_Ret_Ganancias (LAR_Concepto_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Description,Alicuota_Inscripto,Alicuota_No_Inscripto,Calculo_Por_Escala,Importe_No_Sujeto_Inscripto,Importe_No_Sujeto_No_Insc,Importe_Ret_Minima_Inscripto,Importe_Ret_Minima_No_Insc) VALUES (1000022,1000000,0,'Y',TO_DATE('2016-12-22 12:55:38','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 12:55:38','YYYY-MM-DD HH24:MI:SS'),100,'779','Subsidios abonados por los estados Nacional, provinciales, municipales','Subsidios abonados por los estados Nacional, provinciales, municipales o el Gobierno de la Ciudad Autónoma de Buenos Ares, en concepto de enajenación de bienes muebles y bienes de cambio. Anexo II, inciso q)',2.000000000000,10.000000000000,'N',34000.000000000000,0,90.000000000000,90.000000000000)
;

-- 22/12/2016 12:56:09 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET Importe_No_Sujeto_No_Insc=7500.000000000000,Updated=TO_DATE('2016-12-22 12:56:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000020
;

-- 22/12/2016 12:56:37 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET Importe_No_Sujeto_No_Insc=7500.000000000000,Updated=TO_DATE('2016-12-22 12:56:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000021
;

-- 22/12/2016 12:56:44 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET IsActive='N',Updated=TO_DATE('2016-12-22 12:56:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000022
;

-- 22/12/2016 12:58:10 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Concepto_Ret_Ganancias (LAR_Concepto_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Description,Alicuota_Inscripto,Alicuota_No_Inscripto,Calculo_Por_Escala,Importe_No_Sujeto_Inscripto,Importe_No_Sujeto_No_Insc,Importe_Ret_Minima_Inscripto,Importe_Ret_Minima_No_Insc) VALUES (1000023,1000000,0,'N',TO_DATE('2016-12-22 12:58:10','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 12:58:10','YYYY-MM-DD HH24:MI:SS'),100,'780','Subsidios locacion de obra','Subsidios abonados por los estados Nacional, provinciales, municipales o el Gobierno de la Ciudad Autónoma de Buenos Aires, en concepto de locaciones de obra y/o servicios, no ejecutados en relación de dependencia... Anexo II, inciso r)',2.000000000000,28.000000000000,'N',14000.000000000000,0,90.000000000000,90.000000000000)
;

-- 22/12/2016 12:58:54 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET IsActive='Y', Name='Subsidios enajenación de bienes muebles y bienes de cambio', Description='Subsidios abonados por los estados Nacional, provinciales, municipales o el Gobierno de la Ciudad Autónoma de Buenos Ares, en concepto de enajenación de bienes muebles y bienes de cambio... Anexo II, inciso q)',Updated=TO_DATE('2016-12-22 12:58:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000022
;

-- 22/12/2016 13:00:19 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET IsActive='N',Updated=TO_DATE('2016-12-22 13:00:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000022
;

-- 22/12/2016 13:25:06 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Concepto_Ret_Ganancias (LAR_Concepto_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Description,Alicuota_Inscripto,Alicuota_No_Inscripto,Calculo_Por_Escala,Importe_No_Sujeto_Inscripto,Importe_No_Sujeto_No_Insc,Importe_Ret_Minima_Inscripto,Importe_Ret_Minima_No_Insc) VALUES (1000024,1000000,0,'Y',TO_DATE('2016-12-22 13:25:06','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 13:25:06','YYYY-MM-DD HH24:MI:SS'),100,'SE','Sin Especificar',NULL,0,0,'N',0,0,0,0)
;

-- Correr la secuencia para la tabla LAR_Concepto_Ret_Ganancias
UPDATE AD_Sequence set currentnext = ((SELECT MAX(LAR_Concepto_Ret_Ganancias_ID) FROM LAR_Concepto_Ret_Ganancias WHERE AD_Client_ID = 1000000) + 1) WHERE AD_Sequence_ID = 3000331;



-- DATOS
-- Escala Retención de Ganancias
-- 22/12/2016 16:46:03 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Escala_Ret_Ganancias (LAR_Escala_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Alicuota,Importe_Desde,Importe_Fijo,Importe_Hasta,Importe_No_Sujeto) VALUES (1000000,1000000,0,'Y',TO_DATE('2016-12-22 16:46:03','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 16:46:03','YYYY-MM-DD HH24:MI:SS'),100,'1','0 a 2000',10.000000000000,0,0,2000.000000000000,0)
;

-- 22/12/2016 16:47:25 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Escala_Ret_Ganancias (LAR_Escala_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Alicuota,Importe_Desde,Importe_Fijo,Importe_Hasta,Importe_No_Sujeto) VALUES (1000001,1000000,0,'Y',TO_DATE('2016-12-22 16:47:25','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 16:47:25','YYYY-MM-DD HH24:MI:SS'),100,'2','2000 a 4000',14.000000000000,2000.000000000000,200.000000000000,4000.000000000000,2000.000000000000)
;

-- 22/12/2016 16:49:02 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Escala_Ret_Ganancias (LAR_Escala_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Alicuota,Importe_Desde,Importe_Fijo,Importe_Hasta,Importe_No_Sujeto) VALUES (1000002,1000000,0,'Y',TO_DATE('2016-12-22 16:49:02','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 16:49:02','YYYY-MM-DD HH24:MI:SS'),100,'3','4000 a 8000',18.000000000000,4000.000000000000,480.000000000000,8000.000000000000,4000.000000000000)
;

-- 22/12/2016 16:51:28 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Escala_Ret_Ganancias (LAR_Escala_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Alicuota,Importe_Desde,Importe_Fijo,Importe_Hasta,Importe_No_Sujeto) VALUES (1000003,1000000,0,'Y',TO_DATE('2016-12-22 16:51:28','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 16:51:28','YYYY-MM-DD HH24:MI:SS'),100,'4','8000 a 14000',22.000000000000,8000.000000000000,1200.000000000000,14000.000000000000,8000.000000000000)
;

-- 22/12/2016 16:52:11 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Escala_Ret_Ganancias (LAR_Escala_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Alicuota,Importe_Desde,Importe_Fijo,Importe_Hasta,Importe_No_Sujeto) VALUES (1000004,1000000,0,'Y',TO_DATE('2016-12-22 16:52:11','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 16:52:11','YYYY-MM-DD HH24:MI:SS'),100,'5','14000 a 24000',26.000000000000,14000.000000000000,2520.000000000000,24000.000000000000,14000.000000000000)
;

-- 22/12/2016 16:52:42 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Escala_Ret_Ganancias (LAR_Escala_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Alicuota,Importe_Desde,Importe_Fijo,Importe_Hasta,Importe_No_Sujeto) VALUES (1000005,1000000,0,'Y',TO_DATE('2016-12-22 16:52:42','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 16:52:42','YYYY-MM-DD HH24:MI:SS'),100,'6','24000 a 40000',28.000000000000,24000.000000000000,5120.000000000000,40000.000000000000,24000.000000000000)
;

-- 22/12/2016 16:54:16 ART
-- ISSUE #81: Régimen de Retenciones Ganancias
INSERT INTO LAR_Escala_Ret_Ganancias (LAR_Escala_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name,Alicuota,Importe_Desde,Importe_Fijo,Importe_Hasta,Importe_No_Sujeto) VALUES (1000006,1000000,0,'Y',TO_DATE('2016-12-22 16:54:16','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-12-22 16:54:16','YYYY-MM-DD HH24:MI:SS'),100,'7','más de 40000',30.000000000000,40000.000000000000,9600.000000000000,1000000000.000000000000,40000.000000000000)
;

-- Correr la secuencia para la tabla LAR_Escala_Ret_Ganancias
UPDATE AD_Sequence set currentnext = ((SELECT MAX(LAR_Escala_Ret_Ganancias_ID) FROM LAR_Escala_Ret_Ganancias WHERE AD_Client_ID = 1000000) + 1) WHERE AD_Sequence_ID = 3000332;

-- Registración de script
SELECT register_migration_script_lar('0082_ISSUE-81.sql', 'LAR', '') FROM dual
;
