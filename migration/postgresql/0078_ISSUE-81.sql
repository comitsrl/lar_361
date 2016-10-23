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

-- Registración de script
SELECT register_migration_script_lar('0078_ISSUE-81', 'LAR', '')
;
