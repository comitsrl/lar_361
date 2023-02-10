-- Crear las columnas en el SdN (Ventana SdN Pestaña Empleado)
-- Tabla: C_BPartner

ALTER TABLE C_BPartner
ADD
(
    LAR_Fecha_Ingreso DATE,
    LAR_Vacaciones_Dias_Corridos NUMBER(10),
    LAR_Vacaciones_Dias_Habiles NUMBER(10)
)
;

-- Se agrega la tabla de registro de vacaciones gozadas
CREATE TABLE LAR_Registro_Vacaciones (
    lar_registro_vacaciones_id NUMBER(10, 0) NOT NULL,
    ad_client_id NUMBER(10, 0) NOT NULL,
    ad_org_id NUMBER(10, 0) NOT NULL,
    isactive CHAR(1) DEFAULT 'Y' NOT NULL,
    created DATE DEFAULT SYSDATE NOT NULL,
    createdby NUMBER(10, 0) NOT NULL,
    updated DATE DEFAULT SYSDATE NOT NULL,
    updatedby NUMBER(10, 0) NOT NULL,
    processed CHAR(1) DEFAULT 'N' NOT NULL,
    description VARCHAR2(255),
    c_year_id NUMBER(10, 0) NOT NULL,
    c_bpartner_id NUMBER(10, 0) NOT NULL,
    tipo_vacaciones CHAR(1) NOT NULL,
    startdate DATE,
    enddate DATE,
    LAR_Vacaciones_Dias_Corridos NUMBER(10, 0),
    LAR_Vacaciones_Dias_Habiles NUMBER(10, 0),
    CONSTRAINT larregistrovacas_isactive_check CHECK (isactive IN ('Y', 'N')),
    CONSTRAINT larregistrovacas_processed_check CHECK (processed IN ('Y', 'N')),
    CONSTRAINT larregistrovacas_adorg FOREIGN KEY (ad_org_id) REFERENCES adempiere.ad_org(ad_org_id),
    CONSTRAINT larregistrovacas_cbpartner FOREIGN KEY (c_bpartner_id) REFERENCES adempiere.c_bpartner(c_bpartner_id),
    CONSTRAINT larregistrovacas_cperiod FOREIGN KEY (c_year_id) REFERENCES adempiere.c_year(c_year_id)
);


-- 07/02/2023 16:45:02 ART
-- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001380,'lar_fecha_ingreso','LAR','lar_fecha_ingreso','lar_fecha_ingreso',0,TO_DATE('2023-02-07 16:45:01','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023-02-07 16:45:01','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 07/02/2023 16:45:02 ART
-- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001380 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 07/02/2023 16:45:02 ART
-- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005507,291,'LAR',0,'N','N','N','N',29,'N',16,'N',3001380,'N','Y','N','lar_fecha_ingreso','lar_fecha_ingreso',100,TO_DATE('2023-02-07 16:45:01','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-02-07 16:45:01','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 07/02/2023 16:45:02 ART
-- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005507 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 07/02/2023 16:45:02 ART
-- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001381,'lar_vacaciones_dias_corridos','LAR','lar_vacaciones_dias_corridos','lar_vacaciones_dias_corridos',0,TO_DATE('2023-02-07 16:45:02','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023-02-07 16:45:02','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 07/02/2023 16:45:02 ART
-- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001381 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 07/02/2023 16:45:03 ART
-- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005508,291,'LAR',0,'N','N','N','N',10,'N',11,'N',3001381,'N','Y','N','lar_vacaciones_dias_corridos','lar_vacaciones_dias_corridos',100,TO_DATE('2023-02-07 16:45:02','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-02-07 16:45:02','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 07/02/2023 16:45:03 ART
-- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005508 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 07/02/2023 16:45:03 ART
-- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001382,'lar_vacaciones_dias_habiles','LAR','lar_vacaciones_dias_habiles','lar_vacaciones_dias_habiles',0,TO_DATE('2023-02-07 16:45:03','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023-02-07 16:45:03','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 07/02/2023 16:45:03 ART
-- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001382 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 07/02/2023 16:45:03 ART
-- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005509,291,'LAR',0,'N','N','N','N',10,'N',11,'N',3001382,'N','Y','N','lar_vacaciones_dias_habiles','lar_vacaciones_dias_habiles',100,TO_DATE('2023-02-07 16:45:03','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-02-07 16:45:03','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 07/02/2023 16:45:03 ART
-- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005509 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 07/02/2023 16:48:15 ART
-- ISSUE #155: RRHH Vacaciones
UPDATE AD_Element SET ColumnName='LAR_Fecha_Ingreso', Name='LAR_Fecha_Ingreso', PrintName='LAR_Fecha_Ingreso',Updated=TO_DATE('2023-02-07 16:48:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001380
;

-- 07/02/2023 16:48:15 ART
-- ISSUE #155: RRHH Vacaciones
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001380
;

-- 07/02/2023 16:48:15 ART
-- ISSUE #155: RRHH Vacaciones
UPDATE AD_Column SET ColumnName='LAR_Fecha_Ingreso', Name='LAR_Fecha_Ingreso', Description=NULL, Help=NULL WHERE AD_Element_ID=3001380
;

-- 07/02/2023 16:48:15 ART
-- ISSUE #155: RRHH Vacaciones
UPDATE AD_Process_Para SET ColumnName='LAR_Fecha_Ingreso', Name='LAR_Fecha_Ingreso', Description=NULL, Help=NULL, AD_Element_ID=3001380 WHERE UPPER(ColumnName)='LAR_FECHA_INGRESO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 07/02/2023 16:48:15 ART
-- ISSUE #155: RRHH Vacaciones
UPDATE AD_Process_Para SET ColumnName='LAR_Fecha_Ingreso', Name='LAR_Fecha_Ingreso', Description=NULL, Help=NULL WHERE AD_Element_ID=3001380 AND IsCentrallyMaintained='Y'
;

-- 07/02/2023 16:48:15 ART
-- ISSUE #155: RRHH Vacaciones
UPDATE AD_Field SET Name='LAR_Fecha_Ingreso', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001380) AND IsCentrallyMaintained='Y'
;

-- 07/02/2023 16:48:15 ART
-- ISSUE #155: RRHH Vacaciones
UPDATE AD_PrintFormatItem pi SET PrintName='LAR_Fecha_Ingreso', Name='LAR_Fecha_Ingreso' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001380)
;

-- 07/02/2023 16:48:35 ART
-- ISSUE #155: RRHH Vacaciones
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Fecha de Ingreso',PrintName='Fecha de Ingreso',Updated=TO_DATE('2023-02-07 16:48:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001380 AND AD_Language='es_AR'
;

-- 07/02/2023 16:49:12 ART
-- ISSUE #155: RRHH Vacaciones
UPDATE AD_Column SET FieldLength=10, AD_Reference_ID=15, Name='LAR_Fecha_Ingreso', ColumnName='LAR_Fecha_Ingreso',Updated=TO_DATE('2023-02-07 16:49:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005507
;

-- 07/02/2023 16:51:57 ART
-- ISSUE #155: RRHH Vacaciones
UPDATE AD_Element SET ColumnName='LAR_Vacaciones_Dias_Corridos', Name='LAR_Vacaciones_Dias_Corridos', PrintName='LAR_Vacaciones_Dias_Corridos',Updated=TO_DATE('2023-02-07 16:51:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001381
;

-- 07/02/2023 16:51:57 ART
-- ISSUE #155: RRHH Vacaciones
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001381
;

-- 07/02/2023 16:51:57 ART
-- ISSUE #155: RRHH Vacaciones
UPDATE AD_Column SET ColumnName='LAR_Vacaciones_Dias_Corridos', Name='LAR_Vacaciones_Dias_Corridos', Description=NULL, Help=NULL WHERE AD_Element_ID=3001381
;

-- 07/02/2023 16:51:57 ART
-- ISSUE #155: RRHH Vacaciones
UPDATE AD_Process_Para SET ColumnName='LAR_Vacaciones_Dias_Corridos', Name='LAR_Vacaciones_Dias_Corridos', Description=NULL, Help=NULL, AD_Element_ID=3001381 WHERE UPPER(ColumnName)='LAR_VACACIONES_DIAS_CORRIDOS' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 07/02/2023 16:51:57 ART
-- ISSUE #155: RRHH Vacaciones
UPDATE AD_Process_Para SET ColumnName='LAR_Vacaciones_Dias_Corridos', Name='LAR_Vacaciones_Dias_Corridos', Description=NULL, Help=NULL WHERE AD_Element_ID=3001381 AND IsCentrallyMaintained='Y'
;

-- 07/02/2023 16:51:57 ART
-- ISSUE #155: RRHH Vacaciones
UPDATE AD_Field SET Name='LAR_Vacaciones_Dias_Corridos', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001381) AND IsCentrallyMaintained='Y'
;

-- 07/02/2023 16:51:57 ART
-- ISSUE #155: RRHH Vacaciones
UPDATE AD_PrintFormatItem pi SET PrintName='LAR_Vacaciones_Dias_Corridos', Name='LAR_Vacaciones_Dias_Corridos' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001381)
;

-- 07/02/2023 16:52:20 ART
-- ISSUE #155: RRHH Vacaciones
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Vacaciones Dias Corridos',PrintName='Vacaciones Dias Corridos',Updated=TO_DATE('2023-02-07 16:52:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001381 AND AD_Language='es_AR'
;

-- 07/02/2023 16:52:53 ART
-- ISSUE #155: RRHH Vacaciones
UPDATE AD_Element SET ColumnName='LAR_Vacaciones_Dias_Habiles', Name='LAR_Vacaciones_Dias_Habiles', PrintName='LAR_Vacaciones_Dias_Habiles',Updated=TO_DATE('2023-02-07 16:52:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001382
;

-- 07/02/2023 16:52:53 ART
-- ISSUE #155: RRHH Vacaciones
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001382
;

-- 07/02/2023 16:52:53 ART
-- ISSUE #155: RRHH Vacaciones
UPDATE AD_Column SET ColumnName='LAR_Vacaciones_Dias_Habiles', Name='LAR_Vacaciones_Dias_Habiles', Description=NULL, Help=NULL WHERE AD_Element_ID=3001382
;

-- 07/02/2023 16:52:53 ART
-- ISSUE #155: RRHH Vacaciones
UPDATE AD_Process_Para SET ColumnName='LAR_Vacaciones_Dias_Habiles', Name='LAR_Vacaciones_Dias_Habiles', Description=NULL, Help=NULL, AD_Element_ID=3001382 WHERE UPPER(ColumnName)='LAR_VACACIONES_DIAS_HABILES' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 07/02/2023 16:52:53 ART
-- ISSUE #155: RRHH Vacaciones
UPDATE AD_Process_Para SET ColumnName='LAR_Vacaciones_Dias_Habiles', Name='LAR_Vacaciones_Dias_Habiles', Description=NULL, Help=NULL WHERE AD_Element_ID=3001382 AND IsCentrallyMaintained='Y'
;

-- 07/02/2023 16:52:53 ART
-- ISSUE #155: RRHH Vacaciones
UPDATE AD_Field SET Name='LAR_Vacaciones_Dias_Habiles', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001382) AND IsCentrallyMaintained='Y'
;

-- 07/02/2023 16:52:53 ART
-- ISSUE #155: RRHH Vacaciones
UPDATE AD_PrintFormatItem pi SET PrintName='LAR_Vacaciones_Dias_Habiles', Name='LAR_Vacaciones_Dias_Habiles' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001382)
;

-- 07/02/2023 16:53:11 ART
-- ISSUE #155: RRHH Vacaciones
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Vacaciones Días Hábiles',PrintName='Vacaciones Días Hábiles',Updated=TO_DATE('2023-02-07 16:53:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001382 AND AD_Language='es_AR'
;

-- 07/02/2023 16:53:34 ART
-- ISSUE #155: RRHH Vacaciones
UPDATE AD_Element_Trl SET Name='Vacaciones Días Corridos',PrintName='Vacaciones Días Corridos',Updated=TO_DATE('2023-02-07 16:53:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001381 AND AD_Language='es_AR'
;

-- 07/02/2023 16:57:28 ART
-- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008114,10,'Y','N','N',3005507,'N','Y',225,'N','LAR','LAR_Fecha_Ingreso',100,0,TO_DATE('2023-02-07 16:57:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2023-02-07 16:57:28','YYYY-MM-DD HH24:MI:SS'))
;

-- 07/02/2023 16:57:28 ART
-- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008114 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 07/02/2023 16:57:30 ART
-- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008126,10,'Y','N','N',3005508,'N','Y',225,'N','LAR','LAR_Vacaciones_Dias_Corridos',100,0,TO_DATE('2023-02-07 16:57:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2023-02-07 16:57:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 07/02/2023 16:57:30 ART
-- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008126 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 07/02/2023 16:57:31 ART
-- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008127,10,'Y','N','N',3005509,'N','Y',225,'N','LAR','LAR_Vacaciones_Dias_Habiles',100,0,TO_DATE('2023-02-07 16:57:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2023-02-07 16:57:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 07/02/2023 16:57:31 ART
-- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008127 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- ====================================================
-- DA Tabla LAR_Registro_Vacaciones
-- ====================================================

-- 09/02/2023 19:49:12 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,LoadSeq,AD_Table_ID,ImportTable,IsHighVolume,IsView,IsChangeLog,CopyColumnsFromTable,EntityType,IsCentrallyMaintained,IsDeleteable,ReplicationType,TableName,Name,AD_Client_ID,IsActive,AD_Org_ID,CreatedBy,Updated,UpdatedBy,Created) VALUES ('N','3',0,3000266,'N','N','N','N','N','LAR','Y','Y','L','LAR_Registro_Vacaciones','LAR_Registro_Vacaciones',0,'Y',0,100,TO_DATE('2023-02-09 19:49:11','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2023-02-09 19:49:11','YYYY-MM-DD HH24:MI:SS'))
;

-- 09/02/2023 19:49:12 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=3000266 AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- 09/02/2023 19:49:12 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Description,Name,AD_Org_ID,UpdatedBy,AD_Client_ID,Updated,Created,CreatedBy,IsActive) VALUES (1,'N',200000,'Y',1000000,1000000,'N','Y',3001930,'Table LAR_Registro_Vacaciones','LAR_Registro_Vacaciones',0,100,0,TO_DATE('2023-02-09 19:49:12','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023-02-09 19:49:12','YYYY-MM-DD HH24:MI:SS'),100,'Y')
;

-- 09/02/2023 19:52:21 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001383,'LAR_Registro_Vacaciones_ID','LAR','LAR_Registro_Vacaciones','LAR_Registro_Vacaciones',0,TO_DATE('2023-02-09 19:52:21','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023-02-09 19:52:21','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 09/02/2023 19:52:21 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001383 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 09/02/2023 19:52:21 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005510,3000266,'LAR',0,'Y','N','N','N',10,'N',13,'Y',3001383,'N','N','N','LAR_Registro_Vacaciones','LAR_Registro_Vacaciones_ID',100,TO_DATE('2023-02-09 19:52:21','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-02-09 19:52:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/02/2023 19:52:21 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005510 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/02/2023 19:52:21 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005511,3000266,'LAR',0,'Y','N','N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',10,'N',19,'N',102,'N','N','N','Client/Tenant for this installation.','Client','AD_Client_ID',100,TO_DATE('2023-02-09 19:52:21','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-02-09 19:52:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/02/2023 19:52:21 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005511 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/02/2023 19:52:21 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005512,3000266,'LAR',0,'Y','N','N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',10,'N',19,'N',113,'N','N','N','Organizational entity within client','Organization','AD_Org_ID',100,TO_DATE('2023-02-09 19:52:21','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-02-09 19:52:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/02/2023 19:52:21 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005512 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/02/2023 19:52:22 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005513,3000266,'LAR',0,'Y','N','N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',1,'N',20,'N',348,'N','Y','N','The record is active in the system','Active','IsActive',100,TO_DATE('2023-02-09 19:52:21','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-02-09 19:52:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/02/2023 19:52:22 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005513 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/02/2023 19:52:22 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005514,3000266,'LAR',0,'Y','N','N','The Created field indicates the date that this record was created.','N',29,'N',16,'N',245,'N','N','N','Date this record was created','Created','Created',100,TO_DATE('2023-02-09 19:52:22','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-02-09 19:52:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/02/2023 19:52:22 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005514 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/02/2023 19:52:22 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005515,3000266,'LAR',0,110,'Y','N','N','The Created By field indicates the user who created this record.','N',10,'N',18,'N',246,'N','N','N','User who created this records','Created By','CreatedBy',100,TO_DATE('2023-02-09 19:52:22','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-02-09 19:52:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/02/2023 19:52:22 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005515 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/02/2023 19:52:22 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005516,3000266,'LAR',0,'Y','N','N','The Updated field indicates the date that this record was updated.','N',29,'N',16,'N',607,'N','N','N','Date this record was updated','Updated','Updated',100,TO_DATE('2023-02-09 19:52:22','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-02-09 19:52:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/02/2023 19:52:22 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005516 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/02/2023 19:52:23 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005517,3000266,'LAR',0,110,'Y','N','N','The Updated By field indicates the user who updated this record.','N',10,'N',18,'N',608,'N','N','N','User who updated this records','Updated By','UpdatedBy',100,TO_DATE('2023-02-09 19:52:22','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-02-09 19:52:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/02/2023 19:52:23 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005517 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/02/2023 19:52:23 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005518,3000266,'LAR',0,'Y','N','N','The Processed checkbox indicates that a document has been processed.','N',1,'N',20,'N',1047,'N','Y','N','The document has been processed','Processed','Processed',100,TO_DATE('2023-02-09 19:52:23','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-02-09 19:52:23','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/02/2023 19:52:23 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005518 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/02/2023 19:52:23 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005519,3000266,'LAR',0,'N','N','N','A description is limited to 255 characters.','N',255,'Y',10,'N',275,'N','Y','N','Optional short description of the record','Description','Description',100,TO_DATE('2023-02-09 19:52:23','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-02-09 19:52:23','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/02/2023 19:52:23 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005519 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/02/2023 19:52:23 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005520,3000266,'LAR',0,'Y','N','N','The Year uniquely identifies an accounting year for a calendar.','N',10,'N',19,'N',223,'N','Y','N','Calendar Year','Year','C_Year_ID',100,TO_DATE('2023-02-09 19:52:23','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-02-09 19:52:23','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/02/2023 19:52:23 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005520 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/02/2023 19:52:23 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005521,3000266,'LAR',0,'Y','N','N','A Business Partner is anyone with whom you transact.  This can include Vendor, Customer, Employee or Salesperson','N',10,'N',19,'N',187,'N','Y','N','Identifies a Business Partner','Business Partner ','C_BPartner_ID',100,TO_DATE('2023-02-09 19:52:23','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-02-09 19:52:23','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/02/2023 19:52:23 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005521 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/02/2023 19:52:24 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001384,'tipo_vacaciones','LAR','tipo_vacaciones','tipo_vacaciones',0,TO_DATE('2023-02-09 19:52:23','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023-02-09 19:52:23','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 09/02/2023 19:52:24 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001384 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 09/02/2023 19:52:24 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005522,3000266,'LAR',0,'Y','N','N','N',1,'N',20,'N',3001384,'N','Y','N','tipo_vacaciones','tipo_vacaciones',100,TO_DATE('2023-02-09 19:52:23','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-02-09 19:52:23','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/02/2023 19:52:24 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005522 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/02/2023 19:52:24 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005523,3000266,'LAR',0,'N','N','N','The Start Date indicates the first or starting date','N',29,'N',16,'N',574,'N','Y','N','First effective day (inclusive)','Start Date','StartDate',100,TO_DATE('2023-02-09 19:52:24','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-02-09 19:52:24','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/02/2023 19:52:24 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005523 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/02/2023 19:52:24 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005524,3000266,'LAR',0,'N','N','N','The End Date indicates the last date in this range.','N',29,'N',16,'N',294,'N','Y','N','Last effective date (inclusive)','End Date','EndDate',100,TO_DATE('2023-02-09 19:52:24','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-02-09 19:52:24','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/02/2023 19:52:24 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005524 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/02/2023 19:52:24 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005525,3000266,'LAR',0,'N','N','N','N',10,'N',11,'N',3001381,'N','Y','N','LAR_Vacaciones_Dias_Corridos','LAR_Vacaciones_Dias_Corridos',100,TO_DATE('2023-02-09 19:52:24','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-02-09 19:52:24','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/02/2023 19:52:24 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005525 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/02/2023 19:52:25 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005526,3000266,'LAR',0,'N','N','N','N',10,'N',11,'N',3001382,'N','Y','N','LAR_Vacaciones_Dias_Habiles','LAR_Vacaciones_Dias_Habiles',100,TO_DATE('2023-02-09 19:52:24','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2023-02-09 19:52:24','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/02/2023 19:52:25 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005526 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/02/2023 19:56:03 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Element SET ColumnName='Tipo_Vacaciones', Name='Tipo_Vacaciones', PrintName='Tipo_Vacaciones',Updated=TO_DATE('2023-02-09 19:56:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001384
;

-- 09/02/2023 19:56:03 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001384
;

-- 09/02/2023 19:56:03 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Column SET ColumnName='Tipo_Vacaciones', Name='Tipo_Vacaciones', Description=NULL, Help=NULL WHERE AD_Element_ID=3001384
;

-- 09/02/2023 19:56:03 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Process_Para SET ColumnName='Tipo_Vacaciones', Name='Tipo_Vacaciones', Description=NULL, Help=NULL, AD_Element_ID=3001384 WHERE UPPER(ColumnName)='TIPO_VACACIONES' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 09/02/2023 19:56:03 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Process_Para SET ColumnName='Tipo_Vacaciones', Name='Tipo_Vacaciones', Description=NULL, Help=NULL WHERE AD_Element_ID=3001384 AND IsCentrallyMaintained='Y'
;

-- 09/02/2023 19:56:03 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Field SET Name='Tipo_Vacaciones', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001384) AND IsCentrallyMaintained='Y'
;

-- 09/02/2023 19:56:03 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_PrintFormatItem pi SET PrintName='Tipo_Vacaciones', Name='Tipo_Vacaciones' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001384)
;

-- 09/02/2023 19:56:14 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Tipo Vacaciones',PrintName='Tipo Vacaciones',Updated=TO_DATE('2023-02-09 19:56:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001384 AND AD_Language='es_AR'
;

-- 09/02/2023 20:03:25 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,Description,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000163,'L','LAR','N','LAR_Registro_Vacaciones Tipo','Ordinarias - Extraordinarias',0,0,100,TO_DATE('2023-02-09 20:03:25','YYYY-MM-DD HH24:MI:SS'),'Y',TO_DATE('2023-02-09 20:03:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/02/2023 20:03:25 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000163 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 09/02/2023 20:03:47 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,UpdatedBy,Created,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000343,3000163,'LAR','O','Ordinarias',TO_DATE('2023-02-09 20:03:47','YYYY-MM-DD HH24:MI:SS'),100,100,TO_DATE('2023-02-09 20:03:47','YYYY-MM-DD HH24:MI:SS'),0,'Y',0)
;

-- 09/02/2023 20:03:47 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000343 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 09/02/2023 20:04:03 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,UpdatedBy,Created,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000345,3000163,'LAR','E','Extraordinarias',TO_DATE('2023-02-09 20:04:03','YYYY-MM-DD HH24:MI:SS'),100,100,TO_DATE('2023-02-09 20:04:03','YYYY-MM-DD HH24:MI:SS'),0,'Y',0)
;

-- 09/02/2023 20:04:03 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000345 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;


-- 09/02/2023 20:17:01 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Window (AD_Window_ID,WindowType,IsSOTrx,IsDefault,IsBetaFunctionality,WinHeight,WinWidth,EntityType,Name,Description,IsActive,Created,UpdatedBy,CreatedBy,Updated,AD_Org_ID,AD_Client_ID,Processing) VALUES (3000137,'M','N','N','N',0,0,'LAR','Registro de Vacaciones','Registro de vacaciones por empleado.','Y',TO_DATE('2023-02-09 20:17:00','YYYY-MM-DD HH24:MI:SS'),100,100,TO_DATE('2023-02-09 20:17:00','YYYY-MM-DD HH24:MI:SS'),0,0,'N')
;

-- 09/02/2023 20:17:01 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Window_Trl (AD_Language,AD_Window_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Window_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Window t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Window_ID=3000137 AND NOT EXISTS (SELECT * FROM AD_Window_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Window_ID=t.AD_Window_ID)
;

-- 09/02/2023 20:17:30 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Window SET Name='Registro Vacaciones',Updated=TO_DATE('2023-02-09 20:17:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Window_ID=3000137
;

-- 09/02/2023 20:17:30 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Window_Trl SET IsTranslated='N' WHERE AD_Window_ID=3000137
;

-- 09/02/2023 20:17:36 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Window_Trl SET IsTranslated='Y',Name='Registro Vacaciones',Updated=TO_DATE('2023-02-09 20:17:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Window_ID=3000137 AND AD_Language='es_AR'
;

-- 09/02/2023 20:18:09 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Tab (IsSingleRow,AD_Window_ID,SeqNo,IsTranslationTab,IsSortTab,AD_Table_ID,AD_Tab_ID,ImportFields,HasTree,IsInfoTab,IsReadOnly,TabLevel,IsInsertRecord,IsAdvancedTab,EntityType,Name,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,IsActive,Processing,UpdatedBy) VALUES ('Y',3000137,10,'N','N',3000266,3000284,'N','N','N','N',0,'Y','N','LAR','Registro Vacaciones',0,0,TO_DATE('2023-02-09 20:18:09','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2023-02-09 20:18:09','YYYY-MM-DD HH24:MI:SS'),'Y','N',100)
;

-- 09/02/2023 20:18:09 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, Help,CommitWarning,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.Help,t.CommitWarning,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000284 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 09/02/2023 20:18:31 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Tab SET IsSingleRow='N',Updated=TO_DATE('2023-02-09 20:18:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000284
;

-- 09/02/2023 20:18:43 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008146,1,'Y','N','N',3005513,'N','Y',3000284,'N','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','LAR','The record is active in the system','Active',100,0,TO_DATE('2023-02-09 20:18:43','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2023-02-09 20:18:43','YYYY-MM-DD HH24:MI:SS'))
;

-- 09/02/2023 20:18:43 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008146 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/02/2023 20:18:44 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008147,10,'Y','N','N',3005521,'N','Y',3000284,'N','A Business Partner is anyone with whom you transact.  This can include Vendor, Customer, Employee or Salesperson','LAR','Identifies a Business Partner','Business Partner ',100,0,TO_DATE('2023-02-09 20:18:43','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2023-02-09 20:18:43','YYYY-MM-DD HH24:MI:SS'))
;

-- 09/02/2023 20:18:44 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008147 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/02/2023 20:18:44 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008148,10,'Y','N','N',3005511,'N','Y',3000284,'N','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','LAR','Client/Tenant for this installation.','Client',100,0,TO_DATE('2023-02-09 20:18:44','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2023-02-09 20:18:44','YYYY-MM-DD HH24:MI:SS'))
;

-- 09/02/2023 20:18:44 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008148 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/02/2023 20:18:44 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008149,255,'Y','N','N',3005519,'N','Y',3000284,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,TO_DATE('2023-02-09 20:18:44','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2023-02-09 20:18:44','YYYY-MM-DD HH24:MI:SS'))
;

-- 09/02/2023 20:18:44 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008149 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/02/2023 20:18:44 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008150,29,'Y','N','N',3005524,'N','Y',3000284,'N','The End Date indicates the last date in this range.','LAR','Last effective date (inclusive)','End Date',100,0,TO_DATE('2023-02-09 20:18:44','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2023-02-09 20:18:44','YYYY-MM-DD HH24:MI:SS'))
;

-- 09/02/2023 20:18:44 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008150 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/02/2023 20:18:45 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008151,10,'N','N','N',3005510,'N','Y',3000284,'N','LAR','LAR_Registro_Vacaciones',100,0,TO_DATE('2023-02-09 20:18:44','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2023-02-09 20:18:44','YYYY-MM-DD HH24:MI:SS'))
;

-- 09/02/2023 20:18:45 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008151 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/02/2023 20:18:45 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008152,10,'Y','N','N',3005525,'N','Y',3000284,'N','LAR','LAR_Vacaciones_Dias_Corridos',100,0,TO_DATE('2023-02-09 20:18:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2023-02-09 20:18:45','YYYY-MM-DD HH24:MI:SS'))
;

-- 09/02/2023 20:18:45 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008152 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/02/2023 20:18:45 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008153,10,'Y','N','N',3005526,'N','Y',3000284,'N','LAR','LAR_Vacaciones_Dias_Habiles',100,0,TO_DATE('2023-02-09 20:18:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2023-02-09 20:18:45','YYYY-MM-DD HH24:MI:SS'))
;

-- 09/02/2023 20:18:45 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008153 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/02/2023 20:18:45 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008154,10,'Y','N','N',3005512,'N','Y',3000284,'N','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','LAR','Organizational entity within client','Organization',100,0,TO_DATE('2023-02-09 20:18:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2023-02-09 20:18:45','YYYY-MM-DD HH24:MI:SS'))
;

-- 09/02/2023 20:18:45 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008154 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/02/2023 20:18:45 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008155,1,'Y','N','N',3005518,'N','Y',3000284,'N','The Processed checkbox indicates that a document has been processed.','LAR','The document has been processed','Processed',100,0,TO_DATE('2023-02-09 20:18:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2023-02-09 20:18:45','YYYY-MM-DD HH24:MI:SS'))
;

-- 09/02/2023 20:18:45 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008155 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/02/2023 20:18:46 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008156,29,'Y','N','N',3005523,'N','Y',3000284,'N','The Start Date indicates the first or starting date','LAR','First effective day (inclusive)','Start Date',100,0,TO_DATE('2023-02-09 20:18:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2023-02-09 20:18:45','YYYY-MM-DD HH24:MI:SS'))
;

-- 09/02/2023 20:18:46 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008156 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/02/2023 20:18:46 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008157,1,'Y','N','N',3005522,'N','Y',3000284,'N','LAR','Tipo_Vacaciones',100,0,TO_DATE('2023-02-09 20:18:46','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2023-02-09 20:18:46','YYYY-MM-DD HH24:MI:SS'))
;

-- 09/02/2023 20:18:46 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008157 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/02/2023 20:18:46 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008158,10,'Y','N','N',3005520,'N','Y',3000284,'N','The Year uniquely identifies an accounting year for a calendar.','LAR','Calendar Year','Year',100,0,TO_DATE('2023-02-09 20:18:46','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2023-02-09 20:18:46','YYYY-MM-DD HH24:MI:SS'))
;

-- 09/02/2023 20:18:46 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008158 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/02/2023 20:20:18 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3008152
;

-- 09/02/2023 20:20:18 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3008148
;

-- 09/02/2023 20:20:18 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3008154
;

-- 09/02/2023 20:20:18 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3008147
;

-- 09/02/2023 20:20:18 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3008158
;

-- 09/02/2023 20:20:18 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3008146
;

-- 09/02/2023 20:20:18 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3008156
;

-- 09/02/2023 20:20:18 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3008150
;

-- 09/02/2023 20:20:18 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3008153
;

-- 09/02/2023 20:20:18 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3008157
;

-- 09/02/2023 20:20:18 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3008149
;

-- 09/02/2023 20:20:18 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3008155
;

-- 09/02/2023 20:20:27 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2023-02-09 20:20:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008154
;

-- 09/02/2023 20:20:34 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2023-02-09 20:20:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008158
;

-- 09/02/2023 20:20:42 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2023-02-09 20:20:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008150
;

-- 09/02/2023 20:20:47 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2023-02-09 20:20:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008157
;

-- 09/02/2023 20:22:27 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Column SET AD_Val_Rule_ID=52012,Updated=TO_DATE('2023-02-09 20:22:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005521
;

-- 09/02/2023 20:23:17 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Column SET AD_Reference_Value_ID=3000163, AD_Reference_ID=17,Updated=TO_DATE('2023-02-09 20:23:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005522
;

-- 09/02/2023 20:26:16 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Menu (AD_Window_ID,AD_Menu_ID,IsSummary,Action,IsSOTrx,IsReadOnly,EntityType,IsCentrallyMaintained,Name,Description,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000137,3000471,'N','W','N','N','LAR','Y','Registro Vacaciones','Registro de vacaciones por y empleado.',TO_DATE('2023-02-09 20:26:16','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_DATE('2023-02-09 20:26:16','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 09/02/2023 20:26:16 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000471 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 09/02/2023 20:26:16 ART
-- -- ISSUE #155: RRHH Vacaciones
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', SysDate, 100, SysDate, 100,t.AD_Tree_ID, 3000471, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000471)
;

-- 09/02/2023 20:26:21 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_TreeNodeMM SET Parent_ID=3000416, SeqNo=0, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000471
;

-- 09/02/2023 20:26:59 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Table SET AD_Window_ID=3000137, PO_Window_ID=3000137,Updated=TO_DATE('2023-02-09 20:26:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000266
;

-- 09/02/2023 20:27:59 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Menu SET IsActive='Y',Updated=TO_DATE('2023-02-09 20:27:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=3000416
;

-- 09/02/2023 20:30:11 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Column SET IsMandatory='Y', AD_Reference_ID=15,Updated=TO_DATE('2023-02-09 20:30:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005524
;

-- 09/02/2023 20:30:21 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Column SET IsMandatory='Y', AD_Reference_ID=15,Updated=TO_DATE('2023-02-09 20:30:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005523
;

-- 09/02/2023 20:31:06 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Column SET IsMandatory='Y',Updated=TO_DATE('2023-02-09 20:31:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005526
;

-- 09/02/2023 20:33:52 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_DATE('2023-02-09 20:33:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005518
;

-- 09/02/2023 20:49:28 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Column SET FieldLength=7,Updated=TO_DATE('2023-02-09 20:49:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005523
;

-- 09/02/2023 20:49:43 ART
-- -- ISSUE #155: RRHH Vacaciones
UPDATE AD_Column SET FieldLength=7,Updated=TO_DATE('2023-02-09 20:49:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005524
;

-- Registración de script
SELECT register_migration_script_lar('0217_ISSUE-155.sql', 'LAR', '') FROM dual
;
