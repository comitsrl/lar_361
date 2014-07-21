ALTER TABLE C_Pos ADD COLUMN IsSaleWithoutStock character(1) NOT NULL DEFAULT 'N';
ALTER TABLE C_Pos ADD COLUMN PosNumber numeric(4,0) NOT NULL DEFAULT '0';

CREATE UNIQUE INDEX C_POS_Number_By_Org ON C_POS (AD_Client_ID, AD_Org_ID, IsActive, PosNumber);
