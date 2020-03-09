ALTER TABLE C_Invoice ADD COLUMN DocSubTypeCAE character(3);

-- 09/03/2020 17:39:21 ART
-- ISSUE #77: Corrección de despliegue logico para campos FCE.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003583,318,'LAR',0,'N','N','N','N',3,'N',17,'N',3000012,'N','Y','N','DocSubtypeCAE','DocSubtypeCAE',100,TO_TIMESTAMP('2020-03-09 17:39:21','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-03-09 17:39:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/03/2020 17:39:21 ART
-- ISSUE #77: Corrección de despliegue logico para campos FCE.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003583 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/03/2020 17:40:52 ART
-- ISSUE #77: Corrección de despliegue logico para campos FCE.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006683,3,'Y','N','N',3003583,'N','Y',263,'N','LAR','DocSubtypeCAE',100,0,TO_TIMESTAMP('2020-03-09 17:40:52','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2020-03-09 17:40:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/03/2020 17:40:52 ART
-- ISSUE #77: Corrección de despliegue logico para campos FCE.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006683 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/03/2020 17:42:42 ART
-- ISSUE #77: Corrección de despliegue logico para campos FCE.
UPDATE AD_Field SET DisplayLogic='@DocSubTypeCae@ = 203 | @DocSubTypeCae@ = 208 | @DocSubTypeCae@ = 213',Updated=TO_TIMESTAMP('2020-03-09 17:42:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006572
;

-- 09/03/2020 17:43:40 ART
-- ISSUE #77: Corrección de despliegue logico para campos FCE.
UPDATE AD_Column SET MandatoryLogic='@DocSubTypeCae@ = 201 | @DocSubTypeCae@ = 206 | @DocSubTypeCae@ = 211',Updated=TO_TIMESTAMP('2020-03-09 17:43:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003527
;

-- 09/03/2020 18:00:20 ART
-- ISSUE #77: Corrección de despliegue logico para campos FCE.
UPDATE AD_Column SET AD_Reference_ID=10,Updated=TO_TIMESTAMP('2020-03-09 18:00:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003583
;

-- 09/03/2020 18:05:45 ART
-- ISSUE #77: Corrección de despliegue logico para campos FCE.
UPDATE AD_Column SET MandatoryLogic='@DocSubTypeCAE@ = 201 | @DocSubTypeCAE@ = 206 | @DocSubTypeCAE@ = 211',Updated=TO_TIMESTAMP('2020-03-09 18:05:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003527
;

-- 09/03/2020 18:05:59 ART
-- ISSUE #77: Corrección de despliegue logico para campos FCE.
UPDATE AD_Field SET DisplayLogic='@DocSubTypeCAE@ = 201 | @DocSubTypeCAE@ = 206 | @DocSubTypeCAE@ = 211',Updated=TO_TIMESTAMP('2020-03-09 18:05:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006608
;

-- 09/03/2020 18:06:15 ART
-- ISSUE #77: Corrección de despliegue logico para campos FCE.
UPDATE AD_Field SET DisplayLogic='@DocSubTypeCAE@ = 203 | @DocSubTypeCAE@ = 208 | @DocSubTypeCAE@ = 213',Updated=TO_TIMESTAMP('2020-03-09 18:06:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006572
;

-- 09/03/2020 18:39:41 ART
-- ISSUE #77: Corrección de despliegue logico para campos FCE.
UPDATE AD_Field SET DisplayLogic='1=2',Updated=TO_TIMESTAMP('2020-03-09 18:39:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006683
;

-- Registración de script
SELECT register_migration_script_lar('0151_ISSUE-77.sql', 'LAR', '')
;
