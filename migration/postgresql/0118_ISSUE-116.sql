ALTER TABLe M_Movement ADD COLUMN M_Locator_ID numeric(10,0) NOT NULL DEFAULT 0;
ALTER TABLe M_Movement ADD COLUMN M_LocatorTo_ID numeric(10,0) NOT NULL DEFAULT 0;

-- 12/06/2017 13:21:08 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3002062,323,'LAR',0,'Y','N','N','The Locator indicates where in a Warehouse a product is located.','N',10,'N',19,'N',448,'N','Y','N','Warehouse Locator','Locator','M_Locator_ID',100,TO_TIMESTAMP('2017-06-12 13:21:07','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2017-06-12 13:21:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 12/06/2017 13:21:08 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3002062 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 12/06/2017 13:21:08 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3002063,323,'LAR',0,'Y','N','N','The Locator To indicates the location where the inventory is being moved to.','N',10,'N',19,'N',1029,'N','Y','N','Location inventory is moved to','Locator To','M_LocatorTo_ID',100,TO_TIMESTAMP('2017-06-12 13:21:08','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2017-06-12 13:21:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 12/06/2017 13:21:08 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3002063 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 12/06/2017 13:22:40 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
UPDATE AD_Column SET AD_Reference_ID=19,Updated=TO_TIMESTAMP('2017-06-12 13:22:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3591
;

-- 12/06/2017 13:22:48 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
UPDATE AD_Column SET AD_Reference_Value_ID=NULL, AD_Reference_ID=19,Updated=TO_TIMESTAMP('2017-06-12 13:22:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3592
;

-- 12/06/2017 13:24:32 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003265,10,'Y','N','N',3002062,'N','Y',259,'N','The Locator indicates where in a Warehouse a product is located.','LAR','Warehouse Locator','Locator',100,0,TO_TIMESTAMP('2017-06-12 13:24:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2017-06-12 13:24:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 12/06/2017 13:24:32 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003265 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 12/06/2017 13:24:32 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003266,10,'Y','N','N',3002063,'N','Y',259,'N','The Locator To indicates the location where the inventory is being moved to.','LAR','Location inventory is moved to','Locator To',100,0,TO_TIMESTAMP('2017-06-12 13:24:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2017-06-12 13:24:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 12/06/2017 13:24:32 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003266 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 12/06/2017 13:24:32 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003267,20,'Y','N','N',59048,'N','Y',259,'N','The ProcessedOn Date+Time save the exact moment (nanoseconds precision if allowed by the DB) when a document has been processed.','D','The date+time (expressed in decimal format) when the document has been processed','Processed On',100,0,TO_TIMESTAMP('2017-06-12 13:24:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2017-06-12 13:24:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 12/06/2017 13:24:32 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003267 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 12/06/2017 13:24:33 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003268,22,'Y','N','N',55308,'N','Y',259,'N','D','ID of document reversal','Reversal ID',100,0,TO_TIMESTAMP('2017-06-12 13:24:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2017-06-12 13:24:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 12/06/2017 13:24:33 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003268 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 12/06/2017 13:28:41 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=54055
;

-- 12/06/2017 13:28:41 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3003267
;

-- 12/06/2017 13:28:41 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3003268
;

-- 12/06/2017 13:28:41 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3003265
;

-- 12/06/2017 13:28:41 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3003266
;

-- 12/06/2017 13:28:41 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=7791
;

-- 12/06/2017 13:28:41 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=7788
;

-- 12/06/2017 13:28:41 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=7792
;

-- 12/06/2017 13:28:41 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=7793
;

-- 12/06/2017 13:28:41 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=7790
;

-- 12/06/2017 13:28:41 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=7789
;

-- 12/06/2017 13:28:41 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=10530
;

-- 12/06/2017 13:28:41 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=10529
;

-- 12/06/2017 13:28:41 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=9223
;

-- 12/06/2017 13:28:41 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=9222
;

-- 12/06/2017 13:28:41 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=9224
;

-- 12/06/2017 13:28:41 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=9221
;

-- 12/06/2017 13:28:41 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=2727
;

-- 12/06/2017 13:28:41 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=5144
;

-- 12/06/2017 13:28:50 ART
-- BUG #364: Agregar Ubicaciones a cabecera de Movimiento de Inventario.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2017-06-12 13:28:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003266
;

-- Registración de script
SELECT register_migration_script_lar('0118_ISSUE-116.sql', 'LAR', '')
;
