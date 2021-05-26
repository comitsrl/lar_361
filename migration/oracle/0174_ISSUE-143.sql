ALTER TABLE M_Movement ADD COLUMN CopyFrom character(1);

-- 20/05/2021 21:00:43 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,IsMandatory,Version,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003924,323,'LAR','N',0,'N','N','Copy From Record','N',1,'N',20,'N',2037,'N','Y','N','Copy From Record','Copy From','CopyFrom',TO_DATE('2021-05-20 21:00:42','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2021-05-20 21:00:42','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 20/05/2021 21:00:43 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003924 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 20/05/2021 21:03:17 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
INSERT INTO AD_Process (AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,CopyFromProcess,Value,Name,AD_Org_ID,AD_Client_ID,UpdatedBy,CreatedBy,Updated,Created,IsActive) VALUES (3000419,'N','N','3','N','N','Y','LAR',0,0,'N','LAR_CopiarLineas_MovimientoInventario','LAR_CopiarLineas_MovimientoInventario',0,0,100,100,TO_DATE('2021-05-20 21:03:17','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-05-20 21:03:17','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 20/05/2021 21:03:17 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000419 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 20/05/2021 21:05:47 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
UPDATE AD_Process SET Classname='ar.com.ergio.process.LAR_CrearLineas_MovimientoInventario', Value='LAR_CrearLineas_MovimientoInventario', Name='LAR_CrearLineas_MovimientoInventario',Updated=TO_DATE('2021-05-20 21:05:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000419
;

-- 20/05/2021 21:05:47 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
UPDATE AD_Process_Trl SET IsTranslated='N' WHERE AD_Process_ID=3000419
;

-- 20/05/2021 21:06:52 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,IsMandatory,SeqNo,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000691,0,3000419,100,'N',19,'N',10,'LAR','M_Movement_ID','M_Movement_ID','Y',0,100,TO_DATE('2021-05-20 21:06:52','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-05-20 21:06:52','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 20/05/2021 21:06:52 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000691 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 20/05/2021 21:08:44 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
UPDATE AD_Column SET AD_Process_ID=3000419,Updated=TO_DATE('2021-05-20 21:08:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=53978
;

-- 20/05/2021 21:09:05 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007052,1,'Y','N','N',3003924,'N','Y',259,'N','Copy From Record','LAR','Copy From Record','Copy From',100,0,'Y',TO_DATE('2021-05-20 21:09:05','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2021-05-20 21:09:05','YYYY-MM-DD HH24:MI:SS'))
;

-- 20/05/2021 21:09:05 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007052 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 20/05/2021 21:10:24 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3003265
;

-- 20/05/2021 21:10:24 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3003266
;

-- 20/05/2021 21:10:24 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3007052
;

-- 20/05/2021 21:10:24 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=7791
;

-- 20/05/2021 21:10:24 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=7788
;

-- 20/05/2021 21:10:24 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=7792
;

-- 20/05/2021 21:10:24 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=7793
;

-- 20/05/2021 21:10:24 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=7790
;

-- 20/05/2021 21:10:24 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=7789
;

-- 20/05/2021 21:10:24 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=10530
;

-- 20/05/2021 21:10:24 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=10529
;

-- 20/05/2021 21:10:24 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=9223
;

-- 20/05/2021 21:10:24 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=9222
;

-- 20/05/2021 21:10:24 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=9224
;

-- 20/05/2021 21:10:24 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=9221
;

-- 20/05/2021 21:10:24 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=2727
;

-- 20/05/2021 21:10:24 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=5144
;

-- 20/05/2021 21:11:03 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
UPDATE AD_Column SET AD_Reference_ID=28, AD_Process_ID=3000419,Updated=TO_DATE('2021-05-20 21:11:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003924
;

-- 20/05/2021 21:22:21 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
UPDATE AD_Process_Para SET AD_Element_ID=1030,Updated=TO_DATE('2021-05-20 21:22:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000691
;

-- 20/05/2021 21:22:31 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
UPDATE AD_Process_Para SET AD_Reference_ID=30,Updated=TO_DATE('2021-05-20 21:22:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000691
;

-- 20/05/2021 22:01:23 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
UPDATE AD_Process_Trl SET IsTranslated='Y',Name='Copiar Líneas Desde',Updated=TO_DATE('2021-05-20 22:01:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000419 AND AD_Language='es_AR'
;

-- 20/05/2021 22:01:51 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
UPDATE AD_Process_Para SET IsCentrallyMaintained='Y',Updated=TO_DATE('2021-05-20 22:01:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000691
;

-- 21/05/2021 18:42:27 ART
-- BUG #549: Proceso Copiar Lineas en Movimiento de Inventario.
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2021-05-21 18:42:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=12072
;

-- Registración de script
SELECT register_migration_script_lar('0174_ISSUE-143.sql', 'LAR', '') FROM dual
;
