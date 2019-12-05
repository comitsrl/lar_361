alter table c_pos add column aperturacajon character(1) not null default 'N'::bpchar
;

alter table c_pos add constraint c_pos_aperturacajon_check check (aperturacajon = any (array['Y'::bpchar, 'N'::bpchar]))
;

-- 04/12/2019 17:25:06 ART
-- ISSUE #129: Implementar comando apertura de cajón
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001053,'aperturacajon','LAR','aperturacajon','aperturacajon',0,TO_TIMESTAMP('2019-12-04 17:25:00','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2019-12-04 17:25:00','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 04/12/2019 17:25:06 ART
-- ISSUE #129: Implementar comando apertura de cajón
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, PO_Description,Help,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.PO_Description,t.Help,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001053 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 04/12/2019 17:25:07 ART
-- ISSUE #129: Implementar comando apertura de cajón
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,IsMandatory,Version,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003556,748,'LAR','Y',0,'N','N','N',1,'N',20,'N',3001053,'N','Y','N','aperturacajon','aperturacajon',TO_TIMESTAMP('2019-12-04 17:25:00','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2019-12-04 17:25:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 04/12/2019 17:25:07 ART
-- ISSUE #129: Implementar comando apertura de cajón
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003556 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 04/12/2019 17:30:00 ART
-- ISSUE #129: Implementar comando apertura de cajón
UPDATE AD_Element SET ColumnName='AperturaCajon', Name='AperturaCajon', PrintName='AperturaCajon',Updated=TO_TIMESTAMP('2019-12-04 17:30:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001053
;

-- 04/12/2019 17:30:00 ART
-- ISSUE #129: Implementar comando apertura de cajón
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001053
;

-- 04/12/2019 17:30:00 ART
-- ISSUE #129: Implementar comando apertura de cajón
UPDATE AD_Column SET ColumnName='AperturaCajon', Name='AperturaCajon', Description=NULL, Help=NULL WHERE AD_Element_ID=3001053
;

-- 04/12/2019 17:30:00 ART
-- ISSUE #129: Implementar comando apertura de cajón
UPDATE AD_Process_Para SET ColumnName='AperturaCajon', Name='AperturaCajon', Description=NULL, Help=NULL, AD_Element_ID=3001053 WHERE UPPER(ColumnName)='APERTURACAJON' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 04/12/2019 17:30:00 ART
-- ISSUE #129: Implementar comando apertura de cajón
UPDATE AD_Process_Para SET ColumnName='AperturaCajon', Name='AperturaCajon', Description=NULL, Help=NULL WHERE AD_Element_ID=3001053 AND IsCentrallyMaintained='Y'
;

-- 04/12/2019 17:30:00 ART
-- ISSUE #129: Implementar comando apertura de cajón
UPDATE AD_Field SET Name='AperturaCajon', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001053) AND IsCentrallyMaintained='Y'
;

-- 04/12/2019 17:30:00 ART
-- ISSUE #129: Implementar comando apertura de cajón
UPDATE AD_PrintFormatItem SET PrintName='AperturaCajon', Name='AperturaCajon' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001053)
;

-- 04/12/2019 17:30:32 ART
-- ISSUE #129: Implementar comando apertura de cajón
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Apertura de Cajón de Dinero',PrintName='Apertura de Cajón de Dinero',Updated=TO_TIMESTAMP('2019-12-04 17:30:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001053 AND AD_Language='es_AR'
;

-- 04/12/2019 17:31:10 ART
-- ISSUE #129: Implementar comando apertura de cajón
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006659,1,'Y','N','N',3003556,'N','Y',676,'N','LAR','AperturaCajon',100,0,'Y',TO_TIMESTAMP('2019-12-04 17:31:08','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2019-12-04 17:31:08','YYYY-MM-DD HH24:MI:SS'))
;

-- 04/12/2019 17:31:10 ART
-- ISSUE #129: Implementar comando apertura de cajón
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006659 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/12/2019 17:32:25 ART
-- ISSUE #129: Implementar comando apertura de cajón
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2019-12-04 17:32:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005570
;

-- 04/12/2019 17:49:58 ART
-- ISSUE #129: Implementar comando apertura de cajón
UPDATE AD_Field_Trl SET Name='Apertura Cajon de Dinero',Updated=TO_TIMESTAMP('2019-12-04 17:49:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006659 AND AD_Language='es_AR'
;

-- 04/12/2019 17:50:32 ART
-- ISSUE #129: Implementar comando apertura de cajón
UPDATE AD_Field_Trl SET Name='JavaPOS',Updated=TO_TIMESTAMP('2019-12-04 17:50:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003215 AND AD_Language='es_AR'
;

-- 04/12/2019 17:51:03 ART
-- ISSUE #129: Implementar comando apertura de cajón
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Genera Retención en Venta',Description=NULL,Updated=TO_TIMESTAMP('2019-12-04 17:51:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000087 AND AD_Language='es_AR'
;

-- 04/12/2019 17:52:02 ART
-- ISSUE #129: Implementar comando apertura de cajón
UPDATE AD_Field_Trl SET Name='Permite Crédito Excedido',Description=NULL,Updated=TO_TIMESTAMP('2019-12-04 17:52:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000086 AND AD_Language='es_AR'
;

-- 04/12/2019 17:52:26 ART
-- ISSUE #129: Implementar comando apertura de cajón
UPDATE AD_Field_Trl SET Name='POS de Remito',Updated=TO_TIMESTAMP('2019-12-04 17:52:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001589 AND AD_Language='es_AR'
;

-- 04/12/2019 17:55:23 ART
-- ISSUE #129: Implementar comando apertura de cajón
UPDATE AD_Field_Trl SET Name='Tipo de Documento Cta. Cte.',Updated=TO_TIMESTAMP('2019-12-04 17:55:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001590 AND AD_Language='es_AR'
;

-- 04/12/2019 17:55:54 ART
-- ISSUE #129: Implementar comando apertura de cajón
UPDATE AD_Field_Trl SET Name='Tipo de Documento Cobro',Updated=TO_TIMESTAMP('2019-12-04 17:55:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000742 AND AD_Language='es_AR'
;

-- 04/12/2019 17:57:37 ART
-- ISSUE #129: Implementar comando apertura de cajón
UPDATE AD_Field_Trl SET Name='Genera Percepción',Updated=TO_TIMESTAMP('2019-12-04 17:57:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000087 AND AD_Language='es_AR'
;

-- Registración de script
SELECT register_migration_script_lar('0146_ISSUE-129.sql', 'LAR', '')
;
