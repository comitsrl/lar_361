-- 27/05/2026
-- ISSUE #172: Proceso para cerrar ordenes pendientes de entrega/recepcion y/o facturacion.

INSERT INTO AD_Process (Help,AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Classname,CopyFromProcess,Description,Value,Name,AD_Org_ID,AD_Client_ID,UpdatedBy,Created,CreatedBy,Updated,IsActive) VALUES ('Este proceso permite cerrar Ordenes de Compra o de Venta que se encuentran completas, pero que aun conservan pendientes operativos de entrega o recepcion y/o facturacion.
El cierre retira dichas ordenes del circuito de pendientes, evitando que continúen apareciendo como documentos abiertos para tareas operativas posteriores.
Puede limitarse por rango de fechas, tipo de transaccion y, opcionalmente, por tipo de documento.
Si no se selecciona ninguna de las opciones Solo Pendiente Entrega o Solo Pendiente Facturacion, el proceso considerara ambas clases de pendientes.',3000632,'N','N','3','N','N','Y','LAR',0,0,'ar.com.ergio.process.LAR_CerrarOrdenesPendientes','N','Cierra ordenes completas pendientes de entrega o recepcion y/o facturacion.','LAR_CerrarOrdenesPendientes','LAR_CerrarOrdenesPendientes',0,0,100,TO_TIMESTAMP('2026-05-27 21:00:00','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2026-05-27 21:00:00','YYYY-MM-DD HH24:MI:SS'),'Y')
;

INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000632 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

UPDATE AD_Process_Trl SET IsTranslated='Y',Name='LAR_CerrarOrdenesPendientes',Description='Cierra ordenes completas pendientes de entrega o recepcion y/o facturacion.',Help='Este proceso permite cerrar Ordenes de Compra o de Venta que se encuentran completas, pero que aun conservan pendientes operativos de entrega o recepcion y/o facturacion.
El cierre retira dichas ordenes del circuito de pendientes, evitando que continúen apareciendo como documentos abiertos para tareas operativas posteriores.
Puede limitarse por rango de fechas, tipo de transaccion y, opcionalmente, por tipo de documento.
Si no se selecciona ninguna de las opciones Solo Pendiente Entrega o Solo Pendiente Facturacion, el proceso considerara ambas clases de pendientes.',Updated=TO_TIMESTAMP('2026-05-27 21:00:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000632 AND AD_Language='es_AR'
;

INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,Description,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('C_DocType.IsActive=''Y'' AND C_DocType.AD_Client_ID=@#AD_Client_ID@ AND C_DocType.AD_Org_ID IN (0, @#AD_Org_ID@) AND C_DocType.DocBaseType IN (''SOO'', ''POO'') AND C_DocType.IsSOTrx=''@IsSOTrx@''','S',3000164,'LAR','LAR C_DocType Ordenes por Org e IsSOTrx','Tipos de documento de orden, filtrados por organizacion e indicador de venta/compra.',100,100,TO_TIMESTAMP('2026-05-27 21:00:00','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_TIMESTAMP('2026-05-27 21:00:00','YYYY-MM-DD HH24:MI:SS'))
;

INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,Help,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,AD_Element_ID,EntityType,Name,ColumnName,Description,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3001158,0,'Fecha inicial del rango de ordenes a evaluar segun la fecha de la orden.',3000632,100,'N',15,10,'Y',1581,'LAR','Fecha Desde','DateFrom','Fecha inicial del rango de ordenes a cerrar','Y',0,100,TO_TIMESTAMP('2026-05-27 21:00:00','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-27 21:00:00','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3001158 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

UPDATE AD_Process_Para_Trl SET IsTranslated='Y',Name='Fecha Desde',Description='Fecha inicial del rango de ordenes a cerrar',Help='Fecha inicial del rango de ordenes a evaluar segun la fecha de la orden.',Updated=TO_TIMESTAMP('2026-05-27 21:00:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3001158 AND AD_Language='es_AR'
;

INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,Help,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,AD_Element_ID,EntityType,Name,ColumnName,Description,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3001159,0,'Fecha final del rango de ordenes a evaluar segun la fecha de la orden.',3000632,100,'N',15,20,'Y',1582,'LAR','Fecha Hasta','DateTo','Fecha final del rango de ordenes a cerrar','Y',0,100,TO_TIMESTAMP('2026-05-27 21:00:00','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-27 21:00:00','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3001159 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

UPDATE AD_Process_Para_Trl SET IsTranslated='Y',Name='Fecha Hasta',Description='Fecha final del rango de ordenes a cerrar',Help='Fecha final del rango de ordenes a evaluar segun la fecha de la orden.',Updated=TO_TIMESTAMP('2026-05-27 21:00:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3001159 AND AD_Language='es_AR'
;

INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,Help,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,DefaultValue,AD_Element_ID,EntityType,Name,ColumnName,Description,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3001160,0,'Indica si el proceso trabajara sobre Ordenes de Venta. En N, trabajara sobre Ordenes de Compra.',3000632,100,'N',20,30,'Y','''N''',1106,'LAR','Transaccion de Ventas','IsSOTrx','Define si el proceso cerrara ordenes de venta o de compra','Y',0,100,TO_TIMESTAMP('2026-05-27 21:00:00','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-27 21:00:00','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3001160 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

UPDATE AD_Process_Para_Trl SET IsTranslated='Y',Name='Transaccion de Ventas',Description='Define si el proceso cerrara ordenes de venta o de compra',Help='Indica si el proceso trabajara sobre Ordenes de Venta. En N, trabajara sobre Ordenes de Compra.',Updated=TO_TIMESTAMP('2026-05-27 21:00:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3001160 AND AD_Language='es_AR'
;

INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,Help,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,AD_Val_Rule_ID,SeqNo,IsMandatory,AD_Element_ID,EntityType,Name,ColumnName,Description,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3001161,0,'Permite limitar el cierre a ordenes de un tipo de documento especifico, segun la organizacion y el tipo de transaccion seleccionados.',3000632,100,'N',19,3000164,40,'N',196,'LAR','Tipo de Documento','C_DocType_ID','Filtra opcionalmente las ordenes por tipo de documento','Y',0,100,TO_TIMESTAMP('2026-05-27 21:00:00','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-27 21:00:00','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3001161 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

UPDATE AD_Process_Para_Trl SET IsTranslated='Y',Name='Tipo de Documento',Description='Filtra opcionalmente las ordenes por tipo de documento',Help='Permite limitar el cierre a ordenes de un tipo de documento especifico, segun la organizacion y el tipo de transaccion seleccionados.',Updated=TO_TIMESTAMP('2026-05-27 21:00:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3001161 AND AD_Language='es_AR'
;

INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,Help,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,DefaultValue,EntityType,DisplayLogic,Name,ColumnName,Description,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3001162,0,'Al marcar esta opcion, el proceso solo cerrara ordenes que aun tengan pendiente de entrega o recepcion.',3000632,100,'N',20,50,'N','''N''','LAR','@SoloPendienteFacturacion@=''N''','Solo Pendiente Entrega','SoloPendienteEntrega','Limita el cierre a ordenes pendientes de entrega o recepcion','Y',0,100,TO_TIMESTAMP('2026-05-27 21:00:00','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-27 21:00:00','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3001162 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

UPDATE AD_Process_Para_Trl SET IsTranslated='Y',Name='Solo Pendiente Entrega',Description='Limita el cierre a ordenes pendientes de entrega o recepcion',Help='Al marcar esta opcion, el proceso solo cerrara ordenes que aun tengan pendiente de entrega o recepcion.',Updated=TO_TIMESTAMP('2026-05-27 21:00:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3001162 AND AD_Language='es_AR'
;

INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,Help,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,DefaultValue,EntityType,DisplayLogic,Name,ColumnName,Description,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3001163,0,'Al marcar esta opcion, el proceso solo cerrara ordenes que aun tengan pendiente de facturacion.',3000632,100,'N',20,60,'N','''N''','LAR','@SoloPendienteEntrega@=''N''','Solo Pendiente Facturacion','SoloPendienteFacturacion','Limita el cierre a ordenes pendientes de facturacion','Y',0,100,TO_TIMESTAMP('2026-05-27 21:00:00','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-05-27 21:00:00','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3001163 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

UPDATE AD_Process_Para_Trl SET IsTranslated='Y',Name='Solo Pendiente Facturacion',Description='Limita el cierre a ordenes pendientes de facturacion',Help='Al marcar esta opcion, el proceso solo cerrara ordenes que aun tengan pendiente de facturacion.',Updated=TO_TIMESTAMP('2026-05-27 21:00:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3001163 AND AD_Language='es_AR'
;

INSERT INTO AD_Menu (AD_Menu_ID,IsSummary,"action",IsSOTrx,IsReadOnly,AD_Process_ID,EntityType,IsCentrallyMaintained,Name,Description,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000576,'N','P','N','N',3000632,'LAR','Y','LAR_CerrarOrdenesPendientes','Cierra ordenes completas pendientes de entrega o recepcion y/o facturacion.',TO_TIMESTAMP('2026-05-27 21:00:00','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_TIMESTAMP('2026-05-27 21:00:00','YYYY-MM-DD HH24:MI:SS'),0)
;

INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000576 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

UPDATE AD_Menu_Trl SET IsTranslated='Y',Name='LAR_CerrarOrdenesPendientes',Description='Cierra ordenes completas pendientes de entrega o recepcion y/o facturacion.',Updated=TO_TIMESTAMP('2026-05-27 21:00:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=3000576 AND AD_Language='es_AR'
;

INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100,t.AD_Tree_ID, 3000576, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000576)
;

UPDATE AD_TreeNodeMM SET Parent_ID=3000000, SeqNo=10, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000576
;

SELECT register_migration_script_lar('0248_ISSUE-172.sql', 'LAR', '')
;
