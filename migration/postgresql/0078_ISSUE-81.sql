-- ISSUE #81: Retenciones de Ganancias
-- Se agrega la columna para determinar el tipo de inscripción en el impuesto a las Ganancias
ALTER TABLE C_BPartner ADD COLUMN
LAR_TipoGanancias character(1) DEFAULT 'I'::bpchar;

-- Se agrega la opción de utilizar este tipo de inscripción en las Reglas de configuración de Retenciones
ALTER TABLE LCO_WithholdingRuleConf ADD COLUMN
LAR_UsaTipoGananciasBP character(1) DEFAULT 'N'::bpchar;

-- Actualiza los registros existentes con un valor para permitir la restricción
UPDATE LCO_WithholdingRuleConf SET LAR_UsaTipoGananciasBP = 'N';

-- Restriccion de valores Y/N
ALTER TABLE LCO_WithholdingRuleConf ADD CONSTRAINT
lco_withholdingruleconf_LAR_UsaTipoGananciasBP_check CHECK ((LAR_UsaTipoGananciasBP = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])));

-- Se agrega la columna que permite setear esta opción en las Reglas de Retenciones
ALTER TABLE LCO_WithholdingRule ADD COLUMN
LAR_TipoGananciasBP character(1) DEFAULT NULL::bpchar;

-- Se crean las columnas y campos en el DA

-- 23/10/2016 9:02:22 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,Description,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000055,'L','LAR','N','C_BPartner Tipo Ganancias','Inscripto - No Inscripto',0,0,100,TO_TIMESTAMP('2016-10-23 09:02:21','YYYY-MM-DD HH24:MI:SS'),'Y',TO_TIMESTAMP('2016-10-23 09:02:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/10/2016 9:02:22 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000055 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 23/10/2016 9:03:33 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Description,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000100,3000055,'LAR','Inscripto en el impuesto a las ganancias.','I','Inscripto',TO_TIMESTAMP('2016-10-23 09:03:32','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2016-10-23 09:03:32','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 23/10/2016 9:03:33 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000100 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 23/10/2016 9:03:54 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Description,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000101,3000055,'LAR','No Inscripto en el impuesto a las ganancias.','N','No Inscripto',TO_TIMESTAMP('2016-10-23 09:03:54','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2016-10-23 09:03:54','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 23/10/2016 9:03:54 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000101 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 23/10/2016 9:14:41 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000374,'lar_tipoganancias','LAR','lar_tipoganancias','lar_tipoganancias',0,TO_TIMESTAMP('2016-10-23 09:14:40','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-10-23 09:14:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 23/10/2016 9:14:41 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000374 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 23/10/2016 9:14:41 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001877,291,'LAR',0,'N','N','N','N',1,'N',20,'N',3000374,'N','Y','N','lar_tipoganancias','lar_tipoganancias',100,TO_TIMESTAMP('2016-10-23 09:14:40','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-10-23 09:14:40','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/10/2016 9:14:41 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001877 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/10/2016 9:15:22 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Element SET ColumnName='LAR_TipoGanancias', Name='LAR_TipoGanancias', PrintName='LAR_TipoGanancias',Updated=TO_TIMESTAMP('2016-10-23 09:15:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000374
;

-- 23/10/2016 9:15:22 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000374
;

-- 23/10/2016 9:15:22 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Column SET ColumnName='LAR_TipoGanancias', Name='LAR_TipoGanancias', Description=NULL, Help=NULL WHERE AD_Element_ID=3000374
;

-- 23/10/2016 9:15:22 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Process_Para SET ColumnName='LAR_TipoGanancias', Name='LAR_TipoGanancias', Description=NULL, Help=NULL, AD_Element_ID=3000374 WHERE UPPER(ColumnName)='LAR_TIPOGANANCIAS' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 23/10/2016 9:15:22 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Process_Para SET ColumnName='LAR_TipoGanancias', Name='LAR_TipoGanancias', Description=NULL, Help=NULL WHERE AD_Element_ID=3000374 AND IsCentrallyMaintained='Y'
;

-- 23/10/2016 9:15:22 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET Name='LAR_TipoGanancias', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000374) AND IsCentrallyMaintained='Y'
;

-- 23/10/2016 9:15:22 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_PrintFormatItem SET PrintName='LAR_TipoGanancias', Name='LAR_TipoGanancias' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000374)
;

-- 23/10/2016 9:18:53 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Column SET DefaultValue='I', AD_Reference_Value_ID=3000055, AD_Reference_ID=17,Updated=TO_TIMESTAMP('2016-10-23 09:18:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001877
;

-- 23/10/2016 9:20:24 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000375,'lar_usatipogananciasbp','LAR','lar_usatipogananciasbp','lar_usatipogananciasbp',0,TO_TIMESTAMP('2016-10-23 09:20:24','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-10-23 09:20:24','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 23/10/2016 9:20:24 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000375 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 23/10/2016 9:20:26 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001878,1000005,'LAR',0,'N','N','N','N',1,'N',20,'N',3000375,'N','Y','N','lar_usatipogananciasbp','lar_usatipogananciasbp',100,TO_TIMESTAMP('2016-10-23 09:20:24','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-10-23 09:20:24','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/10/2016 9:20:26 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001878 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/10/2016 9:20:58 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Element SET ColumnName='LAR_UsaTipoGananciasBP', Name='LAR_UsaTipoGananciasBP', PrintName='LAR_UsaTipoGananciasBP',Updated=TO_TIMESTAMP('2016-10-23 09:20:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000375
;

-- 23/10/2016 9:20:58 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000375
;

-- 23/10/2016 9:20:58 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Column SET ColumnName='LAR_UsaTipoGananciasBP', Name='LAR_UsaTipoGananciasBP', Description=NULL, Help=NULL WHERE AD_Element_ID=3000375
;

-- 23/10/2016 9:20:58 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Process_Para SET ColumnName='LAR_UsaTipoGananciasBP', Name='LAR_UsaTipoGananciasBP', Description=NULL, Help=NULL, AD_Element_ID=3000375 WHERE UPPER(ColumnName)='LAR_USATIPOGANANCIASBP' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 23/10/2016 9:20:58 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Process_Para SET ColumnName='LAR_UsaTipoGananciasBP', Name='LAR_UsaTipoGananciasBP', Description=NULL, Help=NULL WHERE AD_Element_ID=3000375 AND IsCentrallyMaintained='Y'
;

-- 23/10/2016 9:20:58 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET Name='LAR_UsaTipoGananciasBP', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000375) AND IsCentrallyMaintained='Y'
;

-- 23/10/2016 9:20:58 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_PrintFormatItem SET PrintName='LAR_UsaTipoGananciasBP', Name='LAR_UsaTipoGananciasBP' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000375)
;

-- 23/10/2016 9:22:01 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Column SET DefaultValue='N',Updated=TO_TIMESTAMP('2016-10-23 09:22:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001878
;

-- 23/10/2016 9:23:11 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000376,'lar_tipogananciasbp','LAR','lar_tipogananciasbp','lar_tipogananciasbp',0,TO_TIMESTAMP('2016-10-23 09:23:11','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-10-23 09:23:11','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 23/10/2016 9:23:11 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000376 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 23/10/2016 9:23:11 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001879,1000006,'LAR',0,'N','N','N','N',1,'N',20,'N',3000376,'N','Y','N','lar_tipogananciasbp','lar_tipogananciasbp',100,TO_TIMESTAMP('2016-10-23 09:23:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-10-23 09:23:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/10/2016 9:23:11 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001879 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/10/2016 9:24:02 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Element SET ColumnName='LAR_TipoGananciasBP', Name='LAR_TipoGananciasBP', PrintName='LAR_TipoGananciasBP',Updated=TO_TIMESTAMP('2016-10-23 09:24:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000376
;

-- 23/10/2016 9:24:02 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000376
;

-- 23/10/2016 9:24:02 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Column SET ColumnName='LAR_TipoGananciasBP', Name='LAR_TipoGananciasBP', Description=NULL, Help=NULL WHERE AD_Element_ID=3000376
;

-- 23/10/2016 9:24:02 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Process_Para SET ColumnName='LAR_TipoGananciasBP', Name='LAR_TipoGananciasBP', Description=NULL, Help=NULL, AD_Element_ID=3000376 WHERE UPPER(ColumnName)='LAR_TIPOGANANCIASBP' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 23/10/2016 9:24:02 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Process_Para SET ColumnName='LAR_TipoGananciasBP', Name='LAR_TipoGananciasBP', Description=NULL, Help=NULL WHERE AD_Element_ID=3000376 AND IsCentrallyMaintained='Y'
;

-- 23/10/2016 9:24:02 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET Name='LAR_TipoGananciasBP', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000376) AND IsCentrallyMaintained='Y'
;

-- 23/10/2016 9:24:02 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_PrintFormatItem SET PrintName='LAR_TipoGananciasBP', Name='LAR_TipoGananciasBP' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000376)
;

-- 23/10/2016 9:27:21 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Column SET AD_Reference_Value_ID=3000055, AD_Reference_ID=17,Updated=TO_TIMESTAMP('2016-10-23 09:27:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001879
;

-- 23/10/2016 9:28:53 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Column (ColumnSQL,DefaultValue,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('(SELECT LAR_UsaTipoGananciasBP FROM LCO_WithholdingRuleConf WHERE LCO_WithholdingRuleConf.LCO_WithholdingType_ID=LCO_WithholdingRule.LCO_WithholdingType_ID)','N',3001880,1000006,'LAR',0,'N','N','N',0,'N',1,'N',20,'Y','N',3000375,'N','Y','N','N','N','LAR_UsaTipoGananciasBP','LAR_UsaTipoGananciasBP','N',100,TO_TIMESTAMP('2016-10-23 09:28:52','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-10-23 09:28:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/10/2016 9:28:53 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001880 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/10/2016 9:30:18 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Usa Tipo Ganancias BP',PrintName='Usa Tipo Ganancias BP',Updated=TO_TIMESTAMP('2016-10-23 09:30:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000375 AND AD_Language='es_AR'
;

-- 23/10/2016 9:31:50 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Impuesto a las Ganancias',PrintName='Impuesto a las Ganancias',Updated=TO_TIMESTAMP('2016-10-23 09:31:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000374 AND AD_Language='es_AR'
;

-- 23/10/2016 9:32:44 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002953,1,'Y','N','N',3001877,'N','Y',220,'N','LAR','LAR_TipoGanancias',100,0,'Y',TO_TIMESTAMP('2016-10-23 09:32:43','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2016-10-23 09:32:43','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/10/2016 9:32:44 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002953 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/10/2016 9:35:29 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3002953
;

-- 23/10/2016 9:35:29 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3001776
;

-- 23/10/2016 9:35:29 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=2149
;

-- 23/10/2016 9:35:29 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3001605
;

-- 23/10/2016 9:35:29 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=2144
;

-- 23/10/2016 9:35:29 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=2162
;

-- 23/10/2016 9:35:29 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3955
;

-- 23/10/2016 9:35:29 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=2124
;

-- 23/10/2016 9:35:29 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=2164
;

-- 23/10/2016 9:35:29 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=2139
;

-- 23/10/2016 9:35:29 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=9620
;

-- 23/10/2016 9:35:29 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=2148
;

-- 23/10/2016 9:35:29 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=2128
;

-- 23/10/2016 9:35:29 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=2127
;

-- 23/10/2016 9:35:29 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=2146
;

-- 23/10/2016 9:35:29 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=2154
;

-- 23/10/2016 9:35:29 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=2153
;

-- 23/10/2016 9:35:29 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=54555
;

-- 23/10/2016 9:35:29 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=2135
;

-- 23/10/2016 9:35:29 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=57533
;

-- 23/10/2016 9:35:45 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-10-23 09:35:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001776
;

-- 23/10/2016 9:36:07 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2016-10-23 09:36:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2164
;

-- 23/10/2016 9:38:03 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET IsMandatory='Y',Updated=TO_TIMESTAMP('2016-10-23 09:38:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002953
;

-- 23/10/2016 9:59:46 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Impuesto a las Ganancias',Updated=TO_TIMESTAMP('2016-10-23 09:59:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002953 AND AD_Language='es_AR'
;

-- 23/10/2016 10:00:02 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Column_Trl SET Name='Impuesto a las Ganancias',IsTranslated='Y',Updated=TO_TIMESTAMP('2016-10-23 10:00:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001877 AND AD_Language='es_AR'
;

-- 23/10/2016 10:01:22 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Column_Trl SET Name='Impuesto a las Ganancias SdN',Updated=TO_TIMESTAMP('2016-10-23 10:01:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001879 AND AD_Language='es_AR'
;

-- 23/10/2016 10:02:55 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Column_Trl SET Name='Usa Ganancias SdN',IsTranslated='Y',Updated=TO_TIMESTAMP('2016-10-23 10:02:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001878 AND AD_Language='es_AR'
;

-- 23/10/2016 10:05:00 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Column_Trl SET Name='Fecha Inicio Actividades',IsTranslated='Y',Updated=TO_TIMESTAMP('2016-10-23 10:05:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000984 AND AD_Language='es_AR'
;

-- 23/10/2016 10:05:19 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Fecha Inicio Actividades',Updated=TO_TIMESTAMP('2016-10-23 10:05:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001776 AND AD_Language='es_AR'
;

-- 23/10/2016 10:06:38 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002954,1,'Y','N','N',3001878,'N','Y',1000009,'N','LAR','LAR_UsaTipoGananciasBP',100,0,'Y',TO_TIMESTAMP('2016-10-23 10:06:38','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2016-10-23 10:06:38','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/10/2016 10:06:38 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002954 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/10/2016 10:07:50 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3002954
;

-- 23/10/2016 10:07:50 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=1000137
;

-- 23/10/2016 10:07:50 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000062
;

-- 23/10/2016 10:07:50 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000063
;

-- 23/10/2016 10:07:50 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000061
;

-- 23/10/2016 10:08:36 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Usa Tipo Ganancias BP',Updated=TO_TIMESTAMP('2016-10-23 10:08:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002954 AND AD_Language='es_AR'
;

-- 23/10/2016 10:09:13 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002955,1,'Y','N','N',3001879,'N','Y',1000010,'N','LAR','LAR_TipoGananciasBP',100,0,'Y',TO_TIMESTAMP('2016-10-23 10:09:12','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2016-10-23 10:09:12','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/10/2016 10:09:13 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002955 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/10/2016 10:09:13 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002956,1,'Y','N','N',3001880,'N','Y',1000010,'N','LAR','LAR_UsaTipoGananciasBP',100,0,'Y',TO_TIMESTAMP('2016-10-23 10:09:13','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2016-10-23 10:09:13','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/10/2016 10:09:13 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002956 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/10/2016 10:09:57 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002956
;

-- 23/10/2016 10:09:58 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3002955
;

-- 23/10/2016 10:09:58 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=1000161
;

-- 23/10/2016 10:09:58 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=1000162
;

-- 23/10/2016 10:09:58 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=1000163
;

-- 23/10/2016 10:12:28 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Field SET DisplayLogic='@LAR_UsaTipoGananciasBP@=Y',Updated=TO_TIMESTAMP('2016-10-23 10:12:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002955
;

-- ISSUE #81: Retenciones
-- Se agregan las columnas relacionadas a las exenciones de Retenciones
ALTER TABLE C_BPartner
-- Ganancias
ADD COLUMN LAR_Exencion_Ganancias numeric;
ALTER TABLE C_BPartner
ADD COLUMN LAR_Importe_Exencion_Ganancias numeric DEFAULT 0;
ALTER TABLE C_BPartner
ADD COLUMN LAR_NroCertificado_Ganancias character varying(30);
ALTER TABLE C_BPartner
ADD COLUMN LAR_Vencimiento_Cert_Ganancias timestamp without time zone;
-- IIBB
ALTER TABLE C_BPartner
ADD COLUMN LAR_Exencion_IIBB numeric;
ALTER TABLE C_BPartner
ADD COLUMN LAR_Importe_Exencion_IIBB numeric DEFAULT 0;
ALTER TABLE C_BPartner
ADD COLUMN LAR_NroCertificado_IIBB character varying(30);
ALTER TABLE C_BPartner
ADD COLUMN LAR_Vencimiento_Cert_IIBB timestamp without time zone;
ALTER TABLE C_BPartner
-- IVA
ADD COLUMN LAR_Exento_Retenciones_IVA character(1) DEFAULT 'N'::bpchar;
ALTER TABLE C_BPartner
ADD COLUMN LAR_Exencion_IVA numeric;
ALTER TABLE C_BPartner
ADD COLUMN LAR_Importe_Exencion_IVA numeric DEFAULT 0;
ALTER TABLE C_BPartner
ADD COLUMN LAR_NroCertificado_IVA character varying(30);
ALTER TABLE C_BPartner
ADD COLUMN LAR_Inicio_Cert_IIBB timestamp without time zone;
ALTER TABLE C_BPartner
ADD COLUMN LAR_Vencimiento_Cert_IVA timestamp without time zone;
ALTER TABLE C_BPartner
ADD CONSTRAINT C_BPartner_LAR_Exento_Retenciones_IVA_check CHECK ((LAR_Exento_Retenciones_IVA = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])));
ALTER TABLE C_BPartner
-- SUSS
ADD COLUMN LAR_Exento_Retenciones_SUSS character(1) DEFAULT 'N'::bpchar;
ALTER TABLE C_BPartner
ADD COLUMN LAR_Exencion_SUSS numeric;
ALTER TABLE C_BPartner
ADD COLUMN LAR_Importe_Exencion_SUSS numeric DEFAULT 0;
ALTER TABLE C_BPartner
ADD COLUMN LAR_NroCertificado_SUSS character varying(30);
ALTER TABLE C_BPartner
ADD COLUMN LAR_Inicio_Cert_SUSS timestamp without time zone;
ALTER TABLE C_BPartner
ADD COLUMN LAR_Vencimiento_Cert_SUSS timestamp without time zone;
ALTER TABLE C_BPartner
ADD CONSTRAINT C_BPartner_LAR_Exento_Retenciones_SUSS_check CHECK ((LAR_Exento_Retenciones_SUSS = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])))
;

-- LAR_Inicio_Cert_IIBB
-- 23/10/2016 9:14:41 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000426,'LAR_Inicio_Cert_IIBB','LAR','LAR_Inicio_Cert_IIBB','LAR_Inicio_Cert_IIBB',0,TO_TIMESTAMP('2016-10-23 09:14:40','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-10-23 09:14:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 23/10/2016 9:14:41 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000426 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 23/10/2016 9:30:18 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Fecha Inicio Exención IIBB',PrintName='Fecha Inicio Exención IIBB',Updated=TO_TIMESTAMP('2016-10-23 09:30:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000426 AND AD_Language='es_AR'
;

-- LAR_Exento_Retenciones_SUSS
-- 23/10/2016 9:14:41 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000420,'LAR_Exento_Retenciones_SUSS','LAR','LAR_Exento_Retenciones_SUSS','LAR_Exento_Retenciones_SUSS',0,TO_TIMESTAMP('2016-10-23 09:14:40','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-10-23 09:14:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 23/10/2016 9:14:41 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000420 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 23/10/2016 9:30:18 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Exento Retenciones SUSS',PrintName='Exento Retenciones SUSS',Updated=TO_TIMESTAMP('2016-10-23 09:30:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000420 AND AD_Language='es_AR'
;


-- LAR_Exencion_SUSS
-- 23/10/2016 9:14:41 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000421,'LAR_Exencion_SUSS','LAR','LAR_Exencion_SUSS','LAR_Exencion_SUSS',0,TO_TIMESTAMP('2016-10-23 09:14:40','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-10-23 09:14:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 23/10/2016 9:14:41 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000421 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 23/10/2016 9:30:18 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='% Exención Retenciones SUSS',PrintName='% Exención Retenciones SUSS',Updated=TO_TIMESTAMP('2016-10-23 09:30:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000421 AND AD_Language='es_AR'
;


-- LAR_Importe_Exencion_SUSS
-- 23/10/2016 9:14:41 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000422,'LAR_Importe_Exencion_SUSS','LAR','LAR_Importe_Exencion_SUSS','LAR_Importe_Exencion_SUSS',0,TO_TIMESTAMP('2016-10-23 09:14:40','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-10-23 09:14:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 23/10/2016 9:14:41 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000422 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 23/10/2016 9:30:18 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Importe Exención Ret. SUSS',PrintName='Importe Exención Ret. SUSS',Updated=TO_TIMESTAMP('2016-10-23 09:30:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000422 AND AD_Language='es_AR'
;



-- LAR_NroCertificado_SUSS
-- 23/10/2016 9:14:41 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000423,'LAR_NroCertificado_SUSS','LAR','LAR_NroCertificado_SUSS','LAR_NroCertificado_SUSS',0,TO_TIMESTAMP('2016-10-23 09:14:40','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-10-23 09:14:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 23/10/2016 9:14:41 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000423 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 23/10/2016 9:30:18 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Nro. Certificado Exención Ret. SUSS',PrintName='Nro. Certificado Exención Ret. SUSS',Updated=TO_TIMESTAMP('2016-10-23 09:30:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000423 AND AD_Language='es_AR'
;



-- LAR_Inicio_Cert_SUSS
-- 23/10/2016 9:14:41 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000424,'LAR_Inicio_Cert_SUSS','LAR','LAR_Inicio_Cert_SUSS','LAR_Inicio_Cert_SUSS',0,TO_TIMESTAMP('2016-10-23 09:14:40','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-10-23 09:14:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 23/10/2016 9:14:41 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000424 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 23/10/2016 9:30:18 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Fecha Inicio Exención SUSS',PrintName='Fecha Inicio Exención SUSS',Updated=TO_TIMESTAMP('2016-10-23 09:30:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000424 AND AD_Language='es_AR'
;



-- LAR_Vencimiento_Cert_SUSS
-- 23/10/2016 9:14:41 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000425,'LAR_Vencimiento_Cert_SUSS','LAR','LAR_Vencimiento_Cert_SUSS','LAR_Vencimiento_Cert_SUSS',0,TO_TIMESTAMP('2016-10-23 09:14:40','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-10-23 09:14:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 23/10/2016 9:14:41 ART
-- ISSUE #81: Retenciones de Ganancias
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000425 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 23/10/2016 9:30:18 ART
-- ISSUE #81: Retenciones de Ganancias
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Vencimiento Cert. Exención SUSS',PrintName='Vencimiento Cert. Exención SUSS',Updated=TO_TIMESTAMP('2016-10-23 09:30:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000425 AND AD_Language='es_AR'
;


-- 26/10/2016 20:29:11 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000378,'lar_exencion_ganancias','LAR','lar_exencion_ganancias','lar_exencion_ganancias',0,TO_TIMESTAMP('2016-10-26 20:29:10','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-10-26 20:29:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 26/10/2016 20:29:11 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000378 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 26/10/2016 20:29:11 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001883,291,'LAR',0,'N','N','N','N',131089,'N',22,'N',3000378,'N','Y','N','lar_exencion_ganancias','lar_exencion_ganancias',100,TO_TIMESTAMP('2016-10-26 20:29:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-10-26 20:29:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/10/2016 20:29:11 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001883 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 26/10/2016 20:29:11 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000379,'lar_importe_exencion_ganancias','LAR','lar_importe_exencion_ganancias','lar_importe_exencion_ganancias',0,TO_TIMESTAMP('2016-10-26 20:29:11','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-10-26 20:29:11','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 26/10/2016 20:29:11 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000379 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 26/10/2016 20:29:12 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001884,291,'LAR',0,'N','N','N','N',131089,'N',22,'N',3000379,'N','Y','N','lar_importe_exencion_ganancias','lar_importe_exencion_ganancias',100,TO_TIMESTAMP('2016-10-26 20:29:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-10-26 20:29:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/10/2016 20:29:12 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001884 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 26/10/2016 20:29:14 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000380,'lar_nrocertificado_ganancias','LAR','lar_nrocertificado_ganancias','lar_nrocertificado_ganancias',0,TO_TIMESTAMP('2016-10-26 20:29:12','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-10-26 20:29:12','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 26/10/2016 20:29:14 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000380 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 26/10/2016 20:29:14 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001885,291,'LAR',0,'N','N','N','N',30,'N',10,'N',3000380,'N','Y','N','lar_nrocertificado_ganancias','lar_nrocertificado_ganancias',100,TO_TIMESTAMP('2016-10-26 20:29:12','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-10-26 20:29:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/10/2016 20:29:14 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001885 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 26/10/2016 20:29:14 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000381,'lar_vencimiento_cert_ganancias','LAR','lar_vencimiento_cert_ganancias','lar_vencimiento_cert_ganancias',0,TO_TIMESTAMP('2016-10-26 20:29:14','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-10-26 20:29:14','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 26/10/2016 20:29:14 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000381 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 26/10/2016 20:29:14 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001886,291,'LAR',0,'N','N','N','N',29,'N',16,'N',3000381,'N','Y','N','lar_vencimiento_cert_ganancias','lar_vencimiento_cert_ganancias',100,TO_TIMESTAMP('2016-10-26 20:29:14','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-10-26 20:29:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/10/2016 20:29:14 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001886 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 26/10/2016 20:29:14 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000382,'lar_exencion_iibb','LAR','lar_exencion_iibb','lar_exencion_iibb',0,TO_TIMESTAMP('2016-10-26 20:29:14','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-10-26 20:29:14','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 26/10/2016 20:29:14 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000382 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 26/10/2016 20:29:15 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001887,291,'LAR',0,'N','N','N','N',131089,'N',22,'N',3000382,'N','Y','N','lar_exencion_iibb','lar_exencion_iibb',100,TO_TIMESTAMP('2016-10-26 20:29:14','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-10-26 20:29:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/10/2016 20:29:15 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001887 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 26/10/2016 20:29:15 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000383,'lar_importe_exencion_iibb','LAR','lar_importe_exencion_iibb','lar_importe_exencion_iibb',0,TO_TIMESTAMP('2016-10-26 20:29:15','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-10-26 20:29:15','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 26/10/2016 20:29:15 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000383 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 26/10/2016 20:29:15 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001888,291,'LAR',0,'N','N','N','N',131089,'N',22,'N',3000383,'N','Y','N','lar_importe_exencion_iibb','lar_importe_exencion_iibb',100,TO_TIMESTAMP('2016-10-26 20:29:15','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-10-26 20:29:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/10/2016 20:29:15 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001888 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 26/10/2016 20:29:15 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000384,'lar_nrocertificado_iibb','LAR','lar_nrocertificado_iibb','lar_nrocertificado_iibb',0,TO_TIMESTAMP('2016-10-26 20:29:15','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-10-26 20:29:15','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 26/10/2016 20:29:15 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000384 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 26/10/2016 20:29:15 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001889,291,'LAR',0,'N','N','N','N',30,'N',10,'N',3000384,'N','Y','N','lar_nrocertificado_iibb','lar_nrocertificado_iibb',100,TO_TIMESTAMP('2016-10-26 20:29:15','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-10-26 20:29:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/10/2016 20:29:15 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001889 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 26/10/2016 20:29:17 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000385,'lar_vencimiento_cert_iibb','LAR','lar_vencimiento_cert_iibb','lar_vencimiento_cert_iibb',0,TO_TIMESTAMP('2016-10-26 20:29:15','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-10-26 20:29:15','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 26/10/2016 20:29:17 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000385 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 26/10/2016 20:29:17 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001890,291,'LAR',0,'N','N','N','N',29,'N',16,'N',3000385,'N','Y','N','lar_vencimiento_cert_iibb','lar_vencimiento_cert_iibb',100,TO_TIMESTAMP('2016-10-26 20:29:15','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-10-26 20:29:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/10/2016 20:29:17 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001890 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 26/10/2016 20:29:17 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000386,'lar_exento_retenciones_iva','LAR','lar_exento_retenciones_iva','lar_exento_retenciones_iva',0,TO_TIMESTAMP('2016-10-26 20:29:17','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-10-26 20:29:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 26/10/2016 20:29:17 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000386 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 26/10/2016 20:29:17 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001891,291,'LAR',0,'N','N','N','N',1,'N',20,'N',3000386,'N','Y','N','lar_exento_retenciones_iva','lar_exento_retenciones_iva',100,TO_TIMESTAMP('2016-10-26 20:29:17','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-10-26 20:29:17','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/10/2016 20:29:17 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001891 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 26/10/2016 20:29:17 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000387,'lar_exencion_iva','LAR','lar_exencion_iva','lar_exencion_iva',0,TO_TIMESTAMP('2016-10-26 20:29:17','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-10-26 20:29:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 26/10/2016 20:29:17 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000387 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 26/10/2016 20:29:18 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001892,291,'LAR',0,'N','N','N','N',131089,'N',22,'N',3000387,'N','Y','N','lar_exencion_iva','lar_exencion_iva',100,TO_TIMESTAMP('2016-10-26 20:29:17','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-10-26 20:29:17','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/10/2016 20:29:18 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001892 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 26/10/2016 20:29:18 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000388,'lar_importe_exencion_iva','LAR','lar_importe_exencion_iva','lar_importe_exencion_iva',0,TO_TIMESTAMP('2016-10-26 20:29:18','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-10-26 20:29:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 26/10/2016 20:29:18 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000388 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 26/10/2016 20:29:18 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001893,291,'LAR',0,'N','N','N','N',131089,'N',22,'N',3000388,'N','Y','N','lar_importe_exencion_iva','lar_importe_exencion_iva',100,TO_TIMESTAMP('2016-10-26 20:29:18','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-10-26 20:29:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/10/2016 20:29:18 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001893 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 26/10/2016 20:29:18 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000389,'lar_nrocertificado_iva','LAR','lar_nrocertificado_iva','lar_nrocertificado_iva',0,TO_TIMESTAMP('2016-10-26 20:29:18','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-10-26 20:29:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 26/10/2016 20:29:18 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000389 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 26/10/2016 20:29:18 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001894,291,'LAR',0,'N','N','N','N',30,'N',10,'N',3000389,'N','Y','N','lar_nrocertificado_iva','lar_nrocertificado_iva',100,TO_TIMESTAMP('2016-10-26 20:29:18','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-10-26 20:29:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/10/2016 20:29:18 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001894 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 26/10/2016 20:29:19 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000390,'lar_vencimiento_cert_iva','LAR','lar_vencimiento_cert_iva','lar_vencimiento_cert_iva',0,TO_TIMESTAMP('2016-10-26 20:29:18','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-10-26 20:29:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 26/10/2016 20:29:19 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000390 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 26/10/2016 20:29:19 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001895,291,'LAR',0,'N','N','N','N',29,'N',16,'N',3000390,'N','Y','N','lar_vencimiento_cert_iva','lar_vencimiento_cert_iva',100,TO_TIMESTAMP('2016-10-26 20:29:18','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-10-26 20:29:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 26/10/2016 20:29:19 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001895 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 26/10/2016 22:22:50 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element SET ColumnName='LAR_Exencion_Ganancias', Name='LAR_Exencion_Ganancias', PrintName='LAR_Exencion_Ganancias',Updated=TO_TIMESTAMP('2016-10-26 22:22:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000378
;

-- 26/10/2016 22:22:50 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000378
;

-- 26/10/2016 22:22:50 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET ColumnName='LAR_Exencion_Ganancias', Name='LAR_Exencion_Ganancias', Description=NULL, Help=NULL WHERE AD_Element_ID=3000378
;

-- 26/10/2016 22:22:50 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_Exencion_Ganancias', Name='LAR_Exencion_Ganancias', Description=NULL, Help=NULL, AD_Element_ID=3000378 WHERE UPPER(ColumnName)='LAR_EXENCION_GANANCIAS' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 26/10/2016 22:22:50 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_Exencion_Ganancias', Name='LAR_Exencion_Ganancias', Description=NULL, Help=NULL WHERE AD_Element_ID=3000378 AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:22:50 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET Name='LAR_Exencion_Ganancias', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000378) AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:22:50 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_PrintFormatItem SET PrintName='LAR_Exencion_Ganancias', Name='LAR_Exencion_Ganancias' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000378)
;

-- 26/10/2016 22:23:23 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET FieldLength=22, Name='LAR_Exencion_Ganancias', ColumnName='LAR_Exencion_Ganancias',Updated=TO_TIMESTAMP('2016-10-26 22:23:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001883
;

-- 26/10/2016 22:25:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element SET ColumnName='LAR_Exencion_IIBB', Name='LAR_Exencion_IIBB', PrintName='LAR_Exencion_IIBB',Updated=TO_TIMESTAMP('2016-10-26 22:25:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000382
;

-- 26/10/2016 22:25:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000382
;

-- 26/10/2016 22:25:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET ColumnName='LAR_Exencion_IIBB', Name='LAR_Exencion_IIBB', Description=NULL, Help=NULL WHERE AD_Element_ID=3000382
;

-- 26/10/2016 22:25:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_Exencion_IIBB', Name='LAR_Exencion_IIBB', Description=NULL, Help=NULL, AD_Element_ID=3000382 WHERE UPPER(ColumnName)='LAR_EXENCION_IIBB' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 26/10/2016 22:25:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_Exencion_IIBB', Name='LAR_Exencion_IIBB', Description=NULL, Help=NULL WHERE AD_Element_ID=3000382 AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:25:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET Name='LAR_Exencion_IIBB', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000382) AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:25:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_PrintFormatItem SET PrintName='LAR_Exencion_IIBB', Name='LAR_Exencion_IIBB' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000382)
;

-- 26/10/2016 22:26:03 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='% Exención IIBB',PrintName='% Exención IIBB',Updated=TO_TIMESTAMP('2016-10-26 22:26:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000382 AND AD_Language='es_AR'
;

-- 26/10/2016 22:26:41 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET FieldLength=22, Name='LAR_Exencion_IIBB', ColumnName='LAR_Exencion_IIBB',Updated=TO_TIMESTAMP('2016-10-26 22:26:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001887
;

-- 26/10/2016 22:27:15 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element SET ColumnName='LAR_Exencion_IVA', Name='LAR_Exencion_IVA', PrintName='LAR_Exencion_IVA',Updated=TO_TIMESTAMP('2016-10-26 22:27:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000387
;

-- 26/10/2016 22:27:15 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000387
;

-- 26/10/2016 22:27:15 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET ColumnName='LAR_Exencion_IVA', Name='LAR_Exencion_IVA', Description=NULL, Help=NULL WHERE AD_Element_ID=3000387
;

-- 26/10/2016 22:27:15 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_Exencion_IVA', Name='LAR_Exencion_IVA', Description=NULL, Help=NULL, AD_Element_ID=3000387 WHERE UPPER(ColumnName)='LAR_EXENCION_IVA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 26/10/2016 22:27:15 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_Exencion_IVA', Name='LAR_Exencion_IVA', Description=NULL, Help=NULL WHERE AD_Element_ID=3000387 AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:27:15 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET Name='LAR_Exencion_IVA', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000387) AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:27:15 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_PrintFormatItem SET PrintName='LAR_Exencion_IVA', Name='LAR_Exencion_IVA' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000387)
;

-- 26/10/2016 22:27:39 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='% Exención IVA',PrintName='% Exención IVA',Updated=TO_TIMESTAMP('2016-10-26 22:27:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000387 AND AD_Language='es_AR'
;

-- 26/10/2016 22:28:05 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET FieldLength=22, Name='LAR_Exencion_IVA', ColumnName='LAR_Exencion_IVA',Updated=TO_TIMESTAMP('2016-10-26 22:28:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001892
;

-- 26/10/2016 22:29:08 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element SET ColumnName='LAR_Exento_Retenciones_IVA', Name='LAR_Exento_Retenciones_IVA',Updated=TO_TIMESTAMP('2016-10-26 22:29:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000386
;

-- 26/10/2016 22:29:08 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000386
;

-- 26/10/2016 22:29:08 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET ColumnName='LAR_Exento_Retenciones_IVA', Name='LAR_Exento_Retenciones_IVA', Description=NULL, Help=NULL WHERE AD_Element_ID=3000386
;

-- 26/10/2016 22:29:08 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_Exento_Retenciones_IVA', Name='LAR_Exento_Retenciones_IVA', Description=NULL, Help=NULL, AD_Element_ID=3000386 WHERE UPPER(ColumnName)='LAR_EXENTO_RETENCIONES_IVA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 26/10/2016 22:29:08 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_Exento_Retenciones_IVA', Name='LAR_Exento_Retenciones_IVA', Description=NULL, Help=NULL WHERE AD_Element_ID=3000386 AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:29:08 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET Name='LAR_Exento_Retenciones_IVA', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000386) AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:29:08 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_PrintFormatItem SET PrintName='lar_exento_retenciones_iva', Name='LAR_Exento_Retenciones_IVA' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000386)
;

-- 26/10/2016 22:30:37 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Exento Retenciones IVA',PrintName='Exento Retenciones IVA',Description='El Socio del Negocio está exento a recibir Retenciones de IVA',Updated=TO_TIMESTAMP('2016-10-26 22:30:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000386 AND AD_Language='es_AR'
;

-- 26/10/2016 22:30:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element SET PrintName='LAR_Exento_Retenciones_IVA',Updated=TO_TIMESTAMP('2016-10-26 22:30:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000386
;

-- 26/10/2016 22:30:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000386
;

-- 26/10/2016 22:30:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_PrintFormatItem SET PrintName='LAR_Exento_Retenciones_IVA', Name='LAR_Exento_Retenciones_IVA' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000386)
;

-- 26/10/2016 22:31:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='Y',Updated=TO_TIMESTAMP('2016-10-26 22:31:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000386 AND AD_Language='es_AR'
;

-- 26/10/2016 22:31:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element SET Description='El Socio del Negocio está exento a recibir Retenciones de IVA',Updated=TO_TIMESTAMP('2016-10-26 22:31:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000386
;

-- 26/10/2016 22:31:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000386
;

-- 26/10/2016 22:31:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET ColumnName='LAR_Exento_Retenciones_IVA', Name='LAR_Exento_Retenciones_IVA', Description='El Socio del Negocio está exento a recibir Retenciones de IVA', Help=NULL WHERE AD_Element_ID=3000386
;

-- 26/10/2016 22:31:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_Exento_Retenciones_IVA', Name='LAR_Exento_Retenciones_IVA', Description='El Socio del Negocio está exento a recibir Retenciones de IVA', Help=NULL, AD_Element_ID=3000386 WHERE UPPER(ColumnName)='LAR_EXENTO_RETENCIONES_IVA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 26/10/2016 22:31:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_Exento_Retenciones_IVA', Name='LAR_Exento_Retenciones_IVA', Description='El Socio del Negocio está exento a recibir Retenciones de IVA', Help=NULL WHERE AD_Element_ID=3000386 AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:31:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET Name='LAR_Exento_Retenciones_IVA', Description='El Socio del Negocio está exento a recibir Retenciones de IVA', Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000386) AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:32:23 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET FieldLength=22, AD_Reference_ID=12, Name='LAR_Importe_Exencion_Ganancias', ColumnName='LAR_Importe_Exencion_Ganancias',Updated=TO_TIMESTAMP('2016-10-26 22:32:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001884
;

-- 26/10/2016 22:32:23 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001884
;

-- 26/10/2016 22:32:23 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET Name='LAR_Importe_Exencion_Ganancias', Description=NULL, Help=NULL WHERE AD_Column_ID=3001884 AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:32:58 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element SET ColumnName='LAR_Importe_Exencion_Ganancias', Name='LAR_Importe_Exencion_Ganancias', PrintName='LAR_Importe_Exencion_Ganancias',Updated=TO_TIMESTAMP('2016-10-26 22:32:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000379
;

-- 26/10/2016 22:32:58 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000379
;

-- 26/10/2016 22:32:58 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET ColumnName='LAR_Importe_Exencion_Ganancias', Name='LAR_Importe_Exencion_Ganancias', Description=NULL, Help=NULL WHERE AD_Element_ID=3000379
;

-- 26/10/2016 22:32:58 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_Importe_Exencion_Ganancias', Name='LAR_Importe_Exencion_Ganancias', Description=NULL, Help=NULL, AD_Element_ID=3000379 WHERE UPPER(ColumnName)='LAR_IMPORTE_EXENCION_GANANCIAS' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 26/10/2016 22:32:58 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_Importe_Exencion_Ganancias', Name='LAR_Importe_Exencion_Ganancias', Description=NULL, Help=NULL WHERE AD_Element_ID=3000379 AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:32:58 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET Name='LAR_Importe_Exencion_Ganancias', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000379) AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:32:58 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_PrintFormatItem SET PrintName='LAR_Importe_Exencion_Ganancias', Name='LAR_Importe_Exencion_Ganancias' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000379)
;

-- 26/10/2016 22:34:24 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Importe Exención Ganancias',PrintName='Importe Exención Ganancias',Description='Importe de Exención en las Retenciones de Ganancias',Updated=TO_TIMESTAMP('2016-10-26 22:34:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000379 AND AD_Language='es_AR'
;

-- 26/10/2016 22:35:46 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET Name='% Exención Retenciones IVA',PrintName='% Exención Retenciones IVA',Updated=TO_TIMESTAMP('2016-10-26 22:35:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000387 AND AD_Language='es_AR'
;

-- 26/10/2016 22:36:39 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET FieldLength=22, AD_Reference_ID=12, Name='LAR_Importe_Exencion_IIBB', ColumnName='LAR_Importe_Exencion_IIBB',Updated=TO_TIMESTAMP('2016-10-26 22:36:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001888
;

-- 26/10/2016 22:36:39 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001888
;

-- 26/10/2016 22:36:39 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET Name='LAR_Importe_Exencion_IIBB', Description=NULL, Help=NULL WHERE AD_Column_ID=3001888 AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:36:50 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element SET ColumnName='LAR_Importe_Exencion_IIBB', Name='LAR_Importe_Exencion_IIBB', PrintName='LAR_Importe_Exencion_IIBB',Updated=TO_TIMESTAMP('2016-10-26 22:36:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000383
;

-- 26/10/2016 22:36:50 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000383
;

-- 26/10/2016 22:36:50 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET ColumnName='LAR_Importe_Exencion_IIBB', Name='LAR_Importe_Exencion_IIBB', Description=NULL, Help=NULL WHERE AD_Element_ID=3000383
;

-- 26/10/2016 22:36:50 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_Importe_Exencion_IIBB', Name='LAR_Importe_Exencion_IIBB', Description=NULL, Help=NULL, AD_Element_ID=3000383 WHERE UPPER(ColumnName)='LAR_IMPORTE_EXENCION_IIBB' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 26/10/2016 22:36:50 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_Importe_Exencion_IIBB', Name='LAR_Importe_Exencion_IIBB', Description=NULL, Help=NULL WHERE AD_Element_ID=3000383 AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:36:50 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET Name='LAR_Importe_Exencion_IIBB', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000383) AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:36:50 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_PrintFormatItem SET PrintName='LAR_Importe_Exencion_IIBB', Name='LAR_Importe_Exencion_IIBB' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000383)
;

-- 26/10/2016 22:37:09 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Importe Exencion Retenciones IIBB',PrintName='Importe Exencion Retenciones IIBB',Updated=TO_TIMESTAMP('2016-10-26 22:37:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000383 AND AD_Language='es_AR'
;

-- 26/10/2016 22:37:55 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element SET ColumnName='LAR_Importe_Exencion_IVA', Name='LAR_Importe_Exencion_IVA', PrintName='LAR_Importe_Exencion_IVA',Updated=TO_TIMESTAMP('2016-10-26 22:37:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000388
;

-- 26/10/2016 22:37:55 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000388
;

-- 26/10/2016 22:37:55 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET ColumnName='LAR_Importe_Exencion_IVA', Name='LAR_Importe_Exencion_IVA', Description=NULL, Help=NULL WHERE AD_Element_ID=3000388
;

-- 26/10/2016 22:37:55 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_Importe_Exencion_IVA', Name='LAR_Importe_Exencion_IVA', Description=NULL, Help=NULL, AD_Element_ID=3000388 WHERE UPPER(ColumnName)='LAR_IMPORTE_EXENCION_IVA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 26/10/2016 22:37:55 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_Importe_Exencion_IVA', Name='LAR_Importe_Exencion_IVA', Description=NULL, Help=NULL WHERE AD_Element_ID=3000388 AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:37:55 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET Name='LAR_Importe_Exencion_IVA', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000388) AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:37:55 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_PrintFormatItem SET PrintName='LAR_Importe_Exencion_IVA', Name='LAR_Importe_Exencion_IVA' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000388)
;

-- 26/10/2016 22:38:25 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Importe Exención Retenciones IVA',PrintName='Importe Exención Retenciones IVA',Updated=TO_TIMESTAMP('2016-10-26 22:38:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000388 AND AD_Language='es_AR'
;

-- 26/10/2016 22:38:49 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET FieldLength=22, AD_Reference_ID=12, Name='LAR_Importe_Exencion_IVA', ColumnName='LAR_Importe_Exencion_IVA',Updated=TO_TIMESTAMP('2016-10-26 22:38:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001893
;

-- 26/10/2016 22:40:00 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element SET ColumnName='LAR_NroCertificado_Ganancias', Name='LAR_NroCertificado_Ganancias', PrintName='LAR_NroCertificado_Ganancias',Updated=TO_TIMESTAMP('2016-10-26 22:40:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000380
;

-- 26/10/2016 22:40:00 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000380
;

-- 26/10/2016 22:40:00 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET ColumnName='LAR_NroCertificado_Ganancias', Name='LAR_NroCertificado_Ganancias', Description=NULL, Help=NULL WHERE AD_Element_ID=3000380
;

-- 26/10/2016 22:40:00 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_NroCertificado_Ganancias', Name='LAR_NroCertificado_Ganancias', Description=NULL, Help=NULL, AD_Element_ID=3000380 WHERE UPPER(ColumnName)='LAR_NROCERTIFICADO_GANANCIAS' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 26/10/2016 22:40:00 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_NroCertificado_Ganancias', Name='LAR_NroCertificado_Ganancias', Description=NULL, Help=NULL WHERE AD_Element_ID=3000380 AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:40:00 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET Name='LAR_NroCertificado_Ganancias', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000380) AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:40:00 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_PrintFormatItem SET PrintName='LAR_NroCertificado_Ganancias', Name='LAR_NroCertificado_Ganancias' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000380)
;

-- 26/10/2016 22:40:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Nro. Certificado Exención Retenciones Ganancias',PrintName='Nro. Certificado Exención Retenciones Ganancias',Updated=TO_TIMESTAMP('2016-10-26 22:40:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000380 AND AD_Language='es_AR'
;

-- 26/10/2016 22:41:39 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET Name='LAR_NroCertificado_IIBB', ColumnName='LAR_NroCertificado_IIBB',Updated=TO_TIMESTAMP('2016-10-26 22:41:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001889
;

-- 26/10/2016 22:41:39 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001889
;

-- 26/10/2016 22:41:39 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET Name='LAR_NroCertificado_IIBB', Description=NULL, Help=NULL WHERE AD_Column_ID=3001889 AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:41:51 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element SET ColumnName='LAR_NroCertificado_IIBB', Name='LAR_NroCertificado_IIBB', PrintName='LAR_NroCertificado_IIBB',Updated=TO_TIMESTAMP('2016-10-26 22:41:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000384
;

-- 26/10/2016 22:41:51 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000384
;

-- 26/10/2016 22:41:51 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET ColumnName='LAR_NroCertificado_IIBB', Name='LAR_NroCertificado_IIBB', Description=NULL, Help=NULL WHERE AD_Element_ID=3000384
;

-- 26/10/2016 22:41:51 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_NroCertificado_IIBB', Name='LAR_NroCertificado_IIBB', Description=NULL, Help=NULL, AD_Element_ID=3000384 WHERE UPPER(ColumnName)='LAR_NROCERTIFICADO_IIBB' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 26/10/2016 22:41:51 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_NroCertificado_IIBB', Name='LAR_NroCertificado_IIBB', Description=NULL, Help=NULL WHERE AD_Element_ID=3000384 AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:41:51 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET Name='LAR_NroCertificado_IIBB', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000384) AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:41:51 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_PrintFormatItem SET PrintName='LAR_NroCertificado_IIBB', Name='LAR_NroCertificado_IIBB' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000384)
;

-- 26/10/2016 22:42:15 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Nro. Certificado Exención Retenciones IIBB',PrintName='Nro. Certificado Exención Retenciones IIBB',Updated=TO_TIMESTAMP('2016-10-26 22:42:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000384 AND AD_Language='es_AR'
;

-- 26/10/2016 22:43:50 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET Name='LAR_NroCertificado_IVA', ColumnName='LAR_NroCertificado_IVA',Updated=TO_TIMESTAMP('2016-10-26 22:43:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001894
;

-- 26/10/2016 22:43:50 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001894
;

-- 26/10/2016 22:43:50 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET Name='LAR_NroCertificado_IVA', Description=NULL, Help=NULL WHERE AD_Column_ID=3001894 AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:44:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element SET ColumnName='LAR_NroCertificado_IVA', Name='LAR_NroCertificado_IVA', PrintName='LAR_NroCertificado_IVA',Updated=TO_TIMESTAMP('2016-10-26 22:44:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000389
;

-- 26/10/2016 22:44:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000389
;

-- 26/10/2016 22:44:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET ColumnName='LAR_NroCertificado_IVA', Name='LAR_NroCertificado_IVA', Description=NULL, Help=NULL WHERE AD_Element_ID=3000389
;

-- 26/10/2016 22:44:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_NroCertificado_IVA', Name='LAR_NroCertificado_IVA', Description=NULL, Help=NULL, AD_Element_ID=3000389 WHERE UPPER(ColumnName)='LAR_NROCERTIFICADO_IVA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 26/10/2016 22:44:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_NroCertificado_IVA', Name='LAR_NroCertificado_IVA', Description=NULL, Help=NULL WHERE AD_Element_ID=3000389 AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:44:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET Name='LAR_NroCertificado_IVA', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000389) AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:44:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_PrintFormatItem SET PrintName='LAR_NroCertificado_IVA', Name='LAR_NroCertificado_IVA' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000389)
;

-- 26/10/2016 22:44:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Nro. Certificado Exención Retenciones IVA',PrintName='Nro. Certificado Exención Retenciones IVA',Updated=TO_TIMESTAMP('2016-10-26 22:44:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000389 AND AD_Language='es_AR'
;

-- 26/10/2016 22:45:12 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Description,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000102,3000055,'LAR','Exento en el impuesto a las ganancias.','E','Exento',TO_TIMESTAMP('2016-10-26 22:45:12','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2016-10-26 22:45:12','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 26/10/2016 22:45:12 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000102 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 26/10/2016 22:46:12 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET Name='LAR_Vencimiento_Cert_Ganancias', ColumnName='LAR_Vencimiento_Cert_Ganancias',Updated=TO_TIMESTAMP('2016-10-26 22:46:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001886
;

-- 26/10/2016 22:46:12 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001886
;

-- 26/10/2016 22:46:12 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET Name='LAR_Vencimiento_Cert_Ganancias', Description=NULL, Help=NULL WHERE AD_Column_ID=3001886 AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:46:27 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element SET ColumnName='LAR_Vencimiento_Cert_Ganancias', Name='LAR_Vencimiento_Cert_Ganancias', PrintName='LAR_Vencimiento_Cert_Ganancias',Updated=TO_TIMESTAMP('2016-10-26 22:46:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000381
;

-- 26/10/2016 22:46:27 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000381
;

-- 26/10/2016 22:46:27 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET ColumnName='LAR_Vencimiento_Cert_Ganancias', Name='LAR_Vencimiento_Cert_Ganancias', Description=NULL, Help=NULL WHERE AD_Element_ID=3000381
;

-- 26/10/2016 22:46:27 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_Vencimiento_Cert_Ganancias', Name='LAR_Vencimiento_Cert_Ganancias', Description=NULL, Help=NULL, AD_Element_ID=3000381 WHERE UPPER(ColumnName)='LAR_VENCIMIENTO_CERT_GANANCIAS' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 26/10/2016 22:46:27 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_Vencimiento_Cert_Ganancias', Name='LAR_Vencimiento_Cert_Ganancias', Description=NULL, Help=NULL WHERE AD_Element_ID=3000381 AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:46:27 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET Name='LAR_Vencimiento_Cert_Ganancias', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000381) AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:46:27 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_PrintFormatItem SET PrintName='LAR_Vencimiento_Cert_Ganancias', Name='LAR_Vencimiento_Cert_Ganancias' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000381)
;

-- 26/10/2016 22:47:00 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Vencimiento Cert. Exención Ganancias',PrintName='Vencimiento Cert. Exención Ganancias',Updated=TO_TIMESTAMP('2016-10-26 22:47:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000381 AND AD_Language='es_AR'
;

-- 26/10/2016 22:47:46 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element SET ColumnName='LAR_Vencimiento_Cert_IIBB', Name='LAR_Vencimiento_Cert_IIBB', PrintName='LAR_Vencimiento_Cert_IIBB',Updated=TO_TIMESTAMP('2016-10-26 22:47:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000385
;

-- 26/10/2016 22:47:46 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000385
;

-- 26/10/2016 22:47:46 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET ColumnName='LAR_Vencimiento_Cert_IIBB', Name='LAR_Vencimiento_Cert_IIBB', Description=NULL, Help=NULL WHERE AD_Element_ID=3000385
;

-- 26/10/2016 22:47:46 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_Vencimiento_Cert_IIBB', Name='LAR_Vencimiento_Cert_IIBB', Description=NULL, Help=NULL, AD_Element_ID=3000385 WHERE UPPER(ColumnName)='LAR_VENCIMIENTO_CERT_IIBB' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 26/10/2016 22:47:46 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_Vencimiento_Cert_IIBB', Name='LAR_Vencimiento_Cert_IIBB', Description=NULL, Help=NULL WHERE AD_Element_ID=3000385 AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:47:46 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET Name='LAR_Vencimiento_Cert_IIBB', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000385) AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:47:46 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_PrintFormatItem SET PrintName='LAR_Vencimiento_Cert_IIBB', Name='LAR_Vencimiento_Cert_IIBB' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000385)
;

-- 26/10/2016 22:48:03 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Vencimiento Cert Exención IIBB',PrintName='Vencimiento Cert Exención IIBB',Updated=TO_TIMESTAMP('2016-10-26 22:48:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000385 AND AD_Language='es_AR'
;

-- 26/10/2016 22:48:39 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element SET ColumnName='LAR_Vencimiento_Cert_IVA', Name='LAR_Vencimiento_Cert_IVA', PrintName='LAR_Vencimiento_Cert_IVA',Updated=TO_TIMESTAMP('2016-10-26 22:48:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000390
;

-- 26/10/2016 22:48:39 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000390
;

-- 26/10/2016 22:48:39 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET ColumnName='LAR_Vencimiento_Cert_IVA', Name='LAR_Vencimiento_Cert_IVA', Description=NULL, Help=NULL WHERE AD_Element_ID=3000390
;

-- 26/10/2016 22:48:39 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_Vencimiento_Cert_IVA', Name='LAR_Vencimiento_Cert_IVA', Description=NULL, Help=NULL, AD_Element_ID=3000390 WHERE UPPER(ColumnName)='LAR_VENCIMIENTO_CERT_IVA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 26/10/2016 22:48:39 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_Vencimiento_Cert_IVA', Name='LAR_Vencimiento_Cert_IVA', Description=NULL, Help=NULL WHERE AD_Element_ID=3000390 AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:48:39 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET Name='LAR_Vencimiento_Cert_IVA', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000390) AND IsCentrallyMaintained='Y'
;

-- 26/10/2016 22:48:39 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_PrintFormatItem SET PrintName='LAR_Vencimiento_Cert_IVA', Name='LAR_Vencimiento_Cert_IVA' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000390)
;

-- 26/10/2016 22:48:57 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Vencimiento Cert Exención IVA',PrintName='Vencimiento Cert Exención IVA',Updated=TO_TIMESTAMP('2016-10-26 22:48:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000390 AND AD_Language='es_AR'
;

-- 26/10/2016 22:53:04 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002958,22,'Y','N','N',3001883,'N','Y',220,'N','LAR','LAR_Exencion_Ganancias',100,0,'Y',TO_TIMESTAMP('2016-10-26 22:53:04','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2016-10-26 22:53:04','YYYY-MM-DD HH24:MI:SS'))
;

-- 26/10/2016 22:53:04 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002958 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 26/10/2016 22:53:05 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002959,22,'Y','N','N',3001887,'N','Y',220,'N','LAR','LAR_Exencion_IIBB',100,0,'Y',TO_TIMESTAMP('2016-10-26 22:53:04','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2016-10-26 22:53:04','YYYY-MM-DD HH24:MI:SS'))
;

-- 26/10/2016 22:53:05 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002959 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 26/10/2016 22:53:05 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002960,22,'Y','N','N',3001892,'N','Y',220,'N','LAR','LAR_Exencion_IVA',100,0,'Y',TO_TIMESTAMP('2016-10-26 22:53:05','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2016-10-26 22:53:05','YYYY-MM-DD HH24:MI:SS'))
;

-- 26/10/2016 22:53:05 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002960 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 26/10/2016 22:53:05 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002961,1,'Y','N','N',3001891,'N','Y',220,'N','LAR','El Socio del Negocio está exento a recibir Retenciones de IVA','LAR_Exento_Retenciones_IVA',100,0,'Y',TO_TIMESTAMP('2016-10-26 22:53:05','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2016-10-26 22:53:05','YYYY-MM-DD HH24:MI:SS'))
;

-- 26/10/2016 22:53:05 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002961 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 26/10/2016 22:53:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002962,22,'Y','N','N',3001884,'N','Y',220,'N','LAR','LAR_Importe_Exencion_Ganancias',100,0,'Y',TO_TIMESTAMP('2016-10-26 22:53:05','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2016-10-26 22:53:05','YYYY-MM-DD HH24:MI:SS'))
;

-- 26/10/2016 22:53:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002962 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 26/10/2016 22:53:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002963,22,'Y','N','N',3001888,'N','Y',220,'N','LAR','LAR_Importe_Exencion_IIBB',100,0,'Y',TO_TIMESTAMP('2016-10-26 22:53:06','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2016-10-26 22:53:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 26/10/2016 22:53:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002963 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 26/10/2016 22:53:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002964,22,'Y','N','N',3001893,'N','Y',220,'N','LAR','LAR_Importe_Exencion_IVA',100,0,'Y',TO_TIMESTAMP('2016-10-26 22:53:06','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2016-10-26 22:53:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 26/10/2016 22:53:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002964 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 26/10/2016 22:53:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002965,30,'Y','N','N',3001885,'N','Y',220,'N','LAR','LAR_NroCertificado_Ganancias',100,0,'Y',TO_TIMESTAMP('2016-10-26 22:53:06','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2016-10-26 22:53:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 26/10/2016 22:53:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002965 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 26/10/2016 22:53:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002966,30,'Y','N','N',3001889,'N','Y',220,'N','LAR','LAR_NroCertificado_IIBB',100,0,'Y',TO_TIMESTAMP('2016-10-26 22:53:06','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2016-10-26 22:53:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 26/10/2016 22:53:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002966 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 26/10/2016 22:53:07 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002967,30,'Y','N','N',3001894,'N','Y',220,'N','LAR','LAR_NroCertificado_IVA',100,0,'Y',TO_TIMESTAMP('2016-10-26 22:53:06','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2016-10-26 22:53:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 26/10/2016 22:53:07 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002967 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 26/10/2016 22:53:07 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002968,29,'Y','N','N',3001886,'N','Y',220,'N','LAR','LAR_Vencimiento_Cert_Ganancias',100,0,'Y',TO_TIMESTAMP('2016-10-26 22:53:07','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2016-10-26 22:53:07','YYYY-MM-DD HH24:MI:SS'))
;

-- 26/10/2016 22:53:07 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002968 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 26/10/2016 22:53:07 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002969,29,'Y','N','N',3001890,'N','Y',220,'N','LAR','LAR_Vencimiento_Cert_IIBB',100,0,'Y',TO_TIMESTAMP('2016-10-26 22:53:07','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2016-10-26 22:53:07','YYYY-MM-DD HH24:MI:SS'))
;

-- 26/10/2016 22:53:07 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002969 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 26/10/2016 22:53:08 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002970,29,'Y','N','N',3001895,'N','Y',220,'N','LAR','LAR_Vencimiento_Cert_IVA',100,0,'Y',TO_TIMESTAMP('2016-10-26 22:53:07','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2016-10-26 22:53:07','YYYY-MM-DD HH24:MI:SS'))
;

-- 26/10/2016 22:53:08 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002970 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=2160
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=2155
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=1000010
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=2156
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=9627
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3261
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=1000006
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=1000007
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=1000008
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=1000009
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=2145
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3228
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=2133
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=2136
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=2141
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=8238
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=10592
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=57981
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=1000011
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=2132
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3002953
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3001776
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=2149
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3001605
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=2144
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=2162
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3955
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=2124
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=2164
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=2139
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=9620
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=2148
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=2128
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=2127
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=2146
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=2154
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=2153
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=54555
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=2135
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=57533
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3002958
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3002959
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3002960
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3002961
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3002962
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3002963
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3002964
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3002965
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3002966
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3002967
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3002968
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3002969
;

-- 26/10/2016 22:56:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3002970
;

-- 26/10/2016 22:58:10 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-10-26 22:58:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2155
;

-- 26/10/2016 22:58:33 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2016-10-26 22:58:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=1000010
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3002961
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3002960
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3002964
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3002967
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3002970
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=2156
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=9627
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3261
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=1000006
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=1000007
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=1000008
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=1000009
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=2145
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3228
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=2133
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=2136
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=2141
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=8238
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=10592
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=57981
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=1000011
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=2132
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3002953
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3001776
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=2149
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3001605
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=2144
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=2162
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3955
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=2124
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=2164
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=2139
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=9620
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=2148
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=2128
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=2127
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=2146
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=2154
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=2153
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=54555
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=2135
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=57533
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3002958
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3002959
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3002962
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3002963
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3002965
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3002966
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3002968
;

-- 26/10/2016 22:59:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3002969
;

-- 26/10/2016 23:00:31 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-10-26 23:00:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002961
;

-- 26/10/2016 23:00:36 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-10-26 23:00:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002964
;

-- 26/10/2016 23:00:40 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-10-26 23:00:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002970
;

-- 26/10/2016 23:04:16 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2016-10-26 23:04:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002967
;

-- 26/10/2016 23:05:54 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2016-10-26 23:05:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002965
;

-- 26/10/2016 23:06:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2016-10-26 23:06:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002966
;

-- 26/10/2016 23:07:00 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET FieldLength=7, AD_Reference_ID=15,Updated=TO_TIMESTAMP('2016-10-26 23:07:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001895
;

-- 26/10/2016 23:11:41 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLength=14,Updated=TO_TIMESTAMP('2016-10-26 23:11:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002970
;

-- 26/10/2016 23:11:50 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET FieldLength=14,Updated=TO_TIMESTAMP('2016-10-26 23:11:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001895
;

-- 26/10/2016 23:12:10 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET FieldLength=14, AD_Reference_ID=15,Updated=TO_TIMESTAMP('2016-10-26 23:12:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001886
;

-- 26/10/2016 23:12:16 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLength=14,Updated=TO_TIMESTAMP('2016-10-26 23:12:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002968
;

-- 26/10/2016 23:12:36 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET FieldLength=14, AD_Reference_ID=15,Updated=TO_TIMESTAMP('2016-10-26 23:12:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001890
;

-- 26/10/2016 23:12:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLength=14,Updated=TO_TIMESTAMP('2016-10-26 23:12:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002969
;

-- 26/10/2016 23:15:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=57981
;

-- 26/10/2016 23:15:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=1000011
;

-- 26/10/2016 23:15:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=2132
;

-- 26/10/2016 23:15:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3002953
;

-- 26/10/2016 23:15:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3001776
;

-- 26/10/2016 23:15:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=2149
;

-- 26/10/2016 23:15:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3001605
;

-- 26/10/2016 23:15:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=2144
;

-- 26/10/2016 23:15:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=2162
;

-- 26/10/2016 23:15:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3955
;

-- 26/10/2016 23:15:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=2124
;

-- 26/10/2016 23:15:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=2164
;

-- 26/10/2016 23:15:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=2139
;

-- 26/10/2016 23:15:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=9620
;

-- 26/10/2016 23:15:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=2148
;

-- 26/10/2016 23:15:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=2128
;

-- 26/10/2016 23:15:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=2127
;

-- 26/10/2016 23:15:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=2146
;

-- 26/10/2016 23:15:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=2154
;

-- 26/10/2016 23:15:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=2153
;

-- 26/10/2016 23:15:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=54555
;

-- 26/10/2016 23:15:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=2135
;

-- 26/10/2016 23:15:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=57533
;

-- 26/10/2016 23:15:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3002958
;

-- 26/10/2016 23:15:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3002959
;

-- 26/10/2016 23:15:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3002962
;

-- 26/10/2016 23:15:02 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3002963
;

-- 26/10/2016 23:15:02 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3002965
;

-- 26/10/2016 23:15:02 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3002966
;

-- 26/10/2016 23:15:02 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3002968
;

-- 26/10/2016 23:15:02 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3002969
;

-- 26/10/2016 23:15:30 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field_Trl SET Name='No. Inscripción IIBB',Updated=TO_TIMESTAMP('2016-10-26 23:15:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2132 AND AD_Language='es_AR'
;

-- 26/10/2016 23:16:58 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3002959
;

-- 26/10/2016 23:16:58 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3002963
;

-- 26/10/2016 23:16:58 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3002966
;

-- 26/10/2016 23:16:58 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3002969
;

-- 26/10/2016 23:16:58 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3002953
;

-- 26/10/2016 23:16:58 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3001776
;

-- 26/10/2016 23:16:58 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=2149
;

-- 26/10/2016 23:16:58 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3001605
;

-- 26/10/2016 23:16:58 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=2144
;

-- 26/10/2016 23:16:58 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=2162
;

-- 26/10/2016 23:16:58 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3955
;

-- 26/10/2016 23:16:58 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=2124
;

-- 26/10/2016 23:16:59 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=2164
;

-- 26/10/2016 23:16:59 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=2139
;

-- 26/10/2016 23:16:59 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=9620
;

-- 26/10/2016 23:16:59 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=2148
;

-- 26/10/2016 23:16:59 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=2128
;

-- 26/10/2016 23:16:59 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=2127
;

-- 26/10/2016 23:16:59 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=2146
;

-- 26/10/2016 23:16:59 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=2154
;

-- 26/10/2016 23:16:59 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=2153
;

-- 26/10/2016 23:16:59 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=54555
;

-- 26/10/2016 23:16:59 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=2135
;

-- 26/10/2016 23:16:59 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=57533
;

-- 26/10/2016 23:16:59 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3002958
;

-- 26/10/2016 23:16:59 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3002962
;

-- 26/10/2016 23:16:59 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3002965
;

-- 26/10/2016 23:16:59 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3002968
;

-- 26/10/2016 23:17:09 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-10-26 23:17:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002963
;

-- 26/10/2016 23:17:16 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-10-26 23:17:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002969
;

-- 26/10/2016 23:19:33 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET IsMandatory='Y',Updated=TO_TIMESTAMP('2016-10-26 23:19:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=1000151
;

-- 26/10/2016 23:22:16 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3002958
;

-- 26/10/2016 23:22:16 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3002962
;

-- 26/10/2016 23:22:16 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3002965
;

-- 26/10/2016 23:22:16 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3002968
;

-- 26/10/2016 23:22:16 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=2149
;

-- 26/10/2016 23:22:16 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3001605
;

-- 26/10/2016 23:22:16 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=2144
;

-- 26/10/2016 23:22:16 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=2162
;

-- 26/10/2016 23:22:16 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=9620
;

-- 26/10/2016 23:22:16 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=2148
;

-- 26/10/2016 23:22:16 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=2128
;

-- 26/10/2016 23:22:16 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=2127
;

-- 26/10/2016 23:22:16 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=2146
;

-- 26/10/2016 23:22:16 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=2154
;

-- 26/10/2016 23:22:16 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=2153
;

-- 26/10/2016 23:22:16 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=54555
;

-- 26/10/2016 23:22:16 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=2135
;

-- 26/10/2016 23:22:16 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=57533
;

-- 26/10/2016 23:22:27 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2016-10-26 23:22:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001776
;

-- 26/10/2016 23:22:47 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-10-26 23:22:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002962
;

-- 26/10/2016 23:22:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-10-26 23:22:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002968
;

-- 26/10/2016 23:24:47 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=2148
;

-- 26/10/2016 23:24:47 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=2128
;

-- 26/10/2016 23:24:47 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=2127
;

-- 26/10/2016 23:24:47 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=2146
;

-- 26/10/2016 23:24:47 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=2154
;

-- 26/10/2016 23:24:47 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=2153
;

-- 26/10/2016 23:24:47 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=54555
;

-- 26/10/2016 23:24:47 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=2135
;

-- 26/10/2016 23:24:47 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=9620
;

-- 26/10/2016 23:25:16 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2016-10-26 23:25:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=9620
;

-- 26/10/2016 23:25:43 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLength=50,Updated=TO_TIMESTAMP('2016-10-26 23:25:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2145
;

-- 26/10/2016 23:25:47 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLength=50,Updated=TO_TIMESTAMP('2016-10-26 23:25:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3228
;

-- 26/10/2016 23:26:08 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLength=50,Updated=TO_TIMESTAMP('2016-10-26 23:26:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2133
;

-- 26/10/2016 23:27:32 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3001776
;

-- 26/10/2016 23:27:32 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3002953
;

-- 26/10/2016 23:31:13 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Retenciones_IVA@=''Y''',Updated=TO_TIMESTAMP('2016-10-26 23:31:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002960
;

-- 26/10/2016 23:31:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Retenciones_IVA@=Y',Updated=TO_TIMESTAMP('2016-10-26 23:31:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002960
;

-- 26/10/2016 23:31:51 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Retenciones_IVA@=Y',Updated=TO_TIMESTAMP('2016-10-26 23:31:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002964
;

-- 26/10/2016 23:31:54 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Retenciones_IVA@=Y',Updated=TO_TIMESTAMP('2016-10-26 23:31:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002967
;

-- 26/10/2016 23:31:57 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Retenciones_IVA@=Y',Updated=TO_TIMESTAMP('2016-10-26 23:31:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002970
;

-- 26/10/2016 23:34:30 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLogic='ISIC=1000003',Updated=TO_TIMESTAMP('2016-10-26 23:34:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002959
;

-- 26/10/2016 23:34:34 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLogic='ISIC=1000003',Updated=TO_TIMESTAMP('2016-10-26 23:34:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002963
;

-- 26/10/2016 23:34:49 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLogic='@ISIC@=1000003',Updated=TO_TIMESTAMP('2016-10-26 23:34:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002959
;

-- 26/10/2016 23:34:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLogic='@ISIC@=1000003',Updated=TO_TIMESTAMP('2016-10-26 23:34:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002963
;

-- 26/10/2016 23:34:57 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLogic='@ISIC@=1000003',Updated=TO_TIMESTAMP('2016-10-26 23:34:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002966
;

-- 26/10/2016 23:35:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLogic='@ISIC@=1000003',Updated=TO_TIMESTAMP('2016-10-26 23:35:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002969
;

-- 26/10/2016 23:35:39 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLogic='@LAR_TipoGanancias@=E',Updated=TO_TIMESTAMP('2016-10-26 23:35:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002958
;

-- 26/10/2016 23:35:42 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLogic='@LAR_TipoGanancias@=E',Updated=TO_TIMESTAMP('2016-10-26 23:35:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002962
;

-- 26/10/2016 23:35:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLogic='@LAR_TipoGanancias@=E',Updated=TO_TIMESTAMP('2016-10-26 23:35:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002965
;

-- 26/10/2016 23:35:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLogic='@LAR_TipoGanancias@=E',Updated=TO_TIMESTAMP('2016-10-26 23:35:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002968
;

-- 26/10/2016 23:43:15 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET AD_Reference_ID=19,Updated=TO_TIMESTAMP('2016-10-26 23:43:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=1000151
;

-- 26/10/2016 23:45:19 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLogic='@LCO_ISIC_ID@=1000003',Updated=TO_TIMESTAMP('2016-10-26 23:45:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002959
;

-- 26/10/2016 23:46:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLogic='@LCO_ISIC_ID@=1000003',Updated=TO_TIMESTAMP('2016-10-26 23:46:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002963
;

-- 26/10/2016 23:46:10 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLogic='@LCO_ISIC_ID@=1000003',Updated=TO_TIMESTAMP('2016-10-26 23:46:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002966
;

-- 26/10/2016 23:46:24 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLogic='@LCO_ISIC_ID@=1000003',Updated=TO_TIMESTAMP('2016-10-26 23:46:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002969
;

-- 27/10/2016 9:10:40 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET Name='Nro. Certificado Exención Ret. Ganancias',PrintName='Nro. Certificado Exención Ret. Ganancias',Updated=TO_TIMESTAMP('2016-10-27 09:10:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000380 AND AD_Language='es_AR'
;

-- 27/10/2016 9:11:11 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET Name='Nro. Certificado Exención Ret. IIBB',PrintName='Nro. Certificado Exención Ret. IIBB',Updated=TO_TIMESTAMP('2016-10-27 09:11:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000384 AND AD_Language='es_AR'
;

-- 27/10/2016 9:11:41 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET Name='Nro. Certificado Exención Ret. IVA',PrintName='Nro. Certificado Exención Ret. IVA',Updated=TO_TIMESTAMP('2016-10-27 09:11:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000389 AND AD_Language='es_AR'
;

-- 27/10/2016 9:12:57 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Fecha Inicio Actividades',PrintName='Fecha Inicio Actividades',Description='Fecha inicio actividades del SdN',Updated=TO_TIMESTAMP('2016-10-27 09:12:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000186 AND AD_Language='es_AR'
;

-- 27/10/2016 9:13:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET Name='Importe Exención Ret. Ganancias',PrintName='Importe Exención Ret. Ganancias',Updated=TO_TIMESTAMP('2016-10-27 09:13:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000379 AND AD_Language='es_AR'
;

-- 27/10/2016 9:14:12 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET Name='Importe Exencion Ret. IIBB',PrintName='Importe Exencion Ret. IIBB',Updated=TO_TIMESTAMP('2016-10-27 09:14:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000383 AND AD_Language='es_AR'
;

-- 27/10/2016 9:14:34 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET Name='Importe Exención Ret. IVA',PrintName='Importe Exención Ret. IVA',Updated=TO_TIMESTAMP('2016-10-27 09:14:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000388 AND AD_Language='es_AR'
;

-- 27/10/2016 9:44:40 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='% Exención Retenciones Ganancias',PrintName='% Exención Retenciones Ganancias',Updated=TO_TIMESTAMP('2016-10-27 09:44:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000378 AND AD_Language='es_AR'
;

-- 27/10/2016 9:45:14 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET Name='% Exención Retenciones IIBB',PrintName='% Exención Retenciones IIBB',Updated=TO_TIMESTAMP('2016-10-27 09:45:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000382 AND AD_Language='es_AR'
;

-- 27/10/2016 9:46:50 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET Name='Nro. Certific. Exención Ret. Ganancias',PrintName='Nro. Certific. Exención Ret. Ganancias',Updated=TO_TIMESTAMP('2016-10-27 09:46:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000380 AND AD_Language='es_AR'
;

-- 27/10/2016 9:56:00 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET Name='Tipo Insc. Ganancias SdN',PrintName='Tipo Insc. Ganancias SdN',Updated=TO_TIMESTAMP('2016-10-27 09:56:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000376 AND AD_Language='es_AR'
;

-- 27/10/2016 9:56:00 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET Name='Tipo Insc. Ganancias SdN',PrintName='Tipo Insc. Ganancias SdN',Updated=TO_TIMESTAMP('2016-10-27 09:56:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000376 AND AD_Language='es_AR'
;

-- 27/10/2016 10:03:35 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET Name='Usa Tipo Insc. Ganancias SdN',PrintName='Usa Tipo Insc. Ganancias SdN',Updated=TO_TIMESTAMP('2016-10-27 10:03:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000375 AND AD_Language='es_AR'
;

-- 28/10/2016 6:41:31 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Importe Total',PrintName='Importe Total',Updated=TO_TIMESTAMP('2016-10-28 06:41:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000077 AND AD_Language='es_AR'
;

-- 28/10/2016 6:42:43 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Seleccionar Cheques en Cartera',PrintName='Seleccionar Cheques en Cartera',Updated=TO_TIMESTAMP('2016-10-28 06:42:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000070 AND AD_Language='es_AR'
;

-- 28/10/2016 6:43:41 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Generar Retención',PrintName='Generar Retención',Updated=TO_TIMESTAMP('2016-10-28 06:43:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000127 AND AD_Language='es_AR'
;

-- 28/10/2016 6:48:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000449
;

-- 28/10/2016 6:48:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000448
;

-- 28/10/2016 6:48:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000486
;

-- 28/10/2016 6:48:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000450
;

-- 28/10/2016 6:48:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000441
;

-- 28/10/2016 6:48:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000442
;

-- 28/10/2016 6:48:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000443
;

-- 28/10/2016 6:48:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000444
;

-- 28/10/2016 6:48:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000445
;

-- 28/10/2016 6:48:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000446
;

-- 28/10/2016 6:48:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000447
;

-- 28/10/2016 6:48:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000451
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000452
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000453
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000454
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000455
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3002769
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3002770
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3002806
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000458
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000459
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000460
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000461
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000462
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000463
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000464
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000465
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000466
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000467
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000468
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000469
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000470
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000471
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000472
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000473
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000474
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000475
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000476
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000477
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000478
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000479
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000480
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000481
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000482
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000483
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000484
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000485
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000492
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000490
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000488
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000489
;

-- 28/10/2016 6:48:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000491
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000451
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000452
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000453
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000454
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000455
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3002769
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3002770
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3002806
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000458
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000459
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000460
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000461
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000462
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000463
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000464
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000465
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000466
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000467
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000468
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000469
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000470
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000471
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000472
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000473
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000474
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000475
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000476
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000477
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000478
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000479
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000480
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000481
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000482
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000483
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000484
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000485
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000492
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000490
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000488
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000489
;

-- 28/10/2016 6:49:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000491
;

-- 28/10/2016 6:50:43 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3002763
;

-- 28/10/2016 6:50:43 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3000435
;

-- 28/10/2016 6:50:43 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3000436
;

-- 28/10/2016 6:50:43 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3000437
;

-- 28/10/2016 6:50:43 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000438
;

-- 28/10/2016 6:50:43 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000439
;

-- 28/10/2016 6:50:43 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000440
;

-- 28/10/2016 6:50:43 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000450
;

-- 28/10/2016 6:50:43 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000441
;

-- 28/10/2016 6:50:43 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000442
;

-- 28/10/2016 6:50:43 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000443
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000444
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000445
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000446
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000447
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000452
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000453
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000454
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000455
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3002769
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3002770
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3002806
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000458
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000459
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000460
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000461
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000462
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000463
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000464
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000465
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000466
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000467
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000468
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000469
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000470
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000471
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000472
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000473
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000474
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000475
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000476
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000477
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000478
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000479
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000480
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000481
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000482
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000483
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000484
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000485
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000492
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000490
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000488
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000489
;

-- 28/10/2016 6:50:44 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000491
;

-- 28/10/2016 6:51:10 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-10-28 06:51:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002763
;

-- 28/10/2016 6:54:04 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET ReadOnlyLogic='@C_Invoice_ID@!0 | @C_Order_ID@!0 | @EsRetencionIIBB@=Y',Updated=TO_TIMESTAMP('2016-10-28 06:54:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=8984
;

-- 28/10/2016 6:54:46 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0 | @EsRetencionIIBB@=Y',Updated=TO_TIMESTAMP('2016-10-28 06:54:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=8980
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000431
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3000432
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3000433
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3000434
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3002763
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3000435
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3000436
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3000437
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3000438
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000439
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000440
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000450
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000441
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000442
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000443
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000444
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000445
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000446
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000447
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000452
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000453
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000454
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000455
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3002769
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3002770
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3002806
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000458
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000459
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000460
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000461
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000462
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000463
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000464
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000465
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000466
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000467
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000468
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000469
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000470
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000471
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000472
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000473
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000474
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000475
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000476
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000477
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000478
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000479
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000480
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000481
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000482
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000483
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000484
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000485
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000492
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000490
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000488
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000489
;

-- 28/10/2016 6:55:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000491
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3000485
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3000412
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3000432
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3000433
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3000434
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3002763
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3000435
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3000436
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000437
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000438
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000439
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000440
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000450
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000441
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000442
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000443
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000444
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000445
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000446
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000447
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000452
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000453
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000454
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3000455
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3002769
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3002770
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3002806
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000458
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000459
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000460
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000461
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000462
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000463
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000464
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000465
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000466
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000467
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000468
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000469
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000470
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000471
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000472
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000473
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000474
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000475
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000476
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000477
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000478
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000479
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000480
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000481
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000482
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000483
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000484
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000492
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000490
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000488
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000489
;

-- 28/10/2016 6:57:06 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000491
;

-- 28/10/2016 6:58:40 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0 | @LAR_PaymentHeader_ID!0@',Updated=TO_TIMESTAMP('2016-10-28 06:58:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=5302
;

-- 28/10/2016 7:00:22 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2016-10-28 07:00:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000485
;

-- 28/10/2016 7:01:18 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000488
;

-- 28/10/2016 7:01:18 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000489
;

-- 28/10/2016 7:01:18 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000491
;

-- 28/10/2016 7:01:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3000436
;

-- 28/10/2016 7:01:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3000437
;

-- 28/10/2016 7:01:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000438
;

-- 28/10/2016 7:01:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000439
;

-- 28/10/2016 7:01:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000440
;

-- 28/10/2016 7:01:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000450
;

-- 28/10/2016 7:01:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000435
;

-- 28/10/2016 7:02:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-10-28 07:02:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000412
;

-- 28/10/2016 7:03:27 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2016-10-28 07:03:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000491
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3000298
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3000299
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3000301
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3000305
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3000306
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3000307
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3000308
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3000310
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3000311
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3000312
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3000313
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3000314
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3000315
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000316
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000317
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3001624
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000318
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000319
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000320
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000321
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000322
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000886
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000888
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000325
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000326
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000323
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000324
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000327
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3000328
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000329
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000330
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000331
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000332
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3002719
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3002720
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3002803
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000335
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000336
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000337
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000338
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000339
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000340
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000341
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000342
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000343
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000344
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000345
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000346
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000347
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000348
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000349
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000350
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000351
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000352
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000353
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000354
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000355
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000356
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000357
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000358
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000359
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000360
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000363
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000302
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000364
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3000362
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=3000289
;

-- 28/10/2016 7:08:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=680,IsDisplayed='Y' WHERE AD_Field_ID=3000366
;

-- 28/10/2016 7:10:14 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLogic='@EsRetencionSufrida@=''Y''',Updated=TO_TIMESTAMP('2016-10-28 07:10:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000325
;

-- 28/10/2016 7:10:20 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLogic='@EsRetencionSufrida@=''Y''',Updated=TO_TIMESTAMP('2016-10-28 07:10:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000326
;

-- 28/10/2016 7:11:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000327
;

-- 28/10/2016 7:11:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000318
;

-- 28/10/2016 7:11:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000319
;

-- 28/10/2016 7:11:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000320
;

-- 28/10/2016 7:11:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000321
;

-- 28/10/2016 7:11:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000322
;

-- 28/10/2016 7:11:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000886
;

-- 28/10/2016 7:11:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000888
;

-- 28/10/2016 7:11:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000325
;

-- 28/10/2016 7:11:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000326
;

-- 28/10/2016 7:11:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000323
;

-- 28/10/2016 7:11:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000324
;

-- 28/10/2016 7:12:18 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000327
;

-- 28/10/2016 7:12:18 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3001624
;

-- 28/10/2016 7:12:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-10-28 07:12:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001624
;

-- 28/10/2016 7:14:19 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Es Retención',Description='Es un pago retención',Updated=TO_TIMESTAMP('2016-10-28 07:14:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002763 AND AD_Language='es_AR'
;

-- 28/10/2016 7:14:36 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column_Trl SET Name='Es Retención',IsTranslated='Y',Updated=TO_TIMESTAMP('2016-10-28 07:14:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000832 AND AD_Language='es_AR'
;

-- 28/10/2016 7:14:58 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Es Retención',PrintName='Es Retención',Description='Es una retención emitida',Updated=TO_TIMESTAMP('2016-10-28 07:14:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000128 AND AD_Language='es_AR'
;

-- 28/10/2016 7:15:29 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Tab_Trl SET Name='Certificados de Retención',Updated=TO_TIMESTAMP('2016-10-28 07:15:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000029 AND AD_Language='es_AR'
;

-- ISSUE #81: Retenciones
-- Se agregan las columnas relacionadas a las exenciones de Retenciones (IIBB y Ganancias)
ALTER TABLE C_BPartner
-- IIBB y  Ganancias
ADD COLUMN LAR_Exento_Ret_IIBB character(1) DEFAULT 'N'::bpchar,
ADD COLUMN LAR_Exento_Ret_Ganancias character(1) DEFAULT 'N'::bpchar,
ADD CONSTRAINT C_BPartner_LAR_Exento_Ret_IIBB_check CHECK ((LAR_Exento_Ret_IIBB = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
ADD CONSTRAINT C_BPartner_LAR_Exento_Ret_Ganancias_check CHECK ((LAR_Exento_Ret_Ganancias = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])))
;

-- 29/10/2016 10:27:59 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000394,'lar_exento_ret_iibb','LAR','lar_exento_ret_iibb','lar_exento_ret_iibb',0,TO_TIMESTAMP('2016-10-29 10:27:57','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-10-29 10:27:57','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 29/10/2016 10:27:59 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000394 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 29/10/2016 10:28:00 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001900,291,'LAR',0,'N','N','N','N',1,'N',20,'N',3000394,'N','Y','N','lar_exento_ret_iibb','lar_exento_ret_iibb',100,TO_TIMESTAMP('2016-10-29 10:27:57','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-10-29 10:27:57','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 29/10/2016 10:28:00 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001900 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 29/10/2016 10:28:02 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000395,'lar_exento_ret_ganancias','LAR','lar_exento_ret_ganancias','lar_exento_ret_ganancias',0,TO_TIMESTAMP('2016-10-29 10:28:00','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-10-29 10:28:00','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 29/10/2016 10:28:02 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000395 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 29/10/2016 10:28:03 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001901,291,'LAR',0,'N','N','N','N',1,'N',20,'N',3000395,'N','Y','N','lar_exento_ret_ganancias','lar_exento_ret_ganancias',100,TO_TIMESTAMP('2016-10-29 10:28:00','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-10-29 10:28:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 29/10/2016 10:28:03 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001901 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 29/10/2016 10:28:54 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element SET ColumnName='LAR_Exento_Ret_Ganancias', Name='LAR_Exento_Ret_Ganancias', PrintName='LAR_Exento_Ret_Ganancias',Updated=TO_TIMESTAMP('2016-10-29 10:28:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000395
;

-- 29/10/2016 10:28:54 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000395
;

-- 29/10/2016 10:28:54 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET ColumnName='LAR_Exento_Ret_Ganancias', Name='LAR_Exento_Ret_Ganancias', Description=NULL, Help=NULL WHERE AD_Element_ID=3000395
;

-- 29/10/2016 10:28:54 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_Exento_Ret_Ganancias', Name='LAR_Exento_Ret_Ganancias', Description=NULL, Help=NULL, AD_Element_ID=3000395 WHERE UPPER(ColumnName)='LAR_EXENTO_RET_GANANCIAS' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 29/10/2016 10:28:54 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_Exento_Ret_Ganancias', Name='LAR_Exento_Ret_Ganancias', Description=NULL, Help=NULL WHERE AD_Element_ID=3000395 AND IsCentrallyMaintained='Y'
;

-- 29/10/2016 10:28:54 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET Name='LAR_Exento_Ret_Ganancias', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000395) AND IsCentrallyMaintained='Y'
;

-- 29/10/2016 10:28:54 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_PrintFormatItem SET PrintName='LAR_Exento_Ret_Ganancias', Name='LAR_Exento_Ret_Ganancias' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000395)
;

-- 29/10/2016 10:29:46 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Exento Retenciones Ganancias',PrintName='Exento Retenciones Ganancias',Updated=TO_TIMESTAMP('2016-10-29 10:29:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000395 AND AD_Language='es_AR'
;

-- 29/10/2016 10:30:52 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element SET ColumnName='LAR_Exento_Ret_IIBB', Name='LAR_Exento_Ret_IIBB', PrintName='LAR_Exento_Ret_IIBB',Updated=TO_TIMESTAMP('2016-10-29 10:30:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000394
;

-- 29/10/2016 10:30:52 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000394
;

-- 29/10/2016 10:30:52 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET ColumnName='LAR_Exento_Ret_IIBB', Name='LAR_Exento_Ret_IIBB', Description=NULL, Help=NULL WHERE AD_Element_ID=3000394
;

-- 29/10/2016 10:30:52 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_Exento_Ret_IIBB', Name='LAR_Exento_Ret_IIBB', Description=NULL, Help=NULL, AD_Element_ID=3000394 WHERE UPPER(ColumnName)='LAR_EXENTO_RET_IIBB' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 29/10/2016 10:30:52 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Process_Para SET ColumnName='LAR_Exento_Ret_IIBB', Name='LAR_Exento_Ret_IIBB', Description=NULL, Help=NULL WHERE AD_Element_ID=3000394 AND IsCentrallyMaintained='Y'
;

-- 29/10/2016 10:30:52 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET Name='LAR_Exento_Ret_IIBB', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000394) AND IsCentrallyMaintained='Y'
;

-- 29/10/2016 10:30:52 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_PrintFormatItem SET PrintName='LAR_Exento_Ret_IIBB', Name='LAR_Exento_Ret_IIBB' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000394)
;

-- 29/10/2016 10:31:13 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Exento Retenciones IIBB',PrintName='Exento Retenciones IIBB',Updated=TO_TIMESTAMP('2016-10-29 10:31:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000394 AND AD_Language='es_AR'
;

-- 29/10/2016 10:32:36 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002972,1,'Y','N','N',3001901,'N','Y',220,'N','LAR','LAR_Exento_Ret_Ganancias',100,0,'Y',TO_TIMESTAMP('2016-10-29 10:32:31','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2016-10-29 10:32:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 29/10/2016 10:32:36 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002972 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 29/10/2016 10:32:40 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002973,1,'Y','N','N',3001900,'N','Y',220,'N','LAR','LAR_Exento_Ret_IIBB',100,0,'Y',TO_TIMESTAMP('2016-10-29 10:32:36','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2016-10-29 10:32:36','YYYY-MM-DD HH24:MI:SS'))
;

-- 29/10/2016 10:32:40 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002973 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 29/10/2016 10:46:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3002973
;

-- 29/10/2016 10:46:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3002959
;

-- 29/10/2016 10:46:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3002963
;

-- 29/10/2016 10:46:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3002966
;

-- 29/10/2016 10:46:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3002969
;

-- 29/10/2016 10:46:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3001776
;

-- 29/10/2016 10:46:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3002953
;

-- 29/10/2016 10:46:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3002958
;

-- 29/10/2016 10:46:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3002962
;

-- 29/10/2016 10:46:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3002965
;

-- 29/10/2016 10:46:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3002968
;

-- 29/10/2016 10:46:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3955
;

-- 29/10/2016 10:46:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=2124
;

-- 29/10/2016 10:46:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=2164
;

-- 29/10/2016 10:46:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=2139
;

-- 29/10/2016 10:46:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=2149
;

-- 29/10/2016 10:46:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3001605
;

-- 29/10/2016 10:46:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=2144
;

-- 29/10/2016 10:46:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=2162
;

-- 29/10/2016 10:46:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=2148
;

-- 29/10/2016 10:46:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=2128
;

-- 29/10/2016 10:46:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=2127
;

-- 29/10/2016 10:46:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=2146
;

-- 29/10/2016 10:46:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=2154
;

-- 29/10/2016 10:46:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=2153
;

-- 29/10/2016 10:46:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=54555
;

-- 29/10/2016 10:46:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=2135
;

-- 29/10/2016 10:46:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=9620
;

-- 29/10/2016 10:46:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=57533
;

-- 29/10/2016 10:46:56 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3002972
;

-- 29/10/2016 10:47:21 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3002972
;

-- 29/10/2016 10:47:22 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3002958
;

-- 29/10/2016 10:47:22 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3002962
;

-- 29/10/2016 10:47:22 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3002965
;

-- 29/10/2016 10:47:22 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3002968
;

-- 29/10/2016 10:47:22 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3955
;

-- 29/10/2016 10:47:22 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=2124
;

-- 29/10/2016 10:47:22 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=2164
;

-- 29/10/2016 10:47:22 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=2139
;

-- 29/10/2016 10:47:22 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=2149
;

-- 29/10/2016 10:47:22 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3001605
;

-- 29/10/2016 10:47:22 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=2144
;

-- 29/10/2016 10:47:22 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=2162
;

-- 29/10/2016 10:47:22 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=2148
;

-- 29/10/2016 10:47:22 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=2128
;

-- 29/10/2016 10:47:22 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=2127
;

-- 29/10/2016 10:47:22 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=2146
;

-- 29/10/2016 10:47:22 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=2154
;

-- 29/10/2016 10:47:22 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=2153
;

-- 29/10/2016 10:47:22 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=54555
;

-- 29/10/2016 10:47:22 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=2135
;

-- 29/10/2016 10:47:22 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=9620
;

-- 29/10/2016 10:47:22 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=57533
;

-- 29/10/2016 10:47:35 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-10-29 10:47:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002972
;

-- 29/10/2016 10:48:48 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Ret_IIBB@=Y',Updated=TO_TIMESTAMP('2016-10-29 10:48:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002959
;

-- 29/10/2016 10:48:53 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Ret_IIBB@=Y',Updated=TO_TIMESTAMP('2016-10-29 10:48:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002963
;

-- 29/10/2016 10:48:57 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Ret_IIBB@=Y',Updated=TO_TIMESTAMP('2016-10-29 10:48:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002966
;

-- 29/10/2016 10:49:01 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Ret_IIBB@=Y',Updated=TO_TIMESTAMP('2016-10-29 10:49:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002969
;

-- 29/10/2016 10:49:22 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Ret_Ganancias@=Y',Updated=TO_TIMESTAMP('2016-10-29 10:49:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002958
;

-- 29/10/2016 10:49:36 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Ret_Ganancias@=Y',Updated=TO_TIMESTAMP('2016-10-29 10:49:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002962
;

-- 29/10/2016 10:49:38 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Ret_Ganancias@=Y',Updated=TO_TIMESTAMP('2016-10-29 10:49:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002965
;

-- 29/10/2016 10:49:41 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Ret_Ganancias@=Y',Updated=TO_TIMESTAMP('2016-10-29 10:49:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002968
;

-- 29/10/2016 12:14:40 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0  | @EsRetencionIIBB@=Y',Updated=TO_TIMESTAMP('2016-10-29 12:14:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=5299
;

-- 29/10/2016 12:15:52 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET ReadOnlyLogic='@IsApproved@=Y | @LAR_PaymentSource_ID@!0  | @EsRetencionIIBB@=Y',Updated=TO_TIMESTAMP('2016-10-29 12:15:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=5046
;

-- 29/10/2016 12:18:02 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET DisplayLogic='@EsRetencionIIBB@=Y',Updated=TO_TIMESTAMP('2016-10-29 12:18:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002763
;

-- 29/10/2016 12:20:03 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Column SET ReadOnlyLogic='@LAR_PaymentSource_ID@!0  | @EsRetencionIIBB@=Y',Updated=TO_TIMESTAMP('2016-10-29 12:20:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=5303
;

-- 29/10/2016 12:22:31 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET IsReadOnly='Y', DisplayLogic=NULL,Updated=TO_TIMESTAMP('2016-10-29 12:22:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002763
;

-- 29/10/2016 12:22:55 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2016-10-29 12:22:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000412
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000446
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000447
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000452
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000453
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000454
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000455
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3002769
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3002770
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3002806
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000458
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000459
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000460
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000461
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000462
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000463
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000464
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000465
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000466
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000467
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000468
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000469
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000470
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000471
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000472
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000473
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000474
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000475
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000476
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000477
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000478
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000479
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000480
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000481
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000482
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000483
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000484
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000492
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000490
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000489
;

-- 29/10/2016 12:24:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000491
;

-- ISSUE #81: Retenciones
-- Se agregala referencia del pago en el certificado de retención
ALTER TABLE LAR_PaymentWithholding
ADD COLUMN C_Payment_ID numeric(10,0),
ADD CONSTRAINT fk_larpaymentwithholding_c_payment_id FOREIGN KEY (C_Payment_ID) REFERENCES C_Payment(C_Payment_ID)
;

-- 29/10/2016 18:32:12 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001902,3000004,'LAR',0,'N','N','N','The Payment is a unique identifier of this payment.','N',10,'N',19,'N',1384,'N','Y','N','Payment identifier','Payment','C_Payment_ID',100,TO_TIMESTAMP('2016-10-29 18:32:11','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-10-29 18:32:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 29/10/2016 18:32:12 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001902 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 29/10/2016 18:34:17 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002974,10,'Y','N','N',3001902,'N','Y',3000029,'N','The Payment is a unique identifier of this payment.','LAR','Payment identifier','Payment',100,0,'Y',TO_TIMESTAMP('2016-10-29 18:34:16','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2016-10-29 18:34:16','YYYY-MM-DD HH24:MI:SS'))
;

-- 29/10/2016 18:34:17 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002974 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 29/10/2016 18:34:43 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001130
;

-- 29/10/2016 18:34:43 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002974
;

-- 29/10/2016 18:34:43 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3001137
;

-- 29/10/2016 18:34:43 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3001138
;

-- 29/10/2016 18:34:43 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3001134
;

-- 29/10/2016 18:34:43 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3001136
;

-- 29/10/2016 18:34:43 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3001127
;

-- 29/10/2016 18:34:43 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3001139
;

-- 29/10/2016 18:34:43 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3001140
;

-- 29/10/2016 18:34:43 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3001141
;

-- 29/10/2016 18:34:52 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Tab SET IsReadOnly='Y', IsInsertRecord='N',Updated=TO_TIMESTAMP('2016-10-29 18:34:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000029
;

-- 29/10/2016 19:01:57 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2016-10-29 19:01:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000444
;

-- 29/10/2016 19:01:59 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2016-10-29 19:01:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000445
;

-- 03/11/2016 9:51:25 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET IsDisplayed='N', DisplayLogic=NULL,Updated=TO_TIMESTAMP('2016-11-03 09:51:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000325
;

-- 03/11/2016 9:51:43 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET IsDisplayed='N', IsSameLine='N', DisplayLogic=NULL,Updated=TO_TIMESTAMP('2016-11-03 09:51:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000326
;

-- 03/11/2016 9:52:05 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field SET IsDisplayed='N', DisplayLogic='@C_Invoice_ID@^''''',Updated=TO_TIMESTAMP('2016-11-03 09:52:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000323
;

-- 03/11/2016 9:54:28 ART
-- ISSUE #81: Retenciones, configuración en C_BPartner
UPDATE AD_Field_Trl SET Name='Importe Retención',Description='Importe Retención',Help='Importe de la Retención Sufrida.',Updated=TO_TIMESTAMP('2016-11-03 09:54:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000322 AND AD_Language='es_AR'
;

-- 19/01/2017 17:03:36 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003116 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:03:36 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003117,1,'Y','N','N',1000156,'N','Y',224,'N','QSS_LCO','Detailed Names',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:03:36','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:03:36','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:03:36 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003117 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:03:36 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003118,7,'Y','N','N',53246,'N','Y',224,'N','D','Dunning Grace Date',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:03:36','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:03:36','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:03:36 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003118 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:03:37 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003120 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:03:37 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003121,60,'Y','N','N',1000157,'N','Y',224,'N','QSS_LCO','First Name 1',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:03:37','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:03:37','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:03:37 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003121 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:03:37 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003122,60,'Y','N','N',1000158,'N','Y',224,'N','QSS_LCO','First Name 2',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:03:37','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:03:37','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:03:37 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003122 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:03:37 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003123,10,'Y','N','N',1000151,'N','Y',224,'N','QSS_LCO','ISIC',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:03:37','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:03:37','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:03:37 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003123 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:03:37 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003124,22,'Y','N','N',3001883,'N','Y',224,'N','LAR','LAR_Exencion_Ganancias',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:03:37','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:03:37','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:03:37 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003124 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:03:38 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003125,22,'Y','N','N',3001887,'N','Y',224,'N','LAR','LAR_Exencion_IIBB',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:03:37','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:03:37','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:03:38 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003125 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:03:38 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003126,22,'Y','N','N',3001892,'N','Y',224,'N','LAR','LAR_Exencion_IVA',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:03:38','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:03:38','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:03:38 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003126 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:03:38 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003127,1,'Y','N','N',3001891,'N','Y',224,'N','LAR','El Socio del Negocio está exento a recibir Retenciones de IVA','LAR_Exento_Retenciones_IVA',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:03:38','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:03:38','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:03:38 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003127 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:03:38 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003128,1,'Y','N','N',3001901,'N','Y',224,'N','LAR','LAR_Exento_Ret_Ganancias',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:03:38','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:03:38','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:03:38 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003128 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:03:38 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003129,1,'Y','N','N',3001900,'N','Y',224,'N','LAR','LAR_Exento_Ret_IIBB',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:03:38','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:03:38','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:03:38 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003129 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:03:38 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003130,22,'Y','N','N',3001884,'N','Y',224,'N','LAR','LAR_Importe_Exencion_Ganancias',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:03:38','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:03:38','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:03:38 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003130 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:03:39 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003131,22,'Y','N','N',3001888,'N','Y',224,'N','LAR','LAR_Importe_Exencion_IIBB',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:03:38','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:03:38','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:03:39 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003131 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:03:39 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003132,22,'Y','N','N',3001893,'N','Y',224,'N','LAR','LAR_Importe_Exencion_IVA',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:03:39','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:03:39','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:03:39 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003132 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:03:39 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003133,30,'Y','N','N',3001885,'N','Y',224,'N','LAR','LAR_NroCertificado_Ganancias',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:03:39','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:03:39','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:03:39 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003133 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:03:40 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003134,30,'Y','N','N',3001889,'N','Y',224,'N','LAR','LAR_NroCertificado_IIBB',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:03:39','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:03:39','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:03:40 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003134 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:03:40 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003135,30,'Y','N','N',3001894,'N','Y',224,'N','LAR','LAR_NroCertificado_IVA',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:03:40','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:03:40','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:03:40 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003135 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:03:40 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003136,1,'Y','N','N',3001877,'N','Y',224,'N','LAR','LAR_TipoGanancias',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:03:40','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:03:40','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:03:40 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003136 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:03:40 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003137,14,'Y','N','N',3001886,'N','Y',224,'N','LAR','LAR_Vencimiento_Cert_Ganancias',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:03:40','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:03:40','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:03:40 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003137 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:03:41 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003138,14,'Y','N','N',3001890,'N','Y',224,'N','LAR','LAR_Vencimiento_Cert_IIBB',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:03:40','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:03:40','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:03:41 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003138 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:03:41 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003139,14,'Y','N','N',3001895,'N','Y',224,'N','LAR','LAR_Vencimiento_Cert_IVA',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:03:41','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:03:41','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:03:41 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003139 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:03:41 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003140,60,'Y','N','N',1000159,'N','Y',224,'N','QSS_LCO','Last Name 1',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:03:41','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:03:41','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:03:41 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003140 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:03:41 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003141,60,'Y','N','N',1000160,'N','Y',224,'N','QSS_LCO','Last Name 2',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:03:41','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:03:41','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:03:41 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003141 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:03:42 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003142,10,'Y','N','N',58113,'N','Y',224,'N','D','Logo',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:03:41','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:03:41','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:03:42 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003142 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:03:43 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003143,1,'Y','N','N',58381,'N','Y',224,'N','If a business partner is exempt from tax on purchases, the exempt tax rate is used. For this, you need to set up a tax rate with a 0% rate and indicate that this is your tax exempt rate.  This is required for tax reporting, so that you can track tax exempt transactions.','D','Business partner is exempt from tax on purchases','PO Tax exempt',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:03:42','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:03:42','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:03:43 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003143 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:03:43 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003144,10,'Y','N','N',54463,'N','Y',224,'N','EE04','Tax Group',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:03:43','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:03:43','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:03:43 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003144 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:03:43 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003145,1,'Y','N','N',1000154,'N','Y',224,'N','QSS_LCO','Tax ID Digit',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:03:43','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:03:43','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:03:43 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003145 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:03:43 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003146,10,'Y','N','N',1000153,'N','Y',224,'N','QSS_LCO','Tax ID Type',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:03:43','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:03:43','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:03:43 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003146 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:03:43 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003147,10,'Y','N','N',1000152,'N','Y',224,'N','QSS_LCO','Tax Payer Type',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:03:43','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:03:43','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:03:43 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003147 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:03:43 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003148,1,'Y','N','N',1000155,'N','Y',224,'N','QSS_LCO','Use Tax Id Digit',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:03:43','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:03:43','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:03:43 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003148 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3003117
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3003118
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3003119
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3003120
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3003121
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3003122
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3003123
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3003140
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3003141
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3003142
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3003143
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3003144
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3003145
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3003146
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3003147
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3003148
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3003116
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3003128
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3003124
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3003130
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3003137
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3003133
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3003127
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3003126
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3003132
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3003139
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3003135
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3003129
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3003125
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3003131
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3003138
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3003134
;

-- 19/01/2017 17:08:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3003136
;

-- 19/01/2017 17:08:29 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001990,291,'LAR',0,'N','N','N','N',1,'N',20,'N',3000420,'N','Y','N','LAR_Exento_Retenciones_SUSS','LAR_Exento_Retenciones_SUSS',100,TO_TIMESTAMP('2017-01-19 17:08:29','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2017-01-19 17:08:29','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 19/01/2017 17:08:29 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001990 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 19/01/2017 17:08:29 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001991,291,'LAR',0,'N','N','N','N',131089,'N',22,'N',3000421,'N','Y','N','LAR_Exencion_SUSS','LAR_Exencion_SUSS',100,TO_TIMESTAMP('2017-01-19 17:08:29','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2017-01-19 17:08:29','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 19/01/2017 17:08:29 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001991 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 19/01/2017 17:08:29 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001992,291,'LAR',0,'N','N','N','N',131089,'N',22,'N',3000422,'N','Y','N','LAR_Importe_Exencion_SUSS','LAR_Importe_Exencion_SUSS',100,TO_TIMESTAMP('2017-01-19 17:08:29','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2017-01-19 17:08:29','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 19/01/2017 17:08:29 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001992 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 19/01/2017 17:08:29 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001993,291,'LAR',0,'N','N','N','N',30,'N',10,'N',3000423,'N','Y','N','LAR_NroCertificado_SUSS','LAR_NroCertificado_SUSS',100,TO_TIMESTAMP('2017-01-19 17:08:29','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2017-01-19 17:08:29','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 19/01/2017 17:08:29 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001993 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 19/01/2017 17:08:30 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001994,291,'LAR',0,'N','N','N','N',29,'N',16,'N',3000424,'N','Y','N','LAR_Inicio_Cert_SUSS','LAR_Inicio_Cert_SUSS',100,TO_TIMESTAMP('2017-01-19 17:08:29','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2017-01-19 17:08:29','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 19/01/2017 17:08:30 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001994 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 19/01/2017 17:08:30 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001995,291,'LAR',0,'N','N','N','N',29,'N',16,'N',3000425,'N','Y','N','LAR_Vencimiento_Cert_SUSS','LAR_Vencimiento_Cert_SUSS',100,TO_TIMESTAMP('2017-01-19 17:08:30','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2017-01-19 17:08:30','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 19/01/2017 17:08:30 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001995 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 19/01/2017 17:09:14 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003149,131089,'Y','N','N',3001991,'N','Y',224,'N','LAR','LAR_Exencion_SUSS',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:09:08','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:09:08','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:09:14 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003149 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:09:14 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003150,1,'Y','N','N',3001990,'N','Y',224,'N','LAR','LAR_Exento_Retenciones_SUSS',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:09:14','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:09:14','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:09:14 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003150 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:09:14 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003151,131089,'Y','N','N',3001992,'N','Y',224,'N','LAR','LAR_Importe_Exencion_SUSS',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:09:14','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:09:14','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:09:14 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003151 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:09:14 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003152,29,'Y','N','N',3001994,'N','Y',224,'N','LAR','LAR_Inicio_Cert_SUSS',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:09:14','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:09:14','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:09:14 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003152 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:09:14 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003153,30,'Y','N','N',3001993,'N','Y',224,'N','LAR','LAR_NroCertificado_SUSS',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:09:14','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:09:14','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:09:14 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003153 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:09:14 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003154,29,'Y','N','N',3001995,'N','Y',224,'N','LAR','LAR_Vencimiento_Cert_SUSS',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:09:14','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:09:14','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:09:14 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003154 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:12:07 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001996,291,'LAR',0,'N','N','N','N',29,'N',16,'N',3000426,'N','Y','N','LAR_Inicio_Cert_IIBB','LAR_Inicio_Cert_IIBB',100,TO_TIMESTAMP('2017-01-19 17:12:06','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2017-01-19 17:12:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 19/01/2017 17:12:07 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001996 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 19/01/2017 17:12:28 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003155,29,'Y','N','N',3001996,'N','Y',224,'N','LAR','LAR_Inicio_Cert_IIBB',100,0,'Y',TO_TIMESTAMP('2017-01-19 17:12:26','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-01-19 17:12:26','YYYY-MM-DD HH24:MI:SS'))
;

-- 19/01/2017 17:12:28 ART
-- ISSUE #80: Opciones de Retenciones en SdN
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003155 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/01/2017 17:13:20 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3003136
;

-- 19/01/2017 17:13:20 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3003116
;

-- 19/01/2017 17:13:20 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3003128
;

-- 19/01/2017 17:13:20 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3003124
;

-- 19/01/2017 17:13:20 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3003130
;

-- 19/01/2017 17:13:20 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3003137
;

-- 19/01/2017 17:13:20 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3003133
;

-- 19/01/2017 17:13:20 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3003127
;

-- 19/01/2017 17:13:20 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3003126
;

-- 19/01/2017 17:13:20 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3003132
;

-- 19/01/2017 17:13:20 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3003139
;

-- 19/01/2017 17:13:20 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3003135
;

-- 19/01/2017 17:13:20 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3003129
;

-- 19/01/2017 17:13:20 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3003125
;

-- 19/01/2017 17:13:20 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3003131
;

-- 19/01/2017 17:13:20 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3003155
;

-- 19/01/2017 17:13:20 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3003138
;

-- 19/01/2017 17:13:20 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3003134
;

-- 19/01/2017 17:13:20 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3003150
;

-- 19/01/2017 17:13:20 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3003149
;

-- 19/01/2017 17:13:20 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3003151
;

-- 19/01/2017 17:13:20 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3003152
;

-- 19/01/2017 17:13:20 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3003154
;

-- 19/01/2017 17:13:20 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3003153
;

-- 19/01/2017 17:13:36 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2017-01-19 17:13:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003116
;

-- 19/01/2017 17:14:05 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2017-01-19 17:14:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003130
;

-- 19/01/2017 17:14:11 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2017-01-19 17:14:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003133
;

-- 19/01/2017 17:14:27 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2017-01-19 17:14:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003131
;

-- 19/01/2017 17:14:35 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2017-01-19 17:14:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003138
;

-- 19/01/2017 17:14:44 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2017-01-19 17:14:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003151
;

-- 19/01/2017 17:14:56 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2017-01-19 17:14:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003154
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002975
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002953
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002958
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002959
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002960
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002972
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002973
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002961
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002962
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002963
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002964
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002965
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002966
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002967
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002968
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002969
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002970
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=2156
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=9627
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3261
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=1000006
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=1000007
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=1000008
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=1000009
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=2145
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3228
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=2133
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=2136
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=2141
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=8238
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=10592
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=1000011
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=2132
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3001776
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3955
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=2124
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=2164
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=2139
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=2149
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3001605
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=2144
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=2162
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=2148
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=2128
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=2127
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=2146
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=2154
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=2153
;

-- 19/01/2017 17:17:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=54555
;

-- 19/01/2017 17:17:24 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=2135
;

-- 19/01/2017 17:17:24 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=9620
;

-- 19/01/2017 17:17:24 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=57533
;

-- 19/01/2017 20:00:08 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2017-01-19 20:00:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003135
;

-- 19/01/2017 20:00:46 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Ret_Ganancias@=Y',Updated=TO_TIMESTAMP('2017-01-19 20:00:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003124
;

-- 19/01/2017 20:00:53 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Ret_Ganancias@=Y',Updated=TO_TIMESTAMP('2017-01-19 20:00:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003130
;

-- 19/01/2017 20:00:55 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Ret_Ganancias@=Y',Updated=TO_TIMESTAMP('2017-01-19 20:00:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003137
;

-- 19/01/2017 20:00:58 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Ret_Ganancias@=Y',Updated=TO_TIMESTAMP('2017-01-19 20:00:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003133
;

-- 19/01/2017 20:01:23 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLogic='LAR_Exento_Retenciones_IVA',Updated=TO_TIMESTAMP('2017-01-19 20:01:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003126
;

-- 19/01/2017 20:01:25 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLogic='LAR_Exento_Retenciones_IVA',Updated=TO_TIMESTAMP('2017-01-19 20:01:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003132
;

-- 19/01/2017 20:01:27 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLogic='LAR_Exento_Retenciones_IVA',Updated=TO_TIMESTAMP('2017-01-19 20:01:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003139
;

-- 19/01/2017 20:01:29 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLogic='LAR_Exento_Retenciones_IVA',Updated=TO_TIMESTAMP('2017-01-19 20:01:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003135
;

-- 19/01/2017 20:01:57 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLogic='LAR_Exento_Ret_IIBB',Updated=TO_TIMESTAMP('2017-01-19 20:01:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003125
;

-- 19/01/2017 20:02:00 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLogic='LAR_Exento_Ret_IIBB',Updated=TO_TIMESTAMP('2017-01-19 20:02:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003131
;

-- 19/01/2017 20:02:04 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLogic='LAR_Exento_Ret_IIBB',Updated=TO_TIMESTAMP('2017-01-19 20:02:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003155
;

-- 19/01/2017 20:02:10 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLogic='LAR_Exento_Ret_IIBB',Updated=TO_TIMESTAMP('2017-01-19 20:02:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003138
;

-- 19/01/2017 20:02:13 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLogic='LAR_Exento_Ret_IIBB',Updated=TO_TIMESTAMP('2017-01-19 20:02:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003134
;

-- 19/01/2017 20:02:42 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Retenciones_IVA@=Y',Updated=TO_TIMESTAMP('2017-01-19 20:02:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003126
;

-- 19/01/2017 20:02:46 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Retenciones_IVA@=Y',Updated=TO_TIMESTAMP('2017-01-19 20:02:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003132
;

-- 19/01/2017 20:02:48 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Retenciones_IVA@=Y',Updated=TO_TIMESTAMP('2017-01-19 20:02:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003139
;

-- 19/01/2017 20:02:51 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Retenciones_IVA@=Y',Updated=TO_TIMESTAMP('2017-01-19 20:02:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003135
;

-- 19/01/2017 20:03:04 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Ret_IIBB@=Y',Updated=TO_TIMESTAMP('2017-01-19 20:03:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003125
;

-- 19/01/2017 20:03:07 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Ret_IIBB@=Y',Updated=TO_TIMESTAMP('2017-01-19 20:03:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003131
;

-- 19/01/2017 20:03:09 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Ret_IIBB@=Y',Updated=TO_TIMESTAMP('2017-01-19 20:03:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003155
;

-- 19/01/2017 20:03:11 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Ret_IIBB@=Y',Updated=TO_TIMESTAMP('2017-01-19 20:03:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003138
;

-- 19/01/2017 20:03:14 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Ret_IIBB@=Y',Updated=TO_TIMESTAMP('2017-01-19 20:03:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003134
;

-- 19/01/2017 20:03:40 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Retenciones_SUSS@=Y',Updated=TO_TIMESTAMP('2017-01-19 20:03:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003150
;

-- 19/01/2017 20:03:43 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Retenciones_SUSS@=Y',Updated=TO_TIMESTAMP('2017-01-19 20:03:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003149
;

-- 19/01/2017 20:03:45 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Retenciones_SUSS@=Y',Updated=TO_TIMESTAMP('2017-01-19 20:03:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003151
;

-- 19/01/2017 20:03:47 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Retenciones_SUSS@=Y',Updated=TO_TIMESTAMP('2017-01-19 20:03:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003152
;

-- 19/01/2017 20:03:50 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Retenciones_SUSS@=Y',Updated=TO_TIMESTAMP('2017-01-19 20:03:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003154
;

-- 19/01/2017 20:03:54 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLogic='@LAR_Exento_Retenciones_SUSS@=Y',Updated=TO_TIMESTAMP('2017-01-19 20:03:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003153
;

-- 19/01/2017 20:05:44 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLogic=NULL,Updated=TO_TIMESTAMP('2017-01-19 20:05:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003150
;

-- 19/01/2017 20:07:02 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2017-01-19 20:07:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003132
;

-- 19/01/2017 20:07:34 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLength=29,Updated=TO_TIMESTAMP('2017-01-19 20:07:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003151
;

-- 19/01/2017 20:08:01 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLength=22,Updated=TO_TIMESTAMP('2017-01-19 20:08:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003149
;

-- 19/01/2017 20:08:05 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Field SET DisplayLength=22,Updated=TO_TIMESTAMP('2017-01-19 20:08:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003151
;

-- 19/01/2017 20:08:44 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Column SET FieldLength=22,Updated=TO_TIMESTAMP('2017-01-19 20:08:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001991
;

-- 19/01/2017 20:08:57 ART
-- ISSUE #80: Opciones de Retenciones en SdN
UPDATE AD_Column SET FieldLength=22,Updated=TO_TIMESTAMP('2017-01-19 20:08:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001992
;

-- Registración de script
SELECT register_migration_script_lar('0078_ISSUE-81', 'LAR', '')
;
