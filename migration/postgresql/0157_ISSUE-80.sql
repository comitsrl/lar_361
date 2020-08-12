ALTER TABLE LAR_ConceptoCaja ADD COLUMN C_Charge_ID numeric(10,0);

ALTER TABLE LAR_ConceptoCaja ADD CONSTRAINT ccharge_larconceptocaja FOREIGN KEY (C_Charge_ID)
      REFERENCES C_Charge (C_Charge_ID) MATCH SIMPLE;

-- 10/08/2020 18:57:23 ART
-- BUG #530: Contabilidad Liquidación Socios
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003674,3000080,'LAR',0,'N','N','N','The Charge indicates a type of Charge (Handling, Shipping, Restocking)','N',10,'N',19,'N',968,'N','Y','N','Additional document charges','Charge','C_Charge_ID',100,TO_TIMESTAMP('2020-08-10 18:57:22','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2020-08-10 18:57:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/08/2020 18:57:23 ART
-- BUG #530: Contabilidad Liquidación Socios
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003674 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 10/08/2020 18:58:09 ART
-- BUG #530: Contabilidad Liquidación Socios
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006908,10,'Y','N','N',3003674,'N','Y',3000126,'N','The Charge indicates a type of Charge (Handling, Shipping, Restocking)','LAR','Additional document charges','Charge',100,0,TO_TIMESTAMP('2020-08-10 18:58:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2020-08-10 18:58:09','YYYY-MM-DD HH24:MI:SS'))
;

-- 10/08/2020 18:58:09 ART
-- BUG #530: Contabilidad Liquidación Socios
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006908 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/08/2020 18:59:25 ART
-- BUG #530: Contabilidad Liquidación Socios
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3006908
;

-- 10/08/2020 18:59:25 ART
-- BUG #530: Contabilidad Liquidación Socios
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3002735
;

-- 10/08/2020 18:59:25 ART
-- BUG #530: Contabilidad Liquidación Socios
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3002732
;

-- Registración de script
SELECT register_migration_script_lar('0157_ISSUE-80.sql', 'LAR', '')
;
