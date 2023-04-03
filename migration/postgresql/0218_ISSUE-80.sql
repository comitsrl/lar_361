ALTER TABLE C_Payment ADD COLUMN LAR_TerminalPosnet_ID numeric(10,0);
ALTER TABLE C_Payment ADD CONSTRAINT LARTerminalPosnet_cpayment FOREIGN KEY (LAR_TerminalPosnet_ID)
        REFERENCES adempiere.LAR_TerminalPosnet (LAR_TerminalPosnet_ID) MATCH SIMPLE;

-- 28/02/2023 20:56:56 ART
-- ISSUE #80: Terminal Posnet en Recibos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005536,335,'LAR',0,'N','N','N','N',10,'N',19,'N',3001353,'N','Y','N','Terminal Posnet','LAR_TerminalPosnet_ID',TO_TIMESTAMP('2023-02-28 20:56:56','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2023-02-28 20:56:56','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/02/2023 20:56:56 ART
-- ISSUE #80: Terminal Posnet en Recibos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005536 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/02/2023 20:58:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008181,10,'Y','N','N',3005536,'N','Y',3000013,'N','LAR','Terminal Posnet',100,0,'Y',TO_TIMESTAMP('2023-02-28 20:58:17','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-02-28 20:58:17','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/02/2023 20:58:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008181 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3008179
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3008180
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3008181
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3000327
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3000323
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3007070
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3003009
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3000330
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3002719
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000339
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3002720
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000329
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3002803
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000331
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3006614
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000335
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3005289
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000348
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000349
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000350
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000351
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000352
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3001624
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000318
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000321
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000319
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000320
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3007397
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000322
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000886
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000888
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000324
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000353
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000325
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3007322
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000354
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000355
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000357
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000358
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000359
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000360
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000363
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000302
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000364
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000362
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000289
;

-- 28/02/2023 20:58:43 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000366
;

-- 28/02/2023 20:59:05 ART
-- ISSUE #80: Terminal Posnet en Recibos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3008184,10,'Y','N','N',3005536,'N','Y',3000016,'N','LAR','Terminal Posnet',100,0,'Y',TO_TIMESTAMP('2023-02-28 20:59:05','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2023-02-28 20:59:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/02/2023 20:59:05 ART
-- ISSUE #80: Terminal Posnet en Recibos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008184 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3008182
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3008183
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3008184
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3003311
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000453
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3002769
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3002770
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3002806
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000454
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000459
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000460
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000461
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000462
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000463
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000464
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000465
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000466
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000467
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000468
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000469
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000470
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000471
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000472
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000473
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000474
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000475
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000476
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000477
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000478
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000479
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000480
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000481
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000482
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000483
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000484
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000492
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000490
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000489
;

-- 28/02/2023 20:59:17 ART
-- ISSUE #80: Terminal Posnet en Recibos
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000491
;

-- Registración de script
SELECT register_migration_script_lar('0218_ISSUE-80.sql', 'LAR', '')
;
