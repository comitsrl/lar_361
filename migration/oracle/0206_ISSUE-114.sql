-- 23/02/2022 19:21:38 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,AD_Client_ID,AD_Org_ID,Created,Updated,CreatedBy,UpdatedBy,IsActive) VALUES (3000080,'LAR','C','N','Ingresar Y, si desea actualizar de manera automatica la tasa del día, al cambiar la fecha del Recibo/OP. Caso contrario, ingresar N.','LAR_Actualizar_TasaDelDia_Recibos/OP',1000000,0,TO_DATE('2022-02-23 19:21:37','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-02-23 19:21:37','YYYY-MM-DD HH24:MI:SS'),100,100,'Y')
;

-- 02/03/2022 18:54:01 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001238,'fechaop','LAR','fechaop','fechaop',0,TO_DATE('2022-03-02 18:54:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-03-02 18:54:00','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 02/03/2022 18:54:01 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001238 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 02/03/2022 18:54:01 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004436,3000010,'LAR',0,'N','N','N','N',29,'N',16,'N',3001238,'N','Y','N','fechaop','fechaop',100,TO_DATE('2022-03-02 18:54:00','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2022-03-02 18:54:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/03/2022 18:54:01 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004436 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/03/2022 18:55:01 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Element SET ColumnName='FechaOP', Name='Fecha de Orden de Pago', PrintName='Fecha de Orden de Pago',Updated=TO_DATE('2022-03-02 18:55:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001238
;

-- 02/03/2022 18:55:01 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001238
;

-- 02/03/2022 18:55:01 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Column SET ColumnName='FechaOP', Name='Fecha de Orden de Pago', Description=NULL, Help=NULL WHERE AD_Element_ID=3001238
;

-- 02/03/2022 18:55:01 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Process_Para SET ColumnName='FechaOP', Name='Fecha de Orden de Pago', Description=NULL, Help=NULL, AD_Element_ID=3001238 WHERE UPPER(ColumnName)='FECHAOP' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 02/03/2022 18:55:01 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Process_Para SET ColumnName='FechaOP', Name='Fecha de Orden de Pago', Description=NULL, Help=NULL WHERE AD_Element_ID=3001238 AND IsCentrallyMaintained='Y'
;

-- 02/03/2022 18:55:01 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Field SET Name='Fecha de Orden de Pago', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001238) AND IsCentrallyMaintained='Y'
;

-- 02/03/2022 18:55:01 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_PrintFormatItem pi SET PrintName='Fecha de Orden de Pago', Name='Fecha de Orden de Pago' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001238)
;

-- 02/03/2022 18:55:06 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Element_Trl SET Name='Fecha de Orden de Pago',PrintName='Fecha de Orden de Pago',Updated=TO_DATE('2022-03-02 18:55:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001238 AND AD_Language='es_AR'
;

-- 02/03/2022 18:55:20 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Column_Trl SET Name='Fecha de Orden de Pago',Updated=TO_DATE('2022-03-02 18:55:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004436 AND AD_Language='es_AR'
;

-- 02/03/2022 18:55:47 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Column SET AD_Reference_ID=15,Updated=TO_DATE('2022-03-02 18:55:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004436
;

-- 02/03/2022 18:57:33 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Column SET MandatoryLogic='@IsReceipt@=''Y'' & @C_CurrencyTo_ID@ > 0',Updated=TO_DATE('2022-03-02 18:57:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004436
;

-- 02/03/2022 18:58:24 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007749,29,'Y','N','N',3004436,'N','Y',3000012,'N','LAR','Fecha de Orden de Pago',100,0,TO_DATE('2022-03-02 18:58:24','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2022-03-02 18:58:24','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/03/2022 18:58:24 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007749 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/03/2022 18:58:25 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007750,1,'Y','N','N',3004423,'N','Y',3000012,'N','LAR','Generar Pago x Dif. de Cambio',100,0,TO_DATE('2022-03-02 18:58:24','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2022-03-02 18:58:24','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/03/2022 18:58:25 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007750 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/03/2022 18:59:06 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007750
;

-- 02/03/2022 18:59:06 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3006705
;

-- 02/03/2022 18:59:07 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3007681
;

-- 02/03/2022 18:59:07 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000269
;

-- 02/03/2022 18:59:07 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3007749
;

-- 02/03/2022 19:03:44 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3007749
;

-- 02/03/2022 19:03:44 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3000266
;

-- 02/03/2022 19:03:44 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3000901
;

-- 02/03/2022 19:03:44 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3007562
;

-- 02/03/2022 19:03:44 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3007564
;

-- 02/03/2022 19:03:44 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000386
;

-- 02/03/2022 19:03:44 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3001296
;

-- 02/03/2022 19:03:44 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000602
;

-- 02/03/2022 19:03:44 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3005762
;

-- 02/03/2022 19:03:44 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3005876
;

-- 02/03/2022 19:03:44 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3005877
;

-- 02/03/2022 19:03:44 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3004051
;

-- 02/03/2022 19:03:44 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3006705
;

-- 02/03/2022 19:03:44 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3007681
;

-- 02/03/2022 19:03:44 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000269
;

-- 02/03/2022 19:03:57 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2022-03-02 19:03:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007749
;

-- 02/03/2022 19:05:11 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007752,29,'Y','N','N',3004436,'N','Y',3000015,'N','LAR','Fecha de Orden de Pago',100,0,TO_DATE('2022-03-02 19:05:11','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2022-03-02 19:05:11','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/03/2022 19:05:11 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007752 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/03/2022 19:06:28 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007752
;

-- 02/03/2022 19:07:29 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Field SET DisplayLogic='@IsReceipt@=''Y'' & @C_CurrencyTo_ID@ > 0',Updated=TO_DATE('2022-03-02 19:07:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007749
;

-- 02/03/2022 19:16:03 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2022-03-02 19:16:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007681
;

-- 02/03/2022 19:16:09 ART
-- ISSUE #114: Recuperar tasa del dia automaticamente en Recibos/OP.
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Calcular Dif. de Cambio',Updated=TO_DATE('2022-03-02 19:16:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007681 AND AD_Language='es_AR'
;

-- Registración de script
SELECT register_migration_script_lar('0206_ISSUE-114.sql', 'LAR', '') FROM dual
;
