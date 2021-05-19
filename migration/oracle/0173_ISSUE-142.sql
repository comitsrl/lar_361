-- 18/05/2021 21:37:52 ART
-- ISSUE #142: Validaciones en ventana Entrega Cliente.
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('(IsSOTrx=''@IsSOTrx@'' AND DocStatus=''CO'' AND IsDelivered=''N'')','S',3000090,'LAR','LAR_C_Order in M_InOut (Completa, de Venta y No entregada)',100,100,TO_DATE('2021-05-18 21:37:51','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_DATE('2021-05-18 21:37:51','YYYY-MM-DD HH24:MI:SS'))
;

-- 18/05/2021 21:39:31 ART
-- ISSUE #142: Validaciones en ventana Entrega Cliente.
UPDATE AD_Field SET AD_Reference_ID=30, AD_Val_Rule_ID=3000090,Updated=TO_DATE('2021-05-18 21:39:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2932
;

-- Registración de script
SELECT register_migration_script_lar('0173_ISSUE-142.sql', 'LAR', '') FROM dual
;
