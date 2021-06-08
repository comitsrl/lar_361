ALTER TABLE C_BPartner ADD COLUMN C_Currency_ID numeric(10,0);
ALTER TABLE C_BPartner ADD CONSTRAINT ccurrency_cbpartner FOREIGN KEY (C_Currency_ID)
      REFERENCES C_Currency (C_Currency_ID) MATCH SIMPLE;

-- 02/06/2021 21:36:38 ART
-- ISSUE #114: Configuración de Moneda en SdN.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003925,291,'LAR',0,'N','N','N','Indicates the Currency to be used when processing or reporting on this record','N',10,'N',19,'N',193,'N','Y','N','The Currency for this record','Currency','C_Currency_ID',100,TO_TIMESTAMP('2021-06-02 21:36:38','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2021-06-02 21:36:38','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/06/2021 21:36:38 ART
-- ISSUE #114: Configuración de Moneda en SdN.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003925 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/06/2021 21:38:51 ART
-- ISSUE #114: Configuración de Moneda en SdN.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007053,10,'Y','N','N',3003925,'N','Y',223,'N','Indicates the Currency to be used when processing or reporting on this record','LAR','The Currency for this record','Currency',100,0,TO_TIMESTAMP('2021-06-02 21:38:51','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-06-02 21:38:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/06/2021 21:38:51 ART
-- ISSUE #114: Configuración de Moneda en SdN.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007053 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/06/2021 21:39:12 ART
-- ISSUE #114: Configuración de Moneda en SdN.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3007053
;

-- 02/06/2021 21:39:12 ART
-- ISSUE #114: Configuración de Moneda en SdN.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3005535
;

-- 02/06/2021 21:39:12 ART
-- ISSUE #114: Configuración de Moneda en SdN.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3114
;

-- 02/06/2021 21:39:12 ART
-- ISSUE #114: Configuración de Moneda en SdN.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=2408
;

-- 02/06/2021 21:39:12 ART
-- ISSUE #114: Configuración de Moneda en SdN.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3524
;

-- 02/06/2021 21:39:12 ART
-- ISSUE #114: Configuración de Moneda en SdN.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=2434
;

-- 02/06/2021 21:39:12 ART
-- ISSUE #114: Configuración de Moneda en SdN.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3229
;

-- 02/06/2021 21:39:12 ART
-- ISSUE #114: Configuración de Moneda en SdN.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3276
;

-- 02/06/2021 21:39:12 ART
-- ISSUE #114: Configuración de Moneda en SdN.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3275
;

-- 02/06/2021 21:39:12 ART
-- ISSUE #114: Configuración de Moneda en SdN.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=7362
;

-- 02/06/2021 21:39:12 ART
-- ISSUE #114: Configuración de Moneda en SdN.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=8373
;

-- 02/06/2021 21:39:12 ART
-- ISSUE #114: Configuración de Moneda en SdN.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=2427
;

-- 02/06/2021 21:39:12 ART
-- ISSUE #114: Configuración de Moneda en SdN.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=2428
;

-- 02/06/2021 21:39:12 ART
-- ISSUE #114: Configuración de Moneda en SdN.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3002709
;

-- 02/06/2021 21:39:12 ART
-- ISSUE #114: Configuración de Moneda en SdN.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3006610
;

-- 02/06/2021 21:39:12 ART
-- ISSUE #114: Configuración de Moneda en SdN.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3006997
;

-- 02/06/2021 21:39:12 ART
-- ISSUE #114: Configuración de Moneda en SdN.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3006576
;

-- 02/06/2021 21:39:32 ART
-- ISSUE #114: Configuración de Moneda en SdN.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2021-06-02 21:39:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005535
;

-- Registración de script
SELECT register_migration_script_lar('0176_ISSUE-114.sql', 'LAR', '')
;
