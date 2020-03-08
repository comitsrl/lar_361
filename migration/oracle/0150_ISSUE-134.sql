ALTER TABLE C_BPartner_Location
ADD COLUMN m_shipper_id numeric(10,0),
ADD CONSTRAINT mshipper_cbpartnerlocation FOREIGN KEY (m_shipper_id)
      REFERENCES m_shipper (m_shipper_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED
;

-- 07/03/2020 19:24:11 ART
-- ISSUE #134: Transportistas por dirección
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003581,293,'LAR',0,'N','N','N','The Shipper indicates the method of delivering product','N',10,'N',19,'N',455,'N','Y','N','Method or manner of product delivery','Shipper','M_Shipper_ID',100,TO_DATE('2020-03-07 19:24:10','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2020-03-07 19:24:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 07/03/2020 19:24:11 ART
-- ISSUE #134: Transportistas por dirección
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003581 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 07/03/2020 19:30:48 ART
-- ISSUE #134: Transportistas por dirección
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006679,10,'Y','N','N',3003581,'N','Y',222,'N','The Shipper indicates the method of delivering product','LAR','Method or manner of product delivery','Shipper',100,0,TO_DATE('2020-03-07 19:30:48','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2020-03-07 19:30:48','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 07/03/2020 19:30:48 ART
-- ISSUE #134: Transportistas por dirección
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006679 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 07/03/2020 20:22:37 ART
-- ISSUE #134: Transportistas por dirección
UPDATE AD_Field SET DisplayLogic=NULL,Updated=TO_DATE('2020-03-07 20:22:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3447
;

-- 08/03/2020 11:04:51 ART
-- ISSUE #134: Transportistas por dirección
UPDATE AD_Column SET Callout='org.compiere.model.CalloutOrder.bPartnerBillChange',Updated=TO_DATE('2020-03-08 11:04:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=8766
;

-- Registración de script
SELECT register_migration_script_lar('0150_ISSUE-134.sql', 'LAR', '') FROM dual
;
