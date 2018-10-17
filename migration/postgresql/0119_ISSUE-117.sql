ALTER TABLE M_InventoryLine ADD COLUMN CantContadaUM numeric NOT NULL DEFAULT 0;
ALTER TABLE M_InventoryLine ADD COLUMN C_UOM_ID numeric(10,0);
ALTER TABLE M_InventoryLine ADD CONSTRAINT cuom_minventoryline FOREIGN KEY (C_Uom_ID)
      REFERENCES C_Uom (C_Uom_ID) MATCH SIMPLE;

ALTER TABLE M_MovementLine ADD COLUMN CantidadUM numeric NOT NULL DEFAULT 0;
ALTER TABLE M_MovementLine ADD COLUMN C_UOM_ID numeric(10,0);
ALTER TABLE M_MovementLine ADD CONSTRAINT cuom_mmovementline FOREIGN KEY (C_Uom_ID)
      REFERENCES C_Uom (C_Uom_ID) MATCH SIMPLE;

-- 16/10/2018 17:28:20 ART
-- BUG #467: Unidades de medida en el POS.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000901,'cantcontadaum','LAR','cantcontadaum','cantcontadaum',0,TO_TIMESTAMP('2018-10-16 17:28:19','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2018-10-16 17:28:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 16/10/2018 17:28:20 ART
-- BUG #467: Unidades de medida en el POS.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000901 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 16/10/2018 17:28:22 ART
-- BUG #467: Unidades de medida en el POS.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003030,322,'LAR',0,'Y','N','N','N',131089,'N',22,'N',3000901,'N','Y','N','cantcontadaum','cantcontadaum',TO_TIMESTAMP('2018-10-16 17:28:19','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2018-10-16 17:28:19','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 16/10/2018 17:28:22 ART
-- BUG #467: Unidades de medida en el POS.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003030 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 16/10/2018 17:28:22 ART
-- BUG #467: Unidades de medida en el POS.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003031,322,'LAR',0,'N','N','N','The UOM defines a unique non monetary Unit of Measure','N',10,'N',19,'N',215,'N','Y','N','Unit of Measure','UOM','C_UOM_ID',TO_TIMESTAMP('2018-10-16 17:28:22','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2018-10-16 17:28:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 16/10/2018 17:28:22 ART
-- BUG #467: Unidades de medida en el POS.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003031 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 16/10/2018 17:29:24 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Column SET FieldLength=20, AD_Reference_ID=29, Name='Cant. Contada UM', ColumnName='CantContadaUM',Updated=TO_TIMESTAMP('2018-10-16 17:29:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003030
;

-- 16/10/2018 17:29:24 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003030
;

-- 16/10/2018 17:29:24 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Field SET Name='Cant. Contada UM', Description=NULL, Help=NULL WHERE AD_Column_ID=3003030 AND IsCentrallyMaintained='Y'
;

-- 16/10/2018 17:29:53 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Column_Trl SET Name='Cant. Contada UM',Updated=TO_TIMESTAMP('2018-10-16 17:29:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003030 AND AD_Language='es_AR'
;

-- 16/10/2018 17:30:15 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Element SET ColumnName='CantContadaUM', Name='Cant. Contada UM', PrintName='Cant. Contada UM',Updated=TO_TIMESTAMP('2018-10-16 17:30:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000901
;

-- 16/10/2018 17:30:15 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000901
;

-- 16/10/2018 17:30:15 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Column SET ColumnName='CantContadaUM', Name='Cant. Contada UM', Description=NULL, Help=NULL WHERE AD_Element_ID=3000901
;

-- 16/10/2018 17:30:15 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Process_Para SET ColumnName='CantContadaUM', Name='Cant. Contada UM', Description=NULL, Help=NULL, AD_Element_ID=3000901 WHERE UPPER(ColumnName)='CANTCONTADAUM' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 16/10/2018 17:30:15 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Process_Para SET ColumnName='CantContadaUM', Name='Cant. Contada UM', Description=NULL, Help=NULL WHERE AD_Element_ID=3000901 AND IsCentrallyMaintained='Y'
;

-- 16/10/2018 17:30:15 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Field SET Name='Cant. Contada UM', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000901) AND IsCentrallyMaintained='Y'
;

-- 16/10/2018 17:30:15 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_PrintFormatItem SET PrintName='Cant. Contada UM', Name='Cant. Contada UM' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000901)
;

-- 16/10/2018 17:30:20 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Element_Trl SET Name='Cant. Contada UM',PrintName='Cant. Contada UM',Updated=TO_TIMESTAMP('2018-10-16 17:30:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000901 AND AD_Language='es_AR'
;

-- 16/10/2018 17:31:03 ART
-- BUG #467: Unidades de medida en el POS.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3005884,20,'Y','N','N',3003030,'N','Y',256,'N','LAR','Cant. Contada UM',100,0,'Y',TO_TIMESTAMP('2018-10-16 17:31:02','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2018-10-16 17:31:02','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/10/2018 17:31:03 ART
-- BUG #467: Unidades de medida en el POS.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005884 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/10/2018 17:31:03 ART
-- BUG #467: Unidades de medida en el POS.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3005885,10,'Y','N','N',3003031,'N','Y',256,'N','The UOM defines a unique non monetary Unit of Measure','LAR','Unit of Measure','UOM',100,0,'Y',TO_TIMESTAMP('2018-10-16 17:31:03','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2018-10-16 17:31:03','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/10/2018 17:31:03 ART
-- BUG #467: Unidades de medida en el POS.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005885 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/10/2018 17:31:17 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3005884
;

-- 16/10/2018 17:31:18 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3005885
;

-- 16/10/2018 17:31:18 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=2699
;

-- 16/10/2018 17:31:18 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=2698
;

-- 16/10/2018 17:31:18 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=2692
;

-- 16/10/2018 17:31:18 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=8290
;

-- 16/10/2018 17:31:18 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=8289
;

-- 16/10/2018 17:31:18 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3005883
;

-- 16/10/2018 17:31:53 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2018-10-16 17:31:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005885
;

-- 16/10/2018 17:32:02 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2018-10-16 17:32:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2699
;

-- 16/10/2018 17:35:14 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Column SET Callout='org.compiere.model.CalloutInventory.cantidad',Updated=TO_TIMESTAMP('2018-10-16 17:35:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003031
;

-- 16/10/2018 17:35:31 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Column SET Callout='org.compiere.model.CalloutInventory.cantidad',Updated=TO_TIMESTAMP('2018-10-16 17:35:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003030
;

-- 16/10/2018 17:37:59 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Column SET DefaultValue='@#C_UOM_ID@', AD_Val_Rule_ID=210,Updated=TO_TIMESTAMP('2018-10-16 17:37:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003031
;

-- 16/10/2018 18:05:35 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Column SET IsMandatory='Y',Updated=TO_TIMESTAMP('2018-10-16 18:05:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003031
;

-- 17/10/2018 18:47:04 ART
-- BUG #467: Unidades de medida en el POS.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000902,'cantidadum','LAR','cantidadum','cantidadum',0,TO_TIMESTAMP('2018-10-17 18:47:03','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2018-10-17 18:47:03','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 17/10/2018 18:47:04 ART
-- BUG #467: Unidades de medida en el POS.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000902 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 17/10/2018 18:47:05 ART
-- BUG #467: Unidades de medida en el POS.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003032,324,'LAR',0,'Y','N','N','N',131089,'N',22,'N',3000902,'N','Y','N','cantidadum','cantidadum',TO_TIMESTAMP('2018-10-17 18:47:03','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2018-10-17 18:47:03','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 17/10/2018 18:47:05 ART
-- BUG #467: Unidades de medida en el POS.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003032 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 17/10/2018 18:47:05 ART
-- BUG #467: Unidades de medida en el POS.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003033,324,'LAR',0,'N','N','N','The UOM defines a unique non monetary Unit of Measure','N',10,'N',19,'N',215,'N','Y','N','Unit of Measure','UOM','C_UOM_ID',TO_TIMESTAMP('2018-10-17 18:47:05','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2018-10-17 18:47:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 17/10/2018 18:47:05 ART
-- BUG #467: Unidades de medida en el POS.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003033 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 17/10/2018 18:48:08 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Column SET FieldLength=20, Name='Cantidad UM', ColumnName='CantidadUM',Updated=TO_TIMESTAMP('2018-10-17 18:48:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003032
;

-- 17/10/2018 18:48:08 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003032
;

-- 17/10/2018 18:48:08 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Field SET Name='Cantidad UM', Description=NULL, Help=NULL WHERE AD_Column_ID=3003032 AND IsCentrallyMaintained='Y'
;

-- 17/10/2018 18:48:16 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Column_Trl SET Name='Cantidad UM',Updated=TO_TIMESTAMP('2018-10-17 18:48:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003032 AND AD_Language='es_AR'
;

-- 17/10/2018 18:48:38 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Element SET ColumnName='CantidadUM', Name='Cantidad UM', PrintName='Cantidad UM',Updated=TO_TIMESTAMP('2018-10-17 18:48:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000902
;

-- 17/10/2018 18:48:38 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000902
;

-- 17/10/2018 18:48:38 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Column SET ColumnName='CantidadUM', Name='Cantidad UM', Description=NULL, Help=NULL WHERE AD_Element_ID=3000902
;

-- 17/10/2018 18:48:38 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Process_Para SET ColumnName='CantidadUM', Name='Cantidad UM', Description=NULL, Help=NULL, AD_Element_ID=3000902 WHERE UPPER(ColumnName)='CANTIDADUM' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 17/10/2018 18:48:38 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Process_Para SET ColumnName='CantidadUM', Name='Cantidad UM', Description=NULL, Help=NULL WHERE AD_Element_ID=3000902 AND IsCentrallyMaintained='Y'
;

-- 17/10/2018 18:48:38 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Field SET Name='Cantidad UM', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000902) AND IsCentrallyMaintained='Y'
;

-- 17/10/2018 18:48:38 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_PrintFormatItem SET PrintName='Cantidad UM', Name='Cantidad UM' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000902)
;

-- 17/10/2018 18:48:47 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Element_Trl SET Name='Cantidad UM',PrintName='Cantidad UM',Updated=TO_TIMESTAMP('2018-10-17 18:48:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000902 AND AD_Language='es_AR'
;

-- 17/10/2018 18:49:06 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Column SET AD_Reference_ID=29,Updated=TO_TIMESTAMP('2018-10-17 18:49:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003032
;

-- 17/10/2018 18:49:26 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Column SET AD_Val_Rule_ID=210,Updated=TO_TIMESTAMP('2018-10-17 18:49:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003033
;

-- 17/10/2018 18:50:32 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Column SET Callout='org.compiere.model.CalloutMovement.Qty',Updated=TO_TIMESTAMP('2018-10-17 18:50:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003033
;

-- 17/10/2018 18:50:59 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Column SET Callout='org.compiere.model.CalloutMovement.qty',Updated=TO_TIMESTAMP('2018-10-17 18:50:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003032
;

-- 17/10/2018 18:51:13 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Column SET Callout='org.compiere.model.CalloutMovement.qty',Updated=TO_TIMESTAMP('2018-10-17 18:51:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003033
;

-- 17/10/2018 18:52:42 ART
-- BUG #467: Unidades de medida en el POS.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3005886,20,'Y','N','N',3003032,'N','Y',260,'N','LAR','Cantidad UM',100,0,'Y',TO_TIMESTAMP('2018-10-17 18:52:42','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2018-10-17 18:52:42','YYYY-MM-DD HH24:MI:SS'))
;

-- 17/10/2018 18:52:42 ART
-- BUG #467: Unidades de medida en el POS.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005886 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 17/10/2018 18:52:42 ART
-- BUG #467: Unidades de medida en el POS.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3005887,22,'Y','N','N',56356,'N','Y',260,'N','D','Use to keep the reversal line ID for reversing costing purpose','Reversal Line',100,0,'Y',TO_TIMESTAMP('2018-10-17 18:52:42','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2018-10-17 18:52:42','YYYY-MM-DD HH24:MI:SS'))
;

-- 17/10/2018 18:52:42 ART
-- BUG #467: Unidades de medida en el POS.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005887 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 17/10/2018 18:52:43 ART
-- BUG #467: Unidades de medida en el POS.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3005888,10,'Y','N','N',3003033,'N','Y',260,'N','The UOM defines a unique non monetary Unit of Measure','LAR','Unit of Measure','UOM',100,0,'Y',TO_TIMESTAMP('2018-10-17 18:52:42','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2018-10-17 18:52:42','YYYY-MM-DD HH24:MI:SS'))
;

-- 17/10/2018 18:52:43 ART
-- BUG #467: Unidades de medida en el POS.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005888 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 17/10/2018 18:53:22 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3005886
;

-- 17/10/2018 18:53:23 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3005888
;

-- 17/10/2018 18:53:23 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=2738
;

-- 17/10/2018 18:53:23 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3005887
;

-- 17/10/2018 18:53:58 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Column SET IsMandatory='Y',Updated=TO_TIMESTAMP('2018-10-17 18:53:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003033
;

-- 17/10/2018 18:55:20 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2018-10-17 18:55:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005888
;

-- 17/10/2018 18:55:42 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2018-10-17 18:55:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2738
;

-- 17/10/2018 18:55:53 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3005887
;

-- 17/10/2018 19:02:50 ART
-- BUG #467: Unidades de medida en el POS.
UPDATE AD_Column SET Callout='org.compiere.model.CalloutMovement.product, org.compiere.model.CalloutMovement.qty',Updated=TO_TIMESTAMP('2018-10-17 19:02:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3593
;

-- Registración de script
SELECT register_migration_script_lar('0119_ISSUE-117.sql', 'LAR', '')
;
