create schema if not exists toughradius collate utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS toughradius@'172.%.%.%' identified by 'Bss!2020';
GRANT ALL PRIVILEGES ON toughradius.* TO toughradius@'172.%.%.%';
ALTER USER 'toughradius'@'172.%.%.%' IDENTIFIED WITH mysql_native_password BY 'Tough!2020';


-- MySQL dump 10.13  Distrib 8.0.18, for osx10.15 (x86_64)
--
-- Host: localhost    Database: toughradius
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `toughradius`
--

USE `toughradius`;

--
-- Table structure for table `bss_channel`
--

DROP TABLE IF EXISTS `bss_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bss_channel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `webhook` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_notify` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `sms_notify` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bss_channel`
--

/*!40000 ALTER TABLE `bss_channel` DISABLE KEYS */;
INSERT INTO `bss_channel` (`id`, `name`, `contact`, `mobile`, `email`, `webhook`, `remark`, `email_notify`, `sms_notify`, `create_time`, `update_time`) VALUES (1,'default','system','N/A','N/A','N/A','N/A','disabled','disabled','2020-10-10 00:00:00','2020-10-10 00:00:00');
/*!40000 ALTER TABLE `bss_channel` ENABLE KEYS */;

--
-- Table structure for table `bss_config`
--

DROP TABLE IF EXISTS `bss_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bss_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1319939508602736641 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bss_config`
--

/*!40000 ALTER TABLE `bss_config` DISABLE KEYS */;
INSERT INTO `bss_config` (`id`, `type`, `name`, `value`, `remark`) VALUES (1,'system','SystemTimeZone','Asia/Shanghai','TimeZone'),(2,'system','SystemLang','zh_CN','System Lang'),(3,'system','System Theme','dark','System Theme'),(4,'system','SystemDevMode','enabled','Develop Mode'),(5,'system','SystemOprMfaStatus','disabled','Operator Login Enable Mfa'),(6,'system','SystemPortalTitle','ToughRADIUS Authentication system','System Portal Title'),(7,'system','SystemTitle','ToughRADIUS Authentication system','System Title'),(8,'system','SystemNavMainTitle','ToughRADIUS Authentication system','Nav Main title'),(9,'system','SystemNavSecondTitle','Build: latest-20201011222523','Nav Second Title'),(10,'system','SystemLoginSubtitle','AAA Authentication system','Login Page sub title'),(11,'system','SystemLoginRemark','Recommended:   Chrome/Edge','Login Page remark'),(12,'system','SystemSidebarTitle','Enterprise Edition','System Sidebar Title'),(13,'system','SystemBaseUrl','http://www.toughradius.net','System url'),(14,'system','SystemDashboardWidth','5','SystemDashboardWidth'),(15,'system','SystemDashboardHeight','10','SystemDashboardHeight'),(16,'system','SystemApiAccess','enabled','SystemApiAccess'),(17,'system','SystemApiTokenTimes','60','SystemApiTokenTimes'),(18,'ui','UiLoginLogo','/static/default/login-logo.png','Login Page logo'),(19,'ui','UiLoginBg','/static/default/login-bg.jpg','Login Page bg image'),(20,'ui','UiToggleLogo','/static/default/toggle.png','Manage Page toggle'),(21,'ui','UiNavLogo','/static/default/nav-logo.png','Manage Page nav logo'),(22,'ui','UiNavBg','/static/default/nav-bg.png','Manage Page nav bg image'),(23,'qcloudsms','QcloudSmsAppid','N/A','Qcloud sms Appid'),(24,'qcloudsms','QcloudSmsSecretid','N/A','Qcloud sms SecretId'),(25,'qcloudsms','QcloudSmsSecretkey','N/A','Qcloud sms SecretKey'),(26,'qcloudsms','QcloudSmsSign','N/A','Qcloud sms sign'),(27,'qcloudsms','QcloudSmsVcodeTpl','N/A','Qcloud sms vcode template'),(28,'radius','AcctInterimInterval','120','AcctInterimInterval'),(29,'radius','RadiuslogHistoryDays','180','RadiuslogHistoryDays'),(30,'radius','RadiusIgnorePwd','disabled','RadiusIgnorePwd'),(31,'radius','RadiusMfaStatus','disabled','Enable Mfa validation'),(32,'radius','RadiusRejectDelay','0','RadiusRejectDelay Seconds'),(33,'radius','RadiusAuthlogLevel','failure','RadiusAuthlogLevel'),(34,'portal','PortalGuestUser','guest:guest2015','PortalGuestUser'),(35,'portal','PortalFixpwdUser','fixuser','PortalFixpwdUser'),(36,'portal','PortalAuthlogLevel','all','PortalAuthlogLevel'),(37,'portal','PortalConnTimeout','4','PortalConnTimeout'),(38,'portal','PortalHeartbeat','enabled','PortalHeartbeat'),(39,'portal','PortalIndexUrl','http://127.0.0.1:1817','PortalIndexUrl'),(40,'portal','PortalParamAcName','wlanacname','PortalParamAcName'),(41,'portal','PortalParamAcIp','wlanacip','PortalParamAcIp'),(42,'portal','PortalParamUserIp','wlanuserip','PortalParamUserIp'),(43,'portal','PortalParamUserMac','wlanusermac','PortalParamUserMac'),(44,'portal','PortalParamSSID','ssid','PortalParamSSID'),(45,'portal','PortalParamApMac','wlanapmac','PortalParamApMac'),(46,'portal','PortalParamApIp','wlanapip','PortalParamApIp'),(47,'portal','PortalParamUsername','wlanusername','PortalParamUsername'),(48,'portal','PortalParamUserFirstUrl','wlanuserfirsturl','PortalParamUserFirstUrl'),(1319679635583471616,'system','SystemLicense','IjsOODMMIcFBQ-WEfTPbHI9_gclUK_CtAlF2xSoOLSvymkQuyFUHEaifFN1sm84bg_GiZ9XV5k0MDGS_D-QTvT_09FNxwJiocJbqiBhrfkk95O5ULCVcGrht9mCozJ1AAIbjB4FPsjW8k7tb1nonn33mLlitCJltODn0t9jrsGbSfN-hhZIggiLmGe47sb83lr3gabhxjjNdl4__yixOWYhaO9JbZOnDr0VP6vmc_VNVbm7YBbgJrq7CG8QSVAzCY1jYH27BMormslDt78FwvAVsb6DE1a29gQ-gkVzfz7cY1FrfJGpV2s4obIkOyywdxWw_uyrc5KKITGZOinPBrSK6nyem-o7_arLokPPTChAjr8Ww6nHps-MDtV3fWooLZqoxz5jkZ1Xq0SJ9NRPc4ztJOiqoC7Ve7Mp5xzpzqL5bVLIOdWh56Nw7f2F5PntF0vrjey5LuryZ-aeKVmJQ1r8KcKQMDnJI0rWFaQ8nyqWZPVge_2tIPJKSrVjCIyz84JzaEZmh6U4LFCGAATcqNrZi5J-ByblORTOeVJ8LJ5Yg7COpnJYKpljG7ov1rFp2WUgLop5RQX18dR-_uiRoZoxW3Sl41JuR6wUoihXYaI6Z5yamguI3yLmpUCiaSPM9ZOUtZXCLunzCU3YHRu6LoPc7zKwqAgf1Yo3oVaL0QXw','SystemLicense'),(1319939508602736640,'system','SystemTheme','light','SystemTheme');
/*!40000 ALTER TABLE `bss_config` ENABLE KEYS */;

--
-- Table structure for table `bss_dashboard`
--

DROP TABLE IF EXISTS `bss_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bss_dashboard` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `skey` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bss_dashboard`
--

/*!40000 ALTER TABLE `bss_dashboard` DISABLE KEYS */;
INSERT INTO `bss_dashboard` (`id`, `skey`, `tags`, `title`, `content`) VALUES (1,'dashboard-state-default','N/A','N/A','[\n  {\"id\": \"user_total:1599202297036\", \"name\": \"user_total\", \"x\": 2, \"y\": 0, \"dx\": 1, \"dy\": 2},\n  {\"id\": \"user_expire:1599202297045\", \"name\": \"user_expire\", \"x\": 5, \"y\": 0, \"dx\": 0, \"dy\": 2},\n  {\"id\": \"user_disabled:1599202297053\", \"name\": \"user_disabled\", \"x\": 3, \"y\": 0, \"dx\": 1, \"dy\": 2},\n  {\"id\": \"profile_count:1599202297061\", \"name\": \"profile_count\", \"x\": 2, \"y\": 2, \"dx\": 1, \"dy\": 2},\n  {\"id\": \"nas_count:1599202297069\", \"name\": \"nas_count\", \"x\": 3, \"y\": 2, \"dx\": 1, \"dy\": 2},\n  {\"id\": \"ldap_count:1599202297077\", \"name\": \"ldap_count\", \"x\": 5, \"y\": 2, \"dx\": 0, \"dy\": 2},\n  {\"id\": \"system_memuse:1599202348621\", \"name\": \"system_memuse\", \"x\": 0, \"y\": 0, \"dx\": 2, \"dy\": 2},\n  {\"id\": \"system_cpuuse:1599202348633\", \"name\": \"system_cpuuse\", \"x\": 0, \"y\": 2, \"dx\": 2, \"dy\": 2},\n  {\"id\": \"user_expire:1599202577374\", \"name\": \"user_expire\", \"x\": 4, \"y\": 0, \"dx\": 1, \"dy\": 2},\n  {\"id\": \"ldap_count:1599202577392\", \"name\": \"ldap_count\", \"x\": 4, \"y\": 2, \"dx\": 1, \"dy\": 2}\n]');
/*!40000 ALTER TABLE `bss_dashboard` ENABLE KEYS */;

--
-- Table structure for table `bss_menu_node`
--

DROP TABLE IF EXISTS `bss_menu_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bss_menu_node` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL,
  `module` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cmodule` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('menu','perm') COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `docsn` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `levels` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `hidden` enum('y','n') COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3009903 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bss_menu_node`
--

/*!40000 ALTER TABLE `bss_menu_node` DISABLE KEYS */;
INSERT INTO `bss_menu_node` (`id`, `parent_id`, `module`, `cmodule`, `name`, `type`, `icon`, `docsn`, `levels`, `sort`, `hidden`, `url`) VALUES (105,NULL,'menunode_monitor','N/A','Monitor Center','menu','view-dashboard','','all',100,'n',''),(107,NULL,'menunode_network','N/A','Network Management','menu','network','','all',200,'n',''),(108,NULL,'menunode_portal','N/A','Portal Management','menu','server','','all',300,'n',''),(300,NULL,'menunode_opt','N/A','system maintenance','menu','cogs','','master',600,'n',''),(10503,105,'online','N/A','Radius Onlines','menu','account','','master,opr,chl',101,'n',''),(10504,105,'radiuslog','N/A','Radius Accounting','menu','file-outline','','master,opr,chl',104,'n',''),(10505,105,'authlog','N/A','Authentication logs','menu','file-outline','','master,opr,chl',105,'n',''),(10700,107,'radius_config','N/A','Radius Settings','menu','cogs','','master',201,'n',''),(10701,107,'vpe','N/A','Nas Devices','menu','switch','','master',202,'n',''),(10703,107,'profile','N/A','Radius Profile','menu','apps','','all',208,'n',''),(10704,107,'subscribe','N/A','Subscribe','menu','account','','all',214,'n',''),(10705,107,'ldap','N/A','Ldap Nodes','menu','switch','','master',220,'n',''),(10706,107,'blacklist','N/A','Blacklist','menu','security-network','','master',226,'n',''),(10801,108,'portal_config','N/A','Portal Settings','menu','cogs','','master',301,'n',''),(10805,108,'portal_profile','N/A','Portal Profile','menu','earth','','master',302,'n',''),(10806,108,'portal_place','N/A','Portal Place','menu','store','','all',302,'n',''),(30001,300,'node','N/A','Node','menu','shape','','master',500,'n',''),(30002,300,'channel','N/A','Channel','menu','link','','master',501,'n',''),(30003,300,'perms','N/A','Permissions','menu','menu','','master',601,'n',''),(30004,300,'uiconfig','N/A','Ui Settings','menu','cogs','','master',602,'n',''),(30005,300,'notify_config','N/A','Notify Settings','menu','bell','','master',603,'n',''),(30006,300,'config','N/A','System Settings','menu','cogs','','master',604,'n',''),(30007,300,'widget','N/A','Widgets','menu','apps','','master',605,'n',''),(30008,300,'tag','N/A','Tags','menu','tag','','master',606,'n',''),(30009,300,'oprlog','N/A','Operational audits','menu','file-outline','','master',607,'n',''),(30010,300,'opr','N/A','Operator','menu','account','','master',608,'n',''),(30011,300,'translate','N/A','Translate','menu','account','','master',609,'n',''),(30099,300,'filemanager','N/A','File Manage','menu','file-document','','master',610,'n',''),(1050301,10503,'online_disconnect','N/A','Online Disconnect','perm','arrow-right-drop-circle-outline','','master,opr,chl',102,'n',''),(1050302,10503,'online_clear','N/A','Online Clear','perm','arrow-right-drop-circle-outline','','master',103,'n',''),(1050501,10505,'authlog_clear','N/A','Authlog Clear','perm','arrow-right-drop-circle-outline','','master',106,'n',''),(1070101,10701,'vpe_create','N/A','Nas Create','perm','arrow-right-drop-circle-outline','','master',203,'n',''),(1070102,10701,'vpe_modify','N/A','Nas Modify','perm','arrow-right-drop-circle-outline','','master',204,'n',''),(1070103,10701,'vpe_delete','N/A','Nas Delete','perm','arrow-right-drop-circle-outline','','master',205,'n',''),(1070104,10701,'vpe_import','N/A','Nas Import','perm','arrow-right-drop-circle-outline','','master',206,'n',''),(1070105,10701,'vpe_export','N/A','Nas Export','perm','arrow-right-drop-circle-outline','','master',207,'n',''),(1070301,10703,'profile_create','N/A','Profile Create','perm','arrow-right-drop-circle-outline','','master',209,'n',''),(1070302,10703,'profile_modify','N/A','Profile Modify','perm','arrow-right-drop-circle-outline','','master',210,'n',''),(1070303,10703,'profile_delete','N/A','Profile Delete','perm','arrow-right-drop-circle-outline','','master',211,'n',''),(1070304,10703,'profile_import','N/A','Profile Import','perm','arrow-right-drop-circle-outline','','master',212,'n',''),(1070305,10703,'profile_export','N/A','Profile Export','perm','arrow-right-drop-circle-outline','','master',213,'n',''),(1070401,10704,'subscribe_create','N/A','Subscribe Create','perm','arrow-right-drop-circle-outline','','all',215,'n',''),(1070402,10704,'subscribe_copy','N/A','Subscribe Copy','perm','arrow-right-drop-circle-outline','','master',216,'n',''),(1070403,10704,'subscribe_modify','N/A','Subscribe Modify','perm','arrow-right-drop-circle-outline','','all',216,'n',''),(1070404,10704,'subscribe_profile_modify','N/A','Subscribe Profile Modify','perm','arrow-right-drop-circle-outline','','master',217,'n',''),(1070405,10704,'subscribe_delete','N/A','Subscribe Delete','perm','arrow-right-drop-circle-outline','','master',217,'n',''),(1070406,10704,'subscribe_import','N/A','Subscribe Import','perm','arrow-right-drop-circle-outline','','master',218,'n',''),(1070407,10704,'subscribe_export','N/A','Subscribe Export','perm','arrow-right-drop-circle-outline','','master',219,'n',''),(1080501,10805,'pprofile_create','N/A','Portal Profile Create','perm','arrow-right-drop-circle-outline','','master',303,'n',''),(1080502,10805,'pprofile_modify','N/A','Portal Profile Modify','perm','arrow-right-drop-circle-outline','','master',304,'n',''),(1080503,10805,'pprofile_delete','N/A','Portal Profile Delete','perm','arrow-right-drop-circle-outline','','master',305,'n',''),(1080504,10805,'pprofile_import','N/A','Portal Profile Import','perm','arrow-right-drop-circle-outline','','master',306,'n',''),(1080505,10805,'pprofile_export','N/A','Portal Profile Export','perm','arrow-right-drop-circle-outline','','master',307,'n',''),(1080601,10806,'place_create','N/A','Place Create','perm','arrow-right-drop-circle-outline','','master,chl,opr',303,'n',''),(1080602,10806,'place_modify','N/A','Place Modify','perm','arrow-right-drop-circle-outline','','master,chl,opr',304,'n',''),(1080603,10806,'place_delete','N/A','Place Delete','perm','arrow-right-drop-circle-outline','','master,chl,opr',305,'n',''),(1080604,10806,'place_import','N/A','Place Import','perm','arrow-right-drop-circle-outline','','master,chl,opr',306,'n',''),(1080605,10806,'place_export','N/A','Place Export','perm','arrow-right-drop-circle-outline','','master,chl,opr',307,'n',''),(3009901,30099,'filemanager_write','N/A','File Write','perm','arrow-right-drop-circle-outline','','master',611,'n',''),(3009902,30099,'filemanager_delete','N/A','File Delete','perm','arrow-right-drop-circle-outline','','master',612,'n','');
/*!40000 ALTER TABLE `bss_menu_node` ENABLE KEYS */;

--
-- Table structure for table `bss_metrics`
--

DROP TABLE IF EXISTS `bss_metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bss_metrics` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tags` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `skey` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100009 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bss_metrics`
--

/*!40000 ALTER TABLE `bss_metrics` DISABLE KEYS */;
INSERT INTO `bss_metrics` (`id`, `tags`, `skey`, `name`, `icon`, `value`, `update_time`) VALUES (100000,'Monitor','system_memuse','Memary Use','mdi mdi-gauge','63.00%','2020-09-01 00:00:00'),(100001,'Monitor','system_cpuuse','CPU Use','mdi mdi-gauge','0.00%','2020-09-01 00:00:00'),(100002,'Monitor','user_total','Normal User','mdi mdi-gauge','3','2020-09-01 00:00:00'),(100003,'Monitor','user_expire','Expire User','mdi mdi-gauge','0','2020-09-01 00:00:00'),(100004,'Monitor','user_disabled','Disabled User','mdi mdi-gauge','0','2020-09-01 00:00:00'),(100005,'Monitor','radius_online','Online User','mdi mdi-gauge','0','2020-09-01 00:00:00'),(100006,'Monitor','profile_count','Profile Count','mdi mdi-gauge','1','2020-09-01 00:00:00'),(100007,'Monitor','nas_count','NAS Count','mdi mdi-gauge','1','2020-09-01 00:00:00'),(100008,'Monitor','ldap_count','Ldap Nodes','mdi mdi-gauge','2','2020-09-01 00:00:00');
/*!40000 ALTER TABLE `bss_metrics` ENABLE KEYS */;

--
-- Table structure for table `bss_module`
--

DROP TABLE IF EXISTS `bss_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bss_module` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_route` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `index_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `index_script` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bss_module`
--

/*!40000 ALTER TABLE `bss_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `bss_module` ENABLE KEYS */;

--
-- Table structure for table `bss_nav_action`
--

DROP TABLE IF EXISTS `bss_nav_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bss_nav_action` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `icon` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bss_nav_action`
--

/*!40000 ALTER TABLE `bss_nav_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `bss_nav_action` ENABLE KEYS */;

--
-- Table structure for table `bss_node`
--

DROP TABLE IF EXISTS `bss_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bss_node` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bss_node`
--

/*!40000 ALTER TABLE `bss_node` DISABLE KEYS */;
INSERT INTO `bss_node` (`id`, `name`, `remark`, `create_time`, `update_time`) VALUES (1,'default','default node','2020-10-10 00:00:00','2020-10-10 00:00:00');
/*!40000 ALTER TABLE `bss_node` ENABLE KEYS */;

--
-- Table structure for table `bss_opr`
--

DROP TABLE IF EXISTS `bss_opr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bss_opr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `head` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `channels` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `realname` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_secret` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mfa_secret` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bss_opr`
--

/*!40000 ALTER TABLE `bss_opr` DISABLE KEYS */;
INSERT INTO `bss_opr` (`id`, `head`, `channels`, `realname`, `mobile`, `email`, `username`, `password`, `api_secret`, `mfa_secret`, `level`, `status`, `remark`, `last_login`, `create_time`) VALUES (1,'','1','System super admin','','N/A','super','6b60fe1feda26aeac49742b97e14aa46d70441a022ed8377ebd7a554fe735835','N/A','N/A','super','enabled','','2020-10-24 17:51:07','2020-10-24 00:38:31'),(2,'','1','Admin','','N/A','admin','4813494d137e1631bba301d5acab6e7bb7aa74ce1185d456565ef51d737677b2','N/A','N/A','master','enabled','',NULL,'2020-10-24 00:38:31'),(3,'','1','Service operator','','N/A','opr','4813494d137e1631bba301d5acab6e7bb7aa74ce1185d456565ef51d737677b2','N/A','N/A','opr','enabled','',NULL,'2020-10-24 00:38:31'),(4,'','1','channel operator','','N/A','chl','4813494d137e1631bba301d5acab6e7bb7aa74ce1185d456565ef51d737677b2','N/A','N/A','chl','enabled','',NULL,'2020-10-24 00:38:31');
/*!40000 ALTER TABLE `bss_opr` ENABLE KEYS */;

--
-- Table structure for table `bss_opr_log`
--

DROP TABLE IF EXISTS `bss_opr_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bss_opr_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `opr_id` bigint(20) NOT NULL,
  `opr_name` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opr_ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opt_action` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opt_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `opt_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1319941948953661441 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bss_opr_log`
--

/*!40000 ALTER TABLE `bss_opr_log` DISABLE KEYS */;
INSERT INTO `bss_opr_log` (`id`, `opr_id`, `opr_name`, `opr_ip`, `opt_action`, `opt_desc`, `opt_time`) VALUES (1319939508640485376,1,'super','127.0.0.1','/bss/config/update','Update System Settings map[System Theme:[dark] SystemApiAccess:[enabled] SystemApiTokenTimes:[60] SystemBaseUrl:[http://www.toughradius.net] SystemDashboardHeight:[10] SystemDashboardWidth:[5] SystemDevMode:[enabled] SystemLang:[en_US] SystemLicense:[IjsOODMMIcFBQ-WEfTPbHI9_gclUK_CtAlF2xSoOLSvymkQuyFUHEaifFN1sm84bg_GiZ9XV5k0MDGS_D-QTvT_09FNxwJiocJbqiBhrfkk95O5ULCVcGrht9mCozJ1AAIbjB4FPsjW8k7tb1nonn33mLlitCJltODn0t9jrsGbSfN-hhZIggiLmGe47sb83lr3gabhxjjNdl4__yixOWYhaO9JbZOnDr0VP6vmc_VNVbm7YBbgJrq7CG8QSVAzCY1jYH27BMormslDt78FwvAVsb6DE1a29gQ-gkVzfz7cY1FrfJGpV2s4obIkOyywdxWw_uyrc5KKITGZOinPBrSK6nyem-o7_arLokPPTChAjr8Ww6nHps-MDtV3fWooLZqoxz5jkZ1Xq0SJ9NRPc4ztJOiqoC7Ve7Mp5xzpzqL5bVLIOdWh56Nw7f2F5PntF0vrjey5LuryZ-aeKVmJQ1r8KcKQMDnJI0rWFaQ8nyqWZPVge_2tIPJKSrVjCIyz84JzaEZmh6U4LFCGAATcqNrZi5J-ByblORTOeVJ8LJ5Yg7COpnJYKpljG7ov1rFp2WUgLop5RQX18dR-_uiRoZoxW3Sl41JuR6wUoihXYaI6Z5yamguI3yLmpUCiaSPM9ZOUtZXCLunzCU3YHRu6LoPc7zKwqAgf1Yo3oVaL0QXw] SystemLoginRemark:[Recommended:   Chrome/Edge] SystemLoginSubtitle:[AAA Authentication system] SystemNavMainTitle:[ToughRADIUS Authentication system] SystemNavSecondTitle:[Build: latest-20201011222523] SystemOprMfaStatus:[disabled] SystemPortalTitle:[ToughRADIUS Authentication system] SystemSidebarTitle:[Enterprise Edition] SystemTheme:[light] SystemTimeZone:[Asia/Shanghai] SystemTitle:[ToughRADIUS Authentication system] ctype:[system]]','2020-10-24 17:51:19'),(1319939558624006144,1,'super','127.0.0.1','/bss/config/update','Update System Settings map[System Theme:[dark] SystemApiAccess:[enabled] SystemApiTokenTimes:[60] SystemBaseUrl:[http://www.toughradius.net] SystemDashboardHeight:[10] SystemDashboardWidth:[5] SystemDevMode:[enabled] SystemLang:[zh_CN] SystemLicense:[IjsOODMMIcFBQ-WEfTPbHI9_gclUK_CtAlF2xSoOLSvymkQuyFUHEaifFN1sm84bg_GiZ9XV5k0MDGS_D-QTvT_09FNxwJiocJbqiBhrfkk95O5ULCVcGrht9mCozJ1AAIbjB4FPsjW8k7tb1nonn33mLlitCJltODn0t9jrsGbSfN-hhZIggiLmGe47sb83lr3gabhxjjNdl4__yixOWYhaO9JbZOnDr0VP6vmc_VNVbm7YBbgJrq7CG8QSVAzCY1jYH27BMormslDt78FwvAVsb6DE1a29gQ-gkVzfz7cY1FrfJGpV2s4obIkOyywdxWw_uyrc5KKITGZOinPBrSK6nyem-o7_arLokPPTChAjr8Ww6nHps-MDtV3fWooLZqoxz5jkZ1Xq0SJ9NRPc4ztJOiqoC7Ve7Mp5xzpzqL5bVLIOdWh56Nw7f2F5PntF0vrjey5LuryZ-aeKVmJQ1r8KcKQMDnJI0rWFaQ8nyqWZPVge_2tIPJKSrVjCIyz84JzaEZmh6U4LFCGAATcqNrZi5J-ByblORTOeVJ8LJ5Yg7COpnJYKpljG7ov1rFp2WUgLop5RQX18dR-_uiRoZoxW3Sl41JuR6wUoihXYaI6Z5yamguI3yLmpUCiaSPM9ZOUtZXCLunzCU3YHRu6LoPc7zKwqAgf1Yo3oVaL0QXw] SystemLoginRemark:[Recommended:   Chrome/Edge] SystemLoginSubtitle:[AAA Authentication system] SystemNavMainTitle:[ToughRADIUS Authentication system] SystemNavSecondTitle:[Build: latest-20201011222523] SystemOprMfaStatus:[disabled] SystemPortalTitle:[ToughRADIUS Authentication system] SystemSidebarTitle:[Enterprise Edition] SystemTheme:[light] SystemTimeZone:[Asia/Shanghai] SystemTitle:[ToughRADIUS Authentication system] ctype:[system]]','2020-10-24 17:51:31'),(1319941948953661440,1,'super','127.0.0.1','/bss/config/update','Update System Settings map[PortalAuthlogLevel:[all] PortalConnTimeout:[4] PortalFixpwdUser:[fixuser] PortalGuestUser:[guest:guest2015] PortalHeartbeat:[enabled] PortalIndexUrl:[http://127.0.0.1:1817] PortalParamAcIp:[wlanacip] PortalParamAcName:[wlanacname] PortalParamApIp:[wlanapip] PortalParamApMac:[wlanapmac] PortalParamSSID:[ssid] PortalParamUserFirstUrl:[wlanuserfirsturl] PortalParamUserIp:[wlanuserip] PortalParamUserMac:[wlanusermac] PortalParamUsername:[wlanusername] ctype:[portal]]','2020-10-24 18:01:01');
/*!40000 ALTER TABLE `bss_opr_log` ENABLE KEYS */;

--
-- Table structure for table `bss_tag`
--

DROP TABLE IF EXISTS `bss_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bss_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category` enum('event','ticket','service','assets','network','knowledge','system') COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bss_tag`
--

/*!40000 ALTER TABLE `bss_tag` DISABLE KEYS */;
INSERT INTO `bss_tag` (`id`, `category`, `name`, `alias`, `owner`, `remark`, `create_time`, `update_time`) VALUES (1,'system','N/A','default','admin','N/A','2020-10-24 00:38:31','2020-10-24 00:38:31'),(2,'system','Monitor','default','admin','N/A','2020-10-24 00:38:31','2020-10-24 00:38:31');
/*!40000 ALTER TABLE `bss_tag` ENABLE KEYS */;

--
-- Table structure for table `bss_trans`
--

DROP TABLE IF EXISTS `bss_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bss_trans` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zh_cn` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `en_us` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ver` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ver` (`ver`)
) ENGINE=InnoDB AUTO_INCREMENT=1319942469202546689 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bss_trans`
--

/*!40000 ALTER TABLE `bss_trans` DISABLE KEYS */;
INSERT INTO `bss_trans` (`id`, `module`, `name`, `zh_cn`, `en_us`, `ver`) VALUES (1315309475728789504,'global','No data loaded','没有数据加载','No data loaded','a7b64097b62405d4197b1252df1bd3df0aca3347'),(1315309475728789505,'global','Operation Success','操作成功','Operation Success','50756ce1e5e64fc369c1e3d09d3e09543564fd18'),(1315309475728789506,'global','Upload...','上传...','Upload...','187c5ff365fc3d77e72e1e6e6e100e08df5515e9'),(1315309475732983808,'global','Operation confirmation','操作确认','Operation confirmation','7a9ed2761543b7bf4a1c97bece50b75e3d07be44'),(1315309475732983809,'global','Confirm to delete? This operation is irreversible.','确认删除？这个操作是不可逆的。','Confirm to delete? This operation is irreversible.','c2b7aa0c118310751e90c976f2cd1c19ac6f47a1'),(1315309475732983810,'translate','Module','模块','Module','7418ef71b04316bc80d71c80ae51a712215bf68d'),(1315309475732983811,'translate','Source','源','Source','9293c5a926a4e4e8b9751a5fb6b797eec84ee4d3'),(1315309475732983812,'translate','zh_CN','zh_CN','zh_CN','fc966f3d2d4850107b993e715301b2a7f84b58bf'),(1315309475732983813,'translate','en_US','en_US','en_US','63e4241b5404ff7f88908ead8309e76675df303c'),(1315309475732983814,'menus','Monitor Center','监控中心','Monitor Center','f2417a8b4df395b2de196e452bc6bb2ae1a17b1c'),(1315309475732983815,'menus','Onlines','在线管理','Onlines','60ceaea6b2b59163453546df9837e8d54eb9cda1'),(1315309475732983816,'menus','Radius Logging','上网日志','Radius Logging','fc761b105a2b124af74486648617b77e231ee882'),(1315309475732983817,'menus','Authlog','认证日志','Authlog','fdbf69f78436cac70a9cbb1ad94ea7bef76ed349'),(1315309475732983818,'menus','Network Manage','网络管理','Network Manage','acfc50b03947cfbf914cd751a637a68e5aa2e22e'),(1315309475737178112,'menus','Radius Settings','RADIUS 设置','Radius Settings','394b223faedd8b6fb52b414e0e0de9d66f54c110'),(1315309475737178113,'menus','Nas Devices','NAS 管理','Nas Devices','7b42b9983231f1810a7455d830858e2fe776082b'),(1315309475737178114,'menus','Radius Profile','RADIUS 策略','Radius Profile','c596baa14a1605c479e5c7bf3e7f617b6f5a2016'),(1315309475737178115,'menus','Subscribe','用户管理','Subscribe','e98f565b98c866bc845337dc9da57cf49bd9170a'),(1315309475737178116,'menus','Ldap Nodes','Ldap 节点','Ldap Nodes','162a9a57f4b9498759bcbc8c195e3cbcf763d346'),(1315309475737178117,'menus','Report Center','报表中心','Report Center','a5a833d3ede786fbe56ebcb4b471cd4fea092890'),(1315309475737178118,'menus','Accounting Report','上网统计','Accounting Report','6a4fef74c4cdd007d300dec327108eca62e21ee1'),(1315309475737178119,'menus','system maintenance','系统维护','system maintenance','7bccca1b7b032962ddd5737630cb5c24ec229ebf'),(1315309475737178120,'menus','Permissions','权限管理','Permissions','11f72200649feb824a27ea6c6e0c1519d7478862'),(1315309475737178121,'menus','Ui Settings','Ui 设置','Ui Settings','112065dd9184d74ea32ea3c3c1dabe22eadc5b52'),(1315309475741372416,'menus','System Settings','系统设置','System Settings','7946aeb90199d6931fc259286213d0e3c707b9fe'),(1315309475741372417,'menus','Tags','标签','Tags','e646a8eed88d979c63ef4b9ba87860250a1c2bc5'),(1315309475741372418,'menus','Operational audits','操作日志','Operational audits','f98f719089fda240d8a18c0e8e3f79e137c33e95'),(1315309475741372419,'menus','Operator','操作员','Operator','3b6af901b1209ebf2967053786d75abfad89e238'),(1315309475741372420,'menus','Translate','翻译管理','Translate','0e496d1924a2573c63d9103e59e3e15a7cb82398'),(1315309475741372421,'menus','File Manage','文件管理','File Manage','42d711600edc98649531edaef0b085a22ec4bcd2'),(1315309475741372422,'global','Enabled','启用','Enabled','5dd42d28f162da91c100f8e653be450c46efd92e'),(1315309475741372423,'global','Disabled','停用','Disabled','d289d319f583817e1122d6f826ff6b797400ae96'),(1315309475741372424,'global','Help','帮助','Help','81ed24a489e8f05200f2c3206ff022b3e55ae472'),(1315309475741372425,'global','Lock','锁定','Lock','9e408450449571afaf76455a78acd10d908e5486'),(1315309475741372426,'global','Edit','编辑','Edit','5ac5475e57c6ec9ce739eb4614e3d275c26f35e8'),(1315309475741372427,'global','Dashboard','仪表盘','Dashboard','afa97b3df61007b2ce5f2ca6905a305d4639acb9'),(1315309475745566720,'global','Widget List','Widget 列表','Widget List','80abf487d5f45f1885c148fdfed560306ed6cd04'),(1315309475745566721,'glabal','My Profile','帐号设置','My Profile','6833d996b9b2d279b53c1a36bb1750318fc951d2'),(1315309475745566722,'opr','MFA Bind','MFA 绑定','MFA Bind','be6c3e754da983b16de895ed8016898efac38463'),(1315309475745566723,'opr','Operator Detail','帐号详情','Operator Detail','6010aa15eb266e28a02c2830e00cba7386502fd2'),(1315309475745566724,'global','Change Password','修改密码','Change Password','6867051e907041276592d36261295de592afb23e'),(1315309475745566725,'global','Logout','登出系统','Logout','83e311fe288f376effdd96fc7db832acd50aa2a7'),(1315309475745566726,'global','Name','名称','Name','3124ae168753aad9cb98d309d6b0e469c7cc4247'),(1315309475745566727,'global','Phone Number','电话','Phone Number','e1ef23f036ec4347ae411d9792fda5aac9723366'),(1315309475745566728,'global','Email','电子邮箱','Email','7efba6182437f8127cf8627d73ea906eed43611d'),(1315309475745566729,'api','Api Documents','Api 文档','Api Documents','33455772528cfea0f13515d71b07c56d30f13d63'),(1315309475745566730,'api','Api Tester','Api 测试','Api Tester','e5dff0bbb0f0d0674978f3e331e4702764878ecb'),(1315309475745566731,'global','Import','导入','Import','c10eb9cf43d09c124b179748bf255036b4466512'),(1315309475749761024,'global','Save','保存','Save','4d572b177036a3dbf1fc78c0d50e68841b97c57e'),(1315309475749761025,'config','Language','语言','Language','3d873843dc0cc3c41aa93b5c9f41da8f7cb8bdaf'),(1315309475749761026,'global','Refresh','刷新','Refresh','399650fc56de5992a734fa337e958555fd9aa30b'),(1315309475749761027,'global','Export','导出','Export','58a3c3e54b6cac20f0aed7b18a263c18b9a34018'),(1315309475749761028,'config','System language','系统语言','System language','8851916350151dee53d2fb6834f1740401cc9c66'),(1315309475749761029,'global','Operator Login Enable Mfa','操作员登录启用多因子MFA认证','Operator Login Enable Mfa','febb60e8c06266e3f3a23b542cf8133290ce17f8'),(1315309475749761030,'config','Develop Mode','开发模式','Develop Mode','d7e6c8f918358adb61121498ad8e2ca1e9b5713a'),(1315309475749761031,'radius_config','FreeOPT and Google Authenticator support','FreeOPT和Google Authenticator支持','FreeOPT and Google Authenticator support','f46917d6d03d24e9796511825f619813c6f55319'),(1315309475749761032,'config','When development mode is enabled, page caching can be avoided, and the system can be used after upgrading.','启用开发模式后，可以避免页面缓存，并且可以在升级后使用系统。','When development mode is enabled, page caching can be avoided, and the system can be used after upgrading.','a8069401661dba5093c3378ee5f05fbd499ac605'),(1315309475753955328,'config','Enable APi Access','启用API','Enable APi Access','828f14ada5f084e5bde8f42e1f84c027ed469ce9'),(1315309475753955329,'config','Enabling API Features','启用API功能','Enabling API Features','c72aa35c75f3cb3b9673d439d496ca57e60dd578'),(1315309475753955330,'config','Api Token Maximum duration  (minutes)','Api Token 最大存活时间-分钟','Api Token Maximum duration  (minutes)','b43c9e47b508511a33fd5f667a7b7343d41eff90'),(1315309475753955331,'config','Api Token must be reapplied after it expires','在过期之后需要重新申请','Api Token must be reapplied after it expires','118e7fb26b3b3593cf8ced213ec1bb8442da1306'),(1315309475753955332,'opr','Regeneration','重新生成','Regeneration','df40c4cb310b3b20b0cdd5abe8c78734a26b9cb4'),(1315309475753955333,'filemanager','Please use FreeOPT or Google Authenticator to scan the QR code','请使用FreeOPT或Google Authenticator扫描QR码','Please use FreeOPT or Google Authenticator to scan the QR code','d71ef486e1bfd9962bb3aeacb9e29c4c7edbf40b'),(1315309475753955334,'opr','Login Failure','登录失败','Login Failure','a31c516b4926ee9dbc9b802ae3724f2bb60dc50f'),(1315309475758149632,'opr','Username','用户名','Username','e23608a8cd38d31b1d778248485c79dcd8b8ab49'),(1315309475758149633,'opr','Password','密码','Password','eb1b813f4f94e55014312401f832f035d3e92263'),(1315309475758149634,'opr','Captcha','验证码','Captcha','ca726a60788fc7cc6339d1120f448711d503ad72'),(1315309475758149635,'opr','MFA Code','MFA码','MFA Code','275997c1a68714601fa40d74e0d46096bf12a3ce'),(1315309475758149636,'opr','Login','登录','Login','408710b86307cf84f3924daf6ea413b064e36b08'),(1315309475758149637,'opr','MFA Check','MFA检查','MFA Check','05eac86c3e733ed9c51bf41a4a1203ca30b2c297'),(1315309475758149638,'translate','module','模块','module','6476ee7b11648d58446f8ed90383e95823e2c4e5'),(1315309475758149639,'vpe','Identifier','标识','Identifier','5674d133d66337e6b9bafecd1d1140f0f8b7fe66'),(1315309475758149640,'vpe','Nas Name','Nas 名称','Nas Name','de3412e5ee607c046c932f804b65855717a1e01d'),(1315309475758149641,'vpe','Ip Address','IP 地址','Ip Address','485a05f48df4caeb78290c3ae29e50665ce49446'),(1315309475758149642,'vpe','Vendor','厂商','Vendor','c71430ecb1f7a89fc08b31189249de7e2371f993'),(1315309475762343936,'vpe','Share Secret','共享密钥','Share Secret','42400b1d24def40665791e573491ba4786d05123'),(1315309475762343937,'vpe','Coa Port','Coa 端口','Coa Port','2b476b026f3af33c14fffc3bc1f62626983b48e4'),(1315309475762343938,'vpe','Ldap Server','Ldap 服务器','Ldap Server','54efad59f6bbee570672b7a96aaadbcf981ac12b'),(1315309475762343939,'global','Tags','标签','Tags','a324dc63683ff394feed812650deaeddb570be87'),(1315309475762343940,'global','Status','状态','Status','8ba2c38d651193a5d003031c906c477c70d8c1d7'),(1315309475762343941,'global','Remark','备注','Remark','93f73062c332ea13d5e20583696808509f3d9f73'),(1315309475762343942,'global','CreaterTime','创建时间','CreaterTime','7d564c93e7191258928bb35eea6bee1ae4ebd663'),(1315309475762343943,'global','UpdateTime','更新时间','UpdateTime','d4c206eb051ecbb937a33e620e866ca311973b01'),(1315309475762343944,'global','Operator password error','操作员密码错误','Operator password error','b0ef309a7463786cfa4d56834fa4cea1a6aa6ecc'),(1315309475762343945,'profile','Profile Name','策略名称','Profile Name','676c0745560857d43c2fa12fb8a89c1348652625'),(1315309475762343946,'profile','Domain','域','Domain','dbfed0b19aa84028f421389e33090a9476db4419'),(1315309475766538240,'profile','Support for specific devices','支持特定的设备','Support for specific devices','9604c1983b8240c9ef07b26623421a7bdc3b1789'),(1315309475766538241,'profile','Ip Pool','Ip 地址池','Ip Pool','9dabb4e650c736d72a1590ff5b3da1e73b2b2811'),(1315309475766538242,'profile','Concurrent online num','并发在线数','Concurrent online num','38bc4338737aac2e39edcaaa38900024b2d89fdc'),(1315309475766538243,'profile','Concurrent online num, 0 means no limit','并发在线数， 0 表示不限制','Concurrent online num, 0 means no limit','268d4aad6ac5d8d72121b2eaf000a44e99efefe3'),(1315309475766538244,'profile','Uplink Rate (Mbps)','上行速率 (Mbps)','Uplink Rate (Mbps)','b052f7d2dd4481be8a18c400fcf33b55a1fd71e2'),(1315309475766538245,'profile','Downlink Rate (Mbps)','下行速率 (Mbps)','Downlink Rate (Mbps)','92bca39a624fe457aa58c9d3c27c1358b4420922'),(1315309475766538246,'profile','Billing Times','计费时间','Billing Times','ea4938093f371b41c1ac238099a4a4a80f7cf52c'),(1315309475766538247,'profile','UpLimit Policy','上行速率策略','UpLimit Policy','7d5319351359ca78883d92a18bcb99010d5aa42a'),(1315309475766538248,'profile','DownLimit Policy','下行速率策略','DownLimit Policy','48ca540eff74466c64fe9ed2ee33406cc3d615e1'),(1315309475766538249,'profile','Limit Policy','通用速率策略','Limit Policy','14f3e7281a2ef1f1f05622384a9e0142f992aac0'),(1315309475766538250,'profile','Uplink Rate','上行速率','Uplink Rate','9d04afe4c7f8f2a1e2ee00c6d41d93291187cb5b'),(1315309475770732544,'profile','Downlink Rate','下行速率','Downlink Rate','82293bfc8c1b1751f7d302a12ef222be07443efa'),(1315309475770732545,'profile','Billing TimeUnit','计费时间单位','Billing TimeUnit','46c7736c5c84bf1336ef124ff1e574c4d452287f'),(1315309475770732546,'global','CreateTime','创建时间','CreateTime','49a1f18ad492b782349df66974c7ce3d23bc0318'),(1315309475770732547,'subscribe','Fullname','全名','Fullname','9c4b72e1a1a068eae4689e0b66b40e6066bd5f2c'),(1315309475770732548,'subscribe','Subscriber Fullname','全名','Subscriber Fullname','6edb4619cee8862dadd16eb28559a2f0bfd2c36a'),(1315309475770732549,'subscribe','Mobile Phone','电话','Mobile Phone','427659e38c5d1a3391600365ed1aab8b37240e8c'),(1315309475770732550,'subscribe','Profile','策略','Profile','e9dbd111ae4b82d6b8af9cc5242f5a27471f5018'),(1315309475770732551,'subscribe','Email','电子邮箱','Email','9f99edf641218fc7ff7a5abe30ea31cc621cb576'),(1315309475770732552,'subscribe','Device Bind','设备绑定','Device Bind','d2d540dd1d0d545a0cd4d3001daab361f72a6cb7'),(1315309475770732553,'subscribe','Username','帐号','Username','86b07b28a11dcdfac651b0f2ee4467254bc0f48d'),(1315309475774926848,'subscribe','Password','密码','Password','c15e7f40e8a5798af17d29cdbb69cf88ff284fd1'),(1315309475774926849,'subscribe','Static Ip','静态 IP','Static Ip','231ca02e29fb5ac63b5d3f7bb8f95d4cdff22f82'),(1315309475774926850,'subscribe','Leave blank for no change','留空不修改','Leave blank for no change','ca3cec2f0e9e32f997e7186fc5efed0be3285e0c'),(1315309475774926851,'subscribe','Expire','过期','Expire','07f7c598e94ce1bf742d58eb2225f6974231b030'),(1315309475774926852,'subscribe','Concurrent online num','并发在线数','Concurrent online num','de6b2e161a2900fa3e3c127f3daeac70e779b118'),(1315309475774926853,'subscribe','Ip Pool','Ip 地址池','Ip Pool','2e4a19d3e45d04ef917467ebc62389f24258c152'),(1315309475774926854,'subscribe','Uplink Rate (Mbps)','上行速率 (Mbps)','Uplink Rate (Mbps)','ff6cd27f7f0029c4c499660ad6e4a6cfbbb68dd3'),(1315309475774926855,'subscribe','Downlink Rate(Mbps)','下行速率 (Mbps)','Downlink Rate(Mbps)','e474703b9eb46bc6d9ca78fbc68fe9e33d7e1f4f'),(1315309475774926856,'subscribe','UpLimit Policy','上行策略','UpLimit Policy','c0361918d89ffbfc3c6997c2b47f0a712430134f'),(1315309475774926857,'subscribe','DownLimit Policy','下行策略','DownLimit Policy','7bc53b9b0ea5f4cbe01354df69dc2e956df10385'),(1315309475774926858,'subscribe','Limit Policy','限速策略','Limit Policy','e80b263f949613245b55f54677eac283f6e27362'),(1315309475779121152,'subscribe','Mac Addr','Mac 地址','Mac Addr','f51146b5a1d629c07e70eb67f5da0d641821f271'),(1315309475779121153,'subscribe','Domain','域','Domain','f897e08bf891ce2df8ef36e6244d0ec293da27dd'),(1315309475779121154,'subscribe','UpLink Rate','上行速率','UpLink Rate','c623ef9f2ff73f76fbde9fc614c3a34ccb906438'),(1315309475779121155,'subscribe','DownLink Rate','下行速率','DownLink Rate','1666940424852b24b4782550a5d3c39dc602c5a0'),(1315309475779121156,'subscribe','UpdateTime','更新时间','UpdateTime','5a2029391f3337db3251c7a6e3b039fe1ee66f72'),(1315309475779121157,'ldap','Password','密码','Password','b7d81dd69511eb5a090d52b9ba366b0ca3e8e058'),(1315309475779121158,'subscribe','Ldap connect password, Leave blank for no change','Ldap连接密码，留空不改。','Ldap connect password, Leave blank for no change','095e67a234ce00604479c72d2730b4932495effb'),(1315309475779121159,'ldap','Address','地址','Address','74c97734ec53306a2f4bacffcbbca109893e6e20'),(1315309475779121160,'ldap','Name','名称','Name','c7fc34e8139f58dba98c2330537a65d948b9992e'),(1315309475779121161,'ldap','Status','状态','Status','9ea6ece3d207e7467457d23a1e66f89c685e364c'),(1315309475779121162,'ldap','Remark','备注','Remark','a92f8f3fc13ac86b8e31ef7544200ad74ff112f1'),(1315309475783315456,'ldap','Ldap Name','Ldap 名称','Ldap Name','4f99e1f4e4e843a7668078b99e519e5144ac8cbc'),(1315309475783315457,'ldap','Ldap Address','Ldap 地址','Ldap Address','ea538a3775f5ccaa28d450d6c00399a3d887d892'),(1315309475783315458,'vpe','Create Nas','创建 Nas','Create Nas','89583c8cd9bd05decc6cfd2f50dab71f5e2de048'),(1315309475783315459,'online','Disconnect','断开','Disconnect','ac1406a966e7c5454cde7d43dfbf666dbf56dc95'),(1315309475783315460,'online','Batch Clear','批量清除','Batch Clear','14cdc48d1caeda9ee9115716d649dd32f271c584'),(1315309475783315461,'online','Clear All','全部清除','Clear All','50cf9d479a1cee7815f9b9cd5b560dbe1e6d9d63'),(1315309475783315462,'radius','NasId','Nas标识','NasId','eaff8ce7a3d43c94d6d2775ccad2d80493fba2eb'),(1315309475783315463,'radius','NasAddr','Nas地址','NasAddr','5b3273cca8af8b2a2a975a726681983d4cfefdaa'),(1315309475783315464,'radius','NasPubAddr','Nas公网地址','NasPubAddr','a2b5b3dadb0a8e6061f003c4426ec479fe6483d1'),(1315309475787509760,'radius','Session Timeout','会话超时','Session Timeout','a797c0ac6ced5c485908d9cdae1ae6247e710954'),(1315309475787509761,'radius','FramedIpaddr','客户端IP','FramedIpaddr','3c87400765e9054e5f49b6243bc42376099cbce6'),(1315309475787509762,'radius','FramedNetmask','客户端掩码','FramedNetmask','7512f2fed47d6b8c4681385840b51719976e2cf2'),(1315309475787509763,'radius','MacAddr','MAC地址','MacAddr','55617de38597bfcc4bff055237262e1ec4a83a6e'),(1315309475787509764,'radius','NasPort','NasPort','NasPort','d2b20f54dfd290277c75cae4849b9d737e01c5e6'),(1315309475787509765,'radius','NasClass','NasClass','NasClass','93584069d5a4411fbce4d06c29337d7fb852fd7d'),(1315309475787509766,'radius','NasPortId','Nas端口信息','NasPortId','606d80241b6a39980e40f50383d40d8af415c0ce'),(1315309475787509767,'radius','NasPortType','Nas端口类型','NasPortType','e4a9c9adf64c32300c10d345c8bfd1aecbcb013c'),(1315309475787509768,'radius','ServiceType','服务类型','ServiceType','b9818112257c6bfda3d90c5688f999165c5f2b54'),(1315309475787509769,'radius','AcctSessionId','会话ID','AcctSessionId','8bf454661db47d4ebacc04bcb936f02ffd344924'),(1315309475787509770,'radius','AcctSessionTime','会话时间','AcctSessionTime','fbf91f195100444db6601d44562140797ceb67cf'),(1315309475787509771,'radius','AcctInputTotal','上传总流量','AcctInputTotal','001f229a1812337124cf5fa02aadb4d7a1150121'),(1315309475791704064,'radius','AcctOutputTotal','下载总流量','AcctOutputTotal','1dfe6338151377b17f268ade9552cbbb12800875'),(1315309475791704065,'radius','AcctInputPackets','上传数据包','AcctInputPackets','2fa33cf43d1568d8be6bcf465c3daf2d74758d40'),(1315309475791704066,'radius','AcctOutputPackets','下载数据包','AcctOutputPackets','95093d655504007eb9c400d8bf4ce6191a42eb09'),(1315309475791704067,'radius','AcctStartTime','上线时间','AcctStartTime','f01f1dcbcae999578c1625af62ffbc0b9146c26d'),(1315309475804286976,'global','LastUpdate','最后更新','LastUpdate','ac1d1a46b476b32212915903d34ce1b9c4dc5c96'),(1315309475804286977,'radius','AcctStopTime','停止时间','AcctStopTime','05a099145c48079a26d4bb9fcd576b69323629d9'),(1315309475867201536,'radius','Auth Result','认证结果','Auth Result','3a59c889089f81f38b738cee0fb3f9f1f3f7ff13'),(1315309475867201537,'radius','Auth Remark','认证备注','Auth Remark','69ddecd01c375aad9bd91cc7484736e4959c2745'),(1315309475867201538,'menus','Online Disconnect','在线断开','Online Disconnect','07da9af09f59e1ed015c07efed32600aed1d7ea7'),(1315309475867201539,'menus','Online Clear','在线清除','Online Clear','7ab2e8e4f9bac11d11f179f3c69c89192bf8a77f'),(1315309475867201540,'menus','Authlog Clear','认证日志清理','Authlog Clear','51ab323500217e42cce197e21af814397f080a53'),(1315309475867201541,'menus','Nas Create','Nas 创建','Nas Create','da3dfa65ddcff0d4517ab9d3bba349cc0f26f400'),(1315309475867201542,'menus','Nas Modify','Nas 修改','Nas Modify','36ebcaab722654f87cad939f6700f86467aa71cf'),(1315309475867201543,'menus','Nas Delete','Nas 删除','Nas Delete','5644b748b1a1f1fb09858d531437d828ea206648'),(1315309475871395840,'menus','Nas Import','Nas 导入','Nas Import','4ce7819f8b2c5edf58347ea088bacc9ffeea753a'),(1315309475871395841,'menus','Nas Export','Nas 导出','Nas Export','3767e6bcd268b01db815fcde6fac10eea8f6424d'),(1315309475871395842,'menus','Profile Create','配置文件创建','Profile Create','d2ef1d8c5294a64743cde1224d21b7f4a9aa5f5a'),(1315309475871395843,'menus','Profile Modify','配置文件修改','Profile Modify','ad67477d21b832587822a0d3c39b2f81d8206b32'),(1315309475871395844,'menus','Profile Delete','配置文件删除','Profile Delete','a673ba20c8fb943b1098b0e3260bd5ccbe8fd354'),(1315309475871395845,'menus','Profile Import','配置文件导入','Profile Import','4d68e624f6338943bd644078c29e829116b6758f'),(1315309475871395846,'menus','Profile Export','配置文件导出','Profile Export','b5ff0ee065ca3bb861d83d4a43be831490677e3d'),(1315309475871395847,'menus','Subscribe Create','订阅创建','Subscribe Create','a54dbd78b75a4a74afbd1d4dc6b73035b820e9a2'),(1315309475871395848,'menus','Subscribe Modify','订阅修改','Subscribe Modify','78033a3d960e6d94954a7ba2c198dd5c4db8c987'),(1315309475871395849,'menus','Subscribe Delete','订阅删除','Subscribe Delete','0a43cc41857c6e3c3913c15371bae4b58fd4e028'),(1315309475875590144,'menus','Subscribe Import','订阅导入','Subscribe Import','3bda1e9e8a1f90d734c97173f1b64c3e33c51380'),(1315309475875590145,'menus','Subscribe Export','订阅导出','Subscribe Export','88b03c3f5e983164ec10b6d480e9123af44e425f'),(1315309475875590146,'menus','Ldap Create','Ldap创建','Ldap Create','d677b01d9c9ad4bb806c677c555ab422ba5ce2f5'),(1315309475875590147,'menus','Ldap Modify','Ldap修改','Ldap Modify','fb9e1cc7b5862742eafd41c0bb4864865fb755c1'),(1315309475875590148,'menus','Ldap Delete','Ldap删除','Ldap Delete','0eeeeadbd7200792b72faa7288305aaafb4babda'),(1315309475875590149,'menus','Ldap Import','Ldap导入','Ldap Import','7929193cb43475888a289139d8a232af5388e1a4'),(1315309475875590150,'menus','Ldap Export','Ldap导出','Ldap Export','7f276e0054be00751c20a595dae84f2acdc12ce2'),(1315309475875590151,'menus','File Write','文件写入','File Write','c23cb0ad775d19932488b8c7fd137eef5ab48895'),(1315309475875590152,'menus','File Delete','文件删除','File Delete','33597021d8a5f0fd842025c80e78c851da27b392'),(1315309475875590153,'opr','Fullname','全名','Fullname','ade43dd848742b6a9afd6cbc8468503f34663cb9'),(1315309475879784448,'opr','Login name','登录名','Login name','ca8f82a435b0e83f8a60287d445d09b57acbc5a7'),(1315309475879784449,'opr','Level','等级','Level','69a925885b3ed7c2803c39572ac9621da0e40ec2'),(1315309475879784450,'opr','Mobile Phone','手机','Mobile Phone','3df1059baff6b67f0eb891d2393326e8d8ce0fee'),(1315309475879784451,'opr','APi Secret','APi 密钥','APi Secret','e58eae75bd21f1a4cbdb60d03068c91894747da8'),(1315309475879784452,'opr','Last Login','最后登录','Last Login','6a40c014777e2ecd98334ab1ed9c4c19cb6b67df'),(1315309475879784453,'oprlog','Operator','操作员','Operator','1720ce11c6f3155aaf9b8ecb324a2e7b2a41973d'),(1315309475879784454,'oprlog','Source Ip','来源 Ip','Source Ip','90eff9cadfab94d772009af53a9fe544bffe331f'),(1315309475879784455,'oprlog','Action','操作','Action','eb89fc24dbd47583805710d8efc770b7292e3579'),(1315309475879784456,'oprlog','Operate Time','操作时间','Operate Time','e15809d1f2f57bb871e561ddd826f4d3ddf0a85a'),(1315309475879784457,'tags','Category','分类','Category','adaeec8c2737c8fb60a40314f0b6a1e1e09342a5'),(1315309475883978752,'tags','Group','组','Group','c7a8f0d7e108cdac65d92c06129c8b9461b2f7bc'),(1315309475883978753,'global','Creater','创建者','Creater','552f00b5b3fe6220b20624de494b174cf1c4a361'),(1315309475883978754,'uiconfig','navigation Bar','导航栏','navigation Bar','3e29de064122d0e6d8234579b8ca3f08ddbc0916'),(1315309475883978755,'uiconfig','Ui Resources','UI 资源','Ui Resources','1f9d5cb4275554879593a39e876dabefe3ef2107'),(1315309475883978756,'uiconfig','System Settings','系统设置','System Settings','d3000910f68d665aa68fa9697c427c8ed9a6c549'),(1315309475883978757,'uiconfig','Preview Login Page','预览登录页','Preview Login Page','ff58cc4220022a677d8d23a7c436289d6af1f9fe'),(1315309475883978758,'uiconfig','Dashboard width(3-10)','仪表盘宽(3-10)','Dashboard width(3-10)','971bcbd80c9742f4b838318d201ac9b6660b8daf'),(1315309475883978759,'uiconfig','Dashboard height(3-10)','仪表盘高(3-10)','Dashboard height(3-10)','ecd9dca6dcb360db54d99c16fb9bb7b8b9c40af4'),(1315309475883978760,'uiconfig','Menu Sidebar Header','菜单侧栏标题','Menu Sidebar Header','478d78fe72ae75c948cbf7a0758ebc49e6de331e'),(1315309475883978761,'uiconfig','Login screen prompt description','登录界面提示说明','Login screen prompt description','a5e411ff99bc56b06bba56ad2820d74e461a65d7'),(1315309475883978762,'uiconfig','Page title (browser title bar)','网页标题(浏览器标题栏)','Page title (browser title bar)','bc8bc7fd1ac5bdf2f456cc4ad7b52ed21325131f'),(1315309475888173056,'uiconfig','Login Dialog Box Title','登录对话框标题','Login Dialog Box Title','1c9806543df97b88cfddb78e3100f4c83c8a9b94'),(1315309475888173057,'uiconfig','Navigation bar main heading','导航栏主标题','Navigation bar main heading','3261fd521bc56def879ee17cd55e6a07504a0e6c'),(1315309475888173058,'uiconfig','Navigation bar subheading','导航栏副标题','Navigation bar subheading','114beac5624914b4a509f76e1a36724cf0fb5e39'),(1315309475888173059,'uiconfig','Login Page Logo','登录页Logo','Login Page Logo','1038c9bf04c11528df36807afecdb94e436bcf6c'),(1315309475888173060,'uiconfig','Login page background','登录页背景','Login page background','a0f2bf430018ab8d35091847ef6da09264e57fb5'),(1315309475888173061,'uiconfig','Manage page navigation logos','管理页面导航Logo','Manage page navigation logos','42633633eda5216a50689a0df28ce358668b8353'),(1315309475888173062,'uiconfig','Sidebar Toggle icon.','侧边栏切换图标','Sidebar Toggle icon.','20112c657a5e5742f8aa62e59082301ddfb77c05'),(1315309475888173063,'uiconfig','Manage page navigation background','管理页面导航背景','Manage page navigation background','32b6a355160fafe6570f37241db8315a9b076aae'),(1315309475888173064,'uiconfig','Create','创建','Create','d572bdf0db9ad651f6772c2050c38ecf2b9acea4'),(1315309475888173065,'radlog_report','Username','用户名','Username','d86cad77a1a716c1041313560616698633a4c7d5'),(1315309475888173066,'radlog_report','Nas Id','Nas 标识','Nas Id','7b8e0d2f1d9527c6f8e404690c265ef15ea90530'),(1315309475888173067,'radlog_report','Client Ip','客户端IP','Client Ip','bed88d6eec7d262193f9dbf0f5adac17fcd2e958'),(1315309475892367360,'radlog_report','Nas Ip','Nas Ip','Nas Ip','d2dff040084355a61b5348d4ce5b322db9cc6721'),(1315309475892367361,'radlog_report','Client Mac','客户端 Mac','Client Mac','45541eedc22407f55d92a10a40afae8d2e3963e3'),(1315309475892367362,'radlog_report','Session Time (Minute)','会话时长 (分钟)','Session Time (Minute)','cd1a0aa5ba0b57f736281970053b34180e57cf55'),(1315309475892367363,'radlog_report','Received Total(MB)','下载流量(MB)','Received Total(MB)','3c545ce5ebfd60690ae8959b0ffded1f4b3424f3'),(1315309475892367364,'radlog_report','Sent Total(MB)','上传流量(MB)','Sent Total(MB)','e02e6eddb86b36da4121610495137d17cf7c7513'),(1315309475892367365,'radlog_report','Received Packets','下载数据包','Received Packets','86d59ca46c741117e16025942ba06048811bd7e0'),(1315309475892367366,'radlog_report','StopTime','下线时间','StopTime','60756853b1415f366d616028bc6b535267f7fafb'),(1315309475892367367,'radlog_report','StartTime','开始时间','StartTime','480ea7515c0da52f9418d83e963e626dea050150'),(1315309475892367368,'about','About','关于','About','62ef6fe58a8de76341140dc5372faa812634ded7'),(1315309475892367369,'about','EULA','最终用户许可协议','EULA','68264e851ac742e3d34acdf5c53e33b3388608a9'),(1315309475896561664,'about','Release','版本发布','Release','b4cd9f63654890d9f53b39a649b543ccac15869c'),(1315309475896561665,'about','License','授权许可','License','5899aded3238c26b422c4bcde2dad581ecf909c6'),(1315309475896561666,'license','System Sid','系统ID','System Sid','034bf44af389e206fa5aa13956d1fed6143e3ab2'),(1315309475896561667,'license','License Code','授权码','License Code','1f2d3c648fd3d1e76d79d3fe8e3388afb0cd64ca'),(1315309475896561668,'license','License Type','授权类型','License Type','0223f73f1f1c74621cfb42733add6e5cc224a674'),(1315309475896561669,'license','Sales Channel','销售渠道','Sales Channel','558b0ba637a886705c9389bb40b719cfa286834c'),(1315309475896561670,'license','License Expire','授权过期','License Expire','5a3afa836e057e4410dff61970bf0025b3e80cd7'),(1315309475896561671,'license','License Status','授权状态','License Status','1049cbd1f61906c40ea4266557002c3cc03b09cb'),(1315309475896561672,'license','License Create Time','授权时间','License Create Time','1295d5438b4ccebfff77ce29a3bca54abff6ba9e'),(1315309475896561673,'license','License User Limit','授权用户限制','License User Limit','3bcf083a51f90acd5501e3d5eafe4116aa480ca6'),(1315309475896561674,'license','Service Support Expire','授权服务过期时间','Service Support Expire','3ae316ecce7ca17d8592841f867ac453d0c14e03'),(1315309475900755968,'license','Service Support Info','服务支持信息','Service Support Info','bec489f3a30314fcde827966ae84d4c43ca1b2fb'),(1315309475900755969,'subscriber','Modify Subscribe','修改账号','Modify Subscribe','8abc7253e2181f88c59af8b7cad2c90229ce1437'),(1315309475900755970,'global','Request License','获取 License','Request License','322abff68a847e43d5d912abd6de09c00a839eb1'),(1315309475900755971,'global','Active License','激活 License','Active License','5b5efd36cf94e0d13e058ec8fb399b938e1832fd'),(1315309475900755972,'about','Upgrade','升级指南','Upgrade','09a0aa3d455950a67505c5aac59c6102848b5852'),(1315309475900755973,'global','Date range','时间范围','Date range','4c8ae596c300c0546065464ed29e1de773018bbc'),(1315309475900755974,'global','Keyword match','关键字匹配','Keyword match','93abb25a5650b2c05e52136bdc17f79acfa10bfe'),(1315309475900755975,'global','Query','查询','Query','4c8a2bf07aaa4f817529dd57f57aab91d87ed3a1'),(1315309475900755976,'global','Reset','重置','Reset','fdeb58641ef05a4a78998f228110d73c840bc524'),(1315309475900755977,'global','Pagesize','每页','Pagesize','fc9b06f30b61075e51403cd6fc4ec596e26adac4'),(1315309475900755978,'global','Truncate','清理','Truncate','8c1a3c1d091e24744fc764aed798262ccc47c9c2'),(1315309475904950272,'profile','Bill Timeunit','计费时间单位','Bill Timeunit','4e615f538c98499903b501bb8d36ad2dee1109c7'),(1315309475904950273,'global','Create','创建','Create','ecf2c9f7e68bc5ecd932ab5176a421ab7a944e0f'),(1315309475904950274,'global','Copy','拷贝','Copy','6111174d28153233c13d5dbfbc6a3085b4c3282c'),(1315309475904950275,'global','Delete','删除','Delete','8b536e60e51627a806f26c4f1a9f681de1750edf'),(1315309475904950276,'global','Modify','修改','Modify','5c4b6bb370f880772972ed552452ec5555a286be'),(1315309475904950277,'global','Tags match','标签匹配','Tags match','15284c54d3184a722e9eb72e4f368ef9af458164'),(1315309475904950278,'global','Enable OTP validation for user','启用用户的 OTP 验证','Enable OTP validation for user','9d2bc361b71cd8b6a7b531c65fb1227af85c9e48'),(1315309475904950279,'radius_config','Password authentication is ignored, but does not apply to MsChapv2 authentication mode.','忽略密码验证，但不适用于MsChapv2验证模式。','Password authentication is ignored, but does not apply to MsChapv2 authentication mode.','0d9272ca3bd506820481e4a749fef43a3feb85c2'),(1315309475904950280,'global','Ignore Passowrd check','忽略密码检查','Ignore Passowrd check','4a536b9b0e694b0dd9ec3e774f2ff7c8e7155947'),(1315309475904950281,'radius_config','Default Acctounting interim interval','默认的记账处理时间间隔','Default Acctounting interim interval','4efa6f6cb7243492e9e8f12f95e6c49f5dec10fd'),(1315309475904950282,'radius_config','Default Acctounting interim interval, Recommended 120-600 seconds','默认的记账处理时间间隔，建议120-600秒。','Default Acctounting interim interval, Recommended 120-600 seconds','2f00bb44095261c81b6080420ef15c32fea2b6a2'),(1315309475909144576,'radius_config','FreeOPT and Google Authenticator support','支持FreeOPT和Google Authenticator','FreeOPT and Google Authenticator support','9115b6bcad156b884fd793a244ccb169bbdea734'),(1315309475909144577,'global','Radius logging expire days','Radius 日志保留天数','Radius logging expire days','6f82fef18217026a5d5f75d87cc8d98db28bde4f'),(1315309475909144578,'radius_config','FreeRADIUS API Url','FreeRADIUS API Url','FreeRADIUS API Url','ad50b776e02b468cf69c9bdcbbda0148faea4355'),(1315309475909144579,'radius_config','Radius logging expire days, set according to the disk size.','Radius 日志过期天数，根据磁盘大小设置。','Radius logging expire days, set according to the disk size.','7055f4e6a3aad0d06bf3f8d19bf45f402e5ff95f'),(1315309475909144580,'radius_config','FreeRADIUS API Token','FreeRADIUS API Token','FreeRADIUS API Token','644d8d8f684504a75c7e2f209ca7d47fdaaca6c6'),(1315309475909144581,'radius_config','FreeRADIUS API Url, ex: http://x.x.x.x:1815','FreeRADIUS API Url, ex: http://x.x.x.x:1815','FreeRADIUS API Url, ex: http://x.x.x.x:1815','bc9612523fe41104d7d50554747723e7c01e5f31'),(1315309475909144582,'global','Icon','Icon','Icon','042f755c7567b229b852818a3b328d0230dc59c1'),(1315309475909144583,'menus','Module','模块','Module','9dff930a5fc6e0978d5910f216ff54d64a476984'),(1315309475909144584,'menus','Sort','排序','Sort','6a074178efceb95fe2bc198e7dd4a8ea783de938'),(1315309475909144585,'global','Type','类型','Type','1dbe34276aae4bb50ccf6786177f10f40fc7b653'),(1315309475913338880,'menus','Privileges','权限','Privileges','cea13cb0b900e043498be6ca57fa9d9a52d028cb'),(1315309475913338881,'global','loading...','加载...','loading...','5c790680d33af638782694f8dfc5589fcdc36e4f'),(1315309475913338882,'global','Menu','菜单','Menu','adea6c19a72106e6bcb2299ebe85e2b7e5e49f2c'),(1315309475913338883,'global','Sort','排序','Sort','81acd34f7e4546cd68df7d24c0baf778614e33d5'),(1315309475913338884,'filemanager','Please upload images to the dir (resource/images) from the filemanager','请将图片上传到文件管理器中的dir(resource/images)。','Please upload images to the dir (resource/images) from the filemanager','813b0dfda28b39f53253b6f458c1d47ba60b6a67'),(1315309475913338885,'global','External Link','外部链接','External Link','1353bfe7fb84709a0fa8c92ecc0cf5c43382cf7b'),(1315309475913338886,'global','Internal Module','内部模块','Internal Module','698db9cdfcf140e9edb20fe041a669bd1283d2b6'),(1315309475913338887,'global','Operating time','操作时间','Operating time','9db09d1d76a2c68728ee884262b1c9e0b1a2f631'),(1315309475913338888,'filemanager','Open','打开','Open','e26ba3b3e9f679d8d31d69a19fdada24779c5141'),(1315309475913338889,'global','Rename','重命名','Rename','8f8ce5a2175994c4c20b7fa14c31aac25e7351ca'),(1315309475913338890,'filemanager','Folder','文件夹','Folder','e4b30a1efadcf7887614f73a2dd9f56c99c51f64'),(1315309475917533184,'filemanager','Add New','添加','Add New','eea169ee07da7ff94ab92f319bac5e7fbf625e20'),(1315309475917533185,'filemanager','My Files','我的文件','My Files','5af2c3b13ea7644fc3d95ad77a86345961ed928f'),(1315309475917533186,'filemanager','Back Home Folder','返回主目录','Back Home Folder','0c39f6179b92e6ba1cc02315319362bc557c30eb'),(1315309475917533187,'filemanager','Datetime','日期时间','Datetime','0ce92213ce51950882705871e0a065586a3e9732'),(1315309475917533188,'filemanager','Size','大小','Size','cabb13b8a029ad7615e8c4a3d2de86b5c460cf79'),(1315309475917533189,'filemanager','Please Login','请登录','Please Login','6bf924c8137a5fbf7efc6b607116ccc2b0931492'),(1315309475917533190,'filemanager','Download','下载','Download','cbe618a92ec8c8c86d7c1e362522c52dfc810672'),(1315309475917533191,'filemanager','Type','Type','Type','fe946ea612e31f2b3fc7ca322eb6a68207d667f9'),(1315309475917533192,'filemanager','Information','信息','Information','aed99a0d89f3357e2f8f98d25bdeee5b2cb8c179'),(1315309475917533193,'filemanager','Files','文件','Files','c75d58f1dc9d992363a1c78cda153ce3ca104f92'),(1315309475917533194,'filemanager','Remove','移除','Remove','34dd70226abedf0ecf2bbb86c9bbf39d0d877c17'),(1315309475921727488,'filemanager','Table','Table','Table','fba47f855f443e7f40773cc98ccb8d6702febf5f'),(1315309475921727489,'filemanager','Total','Total','Total','99e93fe75a1ad21189e93ac17ffde1fe2ccde62b'),(1315309475921727490,'filemanager','Cards','Cards','Cards','37564d9e5394e95c36d42006690451ed52c6b973'),(1315309475921727491,'filemanager','Are you sure ?','你确定吗？','Are you sure ?','68e51a18b6e1665073f41e3235d9ac1cfb62f185'),(1315309475921727492,'filemanager','Enter a new name','输入一个新的名字','Enter a new name','65380c4e34c30f63534c3094f8ac2a0533b91630'),(1315309475921727493,'filemanager','Select something','选择某项','Select something','f3a2b7a7fb555947cba77d9d918efe5ea9f1f1e9'),(1315309475921727494,'filemanager','Detail','详情','Detail','43e8b7a1727bc61604fa09a1c09c8e65e1d1aa2c'),(1315309475921727495,'filemanager','Download file','下载文件','Download file','4cd6d7f00758f68c69c2ac9911382ccea3cede69'),(1315309475925921792,'filemanager','Add','添加','Add','c9d743b3693cce6075cec14b3c4029099d4ac715'),(1315309475925921793,'filemanager','Preview','预览','Preview','6216525f70ca35c50ce0280f104397f890508307'),(1315309475925921794,'filemanager','Refresh','刷新','Refresh','18bbfa2332c9dc9ae7c029d59d8d2b64ee586f6a'),(1315309475925921795,'filemanager','Are you sure you want to exit without saving?','你确定你要退出而不保存？','Are you sure you want to exit without saving?','d1baee16fff5478bfc9d6449005c38a31e9dbcd4'),(1315309475925921796,'global','Clone','克隆','Clone','faec6c650011f03fd7007242f4986f843b80ac46'),(1315309475925921797,'filemanager','Paste','粘贴','Paste','ab8fa0bb28b2b3f6f4aba9ab367dd49575f4d7de'),(1315309475925921798,'filemanager','Cut','剪切','Cut','f31466c52bf1f475bb83ae56e7cf79648a5c34d5'),(1315309475925921799,'about','BuildVersion','构建版本','BuildVersion','a4484dd75d8bda2c88fa2671c9d55da2e2b0e590'),(1315309475925921800,'about','ReleaseVersion','发布版本','ReleaseVersion','1f095408c116205468cadd3589ad946b9f0c0f75'),(1315309475925921801,'about','Sysinfo','系统信息','Sysinfo','f992e5802dc8ceb6fca2f07348d07193f35d0ee4'),(1315309475925921802,'about','Memuse','内存使用','Memuse','56e1d90c850f7531fc165e3fd666d0e624eefa05'),(1315309475930116096,'about','BuildTime','构建时间','BuildTime','c14ced5260dfac8884001f4276be4d57bce1f18f'),(1315309475930116097,'about','Cpuuse','Cpu使用','Cpuuse','19de17501d1da38fd943efd3afc8c958254df0f0'),(1315309475930116098,'about','Diskuse','磁盘使用','Diskuse','b2ae8133a3ca57a2f2a8f7a7161e7072e209f18a'),(1315309475930116099,'license','License types: free | BSL(Basic Service License) | ASL(Advanced Service License) | CSL(Custom Service License)','许可证类型：免费 | BSL(基本服务许可证) | ASL(高级服务许可证) | CSL(自定义服务许可证)','License types: free | BSL(Basic Service License) | ASL(Advanced Service License) | CSL(Custom Service License)','8b41fcca7915f020d3858ab3e3e1255530c462a3'),(1315309475930116100,'about','BuildID','构建ID','BuildID','8e671243f95485f3da0a2c198605b24634061f9a'),(1315309475930116101,'opr','Update ApiSecret','更新API密钥','Update ApiSecret','cbf2c495d83fcfa5eca8f46e0a647c3a19f60ee4'),(1315309475930116102,'api','Api List','Api 列表','Api List','66a44484a66f9a9f3786567a4df58acc6b56a13a'),(1315309475930116103,'radlog_report','Sent Packets','发送数据包','Sent Packets','74c845cf70f63dd599b5d900717f116d29bb2625'),(1315309475930116104,'global','Apply','应用','Apply','91fcdd82a55c95276baf478edc7bcf75586e97b9'),(1315309475930116105,'global','Cancel','取消','Cancel','f86a3c010ee770492aa3004b5710cbd50ec6ff6f'),(1315309475930116106,'global','Fields','字段','Fields','e9e530d66b37095470f03c1ee5f46fcf11acd7b8'),(1315309475934310400,'global','Report Config','报表配置','Report Config','cf68315db7f8f916e7065d75209bf405430a1dac'),(1315309475934310401,'opr','Login Name','登录名','Login Name','2d8414deb0d02e1505140f749da9120c2af4239f'),(1315309475934310402,'opr','Email','邮件','Email','b77d1ba24a27fc7007e97e4de6f0b5684fd61b6e'),(1315309475934310403,'opr','Login Ip','登录IP','Login Ip','106f6835bbd871cbed6a286073a1b470c7d3e6b0'),(1315309475934310404,'opr','Join Time','加入时间','Join Time','5721d4b38d51b8298dd424cab5cd3294b83b9dec'),(1315309475934310405,'profile','Modify Profile','修改策略','Modify Profile','bc2f6270765fd997763494eb01641e73f610e047'),(1315309475934310406,'subscribe','* Subscriber Fullname','* 用户全名','* Subscriber Fullname','088d786420221051fe0ec5bf02a6a89b9d08d106'),(1315309475934310407,'api','Send Request','发送请求','Send Request','020b09d579e5f38dfe8a7f7f37711ffd0d9053c9'),(1315309475934310408,'api','Api Request Data','Api 请求数据','Api Request Data','1316a4c3eb85e4827f1f64780bfa028e14fc8822'),(1315309475934310409,'api','Api Response Data','Api 响应数据','Api Response Data','f5ae01f494ff4d131d97a5a8408e223be80d9cdf'),(1315309475934310410,'global','Update your licenses to the latest status.','将您的许可证更新到最新状态。','Update your licenses to the latest status.','7e9b3472b22e73a3bc712f5ed98c68e51332ae97'),(1315309475938504704,'global','Applying a new license will override the original license.','应用新的许可证将覆盖原来的许可证。','Applying a new license will override the original license.','44d53c91750dc342d88d4dc17a9af9245167a7d4'),(1315309475938504705,'online','Radius online','Radius 在线','Radius online','1a6c7ccb327a9348d80251e8c677de1c84168570'),(1315309475938504706,'config','System TimeZone','系统时区','System TimeZone','dca9837b70383f03e7b4ebafc42c87159acda359'),(1315309475938504707,'config','TimeZone','时区','TimeZone','5068c4f1796ead9ebb3af9fb3c94352ce8374055'),(1315309475938504708,'global','Perm','权限','Perm','d0fa1d0a4760df06ea66831612a08e3a3459de34'),(1315309475938504709,'menus','Name','名称','Name','15e8979c935ce1e69f9a046749e78cbe3cdf8702'),(1315309475938504710,'menus','Icon','Icon','Icon','cf739a6b1b7b1e351e7a5304502f36687299540a'),(1315309475938504711,'menus','Modify Privileges','修改权限','Modify Privileges','d0fe0979d2fb71a35afa7ed6f75fe0b82805d78a'),(1315309475938504712,'metrics','NAS Count','NAS 数量','NAS Count','fbc33daa54e1405845c45f8705c3c719f782e8fb'),(1315309475938504713,'metrics','Normal User','在网用户','Normal User','31bcbb8d6a10aabde1e9555b844321c6badde3c8'),(1315309475938504714,'metrics','Disabled User','停机用户','Disabled User','fbb5372edef69168ef7da13365ff7ac9341cb683'),(1315309475938504715,'metrics','Profile Count','策略总数','Profile Count','c4f02d99ba15b8c3f6435664cb3a5c699be063dd'),(1315309475938504716,'metrics','Ldap Nodes','Ldap 节点','Ldap Nodes','a152f970f617dcd03caeb21a0e7c6721eb6193cb'),(1315309475942699008,'metrics','Expire User','到期用户','Expire User','065fe82c7e8550c13a3b9505e09c935977495c0b'),(1315309475942699009,'metrics','Memary Use','内存使用率','Memary Use','a9f67c11305351a6a4769eaee63a972a27a92317'),(1315309475942699010,'metrics','CPU Use','CPU 使用率','CPU Use','25bff253ff5dfc591fc4a5823579147c1129fd12'),(1315309475942699011,'metrics','Online User','在线用户','Online User','c7e0a42104ed64b2997ba315796ea0201a95f098'),(1315309475942699012,'global','The captcha cannot be null','验证码不能为空','The captcha cannot be null','8a8fda4a9ee9949b7da831f8a4a4a7ca44b36e68'),(1315309475942699013,'subscriber','Copy Subscribe','拷贝帐号','Copy Subscribe','cfd2c6c2a5cfa5e9697a4d43de1fbedf805bcdae'),(1315309475942699014,'tags','Modify Tags','修改标签','Modify Tags','9f439a508e4ad9d89b7f09202c2825449bbe6005'),(1315309475942699015,'api','The new ApiSecret will soon overwrite the old one.','新的ApiSecret将覆盖旧的ApiSecret。','The new ApiSecret will soon overwrite the old one.','2cc1ce42ec19c89ade7286795fdf3c171e0c54dc'),(1315309475942699016,'network','Radius Authlog','Radius 认证日志','Radius Authlog','d93365948a3051afcfe2180861abc98d3200d794'),(1315309475942699017,'global','New password confirmation','新密码确认','New password confirmation','51cf06278dd34607471425f7b1c21c91b6b54c8e'),(1315309475942699018,'global','New Password','新密码','New Password','4e1d2d4499fefbf1dae0f185a67cb5a4faf599bc'),(1315309475942699019,'global','Old Password','旧密码','Old Password','d648d7715b0b2badf6cce607223ac9f46f8112da'),(1315309475942699020,'vpe','Copy Nas','复制 Nas','Copy Nas','417a609054272235b04ba6d446467c9239728e73'),(1315309475946893312,'vpe','Modify Nas','修改 NAS','Modify Nas','9cd6daf517f5b338489b8c98f765e4bd53813ae3'),(1315309475946893313,'global','Please select one','请选择一项','Please select one','cbe095d061e9e495314dd4ae9b6265c48281e481'),(1315309475946893314,'global','The captcha is incorrect','验证码错误','The captcha is incorrect','aa232f93263d94b390b5d4f2a5426d1665d3571e'),(1315309475946893315,'about','Knowledge','知识库','Knowledge','046a1feee7c8c34e0fdf115a67752c634c211a37'),(1315309475946893316,'profile','MFA Status','动态认证','MFA Status','b0f4dfc55bc081735f97a0d2dd7399f8b4dd7919'),(1315309475946893317,'radius_config','FreeOPT and Google Authenticator support (global switch)','支持FreeOPT和Google Authenticator（全局切换）','FreeOPT and Google Authenticator support (global switch)','71b6bc62d7ebb375071187295d447fb28d1f4c67'),(1315309475946893318,'config','FreeOPT and Google Authenticator support','支持FreeOPT和Google Authenticator','FreeOPT and Google Authenticator support','028b1d9efc6d6bb960038ea83da0061e2d57138d'),(1315309475946893319,'profile','Create Profile','创建策略','Create Profile','5c037c4e9921c9332ff0634724ed068109d939b6'),(1315309475951087616,'profile','OTP Status','OTP 启用','OTP Status','2479ccc72a4cf64faa8ca2c60859071fad17ba15'),(1315309475951087617,'opr','OTP Bind','OTP 绑定','OTP Bind','48b1eabd823da26253d82e91aea126891775dfaf'),(1315309475951087618,'subscribe','OTP Status','OTP 启用','OTP Status','58c4b0d8dad043fd09772a87bd55916097967d9a'),(1315309475951087619,'global','Yes','是','Yes','7f72e66e331007b9440449779ab7e1482b2e8428'),(1315309475951087620,'global','No','否','No','9e2f4532f89e57f968b10c7389a36cb7aba9a4ea'),(1315309475951087621,'global','Mfa check eror, code not match','MFA 认证错误，代码不匹配','Mfa check eror, code not match','b6079a8c60585185ac88a87b3d4ba2f6a1f809d6'),(1315309475951087622,'ldap','Modify Ldap','修改 Ldap','Modify Ldap','b9759dae421b396d1c0297e6ea570d3de604b2c0'),(1315309475951087623,'subscribe','OTP Bind','OTP 绑定','OTP Bind','f499ba277dfba115845cb07b3e4d520f8d4d4e47'),(1315309475955281920,'subscribe','Regeneration','重新生成','Regeneration','6434d4ab003514129bb9d5a282e85003748d4a7b'),(1315309475955281921,'subscribe','Please use FreeOPT or Google Authenticator to scan the QR code','请使用FreeOPT或Google Authenticator扫描二维码。','Please use FreeOPT or Google Authenticator to scan the QR code','02137337a397c49b32631af06b3964bbf28e97f8'),(1315309475955281922,'radius_config','Radius Authlog Level','Radius 认证日志级别l','Radius Authlog Level','74be142025e4844d33285958a8a8883c4c633995'),(1315309475955281923,'ldap','Copy Ldap','复制 Ldap 节点','Copy Ldap','ae64bb18a921768a961a23104588f0c961b50c77'),(1315309475955281924,'menus','Network Management','网络管理','Network Management','31260eeef60dff64cfb5d30ffb531b63ae336b0d'),(1315309475955281925,'menus','Access control','访问控制','Access control','882d2b7a1e43d544c87b19efbe6f9e63770c747a'),(1315309475955281926,'menus','Node Management','用户节点','Node Management','1c66cc52926bd53b3e6d9fcd1a098c31d716c26f'),(1315309475955281927,'menus','Portal Management','Portal 管理','Portal Management','7a6580792cbe4fa84e35f65b5fd8493352649e6c'),(1315309475955281928,'menus','Portal Settings','Portal 设置','Portal Settings','bc3f931fa1d0b613dd7b83fec5e5b286536da06c'),(1315309475955281929,'menus','Portal Profile','Portal 管理','Portal Profile','f256bc5a333e0b928f056a2e5610153f56f554d2'),(1315309475955281930,'menus','Portal Place','场所管理','Portal Place','b748e8dfd431189bb827a974597227dd67e76038'),(1315309475959476224,'menus','Notify Settings','通知设置','Notify Settings','cef2bcdc7c6a7f883c19e91ccfe807b3a6f6be97'),(1315309475959476225,'notify_config','QCloud Sms','腾讯云短信','QCloud Sms','da23f74390c1e657e4b10e7ef81c2229cab76f74'),(1315309475959476226,'mail_settings','Test Send Mail','测试邮件发送','Test Send Mail','50c277f1cf7149f8fb6e6869cae0478395ac1768'),(1315309475959476227,'notify_config','Mail Settings','Mail 设置','Mail Settings','c06dbda413a75221f7a38e63f572a8fe06ac38f6'),(1315309475959476228,'menus','ACL Create','ACL 创建','ACL Create','99b7fcd6c3872e6164ae3e080845dbbc2b798054'),(1315309475959476229,'menus','ACL Modify','ACL 修改','ACL Modify','ea5cd776844c37c69765bd118c7da6fc8e88ff28'),(1315309475959476230,'menus','ACL Delete','ACL 删除','ACL Delete','843f07e41913a8252b9d48ba3fcc75fe3d313b09'),(1315309475959476231,'menus','ACL Import','ACL 导入','ACL Import','419e741e5c6110412c868cb99b7a040a3e403265'),(1315309475959476232,'menus','ACL Export','ACL 导入','ACL Export','4f1086917c5ba496201b53dd77ec12a73c246837'),(1315309475959476233,'menus','Place Create','创建场所','Place Create','866dc78c8e17779c7952d118e64fbd02693e146f'),(1315309475959476234,'menus','Portal Profile Create','创建 Portal','Portal Profile Create','f3c153e8cc4ec364f28dd15554fca109db1f90fc'),(1315309475963670528,'menus','Place Modify','修改场所','Place Modify','1e7ac5a6292cb305828fea49b62b3ace48b5f5a1'),(1315309475963670529,'menus','Portal Profile Modify','修改 Portal','Portal Profile Modify','bb629a9d261efb241b6092fcef6c082763c8b57c'),(1315309475963670530,'menus','Place Delete','删除场所','Place Delete','8ad1d251c9908ead4926def4519f627d9de94702'),(1315309475963670531,'menus','Portal Profile Delete','删除 Portal','Portal Profile Delete','78eda26dc862a80e6c9b83e0b86bd022f8cba2ae'),(1315309475963670532,'menus','Place Import','导入场所','Place Import','b6452c59fa449802d89906c9670ab87982d085c6'),(1315309475963670533,'menus','Portal Profile Import','导入 Portal','Portal Profile Import','493b7f7c6cb4cde3c1a448d5fee828e8b2ed7eaa'),(1315309475963670534,'menus','Place Export','导出场所','Place Export','c316e7106ce0ea293f6e084fb4161bf08ff8f35a'),(1315309475963670535,'menus','Portal Profile Export','导出 Portal','Portal Profile Export','0897213f94c9c74a63f8d127ab57b765c3f4f4fb'),(1315309475963670536,'global','Cast Milliseconds','耗时(毫秒)','Cast Milliseconds','425715ca7c8219112c004f4deec9bcd52da126bb'),(1315309475963670537,'radius_config','Auth Config','认证配置','Auth Config','1827c5644fd814c0215655a5fc9b92de5ca4eab9'),(1315309475967864832,'radius_config','Record all','记录所有','Record all','b44bdad9992dc2efe18d05a7297dff5fb487c557'),(1315309475967864833,'radius_config','Record failure','记录失败','Record failure','965551f6374ad0cfc5d95db162bbe15a125d0067'),(1315309475967864834,'radius_config','No Record','不记录','No Record','cf5a0d77c078856b0cf3883663fb1446084328a9'),(1315309475967864835,'radius_config','FreeRADIUS Config','FreeRADIUS 配置','FreeRADIUS Config','8b5ad0bf1d4260c517853ab756c7df302aa6d598'),(1315309475967864836,'radius_config','Record success','记录成功','Record success','249545913b70ddd5c8fb3a7fa5865179ee91220d'),(1315309475967864837,'global','Radius Authlog expire days','Radius 认证日志过期天数','Radius Authlog expire days','4bf7b1dfdb984d54e06dd0da4025f94f471b67df'),(1315309475967864838,'radius_config','Enable Reject Delay to prevent Ddos attacks.','启用拒绝延迟以防止Ddos攻击。','Enable Reject Delay to prevent Ddos attacks.','8cb9d90699085590696ea26175b199497552c177'),(1315309475967864839,'radius_config','Reject Delay Seconds','RADIUS 拒绝延迟','Reject Delay Seconds','721b9c9e95b2d06e98f293693f60f8eacc6ba95e'),(1315309475967864840,'radius_config','Radius Authlog expire days, set according to the disk size.','Radius 认证日志过期天数，根据磁盘大小设置。','Radius Authlog expire days, set according to the disk size.','f361cb2c2d4e5b7db5157ac94947f95e2705799e'),(1315309475967864841,'radius_config','Ignore Passowrd check','免密码认证','Ignore Passowrd check','58bd454cb558f2343d4099510de64929750bcb35'),(1315309475967864842,'radius_config','Enable OTP validation for user','启用 OTP 认证','Enable OTP validation for user','fee9cf49b3410c2a616ac0508b266f909ae9c2b8'),(1315309475972059136,'subscribe','Radius Profile','Radius 策略','Radius Profile','47e06955940b76b986e66da5e1d17c1c63f61a7b'),(1315309475972059137,'subscribe','Basic Info','基本信息','Basic Info','280f480b16f27a4c59ffaebcc1faecb8b355d450'),(1315309475972059138,'node','Name','节点名称','Name','9a48106a7e5a76466d37410dc1828380508efb6b'),(1315309475972059139,'node','ID','ID','ID','54d8fd6fa6e715023b936179252a2ef0477a038a'),(1315309475972059140,'node','Remark','备注','Remark','44bc9739358faee70de4d6d5af8c7db778928bde'),(1315309475972059141,'node','CreateTime','创建时间','CreateTime','3bbfea77f06f13bd0d7c79304bc0258da8ff5664'),(1315309475972059142,'node','UpdateTime','更新时间','UpdateTime','3c895429cb36443531a76c837203b338ceb1b0cb'),(1315309475972059143,'node','Modify Node','修改节点','Modify Node','223edce62e3ffc5b3aaa516a0dfdc2ffdf4c38a7'),(1315309482720694272,'menus','Operational Support','运营管理','Operational Support','c02c4c51a94b1bd3b47f974292ccc0766a7660de'),(1315309482737471488,'menus','Node','区域节点','Node','005383a4b48f75194f4d59258adf736aa91e4bc8'),(1315309482754248704,'menus','Channel','渠道','Channel','9f9cae9e28602a3886d825359a15b0678872e16a'),(1315309493403586560,'channel','Name','名称','Name','fdb10b64f0384d7ab7c6a65d2d194466cdfe26c8'),(1315309493420363776,'channel','Contact','联系人','Contact','a4e79726e254975148c550b33f16a127b2cc09d5'),(1315309493420363777,'channel','Email Notify','邮件通知','Email Notify','cfa2a6e496d992e9d42927d6fb4467b4db638470'),(1315309493420363778,'channel','Email','电子邮箱','Email','77b12de6c7a2e29478d34ece4c2356c4a3126e33'),(1315309493420363779,'channel','Mobile','移动电话','Mobile','4d69d6b9b42907a58073a55c2828b6b2d13f26fb'),(1315309493420363780,'channel','Notify Webhook','通知推送 URL','Notify Webhook','b25a2d73f303572bbe716bbd7dafa376c5e41745'),(1315309493495861248,'channel','Sms Notify','短信通知','Sms Notify','fe75e96ada9a566655904028ba1f5edd2d5584c5'),(1315309493504249856,'channel','ID','ID','ID','83e358d612d2639611f2495e6671b26d8695bc95'),(1315309493575553024,'channel','Webhook','推送 URL','Webhook','08388ad01430fc0ef0236d7e8e154f0d415d2238'),(1315309493617496064,'channel','Remark','备注','Remark','5ce14cf7ac4b792d11bd8e2fce8371fcf946824d'),(1315309493634273280,'channel','CreateTime','创建时间','CreateTime','8295b82916b01e1846f82b78cf796c9165857892'),(1315309493651050496,'channel','UpdateTime','更新时间','UpdateTime','e9a163a7a055ff742ec76e4cbca7f5f30faae398'),(1315309520763031552,'pprofile','Reload Template','载入模板','Reload Template','cf43c209db7650d9075d089a9f41a8dc246cc5f2'),(1315309520767225856,'portal_config','Url Params Config','Url 参数配置','Url Params Config','ea5f397eab0ccefa1b01c2570b4cbb8a4a6de329'),(1315309520767225857,'portal_config','Fixd Passwd Userinfo','固定认证密码用户','Fixd Passwd Userinfo','bced8385d5a52f74d35cdf2dff623f292236c8c9'),(1315309520771420160,'portal_config','Portal Authlog Level','Portal 日志记录级别','Portal Authlog Level','3e6f4115f8ae8bf91b2d7765fa6533958f8cc2c5'),(1315309520771420161,'portal_config','Basic Config','基本配置','Basic Config','268c48ed9eadb2bcde5071bbc0329b307c1e3ef6'),(1315309520771420162,'portal_config','Guest Userinfo','访客认证用户','Guest Userinfo','c18e684a5c1e0b74c58e0fea46e55a8556d718b3'),(1315309520813363200,'portal_config','No Record','不记录','No Record','ec235f4e136bdd627cd8a21a0764e876bb435e58'),(1315309520813363201,'portal_config','Record all','记录所有','Record all','fc674f57978936f857b7d2c33194c77612c8b003'),(1315309520825946112,'portal_config','Record success','记录成功','Record success','d109ad82d42e04109f4a99f9a262917b5d0f7dd0'),(1315309520830140416,'portal_config','Record failure','记录失败','Record failure','0003880fcc99a3c971a1b17be72ed979393f3000'),(1315309520846917632,'portal_config','Portal conn timeout','Portal 连接超时','Portal conn timeout','48c6565c555b2cef352d748e65072bb6a894b858'),(1315309520867889152,'portal_config','Portal conn timeout, 1-30 seconds','Portal 连接超时, 1-30 秒','Portal conn timeout, 1-30 seconds','bac8db431bfdb10a57aa3ecfa14698e64036c00f'),(1315309520947580928,'portal_config','Ac Name','AC 名称','Ac Name','f8833cbd5f45516ff9046ab333f3343dbcc023eb'),(1315309520947580929,'portal_config','Portal Heartbeat','Portal 心跳','Portal Heartbeat','a59f942de2d1acaadec9bacefa17c3c59cbc3d1e'),(1315309520947580930,'portal_config','Enable Portal Heartbeat','启用 Portal 心跳','Enable Portal Heartbeat','0de3d75722631524b5c5c6ce70ef8adb358fa655'),(1315309520981135360,'portal_config','Ac Ip Address','AC IP 地址','Ac Ip Address','d102bbcc110fb972a65acf30b77ce09cd5a4e310'),(1315309521006301184,'portal_config','User Mac','用户 Mac','User Mac','09cd254dc24d2937184ffb6964e05607c98945d6'),(1315309521006301185,'portal_config','User Ip Address','用户 Ip 地址','User Ip Address','915fa3503d5fe50af5233b4fc375ee6d6f8a1481'),(1315309521006301186,'portal_config','SSID','SSID','SSID','d25db316c6190dfe0161d9c784d6a3708db087ef'),(1315309521006301187,'portal_config','AP Mac','AP Mac','AP Mac','31f11d465a34614a92a8603f780e1a85214fecca'),(1315309521023078400,'portal_config','AP Ip Address','AP Ip 地址','AP Ip Address','2543e547a16c9b9a44229709ae802aa5cec6b91a'),(1315309521039855616,'portal_config','User First Url','User 访问首页','User First Url','01bf8693890cc76c79c167a07438f8b741af8860'),(1315309522050682880,'pprofile','Name','名称','Name','b80af2ab4212d188ef16795ecccd22364120427d'),(1315309522071654400,'pprofile','Ad Code','广告代码','Ad Code','d7da32db2bf3644db535ff4196f436e431106a2a'),(1315309522088431616,'pprofile','Tags','标签','Tags','00c39147467f8635dd9d025e5f3cd49f4f45f64b'),(1315309522105208832,'pprofile','Channels','渠道','Channels','a9a529c578574c6cc4702cabb75a167dc93a1215'),(1315309522121986048,'pprofile','Portal Protocol','Portal 协议','Portal Protocol','645bd80f2281202ebd414a0c13f01db8dbc72dbb'),(1315309522138763264,'pprofile','Sms Auth','短信认证','Sms Auth','d101ebef7f6a1027ff7147cb09b8534db7865a31'),(1315309522155540480,'pprofile','Mail Auth','邮箱认证','Mail Auth','bb62ef290b878e7c357257215e5d3416cc0b93a9'),(1315309522172317696,'pprofile','Weixin Auth','微信认证','Weixin Auth','08c9bfbd8d7a6a31a0e581d83e299d6405385a6e'),(1315309522189094912,'pprofile','Guest Auth','访客认证','Guest Auth','589e0c4574750373d0480527473a199f35d391a7'),(1315309522205872128,'pprofile','User Auth','用户认证','User Auth','df486d91f656f113f4a10b10fd813ca788907530'),(1315309522222649344,'pprofile','Fix Passwd Auth','固定密码认证','Fix Passwd Auth','e79f60bd18ce508f1c046e720b292a08338ef861'),(1315309522239426560,'pprofile','OTP Auth','动态密码认证','OTP Auth','7117c00a4f0a5f6ecbe99c7f3abacddab17feb91'),(1315309522256203776,'pprofile','Silence Auth','无感知 Auth','Silence Auth','650534bd76ccd1250ed2f53d7421d15659d3440f'),(1315309522272980992,'pprofile','Pap/Chap','Pap/Chap','Pap/Chap','7f119a0aa8458af9d8e59480071a10d356366a65'),(1315309522293952512,'pprofile','Portal Template','Portal 模板','Portal Template','55607f1ce2f2adfa5f6279c7a21a74842b843700'),(1315309522314924032,'pprofile','Ldap Server','Ldap 服务器','Ldap Server','70c25bc176b84b5d8b0de350779c68051a2563fb'),(1315309522331701248,'pprofile','Status','状态','Status','593494ab18a136f0224520d197f868356713f3d5'),(1315309522348478464,'pprofile','Forced Portal','强制门户首页','Forced Portal','182aa95d373dd53e4252ba2b8680e36b21c99fbe'),(1315309522361061376,'pprofile','Custom Service','自助服务地址','Custom Service','e11dfad5eb3f3a9fe0638cf590e6398a849954c7'),(1315309522377838592,'pprofile','Portal Remark','Portal 备注','Portal Remark','3ff5013f8399a1a56bbc3227ec593a1d4aaaf696'),(1315309522394615808,'pprofile','CreateTime','创建时间','CreateTime','3484397ae88a07a2c8e2830e573a58ad39dfdb5e'),(1315309522411393024,'pprofile','UpdateTime','更新时间','UpdateTime','e059f16251cfaccc03a27220a1349db8943c30ef'),(1315309524462407680,'place','Name','名称','Name','a8c82b5df21080a5827ca9f7375343a7ff46e30a'),(1315309524462407681,'place','Channel','渠道','Channel','6efa011fa2a896c9f6d9999b848ce005722d59b1'),(1315309524512739328,'place','ID','ID','ID','f862da75b0f615473aa53925bed6186a17586e79'),(1315309524512739329,'place','Geo Location','地理位置','Geo Location','d6ed2114ba787f4a19936adb4d0dbf63f63174d1'),(1315309524512739330,'place','Portal Profile','Portal 配置','Portal Profile','e06a6e81ffa4b3b279f1be288b8aed5f6b2049b6'),(1315309524542099456,'place','Tags','标签','Tags','273ef45f6b855437340eac0ff317d8480dd28bd2'),(1315309524646957056,'place','Portal Remark','Portal 备注','Portal Remark','cc649236197e203f350b5b479c656aab61391d1e'),(1315309524667928576,'place','CreateTime','创建时间','CreateTime','43a3994a943918cebb3fe5a43639308e15d1242f'),(1315309524684705792,'place','UpdateTime','更新时间','UpdateTime','88a20ddb9c9b1f85474712c2d9a822a7183e24ca'),(1315309541126377472,'subscribe','Node','区域节点','Node','5586510d72adbe3456864639c7e6fd812bb25f6a'),(1315309541130571776,'subscribe','Channel','渠道','Channel','38b793bcb3fa007cc09404eea71a11d9f039966f'),(1315309544297271296,'net_acl','Name','名称','Name','510ba3846480f2eb5973dee9a055d7615773c25c'),(1315309544305659904,'net_acl','Classify','类别','Classify','8870fa5b2c4c1aa39f2a09745175f50380d61bbe'),(1315309544305659905,'net_acl','Action','动作','Action','40f0ac6695773171b3f19ec49c0c2823b779d0ea'),(1315309544305659906,'net_acl','mobile','电话','mobile','31e67749c82c5a1726311f8bd756f07973bbf034'),(1315309544309854208,'net_acl','Username','用户名','Username','c3408567a7049fbd707521a024cbff8ced169a0a'),(1315309544314048512,'net_acl','Nas Ip','Nas IP','Nas Ip','1b0bc77435487d2c45863b97177cc62130ccf607'),(1315309544435683328,'net_acl','Nas Mac','Nas Mac','Nas Mac','3183938cc2f04179d69f1f0451a4b45a83220d74'),(1315309544435683329,'net_acl','Src Ip','源 Ip','Src Ip','61fe391a739a422e3077bbadc976e96ff5a77741'),(1315309544439877632,'net_acl','Src Mac','源 Mac','Src Mac','d58d686666404a4743987a63e56862b63705e1fe'),(1315309544444071936,'net_acl','Target Network','目标网络','Target Network','97cc2fc2328bee2bce5d557708aa549a23748f93'),(1315309544465043456,'net_acl','Priority','优先级','Priority','a9764c4d4e55a2ba561241a1cc1971f461ead185'),(1315309544477626368,'net_acl','Hits','命中','Hits','cbf7372ddc18d59614fa34864fb8e0dffa17687f'),(1315309544490209280,'acl','Tags','标签','Tags','860e360bdd1338f27297f07d15b364cfdc785b33'),(1315309544519569408,'acl','Name','名称','Name','dc9786582ac9522bc1f66d9c9daa1de389c9f4bf'),(1315309544536346624,'acl','Username','用户名','Username','4b5eea2c3f425f9abe1a2d0fb5a093a452989fb0'),(1315309544553123840,'acl','mobile','mobile','mobile','066999da09f9c3908eefab24a42bcf965297262a'),(1315309544569901056,'acl','Nas Ip','Nas Ip','Nas Ip','dfca8cc0eb012fe6dd87b08c7f548c6bed688983'),(1315309544586678272,'acl','Nas Mac','Nas Mac','Nas Mac','1afa00db5fa46d9e17deb622a0248fbdab8781b0'),(1315309544603455488,'acl','Src Ip','Src Ip','Src Ip','e6b5b8dfdd20a7b947f286a446978dbffc41f95b'),(1315309544620232704,'acl','Src Mac','Src Mac','Src Mac','10cbfb697cb142efc4249a8367f63a3975078efd'),(1315309544637009920,'acl','Target Network','Target Network','Target Network','5a5b20f459d7a44bdbb4d53238716d20f35fd844'),(1315309544653787136,'acl','Priority','Priority','Priority','1f77c3298a0a52c33b5e769944438a536cbe0157'),(1315309544674758656,'acl','Hits','Hits','Hits','b263130f100988f5dfdee0bb7b412295617abae1'),(1315309544691535872,'acl','Action','Action','Action','1b77ab451968645504a580cbcbaaf3e49217ffe8'),(1315309544712507392,'acl','Classify','Classify','Classify','62a1743d7dcc620fc0433977fec01020746231fa'),(1315309544737673216,'acl','Status','Status','Status','79b0522f3d8a87ee52e0650a95bf7fd54892b0c1'),(1315309573267329024,'place','Create Place','创建场所','Create Place','db44c7f3cc808e089b61b073f09b67015537bee9'),(1315309599783718912,'place','Modify Place','修改场所','Modify Place','5c41ded19d1b363436fd3759f94806ec37ebb5e3'),(1315309609015382016,'place','Copy Place','拷贝场所','Copy Place','5a031565fa843326b175621d0b353c999343cf48'),(1315309623846440960,'pprofile','Mobile Preview','移动终端预览','Mobile Preview','c8062e3c7282f4a411bccafda7eff6719ed4d8a0'),(1315309623846440961,'pprofile','Create PortalProfile','创建 Portal','Create PortalProfile','d66f4513ba16b6d0a24c655b5c4ec0bef1071a0b'),(1315309623850635264,'pprofile','Portal Profile','Portal 配置','Portal Profile','0a19ee94a7b6bc8a2857b9355cafae3600a92960'),(1315309623854829568,'pprofile','PC Preview','PC 预览','PC Preview','71c6c0ce35f046db06ded609750629fc014285b9'),(1315309623892578304,'pprofile','AD Code','广告代码','AD Code','4e5ed31f5cb05d2b2ad0c3ea0acc16ff4ba1d043'),(1315309623997435904,'pprofile','default portal template','默认 Portal 模板','default portal template','8e0de5bd8eb7cf75d369d63a3a53dce0c22aa776'),(1315309634214760448,'pprofile','Modify PortalProfile','修改 Portal','Modify PortalProfile','8aa927e76778c9b0a9f5b8f4c3bb08467829910c'),(1315309645241585664,'pprofile','Copy PortalProfile','拷贝 Portal 配置','Copy PortalProfile','1aeecc9fa99e6b0182bb9bb210cccd7a4ba36173'),(1318411283682627584,'menus','Widgets','Widgets','Widgets','b4cc4875cf92b0ca416fc9f0ae1d6568be7f0d42'),(1318411308756176896,'widget','Widget name','Widget 名称','Widget name','f09b284c9bc004d209eeda1c896d0e6bc6c6ee82'),(1318411308772954112,'widget','Widget Title','Widget 标题','Widget Title','80590668ccdbaa6647123a5bde6326f4b32e75f2'),(1318411308789731328,'widget','Widget BgColor','Widget 背景颜色','Widget BgColor','12e381b59ed9e7ba96a31b6b2cc001319c600586'),(1318411308806508544,'widget','Widget Width','Widget 宽','Widget Width','c4226b6540c1cff265ee567623206ef2602fe626'),(1318411308823285760,'widget','Widget Height','Widget 搞','Widget Height','56fca53dbd50e0b44731fbe64888106a40ec2ad9'),(1318411308840062976,'widget','Widget Type','Widget 类型','Widget Type','3d379e49bbbcf5becaf13fc2e430b0d2bb6a46f5'),(1318411308856840192,'widget','Source Url','数据源','Source Url','8857d215140ab3756c96115e82f5eb83fb82a3b6'),(1318412118835662848,'uiconfig','System Theme','系统主题','System Theme','a992e7b4a9a4fc3fa387b15e3e6b21d143bc9ce8'),(1318412145897312256,'pprofile','Title','标题','Title','59f702da1693f97f755be9bc66e8b285eb75208e'),(1318412145914089472,'pprofile','Username Auth','用户认证','Username Auth','25ae77795324b85523224a39a06a49acd0d6514a'),(1318412147138826240,'place','Ac Bind','AC 绑定','Ac Bind','607bdfc8b55e460b16386a13af4d305eb4e4e439'),(1318412157456814080,'mail_config','Mail Server','邮件服务器','Mail Server','442ea9a3dcc8446291df5ec5d7fb500d728f6ebc'),(1318412157456814081,'mail_config','Mail Sender Alias','发送别名','Mail Sender Alias','1c5649eaa63bc93735c5ba233ca495f3562e1315'),(1318412157456814082,'mail_config','Mail Port','邮件服务器端口','Mail Port','a0a5c31e56e4d2c156a5e7cfba188740dd9d0962'),(1318412157456814083,'mail_config','Mail Sender','发送者邮箱','Mail Sender','05d02644352f841af30ccf5ce40255d79e9af57a'),(1318412157456814084,'mail_config','TLS Enabled','TLS 启用','TLS Enabled','ab5aded491e3a80c2cc898c80727ce819e9541fc'),(1318412157469396992,'mail_config','Mail Password','发送密码','Mail Password','9d05099ded778aed52cb97086a078b25ada236ff'),(1318412157494562816,'sms_config','Sms Secretid','短信网关 Secretid','Sms Secretid','a94d4892f10a29bcd177107a537d38ccae4d2d26'),(1318412157515534336,'sms_config','Sms Region','短信网关区域','Sms Region','1791b25c2b45b2a7b12244159fe176d92d675e99'),(1318412157515534337,'sms_config','Sms Appid','短信网关 Appid','Sms Appid','8201515e345c277abbae3eabafe09077555a5f31'),(1318412157515534338,'sms_config','Sms Secretkey','短信网关 Secretkey','Sms Secretkey','42fccd1efcd146d65288c0e9d7a287336fec3c0a'),(1318412157515534339,'sms_config','Sms Sign','短信签名','Sms Sign','45bfe431305da95d37b8048d86bf9b7da01eacf1'),(1318412157532311552,'sms_config','Sms Template','短信模板','Sms Template','add2042b325c0dcdf1a44f52ec4f5830938f28d6'),(1318413744954740736,'vpe','Ac Port','AC 端口','Ac Port','f40f04a0d406eefb255cef4a7498f8aa8869c222'),(1318414040154050560,'global','Query Type','查询类型','Query Type','c41bdd8aa1973a261a9fc7ab73d3ef367bcd8d70'),(1318414223931674624,'portal_config','Portal index Page','Portal 首页','Portal index Page','c81ea573a1258fa2d82494355cea3ea1d0264e7a'),(1318414223944257536,'portal_config','Username','用户名','Username','3fe92fe36c49df96ddc4e7ba51e016cbed8bb746'),(1318414998233747456,'portal','Username','用户名','Username','5bfb97434763673d4832919de50ccd96bc009a86'),(1318414998250524672,'portal','User Mac','用户 Mac','User Mac','ca503eb3cd652aa7f924b8df1b79c35e12f736f4'),(1318414998267301888,'portal','User Ip','用户 IP','User Ip','880e22b94b0c779e4e4c614494d9d0906e46a33c'),(1318414998284079104,'portal','Ac Ip','AC IP','Ac Ip','ff48484ce97bb335f23543af7320ad500ca1a3a0'),(1318414998300856320,'portal','Ac Name','AC 名称','Ac Name','76dee6ef9ebbeee9001c3d86fcc6ac906c46d3a2'),(1318414998313439232,'portal','Ap Ip','Ap IP','Ap Ip','c9eb074fc1ee17f7801f2204c83294a5aba51207'),(1318414998330216448,'portal','Ac Mac','Ac Mac','Ac Mac','f0f81f8f447f398be3ad18ea9a5b5645bdef63ff'),(1318414998346993664,'portal','Ssid','Ssid','Ssid','8668ca0638f0ced19f396038628e1f0e35d3f27d'),(1318414998363770880,'portal','Place','场所','Place','cca2ad6ed9cdfe35facfe1580376567dedffd925'),(1318414998380548096,'portal','Method','认证方法','Method','52d40d835b92e74e87f2100abfe6c30d9ec2600d'),(1318414998397325312,'portal','OS Name','OS 名称','OS Name','773ab455cb9ec5340c65af08946da8310b8b9fbb'),(1318414998409908224,'portal','OS Version','OS 版本','OS Version','3ee67729300e9dd23b633943308f061eca546730'),(1318414998426685440,'portal','Browser','浏览器','Browser','128fb273886708b05349f4e3c6744141d3dbee08'),(1318414998443462656,'portal','Browser Version','浏览器版本','Browser Version','a8cc994d110fe31abaad80c29b8275908432e3c5'),(1318414998460239872,'portal','Engine','引擎','Engine','181d48f7728f454fbacd8442ba5cf055aa56f846'),(1318414998477017088,'portal','Engine Version','引擎版本','Engine Version','d564a7c1277d9970ac4304151ec2888e03b400bc'),(1318414998493794304,'portal','UA Hash','UA Hash','UA Hash','fc4e57f0a821cf3f37a3d751f46859d1004324de'),(1318414998510571520,'portal','Language','语言','Language','6551b20773e352a9dfc1fbb372ec646ff361f5cc'),(1318414998527348736,'global','Cast Msecs','耗时毫秒','Cast Msecs','2c8bc102739ea924d1cfd31051c2c26c5db8152f'),(1318414998544125952,'portal','Auth Remark','认证备注','Auth Remark','f6b2a270cf33c79b9f8fc37277b79f8f673a6e1b'),(1318420427441508352,'channel','Modify Channel','修改渠道','Modify Channel','4c10f2183e4aaf2dbe4d084ab77205d01571165f'),(1318433707161620480,'pprofile','Status Page','状态页','Status Page','7779e229c88abc2e1a7e2bada53b7f5e96134009'),(1318433707165814784,'pprofile','Custom Service Url','自助服务地址','Custom Service Url','8e505685eef95df3d9ab4103c2b2209c01a602fe'),(1318433707165814785,'pprofile','Forced Welcome Url','强制欢迎页','Forced Welcome Url','b5c99e4ac1cf349815e05d6ff2e82eb2ac105730'),(1318433707165814786,'pprofile','Template Vars','模板变量','Template Vars','d63f8fadb3b52b7af34d385a1ed52b8ce6ac0ded'),(1318433707165814787,'pprofile','Var Sort','排序','Var Sort','4af6b3447a0f558af1b00499fb797533af0cd75e'),(1318433707170009088,'global','保存','保存','保存','d85b5f53ba18810305c66af0f3a11b665719f41d'),(1318433707199369216,'pprofile','Var Name','变量名','Var Name','3257b7d27d6bc458652326ea49bd7ec2a04a3ac4'),(1318433707211952128,'pprofile','Var Remark','变量备注','Var Remark','999898328d20c3ac48b07d58e89ce7704bef0886'),(1318433707232923648,'pprofile','Var Value','变量值','Var Value','2910025a52674a8c4a106a6e5904d564f0780d6a'),(1318433707232923649,'pprofile','my portal template','my portal template','my portal template','7457c4062b8a87184d4d6da092deeb4211972c38'),(1318433727491411968,'portal','Public WiFi User Agreements','公共WiFi用户许可协议','Public WiFi User Agreements','84fe9b66b27166538060644692086cec039088f4'),(1318433727512383488,'portal','Password','密码','Password','e505545b8f95f6b2201f353519515409c70ad427'),(1318433727529160704,'portal','Login','认证','Login','25796af7d372e73a1349c08f0a1530ea44deccc3'),(1318433727545937920,'portal','Weixin Auth','微信认证','Weixin Auth','e6781bad8c7be5573afae5e4d887b7cb12a5d677'),(1318433727562715136,'portal','Mail Auth','邮箱认证','Mail Auth','44fa4ba2bd76c6158c322395f6bfbdbb6497cae1'),(1318433727579492352,'portal','Sms Auth','短信认证','Sms Auth','e8471d32ccc8386e4d25a00229faaa5a1989ead0'),(1318433727596269568,'portal','Guest Auth','访客认证','Guest Auth','b4ffd5c6f5d8f5b272fd8ea6deb50bac5243a26c'),(1318433780159287296,'portal','Browse the Internet','浏览网络','Browse the Internet','b19cb69389aef55fc8e1673155f8ff7748b96513'),(1318433780180258816,'portal','Disconnect','断开连接','Disconnect','ba2fb8ebf05292c00908481b4581364b7a8d84d2'),(1318583884602216448,'channel','Create Channel','创建渠道','Create Channel','dccee1664df7458ed19f44a31bff4e0bca09fc54'),(1318583969318768640,'channel','Channel Options','渠道选项','Channel Options','a69affca9c8d120cfd83abd51b56b3616c703b69'),(1318584529245769728,'opr','Channel Options','渠道选项','Channel Options','390ee687a127631afe50f11efb5cbd0ef2069526'),(1318594274165854208,'menus','监控中心','监控中心','监控中心','35e6f40e0f1b370438a886571587e96c49d39fc5'),(1318594483344183296,'menus','报表中心','报表中心','报表中心','d62c70486c7b5cf6b45c03df5a8dfe79c8ef6843'),(1318594524226064384,'menus','Portal 管理','Portal 管理','Portal 管理','94fed7cc5eebed46631ec302d998dab4ff1b6af7'),(1318594566269767680,'channel','Copy Channel','拷贝渠道','Copy Channel','5d35bebeadcc584b24ce26655a75efdd331a993f'),(1319033739795566592,'profile','Radius Profile','Radius 策略','Radius Profile','a0ddfab59bc1bfc743c2714d0e1a29e5a15d6fbf'),(1319033739829121024,'profile','Basic Info','基本信息','Basic Info','bcde3eaefbf91c9ad05a7062d2ca6fd5b1ff89cc'),(1319134809049862144,'portal','Send Sms','发送短信','Send Sms','8945752f21e6c1b0ab59d02ab95e0df388572ffb'),(1319134809095999488,'portal','Send Sms Failure','发送短信失败','Send Sms Failure','2c2900b7d28d30d7819fdb233acc8ebcedff2a15'),(1319134809133748224,'portal','UserPasswd Auth','用户密码认证','UserPasswd Auth','0b9446a581764f99fb7f2c6b0a51db27b3b012db'),(1319134815521673216,'portal','Mobile format error','移动电话格式错误','Mobile format error','c4af438dcf113e602d5bd0ab32e094b6a921a8db'),(1319279201773490176,'portal','Send Email','发送邮件','Send Email','1709e8aec72a57958bbd48803027b50a6014f73b'),(1319279201794461696,'portal','Send Mail Failure','发送邮件失败','Send Mail Failure','206436d1e81ca5807339e281c2ab0333d0d77861'),(1319279204885663744,'portal','Email format error','邮箱格式错误','Email format error','ea8a8cac3b407c0206e6ff709f1cc237fa1ae63a'),(1319279230852599808,'portal','Username and verification code/password cannot be empty','用户名密码不能为空','Username and verification code/password cannot be empty','8bc7b9fb4baa287df58bd5bd2758969a79af5340'),(1319279230873571328,'portal','Portal Login Error','Portal 认证错误','Portal Login Error','5e7046e235c072519a36711dd7341e5221628534'),(1319279230890348544,'portal','Back','返回','Back','a2489825e1cb2396eb76a02ba35c89b2955c0863'),(1319279287198879744,'portal','You are offline and welcome to visit again!','您已经下线，欢迎再次访问','You are offline and welcome to visit again!','437f9437a93e9ff85d4bfb2d57ff1196239e2b79'),(1319939490332348416,'menus','Radius Onlines','Radius Onlines','Radius Onlines','e692ddf2536b1f3c5a750a9e68151adfd17c748a'),(1319939490449788928,'menus','Radius Accounting','Radius Accounting','Radius Accounting','9e1d32c6be3a224cf655aca18ca9fb10c945e705'),(1319939490537869312,'menus','Authentication logs','Authentication logs','Authentication logs','7f2f943275b35742dd2ef5262b6cece715aa4a34'),(1319939490646921216,'menus','Subscribe Copy','Subscribe Copy','Subscribe Copy','46a70d40810c1e008525db2c3d8e0086a6644592'),(1319939490697252864,'menus','Subscribe Profile Modify','Subscribe Profile Modify','Subscribe Profile Modify','c2a0a0716020170d683dad71ce5521bd9dfed788'),(1319939490810499072,'menus','Blacklist','Blacklist','Blacklist','ef2a931645e22be92cf615f92f51cb87a6155280'),(1319939643407667201,'radius_config','Delayed response after reaching the number of denials within 10 seconds.','Delayed response after reaching the number of denials within 10 seconds.','Delayed response after reaching the number of denials within 10 seconds.','402a3fd38190ae96cfea14a95744a3b746b97d4b'),(1319939643470581760,'radius_config','Reject Delay Times','Reject Delay Times','Reject Delay Times','3c583f1d8d628f17399169cf25cba18fbd0ec8b3'),(1319942468820865024,'blacklist','Name','Name','Name','3ac5077518c0d9f178857cc99deba8bf0e702e39'),(1319942468837642240,'blacklist','Username','Username','Username','818ff5b9dabfe2c89eb4e95bf6d6c93193579e77'),(1319942468854419456,'blacklist','Classify','Classify','Classify','f07f272e6ec4a2ec15a61d839af9d5c3de11ee85'),(1319942468854419457,'blacklist','User Ip','User Ip','User Ip','a0d7e0ac1a0ce4a449d146f8c6773b3efb9ac0ef'),(1319942468871196672,'blacklist','User Mac','User Mac','User Mac','5be99b7f3269313ee13723a2240251efda94dbe7'),(1319942468913139712,'blacklist','Target Network','Target Network','Target Network','f01af2a40b3ee86dedf5df4a6e6d6843d5881bc4'),(1319942468955082752,'blacklist','Tags','Tags','Tags','2d450fcee8af38e161e2d6ca3717b87a73100d88'),(1319942469160603648,'blacklist','Hits','Hits','Hits','8e2de0e434369f481b6f2017662b513b3f11b6ac'),(1319942469202546688,'blacklist','Status','Status','Status','448f8c458a0788ba6dcdb350ac8686b991ee3cdf');
/*!40000 ALTER TABLE `bss_trans` ENABLE KEYS */;

--
-- Table structure for table `bss_widget`
--

DROP TABLE IF EXISTS `bss_widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bss_widget` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `levels` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bgcolor` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dx` int(11) NOT NULL,
  `dy` int(11) NOT NULL,
  `type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `src` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100009 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bss_widget`
--

/*!40000 ALTER TABLE `bss_widget` DISABLE KEYS */;
INSERT INTO `bss_widget` (`id`, `name`, `tags`, `levels`, `title`, `bgcolor`, `icon`, `dx`, `dy`, `type`, `src`) VALUES (100000,'system_memuse','Monitor','all','Memary Use','#009788','mdi mdi-gauge',1,2,'metrics','/bss/metrics/value/system_memuse'),(100001,'system_cpuuse','Monitor','all','CPU Use','#009788','mdi mdi-gauge',1,2,'metrics','/bss/metrics/value/system_cpuuse'),(100002,'user_total','Monitor','all','Normal User','#3F51B5','mdi mdi-gauge',1,2,'metrics','/bss/metrics/value/user_total'),(100003,'user_expire','Monitor','all','Expire User','#3F51B5','mdi mdi-gauge',1,2,'metrics','/bss/metrics/value/user_expire'),(100004,'user_disabled','Monitor','all','Disabled User','#3F51B5','mdi mdi-gauge',1,2,'metrics','/bss/metrics/value/user_disabled'),(100005,'radius_online','Monitor','all','Online User','#3F51B5','mdi mdi-gauge',1,2,'metrics','/bss/metrics/value/radius_online'),(100006,'profile_count','Monitor','all','Profile Count','#3F51B5','mdi mdi-gauge',1,2,'metrics','/bss/metrics/value/profile_count'),(100007,'nas_count','Monitor','all','NAS Count','#3F51B5','mdi mdi-gauge',1,2,'metrics','/bss/metrics/value/nas_count'),(100008,'ldap_count','Monitor','all','Ldap Nodes','#3F51B5','mdi mdi-gauge',1,2,'metrics','/bss/metrics/value/ldap_count');
/*!40000 ALTER TABLE `bss_widget` ENABLE KEYS */;

--
-- Table structure for table `net_authlog`
--

DROP TABLE IF EXISTS `net_authlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `net_authlog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `channel_id` bigint(20) NOT NULL,
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nas_addr` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cast` int(11) NOT NULL,
  `result` enum('success','failure') COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `net_authlog`
--

/*!40000 ALTER TABLE `net_authlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `net_authlog` ENABLE KEYS */;

--
-- Table structure for table `net_blacklist`
--

DROP TABLE IF EXISTS `net_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `net_blacklist` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userip` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usermac` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int(11) NOT NULL,
  `classify` enum('radius','portal','socks5') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `net_blacklist`
--

/*!40000 ALTER TABLE `net_blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `net_blacklist` ENABLE KEYS */;

--
-- Table structure for table `net_ldap`
--

DROP TABLE IF EXISTS `net_ldap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `net_ldap` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `searchdn` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `basedn` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_filter` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `istls` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `net_ldap`
--

/*!40000 ALTER TABLE `net_ldap` DISABLE KEYS */;
INSERT INTO `net_ldap` (`id`, `tags`, `name`, `address`, `password`, `searchdn`, `basedn`, `user_filter`, `istls`, `status`, `remark`, `create_time`, `update_time`) VALUES (1,'N/A','default','127.0.0.1:389','0','dc=toughstruct,dc=com','cn=admin,dc=toughstruct,dc=com','(&(objectClass=organizationalPerson)(uid=%s))','enabled','enabled','default ldap node','2020-10-10 00:00:00','2020-10-10 00:00:00'),(2,'N/A','mac auth ldap','127.0.0.1:389','0','dc=toughstruct,dc=com','cn=admin,dc=toughstruct,dc=com','(&(objectClass=radiusprofile)(radiusCallingStationId=%s))','enabled','enabled','Mac auth ldap node','2020-10-10 00:00:00','2020-10-10 00:00:00');
/*!40000 ALTER TABLE `net_ldap` ENABLE KEYS */;

--
-- Table structure for table `net_profile`
--

DROP TABLE IF EXISTS `net_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `net_profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channels` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addr_pool` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active_num` int(11) NOT NULL,
  `mfa_status` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `up_rate` int(11) NOT NULL,
  `down_rate` int(11) NOT NULL,
  `limit_policy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `up_limit_policy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `down_limit_policy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bill_times` int(11) NOT NULL,
  `bill_timeunit` enum('second','minute','hour','day','week','month','year') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `net_profile`
--

/*!40000 ALTER TABLE `net_profile` DISABLE KEYS */;
INSERT INTO `net_profile` (`id`, `tags`, `channels`, `name`, `domain`, `addr_pool`, `active_num`, `mfa_status`, `up_rate`, `down_rate`, `limit_policy`, `up_limit_policy`, `down_limit_policy`, `bill_times`, `bill_timeunit`, `status`, `remark`, `create_time`, `update_time`) VALUES (1,'N/A','1','default','N/A','N/A',1,'disabled',10000,10000,'N/A','N/A','N/A',86400,'second','enabled','default','2020-10-10 00:00:00','2020-10-10 00:00:00');
/*!40000 ALTER TABLE `net_profile` ENABLE KEYS */;

--
-- Table structure for table `net_radius_online`
--

DROP TABLE IF EXISTS `net_radius_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `net_radius_online` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `channel_id` bigint(20) NOT NULL,
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nas_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nas_addr` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nas_paddr` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_timeout` int(11) NOT NULL,
  `framed_ipaddr` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `framed_netmask` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mac_addr` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nas_port` bigint(20) NOT NULL,
  `nas_class` varchar(253) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nas_port_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nas_port_type` int(11) NOT NULL,
  `service_type` int(11) NOT NULL,
  `acct_session_id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `acct_session_time` int(11) NOT NULL,
  `acct_input_total` bigint(20) NOT NULL,
  `acct_output_total` bigint(20) NOT NULL,
  `acct_input_packets` int(11) NOT NULL,
  `acct_output_packets` int(11) NOT NULL,
  `acct_start_time` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_net_radius_online_acct_session_id` (`acct_session_id`),
  KEY `ix_net_radius_online_username` (`username`),
  KEY `ix_net_radius_online_mac_addr` (`mac_addr`),
  KEY `ix_net_radius_online_nas_paddr` (`nas_paddr`),
  KEY `ix_net_radius_online_nas_id` (`nas_id`),
  KEY `ix_net_radius_online_nas_addr` (`nas_addr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `net_radius_online`
--

/*!40000 ALTER TABLE `net_radius_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `net_radius_online` ENABLE KEYS */;

--
-- Table structure for table `net_radiuslog`
--

DROP TABLE IF EXISTS `net_radiuslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `net_radiuslog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `channel_id` bigint(20) NOT NULL,
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nas_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nas_addr` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nas_paddr` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_timeout` int(11) NOT NULL,
  `framed_ipaddr` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `framed_netmask` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mac_addr` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nas_port` bigint(20) NOT NULL,
  `nas_class` varchar(253) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nas_port_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nas_port_type` int(11) NOT NULL,
  `service_type` int(11) NOT NULL,
  `acct_session_id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `acct_session_time` int(11) NOT NULL,
  `acct_input_total` bigint(20) NOT NULL,
  `acct_output_total` bigint(20) NOT NULL,
  `acct_input_packets` int(11) NOT NULL,
  `acct_output_packets` int(11) NOT NULL,
  `acct_start_time` datetime NOT NULL,
  `acct_stop_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `net_radiuslog`
--

/*!40000 ALTER TABLE `net_radiuslog` DISABLE KEYS */;
/*!40000 ALTER TABLE `net_radiuslog` ENABLE KEYS */;

--
-- Table structure for table `net_subscribe`
--

DROP TABLE IF EXISTS `net_subscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `net_subscribe` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `node_id` bigint(20) NOT NULL,
  `channel_id` bigint(20) NOT NULL,
  `vpe_ids` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_id` bigint(20) NOT NULL,
  `realname` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dynpasswd` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dyn_created` datetime NOT NULL,
  `mfa_secret` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mfa_status` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addr_pool` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mac_addr` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_addr` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active_num` int(11) NOT NULL,
  `vlanid1` int(11) NOT NULL,
  `vlanid2` int(11) NOT NULL,
  `limit_policy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `up_limit_policy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `down_limit_policy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `up_rate` int(11) NOT NULL,
  `down_rate` int(11) NOT NULL,
  `bind_mac` int(11) NOT NULL,
  `bind_vlan` int(11) NOT NULL,
  `status` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `expire_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_net_subscribe_username` (`username`),
  KEY `ix_net_subscribe_expire_time` (`expire_time`),
  KEY `ix_net_subscribe_create_time` (`create_time`),
  KEY `ix_net_subscribe_profile_id` (`profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `net_subscribe`
--

/*!40000 ALTER TABLE `net_subscribe` DISABLE KEYS */;
INSERT INTO `net_subscribe` (`id`, `tags`, `node_id`, `channel_id`, `vpe_ids`, `profile_id`, `realname`, `mobile`, `email`, `username`, `password`, `dynpasswd`, `dyn_created`, `mfa_secret`, `mfa_status`, `domain`, `addr_pool`, `mac_addr`, `ip_addr`, `active_num`, `vlanid1`, `vlanid2`, `limit_policy`, `up_limit_policy`, `down_limit_policy`, `up_rate`, `down_rate`, `bind_mac`, `bind_vlan`, `status`, `remark`, `create_time`, `expire_time`, `update_time`) VALUES (1,'N/A',1,1,'N/A',1,'testuser','N/A','test@toughradius.com','test01','6eBulgLp6dvevOzf3/DmSA==','N/A','2000-10-10 00:00:00','N/A','disabled','N/A','N/A','11:11:11:11:11:11','N/A',10,0,0,'N/A','N/A','N/A',100000,100000,0,0,'enabled','test user','2020-10-10 00:00:00','2030-10-10 00:00:00','2020-10-24 01:07:45'),(2,'N/A',1,1,'N/A',1,'guest','N/A','guest@toughradius.com','guest','ZTtGJFBYUcZ6SK+VSR4YRg==','N/A','2000-10-10 00:00:00','N/A','disabled','N/A','N/A','N/A','N/A',10,0,0,'N/A','N/A','N/A',100000,100000,0,0,'enabled','guest user','2020-10-10 00:00:00','2030-10-10 00:00:00','2020-10-10 00:00:00'),(3,'N/A',1,1,'N/A',1,'fixuser','N/A','fixuser@toughradius.com','fixuser','6eBulgLp6dvevOzf3/DmSA==','N/A','2000-10-10 00:00:00','N/A','disabled','N/A','N/A','N/A','N/A',10,0,0,'N/A','N/A','N/A',100000,100000,0,0,'enabled','fixuser user','2020-10-10 00:00:00','2030-10-10 00:00:00','2020-10-10 00:00:00');
/*!40000 ALTER TABLE `net_subscribe` ENABLE KEYS */;

--
-- Table structure for table `net_vpe`
--

DROP TABLE IF EXISTS `net_vpe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `net_vpe` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ipaddr` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coa_port` int(11) NOT NULL,
  `ac_port` int(11) NOT NULL,
  `status` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `ldap_id` bigint(20) NOT NULL,
  `remark` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `net_vpe`
--

/*!40000 ALTER TABLE `net_vpe` DISABLE KEYS */;
INSERT INTO `net_vpe` (`id`, `identifier`, `tags`, `name`, `ipaddr`, `secret`, `vendor_code`, `coa_port`, `ac_port`, `status`, `ldap_id`, `remark`, `create_time`, `update_time`) VALUES (1,'default','N/A','default','127.0.0.1','secret','0',3799,2000,'enabled',0,'default test nas','2020-10-10 00:00:00','2020-10-10 00:00:00');
/*!40000 ALTER TABLE `net_vpe` ENABLE KEYS */;

--
-- Table structure for table `portal_authlog`
--

DROP TABLE IF EXISTS `portal_authlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portal_authlog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `channel_id` bigint(20) NOT NULL,
  `username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usermac` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userip` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `acip` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `acname` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apip` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apmac` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ssid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `place_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `os_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `os_ver` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `browser` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `browser_ver` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `engine` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `engine_version` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uahash` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dnt` int(11) NOT NULL,
  `cast` int(11) NOT NULL,
  `result` enum('success','failure') COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_authlog`
--

/*!40000 ALTER TABLE `portal_authlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `portal_authlog` ENABLE KEYS */;

--
-- Table structure for table `portal_place`
--

DROP TABLE IF EXISTS `portal_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portal_place` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vpe_ids` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_id` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL,
  `location` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_portal_place_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_place`
--

/*!40000 ALTER TABLE `portal_place` DISABLE KEYS */;
INSERT INTO `portal_place` (`id`, `tags`, `name`, `vpe_ids`, `channel_id`, `profile_id`, `location`, `remark`, `create_time`, `update_time`) VALUES (1,'N/A','default','1',1,1,'N/A','N/A','2020-10-10 00:00:00','2020-10-10 00:00:00');
/*!40000 ALTER TABLE `portal_place` ENABLE KEYS */;

--
-- Table structure for table `portal_profile`
--

DROP TABLE IF EXISTS `portal_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portal_profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `channels` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adcode` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `csportal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `force_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `protocol` enum('v1','v2') COLLATE utf8mb4_unicode_ci NOT NULL,
  `sms_auth` int(11) NOT NULL,
  `mail_auth` int(11) NOT NULL,
  `guest_auth` int(11) NOT NULL,
  `user_auth` int(11) NOT NULL,
  `fixpwd_auth` int(11) NOT NULL,
  `pap_chap` int(11) NOT NULL,
  `template` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_portal_profile_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_profile`
--

/*!40000 ALTER TABLE `portal_profile` DISABLE KEYS */;
INSERT INTO `portal_profile` (`id`, `channels`, `name`, `title`, `adcode`, `tags`, `csportal`, `force_url`, `protocol`, `sms_auth`, `mail_auth`, `guest_auth`, `user_auth`, `fixpwd_auth`, `pap_chap`, `template`, `status`, `remark`, `create_time`, `update_time`) VALUES (1,'N/A,1','default','defalut portal','N/A','N/A','N/A','https://www.toughstruct.com','v2',1,1,1,1,1,1,'default','enabled','N/A','2020-10-10 00:00:00','2020-10-10 00:00:00');
/*!40000 ALTER TABLE `portal_profile` ENABLE KEYS */;

--
-- Table structure for table `portal_profile_vars`
--

DROP TABLE IF EXISTS `portal_profile_vars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portal_profile_vars` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` bigint(20) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_profile_vars`
--

/*!40000 ALTER TABLE `portal_profile_vars` DISABLE KEYS */;
/*!40000 ALTER TABLE `portal_profile_vars` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-24 21:53:34
