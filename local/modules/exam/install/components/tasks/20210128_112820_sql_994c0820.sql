-- Started: 2021-01-28 11:28:20
SET NAMES 'utf8';
-- -----------------------------------
-- Dumping table b_admin_notify
-- -----------------------------------
DROP TABLE IF EXISTS `b_admin_notify`;
CREATE TABLE `b_admin_notify` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `ENABLE_CLOSE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `PUBLIC_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NOTIFY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  KEY `IX_AD_TAG` (`TAG`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_admin_notify` VALUES
(1, 'MAIN', 'SITE_CHECKER', 'Обнаружены ошибки в работе сайта. <a href=\"/bitrix/admin/site_checker.php?lang=ru&start_test=Y\">Проверить и исправить.</a>', 'Y', 'N', 'M');
-- -----------------------------------
-- Dumping table b_admin_notify_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_admin_notify_lang`;
CREATE TABLE `b_admin_notify_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NOTIFY_ID` int(18) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_ADM_NTFY_LANG` (`NOTIFY_ID`,`LID`),
  KEY `IX_ADM_NTFY_LID` (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_agent
-- -----------------------------------
DROP TABLE IF EXISTS `b_agent`;
CREATE TABLE `b_agent` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `NAME` text COLLATE utf8_unicode_ci,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime NOT NULL,
  `DATE_CHECK` datetime DEFAULT NULL,
  `AGENT_INTERVAL` int(18) DEFAULT '86400',
  `IS_PERIOD` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `USER_ID` int(18) DEFAULT NULL,
  `RUNNING` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RETRY_COUNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_act_next_exec` (`ACTIVE`,`NEXT_EXEC`),
  KEY `ix_agent_user_id` (`USER_ID`),
  KEY `ix_agent_name` (`NAME`(100))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_agent` VALUES
(1, 'main', 100, '\\Bitrix\\Main\\Analytics\\CounterDataTable::submitData();', 'Y', '2021-01-28 13:27:22', '2021-01-28 13:28:22', NULL, 60, 'N', NULL, 'N', 0),
(2, 'main', 100, 'CCaptchaAgent::DeleteOldCaptcha(3600);', 'Y', '2021-01-28 13:27:22', '2021-01-28 14:27:22', NULL, 3600, 'N', NULL, 'N', 0),
(3, 'main', 100, 'CSiteCheckerTest::CommonTest();', 'Y', '2021-01-28 13:27:23', '2021-01-29 13:27:23', NULL, 86400, 'N', NULL, 'N', 0),
(4, 'main', 100, 'CEvent::CleanUpAgent();', 'Y', '2021-01-28 13:27:23', '2021-01-29 13:27:23', NULL, 86400, 'N', NULL, 'N', 0),
(5, 'main', 100, 'CUser::CleanUpHitAuthAgent();', 'Y', '2021-01-28 13:27:23', '2021-01-29 13:27:23', NULL, 86400, 'N', NULL, 'N', 0),
(6, 'main', 100, 'CUndo::CleanUpOld();', 'Y', '2021-01-28 13:27:24', '2021-01-29 13:27:24', NULL, 86400, 'N', NULL, 'N', 0),
(7, 'main', 100, 'CUserCounter::DeleteOld();', 'Y', '2021-01-28 13:27:24', '2021-01-29 13:27:24', NULL, 86400, 'N', NULL, 'N', 0),
(8, 'main', 100, '\\Bitrix\\Main\\UI\\Viewer\\FilePreviewTable::deleteOldAgent(22, 20);', 'Y', '2021-01-28 13:27:24', '2021-01-29 13:27:24', NULL, 86400, 'N', NULL, 'N', 0),
(9, 'main', 100, 'CUser::AuthActionsCleanUpAgent();', 'Y', '2021-01-28 13:27:24', '2021-01-29 13:27:24', NULL, 86400, 'N', NULL, 'N', 0),
(10, 'main', 100, 'CUser::CleanUpAgent();', 'Y', '2021-01-28 13:27:24', '2021-01-29 13:27:24', NULL, 86400, 'N', NULL, 'N', 0),
(11, 'main', 100, 'CUser::DeactivateAgent();', 'Y', '2021-01-28 13:27:24', '2021-01-29 13:27:24', NULL, 86400, 'N', NULL, 'N', 0),
(12, 'main', 100, 'CEventLog::CleanUpAgent();', 'Y', '2021-01-28 13:27:24', '2021-01-29 13:27:24', NULL, 86400, 'N', NULL, 'N', 0),
(13, 'clouds', 100, 'CCloudStorage::CleanUp();', 'Y', '2021-01-28 13:27:25', '2021-01-29 13:27:25', NULL, 86400, 'N', NULL, 'N', 0),
(14, 'landing', 100, 'Bitrix\\Landing\\Agent::clearRecycle();', 'Y', '2021-01-28 13:27:26', '2021-01-28 15:27:26', NULL, 7200, 'N', NULL, 'N', 0),
(15, 'landing', 100, 'Bitrix\\Landing\\Agent::clearFiles(30);', 'Y', '2021-01-28 13:27:26', '2021-01-28 14:27:26', NULL, 3600, 'N', NULL, 'N', 0),
(16, 'landing', 100, 'Bitrix\\Landing\\Agent::sendRestStatistic();', 'Y', '2021-01-28 13:27:27', '2021-01-29 13:27:27', NULL, 86400, 'N', NULL, 'N', 0),
(17, 'messageservice', 100, '\\Bitrix\\MessageService\\Queue::cleanUpAgent();', 'Y', '2021-01-28 13:27:27', '2021-01-29 00:00:00', NULL, 86400, 'Y', NULL, 'N', 0),
(18, 'rest', 100, 'Bitrix\\Rest\\Marketplace\\Client::getNumUpdates();', 'Y', '2021-01-28 13:27:27', '2021-01-29 13:27:27', NULL, 86400, 'N', NULL, 'N', 0),
(19, 'rest', 100, '\\Bitrix\\Rest\\EventOfflineTable::cleanProcessAgent();', 'Y', '2021-01-28 13:27:28', '2021-01-29 13:27:28', NULL, 86400, 'N', NULL, 'N', 0),
(20, 'rest', 100, '\\Bitrix\\Rest\\LogTable::cleanUpAgent();', 'Y', '2021-01-28 13:27:28', '2021-01-29 13:27:28', NULL, 86400, 'N', NULL, 'N', 0),
(21, 'rest', 100, '\\Bitrix\\Rest\\Configuration\\Helper::sendStatisticAgent();', 'Y', '2021-01-28 13:27:28', '2021-01-29 13:27:28', NULL, 86400, 'N', NULL, 'N', 0),
(22, 'rest', 100, '\\Bitrix\\Rest\\UsageStatTable::sendAgent();', 'Y', '2021-01-28 13:27:28', '2021-01-28 14:27:28', NULL, 3600, 'N', NULL, 'N', 0),
(23, 'rest', 100, '\\Bitrix\\Rest\\UsageStatTable::cleanUpAgent();', 'Y', '2021-01-28 13:27:28', '2021-01-28 14:27:28', NULL, 3600, 'N', NULL, 'N', 0),
(24, 'search', 10, 'CSearchSuggest::CleanUpAgent();', 'Y', '2021-01-28 13:27:28', '2021-01-29 13:27:28', NULL, 86400, 'N', NULL, 'N', 0),
(25, 'search', 10, 'CSearchStatistic::CleanUpAgent();', 'Y', '2021-01-28 13:27:28', '2021-01-29 13:27:28', NULL, 86400, 'N', NULL, 'N', 0),
(26, 'seo', 100, 'Bitrix\\Seo\\Engine\\YandexDirect::updateAgent();', 'Y', '2021-01-28 13:27:28', '2021-01-28 14:27:28', NULL, 3600, 'N', NULL, 'N', 0),
(27, 'seo', 100, 'Bitrix\\Seo\\Adv\\LogTable::clean();', 'Y', '2021-01-28 13:27:28', '2021-01-29 13:27:28', NULL, 86400, 'N', NULL, 'N', 0),
(28, 'seo', 100, 'Bitrix\\Seo\\Adv\\Auto::checkQuantityAgent();', 'Y', '2021-01-28 13:27:28', '2021-01-28 14:27:28', NULL, 3600, 'N', NULL, 'N', 0);
-- -----------------------------------
-- Dumping table b_app_password
-- -----------------------------------
DROP TABLE IF EXISTS `b_app_password`;
CREATE TABLE `b_app_password` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `APPLICATION_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DIGEST_PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SYSCOMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_app_password_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_b24connector_buttons
-- -----------------------------------
DROP TABLE IF EXISTS `b_b24connector_buttons`;
CREATE TABLE `b_b24connector_buttons` (
  `ID` int(11) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `ADD_DATE` datetime NOT NULL,
  `ADD_BY` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SCRIPT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_bitrixcloud_option
-- -----------------------------------
DROP TABLE IF EXISTS `b_bitrixcloud_option`;
CREATE TABLE `b_bitrixcloud_option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL,
  `PARAM_KEY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM_VALUE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_bitrixcloud_option_1` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_bitrixcloud_option` VALUES
(1, 'backup_quota', 0, '0', '0'),
(2, 'backup_total_size', 0, '0', '0'),
(3, 'backup_last_backup_time', 0, '0', '0'),
(4, 'monitoring_expire_time', 0, '0', '1611824279');
-- -----------------------------------
-- Dumping table b_cache_tag
-- -----------------------------------
DROP TABLE IF EXISTS `b_cache_tag`;
CREATE TABLE `b_cache_tag` (
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SALT` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RELATIVE_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ix_b_cache_tag_0` (`SITE_ID`,`CACHE_SALT`,`RELATIVE_PATH`(50)),
  KEY `ix_b_cache_tag_1` (`TAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_cache_tag` VALUES
(NULL, NULL, '0:1611822481', '**'),
('s1', '/e25', '/s1/bitrix/menu.sections/06f', 'iblock_id_2'),
('s1', '/e25', '/s1/bitrix/news.list/06f', 'iblock_id_1'),
('s1', '/e25', '/s1/bitrix/furniture.catalog.random/06f', 'iblock_id_2'),
('s1', '/e25', '/s1/bitrix/furniture.catalog.index/e25', 'iblock_id_2'),
('s1', '/e25', '/s1/bitrix/furniture.catalog.index/e25', 'iblock_id_3'),
('s1', '/a44', '/s1/bitrix/menu.sections/06f', 'iblock_id_2'),
('s1', '/a44', '/s1/bitrix/news.list/06f', 'iblock_id_1'),
('s1', '/a44', '/s1/bitrix/furniture.catalog.random/06f', 'iblock_id_2'),
('s1', '/9f6', '/s1/bitrix/news.list/06f', 'iblock_id_1'),
('s1', '/9f6', '/s1/bitrix/furniture.catalog.random/06f', 'iblock_id_2'),
('s1', '/9f6', '/s1/bitrix/news.list/9f6', 'iblock_id_1'),
('s1', '/6f8', '/s1/bitrix/news.list/06f', 'iblock_id_1'),
('s1', '/6f8', '/s1/bitrix/furniture.catalog.random/06f', 'iblock_id_2'),
('s1', '/fc1', '/s1/bitrix/news.list/06f', 'iblock_id_1'),
('s1', '/fc1', '/s1/bitrix/furniture.catalog.random/06f', 'iblock_id_2'),
('s1', '/fc1', '/s1/bitrix/news.list/fc1', 'iblock_id_1'),
('s1', '/c99', '/s1/bitrix/menu/06f', 'bitrix:menu'),
('s1', '/c99', '/s1/bitrix/news.list/06f', 'iblock_id_1'),
('s1', '/c99', '/s1/bitrix/furniture.catalog.random/06f', 'iblock_id_2'),
('s1', '/9f6', '/s1/bitrix/menu/06f', 'bitrix:menu'),
('s1', '/e25', '/s1/bitrix/menu/06f', 'bitrix:menu');
-- -----------------------------------
-- Dumping table b_captcha
-- -----------------------------------
DROP TABLE IF EXISTS `b_captcha`;
CREATE TABLE `b_captcha` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  UNIQUE KEY `UX_B_CAPTCHA` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_checklist
-- -----------------------------------
DROP TABLE IF EXISTS `b_checklist`;
CREATE TABLE `b_checklist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CREATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TESTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMPANY_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int(11) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `SUCCESS` int(11) DEFAULT NULL,
  `FAILED` int(11) DEFAULT NULL,
  `PENDING` int(11) DEFAULT NULL,
  `SKIP` int(11) DEFAULT NULL,
  `STATE` longtext COLLATE utf8_unicode_ci,
  `REPORT_COMMENT` text COLLATE utf8_unicode_ci,
  `REPORT` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `EMAIL` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SENDED_TO_BITRIX` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_clouds_copy_queue
-- -----------------------------------
DROP TABLE IF EXISTS `b_clouds_copy_queue`;
CREATE TABLE `b_clouds_copy_queue` (
  `ID` int(32) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL,
  `OP` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `SOURCE_BUCKET_ID` int(11) NOT NULL,
  `SOURCE_FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `TARGET_BUCKET_ID` int(11) NOT NULL,
  `TARGET_FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_SIZE` int(11) NOT NULL DEFAULT '-1',
  `FILE_POS` int(11) NOT NULL DEFAULT '0',
  `FAIL_COUNTER` int(11) NOT NULL DEFAULT '0',
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ERROR_MESSAGE` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_clouds_delete_queue
-- -----------------------------------
DROP TABLE IF EXISTS `b_clouds_delete_queue`;
CREATE TABLE `b_clouds_delete_queue` (
  `ID` int(32) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL,
  `BUCKET_ID` int(11) NOT NULL,
  `FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_clouds_delete_queue_1` (`BUCKET_ID`,`FILE_PATH`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_clouds_file_bucket
-- -----------------------------------
DROP TABLE IF EXISTS `b_clouds_file_bucket`;
CREATE TABLE `b_clouds_file_bucket` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SORT` int(11) DEFAULT '500',
  `READ_ONLY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `SERVICE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BUCKET` varchar(63) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOCATION` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CNAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_COUNT` int(11) DEFAULT '0',
  `FILE_SIZE` double DEFAULT '0',
  `LAST_FILE_ID` int(11) DEFAULT NULL,
  `PREFIX` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `FILE_RULES` text COLLATE utf8_unicode_ci,
  `FAILOVER_ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `FAILOVER_BUCKET_ID` int(11) DEFAULT NULL,
  `FAILOVER_COPY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `FAILOVER_DELETE` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `FAILOVER_DELETE_DELAY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_clouds_file_hash
-- -----------------------------------
DROP TABLE IF EXISTS `b_clouds_file_hash`;
CREATE TABLE `b_clouds_file_hash` (
  `BUCKET_ID` int(11) NOT NULL,
  `FILE_PATH` varchar(600) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `FILE_MTIME` datetime DEFAULT NULL,
  `FILE_HASH` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`BUCKET_ID`,`FILE_PATH`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_clouds_file_resize
-- -----------------------------------
DROP TABLE IF EXISTS `b_clouds_file_resize`;
CREATE TABLE `b_clouds_file_resize` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL,
  `ERROR_CODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `FILE_ID` int(11) DEFAULT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci,
  `FROM_PATH` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_PATH` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_file_resize_ts` (`TIMESTAMP_X`),
  KEY `ix_b_file_resize_path` (`TO_PATH`(100)),
  KEY `ix_b_file_resize_file` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_clouds_file_save
-- -----------------------------------
DROP TABLE IF EXISTS `b_clouds_file_save`;
CREATE TABLE `b_clouds_file_save` (
  `ID` int(32) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL,
  `BUCKET_ID` int(11) NOT NULL,
  `SUBDIR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_EXTERNAL_ID` (`EXTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_clouds_file_upload
-- -----------------------------------
DROP TABLE IF EXISTS `b_clouds_file_upload`;
CREATE TABLE `b_clouds_file_upload` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `TMP_FILE` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BUCKET_ID` int(11) NOT NULL,
  `PART_SIZE` int(11) NOT NULL,
  `PART_NO` int(11) NOT NULL,
  `PART_FAIL_COUNTER` int(11) NOT NULL,
  `NEXT_STEP` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_component_params
-- -----------------------------------
DROP TABLE IF EXISTS `b_component_params`;
CREATE TABLE `b_component_params` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `COMPONENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TEMPLATE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REAL_PATH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SEF_MODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SEF_FOLDER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `START_CHAR` int(11) NOT NULL,
  `END_CHAR` int(11) NOT NULL,
  `PARAMETERS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_comp_params_name` (`COMPONENT_NAME`),
  KEY `ix_comp_params_path` (`SITE_ID`,`REAL_PATH`),
  KEY `ix_comp_params_sname` (`SITE_ID`,`COMPONENT_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_component_params` VALUES
(1, 's1', 'bitrix:menu', 'horizontal_multilevel', '/bitrix/templates/exam/header.php', 'N', NULL, 1384, 1735, 'a:8:{s:14:\"ROOT_MENU_TYPE\";s:3:\"top\";s:9:\"MAX_LEVEL\";s:1:\"2\";s:15:\"CHILD_MENU_TYPE\";s:4:\"left\";s:7:\"USE_EXT\";s:1:\"Y\";s:15:\"MENU_CACHE_TYPE\";s:1:\"A\";s:15:\"MENU_CACHE_TIME\";s:8:\"36000000\";s:21:\"MENU_CACHE_USE_GROUPS\";s:1:\"Y\";s:19:\"MENU_CACHE_GET_VARS\";s:0:\"\";}'),
(2, 's1', 'bitrix:menu', 'left', '/bitrix/templates/exam/header.php', 'N', NULL, 2523, 2896, 'a:9:{s:14:\"ROOT_MENU_TYPE\";s:4:\"left\";s:15:\"MENU_CACHE_TYPE\";s:1:\"A\";s:15:\"MENU_CACHE_TIME\";s:8:\"36000000\";s:21:\"MENU_CACHE_USE_GROUPS\";s:1:\"Y\";s:19:\"MENU_CACHE_GET_VARS\";N;s:9:\"MAX_LEVEL\";s:1:\"1\";s:15:\"CHILD_MENU_TYPE\";s:4:\"left\";s:7:\"USE_EXT\";s:1:\"Y\";s:18:\"ALLOW_MULTI_SELECT\";s:1:\"N\";}'),
(3, 's1', 'bitrix:search.form', 'flat', '/bitrix/templates/exam/header.php', 'N', NULL, 3221, 3333, 'a:1:{s:4:\"PAGE\";s:17:\"#SITE_DIR#search/\";}'),
(4, 's1', 'bitrix:menu', 'bottom', '/bitrix/templates/exam/footer.php', 'N', NULL, 363, 700, 'a:9:{s:14:\"ROOT_MENU_TYPE\";s:6:\"bottom\";s:15:\"MENU_CACHE_TYPE\";s:1:\"N\";s:15:\"MENU_CACHE_TIME\";s:8:\"36000000\";s:21:\"MENU_CACHE_USE_GROUPS\";s:1:\"Y\";s:19:\"MENU_CACHE_GET_VARS\";N;s:9:\"MAX_LEVEL\";s:1:\"1\";s:15:\"CHILD_MENU_TYPE\";s:4:\"left\";s:7:\"USE_EXT\";s:1:\"N\";s:18:\"ALLOW_MULTI_SELECT\";s:1:\"N\";}'),
(12, 's1', 'tasks:groups.of.users', '', '/gruppy-polzovateley-prostoy/index.php', 'N', NULL, 120, 303, 'a:3:{s:10:\"CACHE_TIME\";s:8:\"36000000\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:15:\"HEADING_OF_PAGE\";s:54:\"Кастомный заголовок страницы\";}'),
(96, 's1', 'tasks:groups.complex', '.default', '/gruppy-polzovateley-kompleksnyy/index.php', 'N', NULL, 124, 395, 'a:4:{s:10:\"SEF_FOLDER\";s:33:\"/gruppy-polzovateley-kompleksnyy/\";s:8:\"SEF_MODE\";s:1:\"N\";s:18:\"COMPONENT_TEMPLATE\";s:8:\".default\";s:16:\"VARIABLE_ALIASES\";a:1:{s:8:\"GROUP_ID\";s:8:\"GROUP_ID\";}}'),
(98, 's1', 'tasks:groups.complex', '.default', '/novyy-razdel/index.php', 'N', NULL, 104, 356, 'a:4:{s:10:\"SEF_FOLDER\";s:14:\"/novyy-razdel/\";s:8:\"SEF_MODE\";s:1:\"N\";s:18:\"COMPONENT_TEMPLATE\";s:8:\".default\";s:16:\"VARIABLE_ALIASES\";a:1:{s:8:\"GROUP_ID\";s:8:\"GROUP_ID\";}}');
-- -----------------------------------
-- Dumping table b_composite_log
-- -----------------------------------
DROP TABLE IF EXISTS `b_composite_log`;
CREATE TABLE `b_composite_log` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HOST` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `URI` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED` datetime NOT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` longtext COLLATE utf8_unicode_ci,
  `AJAX` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `USER_ID` int(18) NOT NULL DEFAULT '0',
  `PAGE_ID` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_B_COMPOSITE_LOG_PAGE_ID` (`PAGE_ID`),
  KEY `IX_B_COMPOSITE_LOG_HOST` (`HOST`),
  KEY `IX_B_COMPOSITE_LOG_TYPE` (`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_composite_page
-- -----------------------------------
DROP TABLE IF EXISTS `b_composite_page`;
CREATE TABLE `b_composite_page` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CACHE_KEY` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `HOST` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `URI` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED` datetime NOT NULL,
  `CHANGED` datetime NOT NULL,
  `LAST_VIEWED` datetime NOT NULL,
  `VIEWS` int(18) NOT NULL DEFAULT '0',
  `REWRITES` int(18) NOT NULL DEFAULT '0',
  `SIZE` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_B_COMPOSITE_PAGE_CACHE_KEY` (`CACHE_KEY`(100)),
  KEY `IX_B_COMPOSITE_PAGE_VIEWED` (`LAST_VIEWED`),
  KEY `IX_B_COMPOSITE_PAGE_HOST` (`HOST`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_consent_agreement
-- -----------------------------------
DROP TABLE IF EXISTS `b_consent_agreement`;
CREATE TABLE `b_consent_agreement` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATA_PROVIDER` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AGREEMENT_TEXT` longtext COLLATE utf8_unicode_ci,
  `LABEL_TEXT` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECURITY_CODE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_URL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_AGREEMENT_TEXT_HTML` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_AGREEMENT_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_consent_field
-- -----------------------------------
DROP TABLE IF EXISTS `b_consent_field`;
CREATE TABLE `b_consent_field` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `AGREEMENT_ID` int(18) NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_FIELD_AG_ID` (`AGREEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_consent_user_consent
-- -----------------------------------
DROP TABLE IF EXISTS `b_consent_user_consent`;
CREATE TABLE `b_consent_user_consent` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `AGREEMENT_ID` int(18) NOT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORIGIN_ID` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORIGINATOR_ID` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_USER_CONSENT` (`AGREEMENT_ID`),
  KEY `IX_CONSENT_USER_CONSENT_USER_ORIGIN` (`USER_ID`,`ORIGIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_consent_user_consent_item
-- -----------------------------------
DROP TABLE IF EXISTS `b_consent_user_consent_item`;
CREATE TABLE `b_consent_user_consent_item` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_CONSENT_ID` int(18) NOT NULL,
  `VALUE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_USER_ITEM_AG_ID` (`USER_CONSENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_counter_data
-- -----------------------------------
DROP TABLE IF EXISTS `b_counter_data`;
CREATE TABLE `b_counter_data` (
  `ID` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `DATA` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_culture
-- -----------------------------------
DROP TABLE IF EXISTS `b_culture`;
CREATE TABLE `b_culture` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(1) DEFAULT '1',
  `CHARSET` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SHORT_DATE_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'n/j/Y',
  `MEDIUM_DATE_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'M j, Y',
  `LONG_DATE_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'F j, Y',
  `FULL_DATE_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'l, F j, Y',
  `DAY_MONTH_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'F j',
  `DAY_SHORT_MONTH_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'M j',
  `DAY_OF_WEEK_MONTH_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'l, F j',
  `SHORT_DAY_OF_WEEK_MONTH_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'D, F j',
  `SHORT_DAY_OF_WEEK_SHORT_MONTH_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'D, M j',
  `SHORT_TIME_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'g:i a',
  `LONG_TIME_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'g:i:s a',
  `AM_VALUE` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'am',
  `PM_VALUE` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'pm',
  `NUMBER_THOUSANDS_SEPARATOR` varchar(10) COLLATE utf8_unicode_ci DEFAULT ',',
  `NUMBER_DECIMAL_SEPARATOR` varchar(10) COLLATE utf8_unicode_ci DEFAULT '.',
  `NUMBER_DECIMALS` tinyint(4) DEFAULT '2',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_culture` VALUES
(1, 'ru', 'ru', 'DD.MM.YYYY', 'DD.MM.YYYY HH:MI:SS', '#NAME# #LAST_NAME#', 1, 'UTF-8', 'Y', 'd.m.Y', 'j M Y', 'j F Y', 'l, j F Y', 'j F', 'j M', 'l, j F', 'D, j F', 'D, j M', 'H:i', 'H:i:s', 'am', 'pm', ' ', ',', 2),
(2, 'en', 'en', 'MM/DD/YYYY', 'MM/DD/YYYY H:MI:SS T', '#NAME# #LAST_NAME#', 0, 'UTF-8', 'Y', 'n/j/Y', 'M j, Y', 'F j, Y', 'l, F j, Y', 'F j', 'M j', 'l, F j', 'D, F j', 'D, M j', 'g:i a', 'g:i:s a', 'am', 'pm', ',', '.', 2);
-- -----------------------------------
-- Dumping table b_entity_usage
-- -----------------------------------
DROP TABLE IF EXISTS `b_entity_usage`;
CREATE TABLE `b_entity_usage` (
  `USER_ID` int(11) NOT NULL,
  `CONTEXT` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID_INT` int(11) NOT NULL DEFAULT '0',
  `PREFIX` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `LAST_USE_DATE` datetime NOT NULL,
  PRIMARY KEY (`USER_ID`,`CONTEXT`,`ENTITY_ID`,`ITEM_ID`),
  KEY `IX_ENTITY_USAGE_ITEM_ID_INT` (`ITEM_ID_INT`),
  KEY `IX_ENTITY_USAGE_LAST_USE_DATE` (`LAST_USE_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_event
-- -----------------------------------
DROP TABLE IF EXISTS `b_event`;
CREATE TABLE `b_event` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` int(18) DEFAULT NULL,
  `LID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `C_FIELDS` longtext COLLATE utf8_unicode_ci,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DUPLICATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_success` (`SUCCESS_EXEC`),
  KEY `ix_b_event_date_exec` (`DATE_EXEC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_event_attachment
-- -----------------------------------
DROP TABLE IF EXISTS `b_event_attachment`;
CREATE TABLE `b_event_attachment` (
  `EVENT_ID` int(18) NOT NULL,
  `FILE_ID` int(18) NOT NULL,
  `IS_FILE_COPIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`EVENT_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Creating empty table b_event_log
-- -----------------------------------
CREATE TABLE IF NOT EXISTS `b_event_log` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `SEVERITY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `AUDIT_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `GUEST_ID` int(18) DEFAULT NULL,
  `DESCRIPTION` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_log_time` (`TIMESTAMP_X`),
  KEY `ix_b_event_log_audit_type_time` (`AUDIT_TYPE_ID`,`TIMESTAMP_X`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_event_message
-- -----------------------------------
DROP TABLE IF EXISTS `b_event_message`;
CREATE TABLE `b_event_message` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EMAIL_FROM` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_FROM#',
  `EMAIL_TO` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_TO#',
  `SUBJECT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` longtext COLLATE utf8_unicode_ci,
  `MESSAGE_PHP` longtext COLLATE utf8_unicode_ci,
  `BODY_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `BCC` text COLLATE utf8_unicode_ci,
  `REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CC` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRIORITY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDITIONAL_FIELD` text COLLATE utf8_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_message_name` (`EVENT_NAME`(50))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_event_message` VALUES
(1, '2021-01-27 04:14:26', 'NEW_USER', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#DEFAULT_EMAIL_FROM#', '#SITE_NAME#: Зарегистрировался новый пользователь', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНа сайте #SERVER_NAME# успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: #USER_ID#\n\nИмя: #NAME#\nФамилия: #LAST_NAME#\nE-Mail: #EMAIL#\n\nLogin: #LOGIN#\n\nПисьмо сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНа сайте <?=$arParams[\"SERVER_NAME\"];?> успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\n\nИмя: <?=$arParams[\"NAME\"];?>\n\nФамилия: <?=$arParams[\"LAST_NAME\"];?>\n\nE-Mail: <?=$arParams[\"EMAIL\"];?>\n\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nПисьмо сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(2, '2021-01-27 04:14:26', 'USER_INFO', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Регистрационная информация', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(3, '2021-01-27 04:14:26', 'USER_PASS_REQUEST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Запрос на смену пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(4, '2021-01-27 04:14:26', 'USER_PASS_CHANGED', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение смены пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(5, '2021-01-27 04:14:26', 'NEW_USER_CONFIRM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение регистрации нового пользователя', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере #SERVER_NAME#.\n\nВаш код для подтверждения регистрации: #CONFIRM_CODE#\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#&confirm_code=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере <?=$arParams[\"SERVER_NAME\"];?>.\n\nВаш код для подтверждения регистрации: <?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>&confirm_code=<?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>\n\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(6, '2021-01-27 04:14:26', 'USER_INVITE', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Приглашение на сайт', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\nЗдравствуйте, #NAME# #LAST_NAME#!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: #ID#\nLogin: #LOGIN#\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth.php?change_password=yes&USER_LOGIN=#URL_LOGIN#&USER_CHECKWORD=#CHECKWORD#\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\nЗдравствуйте, <?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"ID\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth.php?change_password=yes&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>\n\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(7, '2021-01-27 04:14:27', 'FEEDBACK_FORM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: Сообщение из формы обратной связи', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: #AUTHOR#\nE-mail автора: #AUTHOR_EMAIL#\n\nТекст сообщения:\n#TEXT#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nE-mail автора: <?=$arParams[\"AUTHOR_EMAIL\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"TEXT\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(8, '2021-01-27 04:14:27', 'MAIN_MAIL_CONFIRM_CODE', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#MESSAGE_SUBJECT#', '<? EventMessageThemeCompiler::includeComponent(\'bitrix:main.mail.confirm\', \'\', $arParams); ?>', '<? EventMessageThemeCompiler::includeComponent(\'bitrix:main.mail.confirm\', \'\', $arParams); ?>', 'html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mail_join', NULL, NULL),
(9, '2021-01-27 04:14:27', 'EVENT_LOG_NOTIFICATION', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', 'Оповещение журнала событий: #NAME#', 'Зафиксированы события в журнале, соответствующие параметрам оповещения:\n\nТип события: #AUDIT_TYPE_ID#\nОбъект: #ITEM_ID#\nПользователь: #USER_ID# \nIP-адрес: #REMOTE_ADDR#\nБраузер: #USER_AGENT#\nСтраница: #REQUEST_URI# \n\nКоличество записей: #EVENT_COUNT# \n\n#ADDITIONAL_TEXT#\n\nПерейти в журнал событий:\nhttp://#SERVER_NAME#/bitrix/admin/event_log.php?set_filter=Y&find_audit_type_id=#AUDIT_TYPE_ID#', 'Зафиксированы события в журнале, соответствующие параметрам оповещения:\n\nТип события: <?=$arParams[\"AUDIT_TYPE_ID\"];?>\n\nОбъект: <?=$arParams[\"ITEM_ID\"];?>\n\nПользователь: <?=$arParams[\"USER_ID\"];?> \nIP-адрес: <?=$arParams[\"REMOTE_ADDR\"];?>\n\nБраузер: <?=$arParams[\"USER_AGENT\"];?>\n\nСтраница: <?=$arParams[\"REQUEST_URI\"];?> \n\nКоличество записей: <?=$arParams[\"EVENT_COUNT\"];?> \n\n<?=$arParams[\"ADDITIONAL_TEXT\"];?>\n\n\nПерейти в журнал событий:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/bitrix/admin/event_log.php?set_filter=Y&find_audit_type_id=<?=$arParams[\"AUDIT_TYPE_ID\"];?>', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(10, '2021-01-27 04:14:27', 'USER_CODE_REQUEST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Запрос кода авторизации', 'Используйте для авторизации код:\n\n#CHECKWORD#\n\nПосле авторизации вы сможете изменить свой пароль в редактировании профиля.\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nЛогин: #LOGIN#\n\nСообщение создано автоматически.', 'Используйте для авторизации код:\n\n<?=$arParams[\"CHECKWORD\"];?>\n\n\nПосле авторизации вы сможете изменить свой пароль в редактировании профиля.\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nЛогин: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение создано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru');
-- -----------------------------------
-- Dumping table b_event_message_attachment
-- -----------------------------------
DROP TABLE IF EXISTS `b_event_message_attachment`;
CREATE TABLE `b_event_message_attachment` (
  `EVENT_MESSAGE_ID` int(18) NOT NULL,
  `FILE_ID` int(18) NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_event_message_site
-- -----------------------------------
DROP TABLE IF EXISTS `b_event_message_site`;
CREATE TABLE `b_event_message_site` (
  `EVENT_MESSAGE_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_event_message_site` VALUES
(1, 's1'),
(2, 's1'),
(3, 's1'),
(4, 's1'),
(5, 's1'),
(6, 's1'),
(7, 's1'),
(8, 's1'),
(9, 's1'),
(10, 's1');
-- -----------------------------------
-- Dumping table b_event_type
-- -----------------------------------
DROP TABLE IF EXISTS `b_event_type`;
CREATE TABLE `b_event_type` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `SORT` int(18) NOT NULL DEFAULT '150',
  `EVENT_TYPE` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'email',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_1` (`EVENT_NAME`,`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_event_type` VALUES
(1, 'ru', 'NEW_USER', 'Зарегистрировался новый пользователь', '\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n', 1, 'email'),
(2, 'ru', 'USER_INFO', 'Информация о пользователе', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 2, 'email'),
(3, 'ru', 'NEW_USER_CONFIRM', 'Подтверждение регистрации нового пользователя', '\n\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n#CONFIRM_CODE# - Код подтверждения\n', 3, 'email'),
(4, 'ru', 'USER_PASS_REQUEST', 'Запрос на смену пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 4, 'email'),
(5, 'ru', 'USER_PASS_CHANGED', 'Подтверждение смены пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 5, 'email'),
(6, 'ru', 'USER_INVITE', 'Приглашение на сайт нового пользователя', '#ID# - ID пользователя\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#PASSWORD# - пароль пользователя \n#CHECKWORD# - Контрольная строка для смены пароля\n#XML_ID# - ID пользователя для связи с внешними источниками\n', 6, 'email'),
(7, 'ru', 'FEEDBACK_FORM', 'Отправка сообщения через форму обратной связи', '#AUTHOR# - Автор сообщения\n#AUTHOR_EMAIL# - Email автора сообщения\n#TEXT# - Текст сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 7, 'email'),
(8, 'ru', 'MAIN_MAIL_CONFIRM_CODE', 'Подтверждение email-адреса отправителя', '\n\n#EMAIL_TO# - Email-адрес для подтверждения\n#MESSAGE_SUBJECT# - Тема сообщения\n#CONFIRM_CODE# - Код подтверждения', 8, 'email'),
(9, 'ru', 'EVENT_LOG_NOTIFICATION', 'Оповещение журнала событий', '#EMAIL# - Email получателя\n#ADDITIONAL_TEXT# - Дополнительный текст действия\n#NAME# - Название оповещения\n#AUDIT_TYPE_ID# - Тип события\n#ITEM_ID# - Объект\n#USER_ID# - Пользователь\n#REMOTE_ADDR# - IP-адрес\n#USER_AGENT# - Браузер\n#REQUEST_URI# - Страница\n#EVENT_COUNT# - Количество записей', 9, 'email'),
(10, 'ru', 'USER_CODE_REQUEST', 'Запрос кода авторизации', '#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#LOGIN# - Логин\n#CHECKWORD# - Код для авторизации\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - Email пользователя\n', 10, 'email'),
(11, 'ru', 'SMS_USER_CONFIRM_NUMBER', 'Подтверждение номера телефона по СМС', '#USER_PHONE# - номер телефона\n#CODE# - код подтверждения\n', 100, 'sms'),
(12, 'ru', 'SMS_USER_RESTORE_PASSWORD', 'Восстановление пароля через СМС', '#USER_PHONE# - номер телефона\n#CODE# - код для восстановления\n', 100, 'sms'),
(13, 'ru', 'SMS_EVENT_LOG_NOTIFICATION', 'Оповещение журнала событий', '#PHONE_NUMBER# - Номер телефона получателя\n#ADDITIONAL_TEXT# - Дополнительный текст действия\n#NAME# - Название оповещения\n#AUDIT_TYPE_ID# - Тип события\n#ITEM_ID# - Объект\n#USER_ID# - Пользователь\n#REMOTE_ADDR# - IP-адрес\n#USER_AGENT# - Браузер\n#REQUEST_URI# - Страница\n#EVENT_COUNT# - Количество записей', 100, 'sms'),
(14, 'en', 'NEW_USER', 'New user was registered', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#USER_IP# - User IP\n#USER_HOST# - User Host\n', 1, 'email'),
(15, 'en', 'USER_INFO', 'Account Information', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 2, 'email'),
(16, 'en', 'NEW_USER_CONFIRM', 'New user registration confirmation', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - E-mail\n#NAME# - First name\n#LAST_NAME# - Last name\n#USER_IP# - User IP\n#USER_HOST# - User host\n#CONFIRM_CODE# - Confirmation code\n', 3, 'email'),
(17, 'en', 'USER_PASS_REQUEST', 'Password Change Request', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 4, 'email'),
(18, 'en', 'USER_PASS_CHANGED', 'Password Change Confirmation', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 5, 'email'),
(19, 'en', 'USER_INVITE', 'Invitation of a new site user', '#ID# - User ID\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#PASSWORD# - User password \n#CHECKWORD# - Password check string\n#XML_ID# - User ID to link with external data sources\n\n', 6, 'email'),
(20, 'en', 'FEEDBACK_FORM', 'Sending a message using a feedback form', '#AUTHOR# - Message author\n#AUTHOR_EMAIL# - Author\'s e-mail address\n#TEXT# - Message text\n#EMAIL_FROM# - Sender\'s e-mail address\n#EMAIL_TO# - Recipient\'s e-mail address', 7, 'email'),
(21, 'en', 'MAIN_MAIL_CONFIRM_CODE', 'Confirm sender\'s email address', '\n\n#EMAIL_TO# - confirmation email address\n#MESSAGE_SUBJECT# - Message subject\n#CONFIRM_CODE# - Confirmation code', 8, 'email'),
(22, 'en', 'EVENT_LOG_NOTIFICATION', 'Event log notification', '#EMAIL# - Recipient email\n#ADDITIONAL_TEXT# - Action additional text\n#NAME# - Notification name\n#AUDIT_TYPE_ID# - Event type\n#ITEM_ID# - Object\n#USER_ID# - User\n#REMOTE_ADDR# - IP address\n#USER_AGENT# - Browser\n#REQUEST_URI# - Page URL\n#EVENT_COUNT# - Number of events', 9, 'email'),
(23, 'en', 'USER_CODE_REQUEST', 'Request for verification code', '#USER_ID# - user ID\n#STATUS# - Login status\n#LOGIN# - Login\n#CHECKWORD# - Verification code\n#NAME# - First name\n#LAST_NAME# - Last name\n#EMAIL# - User email\n', 10, 'email'),
(24, 'en', 'SMS_USER_CONFIRM_NUMBER', 'Verify phone number using SMS', '#USER_PHONE# - phone number\n#CODE# - confirmation code', 100, 'sms'),
(25, 'en', 'SMS_USER_RESTORE_PASSWORD', 'Recover password using SMS', '#USER_PHONE# - phone number\n#CODE# - recovery confirmation code', 100, 'sms'),
(26, 'en', 'SMS_EVENT_LOG_NOTIFICATION', 'Event log notification', '#PHONE_NUMBER# - Recipient phone number\n#ADDITIONAL_TEXT# - Action additional text\n#NAME# - Notification name\n#AUDIT_TYPE_ID# - Event type\n#ITEM_ID# - Object\n#USER_ID# - User\n#REMOTE_ADDR# - IP address\n#USER_AGENT# - Browser\n#REQUEST_URI# - Page URL\n#EVENT_COUNT# - Number of events', 100, 'sms');
-- -----------------------------------
-- Dumping table b_favorite
-- -----------------------------------
DROP TABLE IF EXISTS `b_favorite`;
CREATE TABLE `b_favorite` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  `COMMENTS` text COLLATE utf8_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `CODE_ID` int(18) DEFAULT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `MENU_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_file
-- -----------------------------------
DROP TABLE IF EXISTS `b_file`;
CREATE TABLE `b_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HEIGHT` int(18) DEFAULT NULL,
  `WIDTH` int(18) DEFAULT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `CONTENT_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'IMAGE',
  `SUBDIR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ORIGINAL_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HANDLER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FILE_EXTERNAL_ID` (`EXTERNAL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_file` VALUES
(1, '2021-01-27 06:21:31', 'iblock', 97, 117, 7208, 'image/gif', 'iblock/74f', '74fa5df0af30d0664255a32a5714e691.gif', '9f643eecc497982747178145cc4736a4.gif', '', NULL, '7d53fd6e5f9bdc2254bfd1b1fceb5cc4'),
(2, '2021-01-27 06:21:31', 'iblock', 97, 118, 6154, 'image/gif', 'iblock/c83', 'c83f0c16309e224e810b4f35318b9f3c.gif', '9baa9f7a5c946e28647383d6d4a7fed2.gif', '', NULL, 'b6bc62034164da446f42407ddaf4b5fd'),
(3, '2021-01-27 06:21:31', 'iblock', 97, 115, 7024, 'image/gif', 'iblock/c6d', 'c6d00e8057e2a43c00e16c5dd1577389.gif', '3583b1ad0ff085c4fc5cc3ef35c117f5.gif', '', NULL, '5e4d3c6be2f76c8e57707cc3b98287bd'),
(4, '2021-01-27 06:21:31', 'iblock', 97, 117, 8177, 'image/gif', 'iblock/e61', 'e61c31f4c06578c05e94c1ace0562300.gif', 'e41c3f9d5834738bb4b1a8bda651989d.gif', '', NULL, 'd2052402cea29429468c1da2434056a8'),
(5, '2021-01-27 06:21:31', 'iblock', 75, 82, 6081, 'image/jpeg', 'iblock/f71', 'f718a776044e7202ba2b6d9fc98ef7d4.jpg', '2e602c1c22ccb832df21ad28ad5edaad.jpg', '', NULL, '3d6953d644741f5422d2587a593c2263'),
(6, '2021-01-27 06:21:31', 'iblock', 365, 400, 93204, 'image/jpeg', 'iblock/178', '178f96a4e437a5b7fe424f5e54823e55.jpg', '09812c445d3ee5f5311bbe7e44ee7d6f.jpg', '', NULL, '5283ee24cd05daf110e03ab43f4bac3f'),
(7, '2021-01-27 06:21:31', 'iblock', 62, 75, 4431, 'image/jpeg', 'iblock/68b', '68b5b4080905ce67ff985f4c4c9c4148.jpg', 'bb30381459dbbbe12e882e632f6b1c53.jpg', '', NULL, '18bda3d93fb4e324c88431f8fe55d0d1'),
(8, '2021-01-27 06:21:31', 'iblock', 331, 400, 82283, 'image/jpeg', 'iblock/bcc', 'bcc8047213e28a2a23eb1a0f6bd6fa88.jpg', '626ca8c573225d46d0b4d809cebb3dae.jpg', '', NULL, 'af7e00e83208f0d27fcfd0a586889b56'),
(9, '2021-01-27 06:21:32', 'iblock', 75, 47, 3075, 'image/jpeg', 'iblock/901', '90196c9319f0599bc52c7c2656b231d5.jpg', '1f5d4439c837ba415e78b9645ae0d73b.jpg', '', NULL, '0c1b03f1f8124195da9ef3ac403ece35'),
(10, '2021-01-27 06:21:32', 'iblock', 400, 250, 29739, 'image/jpeg', 'iblock/7fa', '7fadd468ce97572e268fd782f0b481b5.jpg', '885f25305f6c920393bf447112730a32.jpg', '', NULL, 'e79d2e9452ccbd82571df4bf01852040'),
(11, '2021-01-27 06:21:32', 'iblock', 75, 49, 3038, 'image/jpeg', 'iblock/157', '1575808499be7c630f83793c9a354d02.jpg', 'ab929afb73ab299a22e03cc039569505.jpg', '', NULL, '96374bba59bf9d261b8a02f6b2d6e71d'),
(12, '2021-01-27 06:21:32', 'iblock', 400, 260, 36309, 'image/jpeg', 'iblock/6cc', '6cc62039ccfcdb9edc1e10cf77e85d6a.jpg', 'f2bca316eede55098cab3bfda5b46697.jpg', '', NULL, '0e1348b0e7b7e09d7f895c00090eeb96'),
(13, '2021-01-27 06:21:32', 'iblock', 75, 46, 2766, 'image/jpeg', 'iblock/c28', 'c28ad6dea9c1688e1d8fa7ccec32ee03.jpg', '74a072234e4b35fc24ee618bfc7dc98b.jpg', '', NULL, '7c2658a279bd637b08512f9defd16f98'),
(14, '2021-01-27 06:21:32', 'iblock', 400, 247, 26265, 'image/jpeg', 'iblock/33b', '33b081808c3c826b62d9908c374f62bc.jpg', '6237fa3331d46f6efe0409d7d24cdb25.jpg', '', NULL, '273a4a3252059c2b9c58950688feb714'),
(15, '2021-01-27 06:21:32', 'iblock', 59, 75, 4604, 'image/jpeg', 'iblock/96c', '96c5792552eee9889bd7ae890c56db6a.jpg', '3392f27c38911965c60026ff9c0d3ef6.jpg', '', NULL, '759ddcb28cfa28f4f738a771c5dea860'),
(16, '2021-01-27 06:21:32', 'iblock', 313, 400, 57378, 'image/jpeg', 'iblock/5f7', '5f722a92cc766919a1b0e35303bd06fa.jpg', 'baee3922cc3b782c479845cd9a51aa2b.jpg', '', NULL, '69062352802a2fb70aaf922a1d0bb827'),
(17, '2021-01-27 06:21:33', 'iblock', 49, 75, 3877, 'image/jpeg', 'iblock/2d9', '2d9216967fa771f6d88a842c794f4602.jpg', '2bdc35b67545840a286ee2ade1e53cf1.jpg', '', NULL, '83e82da486d3aee8154ebe32013ee596'),
(18, '2021-01-27 06:21:33', 'iblock', 264, 400, 96792, 'image/jpeg', 'iblock/349', '3493ce19b0b4b512046e6740792cf278.jpg', '9444ca19815887874cfa5ccd2cf9b08e.jpg', '', NULL, '7171e0094700d62bc27291c7b410b0d8'),
(19, '2021-01-27 06:21:33', 'iblock', 41, 75, 4223, 'image/jpeg', 'iblock/5f4', '5f4f4ba2a60376a99b15b937568a6b56.jpg', '9b1cf849b8732e25002db920755486e9.jpg', '', NULL, '776636a0fe1dbc845ea9e0d40603e045'),
(20, '2021-01-27 06:21:33', 'iblock', 220, 400, 65934, 'image/jpeg', 'iblock/ba2', 'ba261791a2b2e1a32ccbbd80ad6fcdf0.jpg', '38f3bb38d0be153aa8233f8959141b8d.jpg', '', NULL, 'd5df0dc45acdde4cf226a92fac94045b'),
(21, '2021-01-27 06:21:33', 'iblock', 62, 75, 4454, 'image/jpeg', 'iblock/098', '098a838bcf80828e3c503bacd385a572.jpg', 'd64f02c32d7aec7d187dfb4d6e89c56b.jpg', '', NULL, '64d814c44c6d9745a83bfe53ca06bc87'),
(22, '2021-01-27 06:21:33', 'iblock', 329, 400, 78028, 'image/jpeg', 'iblock/717', '717fdd41eb16f8b0c21b1533b223e33a.jpg', '445fcbf65c020dbaebf811a58b7ef941.jpg', '', NULL, '8fd2f4574d12f852da313d5c3a909546'),
(23, '2021-01-27 06:21:33', 'iblock', 50, 75, 4281, 'image/jpeg', 'iblock/e04', 'e041575afa067a49383b0842553a28a0.jpg', '4d4fcbcf706e07d5920751b96b2390a2.jpg', '', NULL, 'ca9a25c506a5bb072bfa2fb8f8f4f7b8'),
(24, '2021-01-27 06:21:33', 'iblock', 269, 400, 62994, 'image/jpeg', 'iblock/5c5', '5c5ebcbf93faa2a67c878c4cc0759b8a.jpg', '7412d2f4d2b8e91187d39405c1c331c0.jpg', '', NULL, '1c2f06b8a9d08dc2e2bb913296db7781'),
(25, '2021-01-27 06:21:34', 'iblock', 32, 75, 2529, 'image/jpeg', 'iblock/b58', 'b58c746aec31b93ae7c069c3bf54a7cd.jpg', 'a20a430640daab0d2e80587a991043dc.jpg', '', NULL, '2827ed6555e2ad7d1ab9fa05178fd86a'),
(26, '2021-01-27 06:21:34', 'iblock', 171, 400, 43694, 'image/jpeg', 'iblock/789', '789aaa746a622a0714f941e03b7f0e02.jpg', '2b671b45113c251546674131e9681c89.jpg', '', NULL, '297208428a1f9ac7e704dc2d038fffc5'),
(27, '2021-01-27 06:21:34', 'iblock', 52, 75, 3543, 'image/jpeg', 'iblock/aba', 'abac3cbbd8a873c84b6aa8ca33394f63.jpg', '35962bde726c3ffaf7ccdfd9bb607379.jpg', '', NULL, 'd26bf387d81e2aee9bd568a2fbf9e9cf'),
(28, '2021-01-27 06:21:34', 'iblock', 276, 400, 45830, 'image/jpeg', 'iblock/25e', '25e75c69f10b240a621a1eba096f0abd.jpg', '1421f08c8613b257c93f95ca3fd2826d.jpg', '', NULL, 'da0fbd7b44de760571741022ef770e56'),
(29, '2021-01-27 06:21:34', 'iblock', 69, 75, 4545, 'image/jpeg', 'iblock/afb', 'afb12cdafce8739362524dd3c3247a46.jpg', '331184f76e4aafea8728856ad06f4487.jpg', '', NULL, '7b930d7182ff8df315ab518e35639b70'),
(30, '2021-01-27 06:21:34', 'iblock', 366, 400, 50389, 'image/jpeg', 'iblock/10b', '10b4474de67a5a2664386f7765c14ed3.jpg', 'e26a955a944250ca5980f143faaadfbb.jpg', '', NULL, 'eeb73a53c1dcf5b3e792efa2d615301b'),
(31, '2021-01-27 06:21:35', 'iblock', 52, 75, 4430, 'image/jpeg', 'iblock/7ec', '7ec99f2291ed7ae6f76cf4f427adf9b1.jpg', '3e84c9ae297f66002462ef2782524e1c.jpg', '', NULL, '501bbf46014cb1d281b53ea7b83cd0c5'),
(32, '2021-01-27 06:21:35', 'iblock', 279, 400, 60160, 'image/jpeg', 'iblock/6f4', '6f42da99cba6e34899f9902703c78383.jpg', '16798358158a0c4e8e280370dad92e34.jpg', '', NULL, '95830a915d346e71c4c149849c10afe1'),
(33, '2021-01-27 06:21:35', 'iblock', 75, 74, 5105, 'image/jpeg', 'iblock/d72', 'd72f95ee134fdc967715f7d2487688c6.jpg', '809194f5dcf2a15a37cdcaa8e3abbe3d.jpg', '', NULL, 'c650d99532bef755d0ffa9335f470802'),
(34, '2021-01-27 06:21:35', 'iblock', 400, 394, 67705, 'image/jpeg', 'iblock/411', '411b5d8f1b691c040c3fbaee085463b5.jpg', '2883876e37fde7403e471cc9a24ea3e7.jpg', '', NULL, 'a98e999a2533a72f0e0cb3849a67138e'),
(35, '2021-01-27 06:21:35', 'iblock', 75, 54, 3651, 'image/jpeg', 'iblock/f04', 'f0464a19ac9de71f6e22ab07c1b45762.jpg', '434f471a7920ed00e08fb3916569e1f7.jpg', '', NULL, '35315885e9c2132a90402689d9d98228'),
(36, '2021-01-27 06:21:35', 'iblock', 400, 286, 40331, 'image/jpeg', 'iblock/41f', '41f2807872bde508ffef8e7f106b9c22.jpg', '7fe0d47b409d9aa6097128b113e753b9.jpg', '', NULL, 'db91cd9c30e5b3cc674f7eddee9c5a1b'),
(37, '2021-01-27 06:21:36', 'iblock', 75, 45, 3564, 'image/jpeg', 'iblock/0bc', '0bcbdefa5c5e1185f0b8c21d2375f67f.jpg', 'a7b9328dab5d8599953605e2d14da0b3.jpg', '', NULL, '1f5ad9c2de69e183b83bad77cc962acf'),
(38, '2021-01-27 06:21:36', 'iblock', 400, 238, 42306, 'image/jpeg', 'iblock/0d2', '0d28cc8d7d1dfb26a557e2672135c258.jpg', 'e4427787c59b56b70a9c0381453f88dc.jpg', '', NULL, '6066afff6bef5b67dc850b1e250443c5'),
(39, '2021-01-27 06:21:36', 'iblock', 75, 47, 2666, 'image/jpeg', 'iblock/338', '3388e5c41e705bc271ff9aadcb1e5102.jpg', '3413e989dd3239527ed2144bdb285a2b.jpg', '', NULL, '4b03f33675077b161fcd9838a1e46871'),
(40, '2021-01-27 06:21:36', 'iblock', 400, 249, 26842, 'image/jpeg', 'iblock/518', '518d71130be7f257e3008a5a8961a3bd.jpg', '4f2b682c4cc7361e22e669e8faa4f344.jpg', '', NULL, '22bc15f7d776a5791911747dc5f30f8d'),
(41, '2021-01-27 06:21:36', 'iblock', 75, 45, 3069, 'image/jpeg', 'iblock/325', '3251f408f5ac5afd8eabb47dd3ee6ebe.jpg', '26051473b5a68363a0882915e3e020e5.jpg', '', NULL, '77546ef250c95307818c6ad777af92a9'),
(42, '2021-01-27 06:21:37', 'iblock', 400, 239, 36150, 'image/jpeg', 'iblock/1ed', '1ed84275d0306630205593154cfc4717.jpg', '8c00778d633d1db6aaf29242c1602897.jpg', '', NULL, '9a0e6191b30dfb9512873f84150f1b5b'),
(43, '2021-01-27 06:21:37', 'iblock', 75, 47, 3403, 'image/jpeg', 'iblock/301', '301e3d872b57cea2a97ad3e22f7d9278.jpg', 'd1a244031379e20a9d7f9cf85227bb2e.jpg', '', NULL, 'd536cb262a775e7a33c59e741a65fb68'),
(44, '2021-01-27 06:21:37', 'iblock', 400, 250, 34322, 'image/jpeg', 'iblock/ef3', 'ef33241dfc40f953db9449c84c4ddc52.jpg', '8b88ada642f37df4236b4cd129b85292.jpg', '', NULL, '07d3de993206ddb91a7c294628ee6f31'),
(45, '2021-01-27 06:21:37', 'iblock', 75, 49, 3941, 'image/jpeg', 'iblock/c76', 'c76acef87dcc7e422839a961c5a73cad.jpg', 'af64b255f19f75b080d5b934f156c590.jpg', '', NULL, '61e525d263d7f8cb5ce1a186de828dd6'),
(46, '2021-01-27 06:21:37', 'iblock', 400, 261, 37746, 'image/jpeg', 'iblock/1cc', '1cc8c5d88fba11da6ed1cc02e737a849.jpg', 'b6dabd5a96bb11b68a8d7d2dd9c9a4e0.jpg', '', NULL, 'f35118d226de5343ce4c15837d724593'),
(47, '2021-01-27 06:21:37', 'iblock', 75, 59, 3571, 'image/jpeg', 'iblock/e94', 'e94e0d50c9cc80cf34032d009386b31d.jpg', '058550b5373b90e56aacb376028089f4.jpg', '', NULL, '32c8acb82b20ed1f321579592ae36679'),
(48, '2021-01-27 06:21:37', 'iblock', 400, 312, 34110, 'image/jpeg', 'iblock/b00', 'b0059c6912e97a25e38377b2526a2210.jpg', 'e2612b793f41a81309fcc54bcbf65783.jpg', '', NULL, '63651af8b8f14ef256781e1c2eee6cd0'),
(49, '2021-01-27 06:21:38', 'iblock', 75, 48, 3030, 'image/jpeg', 'iblock/82a', '82afb614de8f15adb801ed47ff989c60.jpg', '8065fe760829c4055200ea4831d72c17.jpg', '', NULL, '26181ea78fc81ca40dbea1fe6f5d2119'),
(50, '2021-01-27 06:21:38', 'iblock', 400, 258, 29503, 'image/jpeg', 'iblock/797', '797ac9ae2bd1fc75cf905753c8e93ae5.jpg', '8b6d3cc80b138843463e65ae7a97ffe1.jpg', '', NULL, 'dbc94ffb6443ec079d467d2fe450af3d'),
(51, '2021-01-27 06:21:39', 'iblock', 75, 52, 2250, 'image/jpeg', 'iblock/b18', 'b18dbce19327dcb77a5abebfc7d5602b.jpg', 'a89665621b4b083248a5a8016be4e380.jpg', '', NULL, 'f1f02ba5369942a2b5c58cf449602cbc'),
(52, '2021-01-27 06:21:39', 'iblock', 400, 279, 22919, 'image/jpeg', 'iblock/efe', 'efe429312a53d1e852855951cc00a98e.jpg', '93de20bec81a906df174ababa31d856e.jpg', '', NULL, 'd38a65fd7e48941ed427c044e1028ced'),
(53, '2021-01-27 06:21:42', 'iblock', 97, 115, 5781, 'image/gif', 'iblock/b15', 'b15dc2bb6cff13e6b4781a471cdb43d3.gif', '8b0b3bc52fec8070e3561af5d05cd3a8.gif', '', NULL, '4a3d72dcce6a28ea9aa42a81e7c61665'),
(54, '2021-01-27 06:21:42', 'iblock', 97, 116, 7345, 'image/gif', 'iblock/43d', '43d3d5c21800a7b22b19b2a03f2e5ed8.gif', '38bf3b317397e56d07fe06731ca3a441.gif', '', NULL, '383d86d3cfb7a3513c84f410f09b59a6');
-- -----------------------------------
-- Dumping table b_file_duplicate
-- -----------------------------------
DROP TABLE IF EXISTS `b_file_duplicate`;
CREATE TABLE `b_file_duplicate` (
  `DUPLICATE_ID` int(11) NOT NULL,
  `ORIGINAL_ID` int(11) NOT NULL,
  `COUNTER` int(11) NOT NULL DEFAULT '1',
  `ORIGINAL_DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`DUPLICATE_ID`,`ORIGINAL_ID`),
  KEY `ix_file_duplicate_duplicate` (`ORIGINAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_file_hash
-- -----------------------------------
DROP TABLE IF EXISTS `b_file_hash`;
CREATE TABLE `b_file_hash` (
  `FILE_ID` int(11) NOT NULL,
  `FILE_SIZE` bigint(20) NOT NULL,
  `FILE_HASH` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`FILE_ID`),
  KEY `ix_file_hash_size_hash` (`FILE_SIZE`,`FILE_HASH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_file_hash` VALUES
(1, 7208, 'f555d211cdbc1813d85fc86510b71271'),
(2, 6154, '801fd67c05feb823f41dc1b04bccb28b'),
(3, 7024, '8871eb4e30bee10042b94bdf6ba4c9de'),
(4, 8177, 'b3e1ec608ed05b955679e36f3f880f3a'),
(5, 6081, '1dd24849a140831fa3bfdf9216cfa324'),
(6, 93204, '7cd11330a85f6a33a965e556765e8377'),
(7, 4431, '8d9db9b5c7256a0a2e0665c9a0ce717b'),
(8, 82283, 'd72d6689e017a5df9d4e934c33368a28'),
(9, 3075, '4d4dba83eefeca5ee297bf001f2ebe49'),
(10, 29739, '55812c054f5b27968d6368c1f6ff99e3'),
(11, 3038, 'ebae70f5b8e0b7f32491e8cb3d4a5fe0'),
(12, 36309, '80348b430472b21300d07843d2243298'),
(13, 2766, 'ebed23f646d3caa94be2ecc8f120f348'),
(14, 26265, 'e1a3c91f8b61bdf554d6a633cb571a13'),
(15, 4604, '4b638ea72e35801d725467ea6a6b22d0'),
(16, 57378, '9f0b948952c923c8f2681ec0a676ecda'),
(17, 3877, '3cc3d123dcb0e2e2b9c0b132c6899377'),
(18, 96792, 'c0ddb17f88c8774c49152597151bc889'),
(19, 4223, 'd013802d4eaacb22d3b191ae9336acfc'),
(20, 65934, '4a6d61200c65c5fae1edb3257f139814'),
(21, 4454, 'c38c571f461f73d6603f6f9899bfb38f'),
(22, 78028, '566d3ca01a911209d725af6acf7fe2e2'),
(23, 4281, 'f6c5cb158fc20b08bc19783594d2c2c6'),
(24, 62994, '867d262b3a87bffa5ccdbf263892237a'),
(25, 2529, 'e67f86ea4e543d6c55b1efc8658a3768'),
(26, 43694, '8935ffe5360ab7107aa9fa4dce5db83a'),
(27, 3543, '6faa1cc2118271dbaa0b8b7c91be083d'),
(28, 45830, '8d315ab23919cfe7bc8a27b17d3263bd'),
(29, 4545, 'bf7b6806fd8fb5744524cccdbd6d20c1'),
(30, 50389, 'a4b82c4ad062e9db9393d2c36e57f4b0'),
(31, 4430, '6a57320a23c83b68513de2d1dffd7c45'),
(32, 60160, '970e21ce3dd16e5f086362ec16a2991b'),
(33, 5105, 'b69f3c2e6f93afbbafd0593bcef0014a'),
(34, 67705, 'c46e5cbe534fca3f80c16e28f392b871'),
(35, 3651, 'b8503c324cc4791770600cfe02502338'),
(36, 40331, '42670164f8c6df757777de5a505383a6'),
(37, 3564, 'b2d9df531428c9c4ab2069ff3cccb396'),
(38, 42306, 'b913419ba9bc395b68eaadcf43f307e7'),
(39, 2666, 'e8f8432f3db3efdfa34ecc7ef1055421'),
(40, 26842, 'f71ebe462284fe3d9885752584df5e00'),
(41, 3069, '6f6f636ab86802825d54b2e63af234d3'),
(42, 36150, 'a6de9198d6dc111b0ed5b90021e08994'),
(43, 3403, '22c0571db1dffa96bfec36af3491686c'),
(44, 34322, '1513b2aa8569e46de71ced35c75191c0'),
(45, 3941, '0e1ba47356d2ed06dda95fd165c84f91'),
(46, 37746, '8a6b1bea0c2382f33c9e9daad1e3d81f'),
(47, 3571, '0f0567a0fd983b832defa9457aeb86e8'),
(48, 34110, '36e2ccccd3ea42d4f257082efb638c24'),
(49, 3030, 'd42b550c90b4ba257d2450e71fdc9af9'),
(50, 29503, '7580a6e3dfda932dec8a33062627b4c5'),
(51, 2250, '972d9a244f1afd1287890b87c5108bcc'),
(52, 22919, 'fa5c8a0c1e9ebab00250255146321cb7'),
(53, 5781, 'af2dd12dfa0512b48f07ce860ffc0f22'),
(54, 7345, '9d10c04d9d1b5a2a1ce108bdece71968');
-- -----------------------------------
-- Dumping table b_file_preview
-- -----------------------------------
DROP TABLE IF EXISTS `b_file_preview`;
CREATE TABLE `b_file_preview` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FILE_ID` int(18) NOT NULL,
  `PREVIEW_ID` int(18) DEFAULT NULL,
  `PREVIEW_IMAGE_ID` int(18) DEFAULT NULL,
  `CREATED_AT` datetime NOT NULL,
  `TOUCHED_AT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FILE_PL_TOUCH` (`TOUCHED_AT`),
  KEY `IX_B_FILE_PL_FILE` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_file_search
-- -----------------------------------
DROP TABLE IF EXISTS `b_file_search`;
CREATE TABLE `b_file_search` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SESS_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `F_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `B_DIR` int(11) NOT NULL DEFAULT '0',
  `F_SIZE` int(11) NOT NULL DEFAULT '0',
  `F_TIME` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_filters
-- -----------------------------------
DROP TABLE IF EXISTS `b_filters`;
CREATE TABLE `b_filters` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) DEFAULT NULL,
  `FILTER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELDS` text COLLATE utf8_unicode_ci NOT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) DEFAULT NULL,
  `SORT_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_finder_dest
-- -----------------------------------
DROP TABLE IF EXISTS `b_finder_dest`;
CREATE TABLE `b_finder_dest` (
  `USER_ID` int(11) NOT NULL,
  `CODE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_USER_ID` int(11) DEFAULT NULL,
  `CODE_TYPE` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTEXT` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_USE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`CODE`,`CONTEXT`),
  KEY `IX_FINDER_DEST` (`CODE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_geoip_handlers
-- -----------------------------------
DROP TABLE IF EXISTS `b_geoip_handlers`;
CREATE TABLE `b_geoip_handlers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(10) NOT NULL DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `CLASS_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_geoip_handlers` VALUES
(1, 100, 'N', '\\Bitrix\\Main\\Service\\GeoIp\\MaxMind', NULL),
(2, 110, 'Y', '\\Bitrix\\Main\\Service\\GeoIp\\SypexGeo', NULL);
-- -----------------------------------
-- Dumping table b_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_group`;
CREATE TABLE `b_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `ANONYMOUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECURITY_POLICY` text COLLATE utf8_unicode_ci,
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_group` VALUES
(1, NULL, 'Y', 1, 'N', 'Y', 'Администраторы', 'Полный доступ к управлению сайтом.', NULL, NULL),
(2, NULL, 'Y', 2, 'Y', 'Y', 'Все пользователи (в том числе неавторизованные)', 'Все пользователи, включая неавторизованных.', NULL, NULL),
(3, NULL, 'Y', 3, 'N', 'Y', 'Пользователи, имеющие право голосовать за рейтинг', 'В эту группу пользователи добавляются автоматически.', NULL, 'RATING_VOTE'),
(4, NULL, 'Y', 4, 'N', 'Y', 'Пользователи имеющие право голосовать за авторитет', 'В эту группу пользователи добавляются автоматически.', NULL, 'RATING_VOTE_AUTHORITY'),
(5, NULL, 'Y', 300, 'N', 'Y', 'Контент-редакторы', NULL, NULL, 'content_editor');
-- -----------------------------------
-- Dumping table b_group_collection_task
-- -----------------------------------
DROP TABLE IF EXISTS `b_group_collection_task`;
CREATE TABLE `b_group_collection_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `COLLECTION_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`,`COLLECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_group_subordinate
-- -----------------------------------
DROP TABLE IF EXISTS `b_group_subordinate`;
CREATE TABLE `b_group_subordinate` (
  `ID` int(18) NOT NULL,
  `AR_SUBGROUP_ID` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_group_task
-- -----------------------------------
DROP TABLE IF EXISTS `b_group_task`;
CREATE TABLE `b_group_task` (
  `GROUP_ID` int(18) NOT NULL,
  `TASK_ID` int(18) NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_group_task` VALUES
(5, 22, ''),
(5, 50, '');
-- -----------------------------------
-- Dumping table b_hlblock_entity
-- -----------------------------------
DROP TABLE IF EXISTS `b_hlblock_entity`;
CREATE TABLE `b_hlblock_entity` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `TABLE_NAME` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_hlblock_entity_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_hlblock_entity_lang`;
CREATE TABLE `b_hlblock_entity_lang` (
  `ID` int(11) unsigned NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_hlblock_entity_rights
-- -----------------------------------
DROP TABLE IF EXISTS `b_hlblock_entity_rights`;
CREATE TABLE `b_hlblock_entity_rights` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `HL_ID` int(11) unsigned NOT NULL,
  `TASK_ID` int(11) unsigned NOT NULL,
  `ACCESS_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_hot_keys
-- -----------------------------------
DROP TABLE IF EXISTS `b_hot_keys`;
CREATE TABLE `b_hot_keys` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `KEYS_STRING` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_ID` int(18) NOT NULL,
  `USER_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_b_hot_keys_co_u` (`CODE_ID`,`USER_ID`),
  KEY `ix_hot_keys_user` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_hot_keys` VALUES
(1, 'Ctrl+Alt+85', 139, 0),
(2, 'Ctrl+Alt+80', 17, 0),
(3, 'Ctrl+Alt+70', 120, 0),
(4, 'Ctrl+Alt+68', 117, 0),
(5, 'Ctrl+Alt+81', 3, 0),
(6, 'Ctrl+Alt+75', 106, 0),
(7, 'Ctrl+Alt+79', 133, 0),
(8, 'Ctrl+Alt+70', 121, 0),
(9, 'Ctrl+Alt+69', 118, 0),
(10, 'Ctrl+Shift+83', 87, 0),
(11, 'Ctrl+Shift+88', 88, 0),
(12, 'Ctrl+Shift+76', 89, 0),
(13, 'Ctrl+Alt+85', 139, 1),
(14, 'Ctrl+Alt+80', 17, 1),
(15, 'Ctrl+Alt+70', 120, 1),
(16, 'Ctrl+Alt+68', 117, 1),
(17, 'Ctrl+Alt+81', 3, 1),
(18, 'Ctrl+Alt+75', 106, 1),
(19, 'Ctrl+Alt+79', 133, 1),
(20, 'Ctrl+Alt+70', 121, 1),
(21, 'Ctrl+Alt+69', 118, 1),
(22, 'Ctrl+Shift+83', 87, 1),
(23, 'Ctrl+Shift+88', 88, 1),
(24, 'Ctrl+Shift+76', 89, 1);
-- -----------------------------------
-- Dumping table b_hot_keys_code
-- -----------------------------------
DROP TABLE IF EXISTS `b_hot_keys_code`;
CREATE TABLE `b_hot_keys_code` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CLASS_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE_OBJ` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_CUSTOM` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `ix_hot_keys_code_cn` (`CLASS_NAME`),
  KEY `ix_hot_keys_code_url` (`URL`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_hot_keys_code` VALUES
(3, 'CAdminTabControl', 'NextTab();', 'HK_DB_CADMINTC', 'HK_DB_CADMINTC_C', 'tab-container', '', 0),
(5, 'btn_new', 'var d=BX (\'btn_new\'); if (d) location.href = d.href;', 'HK_DB_BUT_ADD', 'HK_DB_BUT_ADD_C', 'btn_new', '', 0),
(6, 'btn_excel', 'var d=BX(\'btn_excel\'); if (d) location.href = d.href;', 'HK_DB_BUT_EXL', 'HK_DB_BUT_EXL_C', 'btn_excel', '', 0),
(7, 'btn_settings', 'var d=BX(\'btn_settings\'); if (d) location.href = d.href;', 'HK_DB_BUT_OPT', 'HK_DB_BUT_OPT_C', 'btn_settings', '', 0),
(8, 'btn_list', 'var d=BX(\'btn_list\'); if (d) location.href = d.href;', 'HK_DB_BUT_LST', 'HK_DB_BUT_LST_C', 'btn_list', '', 0),
(9, 'Edit_Save_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'save\'}}, true );  if (d) d.click();', 'HK_DB_BUT_SAVE', 'HK_DB_BUT_SAVE_C', 'Edit_Save_Button', '', 0),
(10, 'btn_delete', 'var d=BX(\'btn_delete\'); if (d) location.href = d.href;', 'HK_DB_BUT_DEL', 'HK_DB_BUT_DEL_C', 'btn_delete', '', 0),
(12, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'find\'}}, true ); if (d) d.focus();', 'HK_DB_FLT_FND', 'HK_DB_FLT_FND_C', 'find', '', 0),
(13, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'set_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_F', 'HK_DB_FLT_BUT_F_C', 'set_filter', '', 0),
(14, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'del_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_CNL', 'HK_DB_FLT_BUT_CNL_C', 'del_filter', '', 0),
(15, 'bx-panel-admin-button-help-icon-id', 'var d=BX(\'bx-panel-admin-button-help-icon-id\'); if (d) location.href = d.href;', 'HK_DB_BUT_HLP', 'HK_DB_BUT_HLP_C', 'bx-panel-admin-button-help-icon-id', '', 0),
(17, 'Global', 'BXHotKeys.ShowSettings();', 'HK_DB_SHW_L', 'HK_DB_SHW_L_C', 'bx-panel-hotkeys', '', 0),
(19, 'Edit_Apply_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'apply\'}}, true );  if (d) d.click();', 'HK_DB_BUT_APPL', 'HK_DB_BUT_APPL_C', 'Edit_Apply_Button', '', 0),
(20, 'Edit_Cancel_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'cancel\'}}, true );  if (d) d.click();', 'HK_DB_BUT_CANCEL', 'HK_DB_BUT_CANCEL_C', 'Edit_Cancel_Button', '', 0),
(54, 'top_panel_org_fav', '', '-=AUTONAME=-', NULL, 'top_panel_org_fav', NULL, 0),
(55, 'top_panel_module_settings', '', '-=AUTONAME=-', NULL, 'top_panel_module_settings', '', 0),
(56, 'top_panel_interface_settings', '', '-=AUTONAME=-', NULL, 'top_panel_interface_settings', '', 0),
(57, 'top_panel_help', '', '-=AUTONAME=-', NULL, 'top_panel_help', '', 0),
(58, 'top_panel_bizproc_tasks', '', '-=AUTONAME=-', NULL, 'top_panel_bizproc_tasks', '', 0),
(59, 'top_panel_add_fav', '', '-=AUTONAME=-', NULL, 'top_panel_add_fav', NULL, 0),
(60, 'top_panel_create_page', '', '-=AUTONAME=-', NULL, 'top_panel_create_page', '', 0),
(62, 'top_panel_create_folder', '', '-=AUTONAME=-', NULL, 'top_panel_create_folder', '', 0),
(63, 'top_panel_edit_page', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page', '', 0),
(64, 'top_panel_page_prop', '', '-=AUTONAME=-', NULL, 'top_panel_page_prop', '', 0),
(65, 'top_panel_edit_page_html', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page_html', '', 0),
(67, 'top_panel_edit_page_php', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page_php', '', 0),
(68, 'top_panel_del_page', '', '-=AUTONAME=-', NULL, 'top_panel_del_page', '', 0),
(69, 'top_panel_folder_prop', '', '-=AUTONAME=-', NULL, 'top_panel_folder_prop', '', 0),
(70, 'top_panel_access_folder_new', '', '-=AUTONAME=-', NULL, 'top_panel_access_folder_new', '', 0),
(71, 'main_top_panel_struct_panel', '', '-=AUTONAME=-', NULL, 'main_top_panel_struct_panel', '', 0),
(72, 'top_panel_cache_page', '', '-=AUTONAME=-', NULL, 'top_panel_cache_page', '', 0),
(73, 'top_panel_cache_comp', '', '-=AUTONAME=-', NULL, 'top_panel_cache_comp', '', 0),
(74, 'top_panel_cache_not', '', '-=AUTONAME=-', NULL, 'top_panel_cache_not', '', 0),
(75, 'top_panel_edit_mode', '', '-=AUTONAME=-', NULL, 'top_panel_edit_mode', '', 0),
(76, 'top_panel_templ_site_css', '', '-=AUTONAME=-', NULL, 'top_panel_templ_site_css', '', 0),
(77, 'top_panel_templ_templ_css', '', '-=AUTONAME=-', NULL, 'top_panel_templ_templ_css', '', 0),
(78, 'top_panel_templ_site', '', '-=AUTONAME=-', NULL, 'top_panel_templ_site', '', 0),
(81, 'top_panel_debug_time', '', '-=AUTONAME=-', NULL, 'top_panel_debug_time', '', 0),
(82, 'top_panel_debug_incl', '', '-=AUTONAME=-', NULL, 'top_panel_debug_incl', '', 0),
(83, 'top_panel_debug_sql', '', '-=AUTONAME=-', NULL, 'top_panel_debug_sql', NULL, 0),
(84, 'top_panel_debug_compr', '', '-=AUTONAME=-', NULL, 'top_panel_debug_compr', '', 0),
(85, 'MTP_SHORT_URI1', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI1', '', 0),
(86, 'MTP_SHORT_URI_LIST', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI_LIST', '', 0),
(87, 'FMST_PANEL_STICKER_ADD', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKER_ADD', '', 0),
(88, 'FMST_PANEL_STICKERS_SHOW', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKERS_SHOW', '', 0),
(89, 'FMST_PANEL_CUR_STICKER_LIST', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_CUR_STICKER_LIST', '', 0),
(90, 'FMST_PANEL_ALL_STICKER_LIST', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_ALL_STICKER_LIST', '', 0),
(91, 'top_panel_menu', 'var d=BX(\"bx-panel-menu\"); if (d) d.click();', '-=AUTONAME=-', NULL, 'bx-panel-menu', '', 0),
(92, 'top_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-admin-tab', '', 0),
(93, 'admin_panel_site', 'var d=BX(\'bx-panel-view-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-view-tab', '', 0),
(94, 'admin_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-admin-tab', '', 0),
(96, 'top_panel_folder_prop_new', '', '-=AUTONAME=-', NULL, 'top_panel_folder_prop_new', '', 0),
(97, 'main_top_panel_structure', '', '-=AUTONAME=-', NULL, 'main_top_panel_structure', '', 0),
(98, 'top_panel_clear_cache', '', '-=AUTONAME=-', NULL, 'top_panel_clear_cache', '', 0),
(99, 'top_panel_templ', '', '-=AUTONAME=-', NULL, 'top_panel_templ', '', 0),
(100, 'top_panel_debug', '', '-=AUTONAME=-', NULL, 'top_panel_debug', '', 0),
(101, 'MTP_SHORT_URI', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI', '', 0),
(102, 'FMST_PANEL_STICKERS', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKERS', '', 0),
(103, 'top_panel_settings', '', '-=AUTONAME=-', NULL, 'top_panel_settings', '', 0),
(104, 'top_panel_fav', '', '-=AUTONAME=-', NULL, 'top_panel_fav', '', 0),
(106, 'Global', 'location.href=\'/bitrix/admin/hot_keys_list.php?lang=ru\';', 'HK_DB_SHW_HK', '', '', '', 0),
(107, 'top_panel_edit_new', '', '-=AUTONAME=-', NULL, 'top_panel_edit_new', '', 0),
(108, 'FLOW_PANEL_CREATE_WITH_WF', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_CREATE_WITH_WF', '', 0),
(109, 'FLOW_PANEL_EDIT_WITH_WF', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_EDIT_WITH_WF', '', 0),
(110, 'FLOW_PANEL_HISTORY', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_HISTORY', '', 0),
(111, 'top_panel_create_new', '', '-=AUTONAME=-', NULL, 'top_panel_create_new', '', 0),
(112, 'top_panel_create_folder_new', '', '-=AUTONAME=-', NULL, 'top_panel_create_folder_new', '', 0),
(116, 'bx-panel-toggle', '', '-=AUTONAME=-', NULL, 'bx-panel-toggle', '', 0),
(117, 'bx-panel-small-toggle', '', '-=AUTONAME=-', NULL, 'bx-panel-small-toggle', '', 0),
(118, 'bx-panel-expander', 'var d=BX(\'bx-panel-expander\'); if (d) BX.fireEvent(d, \'click\');', '-=AUTONAME=-', NULL, 'bx-panel-expander', '', 0),
(119, 'bx-panel-hider', 'var d=BX(\'bx-panel-hider\'); if (d) d.click();', '-=AUTONAME=-', NULL, 'bx-panel-hider', '', 0),
(120, 'search-textbox-input', 'var d=BX(\'search-textbox-input\'); if (d) { d.click(); d.focus();}', '-=AUTONAME=-', '', 'search', '', 0),
(121, 'bx-search-input', 'var d=BX(\'bx-search-input\'); if (d) { d.click(); d.focus(); }', '-=AUTONAME=-', '', 'bx-search-input', '', 0),
(133, 'bx-panel-logout', 'var d=BX(\'bx-panel-logout\'); if (d) location.href = d.href;', '-=AUTONAME=-', '', 'bx-panel-logout', '', 0),
(135, 'CDialog', 'var d=BX(\'cancel\'); if (d) d.click();', 'HK_DB_D_CANCEL', '', 'cancel', '', 0),
(136, 'CDialog', 'var d=BX(\'close\'); if (d) d.click();', 'HK_DB_D_CLOSE', '', 'close', '', 0),
(137, 'CDialog', 'var d=BX(\'savebtn\'); if (d) d.click();', 'HK_DB_D_SAVE', '', 'savebtn', '', 0),
(138, 'CDialog', 'var d=BX(\'btn_popup_save\'); if (d) d.click();', 'HK_DB_D_EDIT_SAVE', '', 'btn_popup_save', '', 0),
(139, 'Global', 'location.href=\'/bitrix/admin/user_admin.php?lang=\'+phpVars.LANGUAGE_ID;', 'HK_DB_SHW_U', '', '', '', 0);
-- -----------------------------------
-- Dumping table b_iblock
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock`;
CREATE TABLE `b_iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `API_CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `LIST_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CANONICAL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `RSS_TTL` int(11) NOT NULL DEFAULT '24',
  `RSS_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `RSS_FILE_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RSS_FILE_LIMIT` int(11) DEFAULT NULL,
  `RSS_FILE_DAYS` int(11) DEFAULT NULL,
  `RSS_YANDEX_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_ELEMENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `INDEX_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `WORKFLOW` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `BIZPROC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SECTION_CHOOSER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RIGHTS_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PROPERTY` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROPERTY_INDEX` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `LAST_CONV_ELEMENT` int(11) NOT NULL DEFAULT '0',
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTIONS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENTS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_iblock_api_code` (`API_CODE`),
  KEY `ix_iblock` (`IBLOCK_TYPE_ID`,`LID`,`ACTIVE`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock` VALUES
(1, '2021-01-27 06:21:23', 'news', 's1', 'furniture_news_s1', NULL, 'Новости', 'Y', 500, '#SITE_DIR#/news/', '#SITE_DIR#/news/#ID#/', NULL, NULL, NULL, NULL, 'text', 24, 'Y', 'N', NULL, NULL, 'N', 'furniture_news_s1', '7f8ef281ce0f2e7e6e873be5ef7ff31d', 'Y', 'N', 'N', 'N', 'L', NULL, 'S', NULL, NULL, 1, 0, NULL, NULL, NULL, 'Разделы', 'Раздел', 'Новости', 'Новость'),
(2, '2021-01-27 06:21:39', 'products', 's1', 'furniture_products_s1', NULL, '[s1] Продукция', 'Y', 500, '#SITE_DIR#/products/', '#SITE_DIR#/products/#SECTION_ID#/#ID#/', '#SITE_DIR#/products/#ID#/', NULL, NULL, NULL, 'text', 24, 'Y', 'N', NULL, NULL, 'N', 'furniture_products_s1', '4ac65b5a3f9d2358863fddc80ddcfeb9', 'Y', 'Y', 'N', 'N', 'L', NULL, 'S', NULL, NULL, 1, 0, NULL, NULL, NULL, 'Разделы', 'Раздел', 'Товары', 'Элемент'),
(3, '2021-01-27 06:21:43', 'products', 's1', 'furniture_services_s1', NULL, '[s1] Услуги', 'Y', 500, '#SITE_DIR#/services/', '#SITE_DIR#/services/#ID#/', NULL, NULL, NULL, NULL, 'text', 24, 'Y', 'N', NULL, NULL, 'N', 'furniture_services_s1', 'e848ab3d3adc4abf0ddcb916bcbd5e0c', 'Y', 'Y', 'N', 'N', 'L', NULL, 'S', NULL, NULL, 1, 0, NULL, NULL, NULL, 'Разделы', 'Раздел', 'Услуги', 'Услуга'),
(4, '2021-01-27 06:21:45', 'vacancies', 's1', 'furniture_vacancies_s1', NULL, 'Вакансии', 'Y', 500, '#SITE_DIR#/company/vacancies.php', '#SITE_DIR#/company/vacancies.php##ID#', NULL, NULL, NULL, NULL, 'text', 24, 'Y', 'N', NULL, NULL, 'N', 'furniture_vacancies_s1', '6720f8192e276082535a4c125276a8ef', 'Y', 'N', 'N', 'N', 'L', NULL, 'S', NULL, NULL, 1, 0, NULL, NULL, NULL, 'Разделы', 'Раздел', 'Вакансии', 'Вакансия');
-- -----------------------------------
-- Dumping table b_iblock_cache
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_cache`;
CREATE TABLE `b_iblock_cache` (
  `CACHE_KEY` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `CACHE` longtext COLLATE utf8_unicode_ci NOT NULL,
  `CACHE_DATE` datetime NOT NULL,
  PRIMARY KEY (`CACHE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_element
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_element`;
CREATE TABLE `b_iblock_element` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL DEFAULT '0',
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PREVIEW_PICTURE` int(18) DEFAULT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci,
  `PREVIEW_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `DETAIL_TEXT` longtext COLLATE utf8_unicode_ci,
  `DETAIL_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  `WF_STATUS_ID` int(18) DEFAULT '1',
  `WF_PARENT_ELEMENT_ID` int(11) DEFAULT NULL,
  `WF_NEW` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LOCKED_BY` int(18) DEFAULT NULL,
  `WF_DATE_LOCK` datetime DEFAULT NULL,
  `WF_COMMENTS` text COLLATE utf8_unicode_ci,
  `IN_SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LAST_HISTORY_ID` int(11) DEFAULT NULL,
  `SHOW_COUNTER` int(18) DEFAULT NULL,
  `SHOW_COUNTER_START` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_element_4` (`IBLOCK_ID`,`XML_ID`,`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_3` (`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_code` (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_element` VALUES
(1, '2021-01-27 06:21:23', 1, '2021-01-27 06:21:22', 1, 1, NULL, 'Y', '2010-05-25 00:00:00', NULL, 500, 'Мебельный форум Беларуси', NULL, 'С 20 по 23 апреля 2010 года состоится <strong>Мебельный Форум Беларуси</strong> &ndash; важнейшее мероприятии отрасли в текущем году.', 'html', NULL, '\r\n<p>С 20 по 23 апреля 2010 года состоится <strong>Мебельный Форум Беларуси</strong> &ndash; важнейшее мероприятии отрасли в текущем году. В экспозиции принимают участие свыше 160 компаний из <em>Беларуси, Австрии, Латвии, Литвы, России, Польши </em>и<em> Украины</em>. В составе форума состоится пять выставок:&quot;Минский мебельный салон&quot;, &quot;Мебельные технологии&quot;, &quot;ОфисКомфорт&quot;, &quot;Кухня&quot; и &quot;Домотех&quot;. Экспозиция будет строиться по принципу двух тематических секторов:<em> готовой мебели</em> и <em>материалов для ее производства</em>.\r\n \r\n \r\n \r\n  <br />\r\n\r\n \r\n \r\n </p>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n<p>В секторе готовой мебели будут представлены:</p>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n<ul>\r\n \r\n \r\n \r\n  <li>корпусная и мягкая мебель;</li>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n  <li>мебель для детей и молодежи;</li>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n  <li>предметы интерьера;</li>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n  <li>кухонная мебель;</li>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n  <li>мебель для офиса и административных зданий.</li>\r\n\r\n \r\n \r\n </ul>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n<p>В секторе материалов для производства мебели будут демонстрироваться новинки рынка мебельной фурнитуры, материалов, обивочных тканей, элементов и аксессуаров для производства мебели.\r\n \r\n \r\n  <br />\r\n\r\n \r\n \r\n </p>\r\n\r\n \r\n \r\n \r\n \r\n<p>Помимо расширенной экспозиции пяти тематических выставок &quot;Экспофорум&quot; подготовил разнообразную деловую программу Мебельного форума. В рамках выставки состоятся семинары и мастер-классы. И поистине масштабным в этом году обещает стать республиканский конкурс форума &quot;<strong>Народное признание</strong>&quot;. В этом году он выходит за рамки выставки и становится республиканским смотром образцов мебели.\r\n \r\n \r\n  <br />\r\n\r\n \r\n <strong>Мебельный Форум</strong> предоставляет специалистам возможность познакомиться с тенденциями мебельной моды, провести переговоры, получить практические предложения рынка, увидеть перспективы развития и новые конкурентные преимущества. Впервые для участников конкурса будет подготовлен маркетинговый отчет по результатам опроса посетителей выставок <strong>Мебельного Форума</strong>.\r\n \r\n \r\n  <br />\r\n\r\n \r\n </p>\r\n\r\n<p><em>Прием заявок на участие в конкурсе осуществляется до 12 апреля 2010 года.</em></p>\r\n\r\n \r\n \r\n \r\n \r\n<ul>\r\n </ul>\r\n\r\n \r\n \r\n \r\n ', 'html', 'МЕБЕЛЬНЫЙ ФОРУМ БЕЛАРУСИ\r\nС 20 ПО 23 АПРЕЛЯ 2010 ГОДА СОСТОИТСЯ МЕБЕЛЬНЫЙ \r\nФОРУМ БЕЛАРУСИ &NDASH; ВАЖНЕЙШЕЕ МЕРОПРИЯТИИ ОТРАСЛИ В ТЕКУЩЕМ ГОДУ.\r\nС 20 ПО 23 АПРЕЛЯ 2010 ГОДА СОСТОИТСЯ МЕБЕЛЬНЫЙ \r\nФОРУМ БЕЛАРУСИ &NDASH; ВАЖНЕЙШЕЕ МЕРОПРИЯТИИ ОТРАСЛИ В ТЕКУЩЕМ ГОДУ. В ЭКСПОЗИЦИИ ПРИНИМАЮТ УЧАСТИЕ СВЫШЕ 160 КОМПАНИЙ ИЗ БЕЛАРУСИ, АВСТРИИ, ЛАТВИИ, ЛИТВЫ, РОССИИ, ПОЛЬШИ И УКРАИНЫ. В СОСТАВЕ ФОРУМА СОСТОИТСЯ ПЯТЬ ВЫСТАВОК:\"МИНСКИЙ МЕБЕЛЬНЫЙ САЛОН\", \"МЕБЕЛЬНЫЕ ТЕХНОЛОГИИ\", \"ОФИСКОМФОРТ\", \"КУХНЯ\" И \"ДОМОТЕХ\". ЭКСПОЗИЦИЯ БУДЕТ СТРОИТЬСЯ ПО ПРИНЦИПУ ДВУХ ТЕМАТИЧЕСКИХ СЕКТОРОВ: ГОТОВОЙ МЕБЕЛИ И МАТЕРИАЛОВ ДЛЯ ЕЕ ПРОИЗВОДСТВА. \r\n \r\n\r\nВ СЕКТОРЕ ГОТОВОЙ МЕБЕЛИ БУДУТ ПРЕДСТАВЛЕНЫ: \r\n\r\n- КОРПУСНАЯ И МЯГКАЯ МЕБЕЛЬ; \r\n- МЕБЕЛЬ ДЛЯ ДЕТЕЙ И МОЛОДЕЖИ; \r\n- ПРЕДМЕТЫ ИНТЕРЬЕРА; \r\n- КУХОННАЯ МЕБЕЛЬ; \r\n- МЕБЕЛЬ ДЛЯ ОФИСА И АДМИНИСТРАТИВНЫХ ЗДАНИЙ. \r\n\r\nВ СЕКТОРЕ МАТЕРИАЛОВ ДЛЯ ПРОИЗВОДСТВА \r\nМЕБЕЛИ БУДУТ ДЕМОНСТРИРОВАТЬСЯ НОВИНКИ РЫНКА МЕБЕЛЬНОЙ ФУРНИТУРЫ, МАТЕРИАЛОВ, ОБИВОЧНЫХ ТКАНЕЙ, ЭЛЕМЕНТОВ И АКСЕССУАРОВ ДЛЯ ПРОИЗВОДСТВА МЕБЕЛИ. \r\n \r\n\r\nПОМИМО РАСШИРЕННОЙ ЭКСПОЗИЦИИ ПЯТИ ТЕМАТИЧЕСКИХ \r\nВЫСТАВОК \"ЭКСПОФОРУМ\" ПОДГОТОВИЛ РАЗНООБРАЗНУЮ ДЕЛОВУЮ ПРОГРАММУ МЕБЕЛЬНОГО ФОРУМА. В РАМКАХ ВЫСТАВКИ СОСТОЯТСЯ СЕМИНАРЫ И МАСТЕР-КЛАССЫ. И ПОИСТИНЕ МАСШТАБНЫМ В ЭТОМ ГОДУ ОБЕЩАЕТ СТАТЬ РЕСПУБЛИКАНСКИЙ КОНКУРС ФОРУМА \"НАРОДНОЕ ПРИЗНАНИЕ\". В ЭТОМ ГОДУ ОН ВЫХОДИТ ЗА РАМКИ ВЫСТАВКИ И СТАНОВИТСЯ РЕСПУБЛИКАНСКИМ СМОТРОМ ОБРАЗЦОВ МЕБЕЛИ. \r\nМЕБЕЛЬНЫЙ ФОРУМ ПРЕДОСТАВЛЯЕТ СПЕЦИАЛИСТАМ \r\nВОЗМОЖНОСТЬ ПОЗНАКОМИТЬСЯ С ТЕНДЕНЦИЯМИ МЕБЕЛЬНОЙ МОДЫ, ПРОВЕСТИ ПЕРЕГОВОРЫ, ПОЛУЧИТЬ ПРАКТИЧЕСКИЕ ПРЕДЛОЖЕНИЯ РЫНКА, УВИДЕТЬ ПЕРСПЕКТИВЫ РАЗВИТИЯ И НОВЫЕ КОНКУРЕНТНЫЕ ПРЕИМУЩЕСТВА. ВПЕРВЫЕ ДЛЯ УЧАСТНИКОВ КОНКУРСА БУДЕТ ПОДГОТОВЛЕН МАРКЕТИНГОВЫЙ ОТЧЕТ ПО РЕЗУЛЬТАТАМ ОПРОСА ПОСЕТИТЕЛЕЙ ВЫСТАВОК МЕБЕЛЬНОГО ФОРУМА. \r\n \r\n\r\nПРИЕМ ЗАЯВОК НА УЧАСТИЕ В КОНКУРСЕ ОСУЩЕСТВЛЯЕТСЯ \r\nДО 12 АПРЕЛЯ 2010 ГОДА.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '1', '', '', '-384246935', NULL, NULL, NULL),
(2, '2021-01-27 06:21:23', 1, '2021-01-27 06:21:23', 1, 1, NULL, 'Y', '2010-05-26 00:00:00', NULL, 500, 'Международная мебельная выставка SALON DEL MOBILE', NULL, 'В 2010 году выставка Salon del Mobile обещает быть еще более расширенной и интересной. ', 'html', NULL, 'В 2010 году выставка Salon del Mobile обещает быть еще более расширенной и интересной. На выставке Salon del Mobile будут представлены все типы мебели для офиса и дома от спален и гостиных до VIP-кабинетов, включая оборудование для сада и детской мебели. Заявки на участие подали более чем 1 500 компаний со всего мира. Предполагается, что за время проведения выставки ее посетят более 300 000 тысяч человек. Экспозиция выставки разместится на общей площади 149 871 кв.м. В 2010 году эта поистине грандиозная выставка будет проводиться уже в 10-й раз.', 'text', 'МЕЖДУНАРОДНАЯ МЕБЕЛЬНАЯ ВЫСТАВКА SALON DEL MOBILE\r\nВ 2010 ГОДУ ВЫСТАВКА SALON DEL MOBILE ОБЕЩАЕТ БЫТЬ \r\nЕЩЕ БОЛЕЕ РАСШИРЕННОЙ И ИНТЕРЕСНОЙ.\r\nВ 2010 ГОДУ ВЫСТАВКА SALON DEL MOBILE ОБЕЩАЕТ БЫТЬ ЕЩЕ БОЛЕЕ РАСШИРЕННОЙ И ИНТЕРЕСНОЙ. НА ВЫСТАВКЕ SALON DEL MOBILE БУДУТ ПРЕДСТАВЛЕНЫ ВСЕ ТИПЫ МЕБЕЛИ ДЛЯ ОФИСА И ДОМА ОТ СПАЛЕН И ГОСТИНЫХ ДО VIP-КАБИНЕТОВ, ВКЛЮЧАЯ ОБОРУДОВАНИЕ ДЛЯ САДА И ДЕТСКОЙ МЕБЕЛИ. ЗАЯВКИ НА УЧАСТИЕ ПОДАЛИ БОЛЕЕ ЧЕМ 1 500 КОМПАНИЙ СО ВСЕГО МИРА. ПРЕДПОЛАГАЕТСЯ, ЧТО ЗА ВРЕМЯ ПРОВЕДЕНИЯ ВЫСТАВКИ ЕЕ ПОСЕТЯТ БОЛЕЕ 300 000 ТЫСЯЧ ЧЕЛОВЕК. ЭКСПОЗИЦИЯ ВЫСТАВКИ РАЗМЕСТИТСЯ НА ОБЩЕЙ ПЛОЩАДИ 149 871 КВ.М. В 2010 ГОДУ ЭТА ПОИСТИНЕ ГРАНДИОЗНАЯ ВЫСТАВКА БУДЕТ ПРОВОДИТЬСЯ УЖЕ В 10-Й РАЗ.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '8', '', '', '373546319', NULL, NULL, NULL),
(3, '2021-01-27 06:21:23', 1, '2021-01-27 06:21:23', 1, 1, NULL, 'Y', '2010-05-27 00:00:00', NULL, 500, 'Получено прочное водостойкое соединение', NULL, 'Получено новое прочное водостойкое клеевое соединение.Изобретение относится к области получения и применения клеящих составов, используемых в деревообрабатывающей, мебельной и строительной промышленности. Данная клеевая композиция предназначена только для горячего прессования и имеет в своем составе многокомпонентный отвердитель. ', 'html', NULL, '<b>Авторы изобретения</b>: Разиньков Егор Михайлович  и Мещерякова Анна Анатольевна </br>\r\n              Патент Российской Федерации RU2277566</br>\r\n              <h3>Описание изобретения</h3>\r\n              <p>Изобретение относится к области получения и применения клеящих составов, используемых в деревообрабатывающей, мебельной и строительной промышленности.\r\n              Данная клеевая композиция предназначена только для горячего прессования и имеет в своем составе многокомпонентный отвердитель. Прототипом клеевой композиции является клей, состоящий из карбамидоформальдегидной смолы, сополимера акрилонитрила с N-винилкапролактамом и отвердитель. В качестве отвердителя применяют хлористый аммоний либо акриловую кислоту. </p>\r\n\r\n              <p>Изобретение решает задачу по получению прочного и водостойкого клеевого соединения.\r\n              Это достигается тем, что клеевая композиция, включающая синтетическую смолу и отвердитель, согласно изобретению, дополнительно содержит модификатор, причем в качестве синтетической смолы клеевая композиция включает карбамидомеламиноформальдегидную смолу с отвердителем 2542, в качестве модификатора - карбамидоформальдегидную смолу, а в качестве отвердителя - 10%-ный раствор щавелевой кислоты при следующем соотношении компонентов, мас.ч.:\r\n              </p>\r\n              <table cellspacing=\"10\">\r\n              <tr>\r\n              <td>Карбамидомеламиноформальдегидная смола</td><td>64,5-79,2</td>\r\n              </tr>	\r\n              <tr>\r\n              <td>10%-ный Раствор щавелевой кислоты</td><td>4,4-20,5</td>\r\n\r\n              </tr>\r\n              <tr>\r\n              <td> Отвердитель для карбамидомеламиноформальдегидной </td><td>0,6-2,0</td>\r\n              </tr>\r\n              <tr>\r\n              <td> смолы 2542</td><td>13,0-15,8</td>\r\n\r\n              </tr>	\r\n              </table>\r\n', 'html', 'ПОЛУЧЕНО ПРОЧНОЕ ВОДОСТОЙКОЕ СОЕДИНЕНИЕ\r\nПОЛУЧЕНО НОВОЕ ПРОЧНОЕ ВОДОСТОЙКОЕ КЛЕЕВОЕ \r\nСОЕДИНЕНИЕ.ИЗОБРЕТЕНИЕ ОТНОСИТСЯ К ОБЛАСТИ ПОЛУЧЕНИЯ И ПРИМЕНЕНИЯ КЛЕЯЩИХ СОСТАВОВ, ИСПОЛЬЗУЕМЫХ В ДЕРЕВООБРАБАТЫВАЮЩЕЙ, МЕБЕЛЬНОЙ И СТРОИТЕЛЬНОЙ ПРОМЫШЛЕННОСТИ. ДАННАЯ КЛЕЕВАЯ КОМПОЗИЦИЯ ПРЕДНАЗНАЧЕНА ТОЛЬКО ДЛЯ ГОРЯЧЕГО ПРЕССОВАНИЯ И ИМЕЕТ В СВОЕМ СОСТАВЕ МНОГОКОМПОНЕНТНЫЙ ОТВЕРДИТЕЛЬ.\r\nАВТОРЫ ИЗОБРЕТЕНИЯ: РАЗИНЬКОВ ЕГОР МИХАЙЛОВИЧ \r\nИ МЕЩЕРЯКОВА АННА АНАТОЛЬЕВНА ПАТЕНТ РОССИЙСКОЙ ФЕДЕРАЦИИ RU2277566 ОПИСАНИЕ ИЗОБРЕТЕНИЯ \r\n\r\nИЗОБРЕТЕНИЕ ОТНОСИТСЯ К ОБЛАСТИ ПОЛУЧЕНИЯ \r\nИ ПРИМЕНЕНИЯ КЛЕЯЩИХ СОСТАВОВ, ИСПОЛЬЗУЕМЫХ В ДЕРЕВООБРАБАТЫВАЮЩЕЙ, МЕБЕЛЬНОЙ И СТРОИТЕЛЬНОЙ ПРОМЫШЛЕННОСТИ. ДАННАЯ КЛЕЕВАЯ КОМПОЗИЦИЯ ПРЕДНАЗНАЧЕНА ТОЛЬКО ДЛЯ ГОРЯЧЕГО ПРЕССОВАНИЯ И ИМЕЕТ В СВОЕМ СОСТАВЕ МНОГОКОМПОНЕНТНЫЙ ОТВЕРДИТЕЛЬ. ПРОТОТИПОМ КЛЕЕВОЙ КОМПОЗИЦИИ ЯВЛЯЕТСЯ КЛЕЙ, СОСТОЯЩИЙ ИЗ КАРБАМИДОФОРМАЛЬДЕГИДНОЙ СМОЛЫ, СОПОЛИМЕРА АКРИЛОНИТРИЛА С N-ВИНИЛКАПРОЛАКТАМОМ И ОТВЕРДИТЕЛЬ. В КАЧЕСТВЕ ОТВЕРДИТЕЛЯ ПРИМЕНЯЮТ ХЛОРИСТЫЙ АММОНИЙ ЛИБО АКРИЛОВУЮ КИСЛОТУ. \r\n\r\nИЗОБРЕТЕНИЕ РЕШАЕТ ЗАДАЧУ ПО ПОЛУЧЕНИЮ \r\nПРОЧНОГО И ВОДОСТОЙКОГО КЛЕЕВОГО СОЕДИНЕНИЯ. ЭТО ДОСТИГАЕТСЯ ТЕМ, ЧТО КЛЕЕВАЯ КОМПОЗИЦИЯ, ВКЛЮЧАЮЩАЯ СИНТЕТИЧЕСКУЮ СМОЛУ И ОТВЕРДИТЕЛЬ, СОГЛАСНО ИЗОБРЕТЕНИЮ, ДОПОЛНИТЕЛЬНО СОДЕРЖИТ МОДИФИКАТОР, ПРИЧЕМ В КАЧЕСТВЕ СИНТЕТИЧЕСКОЙ СМОЛЫ КЛЕЕВАЯ КОМПОЗИЦИЯ ВКЛЮЧАЕТ КАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДНУЮ СМОЛУ С ОТВЕРДИТЕЛЕМ 2542, В КАЧЕСТВЕ МОДИФИКАТОРА - КАРБАМИДОФОРМАЛЬДЕГИДНУЮ СМОЛУ, А В КАЧЕСТВЕ ОТВЕРДИТЕЛЯ - 10%-НЫЙ РАСТВОР ЩАВЕЛЕВОЙ КИСЛОТЫ ПРИ СЛЕДУЮЩЕМ СООТНОШЕНИИ КОМПОНЕНТОВ, МАС.Ч.: \r\n КАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДНАЯ СМОЛА \r\n   64,5-79,2     \r\n 10%-НЫЙ РАСТВОР ЩАВЕЛЕВОЙ КИСЛОТЫ    4,4-20,5 \r\n    \r\n ОТВЕРДИТЕЛЬ ДЛЯ КАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДНОЙ \r\n    0,6-2,0     \r\n СМОЛЫ 2542    13,0-15,8', 1, NULL, NULL, NULL, NULL, NULL, 'N', '9', '', '', '868533081', NULL, NULL, NULL),
(4, '2021-01-27 06:21:31', 1, '2021-01-27 06:21:31', 1, 2, 1, 'Y', NULL, NULL, 500, 'Герцог', 5, '<p>Изящный каркас с элементами росписи, роскошные ткани для обивки, яркие цвета и богатый декор.</p>', 'html', 6, '        <p>Изящный каркас с элементами росписи, роскошные ткани для обивки, яркие цвета и богатый декор.</p>', 'html', 'ГЕРЦОГ\r\nИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ, РОСКОШНЫЕ \r\nТКАНИ ДЛЯ ОБИВКИ, ЯРКИЕ ЦВЕТА И БОГАТЫЙ ДЕКОР.\r\nИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ, РОСКОШНЫЕ \r\nТКАНИ ДЛЯ ОБИВКИ, ЯРКИЕ ЦВЕТА И БОГАТЫЙ ДЕКОР.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '10', '', '', '-782370160', NULL, NULL, NULL),
(5, '2021-01-27 06:21:31', 1, '2021-01-27 06:21:31', 1, 2, 1, 'Y', NULL, NULL, 500, 'Монализа', 7, '        <p>Богатство и изыск выражен в данной модели. Каркас дополнительно расписывается золотом.\r\n        По желанию клиента возможна простежка на спинке и подлокотниках.</p>\r\n      ', 'html', 8, '        <p>Богатство и изыск выражен в данной модели. Каркас дополнительно расписывается золотом.\r\n        По желанию клиента возможна простежка на спинке и подлокотниках.</p>\r\n      ', 'html', 'МОНАЛИЗА\r\nБОГАТСТВО И ИЗЫСК ВЫРАЖЕН В ДАННОЙ МОДЕЛИ. \r\nКАРКАС ДОПОЛНИТЕЛЬНО РАСПИСЫВАЕТСЯ ЗОЛОТОМ. ПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА ПРОСТЕЖКА НА СПИНКЕ И ПОДЛОКОТНИКАХ.\r\nБОГАТСТВО И ИЗЫСК ВЫРАЖЕН В ДАННОЙ МОДЕЛИ. \r\nКАРКАС ДОПОЛНИТЕЛЬНО РАСПИСЫВАЕТСЯ ЗОЛОТОМ. ПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА ПРОСТЕЖКА НА СПИНКЕ И ПОДЛОКОТНИКАХ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '11', '', '', '-48879568', NULL, NULL, NULL),
(6, '2021-01-27 06:21:32', 1, '2021-01-27 06:21:32', 1, 2, 2, 'Y', NULL, NULL, 500, 'Министр', 9, '        <p>Кресло руководителя Министр, несмотря на низкую стоимость, впечатляюще выглядит. \r\n          С его помощью можно создать офисный интерьер высокого уровня. К тому же в нем можно работать с комфортом, не чувствуя усталости.</p>\r\n      ', 'html', 10, '          <p>Кресло руководителя Министр, несмотря на низкую стоимость, впечатляюще выглядит. \r\n          С его помощью можно создать офисный интерьер высокого уровня. К тому же в нем можно работать с комфортом, не чувствуя усталости.</p>\r\n        ', 'html', 'МИНИСТР\r\nКРЕСЛО РУКОВОДИТЕЛЯ МИНИСТР, НЕСМОТРЯ \r\nНА НИЗКУЮ СТОИМОСТЬ, ВПЕЧАТЛЯЮЩЕ ВЫГЛЯДИТ. С ЕГО ПОМОЩЬЮ МОЖНО СОЗДАТЬ ОФИСНЫЙ ИНТЕРЬЕР ВЫСОКОГО УРОВНЯ. К ТОМУ ЖЕ В НЕМ МОЖНО РАБОТАТЬ С КОМФОРТОМ, НЕ ЧУВСТВУЯ УСТАЛОСТИ.\r\nКРЕСЛО РУКОВОДИТЕЛЯ МИНИСТР, НЕСМОТРЯ \r\nНА НИЗКУЮ СТОИМОСТЬ, ВПЕЧАТЛЯЮЩЕ ВЫГЛЯДИТ. С ЕГО ПОМОЩЬЮ МОЖНО СОЗДАТЬ ОФИСНЫЙ ИНТЕРЬЕР ВЫСОКОГО УРОВНЯ. К ТОМУ ЖЕ В НЕМ МОЖНО РАБОТАТЬ С КОМФОРТОМ, НЕ ЧУВСТВУЯ УСТАЛОСТИ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '12', '', '', '-2121649046', NULL, NULL, NULL),
(7, '2021-01-27 06:21:32', 1, '2021-01-27 06:21:32', 1, 2, 2, 'Y', NULL, NULL, 500, 'Хром', 11, '        \r\n          <p>Динамичная модель офисного кресла примечательна оригинальным внешним видом, который достигнут за \r\n          счет хромированной крестовины,необычных подлокотников и потрясающей эргономики. \r\n          Твердая спинка жестко поддерживает позвоночник.</p>\r\n      ', 'html', 12, '          \r\n          <p>Динамичная модель офисного кресла примечательна оригинальным внешним видом, который достигнут за \r\n          счет хромированной крестовины,необычных подлокотников и потрясающей эргономики. \r\n          Твердая спинка жестко поддерживает позвоночник.</p>\r\n        ', 'html', 'ХРОМ\r\nДИНАМИЧНАЯ МОДЕЛЬ ОФИСНОГО КРЕСЛА ПРИМЕЧАТЕЛЬНА \r\nОРИГИНАЛЬНЫМ ВНЕШНИМ ВИДОМ, КОТОРЫЙ ДОСТИГНУТ ЗА СЧЕТ ХРОМИРОВАННОЙ КРЕСТОВИНЫ,НЕОБЫЧНЫХ ПОДЛОКОТНИКОВ И ПОТРЯСАЮЩЕЙ ЭРГОНОМИКИ. ТВЕРДАЯ СПИНКА ЖЕСТКО ПОДДЕРЖИВАЕТ ПОЗВОНОЧНИК.\r\nДИНАМИЧНАЯ МОДЕЛЬ ОФИСНОГО КРЕСЛА ПРИМЕЧАТЕЛЬНА \r\nОРИГИНАЛЬНЫМ ВНЕШНИМ ВИДОМ, КОТОРЫЙ ДОСТИГНУТ ЗА СЧЕТ ХРОМИРОВАННОЙ КРЕСТОВИНЫ,НЕОБЫЧНЫХ ПОДЛОКОТНИКОВ И ПОТРЯСАЮЩЕЙ ЭРГОНОМИКИ. ТВЕРДАЯ СПИНКА ЖЕСТКО ПОДДЕРЖИВАЕТ ПОЗВОНОЧНИК.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '13', '', '', '-256131656', NULL, NULL, NULL),
(8, '2021-01-27 06:21:32', 1, '2021-01-27 06:21:32', 1, 2, 3, 'Y', NULL, NULL, 500, 'Ливерпуль', 13, '        <p>Деревянные стулья Ливерпуль, выполненные в классическом английском стиле, \r\n        создают особую атмосферу в кухне.</p>\r\n      ', 'html', 14, '        \r\n        <p>Деревянные стулья Ливерпуль, выполненные в классическом английском стиле, \r\n        создают особую атмосферу в кухне.</p>\r\n        \r\n      ', 'html', 'ЛИВЕРПУЛЬ\r\nДЕРЕВЯННЫЕ СТУЛЬЯ ЛИВЕРПУЛЬ, ВЫПОЛНЕННЫЕ \r\nВ КЛАССИЧЕСКОМ АНГЛИЙСКОМ СТИЛЕ, СОЗДАЮТ ОСОБУЮ АТМОСФЕРУ В КУХНЕ.\r\nДЕРЕВЯННЫЕ СТУЛЬЯ ЛИВЕРПУЛЬ, ВЫПОЛНЕННЫЕ \r\nВ КЛАССИЧЕСКОМ АНГЛИЙСКОМ СТИЛЕ, СОЗДАЮТ ОСОБУЮ АТМОСФЕРУ В КУХНЕ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '14', '', '', '1081715374', NULL, NULL, NULL),
(9, '2021-01-27 06:21:32', 1, '2021-01-27 06:21:32', 1, 2, 1, 'Y', NULL, NULL, 500, 'Изабелла', 15, '        <p>Изящный каркас с элементами росписи золотом. Обивка может быть представлена в ткани или коже.</p>\r\n      ', 'html', 16, '        <p>Изящный каркас с элементами росписи золотом. Обивка может быть представлена в ткани или коже.</p>\r\n      ', 'html', 'ИЗАБЕЛЛА\r\nИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ ЗОЛОТОМ. \r\nОБИВКА МОЖЕТ БЫТЬ ПРЕДСТАВЛЕНА В ТКАНИ ИЛИ КОЖЕ.\r\nИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ ЗОЛОТОМ. \r\nОБИВКА МОЖЕТ БЫТЬ ПРЕДСТАВЛЕНА В ТКАНИ ИЛИ КОЖЕ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '15', '', '', '-1320392841', NULL, NULL, NULL),
(10, '2021-01-27 06:21:33', 1, '2021-01-27 06:21:33', 1, 2, 1, 'Y', NULL, NULL, 500, 'Аладдин', 17, '        <p>Комфортная, массивная модель. Обивка - элитные ткани, ручная строчка, \r\n        придают изделию необыкновенный шарм и элегантную роскошь. \r\n        По желанию клиента можно установить механизм трансформации для ежедневного использования или «гостевую раскладушку»</p>\r\n      ', 'html', 18, '        <p>Комфортная, массивная модель. Обивка - элитные ткани, ручная строчка, \r\n        придают изделию необыкновенный шарм и элегантную роскошь. \r\n        По желанию клиента можно установить механизм трансформации для ежедневного использования или «гостевую раскладушку»</p>\r\n      ', 'html', 'АЛАДДИН\r\nКОМФОРТНАЯ, МАССИВНАЯ МОДЕЛЬ. ОБИВКА - ЭЛИТНЫЕ \r\nТКАНИ, РУЧНАЯ СТРОЧКА, ПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. ПО ЖЕЛАНИЮ КЛИЕНТА МОЖНО УСТАНОВИТЬ МЕХАНИЗМ ТРАНСФОРМАЦИИ ДЛЯ ЕЖЕДНЕВНОГО ИСПОЛЬЗОВАНИЯ ИЛИ «ГОСТЕВУЮ РАСКЛАДУШКУ»\r\nКОМФОРТНАЯ, МАССИВНАЯ МОДЕЛЬ. ОБИВКА - ЭЛИТНЫЕ \r\nТКАНИ, РУЧНАЯ СТРОЧКА, ПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. ПО ЖЕЛАНИЮ КЛИЕНТА МОЖНО УСТАНОВИТЬ МЕХАНИЗМ ТРАНСФОРМАЦИИ ДЛЯ ЕЖЕДНЕВНОГО ИСПОЛЬЗОВАНИЯ ИЛИ «ГОСТЕВУЮ РАСКЛАДУШКУ»', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '16', '', '', '1053250178', NULL, NULL, NULL),
(11, '2021-01-27 06:21:33', 1, '2021-01-27 06:21:33', 1, 2, 1, 'Y', NULL, NULL, 500, 'Джоконда', 19, '          <p>Изящный каркас, элитные ткани для обивки, ручная строчка, придают изделию необыкновенный шарм и элегантную роскошь. \r\n          Обивка также может быть в коже, по желанию клиента возможна простежка на подлокотниках и спинке.</p>\r\n        ', 'html', 20, '          <p>Изящный каркас, элитные ткани для обивки, ручная строчка, придают изделию необыкновенный шарм и элегантную роскошь. \r\n          Обивка также может быть в коже, по желанию клиента возможна простежка на подлокотниках и спинке.</p>\r\n        ', 'html', 'ДЖОКОНДА\r\nИЗЯЩНЫЙ КАРКАС, ЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ, \r\nРУЧНАЯ СТРОЧКА, ПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. ОБИВКА ТАКЖЕ МОЖЕТ БЫТЬ В КОЖЕ, ПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА ПРОСТЕЖКА НА ПОДЛОКОТНИКАХ И СПИНКЕ.\r\nИЗЯЩНЫЙ КАРКАС, ЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ, \r\nРУЧНАЯ СТРОЧКА, ПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. ОБИВКА ТАКЖЕ МОЖЕТ БЫТЬ В КОЖЕ, ПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА ПРОСТЕЖКА НА ПОДЛОКОТНИКАХ И СПИНКЕ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '17', '', '', '-106709740', NULL, NULL, NULL),
(12, '2021-01-27 06:21:33', 1, '2021-01-27 06:21:33', 1, 2, 1, 'Y', NULL, NULL, 500, 'Флора', 21, '        <p>Классическая модель создана для украшения роскошных интерьеров. \r\n        Элегантность и колоритность модели придают накладки из натурального дерева.</p>\r\n      ', 'html', 22, '        <p>Классическая модель создана для украшения роскошных интерьеров. \r\n        Элегантность и колоритность модели придают накладки из натурального дерева.</p>\r\n      ', 'html', 'ФЛОРА\r\nКЛАССИЧЕСКАЯ МОДЕЛЬ СОЗДАНА ДЛЯ УКРАШЕНИЯ \r\nРОСКОШНЫХ ИНТЕРЬЕРОВ. ЭЛЕГАНТНОСТЬ И КОЛОРИТНОСТЬ МОДЕЛИ ПРИДАЮТ НАКЛАДКИ ИЗ НАТУРАЛЬНОГО ДЕРЕВА.\r\nКЛАССИЧЕСКАЯ МОДЕЛЬ СОЗДАНА ДЛЯ УКРАШЕНИЯ \r\nРОСКОШНЫХ ИНТЕРЬЕРОВ. ЭЛЕГАНТНОСТЬ И КОЛОРИТНОСТЬ МОДЕЛИ ПРИДАЮТ НАКЛАДКИ ИЗ НАТУРАЛЬНОГО ДЕРЕВА.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '18', '', '', '-1053944437', NULL, NULL, NULL),
(13, '2021-01-27 06:21:33', 1, '2021-01-27 06:21:33', 1, 2, 1, 'Y', NULL, NULL, 500, 'Престиж', 23, '          <p>Тахта в классическом исполнении. Подлокотник находится слева – это стандарт. Обивка может быть как в ткани, так и в коже.</p>\r\n        ', 'html', 24, '          <p>Тахта в классическом исполнении. Подлокотник находится слева – это стандарт. Обивка может быть как в ткани, так и в коже.</p>\r\n        ', 'html', 'ПРЕСТИЖ\r\nТАХТА В КЛАССИЧЕСКОМ ИСПОЛНЕНИИ. ПОДЛОКОТНИК \r\nНАХОДИТСЯ СЛЕВА – ЭТО СТАНДАРТ. ОБИВКА МОЖЕТ БЫТЬ КАК В ТКАНИ, ТАК И В КОЖЕ.\r\nТАХТА В КЛАССИЧЕСКОМ ИСПОЛНЕНИИ. ПОДЛОКОТНИК \r\nНАХОДИТСЯ СЛЕВА – ЭТО СТАНДАРТ. ОБИВКА МОЖЕТ БЫТЬ КАК В ТКАНИ, ТАК И В КОЖЕ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '19', '', '', '273423738', NULL, NULL, NULL),
(14, '2021-01-27 06:21:34', 1, '2021-01-27 06:21:34', 1, 2, 1, 'Y', NULL, NULL, 500, 'Лаура', 25, '        <p>Двухместная софа на основе конусных пружин или на основе комбинации плотных поролонов, по Вашему желанию. \r\n        Элитные ткани для обивки придают модели необыкновенный шарм и элегантную роскошь.</p>\r\n      ', 'html', 26, '        <p>Двухместная софа на основе конусных пружин или на основе комбинации плотных поролонов, по Вашему желанию. \r\n        Элитные ткани для обивки придают модели необыкновенный шарм и элегантную роскошь.</p>\r\n      ', 'html', 'ЛАУРА\r\nДВУХМЕСТНАЯ СОФА НА ОСНОВЕ КОНУСНЫХ ПРУЖИН \r\nИЛИ НА ОСНОВЕ КОМБИНАЦИИ ПЛОТНЫХ ПОРОЛОНОВ, ПО ВАШЕМУ ЖЕЛАНИЮ. ЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ ПРИДАЮТ МОДЕЛИ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ.\r\nДВУХМЕСТНАЯ СОФА НА ОСНОВЕ КОНУСНЫХ ПРУЖИН \r\nИЛИ НА ОСНОВЕ КОМБИНАЦИИ ПЛОТНЫХ ПОРОЛОНОВ, ПО ВАШЕМУ ЖЕЛАНИЮ. ЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ ПРИДАЮТ МОДЕЛИ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '20', '', '', '-281088768', NULL, NULL, NULL),
(15, '2021-01-27 06:21:34', 1, '2021-01-27 06:21:34', 1, 2, 2, 'Y', NULL, NULL, 500, 'Модерн', 27, '         <p>Основными характеристиками данной серии является новизна дизайнерской мысли, \r\n          которая воплощена во внешнем облике этой мебели, и оригинальность исполнения классической компоновки, \r\n          которая сочетает в себе оптимальный набор всех необходимых элементов и свежие решения в их организации. \r\n          Что в сочетании с удачными цветовыми решениями создаст в вашем офисе атмосферу неповторимой индивидуальности. \r\n          Данная серия – наилучшее решение для бизнесменов, которые привыкли быть на шаг впереди не только своих конкурентов, \r\n          но и самого времени.</p>\r\n        ', 'html', 28, '          <p>Основными характеристиками данной серии является новизна дизайнерской мысли, \r\n          которая воплощена во внешнем облике этой мебели, и оригинальность исполнения классической компоновки, \r\n          которая сочетает в себе оптимальный набор всех необходимых элементов и свежие решения в их организации. \r\n          Что в сочетании с удачными цветовыми решениями создаст в вашем офисе атмосферу неповторимой индивидуальности. \r\n          Данная серия – наилучшее решение для бизнесменов, которые привыкли быть на шаг впереди не только своих конкурентов, \r\n          но и самого времени.</p>\r\n        ', 'html', 'МОДЕРН\r\nОСНОВНЫМИ ХАРАКТЕРИСТИКАМИ ДАННОЙ СЕРИИ \r\nЯВЛЯЕТСЯ НОВИЗНА ДИЗАЙНЕРСКОЙ МЫСЛИ, КОТОРАЯ ВОПЛОЩЕНА ВО ВНЕШНЕМ ОБЛИКЕ ЭТОЙ МЕБЕЛИ, И ОРИГИНАЛЬНОСТЬ ИСПОЛНЕНИЯ КЛАССИЧЕСКОЙ КОМПОНОВКИ, КОТОРАЯ СОЧЕТАЕТ В СЕБЕ ОПТИМАЛЬНЫЙ НАБОР ВСЕХ НЕОБХОДИМЫХ ЭЛЕМЕНТОВ И СВЕЖИЕ РЕШЕНИЯ В ИХ ОРГАНИЗАЦИИ. ЧТО В СОЧЕТАНИИ С УДАЧНЫМИ ЦВЕТОВЫМИ РЕШЕНИЯМИ СОЗДАСТ В ВАШЕМ ОФИСЕ АТМОСФЕРУ НЕПОВТОРИМОЙ ИНДИВИДУАЛЬНОСТИ. ДАННАЯ СЕРИЯ – НАИЛУЧШЕЕ РЕШЕНИЕ ДЛЯ БИЗНЕСМЕНОВ, КОТОРЫЕ ПРИВЫКЛИ БЫТЬ НА ШАГ ВПЕРЕДИ НЕ ТОЛЬКО СВОИХ КОНКУРЕНТОВ, НО И САМОГО ВРЕМЕНИ.\r\nОСНОВНЫМИ ХАРАКТЕРИСТИКАМИ ДАННОЙ СЕРИИ \r\nЯВЛЯЕТСЯ НОВИЗНА ДИЗАЙНЕРСКОЙ МЫСЛИ, КОТОРАЯ ВОПЛОЩЕНА ВО ВНЕШНЕМ ОБЛИКЕ ЭТОЙ МЕБЕЛИ, И ОРИГИНАЛЬНОСТЬ ИСПОЛНЕНИЯ КЛАССИЧЕСКОЙ КОМПОНОВКИ, КОТОРАЯ СОЧЕТАЕТ В СЕБЕ ОПТИМАЛЬНЫЙ НАБОР ВСЕХ НЕОБХОДИМЫХ ЭЛЕМЕНТОВ И СВЕЖИЕ РЕШЕНИЯ В ИХ ОРГАНИЗАЦИИ. ЧТО В СОЧЕТАНИИ С УДАЧНЫМИ ЦВЕТОВЫМИ РЕШЕНИЯМИ СОЗДАСТ В ВАШЕМ ОФИСЕ АТМОСФЕРУ НЕПОВТОРИМОЙ ИНДИВИДУАЛЬНОСТИ. ДАННАЯ СЕРИЯ – НАИЛУЧШЕЕ РЕШЕНИЕ ДЛЯ БИЗНЕСМЕНОВ, КОТОРЫЕ ПРИВЫКЛИ БЫТЬ НА ШАГ ВПЕРЕДИ НЕ ТОЛЬКО СВОИХ КОНКУРЕНТОВ, НО И САМОГО ВРЕМЕНИ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '21', '', '', '-1185689438', NULL, NULL, NULL),
(16, '2021-01-27 06:21:34', 1, '2021-01-27 06:21:34', 1, 2, 2, 'Y', NULL, NULL, 500, 'Оптима', 29, '         <p>\r\n          Удачный выбор мебели для персонала во многом определяет успешность деятельности всей компании. \r\n          Правильно организовать рабочее пространство  - значит помочь коллегам выполнять свои функции быстрее и эффективнее.</p><p>\r\n          Серия <b>«Оптима»</b> позволит найти массу решений для обустройства рабочей зоны, приспособить интерьер к должностным \r\n          обязанностям всех категорий сотрудников. Эргономичные угловые столы, перегородки, шкафы и тумбы  помогут рационально использовать \r\n          пространство под уникальное рабочее место, приспособленное к потребностям каждого работника и всей фирмы в целом.</p><p>\r\n          Мебель <b>«Оптима»</b> - это полный набор интерьерных решений для обустройства пространства в офисе по современным стандартам.</p>\r\n        </p>\r\n      ', 'html', 30, '            \r\n        <p>\r\n          Удачный выбор мебели для персонала во многом определяет успешность деятельности всей компании. Правильно организовать рабочее пространство  - значит помочь коллегам выполнять свои функции быстрее и эффективнее.</br>\r\n          Серия <b>«Оптима»</b> позволит найти массу решений для обустройства рабочей зоны, приспособить интерьер к должностным обязанностям всех категорий сотрудников. Эргономичные угловые столы, перегородки, шкафы и тумбы  помогут рационально использовать пространство под уникальное рабочее место, приспособленное к потребностям каждого работника и всей фирмы в целом.</br>\r\n          Мебель <b>«Оптима»</b> - это полный набор интерьерных решений для обустройства пространства в офисе по современным стандартам.\r\n        </p>\r\n      ', 'html', 'ОПТИМА\r\nУДАЧНЫЙ ВЫБОР МЕБЕЛИ ДЛЯ ПЕРСОНАЛА ВО МНОГОМ \r\nОПРЕДЕЛЯЕТ УСПЕШНОСТЬ ДЕЯТЕЛЬНОСТИ ВСЕЙ КОМПАНИИ. ПРАВИЛЬНО ОРГАНИЗОВАТЬ РАБОЧЕЕ ПРОСТРАНСТВО - ЗНАЧИТ ПОМОЧЬ КОЛЛЕГАМ ВЫПОЛНЯТЬ СВОИ ФУНКЦИИ БЫСТРЕЕ И ЭФФЕКТИВНЕЕ.\r\n\r\nСЕРИЯ «ОПТИМА» ПОЗВОЛИТ НАЙТИ МАССУ РЕШЕНИЙ \r\nДЛЯ ОБУСТРОЙСТВА РАБОЧЕЙ ЗОНЫ, ПРИСПОСОБИТЬ ИНТЕРЬЕР К ДОЛЖНОСТНЫМ ОБЯЗАННОСТЯМ ВСЕХ КАТЕГОРИЙ СОТРУДНИКОВ. ЭРГОНОМИЧНЫЕ УГЛОВЫЕ СТОЛЫ, ПЕРЕГОРОДКИ, ШКАФЫ И ТУМБЫ ПОМОГУТ РАЦИОНАЛЬНО ИСПОЛЬЗОВАТЬ ПРОСТРАНСТВО ПОД УНИКАЛЬНОЕ РАБОЧЕЕ МЕСТО, ПРИСПОСОБЛЕННОЕ К ПОТРЕБНОСТЯМ КАЖДОГО РАБОТНИКА И ВСЕЙ ФИРМЫ В ЦЕЛОМ.\r\n\r\nМЕБЕЛЬ «ОПТИМА» - ЭТО ПОЛНЫЙ НАБОР ИНТЕРЬЕРНЫХ \r\nРЕШЕНИЙ ДЛЯ ОБУСТРОЙСТВА ПРОСТРАНСТВА В ОФИСЕ ПО СОВРЕМЕННЫМ СТАНДАРТАМ.\r\nУДАЧНЫЙ ВЫБОР МЕБЕЛИ ДЛЯ ПЕРСОНАЛА ВО МНОГОМ \r\nОПРЕДЕЛЯЕТ УСПЕШНОСТЬ ДЕЯТЕЛЬНОСТИ ВСЕЙ КОМПАНИИ. ПРАВИЛЬНО ОРГАНИЗОВАТЬ РАБОЧЕЕ ПРОСТРАНСТВО - ЗНАЧИТ ПОМОЧЬ КОЛЛЕГАМ ВЫПОЛНЯТЬ СВОИ ФУНКЦИИ БЫСТРЕЕ И ЭФФЕКТИВНЕЕ. СЕРИЯ «ОПТИМА» ПОЗВОЛИТ НАЙТИ МАССУ РЕШЕНИЙ ДЛЯ ОБУСТРОЙСТВА РАБОЧЕЙ ЗОНЫ, ПРИСПОСОБИТЬ ИНТЕРЬЕР К ДОЛЖНОСТНЫМ ОБЯЗАННОСТЯМ ВСЕХ КАТЕГОРИЙ СОТРУДНИКОВ. ЭРГОНОМИЧНЫЕ УГЛОВЫЕ СТОЛЫ, ПЕРЕГОРОДКИ, ШКАФЫ И ТУМБЫ ПОМОГУТ РАЦИОНАЛЬНО ИСПОЛЬЗОВАТЬ ПРОСТРАНСТВО ПОД УНИКАЛЬНОЕ РАБОЧЕЕ МЕСТО, ПРИСПОСОБЛЕННОЕ К ПОТРЕБНОСТЯМ КАЖДОГО РАБОТНИКА И ВСЕЙ ФИРМЫ В ЦЕЛОМ. МЕБЕЛЬ «ОПТИМА» - ЭТО ПОЛНЫЙ НАБОР ИНТЕРЬЕРНЫХ РЕШЕНИЙ ДЛЯ ОБУСТРОЙСТВА ПРОСТРАНСТВА В ОФИСЕ ПО СОВРЕМЕННЫМ СТАНДАРТАМ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '22', '', '', '1945328005', NULL, NULL, NULL),
(17, '2021-01-27 06:21:35', 1, '2021-01-27 06:21:35', 1, 2, 2, 'Y', NULL, NULL, 500, 'Собрание', 31, '        <p>\r\n          Заходя в помещение, где находятся столы для переговоров «Собрание», возникает стойкое ощущение, что находишься в кабинете если не президента страны, то премьер-министра как минимум. Вот-вот в комнату войдет высокопоставленный чиновник, и начнется обсуждение глобальных вопросов.\r\n          Удивительное сочетание изысканной роскоши стиля и красоты классических линий столов «Собрание» и привлекательной цены опровергает устоявшееся утверждение о качестве дешевой мебели. Уменьшение себестоимости происходит за счет использования более дешевых материалов – ДСП и ДВП, что позволяет офисной мебели сохранять великолепные эксплуатационные характеристики.\r\n        </p>\r\n      ', 'html', 32, '        \r\n        <p>\r\n          Заходя в помещение, где находятся столы для переговоров «Собрание», возникает стойкое ощущение, что находишься в кабинете если не президента страны, то премьер-министра как минимум. Вот-вот в комнату войдет высокопоставленный чиновник, и начнется обсуждение глобальных вопросов.\r\n          Удивительное сочетание изысканной роскоши стиля и красоты классических линий столов «Собрание» и привлекательной цены опровергает устоявшееся утверждение о качестве дешевой мебели. Уменьшение себестоимости происходит за счет использования более дешевых материалов – ДСП и ДВП, что позволяет офисной мебели сохранять великолепные эксплуатационные характеристики.\r\n        </p>\r\n      ', 'html', 'СОБРАНИЕ\r\nЗАХОДЯ В ПОМЕЩЕНИЕ, ГДЕ НАХОДЯТСЯ СТОЛЫ \r\nДЛЯ ПЕРЕГОВОРОВ «СОБРАНИЕ», ВОЗНИКАЕТ СТОЙКОЕ ОЩУЩЕНИЕ, ЧТО НАХОДИШЬСЯ В КАБИНЕТЕ ЕСЛИ НЕ ПРЕЗИДЕНТА СТРАНЫ, ТО ПРЕМЬЕР-МИНИСТРА КАК МИНИМУМ. ВОТ-ВОТ В КОМНАТУ ВОЙДЕТ ВЫСОКОПОСТАВЛЕННЫЙ ЧИНОВНИК, И НАЧНЕТСЯ ОБСУЖДЕНИЕ ГЛОБАЛЬНЫХ ВОПРОСОВ. УДИВИТЕЛЬНОЕ СОЧЕТАНИЕ ИЗЫСКАННОЙ РОСКОШИ СТИЛЯ И КРАСОТЫ КЛАССИЧЕСКИХ ЛИНИЙ СТОЛОВ «СОБРАНИЕ» И ПРИВЛЕКАТЕЛЬНОЙ ЦЕНЫ ОПРОВЕРГАЕТ УСТОЯВШЕЕСЯ УТВЕРЖДЕНИЕ О КАЧЕСТВЕ ДЕШЕВОЙ МЕБЕЛИ. УМЕНЬШЕНИЕ СЕБЕСТОИМОСТИ ПРОИСХОДИТ ЗА СЧЕТ ИСПОЛЬЗОВАНИЯ БОЛЕЕ ДЕШЕВЫХ МАТЕРИАЛОВ – ДСП И ДВП, ЧТО ПОЗВОЛЯЕТ ОФИСНОЙ МЕБЕЛИ СОХРАНЯТЬ ВЕЛИКОЛЕПНЫЕ ЭКСПЛУАТАЦИОННЫЕ ХАРАКТЕРИСТИКИ.\r\nЗАХОДЯ В ПОМЕЩЕНИЕ, ГДЕ НАХОДЯТСЯ СТОЛЫ \r\nДЛЯ ПЕРЕГОВОРОВ «СОБРАНИЕ», ВОЗНИКАЕТ СТОЙКОЕ ОЩУЩЕНИЕ, ЧТО НАХОДИШЬСЯ В КАБИНЕТЕ ЕСЛИ НЕ ПРЕЗИДЕНТА СТРАНЫ, ТО ПРЕМЬЕР-МИНИСТРА КАК МИНИМУМ. ВОТ-ВОТ В КОМНАТУ ВОЙДЕТ ВЫСОКОПОСТАВЛЕННЫЙ ЧИНОВНИК, И НАЧНЕТСЯ ОБСУЖДЕНИЕ ГЛОБАЛЬНЫХ ВОПРОСОВ. УДИВИТЕЛЬНОЕ СОЧЕТАНИЕ ИЗЫСКАННОЙ РОСКОШИ СТИЛЯ И КРАСОТЫ КЛАССИЧЕСКИХ ЛИНИЙ СТОЛОВ «СОБРАНИЕ» И ПРИВЛЕКАТЕЛЬНОЙ ЦЕНЫ ОПРОВЕРГАЕТ УСТОЯВШЕЕСЯ УТВЕРЖДЕНИЕ О КАЧЕСТВЕ ДЕШЕВОЙ МЕБЕЛИ. УМЕНЬШЕНИЕ СЕБЕСТОИМОСТИ ПРОИСХОДИТ ЗА СЧЕТ ИСПОЛЬЗОВАНИЯ БОЛЕЕ ДЕШЕВЫХ МАТЕРИАЛОВ – ДСП И ДВП, ЧТО ПОЗВОЛЯЕТ ОФИСНОЙ МЕБЕЛИ СОХРАНЯТЬ ВЕЛИКОЛЕПНЫЕ ЭКСПЛУАТАЦИОННЫЕ ХАРАКТЕРИСТИКИ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '23', '', '', '1523163777', NULL, NULL, NULL),
(18, '2021-01-27 06:21:35', 1, '2021-01-27 06:21:35', 1, 2, 2, 'Y', NULL, NULL, 500, 'Лидер', 33, '        <p>Этот стильный стол абсолютно не симметричен, и это придает ему изящность и оригинальность. \r\n        Слева он опирается на ножку, освобождая полезное пространство для системного блока и ног. \r\n        Справа основанием служит удобная и вместительная тумба. Плавные линии, стильный дизайн и высокая эргономичность являются \r\n        основными достоинствами данной серии.</p>\r\n      ', 'html', 34, '        \r\n        <p>Этот стильный стол абсолютно не симметричен, и это придает ему изящность и оригинальность. \r\n        Слева он опирается на ножку, освобождая полезное пространство для системного блока и ног. \r\n        Справа основанием служит удобная и вместительная тумба. Плавные линии, стильный дизайн и высокая эргономичность являются \r\n        основными достоинствами данной серии.</p>\r\n        \r\n      ', 'html', 'ЛИДЕР\r\nЭТОТ СТИЛЬНЫЙ СТОЛ АБСОЛЮТНО НЕ СИММЕТРИЧЕН, \r\nИ ЭТО ПРИДАЕТ ЕМУ ИЗЯЩНОСТЬ И ОРИГИНАЛЬНОСТЬ. СЛЕВА ОН ОПИРАЕТСЯ НА НОЖКУ, ОСВОБОЖДАЯ ПОЛЕЗНОЕ ПРОСТРАНСТВО ДЛЯ СИСТЕМНОГО БЛОКА И НОГ. СПРАВА ОСНОВАНИЕМ СЛУЖИТ УДОБНАЯ И ВМЕСТИТЕЛЬНАЯ ТУМБА. ПЛАВНЫЕ ЛИНИИ, СТИЛЬНЫЙ ДИЗАЙН И ВЫСОКАЯ ЭРГОНОМИЧНОСТЬ ЯВЛЯЮТСЯ ОСНОВНЫМИ ДОСТОИНСТВАМИ ДАННОЙ СЕРИИ.\r\nЭТОТ СТИЛЬНЫЙ СТОЛ АБСОЛЮТНО НЕ СИММЕТРИЧЕН, \r\nИ ЭТО ПРИДАЕТ ЕМУ ИЗЯЩНОСТЬ И ОРИГИНАЛЬНОСТЬ. СЛЕВА ОН ОПИРАЕТСЯ НА НОЖКУ, ОСВОБОЖДАЯ ПОЛЕЗНОЕ ПРОСТРАНСТВО ДЛЯ СИСТЕМНОГО БЛОКА И НОГ. СПРАВА ОСНОВАНИЕМ СЛУЖИТ УДОБНАЯ И ВМЕСТИТЕЛЬНАЯ ТУМБА. ПЛАВНЫЕ ЛИНИИ, СТИЛЬНЫЙ ДИЗАЙН И ВЫСОКАЯ ЭРГОНОМИЧНОСТЬ ЯВЛЯЮТСЯ ОСНОВНЫМИ ДОСТОИНСТВАМИ ДАННОЙ СЕРИИ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '24', '', '', '-1927682590', NULL, NULL, NULL),
(19, '2021-01-27 06:21:36', 1, '2021-01-27 06:21:35', 1, 2, 2, 'Y', NULL, NULL, 500, 'Президент', 35, '        <p><b>Кресло руководителя Президент</b> во главе большого круглого стола поможет создать в вашем кабинете\r\n        обстановку легендарной совещательной комнаты. Ведь это не просто мебель офисная – это настоящий трон, который \r\n        поможет управленцу решать любые вопросы, согласуясь с понятиями чести и совести.</p> \r\n      ', 'html', 36, '        \r\n        <p><b>Кресло руководителя Президент</b> во главе большого круглого стола поможет создать в вашем кабинете\r\n        обстановку легендарной совещательной комнаты. Ведь это не просто мебель офисная – это настоящий трон, который \r\n        поможет управленцу решать любые вопросы, согласуясь с понятиями чести и совести. \r\n        Дизайн кресла выполнен в строгом классическом стиле. Окантовка и подлокотники кресла выточена вручную и потому уникальны. \r\n        Производится ограниченными партиями - не более 10 кресел в год.</p>\r\n        \r\n      ', 'html', 'ПРЕЗИДЕНТ\r\nКРЕСЛО РУКОВОДИТЕЛЯ ПРЕЗИДЕНТ ВО ГЛАВЕ \r\nБОЛЬШОГО КРУГЛОГО СТОЛА ПОМОЖЕТ СОЗДАТЬ В ВАШЕМ КАБИНЕТЕ ОБСТАНОВКУ ЛЕГЕНДАРНОЙ СОВЕЩАТЕЛЬНОЙ КОМНАТЫ. ВЕДЬ ЭТО НЕ ПРОСТО МЕБЕЛЬ ОФИСНАЯ – ЭТО НАСТОЯЩИЙ ТРОН, КОТОРЫЙ ПОМОЖЕТ УПРАВЛЕНЦУ РЕШАТЬ ЛЮБЫЕ ВОПРОСЫ, СОГЛАСУЯСЬ С ПОНЯТИЯМИ ЧЕСТИ И СОВЕСТИ.\r\nКРЕСЛО РУКОВОДИТЕЛЯ ПРЕЗИДЕНТ ВО ГЛАВЕ \r\nБОЛЬШОГО КРУГЛОГО СТОЛА ПОМОЖЕТ СОЗДАТЬ В ВАШЕМ КАБИНЕТЕ ОБСТАНОВКУ ЛЕГЕНДАРНОЙ СОВЕЩАТЕЛЬНОЙ КОМНАТЫ. ВЕДЬ ЭТО НЕ ПРОСТО МЕБЕЛЬ ОФИСНАЯ – ЭТО НАСТОЯЩИЙ ТРОН, КОТОРЫЙ ПОМОЖЕТ УПРАВЛЕНЦУ РЕШАТЬ ЛЮБЫЕ ВОПРОСЫ, СОГЛАСУЯСЬ С ПОНЯТИЯМИ ЧЕСТИ И СОВЕСТИ. ДИЗАЙН КРЕСЛА ВЫПОЛНЕН В СТРОГОМ КЛАССИЧЕСКОМ СТИЛЕ. ОКАНТОВКА И ПОДЛОКОТНИКИ КРЕСЛА ВЫТОЧЕНА ВРУЧНУЮ И ПОТОМУ УНИКАЛЬНЫ. ПРОИЗВОДИТСЯ ОГРАНИЧЕННЫМИ ПАРТИЯМИ - НЕ БОЛЕЕ 10 КРЕСЕЛ В ГОД.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '25', '', '', '-1836002422', NULL, NULL, NULL),
(20, '2021-01-27 06:21:36', 1, '2021-01-27 06:21:36', 1, 2, 2, 'Y', NULL, NULL, 500, 'Плутон', 37, '        <p>Офисное кресло, подобранное с учетом ваших физиологических особенностей - важная составляющая работоспособности и здоровья. \r\n        Данная модель будет незаменима для тех, кто много работает за компьютером.</p>\r\n      ', 'html', 38, '        \r\n        <p>Офисное кресло, подобранное с учетом ваших физиологических особенностей - важная составляющая работоспособности и здоровья. \r\n        Данная модель будет незаменима для тех, кто много работает за компьютером.</p>\r\n        \r\n      ', 'html', 'ПЛУТОН\r\nОФИСНОЕ КРЕСЛО, ПОДОБРАННОЕ С УЧЕТОМ ВАШИХ \r\nФИЗИОЛОГИЧЕСКИХ ОСОБЕННОСТЕЙ - ВАЖНАЯ СОСТАВЛЯЮЩАЯ РАБОТОСПОСОБНОСТИ И ЗДОРОВЬЯ. ДАННАЯ МОДЕЛЬ БУДЕТ НЕЗАМЕНИМА ДЛЯ ТЕХ, КТО МНОГО РАБОТАЕТ ЗА КОМПЬЮТЕРОМ.\r\nОФИСНОЕ КРЕСЛО, ПОДОБРАННОЕ С УЧЕТОМ ВАШИХ \r\nФИЗИОЛОГИЧЕСКИХ ОСОБЕННОСТЕЙ - ВАЖНАЯ СОСТАВЛЯЮЩАЯ РАБОТОСПОСОБНОСТИ И ЗДОРОВЬЯ. ДАННАЯ МОДЕЛЬ БУДЕТ НЕЗАМЕНИМА ДЛЯ ТЕХ, КТО МНОГО РАБОТАЕТ ЗА КОМПЬЮТЕРОМ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '26', '', '', '1990779533', NULL, NULL, NULL),
(21, '2021-01-27 06:21:36', 1, '2021-01-27 06:21:36', 1, 2, 3, 'Y', NULL, NULL, 500, 'Парма', 39, '        <p>Стулья Парма внесут в кухню уютное обаяние экологически чистого древесного материала. \r\n        Стул практически целиком сделан из массива бука, исключением стало лишь мягкое сиденье. \r\n        Тонировка деревянных деталей может быть выполнена в любой цветовой палитре.</p>\r\n      ', 'html', 40, '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;p&gt;Стулья Парма внесут в кухню уютное обаяние экологически чистого древесного материала. <br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Стул практически целиком сделан из массива бука, исключением стало лишь мягкое сиденье. <br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Тонировка деревянных деталей может быть выполнена в любой цветовой палитре.&lt;/p&gt;<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;', 'html', 'ПАРМА\r\nСТУЛЬЯ ПАРМА ВНЕСУТ В КУХНЮ УЮТНОЕ ОБАЯНИЕ \r\nЭКОЛОГИЧЕСКИ ЧИСТОГО ДРЕВЕСНОГО МАТЕРИАЛА. СТУЛ ПРАКТИЧЕСКИ ЦЕЛИКОМ СДЕЛАН ИЗ МАССИВА БУКА, ИСКЛЮЧЕНИЕМ СТАЛО ЛИШЬ МЯГКОЕ СИДЕНЬЕ. ТОНИРОВКА ДЕРЕВЯННЫХ ДЕТАЛЕЙ МОЖЕТ БЫТЬ ВЫПОЛНЕНА В ЛЮБОЙ ЦВЕТОВОЙ ПАЛИТРЕ.\r\n&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;\r\n&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&LT;P&GT;СТУЛЬЯ ПАРМА \r\nВНЕСУТ В КУХНЮ УЮТНОЕ ОБАЯНИЕ ЭКОЛОГИЧЕСКИ ЧИСТОГО ДРЕВЕСНОГО МАТЕРИАЛА. \r\n&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;СТУЛ ПРАКТИЧЕСКИ \r\nЦЕЛИКОМ СДЕЛАН ИЗ МАССИВА БУКА, ИСКЛЮЧЕНИЕМ СТАЛО ЛИШЬ МЯГКОЕ СИДЕНЬЕ. \r\n&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;ТОНИРОВКА ДЕРЕВЯННЫХ \r\nДЕТАЛЕЙ МОЖЕТ БЫТЬ ВЫПОЛНЕНА В ЛЮБОЙ ЦВЕТОВОЙ ПАЛИТРЕ.&LT;/P&GT;\r\n&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;\r\n&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '27', '', '', '964589627', NULL, NULL, NULL),
(22, '2021-01-27 06:21:37', 1, '2021-01-27 06:21:37', 1, 2, 3, 'Y', NULL, NULL, 500, 'Палермо', 41, '        <p>Универсальный дизайн стульев Палермо позволит с успехом использовать их и в офисных помещениях, \r\n        и в интерьере кафе, и в домашней обстановке. Стулья Палермо добавят уюта в каждое помещение и \r\n        органично сольются с его стилем.</p>\r\n      ', 'html', 42, '        \r\n        <p>Универсальный дизайн стульев Палермо позволит с успехом использовать их и в офисных помещениях, \r\n        и в интерьере кафе, и в домашней обстановке. Стулья Палермо добавят уюта в каждое помещение и \r\n        органично сольются с его стилем.</p>\r\n        \r\n      ', 'html', 'ПАЛЕРМО\r\nУНИВЕРСАЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ПАЛЕРМО ПОЗВОЛИТ \r\nС УСПЕХОМ ИСПОЛЬЗОВАТЬ ИХ И В ОФИСНЫХ ПОМЕЩЕНИЯХ, И В ИНТЕРЬЕРЕ КАФЕ, И В ДОМАШНЕЙ ОБСТАНОВКЕ. СТУЛЬЯ ПАЛЕРМО ДОБАВЯТ УЮТА В КАЖДОЕ ПОМЕЩЕНИЕ И ОРГАНИЧНО СОЛЬЮТСЯ С ЕГО СТИЛЕМ.\r\nУНИВЕРСАЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ПАЛЕРМО ПОЗВОЛИТ \r\nС УСПЕХОМ ИСПОЛЬЗОВАТЬ ИХ И В ОФИСНЫХ ПОМЕЩЕНИЯХ, И В ИНТЕРЬЕРЕ КАФЕ, И В ДОМАШНЕЙ ОБСТАНОВКЕ. СТУЛЬЯ ПАЛЕРМО ДОБАВЯТ УЮТА В КАЖДОЕ ПОМЕЩЕНИЕ И ОРГАНИЧНО СОЛЬЮТСЯ С ЕГО СТИЛЕМ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '28', '', '', '-1151185156', NULL, NULL, NULL),
(23, '2021-01-27 06:21:37', 1, '2021-01-27 06:21:37', 1, 2, 3, 'Y', NULL, NULL, 500, 'Валенсия', 43, '        <p>Стильный дизайн стульев Валенсия сразу привлекает внимание, а эргономичная форма спинки и \r\n        мягкое сиденье делают их необычайно удобными. Эти стулья хорошо подойдут к любой офисной мебели для \r\n        персонала.</p>\r\n      ', 'html', 44, '        \r\n        <p>Стильный дизайн стульев Валенсия сразу привлекает внимание, а эргономичная форма спинки и \r\n        мягкое сиденье делают их необычайно удобными. Эти стулья хорошо подойдут к любой офисной мебели для \r\n        персонала.</p>\r\n        \r\n      ', 'html', 'ВАЛЕНСИЯ\r\nСТИЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ВАЛЕНСИЯ СРАЗУ \r\nПРИВЛЕКАЕТ ВНИМАНИЕ, А ЭРГОНОМИЧНАЯ ФОРМА СПИНКИ И МЯГКОЕ СИДЕНЬЕ ДЕЛАЮТ ИХ НЕОБЫЧАЙНО УДОБНЫМИ. ЭТИ СТУЛЬЯ ХОРОШО ПОДОЙДУТ К ЛЮБОЙ ОФИСНОЙ МЕБЕЛИ ДЛЯ ПЕРСОНАЛА.\r\nСТИЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ВАЛЕНСИЯ СРАЗУ \r\nПРИВЛЕКАЕТ ВНИМАНИЕ, А ЭРГОНОМИЧНАЯ ФОРМА СПИНКИ И МЯГКОЕ СИДЕНЬЕ ДЕЛАЮТ ИХ НЕОБЫЧАЙНО УДОБНЫМИ. ЭТИ СТУЛЬЯ ХОРОШО ПОДОЙДУТ К ЛЮБОЙ ОФИСНОЙ МЕБЕЛИ ДЛЯ ПЕРСОНАЛА.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '29', '', '', '589017098', NULL, NULL, NULL),
(24, '2021-01-27 06:21:37', 1, '2021-01-27 06:21:37', 1, 2, 4, 'Y', NULL, NULL, 500, 'Фазенда', 45, '        <p>Складной деревянный стул с сиденьем и спинкой из плотного хлопка, изготовленный из натуральных природных материалов. \r\n        Ткань и дерево считаются теплыми материалами - даже зимой сидеть на них комфортнее, чем на железе или пластике. Это прекрасное решение для дачи.</p>\r\n      ', 'html', 46, '        \r\n        <p>Складной деревянный стул с сиденьем и спинкой из плотного хлопка, изготовленный из натуральных природных материалов. \r\n        Ткань и дерево считаются теплыми материалами - даже зимой сидеть на них комфортнее, чем на железе или пластике. Это прекрасное решение для дачи.</p>\r\n        \r\n      ', 'html', 'ФАЗЕНДА\r\nСКЛАДНОЙ ДЕРЕВЯННЫЙ СТУЛ С СИДЕНЬЕМ И СПИНКОЙ \r\nИЗ ПЛОТНОГО ХЛОПКА, ИЗГОТОВЛЕННЫЙ ИЗ НАТУРАЛЬНЫХ ПРИРОДНЫХ МАТЕРИАЛОВ. ТКАНЬ И ДЕРЕВО СЧИТАЮТСЯ ТЕПЛЫМИ МАТЕРИАЛАМИ - ДАЖЕ ЗИМОЙ СИДЕТЬ НА НИХ КОМФОРТНЕЕ, ЧЕМ НА ЖЕЛЕЗЕ ИЛИ ПЛАСТИКЕ. ЭТО ПРЕКРАСНОЕ РЕШЕНИЕ ДЛЯ ДАЧИ.\r\nСКЛАДНОЙ ДЕРЕВЯННЫЙ СТУЛ С СИДЕНЬЕМ И СПИНКОЙ \r\nИЗ ПЛОТНОГО ХЛОПКА, ИЗГОТОВЛЕННЫЙ ИЗ НАТУРАЛЬНЫХ ПРИРОДНЫХ МАТЕРИАЛОВ. ТКАНЬ И ДЕРЕВО СЧИТАЮТСЯ ТЕПЛЫМИ МАТЕРИАЛАМИ - ДАЖЕ ЗИМОЙ СИДЕТЬ НА НИХ КОМФОРТНЕЕ, ЧЕМ НА ЖЕЛЕЗЕ ИЛИ ПЛАСТИКЕ. ЭТО ПРЕКРАСНОЕ РЕШЕНИЕ ДЛЯ ДАЧИ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '30', '', '', '-1288812514', NULL, NULL, NULL),
(25, '2021-01-27 06:21:38', 1, '2021-01-27 06:21:37', 1, 2, 4, 'Y', NULL, NULL, 500, 'Эра', 47, '        <p>Стильный стул необычный формы с жесткими сиденьями на металлическом каркасе удобен тем, \r\n        что можно компактно сложить для хранения до 45 таких стульев. Легкая и прочная модель отлично подойдет \r\n        к компьютерной стойке, также ее можно использовать как мебель для кафе и баров.</p>\r\n      ', 'html', 48, '        \r\n        <p>Стильный стул необычный формы с жесткими сиденьями на металлическом каркасе удобен тем, \r\n        что можно компактно сложить для хранения до 45 таких стульев. Легкая и прочная модель отлично подойдет \r\n        к компьютерной стойке, также ее можно использовать как мебель для кафе и баров.</p>\r\n        \r\n      ', 'html', 'ЭРА\r\nСТИЛЬНЫЙ СТУЛ НЕОБЫЧНЫЙ ФОРМЫ С ЖЕСТКИМИ \r\nСИДЕНЬЯМИ НА МЕТАЛЛИЧЕСКОМ КАРКАСЕ УДОБЕН ТЕМ, ЧТО МОЖНО КОМПАКТНО СЛОЖИТЬ ДЛЯ ХРАНЕНИЯ ДО 45 ТАКИХ СТУЛЬЕВ. ЛЕГКАЯ И ПРОЧНАЯ МОДЕЛЬ ОТЛИЧНО ПОДОЙДЕТ К КОМПЬЮТЕРНОЙ СТОЙКЕ, ТАКЖЕ ЕЕ МОЖНО ИСПОЛЬЗОВАТЬ КАК МЕБЕЛЬ ДЛЯ КАФЕ И БАРОВ.\r\nСТИЛЬНЫЙ СТУЛ НЕОБЫЧНЫЙ ФОРМЫ С ЖЕСТКИМИ \r\nСИДЕНЬЯМИ НА МЕТАЛЛИЧЕСКОМ КАРКАСЕ УДОБЕН ТЕМ, ЧТО МОЖНО КОМПАКТНО СЛОЖИТЬ ДЛЯ ХРАНЕНИЯ ДО 45 ТАКИХ СТУЛЬЕВ. ЛЕГКАЯ И ПРОЧНАЯ МОДЕЛЬ ОТЛИЧНО ПОДОЙДЕТ К КОМПЬЮТЕРНОЙ СТОЙКЕ, ТАКЖЕ ЕЕ МОЖНО ИСПОЛЬЗОВАТЬ КАК МЕБЕЛЬ ДЛЯ КАФЕ И БАРОВ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '31', '', '', '858154825', NULL, NULL, NULL),
(26, '2021-01-27 06:21:39', 1, '2021-01-27 06:21:38', 1, 2, 4, 'Y', NULL, NULL, 500, 'Сити', 49, '        <p>Стильный, легкий и удобный стул на хромированном основании сразу привлекает внимание \r\n        своей необычной формой. А разнообразные варианты обивки позволяют подобрать наилучшее сочетание с \r\n        любой компьютерной мебелью.</p>\r\n      ', 'html', 50, '        \r\n        <p>Стильный, легкий и удобный стул на хромированном основании сразу привлекает внимание \r\n        своей необычной формой. А разнообразные варианты обивки позволяют подобрать наилучшее сочетание с \r\n        любой компьютерной мебелью.</p>\r\n        \r\n      ', 'html', 'СИТИ\r\nСТИЛЬНЫЙ, ЛЕГКИЙ И УДОБНЫЙ СТУЛ НА ХРОМИРОВАННОМ \r\nОСНОВАНИИ СРАЗУ ПРИВЛЕКАЕТ ВНИМАНИЕ СВОЕЙ НЕОБЫЧНОЙ ФОРМОЙ. А РАЗНООБРАЗНЫЕ ВАРИАНТЫ ОБИВКИ ПОЗВОЛЯЮТ ПОДОБРАТЬ НАИЛУЧШЕЕ СОЧЕТАНИЕ С ЛЮБОЙ КОМПЬЮТЕРНОЙ МЕБЕЛЬЮ.\r\nСТИЛЬНЫЙ, ЛЕГКИЙ И УДОБНЫЙ СТУЛ НА ХРОМИРОВАННОМ \r\nОСНОВАНИИ СРАЗУ ПРИВЛЕКАЕТ ВНИМАНИЕ СВОЕЙ НЕОБЫЧНОЙ ФОРМОЙ. А РАЗНООБРАЗНЫЕ ВАРИАНТЫ ОБИВКИ ПОЗВОЛЯЮТ ПОДОБРАТЬ НАИЛУЧШЕЕ СОЧЕТАНИЕ С ЛЮБОЙ КОМПЬЮТЕРНОЙ МЕБЕЛЬЮ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '32', '', '', '-252178488', NULL, NULL, NULL),
(27, '2021-01-27 06:21:39', 1, '2021-01-27 06:21:39', 1, 2, 4, 'Y', NULL, NULL, 500, 'Изопласт Хром', 51, '        <p>Популярная модель офисного стула на хромированном металлическом каркасе с пластиковыми спинкой и \r\n        сиденьем хорошо вписывается в любой интерьер. Прочные и долговечные, эти стулья удобны для использования \r\n        в качестве аудиторных конференц-кресел, кроме того, их легко хранить.</p>\r\n      ', 'html', 52, '        \r\n        <p>Популярная модель офисного стула на хромированном металлическом каркасе с пластиковыми спинкой и \r\n        сиденьем хорошо вписывается в любой интерьер. Прочные и долговечные, эти стулья удобны для использования \r\n        в качестве аудиторных конференц-кресел, кроме того, их легко хранить.</p>\r\n        \r\n      ', 'html', 'ИЗОПЛАСТ ХРОМ\r\nПОПУЛЯРНАЯ МОДЕЛЬ ОФИСНОГО СТУЛА НА ХРОМИРОВАННОМ \r\nМЕТАЛЛИЧЕСКОМ КАРКАСЕ С ПЛАСТИКОВЫМИ СПИНКОЙ И СИДЕНЬЕМ ХОРОШО ВПИСЫВАЕТСЯ В ЛЮБОЙ ИНТЕРЬЕР. ПРОЧНЫЕ И ДОЛГОВЕЧНЫЕ, ЭТИ СТУЛЬЯ УДОБНЫ ДЛЯ ИСПОЛЬЗОВАНИЯ В КАЧЕСТВЕ АУДИТОРНЫХ КОНФЕРЕНЦ-КРЕСЕЛ, КРОМЕ ТОГО, ИХ ЛЕГКО ХРАНИТЬ.\r\nПОПУЛЯРНАЯ МОДЕЛЬ ОФИСНОГО СТУЛА НА ХРОМИРОВАННОМ \r\nМЕТАЛЛИЧЕСКОМ КАРКАСЕ С ПЛАСТИКОВЫМИ СПИНКОЙ И СИДЕНЬЕМ ХОРОШО ВПИСЫВАЕТСЯ В ЛЮБОЙ ИНТЕРЬЕР. ПРОЧНЫЕ И ДОЛГОВЕЧНЫЕ, ЭТИ СТУЛЬЯ УДОБНЫ ДЛЯ ИСПОЛЬЗОВАНИЯ В КАЧЕСТВЕ АУДИТОРНЫХ КОНФЕРЕНЦ-КРЕСЕЛ, КРОМЕ ТОГО, ИХ ЛЕГКО ХРАНИТЬ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '33', '', '', '2001037389', NULL, NULL, NULL),
(28, '2021-01-27 06:21:42', 1, '2021-01-27 06:21:42', 1, 3, NULL, 'Y', NULL, NULL, 500, 'Мебель на заказ', 53, 'Наша компания занимается разработкой мебели на заказ.', 'html', NULL, '        <p>Наша компания занимается разработкой мебели на заказ по индивидуальным проектам: встроенные и корпусные шкафы купе,\r\n        гардеробные комнаты, прихожие, библиотеки, платяные шкафы, комоды и другие сложные конструкции.</p>\r\n        <p>Мы создаем мебель идеально подходящую именно к вашему дому и офису, интерьеры, максимально отображающие вашу индивидуальность.\r\n        По Вашей заявке наш специалист приезжает со всеми образцами материалов, с которыми мы работаем, в любое удобное для Вас время и\r\n        произведет все необходимые замеры. Учитывая все Ваши пожелания и особенности помещения, составляется эскизный проект.</p>\r\n        <p>После заключения договора, в котором оговариваются сроки доставки и монтажа мебели, эскизный проект передается на производство,\r\n        где опытными специалистами производятся расчеты в программе трехмерного моделирования. После всех расчетов готовый проект поступает\r\n        непосредственно на производство, где производят раскрой деталей, их обработку, и сборку некоторых элементов. Накануне дня доставки\r\n        сотрудники отдела транспортных услуг свяжутся с Вами и более конкретно оговорят время доставки. После заключения договора вами\r\n        вносится предоплата в размере 30% от суммы заказанной Вами мебели. Остальная сумма оплачивается Вами по доставке.</p>\r\n        \r\n      ', 'html', 'МЕБЕЛЬ НА ЗАКАЗ\r\nНАША КОМПАНИЯ ЗАНИМАЕТСЯ РАЗРАБОТКОЙ МЕБЕЛИ \r\nНА ЗАКАЗ.\r\nНАША КОМПАНИЯ ЗАНИМАЕТСЯ РАЗРАБОТКОЙ МЕБЕЛИ \r\nНА ЗАКАЗ ПО ИНДИВИДУАЛЬНЫМ ПРОЕКТАМ: ВСТРОЕННЫЕ И КОРПУСНЫЕ ШКАФЫ КУПЕ, ГАРДЕРОБНЫЕ КОМНАТЫ, ПРИХОЖИЕ, БИБЛИОТЕКИ, ПЛАТЯНЫЕ ШКАФЫ, КОМОДЫ И ДРУГИЕ СЛОЖНЫЕ КОНСТРУКЦИИ. \r\n\r\nМЫ СОЗДАЕМ МЕБЕЛЬ ИДЕАЛЬНО ПОДХОДЯЩУЮ \r\nИМЕННО К ВАШЕМУ ДОМУ И ОФИСУ, ИНТЕРЬЕРЫ, МАКСИМАЛЬНО ОТОБРАЖАЮЩИЕ ВАШУ ИНДИВИДУАЛЬНОСТЬ. ПО ВАШЕЙ ЗАЯВКЕ НАШ СПЕЦИАЛИСТ ПРИЕЗЖАЕТ СО ВСЕМИ ОБРАЗЦАМИ МАТЕРИАЛОВ, С КОТОРЫМИ МЫ РАБОТАЕМ, В ЛЮБОЕ УДОБНОЕ ДЛЯ ВАС ВРЕМЯ И ПРОИЗВЕДЕТ ВСЕ НЕОБХОДИМЫЕ ЗАМЕРЫ. УЧИТЫВАЯ ВСЕ ВАШИ ПОЖЕЛАНИЯ И ОСОБЕННОСТИ ПОМЕЩЕНИЯ, СОСТАВЛЯЕТСЯ ЭСКИЗНЫЙ ПРОЕКТ. \r\n\r\nПОСЛЕ ЗАКЛЮЧЕНИЯ ДОГОВОРА, В КОТОРОМ ОГОВАРИВАЮТСЯ \r\nСРОКИ ДОСТАВКИ И МОНТАЖА МЕБЕЛИ, ЭСКИЗНЫЙ ПРОЕКТ ПЕРЕДАЕТСЯ НА ПРОИЗВОДСТВО, ГДЕ ОПЫТНЫМИ СПЕЦИАЛИСТАМИ ПРОИЗВОДЯТСЯ РАСЧЕТЫ В ПРОГРАММЕ ТРЕХМЕРНОГО МОДЕЛИРОВАНИЯ. ПОСЛЕ ВСЕХ РАСЧЕТОВ ГОТОВЫЙ ПРОЕКТ ПОСТУПАЕТ НЕПОСРЕДСТВЕННО НА ПРОИЗВОДСТВО, ГДЕ ПРОИЗВОДЯТ РАСКРОЙ ДЕТАЛЕЙ, ИХ ОБРАБОТКУ, И СБОРКУ НЕКОТОРЫХ ЭЛЕМЕНТОВ. НАКАНУНЕ ДНЯ ДОСТАВКИ СОТРУДНИКИ ОТДЕЛА ТРАНСПОРТНЫХ УСЛУГ СВЯЖУТСЯ С ВАМИ И БОЛЕЕ КОНКРЕТНО ОГОВОРЯТ ВРЕМЯ ДОСТАВКИ. ПОСЛЕ ЗАКЛЮЧЕНИЯ ДОГОВОРА ВАМИ ВНОСИТСЯ ПРЕДОПЛАТА В РАЗМЕРЕ 30% ОТ СУММЫ ЗАКАЗАННОЙ ВАМИ МЕБЕЛИ. ОСТАЛЬНАЯ СУММА ОПЛАЧИВАЕТСЯ ВАМИ ПО ДОСТАВКЕ.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '5', '', '', '841280321', NULL, NULL, NULL),
(29, '2021-01-27 06:21:43', 1, '2021-01-27 06:21:42', 1, 3, NULL, 'Y', NULL, NULL, 500, 'Услуги дизайнера', 54, 'Мы предлагаем широкий спектр услуг по дизайну мебели.', 'html', NULL, '        \r\n        <ul>\r\n          <li>Диагностика возможностей преобразования помещений – определение вариантов перепланировки, отделки, разработка новых решений колористки, освещения, перестановки мебели и декора, разработка специальных функциональных зон для переключения в различные режимы жизни.</li>\r\n          <li>Разработка Идеи-Образа, проведение предварительных расчётов и создание 3D-модели: изображение передает цвет и фактуру, предлагая клиенту экспериментировать и подбирать оптимальный вариант.</li>\r\n          <li>Разработка компьютерных цветных трехмерных моделей мебели. Натуралистичность изображений, их высокая схожесть с оригиналом позволяют представить, как будет выглядеть готовое изделие,  рассмотреть его в деталях.</li>\r\n          <li>Подбор и расстановка мебели.</li>\r\n          <li>Декорирование - подбор декора и аксессуаров интерьера в соответствии с образом и стилем помещения. Возможно создание по индивидуальному запросу эксклюзивных, авторских коллекций.</li>\r\n        </ul>\r\n        \r\n      ', 'html', 'УСЛУГИ ДИЗАЙНЕРА\r\nМЫ ПРЕДЛАГАЕМ ШИРОКИЙ СПЕКТР УСЛУГ ПО ДИЗАЙНУ \r\nМЕБЕЛИ.\r\n- ДИАГНОСТИКА ВОЗМОЖНОСТЕЙ ПРЕОБРАЗОВАНИЯ \r\nПОМЕЩЕНИЙ – ОПРЕДЕЛЕНИЕ ВАРИАНТОВ ПЕРЕПЛАНИРОВКИ, ОТДЕЛКИ, РАЗРАБОТКА НОВЫХ РЕШЕНИЙ КОЛОРИСТКИ, ОСВЕЩЕНИЯ, ПЕРЕСТАНОВКИ МЕБЕЛИ И ДЕКОРА, РАЗРАБОТКА СПЕЦИАЛЬНЫХ ФУНКЦИОНАЛЬНЫХ ЗОН ДЛЯ ПЕРЕКЛЮЧЕНИЯ В РАЗЛИЧНЫЕ РЕЖИМЫ ЖИЗНИ. \r\n- РАЗРАБОТКА ИДЕИ-ОБРАЗА, ПРОВЕДЕНИЕ ПРЕДВАРИТЕЛЬНЫХ \r\nРАСЧЁТОВ И СОЗДАНИЕ 3D-МОДЕЛИ: ИЗОБРАЖЕНИЕ ПЕРЕДАЕТ ЦВЕТ И ФАКТУРУ, ПРЕДЛАГАЯ КЛИЕНТУ ЭКСПЕРИМЕНТИРОВАТЬ И ПОДБИРАТЬ ОПТИМАЛЬНЫЙ ВАРИАНТ. \r\n- РАЗРАБОТКА КОМПЬЮТЕРНЫХ ЦВЕТНЫХ ТРЕХМЕРНЫХ \r\nМОДЕЛЕЙ МЕБЕЛИ. НАТУРАЛИСТИЧНОСТЬ ИЗОБРАЖЕНИЙ, ИХ ВЫСОКАЯ СХОЖЕСТЬ С ОРИГИНАЛОМ ПОЗВОЛЯЮТ ПРЕДСТАВИТЬ, КАК БУДЕТ ВЫГЛЯДЕТЬ ГОТОВОЕ ИЗДЕЛИЕ, РАССМОТРЕТЬ ЕГО В ДЕТАЛЯХ. \r\n- ПОДБОР И РАССТАНОВКА МЕБЕЛИ. \r\n- ДЕКОРИРОВАНИЕ - ПОДБОР ДЕКОРА И АКСЕССУАРОВ \r\nИНТЕРЬЕРА В СООТВЕТСТВИИ С ОБРАЗОМ И СТИЛЕМ ПОМЕЩЕНИЯ. ВОЗМОЖНО СОЗДАНИЕ ПО ИНДИВИДУАЛЬНОМУ ЗАПРОСУ ЭКСКЛЮЗИВНЫХ, АВТОРСКИХ КОЛЛЕКЦИЙ.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '6', '', '', '-1080381355', NULL, NULL, NULL),
(30, '2021-01-27 06:21:44', 1, '2021-01-27 06:21:44', 1, 4, NULL, 'Y', '2010-05-01 00:00:00', NULL, 200, 'Продавец-дизайнер (кухни)', NULL, '', 'html', NULL, '<b>Требования</b> 						 						 \r\n<p>Уверенный пользователь ПК, навыки черчения от руки и в программах, опыт работы дизайнером/конструктором в мебельной сфере, этика делового общения</p>\r\n 						 						<b>Обязанности</b> 						 \r\n<p>Консультирование клиентов по кухонной мебели, оставление художественно-конструкторских проектов, прием и оформление заказов.</p>\r\n 						 						<b>Условия</b> 						 \r\n<p>Зарплата: 13500 оклад + % от личных продаж + премии‚ совокупный доход от 20000 руб,полный соц. пакет‚ оформление согласно ТК РФ</p>\r\n ', 'html', 'ПРОДАВЕЦ-ДИЗАЙНЕР (КУХНИ)\r\n\r\nТРЕБОВАНИЯ \r\n\r\nУВЕРЕННЫЙ ПОЛЬЗОВАТЕЛЬ ПК, НАВЫКИ ЧЕРЧЕНИЯ \r\nОТ РУКИ И В ПРОГРАММАХ, ОПЫТ РАБОТЫ ДИЗАЙНЕРОМ/КОНСТРУКТОРОМ В МЕБЕЛЬНОЙ СФЕРЕ, ЭТИКА ДЕЛОВОГО ОБЩЕНИЯ ОБЯЗАННОСТИ \r\n\r\nКОНСУЛЬТИРОВАНИЕ КЛИЕНТОВ ПО КУХОННОЙ \r\nМЕБЕЛИ, ОСТАВЛЕНИЕ ХУДОЖЕСТВЕННО-КОНСТРУКТОРСКИХ ПРОЕКТОВ, ПРИЕМ И ОФОРМЛЕНИЕ ЗАКАЗОВ. УСЛОВИЯ \r\n\r\nЗАРПЛАТА: 13500 ОКЛАД + % ОТ ЛИЧНЫХ ПРОДАЖ + \r\nПРЕМИИ‚ СОВОКУПНЫЙ ДОХОД ОТ 20000 РУБ,ПОЛНЫЙ СОЦ. ПАКЕТ‚ ОФОРМЛЕНИЕ СОГЛАСНО ТК РФ', 1, NULL, NULL, NULL, NULL, NULL, 'N', '2', '', '', '1704140047', NULL, NULL, NULL),
(31, '2021-01-27 06:21:45', 1, '2021-01-27 06:21:44', 1, 4, NULL, 'Y', '2010-05-01 00:00:00', NULL, 300, 'Директор магазина', NULL, '', 'html', NULL, '<b>Требования</b> 						 						 \r\n<p>Высшее образование‚ опыт руководящей работы в рознице от 3 лет‚ опытный пользователь ПК‚ этика делового общения‚ знание методов управления и заключения договоров‚ отличное знание торгового и трудового законодательств‚ ответственность‚ инициативность‚ активность.</p>\r\n 						 						<b>Обязанности</b> 						 \r\n<p>Руководство деятельностью магазина‚ организация эффективной работы персонала магазина‚ финансово-хозяйственная деятельность и отчетность‚ выполнение плана продаж‚ отчетность.</p>\r\n 						 						<b>Условия</b> 						 \r\n<p>Трудоустройство по ТК РФ‚ полный соц. пакет‚ график работы 5 чере 2 (168 час/мес)‚ зарплата: оклад 28000 + % от оборота + премии‚ совокупный доход от 35000 руб</p>\r\n ', 'html', 'ДИРЕКТОР МАГАЗИНА\r\n\r\nТРЕБОВАНИЯ \r\n\r\nВЫСШЕЕ ОБРАЗОВАНИЕ‚ ОПЫТ РУКОВОДЯЩЕЙ \r\nРАБОТЫ В РОЗНИЦЕ ОТ 3 ЛЕТ‚ ОПЫТНЫЙ ПОЛЬЗОВАТЕЛЬ ПК‚ ЭТИКА ДЕЛОВОГО ОБЩЕНИЯ‚ ЗНАНИЕ МЕТОДОВ УПРАВЛЕНИЯ И ЗАКЛЮЧЕНИЯ ДОГОВОРОВ‚ ОТЛИЧНОЕ ЗНАНИЕ ТОРГОВОГО И ТРУДОВОГО ЗАКОНОДАТЕЛЬСТВ‚ ОТВЕТСТВЕННОСТЬ‚ ИНИЦИАТИВНОСТЬ‚ АКТИВНОСТЬ. ОБЯЗАННОСТИ \r\n\r\nРУКОВОДСТВО ДЕЯТЕЛЬНОСТЬЮ МАГАЗИНА‚ ОРГАНИЗАЦИЯ \r\nЭФФЕКТИВНОЙ РАБОТЫ ПЕРСОНАЛА МАГАЗИНА‚ ФИНАНСОВО-ХОЗЯЙСТВЕННАЯ ДЕЯТЕЛЬНОСТЬ И ОТЧЕТНОСТЬ‚ ВЫПОЛНЕНИЕ ПЛАНА ПРОДАЖ‚ ОТЧЕТНОСТЬ. УСЛОВИЯ \r\n\r\nТРУДОУСТРОЙСТВО ПО ТК РФ‚ ПОЛНЫЙ СОЦ. ПАКЕТ‚ \r\nГРАФИК РАБОТЫ 5 ЧЕРЕ 2 (168 ЧАС/МЕС)‚ ЗАРПЛАТА: ОКЛАД 28000 + % ОТ ОБОРОТА + ПРЕМИИ‚ СОВОКУПНЫЙ ДОХОД ОТ 35000 РУБ', 1, NULL, NULL, NULL, NULL, NULL, 'N', '3', '', '', '192768702', NULL, NULL, NULL),
(32, '2021-01-27 06:21:45', 1, '2021-01-27 06:21:45', 1, 4, NULL, 'Y', '2010-05-01 00:00:00', NULL, 400, 'Бухгалтер отдела учета готовой продукции', NULL, '', 'html', NULL, '<b>Требования</b> 						 						 \r\n<p>Жен., 22-45, уверенный пользователь ПК, опыт работы бухгалтером приветсвуется, знание бухгалтерского учета (базовый уровень), самостоятельность, ответственность, коммуникабельность, быстрая обучаемость, желание работать.</p>\r\n 						 						<b>Обязанности</b> 						 \r\n<p>Работа с первичными документами по учету МПЗ Ведение журналов-ордеров по производственным счетам Формирование материальных отчетов подразделений Исполнение дополнительных функций по указанию руководителя</p>\r\n 						 						<b>Условия</b> 						 \r\n<p>График работы 5 дней в неделю, адрес работы г. Шатура, Ботинский пр-д, 37. Зарплата: оклад 10 800 р. + премия 40% от оклада, полный соц. пакет.</p>\r\n ', 'html', 'БУХГАЛТЕР ОТДЕЛА УЧЕТА ГОТОВОЙ ПРОДУКЦИИ\r\n\r\nТРЕБОВАНИЯ \r\n\r\nЖЕН., 22-45, УВЕРЕННЫЙ ПОЛЬЗОВАТЕЛЬ ПК, ОПЫТ \r\nРАБОТЫ БУХГАЛТЕРОМ ПРИВЕТСВУЕТСЯ, ЗНАНИЕ БУХГАЛТЕРСКОГО УЧЕТА (БАЗОВЫЙ УРОВЕНЬ), САМОСТОЯТЕЛЬНОСТЬ, ОТВЕТСТВЕННОСТЬ, КОММУНИКАБЕЛЬНОСТЬ, БЫСТРАЯ ОБУЧАЕМОСТЬ, ЖЕЛАНИЕ РАБОТАТЬ. ОБЯЗАННОСТИ \r\n\r\nРАБОТА С ПЕРВИЧНЫМИ ДОКУМЕНТАМИ ПО УЧЕТУ \r\nМПЗ ВЕДЕНИЕ ЖУРНАЛОВ-ОРДЕРОВ ПО ПРОИЗВОДСТВЕННЫМ СЧЕТАМ ФОРМИРОВАНИЕ МАТЕРИАЛЬНЫХ ОТЧЕТОВ ПОДРАЗДЕЛЕНИЙ ИСПОЛНЕНИЕ ДОПОЛНИТЕЛЬНЫХ ФУНКЦИЙ ПО УКАЗАНИЮ РУКОВОДИТЕЛЯ УСЛОВИЯ \r\n\r\nГРАФИК РАБОТЫ 5 ДНЕЙ В НЕДЕЛЮ, АДРЕС РАБОТЫ \r\nГ. ШАТУРА, БОТИНСКИЙ ПР-Д, 37. ЗАРПЛАТА: ОКЛАД 10 800 Р. + ПРЕМИЯ 40% ОТ ОКЛАДА, ПОЛНЫЙ СОЦ. ПАКЕТ.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '4', '', '', '790068583', NULL, NULL, NULL);
-- -----------------------------------
-- Dumping table b_iblock_element_iprop
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_element_iprop`;
CREATE TABLE `b_iblock_element_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ELEMENT_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_1` (`IBLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_element_lock
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_element_lock`;
CREATE TABLE `b_iblock_element_lock` (
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `DATE_LOCK` datetime DEFAULT NULL,
  `LOCKED_BY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_element_property
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_element_property`;
CREATE TABLE `b_iblock_element_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_PROPERTY_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  `VALUE_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `VALUE_ENUM` int(11) DEFAULT NULL,
  `VALUE_NUM` decimal(18,4) DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_property_1` (`IBLOCK_ELEMENT_ID`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_property_2` (`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_enum` (`VALUE_ENUM`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_num` (`VALUE_NUM`,`IBLOCK_PROPERTY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_element_property` VALUES
(1, 2, 4, '10000', 'text', NULL, 10000.0000, ''),
(2, 3, 4, '2', 'text', 2, NULL, NULL),
(3, 4, 4, '195x95x125', 'text', NULL, 195.0000, ''),
(4, 6, 4, '40324А', 'text', NULL, 40324.0000, ''),
(5, 7, 4, 'Кожа, ткань', 'text', NULL, 0.0000, ''),
(6, 8, 4, 'Россия', 'text', NULL, 0.0000, ''),
(7, 2, 5, '12000', 'text', NULL, 12000.0000, ''),
(8, 3, 5, '2', 'text', 2, NULL, NULL),
(9, 4, 5, '175x95x115', 'text', NULL, 175.0000, ''),
(10, 6, 5, '56830Е', 'text', NULL, 56830.0000, ''),
(11, 7, 5, 'Кожа, ткань', 'text', NULL, 0.0000, ''),
(12, 8, 5, 'Россия', 'text', NULL, 0.0000, ''),
(13, 1, 6, '1', 'text', 1, NULL, NULL),
(14, 2, 6, '7899', 'text', NULL, 7899.0000, ''),
(15, 3, 6, '2', 'text', 2, NULL, NULL),
(16, 4, 6, '54x49x120', 'text', NULL, 54.0000, ''),
(17, 6, 6, '435245', 'text', NULL, 435245.0000, ''),
(18, 7, 6, 'Кожа, ткань', 'text', NULL, 0.0000, ''),
(19, 8, 6, 'Россия', 'text', NULL, 0.0000, ''),
(20, 2, 7, '8999', 'text', NULL, 8999.0000, ''),
(21, 3, 7, '2', 'text', 2, NULL, NULL),
(22, 4, 7, '66x60x36', 'text', NULL, 66.0000, ''),
(23, 6, 7, '234523', 'text', NULL, 234523.0000, ''),
(24, 7, 7, 'Кожа, ткань', 'text', NULL, 0.0000, ''),
(25, 8, 7, 'Россия', 'text', NULL, 0.0000, ''),
(26, 2, 8, '1500', 'text', NULL, 1500.0000, ''),
(27, 3, 8, '2', 'text', 2, NULL, NULL),
(28, 4, 8, '51x43x85', 'text', NULL, 51.0000, ''),
(29, 6, 8, '234011', 'text', NULL, 234011.0000, ''),
(30, 7, 8, 'Дерево, ткань', 'text', NULL, 0.0000, ''),
(31, 8, 8, 'Россия', 'text', NULL, 0.0000, ''),
(32, 1, 9, '1', 'text', 1, NULL, NULL),
(33, 2, 9, '11899', 'text', NULL, 11899.0000, ''),
(34, 3, 9, '2', 'text', 2, NULL, NULL),
(35, 4, 9, '155x90x95', 'text', NULL, 155.0000, ''),
(36, 6, 9, '47539Р', 'text', NULL, 47539.0000, ''),
(37, 7, 9, 'Кожа, ткань', 'text', NULL, 0.0000, ''),
(38, 8, 9, 'Россия', 'text', NULL, 0.0000, ''),
(39, 2, 10, '12500', 'text', NULL, 12500.0000, ''),
(40, 3, 10, '2', 'text', 2, NULL, NULL),
(41, 4, 10, '165x90x115', 'text', NULL, 165.0000, ''),
(42, 6, 10, '00549Е', 'text', NULL, 549.0000, ''),
(43, 7, 10, 'Кожа, ткань', 'text', NULL, 0.0000, ''),
(44, 8, 10, 'Россия', 'text', NULL, 0.0000, ''),
(45, 2, 11, '8000', 'text', NULL, 8000.0000, ''),
(46, 3, 11, '2', 'text', 2, NULL, NULL),
(47, 4, 11, '155x95x105', 'text', NULL, 155.0000, ''),
(48, 6, 11, '98922К', 'text', NULL, 98922.0000, ''),
(49, 7, 11, 'Кожа, ткань', 'text', NULL, 0.0000, ''),
(50, 8, 11, 'Россия', 'text', NULL, 0.0000, ''),
(51, 1, 12, '1', 'text', 1, NULL, NULL),
(52, 2, 12, '10999', 'text', NULL, 10999.0000, ''),
(53, 3, 12, '2', 'text', 2, NULL, NULL),
(54, 4, 12, '165x90x115', 'text', NULL, 165.0000, ''),
(55, 6, 12, '64512Т', 'text', NULL, 64512.0000, ''),
(56, 7, 12, 'Кожа, ткань', 'text', NULL, 0.0000, ''),
(57, 8, 12, 'Россия', 'text', NULL, 0.0000, ''),
(58, 2, 13, '9999', 'text', NULL, 9999.0000, ''),
(59, 3, 13, '2', 'text', 2, NULL, NULL),
(60, 4, 13, '210x105x135', 'text', NULL, 210.0000, ''),
(61, 6, 13, '96395Т', 'text', NULL, 96395.0000, ''),
(62, 7, 13, 'Кожа, ткань', 'text', NULL, 0.0000, ''),
(63, 8, 13, 'Россия', 'text', NULL, 0.0000, ''),
(64, 2, 14, '1499', 'text', NULL, 1499.0000, ''),
(65, 3, 14, '2', 'text', 2, NULL, NULL),
(66, 4, 14, '175x110x115', 'text', NULL, 175.0000, ''),
(67, 5, 14, '200x100', 'text', NULL, 200.0000, ''),
(68, 6, 14, '38263Е', 'text', NULL, 38263.0000, ''),
(69, 7, 14, 'Кожа, ткань', 'text', NULL, 0.0000, ''),
(70, 8, 14, 'Россия', 'text', NULL, 0.0000, ''),
(71, 2, 15, '9999', 'text', NULL, 9999.0000, ''),
(72, 3, 15, '2', 'text', 2, NULL, NULL),
(73, 6, 15, '634645', 'text', NULL, 634645.0000, ''),
(74, 7, 15, 'Кожа, ткань', 'text', NULL, 0.0000, ''),
(75, 8, 15, 'Россия', 'text', NULL, 0.0000, ''),
(76, 2, 16, '7799', 'text', NULL, 7799.0000, ''),
(77, 3, 16, '2', 'text', 2, NULL, NULL),
(78, 6, 16, '634045', 'text', NULL, 634045.0000, ''),
(79, 7, 16, 'Кожа, ткань', 'text', NULL, 0.0000, ''),
(80, 8, 16, 'Россия', 'text', NULL, 0.0000, ''),
(81, 2, 17, '6779', 'text', NULL, 6779.0000, ''),
(82, 3, 17, '2', 'text', 2, NULL, NULL),
(83, 4, 17, '220x140x120', 'text', NULL, 220.0000, ''),
(84, 6, 17, '634043', 'text', NULL, 634043.0000, ''),
(85, 7, 17, 'Кожа, ткань', 'text', NULL, 0.0000, ''),
(86, 8, 17, 'Россия', 'text', NULL, 0.0000, ''),
(87, 2, 18, '4579', 'text', NULL, 4579.0000, ''),
(88, 3, 18, '2', 'text', 2, NULL, NULL),
(89, 4, 18, '200x150x120', 'text', NULL, 200.0000, ''),
(90, 6, 18, '634023', 'text', NULL, 634023.0000, ''),
(91, 7, 18, 'Кожа, ткань', 'text', NULL, 0.0000, ''),
(92, 8, 18, 'Россия', 'text', NULL, 0.0000, ''),
(93, 1, 19, '1', 'text', 1, NULL, NULL),
(94, 2, 19, '14999', 'text', NULL, 14999.0000, ''),
(95, 3, 19, '2', 'text', 2, NULL, NULL),
(96, 4, 19, '50x69x130', 'text', NULL, 50.0000, ''),
(97, 6, 19, '634023', 'text', NULL, 634023.0000, ''),
(98, 7, 19, 'Кожа, ткань', 'text', NULL, 0.0000, ''),
(99, 8, 19, 'Россия', 'text', NULL, 0.0000, ''),
(100, 2, 20, '12999', 'text', NULL, 12999.0000, ''),
(101, 3, 20, '2', 'text', 2, NULL, NULL),
(102, 4, 20, '58x48x86', 'text', NULL, 58.0000, ''),
(103, 6, 20, '634011', 'text', NULL, 634011.0000, ''),
(104, 7, 20, 'Кожа, металл, ткань', 'text', NULL, 0.0000, ''),
(105, 8, 20, 'Россия', 'text', NULL, 0.0000, ''),
(106, 2, 21, '1700', 'text', NULL, 1700.0000, ''),
(107, 3, 21, '2', 'text', 2, NULL, NULL),
(108, 4, 21, '52x42x88', 'text', NULL, 52.0000, ''),
(109, 6, 21, '234012', 'text', NULL, 234012.0000, ''),
(110, 7, 21, 'Дерево, ткань', 'text', NULL, 0.0000, ''),
(111, 8, 21, 'Россия', 'text', NULL, 0.0000, ''),
(112, 2, 22, '1000', 'text', NULL, 1000.0000, ''),
(113, 3, 22, '2', 'text', 2, NULL, NULL),
(114, 4, 22, '52x42x88', 'text', NULL, 52.0000, ''),
(115, 6, 22, '234014', 'text', NULL, 234014.0000, ''),
(116, 7, 22, 'Дерево, ткань', 'text', NULL, 0.0000, ''),
(117, 8, 22, 'Россия', 'text', NULL, 0.0000, ''),
(118, 2, 23, '1399', 'text', NULL, 1399.0000, ''),
(119, 3, 23, '2', 'text', 2, NULL, NULL),
(120, 4, 23, '55x39x90', 'text', NULL, 55.0000, ''),
(121, 6, 23, '234017', 'text', NULL, 234017.0000, ''),
(122, 7, 23, 'Дерево, ткань', 'text', NULL, 0.0000, ''),
(123, 8, 23, 'Россия', 'text', NULL, 0.0000, ''),
(124, 2, 24, '1000', 'text', NULL, 1000.0000, ''),
(125, 3, 24, '2', 'text', 2, NULL, NULL),
(126, 4, 24, '56x48x80', 'text', NULL, 56.0000, ''),
(127, 6, 24, '234013', 'text', NULL, 234013.0000, ''),
(128, 7, 24, 'Дерево, ткань', 'text', NULL, 0.0000, ''),
(129, 8, 24, 'Россия', 'text', NULL, 0.0000, ''),
(130, 2, 25, '1300', 'text', NULL, 1300.0000, ''),
(131, 3, 25, '2', 'text', 2, NULL, NULL),
(132, 4, 25, '52x42x88', 'text', NULL, 52.0000, ''),
(133, 6, 25, '234015', 'text', NULL, 234015.0000, ''),
(134, 7, 25, 'Металл, пластик', 'text', NULL, 0.0000, ''),
(135, 8, 25, 'Россия', 'text', NULL, 0.0000, ''),
(136, 2, 26, '1699', 'text', NULL, 1699.0000, ''),
(137, 3, 26, '2', 'text', 2, NULL, NULL),
(138, 4, 26, '52x45x65', 'text', NULL, 52.0000, ''),
(139, 6, 26, '234016', 'text', NULL, 234016.0000, ''),
(140, 7, 26, 'Металл, пластик, кожа', 'text', NULL, 0.0000, ''),
(141, 8, 26, 'Россия', 'text', NULL, 0.0000, ''),
(142, 2, 27, '1679', 'text', NULL, 1679.0000, ''),
(143, 3, 27, '2', 'text', 2, NULL, NULL),
(144, 4, 27, '54x43x82', 'text', NULL, 54.0000, ''),
(145, 6, 27, '234017', 'text', NULL, 234017.0000, ''),
(146, 7, 27, 'Металл, пластик', 'text', NULL, 0.0000, ''),
(147, 8, 27, 'Россия', 'text', NULL, 0.0000, '');
-- -----------------------------------
-- Dumping table b_iblock_element_right
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_element_right`;
CREATE TABLE `b_iblock_element_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`ELEMENT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_element_right_1` (`ELEMENT_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_element_right_2` (`IBLOCK_ID`,`RIGHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_fields
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_fields`;
CREATE TABLE `b_iblock_fields` (
  `IBLOCK_ID` int(18) NOT NULL,
  `FIELD_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`IBLOCK_ID`,`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_fields` VALUES
(1, 'ACTIVE', 'Y', 'Y'),
(1, 'ACTIVE_FROM', 'N', '=today'),
(1, 'ACTIVE_TO', 'N', ''),
(1, 'CODE', 'N', ''),
(1, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(1, 'DETAIL_TEXT', 'N', ''),
(1, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(1, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(1, 'IBLOCK_SECTION', 'N', ''),
(1, 'LOG_ELEMENT_ADD', 'N', NULL),
(1, 'LOG_ELEMENT_DELETE', 'N', NULL),
(1, 'LOG_ELEMENT_EDIT', 'N', NULL),
(1, 'LOG_SECTION_ADD', 'N', NULL),
(1, 'LOG_SECTION_DELETE', 'N', NULL),
(1, 'LOG_SECTION_EDIT', 'N', NULL),
(1, 'NAME', 'Y', ''),
(1, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(1, 'PREVIEW_TEXT', 'N', ''),
(1, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(1, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(1, 'SECTION_CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(1, 'SECTION_DESCRIPTION', 'N', NULL),
(1, 'SECTION_DESCRIPTION_TYPE', 'Y', NULL),
(1, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(1, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(1, 'SECTION_NAME', 'Y', NULL),
(1, 'SECTION_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(1, 'SECTION_XML_ID', 'N', NULL),
(1, 'SORT', 'N', '0'),
(1, 'TAGS', 'N', ''),
(1, 'XML_ID', 'Y', ''),
(1, 'XML_IMPORT_START_TIME', 'N', '2021-01-27 04:21:22'),
(2, 'ACTIVE', 'Y', 'Y'),
(2, 'ACTIVE_FROM', 'N', ''),
(2, 'ACTIVE_TO', 'N', ''),
(2, 'CODE', 'N', ''),
(2, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(2, 'DETAIL_TEXT', 'N', ''),
(2, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(2, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(2, 'IBLOCK_SECTION', 'N', ''),
(2, 'LOG_ELEMENT_ADD', 'N', NULL),
(2, 'LOG_ELEMENT_DELETE', 'N', NULL),
(2, 'LOG_ELEMENT_EDIT', 'N', NULL),
(2, 'LOG_SECTION_ADD', 'N', NULL),
(2, 'LOG_SECTION_DELETE', 'N', NULL),
(2, 'LOG_SECTION_EDIT', 'N', NULL),
(2, 'NAME', 'Y', ''),
(2, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(2, 'PREVIEW_TEXT', 'N', ''),
(2, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(2, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(2, 'SECTION_CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(2, 'SECTION_DESCRIPTION', 'N', NULL),
(2, 'SECTION_DESCRIPTION_TYPE', 'Y', NULL),
(2, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(2, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(2, 'SECTION_NAME', 'Y', NULL),
(2, 'SECTION_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(2, 'SECTION_XML_ID', 'N', NULL),
(2, 'SORT', 'N', '0'),
(2, 'TAGS', 'N', ''),
(2, 'XML_ID', 'Y', ''),
(2, 'XML_IMPORT_START_TIME', 'N', '2021-01-27 04:21:30'),
(3, 'ACTIVE', 'Y', 'Y'),
(3, 'ACTIVE_FROM', 'N', ''),
(3, 'ACTIVE_TO', 'N', ''),
(3, 'CODE', 'N', ''),
(3, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(3, 'DETAIL_TEXT', 'N', ''),
(3, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(3, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(3, 'IBLOCK_SECTION', 'N', ''),
(3, 'LOG_ELEMENT_ADD', 'N', NULL),
(3, 'LOG_ELEMENT_DELETE', 'N', NULL),
(3, 'LOG_ELEMENT_EDIT', 'N', NULL),
(3, 'LOG_SECTION_ADD', 'N', NULL),
(3, 'LOG_SECTION_DELETE', 'N', NULL),
(3, 'LOG_SECTION_EDIT', 'N', NULL),
(3, 'NAME', 'Y', ''),
(3, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(3, 'PREVIEW_TEXT', 'N', ''),
(3, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(3, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(3, 'SECTION_CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(3, 'SECTION_DESCRIPTION', 'N', NULL),
(3, 'SECTION_DESCRIPTION_TYPE', 'Y', NULL),
(3, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(3, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(3, 'SECTION_NAME', 'Y', NULL),
(3, 'SECTION_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(3, 'SECTION_XML_ID', 'N', NULL),
(3, 'SORT', 'N', '0'),
(3, 'TAGS', 'N', ''),
(3, 'XML_ID', 'Y', ''),
(3, 'XML_IMPORT_START_TIME', 'N', '2021-01-27 04:21:41'),
(4, 'ACTIVE', 'Y', 'Y'),
(4, 'ACTIVE_FROM', 'N', ''),
(4, 'ACTIVE_TO', 'N', ''),
(4, 'CODE', 'N', ''),
(4, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(4, 'DETAIL_TEXT', 'N', ''),
(4, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(4, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(4, 'IBLOCK_SECTION', 'N', ''),
(4, 'LOG_ELEMENT_ADD', 'N', NULL),
(4, 'LOG_ELEMENT_DELETE', 'N', NULL),
(4, 'LOG_ELEMENT_EDIT', 'N', NULL),
(4, 'LOG_SECTION_ADD', 'N', NULL),
(4, 'LOG_SECTION_DELETE', 'N', NULL),
(4, 'LOG_SECTION_EDIT', 'N', NULL),
(4, 'NAME', 'Y', ''),
(4, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(4, 'PREVIEW_TEXT', 'N', ''),
(4, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(4, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(4, 'SECTION_CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(4, 'SECTION_DESCRIPTION', 'N', NULL),
(4, 'SECTION_DESCRIPTION_TYPE', 'Y', NULL),
(4, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(4, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(4, 'SECTION_NAME', 'Y', NULL),
(4, 'SECTION_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(4, 'SECTION_XML_ID', 'N', NULL),
(4, 'SORT', 'N', '0'),
(4, 'TAGS', 'N', ''),
(4, 'XML_ID', 'Y', ''),
(4, 'XML_IMPORT_START_TIME', 'N', '2021-01-27 04:21:44');
-- -----------------------------------
-- Dumping table b_iblock_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_group`;
CREATE TABLE `b_iblock_group` (
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `PERMISSION` char(1) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `ux_iblock_group_1` (`IBLOCK_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_group` VALUES
(1, 1, 'X'),
(1, 2, 'R'),
(1, 5, 'W'),
(2, 1, 'X'),
(2, 2, 'R'),
(2, 5, 'W'),
(3, 1, 'X'),
(3, 2, 'R'),
(3, 5, 'W'),
(4, 1, 'X'),
(4, 2, 'R'),
(4, 5, 'W');
-- -----------------------------------
-- Dumping table b_iblock_iblock_iprop
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_iblock_iprop`;
CREATE TABLE `b_iblock_iblock_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_iblock_iprop_0` (`IPROP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_iproperty
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_iproperty`;
CREATE TABLE `b_iblock_iproperty` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `TEMPLATE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_iprop_0` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_messages
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_messages`;
CREATE TABLE `b_iblock_messages` (
  `IBLOCK_ID` int(18) NOT NULL,
  `MESSAGE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_TEXT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_messages` VALUES
(1, 'ELEMENT_ADD', 'Добавить новость'),
(1, 'ELEMENT_DELETE', 'Удалить новость'),
(1, 'ELEMENT_EDIT', 'Изменить новость'),
(1, 'ELEMENT_NAME', 'Новость'),
(1, 'ELEMENTS_NAME', 'Новости'),
(1, 'SECTION_ADD', 'Добавить раздел'),
(1, 'SECTION_DELETE', 'Удалить раздел'),
(1, 'SECTION_EDIT', 'Изменить раздел'),
(1, 'SECTION_NAME', 'Раздел'),
(1, 'SECTIONS_NAME', 'Разделы'),
(2, 'ELEMENT_ADD', 'Добавить товар'),
(2, 'ELEMENT_DELETE', 'Удалить товар'),
(2, 'ELEMENT_EDIT', 'Изменить товар'),
(2, 'ELEMENT_NAME', 'Элемент'),
(2, 'ELEMENTS_NAME', 'Товары'),
(2, 'SECTION_ADD', 'Добавить раздел'),
(2, 'SECTION_DELETE', 'Удалить раздел'),
(2, 'SECTION_EDIT', 'Изменить раздел'),
(2, 'SECTION_NAME', 'Раздел'),
(2, 'SECTIONS_NAME', 'Разделы'),
(3, 'ELEMENT_ADD', 'Добавить услугу'),
(3, 'ELEMENT_DELETE', 'Удалить услугу'),
(3, 'ELEMENT_EDIT', 'Изменить услугу'),
(3, 'ELEMENT_NAME', 'Услуга'),
(3, 'ELEMENTS_NAME', 'Услуги'),
(3, 'SECTION_ADD', 'Добавить раздел'),
(3, 'SECTION_DELETE', 'Удалить раздел'),
(3, 'SECTION_EDIT', 'Изменить раздел'),
(3, 'SECTION_NAME', 'Раздел'),
(3, 'SECTIONS_NAME', 'Разделы'),
(4, 'ELEMENT_ADD', 'Добавить вакансию'),
(4, 'ELEMENT_DELETE', 'Удалить вакансию'),
(4, 'ELEMENT_EDIT', 'Изменить вакансию'),
(4, 'ELEMENT_NAME', 'Вакансия'),
(4, 'ELEMENTS_NAME', 'Вакансии'),
(4, 'SECTION_ADD', 'Добавить раздел'),
(4, 'SECTION_DELETE', 'Удалить раздел'),
(4, 'SECTION_EDIT', 'Изменить раздел'),
(4, 'SECTION_NAME', 'Раздел'),
(4, 'SECTIONS_NAME', 'Разделы');
-- -----------------------------------
-- Dumping table b_iblock_offers_tmp
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_offers_tmp`;
CREATE TABLE `b_iblock_offers_tmp` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PRODUCT_IBLOCK_ID` int(11) unsigned NOT NULL,
  `OFFERS_IBLOCK_ID` int(11) unsigned NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_property
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_property`;
CREATE TABLE `b_iblock_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` text COLLATE utf8_unicode_ci,
  `PROPERTY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `ROW_COUNT` int(11) NOT NULL DEFAULT '1',
  `COL_COUNT` int(11) NOT NULL DEFAULT '30',
  `LIST_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'L',
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_TYPE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MULTIPLE_CNT` int(11) DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_IBLOCK_ID` int(18) DEFAULT NULL,
  `WITH_DESCRIPTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FILTRABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `USER_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_SETTINGS` text COLLATE utf8_unicode_ci,
  `HINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_property_1` (`IBLOCK_ID`),
  KEY `ix_iblock_property_3` (`LINK_IBLOCK_ID`),
  KEY `ix_iblock_property_2` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_property` VALUES
(1, '2021-01-27 06:21:30', 2, 'Специальное предложение', 'Y', 100, 'SPECIALOFFER', NULL, 'L', 1, 30, 'C', 'N', '5', NULL, 5, NULL, NULL, 'N', 'N', 'N', 'N', 1, NULL, NULL, NULL),
(2, '2021-01-27 06:21:30', 2, 'Цена', 'Y', 200, 'PRICE', NULL, 'N', 1, 30, 'L', 'N', '6', NULL, 5, NULL, NULL, 'N', 'N', 'N', 'N', 1, NULL, NULL, NULL),
(3, '2021-01-27 06:21:30', 2, 'Валюта цены (подпись)', 'Y', 300, 'PRICECURRENCY', NULL, 'L', 1, 30, 'C', 'N', '7', NULL, 5, NULL, NULL, 'N', 'N', 'N', 'N', 1, NULL, NULL, NULL),
(4, '2021-01-27 06:21:30', 2, 'Габариты (Д х Ш х В)', 'Y', 400, 'SIZE', NULL, 'S', 1, 30, 'L', 'N', '8', NULL, 5, NULL, NULL, 'N', 'N', 'N', 'N', 1, NULL, NULL, NULL),
(5, '2021-01-27 06:21:30', 2, 'Размеры спального места', 'Y', 500, 'S_SIZE', NULL, 'S', 1, 30, 'L', 'N', '9', NULL, 5, NULL, NULL, 'N', 'N', 'N', 'N', 1, NULL, NULL, NULL),
(6, '2021-01-27 06:21:30', 2, 'Артикул', 'Y', 600, 'ARTNUMBER', NULL, 'S', 1, 30, 'L', 'N', '10', NULL, 5, NULL, NULL, 'N', 'N', 'N', 'N', 1, NULL, NULL, NULL),
(7, '2021-01-27 06:21:30', 2, 'Материал', 'Y', 700, 'MATERIAL', NULL, 'S', 1, 30, 'L', 'N', '11', NULL, 5, NULL, NULL, 'N', 'N', 'N', 'N', 1, NULL, NULL, NULL),
(8, '2021-01-27 06:21:30', 2, 'Производитель', 'Y', 800, 'MANUFACTURER', NULL, 'S', 1, 30, 'L', 'N', '12', NULL, 5, NULL, NULL, 'N', 'N', 'N', 'N', 1, NULL, NULL, NULL);
-- -----------------------------------
-- Dumping table b_iblock_property_enum
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_property_enum`;
CREATE TABLE `b_iblock_property_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROPERTY_ID` int(11) NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `XML_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_iblock_property_enum` (`PROPERTY_ID`,`XML_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_property_enum` VALUES
(1, 1, 'да', 'N', 500, 'Y', NULL),
(2, 3, 'руб.', 'Y', 10, 'corp_cf_cur_1', NULL),
(3, 3, '$', 'N', 20, 'corp_cf_cur_3', NULL),
(4, 3, '€', 'N', 30, 'corp_cf_cur_2', NULL);
-- -----------------------------------
-- Dumping table b_iblock_property_feature
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_property_feature`;
CREATE TABLE `b_iblock_property_feature` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROPERTY_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FEATURE_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `IS_ENABLED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_iblock_property_feature` (`PROPERTY_ID`,`MODULE_ID`,`FEATURE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_right
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_right`;
CREATE TABLE `b_iblock_right` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `DO_INHERIT` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `OP_SREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `OP_EREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_right_iblock_id` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `ix_b_iblock_right_group_code` (`GROUP_CODE`,`IBLOCK_ID`),
  KEY `ix_b_iblock_right_entity` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `ix_b_iblock_right_op_eread` (`ID`,`OP_EREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_op_sread` (`ID`,`OP_SREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_task_id` (`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_rss
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_rss`;
CREATE TABLE `b_iblock_rss` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `NODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NODE_VALUE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_section
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_section`;
CREATE TABLE `b_iblock_section` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL,
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `GLOBAL_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `LEFT_MARGIN` int(18) DEFAULT NULL,
  `RIGHT_MARGIN` int(18) DEFAULT NULL,
  `DEPTH_LEVEL` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_section_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_section_depth_level` (`IBLOCK_ID`,`DEPTH_LEVEL`),
  KEY `ix_iblock_section_left_margin` (`IBLOCK_ID`,`LEFT_MARGIN`,`RIGHT_MARGIN`),
  KEY `ix_iblock_section_right_margin` (`IBLOCK_ID`,`RIGHT_MARGIN`,`LEFT_MARGIN`),
  KEY `ix_iblock_section_code` (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_section` VALUES
(1, '2021-01-27 06:21:31', 1, '2021-01-27 06:21:31', 1, 2, NULL, 'Y', 'Y', 100, 'Мягкая мебель', 1, 1, 2, 1, 'Диваны, кресла и прочая мягкая мебель', 'html', 'МЯГКАЯ МЕБЕЛЬ\r\nДИВАНЫ, КРЕСЛА И ПРОЧАЯ МЯГКАЯ МЕБЕЛЬ', NULL, '2', NULL, NULL, NULL),
(2, '2021-01-27 06:21:31', 1, '2021-01-27 06:21:31', 1, 2, NULL, 'Y', 'Y', 200, 'Офисная мебель', 2, 3, 4, 1, 'Диваны, столы, стулья', 'html', 'ОФИСНАЯ МЕБЕЛЬ\r\nДИВАНЫ, СТОЛЫ, СТУЛЬЯ', NULL, '3', NULL, NULL, NULL),
(3, '2021-01-27 06:21:31', 1, '2021-01-27 06:21:31', 1, 2, NULL, 'Y', 'Y', 300, 'Мебель для кухни', 3, 5, 6, 1, 'Полки, ящики, столы и стулья', 'html', 'МЕБЕЛЬ ДЛЯ КУХНИ\r\nПОЛКИ, ЯЩИКИ, СТОЛЫ И СТУЛЬЯ', NULL, '4', NULL, NULL, NULL),
(4, '2021-01-27 06:21:31', 1, '2021-01-27 06:21:31', 1, 2, NULL, 'Y', 'Y', 400, 'Детская мебель', 4, 7, 8, 1, 'Кровати, стулья, мягкая детская мебель', 'html', 'ДЕТСКАЯ МЕБЕЛЬ\r\nКРОВАТИ, СТУЛЬЯ, МЯГКАЯ ДЕТСКАЯ МЕБЕЛЬ', NULL, '5', NULL, NULL, NULL);
-- -----------------------------------
-- Dumping table b_iblock_section_element
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_section_element`;
CREATE TABLE `b_iblock_section_element` (
  `IBLOCK_SECTION_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `ADDITIONAL_PROPERTY_ID` int(18) DEFAULT NULL,
  UNIQUE KEY `ux_iblock_section_element` (`IBLOCK_SECTION_ID`,`IBLOCK_ELEMENT_ID`,`ADDITIONAL_PROPERTY_ID`),
  KEY `UX_IBLOCK_SECTION_ELEMENT2` (`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_section_element` VALUES
(1, 4, NULL),
(1, 5, NULL),
(1, 9, NULL),
(1, 10, NULL),
(1, 11, NULL),
(1, 12, NULL),
(1, 13, NULL),
(1, 14, NULL),
(2, 6, NULL),
(2, 7, NULL),
(2, 15, NULL),
(2, 16, NULL),
(2, 17, NULL),
(2, 18, NULL),
(2, 19, NULL),
(2, 20, NULL),
(3, 8, NULL),
(3, 21, NULL),
(3, 22, NULL),
(3, 23, NULL),
(4, 24, NULL),
(4, 25, NULL),
(4, 26, NULL),
(4, 27, NULL);
-- -----------------------------------
-- Dumping table b_iblock_section_iprop
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_section_iprop`;
CREATE TABLE `b_iblock_section_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`SECTION_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_1` (`IBLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_section_property
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_section_property`;
CREATE TABLE `b_iblock_section_property` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `PROPERTY_ID` int(11) NOT NULL,
  `SMART_FILTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_EXPANDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_HINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SECTION_ID`,`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_1` (`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_2` (`SECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_section_right
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_section_right`;
CREATE TABLE `b_iblock_section_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_section_right_1` (`SECTION_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_section_right_2` (`IBLOCK_ID`,`RIGHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_sequence
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_sequence`;
CREATE TABLE `b_iblock_sequence` (
  `IBLOCK_ID` int(18) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SEQ_VALUE` int(11) DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_site
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_site`;
CREATE TABLE `b_iblock_site` (
  `IBLOCK_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_site` VALUES
(1, 's1'),
(2, 's1'),
(3, 's1'),
(4, 's1');
-- -----------------------------------
-- Dumping table b_iblock_type
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_type`;
CREATE TABLE `b_iblock_type` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_RSS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(18) NOT NULL DEFAULT '500',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_type` VALUES
('news', 'N', NULL, NULL, 'Y', 50),
('products', 'Y', NULL, NULL, 'N', 100),
('rest_entity', 'Y', NULL, NULL, 'N', 1000),
('vacancies', 'Y', NULL, NULL, 'N', 150);
-- -----------------------------------
-- Dumping table b_iblock_type_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_type_lang`;
CREATE TABLE `b_iblock_type_lang` (
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_type_lang` VALUES
('rest_entity', 'ru', 'Хранилище данных для приложений Маркетплейс24', 'Разделы', 'Элементы'),
('news', 'en', 'News', '', 'News'),
('news', 'ru', 'Новости', '', 'Новости'),
('products', 'en', 'Products and services', 'Sections', 'Products and services'),
('products', 'ru', 'Товары и услуги', 'Разделы', 'Товары и услуги'),
('vacancies', 'en', 'Job', 'Categories', 'Vacancies'),
('vacancies', 'ru', 'Вакансии', 'Разделы', 'Вакансии');
-- -----------------------------------
-- Dumping table b_landing
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing`;
CREATE TABLE `b_landing` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INITIATOR_APP_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RULE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `PUBLIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SYS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `VIEWS` int(18) NOT NULL DEFAULT '0',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TPL_ID` int(18) DEFAULT NULL,
  `TPL_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_ID` int(18) NOT NULL,
  `SITEMAP` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FOLDER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FOLDER_ID` int(18) DEFAULT NULL,
  `SEARCH_CONTENT` mediumtext COLLATE utf8_unicode_ci,
  `VERSION` int(18) NOT NULL DEFAULT '1',
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  `DATE_PUBLIC` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_LAND_CODE` (`CODE`),
  KEY `IX_B_LAND_ACTIVE` (`ACTIVE`),
  KEY `IX_B_LAND_DELETED` (`DELETED`),
  KEY `IX_B_LAND_SYS` (`SYS`),
  KEY `IX_B_LAND_XML_ID` (`XML_ID`),
  KEY `IX_B_LAND_SITEMAP` (`SITEMAP`),
  KEY `IX_B_LAND_FOLDER` (`FOLDER`),
  KEY `IX_B_LAND_FOLDER_ID` (`FOLDER_ID`),
  FULLTEXT KEY `IX_B_LANDING_SEARCH` (`SEARCH_CONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_binding
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_binding`;
CREATE TABLE `b_landing_binding` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `BINDING_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `BINDING_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_BINDING` (`BINDING_ID`,`BINDING_TYPE`),
  KEY `IX_B_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IX_B_BINDING_TYPE` (`BINDING_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_block
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_block`;
CREATE TABLE `b_landing_block` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(18) DEFAULT NULL,
  `LID` int(18) NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INITIATOR_APP_CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ANCHOR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) DEFAULT '500',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PUBLIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACCESS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'X',
  `SOURCE_PARAMS` mediumtext COLLATE utf8_unicode_ci,
  `CONTENT` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `SEARCH_CONTENT` mediumtext COLLATE utf8_unicode_ci,
  `ASSETS` text COLLATE utf8_unicode_ci,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_BLOCK_LID` (`LID`),
  KEY `IX_B_BLOCK_CODE` (`CODE`),
  KEY `IX_B_BLOCK_ACTIVE` (`ACTIVE`),
  KEY `IX_B_BLOCK_PUBLIC` (`PUBLIC`),
  KEY `IX_B_BLOCK_DELETED` (`DELETED`),
  FULLTEXT KEY `IX_B_BLOCK_SEARCH` (`SEARCH_CONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_chat
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_chat`;
CREATE TABLE `b_landing_chat` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CHAT_ID` int(18) NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `AVATAR` int(18) DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CHAT` (`CHAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_chat_binding
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_chat_binding`;
CREATE TABLE `b_landing_chat_binding` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `INTERNAL_CHAT_ID` int(18) NOT NULL,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CHAT` (`INTERNAL_CHAT_ID`),
  KEY `IX_B_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_cookies_agreement
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_cookies_agreement`;
CREATE TABLE `b_landing_cookies_agreement` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SITE_ID` int(18) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SITE` (`SITE_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_demo
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_demo`;
CREATE TABLE `b_landing_demo` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `APP_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TYPE` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `TPL_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `SHOW_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW2X` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW3X` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MANIFEST` mediumtext COLLATE utf8_unicode_ci,
  `LANG` text COLLATE utf8_unicode_ci,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_DEMO_ACTIVE` (`ACTIVE`),
  KEY `IX_B_DEMO_SHOW_IN_LIST` (`SHOW_IN_LIST`),
  KEY `IX_B_DEMO_XML_ID` (`XML_ID`),
  KEY `IX_B_DEMO_APP_CODE` (`APP_CODE`),
  KEY `IX_B_DEMO_TEMPLATE_ID` (`SITE_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_domain
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_domain`;
CREATE TABLE `b_landing_domain` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROTOCOL` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `PROVIDER` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_DOMAIN_ACTIVE` (`ACTIVE`),
  KEY `IX_B_DOMAIN_DOMAIN` (`DOMAIN`),
  KEY `IX_B_DOMAIN_PROVIDER` (`PROVIDER`),
  KEY `IX_B_DOMAIN_XML_ID` (`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_entity_rights
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_entity_rights`;
CREATE TABLE `b_landing_entity_rights` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `ACCESS_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ROLE_ID` int(18) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IX_ROLE` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_file
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_file`;
CREATE TABLE `b_landing_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IX_FILE` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_filter_block
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_filter_block`;
CREATE TABLE `b_landing_filter_block` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FILTER_ID` int(18) NOT NULL,
  `BLOCK_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_FILTER_BLOCK` (`FILTER_ID`,`BLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_filter_entity
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_filter_entity`;
CREATE TABLE `b_landing_filter_entity` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SOURCE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_HASH` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER` text COLLATE utf8_unicode_ci,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_FILTER_HASH` (`FILTER_HASH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_hook_data
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_hook_data`;
CREATE TABLE `b_landing_hook_data` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `HOOK` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `PUBLIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `K_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_placement
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_placement`;
CREATE TABLE `b_landing_placement` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(18) DEFAULT NULL,
  `PLACEMENT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PLACEMENT_HANDLER` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_repo
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_repo`;
CREATE TABLE `b_landing_repo` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `APP_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTIONS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MANIFEST` text COLLATE utf8_unicode_ci,
  `CONTENT` text COLLATE utf8_unicode_ci NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_REPO_ACTIVE` (`ACTIVE`),
  KEY `IX_B_REPO_XML_ID` (`XML_ID`),
  KEY `IX_B_REPO_APP_CODE` (`APP_CODE`),
  KEY `IX_B_REPO_TEMPLATE_ID` (`SITE_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_role
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_role`;
CREATE TABLE `b_landing_role` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCESS_CODES` text COLLATE utf8_unicode_ci,
  `ADDITIONAL_RIGHTS` text COLLATE utf8_unicode_ci,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `IX_B_ROLE_TYPE` (`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_site
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_site`;
CREATE TABLE `b_landing_site` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'PAGE',
  `TPL_ID` int(18) DEFAULT NULL,
  `TPL_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOMAIN_ID` int(18) NOT NULL,
  `SMN_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANDING_ID_INDEX` int(18) DEFAULT NULL,
  `LANDING_ID_404` int(18) DEFAULT NULL,
  `LANDING_ID_503` int(18) DEFAULT NULL,
  `LANG` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SPECIAL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SITE_CODE` (`CODE`),
  KEY `IX_B_SITE_ACTIVE` (`ACTIVE`),
  KEY `IX_B_SITE_DELETED` (`DELETED`),
  KEY `IX_B_SITE_XML_ID` (`XML_ID`),
  KEY `IX_B_SITE_SPECIAL` (`SPECIAL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_syspage
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_syspage`;
CREATE TABLE `b_landing_syspage` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SITE_ID` int(18) NOT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LANDING_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SITE_ID` (`SITE_ID`),
  KEY `IX_LANDING_ID` (`LANDING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_template
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_template`;
CREATE TABLE `b_landing_template` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(18) DEFAULT '100',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` text COLLATE utf8_unicode_ci NOT NULL,
  `AREA_COUNT` int(2) NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_landing_template` VALUES
(1, 'Y', '#EMPTY#', 100, 'empty', '#CONTENT#', 0, 1, 1, '2021-01-27 04:17:06', '2021-01-27 04:17:06'),
(2, 'Y', '#SIDEBAR_LEFT#', 200, 'sidebar_left', '<div class=\"landing-layout-flex\">\n								<div class=\"landing-sidebar g-max-width-100x g-overflow-hidden\">#AREA_1#</div>\n								<div class=\"landing-main g-max-width-100x\">#CONTENT#</div>\n							</div>', 1, 1, 1, '2021-01-27 04:17:06', '2021-01-27 04:17:06'),
(3, 'Y', '#SIDEBAR_RIGHT#', 300, 'sidebar_right', '<div class=\"landing-layout-flex sidebar-right\">\n								<div class=\"landing-sidebar g-max-width-100x\">#AREA_1#</div>\n								<div class=\"landing-main g-max-width-100x\">#CONTENT#</div>\n							</div>', 1, 1, 1, '2021-01-27 04:17:06', '2021-01-27 04:17:06'),
(4, 'Y', '#HEADER_ONLY#', 400, 'header_only', '<div class=\"landing-header\">#AREA_1#</div> \n								<div class=\"landing-main\">#CONTENT#</div>', 1, 1, 1, '2021-01-27 04:17:06', '2021-01-27 04:17:06'),
(5, 'Y', '#HEADER_FOOTER#', 500, 'header_footer', '<div class=\"landing-header\">#AREA_1#</div> \n								<div class=\"landing-main\">#CONTENT#</div> \n							<div class=\"landing-footer\">#AREA_2#</div>', 2, 1, 1, '2021-01-27 04:17:06', '2021-01-27 04:17:06'),
(6, 'Y', '#WITHOUT_LEFT#', 600, 'without_left', '<div class=\"landing-header\">#AREA_1#</div>\n								<div class=\"landing-layout-flex without-left\">\n									<div class=\"landing-sidebar g-max-width-100x\">#AREA_2#</div>\n									<div class=\"landing-main g-max-width-100x\">#CONTENT#</div>\n								</div>\n							<div class=\"landing-footer\">#AREA_3#</div>', 3, 1, 1, '2021-01-27 04:17:06', '2021-01-27 04:17:06'),
(7, 'Y', '#WITHOUT_RIGHT#', 700, 'without_right', '<div class=\"landing-header\">#AREA_1#</div>\n								<div class=\"landing-layout-flex\">\n									<div class=\"landing-sidebar g-max-width-100x\">#AREA_2#</div>\n									<div class=\"landing-main g-max-width-100x\">#CONTENT#</div>\n								</div>\n							<div class=\"landing-footer\">#AREA_3#</div>', 3, 1, 1, '2021-01-27 04:17:06', '2021-01-27 04:17:06');
-- -----------------------------------
-- Dumping table b_landing_template_ref
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_template_ref`;
CREATE TABLE `b_landing_template_ref` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `AREA` int(2) NOT NULL,
  `LANDING_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `K_LANDING_ID` (`LANDING_ID`),
  KEY `K_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_update_block
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_update_block`;
CREATE TABLE `b_landing_update_block` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_BLOCK_ID` int(18) DEFAULT '0',
  `PARAMS` text COLLATE utf8_unicode_ci,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_urlrewrite
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_urlrewrite`;
CREATE TABLE `b_landing_urlrewrite` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SITE_ID` int(18) NOT NULL,
  `RULE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LANDING_ID` int(18) NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SITE_RULE` (`SITE_ID`,`RULE`),
  KEY `IX_LANDING_ID` (`LANDING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_view
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_view`;
CREATE TABLE `b_landing_view` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `LID` int(18) NOT NULL,
  `USER_ID` int(18) NOT NULL,
  `VIEWS` int(18) NOT NULL,
  `FIRST_VIEW` datetime NOT NULL,
  `LAST_VIEW` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_VIEW_LIDUID` (`LID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_lang`;
CREATE TABLE `b_lang` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DIR` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOC_ROOT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOMAIN_LIMITED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SERVER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_lang` VALUES
('s1', 1, 'Y', 'Y', 'Cайт производства (Сайт по умолчанию)', '/', NULL, NULL, NULL, NULL, NULL, 'ru', '', 'N', '', 'Cайт производства', '', 1);
-- -----------------------------------
-- Dumping table b_lang_domain
-- -----------------------------------
DROP TABLE IF EXISTS `b_lang_domain`;
CREATE TABLE `b_lang_domain` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`LID`,`DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_language
-- -----------------------------------
DROP TABLE IF EXISTS `b_language`;
CREATE TABLE `b_language` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_language` VALUES
('en', 2, 'N', 'Y', 'English', NULL, NULL, NULL, NULL, NULL, NULL, 2),
('ru', 1, 'Y', 'Y', 'Russian', NULL, NULL, NULL, NULL, NULL, NULL, 1);
-- -----------------------------------
-- Dumping table b_log_notification
-- -----------------------------------
DROP TABLE IF EXISTS `b_log_notification`;
CREATE TABLE `b_log_notification` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUDIT_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_URI` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CHECK_INTERVAL` int(11) DEFAULT NULL,
  `ALERT_COUNT` int(11) DEFAULT NULL,
  `DATE_CHECKED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_log_notification_action
-- -----------------------------------
DROP TABLE IF EXISTS `b_log_notification_action`;
CREATE TABLE `b_log_notification_action` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NOTIFICATION_ID` int(10) unsigned NOT NULL,
  `NOTIFICATION_TYPE` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `RECIPIENT` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDITIONAL_TEXT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_log_notification_action_notification_id` (`NOTIFICATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_main_mail_blacklist
-- -----------------------------------
DROP TABLE IF EXISTS `b_main_mail_blacklist`;
CREATE TABLE `b_main_mail_blacklist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `CATEGORY_ID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B_MAIN_MAIL_BLACKLIST_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_main_mail_sender
-- -----------------------------------
DROP TABLE IF EXISTS `b_main_mail_sender`;
CREATE TABLE `b_main_mail_sender` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `IS_CONFIRMED` tinyint(4) NOT NULL DEFAULT '0',
  `IS_PUBLIC` tinyint(4) NOT NULL DEFAULT '0',
  `OPTIONS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_B_MAIN_MAIL_SENDER_USER_ID` (`USER_ID`,`IS_CONFIRMED`,`IS_PUBLIC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_medialib_collection
-- -----------------------------------
DROP TABLE IF EXISTS `b_medialib_collection`;
CREATE TABLE `b_medialib_collection` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DATE_UPDATE` datetime NOT NULL,
  `OWNER_ID` int(11) DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEMS_COUNT` int(11) DEFAULT NULL,
  `ML_TYPE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_medialib_collection_item
-- -----------------------------------
DROP TABLE IF EXISTS `b_medialib_collection_item`;
CREATE TABLE `b_medialib_collection_item` (
  `COLLECTION_ID` int(11) NOT NULL,
  `ITEM_ID` int(11) NOT NULL,
  PRIMARY KEY (`ITEM_ID`,`COLLECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_medialib_item
-- -----------------------------------
DROP TABLE IF EXISTS `b_medialib_item`;
CREATE TABLE `b_medialib_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_TYPE` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `SOURCE_ID` int(11) NOT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_medialib_type
-- -----------------------------------
DROP TABLE IF EXISTS `b_medialib_type`;
CREATE TABLE `b_medialib_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_medialib_type` VALUES
(1, 'image_name', 'image', 'jpg,jpeg,gif,png', 'Y', 'image_desc'),
(2, 'video_name', 'video', 'flv,mp4,wmv', 'Y', 'video_desc'),
(3, 'sound_name', 'sound', 'mp3,wma,aac', 'Y', 'sound_desc');
-- -----------------------------------
-- Dumping table b_messageservice_message
-- -----------------------------------
DROP TABLE IF EXISTS `b_messageservice_message`;
CREATE TABLE `b_messageservice_message` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `SENDER_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `AUTHOR_ID` int(18) NOT NULL DEFAULT '0',
  `MESSAGE_FROM` varchar(260) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE_TO` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_HEADERS` longtext COLLATE utf8_unicode_ci,
  `MESSAGE_BODY` longtext COLLATE utf8_unicode_ci NOT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `EXEC_ERROR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STATUS_ID` int(18) NOT NULL DEFAULT '0',
  `EXTERNAL_ID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `B_MESSAGESERVICE_MESSAGE_1` (`DATE_EXEC`),
  KEY `B_MESSAGESERVICE_MESSAGE_2` (`SUCCESS_EXEC`),
  KEY `B_MESSAGESERVICE_MESSAGE_3` (`SENDER_ID`,`EXTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_messageservice_rest_app
-- -----------------------------------
DROP TABLE IF EXISTS `b_messageservice_rest_app`;
CREATE TABLE `b_messageservice_rest_app` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `APP_ID` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `HANDLER` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_ADD` datetime DEFAULT NULL,
  `AUTHOR_ID` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `B_MESSAGESERVICE_REST_APP_1` (`APP_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_messageservice_rest_app_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_messageservice_rest_app_lang`;
CREATE TABLE `b_messageservice_rest_app_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(18) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APP_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_module
-- -----------------------------------
DROP TABLE IF EXISTS `b_module`;
CREATE TABLE `b_module` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_ACTIVE` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_module` VALUES
('b24connector', NULL),
('bitrix.sitecorporate', NULL),
('bitrixcloud', NULL),
('clouds', NULL),
('fileman', NULL),
('highloadblock', NULL),
('iblock', NULL),
('landing', NULL),
('main', NULL),
('messageservice', NULL),
('perfmon', NULL),
('rest', NULL),
('search', NULL),
('seo', NULL),
('socialservices', NULL),
('translate', NULL),
('ui', NULL);
-- -----------------------------------
-- Dumping table b_module_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_module_group`;
CREATE TABLE `b_module_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `G_ACCESS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_GROUP_MODULE` (`MODULE_ID`,`GROUP_ID`,`SITE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_module_group` VALUES
(1, 'main', 5, 'Q', NULL),
(2, 'fileman', 5, 'F', NULL);
-- -----------------------------------
-- Dumping table b_module_to_module
-- -----------------------------------
DROP TABLE IF EXISTS `b_module_to_module`;
CREATE TABLE `b_module_to_module` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `FROM_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TO_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TO_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_CLASS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD_ARG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(18) DEFAULT NULL,
  `UNIQUE_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_module_to_module_unique_id` (`UNIQUE_ID`),
  KEY `ix_module_to_module` (`FROM_MODULE_ID`(20),`MESSAGE_ID`(20),`TO_MODULE_ID`(20),`TO_CLASS`(20),`TO_METHOD`(20))
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_module_to_module` VALUES
(1, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'main', '/modules/main/tools/prop_userid.php', 'CIBlockPropertyUserID', 'GetUserTypeDescription', '', 1, '2b30c309bf87645959b9bfbed51b49c6'),
(2, NULL, 100, 'main', 'OnUserDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnUserDelete', '', 1, 'f437e170e4daf957766b0b0579f08fb4'),
(3, NULL, 100, 'main', 'OnLanguageDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnLanguageDelete', '', 1, '9211999c5cfc3a4d374e4f957d5079f6'),
(4, NULL, 100, 'main', 'OnUserDelete', 'main', '', 'CUserOptions', 'OnUserDelete', '', 1, '9ef4e969f975b6425c7113444d210a90'),
(5, NULL, 100, 'main', 'OnChangeFile', 'main', '', 'CMain', 'OnChangeFileComponent', '', 1, '332179402f77c4d41c6c2e524acde4d0'),
(6, NULL, 100, 'main', 'OnUserTypeRightsCheck', 'main', '', 'CUser', 'UserTypeRightsCheck', '', 1, 'e1aae03ea8eb08e7bbb6d8d42cbc2ebe'),
(7, NULL, 100, 'main', 'OnUserLogin', 'main', '', 'UpdateTools', 'CheckUpdates', '', 1, 'a2986b9f6e9a99c0351c2ba858dafc85'),
(8, NULL, 100, 'main', 'OnModuleUpdate', 'main', '', 'UpdateTools', 'SetUpdateResult', '', 1, 'f9b70c6a75b6341063b23bde5d32e582'),
(9, NULL, 100, 'main', 'OnUpdateCheck', 'main', '', 'UpdateTools', 'SetUpdateError', '', 1, 'a0aecef95a192ec3dd134f71f0f4f175'),
(10, NULL, 100, 'main', 'OnPanelCreate', 'main', '', 'CUndo', 'CheckNotifyMessage', '', 1, '6476f96ffba6ab2b4a7dbe644f42edf6'),
(11, NULL, 100, 'main', 'OnAfterAddRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterAddRating', '', 1, '6122bee2ad083f8f72e35655cee48859'),
(12, NULL, 100, 'main', 'OnAfterUpdateRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterUpdateRating', '', 1, 'f8f806e33dc35737bdbe6b9bc42626a4'),
(13, NULL, 100, 'main', 'OnSetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnSetRatingConfigs', '', 1, '9244ca7fd6964757ca191c9407cb1218'),
(14, NULL, 100, 'main', 'OnGetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingConfigs', '', 1, 'd8ae8e1f8889b1fbb6af276fb14c8411'),
(15, NULL, 100, 'main', 'OnGetRatingsObjects', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingObject', '', 1, '129315715250c195ee115002b445a156'),
(16, NULL, 100, 'main', 'OnGetRatingContentOwner', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingContentOwner', '', 1, 'bf1f5deaa1532fe9a28acd6d19d23a80'),
(17, NULL, 100, 'main', 'OnAfterAddRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterAddRatingRule', '', 1, '298e763431f7f7d6c3af9798663f410d'),
(18, NULL, 100, 'main', 'OnAfterUpdateRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterUpdateRatingRule', '', 1, '4ecdc4a15e24c49f0fa8f44064bf1511'),
(19, NULL, 100, 'main', 'OnGetRatingRuleObjects', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleObjects', '', 1, '6ac10928b76183004ba0e88ace0a1b5b'),
(20, NULL, 100, 'main', 'OnGetRatingRuleConfigs', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleConfigs', '', 1, '06769c4f6bbba4fad79c1619a874ee97'),
(21, NULL, 100, 'main', 'OnAfterUserAdd', 'main', '', 'CRatings', 'OnAfterUserRegister', '', 1, 'ecb9ae0476db69da6c95b06bcb3aebbb'),
(22, NULL, 100, 'main', 'OnUserDelete', 'main', '', 'CRatings', 'OnUserDelete', '', 1, '9fe6984fd29b7ab9508ac02c23690094'),
(23, NULL, 100, 'main', 'OnAfterGroupAdd', 'main', '', 'CGroupAuthProvider', 'OnAfterGroupAdd', '', 1, '02f2fe70b9068a6b307192321fe74430'),
(24, NULL, 100, 'main', 'OnBeforeGroupUpdate', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupUpdate', '', 1, 'ef0f2e4d0ae7bbf59d0798e8078143f9'),
(25, NULL, 100, 'main', 'OnBeforeGroupDelete', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupDelete', '', 1, 'd3ec9527c0e77709402a05ae4249afca'),
(26, NULL, 100, 'main', 'OnAfterSetUserGroup', 'main', '', 'CGroupAuthProvider', 'OnAfterSetUserGroup', '', 1, '0de6c5b48e9382f6e857d79f76d95f25'),
(27, NULL, 100, 'main', 'OnUserLogin', 'main', '', 'CGroupAuthProvider', 'OnUserLogin', '', 1, '954e2c4ca8624f90f1aee6f40183d5fc'),
(28, NULL, 100, 'main', 'OnUserLogin', 'main', '', 'CUserAuthProvider', 'OnUserLogin', '', 1, 'ab2cca8754737b6c630dfaa7f4ca5d32'),
(29, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'main', '', 'CEventMain', 'GetAuditTypes', '', 1, 'ac0b8b7a5e703131a3bd41b4399bc032'),
(30, NULL, 100, 'main', 'OnEventLogGetAuditHandlers', 'main', '', 'CEventMain', 'MakeMainObject', '', 1, '1ddb38ccf35a8a9da5d3b2bc80591ad6'),
(31, NULL, 100, 'perfmon', 'OnGetTableSchema', 'main', '', 'CTableSchema', 'OnGetTableSchema', '', 1, 'c1f65f88d449e8b8a3b7af9d54ef3f50'),
(32, NULL, 100, 'sender', 'OnConnectorList', 'main', '', '\\Bitrix\\Main\\SenderEventHandler', 'onConnectorListUser', '', 1, '8af99568465a1ccdb6a84e868cf5aad8'),
(33, NULL, 110, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeString', 'GetUserTypeDescription', '', 1, '09f8200652932044934bd3c522e920c5'),
(34, NULL, 120, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeInteger', 'GetUserTypeDescription', '', 1, '71ef247b3eb3b07e4bd6940791b89497'),
(35, NULL, 130, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDouble', 'GetUserTypeDescription', '', 1, '4fe2008255fe567423cc0c2f080ca741'),
(36, NULL, 140, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDateTime', 'GetUserTypeDescription', '', 1, '686c0679e60bee52dbcc27f5502277b6'),
(37, NULL, 145, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDate', 'GetUserTypeDescription', '', 1, '7e19b5fc5fc48b1cd317a6ac44d84236'),
(38, NULL, 150, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeBoolean', 'GetUserTypeDescription', '', 1, '4d5e1dd2369089f2db9480549241205f'),
(39, NULL, 155, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeUrl', 'GetUserTypeDescription', '', 1, '79fcd650625b296abf13216cd5af2428'),
(40, NULL, 160, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeFile', 'GetUserTypeDescription', '', 1, '67b9a4fbc45240a7887b73e3a246eba0'),
(41, NULL, 170, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeEnum', 'GetUserTypeDescription', '', 1, 'fbebdb289fe38c1fbfeda4d3d8ee43ef'),
(42, NULL, 180, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockSection', 'GetUserTypeDescription', '', 1, '2065f8305645790970bac0b99f127f47'),
(43, NULL, 190, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockElement', 'GetUserTypeDescription', '', 1, '65bda5818e3545f1683a3ff5271cc891'),
(44, NULL, 200, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeStringFormatted', 'GetUserTypeDescription', '', 1, '47e3cf1c280e01dbaed43f9989a6747b'),
(45, NULL, 210, 'main', 'OnUserTypeBuildList', 'main', '', '\\Bitrix\\Main\\UrlPreview\\UrlPreviewUserType', 'getUserTypeDescription', '', 1, '719d15ee5f60f6348d2bd6a8911aeed1'),
(46, NULL, 100, 'main', 'OnBeforeEndBufferContent', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeEndBufferContent', '', 1, 'ff5eb984fe6ce3e8d769bf3ba646b902'),
(47, NULL, 100, 'main', 'OnBeforeRestartBuffer', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeRestartBuffer', '', 1, '0782f5a6df6dd52d834caea88c3ba3a7'),
(48, NULL, 100, 'main', 'OnFileDelete', 'main', '', '\\Bitrix\\Main\\UI\\Viewer\\FilePreviewTable', 'onFileDelete', '', 1, '54c80cd94412db221338aeb59902f059'),
(49, NULL, 100, 'socialnetwork', 'OnSocNetLogDelete', 'main', '', 'CUserCounter', 'OnSocNetLogDelete', '', 1, '33e603755a0bc07abd51a1f8ed52966e'),
(50, NULL, 100, 'socialnetwork', 'OnSocNetLogCommentDelete', 'main', '', 'CUserCounter', 'OnSocNetLogCommentDelete', '', 1, '51ee2214895be904a880046f43e84138'),
(51, NULL, 100, 'main', 'OnAdminInformerInsertItems', 'main', '', 'CMpNotifications', 'OnAdminInformerInsertItemsHandlerMP', '', 1, 'c89c0e94ac1110c334a24c70e1773daa'),
(52, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'main', '', '\\Bitrix\\Main\\Rest\\Handlers', 'onRestServiceBuildDescription', '', 1, 'c0b0c358a21b648d4f9c5d29d17a5ab2'),
(53, NULL, 100, 'sale', 'OnSaleBasketItemSaved', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogBasket', '', 2, 'fa4fc3924ff2585e92f8bdabaf287864'),
(54, NULL, 100, 'sale', 'OnSaleOrderSaved', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrder', '', 2, '6b358bb17b30da91b105fb1451ed9aaa'),
(55, NULL, 100, 'sale', 'OnSaleOrderPaid', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrderPayment', '', 2, '8f5ca6e1c5136cb4bbf30474f0ff4183'),
(56, NULL, 1000, 'sale', 'onBuildDiscountConditionInterfaceControls', 'main', '', '\\Bitrix\\Main\\Discount\\UserConditionControl', 'onBuildDiscountConditionInterfaceControls', '', 1, '9f0d91c081704e52b52f540b3acaf52e'),
(57, NULL, 100, 'main', 'OnBeforePhpMail', 'main', '', '\\Bitrix\\Main\\Mail\\Sender', 'applyCustomSmtp', '', 2, '10fbf5b8dec05a02d8d7010e594f16ec'),
(58, NULL, 100, 'main', 'OnBuildFilterFactoryMethods', 'main', '', '\\Bitrix\\Main\\Filter\\FactoryMain', 'onBuildFilterFactoryMethods', '', 2, '19f10c2686a955bd8b8116ea1f1ad829'),
(59, NULL, 100, 'main', 'OnBeforeUserTypeAdd', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'OnBeforeUserTypeAdd', '', 1, 'e204684efc0764af9431ca94b950619a'),
(60, NULL, 100, 'main', 'OnAfterUserTypeAdd', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onAfterUserTypeAdd', '', 1, '50932fb244caf7af686fac906caf3e73'),
(61, NULL, 100, 'main', 'OnBeforeUserTypeDelete', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'OnBeforeUserTypeDelete', '', 1, 'd22a86deba0ff4bd031d022e331033b4'),
(62, NULL, 100, 'main', 'onGetUserFieldValues', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onGetUserFieldValues', '', 2, '7f9a5e25d638a6bff29f0bf4666da1a9'),
(63, NULL, 100, 'main', 'onUpdateUserFieldValues', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onUpdateUserFieldValues', '', 2, 'd78761f994d74258421d271810f03ebf'),
(64, NULL, 100, 'main', 'onDeleteUserFieldValues', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onDeleteUserFieldValues', '', 2, '074b2e25238a00ffc809ad12b609db2c'),
(65, NULL, 100, 'main', 'OnAuthProvidersBuildList', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessAuthProvider', 'getProviders', '', 1, '3a2839dac113bf47bce01812903e768a'),
(66, NULL, 100, 'iblock', 'OnBeforeIBlockSectionUpdate', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessEventHandler', 'onBeforeIBlockSectionUpdate', '', 1, 'dde505dba68c59bd4661b7680c329485'),
(67, NULL, 100, 'iblock', 'OnBeforeIBlockSectionAdd', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessEventHandler', 'onBeforeIBlockSectionAdd', '', 1, 'd3a665b1890dabbba32ff01e3e46ec57'),
(68, NULL, 100, 'iblock', 'OnBeforeIBlockSectionDelete', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessEventHandler', 'onBeforeIBlockSectionDelete', '', 1, '157add4b02621a60fabf1369c3e7ea9b'),
(69, NULL, 100, 'main', 'OnBuildGlobalMenu', 'b24connector', '', '\\Bitrix\\B24Connector\\Helper', 'onBuildGlobalMenu', '', 1, '9c4452a442bacc2d4d70635962485be1'),
(70, NULL, 100, 'main', 'OnBeforeProlog', 'b24connector', '', '\\Bitrix\\B24Connector\\Helper', 'onBeforeProlog', '', 1, '641053ff6ee8ff57518d7c30724530e5'),
(71, NULL, 100, 'main', 'OnBeforeProlog', 'bitrix.sitecorporate', '', 'CSiteCorporate', 'ShowPanel', '', 1, 'bc7c322534797a9ed3493c40e1b8fdac'),
(72, NULL, 100, 'main', 'OnAdminInformerInsertItems', 'bitrixcloud', '', 'CBitrixCloudBackup', 'OnAdminInformerInsertItems', '', 1, '5499039afdd0fdb38d4b245c8b886dcb'),
(73, NULL, 100, 'mobileapp', 'OnBeforeAdminMobileMenuBuild', 'bitrixcloud', '', 'CBitrixCloudMobile', 'OnBeforeAdminMobileMenuBuild', '', 1, '5828a8cdb2cc45e2724ef1c76139df88'),
(74, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'clouds', '', 'CCloudStorage', 'GetAuditTypes', '', 1, 'da69722ba95497cf263381b46e24df40'),
(75, NULL, 90, 'main', 'OnBeforeProlog', 'clouds', '', 'CCloudStorage', 'OnBeforeProlog', '', 1, 'f8c39ff182ad873715f10a7091f928a4'),
(76, NULL, 100, 'main', 'OnAdminListDisplay', 'clouds', '', 'CCloudStorage', 'OnAdminListDisplay', '', 1, '8ddf4f578e7229a63cba4d2124c7643c'),
(77, NULL, 100, 'main', 'OnBuildGlobalMenu', 'clouds', '', 'CCloudStorage', 'OnBuildGlobalMenu', '', 1, 'd6d308843a6521ad50bfa230a2fcef8f'),
(78, NULL, 100, 'main', 'OnFileSave', 'clouds', '', 'CCloudStorage', 'OnFileSave', '', 1, '1e4f94a842d6166359ed1789a6f21245'),
(79, NULL, 100, 'main', 'OnAfterFileSave', 'clouds', '', 'CCloudStorage', 'OnAfterFileSave', '', 1, 'c36bae07a3080f9b5bc5d422ec96933f'),
(80, NULL, 100, 'main', 'OnGetFileSRC', 'clouds', '', 'CCloudStorage', 'OnGetFileSRC', '', 1, '7ec03b3b7ad3f2f54c1e438a1172e5a8'),
(81, NULL, 100, 'main', 'OnFileCopy', 'clouds', '', 'CCloudStorage', 'OnFileCopy', '', 1, '6880b56c76f7d3c5d09f887fca6341ca'),
(82, NULL, 100, 'main', 'OnPhysicalFileDelete', 'clouds', '', 'CCloudStorage', 'OnFileDelete', '', 1, '3151c487c747a57d7817f68e97fd1c94'),
(83, NULL, 100, 'main', 'OnMakeFileArray', 'clouds', '', 'CCloudStorage', 'OnMakeFileArray', '', 1, '713ea8a7a25764b1af60f7a1ec3032d5'),
(84, NULL, 100, 'main', 'OnBeforeResizeImage', 'clouds', '', 'CCloudStorage', 'OnBeforeResizeImage', '', 1, '705cd310c52f9c7e8e0c8a0578a22667'),
(85, NULL, 100, 'main', 'OnAfterResizeImage', 'clouds', '', 'CCloudStorage', 'OnAfterResizeImage', '', 1, 'a403ad2328227153475df0c478a465cc'),
(86, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_AmazonS3', 'GetObjectInstance', '', 1, 'a4eb7ed1f50b5931474c565f448a4069'),
(87, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_GoogleStorage', 'GetObjectInstance', '', 1, '1e559e2225608e8d40eeede5b7526f2a'),
(88, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_OpenStackStorage', 'GetObjectInstance', '', 1, '5ad09feff5dab28ab571ad034ccdf2ea'),
(89, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_RackSpaceCloudFiles', 'GetObjectInstance', '', 1, 'cc976773610cf809bb56871ac7dd9f01'),
(90, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_ClodoRU', 'GetObjectInstance', '', 1, 'faadad31436e94c420ed787e4424714b'),
(91, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_Selectel', 'GetObjectInstance', '', 1, '5e63a8eebed42bd099b4a9ef62e8d52b'),
(92, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_HotBox', 'GetObjectInstance', '', 1, '1913169adcd6d6f3b7fb5f3b70ba1fd8'),
(93, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_Yandex', 'GetObjectInstance', '', 1, '12bd1d4f0d145d5b1681955612fe61c8'),
(94, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_S3', 'GetObjectInstance', '', 1, '4af3f0ba1f50ed9be6efcdb55dfbee4e'),
(95, NULL, 100, 'perfmon', 'OnGetTableSchema', 'clouds', '', 'clouds', 'OnGetTableSchema', '', 1, 'd31a1f80f07441976eb1711db4902a71'),
(96, NULL, 100, 'main', 'OnGroupDelete', 'fileman', '', 'CFileman', 'OnGroupDelete', '', 1, 'd10f791d422ba0e7551ab267db50404c'),
(97, NULL, 100, 'main', 'OnPanelCreate', 'fileman', '', 'CFileman', 'OnPanelCreate', '', 1, 'b00a6174fb1763684c299ccf5e054c65'),
(98, NULL, 100, 'main', 'OnModuleUpdate', 'fileman', '', 'CFileman', 'OnModuleUpdate', '', 1, '58ae853e2b7c230b5cdb51129efd8a05'),
(99, NULL, 100, 'main', 'OnModuleInstalled', 'fileman', '', 'CFileman', 'ClearComponentsListCache', '', 1, '7bdbd354eab11f376fa257a998587277'),
(100, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapGoogle', 'GetUserTypeDescription', '', 1, 'd9d06fd05f80b33379359ebd8e36e655'),
(101, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapYandex', 'GetUserTypeDescription', '', 1, '20ca1d02998884b5abec68b32fdb561d'),
(102, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyVideo', 'GetUserTypeDescription', '', 1, '991c32062e05844708a5cf7aba37bf9a'),
(103, NULL, 100, 'main', 'OnUserTypeBuildList', 'fileman', '', 'CUserTypeVideo', 'GetUserTypeDescription', '', 1, '41bc5efb49ebf8d165acd4e4d556f60c'),
(104, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'fileman', '', 'CEventFileman', 'GetAuditTypes', '', 1, 'e0a610651ffec1fbddb2f261223fb2e9'),
(105, NULL, 100, 'main', 'OnEventLogGetAuditHandlers', 'fileman', '', 'CEventFileman', 'MakeFilemanObject', '', 1, 'fbfef1ef99530f6eae191da293f9566c'),
(106, NULL, 154, 'main', 'OnUserTypeBuildList', 'fileman', '', '\\Bitrix\\Fileman\\UserField\\Address', 'getUserTypeDescription', '', 1, 'f0583a376e38d3d2675513b1a367ed3c'),
(107, NULL, 100, 'main', 'OnBeforeUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeAdd', '', 1, 'f9dcff287cf7753e5c56974d37975507'),
(108, NULL, 100, 'main', 'OnAfterUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'onAfterUserTypeAdd', '', 1, 'd1fa2865e72eca144b964b6fb1eefc15'),
(109, NULL, 100, 'main', 'OnBeforeUserTypeDelete', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeDelete', '', 1, '1bf13707e1a45b8320c2ecd35534cbb4'),
(110, NULL, 100, 'main', 'OnUserTypeBuildList', 'highloadblock', '', 'CUserTypeHlblock', 'GetUserTypeDescription', '', 1, '2ac4a2154f4fd85d67b50f412ed5ed48'),
(111, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'highloadblock', '', 'CIBlockPropertyDirectory', 'GetUserTypeDescription', '', 1, 'a6f7df502db8a04590e43188d7cbfc99'),
(112, NULL, 100, 'main', 'OnGroupDelete', 'iblock', '', 'CIBlock', 'OnGroupDelete', '', 1, 'f2320df213f38adf32364d3169d5b197'),
(113, NULL, 100, 'main', 'OnBeforeLangDelete', 'iblock', '', 'CIBlock', 'OnBeforeLangDelete', '', 1, '46aef774958db327c1170a12d3a70ee5'),
(114, NULL, 100, 'main', 'OnLangDelete', 'iblock', '', 'CIBlock', 'OnLangDelete', '', 1, '861f6ee2ca56bf63c3af07db0553606b'),
(115, NULL, 100, 'main', 'OnUserTypeRightsCheck', 'iblock', '', 'CIBlockSection', 'UserTypeRightsCheck', '', 1, '2a6d446893d46f04f2c151f458d2908c'),
(116, NULL, 100, 'search', 'OnReindex', 'iblock', '', 'CIBlock', 'OnSearchReindex', '', 1, 'c6c8111f129e0eb19e558106e354e6f6'),
(117, NULL, 100, 'search', 'OnSearchGetURL', 'iblock', '', 'CIBlock', 'OnSearchGetURL', '', 1, '0ae9fc756bfb1273309240cd8f535672'),
(118, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'iblock', '', 'CIBlock', 'GetAuditTypes', '', 1, '182d19c163e3a5a965bca170c3fb0e83'),
(119, NULL, 100, 'main', 'OnEventLogGetAuditHandlers', 'iblock', '', 'CEventIBlock', 'MakeIBlockObject', '', 1, 'f7a182e8d9b204970d111e4703b9f523'),
(120, NULL, 200, 'main', 'OnGetRatingContentOwner', 'iblock', '', 'CRatingsComponentsIBlock', 'OnGetRatingContentOwner', '', 1, '6da245944e376d586a3fa2aaee02c70b'),
(121, NULL, 100, 'main', 'OnTaskOperationsChanged', 'iblock', '', 'CIBlockRightsStorage', 'OnTaskOperationsChanged', '', 1, '01b3f9984fa07b1dfb4bc35d107d5672'),
(122, NULL, 100, 'main', 'OnGroupDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnGroupDelete', '', 1, '2dbbccdee3f2e7bd86446bec02be1d54'),
(123, NULL, 100, 'main', 'OnUserDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnUserDelete', '', 1, '78f090ee29030c54788098b0782d28f9'),
(124, NULL, 100, 'perfmon', 'OnGetTableSchema', 'iblock', '', 'iblock', 'OnGetTableSchema', '', 1, '4b71a345c136beed338aa7137943d80b'),
(125, NULL, 100, 'sender', 'OnConnectorList', 'iblock', '', '\\Bitrix\\Iblock\\SenderEventHandler', 'onConnectorListIblock', '', 1, '3de75587a47352dd3cb6d10866f69385'),
(126, NULL, 10, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyDate', 'GetUserTypeDescription', '', 1, 'fa608e2c397b6793c54ad296619a22e2'),
(127, NULL, 20, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyDateTime', 'GetUserTypeDescription', '', 1, '78554c9e3c38ac383d51f0ee4d013120'),
(128, NULL, 30, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyXmlID', 'GetUserTypeDescription', '', 1, '952fe5f2ea67493fb9f9b924ce1b992b'),
(129, NULL, 40, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyFileMan', 'GetUserTypeDescription', '', 1, 'fd688441d5e8203751fb47374931e011'),
(130, NULL, 50, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyHTML', 'GetUserTypeDescription', '', 1, '27645f81ce5d6d9f19a47cc171860beb'),
(131, NULL, 60, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyElementList', 'GetUserTypeDescription', '', 1, 'c53e9314ae43c30267b32310a02d7df4'),
(132, NULL, 70, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySequence', 'GetUserTypeDescription', '', 1, '3ff9528d1264fc77697248957aafdab5'),
(133, NULL, 80, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyElementAutoComplete', 'GetUserTypeDescription', '', 1, '0d233a1e7a0d6a52a52e13df88291024'),
(134, NULL, 90, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySKU', 'GetUserTypeDescription', '', 1, '8678bc826ced4f66640fba3775b18516'),
(135, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySectionAutoComplete', 'GetUserTypeDescription', '', 1, '26ff6f651cb94a1fe4ce9827566f0730'),
(136, NULL, 100, 'main', 'onVirtualClassBuildList', 'iblock', '', 'Bitrix\\Iblock\\IblockTable', 'compileAllEntities', '', 2, '8a4e85071d25e6ba7f9ed315874c411b'),
(137, NULL, 100, 'bitrix24', 'onDomainChange', 'landing', '', '\\Bitrix\\Landing\\Update\\Block\\NodeAttributes', 'updateFormDomain', '', 2, 'a5f1ac2c31163115813298acc7bbffcf'),
(138, NULL, 100, 'intranet', 'onBuildBindingMenu', 'landing', '', '\\Bitrix\\Landing\\Connector\\Intranet', 'onBuildBindingMenu', '', 2, 'd5464da9aea2308d3d5f13c2387c4c40'),
(139, NULL, 100, 'landing', 'onBuildSourceList', 'landing', '', '\\Bitrix\\Landing\\Connector\\Landing', 'onSourceBuildHandler', '', 2, 'fc391addc82a816df68510b0ae3363a5'),
(140, NULL, 100, 'main', 'onBeforeSiteDelete', 'landing', '', '\\Bitrix\\Landing\\Site', 'onBeforeMainSiteDelete', '', 2, '5faa9b5de931dbb101e2e0aef6fc594b'),
(141, NULL, 100, 'main', 'onSiteDelete', 'landing', '', '\\Bitrix\\Landing\\Site', 'onMainSiteDelete', '', 2, 'af029bceca7ea9cc809515e95bd3a710'),
(142, NULL, 100, 'main', 'onUserConsentProviderList', 'landing', '', '\\Bitrix\\Landing\\Site\\Cookies', 'onUserConsentProviderList', '', 2, 'f59a96e272348f934d62ba5d3ee79f21'),
(143, NULL, 100, 'mobile', 'onMobileMenuStructureBuilt', 'landing', '', '\\Bitrix\\Landing\\Connector\\Mobile', 'onMobileMenuStructureBuilt', '', 2, '01fd8a44b83b5f7fcd2f36a626657ad0'),
(144, NULL, 100, 'rest', 'onRestServiceBuildDescription', 'landing', '', '\\Bitrix\\Landing\\Publicaction', 'restBase', '', 2, '9af99ddecf2dd8c3c5b14721f23e8fef'),
(145, NULL, 100, 'rest', 'onBeforeApplicationUninstall', 'landing', '', '\\Bitrix\\Landing\\Publicaction', 'beforeRestApplicationDelete', '', 2, 'ef1f080a088ad54298a4ba9bf2896313'),
(146, NULL, 100, 'rest', 'onRestAppDelete', 'landing', '', '\\Bitrix\\Landing\\Publicaction', 'restApplicationDelete', '', 2, '031cfc016e3be91368376a391c351dea'),
(147, NULL, 100, 'rest', 'onRestApplicationConfigurationGetManifest', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'getManifestList', '', 2, 'b88124aac7c2c8ddecf2ce127a9c6ef8'),
(148, NULL, 100, 'rest', 'onRestApplicationConfigurationExport', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'onEventExportController', '', 2, '917b00a9f82e6b8f7899a6e8c3b22236'),
(149, NULL, 100, 'rest', 'onRestApplicationConfigurationGetManifestSetting', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'onInitManifest', '', 2, '99fa9aa37a23a371cca0153c840c7802'),
(150, NULL, 100, 'rest', 'onRestApplicationConfigurationEntity', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'getEntityList', '', 2, '820df699b9abf22ce0356fc9957be794'),
(151, NULL, 100, 'rest', 'onRestApplicationConfigurationImport', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'onEventImportController', '', 2, 'e65daaed01b2c52e6098ee47ddb7f07a'),
(152, NULL, 100, 'rest', 'onRestApplicationConfigurationFinish', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'onFinish', '', 2, '45343e5617dca2ad06a5d13050232caf'),
(153, NULL, 100, 'socialnetwork', 'onFillSocNetFeaturesList', 'landing', '', '\\Bitrix\\Landing\\Connector\\SocialNetwork', 'onFillSocNetFeaturesList', '', 2, '9825d91c89b53b69655aa98ea4f3a6cf'),
(154, NULL, 100, 'socialnetwork', 'onFillSocNetMenu', 'landing', '', '\\Bitrix\\Landing\\Connector\\SocialNetwork', 'onFillSocNetMenu', '', 2, '14ecfb8fb4fc20f22ddb5ac64783461d'),
(155, NULL, 100, 'socialnetwork', 'onSocNetGroupDelete', 'landing', '', '\\Bitrix\\Landing\\Connector\\SocialNetwork', 'onSocNetGroupDelete', '', 2, '78202f1461a8822a105a19f45502c327'),
(156, NULL, 100, 'socialservices', '\\Bitrix\\Socialservices\\ApTable::OnAfterAdd', 'landing', '', '\\Bitrix\\Landing\\Update\\Block\\NodeAttributes', 'updateFormDomainByConnector', '', 2, '0152997776462d358b5364b794cd205e'),
(157, NULL, 100, 'main', 'OnAfterEpilog', 'messageservice', '', '\\Bitrix\\MessageService\\Queue', 'run', '', 1, '6bcb21b0ccc5ac89d9531ddf8b94683c'),
(158, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'messageservice', '', '\\Bitrix\\MessageService\\RestService', 'onRestServiceBuildDescription', '', 1, '7524628243223e572590eea87cc03f73'),
(159, NULL, 100, 'rest', 'OnRestAppDelete', 'messageservice', '', '\\Bitrix\\MessageService\\RestService', 'onRestAppDelete', '', 1, '5febc41cd526ecba95dbb4843dd9c134'),
(160, NULL, 100, 'rest', 'OnRestAppUpdate', 'messageservice', '', '\\Bitrix\\MessageService\\RestService', 'onRestAppUpdate', '', 1, '7e77b4d550c200a4ec06872af7857ee6'),
(161, NULL, 100, 'perfmon', 'OnGetTableSchema', 'perfmon', '', 'perfmon', 'OnGetTableSchema', '', 1, '3a4da255b44f05899b64e66a40c12662'),
(162, NULL, 49, 'main', 'OnBeforeProlog', 'rest', '', 'CRestEventHandlers', 'OnBeforeProlog', '', 2, '395c9c42c3cc9392de1e5887617afe6d'),
(163, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', 'CBitrixRestEntity', 'OnRestServiceBuildDescription', '', 2, 'f63068b1eb62c36219518206e1e2827c'),
(164, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\User', 'onRestServiceBuildDescription', '', 2, 'c9a03e9019564649e55f5409b661e050'),
(165, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\Placement', 'onRestServiceBuildDescription', '', 2, '9751a266c2b6f6be5c34b1541bf7c194'),
(166, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\Event', 'onRestServiceBuildDescription', '', 2, '842ad63f19aff6d810059c7e56739aae'),
(167, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\UserFieldType', 'onRestServiceBuildDescription', '', 2, '4caf68a5256aabe4abef37f24562e59b'),
(168, NULL, 100, 'rest', 'onFindMethodDescription', 'rest', '', '\\Bitrix\\Rest\\Engine\\RestManager', 'onFindMethodDescription', '', 2, '4d0614f880674af333326dd5ba9b2828'),
(169, NULL, 100, 'main', 'OnApplicationsBuildList', 'main', 'modules/rest/lib/apauth/application.php', '\\Bitrix\\Rest\\APAuth\\Application', 'onApplicationsBuildList', '', 2, '9c39129872987f8dcc8baacc0c446ed7'),
(170, NULL, 100, 'im', 'OnAfterConfirmNotify', 'rest', '', '\\Bitrix\\Rest\\NotifyIm', 'receive', '', 2, '2ac9c19fe69d4e106deaa6f4a7a4371b'),
(171, NULL, 100, 'rest', '\\Bitrix\\Rest\\APAuth\\Password::OnDelete', 'rest', '', '\\Bitrix\\Rest\\APAuth\\PermissionTable', 'onPasswordDelete', '', 2, 'f04447ca635f045ec1a64e593964fc90'),
(172, NULL, 100, 'perfmon', 'OnGetTableSchema', 'rest', '', 'rest', 'OnGetTableSchema', '', 2, '47a76003c8f9f2d8c820f446e084ff39'),
(173, NULL, 100, 'rest', 'OnRestApplicationConfigurationImport', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'onEventImportController', '', 2, '3fc1dd7e523b33f9d76c19e54d45c2fb'),
(174, NULL, 100, 'rest', 'OnRestApplicationConfigurationExport', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'onEventExportController', '', 2, 'b90a349060c693506b740c4d36f75f5f'),
(175, NULL, 100, 'rest', 'OnRestApplicationConfigurationClear', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'onEventClearController', '', 2, '75dccda637a740c033b2d014a84a8009'),
(176, NULL, 100, 'rest', 'OnRestApplicationConfigurationEntity', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'getEntityList', '', 2, '8d83d219eaf2f415d55fb67e221b7c3d'),
(177, NULL, 100, 'rest', 'OnRestApplicationConfigurationGetManifest', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'getManifestList', '', 2, '6ba35b1f4b01d1e358e1b3a79ac437d6'),
(178, NULL, 100, 'rest', 'onRestCheckAuth', 'rest', '', '\\Bitrix\\Rest\\OAuth\\Auth', 'onRestCheckAuth', '', 2, '70e923729089b8cba69bb3b4311da11e'),
(179, NULL, 100, 'rest', 'onRestCheckAuth', 'rest', '', '\\Bitrix\\Rest\\APAuth\\Auth', 'onRestCheckAuth', '', 2, '3550e6c95772564101770e0c9cb54470'),
(180, NULL, 100, 'rest', 'onRestCheckAuth', 'rest', '', '\\Bitrix\\Rest\\SessionAuth\\Auth', 'onRestCheckAuth', '', 2, '8e33ae5a47b59d21df7d26f916d19e38'),
(181, NULL, 100, 'main', 'OnChangePermissions', 'search', '', 'CSearch', 'OnChangeFilePermissions', '', 1, '1c37aedc2ec89f94624291d097fe7adf'),
(182, NULL, 100, 'main', 'OnChangeFile', 'search', '', 'CSearch', 'OnChangeFile', '', 1, 'd51170fc3433fde7eab8edc1c2b933a0'),
(183, NULL, 100, 'main', 'OnGroupDelete', 'search', '', 'CSearch', 'OnGroupDelete', '', 1, '05382d7448b1ba259b89bf9e87e4eb44'),
(184, NULL, 100, 'main', 'OnLangDelete', 'search', '', 'CSearch', 'OnLangDelete', '', 1, '15ebda82514af5a966b3466cd26992a4'),
(185, NULL, 100, 'main', 'OnAfterUserUpdate', 'search', '', 'CSearchUser', 'OnAfterUserUpdate', '', 1, '9e0cea5039973193afc706ec8978d674'),
(186, NULL, 100, 'main', 'OnUserDelete', 'search', '', 'CSearchUser', 'DeleteByUserID', '', 1, '524a910f381ba144bf50caa152222ed6'),
(187, NULL, 100, 'cluster', 'OnGetTableList', 'search', '', 'search', 'OnGetTableList', '', 1, 'a40ffd36df151e2c0294b5639e81d665'),
(188, NULL, 100, 'perfmon', 'OnGetTableSchema', 'search', '', 'search', 'OnGetTableSchema', '', 1, '9c8df2577e0cb80c68afa2030e193efb'),
(189, NULL, 90, 'main', 'OnEpilog', 'search', '', 'CSearchStatistic', 'OnEpilog', '', 1, '6b3591ad78ac2a3ce6ad411f0aff47fe'),
(190, NULL, 100, 'main', 'OnPanelCreate', 'seo', '', 'CSeoEventHandlers', 'SeoOnPanelCreate', '', 2, '79688b0b4a106b805d09e63ffe88f580'),
(191, NULL, 100, 'fileman', 'OnIncludeHTMLEditorScript', 'seo', '', 'CSeoEventHandlers', 'OnIncludeHTMLEditorScript', '', 2, '7995eac5813e40f6b3e82b146631397e'),
(192, NULL, 100, 'fileman', 'OnBeforeHTMLEditorScriptRuns', 'seo', '', 'CSeoEventHandlers', 'OnBeforeHTMLEditorScriptRuns', '', 2, '313b34609f1fa34d34cde1c2103c09ff'),
(193, NULL, 100, 'iblock', 'OnAfterIBlockSectionAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'addSection', '', 2, 'c61de21b0b0873525fa5c39427324664'),
(194, NULL, 100, 'iblock', 'OnAfterIBlockElementAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'addElement', '', 2, '1b167ab85d6d744bba456e559546f13e'),
(195, NULL, 100, 'iblock', 'OnBeforeIBlockSectionDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeDeleteSection', '', 2, '148ce014df9dd9f99f17ebfc5d766e8a'),
(196, NULL, 100, 'iblock', 'OnBeforeIBlockElementDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeDeleteElement', '', 2, '4b1e9896d9f0aa37a7039a321f25f9a5'),
(197, NULL, 100, 'iblock', 'OnAfterIBlockSectionDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'deleteSection', '', 2, 'b699c1c0d6665f9cffe7ff76ab108a24'),
(198, NULL, 100, 'iblock', 'OnAfterIBlockElementDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'deleteElement', '', 2, 'ff3a36654015c53890f4cf2204b030c4'),
(199, NULL, 100, 'iblock', 'OnBeforeIBlockSectionUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeUpdateSection', '', 2, 'aa5f8c360ed88eb5e2884c57b6f1f2f3'),
(200, NULL, 100, 'iblock', 'OnBeforeIBlockElementUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeUpdateElement', '', 2, 'a1022e0619263c0e91139fb3f9837085'),
(201, NULL, 100, 'iblock', 'OnAfterIBlockSectionUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'updateSection', '', 2, '27930cffcd40b84666d0a22e1a953c41'),
(202, NULL, 100, 'iblock', 'OnAfterIBlockElementUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'updateElement', '', 2, 'f0151e07363564774d45acba4100aebe'),
(203, NULL, 100, 'forum', 'onAfterTopicAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'addTopic', '', 2, 'd4d54756116942c9ee0bda9b31e9d0e7'),
(204, NULL, 100, 'forum', 'onAfterTopicUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'updateTopic', '', 2, '3e0a8569016a4c941f3eb4aa9fca6e8b'),
(205, NULL, 100, 'forum', 'onAfterTopicDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'deleteTopic', '', 2, '7f4379c818231561b41589d3de41e36b'),
(206, NULL, 100, 'main', 'OnAdminIBlockElementEdit', 'seo', '', '\\Bitrix\\Seo\\AdvTabEngine', 'eventHandler', '', 2, 'c894d167ef03c35375b8eb8f2551a798'),
(207, NULL, 100, 'main', 'OnBeforeProlog', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'checkSession', '', 2, '5fdf8dd9fd70719e442efcb589175bf0'),
(208, NULL, 100, 'sale', 'OnOrderSave', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onOrderSave', '', 2, '07d4ab0b1aa0aa130a0cbc06403f6eae'),
(209, NULL, 100, 'sale', 'OnBasketOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onBasketOrder', '', 2, 'cf6298b090e92e955b32c358c1d14b25'),
(210, NULL, 100, 'sale', 'onSalePayOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSalePayOrder', '', 2, '745afed820778e33d5cd3e91cbd622f1'),
(211, NULL, 100, 'sale', 'onSaleDeductOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleDeductOrder', '', 2, '12861bd5c6c27ffa2abe5cac90ea58d8'),
(212, NULL, 100, 'sale', 'onSaleDeliveryOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleDeliveryOrder', '', 2, 'ead8fb64fece572d1fabd3d6fd27af27'),
(213, NULL, 100, 'sale', 'onSaleStatusOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleStatusOrder', '', 2, 'b7b9ac4bbf458d433e1cf3835ff4cb6c'),
(214, NULL, 100, 'conversion', 'OnSetDayContextAttributes', 'seo', '', '\\Bitrix\\Seo\\ConversionHandler', 'onSetDayContextAttributes', '', 2, 'c19eb7659342fabc34b953f69e8b9eee'),
(215, NULL, 100, 'conversion', 'OnGetAttributeTypes', 'seo', '', '\\Bitrix\\Seo\\ConversionHandler', 'onGetAttributeTypes', '', 2, '379294eefad289e474bf0c5ce2a281d8'),
(216, NULL, 100, 'catalog', 'OnProductUpdate', 'seo', '', '\\Bitrix\\Seo\\Adv\\Auto', 'checkQuantity', '', 2, '0f4deda4d57adb4389d85a19e5bbcf2b'),
(217, NULL, 100, 'catalog', 'OnProductSetAvailableUpdate', 'seo', '', '\\Bitrix\\Seo\\Adv\\Auto', 'checkQuantity', '', 2, '3d040ae51f0f6a4b2a08be0e6e1494d4'),
(218, NULL, 100, 'bitrix24', 'onDomainChange', 'seo', '', '\\Bitrix\\Seo\\Service', 'changeRegisteredDomain', '', 2, 'fcb2dadb8b7ff1863c0ad86320e9e521'),
(219, NULL, 100, 'main', 'OnUserDelete', 'socialservices', '', 'CSocServAuthDB', 'OnUserDelete', '', 1, '1f5b8fc024dfdf83952d6c723466cdf5'),
(220, NULL, 100, 'timeman', 'OnAfterTMReportDailyAdd', 'socialservices', '', 'CSocServAuthDB', 'OnAfterTMReportDailyAdd', '', 1, 'a16159f6a90f1b67cb9ec15b0c1bab3a'),
(221, NULL, 100, 'timeman', 'OnAfterTMDayStart', 'socialservices', '', 'CSocServAuthDB', 'OnAfterTMDayStart', '', 1, '9567feb38890d6581a3204dc5e65e8b6'),
(222, NULL, 100, 'timeman', 'OnTimeManShow', 'socialservices', '', 'CSocServEventHandlers', 'OnTimeManShow', '', 1, 'b728f3cea11d374f7638c29f84e8e15e'),
(223, NULL, 100, 'main', 'OnFindExternalUser', 'socialservices', '', 'CSocServAuthDB', 'OnFindExternalUser', '', 1, '1ab251d15efc87c5b5cfe6396f5dec1b'),
(224, NULL, 100, 'perfmon', 'OnGetTableSchema', 'socialservices', '', 'socialservices', 'OnGetTableSchema', '', 1, '56107bf1a0dcee0db660c0ec27c31c6c'),
(225, NULL, 100, 'socialservices', 'OnFindSocialservicesUser', 'socialservices', '', 'CSocServAuthManager', 'checkOldUser', '', 1, 'c3d7460e4ef694f5bc53b6a6ad902407'),
(226, NULL, 100, 'socialservices', 'OnFindSocialservicesUser', 'socialservices', '', 'CSocServAuthManager', 'checkAbandonedUser', '', 1, '331f99f0b265544c33777c299eab16f6'),
(227, NULL, 100, 'main', 'OnPanelCreate', 'translate', '', '\\Bitrix\\Translate\\Ui\\Panel', 'onPanelCreate', '', 1, '88ecb95eac2e28b80f234bfc8c1cd597'),
(228, NULL, 100, 'perfmon', 'OnGetTableSchema', 'translate', '', 'translate', 'onGetTableSchema', '', 1, '00347f45b2f48480b1a521c32036beb5'),
(231, NULL, 100, 'main', 'OnBeforeProlog', 'main', '/modules/main/install/wizard_sol/panel_button.php', 'CWizardSolPanel', 'ShowPanel', '', 1, 'bbd7b8c1e518a0b3eae815eb91a95c11');
-- -----------------------------------
-- Dumping table b_numerator
-- -----------------------------------
DROP TABLE IF EXISTS `b_numerator`;
CREATE TABLE `b_numerator` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `CREATED_AT` datetime DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `UPDATED_BY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_numerator_sequence
-- -----------------------------------
DROP TABLE IF EXISTS `b_numerator_sequence`;
CREATE TABLE `b_numerator_sequence` (
  `NUMERATOR_ID` int(11) NOT NULL DEFAULT '0',
  `KEY` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `TEXT_KEY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NEXT_NUMBER` int(11) DEFAULT NULL,
  `LAST_INVOCATION_TIME` int(11) DEFAULT NULL,
  PRIMARY KEY (`NUMERATOR_ID`,`KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_operation
-- -----------------------------------
DROP TABLE IF EXISTS `b_operation`;
CREATE TABLE `b_operation` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_operation` VALUES
(1, 'edit_php', 'main', NULL, 'module'),
(2, 'view_own_profile', 'main', NULL, 'module'),
(3, 'edit_own_profile', 'main', NULL, 'module'),
(4, 'view_all_users', 'main', NULL, 'module'),
(5, 'view_groups', 'main', NULL, 'module'),
(6, 'view_tasks', 'main', NULL, 'module'),
(7, 'view_other_settings', 'main', NULL, 'module'),
(8, 'view_subordinate_users', 'main', NULL, 'module'),
(9, 'edit_subordinate_users', 'main', NULL, 'module'),
(10, 'edit_all_users', 'main', NULL, 'module'),
(11, 'edit_groups', 'main', NULL, 'module'),
(12, 'edit_tasks', 'main', NULL, 'module'),
(13, 'edit_other_settings', 'main', NULL, 'module'),
(14, 'cache_control', 'main', NULL, 'module'),
(15, 'lpa_template_edit', 'main', NULL, 'module'),
(16, 'view_event_log', 'main', NULL, 'module'),
(17, 'edit_ratings', 'main', NULL, 'module'),
(18, 'manage_short_uri', 'main', NULL, 'module'),
(19, 'fm_view_permission', 'main', NULL, 'file'),
(20, 'fm_view_file', 'main', NULL, 'file'),
(21, 'fm_view_listing', 'main', NULL, 'file'),
(22, 'fm_edit_existent_folder', 'main', NULL, 'file'),
(23, 'fm_create_new_file', 'main', NULL, 'file'),
(24, 'fm_edit_existent_file', 'main', NULL, 'file'),
(25, 'fm_create_new_folder', 'main', NULL, 'file'),
(26, 'fm_delete_file', 'main', NULL, 'file'),
(27, 'fm_delete_folder', 'main', NULL, 'file'),
(28, 'fm_edit_in_workflow', 'main', NULL, 'file'),
(29, 'fm_rename_file', 'main', NULL, 'file'),
(30, 'fm_rename_folder', 'main', NULL, 'file'),
(31, 'fm_upload_file', 'main', NULL, 'file'),
(32, 'fm_add_to_menu', 'main', NULL, 'file'),
(33, 'fm_download_file', 'main', NULL, 'file'),
(34, 'fm_lpa', 'main', NULL, 'file'),
(35, 'fm_edit_permission', 'main', NULL, 'file'),
(36, 'bitrixcloud_monitoring', 'bitrixcloud', NULL, 'module'),
(37, 'bitrixcloud_backup', 'bitrixcloud', NULL, 'module'),
(38, 'bitrixcloud_cdn', 'bitrixcloud', NULL, 'module'),
(39, 'clouds_browse', 'clouds', NULL, 'module'),
(40, 'clouds_upload', 'clouds', NULL, 'module'),
(41, 'clouds_config', 'clouds', NULL, 'module'),
(42, 'fileman_view_all_settings', 'fileman', '', 'module'),
(43, 'fileman_edit_menu_types', 'fileman', '', 'module'),
(44, 'fileman_add_element_to_menu', 'fileman', '', 'module'),
(45, 'fileman_edit_menu_elements', 'fileman', '', 'module'),
(46, 'fileman_edit_existent_files', 'fileman', '', 'module'),
(47, 'fileman_edit_existent_folders', 'fileman', '', 'module'),
(48, 'fileman_admin_files', 'fileman', '', 'module'),
(49, 'fileman_admin_folders', 'fileman', '', 'module'),
(50, 'fileman_view_permissions', 'fileman', '', 'module'),
(51, 'fileman_edit_all_settings', 'fileman', '', 'module'),
(52, 'fileman_upload_files', 'fileman', '', 'module'),
(53, 'fileman_view_file_structure', 'fileman', '', 'module'),
(54, 'fileman_install_control', 'fileman', '', 'module'),
(55, 'medialib_view_collection', 'fileman', '', 'medialib'),
(56, 'medialib_new_collection', 'fileman', '', 'medialib'),
(57, 'medialib_edit_collection', 'fileman', '', 'medialib'),
(58, 'medialib_del_collection', 'fileman', '', 'medialib'),
(59, 'medialib_access', 'fileman', '', 'medialib'),
(60, 'medialib_new_item', 'fileman', '', 'medialib'),
(61, 'medialib_edit_item', 'fileman', '', 'medialib'),
(62, 'medialib_del_item', 'fileman', '', 'medialib'),
(63, 'sticker_view', 'fileman', '', 'stickers'),
(64, 'sticker_edit', 'fileman', '', 'stickers'),
(65, 'sticker_new', 'fileman', '', 'stickers'),
(66, 'sticker_del', 'fileman', '', 'stickers'),
(67, 'hl_element_read', 'highloadblock', NULL, 'module'),
(68, 'hl_element_write', 'highloadblock', NULL, 'module'),
(69, 'hl_element_delete', 'highloadblock', NULL, 'module'),
(70, 'section_read', 'iblock', NULL, 'iblock'),
(71, 'element_read', 'iblock', NULL, 'iblock'),
(72, 'section_element_bind', 'iblock', NULL, 'iblock'),
(73, 'iblock_admin_display', 'iblock', NULL, 'iblock'),
(74, 'element_edit', 'iblock', NULL, 'iblock'),
(75, 'element_edit_price', 'iblock', NULL, 'iblock'),
(76, 'element_delete', 'iblock', NULL, 'iblock'),
(77, 'element_bizproc_start', 'iblock', NULL, 'iblock'),
(78, 'section_edit', 'iblock', NULL, 'iblock'),
(79, 'section_delete', 'iblock', NULL, 'iblock'),
(80, 'section_section_bind', 'iblock', NULL, 'iblock'),
(81, 'element_edit_any_wf_status', 'iblock', NULL, 'iblock'),
(82, 'iblock_edit', 'iblock', NULL, 'iblock'),
(83, 'iblock_delete', 'iblock', NULL, 'iblock'),
(84, 'iblock_rights_edit', 'iblock', NULL, 'iblock'),
(85, 'iblock_export', 'iblock', NULL, 'iblock'),
(86, 'section_rights_edit', 'iblock', NULL, 'iblock'),
(87, 'element_rights_edit', 'iblock', NULL, 'iblock'),
(88, 'landing_read', 'landing', NULL, 'module'),
(89, 'landing_edit', 'landing', NULL, 'module'),
(90, 'landing_sett', 'landing', NULL, 'module'),
(91, 'landing_public', 'landing', NULL, 'module'),
(92, 'landing_delete', 'landing', NULL, 'module'),
(93, 'seo_settings', 'seo', '', 'module'),
(94, 'seo_tools', 'seo', '', 'module');
-- -----------------------------------
-- Dumping table b_option
-- -----------------------------------
DROP TABLE IF EXISTS `b_option`;
CREATE TABLE `b_option` (
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MODULE_ID`,`NAME`),
  KEY `ix_option_name` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_option` VALUES
('fileman', 'different_set', 'Y', NULL, NULL),
('fileman', 'stickers_use_hotkeys', 'N', NULL, NULL),
('fileman', 'use_editor_3', 'Y', NULL, NULL),
('iblock', 'use_htmledit', 'Y', NULL, NULL),
('landing', 'pub_path_s1', '/lp/', NULL, NULL),
('main', '~crypto_b_socialservices_user', 'a:2:{s:7:\"OATOKEN\";b:1;s:13:\"REFRESH_TOKEN\";b:1;}', NULL, NULL),
('main', '~crypto_b_user_auth_code', 'a:1:{s:10:\"OTP_SECRET\";b:1;}', NULL, NULL),
('main', '~crypto_b_user_phone_auth', 'a:1:{s:10:\"OTP_SECRET\";b:1;}', NULL, NULL),
('main', '~new_license11_sign', 'Y', NULL, NULL),
('main', 'admin_lid', 'ru', NULL, NULL),
('main', 'admin_passwordh', 'FVoQemYUBgUtCUVcBhcBCgsTAQ==', NULL, NULL),
('main', 'control_file_duplicates', 'Y', NULL, NULL),
('main', 'distributive6', 'Y', NULL, NULL),
('main', 'dump_archive_size_limit', '2146435072', NULL, NULL),
('main', 'dump_base', '1', NULL, NULL),
('main', 'dump_base_skip_log', '1', NULL, NULL),
('main', 'dump_base_skip_search', '1', NULL, NULL),
('main', 'dump_base_skip_stat', '1', NULL, NULL),
('main', 'dump_bucket_id', '0', NULL, NULL),
('main', 'dump_do_clouds', '0', NULL, NULL),
('main', 'dump_encrypt', '0', NULL, NULL),
('main', 'dump_file_kernel', '0', NULL, NULL),
('main', 'dump_file_public', '0', NULL, NULL),
('main', 'dump_integrity_check', '1', NULL, NULL),
('main', 'dump_max_exec_time', '20', NULL, NULL),
('main', 'dump_max_exec_time_sleep', '3', NULL, NULL),
('main', 'dump_max_file_size', '0', NULL, NULL),
('main', 'dump_site_id', 'a:0:{}', NULL, NULL),
('main', 'dump_use_compression', '1', NULL, NULL),
('main', 'email_from', 'admin@admin.ru', NULL, NULL),
('main', 'GROUP_DEFAULT_TASK', '1', NULL, NULL),
('main', 'last_files_count', '48171', NULL, NULL),
('main', 'last_mp_modules_result', 'a:4:{s:10:\"check_date\";i:1611822475;s:13:\"update_module\";a:0:{}s:10:\"end_update\";a:0:{}s:10:\"new_module\";a:0:{}}', NULL, NULL),
('main', 'optimize_css_files', 'Y', NULL, NULL),
('main', 'optimize_js_files', 'Y', NULL, NULL),
('main', 'PARAM_MAX_SITES', '2', NULL, NULL),
('main', 'PARAM_MAX_USERS', '0', NULL, NULL),
('main', 'rating_assign_authority_group', '4', NULL, NULL),
('main', 'rating_assign_authority_group_add', '2', NULL, NULL),
('main', 'rating_assign_authority_group_delete', '2', NULL, NULL),
('main', 'rating_assign_rating_group', '3', NULL, NULL),
('main', 'rating_assign_rating_group_add', '1', NULL, NULL),
('main', 'rating_assign_rating_group_delete', '1', NULL, NULL),
('main', 'rating_assign_type', 'auto', NULL, NULL),
('main', 'rating_authority_rating', '2', NULL, NULL),
('main', 'rating_authority_weight_formula', 'Y', NULL, NULL),
('main', 'rating_community_authority', '30', NULL, NULL),
('main', 'rating_community_last_visit', '90', NULL, NULL),
('main', 'rating_community_size', '1', NULL, NULL),
('main', 'rating_count_vote', '10', NULL, NULL),
('main', 'rating_normalization', '10', NULL, NULL),
('main', 'rating_normalization_type', 'auto', NULL, NULL),
('main', 'rating_self_vote', 'Y', NULL, NULL),
('main', 'rating_start_authority', '3', NULL, NULL),
('main', 'rating_text_like_d', 'Это нравится', NULL, NULL),
('main', 'rating_text_like_n', 'Не нравится', NULL, NULL),
('main', 'rating_text_like_y', 'Нравится', NULL, NULL),
('main', 'rating_vote_show', 'Y', NULL, NULL),
('main', 'rating_vote_template', 'like', NULL, NULL),
('main', 'rating_vote_type', 'like', NULL, NULL),
('main', 'rating_vote_weight', '10', NULL, NULL),
('main', 'secure_logout', 'Y', NULL, NULL),
('main', 'server_uniq_id', '6d7273d8f3b57aeaa8ceef38cfd6cdf4', NULL, NULL),
('main', 'signer_default_key', '97c5693f011454c0e390c25f9425074c4f9cbba5a47935bc8c04da50fe1505e582aa679f67bc778a057edb1be775152c006ad5845a08d97de5bd6b5652224c5a', NULL, NULL),
('main', 'skip_mask', '0', NULL, NULL),
('main', 'update_site', 'www.bitrixsoft.com', NULL, NULL),
('main', 'update_site_ns', 'Y', NULL, NULL),
('main', 'vendor', '1c_bitrix', NULL, NULL),
('main', 'wizard_firstcorp_furniture_s1', 'Y', NULL, NULL),
('messageservice', 'clean_up_period', '14', NULL, NULL),
('rest', 'entity_iblock_type', 'rest_entity', NULL, NULL),
('rest', 'server_path', '/rest', NULL, NULL),
('search', 'dbnode_id', 'N', NULL, NULL),
('search', 'dbnode_status', 'ok', NULL, NULL),
('search', 'suggest_save_days', '250', NULL, NULL),
('search', 'use_social_rating', 'Y', NULL, NULL),
('search', 'use_tf_cache', 'Y', NULL, NULL),
('search', 'use_word_distance', 'Y', NULL, NULL),
('search', 'version', 'v2.0', NULL, NULL),
('socialnetwork', 'allow_tooltip', 'N', NULL, NULL),
('socialservices', 'allow_encrypted_tokens', '1', NULL, NULL),
('socialservices', 'auth_services', 'a:12:{s:9:\"VKontakte\";s:1:\"N\";s:8:\"MyMailRu\";s:1:\"N\";s:7:\"Twitter\";s:1:\"N\";s:8:\"Facebook\";s:1:\"N\";s:11:\"Livejournal\";s:1:\"Y\";s:12:\"YandexOpenID\";s:1:\"Y\";s:7:\"Rambler\";s:1:\"Y\";s:12:\"MailRuOpenID\";s:1:\"Y\";s:12:\"Liveinternet\";s:1:\"Y\";s:7:\"Blogger\";s:1:\"Y\";s:6:\"OpenID\";s:1:\"Y\";s:6:\"LiveID\";s:1:\"N\";}', NULL, NULL),
('socialservices', 'bitrix24net_domain', 'http://exam.loc', NULL, NULL),
('socialservices', 'bitrix24net_id', 'ext.6010bf6c1135a5.33721185', NULL, NULL),
('socialservices', 'bitrix24net_secret', 'QSHhldJTZ3LorkSLKhrkYKvNP1z0YJx0DJFemoSYJXHLmB3lc6', NULL, NULL);
-- -----------------------------------
-- Dumping table b_option_site
-- -----------------------------------
DROP TABLE IF EXISTS `b_option_site`;
CREATE TABLE `b_option_site` (
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`MODULE_ID`,`NAME`,`SITE_ID`),
  KEY `ix_option_site_module_site` (`MODULE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_option_site` VALUES
('fileman', 'menutypes', 's1', 'a:3:{s:4:\\\"left\\\";s:19:\\\"Левое меню\\\";s:3:\\\"top\\\";s:23:\\\"Верхнее меню\\\";s:6:\\\"bottom\\\";s:21:\\\"Нижнее меню\\\";}'),
('fileman', 'propstypes', 's1', 'a:4:{s:11:\"description\";s:33:\"Описание страницы\";s:8:\"keywords\";s:27:\"Ключевые слова\";s:5:\"title\";s:44:\"Заголовок окна браузера\";s:14:\"keywords_inner\";s:35:\"Продвигаемые слова\";}'),
('main', 'wizard_furniture_theme_id', 's1', 'blue'),
('main', 'wizard_site_logo', 's1', '0'),
('main', 'wizard_solution', 's1', 'corp_furniture'),
('main', 'wizard_template_id', 's1', 'furniture');
-- -----------------------------------
-- Dumping table b_perf_cache
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_cache`;
CREATE TABLE `b_perf_cache` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_SIZE` float DEFAULT NULL,
  `OP_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8_unicode_ci,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  `BASE_DIR` text COLLATE utf8_unicode_ci,
  `INIT_DIR` text COLLATE utf8_unicode_ci,
  `FILE_NAME` text COLLATE utf8_unicode_ci,
  `FILE_PATH` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_CACHE_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_CACHE_1` (`COMPONENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_perf_cluster
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_cluster`;
CREATE TABLE `b_perf_cluster` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `THREADS` int(11) DEFAULT NULL,
  `HITS` int(11) DEFAULT NULL,
  `ERRORS` int(11) DEFAULT NULL,
  `PAGES_PER_SECOND` float DEFAULT NULL,
  `PAGE_EXEC_TIME` float DEFAULT NULL,
  `PAGE_RESP_TIME` float DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_perf_component
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_component`;
CREATE TABLE `b_perf_component` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `COMPONENT_TIME` float DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_COMPONENT_0` (`HIT_ID`,`NN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_perf_error
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_error`;
CREATE TABLE `b_perf_error` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `ERRNO` int(18) DEFAULT NULL,
  `ERRSTR` text COLLATE utf8_unicode_ci,
  `ERRFILE` text COLLATE utf8_unicode_ci,
  `ERRLINE` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_ERROR_0` (`HIT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_perf_history
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_history`;
CREATE TABLE `b_perf_history` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `TOTAL_MARK` float DEFAULT NULL,
  `ACCELERATOR_ENABLED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_perf_hit
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_hit`;
CREATE TABLE `b_perf_hit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_HIT` datetime DEFAULT NULL,
  `IS_ADMIN` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_METHOD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_PORT` int(11) DEFAULT NULL,
  `SCRIPT_NAME` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `INCLUDED_FILES` int(11) DEFAULT NULL,
  `MEMORY_PEAK_USAGE` int(11) DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENTS` int(11) DEFAULT NULL,
  `COMPONENTS_TIME` float DEFAULT NULL,
  `SQL_LOG` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_TIME` float DEFAULT NULL,
  `PROLOG_TIME` float DEFAULT NULL,
  `PROLOG_BEFORE_TIME` float DEFAULT NULL,
  `AGENTS_TIME` float DEFAULT NULL,
  `PROLOG_AFTER_TIME` float DEFAULT NULL,
  `WORK_AREA_TIME` float DEFAULT NULL,
  `EPILOG_TIME` float DEFAULT NULL,
  `EPILOG_BEFORE_TIME` float DEFAULT NULL,
  `EVENTS_TIME` float DEFAULT NULL,
  `EPILOG_AFTER_TIME` float DEFAULT NULL,
  `MENU_RECALC` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_HIT_0` (`DATE_HIT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_perf_index_ban
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_index_ban`;
CREATE TABLE `b_perf_index_ban` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BAN_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_perf_index_complete
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_index_complete`;
CREATE TABLE `b_perf_index_complete` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BANNED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_index_complete_0` (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_perf_index_suggest
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_index_suggest`;
CREATE TABLE `b_perf_index_suggest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SQL_MD5` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_COUNT` int(11) DEFAULT NULL,
  `SQL_TIME` float DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_ALIAS` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_TEXT` text COLLATE utf8_unicode_ci,
  `SQL_EXPLAIN` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_index_suggest_0` (`SQL_MD5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_perf_index_suggest_sql
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_index_suggest_sql`;
CREATE TABLE `b_perf_index_suggest_sql` (
  `SUGGEST_ID` int(11) NOT NULL DEFAULT '0',
  `SQL_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SUGGEST_ID`,`SQL_ID`),
  KEY `ix_b_perf_index_suggest_sql_0` (`SQL_ID`,`SUGGEST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_perf_sql
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_sql`;
CREATE TABLE `b_perf_sql` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `QUERY_TIME` float DEFAULT NULL,
  `NODE_ID` int(18) DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8_unicode_ci,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  `SQL_TEXT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_SQL_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_SQL_1` (`COMPONENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_perf_sql_backtrace
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_sql_backtrace`;
CREATE TABLE `b_perf_sql_backtrace` (
  `SQL_ID` int(18) NOT NULL DEFAULT '0',
  `NN` int(18) NOT NULL DEFAULT '0',
  `FILE_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINE_NO` int(18) DEFAULT NULL,
  `CLASS_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FUNCTION_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SQL_ID`,`NN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_perf_tab_column_stat
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_tab_column_stat`;
CREATE TABLE `b_perf_tab_column_stat` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  `COLUMN_ROWS` float DEFAULT NULL,
  `VALUE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_tab_column_stat` (`TABLE_NAME`,`COLUMN_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_perf_tab_stat
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_tab_stat`;
CREATE TABLE `b_perf_tab_stat` (
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TABLE_SIZE` float DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  PRIMARY KEY (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_perf_test
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_test`;
CREATE TABLE `b_perf_test` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `REFERENCE_ID` int(18) DEFAULT NULL,
  `NAME` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_TEST_0` (`REFERENCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rating
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating`;
CREATE TABLE `b_rating` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CALCULATION_METHOD` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SUM',
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `POSITION` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `AUTHORITY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `CALCULATED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONFIGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_rating` VALUES
(1, 'N', 'Рейтинг', 'USER', 'SUM', '2021-01-27 06:14:24', NULL, NULL, 'Y', 'N', 'N', 'a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:16:\"TODAY_TOPIC_COEF\";s:3:\"0.4\";s:15:\"WEEK_TOPIC_COEF\";s:3:\"0.2\";s:16:\"MONTH_TOPIC_COEF\";s:3:\"0.1\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.2\";s:14:\"WEEK_POST_COEF\";s:3:\"0.1\";s:15:\"MONTH_POST_COEF\";s:4:\"0.05\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}'),
(2, 'N', 'Авторитет', 'USER', 'SUM', '2021-01-27 06:14:24', NULL, NULL, 'Y', 'Y', 'N', 'a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:1:\"0\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:16:\"TODAY_TOPIC_COEF\";s:2:\"20\";s:15:\"WEEK_TOPIC_COEF\";s:2:\"10\";s:16:\"MONTH_TOPIC_COEF\";s:1:\"5\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}');
-- -----------------------------------
-- Dumping table b_rating_component
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_component`;
CREATE TABLE `b_rating_component` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CALC_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXCEPTION_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `NEXT_CALCULATION` datetime DEFAULT NULL,
  `REFRESH_INTERVAL` int(11) NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_ID_1` (`RATING_ID`,`ACTIVE`,`NEXT_CALCULATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rating_component_results
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_component_results`;
CREATE TABLE `b_rating_component_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  KEY `IX_COMPLEX_NAME` (`COMPLEX_NAME`),
  KEY `IX_RATING_ID_2` (`RATING_ID`,`COMPLEX_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rating_prepare
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_prepare`;
CREATE TABLE `b_rating_prepare` (
  `ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rating_results
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_results`;
CREATE TABLE `b_rating_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  `PREVIOUS_VALUE` decimal(18,4) DEFAULT NULL,
  `CURRENT_POSITION` int(11) DEFAULT '0',
  `PREVIOUS_POSITION` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_3` (`RATING_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`),
  KEY `IX_RATING_4` (`RATING_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rating_rule
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_rule`;
CREATE TABLE `b_rating_rule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NAME` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_MODULE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONDITION_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_CONFIG` text COLLATE utf8_unicode_ci,
  `ACTION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `ACTION_CONFIG` text COLLATE utf8_unicode_ci,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DEACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_APPLIED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_rating_rule` VALUES
(1, 'N', 'Добавление в группу пользователей, имеющих право голосовать за рейтинг', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:1;}}', 'ADD_TO_GROUP', 'a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"3\";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2021-01-27 06:14:24', '2021-01-27 06:14:24', NULL),
(2, 'N', 'Удаление из группы пользователей, не имеющих права голосовать за рейтинг', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:1;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"3\";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2021-01-27 06:14:24', '2021-01-27 06:14:24', NULL),
(3, 'N', 'Добавление в группу пользователей, имеющих право голосовать за авторитет', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:2;}}', 'ADD_TO_GROUP', 'a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"4\";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2021-01-27 06:14:24', '2021-01-27 06:14:24', NULL),
(4, 'N', 'Удаление из группы пользователей, не имеющих права голосовать за авторитет', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:2;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"4\";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2021-01-27 06:14:24', '2021-01-27 06:14:24', NULL),
(5, 'Y', 'Автоматическое голосование за авторитет пользователя', 'USER', 'VOTE', NULL, 'CRatingRulesMain', 'voteCheck', 'a:1:{s:4:\"VOTE\";a:6:{s:10:\"VOTE_LIMIT\";i:90;s:11:\"VOTE_RESULT\";i:10;s:16:\"VOTE_FORUM_TOPIC\";d:0.5;s:15:\"VOTE_FORUM_POST\";d:0.1;s:14:\"VOTE_BLOG_POST\";d:0.5;s:17:\"VOTE_BLOG_COMMENT\";d:0.1;}}', 'empty', 'a:0:{}', 'N', 'empty', 'empty', 'N', 'empty ', 'empty', '2021-01-27 06:14:24', '2021-01-27 06:14:24', NULL);
-- -----------------------------------
-- Dumping table b_rating_rule_vetting
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_rule_vetting`;
CREATE TABLE `b_rating_rule_vetting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RULE_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `RULE_ID` (`RULE_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rating_user
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_user`;
CREATE TABLE `b_rating_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `BONUS` decimal(18,4) DEFAULT '0.0000',
  `VOTE_WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `VOTE_COUNT` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`RATING_ID`,`ENTITY_ID`),
  KEY `IX_B_RAT_USER_2` (`ENTITY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_rating_user` VALUES
(1, 2, 1, 3.0000, 30.0000, 13);
-- -----------------------------------
-- Dumping table b_rating_vote
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_vote`;
CREATE TABLE `b_rating_vote` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `VALUE` decimal(18,4) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `USER_IP` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `REACTION` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RAT_VOTE_ID` (`RATING_VOTING_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_3` (`OWNER_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_4` (`USER_ID`),
  KEY `IX_RAT_VOTE_ID_5` (`CREATED`,`VALUE`),
  KEY `IX_RAT_VOTE_ID_6` (`ACTIVE`),
  KEY `IX_RAT_VOTE_ID_7` (`RATING_VOTING_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_8` (`ENTITY_TYPE_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_9` (`CREATED`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rating_vote_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_vote_group`;
CREATE TABLE `b_rating_vote_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GROUP_ID` int(11) NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`GROUP_ID`,`TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_rating_vote_group` VALUES
(1, 1, 'R'),
(2, 3, 'R'),
(3, 1, 'R'),
(4, 3, 'R'),
(5, 1, 'A'),
(6, 4, 'A');
-- -----------------------------------
-- Dumping table b_rating_voting
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_voting`;
CREATE TABLE `b_rating_voting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`ACTIVE`),
  KEY `IX_ENTITY_TYPE_ID_4` (`TOTAL_VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rating_voting_prepare
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_voting_prepare`;
CREATE TABLE `b_rating_voting_prepare` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_VOTING_ID` (`RATING_VOTING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rating_voting_reaction
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_voting_reaction`;
CREATE TABLE `b_rating_voting_reaction` (
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `REACTION` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TOTAL_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ENTITY_TYPE_ID`,`ENTITY_ID`,`REACTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rating_weight
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_weight`;
CREATE TABLE `b_rating_weight` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_FROM` decimal(18,4) NOT NULL,
  `RATING_TO` decimal(18,4) NOT NULL,
  `WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `COUNT` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_rating_weight` VALUES
(1, -1000000.0000, 1000000.0000, 1.0000, 10);
-- -----------------------------------
-- Dumping table b_rest_ap
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_ap`;
CREATE TABLE `b_rest_ap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_rest_ap` (`USER_ID`,`PASSWORD`,`ACTIVE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_ap_permission
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_ap_permission`;
CREATE TABLE `b_rest_ap_permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PASSWORD_ID` int(11) NOT NULL,
  `PERM` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_ap_perm1` (`PASSWORD_ID`,`PERM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_app
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_app`;
CREATE TABLE `b_rest_app` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CLIENT_ID` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `INSTALLED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `URL` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `URL_DEMO` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_INSTALL` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` varchar(4) COLLATE utf8_unicode_ci DEFAULT '1',
  `SCOPE` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'F',
  `DATE_FINISH` date DEFAULT NULL,
  `IS_TRIALED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `SHARED_KEY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT_SECRET` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APP_NAME` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCESS` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '',
  `APPLICATION_TOKEN` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `MOBILE` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `USER_INSTALL` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_app1` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_app_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_app_lang`;
CREATE TABLE `b_rest_app_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MENU_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_app_lang1` (`APP_ID`,`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_app_log
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_app_log`;
CREATE TABLE `b_rest_app_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `APP_ID` int(11) NOT NULL,
  `ACTION_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `USER_ADMIN` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_b_rest_app_log1` (`APP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_event
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_event`;
CREATE TABLE `b_rest_event` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(11) DEFAULT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_HANDLER` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) DEFAULT '0',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `APPLICATION_TOKEN` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `CONNECTOR_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `INTEGRATION_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_event_app_event` (`APP_ID`,`EVENT_NAME`(50),`EVENT_HANDLER`(180),`USER_ID`,`CONNECTOR_ID`(70)),
  KEY `ix_b_rest_event_event_name` (`EVENT_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_event_offline
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_event_offline`;
CREATE TABLE `b_rest_event_offline` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `MESSAGE_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_DATA` text COLLATE utf8_unicode_ci,
  `EVENT_ADDITIONAL` text COLLATE utf8_unicode_ci,
  `PROCESS_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `CONNECTOR_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ERROR` int(3) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_event_offline1` (`MESSAGE_ID`(50),`APP_ID`,`CONNECTOR_ID`(100),`PROCESS_ID`(50)),
  KEY `ix_b_rest_event_offline2` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_integration
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_integration`;
CREATE TABLE `b_rest_integration` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `ELEMENT_CODE` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD_ID` int(11) DEFAULT NULL,
  `APP_ID` int(11) DEFAULT NULL,
  `SCOPE` text COLLATE utf8_unicode_ci,
  `QUERY` text COLLATE utf8_unicode_ci,
  `OUTGOING_EVENTS` text COLLATE utf8_unicode_ci,
  `OUTGOING_NEEDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OUTGOING_HANDLER_URL` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WIDGET_NEEDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WIDGET_HANDLER_URL` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WIDGET_LIST` text COLLATE utf8_unicode_ci,
  `APPLICATION_TOKEN` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APPLICATION_NEEDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APPLICATION_ONLY_API` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BOT_ID` int(11) DEFAULT NULL,
  `BOT_HANDLER_URL` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_log
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_log`;
CREATE TABLE `b_rest_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CLIENT_ID` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASSWORD_ID` int(11) DEFAULT NULL,
  `SCOPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_METHOD` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_URI` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_AUTH` text COLLATE utf8_unicode_ci,
  `REQUEST_DATA` text COLLATE utf8_unicode_ci,
  `RESPONSE_STATUS` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESPONSE_DATA` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_owner_entity
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_owner_entity`;
CREATE TABLE `b_rest_owner_entity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OWNER_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER` int(11) NOT NULL,
  `ENTITY_TYPE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_b_rest_owner_entity` (`ENTITY_TYPE`,`ENTITY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_placement
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_placement`;
CREATE TABLE `b_rest_placement` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(11) DEFAULT NULL,
  `PLACEMENT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PLACEMENT_HANDLER` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `GROUP_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `ADDITIONAL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_placement1` (`APP_ID`,`PLACEMENT`(100),`PLACEMENT_HANDLER`(200)),
  KEY `ix_b_rest_placement3` (`PLACEMENT`(100),`ADDITIONAL`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_stat
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_stat`;
CREATE TABLE `b_rest_stat` (
  `STAT_DATE` date NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `METHOD_ID` int(11) NOT NULL,
  `HOUR_0` int(11) NOT NULL DEFAULT '0',
  `HOUR_1` int(11) NOT NULL DEFAULT '0',
  `HOUR_2` int(11) NOT NULL DEFAULT '0',
  `HOUR_3` int(11) NOT NULL DEFAULT '0',
  `HOUR_4` int(11) NOT NULL DEFAULT '0',
  `HOUR_5` int(11) NOT NULL DEFAULT '0',
  `HOUR_6` int(11) NOT NULL DEFAULT '0',
  `HOUR_7` int(11) NOT NULL DEFAULT '0',
  `HOUR_8` int(11) NOT NULL DEFAULT '0',
  `HOUR_9` int(11) NOT NULL DEFAULT '0',
  `HOUR_10` int(11) NOT NULL DEFAULT '0',
  `HOUR_11` int(11) NOT NULL DEFAULT '0',
  `HOUR_12` int(11) NOT NULL DEFAULT '0',
  `HOUR_13` int(11) NOT NULL DEFAULT '0',
  `HOUR_14` int(11) NOT NULL DEFAULT '0',
  `HOUR_15` int(11) NOT NULL DEFAULT '0',
  `HOUR_16` int(11) NOT NULL DEFAULT '0',
  `HOUR_17` int(11) NOT NULL DEFAULT '0',
  `HOUR_18` int(11) NOT NULL DEFAULT '0',
  `HOUR_19` int(11) NOT NULL DEFAULT '0',
  `HOUR_20` int(11) NOT NULL DEFAULT '0',
  `HOUR_21` int(11) NOT NULL DEFAULT '0',
  `HOUR_22` int(11) NOT NULL DEFAULT '0',
  `HOUR_23` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`APP_ID`,`STAT_DATE`,`METHOD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_stat_app
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_stat_app`;
CREATE TABLE `b_rest_stat_app` (
  `APP_ID` int(11) NOT NULL,
  `APP_CODE` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`APP_ID`),
  KEY `ix_b_rest_stat_app_code` (`APP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_stat_method
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_stat_method`;
CREATE TABLE `b_rest_stat_method` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `METHOD_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT 'M',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_stat_method` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_usage_entity
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_usage_entity`;
CREATE TABLE `b_rest_usage_entity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ENTITY_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUB_ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUB_ENTITY_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_b_rest_usage_entity` (`ENTITY_TYPE`,`ENTITY_ID`,`SUB_ENTITY_TYPE`,`SUB_ENTITY_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_usage_stat
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_usage_stat`;
CREATE TABLE `b_rest_usage_stat` (
  `STAT_DATE` date NOT NULL,
  `ENTITY_ID` int(11) NOT NULL DEFAULT '0',
  `IS_SENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `HOUR_0` int(11) NOT NULL DEFAULT '0',
  `HOUR_1` int(11) NOT NULL DEFAULT '0',
  `HOUR_2` int(11) NOT NULL DEFAULT '0',
  `HOUR_3` int(11) NOT NULL DEFAULT '0',
  `HOUR_4` int(11) NOT NULL DEFAULT '0',
  `HOUR_5` int(11) NOT NULL DEFAULT '0',
  `HOUR_6` int(11) NOT NULL DEFAULT '0',
  `HOUR_7` int(11) NOT NULL DEFAULT '0',
  `HOUR_8` int(11) NOT NULL DEFAULT '0',
  `HOUR_9` int(11) NOT NULL DEFAULT '0',
  `HOUR_10` int(11) NOT NULL DEFAULT '0',
  `HOUR_11` int(11) NOT NULL DEFAULT '0',
  `HOUR_12` int(11) NOT NULL DEFAULT '0',
  `HOUR_13` int(11) NOT NULL DEFAULT '0',
  `HOUR_14` int(11) NOT NULL DEFAULT '0',
  `HOUR_15` int(11) NOT NULL DEFAULT '0',
  `HOUR_16` int(11) NOT NULL DEFAULT '0',
  `HOUR_17` int(11) NOT NULL DEFAULT '0',
  `HOUR_18` int(11) NOT NULL DEFAULT '0',
  `HOUR_19` int(11) NOT NULL DEFAULT '0',
  `HOUR_20` int(11) NOT NULL DEFAULT '0',
  `HOUR_21` int(11) NOT NULL DEFAULT '0',
  `HOUR_22` int(11) NOT NULL DEFAULT '0',
  `HOUR_23` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`STAT_DATE`,`ENTITY_ID`),
  KEY `ix_b_rest_usage` (`ENTITY_ID`,`STAT_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Creating empty table b_search_content
-- -----------------------------------
CREATE TABLE IF NOT EXISTS `b_search_content` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CHANGE` datetime NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CUSTOM_RANK` int(11) NOT NULL DEFAULT '0',
  `USER_ID` int(11) DEFAULT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENTITY_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  `TITLE` text COLLATE utf8_unicode_ci,
  `BODY` longtext COLLATE utf8_unicode_ci,
  `TAGS` text COLLATE utf8_unicode_ci,
  `PARAM1` text COLLATE utf8_unicode_ci,
  `PARAM2` text COLLATE utf8_unicode_ci,
  `UPD` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_FROM` datetime DEFAULT NULL,
  `DATE_TO` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_CONTENT` (`MODULE_ID`,`ITEM_ID`),
  KEY `IX_B_SEARCH_CONTENT_1` (`MODULE_ID`,`PARAM1`(50),`PARAM2`(50)),
  KEY `IX_B_SEARCH_CONTENT_2` (`ENTITY_ID`(50),`ENTITY_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Creating empty table b_search_content_freq
-- -----------------------------------
CREATE TABLE IF NOT EXISTS `b_search_content_freq` (
  `STEM` int(11) NOT NULL DEFAULT '0',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FREQ` float DEFAULT NULL,
  `TF` float DEFAULT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_FREQ` (`STEM`,`LANGUAGE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Creating empty table b_search_content_param
-- -----------------------------------
CREATE TABLE IF NOT EXISTS `b_search_content_param` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `PARAM_NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `PARAM_VALUE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  KEY `IX_B_SEARCH_CONTENT_PARAM` (`SEARCH_CONTENT_ID`,`PARAM_NAME`),
  KEY `IX_B_SEARCH_CONTENT_PARAM_1` (`PARAM_NAME`,`PARAM_VALUE`(50),`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Creating empty table b_search_content_right
-- -----------------------------------
CREATE TABLE IF NOT EXISTS `b_search_content_right` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_RIGHT` (`SEARCH_CONTENT_ID`,`GROUP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Creating empty table b_search_content_site
-- -----------------------------------
CREATE TABLE IF NOT EXISTS `b_search_content_site` (
  `SEARCH_CONTENT_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Creating empty table b_search_content_stem
-- -----------------------------------
CREATE TABLE IF NOT EXISTS `b_search_content_stem` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `STEM` int(11) NOT NULL,
  `TF` float NOT NULL,
  `PS` float NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_STEM` (`STEM`,`LANGUAGE_ID`,`TF`,`PS`,`SEARCH_CONTENT_ID`),
  KEY `IND_B_SEARCH_CONTENT_STEM` (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

-- -----------------------------------
-- Creating empty table b_search_content_text
-- -----------------------------------
CREATE TABLE IF NOT EXISTS `b_search_content_text` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SEARCH_CONTENT_MD5` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `SEARCHABLE_CONTENT` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Creating empty table b_search_content_title
-- -----------------------------------
CREATE TABLE IF NOT EXISTS `b_search_content_title` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `POS` int(11) NOT NULL,
  `WORD` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_TITLE` (`SITE_ID`,`WORD`,`SEARCH_CONTENT_ID`,`POS`),
  KEY `IND_B_SEARCH_CONTENT_TITLE` (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

-- -----------------------------------
-- Dumping table b_search_custom_rank
-- -----------------------------------
DROP TABLE IF EXISTS `b_search_custom_rank`;
CREATE TABLE `b_search_custom_rank` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RANK` int(11) NOT NULL DEFAULT '0',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `PARAM1` text COLLATE utf8_unicode_ci,
  `PARAM2` text COLLATE utf8_unicode_ci,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_CUSTOM_RANK` (`SITE_ID`,`MODULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_search_phrase
-- -----------------------------------
DROP TABLE IF EXISTS `b_search_phrase`;
CREATE TABLE `b_search_phrase` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  `PAGES` int(11) NOT NULL,
  `SESSION_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO` text COLLATE utf8_unicode_ci,
  `URL_TO_404` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_SESS_ID` int(18) DEFAULT NULL,
  `EVENT1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_PH` (`SESSION_ID`,`PHRASE`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_TG` (`SESSION_ID`,`TAGS`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_TIME` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Creating empty table b_search_stem
-- -----------------------------------
CREATE TABLE IF NOT EXISTS `b_search_stem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STEM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_STEM` (`STEM`)
) ENGINE=InnoDB AUTO_INCREMENT=1269 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Creating empty table b_search_suggest
-- -----------------------------------
CREATE TABLE IF NOT EXISTS `b_search_suggest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_MD5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `RATE` float NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_SUGGEST` (`FILTER_MD5`,`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_PHRASE` (`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_TIME` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Creating empty table b_search_tags
-- -----------------------------------
CREATE TABLE IF NOT EXISTS `b_search_tags` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`,`NAME`),
  KEY `IX_B_SEARCH_TAGS_0` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

-- -----------------------------------
-- Creating empty table b_search_user_right
-- -----------------------------------
CREATE TABLE IF NOT EXISTS `b_search_user_right` (
  `USER_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_USER_RIGHT` (`USER_ID`,`GROUP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_seo_adv_autolog
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_adv_autolog`;
CREATE TABLE `b_seo_adv_autolog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `CAMPAIGN_XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `BANNER_XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CAUSE_CODE` int(11) DEFAULT '0',
  `SUCCESS` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_adv_autolog1` (`ENGINE_ID`),
  KEY `ix_b_seo_adv_autolog2` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_seo_adv_banner
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_adv_banner`;
CREATE TABLE `b_seo_adv_banner` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` mediumtext COLLATE utf8_unicode_ci,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) DEFAULT NULL,
  `AUTO_QUANTITY_OFF` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `AUTO_QUANTITY_ON` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_banner` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_banner1` (`CAMPAIGN_ID`),
  KEY `ix_b_seo_adv_banner2` (`AUTO_QUANTITY_OFF`,`AUTO_QUANTITY_ON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_seo_adv_campaign
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_adv_campaign`;
CREATE TABLE `b_seo_adv_campaign` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `SETTINGS` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_campaign` (`ENGINE_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_seo_adv_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_adv_group`;
CREATE TABLE `b_seo_adv_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `CAMPAIGN_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_group` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_group1` (`CAMPAIGN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_seo_adv_link
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_adv_link`;
CREATE TABLE `b_seo_adv_link` (
  `LINK_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `LINK_ID` int(18) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  PRIMARY KEY (`LINK_TYPE`,`LINK_ID`,`BANNER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_seo_adv_log
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_adv_log`;
CREATE TABLE `b_seo_adv_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `REQUEST_URI` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `REQUEST_DATA` text COLLATE utf8_unicode_ci,
  `RESPONSE_TIME` float NOT NULL,
  `RESPONSE_STATUS` int(5) DEFAULT NULL,
  `RESPONSE_DATA` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_adv_log1` (`ENGINE_ID`),
  KEY `ix_b_seo_adv_log2` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_seo_adv_order
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_adv_order`;
CREATE TABLE `b_seo_adv_order` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `ORDER_ID` int(11) NOT NULL,
  `SUM` float DEFAULT '0',
  `PROCESSED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_order` (`ENGINE_ID`,`CAMPAIGN_ID`,`BANNER_ID`,`ORDER_ID`),
  KEY `ix_b_seo_adv_order1` (`ORDER_ID`,`PROCESSED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_seo_adv_region
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_adv_region`;
CREATE TABLE `b_seo_adv_region` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `PARENT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_region` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_region1` (`PARENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_seo_keywords
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_keywords`;
CREATE TABLE `b_seo_keywords` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_keywords_url` (`URL`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_seo_search_engine
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_search_engine`;
CREATE TABLE `b_seo_search_engine` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SORT` int(5) DEFAULT '100',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT_SECRET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REDIRECT_URI` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_search_engine_code` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_seo_search_engine` VALUES
(1, 'google', 'Y', 200, 'Google', '868942902147-qrrd6ce1ajfkpse8ieq4gkpdeanvtnno.apps.googleusercontent.com', 'EItMlJpZLC2WRPKB6QsA5bV9', 'urn:ietf:wg:oauth:2.0:oob', NULL),
(2, 'yandex', 'Y', 300, 'Yandex', 'f848c7bfc1d34a94ba6d05439f81bbd7', 'da0e73b2d9cc4e809f3170e49cb9df01', 'https://oauth.yandex.ru/verification_code', NULL),
(3, 'yandex_direct', 'Y', 400, 'Yandex.Direct', '', '', 'https://oauth.yandex.ru/verification_code', NULL);
-- -----------------------------------
-- Dumping table b_seo_service_log
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_service_log`;
CREATE TABLE `b_seo_service_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_seo_service_rtg_queue
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_service_rtg_queue`;
CREATE TABLE `b_seo_service_rtg_queue` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCOUNT_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUDIENCE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PARENT_ID` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_TYPE` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTION` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_AUTO_REMOVE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SRV_RTG_QUEUE_1` (`ACTION`,`DATE_AUTO_REMOVE`),
  KEY `IX_B_SEO_SRV_RTG_QUEUE_2` (`TYPE`,`ACTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_seo_service_subscription
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_service_subscription`;
CREATE TABLE `b_seo_service_subscription` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CALLBACK_SERVER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_AUTH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SERVICE_SUB_1` (`TYPE`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_seo_service_webhook
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_service_webhook`;
CREATE TABLE `b_seo_service_webhook` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SECURITY_CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SERVICE_WEBHOOK_1` (`TYPE`,`EXTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_seo_sitemap
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_sitemap`;
CREATE TABLE `b_seo_sitemap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_RUN` datetime DEFAULT NULL,
  `SETTINGS` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_seo_sitemap_entity
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_sitemap_entity`;
CREATE TABLE `b_seo_sitemap_entity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_sitemap_entity_1` (`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `ix_b_seo_sitemap_entity_2` (`SITEMAP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_seo_sitemap_iblock
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_sitemap_iblock`;
CREATE TABLE `b_seo_sitemap_iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_sitemap_iblock_1` (`IBLOCK_ID`),
  KEY `ix_b_seo_sitemap_iblock_2` (`SITEMAP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_seo_sitemap_runtime
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_sitemap_runtime`;
CREATE TABLE `b_seo_sitemap_runtime` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PID` int(11) NOT NULL,
  `PROCESSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ITEM_PATH` varchar(700) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEM_ID` int(11) DEFAULT NULL,
  `ITEM_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `ACTIVE_ELEMENT` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_seo_sitemap_runtime1` (`PID`,`PROCESSED`,`ITEM_TYPE`,`ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_seo_yandex_direct_stat
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_yandex_direct_stat`;
CREATE TABLE `b_seo_yandex_direct_stat` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `DATE_DAY` date NOT NULL,
  `CURRENCY` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUM` float DEFAULT '0',
  `SUM_SEARCH` float DEFAULT '0',
  `SUM_CONTEXT` float DEFAULT '0',
  `CLICKS` int(7) DEFAULT '0',
  `CLICKS_SEARCH` int(7) DEFAULT '0',
  `CLICKS_CONTEXT` int(7) DEFAULT '0',
  `SHOWS` int(7) DEFAULT '0',
  `SHOWS_SEARCH` int(7) DEFAULT '0',
  `SHOWS_CONTEXT` int(7) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_seo_yandex_direct_stat` (`BANNER_ID`,`DATE_DAY`),
  KEY `ix_seo_yandex_direct_stat1` (`CAMPAIGN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_short_uri
-- -----------------------------------
DROP TABLE IF EXISTS `b_short_uri`;
CREATE TABLE `b_short_uri` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `URI` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `URI_CRC` int(18) NOT NULL,
  `SHORT_URI` varbinary(250) NOT NULL,
  `SHORT_URI_CRC` int(18) NOT NULL,
  `STATUS` int(18) NOT NULL DEFAULT '301',
  `MODIFIED` datetime NOT NULL,
  `LAST_USED` datetime DEFAULT NULL,
  `NUMBER_USED` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ux_b_short_uri_1` (`SHORT_URI_CRC`),
  KEY `ux_b_short_uri_2` (`URI_CRC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_site_template
-- -----------------------------------
DROP TABLE IF EXISTS `b_site_template`;
CREATE TABLE `b_site_template` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_site_template_site` (`SITE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_site_template` VALUES
(3, 's1', '', 150, 'exam');
-- -----------------------------------
-- Dumping table b_sm_version_history
-- -----------------------------------
DROP TABLE IF EXISTS `b_sm_version_history`;
CREATE TABLE `b_sm_version_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `VERSIONS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_smile
-- -----------------------------------
DROP TABLE IF EXISTS `b_smile`;
CREATE TABLE `b_smile` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SET_ID` int(18) NOT NULL DEFAULT '0',
  `SORT` int(10) NOT NULL DEFAULT '150',
  `TYPING` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLICKABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IMAGE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `IMAGE_DEFINITION` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SD',
  `IMAGE_WIDTH` int(11) NOT NULL DEFAULT '0',
  `IMAGE_HEIGHT` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_smile` VALUES
(1, 'S', 2, 100, ':) :-)', 'Y', 'N', 'bx_smile_smile.png', 'UHD', 20, 20),
(2, 'S', 2, 105, ';) ;-)', 'Y', 'N', 'bx_smile_wink.png', 'UHD', 20, 20),
(3, 'S', 2, 110, ':D :-D', 'Y', 'N', 'bx_smile_biggrin.png', 'UHD', 20, 20),
(4, 'S', 2, 115, '8-)', 'Y', 'N', 'bx_smile_cool.png', 'UHD', 20, 20),
(5, 'S', 2, 120, ':facepalm:', 'Y', 'N', 'bx_smile_facepalm.png', 'UHD', 20, 20),
(6, 'S', 2, 125, ':{} :-{}', 'Y', 'N', 'bx_smile_kiss.png', 'UHD', 20, 20),
(7, 'S', 2, 130, ':( :-(', 'Y', 'N', 'bx_smile_sad.png', 'UHD', 20, 20),
(8, 'S', 2, 135, ':| :-|', 'Y', 'N', 'bx_smile_neutral.png', 'UHD', 20, 20),
(9, 'S', 2, 140, ':oops:', 'Y', 'N', 'bx_smile_redface.png', 'UHD', 20, 20),
(10, 'S', 2, 145, ':cry: :~(', 'Y', 'N', 'bx_smile_cry.png', 'UHD', 20, 20),
(11, 'S', 2, 150, ':evil: >:-<', 'Y', 'N', 'bx_smile_evil.png', 'UHD', 20, 20),
(12, 'S', 2, 155, ':o :-o :shock:', 'Y', 'N', 'bx_smile_eek.png', 'UHD', 20, 20),
(13, 'S', 2, 160, ':/ :-/', 'Y', 'N', 'bx_smile_confuse.png', 'UHD', 20, 20),
(14, 'S', 2, 165, ':idea:', 'Y', 'N', 'bx_smile_idea.png', 'UHD', 20, 20),
(15, 'S', 2, 170, ':?:', 'Y', 'N', 'bx_smile_question.png', 'UHD', 20, 20),
(16, 'S', 2, 175, ':!:', 'Y', 'N', 'bx_smile_exclaim.png', 'UHD', 20, 20),
(17, 'S', 2, 180, ':like:', 'Y', 'N', 'bx_smile_like.png', 'UHD', 20, 20),
(18, 'I', 2, 175, 'ICON_NOTE', 'Y', 'N', 'bx_icon_1.gif', 'SD', 15, 15),
(19, 'I', 2, 180, 'ICON_DIRRECTION', 'Y', 'N', 'bx_icon_2.gif', 'SD', 15, 15),
(20, 'I', 2, 185, 'ICON_IDEA', 'Y', 'N', 'bx_icon_3.gif', 'SD', 15, 15),
(21, 'I', 2, 190, 'ICON_ATTANSION', 'Y', 'N', 'bx_icon_4.gif', 'SD', 15, 15),
(22, 'I', 2, 195, 'ICON_QUESTION', 'Y', 'N', 'bx_icon_5.gif', 'SD', 15, 15),
(23, 'I', 2, 200, 'ICON_BAD', 'Y', 'N', 'bx_icon_6.gif', 'SD', 15, 15),
(24, 'I', 2, 205, 'ICON_GOOD', 'Y', 'N', 'bx_icon_7.gif', 'SD', 15, 15);
-- -----------------------------------
-- Dumping table b_smile_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_smile_lang`;
CREATE TABLE `b_smile_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_SMILE_SL` (`TYPE`,`SID`,`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_smile_lang` VALUES
(1, 'P', 1, 'ru', 'Стандартная галерея'),
(2, 'P', 1, 'en', 'Standard gallery'),
(3, 'G', 2, 'ru', 'Основной набор'),
(4, 'G', 2, 'en', 'Default pack'),
(5, 'S', 1, 'ru', 'С улыбкой'),
(6, 'S', 1, 'en', 'Smile'),
(7, 'S', 2, 'ru', 'Шутливо'),
(8, 'S', 2, 'en', 'Wink'),
(9, 'S', 3, 'ru', 'Широкая улыбка'),
(10, 'S', 3, 'en', 'Big grin'),
(11, 'S', 4, 'ru', 'Здорово'),
(12, 'S', 4, 'en', 'Cool'),
(13, 'S', 5, 'ru', 'Разочарование'),
(14, 'S', 5, 'en', 'Facepalm'),
(15, 'S', 6, 'ru', 'Поцелуй'),
(16, 'S', 6, 'en', 'Kiss'),
(17, 'S', 7, 'ru', 'Печально'),
(18, 'S', 7, 'en', 'Sad'),
(19, 'S', 8, 'ru', 'Скептически'),
(20, 'S', 8, 'en', 'Skeptic'),
(21, 'S', 9, 'ru', 'Смущенный'),
(22, 'S', 9, 'en', 'Embarrassed'),
(23, 'S', 10, 'ru', 'Очень грустно'),
(24, 'S', 10, 'en', 'Crying'),
(25, 'S', 11, 'ru', 'Со злостью'),
(26, 'S', 11, 'en', 'Angry'),
(27, 'S', 12, 'ru', 'Удивленно'),
(28, 'S', 12, 'en', 'Surprised'),
(29, 'S', 13, 'ru', 'Смущенно'),
(30, 'S', 13, 'en', 'Confused'),
(31, 'S', 14, 'ru', 'Идея'),
(32, 'S', 14, 'en', 'Idea'),
(33, 'S', 15, 'ru', 'Вопрос'),
(34, 'S', 15, 'en', 'Question'),
(35, 'S', 16, 'ru', 'Восклицание'),
(36, 'S', 16, 'en', 'Exclamation'),
(37, 'S', 17, 'ru', 'Нравится'),
(38, 'S', 17, 'en', 'Like');
-- -----------------------------------
-- Dumping table b_smile_set
-- -----------------------------------
DROP TABLE IF EXISTS `b_smile_set`;
CREATE TABLE `b_smile_set` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'G',
  `PARENT_ID` int(18) NOT NULL DEFAULT '0',
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(10) NOT NULL DEFAULT '150',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_smile_set` VALUES
(1, 'P', 0, 'bitrix', 150),
(2, 'G', 1, 'bitrix_main', 150);
-- -----------------------------------
-- Dumping table b_sms_template
-- -----------------------------------
DROP TABLE IF EXISTS `b_sms_template`;
CREATE TABLE `b_sms_template` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SENDER` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RECEIVER` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_sms_message_name` (`EVENT_NAME`(50))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_sms_template` VALUES
(1, 'SMS_USER_CONFIRM_NUMBER', 'Y', '#DEFAULT_SENDER#', '#USER_PHONE#', 'Код подтверждения #CODE#', NULL),
(2, 'SMS_USER_RESTORE_PASSWORD', 'Y', '#DEFAULT_SENDER#', '#USER_PHONE#', 'Код для восстановления пароля #CODE#', NULL),
(3, 'SMS_EVENT_LOG_NOTIFICATION', 'Y', '#DEFAULT_SENDER#', '#PHONE_NUMBER#', '#NAME#: #ADDITIONAL_TEXT# (событий: #EVENT_COUNT#)', NULL);
-- -----------------------------------
-- Dumping table b_sms_template_site
-- -----------------------------------
DROP TABLE IF EXISTS `b_sms_template_site`;
CREATE TABLE `b_sms_template_site` (
  `TEMPLATE_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`TEMPLATE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_sms_template_site` VALUES
(1, 's1'),
(2, 's1'),
(3, 's1');
-- -----------------------------------
-- Dumping table b_socialservices_ap
-- -----------------------------------
DROP TABLE IF EXISTS `b_socialservices_ap`;
CREATE TABLE `b_socialservices_ap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_ID` int(11) NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ENDPOINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `SETTINGS` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_socialservices_ap1` (`USER_ID`,`DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_socialservices_contact
-- -----------------------------------
DROP TABLE IF EXISTS `b_socialservices_contact`;
CREATE TABLE `b_socialservices_contact` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_ID` int(11) NOT NULL,
  `CONTACT_USER_ID` int(11) DEFAULT NULL,
  `CONTACT_XML_ID` int(11) DEFAULT NULL,
  `CONTACT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_LAST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_PHOTO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `NOTIFY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_contact1` (`USER_ID`),
  KEY `ix_b_socialservices_contact2` (`CONTACT_USER_ID`),
  KEY `ix_b_socialservices_contact3` (`TIMESTAMP_X`),
  KEY `ix_b_socialservices_contact4` (`LAST_AUTHORIZE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_socialservices_contact_connect
-- -----------------------------------
DROP TABLE IF EXISTS `b_socialservices_contact_connect`;
CREATE TABLE `b_socialservices_contact_connect` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CONTACT_ID` int(11) DEFAULT NULL,
  `LINK_ID` int(11) DEFAULT NULL,
  `CONTACT_PROFILE_ID` int(11) NOT NULL,
  `CONTACT_PORTAL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONNECT_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT 'P',
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_contact_connect1` (`CONTACT_ID`),
  KEY `ix_b_socialservices_contact_connect2` (`LINK_ID`),
  KEY `ix_b_socialservices_contact_connect3` (`LAST_AUTHORIZE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_socialservices_message
-- -----------------------------------
DROP TABLE IF EXISTS `b_socialservices_message`;
CREATE TABLE `b_socialservices_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `PROVIDER` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `SUCCES_SENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_socialservices_user
-- -----------------------------------
DROP TABLE IF EXISTS `b_socialservices_user`;
CREATE TABLE `b_socialservices_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int(11) DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `CAN_DELETE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PERSONAL_WWW` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERMISSIONS` varchar(555) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OATOKEN` text COLLATE utf8_unicode_ci,
  `OATOKEN_EXPIRES` int(11) DEFAULT NULL,
  `OASECRET` text COLLATE utf8_unicode_ci,
  `REFRESH_TOKEN` text COLLATE utf8_unicode_ci,
  `SEND_ACTIVITY` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SITE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INITIALIZED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_SOCIALSERVICES_USER` (`XML_ID`,`EXTERNAL_AUTH_ID`),
  KEY `IX_B_SOCIALSERVICES_US_3` (`LOGIN`),
  KEY `IX_B_SOCIALSERVICES_US_4` (`USER_ID`,`EXTERNAL_AUTH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_socialservices_user_link
-- -----------------------------------
DROP TABLE IF EXISTS `b_socialservices_user_link`;
CREATE TABLE `b_socialservices_user_link` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `LINK_USER_ID` int(11) DEFAULT NULL,
  `LINK_UID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LINK_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_LAST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_PICTURE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_user_link_5` (`SOCSERV_USER_ID`),
  KEY `ix_b_socialservices_user_link_6` (`LINK_USER_ID`,`TIMESTAMP_X`),
  KEY `ix_b_socialservices_user_link_7` (`LINK_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_socialservices_zoom_meeting
-- -----------------------------------
DROP TABLE IF EXISTS `b_socialservices_zoom_meeting`;
CREATE TABLE `b_socialservices_zoom_meeting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE_ID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `CONFERENCE_URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFERENCE_EXTERNAL_ID` bigint(20) unsigned NOT NULL,
  `CONFERENCE_PASSWORD` text COLLATE utf8_unicode_ci,
  `JOINED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONFERENCE_CREATED` datetime DEFAULT NULL,
  `CONFERENCE_STARTED` datetime DEFAULT NULL,
  `CONFERENCE_ENDED` datetime DEFAULT NULL,
  `DURATION` int(11) DEFAULT NULL,
  `TITLE` text COLLATE utf8_unicode_ci,
  `SHORT_LINK` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_RECORDING` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SOCIALSERVICES_ZOOM_MEETING_1` (`CONFERENCE_EXTERNAL_ID`),
  KEY `IX_B_SOCIALSERVICES_ZOOM_MEETING_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_socialservices_zoom_meeting_recording
-- -----------------------------------
DROP TABLE IF EXISTS `b_socialservices_zoom_meeting_recording`;
CREATE TABLE `b_socialservices_zoom_meeting_recording` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EXTERNAL_ID` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `MEETING_ID` int(11) NOT NULL,
  `START_DATE` datetime NOT NULL,
  `END_DATE` datetime NOT NULL,
  `FILE_TYPE` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_SIZE` int(11) NOT NULL,
  `PLAY_URL` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOWNLOAD_URL` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RECORDING_TYPE` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `DOWNLOAD_TOKEN` text COLLATE utf8_unicode_ci,
  `PASSWORD` text COLLATE utf8_unicode_ci,
  `FILE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SOCIALSERVICES_ZOOM_MEETING_RECORDING_1` (`MEETING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sticker
-- -----------------------------------
DROP TABLE IF EXISTS `b_sticker`;
CREATE TABLE `b_sticker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PAGE_TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `MODIFIED_BY` int(18) NOT NULL,
  `CREATED_BY` int(18) NOT NULL,
  `PERSONAL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONTENT` text COLLATE utf8_unicode_ci,
  `POS_TOP` int(11) DEFAULT NULL,
  `POS_LEFT` int(11) DEFAULT NULL,
  `WIDTH` int(11) DEFAULT NULL,
  `HEIGHT` int(11) DEFAULT NULL,
  `COLOR` int(11) DEFAULT NULL,
  `COLLAPSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `COMPLETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CLOSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MARKER_TOP` int(11) DEFAULT NULL,
  `MARKER_LEFT` int(11) DEFAULT NULL,
  `MARKER_WIDTH` int(11) DEFAULT NULL,
  `MARKER_HEIGHT` int(11) DEFAULT NULL,
  `MARKER_ADJUST` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sticker_group_task
-- -----------------------------------
DROP TABLE IF EXISTS `b_sticker_group_task`;
CREATE TABLE `b_sticker_group_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_sticker_group_task` VALUES
(5, 29);
-- -----------------------------------
-- Dumping table b_task
-- -----------------------------------
DROP TABLE IF EXISTS `b_task`;
CREATE TABLE `b_task` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LETTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SYS` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module',
  PRIMARY KEY (`ID`),
  KEY `ix_task` (`MODULE_ID`,`BINDING`,`LETTER`,`SYS`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_task` VALUES
(1, 'main_denied', 'D', 'main', 'Y', NULL, 'module'),
(2, 'main_change_profile', 'P', 'main', 'Y', NULL, 'module'),
(3, 'main_view_all_settings', 'R', 'main', 'Y', NULL, 'module'),
(4, 'main_view_all_settings_change_profile', 'T', 'main', 'Y', NULL, 'module'),
(5, 'main_edit_subordinate_users', 'V', 'main', 'Y', NULL, 'module'),
(6, 'main_full_access', 'W', 'main', 'Y', NULL, 'module'),
(7, 'fm_folder_access_denied', 'D', 'main', 'Y', NULL, 'file'),
(8, 'fm_folder_access_read', 'R', 'main', 'Y', NULL, 'file'),
(9, 'fm_folder_access_write', 'W', 'main', 'Y', NULL, 'file'),
(10, 'fm_folder_access_full', 'X', 'main', 'Y', NULL, 'file'),
(11, 'fm_folder_access_workflow', 'U', 'main', 'Y', NULL, 'file'),
(12, 'bitrixcloud_deny', 'D', 'bitrixcloud', 'Y', NULL, 'module'),
(13, 'bitrixcloud_control', 'W', 'bitrixcloud', 'Y', NULL, 'module'),
(14, 'clouds_denied', 'D', 'clouds', 'Y', NULL, 'module'),
(15, 'clouds_browse', 'F', 'clouds', 'Y', NULL, 'module'),
(16, 'clouds_upload', 'U', 'clouds', 'Y', NULL, 'module'),
(17, 'clouds_full_access', 'W', 'clouds', 'Y', NULL, 'module'),
(18, 'fileman_denied', 'D', 'fileman', 'Y', '', 'module'),
(19, 'fileman_allowed_folders', 'F', 'fileman', 'Y', '', 'module'),
(20, 'fileman_full_access', 'W', 'fileman', 'Y', '', 'module'),
(21, 'medialib_denied', 'D', 'fileman', 'Y', '', 'medialib'),
(22, 'medialib_view', 'F', 'fileman', 'Y', '', 'medialib'),
(23, 'medialib_only_new', 'R', 'fileman', 'Y', '', 'medialib'),
(24, 'medialib_edit_items', 'V', 'fileman', 'Y', '', 'medialib'),
(25, 'medialib_editor', 'W', 'fileman', 'Y', '', 'medialib'),
(26, 'medialib_full', 'X', 'fileman', 'Y', '', 'medialib'),
(27, 'stickers_denied', 'D', 'fileman', 'Y', '', 'stickers'),
(28, 'stickers_read', 'R', 'fileman', 'Y', '', 'stickers'),
(29, 'stickers_edit', 'W', 'fileman', 'Y', '', 'stickers'),
(30, 'hblock_denied', 'D', 'highloadblock', 'Y', NULL, 'module'),
(31, 'hblock_read', 'R', 'highloadblock', 'Y', NULL, 'module'),
(32, 'hblock_write', 'W', 'highloadblock', 'Y', NULL, 'module'),
(33, 'iblock_deny', 'D', 'iblock', 'Y', NULL, 'iblock'),
(34, 'iblock_read', 'R', 'iblock', 'Y', NULL, 'iblock'),
(35, 'iblock_element_add', 'E', 'iblock', 'Y', NULL, 'iblock'),
(36, 'iblock_admin_read', 'S', 'iblock', 'Y', NULL, 'iblock'),
(37, 'iblock_admin_add', 'T', 'iblock', 'Y', NULL, 'iblock'),
(38, 'iblock_limited_edit', 'U', 'iblock', 'Y', NULL, 'iblock'),
(39, 'iblock_full_edit', 'W', 'iblock', 'Y', NULL, 'iblock'),
(40, 'iblock_full', 'X', 'iblock', 'Y', NULL, 'iblock'),
(41, 'landing_right_denied', 'D', 'landing', 'Y', NULL, 'module'),
(42, 'landing_right_read', 'R', 'landing', 'Y', NULL, 'module'),
(43, 'landing_right_edit', 'U', 'landing', 'Y', NULL, 'module'),
(44, 'landing_right_sett', 'V', 'landing', 'Y', NULL, 'module'),
(45, 'landing_right_public', 'W', 'landing', 'Y', NULL, 'module'),
(46, 'landing_right_delete', 'X', 'landing', 'Y', NULL, 'module'),
(47, 'seo_denied', 'D', 'seo', 'Y', '', 'module'),
(48, 'seo_edit', 'F', 'seo', 'Y', '', 'module'),
(49, 'seo_full_access', 'W', 'seo', 'Y', '', 'module'),
(50, 'Контент-редакторы', 'Q', 'main', 'N', 'Разрешено изменять информацию в своем профайле. Управление кешем', 'module');
-- -----------------------------------
-- Dumping table b_task_operation
-- -----------------------------------
DROP TABLE IF EXISTS `b_task_operation`;
CREATE TABLE `b_task_operation` (
  `TASK_ID` int(18) NOT NULL,
  `OPERATION_ID` int(18) NOT NULL,
  PRIMARY KEY (`TASK_ID`,`OPERATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_task_operation` VALUES
(2, 2),
(2, 3),
(3, 2),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(5, 2),
(5, 3),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(5, 9),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 10),
(6, 11),
(6, 12),
(6, 13),
(6, 14),
(6, 15),
(6, 16),
(6, 17),
(6, 18),
(8, 19),
(8, 20),
(8, 21),
(9, 19),
(9, 20),
(9, 21),
(9, 22),
(9, 23),
(9, 24),
(9, 25),
(9, 26),
(9, 27),
(9, 28),
(9, 29),
(9, 30),
(9, 31),
(9, 32),
(9, 33),
(9, 34),
(10, 19),
(10, 20),
(10, 21),
(10, 22),
(10, 23),
(10, 24),
(10, 25),
(10, 26),
(10, 27),
(10, 28),
(10, 29),
(10, 30),
(10, 31),
(10, 32),
(10, 33),
(10, 34),
(10, 35),
(11, 19),
(11, 20),
(11, 21),
(11, 24),
(11, 28),
(13, 36),
(13, 37),
(13, 38),
(15, 39),
(16, 39),
(16, 40),
(17, 39),
(17, 40),
(17, 41),
(19, 44),
(19, 45),
(19, 46),
(19, 47),
(19, 48),
(19, 49),
(19, 50),
(19, 52),
(19, 53),
(20, 42),
(20, 43),
(20, 44),
(20, 45),
(20, 46),
(20, 47),
(20, 48),
(20, 49),
(20, 50),
(20, 51),
(20, 52),
(20, 53),
(20, 54),
(22, 55),
(23, 55),
(23, 56),
(23, 60),
(24, 55),
(24, 60),
(24, 61),
(24, 62),
(25, 55),
(25, 56),
(25, 57),
(25, 58),
(25, 60),
(25, 61),
(25, 62),
(26, 55),
(26, 56),
(26, 57),
(26, 58),
(26, 59),
(26, 60),
(26, 61),
(26, 62),
(28, 63),
(29, 63),
(29, 64),
(29, 65),
(29, 66),
(31, 67),
(32, 68),
(32, 69),
(34, 70),
(34, 71),
(35, 72),
(36, 70),
(36, 71),
(36, 73),
(37, 70),
(37, 71),
(37, 72),
(37, 73),
(38, 70),
(38, 71),
(38, 72),
(38, 73),
(38, 74),
(38, 75),
(38, 76),
(38, 77),
(39, 70),
(39, 71),
(39, 72),
(39, 73),
(39, 74),
(39, 75),
(39, 76),
(39, 77),
(39, 78),
(39, 79),
(39, 80),
(39, 81),
(40, 70),
(40, 71),
(40, 72),
(40, 73),
(40, 74),
(40, 75),
(40, 76),
(40, 77),
(40, 78),
(40, 79),
(40, 80),
(40, 81),
(40, 82),
(40, 83),
(40, 84),
(40, 85),
(40, 86),
(40, 87),
(42, 88),
(43, 89),
(44, 90),
(45, 91),
(46, 92),
(48, 94),
(49, 93),
(49, 94),
(50, 2),
(50, 3),
(50, 14);
-- -----------------------------------
-- Dumping table b_translate_diff
-- -----------------------------------
DROP TABLE IF EXISTS `b_translate_diff`;
CREATE TABLE `b_translate_diff` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FILE_ID` int(18) NOT NULL,
  `PATH_ID` int(18) NOT NULL,
  `LANG_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `AGAINST_LANG_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EXCESS_COUNT` int(18) NOT NULL DEFAULT '0',
  `DEFICIENCY_COUNT` int(18) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IXU_TRNSL_DIFF` (`FILE_ID`,`LANG_ID`,`AGAINST_LANG_ID`),
  KEY `IX_TRNSL_DIFF_PATH` (`PATH_ID`,`LANG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_translate_file
-- -----------------------------------
DROP TABLE IF EXISTS `b_translate_file`;
CREATE TABLE `b_translate_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PATH_ID` int(18) NOT NULL,
  `LANG_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `FULL_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE_COUNT` int(18) NOT NULL DEFAULT '0',
  `INDEXED` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `INDEXED_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_TRNSL_FL_PATH` (`PATH_ID`,`LANG_ID`),
  KEY `IX_TRNSL_FULL_PATH` (`FULL_PATH`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_translate_path
-- -----------------------------------
DROP TABLE IF EXISTS `b_translate_path`;
CREATE TABLE `b_translate_path` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(18) NOT NULL DEFAULT '0',
  `DEPTH_LEVEL` int(18) NOT NULL DEFAULT '0',
  `SORT` int(18) NOT NULL DEFAULT '0',
  `PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `IS_LANG` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_DIR` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `OBLIGATORY_LANGS` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEXED` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `INDEXED_TIME` datetime DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ASSIGNMENT` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_TRNSL_PTH_NAME` (`PARENT_ID`,`NAME`),
  KEY `IX_TRNSL_PTH_PARENT` (`PARENT_ID`,`IS_DIR`,`IS_LANG`),
  KEY `IX_TRNSL_PTH_PATH` (`PATH`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_translate_path_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_translate_path_lang`;
CREATE TABLE `b_translate_path_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_TRNSL_LNG_PATH` (`PATH`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_translate_path_tree
-- -----------------------------------
DROP TABLE IF EXISTS `b_translate_path_tree`;
CREATE TABLE `b_translate_path_tree` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(18) NOT NULL,
  `PATH_ID` int(18) NOT NULL,
  `DEPTH_LEVEL` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_TRNSL_ANCESTOR` (`PARENT_ID`,`DEPTH_LEVEL`,`PATH_ID`),
  UNIQUE KEY `IX_TRNSL_DESCENDANT` (`PATH_ID`,`PARENT_ID`,`DEPTH_LEVEL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_translate_phrase
-- -----------------------------------
DROP TABLE IF EXISTS `b_translate_phrase`;
CREATE TABLE `b_translate_phrase` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FILE_ID` int(18) NOT NULL,
  `PATH_ID` int(18) NOT NULL,
  `LANG_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PHRASE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IXU_TRNSL_PHR_PATH_CODE` (`PATH_ID`,`LANG_ID`,`CODE`),
  KEY `IX_TRNSL_PHR_PATH` (`PATH_ID`,`CODE`),
  KEY `IX_TRNSL_FILE` (`FILE_ID`),
  FULLTEXT KEY `IXF_TRNSL_PHR` (`PHRASE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

-- -----------------------------------
-- Dumping table b_ui_entity_editor_config
-- -----------------------------------
DROP TABLE IF EXISTS `b_ui_entity_editor_config`;
CREATE TABLE `b_ui_entity_editor_config` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CATEGORY` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE_ID` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci NOT NULL,
  `COMMON` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  KEY `CATEGORY` (`CATEGORY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_ui_entity_editor_config_ac
-- -----------------------------------
DROP TABLE IF EXISTS `b_ui_entity_editor_config_ac`;
CREATE TABLE `b_ui_entity_editor_config_ac` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ACCESS_CODE` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIG_ID` int(10) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ACCESS_CODE` (`ACCESS_CODE`),
  KEY `CONFIG_ID` (`CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_undo
-- -----------------------------------
DROP TABLE IF EXISTS `b_undo`;
CREATE TABLE `b_undo` (
  `ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_HANDLER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` mediumtext COLLATE utf8_unicode_ci,
  `USER_ID` int(11) DEFAULT NULL,
  `TIMESTAMP_X` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_undo` VALUES
('100625ea7a5779fa692c4807b60b19842', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:521:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"#GROUP_ID#/\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611748944),
('10585ca7d17e75a24d41f694ce2705398', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:545:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLES_ALIASES\" => \"\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"GROUP_CODE\",\n		)\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611747500),
('108ab980fcec939b403537ccd9f53bea8', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:521:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"#GROUP_ID#/\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611750356),
('110b93c29f8e1c00b43d61d7555b33529', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:506:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"\",\n		)\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611738769),
('112084e8272cb38000c293944ecee9277', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:554:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"/gruppy-polzovateley-kompleksnyy/\",\n			\"groupdetail\" => \"#GROUP_ID#/\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611751429),
('11c53e2b92d564d06fa5531c6ea1eeb03', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:491:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_MODE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"VARIABLE_ALIASES\" => array(\n			\"GROUP_ID\" => \"GROUP_ID\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611753770),
('11d622c78d0320b4e86bcb55acbf8aa82', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:521:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"#GROUP_ID#/\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611756400),
('11deca0d1f4e4a07b38108a1a9dcdb93e', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:508:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLES_ALIASES\" => \"\",\n		\"VARIABLE_ALIASES\" => array(\n			\"GROUP_ID\" => \"\",\n		)\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611745915),
('127285a8f883cbf49723212e30be20c3b', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:451:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLES_ALIASES\" => \"\"\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611743974),
('129911f95e31e0ed5e8bcca7e46f79b2d', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:521:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"#GROUP_ID#/\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611749673),
('12a8bf249c9cb7efc0bea17eb5db2873b', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:491:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLE_ALIASES\" => array(\n			\"GROUP_ID\" => \"GROUP_ID\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611749372),
('12a9ada22c9cd413cb0837cc9a396403a', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:523:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"#GROUP_CODE#/\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611755337),
('12c4fc4707ac7ca391911d60bbf0881b4', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:546:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLES_ALIASES\" => \"\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"#GROUP_ID#/\",\n		)\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611747163),
('12f14d36c66860e51beca1d3c841a76a6', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:521:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"#GROUP_ID#/\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611753993),
('131fcb9af9febfa0cfb5e4bbe7028efac', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:521:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"#GROUP_ID#/\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611749448),
('138da6b93c543d23dfe3213acd41478eb', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:491:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLE_ALIASES\" => array(\n			\"GROUP_ID\" => \"GROUP_ID\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611749495),
('1399e4c56c1c123735fe5fb807c532d7b', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:442:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\",\n	\"\",\n	Array(\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_MODE\" => \"Y\",\n		\"SEF_URL_TEMPLATES\" => Array(\"groupdetail\"=>\"GROUP_ID\",\"groupslist\"=>\"\")\n	)\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611737270),
('13ad7c7098f4a38adf9cd69b5dc877132', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:543:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLES_ALIASES\" => \"\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"GROUP_ID\",\n		)\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611747793),
('13b6c95675c1ee9fca78e1c8d9aee30eb', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:521:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"#GROUP_ID#/\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611757018),
('13c7dca4658d4909a4437fc560d208152', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:438:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"VARIABLE_ALIASES\" => array(\n			\"GROUP_ID\" => \"GROUP_CODE\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611749730),
('1400f1a63051648a2cd901fc8e5a41059', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:370:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\",\n	\"\",\n	Array(\n		\"SEF_MODE\" => \"N\",\n		\"VARIABLE_ALIASES\" => Array(\"GROUP_ID\"=>\"GROUP_ID\")\n	)\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611747836),
('140cad8b124f93892a819278c88ba0cd6', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:518:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"GROUP_ID\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611748292),
('140ea9faaa5023bd136caa64ca96e621f', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:535:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLES_ALIASES\" => \"\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"\",\n		)\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611746355),
('1411db7b91d7da8c3c08145fb66bca401', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:535:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLES_ALIASES\" => \"\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"\",\n		)\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611745988),
('142a7680e479c58c574afee061f35605d', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:451:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLES_ALIASES\" => \"\"\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611744951),
('14bfdd97e71e9d6ece30419a24f37efad', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:311:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\",\n	\"\",\n	Array(\n		\"SEF_MODE\" => \"N\"\n	)\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611737582),
('1555fc5eb1dc50d40eb72c8c8aba7a35a', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:543:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLES_ALIASES\" => \"\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"GROUP_ID\",\n		)\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611747204),
('15f296d31f8df5d7807fda92238ab6c12', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:498:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLE_ALIASES\" => array(\n			\"GROUP_ID\" => \"AGASIGABRIELYAN\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611748699),
('15f972ac546d65c7d9276c87151860dc2', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:493:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_MODE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"VARIABLE_ALIASES\" => array(\n			\"GROUP_ID\" => \"GROUP_CODE\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611755306),
('164725f3434880bf11cd317924f0c9cd0', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:518:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"GROUP_ID\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611747859),
('165adb31c0a38e61c2c8c23ace793dfd3', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:523:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"#GROUP_CODE#/\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611756949),
('16c7887e5880355725726fa62fd3366f1', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:516:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLES_ALIASES\" => \"\",\n		\"VARIABLE_ALIASES\" => array(\n			\"GROUP_ID\" => \"GROUP_ID\",\n		)\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611747180),
('16ce49674cf0a9e205f025b52b1cc46cd', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:522:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLES_ALIASES\" => \"\",\n		\"VARIABLE_ALIASES\" => array(\n			\"GROUP_ID\" => \"GROUP_CODESOME\",\n		)\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611745618),
('16e38bc7822978c5db61b21bfd6082c76', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:451:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLES_ALIASES\" => \"\"\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611744970),
('1706c9ac2a60c4cce5f146a5f56c05f8c', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:370:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\",\n	\"\",\n	Array(\n		\"SEF_MODE\" => \"N\",\n		\"VARIABLE_ALIASES\" => Array(\"GROUP_ID\"=>\"GROUP_ID\")\n	)\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611749700),
('17179ad81d8c3426fc5b5a34aa2ea538d', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:491:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLE_ALIASES\" => array(\n			\"GROUP_ID\" => \"GROUP_ID\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611748316),
('17195be54e44768f3f0a512bbf213cea8', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:521:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"#GROUP_ID#/\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611749314),
('17dbc609bba2aaa44d7890c86662c7de9', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:491:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_MODE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"VARIABLE_ALIASES\" => array(\n			\"GROUP_ID\" => \"GROUP_ID\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611750168),
('17e6eaf845865ec78b9a497ae6549973e', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:491:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLE_ALIASES\" => array(\n			\"GROUP_ID\" => \"GROUP_ID\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611748672),
('1894a598be7206afc9bf619444f5db6de', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:518:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLES_ALIASES\" => \"\",\n		\"VARIABLE_ALIASES\" => array(\n			\"GROUP_ID\" => \"GROUP_CODE\",\n		)\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611745400),
('189787385f6493bc1d857d16b8929b95b', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:422:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\"\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611738868),
('18bea8b529ffe87c388dc9a555dea70f5', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:216:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611749688),
('18d5d706971d9655cb30d15bcd9a0d142', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:535:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLES_ALIASES\" => \"\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"\",\n		)\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611744337),
('1901973f1644d4b39e23f533f6e2f56fe', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:491:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_MODE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"VARIABLE_ALIASES\" => array(\n			\"GROUP_ID\" => \"GROUP_ID\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611751767),
('196ce1c67120be2cecbc55c8b73d5d7ac', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:514:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"GROUP_ID\",\n		)\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611738855),
('19b8b015c6c8e63f7b81cc7b5189892e6', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:528:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"#GROUP_CODE_CODE#/\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611756436),
('1a7a1ba971f1084b948c3f8ee13d4f64d', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:508:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLES_ALIASES\" => \"\",\n		\"VARIABLE_ALIASES\" => array(\n			\"GROUP_ID\" => \"\",\n		)\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611745592),
('1ab8859b750ef7e1ea77208b9ea956108', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:543:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLES_ALIASES\" => \"\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"GROUP_ID\",\n		)\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611746395),
('1b0bf68bf802bfc1a16ead645642230c9', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:496:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLE_ALIASES\" => array(\n			\"GROUP_ID\" => \"GROUP_ID.html\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611748736),
('1b2796f5c034adfd15cfd1ace874797b1', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:491:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_MODE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"VARIABLE_ALIASES\" => array(\n			\"GROUP_ID\" => \"GROUP_ID\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611754499),
('1b8f210adfc44f946d87cecd456514da8', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:521:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"#GROUP_ID#/\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611749781),
('1b9bad7327ffff321a98e1f00da500515', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:521:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"#GROUP_ID#/\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611751907),
('1bcbf686e03a4bc95a1e13a68bb1d8c04', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:516:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLES_ALIASES\" => \"\",\n		\"VARIABLE_ALIASES\" => array(\n			\"GROUP_ID\" => \"GROUP_ID\",\n		)\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611745362),
('1c28c236117787d18bc95ada0269985e4', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:491:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_MODE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"VARIABLE_ALIASES\" => array(\n			\"GROUP_ID\" => \"GROUP_ID\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611750404),
('1c35616e45852d8a748c9ffc45e383076', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:545:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLES_ALIASES\" => \"\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"GROUP_CODE\",\n		)\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611745348),
('1c419971d54d065cdabbda0aaf9ed3f8b', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:521:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"#GROUP_ID#/\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611755152),
('1c436d57cb9becf6724abdec171cd8a39', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:516:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"GROUP_CODE\",\n		)\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611742511),
('1c592c6e7f9047bc8ae260d6b8a020ba8', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:543:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLES_ALIASES\" => \"\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"GROUP_ID\",\n		)\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611746120),
('1c8dd8072cfbd7c47aff38dad3fa3387a', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:491:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLE_ALIASES\" => array(\n			\"GROUP_ID\" => \"GROUP_ID\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611747889),
('1d31094192e116a2109da41bd7e8258ff', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:50:\"C:/OSPanel/domains/exam.loc/novyy-razdel/index.php\";s:7:\"content\";s:387:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новый раздел\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\",\n	\"\",\n	Array(\n		\"SEF_FOLDER\" => \"/novyy-razdel/\",\n		\"SEF_MODE\" => \"Y\",\n		\"SEF_URL_TEMPLATES\" => Array(\"groupdetail\"=>\"#GROUP_ID#/\",\"groupslist\"=>\"\")\n	)\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611757869),
('1d5c863f4e312c342bf30a26fb0070dca', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:521:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"#GROUP_ID#/\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611755033),
('1d68ebfe5a81effee6ed03de0d905d61b', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:518:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"GROUP_ID\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611748624),
('1d8a3815a16dbff3ac3f32d755aada3ca', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:516:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLES_ALIASES\" => \"\",\n		\"VARIABLE_ALIASES\" => array(\n			\"GROUP_ID\" => \"GROUP_ID\",\n		)\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611746497),
('1dc589b128862f166d4211f12b8292227', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:491:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_MODE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"VARIABLE_ALIASES\" => array(\n			\"GROUP_ID\" => \"GROUP_ID\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611755290),
('1e0a52eff984aa2c73e0a572951ac1d53', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:492:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLE_ALIASES\" => array(\n			\"GROUP_ID\" => \"SOMETHING\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611748923),
('1e13e5df0f025757ac613e454182263fa', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:521:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"#GROUP_ID#/\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611751390),
('1e33d79f0d901901573f344f2b17d89fa', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:545:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLES_ALIASES\" => \"\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"GROUP_CODE\",\n		)\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611744996),
('1e5181fcc8f50fa0130e7c91f2e6dca1e', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:545:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLES_ALIASES\" => \"\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"GROUP_CODE\",\n		)\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611746136),
('1e569eb8ace6efbe14b6aaa143353de00', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:491:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_MODE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"VARIABLE_ALIASES\" => array(\n			\"GROUP_ID\" => \"GROUP_ID\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611755084),
('1e5e0fc31629880cbe9218244da332641', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:521:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"#GROUP_ID#/\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611751752),
('1e7393cd3a61854b2226a514ec7b288c7', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:506:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"\",\n		)\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611739222),
('1e7c7371558664dba8cd5b2574e122027', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:545:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLES_ALIASES\" => \"\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"GROUP_CODE\",\n		)\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611746333),
('1f3777e4b5495fffab6d927c8df42af79', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:449:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\",\n	\"\",\n	Array(\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_MODE\" => \"Y\",\n		\"SEF_URL_TEMPLATES\" => Array(\"groupdetail\"=>\"#GROUP_ID#/\",\"groupslist\"=>\"\")\n	)\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611750131),
('1f77d55cc956673c40e7c45f7d9aecf60', 'fileman', 'new_section', 'CFileman::UndoNewSection', 'a:4:{s:7:\"absPath\";s:40:\"C:/OSPanel/domains/exam.loc/novyy-razdel\";s:4:\"path\";s:13:\"/novyy-razdel\";s:4:\"site\";s:2:\"s1\";s:4:\"menu\";a:3:{s:8:\"menuFile\";s:15:\"/.left.menu.php\";s:8:\"menuName\";s:23:\"Новый раздел\";s:8:\"menuPath\";s:14:\"/novyy-razdel/\";}}', 1, 1611757821),
('1f7b1d26de8698a438cd85e7e6ff1f8e6', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:216:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611749845),
('1fb2798733503b517d7ff9ab29b7ab33c', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:523:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"#GROUP_CODE#/\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611755353),
('1fcfa17e32afdc9c72e623a2ac8272879', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:521:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"#GROUP_ID#/\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611750715),
('1fdecd89b5c351708b023f2c765ba523e', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:543:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_MODE\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"VARIABLES_ALIASES\" => \"\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"groupslist\" => \"\",\n			\"groupdetail\" => \"GROUP_ID\",\n		)\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611747299),
('1fe3d33c9fa1ac15b6109e8d49e08c253', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:69:\"C:/OSPanel/domains/exam.loc/gruppy-polzovateley-kompleksnyy/index.php\";s:7:\"content\";s:491:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Группы пользователей комплексный\");\n?><?$APPLICATION->IncludeComponent(\n	\"tasks:groups.complex\", \n	\".default\", \n	array(\n		\"SEF_FOLDER\" => \"/gruppy-polzovateley-kompleksnyy/\",\n		\"SEF_MODE\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"VARIABLE_ALIASES\" => array(\n			\"GROUP_ID\" => \"GROUP_ID\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1611750751);
-- -----------------------------------
-- Dumping table b_urlpreview_metadata
-- -----------------------------------
DROP TABLE IF EXISTS `b_urlpreview_metadata`;
CREATE TABLE `b_urlpreview_metadata` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `URL` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `DATE_INSERT` datetime NOT NULL,
  `DATE_EXPIRE` datetime DEFAULT NULL,
  `TITLE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `IMAGE_ID` int(11) DEFAULT NULL,
  `IMAGE` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMBED` mediumtext COLLATE utf8_unicode_ci,
  `EXTRA` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_URLPREVIEW_METADATA_URL` (`URL`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_urlpreview_route
-- -----------------------------------
DROP TABLE IF EXISTS `b_urlpreview_route`;
CREATE TABLE `b_urlpreview_route` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROUTE` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMETERS` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_URLPREVIEW_ROUTE_ROUTE` (`ROUTE`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user
-- -----------------------------------
DROP TABLE IF EXISTS `b_user`;
CREATE TABLE `b_user` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `LOGIN` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CHECKWORD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_LOGIN` datetime DEFAULT NULL,
  `DATE_REGISTER` datetime NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PROFESSION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ICQ` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_GENDER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int(18) DEFAULT NULL,
  `PERSONAL_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_MOBILE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STREET` text COLLATE utf8_unicode_ci,
  `PERSONAL_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_NOTES` text COLLATE utf8_unicode_ci,
  `WORK_COMPANY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_DEPARTMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_POSITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STREET` text COLLATE utf8_unicode_ci,
  `WORK_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PROFILE` text COLLATE utf8_unicode_ci,
  `WORK_LOGO` int(18) DEFAULT NULL,
  `WORK_NOTES` text COLLATE utf8_unicode_ci,
  `ADMIN_NOTES` text COLLATE utf8_unicode_ci,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDAY` date DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CHECKWORD_TIME` datetime DEFAULT NULL,
  `SECOND_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONFIRM_CODE` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN_ATTEMPTS` int(18) DEFAULT NULL,
  `LAST_ACTIVITY_DATE` datetime DEFAULT NULL,
  `AUTO_TIME_ZONE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE_OFFSET` int(18) DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BX_USER_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BLOCKED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_login` (`LOGIN`,`EXTERNAL_AUTH_ID`),
  KEY `ix_b_user_email` (`EMAIL`),
  KEY `ix_b_user_activity_date` (`LAST_ACTIVITY_DATE`),
  KEY `IX_B_USER_XML_ID` (`XML_ID`),
  KEY `ix_user_last_login` (`LAST_LOGIN`),
  KEY `ix_user_date_register` (`DATE_REGISTER`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user` VALUES
(1, NULL, 'admin', '$6$07w7FEjaxpGE8FEk$Ys4yP1.AHtHsGOlf0KwluSIMfaRZWbqp5mx83uxQAwTFBp/1TqAcb4h/I6MAsdkkfC2Z1M9dE.4eDZb8r0xqY1', '$6$RL7ky5VmKibg9HlC$fjcaSwhbu8eoENYc6kGIIby7t4.xI6dtdb3hhQbRObdm.dPvBtrlHbVUsUpeLGpaxkIgCwDzI/hjjJt.AbcY8/', 'Y', 'admin', 'admin', 'admin@admin.ru', '2021-01-28 13:27:42', '2021-01-27 06:20:50', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-27 06:20:50', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '028750954564e81ef0f3437917e35f64', NULL, 'N');
-- -----------------------------------
-- Dumping table b_user_access
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_access`;
CREATE TABLE `b_user_access` (
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCESS_CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ix_ua_user_provider` (`USER_ID`,`PROVIDER_ID`),
  KEY `ix_ua_user_access` (`USER_ID`,`ACCESS_CODE`),
  KEY `ix_ua_access` (`ACCESS_CODE`),
  KEY `ix_ua_provider` (`PROVIDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user_access` VALUES
(0, 'group', 'G2'),
(1, 'group', 'G1'),
(1, 'group', 'G3'),
(1, 'group', 'G4'),
(1, 'group', 'G2'),
(1, 'user', 'U1');
-- -----------------------------------
-- Dumping table b_user_access_check
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_access_check`;
CREATE TABLE `b_user_access_check` (
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ix_uac_user_provider` (`USER_ID`,`PROVIDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_auth_action
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_auth_action`;
CREATE TABLE `b_user_auth_action` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `PRIORITY` int(11) NOT NULL DEFAULT '100',
  `ACTION` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTION_DATE` datetime NOT NULL,
  `APPLICATION_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_auth_action_user` (`USER_ID`,`PRIORITY`),
  KEY `ix_auth_action_date` (`ACTION_DATE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_auth_code
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_auth_code`;
CREATE TABLE `b_user_auth_code` (
  `USER_ID` int(11) NOT NULL,
  `CODE_TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'email',
  `OTP_SECRET` text COLLATE utf8_unicode_ci,
  `ATTEMPTS` int(11) DEFAULT '0',
  `DATE_SENT` datetime DEFAULT NULL,
  `DATE_RESENT` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`CODE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_counter
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_counter`;
CREATE TABLE `b_user_counter` (
  `USER_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '**',
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CNT` int(18) NOT NULL DEFAULT '0',
  `LAST_DATE` datetime DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '3000-01-01 00:00:00',
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci,
  `SENT` char(1) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`USER_ID`,`SITE_ID`,`CODE`),
  KEY `ix_buc_tag` (`TAG`),
  KEY `ix_buc_code` (`CODE`),
  KEY `ix_buc_ts` (`TIMESTAMP_X`),
  KEY `ix_buc_sent_userid` (`SENT`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_digest
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_digest`;
CREATE TABLE `b_user_digest` (
  `USER_ID` int(11) NOT NULL,
  `DIGEST_HA1` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_field
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_field`;
CREATE TABLE `b_user_field` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MANDATORY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_FILTER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `IS_SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SETTINGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_type_entity` (`ENTITY_ID`,`FIELD_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_field_confirm
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_field_confirm`;
CREATE TABLE `b_user_field_confirm` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `DATE_CHANGE` timestamp NULL DEFAULT NULL,
  `FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELD_VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIRM_CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ATTEMPTS` int(18) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ix_b_user_field_confirm1` (`USER_ID`,`CONFIRM_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_field_enum
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_field_enum`;
CREATE TABLE `b_user_field_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_FIELD_ID` int(11) DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_field_enum` (`USER_FIELD_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_field_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_field_lang`;
CREATE TABLE `b_user_field_lang` (
  `USER_FIELD_ID` int(11) NOT NULL DEFAULT '0',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `EDIT_FORM_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_COLUMN_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_FILTER_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERROR_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HELP_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`USER_FIELD_ID`,`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_field_permission
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_field_permission`;
CREATE TABLE `b_user_field_permission` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE_ID` tinyint(2) unsigned NOT NULL,
  `USER_FIELD_ID` int(10) unsigned NOT NULL,
  `ACCESS_CODE` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `PERMISSION_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ROLE_ID` (`ENTITY_TYPE_ID`),
  KEY `GROUP_ID` (`USER_FIELD_ID`),
  KEY `PERMISSION_ID` (`PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_group`;
CREATE TABLE `b_user_group` (
  `USER_ID` int(18) NOT NULL,
  `GROUP_ID` int(18) NOT NULL,
  `DATE_ACTIVE_FROM` datetime DEFAULT NULL,
  `DATE_ACTIVE_TO` datetime DEFAULT NULL,
  UNIQUE KEY `ix_user_group` (`USER_ID`,`GROUP_ID`),
  KEY `ix_user_group_group` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user_group` VALUES
(1, 1, NULL, NULL),
(1, 3, NULL, NULL),
(1, 4, NULL, NULL);
-- -----------------------------------
-- Dumping table b_user_hit_auth
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_hit_auth`;
CREATE TABLE `b_user_hit_auth` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_USER_HIT_AUTH_1` (`HASH`),
  KEY `IX_USER_HIT_AUTH_2` (`USER_ID`),
  KEY `IX_USER_HIT_AUTH_3` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_index
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_index`;
CREATE TABLE `b_user_index` (
  `USER_ID` int(11) NOT NULL,
  `SEARCH_USER_CONTENT` text COLLATE utf8_unicode_ci,
  `SEARCH_DEPARTMENT_CONTENT` text COLLATE utf8_unicode_ci,
  `SEARCH_ADMIN_CONTENT` text COLLATE utf8_unicode_ci,
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECOND_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_POSITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UF_DEPARTMENT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  FULLTEXT KEY `IXF_B_USER_INDEX_1` (`SEARCH_USER_CONTENT`),
  FULLTEXT KEY `IXF_B_USER_INDEX_2` (`SEARCH_DEPARTMENT_CONTENT`),
  FULLTEXT KEY `IXF_B_USER_INDEX_3` (`SEARCH_ADMIN_CONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user_index` VALUES
(1, '001 nqzva', '', '001 nqzva nqzva@nqzva.eh', 'admin', 'admin', '', '', '');
-- -----------------------------------
-- Dumping table b_user_index_selector
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_index_selector`;
CREATE TABLE `b_user_index_selector` (
  `USER_ID` int(11) NOT NULL,
  `SEARCH_SELECTOR_CONTENT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`USER_ID`),
  FULLTEXT KEY `IXF_B_USER_INDEX_SELECTOR_1` (`SEARCH_SELECTOR_CONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user_index_selector` VALUES
(1, 'nqzva');
-- -----------------------------------
-- Dumping table b_user_option
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_option`;
CREATE TABLE `b_user_option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `CATEGORY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` mediumtext COLLATE utf8_unicode_ci,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_category_name` (`USER_ID`,`CATEGORY`,`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user_option` VALUES
(1, 0, 'intranet', '~gadgets_admin_index', 'a:1:{i:0;a:1:{s:7:\"GADGETS\";a:8:{s:20:\"ADMIN_INFO@333333333\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";}s:19:\"HTML_AREA@444444444\";a:5:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";s:8:\"USERDATA\";a:1:{s:7:\"content\";s:797:\"<table class=\"bx-gadgets-info-site-table\" cellspacing=\"0\"><tr>	<td class=\"bx-gadget-gray\">Создатель сайта:</td>	<td>Группа компаний &laquo;1С-Битрикс&raquo;.</td>	<td class=\"bx-gadgets-info-site-logo\" rowspan=\"5\"><img src=\"/bitrix/components/bitrix/desktop/templates/admin/images/site_logo.png\"></td></tr><tr>	<td class=\"bx-gadget-gray\">Адрес сайта:</td>	<td><a href=\"http://www.1c-bitrix.ru\">www.1c-bitrix.ru</a></td></tr><tr>	<td class=\"bx-gadget-gray\">Сайт сдан:</td>	<td>12 декабря 2010 г.</td></tr><tr>	<td class=\"bx-gadget-gray\">Ответственное лицо:</td>	<td>Иван Иванов</td></tr><tr>	<td class=\"bx-gadget-gray\">E-mail:</td>	<td><a href=\"mailto:info@1c-bitrix.ru\">info@1c-bitrix.ru</a></td></tr></table>\";}s:8:\"SETTINGS\";a:1:{s:9:\"TITLE_STD\";s:34:\"Информация о сайте\";}}s:25:\"ADMIN_CHECKLIST@777888999\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";}s:19:\"RSSREADER@777777777\";a:4:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:3;s:4:\"HIDE\";s:1:\"N\";s:8:\"SETTINGS\";a:3:{s:9:\"TITLE_STD\";s:33:\"Новости 1С-Битрикс\";s:3:\"CNT\";i:10;s:7:\"RSS_URL\";s:45:\"https://www.1c-bitrix.ru/about/life/news/rss/\";}}s:24:\"ADMIN_SECURITY@555555555\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";}s:25:\"ADMIN_SITESPEED@666666777\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";}s:23:\"ADMIN_PERFMON@666666666\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";}s:23:\"ADMIN_MARKETPALCE@22549\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:3;s:4:\"HIDE\";s:1:\"N\";}}}}', 'Y'),
(2, 0, 'main.interface', 'global', 'a:1:{s:5:\"theme\";s:4:\"blue\";}', 'Y'),
(3, 1, 'admin_panel', 'settings', 'a:2:{s:4:\"edit\";s:2:\"on\";s:9:\"collapsed\";s:3:\"off\";}', 'N'),
(4, 1, 'hot_keys', 'user_defined', 'b:1;', 'N'),
(5, 1, 'favorite', 'favorite_menu', 'a:1:{s:5:\"stick\";s:1:\"N\";}', 'N'),
(6, 1, 'socialservices', 'networkPopup', 'a:1:{s:9:\"showcount\";s:1:\"6\";}', 'N'),
(8, 1, 'fileman', 'code_editor', 'a:1:{s:5:\"theme\";s:5:\"light\";}', 'N'),
(12, 1, 'admin_menu', 'pos', 'a:1:{s:8:\"sections\";s:16:\"menu_util,backup\";}', 'N'),
(18, 1, 'html_editor', 'user_settings_', 'a:2:{s:13:\"taskbar_shown\";s:1:\"1\";s:4:\"view\";s:7:\"wysiwyg\";}', 'N'),
(20, 1, 'bx.windowmanager.9.5', 'options_de115b10ac2e171fe3d495ee8ca1d3e5', 'a:2:{s:3:\"pin\";s:4:\"true\";s:9:\"transform\";s:5:\"false\";}', 'N');
-- -----------------------------------
-- Dumping table b_user_password
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_password`;
CREATE TABLE `b_user_password` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CHANGE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_user_password_user_date` (`USER_ID`,`DATE_CHANGE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user_password` VALUES
(1, 1, '$6$07w7FEjaxpGE8FEk$Ys4yP1.AHtHsGOlf0KwluSIMfaRZWbqp5mx83uxQAwTFBp/1TqAcb4h/I6MAsdkkfC2Z1M9dE.4eDZb8r0xqY1', '2021-01-27 04:20:50');
-- -----------------------------------
-- Dumping table b_user_phone_auth
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_phone_auth`;
CREATE TABLE `b_user_phone_auth` (
  `USER_ID` int(11) NOT NULL,
  `PHONE_NUMBER` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `OTP_SECRET` text COLLATE utf8_unicode_ci,
  `ATTEMPTS` int(11) DEFAULT '0',
  `CONFIRMED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `DATE_SENT` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `ix_user_phone_auth_number` (`PHONE_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_profile_history
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_profile_history`;
CREATE TABLE `b_user_profile_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `EVENT_TYPE` int(11) DEFAULT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `UPDATED_BY_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_profile_history_user` (`USER_ID`),
  KEY `ix_profile_history_date` (`DATE_INSERT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_profile_record
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_profile_record`;
CREATE TABLE `b_user_profile_record` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `HISTORY_ID` int(11) NOT NULL,
  `FIELD` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATA` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_profile_record_history_field` (`HISTORY_ID`,`FIELD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_session
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_session`;
CREATE TABLE `b_user_session` (
  `SESSION_ID` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `SESSION_DATA` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SESSION_ID`),
  KEY `ix_user_session_time` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_stored_auth
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_stored_auth`;
CREATE TABLE `b_user_stored_auth` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `DATE_REG` datetime NOT NULL,
  `LAST_AUTH` datetime NOT NULL,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TEMP_HASH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IP_ADDR` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ux_user_hash` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user_stored_auth` VALUES
(1, 1, '2021-01-27 06:20:50', '2021-01-27 06:20:50', 'a72db6a87a666fa515f2f9fcefa065b6', 'N', 2130706433);
-- -----------------------------------
-- Dumping table b_xml_tree
-- -----------------------------------
DROP TABLE IF EXISTS `b_xml_tree`;
CREATE TABLE `b_xml_tree` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(11) DEFAULT NULL,
  `LEFT_MARGIN` int(11) DEFAULT NULL,
  `RIGHT_MARGIN` int(11) DEFAULT NULL,
  `DEPTH_LEVEL` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE` longtext COLLATE utf8_unicode_ci,
  `ATTRIBUTES` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_xml_tree_parent` (`PARENT_ID`),
  KEY `ix_b_xml_tree_left` (`LEFT_MARGIN`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_xml_tree` VALUES
(1, 0, 1, 320, 0, 'КоммерческаяИнформация', NULL, 'a:2:{s:22:\"ВерсияСхемы\";s:5:\"2.021\";s:32:\"ДатаФормирования\";s:19:\"2010-06-22T12:53:42\";}'),
(2, 1, 2, 67, 1, 'Классификатор', NULL, NULL),
(3, 2, 3, 4, 2, 'Ид', '2', NULL),
(4, 2, 5, 6, 2, 'Наименование', 'Вакансии', NULL),
(5, 2, 7, 64, 2, 'Свойства', NULL, NULL),
(6, 5, 8, 15, 3, 'Свойство', NULL, NULL),
(7, 6, 9, 10, 4, 'Ид', 'CML2_ACTIVE', NULL),
(8, 6, 11, 12, 4, 'Наименование', 'БитриксАктивность', NULL),
(9, 6, 13, 14, 4, 'Множественное', 'false', NULL),
(10, 5, 16, 23, 3, 'Свойство', NULL, NULL),
(11, 10, 17, 18, 4, 'Ид', 'CML2_CODE', NULL),
(12, 10, 19, 20, 4, 'Наименование', 'Символьный код', NULL),
(13, 10, 21, 22, 4, 'Множественное', 'false', NULL),
(14, 5, 24, 31, 3, 'Свойство', NULL, NULL),
(15, 14, 25, 26, 4, 'Ид', 'CML2_SORT', NULL),
(16, 14, 27, 28, 4, 'Наименование', 'Сортировка', NULL),
(17, 14, 29, 30, 4, 'Множественное', 'false', NULL),
(18, 5, 32, 39, 3, 'Свойство', NULL, NULL),
(19, 18, 33, 34, 4, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(20, 18, 35, 36, 4, 'Наименование', 'Начало активности', NULL),
(21, 18, 37, 38, 4, 'Множественное', 'false', NULL),
(22, 5, 40, 47, 3, 'Свойство', NULL, NULL),
(23, 22, 41, 42, 4, 'Ид', 'CML2_ACTIVE_TO', NULL),
(24, 22, 43, 44, 4, 'Наименование', 'Окончание активности', NULL),
(25, 22, 45, 46, 4, 'Множественное', 'false', NULL),
(26, 5, 48, 55, 3, 'Свойство', NULL, NULL),
(27, 26, 49, 50, 4, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(28, 26, 51, 52, 4, 'Наименование', 'Анонс', NULL),
(29, 26, 53, 54, 4, 'Множественное', 'false', NULL),
(30, 5, 56, 63, 3, 'Свойство', NULL, NULL),
(31, 30, 57, 58, 4, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(32, 30, 59, 60, 4, 'Наименование', 'Картинка анонса', NULL),
(33, 30, 61, 62, 4, 'Множественное', 'false', NULL),
(34, 2, 65, 66, 2, 'Группы', NULL, NULL),
(35, 1, 68, 319, 1, 'Каталог', NULL, NULL),
(36, 35, 69, 70, 2, 'Ид', 'furniture_vacancies', NULL),
(37, 35, 71, 72, 2, 'ИдКлассификатора', '2', NULL),
(38, 35, 73, 74, 2, 'Наименование', 'Вакансии', NULL),
(39, 35, 75, 76, 2, 'БитриксКод', 'furniture_vacancies', NULL),
(40, 35, 77, 78, 2, 'БитриксСортировка', '500', NULL),
(41, 35, 79, 80, 2, 'БитриксURLСписок', '#SITE_DIR#/company/vacancies.php', NULL),
(42, 35, 81, 82, 2, 'БитриксURLДеталь', '#SITE_DIR#/company/vacancies.php##ID#', NULL),
(43, 35, 83, 84, 2, 'БитриксURLРаздел', NULL, NULL),
(44, 35, 85, 86, 2, 'БитриксКартинка', NULL, NULL),
(45, 35, 87, 88, 2, 'БитриксИндексироватьЭлементы', 'true', NULL),
(46, 35, 89, 90, 2, 'БитриксИндексироватьРазделы', 'false', NULL),
(47, 35, 91, 92, 2, 'БитриксДокументооборот', 'false', NULL),
(48, 35, 93, 154, 2, 'БитриксПодписи', NULL, NULL),
(49, 48, 94, 99, 3, 'БитриксПодпись', NULL, NULL),
(50, 49, 95, 96, 4, 'Ид', 'ELEMENT_NAME', NULL),
(51, 49, 97, 98, 4, 'Значение', 'Вакансия', NULL),
(52, 48, 100, 105, 3, 'БитриксПодпись', NULL, NULL),
(53, 52, 101, 102, 4, 'Ид', 'ELEMENTS_NAME', NULL),
(54, 52, 103, 104, 4, 'Значение', 'Вакансии', NULL),
(55, 48, 106, 111, 3, 'БитриксПодпись', NULL, NULL),
(56, 55, 107, 108, 4, 'Ид', 'ELEMENT_ADD', NULL),
(57, 55, 109, 110, 4, 'Значение', 'Добавить вакансию', NULL),
(58, 48, 112, 117, 3, 'БитриксПодпись', NULL, NULL),
(59, 58, 113, 114, 4, 'Ид', 'ELEMENT_EDIT', NULL),
(60, 58, 115, 116, 4, 'Значение', 'Изменить вакансию', NULL),
(61, 48, 118, 123, 3, 'БитриксПодпись', NULL, NULL),
(62, 61, 119, 120, 4, 'Ид', 'ELEMENT_DELETE', NULL),
(63, 61, 121, 122, 4, 'Значение', 'Удалить вакансию', NULL),
(64, 48, 124, 129, 3, 'БитриксПодпись', NULL, NULL),
(65, 64, 125, 126, 4, 'Ид', 'SECTION_NAME', NULL),
(66, 64, 127, 128, 4, 'Значение', 'Раздел', NULL),
(67, 48, 130, 135, 3, 'БитриксПодпись', NULL, NULL),
(68, 67, 131, 132, 4, 'Ид', 'SECTIONS_NAME', NULL),
(69, 67, 133, 134, 4, 'Значение', 'Разделы', NULL),
(70, 48, 136, 141, 3, 'БитриксПодпись', NULL, NULL),
(71, 70, 137, 138, 4, 'Ид', 'SECTION_ADD', NULL),
(72, 70, 139, 140, 4, 'Значение', 'Добавить раздел', NULL),
(73, 48, 142, 147, 3, 'БитриксПодпись', NULL, NULL),
(74, 73, 143, 144, 4, 'Ид', 'SECTION_EDIT', NULL),
(75, 73, 145, 146, 4, 'Значение', 'Изменить раздел', NULL),
(76, 48, 148, 153, 3, 'БитриксПодпись', NULL, NULL),
(77, 76, 149, 150, 4, 'Ид', 'SECTION_DELETE', NULL),
(78, 76, 151, 152, 4, 'Значение', 'Удалить раздел', NULL),
(79, 35, 155, 318, 2, 'Товары', NULL, NULL),
(80, 79, 156, 209, 3, 'Товар', NULL, NULL),
(81, 80, 157, 158, 4, 'Ид', '2', NULL),
(82, 80, 159, 160, 4, 'Наименование', 'Продавец-дизайнер (кухни)', NULL),
(83, 80, 161, 162, 4, 'БитриксТеги', NULL, NULL),
(84, 80, 163, 164, 4, 'Описание', '<b>Требования</b> 						 						 \r\n<p>Уверенный пользователь ПК, навыки черчения от руки и в программах, опыт работы дизайнером/конструктором в мебельной сфере, этика делового общения</p>\r\n 						 						<b>Обязанности</b> 						 \r\n<p>Консультирование клиентов по кухонной мебели, оставление художественно-конструкторских проектов, прием и оформление заказов.</p>\r\n 						 						<b>Условия</b> 						 \r\n<p>Зарплата: 13500 оклад + % от личных продаж + премии‚ совокупный доход от 20000 руб,полный соц. пакет‚ оформление согласно ТК РФ</p>\r\n ', NULL),
(85, 80, 165, 208, 4, 'ЗначенияСвойств', NULL, NULL),
(86, 85, 166, 171, 5, 'ЗначенияСвойства', NULL, NULL),
(87, 86, 167, 168, 6, 'Ид', 'CML2_ACTIVE', NULL),
(88, 86, 169, 170, 6, 'Значение', 'true', NULL),
(89, 85, 172, 177, 5, 'ЗначенияСвойства', NULL, NULL),
(90, 89, 173, 174, 6, 'Ид', 'CML2_CODE', NULL),
(91, 89, 175, 176, 6, 'Значение', NULL, NULL),
(92, 85, 178, 183, 5, 'ЗначенияСвойства', NULL, NULL),
(93, 92, 179, 180, 6, 'Ид', 'CML2_SORT', NULL),
(94, 92, 181, 182, 6, 'Значение', '200', NULL),
(95, 85, 184, 189, 5, 'ЗначенияСвойства', NULL, NULL),
(96, 95, 185, 186, 6, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(97, 95, 187, 188, 6, 'Значение', '2010-05-01 00:00:00', NULL),
(98, 85, 190, 195, 5, 'ЗначенияСвойства', NULL, NULL),
(99, 98, 191, 192, 6, 'Ид', 'CML2_ACTIVE_TO', NULL),
(100, 98, 193, 194, 6, 'Значение', NULL, NULL),
(101, 85, 196, 201, 5, 'ЗначенияСвойства', NULL, NULL),
(102, 101, 197, 198, 6, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(103, 101, 199, 200, 6, 'Значение', NULL, NULL),
(104, 85, 202, 207, 5, 'ЗначенияСвойства', NULL, NULL),
(105, 104, 203, 204, 6, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(106, 104, 205, 206, 6, 'Значение', NULL, NULL),
(107, 79, 210, 263, 3, 'Товар', NULL, NULL),
(108, 107, 211, 212, 4, 'Ид', '3', NULL),
(109, 107, 213, 214, 4, 'Наименование', 'Директор магазина', NULL),
(110, 107, 215, 216, 4, 'БитриксТеги', NULL, NULL),
(111, 107, 217, 218, 4, 'Описание', '<b>Требования</b> 						 						 \r\n<p>Высшее образование‚ опыт руководящей работы в рознице от 3 лет‚ опытный пользователь ПК‚ этика делового общения‚ знание методов управления и заключения договоров‚ отличное знание торгового и трудового законодательств‚ ответственность‚ инициативность‚ активность.</p>\r\n 						 						<b>Обязанности</b> 						 \r\n<p>Руководство деятельностью магазина‚ организация эффективной работы персонала магазина‚ финансово-хозяйственная деятельность и отчетность‚ выполнение плана продаж‚ отчетность.</p>\r\n 						 						<b>Условия</b> 						 \r\n<p>Трудоустройство по ТК РФ‚ полный соц. пакет‚ график работы 5 чере 2 (168 час/мес)‚ зарплата: оклад 28000 + % от оборота + премии‚ совокупный доход от 35000 руб</p>\r\n ', NULL),
(112, 107, 219, 262, 4, 'ЗначенияСвойств', NULL, NULL),
(113, 112, 220, 225, 5, 'ЗначенияСвойства', NULL, NULL),
(114, 113, 221, 222, 6, 'Ид', 'CML2_ACTIVE', NULL),
(115, 113, 223, 224, 6, 'Значение', 'true', NULL),
(116, 112, 226, 231, 5, 'ЗначенияСвойства', NULL, NULL),
(117, 116, 227, 228, 6, 'Ид', 'CML2_CODE', NULL),
(118, 116, 229, 230, 6, 'Значение', NULL, NULL),
(119, 112, 232, 237, 5, 'ЗначенияСвойства', NULL, NULL),
(120, 119, 233, 234, 6, 'Ид', 'CML2_SORT', NULL),
(121, 119, 235, 236, 6, 'Значение', '300', NULL),
(122, 112, 238, 243, 5, 'ЗначенияСвойства', NULL, NULL),
(123, 122, 239, 240, 6, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(124, 122, 241, 242, 6, 'Значение', '2010-05-01 00:00:00', NULL),
(125, 112, 244, 249, 5, 'ЗначенияСвойства', NULL, NULL),
(126, 125, 245, 246, 6, 'Ид', 'CML2_ACTIVE_TO', NULL),
(127, 125, 247, 248, 6, 'Значение', NULL, NULL),
(128, 112, 250, 255, 5, 'ЗначенияСвойства', NULL, NULL),
(129, 128, 251, 252, 6, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(130, 128, 253, 254, 6, 'Значение', NULL, NULL),
(131, 112, 256, 261, 5, 'ЗначенияСвойства', NULL, NULL),
(132, 131, 257, 258, 6, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(133, 131, 259, 260, 6, 'Значение', NULL, NULL),
(134, 79, 264, 317, 3, 'Товар', NULL, NULL),
(135, 134, 265, 266, 4, 'Ид', '4', NULL),
(136, 134, 267, 268, 4, 'Наименование', 'Бухгалтер отдела учета готовой продукции', NULL),
(137, 134, 269, 270, 4, 'БитриксТеги', NULL, NULL),
(138, 134, 271, 272, 4, 'Описание', '<b>Требования</b> 						 						 \r\n<p>Жен., 22-45, уверенный пользователь ПК, опыт работы бухгалтером приветсвуется, знание бухгалтерского учета (базовый уровень), самостоятельность, ответственность, коммуникабельность, быстрая обучаемость, желание работать.</p>\r\n 						 						<b>Обязанности</b> 						 \r\n<p>Работа с первичными документами по учету МПЗ Ведение журналов-ордеров по производственным счетам Формирование материальных отчетов подразделений Исполнение дополнительных функций по указанию руководителя</p>\r\n 						 						<b>Условия</b> 						 \r\n<p>График работы 5 дней в неделю, адрес работы г. Шатура, Ботинский пр-д, 37. Зарплата: оклад 10 800 р. + премия 40% от оклада, полный соц. пакет.</p>\r\n ', NULL),
(139, 134, 273, 316, 4, 'ЗначенияСвойств', NULL, NULL),
(140, 139, 274, 279, 5, 'ЗначенияСвойства', NULL, NULL),
(141, 140, 275, 276, 6, 'Ид', 'CML2_ACTIVE', NULL),
(142, 140, 277, 278, 6, 'Значение', 'true', NULL),
(143, 139, 280, 285, 5, 'ЗначенияСвойства', NULL, NULL),
(144, 143, 281, 282, 6, 'Ид', 'CML2_CODE', NULL),
(145, 143, 283, 284, 6, 'Значение', NULL, NULL),
(146, 139, 286, 291, 5, 'ЗначенияСвойства', NULL, NULL),
(147, 146, 287, 288, 6, 'Ид', 'CML2_SORT', NULL),
(148, 146, 289, 290, 6, 'Значение', '400', NULL),
(149, 139, 292, 297, 5, 'ЗначенияСвойства', NULL, NULL),
(150, 149, 293, 294, 6, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(151, 149, 295, 296, 6, 'Значение', '2010-05-01 00:00:00', NULL),
(152, 139, 298, 303, 5, 'ЗначенияСвойства', NULL, NULL),
(153, 152, 299, 300, 6, 'Ид', 'CML2_ACTIVE_TO', NULL),
(154, 152, 301, 302, 6, 'Значение', NULL, NULL),
(155, 139, 304, 309, 5, 'ЗначенияСвойства', NULL, NULL),
(156, 155, 305, 306, 6, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(157, 155, 307, 308, 6, 'Значение', NULL, NULL),
(158, 139, 310, 315, 5, 'ЗначенияСвойства', NULL, NULL),
(159, 158, 311, 312, 6, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(160, 158, 313, 314, 6, 'Значение', NULL, NULL),
(161, 0, 30, 0, 0, '', NULL, NULL),
(162, 0, 31, 0, 0, '', NULL, NULL),
(163, 0, 32, 0, 0, '', NULL, NULL);
-- Finished: 2021-01-28 11:28:36