ALTER TABLE C_Pos ADD IsSaleWithoutStock character(1) DEFAULT 'N' NOT NULL;
ALTER TABLE C_Pos ADD PosNumber numeric(4,0) DEFAULT '0' NOT NULL;

CREATE UNIQUE INDEX C_POS_Number_By_Org ON C_POS (AD_Client_ID, AD_Org_ID, IsActive, PosNumber);
