ALTER TABLE C_Invoice ADD COLUMN DescartarPE character(1) COLLATE pg_catalog."default" DEFAULT 'N'::bpchar;

-- 02/04/2025 23:44:37 ART
-- ISSUE #1: Proceso de descarte de Mercaderia Pendiente de Entrega.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001506,'descartarpe','LAR','descartarpe','descartarpe',0,TO_TIMESTAMP('2025-04-02 23:44:36','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2025-04-02 23:44:36','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 02/04/2025 23:44:37 ART
-- ISSUE #1: Proceso de descarte de Mercaderia Pendiente de Entrega.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001506 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 02/04/2025 23:44:38 ART
-- ISSUE #1: Proceso de descarte de Mercaderia Pendiente de Entrega.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005814,318,'LAR',0,'N','N','N','N',1,'N',20,'N',3001506,'N','Y','N','descartarpe','descartarpe',100,TO_TIMESTAMP('2025-04-02 23:44:36','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2025-04-02 23:44:36','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/04/2025 23:44:38 ART
-- ISSUE #1: Proceso de descarte de Mercaderia Pendiente de Entrega.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005814 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/04/2025 23:45:29 ART
-- ISSUE #1: Proceso de descarte de Mercaderia Pendiente de Entrega.
UPDATE AD_Element SET ColumnName='DescartarPE', Name='Descartar Pendiente de Entrega', PrintName='Descartar Pendiente de Entrega',Updated=TO_TIMESTAMP('2025-04-02 23:45:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001506
;

-- 02/04/2025 23:45:29 ART
-- ISSUE #1: Proceso de descarte de Mercaderia Pendiente de Entrega.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001506
;

-- 02/04/2025 23:45:29 ART
-- ISSUE #1: Proceso de descarte de Mercaderia Pendiente de Entrega.
UPDATE AD_Column SET ColumnName='DescartarPE', Name='Descartar Pendiente de Entrega', Description=NULL, Help=NULL WHERE AD_Element_ID=3001506
;

-- 02/04/2025 23:45:29 ART
-- ISSUE #1: Proceso de descarte de Mercaderia Pendiente de Entrega.
UPDATE AD_Process_Para SET ColumnName='DescartarPE', Name='Descartar Pendiente de Entrega', Description=NULL, Help=NULL, AD_Element_ID=3001506 WHERE UPPER(ColumnName)='DESCARTARPE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 02/04/2025 23:45:29 ART
-- ISSUE #1: Proceso de descarte de Mercaderia Pendiente de Entrega.
UPDATE AD_Process_Para SET ColumnName='DescartarPE', Name='Descartar Pendiente de Entrega', Description=NULL, Help=NULL WHERE AD_Element_ID=3001506 AND IsCentrallyMaintained='Y'
;

-- 02/04/2025 23:45:29 ART
-- ISSUE #1: Proceso de descarte de Mercaderia Pendiente de Entrega.
UPDATE AD_Field SET Name='Descartar Pendiente de Entrega', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001506) AND IsCentrallyMaintained='Y'
;

-- 02/04/2025 23:45:29 ART
-- ISSUE #1: Proceso de descarte de Mercaderia Pendiente de Entrega.
UPDATE AD_PrintFormatItem SET PrintName='Descartar Pendiente de Entrega', Name='Descartar Pendiente de Entrega' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001506)
;

-- 02/04/2025 23:45:34 ART
-- ISSUE #1: Proceso de descarte de Mercaderia Pendiente de Entrega.
UPDATE AD_Element_Trl SET Name='Descartar Pendiente de Entrega',PrintName='Descartar Pendiente de Entrega',Updated=TO_TIMESTAMP('2025-04-02 23:45:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001506 AND AD_Language='es_AR'
;

-- 02/04/2025 23:45:47 ART
-- ISSUE #1: Proceso de descarte de Mercaderia Pendiente de Entrega.
UPDATE AD_Column_Trl SET Name='Descartar Pendiente de Entrega',Updated=TO_TIMESTAMP('2025-04-02 23:45:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005814 AND AD_Language='es_AR'
;

-- 02/04/2025 23:47:00 ART
-- ISSUE #1: Proceso de descarte de Mercaderia Pendiente de Entrega.
INSERT INTO AD_Process (AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Classname,CopyFromProcess,Value,Name,AD_Org_ID,AD_Client_ID,UpdatedBy,Created,CreatedBy,Updated,IsActive) VALUES (3000595,'N','N','3','N','Y','S','LAR',2078,2063,'ar.com.ergio.process.LAR_DescartarPendienteEntrega','N','Descartar Pendiente de Entrega','Descartar Pendiente de Entrega',0,0,100,TO_TIMESTAMP('2025-04-02 23:47:00','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2025-04-02 23:47:00','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 02/04/2025 23:47:00 ART
-- ISSUE #1: Proceso de descarte de Mercaderia Pendiente de Entrega.
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000595 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 02/04/2025 23:47:41 ART
-- ISSUE #1: Proceso de descarte de Mercaderia Pendiente de Entrega.
UPDATE AD_Column SET AD_Reference_ID=28, AD_Process_ID=3000368,Updated=TO_TIMESTAMP('2025-04-02 23:47:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005814
;

-- 02/04/2025 23:48:01 ART
-- ISSUE #1: Proceso de descarte de Mercaderia Pendiente de Entrega.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009400,1,'Y','N','N',3005814,'N','Y',263,'N','LAR','Descartar Pendiente de Entrega',100,0,TO_TIMESTAMP('2025-04-02 23:48:01','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2025-04-02 23:48:01','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/04/2025 23:48:01 ART
-- ISSUE #1: Proceso de descarte de Mercaderia Pendiente de Entrega.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009400 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/04/2025 23:49:42 ART
-- ISSUE #1: Proceso de descarte de Mercaderia Pendiente de Entrega.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3009400
;

-- 02/04/2025 23:59:18 ART
-- ISSUE #1: Proceso de descarte de Mercaderia Pendiente de Entrega.
UPDATE AD_Column SET AD_Process_ID=3000595,Updated=TO_TIMESTAMP('2025-04-02 23:59:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005814
;

-- 03/04/2025 0:10:15 ART
-- ISSUE #1: Proceso de descarte de Mercaderia Pendiente de Entrega.
UPDATE AD_Process SET Help='Se descartaran las cantidades pendientes de entrega de esta venta o desde la Factura Origen, en caso de tratarse de una Nota de Crédito.', IsServerProcess='N', ShowHelp='Y',Updated=TO_TIMESTAMP('2025-04-03 00:10:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000595
;

-- 03/04/2025 0:10:15 ART
-- ISSUE #1: Proceso de descarte de Mercaderia Pendiente de Entrega.
UPDATE AD_Process_Trl SET IsTranslated='N' WHERE AD_Process_ID=3000595
;

-- 03/04/2025 0:18:39 ART
-- ISSUE #1: Proceso de descarte de Mercaderia Pendiente de Entrega.
UPDATE AD_Process_Trl SET Description='Se descartaran las cantidades pendientes de entrega de esta venta o desde la Factura Origen, en caso de tratarse de una Nota de Crédito.',Help='Se descartaran las cantidades pendientes de entrega de esta venta o desde la Factura Origen, en caso de tratarse de una Nota de Crédito.',Updated=TO_TIMESTAMP('2025-04-03 00:18:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000595 AND AD_Language='es_AR'
;

-- 03/04/2025 0:18:46 ART
-- ISSUE #1: Proceso de descarte de Mercaderia Pendiente de Entrega.
UPDATE AD_Process SET Description='Se descartaran las cantidades pendientes de entrega de esta venta o desde la Factura Origen, en caso de tratarse de una Nota de Crédito.',Updated=TO_TIMESTAMP('2025-04-03 00:18:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000595
;

-- 03/04/2025 0:18:46 ART
-- ISSUE #1: Proceso de descarte de Mercaderia Pendiente de Entrega.
UPDATE AD_Process_Trl SET IsTranslated='N' WHERE AD_Process_ID=3000595
;

-- 03/04/2025 0:21:43 ART
-- ISSUE #1: Proceso de descarte de Mercaderia Pendiente de Entrega.
UPDATE AD_Process SET Help=NULL,Updated=TO_TIMESTAMP('2025-04-03 00:21:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000595
;

-- 03/04/2025 0:21:43 ART
-- ISSUE #1: Proceso de descarte de Mercaderia Pendiente de Entrega.
UPDATE AD_Process_Trl SET IsTranslated='N' WHERE AD_Process_ID=3000595
;

-- 03/04/2025 0:21:54 ART
-- ISSUE #1: Proceso de descarte de Mercaderia Pendiente de Entrega.
UPDATE AD_Process_Trl SET Help=NULL,Updated=TO_TIMESTAMP('2025-04-03 00:21:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000595 AND AD_Language='es_AR'
;

-- 03/04/2025 0:31:01 ART
-- ISSUE #1: Proceso de descarte de Mercaderia Pendiente de Entrega.
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_TIMESTAMP('2025-04-03 00:31:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005814
;

-- 03/04/2025 0:33:06 ART
-- ISSUE #1: Proceso de descarte de Mercaderia Pendiente de Entrega.
UPDATE AD_Field SET DisplayLogic='@DocStatus@ = ''CO''',Updated=TO_TIMESTAMP('2025-04-03 00:33:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009400
;

-- Registración de script
SELECT register_migration_script_lar('0230_ISSUE-167.sql', 'LAR', '')
;
