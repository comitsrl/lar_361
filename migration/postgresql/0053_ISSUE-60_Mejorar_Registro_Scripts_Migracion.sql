-- 27/06/2013 15:09:14 ART
-- ISSUE 60: Mejorar registro de scripts de migración
ALTER TABLE AD_System ADD COLUMN LastMigrationScriptAppliedLAR CHARACTER VARYING(255)
;

-- 27/06/2013 15:09:14 ART
-- ISSUE 60: Mejorar registro de scripts de migración
ALTER TABLE AD_System ADD COLUMN LastMigrationScriptAppliedLARC CHARACTER VARYING(255)
;

-- 27/06/2013 15:09:14 ART
-- ISSUE 60: Mejorar registro de scripts de migración
CREATE OR REPLACE FUNCTION adempiere.register_migration_script_lar(p_script      character varying
                                                                 , p_projectname character varying
                                                                 , p_reference   character varying)
 RETURNS character varying
 LANGUAGE plpgsql
AS $function$
DECLARE
    v_return CHARACTER VARYING;
    v_scriptid INTEGER;
BEGIN
    v_return := p_script || ' successfully registered';
    IF p_projectname = 'LAR' THEN
        UPDATE AD_System
          SET LastMigrationScriptAppliedLAR=p_script
        WHERE LastMigrationScriptAppliedLAR<p_script
           OR LastMigrationScriptAppliedLAR IS NULL;
    ELSE
        UPDATE AD_System
          SET LastMigrationScriptAppliedLARC=p_script
        WHERE LastMigrationScriptAppliedLARC<p_script
           OR LastMigrationScriptAppliedLARC IS NULL;
    END IF;
    SELECT MAX(AD_MigrationScript_ID)
      INTO v_scriptid
      FROM AD_MigrationScript
     WHERE Name = p_script;
    IF (v_scriptid IS NULL)
    THEN
        INSERT INTO ad_migrationscript
            (isapply, scriptroll,
             status, projectname, releaseno, reference,
             name, filename, ad_client_id,
             ad_org_id, created, createdby,
             updated, updatedby, isactive,
             ad_migrationscript_id)
        VALUES
            ('Y', 'N',
             'CO', p_projectname, (select releaseno from ad_system),p_reference,
             p_script, 'postgresql/'||p_script, 0,
             0, now(), 100,
             now(), 100, 'Y',
             nextidfunc(53081,'N'));
    ELSE
        v_return := p_script || ' was already applied';
        RAISE NOTICE '%', v_return;
        UPDATE ad_migrationscript
           SET updated=now(), description = COALESCE(description, ' ') || ' reapplied'
         WHERE ad_migrationscript_id = v_scriptid;
    END IF;
    RETURN v_return;
END;
$function$
;

-- 27/06/2013 23:08:48 ART
-- Minor Changes to Drawer Closing Window
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000148,'lastmigrationscriptappliedlar','LAR','lastmigrationscriptappliedlar','lastmigrationscriptappliedlar',0,TO_TIMESTAMP('2013-06-27 23:08:46','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2013-06-27 23:08:46','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 27/06/2013 23:08:48 ART
-- Minor Changes to Drawer Closing Window
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000148 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 27/06/2013 23:08:49 ART
-- Minor Changes to Drawer Closing Window
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000849,531,'LAR',0,'N','N','N','N',255,'N',10,'N',3000148,'N','Y','N','lastmigrationscriptappliedlar','lastmigrationscriptappliedlar',100,TO_TIMESTAMP('2013-06-27 23:08:46','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2013-06-27 23:08:46','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/06/2013 23:08:49 ART
-- Minor Changes to Drawer Closing Window
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000849 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/06/2013 23:08:49 ART
-- Minor Changes to Drawer Closing Window
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000149,'lastmigrationscriptappliedlarc','LAR','lastmigrationscriptappliedlarc','lastmigrationscriptappliedlarc',0,TO_TIMESTAMP('2013-06-27 23:08:49','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2013-06-27 23:08:49','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 27/06/2013 23:08:49 ART
-- Minor Changes to Drawer Closing Window
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000149 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 27/06/2013 23:08:50 ART
-- Minor Changes to Drawer Closing Window
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000850,531,'LAR',0,'N','N','N','N',255,'N',10,'N',3000149,'N','Y','N','lastmigrationscriptappliedlarc','lastmigrationscriptappliedlarc',100,TO_TIMESTAMP('2013-06-27 23:08:49','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2013-06-27 23:08:49','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/06/2013 23:08:50 ART
-- Minor Changes to Drawer Closing Window
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000850 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/06/2013 23:10:31 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Element SET ColumnName='LastMigrationScriptAppliedLAR', Name='LastMigrationScriptAppliedLAR', PrintName='LastMigrationScriptAppliedLAR',Updated=TO_TIMESTAMP('2013-06-27 23:10:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000148
;

-- 27/06/2013 23:10:31 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000148
;

-- 27/06/2013 23:10:31 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Column SET ColumnName='LastMigrationScriptAppliedLAR', Name='LastMigrationScriptAppliedLAR', Description=NULL, Help=NULL WHERE AD_Element_ID=3000148
;

-- 27/06/2013 23:10:31 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Process_Para SET ColumnName='LastMigrationScriptAppliedLAR', Name='LastMigrationScriptAppliedLAR', Description=NULL, Help=NULL, AD_Element_ID=3000148 WHERE UPPER(ColumnName)='LASTMIGRATIONSCRIPTAPPLIEDLAR' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 27/06/2013 23:10:31 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Process_Para SET ColumnName='LastMigrationScriptAppliedLAR', Name='LastMigrationScriptAppliedLAR', Description=NULL, Help=NULL WHERE AD_Element_ID=3000148 AND IsCentrallyMaintained='Y'
;

-- 27/06/2013 23:10:31 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Field SET Name='LastMigrationScriptAppliedLAR', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000148) AND IsCentrallyMaintained='Y'
;

-- 27/06/2013 23:10:31 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_PrintFormatItem SET PrintName='LastMigrationScriptAppliedLAR', Name='LastMigrationScriptAppliedLAR' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000148)
;

-- 27/06/2013 23:11:18 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Column SET Name='Last Migration Script Applied LAR',Updated=TO_TIMESTAMP('2013-06-27 23:11:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000849
;

-- 27/06/2013 23:11:18 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3000849
;

-- 27/06/2013 23:11:18 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Field SET Name='Last Migration Script Applied LAR', Description=NULL, Help=NULL WHERE AD_Column_ID=3000849 AND IsCentrallyMaintained='Y'
;

-- 27/06/2013 23:11:51 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Column_Trl SET Name='Último script de migración aplicado (LAR)',Updated=TO_TIMESTAMP('2013-06-27 23:11:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000849 AND AD_Language='es_AR'
;

-- 27/06/2013 23:12:27 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Element SET ColumnName='LastMigrationScriptAppliedLARC', Name='LastMigrationScriptAppliedLARC', PrintName='LastMigrationScriptAppliedLARC',Updated=TO_TIMESTAMP('2013-06-27 23:12:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000149
;

-- 27/06/2013 23:12:27 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000149
;

-- 27/06/2013 23:12:27 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Column SET ColumnName='LastMigrationScriptAppliedLARC', Name='LastMigrationScriptAppliedLARC', Description=NULL, Help=NULL WHERE AD_Element_ID=3000149
;

-- 27/06/2013 23:12:27 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Process_Para SET ColumnName='LastMigrationScriptAppliedLARC', Name='LastMigrationScriptAppliedLARC', Description=NULL, Help=NULL, AD_Element_ID=3000149 WHERE UPPER(ColumnName)='LASTMIGRATIONSCRIPTAPPLIEDLARC' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 27/06/2013 23:12:27 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Process_Para SET ColumnName='LastMigrationScriptAppliedLARC', Name='LastMigrationScriptAppliedLARC', Description=NULL, Help=NULL WHERE AD_Element_ID=3000149 AND IsCentrallyMaintained='Y'
;

-- 27/06/2013 23:12:27 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Field SET Name='LastMigrationScriptAppliedLARC', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000149) AND IsCentrallyMaintained='Y'
;

-- 27/06/2013 23:12:27 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_PrintFormatItem SET PrintName='LastMigrationScriptAppliedLARC', Name='LastMigrationScriptAppliedLARC' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000149)
;

-- 27/06/2013 23:13:04 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Column SET Name='Last Migration Script Applied LAR Custom',Updated=TO_TIMESTAMP('2013-06-27 23:13:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000850
;

-- 27/06/2013 23:13:04 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3000850
;

-- 27/06/2013 23:13:04 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Field SET Name='Last Migration Script Applied LAR Custom', Description=NULL, Help=NULL WHERE AD_Column_ID=3000850 AND IsCentrallyMaintained='Y'
;

-- 27/06/2013 23:13:45 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Column_Trl SET Name='Último script de migración aplicado (LAR Personlizado)',Updated=TO_TIMESTAMP('2013-06-27 23:13:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000850 AND AD_Language='es_AR'
;

-- 27/06/2013 23:14:10 ART
-- Minor Changes to Drawer Closing Window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001292,255,'Y','N','N',3000849,'N','Y',440,'N','LAR','LastMigrationScriptAppliedLAR',100,0,TO_TIMESTAMP('2013-06-27 23:14:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2013-06-27 23:14:09','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/06/2013 23:14:10 ART
-- Minor Changes to Drawer Closing Window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001292 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/06/2013 23:14:10 ART
-- Minor Changes to Drawer Closing Window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001293,255,'Y','N','N',3000850,'N','Y',440,'N','LAR','LastMigrationScriptAppliedLARC',100,0,TO_TIMESTAMP('2013-06-27 23:14:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2013-06-27 23:14:10','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/06/2013 23:14:10 ART
-- Minor Changes to Drawer Closing Window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001293 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/06/2013 23:14:52 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Field SET Name='Last Migration Script Applied LAR',Updated=TO_TIMESTAMP('2013-06-27 23:14:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001292
;

-- 27/06/2013 23:14:52 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Field_Trl SET IsTranslated='N' WHERE AD_Field_ID=3001292
;

-- 27/06/2013 23:15:05 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Field_Trl SET IsTranslated='N',Name='Último script de migración aplicado (LAR)',Updated=TO_TIMESTAMP('2013-06-27 23:15:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001292 AND AD_Language='es_AR'
;

-- 27/06/2013 23:15:29 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Field SET Name='Last Migration Script Applied LAR Custom',Updated=TO_TIMESTAMP('2013-06-27 23:15:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001293
;

-- 27/06/2013 23:15:29 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Field_Trl SET IsTranslated='N' WHERE AD_Field_ID=3001293
;

-- 27/06/2013 23:15:42 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Field_Trl SET IsTranslated='N',Name='Último script de migración aplicado (LAR Personalizado)',Updated=TO_TIMESTAMP('2013-06-27 23:15:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001293 AND AD_Language='es_AR'
;

-- 27/06/2013 23:17:39 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Field SET SeqNo=300,Updated=TO_TIMESTAMP('2013-06-27 23:17:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001292
;

-- 27/06/2013 23:17:45 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Field SET SeqNo=301,Updated=TO_TIMESTAMP('2013-06-27 23:17:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001293
;

SELECT register_migration_script_lar('0053_ISSUE-60_Mejorar_Registro_Scripts_Migracion.sql','LAR','');
