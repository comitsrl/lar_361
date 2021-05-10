-- Se agrega la marca al Remito Autorización Manual de COT
ALTER TABLE M_InOut
    ADD COLUMN EsCOTManual character(1) NOT NULL DEFAULT 'N'::bpchar,
    ADD CONSTRAINT m_inout_EsCOTManual_check CHECK (EsCOTManual = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
;

-- 09/05/2021 12:14:45 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic=NULL,Updated=TO_DATE('2021-05-09 12:14:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007004
;

-- 09/05/2021 13:10:19 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007038,60,'Y','N','N',3003728,'N','Y',257,'N','LAR','Codigo de Integridad COT',100,0,TO_DATE('2021-05-09 13:10:18','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-05-09 13:10:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/05/2021 13:10:19 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007038 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/05/2021 13:10:19 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007039,255,'Y','N','N',3003730,'N','Y',257,'N','LAR','Error COT',100,0,TO_DATE('2021-05-09 13:10:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-05-09 13:10:19','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/05/2021 13:10:19 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007039 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/05/2021 13:10:19 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007040,30,'Y','N','N',3003729,'N','Y',257,'N','LAR','Número de Comprobante COT',100,0,TO_DATE('2021-05-09 13:10:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-05-09 13:10:19','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/05/2021 13:10:19 ART
-- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007040 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/05/2021 13:11:23 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3007007
;

-- 09/05/2021 13:11:23 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3007014
;

-- 09/05/2021 13:11:23 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3007011
;

-- 09/05/2021 13:11:23 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3007012
;

-- 09/05/2021 13:11:23 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3007013
;

-- 09/05/2021 13:11:23 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3007008
;

-- 09/05/2021 13:11:23 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3007010
;

-- 09/05/2021 13:11:23 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3007004
;

-- 09/05/2021 13:11:23 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3007009
;

-- 09/05/2021 13:11:23 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3007039
;

-- 09/05/2021 13:11:23 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3007038
;

-- 09/05/2021 13:11:23 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3007040
;

-- 09/05/2021 13:13:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007038
;

-- 09/05/2021 13:13:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=10568
;

-- 09/05/2021 13:13:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001593
;

-- 09/05/2021 13:13:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001592
;

-- 09/05/2021 13:13:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007040
;

-- 09/05/2021 13:13:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=5143
;

-- 09/05/2021 13:14:43 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=10369
;

-- 09/05/2021 13:14:43 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=9463
;

-- 09/05/2021 13:14:43 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3280
;

-- 09/05/2021 13:14:43 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3281
;

-- 09/05/2021 13:14:43 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=5143
;

-- 09/05/2021 13:15:04 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2021-05-09 13:15:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=9462
;

-- 09/05/2021 13:15:38 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET Name='Fecha de Recepción',PrintName='Fecha de Recepción',Updated=TO_DATE('2021-05-09 13:15:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=1324 AND AD_Language='es_AR'
;

-- 09/05/2021 13:17:46 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=55431
;

-- 09/05/2021 13:17:46 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=55430
;

-- 09/05/2021 13:17:46 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=55419
;

-- 09/05/2021 13:17:46 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=55429
;

-- 09/05/2021 13:17:46 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=4243
;

-- 09/05/2021 13:17:46 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=2930
;

-- 09/05/2021 13:17:46 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=2933
;

-- 09/05/2021 13:17:46 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=7831
;

-- 09/05/2021 13:17:46 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=7829
;

-- 09/05/2021 13:17:46 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=7830
;

-- 09/05/2021 13:17:46 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=7832
;

-- 09/05/2021 13:17:46 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=7828
;

-- 09/05/2021 13:17:46 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=7827
;

-- 09/05/2021 13:17:46 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=2707
;

-- 09/05/2021 13:17:46 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3280
;

-- 09/05/2021 13:17:46 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3281
;

-- 09/05/2021 13:17:46 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=9462
;

-- 09/05/2021 13:17:46 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=5143
;

-- 09/05/2021 13:19:12 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET Name='Fecha de Retiro',PrintName='Fecha de Retiro',Description='Fecha en la que se retiró la mercadería.',Updated=TO_DATE('2021-05-09 13:19:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=2117 AND AD_Language='es_AR'
;

-- 09/05/2021 13:19:24 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2021-05-09 13:19:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=6877
;

-- 09/05/2021 13:20:43 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field_Trl SET Name='Fecha Aut. COT',Description='Fecha en la que se solicita el Código de Operaciones de Traslado.',Updated=TO_DATE('2021-05-09 13:20:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=6877 AND AD_Language='es_AR'
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=2940
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=2937
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=6541
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=2943
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=10379
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=6880
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=6879
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=6878
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=2939
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=4242
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3007007
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3007014
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3007011
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3007012
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3007013
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3007008
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3007010
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=6877
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3007004
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3007009
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3007039
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=4243
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=2930
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=2933
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=7831
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=7829
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=7830
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=7832
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=7828
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=7827
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=2707
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3280
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3281
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=9462
;

-- 09/05/2021 13:21:49 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=5143
;

-- 09/05/2021 13:22:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2021-05-09 13:22:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007004
;

-- 09/05/2021 13:22:03 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2021-05-09 13:22:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=6877
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=2927
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=2944
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=2946
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=2936
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=6541
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=2943
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=10379
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=6880
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=6879
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=6878
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=2939
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=4242
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3007007
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3007014
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3007011
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3007012
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3007013
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3007008
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3007010
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=6877
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3007004
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3007009
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3007039
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=4243
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=2930
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=2933
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=7831
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=7829
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=7830
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=7832
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=7828
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=7827
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=2707
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3280
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3281
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=9462
;

-- 09/05/2021 13:24:51 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=5143
;

-- 09/05/2021 13:25:02 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2021-05-09 13:25:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=6541
;

-- 09/05/2021 13:29:36 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET DefaultValue='S',Updated=TO_DATE('2021-05-09 13:29:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3803
;

-- 09/05/2021 13:30:33 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=2705
;

-- 09/05/2021 13:30:33 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=2937
;

-- 09/05/2021 13:31:41 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Ref_List_Trl SET Name='Retiro en Depósito',Updated=TO_DATE('2021-05-09 13:31:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=222 AND AD_Language='es_AR'
;

-- 09/05/2021 13:33:03 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Ref_List_Trl SET Name='Retira en Depósito',Updated=TO_DATE('2021-05-09 13:33:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=222 AND AD_Language='es_AR'
;

-- 09/05/2021 13:33:11 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Ref_List_Trl SET Name='Retiro en Depósito',Updated=TO_DATE('2021-05-09 13:33:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=222 AND AD_Language='es_AR'
;

-- 09/05/2021 13:33:43 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Ref_List_Trl SET IsActive='N',Updated=TO_DATE('2021-05-09 13:33:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=223 AND AD_Language='es_AR'
;

-- 09/05/2021 13:34:22 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=2705
;

-- 09/05/2021 13:34:22 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=2937
;

-- 09/05/2021 13:37:25 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=2936
;

-- 09/05/2021 13:37:25 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=2937
;

-- 09/05/2021 13:43:36 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=6541
;

-- 09/05/2021 13:43:36 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=2944
;

-- 09/05/2021 13:43:36 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=2946
;

-- 09/05/2021 13:43:36 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=2937
;

-- 09/05/2021 13:43:42 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2021-05-09 13:43:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=6541
;

-- 09/05/2021 13:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=10379
;

-- 09/05/2021 13:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=6880
;

-- 09/05/2021 13:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=6879
;

-- 09/05/2021 13:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=6878
;

-- 09/05/2021 13:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=2939
;

-- 09/05/2021 13:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=4242
;

-- 09/05/2021 13:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3007007
;

-- 09/05/2021 13:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3007014
;

-- 09/05/2021 13:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3007011
;

-- 09/05/2021 13:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3007012
;

-- 09/05/2021 13:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3007013
;

-- 09/05/2021 13:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3007008
;

-- 09/05/2021 13:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3007010
;

-- 09/05/2021 13:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=6877
;

-- 09/05/2021 13:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3007004
;

-- 09/05/2021 13:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3007009
;

-- 09/05/2021 13:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3007039
;

-- 09/05/2021 13:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=4243
;

-- 09/05/2021 13:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=2930
;

-- 09/05/2021 13:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=2933
;

-- 09/05/2021 13:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=7831
;

-- 09/05/2021 13:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=7829
;

-- 09/05/2021 13:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=7830
;

-- 09/05/2021 13:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=7832
;

-- 09/05/2021 13:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=7828
;

-- 09/05/2021 13:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=7827
;

-- 09/05/2021 13:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=2707
;

-- 09/05/2021 13:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3280
;

-- 09/05/2021 13:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3281
;

-- 09/05/2021 13:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=9462
;

-- 09/05/2021 13:44:37 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=5143
;

-- 09/05/2021 13:45:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=6878
;

-- 09/05/2021 13:45:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=2939
;

-- 09/05/2021 13:45:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=4242
;

-- 09/05/2021 13:45:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3007007
;

-- 09/05/2021 13:45:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3007014
;

-- 09/05/2021 13:45:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3007011
;

-- 09/05/2021 13:45:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3007012
;

-- 09/05/2021 13:45:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3007013
;

-- 09/05/2021 13:45:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3007008
;

-- 09/05/2021 13:45:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3007010
;

-- 09/05/2021 13:45:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=6877
;

-- 09/05/2021 13:45:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3007004
;

-- 09/05/2021 13:45:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3007009
;

-- 09/05/2021 13:45:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3007039
;

-- 09/05/2021 13:45:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=4243
;

-- 09/05/2021 13:45:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=2930
;

-- 09/05/2021 13:45:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=2933
;

-- 09/05/2021 13:45:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=7831
;

-- 09/05/2021 13:45:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=7829
;

-- 09/05/2021 13:45:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=7830
;

-- 09/05/2021 13:45:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=7832
;

-- 09/05/2021 13:45:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=7828
;

-- 09/05/2021 13:45:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=7827
;

-- 09/05/2021 13:45:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=2707
;

-- 09/05/2021 13:45:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3280
;

-- 09/05/2021 13:45:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3281
;

-- 09/05/2021 13:45:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=9462
;

-- 09/05/2021 13:45:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=5143
;

-- 09/05/2021 13:47:18 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Ref_List_Trl SET Name='Transporte',Description='Se entrega la mercadría vía Transporte de cargas.',Updated=TO_DATE('2021-05-09 13:47:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=224 AND AD_Language='es_AR'
;

-- 09/05/2021 13:48:18 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Dominio',PrintName='Dominio',Updated=TO_DATE('2021-05-09 13:48:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001096 AND AD_Language='es_AR'
;

-- 09/05/2021 13:48:38 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Dominio Acoplado',PrintName='Dominio Acoplado',Updated=TO_DATE('2021-05-09 13:48:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001097 AND AD_Language='es_AR'
;

-- 09/05/2021 13:49:56 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=S',Updated=TO_DATE('2021-05-09 13:49:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007004
;

-- 09/05/2021 13:52:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_DATE('2021-05-09 13:52:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003702
;

-- 09/05/2021 13:53:23 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_DATE('2021-05-09 13:53:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003698
;

-- 09/05/2021 13:53:33 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_DATE('2021-05-09 13:53:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003697
;

-- 09/05/2021 13:54:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_DATE('2021-05-09 13:54:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3804
;

-- 09/05/2021 13:54:21 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_DATE('2021-05-09 13:54:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003701
;

-- 09/05/2021 13:55:19 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_DATE('2021-05-09 13:55:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=9334
;

-- 09/05/2021 13:55:38 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_DATE('2021-05-09 13:55:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003699
;

-- 09/05/2021 13:55:50 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_DATE('2021-05-09 13:55:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003696
;

-- 09/05/2021 13:57:29 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_DATE('2021-05-09 13:57:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=10789
;

-- 09/05/2021 13:59:32 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Ref_List_Trl SET Name='Entrega a Clientes',Updated=TO_DATE('2021-05-09 13:59:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=312 AND AD_Language='es_AR'
;

-- 09/05/2021 13:59:47 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Ref_List_Trl SET Name='Ingreso de Inventario',Updated=TO_DATE('2021-05-09 13:59:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=317 AND AD_Language='es_AR'
;

-- 09/05/2021 14:00:05 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Ref_List_Trl SET IsActive='N',Name='Movimiento hacia',Updated=TO_DATE('2021-05-09 14:00:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=350 AND AD_Language='es_AR'
;

-- 09/05/2021 14:00:07 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Ref_List_Trl SET IsActive='Y',Updated=TO_DATE('2021-05-09 14:00:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=350 AND AD_Language='es_AR'
;

-- 09/05/2021 14:00:17 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Ref_List_Trl SET Name='Movimiento Desde',Updated=TO_DATE('2021-05-09 14:00:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=349 AND AD_Language='es_AR'
;

-- 09/05/2021 14:01:01 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Ref_List_Trl SET Name='Remito del Proveedor',Updated=TO_DATE('2021-05-09 14:01:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=314 AND AD_Language='es_AR'
;

-- 09/05/2021 14:05:30 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ReadOnlyLogic=' @COT@!''''',Updated=TO_DATE('2021-05-09 14:05:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003692
;

-- 09/05/2021 14:09:28 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Ref_List_Trl SET IsActive='Y',Name='Entrega en Local',Updated=TO_DATE('2021-05-09 14:09:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=223 AND AD_Language='es_AR'
;

-- 09/05/2021 14:10:47 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET AD_Reference_ID=14, ReadOnlyLogic='1=1',Updated=TO_DATE('2021-05-09 14:10:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003730
;

-- 09/05/2021 14:11:33 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2021-05-09 14:11:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007009
;

-- 09/05/2021 14:13:19 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ReadOnlyLogic=' @COT@<>''''',Updated=TO_DATE('2021-05-09 14:13:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003692
;

-- 09/05/2021 14:13:43 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ReadOnlyLogic=' @COT@<>''''',Updated=TO_DATE('2021-05-09 14:13:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=9334
;

-- 09/05/2021 14:17:34 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ReadOnlyLogic=' @COT@!''''',Updated=TO_DATE('2021-05-09 14:17:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=9334
;

-- 09/05/2021 14:18:11 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET AD_Reference_ID=15,Updated=TO_DATE('2021-05-09 14:18:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=9334
;

-- 09/05/2021 14:19:16 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ReadOnlyLogic=' @COT@!""',Updated=TO_DATE('2021-05-09 14:19:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=9334
;

-- 09/05/2021 14:19:54 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ReadOnlyLogic=' !@COT@=""',Updated=TO_DATE('2021-05-09 14:19:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=9334
;

-- 09/05/2021 14:20:25 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_DATE('2021-05-09 14:20:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003700
;

-- 09/05/2021 14:21:14 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ReadOnlyLogic=NULL,Updated=TO_DATE('2021-05-09 14:21:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=9334
;

-- 09/05/2021 14:21:29 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ReadOnlyLogic=NULL,Updated=TO_DATE('2021-05-09 14:21:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003692
;

-- 09/05/2021 14:25:07 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ReadOnlyLogic='@COT@>0',Updated=TO_DATE('2021-05-09 14:25:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003697
;

-- 09/05/2021 14:26:27 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ReadOnlyLogic='@COT@>''1''',Updated=TO_DATE('2021-05-09 14:26:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003697
;

-- 09/05/2021 14:28:56 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ReadOnlyLogic=NULL,Updated=TO_DATE('2021-05-09 14:28:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003697
;

-- 09/05/2021 14:37:02 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsDisplayed='N',Updated=TO_DATE('2021-05-09 14:37:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=56906
;

-- 09/05/2021 14:37:27 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsDisplayed='N',Updated=TO_DATE('2021-05-09 14:37:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3272
;

-- 09/05/2021 14:37:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsDisplayed='N',Updated=TO_DATE('2021-05-09 14:37:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001993
;

-- 09/05/2021 14:39:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=56906
;

-- 09/05/2021 14:39:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001993
;

-- 09/05/2021 14:39:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3272
;

-- 09/05/2021 14:39:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=60972
;

-- 09/05/2021 14:39:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=60922
;

-- 09/05/2021 14:39:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001597
;

-- 09/05/2021 14:39:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=2112
;

-- 09/05/2021 14:39:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=2109
;

-- 09/05/2021 14:39:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3113
;

-- 09/05/2021 14:39:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=1099
;

-- 09/05/2021 14:39:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=2593
;

-- 09/05/2021 14:39:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=2589
;

-- 09/05/2021 14:39:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=1324
;

-- 09/05/2021 14:39:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=7038
;

-- 09/05/2021 14:39:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=7826
;

-- 09/05/2021 14:39:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=7825
;

-- 09/05/2021 14:39:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=1112
;

-- 09/05/2021 14:39:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=1113
;

-- 09/05/2021 14:39:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=1082
;

-- 09/05/2021 14:39:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=1083
;

-- 09/05/2021 14:39:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=1084
;

-- 09/05/2021 14:39:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=6560
;

-- 09/05/2021 14:39:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3660
;

-- 09/05/2021 14:39:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=2594
;

-- 09/05/2021 14:39:57 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=1090
;

-- 09/05/2021 14:40:09 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2021-05-09 14:40:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=1084
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=6562
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=6558
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=55412
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=55411
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=6561
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=6559
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=1572
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3002015
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=2590
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3006998
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=2877
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=1110
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=1114
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3003388
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=10124
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=55410
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=1108
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=1109
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3007026
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3007033
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3007030
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3007031
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3007032
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3007027
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3007029
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=2878
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=56446
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=1107
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=1104
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=1077
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=1103
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=8653
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3005559
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=1098
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=2112
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=2109
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3113
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=1099
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=2593
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=2589
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=1324
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=7038
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=7826
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=7825
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=1112
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=1113
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=1082
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=1083
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=1084
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=6560
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3660
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=2594
;

-- 09/05/2021 14:45:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=1090
;

-- 09/05/2021 14:45:21 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3006998
;

-- 09/05/2021 14:45:21 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=1094
;

-- 09/05/2021 14:45:21 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=1573
;

-- 09/05/2021 14:45:21 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=2590
;

-- 09/05/2021 14:47:43 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2021-05-09 14:47:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2590
;

-- 09/05/2021 14:48:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=1094
;

-- 09/05/2021 14:48:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=1573
;

-- 09/05/2021 14:48:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=2590
;

-- 09/05/2021 14:48:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3006998
;

-- 09/05/2021 14:48:33 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2021-05-09 14:48:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006998
;

-- 09/05/2021 14:50:00 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2021-05-09 14:50:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2594
;

-- 09/05/2021 17:31:52 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2021-05-09 17:31:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007027
;

-- 09/05/2021 17:31:55 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2021-05-09 17:31:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007029
;

-- 09/05/2021 17:32:07 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3007029
;

-- 09/05/2021 17:32:07 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3007027
;

-- 09/05/2021 17:32:22 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3007010
;

-- 09/05/2021 17:32:22 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3007008
;

-- 09/05/2021 17:32:31 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2021-05-09 17:32:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007010
;

-- 09/05/2021 17:32:35 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2021-05-09 17:32:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007008
;

-- 09/05/2021 17:32:46 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsDisplayed='N',Updated=TO_DATE('2021-05-09 17:32:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007008
;

-- 09/05/2021 17:33:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007027
;

-- 09/05/2021 17:33:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=2878
;

-- 09/05/2021 17:33:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=56446
;

-- 09/05/2021 17:33:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=1107
;

-- 09/05/2021 17:33:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=1104
;

-- 09/05/2021 17:33:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=1077
;

-- 09/05/2021 17:33:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=1103
;

-- 09/05/2021 17:33:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=8653
;

-- 09/05/2021 17:33:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3005559
;

-- 09/05/2021 17:33:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=1098
;

-- 09/05/2021 17:33:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=2112
;

-- 09/05/2021 17:33:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=2109
;

-- 09/05/2021 17:33:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3113
;

-- 09/05/2021 17:33:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=1099
;

-- 09/05/2021 17:33:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=2593
;

-- 09/05/2021 17:33:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=2589
;

-- 09/05/2021 17:33:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=1324
;

-- 09/05/2021 17:33:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=7038
;

-- 09/05/2021 17:33:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=7826
;

-- 09/05/2021 17:33:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=7825
;

-- 09/05/2021 17:33:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=1112
;

-- 09/05/2021 17:33:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=1113
;

-- 09/05/2021 17:33:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=1082
;

-- 09/05/2021 17:33:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=1083
;

-- 09/05/2021 17:33:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=1084
;

-- 09/05/2021 17:33:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=6560
;

-- 09/05/2021 17:33:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3660
;

-- 09/05/2021 17:33:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=2594
;

-- 09/05/2021 17:33:10 ART
-- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=1090
;

-- 09/05/2021 18:13:01 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001129,'escotmanual','LAR','escotmanual','escotmanual',0,TO_DATE('2021-05-09 18:13:01','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-05-09 18:13:01','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 09/05/2021 18:13:01 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001129 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 09/05/2021 18:13:01 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003912,319,'LAR',0,'Y','N','N','N',1,'N',20,'N',3001129,'N','Y','N','escotmanual','escotmanual',TO_DATE('2021-05-09 18:13:01','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2021-05-09 18:13:01','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/05/2021 18:13:01 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003912 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/05/2021 18:13:38 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element SET ColumnName='EsCOTManual', Name='EsCOTManual', PrintName='EsCOTManual',Updated=TO_DATE('2021-05-09 18:13:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001129
;

-- 09/05/2021 18:13:38 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001129
;

-- 09/05/2021 18:13:38 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ColumnName='EsCOTManual', Name='EsCOTManual', Description=NULL, Help=NULL WHERE AD_Element_ID=3001129
;

-- 09/05/2021 18:13:38 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='EsCOTManual', Name='EsCOTManual', Description=NULL, Help=NULL, AD_Element_ID=3001129 WHERE UPPER(ColumnName)='ESCOTMANUAL' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 09/05/2021 18:13:38 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='EsCOTManual', Name='EsCOTManual', Description=NULL, Help=NULL WHERE AD_Element_ID=3001129 AND IsCentrallyMaintained='Y'
;

-- 09/05/2021 18:13:38 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='EsCOTManual', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001129) AND IsCentrallyMaintained='Y'
;

-- 09/05/2021 18:13:38 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_PrintFormatItem pi SET PrintName='EsCOTManual', Name='EsCOTManual' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001129)
;

-- 09/05/2021 18:14:03 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Aut. COT Manual',PrintName='Aut. COT Manual',Updated=TO_DATE('2021-05-09 18:14:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001129 AND AD_Language='es_AR'
;

-- 09/05/2021 18:15:19 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007041,1,'Y','N','N',3003912,'N','Y',257,'N','LAR','EsCOTManual',100,0,TO_DATE('2021-05-09 18:15:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-05-09 18:15:19','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/05/2021 18:15:19 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007041 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/05/2021 18:18:17 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_DATE('2021-05-09 18:18:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003703
;

-- 09/05/2021 18:19:25 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ReadOnlyLogic='@EsCOTManual@=N',Updated=TO_DATE('2021-05-09 18:19:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003703
;

-- 09/05/2021 18:28:04 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_DATE('2021-05-09 18:28:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003912
;

-- 09/05/2021 18:33:58 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_DATE('2021-05-09 18:33:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003703
;

-- 09/05/2021 18:36:30 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=S & @EsCOTManual@=N',Updated=TO_DATE('2021-05-09 18:36:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007004
;

-- 09/05/2021 20:01:48 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_DATE('2021-05-09 20:01:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003730
;

-- Registración de script
SELECT register_migration_script_lar('0171_ISSUE-140.sql', 'LAR', '') FROM dual
;
