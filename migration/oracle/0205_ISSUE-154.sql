ALTER TABLE M_Storage ADD COLUMN DateMaterialPolicy timestamp without time zone;
ALTER TABLE M_ProductionLineMA ADD COLUMN DateMaterialPolicy timestamp without time zone;
ALTER TABLE M_AttributeSet ADD COLUMN IsAutoGenerateLot character(1) NOT NULL DEFAULT 'N';
ALTER TABLE C_Project ADD COLUMN AD_OrgTrx_ID numeric(10,0);
ALTER TABLE C_Project ADD CONSTRAINT adorgtrx_cproject FOREIGN KEY (AD_OrgTrx_ID)
      REFERENCES AD_Org (AD_Org_ID) MATCH SIMPLE;
ALTER TABLE C_Project ADD COLUMN C_Activity_ID numeric(10,0);
ALTER TABLE C_Project ADD CONSTRAINT cactivity_cproject FOREIGN KEY (C_Activity_ID)
      REFERENCES C_Activity (C_Activity_ID) MATCH SIMPLE;
ALTER TABLE M_Production ADD COLUMN Reversal_ID numeric(10,0);
ALTER TABLE M_Production ADD CONSTRAINT reversal_mproduction FOREIGN KEY (Reversal_ID)
      REFERENCES M_Production (M_Production_ID) MATCH SIMPLE;

ALTER TABLE M_Production ADD COLUMN DocAction character(2) NOT NULL;
ALTER TABLE M_Production ADD COLUMN DocStatus character(2) NOT NULL;
ALTER TABLE M_Production ADD COLUMN IsUseProductionPlan character(1) NOT NULL DEFAULT 'N'::bpchar;

ALTER TABLE M_QualityTestResult ADD COLUMN M_Product_ID numeric(10,0);
ALTER TABLE M_QualityTestResult ADD CONSTRAINT mproduct_mqualitytestresult FOREIGN KEY (M_Product_ID)
      REFERENCES M_Product (M_Product_ID) MATCH SIMPLE;

-- 04/01/2022 19:08:48 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004426,325,'LAR',0,'Y','N','N','You find the current status in the Document Status field. The options are listed in a popup','N',2,'N',17,'N',287,'N','Y','N','The targeted status of the document','Document Action','DocAction',TO_DATE('2022-01-04 19:08:46','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2022-01-04 19:08:46','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 04/01/2022 19:08:48 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004426 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 04/01/2022 19:08:48 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004427,325,'LAR',0,'Y','N','N','The Document Status indicates the status of a document at this time.  If you want to change the document status, use the Document Action field','N',2,'N',17,'N',289,'N','Y','N','The current status of the document','Document Status','DocStatus',TO_DATE('2022-01-04 19:08:48','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2022-01-04 19:08:48','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 04/01/2022 19:08:48 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004427 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 04/01/2022 19:20:07 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Column SET DefaultValue='CO', AD_Reference_ID=28,Updated=TO_DATE('2022-01-04 19:20:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004426
;

-- 04/01/2022 19:20:38 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Column SET DefaultValue='DR', AD_Reference_Value_ID=131,Updated=TO_DATE('2022-01-04 19:20:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004427
;

-- 04/01/2022 19:20:50 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Column SET AD_Reference_Value_ID=135,Updated=TO_DATE('2022-01-04 19:20:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004426
;

-- 04/01/2022 19:24:44 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_Workflow (Author,WorkingTime,AccessLevel,Duration,DurationUnit,EntityType,IsDefault,IsValid,PublishStatus,Version,AD_Table_ID,Cost,DocumentNo,AD_Workflow_ID,WaitingTime,IsBetaFunctionality,WorkflowType,Value,Name,Description,UpdatedBy,Created,CreatedBy,AD_Org_ID,Updated,AD_Client_ID,IsActive) VALUES ('Comit S.R.L',0,'1',1,'D','LAR','N','N','R',0,325,0,'10000000',3000009,0,'N','P','Process_Production','Process_Production','(Standard Process Production)',100,TO_DATE('2022-01-04 19:24:43','YYYY-MM-DD HH24:MI:SS'),100,0,TO_DATE('2022-01-04 19:24:43','YYYY-MM-DD HH24:MI:SS'),0,'Y')
;

-- 04/01/2022 19:24:44 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_Workflow_Trl (AD_Language,AD_Workflow_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Workflow_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Workflow t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Workflow_ID=3000009 AND NOT EXISTS (SELECT * FROM AD_Workflow_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Workflow_ID=t.AD_Workflow_ID)
;

-- 04/01/2022 19:26:04 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,AD_Workflow_ID,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,Limit,WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,Action,SplitElement,Value,Name,IsActive,Updated,AD_Org_ID,UpdatedBy,Created,CreatedBy,AD_Client_ID) VALUES (3000043,0,0,3000009,0,'--',0,'LAR','Y','X',0,0,0,0,0,0,'D','X','(DocAuto)','(DocAuto)','Y',TO_DATE('2022-01-04 19:26:04','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2022-01-04 19:26:04','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- 04/01/2022 19:26:04 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_WF_Node_Trl (AD_Language,AD_WF_Node_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_WF_Node_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_WF_Node t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_WF_Node_ID=3000043 AND NOT EXISTS (SELECT * FROM AD_WF_Node_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_WF_Node_ID=t.AD_WF_Node_ID)
;

-- 04/01/2022 19:27:35 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,AD_Workflow_ID,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,Limit,WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,Action,SplitElement,Value,Name,IsActive,Updated,AD_Org_ID,UpdatedBy,Created,CreatedBy,AD_Client_ID) VALUES (3000044,0,0,3000009,0,'CO',0,'LAR','Y','X',0,0,0,0,0,0,'D','X','(DocComplete)','(DocComplete)','Y',TO_DATE('2022-01-04 19:27:34','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2022-01-04 19:27:34','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- 04/01/2022 19:27:35 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_WF_Node_Trl (AD_Language,AD_WF_Node_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_WF_Node_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_WF_Node t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_WF_Node_ID=3000044 AND NOT EXISTS (SELECT * FROM AD_WF_Node_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_WF_Node_ID=t.AD_WF_Node_ID)
;

-- 04/01/2022 19:28:35 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_WF_Node (AD_WF_Node_ID,Cost,DynPriorityChange,AD_Workflow_ID,Priority,DocAction,Duration,EntityType,IsCentrallyMaintained,JoinElement,Limit,WaitTime,WorkingTime,XPosition,YPosition,WaitingTime,Action,SplitElement,Value,Name,IsActive,Updated,AD_Org_ID,UpdatedBy,Created,CreatedBy,AD_Client_ID) VALUES (3000045,0,0,3000009,0,'CO',0,'LAR','Y','X',0,0,0,0,0,0,'Z','X','(Start)','(Start)','Y',TO_DATE('2022-01-04 19:28:34','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2022-01-04 19:28:34','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- 04/01/2022 19:28:35 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_WF_Node_Trl (AD_Language,AD_WF_Node_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_WF_Node_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_WF_Node t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_WF_Node_ID=3000045 AND NOT EXISTS (SELECT * FROM AD_WF_Node_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_WF_Node_ID=t.AD_WF_Node_ID)
;

-- 04/01/2022 19:29:01 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_WF_NodeNext (EntityType,IsStdUserWorkflow,AD_WF_NodeNext_ID,AD_WF_Node_ID,SeqNo,AD_WF_Next_ID,Created,UpdatedBy,CreatedBy,AD_Org_ID,IsActive,Updated,AD_Client_ID) VALUES ('LAR','Y',3000035,3000045,10,3000044,TO_DATE('2022-01-04 19:29:01','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',TO_DATE('2022-01-04 19:29:01','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 04/01/2022 19:29:27 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_WF_NodeNext (EntityType,IsStdUserWorkflow,AD_WF_NodeNext_ID,AD_WF_Node_ID,SeqNo,AD_WF_Next_ID,Created,UpdatedBy,CreatedBy,AD_Org_ID,IsActive,Updated,AD_Client_ID) VALUES ('LAR','N',3000036,3000045,100,3000043,TO_DATE('2022-01-04 19:29:27','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',TO_DATE('2022-01-04 19:29:27','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 04/01/2022 19:30:11 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Workflow SET IsValid='Y', AD_WF_Node_ID=3000045,Updated=TO_DATE('2022-01-04 19:30:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Workflow_ID=3000009
;

-- 04/01/2022 19:30:58 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_Process (AD_Workflow_ID,AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Value,Name,AD_Org_ID,AD_Client_ID,UpdatedBy,CreatedBy,Updated,Created,IsActive) VALUES (3000009,3000463,'N','N','1','N','N','Y','LAR',0,0,'M_Production Process','Process Production',0,0,100,100,TO_DATE('2022-01-04 19:30:58','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-01-04 19:30:58','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 04/01/2022 19:30:58 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000463 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 04/01/2022 19:31:35 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Process_Trl SET IsTranslated='Y',Name='Procesar Producción',Updated=TO_DATE('2022-01-04 19:31:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000463 AND AD_Language='es_AR'
;

-- 04/01/2022 19:38:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Process SET AccessLevel='3',Updated=TO_DATE('2022-01-04 19:38:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000463
;

-- 04/01/2022 19:38:24 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Column SET AD_Process_ID=53076,Updated=TO_DATE('2022-01-04 19:38:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004426
;

-- 04/01/2022 19:44:23 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Column SET AD_Process_ID=3000463,Updated=TO_DATE('2022-01-04 19:44:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004426
;

-- 04/01/2022 19:46:02 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007726,2,'Y','N','N',3004426,'N','Y',53344,'N','You find the current status in the Document Status field. The options are listed in a popup','LAR','The targeted status of the document','Document Action',100,0,'Y',TO_DATE('2022-01-04 19:46:02','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2022-01-04 19:46:02','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 04/01/2022 19:46:02 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007726 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/01/2022 19:46:03 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007727,2,'Y','N','N',3004427,'N','Y',53344,'N','The Document Status indicates the status of a document at this time.  If you want to change the document status, use the Document Action field','LAR','The current status of the document','Document Status',100,0,'Y',TO_DATE('2022-01-04 19:46:02','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2022-01-04 19:46:02','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 04/01/2022 19:46:03 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007727 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/01/2022 19:46:56 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=62016
;

-- 04/01/2022 19:46:56 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3007727
;

-- 04/01/2022 19:46:56 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3007726
;

-- 04/01/2022 19:46:56 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=59749
;

-- 04/01/2022 19:46:56 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=59737
;

-- 04/01/2022 19:46:56 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=59748
;

-- 04/01/2022 19:46:56 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=59755
;

-- 04/01/2022 19:46:56 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=59738
;

-- 04/01/2022 19:46:56 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=62017
;

-- 04/01/2022 19:46:57 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=59757
;

-- 04/01/2022 19:46:57 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=62018
;

-- 04/01/2022 19:46:57 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=59758
;

-- 04/01/2022 19:46:57 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=59759
;

-- 04/01/2022 19:47:07 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2022-01-04 19:47:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007727
;

-- 04/01/2022 19:47:12 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2022-01-04 19:47:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007726
;

-- 04/01/2022 19:48:55 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=62018
;

-- 04/01/2022 19:48:55 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=62017
;

-- 04/01/2022 19:48:55 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=59757
;

-- 04/01/2022 19:49:25 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2022-01-04 19:49:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=59749
;

-- 10/02/2022 19:30:24 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001235,'datematerialpolicy','LAR','datematerialpolicy','datematerialpolicy',0,TO_DATE('2022-02-10 19:30:23','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-02-10 19:30:23','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 10/02/2022 19:30:24 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001235 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 10/02/2022 19:30:24 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004428,250,'LAR',0,'N','N','N','N',29,'N',16,'N',3001235,'N','Y','N','datematerialpolicy','datematerialpolicy',TO_DATE('2022-02-10 19:30:23','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2022-02-10 19:30:23','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/02/2022 19:30:24 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004428 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 10/02/2022 19:31:32 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Column SET Name='DateMaterialPolicy', ColumnName='DateMaterialPolicy',Updated=TO_DATE('2022-02-10 19:31:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004428
;

-- 10/02/2022 19:31:32 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3004428
;

-- 10/02/2022 19:31:32 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET Name='DateMaterialPolicy', Description=NULL, Help=NULL WHERE AD_Column_ID=3004428 AND IsCentrallyMaintained='Y'
;

-- 10/02/2022 19:31:50 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Column_Trl SET Name='Date Material Policy',Updated=TO_DATE('2022-02-10 19:31:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004428 AND AD_Language='es_AR'
;

-- 10/02/2022 19:32:05 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Element SET ColumnName='DateMaterialPolicy', Name='Date Material Policy', PrintName='Date Material Policy',Updated=TO_DATE('2022-02-10 19:32:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001235
;

-- 10/02/2022 19:32:05 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001235
;

-- 10/02/2022 19:32:05 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Column SET ColumnName='DateMaterialPolicy', Name='Date Material Policy', Description=NULL, Help=NULL WHERE AD_Element_ID=3001235
;

-- 10/02/2022 19:32:05 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Process_Para SET ColumnName='DateMaterialPolicy', Name='Date Material Policy', Description=NULL, Help=NULL, AD_Element_ID=3001235 WHERE UPPER(ColumnName)='DATEMATERIALPOLICY' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 10/02/2022 19:32:05 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Process_Para SET ColumnName='DateMaterialPolicy', Name='Date Material Policy', Description=NULL, Help=NULL WHERE AD_Element_ID=3001235 AND IsCentrallyMaintained='Y'
;

-- 10/02/2022 19:32:05 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET Name='Date Material Policy', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001235) AND IsCentrallyMaintained='Y'
;

-- 10/02/2022 19:32:05 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_PrintFormatItem pi SET PrintName='Date Material Policy', Name='Date Material Policy' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001235)
;

-- 10/02/2022 19:32:12 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Element_Trl SET Name='Date Material Policy',PrintName='Date Material Policy',Updated=TO_DATE('2022-02-10 19:32:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001235 AND AD_Language='es_AR'
;

-- 10/02/2022 19:34:50 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007728,29,'Y','N','N',3004428,'N','Y',179,'N','LAR','Date Material Policy',100,0,'Y',TO_DATE('2022-02-10 19:34:49','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2022-02-10 19:34:49','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/02/2022 19:34:50 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007728 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/02/2022 19:36:30 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004429,765,'LAR',0,'N','N','N','N',29,'N',16,'N',3001235,'N','Y','N','Date Material Policy','DateMaterialPolicy',TO_DATE('2022-02-10 19:36:29','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2022-02-10 19:36:29','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/02/2022 19:36:30 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004429 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 10/02/2022 19:39:30 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001236,'isautogeneratelot','LAR','isautogeneratelot','isautogeneratelot',0,TO_DATE('2022-02-10 19:39:29','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-02-10 19:39:29','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 10/02/2022 19:39:30 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001236 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 10/02/2022 19:39:30 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004430,560,'LAR',0,'Y','N','N','N',1,'N',20,'N',3001236,'N','Y','N','isautogeneratelot','isautogeneratelot',TO_DATE('2022-02-10 19:39:29','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2022-02-10 19:39:29','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/02/2022 19:39:30 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004430 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 10/02/2022 19:40:34 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Element SET ColumnName='IsAutoGenerateLot', Name='Auto Generación de Lote', PrintName='Auto Generación de Lote',Updated=TO_DATE('2022-02-10 19:40:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001236
;

-- 10/02/2022 19:40:34 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001236
;

-- 10/02/2022 19:40:34 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Column SET ColumnName='IsAutoGenerateLot', Name='Auto Generación de Lote', Description=NULL, Help=NULL WHERE AD_Element_ID=3001236
;

-- 10/02/2022 19:40:34 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Process_Para SET ColumnName='IsAutoGenerateLot', Name='Auto Generación de Lote', Description=NULL, Help=NULL, AD_Element_ID=3001236 WHERE UPPER(ColumnName)='ISAUTOGENERATELOT' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 10/02/2022 19:40:34 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Process_Para SET ColumnName='IsAutoGenerateLot', Name='Auto Generación de Lote', Description=NULL, Help=NULL WHERE AD_Element_ID=3001236 AND IsCentrallyMaintained='Y'
;

-- 10/02/2022 19:40:34 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET Name='Auto Generación de Lote', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001236) AND IsCentrallyMaintained='Y'
;

-- 10/02/2022 19:40:34 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_PrintFormatItem pi SET PrintName='Auto Generación de Lote', Name='Auto Generación de Lote' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001236)
;

-- 10/02/2022 19:40:40 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Element_Trl SET Name='Auto Generación de Lote',PrintName='Auto Generación de Lote',Updated=TO_DATE('2022-02-10 19:40:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001236 AND AD_Language='es_AR'
;

-- 10/02/2022 19:41:48 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Column_Trl SET Name='Auto Generación de Lote',Updated=TO_DATE('2022-02-10 19:41:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004430 AND AD_Language='es_AR'
;

-- 10/02/2022 19:42:47 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007729,1,'Y','N','N',3004430,'N','Y',461,'N','LAR','Auto Generación de Lote',100,0,'Y',TO_DATE('2022-02-10 19:42:47','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2022-02-10 19:42:47','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/02/2022 19:42:47 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007729 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/02/2022 19:45:08 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3007729
;

-- 10/02/2022 19:45:08 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=12370
;

-- 10/02/2022 19:45:08 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=12369
;

-- 10/02/2022 19:45:08 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=6351
;

-- 10/02/2022 19:45:08 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=8376
;

-- 10/02/2022 19:45:08 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=6347
;

-- 10/02/2022 19:45:08 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=12372
;

-- 10/02/2022 19:45:08 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=12371
;

-- 10/02/2022 19:45:08 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=6350
;

-- 10/02/2022 19:45:08 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=8377
;

-- 10/02/2022 19:45:08 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=6404
;

-- 10/02/2022 19:45:08 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=10419
;

-- 10/02/2022 19:45:30 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET IsSameLine='Y', DisplayLogic='@IsLot@=Y',Updated=TO_DATE('2022-02-10 19:45:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007729
;

-- 10/02/2022 19:46:33 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004431,203,'LAR',0,'N','N','N','The organization which performs or initiates this transaction (for another organization).  The owning Organization may not be the transaction organization in a service bureau environment, with centralized services, and inter-organization transactions.','N',10,'N',19,'N',112,'N','Y','N','Performing or initiating organization','Trx Organization','AD_OrgTrx_ID',TO_DATE('2022-02-10 19:46:33','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2022-02-10 19:46:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/02/2022 19:46:33 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004431 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 10/02/2022 19:46:33 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004432,203,'LAR',0,'N','N','N','Activities indicate tasks that are performed and used to utilize Activity based Costing','N',10,'N',19,'N',1005,'N','Y','N','Business Activity','Activity','C_Activity_ID',TO_DATE('2022-02-10 19:46:33','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2022-02-10 19:46:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/02/2022 19:46:33 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004432 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 10/02/2022 19:47:07 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007730,10,'Y','N','N',3004432,'N','Y',157,'N','Activities indicate tasks that are performed and used to utilize Activity based Costing','LAR','Business Activity','Activity',100,0,'Y',TO_DATE('2022-02-10 19:47:06','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2022-02-10 19:47:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/02/2022 19:47:07 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007730 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/02/2022 19:47:07 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007731,10,'Y','N','N',3004431,'N','Y',157,'N','The organization which performs or initiates this transaction (for another organization).  The owning Organization may not be the transaction organization in a service bureau environment, with centralized services, and inter-organization transactions.','LAR','Performing or initiating organization','Trx Organization',100,0,'Y',TO_DATE('2022-02-10 19:47:07','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2022-02-10 19:47:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/02/2022 19:47:07 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007731 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/02/2022 19:47:16 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007730
;

-- 10/02/2022 19:47:16 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007731
;

-- 10/02/2022 19:51:09 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,Created,Updated,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,IsActive) VALUES (3000078,'LAR','C','N','Validar Diferencias de Costos al Crear Producción','LAR_ValidateCostsDifferenceOnCreate',TO_DATE('2022-02-10 19:51:09','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-02-10 19:51:09','YYYY-MM-DD HH24:MI:SS'),0,0,100,100,'Y')
;

-- 10/02/2022 19:51:46 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,Created,Updated,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,IsActive) VALUES (3000079,'LAR','C','N','Validar Costos al Crear Producción','LAR_ValidateCostsOnCreate',TO_DATE('2022-02-10 19:51:46','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-02-10 19:51:46','YYYY-MM-DD HH24:MI:SS'),0,0,100,100,'Y')
;

-- 10/02/2022 20:13:22 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004433,325,'LAR',0,'N','N','N','N',10,'N',19,'N',53457,'N','Y','N','ID of document reversal','Reversal ID','Reversal_ID',TO_DATE('2022-02-10 20:13:22','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2022-02-10 20:13:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/02/2022 20:13:22 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004433 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 10/02/2022 20:13:53 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007732,10,'Y','N','N',61942,'N','Y',319,'N','A Business Partner is anyone with whom you transact.  This can include Vendor, Customer, Employee or Salesperson','U','Identifies a Business Partner','Business Partner ',100,0,'Y',TO_DATE('2022-02-10 20:13:53','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2022-02-10 20:13:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/02/2022 20:13:53 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007732 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/02/2022 20:13:53 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007733,1,'Y','N','N',61940,'N','Y',319,'N','Indication that this is complete','U','It is complete','Complete',100,0,'Y',TO_DATE('2022-02-10 20:13:53','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2022-02-10 20:13:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/02/2022 20:13:53 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007733 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/02/2022 20:13:53 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007734,1,'Y','N','N',61943,'N','Y',319,'N','The Create From process will create a new document based on information in an existing document selected by the user.','U','Process which will generate a new document lines based on an existing document','Create lines from',100,0,'Y',TO_DATE('2022-02-10 20:13:53','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2022-02-10 20:13:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/02/2022 20:13:53 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007734 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/02/2022 20:13:54 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007735,7,'Y','N','N',59966,'N','Y',319,'N','The Date Promised indicates the date, if any, that an Order was promised for.','D','Date Order was promised','Date Promised',100,0,'Y',TO_DATE('2022-02-10 20:13:53','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2022-02-10 20:13:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/02/2022 20:13:54 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007735 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/02/2022 20:13:54 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007736,2,'Y','N','N',3004426,'N','Y',319,'N','You find the current status in the Document Status field. The options are listed in a popup','LAR','The targeted status of the document','Document Action',100,0,'Y',TO_DATE('2022-02-10 20:13:54','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2022-02-10 20:13:54','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/02/2022 20:13:54 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007736 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/02/2022 20:13:54 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007737,30,'Y','N','N',59961,'N','Y',319,'N','The document number is usually automatically generated by the system and determined by the document type of the document. If the document is not saved, the preliminary number is displayed in "<>".

If the document type of your document has no automatic document sequence defined, the field is empty if you create a new document. This is for documents which usually have an external number (like vendor invoice).  If you leave the field empty, the system will generate a document number for you. The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).','D','Document sequence number of the document','Document No',100,0,'Y',TO_DATE('2022-02-10 20:13:54','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2022-02-10 20:13:54','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/02/2022 20:13:54 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007737 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/02/2022 20:13:54 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007738,2,'Y','N','N',3004427,'N','Y',319,'N','The Document Status indicates the status of a document at this time.  If you want to change the document status, use the Document Action field','LAR','The current status of the document','Document Status',100,0,'Y',TO_DATE('2022-02-10 20:13:54','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2022-02-10 20:13:54','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/02/2022 20:13:54 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007738 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/02/2022 20:13:54 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007739,10,'Y','N','N',59963,'N','Y',319,'N','The Locator indicates where in a Warehouse a product is located.','D','Warehouse Locator','Locator',100,0,'Y',TO_DATE('2022-02-10 20:13:54','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2022-02-10 20:13:54','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/02/2022 20:13:54 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007739 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/02/2022 20:13:55 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007740,20,'Y','N','N',59049,'N','Y',319,'N','The ProcessedOn Date+Time save the exact moment (nanoseconds precision if allowed by the DB) when a document has been processed.','D','The date+time (expressed in decimal format) when the document has been processed','Processed On',100,0,'Y',TO_DATE('2022-02-10 20:13:54','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2022-02-10 20:13:54','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/02/2022 20:13:55 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007740 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/02/2022 20:13:55 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007741,22,'Y','N','N',59962,'N','Y',319,'N','Identifies an item which is either purchased or sold in this organization.','D','Product, Service, Item','Product',100,0,'Y',TO_DATE('2022-02-10 20:13:55','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2022-02-10 20:13:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/02/2022 20:13:55 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007741 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/02/2022 20:13:55 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007742,10,'Y','N','N',59964,'N','Y',319,'N','The Production Quantity identifies the number of products to produce','D','Quantity of products to produce','Production Quantity',100,0,'Y',TO_DATE('2022-02-10 20:13:55','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2022-02-10 20:13:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/02/2022 20:13:55 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007742 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/02/2022 20:13:55 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007743,10,'Y','N','N',3004433,'N','Y',319,'N','LAR','ID of document reversal','Reversal ID',100,0,'Y',TO_DATE('2022-02-10 20:13:55','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2022-02-10 20:13:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/02/2022 20:13:55 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007743 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/02/2022 20:13:55 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007744,10,'Y','N','N',61941,'N','Y',319,'N','The Sales Order Line is a unique identifier for a line in an order.','U','Sales Order Line','Sales Order Line',100,0,'Y',TO_DATE('2022-02-10 20:13:55','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2022-02-10 20:13:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/02/2022 20:13:55 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007744 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/02/2022 20:15:18 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007732
;

-- 10/02/2022 20:15:19 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007733
;

-- 10/02/2022 20:15:19 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007734
;

-- 10/02/2022 20:15:19 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007735
;

-- 10/02/2022 20:15:19 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007736
;

-- 10/02/2022 20:15:19 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007737
;

-- 10/02/2022 20:15:19 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007738
;

-- 10/02/2022 20:15:19 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007739
;

-- 10/02/2022 20:15:19 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3789
;

-- 10/02/2022 20:15:19 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007740
;

-- 10/02/2022 20:15:19 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3782
;

-- 10/02/2022 20:15:19 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007741
;

-- 10/02/2022 20:15:19 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007742
;

-- 10/02/2022 20:15:19 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007744
;

-- 10/02/2022 20:15:19 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3783
;

-- 10/02/2022 20:15:19 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3784
;

-- 10/02/2022 20:15:19 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3786
;

-- 10/02/2022 20:15:19 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3787
;

-- 10/02/2022 20:15:19 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3785
;

-- 10/02/2022 20:15:19 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3788
;

-- 10/02/2022 20:15:19 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=7817
;

-- 10/02/2022 20:15:19 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=7820
;

-- 10/02/2022 20:15:19 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=7821
;

-- 10/02/2022 20:15:19 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=7818
;

-- 10/02/2022 20:15:19 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=7822
;

-- 10/02/2022 20:15:19 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=7819
;

-- 10/02/2022 20:15:19 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3790
;

-- 10/02/2022 20:15:19 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3791
;

-- 10/02/2022 20:15:19 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=5145
;

-- 10/02/2022 20:15:19 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3007743
;

-- 10/02/2022 20:15:56 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007745,10,'Y','N','N',3004433,'N','Y',53344,'N','LAR','ID of document reversal','Reversal ID',100,0,'Y',TO_DATE('2022-02-10 20:15:55','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2022-02-10 20:15:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/02/2022 20:15:56 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007745 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/02/2022 20:22:34 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000142,'T','LAR','N','M_Production',0,0,100,TO_DATE('2022-02-10 20:22:34','YYYY-MM-DD HH24:MI:SS'),'Y',TO_DATE('2022-02-10 20:22:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/02/2022 20:22:34 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000142 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 10/02/2022 20:23:37 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Ref_Table (IsValueDisplayed,WhereClause,AD_Table_ID,AD_Reference_ID,AD_Key,AD_Display,EntityType,CreatedBy,Updated,Created,AD_Client_ID,UpdatedBy,AD_Org_ID,IsActive) VALUES ('N','IsActive = ''Y''',325,3000142,3596,59961,'LAR',100,TO_DATE('2022-02-10 20:23:37','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-02-10 20:23:37','YYYY-MM-DD HH24:MI:SS'),0,100,0,'Y')
;

-- 10/02/2022 20:23:55 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Column SET AD_Reference_Value_ID=3000142, AD_Reference_ID=18,Updated=TO_DATE('2022-02-10 20:23:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004433
;

-- 14/02/2022 18:50:55 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001237,'isuseproductionplan','LAR','isuseproductionplan','isuseproductionplan',0,TO_DATE('2022-02-14 18:50:54','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-02-14 18:50:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 14/02/2022 18:50:55 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001237 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 14/02/2022 18:50:55 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004434,325,'LAR',0,'Y','N','N','N',1,'N',20,'N',3001237,'N','Y','N','isuseproductionplan','isuseproductionplan',TO_DATE('2022-02-14 18:50:54','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2022-02-14 18:50:54','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/02/2022 18:50:55 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004434 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 14/02/2022 18:51:30 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Column SET ColumnName='IsUseProductionPlan',Updated=TO_DATE('2022-02-14 18:51:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004434
;

-- 14/02/2022 18:51:59 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Element SET ColumnName='IsUseProductionPlan', Name='Utiliza Plan de Producción', PrintName='Utiliza Plan de Producción',Updated=TO_DATE('2022-02-14 18:51:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001237
;

-- 14/02/2022 18:51:59 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001237
;

-- 14/02/2022 18:51:59 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Column SET ColumnName='IsUseProductionPlan', Name='Utiliza Plan de Producción', Description=NULL, Help=NULL WHERE AD_Element_ID=3001237
;

-- 14/02/2022 18:51:59 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Process_Para SET ColumnName='IsUseProductionPlan', Name='Utiliza Plan de Producción', Description=NULL, Help=NULL, AD_Element_ID=3001237 WHERE UPPER(ColumnName)='ISUSEPRODUCTIONPLAN' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 14/02/2022 18:51:59 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Process_Para SET ColumnName='IsUseProductionPlan', Name='Utiliza Plan de Producción', Description=NULL, Help=NULL WHERE AD_Element_ID=3001237 AND IsCentrallyMaintained='Y'
;

-- 14/02/2022 18:51:59 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET Name='Utiliza Plan de Producción', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001237) AND IsCentrallyMaintained='Y'
;

-- 14/02/2022 18:51:59 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_PrintFormatItem pi SET PrintName='Utiliza Plan de Producción', Name='Utiliza Plan de Producción' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001237)
;

-- 14/02/2022 18:52:04 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Element_Trl SET Name='Utiliza Plan de Producción',PrintName='Utiliza Plan de Producción',Updated=TO_DATE('2022-02-14 18:52:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001237 AND AD_Language='es_AR'
;

-- 14/02/2022 18:52:16 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Column_Trl SET Name='Utiliza Plan de Producción',Updated=TO_DATE('2022-02-14 18:52:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004434 AND AD_Language='es_AR'
;

-- 14/02/2022 18:52:30 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007746,1,'Y','N','N',3004434,'N','Y',319,'N','LAR','Utiliza Plan de Producción',100,0,'Y',TO_DATE('2022-02-14 18:52:29','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2022-02-14 18:52:29','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/02/2022 18:52:30 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007746 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/02/2022 18:52:36 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007746
;

-- 14/02/2022 18:53:51 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007747,1,'Y','N','N',3004434,'N','Y',53344,'N','LAR','Utiliza Plan de Producción',100,0,'Y',TO_DATE('2022-02-14 18:53:51','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2022-02-14 18:53:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/02/2022 18:53:51 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007747 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/02/2022 18:53:59 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007747
;

-- 14/02/2022 18:53:59 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3007745
;

-- 14/02/2022 18:54:39 ART
-- ISSUE #154: Botón DocAction en proceso de producción de productos.
UPDATE AD_Ref_Table SET WhereClause=NULL,Updated=TO_DATE('2022-02-14 18:54:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=3000142
;

-- 25/02/2022 21:24:32 ART
-- ISSUE #154: M_Product_ID en resultado de test de calidad.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004435,53331,'LAR',0,'N','N','N','Identifies an item which is either purchased or sold in this organization.','N',10,'N',19,'N',454,'N','Y','N','Product, Service, Item','Product','M_Product_ID',TO_DATE('2022-02-25 21:24:32','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2022-02-25 21:24:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 25/02/2022 21:24:33 ART
-- ISSUE #154: M_Product_ID en resultado de test de calidad.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004435 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 25/02/2022 21:26:05 ART
-- ISSUE #154: M_Product_ID en resultado de test de calidad.
UPDATE AD_Column SET ColumnSQL='(SELECT pqt.ExpectedResult FROM M_Product_QualityTest pqt WHERE pqt.M_QualityTest_ID=M_QualityTestResult.M_QualityTest_ID AND pqt.M_Product_ID=M_QualityTestResult.M_Product_ID)', IsAllowCopy='N',Updated=TO_DATE('2022-02-25 21:26:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=61960
;

-- 25/02/2022 21:27:39 ART
-- ISSUE #154: M_Product_ID en resultado de test de calidad.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007748,10,'Y','N','N',3004435,'N','Y',53421,'N','Identifies an item which is either purchased or sold in this organization.','LAR','Product, Service, Item','Product',100,0,'Y',TO_DATE('2022-02-25 21:27:39','YYYY-MM-DD HH24:MI:SS'),0,TO_DATE('2022-02-25 21:27:39','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 25/02/2022 21:27:39 ART
-- ISSUE #154: M_Product_ID en resultado de test de calidad.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007748 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 25/02/2022 21:28:00 ART
-- ISSUE #154: M_Product_ID en resultado de test de calidad.
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=61983
;

-- 25/02/2022 21:28:00 ART
-- ISSUE #154: M_Product_ID en resultado de test de calidad.
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=61973
;

-- 25/02/2022 21:28:00 ART
-- ISSUE #154: M_Product_ID en resultado de test de calidad.
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=61974
;

-- 25/02/2022 21:28:00 ART
-- ISSUE #154: M_Product_ID en resultado de test de calidad.
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=61975
;

-- 25/02/2022 21:28:00 ART
-- ISSUE #154: M_Product_ID en resultado de test de calidad.
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=61976
;

-- 25/02/2022 21:28:00 ART
-- ISSUE #154: M_Product_ID en resultado de test de calidad.
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3007748
;

-- 25/02/2022 21:28:00 ART
-- ISSUE #154: M_Product_ID en resultado de test de calidad.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=61977
;

-- 25/02/2022 21:28:00 ART
-- ISSUE #154: M_Product_ID en resultado de test de calidad.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=61978
;

-- 25/02/2022 21:28:00 ART
-- ISSUE #154: M_Product_ID en resultado de test de calidad.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=61979
;

-- 25/02/2022 21:28:00 ART
-- ISSUE #154: M_Product_ID en resultado de test de calidad.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=61980
;

-- 25/02/2022 21:28:00 ART
-- ISSUE #154: M_Product_ID en resultado de test de calidad.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=61981
;

-- 25/02/2022 21:28:08 ART
-- ISSUE #154: M_Product_ID en resultado de test de calidad.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2022-02-25 21:28:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007748
;

-- 25/02/2022 21:31:05 ART
-- ISSUE #154: M_Product_ID en resultado de test de calidad.
UPDATE AD_Column SET IsUpdateable='N',Updated=TO_DATE('2022-02-25 21:31:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004435
;

-- Registración de script
SELECT register_migration_script_lar('0205_ISSUE-154.sql', 'LAR', '') FROM dual
;
