-- En este script, se incluyen columnas pertenicientes a la funcionalidad de sincronización de Puntos de Venta. El mismo, fallara en los proyectos LAR_Propet y LAR_Parbras, ya que en dichos proyectos, estas columnas ya existen.
ALTER TABLE C_Invoice ADD COLUMN Sincronizada character(1) NOT NULL DEFAULT 'N'::bpchar;
ALTER TABLE C_Invoice ADD CONSTRAINT C_Invoice_Sincronizada_Check CHECK (Sincronizada = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]));

ALTER TABLE C_Order ADD COLUMN Sincronizada character(1) NOT NULL DEFAULT 'N'::bpchar;
ALTER TABLE C_Order ADD CONSTRAINT C_Order_Sincronizada_Check CHECK (Sincronizada = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]));

-- 07/02/2020 18:00:31 ART
-- ISSUE #133: Incorporar marcas sincronizadas en orden y factura.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001057,'sincronizada','LAR','sincronizada','sincronizada',0,TO_TIMESTAMP('2020-02-07 18:00:30','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2020-02-07 18:00:30','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 07/02/2020 18:00:31 ART
-- ISSUE #133: Incorporar marcas sincronizadas en orden y factura.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001057 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 07/02/2020 18:00:31 ART
-- ISSUE #133: Incorporar marcas sincronizadas en orden y factura.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003561,318,'LAR',0,'Y','N','N','N',1,'N',20,'N',3001057,'N','Y','N','sincronizada','sincronizada',100,TO_TIMESTAMP('2020-02-07 18:00:30','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-02-07 18:00:30','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 07/02/2020 18:00:31 ART
-- ISSUE #133: Incorporar marcas sincronizadas en orden y factura.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003561 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 07/02/2020 18:00:57 ART
-- ISSUE #133: Incorporar marcas sincronizadas en orden y factura.
UPDATE AD_Column SET Name='Sincronizada', ColumnName='Sincronizada',Updated=TO_TIMESTAMP('2020-02-07 18:00:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003561
;

-- 07/02/2020 18:00:57 ART
-- ISSUE #133: Incorporar marcas sincronizadas en orden y factura.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003561
;

-- 07/02/2020 18:00:57 ART
-- ISSUE #133: Incorporar marcas sincronizadas en orden y factura.
UPDATE AD_Field SET Name='Sincronizada', Description=NULL, Help=NULL WHERE AD_Column_ID=3003561 AND IsCentrallyMaintained='Y'
;

-- 07/02/2020 18:01:05 ART
-- ISSUE #133: Incorporar marcas sincronizadas en orden y factura.
UPDATE AD_Column_Trl SET Name='Sincronizada',Updated=TO_TIMESTAMP('2020-02-07 18:01:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003561 AND AD_Language='es_AR'
;

-- 07/02/2020 18:01:20 ART
-- ISSUE #133: Incorporar marcas sincronizadas en orden y factura.
UPDATE AD_Element SET ColumnName='Sincronizada', Name='Sincronizada', PrintName='Sincronizada',Updated=TO_TIMESTAMP('2020-02-07 18:01:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001057
;

-- 07/02/2020 18:01:20 ART
-- ISSUE #133: Incorporar marcas sincronizadas en orden y factura.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001057
;

-- 07/02/2020 18:01:20 ART
-- ISSUE #133: Incorporar marcas sincronizadas en orden y factura.
UPDATE AD_Column SET ColumnName='Sincronizada', Name='Sincronizada', Description=NULL, Help=NULL WHERE AD_Element_ID=3001057
;

-- 07/02/2020 18:01:20 ART
-- ISSUE #133: Incorporar marcas sincronizadas en orden y factura.
UPDATE AD_Process_Para SET ColumnName='Sincronizada', Name='Sincronizada', Description=NULL, Help=NULL, AD_Element_ID=3001057 WHERE UPPER(ColumnName)='SINCRONIZADA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 07/02/2020 18:01:20 ART
-- ISSUE #133: Incorporar marcas sincronizadas en orden y factura.
UPDATE AD_Process_Para SET ColumnName='Sincronizada', Name='Sincronizada', Description=NULL, Help=NULL WHERE AD_Element_ID=3001057 AND IsCentrallyMaintained='Y'
;

-- 07/02/2020 18:01:20 ART
-- ISSUE #133: Incorporar marcas sincronizadas en orden y factura.
UPDATE AD_Field SET Name='Sincronizada', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001057) AND IsCentrallyMaintained='Y'
;

-- 07/02/2020 18:01:20 ART
-- ISSUE #133: Incorporar marcas sincronizadas en orden y factura.
UPDATE AD_PrintFormatItem SET PrintName='Sincronizada', Name='Sincronizada' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001057)
;

-- 07/02/2020 18:01:25 ART
-- ISSUE #133: Incorporar marcas sincronizadas en orden y factura.
UPDATE AD_Element_Trl SET Name='Sincronizada',PrintName='Sincronizada',Updated=TO_TIMESTAMP('2020-02-07 18:01:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001057 AND AD_Language='es_AR'
;

-- 07/02/2020 18:01:58 ART
-- ISSUE #133: Incorporar marcas sincronizadas en orden y factura.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003562,259,'LAR',0,'Y','N','N','N',1,'N',20,'N',3001057,'N','Y','N','Sincronizada','Sincronizada',100,TO_TIMESTAMP('2020-02-07 18:01:58','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-02-07 18:01:58','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 07/02/2020 18:01:58 ART
-- ISSUE #133: Incorporar marcas sincronizadas en orden y factura.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003562 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Registración de script
SELECT register_migration_script_lar('0148_ISSUE-133.sql', 'LAR', '')
;
