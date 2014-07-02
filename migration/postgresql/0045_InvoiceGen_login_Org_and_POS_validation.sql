-- 27/08/2012 7:12:22 ART
-- POS_ID and AD_Org Login Organization table validation reference
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000022,'T','LAR','N','LAR_POS_ID Login Org',0,0,100,TO_TIMESTAMP('2012-08-27 07:12:21','YYYY-MM-DD HH24:MI:SS'),'Y',TO_TIMESTAMP('2012-08-27 07:12:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/08/2012 7:12:22 ART
-- POS_ID and AD_Org Login Organization table validation reference
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000022 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 27/08/2012 7:15:56 ART
-- POS_ID and AD_Org Login Organization table validation reference
INSERT INTO AD_Ref_Table (IsValueDisplayed,WhereClause,OrderByClause,AD_Table_ID,AD_Reference_ID,AD_Key,AD_Display,EntityType,CreatedBy,Created,Updated,AD_Client_ID,UpdatedBy,AD_Org_ID,IsActive) VALUES ('N','C_POS.IsActive = ''Y'' AND C_POS.AD_Org_ID = @#AD_Org_ID@','C_POS.PosNumber',748,3000022,12745,3000066,'LAR',100,TO_TIMESTAMP('2012-08-27 07:15:56','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-08-27 07:15:56','YYYY-MM-DD HH24:MI:SS'),0,100,0,'Y')
;

-- 27/08/2012 7:20:59 ART
-- POS_ID and AD_Org Login Organization table validation reference
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000023,'T','LAR','N','AD_Org Login',0,0,100,TO_TIMESTAMP('2012-08-27 07:20:59','YYYY-MM-DD HH24:MI:SS'),'Y',TO_TIMESTAMP('2012-08-27 07:20:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/08/2012 7:20:59 ART
-- POS_ID and AD_Org Login Organization table validation reference
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000023 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 27/08/2012 7:23:02 ART
-- POS_ID and AD_Org Login Organization table validation reference
INSERT INTO AD_Ref_Table (IsValueDisplayed,WhereClause,AD_Table_ID,AD_Reference_ID,AD_Key,AD_Display,EntityType,CreatedBy,Created,Updated,AD_Client_ID,UpdatedBy,AD_Org_ID,IsActive) VALUES ('Y','AD_Org.AD_Org_ID=@#AD_Org_ID@',155,3000023,528,522,'LAR',100,TO_TIMESTAMP('2012-08-27 07:23:02','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-08-27 07:23:02','YYYY-MM-DD HH24:MI:SS'),0,100,0,'Y')
;

-- 28/08/2012 15:28:22 ART
-- System Configurator to control this behavior
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Name,Value,Description,AD_Client_ID,AD_Org_ID,Created,Updated,CreatedBy,UpdatedBy,IsActive) VALUES (1000003,'LAR','S','ERGIO_InvoiceGen_Login_ORG_and_PDV','Y','Restrict Organization and PDV fields to login Organization on Generate Invoices (manual) Form. ',0,0,TO_TIMESTAMP('2012-08-28 15:28:20','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-08-28 15:28:20','YYYY-MM-DD HH24:MI:SS'),100,100,'Y')
;

