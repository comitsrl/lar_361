-- 22/06/2021 15:29:58 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO LAR_Escala_Ret_Ganancias (Importe_Hasta,Importe_No_Sujeto,Alicuota,Importe_Desde,Importe_Fijo,LAR_Escala_Ret_Ganancias_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Value,Name) VALUES (100000000.000000000000,96000.000000000000,31.000000000000,96000.000000000000,18640.000000000000,1000007,1000000,0,'Y',TO_TIMESTAMP('2021-06-22 15:29:58','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2021-06-22 15:29:58','YYYY-MM-DD HH24:MI:SS'),100,'8','más de 96000')
;

-- 22/06/2021 15:35:06 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Escala_Ret_Ganancias SET Importe_Hasta=1000000000000.000000000000,Updated=TO_TIMESTAMP('2021-06-22 15:35:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Escala_Ret_Ganancias_ID=1000007
;

-- 22/06/2021 15:40:55 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Escala_Ret_Ganancias SET Importe_Hasta=100000000000.000000000000, Importe_No_Sujeto=96001.000000000000, Alicuota=32.000000000000, Importe_Desde=96001.000000000000, Importe_Fijo=18641.000000000000, Value='81', Name='más de 96000 1',Updated=TO_TIMESTAMP('2021-06-22 15:40:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Escala_Ret_Ganancias_ID=1000007
;

-- 22/06/2021 15:43:24 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Escala_Ret_Ganancias SET Importe_No_Sujeto=96000.000000000000, Alicuota=31.000000000000, Importe_Desde=96000.000000000000, Importe_Fijo=18640.000000000000, Value='8', Name='más de 96000',Updated=TO_TIMESTAMP('2021-06-22 15:43:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Escala_Ret_Ganancias_ID=1000007
;

-- 23/06/2021 15:40:16 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Escala_Ret_Ganancias SET Importe_Hasta=8000.000000000000,Updated=TO_TIMESTAMP('2021-06-23 15:40:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Escala_Ret_Ganancias_ID=1000000
;

-- 23/06/2021 15:40:33 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Escala_Ret_Ganancias SET Alicuota=5.000000000000,Updated=TO_TIMESTAMP('2021-06-23 15:40:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Escala_Ret_Ganancias_ID=1000000
;

-- 23/06/2021 15:41:01 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Escala_Ret_Ganancias SET Name='0 a 8000',Updated=TO_TIMESTAMP('2021-06-23 15:41:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Escala_Ret_Ganancias_ID=1000000
;

-- 23/06/2021 15:44:00 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Escala_Ret_Ganancias SET Importe_Hasta=16000.000000000000, Importe_No_Sujeto=8000.000000000000, Alicuota=9.000000000000, Importe_Desde=8000.000000000000, Importe_Fijo=400.000000000000, Name='8000 a 16000',Updated=TO_TIMESTAMP('2021-06-23 15:44:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Escala_Ret_Ganancias_ID=1000001
;

-- 23/06/2021 15:45:05 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Escala_Ret_Ganancias SET Importe_Hasta=24000.000000000000, Importe_No_Sujeto=16000.000000000000, Alicuota=12.000000000000, Importe_Desde=16000.000000000000, Importe_Fijo=1120.000000000000, Name='16000 a 24000',Updated=TO_TIMESTAMP('2021-06-23 15:45:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Escala_Ret_Ganancias_ID=1000002
;

-- 23/06/2021 15:45:57 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Escala_Ret_Ganancias SET Importe_Hasta=32000.000000000000, Importe_No_Sujeto=24000.000000000000, Alicuota=15.000000000000, Importe_Desde=24000.000000000000, Importe_Fijo=2080.000000000000, Name='24000 a 32000',Updated=TO_TIMESTAMP('2021-06-23 15:45:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Escala_Ret_Ganancias_ID=1000003
;

-- 23/06/2021 15:47:24 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Escala_Ret_Ganancias SET Importe_Hasta=48000.000000000000, Importe_No_Sujeto=32000.000000000000, Alicuota=19.000000000000, Importe_Desde=32000.000000000000, Importe_Fijo=3280.000000000000, Name='32000 a 48000',Updated=TO_TIMESTAMP('2021-06-23 15:47:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Escala_Ret_Ganancias_ID=1000004
;

-- 23/06/2021 15:53:22 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Escala_Ret_Ganancias SET Importe_Hasta=64000.000000000000, Importe_No_Sujeto=48000.000000000000, Alicuota=23.000000000000, Importe_Desde=48000.000000000000, Importe_Fijo=6320.000000000000, Name='48000 a 64000',Updated=TO_TIMESTAMP('2021-06-23 15:53:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Escala_Ret_Ganancias_ID=1000005
;

-- 23/06/2021 15:54:10 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Escala_Ret_Ganancias SET Importe_Hasta=96000.000000000000, Importe_No_Sujeto=64000.000000000000, Alicuota=27.000000000000, Importe_Desde=64000.000000000000, Importe_Fijo=10000.000000000000, Name='64000 a 96000',Updated=TO_TIMESTAMP('2021-06-23 15:54:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Escala_Ret_Ganancias_ID=1000006
;

-- 23/06/2021 15:55:57 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET IsActive='Y', Importe_No_Sujeto_Inscripto=7870.000000000000,Updated=TO_TIMESTAMP('2021-06-23 15:55:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000001
;

-- 23/06/2021 15:56:04 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET Importe_No_Sujeto_Inscripto=11200.000000000000,Updated=TO_TIMESTAMP('2021-06-23 15:56:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000002
;

-- 23/06/2021 15:56:07 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET Importe_No_Sujeto_Inscripto=11200.000000000000,Updated=TO_TIMESTAMP('2021-06-23 15:56:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000003
;

-- 23/06/2021 15:56:11 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET Importe_No_Sujeto_Inscripto=11200.000000000000,Updated=TO_TIMESTAMP('2021-06-23 15:56:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000004
;

-- 23/06/2021 15:56:59 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET IsActive='Y', Importe_No_Sujeto_Inscripto=7870.000000000000,Updated=TO_TIMESTAMP('2021-06-23 15:56:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000005
;

-- 23/06/2021 15:57:02 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET IsActive='N',Updated=TO_TIMESTAMP('2021-06-23 15:57:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000005
;

-- 23/06/2021 15:57:18 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET Importe_No_Sujeto_Inscripto=7870.000000000000,Updated=TO_TIMESTAMP('2021-06-23 15:57:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000006
;

-- 23/06/2021 15:57:32 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET Importe_No_Sujeto_Inscripto=7870.000000000000,Updated=TO_TIMESTAMP('2021-06-23 15:57:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000007
;

-- 23/06/2021 16:44:16 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET Importe_No_Sujeto_Inscripto=224000.000000000000,Updated=TO_TIMESTAMP('2021-06-23 16:44:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000008
;

-- 23/06/2021 16:44:55 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET Importe_No_Sujeto_Inscripto=224000.000000000000,Updated=TO_TIMESTAMP('2021-06-23 16:44:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000009
;

-- 23/06/2021 16:45:10 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET IsActive='Y', Importe_No_Sujeto_Inscripto=10000.000000000000,Updated=TO_TIMESTAMP('2021-06-23 16:45:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000010
;

-- 23/06/2021 16:45:15 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET IsActive='N',Updated=TO_TIMESTAMP('2021-06-23 16:45:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000010
;

-- 23/06/2021 16:46:05 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET Importe_No_Sujeto_Inscripto=67170.000000000000,Updated=TO_TIMESTAMP('2021-06-23 16:46:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000011
;

-- 23/06/2021 16:46:37 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET IsActive='Y', Importe_No_Sujeto_Inscripto=16830.000000000000,Updated=TO_TIMESTAMP('2021-06-23 16:46:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000012
;

-- 23/06/2021 16:46:41 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET IsActive='N',Updated=TO_TIMESTAMP('2021-06-23 16:46:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000012
;

-- 23/06/2021 16:46:58 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET IsActive='Y', Importe_No_Sujeto_Inscripto=67170.000000000000,Updated=TO_TIMESTAMP('2021-06-23 16:46:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000013
;

-- 23/06/2021 16:47:05 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET IsActive='N',Updated=TO_TIMESTAMP('2021-06-23 16:47:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000013
;

-- 23/06/2021 16:47:24 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET Importe_No_Sujeto_Inscripto=16830.000000000000,Updated=TO_TIMESTAMP('2021-06-23 16:47:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000014
;

-- 23/06/2021 16:47:37 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET IsActive='Y', Importe_No_Sujeto_Inscripto=16830.000000000000,Updated=TO_TIMESTAMP('2021-06-23 16:47:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000015
;

-- 23/06/2021 16:47:41 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET IsActive='N',Updated=TO_TIMESTAMP('2021-06-23 16:47:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000015
;

-- 23/06/2021 16:48:08 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET Importe_No_Sujeto_Inscripto=67170.000000000000,Updated=TO_TIMESTAMP('2021-06-23 16:48:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000016
;

-- 23/06/2021 16:48:37 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET IsActive='Y', Importe_No_Sujeto_Inscripto=16830.000000000000,Updated=TO_TIMESTAMP('2021-06-23 16:48:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000020
;

-- 23/06/2021 16:48:38 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET IsActive='N',Updated=TO_TIMESTAMP('2021-06-23 16:48:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000020
;

-- 23/06/2021 16:48:59 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET Importe_No_Sujeto_Inscripto=16830.000000000000,Updated=TO_TIMESTAMP('2021-06-23 16:48:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000021
;

-- 23/06/2021 16:49:33 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET IsActive='Y', Importe_No_Sujeto_Inscripto=76140.000000000000,Updated=TO_TIMESTAMP('2021-06-23 16:49:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000022
;

-- 23/06/2021 16:49:52 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET IsActive='N',Updated=TO_TIMESTAMP('2021-06-23 16:49:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000022
;

-- 23/06/2021 16:52:45 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE LAR_Concepto_Ret_Ganancias SET Importe_No_Sujeto_Inscripto=31460.000000000000,Updated=TO_TIMESTAMP('2021-06-23 16:52:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE LAR_Concepto_Ret_Ganancias_ID=1000023
;

-- Registración de script
SELECT register_migration_script_lar('0182_ISSUE-81.sql', 'LAR', '')
;
