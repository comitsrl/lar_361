ALTER TABLE C_BPartner ADD COLUMN EsGrande character(1) NOT NULL DEFAULT 'N'::bpchar;
ALTER TABLE C_BPartner ADD CONSTRAINT c_bpartner_esgrande_check CHECK (EsGrande = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]));

ALTER TABLE C_Invoice ADD COLUMN FechaPago timestamp without time zone NOT NULL DEFAULT now();

-- 02/08/2019 13:14:55 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001041,'esgrande','LAR','esgrande','esgrande',0,TO_TIMESTAMP('2019-08-02 13:14:55','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2019-08-02 13:14:55','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 02/08/2019 13:14:55 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001041 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 02/08/2019 13:14:55 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003524,291,'LAR',0,'Y','N','N','N',1,'N',20,'N',3001041,'N','Y','N','esgrande','esgrande',100,TO_TIMESTAMP('2019-08-02 13:14:55','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2019-08-02 13:14:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:14:55 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003524 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/08/2019 13:15:51 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Column SET Name='Es Grande', ColumnName='EsGrande',Updated=TO_TIMESTAMP('2019-08-02 13:15:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003524
;

-- 02/08/2019 13:15:51 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003524
;

-- 02/08/2019 13:15:51 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET Name='Es Grande', Description=NULL, Help=NULL WHERE AD_Column_ID=3003524 AND IsCentrallyMaintained='Y'
;

-- 02/08/2019 13:15:56 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Column_Trl SET Name='Es Grande',Updated=TO_TIMESTAMP('2019-08-02 13:15:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003524 AND AD_Language='es_AR'
;

-- 02/08/2019 13:16:10 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Element SET ColumnName='EsGrande', Name='Es Grande', PrintName='Es Grande',Updated=TO_TIMESTAMP('2019-08-02 13:16:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001041
;

-- 02/08/2019 13:16:10 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001041
;

-- 02/08/2019 13:16:10 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Column SET ColumnName='EsGrande', Name='Es Grande', Description=NULL, Help=NULL WHERE AD_Element_ID=3001041
;

-- 02/08/2019 13:16:10 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Process_Para SET ColumnName='EsGrande', Name='Es Grande', Description=NULL, Help=NULL, AD_Element_ID=3001041 WHERE UPPER(ColumnName)='ESGRANDE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 02/08/2019 13:16:10 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Process_Para SET ColumnName='EsGrande', Name='Es Grande', Description=NULL, Help=NULL WHERE AD_Element_ID=3001041 AND IsCentrallyMaintained='Y'
;

-- 02/08/2019 13:16:10 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET Name='Es Grande', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001041) AND IsCentrallyMaintained='Y'
;

-- 02/08/2019 13:16:10 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_PrintFormatItem SET PrintName='Es Grande', Name='Es Grande' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001041)
;

-- 02/08/2019 13:16:16 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Element_Trl SET Name='Es Grande',PrintName='Es Grande',Updated=TO_TIMESTAMP('2019-08-02 13:16:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001041 AND AD_Language='es_AR'
;

-- 02/08/2019 13:21:13 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006574,22,'Y','N','N',3003218,'N','Y',223,'N','LAR','CoeficienteUnificadoCM',100,0,TO_TIMESTAMP('2019-08-02 13:21:12','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:13 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006574 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:21:13 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006575,10,'Y','N','N',3001955,'N','Y',223,'N','LAR','Conceptos Retencion Ganancias',100,0,TO_TIMESTAMP('2019-08-02 13:21:13','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:13 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006575 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:21:13 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006576,1,'Y','N','N',3003524,'N','Y',223,'N','LAR','Es Grande',100,0,TO_TIMESTAMP('2019-08-02 13:21:13','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:13 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006576 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:21:14 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006577,20,'Y','N','N',3003502,'N','Y',223,'N','LAR','% Exención Percepciones IIBB',100,0,TO_TIMESTAMP('2019-08-02 13:21:13','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:14 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006577 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:21:14 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006578,1,'Y','N','N',3003497,'N','Y',223,'N','LAR','Exento Percepciones IIBB',100,0,TO_TIMESTAMP('2019-08-02 13:21:14','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:14 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006578 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:21:14 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006579,29,'Y','N','N',3003498,'N','Y',223,'N','LAR','Fecha Inicio Exención Perc. IIBB',100,0,TO_TIMESTAMP('2019-08-02 13:21:14','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:14 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006579 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:21:14 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006580,20,'Y','N','N',3003501,'N','Y',223,'N','LAR','Importe Exención Perc. IIBB',100,0,TO_TIMESTAMP('2019-08-02 13:21:14','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:14 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006580 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:21:14 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006581,22,'Y','N','N',3001883,'N','Y',223,'N','LAR','LAR_Exencion_Ganancias',100,0,TO_TIMESTAMP('2019-08-02 13:21:14','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:14 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006581 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:21:15 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006582,22,'Y','N','N',3001887,'N','Y',223,'N','LAR','LAR_Exencion_IIBB',100,0,TO_TIMESTAMP('2019-08-02 13:21:14','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:15 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006582 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:21:15 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006583,22,'Y','N','N',3001892,'N','Y',223,'N','LAR','LAR_Exencion_IVA',100,0,TO_TIMESTAMP('2019-08-02 13:21:15','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:15 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006583 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:21:15 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006584,22,'Y','N','N',3001991,'N','Y',223,'N','LAR','LAR_Exencion_SUSS',100,0,TO_TIMESTAMP('2019-08-02 13:21:15','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:15 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006584 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:21:15 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006585,1,'Y','N','N',3001891,'N','Y',223,'N','LAR','El Socio del Negocio está exento a recibir Retenciones de IVA','LAR_Exento_Retenciones_IVA',100,0,TO_TIMESTAMP('2019-08-02 13:21:15','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:15 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006585 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:21:16 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006586,1,'Y','N','N',3001990,'N','Y',223,'N','LAR','LAR_Exento_Retenciones_SUSS',100,0,TO_TIMESTAMP('2019-08-02 13:21:15','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:16 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006586 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:21:16 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006587,1,'Y','N','N',3001901,'N','Y',223,'N','LAR','LAR_Exento_Ret_Ganancias',100,0,TO_TIMESTAMP('2019-08-02 13:21:16','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:16 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006587 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:21:16 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006588,1,'Y','N','N',3001900,'N','Y',223,'N','LAR','LAR_Exento_Ret_IIBB',100,0,TO_TIMESTAMP('2019-08-02 13:21:16','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:16 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006588 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:21:16 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006589,22,'Y','N','N',3001884,'N','Y',223,'N','LAR','LAR_Importe_Exencion_Ganancias',100,0,TO_TIMESTAMP('2019-08-02 13:21:16','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:16 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006589 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:21:17 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006590,22,'Y','N','N',3001888,'N','Y',223,'N','LAR','LAR_Importe_Exencion_IIBB',100,0,TO_TIMESTAMP('2019-08-02 13:21:16','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:17 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006590 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:21:17 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006591,22,'Y','N','N',3001893,'N','Y',223,'N','LAR','LAR_Importe_Exencion_IVA',100,0,TO_TIMESTAMP('2019-08-02 13:21:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:17','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:17 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006591 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:21:17 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006592,22,'Y','N','N',3001992,'N','Y',223,'N','LAR','LAR_Importe_Exencion_SUSS',100,0,TO_TIMESTAMP('2019-08-02 13:21:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:17','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:17 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006592 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:21:17 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006593,29,'Y','N','N',3001996,'N','Y',223,'N','LAR','LAR_Inicio_Cert_IIBB',100,0,TO_TIMESTAMP('2019-08-02 13:21:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:17','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:17 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006593 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:21:18 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006594,29,'Y','N','N',3001994,'N','Y',223,'N','LAR','LAR_Inicio_Cert_SUSS',100,0,TO_TIMESTAMP('2019-08-02 13:21:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:17','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:18 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006594 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:21:18 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006595,30,'Y','N','N',3001885,'N','Y',223,'N','LAR','LAR_NroCertificado_Ganancias',100,0,TO_TIMESTAMP('2019-08-02 13:21:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:18 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006595 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:21:18 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006596,30,'Y','N','N',3001889,'N','Y',223,'N','LAR','LAR_NroCertificado_IIBB',100,0,TO_TIMESTAMP('2019-08-02 13:21:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:18 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006596 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:21:18 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006597,30,'Y','N','N',3001894,'N','Y',223,'N','LAR','LAR_NroCertificado_IVA',100,0,TO_TIMESTAMP('2019-08-02 13:21:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:18 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006597 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:21:18 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006598,30,'Y','N','N',3001993,'N','Y',223,'N','LAR','LAR_NroCertificado_SUSS',100,0,TO_TIMESTAMP('2019-08-02 13:21:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:18 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006598 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:21:19 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006599,1,'Y','N','N',3001877,'N','Y',223,'N','LAR','LAR_TipoGanancias',100,0,TO_TIMESTAMP('2019-08-02 13:21:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:19 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006599 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:21:19 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006600,14,'Y','N','N',3001886,'N','Y',223,'N','LAR','LAR_Vencimiento_Cert_Ganancias',100,0,TO_TIMESTAMP('2019-08-02 13:21:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:19','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:19 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006600 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:21:19 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006601,14,'Y','N','N',3001890,'N','Y',223,'N','LAR','LAR_Vencimiento_Cert_IIBB',100,0,TO_TIMESTAMP('2019-08-02 13:21:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:19','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:19 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006601 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:21:19 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006602,14,'Y','N','N',3001895,'N','Y',223,'N','LAR','LAR_Vencimiento_Cert_IVA',100,0,TO_TIMESTAMP('2019-08-02 13:21:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:19','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:19 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006602 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:21:20 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006603,29,'Y','N','N',3001995,'N','Y',223,'N','LAR','LAR_Vencimiento_Cert_SUSS',100,0,TO_TIMESTAMP('2019-08-02 13:21:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:19','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:20 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006603 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:21:20 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006604,30,'Y','N','N',3003500,'N','Y',223,'N','LAR','Nro. Certificado Exención Perc. IIBB',100,0,TO_TIMESTAMP('2019-08-02 13:21:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:20','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:20 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006604 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:21:20 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006605,29,'Y','N','N',3003499,'N','Y',223,'N','LAR','Vencimiento Cert. Exención Perc. IIBB',100,0,TO_TIMESTAMP('2019-08-02 13:21:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-08-02 13:21:20','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2019 13:21:20 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006605 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006577
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006574
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006575
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006578
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006579
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006580
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006581
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006582
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006583
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006584
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006587
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006588
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006585
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006586
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006589
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006590
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006591
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006592
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006593
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006594
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006595
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006596
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006597
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006598
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006599
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006600
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006601
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006602
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006603
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006604
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006605
;

-- 02/08/2019 13:24:06 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3006576
;

-- 02/08/2019 13:26:07 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2019-08-02 13:26:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006576
;

-- 02/08/2019 13:26:23 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET DisplayLogic='@IsCustomer@=''Y''',Updated=TO_TIMESTAMP('2019-08-02 13:26:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006576
;

-- 02/08/2019 13:26:36 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_Field SET DisplayLogic='@IsCustomer@=''Y''',Updated=TO_TIMESTAMP('2019-08-02 13:26:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005535
;

-- 02/08/2019 14:43:53 ART
-- ISSUE #77: Grandes clientes.
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,AD_Client_ID,AD_Org_ID,Created,Updated,CreatedBy,UpdatedBy,IsActive) VALUES (3000047,'LAR','C','0','Ingresar el monto minimo, para facturas de tipo MiPyme.','LAR_MinimoFacturaMiPyme',1000000,0,TO_TIMESTAMP('2019-08-02 14:43:53','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2019-08-02 14:43:53','YYYY-MM-DD HH24:MI:SS'),100,100,'Y')
;

-- 02/08/2019 14:44:10 ART
-- ISSUE #77: Grandes clientes.
UPDATE AD_SysConfig SET Value='2000000',Updated=TO_TIMESTAMP('2019-08-02 14:44:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_SysConfig_ID=3000047
;

-- 10/09/2019 15:45:21 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001044,'fechapago','LAR','fechapago','fechapago',0,TO_TIMESTAMP('2019-09-10 15:45:20','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2019-09-10 15:45:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 10/09/2019 15:45:21 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001044 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 10/09/2019 15:45:21 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003527,318,'LAR',0,'Y','N','N','N',29,'N',16,'N',3001044,'N','Y','N','fechapago','fechapago',TO_TIMESTAMP('2019-09-10 15:45:20','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2019-09-10 15:45:20','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/09/2019 15:45:21 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003527 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 10/09/2019 15:46:13 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Column SET Name='Fecha de Pago', ColumnName='FechaPago',Updated=TO_TIMESTAMP('2019-09-10 15:46:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003527
;

-- 10/09/2019 15:46:13 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003527
;

-- 10/09/2019 15:46:13 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET Name='Fecha de Pago', Description=NULL, Help=NULL WHERE AD_Column_ID=3003527 AND IsCentrallyMaintained='Y'
;

-- 10/09/2019 15:46:18 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Column_Trl SET Name='Fecha de Pago',Updated=TO_TIMESTAMP('2019-09-10 15:46:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003527 AND AD_Language='es_AR'
;

-- 10/09/2019 15:46:35 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Element SET ColumnName='FechaPago', Name='Fecha de Pago', PrintName='Fecha de Pago',Updated=TO_TIMESTAMP('2019-09-10 15:46:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001044
;

-- 10/09/2019 15:46:35 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001044
;

-- 10/09/2019 15:46:35 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Column SET ColumnName='FechaPago', Name='Fecha de Pago', Description=NULL, Help=NULL WHERE AD_Element_ID=3001044
;

-- 10/09/2019 15:46:35 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Process_Para SET ColumnName='FechaPago', Name='Fecha de Pago', Description=NULL, Help=NULL, AD_Element_ID=3001044 WHERE UPPER(ColumnName)='FECHAPAGO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 10/09/2019 15:46:35 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Process_Para SET ColumnName='FechaPago', Name='Fecha de Pago', Description=NULL, Help=NULL WHERE AD_Element_ID=3001044 AND IsCentrallyMaintained='Y'
;

-- 10/09/2019 15:46:35 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET Name='Fecha de Pago', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001044) AND IsCentrallyMaintained='Y'
;

-- 10/09/2019 15:46:35 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_PrintFormatItem SET PrintName='Fecha de Pago', Name='Fecha de Pago' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001044)
;

-- 10/09/2019 15:46:40 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Element_Trl SET Name='Fecha de Pago',PrintName='Fecha de Pago',Updated=TO_TIMESTAMP('2019-09-10 15:46:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001044 AND AD_Language='es_AR'
;

-- 10/09/2019 15:49:42 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,Created,AD_Org_ID,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006608,29,'Y','N','N',3003527,'N','Y',263,'N','LAR','Fecha de Pago',100,TO_TIMESTAMP('2019-09-10 15:49:42','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,100,TO_TIMESTAMP('2019-09-10 15:49:42','YYYY-MM-DD HH24:MI:SS'))
;

-- 10/09/2019 15:49:42 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006608 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3006608
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000603
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=2961
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=2765
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=2770
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=8648
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3005560
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=2763
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=2953
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3273
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=2956
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3112
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=2774
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=2764
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=2768
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3001994
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=6935
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=2775
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=7794
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3005743
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=7795
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=2786
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3006572
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=1000017
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=2778
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=2780
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=1000016
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=2771
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=6564
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=2777
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=8657
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3663
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=10485
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=13700
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3899
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000025
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000026
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=60970
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000605
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=53257
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000027
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=53258
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000028
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3002136
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=200050
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3002142
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3002138
;

-- 10/09/2019 15:57:10 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3274
;

-- 10/09/2019 15:57:16 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2019-09-10 15:57:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2761
;

-- 10/09/2019 16:02:12 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET DisplayLogic='@DocSubTypeCAE@ = 201 | @DocSubTypeCAE@ = 206 | @DocSubTypeCAE@ = 211',Updated=TO_TIMESTAMP('2019-09-10 16:02:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006608
;

-- 10/09/2019 16:04:46 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2019-09-10 16:04:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006608
;

-- 10/09/2019 16:07:36 ART
-- ISSUE #77: Campo Fecha de Pago, en facturas.
UPDATE AD_Column SET DefaultValue='@#Date@', AD_Reference_ID=15,Updated=TO_TIMESTAMP('2019-09-10 16:07:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003527
;

-- Registración de script
SELECT register_migration_script_lar('0135_ISSUE-77.sql', 'LAR', '')
;
