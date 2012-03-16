-- Mar 12, 2012 11:31:29 AM ART
-- Re-sort localization menues
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000004
;

-- Mar 12, 2012 11:31:33 AM ART
-- Re-sort localization menues
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000003
;

-- Mar 12, 2012 11:31:33 AM ART
-- Re-sort localization menues
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000004
;

-- Mar 12, 2012 11:31:36 AM ART
-- Re-sort localization menues
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000001
;

-- Mar 12, 2012 11:31:36 AM ART
-- Re-sort localization menues
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000003
;

-- Mar 12, 2012 11:31:36 AM ART
-- Re-sort localization menues
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000004
;

-- Mar 12, 2012 11:31:39 AM ART
-- Re-sort localization menues
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000002
;

-- Mar 12, 2012 11:31:39 AM ART
-- Re-sort localization menues
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000001
;

-- Mar 12, 2012 11:31:39 AM ART
-- Re-sort localization menues
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000003
;

-- Mar 12, 2012 11:31:39 AM ART
-- Re-sort localization menues
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000004
;

-- Mar 12, 2012 11:31:42 AM ART
-- Re-sort localization menues
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000005
;

-- Mar 12, 2012 11:31:42 AM ART
-- Re-sort localization menues
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000002
;

-- Mar 12, 2012 11:31:42 AM ART
-- Re-sort localization menues
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000001
;

-- Mar 12, 2012 11:31:42 AM ART
-- Re-sort localization menues
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000003
;

-- Mar 12, 2012 11:31:42 AM ART
-- Re-sort localization menues
UPDATE AD_TreeNodeMM SET Parent_ID=3000001, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=1000004
;

-- Mar 12, 2012 11:31:47 AM ART
-- Re-sort localization menues
DELETE FROM AD_Menu_Trl WHERE AD_Menu_ID=1000000
;

-- Mar 12, 2012 11:31:47 AM ART
-- Re-sort localization menues
DELETE FROM AD_Menu WHERE AD_Menu_ID=1000000
;

-- Mar 12, 2012 11:31:47 AM ART
-- Re-sort localization menues
DELETE FROM AD_TreeNodeMM WHERE Node_ID=1000000 AND EXISTS (SELECT * FROM AD_Tree t WHERE t.AD_Tree_ID=AD_TreeNodeMM.AD_Tree_ID AND t.TreeType='MM')
;

