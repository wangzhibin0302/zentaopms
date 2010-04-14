-- 2010-04-06 bug table.
ALTER TABLE `zt_bug` ADD `deleted` ENUM( "0", "1" ) NOT NULL DEFAULT '0';
ALTER TABLE `zt_build` ADD `deleted` ENUM( '0', '1' ) NOT NULL DEFAULT '0';
ALTER TABLE `zt_case` ADD `deleted` ENUM( '0', '1' ) NOT NULL DEFAULT '0';
ALTER TABLE `zt_company` ADD `deleted` ENUM( '0', '1' ) NOT NULL DEFAULT '0';
ALTER TABLE `zt_file` ADD `deleted` ENUM( '0', '1' ) NOT NULL DEFAULT '0';
ALTER TABLE `zt_product` ADD `deleted` ENUM( '0', '1' ) NOT NULL DEFAULT '0';
ALTER TABLE `zt_productPlan` ADD `deleted` ENUM( '0', '1' ) NOT NULL DEFAULT '0';
ALTER TABLE `zt_project` ADD `deleted` ENUM( '0', '1' ) NOT NULL DEFAULT '0';
ALTER TABLE `zt_release` ADD `deleted` ENUM( '0', '1' ) NOT NULL DEFAULT '0';
ALTER TABLE `zt_story` ADD `deleted` ENUM( '0', '1' ) NOT NULL DEFAULT '0';
ALTER TABLE `zt_task` ADD `deleted` ENUM( '0', '1' ) NOT NULL DEFAULT '0';
ALTER TABLE `zt_testTask` ADD `deleted` ENUM( '0', '1' ) NOT NULL DEFAULT '0';
ALTER TABLE `zt_user` ADD `deleted` ENUM( '0', '1' ) NOT NULL DEFAULT '0';

-- 处理user表。
UPDATE zt_user SET deleted = '1' WHERE STATUS = 'delete';
ALTER TABLE `zt_user` DROP `status`;
INSERT INTO zt_action(`company`, `objecttype`, `objectID`, `actor`, action, `date`, `comment` , `extra`) 
SELECT `company`, 'user', `id`, 'system', 'deleted', now( ) , '', 1 FROM zt_user WHERE zt_user.deleted ='1'

-- company 字段。
ALTER TABLE `zt_action` ADD `company` MEDIUMINT UNSIGNED NOT NULL AFTER `id` ;
ALTER TABLE `zt_action` ADD INDEX ( `company` ) ;
ALTER TABLE `zt_bug` ADD `company` MEDIUMINT UNSIGNED NOT NULL AFTER `id` ;
ALTER TABLE `zt_bug` ADD INDEX ( `company` ) ;
ALTER TABLE `zt_build` ADD `company` MEDIUMINT UNSIGNED NOT NULL AFTER `id` ;
ALTER TABLE `zt_build` ADD INDEX ( `company` ) ;
ALTER TABLE `zt_burn` ADD `company` MEDIUMINT UNSIGNED NOT NULL FIRST ;
ALTER TABLE `zt_burn` ADD INDEX ( `company` ) ;
ALTER TABLE `zt_case` ADD `company` MEDIUMINT UNSIGNED NOT NULL AFTER `id` ;
ALTER TABLE `zt_case` ADD INDEX ( `company` ) ;
ALTER TABLE `zt_caseStep` ADD `company` MEDIUMINT UNSIGNED NOT NULL AFTER `id` ;
ALTER TABLE `zt_caseStep` ADD INDEX ( `company` ) ;
ALTER TABLE `zt_effort` ADD `company` MEDIUMINT UNSIGNED NOT NULL AFTER `id` ;
ALTER TABLE `zt_effort` ADD INDEX ( `company` ) ;
ALTER TABLE `zt_groupPriv` ADD `company` MEDIUMINT NOT NULL FIRST ;
ALTER TABLE `zt_groupPriv` ADD INDEX ( `company` ) ;
ALTER TABLE `zt_history` ADD `company` MEDIUMINT UNSIGNED NOT NULL AFTER `id` ;
ALTER TABLE `zt_history` ADD INDEX ( `company` ) ;
ALTER TABLE `zt_module` ADD `company` MEDIUMINT UNSIGNED NOT NULL AFTER `id` ;
ALTER TABLE `zt_module` ADD INDEX ( `company` ) ;
ALTER TABLE `zt_productPlan` ADD `company` MEDIUMINT UNSIGNED NOT NULL AFTER `id` ;
ALTER TABLE `zt_productPlan` ADD INDEX ( `company` ) ;
ALTER TABLE `zt_projectProduct` ADD `company` MEDIUMINT UNSIGNED NOT NULL FIRST ;
ALTER TABLE `zt_projectProduct` ADD INDEX ( `company` ) ;
ALTER TABLE `zt_projectStory` ADD `company` MEDIUMINT NOT NULL FIRST ;
ALTER TABLE `zt_projectStory` ADD INDEX ( `company` ) ;
ALTER TABLE `zt_release` ADD `company` MEDIUMINT UNSIGNED NOT NULL AFTER `id` ;
ALTER TABLE `zt_release` ADD INDEX ( `company` ) ;
ALTER TABLE `zt_story` ADD `company` MEDIUMINT UNSIGNED NOT NULL AFTER `id` ;
ALTER TABLE `zt_story` ADD INDEX ( `company` ) ;
ALTER TABLE `zt_storySpec` ADD `company` MEDIUMINT UNSIGNED NOT NULL FIRST ;
ALTER TABLE `zt_storySpec` ADD INDEX ( `company` ) ;
ALTER TABLE `zt_task` ADD `company` MEDIUMINT UNSIGNED NOT NULL AFTER `id` ;
ALTER TABLE `zt_task` ADD INDEX ( `company` ) ;
ALTER TABLE `zt_taskEstimate` ADD `company` MEDIUMINT UNSIGNED NOT NULL AFTER `id` ;
ALTER TABLE `zt_taskEstimate` ADD INDEX ( `company` ) ;
ALTER TABLE `zt_team` ADD `company` MEDIUMINT UNSIGNED NOT NULL FIRST ;
ALTER TABLE `zt_team` ADD INDEX ( `company` ) ;
ALTER TABLE `zt_testResult` ADD `company` MEDIUMINT UNSIGNED NOT NULL AFTER `id` ;
ALTER TABLE `zt_testResult` ADD INDEX ( `company` ) ;
ALTER TABLE `zt_testRun` ADD `company` MEDIUMINT UNSIGNED NOT NULL AFTER `id` ;
ALTER TABLE `zt_testRun` ADD INDEX ( `company` ) ;
ALTER TABLE `zt_testTask` ADD `company` MEDIUMINT UNSIGNED NOT NULL AFTER `id` ;
ALTER TABLE `zt_testTask` ADD INDEX ( `company` ) ;
ALTER TABLE `zt_todo` ADD `company` MEDIUMINT NOT NULL AFTER `id` ;
ALTER TABLE `zt_todo` ADD INDEX ( `company` ) ;
ALTER TABLE `zt_userGroup` ADD `company` MEDIUMINT UNSIGNED NOT NULL FIRST ;
ALTER TABLE `zt_userGroup` ADD INDEX ( `company` ) ;
