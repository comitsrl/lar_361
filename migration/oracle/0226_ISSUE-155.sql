ALTER TABLE C_Remuneration
ADD COLUMN GenerarSAC character(1);

-- 11/06/2024 15:53:42 ART
-- ISSUE #155: RRHH Sueldos
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001481,'generarsac','LAR','generarsac','generarsac',0,TO_DATE('2024-06-11 15:53:41','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2024-06-11 15:53:41','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 11/06/2024 15:53:42 ART
-- ISSUE #155: RRHH Sueldos
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001481 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 11/06/2024 15:53:42 ART
-- ISSUE #155: RRHH Sueldos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005791,792,'LAR',0,'N','N','N','N',1,'N',20,'N',3001481,'N','Y','N','generarsac','generarsac',100,TO_DATE('2024-06-11 15:53:41','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2024-06-11 15:53:41','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/06/2024 15:53:42 ART
-- ISSUE #155: RRHH Sueldos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005791 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/06/2024 15:54:07 ART
-- ISSUE #155: RRHH Sueldos
UPDATE AD_Element SET ColumnName='GenerarSAC', Name='GenerarSAC', PrintName='GenerarSAC',Updated=TO_DATE('2024-06-11 15:54:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001481
;

-- 11/06/2024 15:54:07 ART
-- ISSUE #155: RRHH Sueldos
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001481
;

-- 11/06/2024 15:54:07 ART
-- ISSUE #155: RRHH Sueldos
UPDATE AD_Column SET ColumnName='GenerarSAC', Name='GenerarSAC', Description=NULL, Help=NULL WHERE AD_Element_ID=3001481
;

-- 11/06/2024 15:54:07 ART
-- ISSUE #155: RRHH Sueldos
UPDATE AD_Process_Para SET ColumnName='GenerarSAC', Name='GenerarSAC', Description=NULL, Help=NULL, AD_Element_ID=3001481 WHERE UPPER(ColumnName)='GENERARSAC' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 11/06/2024 15:54:07 ART
-- ISSUE #155: RRHH Sueldos
UPDATE AD_Process_Para SET ColumnName='GenerarSAC', Name='GenerarSAC', Description=NULL, Help=NULL WHERE AD_Element_ID=3001481 AND IsCentrallyMaintained='Y'
;

-- 11/06/2024 15:54:07 ART
-- ISSUE #155: RRHH Sueldos
UPDATE AD_Field SET Name='GenerarSAC', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001481) AND IsCentrallyMaintained='Y'
;

-- 11/06/2024 15:54:07 ART
-- ISSUE #155: RRHH Sueldos
UPDATE AD_PrintFormatItem pi SET PrintName='GenerarSAC', Name='GenerarSAC' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001481)
;

-- 11/06/2024 15:57:26 ART
-- ISSUE #155: RRHH Sueldos
INSERT INTO AD_Process (Help,AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Classname,CopyFromProcess,Description,Value,Name,AD_Org_ID,AD_Client_ID,UpdatedBy,Created,CreatedBy,Updated,IsActive) VALUES ('Al iniciar el proceso, se generarán los movimientos del SAC según el detalle por empleado y período seleccionado.',3000579,'N','N','3','N','N','Y','LAR',22817,309,'ar.com.ergio.process.LAR_GenerarMovimientosSAC','N','Genera los movimientos del Sueldo Anual Complementario para el período seleccionado.','LAR_Generar_SAC','Generar Movimientos SAC',0,0,100,TO_DATE('2024-06-11 15:57:25','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2024-06-11 15:57:25','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 11/06/2024 15:57:26 ART
-- ISSUE #155: RRHH Sueldos
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000579 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 11/06/2024 15:58:15 ART
-- ISSUE #155: RRHH Sueldos
UPDATE AD_Column SET AD_Process_ID=3000579,Updated=TO_DATE('2024-06-11 15:58:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004454
;

-- 11/06/2024 15:58:57 ART
-- ISSUE #155: RRHH Sueldos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009372,1,'Y','N','N',3005791,'N','Y',725,'N','LAR','GenerarSAC',100,0,TO_DATE('2024-06-11 15:58:57','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2024-06-11 15:58:57','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/06/2024 15:58:57 ART
-- ISSUE #155: RRHH Sueldos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009372 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/06/2024 16:01:04 ART
-- ISSUE #155: RRHH Sueldos
UPDATE AD_Field SET AD_FieldGroup_ID=114,Updated=TO_DATE('2024-06-11 16:01:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009372
;

-- 11/06/2024 16:01:55 ART
-- ISSUE #155: RRHH Sueldos
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Generar SAC',PrintName='Generar SAC',Updated=TO_DATE('2024-06-11 16:01:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001481 AND AD_Language='es_AR'
;

-- 11/06/2024 16:02:15 ART
-- ISSUE #155: RRHH Sueldos
UPDATE AD_Column SET Name='GenerarSAC ', ColumnName='GenerarSAC ',Updated=TO_DATE('2024-06-11 16:02:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005791
;

-- 11/06/2024 16:02:15 ART
-- ISSUE #155: RRHH Sueldos
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3005791
;

-- 11/06/2024 16:02:15 ART
-- ISSUE #155: RRHH Sueldos
UPDATE AD_Field SET Name='GenerarSAC ', Description=NULL, Help=NULL WHERE AD_Column_ID=3005791 AND IsCentrallyMaintained='Y'
;

-- 11/06/2024 16:02:24 ART
-- ISSUE #155: RRHH Sueldos
UPDATE AD_Column SET Name='GenerarSAC', ColumnName='GenerarSAC',Updated=TO_DATE('2024-06-11 16:02:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005791
;

-- 11/06/2024 16:02:24 ART
-- ISSUE #155: RRHH Sueldos
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3005791
;

-- 11/06/2024 16:02:24 ART
-- ISSUE #155: RRHH Sueldos
UPDATE AD_Field SET Name='GenerarSAC', Description=NULL, Help=NULL WHERE AD_Column_ID=3005791 AND IsCentrallyMaintained='Y'
;

-- 11/06/2024 16:02:53 ART
-- ISSUE #155: RRHH Sueldos
UPDATE AD_Column SET AD_Reference_ID=28, AD_Process_ID=3000579,Updated=TO_DATE('2024-06-11 16:02:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005791
;

-- 11/06/2024 16:03:22 ART
-- ISSUE #155: RRHH Sueldos
UPDATE AD_Column SET AD_Process_ID=3000467,Updated=TO_DATE('2024-06-11 16:03:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004454
;

-- 11/06/2024 16:08:20 ART
-- ISSUE #155: RRHH Sueldos
UPDATE AD_Field SET Description='Genera los movimientos de SAC para el periodo seleccionado.',Updated=TO_DATE('2024-06-11 16:08:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009372
;

-- 11/06/2024 16:08:20 ART
-- ISSUE #155: RRHH Sueldos
UPDATE AD_Field_Trl SET IsTranslated='N' WHERE AD_Field_ID=3009372
;

-- 11/06/2024 16:08:55 ART
-- ISSUE #155: RRHH Sueldos
UPDATE AD_Field SET Help='Al iniciar el proceso, se generarán los movimientos del Sueldo Anual Complementario según el detalle por empleado y período seleccionado.',Updated=TO_DATE('2024-06-11 16:08:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009372
;

-- 11/06/2024 16:08:55 ART
-- ISSUE #155: RRHH Sueldos
UPDATE AD_Field_Trl SET IsTranslated='N' WHERE AD_Field_ID=3009372
;

-- Registración de script
SELECT register_migration_script_lar('0226_ISSUE-155.sql', 'LAR', '') FROM dual
;
