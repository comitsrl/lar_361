ALTER TABLE C_Pos ADD COLUMN IsSaleWithoutStock character(1) NOT NULL DEFAULT 'N';
ALTER TABLE C_Pos ADD COLUMN PosNumber numeric(4,0) NOT NULL DEFAULT '0'