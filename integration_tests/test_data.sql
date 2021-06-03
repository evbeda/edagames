-- MySQL dump 10.13  Distrib 5.7.34, for Linux (x86_64)
--
-- Host: localhost    Database: edagames_web
-- ------------------------------------------------------
-- Server version	5.7.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_app_bot`
--

DROP TABLE IF EXISTS `auth_app_bot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_app_bot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `token` varchar(200) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_app_bot_user_id_65ec3ad7_fk_auth_app_user_id` (`user_id`),
  CONSTRAINT `auth_app_bot_user_id_65ec3ad7_fk_auth_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_app_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_app_bot`
--

LOCK TABLES `auth_app_bot` WRITE;
/*!40000 ALTER TABLE `auth_app_bot` DISABLE KEYS */;
INSERT INTO `auth_app_bot` VALUES (1,'abonilla+bot1@eventbrite.com','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoiYWJvbmlsbGErYm90MUBldmVudGJyaXRlLmNvbSJ9.bQ2uIy4ShAmqNaJ_0BkDyjp8SO1Y2ufr61P7GKKtoXE',1),(2,'abonilla+bot2@eventbrite.com','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoiYWJvbmlsbGErYm90MkBldmVudGJyaXRlLmNvbSJ9.iTBLRfv8bJGovvSj1rZi_Gl2BvTlLwGTBSutksQXU5o',2);
/*!40000 ALTER TABLE `auth_app_bot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_app_user`
--

DROP TABLE IF EXISTS `auth_app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_app_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `email` varchar(254) NOT NULL,
  `username` varchar(25) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_app_user`
--

LOCK TABLES `auth_app_user` WRITE;
/*!40000 ALTER TABLE `auth_app_user` DISABLE KEYS */;
INSERT INTO `auth_app_user` VALUES (1,'!LGh3yHwiX0DN0ZUHd8vnKLlHugYNOWmcPXEGemLh','2021-06-03 14:10:57.401857',0,'abonilla+bot1@eventbrite.com','AliceBot1','2021-06-03 14:10:57.372754',1,0),(2,'!ibTfH8YeoysimhHJkicCfnWxt2H78z581w4u67Jn','2021-06-03 14:11:14.424625',0,'abonilla+bot2@eventbrite.com','BobBot2','2021-06-03 14:11:14.394473',1,0);
/*!40000 ALTER TABLE `auth_app_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_app_user_groups`
--

DROP TABLE IF EXISTS `auth_app_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_app_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_app_user_groups_user_id_group_id_5f174ff0_uniq` (`user_id`,`group_id`),
  KEY `auth_app_user_groups_group_id_b4576925_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_app_user_groups_group_id_b4576925_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_app_user_groups_user_id_2b6e45f5_fk_auth_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_app_user_groups`
--

LOCK TABLES `auth_app_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_app_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_app_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_app_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_app_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_app_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_app_user_user_permi_user_id_permission_id_727a8e97_uniq` (`user_id`,`permission_id`),
  KEY `auth_app_user_user_p_permission_id_cc1b2396_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_app_user_user_p_permission_id_cc1b2396_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_app_user_user_p_user_id_b7c37328_fk_auth_app_` FOREIGN KEY (`user_id`) REFERENCES `auth_app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_app_user_user_permissions`
--

LOCK TABLES `auth_app_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_app_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_app_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add bot',7,'add_bot'),(26,'Can change bot',7,'change_bot'),(27,'Can delete bot',7,'delete_bot'),(28,'Can view bot',7,'view_bot'),(29,'Can add match',8,'add_match'),(30,'Can change match',8,'change_match'),(31,'Can delete match',8,'delete_match'),(32,'Can view match',8,'view_match'),(33,'Can add tournament',9,'add_tournament'),(34,'Can change tournament',9,'change_tournament'),(35,'Can delete tournament',9,'delete_tournament'),(36,'Can view tournament',9,'view_tournament'),(37,'Can add association',10,'add_association'),(38,'Can change association',10,'change_association'),(39,'Can delete association',10,'delete_association'),(40,'Can view association',10,'view_association'),(41,'Can add code',11,'add_code'),(42,'Can change code',11,'change_code'),(43,'Can delete code',11,'delete_code'),(44,'Can view code',11,'view_code'),(45,'Can add nonce',12,'add_nonce'),(46,'Can change nonce',12,'change_nonce'),(47,'Can delete nonce',12,'delete_nonce'),(48,'Can view nonce',12,'view_nonce'),(49,'Can add user social auth',13,'add_usersocialauth'),(50,'Can change user social auth',13,'change_usersocialauth'),(51,'Can delete user social auth',13,'delete_usersocialauth'),(52,'Can view user social auth',13,'view_usersocialauth'),(53,'Can add partial',14,'add_partial'),(54,'Can change partial',14,'change_partial'),(55,'Can delete partial',14,'delete_partial'),(56,'Can view partial',14,'view_partial');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `development_match`
--

DROP TABLE IF EXISTS `development_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `development_match` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bot_1_id` int(11) DEFAULT NULL,
  `bot_2_id` int(11) DEFAULT NULL,
  `score_p_1` int(11) NOT NULL,
  `score_p_2` int(11) NOT NULL,
  `date_match` datetime(6) NOT NULL,
  `user_1_id` int(11) DEFAULT NULL,
  `user_2_id` int(11) DEFAULT NULL,
  `game_id` varchar(50) NOT NULL,
  `tournament_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `development_match_bot_1_id_67b362dc` (`bot_1_id`),
  KEY `development_match_bot_2_id_5e97d493` (`bot_2_id`),
  KEY `development_match_user_1_id_01e1736b_fk_auth_app_user_id` (`user_1_id`),
  KEY `development_match_user_2_id_651e8a00_fk_auth_app_user_id` (`user_2_id`),
  KEY `development_match_tournament_id_id_6d7af59e_fk_tournamen` (`tournament_id_id`),
  CONSTRAINT `development_match_bot_1_id_67b362dc_fk_auth_app_bot_id` FOREIGN KEY (`bot_1_id`) REFERENCES `auth_app_bot` (`id`),
  CONSTRAINT `development_match_bot_2_id_5e97d493_fk_auth_app_bot_id` FOREIGN KEY (`bot_2_id`) REFERENCES `auth_app_bot` (`id`),
  CONSTRAINT `development_match_tournament_id_id_6d7af59e_fk_tournamen` FOREIGN KEY (`tournament_id_id`) REFERENCES `tournaments_tournament` (`id`),
  CONSTRAINT `development_match_user_1_id_01e1736b_fk_auth_app_user_id` FOREIGN KEY (`user_1_id`) REFERENCES `auth_app_user` (`id`),
  CONSTRAINT `development_match_user_2_id_651e8a00_fk_auth_app_user_id` FOREIGN KEY (`user_2_id`) REFERENCES `auth_app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `development_match`
--

LOCK TABLES `development_match` WRITE;
/*!40000 ALTER TABLE `development_match` DISABLE KEYS */;
/*!40000 ALTER TABLE `development_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_app_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(7,'auth_app','bot'),(6,'auth_app','user'),(4,'contenttypes','contenttype'),(8,'development','match'),(5,'sessions','session'),(10,'social_django','association'),(11,'social_django','code'),(12,'social_django','nonce'),(14,'social_django','partial'),(13,'social_django','usersocialauth'),(9,'tournaments','tournament');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-06-03 14:09:38.110516'),(2,'contenttypes','0002_remove_content_type_name','2021-06-03 14:09:38.160943'),(3,'auth','0001_initial','2021-06-03 14:09:38.217505'),(4,'auth','0002_alter_permission_name_max_length','2021-06-03 14:09:38.331890'),(5,'auth','0003_alter_user_email_max_length','2021-06-03 14:09:38.340272'),(6,'auth','0004_alter_user_username_opts','2021-06-03 14:09:38.349047'),(7,'auth','0005_alter_user_last_login_null','2021-06-03 14:09:38.359767'),(8,'auth','0006_require_contenttypes_0002','2021-06-03 14:09:38.362925'),(9,'auth','0007_alter_validators_add_error_messages','2021-06-03 14:09:38.370772'),(10,'auth','0008_alter_user_username_max_length','2021-06-03 14:09:38.378675'),(11,'auth','0009_alter_user_last_name_max_length','2021-06-03 14:09:38.387284'),(12,'auth','0010_alter_group_name_max_length','2021-06-03 14:09:38.399975'),(13,'auth','0011_update_proxy_permissions','2021-06-03 14:09:38.409318'),(14,'auth_app','0001_initial','2021-06-03 14:09:38.472306'),(15,'admin','0001_initial','2021-06-03 14:09:38.633470'),(16,'admin','0002_logentry_remove_auto_add','2021-06-03 14:09:38.702276'),(17,'admin','0003_logentry_add_action_flag_choices','2021-06-03 14:09:38.714354'),(18,'auth_app','0002_remove_user_token','2021-06-03 14:09:38.770704'),(19,'auth_app','0003_bot','2021-06-03 14:09:38.797770'),(20,'auth_app','0004_auto_20210512_1506','2021-06-03 14:09:38.896018'),(21,'tournaments','0001_initial','2021-06-03 14:09:38.942713'),(22,'development','0001_initial','2021-06-03 14:09:38.966131'),(23,'development','0002_match_date','2021-06-03 14:09:38.997505'),(24,'development','0003_auto_20210421_1504','2021-06-03 14:09:39.125026'),(25,'development','0004_auto_20210422_0437','2021-06-03 14:09:39.349119'),(26,'development','0005_auto_20210505_1427','2021-06-03 14:09:39.423452'),(27,'development','0006_auto_20210505_1540','2021-06-03 14:09:39.473327'),(28,'development','0007_auto_20210505_2029','2021-06-03 14:09:39.541504'),(29,'development','0008_bot','2021-06-03 14:09:39.570790'),(30,'development','0009_delete_bot','2021-06-03 14:09:39.610386'),(31,'development','0010_auto_20210517_1811','2021-06-03 14:09:39.842617'),(32,'development','0011_auto_20210518_1053','2021-06-03 14:09:39.960748'),(33,'development','0012_match_tournament_id','2021-06-03 14:09:40.006348'),(34,'sessions','0001_initial','2021-06-03 14:09:40.065704'),(35,'default','0001_initial','2021-06-03 14:09:40.209786'),(36,'social_auth','0001_initial','2021-06-03 14:09:40.212934'),(37,'default','0002_add_related_name','2021-06-03 14:09:40.311080'),(38,'social_auth','0002_add_related_name','2021-06-03 14:09:40.314461'),(39,'default','0003_alter_email_max_length','2021-06-03 14:09:40.324949'),(40,'social_auth','0003_alter_email_max_length','2021-06-03 14:09:40.328366'),(41,'default','0004_auto_20160423_0400','2021-06-03 14:09:40.343919'),(42,'social_auth','0004_auto_20160423_0400','2021-06-03 14:09:40.347802'),(43,'social_auth','0005_auto_20160727_2333','2021-06-03 14:09:40.365241'),(44,'social_django','0006_partial','2021-06-03 14:09:40.385798'),(45,'social_django','0007_code_timestamp','2021-06-03 14:09:40.433150'),(46,'social_django','0008_partial_timestamp','2021-06-03 14:09:40.477604'),(47,'social_django','0009_auto_20191118_0520','2021-06-03 14:09:40.577527'),(48,'social_django','0010_uid_db_index','2021-06-03 14:09:40.604934'),(49,'social_django','0004_auto_20160423_0400','2021-06-03 14:09:40.610647'),(50,'social_django','0002_add_related_name','2021-06-03 14:09:40.614077'),(51,'social_django','0003_alter_email_max_length','2021-06-03 14:09:40.617824'),(52,'social_django','0001_initial','2021-06-03 14:09:40.621523'),(53,'social_django','0005_auto_20160727_2333','2021-06-03 14:09:40.625249');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4kzdvvxv5jwv8vp6mw63prv492lbhe58','OWU5Y2ZkYWI4NTQ1MzU1MDNlY2NlMDZiZjdjNjYwZmJlMjljMDgzMjp7ImxpbmtlZGluLW9hdXRoMl9zdGF0ZSI6IlNCSWdlQnpjQko4cnFtVjZVaVNpY3BWbVJDUXlRcTRlIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJzb2NpYWxfY29yZS5iYWNrZW5kcy5saW5rZWRpbi5MaW5rZWRpbk9BdXRoMiIsIl9hdXRoX3VzZXJfaGFzaCI6ImU4YTZmNzhlYTU1MjMzODQ2MjU3MGQwNDgyMTgxMTg5ZTliZGVhNGEiLCJzb2NpYWxfYXV0aF9sYXN0X2xvZ2luX2JhY2tlbmQiOiJsaW5rZWRpbi1vYXV0aDIifQ==','2021-06-17 14:10:57.406143'),('uk6zwijpyjocnednazr4ha7u7gdr0thw','MTEzYmFjZmViMTA5ZWEzMzM4NDkxY2QwMWJjZmY2N2UzNTI3MzBlYTp7ImxpbmtlZGluLW9hdXRoMl9zdGF0ZSI6IjUxaVQ2MGtPdjNpbElWTE8yeGE0OFI1RHQ2VnRwRXJNIiwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJzb2NpYWxfY29yZS5iYWNrZW5kcy5saW5rZWRpbi5MaW5rZWRpbk9BdXRoMiIsIl9hdXRoX3VzZXJfaGFzaCI6ImE2MWZlMTY5ZmM0OTE0ZTRjOTdlMjNhMjEyNjY3ZjQwOWM0ODk5NGUiLCJzb2NpYWxfYXV0aF9sYXN0X2xvZ2luX2JhY2tlbmQiOiJsaW5rZWRpbi1vYXV0aDIifQ==','2021-06-17 14:11:14.429019');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_association`
--

DROP TABLE IF EXISTS `social_auth_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_association_server_url_handle_078befa2_uniq` (`server_url`,`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_association`
--

LOCK TABLES `social_auth_association` WRITE;
/*!40000 ALTER TABLE `social_auth_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_code`
--

DROP TABLE IF EXISTS `social_auth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `code` varchar(32) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_code_801b2d02_uniq` (`email`,`code`),
  KEY `social_auth_code_code_a2393167` (`code`),
  KEY `social_auth_code_timestamp_176b341f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_code`
--

LOCK TABLES `social_auth_code` WRITE;
/*!40000 ALTER TABLE `social_auth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_nonce`
--

DROP TABLE IF EXISTS `social_auth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(65) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_nonce_server_url_timestamp_salt_f6284463_uniq` (`server_url`,`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_nonce`
--

LOCK TABLES `social_auth_nonce` WRITE;
/*!40000 ALTER TABLE `social_auth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_partial`
--

DROP TABLE IF EXISTS `social_auth_partial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_partial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `next_step` smallint(5) unsigned NOT NULL,
  `backend` varchar(32) NOT NULL,
  `data` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `social_auth_partial_token_3017fea3` (`token`),
  KEY `social_auth_partial_timestamp_50f2119f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_partial`
--

LOCK TABLES `social_auth_partial` WRITE;
/*!40000 ALTER TABLE `social_auth_partial` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_partial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_usersocialauth`
--

DROP TABLE IF EXISTS `social_auth_usersocialauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_usersocialauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_uid_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersocialauth_user_id_17d28448_fk_auth_app_user_id` (`user_id`),
  KEY `social_auth_usersocialauth_uid_796e51dc` (`uid`),
  CONSTRAINT `social_auth_usersocialauth_user_id_17d28448_fk_auth_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_app_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_usersocialauth`
--

LOCK TABLES `social_auth_usersocialauth` WRITE;
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
INSERT INTO `social_auth_usersocialauth` VALUES (1,'linkedin-oauth2','4j3BssRd8r','{\"auth_time\": 1622729457, \"id\": \"4j3BssRd8r\", \"expires\": 5183999, \"first_name\": {\"localized\": {\"en_US\": \"Alice\"}, \"preferredLocale\": {\"country\": \"US\", \"language\": \"en\"}}, \"last_name\": {\"localized\": {\"en_US\": \"Bot1\"}, \"preferredLocale\": {\"country\": \"US\", \"language\": \"en\"}}, \"username\": \"AliceBot1\", \"email_address\": \"abonilla+bot1@eventbrite.com\", \"access_token\": \"AQW-xM1rmXULUDHZzvb-t63Kj7z6LCSlKeSfhhymfVAxI3V-Pknd-JNSreErEwHTanEP_dEtpAFpzs2QMkAPJTx26TDOTzVFxbzG8aPgtiq3OHUsu5dPy8sURAPa9nV4Wsmo9Oj4UmDZVN08qPvB9QmpRxTSp6Aj4Cu1TyMZxojOSl3cL89HGAP2VvVFSGXpjbqX2Fsw0RxakmPmEFM8fvoiFajbuz-ktNa-ZZCyot723Am2QI_hnLe4l_1cQDFw8DYdPwpmy2RK4gOsyrjG4i-UgMOwjmkrFUXbJw896oDMIUxQBUtyXQAOKAu5vJCSu6wlafxUKVI0FVmDEvK6VcZrRb_4iw\", \"token_type\": null}',1,'2021-06-03 14:10:57.378109','2021-06-03 14:10:57.381075'),(2,'linkedin-oauth2','wNA3AQnHY2','{\"auth_time\": 1622729474, \"id\": \"wNA3AQnHY2\", \"expires\": 5184000, \"first_name\": {\"localized\": {\"en_US\": \"Bob\"}, \"preferredLocale\": {\"country\": \"US\", \"language\": \"en\"}}, \"last_name\": {\"localized\": {\"en_US\": \"Bot2\"}, \"preferredLocale\": {\"country\": \"US\", \"language\": \"en\"}}, \"username\": \"BobBot2\", \"email_address\": \"abonilla+bot2@eventbrite.com\", \"access_token\": \"AQX-XdmuDV4bj7tM5ThCbGcbC2kIE2wp37LzUsSbPbDMSdsGQbcxQrKKjqUtAeIzAr73rGjlHyCrik0dCHbl1EODCG5W4B38AVSwV3vOcfd8CcYfVJ3a0F-4i7yvBEbND9QRzUV3WRUxXiECOL3fTARNErMiMzXOR7M6Qfl6QCROlK2RC1H46hIimfjBw5mF8qJwf6aKHzXIHbnD6Re6wrRHCTKGy-46AYkwcX--6Zv-WohpvDRCnnETsytBAdBQTMqhpFQoM4J1n__UoB_iZw_gsQFWOmZpdPSfPiDKY47APlsEnnL__7_J7EpNFMOB7bIN16xPtPzeAvlY0VuUed8AdSPUZg\", \"token_type\": null}',2,'2021-06-03 14:11:14.401196','2021-06-03 14:11:14.405187');
/*!40000 ALTER TABLE `social_auth_usersocialauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tournaments_tournament`
--

DROP TABLE IF EXISTS `tournaments_tournament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tournaments_tournament` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournaments_tournament`
--

LOCK TABLES `tournaments_tournament` WRITE;
/*!40000 ALTER TABLE `tournaments_tournament` DISABLE KEYS */;
/*!40000 ALTER TABLE `tournaments_tournament` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-03 14:11:31
