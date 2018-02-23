ALTER TABLE M_ProductPrice ADD COLUMN PrecioLista_Final numeric NOT NULL DEFAULT 0;
ALTER TABLE M_ProductPrice ADD COLUMN PrecioStd_Final numeric NOT NULL DEFAULT 0;
ALTER TABLE M_ProductPrice ADD COLUMN PrecioLimite_Final numeric NOT NULL DEFAULT 0;

-- 14/02/2018 19:52:16 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000794,'preciolista_final','LAR','preciolista_final','preciolista_final',0,TO_TIMESTAMP('2018-02-14 19:52:15','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2018-02-14 19:52:15','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 14/02/2018 19:52:16 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000794 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 14/02/2018 19:52:16 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3002788,251,'LAR',0,'Y','N','N','N',131089,'N',22,'N',3000794,'N','Y','N','preciolista_final','preciolista_final',100,TO_TIMESTAMP('2018-02-14 19:52:15','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2018-02-14 19:52:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/02/2018 19:52:16 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3002788 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 14/02/2018 19:52:16 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000795,'preciostd_final','LAR','preciostd_final','preciostd_final',0,TO_TIMESTAMP('2018-02-14 19:52:16','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2018-02-14 19:52:16','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 14/02/2018 19:52:16 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000795 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 14/02/2018 19:52:17 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3002789,251,'LAR',0,'Y','N','N','N',131089,'N',22,'N',3000795,'N','Y','N','preciostd_final','preciostd_final',100,TO_TIMESTAMP('2018-02-14 19:52:16','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2018-02-14 19:52:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/02/2018 19:52:17 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3002789 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 14/02/2018 19:52:17 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000796,'preciolimite_final','LAR','preciolimite_final','preciolimite_final',0,TO_TIMESTAMP('2018-02-14 19:52:17','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2018-02-14 19:52:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 14/02/2018 19:52:17 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000796 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 14/02/2018 19:52:17 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3002790,251,'LAR',0,'Y','N','N','N',131089,'N',22,'N',3000796,'N','Y','N','preciolimite_final','preciolimite_final',100,TO_TIMESTAMP('2018-02-14 19:52:17','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2018-02-14 19:52:17','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/02/2018 19:52:17 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3002790 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 14/02/2018 19:53:31 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Column SET AD_Reference_ID=37, Name='Precio Limite Final', ColumnName='PrecioLimite_Final',Updated=TO_TIMESTAMP('2018-02-14 19:53:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002790
;

-- 14/02/2018 19:53:31 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3002790
;

-- 14/02/2018 19:53:31 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET Name='Precio Limite Final', Description=NULL, Help=NULL WHERE AD_Column_ID=3002790 AND IsCentrallyMaintained='Y'
;

-- 14/02/2018 19:53:39 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Column_Trl SET Name='Precio Limite Final',Updated=TO_TIMESTAMP('2018-02-14 19:53:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002790 AND AD_Language='es_AR'
;

-- 14/02/2018 19:53:56 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Element SET ColumnName='PrecioLimite_Final', Name='Precio Limite Final', PrintName='Precio Limite Final',Updated=TO_TIMESTAMP('2018-02-14 19:53:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000796
;

-- 14/02/2018 19:53:56 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000796
;

-- 14/02/2018 19:53:56 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Column SET ColumnName='PrecioLimite_Final', Name='Precio Limite Final', Description=NULL, Help=NULL WHERE AD_Element_ID=3000796
;

-- 14/02/2018 19:53:56 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Process_Para SET ColumnName='PrecioLimite_Final', Name='Precio Limite Final', Description=NULL, Help=NULL, AD_Element_ID=3000796 WHERE UPPER(ColumnName)='PRECIOLIMITE_FINAL' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 14/02/2018 19:53:56 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Process_Para SET ColumnName='PrecioLimite_Final', Name='Precio Limite Final', Description=NULL, Help=NULL WHERE AD_Element_ID=3000796 AND IsCentrallyMaintained='Y'
;

-- 14/02/2018 19:53:56 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET Name='Precio Limite Final', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000796) AND IsCentrallyMaintained='Y'
;

-- 14/02/2018 19:53:56 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_PrintFormatItem SET PrintName='Precio Limite Final', Name='Precio Limite Final' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000796)
;

-- 14/02/2018 19:54:05 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Element_Trl SET Name='Precio Limite Final',PrintName='Precio Limite Final',Updated=TO_TIMESTAMP('2018-02-14 19:54:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000796 AND AD_Language='es_AR'
;

-- 14/02/2018 19:54:50 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Column SET AD_Reference_ID=37, Name='Precio de Lista Final', ColumnName='PrecioLista_Final',Updated=TO_TIMESTAMP('2018-02-14 19:54:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002788
;

-- 14/02/2018 19:54:50 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3002788
;

-- 14/02/2018 19:54:50 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET Name='Precio de Lista Final', Description=NULL, Help=NULL WHERE AD_Column_ID=3002788 AND IsCentrallyMaintained='Y'
;

-- 14/02/2018 19:54:57 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Column_Trl SET Name='Precio de Lista Final',Updated=TO_TIMESTAMP('2018-02-14 19:54:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002788 AND AD_Language='es_AR'
;

-- 14/02/2018 19:55:05 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Element_Trl SET Name='Precio de Lista Final',PrintName='Precio de Lista Final',Updated=TO_TIMESTAMP('2018-02-14 19:55:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000794 AND AD_Language='es_AR'
;

-- 14/02/2018 19:55:18 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Element SET ColumnName='PrecioLista_Final', Name='Precio de Lista Final', PrintName='Precio de Lista Final',Updated=TO_TIMESTAMP('2018-02-14 19:55:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000794
;

-- 14/02/2018 19:55:18 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000794
;

-- 14/02/2018 19:55:18 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Column SET ColumnName='PrecioLista_Final', Name='Precio de Lista Final', Description=NULL, Help=NULL WHERE AD_Element_ID=3000794
;

-- 14/02/2018 19:55:18 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Process_Para SET ColumnName='PrecioLista_Final', Name='Precio de Lista Final', Description=NULL, Help=NULL, AD_Element_ID=3000794 WHERE UPPER(ColumnName)='PRECIOLISTA_FINAL' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 14/02/2018 19:55:18 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Process_Para SET ColumnName='PrecioLista_Final', Name='Precio de Lista Final', Description=NULL, Help=NULL WHERE AD_Element_ID=3000794 AND IsCentrallyMaintained='Y'
;

-- 14/02/2018 19:55:18 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET Name='Precio de Lista Final', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000794) AND IsCentrallyMaintained='Y'
;

-- 14/02/2018 19:55:18 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_PrintFormatItem SET PrintName='Precio de Lista Final', Name='Precio de Lista Final' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000794)
;

-- 14/02/2018 19:56:23 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Column SET AD_Reference_ID=37, Name='Precio Estándar Final', ColumnName='PrecioStd_Final',Updated=TO_TIMESTAMP('2018-02-14 19:56:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002789
;

-- 14/02/2018 19:56:23 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3002789
;

-- 14/02/2018 19:56:23 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET Name='Precio Estándar Final', Description=NULL, Help=NULL WHERE AD_Column_ID=3002789 AND IsCentrallyMaintained='Y'
;

-- 14/02/2018 19:56:29 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Column_Trl SET Name='Precio Estándar Final',Updated=TO_TIMESTAMP('2018-02-14 19:56:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002789 AND AD_Language='es_AR'
;

-- 14/02/2018 19:56:39 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Element_Trl SET Name='Precio Estándar Final',PrintName='Precio Estándar Final',Updated=TO_TIMESTAMP('2018-02-14 19:56:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000795 AND AD_Language='es_AR'
;

-- 14/02/2018 19:57:05 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Element SET ColumnName='PrecioStd_Final', Name='Precio Estándar Final', PrintName='Precio Estándar Final',Updated=TO_TIMESTAMP('2018-02-14 19:57:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000795
;

-- 14/02/2018 19:57:05 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000795
;

-- 14/02/2018 19:57:05 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Column SET ColumnName='PrecioStd_Final', Name='Precio Estándar Final', Description=NULL, Help=NULL WHERE AD_Element_ID=3000795
;

-- 14/02/2018 19:57:05 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Process_Para SET ColumnName='PrecioStd_Final', Name='Precio Estándar Final', Description=NULL, Help=NULL, AD_Element_ID=3000795 WHERE UPPER(ColumnName)='PRECIOSTD_FINAL' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 14/02/2018 19:57:05 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Process_Para SET ColumnName='PrecioStd_Final', Name='Precio Estándar Final', Description=NULL, Help=NULL WHERE AD_Element_ID=3000795 AND IsCentrallyMaintained='Y'
;

-- 14/02/2018 19:57:05 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET Name='Precio Estándar Final', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000795) AND IsCentrallyMaintained='Y'
;

-- 14/02/2018 19:57:05 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_PrintFormatItem SET PrintName='Precio Estándar Final', Name='Precio Estándar Final' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000795)
;

-- 14/02/2018 19:58:57 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3005343,131089,'Y','N','N',3002788,'N','Y',183,'N','LAR','Precio de Lista Final',100,0,TO_TIMESTAMP('2018-02-14 19:58:57','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2018-02-14 19:58:57','YYYY-MM-DD HH24:MI:SS'))
;

-- 14/02/2018 19:58:57 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005343 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/02/2018 19:58:57 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3005344,131089,'Y','N','N',3002789,'N','Y',183,'N','LAR','Precio Estándar Final',100,0,TO_TIMESTAMP('2018-02-14 19:58:57','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2018-02-14 19:58:57','YYYY-MM-DD HH24:MI:SS'))
;

-- 14/02/2018 19:58:57 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005344 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/02/2018 19:58:58 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3005345,131089,'Y','N','N',3002790,'N','Y',183,'N','LAR','Precio Limite Final',100,0,TO_TIMESTAMP('2018-02-14 19:58:57','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2018-02-14 19:58:57','YYYY-MM-DD HH24:MI:SS'))
;

-- 14/02/2018 19:58:58 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005345 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/02/2018 19:59:21 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3005343
;

-- 14/02/2018 19:59:21 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=2102
;

-- 14/02/2018 19:59:21 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3005344
;

-- 14/02/2018 19:59:21 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=2100
;

-- 14/02/2018 19:59:21 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3005345
;

-- 14/02/2018 19:59:35 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET DisplayLength=26,Updated=TO_TIMESTAMP('2018-02-14 19:59:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005343
;

-- 14/02/2018 19:59:37 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET DisplayLength=26,Updated=TO_TIMESTAMP('2018-02-14 19:59:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005344
;

-- 14/02/2018 19:59:44 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET DisplayLength=26,Updated=TO_TIMESTAMP('2018-02-14 19:59:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005345
;

-- 14/02/2018 19:59:52 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2018-02-14 19:59:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005343
;

-- 14/02/2018 19:59:58 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2018-02-14 19:59:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005344
;

-- 14/02/2018 20:00:05 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2018-02-14 20:00:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005345
;

-- 14/02/2018 20:00:12 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2018-02-14 20:00:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2100
;

-- 14/02/2018 20:00:21 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2018-02-14 20:00:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2102
;

-- 14/02/2018 20:00:31 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2018-02-14 20:00:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2101
;

-- 16/02/2018 17:18:19 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3005353,131089,'Y','N','N',3002788,'N','Y',192,'N','LAR','Precio de Lista Final',100,0,TO_TIMESTAMP('2018-02-16 17:18:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2018-02-16 17:18:18','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/02/2018 17:18:19 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005353 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/02/2018 17:18:19 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3005354,131089,'Y','N','N',3002789,'N','Y',192,'N','LAR','Precio Estándar Final',100,0,TO_TIMESTAMP('2018-02-16 17:18:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2018-02-16 17:18:19','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/02/2018 17:18:19 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005354 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/02/2018 17:18:19 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3005355,131089,'Y','N','N',3002790,'N','Y',192,'N','LAR','Precio Limite Final',100,0,TO_TIMESTAMP('2018-02-16 17:18:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2018-02-16 17:18:19','YYYY-MM-DD HH24:MI:SS'))
;

-- 16/02/2018 17:18:19 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005355 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 16/02/2018 17:19:29 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3005353
;

-- 16/02/2018 17:19:29 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=2399
;

-- 16/02/2018 17:19:29 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3005354
;

-- 16/02/2018 17:19:29 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=2397
;

-- 16/02/2018 17:19:29 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3005355
;

-- 16/02/2018 17:19:49 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2018-02-16 17:19:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005353
;

-- 16/02/2018 17:19:50 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2018-02-16 17:19:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005354
;

-- 16/02/2018 17:19:55 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2018-02-16 17:19:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005355
;

-- 16/02/2018 17:20:04 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2018-02-16 17:20:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2398
;

-- 16/02/2018 17:20:06 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2018-02-16 17:20:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2399
;

-- 16/02/2018 17:21:09 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2018-02-16 17:21:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2397
;

-- 16/02/2018 17:21:12 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET DisplayLength=26,Updated=TO_TIMESTAMP('2018-02-16 17:21:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005353
;

-- 16/02/2018 17:21:15 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET DisplayLength=26,Updated=TO_TIMESTAMP('2018-02-16 17:21:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005354
;

-- 16/02/2018 17:21:18 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET DisplayLength=26,Updated=TO_TIMESTAMP('2018-02-16 17:21:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005355
;

-- 23/02/2018 17:48:52 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2018-02-23 17:48:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2101
;

-- 23/02/2018 17:48:59 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2018-02-23 17:48:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005343
;

-- 23/02/2018 17:49:59 ART
-- ISSUE 101: Permitir ingresar precio final y calcular el precio base (sin impuestos) del mismo.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2018-02-23 17:49:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005353
;

-- Registración de script
SELECT register_migration_script_lar('0101_ISSUE-101.sql', 'LAR', '')
;
