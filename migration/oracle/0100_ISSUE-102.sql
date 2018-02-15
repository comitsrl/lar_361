-- REVER Tipos para Oracle
ALTER TABLE M_ProductPrice
ADD COLUMN M_Product_Category_ID numeric (10,0);

/*
select count(*)
FROM M_ProductPrice AS pp
WHERE pp.AD_Client_ID = 1000000;
*/

UPDATE M_ProductPrice AS pp
SET M_Product_Category_ID = 
(
SELECT M_Product_Category_ID
FROM M_Product
WHERE M_Product_ID = pp.M_Product_ID
)
WHERE pp.AD_Client_ID = 1000000;

-- 15/02/2018 20:23:37 ART
-- ISSUE #102: Precios: Permitir filtrar por Productos Activos y Categoría de Producto
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3002792,251,'LAR',0,'N','N','N','Identifies the category which this product belongs to.  Product categories are used for pricing and selection.','N',10,'N',19,'N',453,'N','Y','N','Category of a Product','Product Category','M_Product_Category_ID',100,TO_DATE('2018-02-15 20:23:37','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2018-02-15 20:23:37','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/02/2018 20:23:37 ART
-- ISSUE #102: Precios: Permitir filtrar por Productos Activos y Categoría de Producto
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3002792 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 15/02/2018 20:24:03 ART
-- ISSUE #102: Precios: Permitir filtrar por Productos Activos y Categoría de Producto
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_DATE('2018-02-15 20:24:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002792
;

-- 15/02/2018 20:24:48 ART
-- ISSUE #102: Precios: Permitir filtrar por Productos Activos y Categoría de Producto
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005348,10,'Y','N','N',3002792,'N','Y',192,'N','Identifies the category which this product belongs to.  Product categories are used for pricing and selection.','LAR','Category of a Product','Product Category',100,0,TO_DATE('2018-02-15 20:24:48','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2018-02-15 20:24:48','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 15/02/2018 20:24:48 ART
-- ISSUE #102: Precios: Permitir filtrar por Productos Activos y Categoría de Producto
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005348 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 15/02/2018 20:25:07 ART
-- ISSUE #102: Precios: Permitir filtrar por Productos Activos y Categoría de Producto
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3005348
;

-- 15/02/2018 20:25:07 ART
-- ISSUE #102: Precios: Permitir filtrar por Productos Activos y Categoría de Producto
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=1194
;

-- 15/02/2018 20:25:07 ART
-- ISSUE #102: Precios: Permitir filtrar por Productos Activos y Categoría de Producto
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=2398
;

-- 15/02/2018 20:25:07 ART
-- ISSUE #102: Precios: Permitir filtrar por Productos Activos y Categoría de Producto
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=2399
;

-- 15/02/2018 20:25:07 ART
-- ISSUE #102: Precios: Permitir filtrar por Productos Activos y Categoría de Producto
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=2397
;

-- 15/02/2018 20:26:05 ART
-- ISSUE #102: Precios: Permitir filtrar por Productos Activos y Categoría de Producto
UPDATE AD_Tab SET WhereClause='M_ProductPrice.M_Product_ID IN (SELECT M_Product_ID FROM M_Product WHERE AD_Client_ID = 1000000 AND IsActive=''Y'')',Updated=TO_DATE('2018-02-15 20:26:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=192
;

-- 15/02/2018 20:30:15 ART
-- ISSUE #102: Precios: Permitir filtrar por Productos Activos y Categoría de Producto
UPDATE AD_Column SET IsSelectionColumn='Y', IsUpdateable='N',Updated=TO_DATE('2018-02-15 20:30:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=2064
;

-- 15/02/2018 20:33:34 ART
-- ISSUE #102: Precios: Permitir filtrar por Productos Activos y Categoría de Producto
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2018-02-15 20:33:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005348
;

-- Registración de script
SELECT register_migration_script_lar('0100_ISSUE-102.sql', 'LAR', '') FROM dual
;
