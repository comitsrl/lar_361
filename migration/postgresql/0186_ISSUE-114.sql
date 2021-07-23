-- 22/07/2021 20:52:14 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007257,20,'Y','N','N',3003502,'N','Y',224,'N','LAR','% Exención Percepciones IIBB',100,0,TO_TIMESTAMP('2021-07-22 20:52:12','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-07-22 20:52:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/07/2021 20:52:14 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007257 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/07/2021 20:52:18 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007258,22,'Y','N','N',3003218,'N','Y',224,'N','LAR','CoeficienteUnificadoCM',100,0,TO_TIMESTAMP('2021-07-22 20:52:14','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-07-22 20:52:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/07/2021 20:52:18 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007258 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/07/2021 20:52:18 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007259,10,'Y','N','N',3003925,'N','Y',224,'N','Indicates the Currency to be used when processing or reporting on this record','LAR','The Currency for this record','Currency',100,0,TO_TIMESTAMP('2021-07-22 20:52:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-07-22 20:52:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/07/2021 20:52:18 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007259 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/07/2021 20:52:18 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007260,10,'Y','N','N',3002966,'N','Y',224,'N','The Currency Conversion Rate Type lets you define different type of rates, e.g. Spot, Corporate and/or Sell/Buy rates.','LAR','Currency Conversion Rate Type','Currency Type',100,0,TO_TIMESTAMP('2021-07-22 20:52:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-07-22 20:52:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/07/2021 20:52:18 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007260 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/07/2021 20:52:18 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007261,10,'Y','N','N',3003528,'N','Y',224,'N','LAR','Días de Pago FCE',100,0,TO_TIMESTAMP('2021-07-22 20:52:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-07-22 20:52:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/07/2021 20:52:18 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007261 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/07/2021 20:52:20 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007262,100,'Y','N','N',3000895,'N','Y',224,'N','The Email Address is the Electronic Mail ID for this User and should be fully qualified (e.g. joe.smith@company.com). The Email Address is used to access the self service application functionality from the web.','LAR','Electronic Mail Address','EMail Address',100,0,TO_TIMESTAMP('2021-07-22 20:52:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-07-22 20:52:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/07/2021 20:52:20 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007262 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/07/2021 20:52:20 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007263,1,'Y','N','N',3003524,'N','Y',224,'N','LAR','Es Grande',100,0,TO_TIMESTAMP('2021-07-22 20:52:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-07-22 20:52:20','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/07/2021 20:52:20 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007263 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/07/2021 20:52:20 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007264,1,'Y','N','N',3003497,'N','Y',224,'N','LAR','Exento Percepciones IIBB',100,0,TO_TIMESTAMP('2021-07-22 20:52:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-07-22 20:52:20','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/07/2021 20:52:20 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007264 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/07/2021 20:52:20 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007265,29,'Y','N','N',3003498,'N','Y',224,'N','LAR','Fecha Inicio Exención Perc. IIBB',100,0,TO_TIMESTAMP('2021-07-22 20:52:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-07-22 20:52:20','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/07/2021 20:52:20 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007265 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/07/2021 20:52:21 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007266,20,'Y','N','N',3003501,'N','Y',224,'N','LAR','Importe Exención Perc. IIBB',100,0,TO_TIMESTAMP('2021-07-22 20:52:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-07-22 20:52:20','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/07/2021 20:52:21 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007266 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/07/2021 20:52:21 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007267,30,'Y','N','N',3003500,'N','Y',224,'N','LAR','Nro. Certificado Exención Perc. IIBB',100,0,TO_TIMESTAMP('2021-07-22 20:52:21','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-07-22 20:52:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/07/2021 20:52:21 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007267 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/07/2021 20:52:21 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007268,3,'Y','N','N',3003688,'N','Y',224,'N','LAR','OpcionTransferenciaFCE',100,0,TO_TIMESTAMP('2021-07-22 20:52:21','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-07-22 20:52:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/07/2021 20:52:21 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007268 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/07/2021 20:52:21 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007269,10,'Y','N','N',3001796,'N','Y',224,'N','LAR','PlazoPago',100,0,TO_TIMESTAMP('2021-07-22 20:52:21','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-07-22 20:52:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/07/2021 20:52:21 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007269 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/07/2021 20:52:22 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007270,29,'Y','N','N',3003499,'N','Y',224,'N','LAR','Vencimiento Cert. Exención Perc. IIBB',100,0,TO_TIMESTAMP('2021-07-22 20:52:21','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-07-22 20:52:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/07/2021 20:52:22 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007270 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/07/2021 20:54:22 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007257
;

-- 22/07/2021 20:54:22 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007258
;

-- 22/07/2021 20:54:22 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007261
;

-- 22/07/2021 20:54:22 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007262
;

-- 22/07/2021 20:54:22 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007263
;

-- 22/07/2021 20:54:22 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007264
;

-- 22/07/2021 20:54:22 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007265
;

-- 22/07/2021 20:54:22 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007266
;

-- 22/07/2021 20:54:22 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007267
;

-- 22/07/2021 20:54:22 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007268
;

-- 22/07/2021 20:54:22 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007269
;

-- 22/07/2021 20:54:22 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007270
;

-- 22/07/2021 20:54:22 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3007259
;

-- 22/07/2021 20:54:22 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3007260
;

-- 22/07/2021 20:56:11 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2021-07-22 20:56:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007260
;

-- 22/07/2021 20:57:14 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3007259
;

-- 22/07/2021 20:57:14 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3007260
;

-- 22/07/2021 20:57:14 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3003136
;

-- 22/07/2021 20:57:14 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3003156
;

-- 22/07/2021 20:57:14 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3003128
;

-- 22/07/2021 20:57:14 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3003124
;

-- 22/07/2021 20:57:14 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3003130
;

-- 22/07/2021 20:57:14 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3003137
;

-- 22/07/2021 20:57:14 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3003133
;

-- 22/07/2021 20:57:14 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3003127
;

-- 22/07/2021 20:57:14 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3003126
;

-- 22/07/2021 20:57:14 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3003132
;

-- 22/07/2021 20:57:14 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3003139
;

-- 22/07/2021 20:57:14 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3003135
;

-- 22/07/2021 20:57:14 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3003129
;

-- 22/07/2021 20:57:14 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3003125
;

-- 22/07/2021 20:57:14 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3003131
;

-- 22/07/2021 20:57:14 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3003155
;

-- 22/07/2021 20:57:14 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3003138
;

-- 22/07/2021 20:57:14 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3003134
;

-- 22/07/2021 20:57:14 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3003150
;

-- 22/07/2021 20:57:14 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3003149
;

-- 22/07/2021 20:57:14 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3003151
;

-- 22/07/2021 20:57:14 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3003152
;

-- 22/07/2021 20:57:14 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3003154
;

-- 22/07/2021 20:57:14 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3003153
;

-- 22/07/2021 20:58:48 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3007259
;

-- 22/07/2021 20:58:48 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3007260
;

-- 22/07/2021 20:58:48 ART
-- ISSUE #114: Moneda y Tipo de Cambio para proveedores.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=58570
;

-- Registración de script
SELECT register_migration_script_lar('0186_ISSUE-114.sql', 'LAR', '')
;
