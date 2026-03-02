-- ISSUE #156:  Sueldos - Campos base para exportacion de haberes

-- 1) Cabecera de lote: tipo de liquidacion  (001/002)
ALTER TABLE LAR_LoteSueldos
    ADD COLUMN LAR_TipoLiquidacion VARCHAR(3);

ALTER TABLE LAR_LoteSueldos
    ALTER COLUMN LAR_TipoLiquidacion SET DEFAULT '001';

ALTER TABLE LAR_LoteSueldos
    ADD CONSTRAINT lar_lotesueldos_tipoliquidacion_chk
    CHECK (LAR_TipoLiquidacion IN ('001','002'));

-- 2) Banco pagador: numero de empresa/convenio 
ALTER TABLE C_Bank
    ADD COLUMN LAR_NroEmpresa NUMERIC(4,0);

ALTER TABLE C_Bank
    ADD CONSTRAINT c_bank_nroempresa_chk
    CHECK (
        LAR_NroEmpresa IS NULL
        OR LAR_NroEmpresa BETWEEN 1 AND 8999
    );

-- 3) Cuenta bancaria de acreditacion: codigo de dependencia 
ALTER TABLE C_BankAccount
    ADD COLUMN LAR_CodigoDependencia VARCHAR(15);

ALTER TABLE C_BankAccount
    ADD CONSTRAINT c_bankaccount_codigodep_chk
    CHECK (
        LAR_CodigoDependencia IS NULL
        OR LAR_CodigoDependencia ~ '^[0-9]{1,15}$'
    );


-- 23/02/2026 10:45:41 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001534,'lar_tipoliquidacion','LAR','lar_tipoliquidacion','lar_tipoliquidacion',0,TO_TIMESTAMP('2026-02-23 10:45:41','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-02-23 10:45:41','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 23/02/2026 10:45:41 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001534 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 23/02/2026 10:45:41 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005953,3000278,'LAR',0,'N','N','N','N',3,'N',10,'N',3001534,'N','Y','N','lar_tipoliquidacion','lar_tipoliquidacion',100,TO_TIMESTAMP('2026-02-23 10:45:41','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2026-02-23 10:45:41','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/02/2026 10:45:41 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005953 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/02/2026 10:46:41 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Element SET ColumnName='LAR_TipoLiquidacion', Name='LAR_TipoLiquidacion', PrintName='LAR_TipoLiquidacion',Updated=TO_TIMESTAMP('2026-02-23 10:46:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001534
;

-- 23/02/2026 10:46:41 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001534
;

-- 23/02/2026 10:46:41 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Column SET ColumnName='LAR_TipoLiquidacion', Name='LAR_TipoLiquidacion', Description=NULL, Help=NULL WHERE AD_Element_ID=3001534
;

-- 23/02/2026 10:46:41 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Process_Para SET ColumnName='LAR_TipoLiquidacion', Name='LAR_TipoLiquidacion', Description=NULL, Help=NULL, AD_Element_ID=3001534 WHERE UPPER(ColumnName)='LAR_TIPOLIQUIDACION' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 23/02/2026 10:46:41 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Process_Para SET ColumnName='LAR_TipoLiquidacion', Name='LAR_TipoLiquidacion', Description=NULL, Help=NULL WHERE AD_Element_ID=3001534 AND IsCentrallyMaintained='Y'
;

-- 23/02/2026 10:46:41 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Field SET Name='LAR_TipoLiquidacion', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001534) AND IsCentrallyMaintained='Y'
;

-- 23/02/2026 10:46:41 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_PrintFormatItem SET PrintName='LAR_TipoLiquidacion', Name='LAR_TipoLiquidacion' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001534)
;

-- 23/02/2026 10:47:14 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Tipo Liquidación',PrintName='Tipo Liquidación',Description='Tipo Liquidación, Sueldos Mensuales o SAC',Updated=TO_TIMESTAMP('2026-02-23 10:47:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001534 AND AD_Language='es_AR'
;

-- 23/02/2026 10:48:31 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,VFormat,EntityType,IsOrderByValue,Name,Description,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000181,'L','L','LAR','N','Tipo Liquidación','Tipo Liquidación: SAC, Sueldos Mensuales',0,0,100,TO_TIMESTAMP('2026-02-23 10:48:31','YYYY-MM-DD HH24:MI:SS'),'Y',TO_TIMESTAMP('2026-02-23 10:48:31','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/02/2026 10:48:31 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000181 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 23/02/2026 10:50:35 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Description,Value,Name,Updated,Created,CreatedBy,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000381,3000181,'LAR','Sueldos Mensuales','001','Sueldo',TO_TIMESTAMP('2026-02-23 10:50:35','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-02-23 10:50:35','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',0)
;

-- 23/02/2026 10:50:35 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000381 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 23/02/2026 10:50:50 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Description,Value,Name,Updated,Created,CreatedBy,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000382,3000181,'U','Sueldos Anual Complementario','002','S.A.C.',TO_TIMESTAMP('2026-02-23 10:50:50','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-02-23 10:50:50','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',0)
;

-- 23/02/2026 10:50:50 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000382 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 23/02/2026 10:50:58 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Ref_List SET Description='Sueldo Mensual',Updated=TO_TIMESTAMP('2026-02-23 10:50:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000381
;

-- 23/02/2026 10:50:58 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Ref_List_Trl SET IsTranslated='N' WHERE AD_Ref_List_ID=3000381
;

-- 23/02/2026 10:51:04 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Ref_List_Trl SET Description='Sueldos Mensual',Updated=TO_TIMESTAMP('2026-02-23 10:51:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000381 AND AD_Language='es_AR'
;

-- 23/02/2026 10:54:05 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Reference SET Name='RRHH Tipo Liquidación',Updated=TO_TIMESTAMP('2026-02-23 10:54:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=3000181
;

-- 23/02/2026 10:54:05 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Reference_Trl SET IsTranslated='N' WHERE AD_Reference_ID=3000181
;

-- 23/02/2026 10:54:16 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Ref_List SET EntityType='LAR', Description='Sueldo Anual Complementario',Updated=TO_TIMESTAMP('2026-02-23 10:54:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000382
;

-- 23/02/2026 10:54:16 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Ref_List_Trl SET IsTranslated='N' WHERE AD_Ref_List_ID=3000382
;

-- 23/02/2026 10:54:24 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Ref_List_Trl SET Description='Sueldo Anual Complementario',Updated=TO_TIMESTAMP('2026-02-23 10:54:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000382 AND AD_Language='es_AR'
;

-- 23/02/2026 10:54:33 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Column SET AD_Reference_Value_ID=3000181, AD_Reference_ID=17,Updated=TO_TIMESTAMP('2026-02-23 10:54:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005953
;

-- 23/02/2026 10:54:52 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Column SET IsMandatory='Y', IsAlwaysUpdateable='Y',Updated=TO_TIMESTAMP('2026-02-23 10:54:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005953
;

-- 23/02/2026 10:55:29 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009474,3,'Y','N','N',3005953,'N','Y',3000315,'N','LAR','LAR_TipoLiquidacion',100,0,TO_TIMESTAMP('2026-02-23 10:55:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2026-02-23 10:55:29','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/02/2026 10:55:29 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009474 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/02/2026 10:55:57 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001535,'lar_nroempresa','LAR','lar_nroempresa','lar_nroempresa',0,TO_TIMESTAMP('2026-02-23 10:55:57','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-02-23 10:55:57','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 23/02/2026 10:55:57 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001535 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 23/02/2026 10:55:57 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005954,296,'LAR',0,'N','N','N','N',4,'N',22,'N',3001535,'N','Y','N','lar_nroempresa','lar_nroempresa',100,TO_TIMESTAMP('2026-02-23 10:55:57','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2026-02-23 10:55:57','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/02/2026 10:55:57 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005954 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/02/2026 10:56:22 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Element SET ColumnName='LAR_NroEmpresa', Name='LAR_NroEmpresa', PrintName='LAR_NroEmpresa',Updated=TO_TIMESTAMP('2026-02-23 10:56:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001535
;

-- 23/02/2026 10:56:22 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001535
;

-- 23/02/2026 10:56:22 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Column SET ColumnName='LAR_NroEmpresa', Name='LAR_NroEmpresa', Description=NULL, Help=NULL WHERE AD_Element_ID=3001535
;

-- 23/02/2026 10:56:22 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Process_Para SET ColumnName='LAR_NroEmpresa', Name='LAR_NroEmpresa', Description=NULL, Help=NULL, AD_Element_ID=3001535 WHERE UPPER(ColumnName)='LAR_NROEMPRESA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 23/02/2026 10:56:22 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Process_Para SET ColumnName='LAR_NroEmpresa', Name='LAR_NroEmpresa', Description=NULL, Help=NULL WHERE AD_Element_ID=3001535 AND IsCentrallyMaintained='Y'
;

-- 23/02/2026 10:56:22 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Field SET Name='LAR_NroEmpresa', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001535) AND IsCentrallyMaintained='Y'
;

-- 23/02/2026 10:56:22 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_PrintFormatItem SET PrintName='LAR_NroEmpresa', Name='LAR_NroEmpresa' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001535)
;

-- 23/02/2026 10:56:43 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Nro. Empresa',PrintName='Número de Empresa otorgado por el Banco.',Updated=TO_TIMESTAMP('2026-02-23 10:56:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001535 AND AD_Language='es_AR'
;

-- 23/02/2026 10:57:18 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Column SET AD_Reference_ID=10, Name='LAR_NroEmpresa', ColumnName='LAR_NroEmpresa',Updated=TO_TIMESTAMP('2026-02-23 10:57:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005954
;

-- 23/02/2026 10:57:36 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009475,4,'Y','N','N',3005954,'N','Y',227,'N','LAR','LAR_NroEmpresa',100,0,TO_TIMESTAMP('2026-02-23 10:57:36','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2026-02-23 10:57:36','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/02/2026 10:57:36 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009475 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/02/2026 10:58:05 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001536,'lar_codigodependencia','LAR','lar_codigodependencia','lar_codigodependencia',0,TO_TIMESTAMP('2026-02-23 10:58:05','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-02-23 10:58:05','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 23/02/2026 10:58:05 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001536 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 23/02/2026 10:58:05 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005955,297,'LAR',0,'N','N','N','N',15,'N',10,'N',3001536,'N','Y','N','lar_codigodependencia','lar_codigodependencia',100,TO_TIMESTAMP('2026-02-23 10:58:05','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2026-02-23 10:58:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/02/2026 10:58:05 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005955 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/02/2026 10:58:31 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Element SET ColumnName='LAR_CodigoDependencia', Name='LAR_CodigoDependencia', PrintName='LAR_CodigoDependencia',Updated=TO_TIMESTAMP('2026-02-23 10:58:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001536
;

-- 23/02/2026 10:58:31 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001536
;

-- 23/02/2026 10:58:31 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Column SET ColumnName='LAR_CodigoDependencia', Name='LAR_CodigoDependencia', Description=NULL, Help=NULL WHERE AD_Element_ID=3001536
;

-- 23/02/2026 10:58:31 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Process_Para SET ColumnName='LAR_CodigoDependencia', Name='LAR_CodigoDependencia', Description=NULL, Help=NULL, AD_Element_ID=3001536 WHERE UPPER(ColumnName)='LAR_CODIGODEPENDENCIA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 23/02/2026 10:58:31 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Process_Para SET ColumnName='LAR_CodigoDependencia', Name='LAR_CodigoDependencia', Description=NULL, Help=NULL WHERE AD_Element_ID=3001536 AND IsCentrallyMaintained='Y'
;

-- 23/02/2026 10:58:31 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Field SET Name='LAR_CodigoDependencia', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001536) AND IsCentrallyMaintained='Y'
;

-- 23/02/2026 10:58:31 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_PrintFormatItem SET PrintName='LAR_CodigoDependencia', Name='LAR_CodigoDependencia' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001536)
;

-- 23/02/2026 10:58:48 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Codigo Dependencia',PrintName='Codigo Dependencia',Description='Codigo Dependencia Bancaria',Updated=TO_TIMESTAMP('2026-02-23 10:58:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001536 AND AD_Language='es_AR'
;

-- 23/02/2026 10:59:27 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009476,15,'Y','N','N',3005955,'N','Y',228,'N','LAR','LAR_CodigoDependencia',100,0,TO_TIMESTAMP('2026-02-23 10:59:27','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2026-02-23 10:59:27','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/02/2026 10:59:27 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009476 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/02/2026 10:59:54 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3009476
;

-- 23/02/2026 10:59:54 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=11016
;

-- 23/02/2026 10:59:54 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=2222
;

-- 23/02/2026 10:59:54 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3220
;

-- 23/02/2026 10:59:54 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=2219
;

-- 23/02/2026 10:59:54 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=4114
;

-- 23/02/2026 10:59:54 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=60881
;

-- 23/02/2026 10:59:54 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=2220
;

-- 23/02/2026 10:59:54 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=2221
;

-- 23/02/2026 10:59:54 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000089
;

-- 23/02/2026 10:59:54 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3002674
;

-- 23/02/2026 10:59:54 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3002675
;

-- 23/02/2026 10:59:54 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3007491
;

-- 23/02/2026 11:27:01 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Element_Trl SET PrintName='Nro. Empresa',Description='Número de Empresa otorgado por el Banco.',Updated=TO_TIMESTAMP('2026-02-23 11:27:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001535 AND AD_Language='es_AR'
;

-- 27/02/2026 10:24:40 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Process (Help,AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Classname,CopyFromProcess,Description,Value,Name,AD_Org_ID,AD_Client_ID,UpdatedBy,Created,CreatedBy,Updated,IsActive) VALUES ('El archivo generado queda adjunto al registro actual.',3000628,'N','N','3','N','N','Y','LAR',12,12,'ar.com.ergio.process.LAR_GenerarArchivoHaberesPatagonia','N','Genera el archivo con la información para el Banco.','LAR_GenerarArchivoExportacion','Generar Archivo Exportación',0,0,100,TO_TIMESTAMP('2026-02-27 10:24:40','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2026-02-27 10:24:40','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 27/02/2026 10:24:40 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000628 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 27/02/2026 10:26:14 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,DefaultValue,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3001151,0,3000628,100,'N',15,10,'Y','@#Date@','LAR','FechaPresentacion','FechaPresentacion','Y',0,100,TO_TIMESTAMP('2026-02-27 10:26:14','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-02-27 10:26:14','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 27/02/2026 10:26:14 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3001151 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 27/02/2026 10:26:21 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Process_Para_Trl SET IsTranslated='Y',Name='Fecha Presentacion ',Updated=TO_TIMESTAMP('2026-02-27 10:26:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3001151 AND AD_Language='es_AR'
;

-- 27/02/2026 10:26:38 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,DefaultValue,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3001152,0,3000628,100,'N',15,20,'Y','@#Date@','LAR','FechaAcreditacion','FechaAcreditacion','Y',0,100,TO_TIMESTAMP('2026-02-27 10:26:38','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-02-27 10:26:38','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 27/02/2026 10:26:38 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3001152 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 27/02/2026 10:26:43 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Process_Para_Trl SET IsTranslated='Y',Name='Fecha Acreditacion',Updated=TO_TIMESTAMP('2026-02-27 10:26:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3001152 AND AD_Language='es_AR'
;

-- 27/02/2026 10:27:25 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,DefaultValue,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3001153,0,3000628,100,'N',10,30,'Y','01','LAR','NroEnvio','NroEnvio','Y',0,100,TO_TIMESTAMP('2026-02-27 10:27:25','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-02-27 10:27:25','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 27/02/2026 10:27:25 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3001153 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 27/02/2026 10:27:35 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Process_Para_Trl SET IsTranslated='Y',Name='Nro. Envío',Updated=TO_TIMESTAMP('2026-02-27 10:27:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3001153 AND AD_Language='es_AR'
;

-- 27/02/2026 10:43:33 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Column SET AD_Process_ID=3000628, IsAlwaysUpdateable='Y',Updated=TO_TIMESTAMP('2026-02-27 10:43:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005899
;

-- 27/02/2026 10:46:55 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3009474
;

-- 27/02/2026 10:46:55 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3009418
;

-- 27/02/2026 10:46:55 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3009404
;

-- 27/02/2026 10:46:55 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3009407
;

-- 27/02/2026 10:46:55 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3009435
;

-- 27/02/2026 10:46:55 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3009437
;

-- 27/02/2026 10:46:55 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3009436
;

-- 27/02/2026 10:46:55 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3009417
;

-- 27/02/2026 10:46:55 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3009414
;

-- 27/02/2026 10:46:55 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3009409
;

-- 27/02/2026 10:46:55 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3009412
;

-- 27/02/2026 10:46:55 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3009410
;

-- 27/02/2026 10:46:55 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3009416
;

-- 27/02/2026 10:46:55 ART
-- ISSUE #155: Lote Sueldos - Exportación para Banco
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3009434
;

-- Registración de script
SELECT register_migration_script_lar('0245_ISSUE-155.sql', 'LAR', '')
;
