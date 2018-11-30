-- 26/11/2018 18:34:30 ART
-- ISSUE #80: Corrección validación de TenderType en Movimiento de Caja.
UPDATE AD_Val_Rule SET Code='AD_Ref_List.Value <> ''N'' AND AD_Ref_List.Value <> ''O'' AND AD_Ref_List.Value <> ''Y'' AND AD_Ref_List.Value <> ''A'' AND AD_Ref_List.Value <> ''C'' AND AD_Ref_List.Value <> ''D'' AND AD_Ref_List.Value <> ''K'' AND AD_Ref_List.Value <> ''T'' AND AD_Ref_List.Value <> ''R''',Updated=TO_TIMESTAMP('2018-11-26 18:34:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000039
;

-- Registración de script
SELECT register_migration_script_lar('0121_ISSUE-80.sql', 'LAR', '')
;
