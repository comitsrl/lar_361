ALTER TABLE C_DocType
ADD (EsDocumentoRRHH CHAR(1) DEFAULT 'N' NOT NULL,
     ValidaAdelantosSueldo CHAR(1) DEFAULT 'N' NOT NULL,
     CONSTRAINT c_doctype_EsDocumentoRRHH_check CHECK (EsDocumentoRRHH IN ('Y', 'N')),
     CONSTRAINT c_doctype_ValidaAdelantosSueldo_check CHECK (ValidaAdelantosSueldo IN ('Y', 'N'))
);

-- 02/04/2024 14:42:33 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001417,'esdocumentorrhh','LAR','esdocumentorrhh','esdocumentorrhh',0,TO_DATE('2024-04-02 14:42:33','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2024-04-02 14:42:33','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 02/04/2024 14:42:33 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001417 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 02/04/2024 14:42:33 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005680,217,'LAR',0,'Y','N','N','N',1,'N',20,'N',3001417,'N','Y','N','esdocumentorrhh','esdocumentorrhh',100,TO_DATE('2024-04-02 14:42:33','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2024-04-02 14:42:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/04/2024 14:42:33 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005680 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/04/2024 14:42:33 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001418,'validaadelantossueldo','LAR','validaadelantossueldo','validaadelantossueldo',0,TO_DATE('2024-04-02 14:42:33','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2024-04-02 14:42:33','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 02/04/2024 14:42:33 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001418 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 02/04/2024 14:42:34 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005681,217,'LAR',0,'Y','N','N','N',1,'N',20,'N',3001418,'N','Y','N','validaadelantossueldo','validaadelantossueldo',100,TO_DATE('2024-04-02 14:42:33','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2024-04-02 14:42:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/04/2024 14:42:34 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005681 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/04/2024 14:43:05 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
UPDATE AD_Element SET ColumnName='EsDocumentoRRHH', Name='EsDocumentoRRHH', PrintName='EsDocumentoRRHH',Updated=TO_DATE('2024-04-02 14:43:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001417
;

-- 02/04/2024 14:43:05 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001417
;

-- 02/04/2024 14:43:05 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
UPDATE AD_Column SET ColumnName='EsDocumentoRRHH', Name='EsDocumentoRRHH', Description=NULL, Help=NULL WHERE AD_Element_ID=3001417
;

-- 02/04/2024 14:43:05 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
UPDATE AD_Process_Para SET ColumnName='EsDocumentoRRHH', Name='EsDocumentoRRHH', Description=NULL, Help=NULL, AD_Element_ID=3001417 WHERE UPPER(ColumnName)='ESDOCUMENTORRHH' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 02/04/2024 14:43:05 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
UPDATE AD_Process_Para SET ColumnName='EsDocumentoRRHH', Name='EsDocumentoRRHH', Description=NULL, Help=NULL WHERE AD_Element_ID=3001417 AND IsCentrallyMaintained='Y'
;

-- 02/04/2024 14:43:05 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
UPDATE AD_Field SET Name='EsDocumentoRRHH', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001417) AND IsCentrallyMaintained='Y'
;

-- 02/04/2024 14:43:05 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
UPDATE AD_PrintFormatItem pi SET PrintName='EsDocumentoRRHH', Name='EsDocumentoRRHH' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001417)
;

-- 02/04/2024 14:43:19 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Es Documento RRHH',PrintName='Es Documento RRHH',Updated=TO_DATE('2024-04-02 14:43:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001417 AND AD_Language='es_AR'
;

-- 02/04/2024 14:44:09 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
UPDATE AD_Element SET ColumnName='ValidaAdelantosSueldo', Name='ValidaAdelantosSueldo', PrintName='ValidaAdelantosSueldo',Updated=TO_DATE('2024-04-02 14:44:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001418
;

-- 02/04/2024 14:44:09 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001418
;

-- 02/04/2024 14:44:09 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
UPDATE AD_Column SET ColumnName='ValidaAdelantosSueldo', Name='ValidaAdelantosSueldo', Description=NULL, Help=NULL WHERE AD_Element_ID=3001418
;

-- 02/04/2024 14:44:09 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
UPDATE AD_Process_Para SET ColumnName='ValidaAdelantosSueldo', Name='ValidaAdelantosSueldo', Description=NULL, Help=NULL, AD_Element_ID=3001418 WHERE UPPER(ColumnName)='VALIDAADELANTOSSUELDO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 02/04/2024 14:44:09 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
UPDATE AD_Process_Para SET ColumnName='ValidaAdelantosSueldo', Name='ValidaAdelantosSueldo', Description=NULL, Help=NULL WHERE AD_Element_ID=3001418 AND IsCentrallyMaintained='Y'
;

-- 02/04/2024 14:44:09 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
UPDATE AD_Field SET Name='ValidaAdelantosSueldo', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001418) AND IsCentrallyMaintained='Y'
;

-- 02/04/2024 14:44:09 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
UPDATE AD_PrintFormatItem pi SET PrintName='ValidaAdelantosSueldo', Name='ValidaAdelantosSueldo' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001418)
;

-- 02/04/2024 14:44:50 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Valida Adelantos Sueldo ',PrintName='Valida Adelantos Sueldo',Description='Si se marca esta opción, al completar un documento se validará si el empleado tiene saldo disponible para adelanto.',Updated=TO_DATE('2024-04-02 14:44:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001418 AND AD_Language='es_AR'
;

-- 02/04/2024 14:46:02 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009292,1,'Y','N','N',3005680,'N','Y',167,'N','LAR','EsDocumentoRRHH',100,0,TO_DATE('2024-04-02 14:46:02','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2024-04-02 14:46:02','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/04/2024 14:46:02 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009292 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/04/2024 14:46:03 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009293,1,'Y','N','N',3005681,'N','Y',167,'N','LAR','ValidaAdelantosSueldo',100,0,TO_DATE('2024-04-02 14:46:02','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2024-04-02 14:46:02','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/04/2024 14:46:03 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009293 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/04/2024 14:47:17 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
UPDATE AD_Field SET DisplayLogic='@EsDocumentoRRHH@=''Y''',Updated=TO_DATE('2024-04-02 14:47:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009293
;

-- 02/04/2024 14:48:32 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3009292
;

-- 02/04/2024 14:48:32 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3009293
;

-- 02/04/2024 14:48:50 ART
-- ISSUE #155: RRHH Validación adelantos de sueldo
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2024-04-02 14:48:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009293
;

-- Registración de script
SELECT register_migration_script_lar('0225_ISSUE-155.sql', 'LAR', '') FROM dual
;
