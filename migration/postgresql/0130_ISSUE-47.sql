-- Columna moneda, en tabla producto.
ALTER TABLE M_Product ADD COLUMN C_Currency_ID numeric(10,0);
ALTER TABLE M_Product ADD CONSTRAINT ccurrency_mproduct FOREIGN KEY (C_Currency_ID)
      REFERENCES C_Currency (C_Currency_ID) MATCH SIMPLE;

-- Columna lista madre, en tabla M_PriceList.
ALTER TABLE M_PriceList ADD COLUMN EsListaMadre character(1) NOT NULL DEFAULT 'N'::bpchar;
ALTER TABLE M_PriceList ADD CONSTRAINT m_pricelist_eslistamadre_check CHECK (EsListaMadre = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]));

-- Columna esquema de descuento, en tabla M_PriceList
ALTER TABLE M_PriceList ADD COLUMN M_DiscountSchema_ID numeric(10,0);
ALTER TABLE M_PriceList ADD CONSTRAINT mdiscountschema_mpricelist FOREIGN KEY (M_DiscountSchema_ID)
      REFERENCES M_DiscountSchema (M_DiscountSchema_ID) MATCH SIMPLE;

-- Botón Actualización Masiva de Listas en Precios, en Lista de Precios.
ALTER TABLE M_PriceList ADD COLUMN CrearVersiones character(1);

-- Columna Orden de Actualización en Lista de Precios.
ALTER TABLE M_PriceList ADD COLUMN OrdenActualizacion numeric(10,0);

-- Botón Actualización Masiva de Listas en Precios, en Tasa de Cambio.
ALTER TABLE C_Conversion_Rate ADD COLUMN CrearVersiones character(1);

-- 30/05/2019 17:13:58 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003474,208,'LAR',0,'N','N','N','Indicates the Currency to be used when processing or reporting on this record','N',10,'N',19,'N',193,'N','Y','N','The Currency for this record','Currency','C_Currency_ID',100,TO_TIMESTAMP('2019-05-30 17:13:57','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2019-05-30 17:13:57','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/05/2019 17:13:58 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003474 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 30/05/2019 17:15:12 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006514,10,'Y','N','N',3003474,'N','Y',180,'N','Indicates the Currency to be used when processing or reporting on this record','LAR','The Currency for this record','Currency',100,0,TO_TIMESTAMP('2019-05-30 17:15:12','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-05-30 17:15:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/05/2019 17:15:12 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006514 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3006514
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3079
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=1025
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=2587
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=5888
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=6129
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=1032
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=1031
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=6841
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=10411
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=1026
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=200294
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=200295
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=200296
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=200297
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=7646
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=1319
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=1320
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=1321
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=1322
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3743
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3746
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3747
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3744
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3745
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=1027
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=1028
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=1568
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=1569
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=5381
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=5383
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=9286
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=12418
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=5910
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=5911
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=6130
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=8307
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=1000013
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=6343
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=6344
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=8608
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=8613
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=52015
;

-- 30/05/2019 17:17:41 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=52016
;

-- 30/05/2019 17:18:21 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2019-05-30 17:18:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006514
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006514
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3079
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=1025
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=2587
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=5888
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=6129
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=1032
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=1031
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=6841
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=10411
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=1026
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=200294
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=200295
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=200296
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=200297
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=7646
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=1319
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=1320
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=1321
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=1322
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3743
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3746
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3747
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3744
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3745
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=1027
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=1028
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=1568
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=1569
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=5381
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=5383
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=9286
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=12418
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=5910
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=5911
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=6130
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=8307
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=1000013
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=6343
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=6344
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=8608
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=8613
;

-- 30/05/2019 17:19:55 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=52015
;

-- 30/05/2019 17:19:56 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=52016
;

-- 30/05/2019 17:20:50 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001018,'eslistamadre','LAR','eslistamadre','eslistamadre',0,TO_TIMESTAMP('2019-05-30 17:20:49','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2019-05-30 17:20:49','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 30/05/2019 17:20:50 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001018 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 30/05/2019 17:20:50 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003475,255,'LAR',0,'Y','N','N','N',1,'N',20,'N',3001018,'N','Y','N','eslistamadre','eslistamadre',100,TO_TIMESTAMP('2019-05-30 17:20:49','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2019-05-30 17:20:49','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/05/2019 17:20:50 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003475 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 30/05/2019 17:20:50 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003476,255,'LAR',0,'N','N','N','After calculation of the (standard) price, the trade discount percentage is calculated and applied resulting in the final price.','N',10,'N',19,'N',1714,'N','Y','N','Schema to calculate the trade discount percentage','Discount Schema','M_DiscountSchema_ID',100,TO_TIMESTAMP('2019-05-30 17:20:50','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2019-05-30 17:20:50','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/05/2019 17:20:50 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003476 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 30/05/2019 17:20:50 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001019,'crearversiones','LAR','crearversiones','crearversiones',0,TO_TIMESTAMP('2019-05-30 17:20:50','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2019-05-30 17:20:50','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 30/05/2019 17:20:50 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001019 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 30/05/2019 17:20:51 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003477,255,'LAR',0,'N','N','N','N',1,'N',20,'N',3001019,'N','Y','N','crearversiones','crearversiones',100,TO_TIMESTAMP('2019-05-30 17:20:50','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2019-05-30 17:20:50','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/05/2019 17:20:51 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003477 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 30/05/2019 17:22:24 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Column SET Name='CrearVersiones', ColumnName='CrearVersiones',Updated=TO_TIMESTAMP('2019-05-30 17:22:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003477
;

-- 30/05/2019 17:22:24 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003477
;

-- 30/05/2019 17:22:24 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET Name='CrearVersiones', Description=NULL, Help=NULL WHERE AD_Column_ID=3003477 AND IsCentrallyMaintained='Y'
;

-- 30/05/2019 17:23:07 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Element SET ColumnName='CrearVersiones', Name='Crear Versiones', PrintName='Crear Versiones de Lista de Precios',Updated=TO_TIMESTAMP('2019-05-30 17:23:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001019
;

-- 30/05/2019 17:23:07 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001019
;

-- 30/05/2019 17:23:07 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Column SET ColumnName='CrearVersiones', Name='Crear Versiones', Description=NULL, Help=NULL WHERE AD_Element_ID=3001019
;

-- 30/05/2019 17:23:07 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Process_Para SET ColumnName='CrearVersiones', Name='Crear Versiones', Description=NULL, Help=NULL, AD_Element_ID=3001019 WHERE UPPER(ColumnName)='CREARVERSIONES' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 30/05/2019 17:23:07 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Process_Para SET ColumnName='CrearVersiones', Name='Crear Versiones', Description=NULL, Help=NULL WHERE AD_Element_ID=3001019 AND IsCentrallyMaintained='Y'
;

-- 30/05/2019 17:23:07 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET Name='Crear Versiones', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001019) AND IsCentrallyMaintained='Y'
;

-- 30/05/2019 17:23:07 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_PrintFormatItem SET PrintName='Crear Versiones de Lista de Precios', Name='Crear Versiones' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001019)
;

-- 30/05/2019 17:23:13 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Element_Trl SET Name='Crear Versiones de Lista de Precios',PrintName='Crear Versiones de Lista de Precios',Updated=TO_TIMESTAMP('2019-05-30 17:23:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001019 AND AD_Language='es_AR'
;

-- 30/05/2019 17:23:24 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Column_Trl SET Name='Crear Versiones de Lista de Precios',Updated=TO_TIMESTAMP('2019-05-30 17:23:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003477 AND AD_Language='es_AR'
;

-- 30/05/2019 17:24:07 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Column SET AD_Reference_ID=28,Updated=TO_TIMESTAMP('2019-05-30 17:24:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003477
;

-- 30/05/2019 17:27:13 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Column SET Name='Es Lista Madre', ColumnName='EsListaMadre',Updated=TO_TIMESTAMP('2019-05-30 17:27:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003475
;

-- 30/05/2019 17:27:13 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003475
;

-- 30/05/2019 17:27:13 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET Name='Es Lista Madre', Description=NULL, Help=NULL WHERE AD_Column_ID=3003475 AND IsCentrallyMaintained='Y'
;

-- 30/05/2019 17:27:21 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Column_Trl SET Name='Es Lista Madre',Updated=TO_TIMESTAMP('2019-05-30 17:27:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003475 AND AD_Language='es_AR'
;

-- 30/05/2019 17:27:40 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Element SET ColumnName='EsListaMadre', Name='Es Lista Madre', PrintName='Es Lista Madre',Updated=TO_TIMESTAMP('2019-05-30 17:27:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001018
;

-- 30/05/2019 17:27:40 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001018
;

-- 30/05/2019 17:27:40 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Column SET ColumnName='EsListaMadre', Name='Es Lista Madre', Description=NULL, Help=NULL WHERE AD_Element_ID=3001018
;

-- 30/05/2019 17:27:40 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Process_Para SET ColumnName='EsListaMadre', Name='Es Lista Madre', Description=NULL, Help=NULL, AD_Element_ID=3001018 WHERE UPPER(ColumnName)='ESLISTAMADRE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 30/05/2019 17:27:40 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Process_Para SET ColumnName='EsListaMadre', Name='Es Lista Madre', Description=NULL, Help=NULL WHERE AD_Element_ID=3001018 AND IsCentrallyMaintained='Y'
;

-- 30/05/2019 17:27:40 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET Name='Es Lista Madre', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001018) AND IsCentrallyMaintained='Y'
;

-- 30/05/2019 17:27:40 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_PrintFormatItem SET PrintName='Es Lista Madre', Name='Es Lista Madre' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001018)
;

-- 30/05/2019 17:27:48 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Element_Trl SET Name='Es Lista Madre',PrintName='Es Lista Madre',Updated=TO_TIMESTAMP('2019-05-30 17:27:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001018 AND AD_Language='es_AR'
;

-- 30/05/2019 17:29:34 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006515,1,'Y','N','N',3003477,'N','Y',191,'N','LAR','Crear Versiones',100,0,TO_TIMESTAMP('2019-05-30 17:29:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-05-30 17:29:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/05/2019 17:29:34 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006515 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/05/2019 17:29:34 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006516,10,'Y','N','N',3003476,'N','Y',191,'N','After calculation of the (standard) price, the trade discount percentage is calculated and applied resulting in the final price.','LAR','Schema to calculate the trade discount percentage','Discount Schema',100,0,TO_TIMESTAMP('2019-05-30 17:29:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-05-30 17:29:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/05/2019 17:29:34 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006516 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/05/2019 17:29:34 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006517,1,'Y','N','N',3003475,'N','Y',191,'N','LAR','Es Lista Madre',100,0,TO_TIMESTAMP('2019-05-30 17:29:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-05-30 17:29:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 30/05/2019 17:29:34 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006517 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 30/05/2019 17:35:42 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006515
;

-- 30/05/2019 17:35:42 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006516
;

-- 30/05/2019 17:35:42 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006517
;

-- 30/05/2019 17:35:42 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3316
;

-- 30/05/2019 17:35:42 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3006518
;

-- 30/05/2019 17:35:42 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3006519
;

-- 31/05/2019 15:29:07 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET DisplayLogic='@EsListaMadre@=''Y''',Updated=TO_TIMESTAMP('2019-05-31 15:29:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006515
;

-- 31/05/2019 15:46:23 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003478,140,'LAR',0,'N','N','N','N',1,'N',20,'N',3001019,'N','Y','N','Crear Versiones','CrearVersiones',100,TO_TIMESTAMP('2019-05-31 15:46:22','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2019-05-31 15:46:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/05/2019 15:46:23 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003478 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/05/2019 15:49:31 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006520,1,'Y','N','N',3003478,'N','Y',198,'N','LAR','Crear Versiones',100,0,TO_TIMESTAMP('2019-05-31 15:49:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-05-31 15:49:31','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/05/2019 15:49:31 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006520 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/05/2019 15:50:03 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET DisplayLogic='@IsDefault@=''Y''',Updated=TO_TIMESTAMP('2019-05-31 15:50:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006520
;

-- 31/05/2019 15:59:07 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET DisplayLogic='(SELECT C_ConversionType.IsDefault FROM C_ConversionType WHERE C_ConversionType.C_ConversionType_ID = @C_ConversionType_ID@) = ''Y''',Updated=TO_TIMESTAMP('2019-05-31 15:59:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006520
;

-- 31/05/2019 16:02:01 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET DisplayLogic='(SELECT ct.IsDefault FROM C_ConversionType ct WHERE ct.C_ConversionType_ID = @C_ConversionType_ID@) = ''Y''',Updated=TO_TIMESTAMP('2019-05-31 16:02:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006520
;

-- 31/05/2019 16:03:00 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET DisplayLogic=NULL,Updated=TO_TIMESTAMP('2019-05-31 16:03:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006520
;

-- 31/05/2019 16:03:22 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=1335
;

-- 31/05/2019 16:03:22 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=1336
;

-- 31/05/2019 16:03:22 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=2395
;

-- 31/05/2019 16:03:22 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=1342
;

-- 31/05/2019 16:03:22 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=1343
;

-- 31/05/2019 16:03:22 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=1337
;

-- 31/05/2019 16:03:22 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=8633
;

-- 31/05/2019 16:03:22 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=1338
;

-- 31/05/2019 16:03:22 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=1339
;

-- 31/05/2019 16:03:22 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=1340
;

-- 31/05/2019 16:03:22 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=1341
;

-- 31/05/2019 16:03:22 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3006520
;

-- 31/05/2019 16:04:43 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Column SET AD_Reference_ID=28,Updated=TO_TIMESTAMP('2019-05-31 16:04:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003478
;

-- 31/05/2019 16:07:49 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Process (AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,CopyFromProcess,Value,Name,AD_Org_ID,AD_Client_ID,UpdatedBy,Created,CreatedBy,Updated,IsActive) VALUES (3000359,'N','N','3','N','N','Y','LAR',0,0,'N','4000000','Generar Versiones de Lista de Precios',0,0,100,TO_TIMESTAMP('2019-05-31 16:07:49','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2019-05-31 16:07:49','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 31/05/2019 16:07:49 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000359 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 31/05/2019 16:18:10 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Process SET Classname='ar.com.ergio.process.LAR_GenerarVersionesListasPrecios',Updated=TO_TIMESTAMP('2019-05-31 16:18:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000359
;

-- 31/05/2019 16:40:56 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Column SET AD_Process_ID=3000359,Updated=TO_TIMESTAMP('2019-05-31 16:40:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003477
;

-- 31/05/2019 16:42:19 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,DefaultValue,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000566,0,3000359,100,'N',13,10,'N','@M_PriceList_ID@','LAR','M_PriceList_ID','M_PriceList_ID','Y',0,100,TO_TIMESTAMP('2019-05-31 16:42:19','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2019-05-31 16:42:19','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 31/05/2019 16:42:19 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000566 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 04/06/2019 16:19:42 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Column SET AD_Reference_Value_ID=53343, AD_Reference_ID=18,Updated=TO_TIMESTAMP('2019-06-04 16:19:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003476
;

-- 04/06/2019 16:56:29 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
DELETE FROM AD_Process_Para_Trl WHERE AD_Process_Para_ID=3000566
;

-- 04/06/2019 16:56:30 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
DELETE FROM AD_Process_Para WHERE AD_Process_Para_ID=3000566
;

-- 04/06/2019 16:59:03 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Process SET Help='Al iniciar el proceso, se actualizara la lista de precios BASE, con todos los precios en moneda local. A continuación, se actualizaran todas las demas listas, partiendo siempre desde la lista de precios base configurada en cada una.',Updated=TO_TIMESTAMP('2019-06-04 16:59:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000359
;

-- 04/06/2019 16:59:03 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Process_Trl SET IsTranslated='N' WHERE AD_Process_ID=3000359
;

-- 04/06/2019 17:00:47 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Process SET Description='Al iniciar el proceso, se actualizara la lista de precios BASE, con todos los precios en moneda local. A continuación, se actualizaran todas las demas listas, partiendo siempre desde la lista de precios base configurada en cada una.',Updated=TO_TIMESTAMP('2019-06-04 17:00:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000359
;

-- 04/06/2019 17:00:47 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Process_Trl SET IsTranslated='N' WHERE AD_Process_ID=3000359
;

-- 04/06/2019 18:21:20 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Process SET Help='Al iniciar el proceso, se actualizara la lista de precios BASE, con todos los precios en moneda local. A continuación, se actualizaran todas las demas listas, partiendo siempre desde la lista de precios base configurada en cada una.', Description='Generación Masiva de Versiones de Lista de Precios.',Updated=TO_TIMESTAMP('2019-06-04 18:21:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000359
;

-- 04/06/2019 18:21:20 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Process_Trl SET IsTranslated='N' WHERE AD_Process_ID=3000359
;

-- 04/06/2019 18:21:29 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Process_Trl SET Description='Generación Masiva de Versiones de Lista de Precios.',Help='Al iniciar el proceso, se actualizara la lista de precios BASE, con todos los precios en moneda local. A continuación, se actualizaran todas las demas listas, partiendo siempre desde la lista de precios base configurada en cada una.',Updated=TO_TIMESTAMP('2019-06-04 18:21:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000359 AND AD_Language='es_AR'
;

-- 05/06/2019 17:30:08 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001024,'ordenactualizacion','LAR','ordenactualizacion','ordenactualizacion',0,TO_TIMESTAMP('2019-06-05 17:30:07','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2019-06-05 17:30:07','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 05/06/2019 17:30:08 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001024 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 05/06/2019 17:30:08 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003495,255,'LAR',0,'N','N','N','N',10,'N',11,'N',3001024,'N','Y','N','ordenactualizacion','ordenactualizacion',100,TO_TIMESTAMP('2019-06-05 17:30:07','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2019-06-05 17:30:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/06/2019 17:30:08 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003495 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 05/06/2019 17:30:44 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Column SET Name='Orden de Actualización', ColumnName='OrdenActualizacion',Updated=TO_TIMESTAMP('2019-06-05 17:30:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003495
;

-- 05/06/2019 17:30:44 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003495
;

-- 05/06/2019 17:30:44 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET Name='Orden de Actualización', Description=NULL, Help=NULL WHERE AD_Column_ID=3003495 AND IsCentrallyMaintained='Y'
;

-- 05/06/2019 17:30:50 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Column_Trl SET Name='Orden de Actualización',Updated=TO_TIMESTAMP('2019-06-05 17:30:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003495 AND AD_Language='es_AR'
;

-- 05/06/2019 17:31:06 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Element SET ColumnName='OrdenActualizacion', Name='Orden de Actualización', PrintName='Orden de Actualización',Updated=TO_TIMESTAMP('2019-06-05 17:31:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001024
;

-- 05/06/2019 17:31:06 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001024
;

-- 05/06/2019 17:31:06 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Column SET ColumnName='OrdenActualizacion', Name='Orden de Actualización', Description=NULL, Help=NULL WHERE AD_Element_ID=3001024
;

-- 05/06/2019 17:31:07 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Process_Para SET ColumnName='OrdenActualizacion', Name='Orden de Actualización', Description=NULL, Help=NULL, AD_Element_ID=3001024 WHERE UPPER(ColumnName)='ORDENACTUALIZACION' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 05/06/2019 17:31:07 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Process_Para SET ColumnName='OrdenActualizacion', Name='Orden de Actualización', Description=NULL, Help=NULL WHERE AD_Element_ID=3001024 AND IsCentrallyMaintained='Y'
;

-- 05/06/2019 17:31:07 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET Name='Orden de Actualización', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001024) AND IsCentrallyMaintained='Y'
;

-- 05/06/2019 17:31:07 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_PrintFormatItem SET PrintName='Orden de Actualización', Name='Orden de Actualización' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001024)
;

-- 05/06/2019 17:31:13 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Element_Trl SET Name='Orden de Actualización',PrintName='Orden de Actualización',Updated=TO_TIMESTAMP('2019-06-05 17:31:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001024 AND AD_Language='es_AR'
;

-- 05/06/2019 17:32:20 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006523,10,'Y','N','N',3003495,'N','Y',191,'N','LAR','Orden de Actualización',100,0,TO_TIMESTAMP('2019-06-05 17:32:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-06-05 17:32:20','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/06/2019 17:32:20 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006523 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/06/2019 17:37:53 ART
-- ISSUE #47: Generación Automática de Listas de Precios.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006523
;

-- Registración de script
SELECT register_migration_script_lar('0130_ISSUE-47.sql', 'LAR', '')
;
