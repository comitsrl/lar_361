-- View: adempiere.m_inout_candidate_v

-- DROP VIEW adempiere.m_inout_candidate_v;

CREATE OR REPLACE VIEW adempiere.m_inout_candidate_v
 AS
 SELECT o.ad_client_id,
    o.ad_org_id,
    o.c_bpartner_id,
    o.c_order_id,
    o.documentno,
    o.dateordered,
    o.c_doctype_id,
    o.poreference,
    o.description,
    o.salesrep_id,
    l.m_warehouse_id,
    sum((l.qtyordered - l.qtydelivered) * l.priceactual) AS totallines
   FROM c_order o
     JOIN c_orderline l ON o.c_order_id = l.c_order_id
  WHERE o.docstatus = 'CO'::bpchar AND o.isdelivered = 'N'::bpchar AND (o.c_doctype_id IN ( SELECT c_doctype.c_doctype_id
           FROM c_doctype
          WHERE c_doctype.docbasetype = 'SOO'::bpchar AND (c_doctype.docsubtypeso <> ALL (ARRAY['ON'::bpchar, 'OB'::bpchar, 'WI'::bpchar, 'RM'::bpchar])))) AND o.deliveryrule <> 'M'::bpchar AND (l.m_product_id IS NULL OR (EXISTS ( SELECT 1
           FROM m_product p
          WHERE l.m_product_id = p.m_product_id AND p.isexcludeautodelivery = 'N'::bpchar))) AND l.qtyordered <> l.qtydelivered AND (l.m_product_id IS NOT NULL OR l.c_charge_id IS NOT NULL) AND NOT (EXISTS ( SELECT 1
           FROM m_inoutline iol
             JOIN m_inout io ON iol.m_inout_id = io.m_inout_id
          WHERE iol.c_orderline_id = l.c_orderline_id AND (io.docstatus = ANY (ARRAY['IP'::bpchar, 'WC'::bpchar]))))
  GROUP BY o.ad_client_id, o.ad_org_id, o.c_bpartner_id, o.c_order_id, o.documentno, o.dateordered, o.c_doctype_id, o.poreference, o.description, o.salesrep_id, l.m_warehouse_id;

ALTER TABLE adempiere.m_inout_candidate_v
    OWNER TO adempiere;

ALTER TABLE C_Order ADD COLUMN A_Reparto character(1) COLLATE pg_catalog."default" NOT NULL DEFAULT 'N'::bpchar;
ALTER TABLE C_Order ADD CONSTRAINT c_order_a_reparto_check CHECK (a_reparto = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]));
ALTER TABLE C_OrderLine ADD COLUMN Cant_Reparto numeric NOT NULL DEFAULT 0;

-- 14/08/2024 9:09:13 ART
-- ISSUE #126: Funcionalidad de Reparto/Entrega Diferida.
INSERT INTO AD_ModelValidator (ModelValidationClass,EntityType,AD_ModelValidator_ID,SeqNo,Name,CreatedBy,AD_Client_ID,AD_Org_ID,Created,Updated,UpdatedBy,IsActive) VALUES ('ar.com.ergio.model.LAR_ValidatorOrder','LAR',3000008,0,'Model Validator para Localizacion Argentina (Ordenes)',100,0,0,TO_TIMESTAMP('2024-08-14 09:09:12','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2024-08-14 09:09:12','YYYY-MM-DD HH24:MI:SS'),100,'Y')
;

-- 13/10/2017 16:48:49 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000470,'a_reparto','LAR','a_reparto','a_reparto',0,TO_TIMESTAMP('2017-10-13 16:48:49','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2017-10-13 16:48:49','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 13/10/2017 16:48:49 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000470 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 13/10/2017 16:48:50 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3002130,259,'LAR',0,'Y','N','N','N',1,'N',20,'N',3000470,'N','Y','N','a_reparto','a_reparto',TO_TIMESTAMP('2017-10-13 16:48:49','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2017-10-13 16:48:49','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 13/10/2017 16:48:50 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3002130 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 13/10/2017 16:49:34 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
UPDATE AD_Column SET Name='A Reparto', ColumnName='A_Reparto',Updated=TO_TIMESTAMP('2017-10-13 16:49:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002130
;

-- 13/10/2017 16:49:34 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3002130
;

-- 13/10/2017 16:49:34 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
UPDATE AD_Field SET Name='A Reparto', Description=NULL, Help=NULL WHERE AD_Column_ID=3002130 AND IsCentrallyMaintained='Y'
;

-- 13/10/2017 16:49:49 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
UPDATE AD_Element SET ColumnName='A_Reparto', Name='A Reparto', PrintName='A Reparto',Updated=TO_TIMESTAMP('2017-10-13 16:49:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000470
;

-- 13/10/2017 16:49:49 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000470
;

-- 13/10/2017 16:49:49 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
UPDATE AD_Column SET ColumnName='A_Reparto', Name='A Reparto', Description=NULL, Help=NULL WHERE AD_Element_ID=3000470
;

-- 13/10/2017 16:49:49 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
UPDATE AD_Process_Para SET ColumnName='A_Reparto', Name='A Reparto', Description=NULL, Help=NULL, AD_Element_ID=3000470 WHERE UPPER(ColumnName)='A_REPARTO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 13/10/2017 16:49:49 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
UPDATE AD_Process_Para SET ColumnName='A_Reparto', Name='A Reparto', Description=NULL, Help=NULL WHERE AD_Element_ID=3000470 AND IsCentrallyMaintained='Y'
;

-- 13/10/2017 16:49:49 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
UPDATE AD_Field SET Name='A Reparto', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000470) AND IsCentrallyMaintained='Y'
;

-- 13/10/2017 16:49:49 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
UPDATE AD_PrintFormatItem SET PrintName='A Reparto', Name='A Reparto' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000470)
;

-- 13/10/2017 16:49:54 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
UPDATE AD_Element_Trl SET Name='A Reparto',PrintName='A Reparto',Updated=TO_TIMESTAMP('2017-10-13 16:49:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000470 AND AD_Language='es_AR'
;

-- 13/10/2017 16:50:02 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
UPDATE AD_Column_Trl SET Name='A Reparto',Updated=TO_TIMESTAMP('2017-10-13 16:50:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002130 AND AD_Language='es_AR'
;

-- 13/10/2017 16:50:18 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000471,'cant_reparto','LAR','cant_reparto','cant_reparto',0,TO_TIMESTAMP('2017-10-13 16:50:18','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2017-10-13 16:50:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 13/10/2017 16:50:18 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000471 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 13/10/2017 16:50:18 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3002131,260,'LAR',0,'Y','N','N','N',131089,'N',22,'N',3000471,'N','Y','N','cant_reparto','cant_reparto',TO_TIMESTAMP('2017-10-13 16:50:18','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2017-10-13 16:50:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 13/10/2017 16:50:18 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3002131 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 13/10/2017 16:50:57 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
UPDATE AD_Column SET Name='Cant. a Reparto', ColumnName='Cant_Reparto',Updated=TO_TIMESTAMP('2017-10-13 16:50:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002131
;

-- 13/10/2017 16:50:57 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3002131
;

-- 13/10/2017 16:50:57 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
UPDATE AD_Field SET Name='Cant. a Reparto', Description=NULL, Help=NULL WHERE AD_Column_ID=3002131 AND IsCentrallyMaintained='Y'
;

-- 13/10/2017 16:51:09 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
UPDATE AD_Column SET AD_Reference_ID=29,Updated=TO_TIMESTAMP('2017-10-13 16:51:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002131
;

-- 13/10/2017 16:51:21 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
UPDATE AD_Column_Trl SET Name='Cant. a Reparto',Updated=TO_TIMESTAMP('2017-10-13 16:51:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002131 AND AD_Language='es_AR'
;

-- 13/10/2017 16:51:36 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
UPDATE AD_Element SET ColumnName='Cant_Reparto', Name='Cant. a Reparto', PrintName='Cant. a Reparto',Updated=TO_TIMESTAMP('2017-10-13 16:51:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000471
;

-- 13/10/2017 16:51:36 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000471
;

-- 13/10/2017 16:51:36 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
UPDATE AD_Column SET ColumnName='Cant_Reparto', Name='Cant. a Reparto', Description=NULL, Help=NULL WHERE AD_Element_ID=3000471
;

-- 13/10/2017 16:51:36 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
UPDATE AD_Process_Para SET ColumnName='Cant_Reparto', Name='Cant. a Reparto', Description=NULL, Help=NULL, AD_Element_ID=3000471 WHERE UPPER(ColumnName)='CANT_REPARTO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 13/10/2017 16:51:36 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
UPDATE AD_Process_Para SET ColumnName='Cant_Reparto', Name='Cant. a Reparto', Description=NULL, Help=NULL WHERE AD_Element_ID=3000471 AND IsCentrallyMaintained='Y'
;

-- 13/10/2017 16:51:36 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
UPDATE AD_Field SET Name='Cant. a Reparto', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000471) AND IsCentrallyMaintained='Y'
;

-- 13/10/2017 16:51:36 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
UPDATE AD_PrintFormatItem SET PrintName='Cant. a Reparto', Name='Cant. a Reparto' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000471)
;

-- 13/10/2017 16:51:42 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
UPDATE AD_Element_Trl SET Name='Cant. a Reparto',PrintName='Cant. a Reparto',Updated=TO_TIMESTAMP('2017-10-13 16:51:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000471 AND AD_Language='es_AR'
;

-- 13/10/2017 16:52:50 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003392,1,'Y','N','N',3002130,'N','Y',186,'N','LAR','A Reparto',100,0,'Y',TO_TIMESTAMP('2017-10-13 16:52:50','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-10-13 16:52:50','YYYY-MM-DD HH24:MI:SS'))
;

-- 13/10/2017 16:52:50 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003392 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 13/10/2017 17:03:01 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003393,131089,'Y','N','N',3002131,'N','Y',187,'N','LAR','Cant. a Reparto',100,0,'Y',TO_TIMESTAMP('2017-10-13 17:03:01','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-10-13 17:03:01','YYYY-MM-DD HH24:MI:SS'))
;

-- 13/10/2017 17:03:01 ART
-- BUG #362: Marcar a Reparto una OV desde el POS
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003393 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/08/2024 10:06:10 ART
-- ISSUE #126: Funcionalidad de Reparto/Entrega Diferida.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3003392
;

-- 14/08/2024 10:06:21 ART
-- ISSUE #126: Funcionalidad de Reparto/Entrega Diferida.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3003393
;

-- 14/08/2024 10:13:16 ART
-- ISSUE #126: Funcionalidad de Reparto/Entrega Diferida.
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('(M_Warehouse.AD_Org_ID IN (SELECT AD_Org_ID FROM AD_OrgInfo WHERE IsMiles=''N'')','S',3000148,'LAR','M_Warehouse - No Miles',100,100,TO_TIMESTAMP('2024-08-14 10:13:16','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_TIMESTAMP('2024-08-14 10:13:16','YYYY-MM-DD HH24:MI:SS'))
;

-- 14/08/2024 10:13:38 ART
-- ISSUE #126: Funcionalidad de Reparto/Entrega Diferida.
UPDATE AD_Column SET AD_Val_Rule_ID=3000148,Updated=TO_TIMESTAMP('2024-08-14 10:13:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=2223
;

-- 14/08/2024 10:17:04 ART
-- ISSUE #126: Funcionalidad de Reparto/Entrega Diferida.
UPDATE AD_Column SET AD_Val_Rule_ID=NULL,Updated=TO_TIMESTAMP('2024-08-14 10:17:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=2223
;

-- 14/08/2024 10:18:00 ART
-- ISSUE #126: Funcionalidad de Reparto/Entrega Diferida.
UPDATE AD_Val_Rule SET Code='(M_Warehouse.AD_Org_ID IN (SELECT AD_Org_ID FROM AD_OrgInfo WHERE IsMiles=''N''))',Updated=TO_TIMESTAMP('2024-08-14 10:18:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000148
;

-- 14/08/2024 10:18:06 ART
-- ISSUE #126: Funcionalidad de Reparto/Entrega Diferida.
UPDATE AD_Column SET AD_Val_Rule_ID=3000148,Updated=TO_TIMESTAMP('2024-08-14 10:18:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=2223
;

-- Registración de script
SELECT register_migration_script_lar('0227_ISSUE-167.sql', 'LAR', '')
;
