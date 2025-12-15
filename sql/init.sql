/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: emapp
-- ------------------------------------------------------
-- Server version	10.11.13-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Ensure we are in the right database for all statements
CREATE DATABASE IF NOT EXISTS `emapp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `emapp`;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
(1,'Can add sequence',1,'add_sequence'),
(2,'Can change sequence',1,'change_sequence'),
(3,'Can delete sequence',1,'delete_sequence'),
(4,'Can view sequence',1,'view_sequence'),
(5,'Can add user sequence',2,'add_usersequence'),
(6,'Can change user sequence',2,'change_usersequence'),
(7,'Can delete user sequence',2,'delete_usersequence'),
(8,'Can view user sequence',2,'view_usersequence'),
(9,'Can add log entry',3,'add_logentry'),
(10,'Can change log entry',3,'change_logentry'),
(11,'Can delete log entry',3,'delete_logentry'),
(12,'Can view log entry',3,'view_logentry'),
(13,'Can add permission',4,'add_permission'),
(14,'Can change permission',4,'change_permission'),
(15,'Can delete permission',4,'delete_permission'),
(16,'Can view permission',4,'view_permission'),
(17,'Can add group',5,'add_group'),
(18,'Can change group',5,'change_group'),
(19,'Can delete group',5,'delete_group'),
(20,'Can view group',5,'view_group'),
(21,'Can add user',6,'add_user'),
(22,'Can change user',6,'change_user'),
(23,'Can delete user',6,'delete_user'),
(24,'Can view user',6,'view_user'),
(25,'Can add content type',7,'add_contenttype'),
(26,'Can change content type',7,'change_contenttype'),
(27,'Can delete content type',7,'delete_contenttype'),
(28,'Can view content type',7,'view_contenttype'),
(29,'Can add session',8,'add_session'),
(30,'Can change session',8,'change_session'),
(31,'Can delete session',8,'delete_session'),
(32,'Can view session',8,'view_session'),
(33,'Can add test table migration',9,'add_testtablemigration'),
(34,'Can change test table migration',9,'change_testtablemigration'),
(35,'Can delete test table migration',9,'delete_testtablemigration'),
(36,'Can view test table migration',9,'view_testtablemigration'),
(37,'Can add results',10,'add_results'),
(38,'Can change results',10,'change_results'),
(39,'Can delete results',10,'delete_results'),
(40,'Can view results',10,'view_results'),
(41,'Can add step settings',11,'add_stepsettings'),
(42,'Can change step settings',11,'change_stepsettings'),
(43,'Can delete step settings',11,'delete_stepsettings'),
(44,'Can view step settings',11,'view_stepsettings');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES
(1,'pbkdf2_sha256$870000$kpiHxPAwA7gWdCYvDWqbmo$KuR+KyVcoywkipp0+PYOPgYopNVTC/Vot/xJ8WMZEfg=','2025-12-07 21:34:02.443072',1,'anzepirnat','','','anze.pirnat2001@gmail.com',1,1,'2025-03-01 12:32:10.699655'),
(2,'pbkdf2_sha256$870000$rwCvUyXmVqmwduN3OQH9D0$sGIHvoZxouM8q8nbBmmwUBrKZmizROZinA9bbWrOhSk=','2025-08-13 17:06:33.454497',0,'test-non-admin-user','','','',0,1,'2025-04-05 12:13:02.562652'),
(3,'pbkdf2_sha256$870000$53EoGj1GWMPBG5Fld7S5Ga$XnHRBD+3GUed7L3r6HqCDr9BvkLbEmcEp8ilGvimbMU=','2025-08-14 11:55:52.016762',0,'850776','','','',0,1,'2025-04-05 13:24:01.034794'),
(4,'pbkdf2_sha256$870000$yAj1lV3cX8Ra8HLI58cyPG$Hp8Cp2NLcIEUWWH5jSph4bNgJjBhJGBQHto1V1OVphU=','2025-05-19 10:07:02.138616',0,'584559','','','',0,1,'2025-04-05 13:24:01.893358'),
(5,'pbkdf2_sha256$870000$PbR47CzkJaTHPNQK0k2Ncc$kDCasSF097I1PZddk1MuxlTQ3UFyLIHm6E4i+mBlEnc=',NULL,0,'571863','','','',0,1,'2025-04-05 13:24:02.754947'),
(6,'pbkdf2_sha256$870000$RRMdDvYidfYCvgjKo8hdxu$bG4A8mmxW4iHrlOfZ0IPWOUlh9Z7RlZEw/VtlL3whYM=','2025-04-05 13:49:16.100275',0,'267197','','','',0,1,'2025-04-05 13:24:03.611020'),
(7,'pbkdf2_sha256$870000$dJkU5ULfffaNmSLelnRau9$Yv3Zv+lOH5/eZ3SPG7u5Mn4PifW9jQ6g4MREB5/I5nk=',NULL,0,'306881','','','',0,1,'2025-04-05 13:24:04.469788'),
(8,'pbkdf2_sha256$870000$cVB6LSFoKiuT7nL3dQGJLV$knfhcQ+MkTEVueWXaJkyIkO5JVWoGriG7MG442UReAg=',NULL,0,'170029','','','',0,1,'2025-04-05 13:24:05.320501'),
(9,'pbkdf2_sha256$870000$dlfear9gfjM3CtKIrKsbBM$fFSlDFO0w4qKegnEuxZ7LHIJTFmXSrwt5n0NH+1hlZw=',NULL,0,'958436','','','',0,1,'2025-04-05 13:24:06.178733'),
(10,'pbkdf2_sha256$870000$GFfjuT94vkqGhAhdshd4k9$wjEpyeJVAWUaCuQCOd75xsRBVJMLiNm3KuTvMeo7G/U=',NULL,0,'560468','','','',0,1,'2025-04-05 13:24:07.030214'),
(11,'pbkdf2_sha256$870000$JIbbFhveyKVScsqM5H2ECg$qtgGhVXtNsxCV34qcgvb0sudGVPFFtl5bbua2qHcg+A=',NULL,0,'536667','','','',0,1,'2025-04-05 13:24:07.887662'),
(12,'pbkdf2_sha256$870000$7U5joBzI8JcMT5A2Xglu6X$L+NGfiraId6oxGS/TSIWJBbTpVJdKSl5WR5e8oymGFs=',NULL,0,'481065','','','',0,1,'2025-04-05 13:24:08.780337'),
(13,'pbkdf2_sha256$870000$tADAyTCibe4jJlPAh2hUOs$XY9/kyX5wTot6r9haDr4YVO3CB4NAii9zJpiw+seBTI=',NULL,0,'309915','','','',0,1,'2025-04-05 13:24:09.650871'),
(14,'pbkdf2_sha256$870000$f48TGGGfQWe8BhFMCjQNN4$fgVUxfVYiwkgcMsaRe4++6bURiuREHa6VjkGJ+WzRgI=','2025-08-13 17:07:10.075853',0,'640203','','','',0,1,'2025-04-05 13:24:10.476532'),
(15,'pbkdf2_sha256$870000$4AIivt912LYUCWW5EIJ425$PoSxsNRknKpBAObGCswgreirAvbWjq4DlFY5OsDMTg8=',NULL,0,'825599','','','',0,1,'2025-04-05 13:24:11.115836'),
(16,'pbkdf2_sha256$870000$9WmypHyrxRpLailA98qdiF$PYuA/PzGNmVozji2jlbwp2VyDAblHodJgCYIsla8laA=',NULL,0,'386994','','','',0,1,'2025-04-05 13:24:11.629765'),
(17,'pbkdf2_sha256$870000$q9p1rML67yYA5yTNFuWfrm$ImIs6fehnJ0LbhYnQHVRCjhSH8nCyRmtVacMhlpY2JY=',NULL,0,'849473','','','',0,1,'2025-04-05 13:24:12.052782'),
(18,'pbkdf2_sha256$870000$hNnG1WNBmBQuAruPUsmyEl$M50iMSV+E5fk5u090x6LBTZdUqGCwv2sJxkIwylR1kI=',NULL,0,'780750','','','',0,1,'2025-04-05 13:24:12.413268'),
(19,'pbkdf2_sha256$870000$uoeFc95FNLK9ZmvVwCdXcu$8AjK1Mg03PO9LacyYnmR5td8EAD1C9xoahGmEcHcGMw=',NULL,0,'589392','','','',0,1,'2025-04-05 13:24:12.733084'),
(20,'pbkdf2_sha256$870000$KD1RxeO05BEUqpMrS1nFts$UZjsiD0ZINJrYEAmsFuqHE73+1QiV843293JbjhPBik=',NULL,0,'834481','','','',0,1,'2025-04-05 13:24:13.023898'),
(21,'pbkdf2_sha256$870000$boDceVvNFNG0PgLnIlL20j$aBEx2lh7U+1aumG8gIJQuYtR4gmvBzcw794cCBkisYo=',NULL,0,'828541','','','',0,1,'2025-04-05 13:24:13.308035'),
(22,'pbkdf2_sha256$870000$S0Um96VrGlA9UGmqZzJpBe$wfippNM+KMgmPEuUM/8n1qEP3JH6NJM0RNthHlC1C4I=',NULL,0,'656358','','','',0,1,'2025-04-05 13:24:13.591822'),
(23,'pbkdf2_sha256$870000$rjKxEMtJlN0F1qTqVa6Dic$Uxz8/rmpytAzgkh2eyWl9PoBzsjQllLs/QBw2QRzepM=',NULL,0,'420594','','','',0,1,'2025-04-05 13:24:13.867520'),
(24,'pbkdf2_sha256$870000$mdWBlF5ctmBtU8pKBUeiIk$1sKI5QUhrW5ie3gKomBlvBza2+KChjZeD2++3iawbaU=',NULL,0,'733837','','','',0,1,'2025-04-05 13:24:14.150791'),
(25,'pbkdf2_sha256$870000$s1UTh5zxK1vr7xn8DV9ddM$lpB2EccTrV8AlKabCa/0PBIOTTufOkGQj8anZAoASvA=',NULL,0,'732648','','','',0,1,'2025-04-05 13:24:14.433631'),
(26,'pbkdf2_sha256$870000$LyIlTJEbFPVl9SLnuEni5c$T+Q0Yfah5T4w2rwwhEPIA9uzKsFhtvM3VHHusZp/AWQ=',NULL,0,'953971','','','',0,1,'2025-04-05 13:24:14.709455'),
(27,'pbkdf2_sha256$870000$s5tgXY9pXSyUKDuUCsfKcq$Vj13wbX2Su+cVFFt1GHzbxbYJ00j3vOX6qTZPyviaIw=',NULL,0,'728534','','','',0,1,'2025-04-05 13:24:14.992174'),
(28,'pbkdf2_sha256$870000$K5Y3RzWjr9pQ1EZgNhrZOk$XmmTF0qa5ZowKKVy+SemLi+Y3NZVHAbVBa0tlov3RaU=',NULL,0,'840767','','','',0,1,'2025-04-05 13:24:15.274424'),
(29,'pbkdf2_sha256$870000$eiJfGmGkKRDHLUDa9N3nDC$dSI8sCC8gKmqQF6D18p8erDzfsZBWs9/5WAlpfhazq4=',NULL,0,'472313','','','',0,1,'2025-04-05 13:24:15.557330'),
(30,'pbkdf2_sha256$870000$MU6OtnF9EA9GjW3vbCeWOM$TmkVrjtl9cPIriFrS4JrwIeHO/RwHKrnqi4VEJdqFjM=',NULL,0,'768048','','','',0,1,'2025-04-05 13:24:15.840498'),
(31,'pbkdf2_sha256$870000$WOQ3aWImJEt7oAmbbrjbnr$BXM0odLLymIpNhZKPqqTwW7OWdriwatmXKXHXA+bN6s=',NULL,0,'231425','','','',0,1,'2025-04-05 13:24:16.124088'),
(32,'pbkdf2_sha256$870000$2J8HpjvKlf8oTBw86ntTLG$aEl0o4FVWmbRBDO1ZHY27HvZ87RIGpiCs6RFM076Ta0=',NULL,0,'764000','','','',0,1,'2025-04-05 13:24:16.406831'),
(33,'pbkdf2_sha256$870000$UC5o1Ac6aKYmt1OMW4yK7k$+GXRz9Gl6sMLlk1Gqg0R71lABZgN1BFChO7nzzsTcVU=',NULL,0,'348842','','','',0,1,'2025-04-05 13:24:16.691500'),
(34,'pbkdf2_sha256$870000$7g2uP6NtxbNZjdplTrAYwX$I1wNYdpidm9uUfR5i4qIt1OfmZzh5M47X1p0KpFzl+M=',NULL,0,'403576','','','',0,1,'2025-04-05 13:24:16.974254'),
(35,'pbkdf2_sha256$870000$X1LfSbbfDrjAQhwe1CVBHD$xxcxLfyc8jNcBF0LAcYcbM1euwK8a/lFuR3K9Yz/hVs=',NULL,0,'744152','','','',0,1,'2025-04-05 13:24:17.258241'),
(36,'pbkdf2_sha256$870000$2XxvnA9SJYohchsfwwkTjR$QlNJKVDrPUdZx7rWjEhswjkPnxUIF7efTkeczt2Zj14=',NULL,0,'664381','','','',0,1,'2025-04-05 13:24:17.539948'),
(37,'pbkdf2_sha256$870000$q7mf8MM82A3SV12MWYKcv5$a1rYdvKEc4flL9Qn1hybnfaOU8OB5ULMFlYD9mCRo0I=',NULL,0,'992038','','','',0,1,'2025-04-05 13:24:17.824393'),
(38,'pbkdf2_sha256$870000$XE00VP5YGYZasQm3jmoMkZ$MST0O+J5AD/5AjDDji3h/vLFTcV1xeNcf/XCWEAt+9c=',NULL,0,'902982','','','',0,1,'2025-04-05 13:24:18.105453'),
(39,'pbkdf2_sha256$870000$GnlHtFuqr0DelciEUX7mNv$SJL7uT1ZkhyZwXmvQlBJNieoiKY4ypmhvM/Cnk2fo80=',NULL,0,'658289','','','',0,1,'2025-04-05 13:24:18.390449'),
(40,'pbkdf2_sha256$870000$kmtdGkcvSQWGqYPov3jmPf$XAsHZK0C1wsTXSkewc/yLyWTc1MlmvEshiUXXUk4jwk=',NULL,0,'695649','','','',0,1,'2025-04-05 13:24:18.674379'),
(41,'pbkdf2_sha256$870000$kjWxraC62EtIBSurlwlWiT$VL1EButz/hrUjzk2/R6ufU8hXDg1IwmFu40V0Krm1WI=',NULL,0,'202259','','','',0,1,'2025-04-05 13:24:18.951645'),
(42,'pbkdf2_sha256$870000$obnm4BdWVgyHy5PXl6c7D3$GMitVsNZ9DBcjOGCa4G0UgiZHXiq14fV8vdFdqUn54Q=',NULL,0,'857153','','','',0,1,'2025-04-05 13:24:19.233925'),
(43,'pbkdf2_sha256$870000$K27WwhGLWcpd7VSSW2DQGW$Wl4xrw0i/YT7GKCqbUuA9AuC0GfBuba1yKPAcv3GjuY=',NULL,0,'131602','','','',0,1,'2025-04-05 13:24:19.516881'),
(44,'pbkdf2_sha256$870000$p7l9I33JVLrPX0HAo6sEqY$C3Ya9/1xrLNx5KXFKiTh0E+qgRdj/4vXWvPZGtmWqAc=',NULL,0,'831841','','','',0,1,'2025-04-05 13:24:19.800922'),
(45,'pbkdf2_sha256$870000$4oAhvruKpkzCi5xgs81MG1$4z6xDdQP7BXyHSb+vVsInZChLAba2isDBeqw7dzwFac=',NULL,0,'572440','','','',0,1,'2025-04-05 13:24:20.081346'),
(46,'pbkdf2_sha256$870000$sThiHy5LdupUbAIchbS6E4$WapQV5oEGLAIVByQN5Lndc1kuX4RaDrNbv+gkMzhzDI=',NULL,0,'183984','','','',0,1,'2025-04-05 13:24:20.363783'),
(47,'pbkdf2_sha256$870000$Rbor2Wdxef2UWzTCgZ9Sdc$jyXBmLLpO5JGYxblbFFUAi+I3dEu8PHlgFHE6FgYHHA=',NULL,0,'443058','','','',0,1,'2025-04-05 13:24:20.647733'),
(48,'pbkdf2_sha256$870000$XYe5bcffXolyUL6DNs3JQ2$WtcYyOt5G17Svol2YEP2gz1KNYCZFWW0o8hSGggluRU=',NULL,0,'645994','','','',0,1,'2025-04-05 13:24:20.932572'),
(49,'pbkdf2_sha256$870000$exhq4Bzp5PguGxKBWLjitQ$iqRKkhh9hgsaC6XtAKrLAEiSojrdg4RpOh+UBoa/85k=',NULL,0,'323322','','','',0,1,'2025-04-05 13:24:21.215883'),
(50,'pbkdf2_sha256$870000$MXtvGVGit2pMCjdT2kgnVD$8aHG+uy6NGWaR522KEbq3rexTzbOptD3iD34HAjeQwg=',NULL,0,'301363','','','',0,1,'2025-04-05 13:24:21.498026'),
(51,'pbkdf2_sha256$870000$XGFBF5jECyOQDK7fRxmB5d$3vPxXd5byu1hqqjcrxEA1cYmQ+kBfDrzaH5Qk4pMaC4=',NULL,0,'114060','','','',0,1,'2025-04-05 13:24:21.784394'),
(52,'pbkdf2_sha256$870000$6ZtWEQbEbfE2tXdYaV3LHe$w64Aw00F17x5sqdVXFn4NdEuEp9joegEC5+DwUtKpc4=',NULL,0,'570996','','','',0,1,'2025-04-05 13:24:22.074799'),
(53,'pbkdf2_sha256$870000$CwFvSxTm1VyOKghFWnVYRw$cfUwBXNb/rN1yw/KeLdHy1vxWpc41tGnKpk9Guj9mfg=',NULL,0,'810792','','','',0,1,'2025-04-05 13:24:22.362747'),
(54,'pbkdf2_sha256$870000$YoDBhzHu7LFoW4psaQrnFH$dRQQwbKqqPoL5SlmAkWWOPEcLEA4cFieVeL0RfcsFGM=',NULL,0,'397676','','','',0,1,'2025-04-05 13:24:22.639311'),
(55,'pbkdf2_sha256$870000$7cx8NtCwgp3TDHNyLD3LoB$caQhWj46Qb1OfauWMZKhHuNMDioeAHYyca14O+qZsWY=',NULL,0,'845606','','','',0,1,'2025-04-05 13:24:22.922167'),
(56,'pbkdf2_sha256$870000$EZuyx5YFN2ddA4q6HxM1zz$U3/2oOybX8kaGpdqw0BAFGPvqE2h+oLeFytZO8bBBI4=',NULL,0,'521728','','','',0,1,'2025-04-05 13:24:23.205662'),
(57,'pbkdf2_sha256$870000$QZaOQZ1iPbYIJtB9XZ7JN9$0LA9K7s8p7610HAfOsKWkY6qEc7IPw8K9jKxjKq4J/M=',NULL,0,'857198','','','',0,1,'2025-04-05 13:24:23.492079'),
(58,'pbkdf2_sha256$870000$DeKvCZhhBlVldtMi459xyw$2HL0PigXld8j1Snt3SyM8lR/0rxGNYoY6hKdNQK8dyI=',NULL,0,'321777','','','',0,1,'2025-04-05 13:24:23.768729'),
(59,'pbkdf2_sha256$870000$z5L9UXrRDx2rB3n8m5T9OM$yW9KVchR3hZD6itVyOFEXueHMuTYub/x4c9oamWhHnY=',NULL,0,'686303','','','',0,1,'2025-04-05 13:24:24.043813'),
(60,'pbkdf2_sha256$870000$vMRQypLpRgrvKBqk9lN1Bp$ycdnmk6LLyA5uc2oNW2hXlUqVEzijTGJUfLUR9gAOoA=',NULL,0,'660027','','','',0,1,'2025-04-05 13:24:24.330985'),
(61,'pbkdf2_sha256$870000$HgNk5Y5D0wSQweChnzMXWh$6iwVnPS5n5O/oPpBJLq2pTLUI5BMAKg+8Dg/6VQXows=',NULL,0,'276032','','','',0,1,'2025-04-05 13:24:24.616892'),
(62,'pbkdf2_sha256$870000$poucFWMjNSJL4BxxdzUQqG$KzCcnhDy+XepVW0dSDsp8IjF/j2UpP5NmiGTAnjY8mQ=',NULL,0,'674236','','','',0,1,'2025-04-05 13:24:24.903738'),
(63,'pbkdf2_sha256$870000$hUGm1pV30GINGj2gfim8s4$4pEUVWrDtm16rDV0BjN8daXecStVRKFAPa5EeLaLegQ=',NULL,0,'460591','','','',0,1,'2025-04-05 13:24:25.198354'),
(64,'pbkdf2_sha256$870000$jZvfx2RpgXjjh3wbKgERYY$EOdcz3uJrPz7S9Id9PdIJ1hbuegKNJ0FS9etPj+UilY=',NULL,0,'975117','','','',0,1,'2025-04-05 13:24:25.522119'),
(65,'pbkdf2_sha256$870000$drbMjeJ833Sl4hpgTdW311$9K93E5HLuBtQjg7zASVxHD9qb8+WG4QE+tLQw3ffzNE=',NULL,0,'169787','','','',0,1,'2025-04-05 13:24:25.816419'),
(66,'pbkdf2_sha256$870000$3DUGruDWGT0fcxDLe80jwE$PB9k5FjTuJi/XuUVfv6pBhpCY/3SeEF0cjeynxhj5V0=',NULL,0,'354926','','','',0,1,'2025-04-05 13:24:26.098679'),
(67,'pbkdf2_sha256$870000$8GRxG3wxbWO8vTZ1S0POHi$FWmRJnF8vkG8smfg5O0hYT5V04UJwiSWKhXoFDulrTE=',NULL,0,'647810','','','',0,1,'2025-04-05 13:24:26.384672'),
(68,'pbkdf2_sha256$870000$8MizU4ltPljQ1agf0caT9g$pGT9H6YsQmFUceUCJzQ1Fl/C1YwMlmmUJu77coE3i0U=',NULL,0,'325526','','','',0,1,'2025-04-05 13:24:26.669641'),
(69,'pbkdf2_sha256$870000$qu7JMiO1dhi6NoKzl2BKoO$nqnLraY7M/EvDun6LiCYUf53HYMG7kPniP0CF5QzduA=',NULL,0,'482943','','','',0,1,'2025-04-05 13:24:26.953106'),
(70,'pbkdf2_sha256$870000$r68emBfPPdQ72Yr2PTUuH3$BZyXtDZql7BYHlsK0Cq4IevXAuzU39nXfctsZkjkans=',NULL,0,'850749','','','',0,1,'2025-04-05 13:24:27.238810'),
(71,'pbkdf2_sha256$870000$aIanEpHf4rv92LyOzMdkeV$4He2ADfbuywG0nZ/8vK1NXgRFO0+1VVndZyUM1KI6pY=',NULL,0,'913011','','','',0,1,'2025-04-05 13:24:27.524559'),
(72,'pbkdf2_sha256$870000$1RDkDX75KGMME6UO710Smo$cATjjSuBv8fC+YLhxsmPwfNPZvpXnhNiYr17pyBLaVE=',NULL,0,'873436','','','',0,1,'2025-04-05 13:24:27.809976'),
(73,'pbkdf2_sha256$870000$luI7pD0aIZNy6eE9WeBKAN$w4fQ4OSy/NGtwy5OIucHemsnZNBQmr+jClls8pI35tY=',NULL,0,'539031','','','',0,1,'2025-04-05 13:24:28.094485'),
(74,'pbkdf2_sha256$870000$Gawbbkpv2vkhg3GvdqCjnr$9SUUVUuravCsB5DQyuAWFOmUQR52kiXHvPVNU8hYtJs=',NULL,0,'613212','','','',0,1,'2025-04-05 13:24:28.380043'),
(75,'pbkdf2_sha256$870000$eCwRmLHDeJAxodssh3KPEQ$LRBmIbLxMvjJN/PS+++bc2iNWUhs26x85Kq0aNis5U4=',NULL,0,'625141','','','',0,1,'2025-04-05 13:24:28.663277'),
(76,'pbkdf2_sha256$870000$uMGgoFkm1x0uHwrErVpxAu$RpLdIm4MxdvbgDivH/DseJpUDg5bi5UzxkJSgAbbmlo=',NULL,0,'713999','','','',0,1,'2025-04-05 13:24:28.949147'),
(77,'pbkdf2_sha256$870000$4NPCuiJGtzGGvsZ2A2nDnC$2i1l1qM8di0cxE0M20f4bDN//TzTzgPkdq+a5p4KjTc=',NULL,0,'123474','','','',0,1,'2025-04-05 13:24:29.231272'),
(78,'pbkdf2_sha256$870000$hubretwNzza8jTjKAIqsyw$guscEII5M+CZQ0HHLAPPTHRxau5m7XVr7VaCdb68vfI=',NULL,0,'762013','','','',0,1,'2025-04-05 13:24:29.518595'),
(79,'pbkdf2_sha256$870000$XQqQ1l38GXyyeMhwzDQIxH$gNs6eZ7vtikaMKAY5mnQOEbrZrNEEk0Jp/KOOnrOVw4=',NULL,0,'515901','','','',0,1,'2025-04-05 13:24:29.805224'),
(80,'pbkdf2_sha256$870000$TEEmR7JozVcbetJOwUiCmS$nBsGuIyyPIRoLvbNIiio1LHFAyc5V/hVy0D7xHI5LeE=',NULL,0,'780029','','','',0,1,'2025-04-05 13:24:30.089686'),
(81,'pbkdf2_sha256$870000$Qg47hnOLMa4Gi4rQeEXUvt$2GY5FEHvFwOhxLIPi5zFAygKhSuMOvEix/VkCVMaTVw=',NULL,0,'969749','','','',0,1,'2025-04-05 13:24:30.385336'),
(82,'pbkdf2_sha256$870000$zoM8ImQIginFYe3IsOmia4$f+MXs+6ptxmgtHlLnC1bLAg2q2+dIwfsnkm+E68PVI0=',NULL,0,'632383','','','',0,1,'2025-04-05 13:24:30.680658'),
(83,'pbkdf2_sha256$870000$T2uoIbD6LM3HIIJ7KgtNlL$fkZ+C4C8OKm8qGlafCFAB5MncwsVYa7GjDUeTmMw92o=',NULL,0,'183293','','','',0,1,'2025-04-05 13:24:30.978288'),
(84,'pbkdf2_sha256$870000$7aPbwEctolEk1bzucNo3D7$IeOrbro9JUO+SDXYKlR6c23U5lTcZqWSlF/ALaf1JUQ=',NULL,0,'527490','','','',0,1,'2025-04-05 13:24:31.263982'),
(85,'pbkdf2_sha256$870000$1GD5t0I9nC6RZwZjlU9MU1$/h3YZ15u2W34BoA+Dfp2m9pG/O38mmjKCb3Ui6fkqts=',NULL,0,'338481','','','',0,1,'2025-04-05 13:24:31.558882'),
(86,'pbkdf2_sha256$870000$4EVUG8MAZBbBW4Fc8VFYzU$1echhOnGsQ1dN3Jlfp8DyjDNxtxSCAVwdVaurdp4cKA=',NULL,0,'923640','','','',0,1,'2025-04-05 13:24:31.856293'),
(87,'pbkdf2_sha256$870000$vc631syyOniQa6u7GNk0Jg$I5jyo+fpQSP2SjrSC+259y5Py7zUJoPLwmEso2M+AAM=',NULL,0,'917682','','','',0,1,'2025-04-05 13:24:32.156057'),
(88,'pbkdf2_sha256$870000$qqOjHZdJvnuMtEyH66dZyd$/q8iKRNAtj8xln4BXWO7wgOac9bN38LsDh9NzbkDFvc=',NULL,0,'760769','','','',0,1,'2025-04-05 13:24:32.443260'),
(89,'pbkdf2_sha256$870000$3V8ZRF7f6Akny8RzRYD4TZ$JpnqtvIYXD76JMlkPf2/6+ahL9ZAbApbVT41ztwAYS4=',NULL,0,'287186','','','',0,1,'2025-04-05 13:24:32.739179'),
(90,'pbkdf2_sha256$870000$GkEONfeeJsZ2oVh4QiivpY$+08Fkuk9aPvmcvc9C5zPH7/g9HSVdwng6mrLJp5Sk/8=',NULL,0,'232619','','','',0,1,'2025-04-05 13:24:33.040298'),
(91,'pbkdf2_sha256$870000$lsPOUnp6zFo4S8mNiY8ASk$0Hk0wjuKGFx2P4MBVo1LSQQ2Aq2Prnr74CYMdER3oKA=',NULL,0,'145496','','','',0,1,'2025-04-05 13:24:33.342255'),
(92,'pbkdf2_sha256$870000$YGB6BSHeeG2Id55PgwhKRu$bAs/HZexG3OhFnJd57dGtNCieZC5RSEhD6/FCP1FIoA=',NULL,0,'555544','','','',0,1,'2025-04-05 13:24:33.636183'),
(93,'pbkdf2_sha256$870000$jacKL5oBjTXXBIcDCXTHFt$FPDPt18Ns51KaTwF2x30E7Ry6e/ri3WCvzi6N+4wntY=',NULL,0,'412343','','','',0,1,'2025-04-05 13:24:33.937263'),
(94,'pbkdf2_sha256$870000$rWtZuJY59MCoNe1WTiDncG$hplgjxa61UK4oyNx+7rMwxbpLbOKhaR8+q6iyHmcj+k=',NULL,0,'643157','','','',0,1,'2025-04-05 13:24:34.236123'),
(95,'pbkdf2_sha256$870000$znz60nvvjmZsGKl3mii7yA$eU3dNbpudYCI8vFBaNhkk0gl2CYpdPSWR7L7tOEU/4I=',NULL,0,'319567','','','',0,1,'2025-04-05 13:24:34.536088'),
(96,'pbkdf2_sha256$870000$UilcDkaOA3Maym6HwouBLQ$57vHT3yHUDVQjsYEMFBRNOnkp+qvUJQacTnCe6jV0e4=',NULL,0,'612329','','','',0,1,'2025-04-05 13:24:34.832856'),
(97,'pbkdf2_sha256$870000$FR8cHzq6JT6V7I34ZQBnYj$83k65t55E4A4REAoIFVzRjNZQmbyoLwwJyGDdHNL/80=',NULL,0,'192752','','','',0,1,'2025-04-05 13:24:35.124471'),
(98,'pbkdf2_sha256$870000$KelnVJHRo0thDG6GIKZPVH$XW/iuv5mI5VocFQhjfwaPzGeWoMe+sxdTjepNfTTARY=',NULL,0,'895090','','','',0,1,'2025-04-05 13:24:35.425435'),
(99,'pbkdf2_sha256$870000$D3ioaIHlc0UETpMtEwR2qT$Ff/KrNBwIh3XtNO3JgAcjhhai9EBp2whP2uXL5cufKo=',NULL,0,'835173','','','',0,1,'2025-04-05 13:24:35.725413'),
(100,'pbkdf2_sha256$870000$63EIRkAoRbHX8AlpP2aSOB$LkCufyuBwNwynKXg0LKgOSVqwhz9RN5cFlvfopi9vIw=','2025-08-13 15:59:04.257845',0,'960331','','','',0,1,'2025-04-05 13:24:36.026246'),
(103,'pbkdf2_sha256$870000$HrfuffWP0qE61wnPk6nMtz$glDycrPlzLW7CHRbhuV6qPJfzBVgtWcB6AvQBVKRijw=','2025-08-13 17:03:17.099022',1,'admin','','','',1,1,'2025-04-11 16:03:33.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES
(1,'2025-03-06 08:37:20.558851','1','TestTableMigration 1',1,'[{\"added\": {}}]',9,1),
(2,'2025-03-06 08:37:32.529770','2','TestTableMigration 2',1,'[{\"added\": {}}]',9,1),
(3,'2025-03-06 08:37:39.994515','3','TestTableMigration 3',1,'[{\"added\": {}}]',9,1),
(4,'2025-04-05 12:13:03.428065','2','test-non-admin-user',1,'[{\"added\": {}}]',6,1),
(5,'2025-04-11 16:03:34.664112','103','admin',1,'[{\"added\": {}}]',6,1),
(6,'2025-04-11 16:03:54.817405','103','admin',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\"]}}]',6,1),
(7,'2025-12-07 21:00:57.016578','1','App settings: In sets 1 and 2, same image is shown every 3 images and in sets 3 and 4 every 4 images.',2,'[{\"changed\": {\"fields\": [\"Steps set 1 2\", \"Steps set 3 4\"]}}]',11,1),
(8,'2025-12-07 21:01:13.924741','1','App settings: In sets 1 and 2, same image is shown every 2 images and in sets 3 and 4 every 3 images.',2,'[{\"changed\": {\"fields\": [\"Steps set 1 2\", \"Steps set 3 4\"]}}]',11,1),
(9,'2025-12-07 21:29:37.897406','1','Step settings:\nText in sets 1 and 2: Ali je ta slika enaka kot ena slika pred njo?,\nText in sets 3 and 4: Ali je ta slika enaka kot dve sliki pred njo?',2,'[{\"changed\": {\"fields\": [\"Set 1 2 text\", \"Set 3 4 text\"]}}]',11,1),
(10,'2025-12-07 21:36:42.388322','1','Step settings:\nText in sets 1 and 2: Ali je ta slika enaka kot ena slika pred njo? TEST,\nText in sets 3 and 4: Ali je ta slika enaka kot dve sliki pred njo? TEST',2,'[{\"changed\": {\"fields\": [\"Set 1 2 text\", \"Set 3 4 text\"]}}]',11,1),
(11,'2025-12-07 21:40:34.811031','1','Step settings:\nText in sets 1 and 2: Ali je ta slika enaka kot ena slika pred njo?,\nText in sets 3 and 4: Ali je ta slika enaka kot dve sliki pred njo?',2,'[{\"changed\": {\"fields\": [\"Set 1 2 text\", \"Set 3 4 text\"]}}]',11,1),
(12,'2025-12-07 21:41:36.359752','1','Step settings:\nText in sets 1 and 2: Ali je ta slika enaka kot ena slika pred njo?,\nText in sets 3 and 4: Ali je ta slika enaka kot dve sliki pred njo?',2,'[]',11,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(3,'admin','logentry'),
(5,'auth','group'),
(4,'auth','permission'),
(6,'auth','user'),
(7,'contenttypes','contenttype'),
(10,'emapp','results'),
(1,'emapp','sequence'),
(11,'emapp','stepsettings'),
(9,'emapp','testtablemigration'),
(2,'emapp','usersequence'),
(8,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2025-03-01 11:37:50.351057'),
(2,'auth','0001_initial','2025-03-01 11:37:50.543185'),
(3,'admin','0001_initial','2025-03-01 11:37:50.590080'),
(4,'admin','0002_logentry_remove_auto_add','2025-03-01 11:37:50.601348'),
(5,'admin','0003_logentry_add_action_flag_choices','2025-03-01 11:37:50.612911'),
(6,'contenttypes','0002_remove_content_type_name','2025-03-01 11:37:50.704491'),
(7,'auth','0002_alter_permission_name_max_length','2025-03-01 11:37:50.730502'),
(8,'auth','0003_alter_user_email_max_length','2025-03-01 11:37:50.749282'),
(9,'auth','0004_alter_user_username_opts','2025-03-01 11:37:50.760081'),
(10,'auth','0005_alter_user_last_login_null','2025-03-01 11:37:50.784984'),
(11,'auth','0006_require_contenttypes_0002','2025-03-01 11:37:50.787141'),
(12,'auth','0007_alter_validators_add_error_messages','2025-03-01 11:37:50.797894'),
(13,'auth','0008_alter_user_username_max_length','2025-03-01 11:37:50.818008'),
(14,'auth','0009_alter_user_last_name_max_length','2025-03-01 11:37:50.837996'),
(15,'auth','0010_alter_group_name_max_length','2025-03-01 11:37:50.859996'),
(16,'auth','0011_update_proxy_permissions','2025-03-01 11:37:50.871386'),
(17,'auth','0012_alter_user_first_name_max_length','2025-03-01 11:37:50.889503'),
(18,'emapp','0001_initial','2025-03-01 11:37:50.934000'),
(19,'sessions','0001_initial','2025-03-01 11:37:50.952142'),
(20,'emapp','0002_testtablemigration','2025-03-06 08:33:34.392544'),
(21,'emapp','0003_alter_testtablemigration_some_field','2025-03-06 08:38:47.315176'),
(22,'emapp','0004_testtablemigration_blabla','2025-03-06 08:40:26.652847'),
(23,'emapp','0005_results','2025-03-23 17:01:19.450729'),
(24,'emapp','0006_remove_results_sequence_results_image','2025-03-23 17:20:09.469290'),
(25,'emapp','0007_results_image_idx','2025-03-23 18:35:58.595426'),
(27,'emapp','0008_stepsettings','2025-12-07 21:25:12.291769');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES
('0kzff2uxn5v5ue3lbq9nm1epx7kb0aed','.eJxVjEEOwiAQRe_C2pDBMggu3XuGZmAGqRpISrsy3l2bdKHb_977LzXSupRx7TKPE6uzGtThd4uUHlI3wHeqt6ZTq8s8Rb0peqddXxvL87K7fweFevnWnonMKSTw1jvkKOAyGrYGhIFNHozzaCkaTy4gZB8IrT0KSM6JAdX7A93qN88:1u3U8T:Ygj414zVnru82RmjeIyC9TFk4QEgbPiPT101BB08n7g','2025-04-26 06:14:37.245172'),
('3kgkgz9c8ibmoxmshnvae5rj3gkk5ecf','.eJxVjEEOwiAQRe_C2hBACqNL956hYWYYqRpISrsy3l2bdKHb_977LzWmdSnj2vM8TqzOyqnD74aJHrlugO-p3pqmVpd5Qr0peqddXxvn52V3_w5K6uVbg8FMJ-djQjIcIfqQI5uji8GhSLQilNEKgXHJgOVBPAxAEFgMBlHvD_KEOG8:1u4l7v:E3eT2b5n6kocD835hd3hsW9hPIJRn7jco-RX3I9j0zw','2025-04-29 18:35:19.458215'),
('4asuggbf3rgcbuxw7h6ad97of3sm5707','.eJxVjMsOwiAQRf-FtSEFpjxcuvcbGmYYpGogKe3K-O_apAvd3nPOfYkpbmuZts7LNCdxFkqcfjeM9OC6g3SP9dYktbouM8pdkQft8toSPy-H-3dQYi_fGmjUYTAWLIxuzECWNTkVCYIBdAZUBo2sOQ8WFHrvMHv0DJ6CDWDE-wO5Rjb7:1toM8E:KVK-somNCnxz5G7NQhVtIhv6R38c6fXcO9cCTzjh8mU','2025-03-15 12:39:50.121256'),
('5ifl7o3gsiepxq62zk65cut3vzcyatc7','.eJxVjEEOwiAQRe_C2hBACqNL956hYWYYqRpISrsy3l2bdKHb_977LzWmdSnj2vM8TqzOyqnD74aJHrlugO-p3pqmVpd5Qr0peqddXxvn52V3_w5K6uVbg8FMJ-djQjIcIfqQI5uji8GhSLQilNEKgXHJgOVBPAxAEFgMBlHvD_KEOG8:1u4lEN:8tYVngxZCeq8kG9ERsCajRw2ae1IEYo_zOueQkrBzlE','2025-04-29 18:41:59.170099'),
('9w4wa6kbkl1s627cgpx5xjpomiyiwpiw','.eJxVjEEOwiAQRe_C2hAoUMCle89AZphBqoYmpV0Z765NutDtf-_9l0iwrTVtnZc0kTgLLU6_G0J-cNsB3aHdZpnnti4Tyl2RB-3yOhM_L4f7d1Ch12_tPFnjUCtTvFODZVMiB4waox0MGW-LhUhkMBADhkyB3GgdqxE8-yDeH9NdN-g:1twK03:j1AY0twMj3tZqLS768HnA9UHo-5SUJE0NQPyfGIxYkY','2025-04-06 12:00:19.891778'),
('b1jd7uy3st9qxvaj85uc1vddrb6hkhje','.eJxVjEEOwiAQRe_C2hBACqNL956hYWYYqRpISrsy3l2bdKHb_977LzWmdSnj2vM8TqzOyqnD74aJHrlugO-p3pqmVpd5Qr0peqddXxvn52V3_w5K6uVbg8FMJ-djQjIcIfqQI5uji8GhSLQilNEKgXHJgOVBPAxAEFgMBlHvD_KEOG8:1u4kUV:fe10Xm04I1mRbIPXYbFoNRIlgzWu9BS_iVbpGTtW0OI','2025-04-29 17:54:35.471687'),
('bekflaa4g2vg47mug2j9tqz8jjt5xi7k','.eJxVjEEOwiAQRe_C2hAoUMCle89AZphBqoYmpV0Z765NutDtf-_9l0iwrTVtnZc0kTgLLU6_G0J-cNsB3aHdZpnnti4Tyl2RB-3yOhM_L4f7d1Ch12_tPFnjUCtTvFODZVMiB4waox0MGW-LhUhkMBADhkyB3GgdqxE8-yDeH9NdN-g:1u4l5r:Er1bAo1vKS6b70NeL399lKvRKmE7oNaTDUpzYwem20U','2025-04-29 18:33:11.170667'),
('fwkq8uk7n9bo5axdnc72po09aby6fyjy','.eJxVjMsOwiAQRf-FtSEFpjxcuvcbGmYYpGogKe3K-O_apAvd3nPOfYkpbmuZts7LNCdxFkqcfjeM9OC6g3SP9dYktbouM8pdkQft8toSPy-H-3dQYi_fGmjUYTAWLIxuzECWNTkVCYIBdAZUBo2sOQ8WFHrvMHv0DJ6CDWDE-wO5Rjb7:1tq6i9:nqk1dBMJiXuZTmtt_fbZnk3tVfiIi1gPNdsve79I8rA','2025-03-20 08:36:09.411425'),
('fy0ez580rnbk2i1vmlo3np5gfnwlsdh6','.eJxVjM0OwiAQhN-FsyFbofx49N5nILsLSNXQpLQn47srSQ-azGm-b-YlAu5bCXtLa5ijuIjBiNNvSciPVDuJd6y3RfJSt3Um2RV50CanJabn9XD_Dgq20tcWERRbyDRaB84rw-SRNGZgp7JlNeqoPQ_5jCYmAlTJewdgvnFGvD8Y_TgF:1u13Bx:2R6SAuJhdkRYtqLvo2_j9bLBu8r0Rvav8IkbCblYyJo','2025-04-19 13:04:09.927350'),
('ggbpxv5cfb7x64mtzncfovc5ow4b5lg7','.eJxVjEEOwiAQRe_C2hBACqNL956hYWYYqRpISrsy3l2bdKHb_977LzWmdSnj2vM8TqzOyqnD74aJHrlugO-p3pqmVpd5Qr0peqddXxvn52V3_w5K6uVbg8FMJ-djQjIcIfqQI5uji8GhSLQilNEKgXHJgOVBPAxAEFgMBlHvD_KEOG8:1uGvfO:bz4yijOa-vUVcFiez9Wv7wHE-BXtKRefmGXfb37YQ6c','2025-06-02 08:16:10.514714'),
('hicty4dxijhc4sysczyuswyvb36byhez','.eJxVjEsOAiEQBe_C2hAYPoJL956BNN2tjBpIhpmV8e5KMgtdveRVpV4iwbaWtHVe0kziJLw4_H4Z8MF1ALpDvTWJra7LnOVQ5E67vDTi53l3_wIFehlZsOgmpYnQmKy9VzlEtvGoA0fA7GxGxqAZIJjvqisQgVITB6eddeL9Ae3zOCE:1u13tc:44A1TdqYzALnYWXkeyJ1F69Yg1XiEUD3r38s7a6b9mg','2025-04-19 13:49:16.104703'),
('hmnuz9vs5oaeliksakr9fh0rw9yvar98','.eJxVjEEOwiAQRe_C2pDBMggu3XuGZmAGqRpISrsy3l2bdKHb_977LzXSupRx7TKPE6uzGtThd4uUHlI3wHeqt6ZTq8s8Rb0peqddXxvL87K7fweFevnWnonMKSTw1jvkKOAyGrYGhIFNHozzaCkaTy4gZB8IrT0KSM6JAdX7A93qN88:1umWYi:dIGMSnyRIQ_qzAUxJ1Vx3YGWSYmgmSx-fEqzYCVvU_o','2025-08-28 11:55:52.045754'),
('hptrw0hw7u0rlcejwvrb4jgytkkymgph','.eJxVjEEOwiAQRe_C2hAoUMCle89AZphBqoYmpV0Z765NutDtf-_9l0iwrTVtnZc0kTgLLU6_G0J-cNsB3aHdZpnnti4Tyl2RB-3yOhM_L4f7d1Ch12_tPFnjUCtTvFODZVMiB4waox0MGW-LhUhkMBADhkyB3GgdqxE8-yDeH9NdN-g:1vSMOI:OC9BF24-5SaR6Daoy-LythU60h9YEIaBcLDt3DacsMc','2025-12-21 21:34:02.446081'),
('knmrdjud1dusuaq7v4uq13j4ybd4w321','.eJxVjEEOwiAQRe_C2pDBMggu3XuGZmAGqRpISrsy3l2bdKHb_977LzXSupRx7TKPE6uzGtThd4uUHlI3wHeqt6ZTq8s8Rb0peqddXxvL87K7fweFevnWnonMKSTw1jvkKOAyGrYGhIFNHozzaCkaTy4gZB8IrT0KSM6JAdX7A93qN88:1umGoJ:T2fDYJUY02EAX2aeo1QyUdPX8rTjRbtxqwK4OpfIxsQ','2025-08-27 19:06:55.675375'),
('kpkxd3ttpntsy2jq2y7dtr8bnp2l31lv','.eJxVjMsOwiAUBf-FtSGlXKC4dO83ELgPqZo2Ke3K-O_apAvdnpk5L5Xytta0NV7SSOqsTK9Ov2PJ-OBpJ3TP023WOE_rMha9K_qgTV9n4uflcP8Oam71W5cIFjojEREyeejFdhCNBSBCL4NhdhACCw3iSKj3LuRikYPEUtCo9wcKJzjT:1u134G:Q4Mit5opw892T-mXYcEMiDDOcq28tpyeyXL290Yn2Xc','2025-04-19 12:56:12.994225'),
('lw8o1hg6jxr0k15sygpf5rw8q88pbsbq','.eJxVjEEOwiAQRe_C2hBACqNL956hYWYYqRpISrsy3l2bdKHb_977LzWmdSnj2vM8TqzOyqnD74aJHrlugO-p3pqmVpd5Qr0peqddXxvn52V3_w5K6uVbg8FMJ-djQjIcIfqQI5uji8GhSLQilNEKgXHJgOVBPAxAEFgMBlHvD_KEOG8:1u4l9y:Si84Wsphcd8JK8uCUqs89iiGhwOlGJvKajEQ3uQQNuo','2025-04-29 18:37:26.559117'),
('ncah0bzt8rau3tq8plfeisqdi53689hn','.eJxVjEEOwiAQRe_C2hAoUMCle89AZphBqoYmpV0Z765NutDtf-_9l0iwrTVtnZc0kTgLLU6_G0J-cNsB3aHdZpnnti4Tyl2RB-3yOhM_L4f7d1Ch12_tPFnjUCtTvFODZVMiB4waox0MGW-LhUhkMBADhkyB3GgdqxE8-yDeH9NdN-g:1u4l4r:EbepZN7GkPxIx4vWOmZPUdzZ1yXpdyFU1JUrInKSk9Y','2025-04-29 18:32:09.130828'),
('npz7d2wpnrkm616xiobiwpeooqsj0l6e','.eJxVjDsOwyAQBe9CHSEMyy9lep8BsbAEJxGWjF1FuXtsyUXSvpl5bxbittawdVrClNmVAbv8bhjTk9oB8iO2-8zT3NZlQn4o_KSdj3Om1-10_w5q7HWvZYyCSCI6UAWMsQBaaJWcNMIWskoXL5QpzvsEXuJuJuuUtAMiWDGwzxfL-jbq:1uGxOg:GrzvgW0nZUmpwC8sPkcpkdLuZl4Bqsg40BgiMzXUWGs','2025-06-02 10:07:02.166830'),
('oyv77ucxr3kyirfhn4e6zdv7iqgcdtdr','.eJxVjMEOgjAQRP-lZ9NsodCtR-98A-lutxY1JaFwMv67kHDQ48x7M281hm3N41ZlGaeorspYdfktKfBTykHiI5T7rHku6zKRPhR90qqHOcrrdrp_BznUvK-tb6VpEnfY9S0Cms6hMTYRiwMrCQQcJGwQwp6sJ2bpXU8CxODJq88X6Iw34A:1umEwQ:4pqM35pFrQMRxtkIB16jXlZl2ROe2Ja41RRuomplRuo','2025-08-27 17:07:10.128298'),
('ptdbelo8v4roqaowimfkgom1wzpe5p6o','.eJxVjMsOwiAUBf-FtSGlXKC4dO83ELgPqZo2Ke3K-O_apAvdnpk5L5Xytta0NV7SSOqsTK9Ov2PJ-OBpJ3TP023WOE_rMha9K_qgTV9n4uflcP8Oam71W5cIFjojEREyeejFdhCNBSBCL4NhdhACCw3iSKj3LuRikYPEUtCo9wcKJzjT:1u1363:NjScDUhh9jtsB6jeYax_98aNOVP0fJUT2aFm5PLPknY','2025-04-19 12:58:03.580303'),
('q2d1o999erlgp46vv7urk589biz8x3pp','.eJxVjEEOwiAQRe_C2hBACqNL956hYWYYqRpISrsy3l2bdKHb_977LzWmdSnj2vM8TqzOyqnD74aJHrlugO-p3pqmVpd5Qr0peqddXxvn52V3_w5K6uVbg8FMJ-djQjIcIfqQI5uji8GhSLQilNEKgXHJgOVBPAxAEFgMBlHvD_KEOG8:1u8DRi:9WNRD0U05vCWz1009KQ5BqjCFb1e0Wf8z3xTJoKi6iE','2025-05-09 07:26:02.456860'),
('qsalu7n193ni561lge4cton2ncc2y6t5','.eJxVjEEOwiAQRe_C2hAoUMCle89AZphBqoYmpV0Z765NutDtf-_9l0iwrTVtnZc0kTgLLU6_G0J-cNsB3aHdZpnnti4Tyl2RB-3yOhM_L4f7d1Ch12_tPFnjUCtTvFODZVMiB4waox0MGW-LhUhkMBADhkyB3GgdqxE8-yDeH9NdN-g:1twqWA:xF1u622Zn93OeKKttl_OGaKZyq3Z75LdUemMISsvs8c','2025-04-07 22:43:38.351402'),
('qx3qzjxg7pkyruzotmoz9vnem7eqs472','.eJxVjEEOwiAQRe_C2hAoUMCle89AZphBqoYmpV0Z765NutDtf-_9l0iwrTVtnZc0kTgLLU6_G0J-cNsB3aHdZpnnti4Tyl2RB-3yOhM_L4f7d1Ch12_tPFnjUCtTvFODZVMiB4waox0MGW-LhUhkMBADhkyB3GgdqxE8-yDeH9NdN-g:1u4lIB:tz4IAKOLtxit_OicNYBCWkrJd32NNl5o-crlk_2cScs','2025-04-29 18:45:55.733519'),
('rum2csl7utbsrf5g9krd7asm32yehe7c','.eJxVjEEOwiAQRe_C2pC2MAgu3fcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uL6q06_Y4J6SF1J3zHeps1zXVdpqR3RR-06XFmeV4P9--gYCvfGsI5swWXOyGDmILLyYF1gIkcCPsk1IvlDjjDYEKmwUMwno0Xw8Tq_QEqnjkP:1u137O:yh1Nls7G-GX5yStp4Y-gTO6tbfpea8qPz6vpaf7ujf0','2025-04-19 12:59:26.658617'),
('srhfgqe6ufmwm82hkf14bzp9vupg1i0x','.eJxVjMsOwiAUBf-FtSGlXKC4dO83ELgPqZo2Ke3K-O_apAvdnpk5L5Xytta0NV7SSOqsTK9Ov2PJ-OBpJ3TP023WOE_rMha9K_qgTV9n4uflcP8Oam71W5cIFjojEREyeejFdhCNBSBCL4NhdhACCw3iSKj3LuRikYPEUtCo9wcKJzjT:1u135A:YrBy_8flBRJWscPix7SnuVFm7uVKNLbeQkugH5kQH1M','2025-04-19 12:57:08.309111'),
('tecu84uuul13phi174wr8bmuscu2erpt','.eJxVjEEOwiAQRe_C2pDBMggu3XuGZmAGqRpISrsy3l2bdKHb_977LzXSupRx7TKPE6uzGtThd4uUHlI3wHeqt6ZTq8s8Rb0peqddXxvL87K7fweFevnWnonMKSTw1jvkKOAyGrYGhIFNHozzaCkaTy4gZB8IrT0KSM6JAdX7A93qN88:1uGxDS:F_oSD3UQdFlnlcVdr8zA_zPI8nGRIEvpZ-CBPQY0JLA','2025-06-02 09:55:26.032189'),
('u40olo15x36abyilxmgtob717fymlnkq','.eJxVjEEOwiAQRe_C2hBACqNL956hYWYYqRpISrsy3l2bdKHb_977LzWmdSnj2vM8TqzOyqnD74aJHrlugO-p3pqmVpd5Qr0peqddXxvn52V3_w5K6uVbg8FMJ-djQjIcIfqQI5uji8GhSLQilNEKgXHJgOVBPAxAEFgMBlHvD_KEOG8:1u8Cuy:yu3KWO-jCq9iiUY-popL8XDA9LftKMNCDxOllNDRFHU','2025-05-09 06:52:12.317555'),
('uayvq25tcp91770cpno39vau27yy82tp','.eJxVjEEOwiAQRe_C2pDBMggu3XuGZmAGqRpISrsy3l2bdKHb_977LzXSupRx7TKPE6uzGtThd4uUHlI3wHeqt6ZTq8s8Rb0peqddXxvL87K7fweFevnWnonMKSTw1jvkKOAyGrYGhIFNHozzaCkaTy4gZB8IrT0KSM6JAdX7A93qN88:1u13Y8:s9Vc2oPPH7nsIrZY4MMcprTDHWVc2R5jx_jKcUCqh3s','2025-04-19 13:27:04.503450'),
('uwszeibnyj4jvdkyt3jo173p0izrkxzq','.eJxVjEEOwiAQRe_C2hBACqNL956hYWYYqRpISrsy3l2bdKHb_977LzWmdSnj2vM8TqzOyqnD74aJHrlugO-p3pqmVpd5Qr0peqddXxvn52V3_w5K6uVbg8FMJ-djQjIcIfqQI5uji8GhSLQilNEKgXHJgOVBPAxAEFgMBlHvD_KEOG8:1u8Czm:IVESCA3v2_suVdQboj8qJMdMvw8i2z6VsP2Zr5iCa8Y','2025-05-09 06:57:10.452575'),
('wmy20g8vtsgpvpgeobi997lgq2sdnbeb','.eJxVjEEOwiAQRe_C2pDBMggu3XuGZmAGqRpISrsy3l2bdKHb_977LzXSupRx7TKPE6uzGtThd4uUHlI3wHeqt6ZTq8s8Rb0peqddXxvL87K7fweFevnWnonMKSTw1jvkKOAyGrYGhIFNHozzaCkaTy4gZB8IrT0KSM6JAdX7A93qN88:1u4FD6:z06rKl__m3BN96y8ZbFbPmCjA9uh72WGQejlzO2ncp4','2025-04-28 08:30:32.248191');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emapp_results`
--

DROP TABLE IF EXISTS `emapp_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `emapp_results` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `score` varchar(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `image` varchar(50) NOT NULL,
  `image_idx` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emapp_results_user_id_6e5687aa_fk_auth_user_id` (`user_id`),
  CONSTRAINT `emapp_results_user_id_6e5687aa_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=779 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emapp_results`
--

LOCK TABLES `emapp_results` WRITE;
/*!40000 ALTER TABLE `emapp_results` DISABLE KEYS */;
INSERT INTO `emapp_results` VALUES
(37,'no',1,'Cold_1',1),
(38,'no',1,'Shot_2',2),
(39,'no',1,'Cat_7',3),
(40,'no',1,'Child_labor_1',4),
(41,'yes',1,'Child_labor_1',5),
(42,'yes',1,'Child_labor_1',6),
(43,'no',1,'Exercise_2',7),
(44,'yes',1,'Exercise_2',8),
(45,'no',1,'Knife_2',9),
(46,'yes',1,'Knife_2',10),
(47,'no',1,'Child_labor_3',11),
(48,'no',1,'Rooster_1',12),
(49,'yes',1,'Rooster_1',13),
(50,'no',1,'Rock_climbing_1',14),
(51,'no',1,'Archery_1',15),
(52,'no',1,'Soldiers_6',16),
(53,'no',1,'Boxing_2',17),
(54,'no',1,'Running_away_1',18),
(55,'no',1,'Exercise_1',19),
(56,'no',1,'Shark_11',20),
(57,'no',1,'Stingray_3',21),
(58,'yes',1,'Stingray_2',22),
(59,'yes',1,'Stingray_2',23),
(60,'no',1,'Graveyard_3',24),
(61,'no',1,'Surprise_1',25),
(62,'no',1,'Dog_23',26),
(63,'no',1,'Animal_carcass_6',27),
(64,'yes',1,'Animal_carcass_6',28),
(65,'no',1,'Dog_attack_3',29),
(66,'no',1,'Spider_2',30),
(67,'no',1,'Car_crash_3',31),
(68,'no',1,'Thunderstorm_4',32),
(69,'no',1,'Fire_3',33),
(70,'yes',1,'Fire_3',34),
(71,'no',1,'Fire_10',35),
(72,'no',1,'Police_2',36),
(73,'no',1,'Thunderstorm_1',37),
(74,'no',1,'Fire_6',38),
(75,'no',1,'Snake_3',39),
(76,'no',1,'Shark_4',40),
(77,'no',1,'Tornado_3',41),
(78,'no',1,'Wolf_2',42),
(79,'yes',1,'Wolf_2',43),
(80,'yes',1,'Wolf_2',44),
(81,'no',1,'War_4',45),
(82,'no',1,'Tornado_1',46),
(83,'yes',1,'Tornado_1',47),
(84,'no',1,'Snake_4',48),
(246,'no',1,'Explosion_3',49),
(247,'no',1,'Explosion_3',50),
(248,'',1,'halfway-through',-1),
(249,'no',1,'Cold_1',51),
(250,'no',1,'Shot_2',52),
(251,'no',1,'Child_labor_1',53),
(252,'no',1,'Seal_1',54),
(253,'no',1,'Child_labor_1',55),
(255,'no',1,'Seal_1',56),
(256,'no',1,'Exercise_2',57),
(317,'no',1,'Scared_face_1',58),
(431,'no',1,'Child_labor_3',59),
(432,'no',1,'Knife_2',60),
(433,'no',1,'Child_labor_3',61),
(434,'no',1,'Stingray_1',62),
(435,'no',1,'Rooster_1',63),
(436,'no',1,'Rock_climbing_1',64),
(437,'no',1,'Boxing_2',65),
(438,'no',1,'Running_away_1',66),
(439,'no',1,'Boxing_2',67),
(440,'yes',1,'Running_away_1',68),
(441,'no',1,'Exercise_1',69),
(442,'no',1,'Stingray_2',70),
(443,'yes',1,'Stingray_3',71),
(444,'no',1,'Frustrated_pose_8',72),
(445,'no',1,'Surprise_1',73),
(446,'no',3,'Cold_1',1),
(447,'no',1,'Graveyard_3',74),
(448,'no',1,'Surprise_1',75),
(449,'no',1,'Fire_6',76),
(450,'yes',1,'War_4',77),
(451,'yes',1,'Snake_3',78),
(452,'no',1,'Car_crash_3',79),
(494,'no',3,'Shot_2',2),
(495,'yes',3,'Shot_2',3),
(552,'yes',2,'Cold_1',1),
(553,'no',2,'Shot_2',2),
(554,'yes',2,'Shot_2',3),
(555,'no',2,'Running_away_1',4),
(556,'no',2,'Doctor_9',5),
(557,'no',2,'Seal_1',6),
(558,'yes',2,'Seal_1',7),
(559,'no',2,'Archery_1',8),
(560,'no',2,'Shark_11',9),
(561,'no',2,'Scared_face_1',10),
(562,'yes',2,'Scared_face_1',11),
(563,'yes',2,'Scared_face_1',12),
(564,'no',2,'Stingray_1',13),
(565,'no',2,'Child_labor_3',14),
(566,'yes',2,'Child_labor_3',15),
(567,'no',2,'Exercise_2',16),
(568,'no',2,'Knife_2',17),
(569,'no',2,'Stingray_3',18),
(570,'no',2,'Rooster_1',19),
(571,'no',2,'Surprise_1',20),
(572,'no',2,'Soldiers_6',21),
(573,'no',2,'Frustrated_pose_8',22),
(574,'no',2,'Graveyard_3',23),
(575,'no',2,'Boxing_2',24),
(576,'yes',2,'Boxing_2',25),
(577,'no',2,'Tornado_1',26),
(578,'no',2,'Police_2',27),
(579,'no',2,'Police_2',28),
(580,'no',2,'Fire_3',29),
(581,'no',2,'Dog_23',30),
(582,'no',2,'Fire_6',31),
(583,'no',2,'Tornado_3',32),
(584,'no',2,'Snake_4',33),
(585,'yes',2,'Snake_4',34),
(586,'yes',2,'Snake_4',35),
(587,'no',2,'Explosion_3',36),
(588,'no',2,'Wolf_2',37),
(589,'no',2,'War_4',38),
(590,'no',2,'Explosion_6',39),
(591,'no',2,'Cemetery_5',40),
(592,'no',2,'Car_crash_3',41),
(593,'yes',2,'Car_crash_3',42),
(594,'no',2,'Snake_3',43),
(595,'no',2,'Thunderstorm_4',44),
(596,'no',2,'Thunderstorm_4',45),
(597,'yes',2,'Thunderstorm_4',46),
(598,'no',2,'Fireman_1',47),
(599,'no',2,'Dog_attack_3',48),
(600,'no',2,'Thunderstorm_1',49),
(601,'no',2,'Animal_carcass_6',50),
(602,'',2,'halfway-through',-1),
(603,'yes',2,'Cold_1',51),
(604,'yes',2,'Shot_2',52),
(605,'no',2,'Child_labor_1',53),
(606,'no',2,'Seal_1',54),
(607,'yes',2,'Child_labor_1',55),
(608,'yes',2,'Seal_1',56),
(609,'no',2,'Exercise_2',57),
(610,'no',2,'Scared_face_1',58),
(611,'no',2,'Child_labor_3',59),
(612,'no',2,'Knife_2',60),
(613,'yes',2,'Child_labor_3',61),
(614,'no',2,'Stingray_1',62),
(615,'no',2,'Rooster_1',63),
(616,'no',2,'Rock_climbing_1',64),
(617,'no',2,'Boxing_2',65),
(618,'no',2,'Running_away_1',66),
(619,'yes',2,'Boxing_2',67),
(620,'yes',2,'Running_away_1',68),
(621,'no',2,'Exercise_1',69),
(622,'no',2,'Stingray_2',70),
(623,'no',2,'Stingray_3',71),
(624,'no',2,'Frustrated_pose_8',72),
(625,'no',2,'Surprise_1',73),
(626,'no',2,'Graveyard_3',74),
(627,'yes',2,'Surprise_1',75),
(628,'no',2,'Fire_6',76),
(629,'no',2,'War_4',77),
(630,'no',2,'Snake_3',78),
(631,'no',2,'Car_crash_3',79),
(632,'no',2,'Fire_3',80),
(633,'no',2,'Dog_attack_3',81),
(634,'no',2,'Car_crash_3',82),
(635,'no',2,'Fire_3',83),
(636,'no',2,'Dog_attack_3',84),
(637,'no',2,'Dog_23',85),
(638,'no',2,'Explosion_2',86),
(639,'no',2,'Snake_4',87),
(640,'yes',2,'Dog_23',88),
(641,'no',2,'Thunderstorm_1',89),
(642,'no',2,'Snake_4',90),
(643,'no',2,'Cemetery_5',91),
(644,'no',2,'Animal_carcass_6',92),
(645,'no',2,'Shark_4',93),
(646,'no',2,'Fireman_1',94),
(647,'no',2,'War_2_',95),
(648,'no',2,'Dog_attack_1',96),
(649,'yes',2,'Fireman_1',97),
(650,'no',2,'Spider_2',98),
(651,'no',2,'Wolf_2',99),
(652,'no',2,'Tornado_1',100),
(653,'no',3,'Running_away_1',4),
(654,'yes',3,'Doctor_9',5),
(655,'yes',4,'Cold_1',1),
(656,'no',4,'Shot_2',2),
(657,'yes',4,'Shot_2',3),
(658,'no',4,'Running_away_1',4),
(659,'no',4,'Doctor_9',5),
(660,'no',4,'Seal_1',6),
(661,'yes',4,'Seal_1',7),
(662,'no',4,'Archery_1',8),
(663,'no',4,'Shark_11',9),
(664,'no',4,'Scared_face_1',10),
(665,'yes',4,'Scared_face_1',11),
(666,'yes',4,'Scared_face_1',12),
(667,'no',4,'Stingray_1',13),
(668,'no',4,'Child_labor_3',14),
(669,'yes',4,'Child_labor_3',15),
(670,'no',4,'Exercise_2',16),
(671,'no',4,'Knife_2',17),
(672,'no',4,'Stingray_3',18),
(673,'no',4,'Rooster_1',19),
(674,'no',4,'Surprise_1',20),
(675,'no',4,'Soldiers_6',21),
(676,'no',4,'Frustrated_pose_8',22),
(677,'no',4,'Graveyard_3',23),
(678,'no',4,'Boxing_2',24),
(679,'yes',4,'Boxing_2',25),
(680,'no',4,'Dog_23',26),
(681,'no',4,'Animal_carcass_6',27),
(682,'yes',4,'Animal_carcass_6',28),
(683,'no',4,'Dog_attack_3',29),
(684,'no',4,'Spider_2',30),
(685,'no',4,'Car_crash_3',31),
(686,'no',4,'Thunderstorm_4',32),
(687,'no',4,'Fire_3',33),
(688,'yes',4,'Fire_3',34),
(689,'no',4,'Fire_10',35),
(690,'no',4,'Police_2',36),
(691,'no',4,'Thunderstorm_1',37),
(692,'no',4,'Fire_6',38),
(693,'no',4,'Snake_3',39),
(694,'no',4,'Shark_4',40),
(695,'no',4,'Tornado_3',41),
(696,'no',4,'Wolf_2',42),
(697,'yes',4,'Wolf_2',43),
(698,'yes',4,'Wolf_2',44),
(699,'no',4,'War_4',45),
(700,'no',4,'Tornado_1',46),
(701,'yes',4,'Tornado_1',47),
(702,'no',4,'Snake_4',48),
(703,'no',4,'Explosion_3',49),
(704,'yes',4,'Explosion_3',50),
(705,'',4,'halfway-through',-1),
(706,'yes',4,'Cold_1',51),
(707,'yes',4,'Exercise_1',52),
(708,'no',4,'Shot_2',53),
(709,'no',4,'Bar_2',54),
(710,'no',4,'Seal_1',55),
(711,'yes',4,'Bar_2',56),
(712,'yes',4,'Seal_1',57),
(713,'no',4,'Archery_1',58),
(714,'no',4,'Scared_face_1',59),
(715,'no',4,'Stingray_2',60),
(716,'yes',4,'Scared_face_1',61),
(717,'no',4,'Child_labor_1',62),
(718,'no',4,'Stingray_1',63),
(719,'no',4,'Cat_7',64),
(720,'no',4,'Knife_2',65),
(721,'no',4,'Stingray_3',66),
(722,'yes',4,'Knife_2',67),
(723,'yes',4,'Stingray_3',68),
(724,'no',4,'Rooster_1',69),
(725,'no',4,'Surprise_1',70),
(726,'no',4,'Rooster_1',71),
(727,'no',4,'Frustrated_pose_8',72),
(728,'no',4,'Graveyard_3',73),
(729,'no',4,'Rock_climbing_1',74),
(730,'no',4,'Boxing_2',75),
(731,'no',4,'Tornado_1',76),
(732,'no',4,'Police_2',77),
(733,'no',4,'Police_2',78),
(734,'no',4,'Fire_3',79),
(735,'no',4,'Fire_3',79),
(736,'no',4,'Tornado_3',80),
(737,'no',4,'Shark_4',81),
(738,'yes',4,'Tornado_3',82),
(739,'yes',4,'Shark_4',83),
(740,'no',4,'Snake_4',84),
(741,'no',4,'Fire_10',85),
(742,'no',4,'Explosion_3',86),
(743,'no',4,'Wolf_2',87),
(744,'no',4,'War_4',88),
(745,'no',4,'Explosion_6',89),
(746,'no',4,'Cemetery_5',90),
(747,'no',4,'Snake_3',91),
(748,'no',4,'Car_crash_3',92),
(749,'yes',4,'Snake_3',93),
(750,'no',4,'War_2_',94),
(751,'yes',4,'Snake_3',95),
(752,'yes',4,'War_2_',96),
(753,'no',4,'Fireman_1',97),
(754,'yes',4,'War_2_',98),
(755,'no',4,'Thunderstorm_1',99),
(756,'no',4,'Animal_carcass_6',100),
(757,'no',3,'Seal_1',6),
(758,'yes',3,'Seal_1',7),
(759,'no',3,'Archery_1',8),
(760,'no',3,'Shark_11',9),
(761,'no',3,'Scared_face_1',10),
(762,'yes',1,'Fire_3',80),
(763,'yes',1,'Dog_attack_3',81),
(764,'no',1,'Car_crash_3',82),
(765,'no',1,'Fire_3',83),
(766,'no',1,'Dog_attack_3',84),
(767,'no',1,'Dog_23',85),
(768,'no',1,'Explosion_2',86),
(769,'no',1,'Snake_4',87),
(770,'yes',1,'Dog_23',88),
(771,'no',1,'Thunderstorm_1',89),
(772,'no',1,'Snake_4',90),
(773,'yes',1,'Cemetery_5',91),
(774,'no',1,'Animal_carcass_6',92),
(775,'no',1,'Shark_4',93),
(776,'no',1,'Fireman_1',94),
(777,'no',1,'War_2_',95),
(778,'no',1,'Dog_attack_1',96);
/*!40000 ALTER TABLE `emapp_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emapp_sequence`
--

DROP TABLE IF EXISTS `emapp_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `emapp_sequence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nms_N1_1` varchar(50) NOT NULL,
  `nms_N1_2` varchar(50) NOT NULL,
  `nms_N1_3` varchar(50) NOT NULL,
  `nms_N1_4` varchar(50) NOT NULL,
  `nms_N2_1` varchar(50) NOT NULL,
  `nms_N2_2` varchar(50) NOT NULL,
  `nms_N2_3` varchar(50) NOT NULL,
  `nms_N2_4` varchar(50) NOT NULL,
  `nms_N3_1` varchar(50) NOT NULL,
  `nms_N3_2` varchar(50) NOT NULL,
  `nms_N3_3` varchar(50) NOT NULL,
  `nms_N3_4` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emapp_sequence`
--

LOCK TABLES `emapp_sequence` WRITE;
/*!40000 ALTER TABLE `emapp_sequence` DISABLE KEYS */;
INSERT INTO `emapp_sequence` VALUES
(1,'Cold_1','Tornado_1','Cold_1','Dog_23','Cold_1','Tornado_1','Cold_1','Fire_6','Rooster_1','Fireman_1','Exercise_2','Tornado_1'),
(2,'Shot_2','Police_2','Shot_2','Animal_carcass_6','Shot_2','Police_2','Exercise_1','War_4','Cold_1','Dog_attack_3','Frustrated_pose_8','Fire_10'),
(3,'Cat_7','Police_2','Shot_2','Animal_carcass_6','Child_labor_1','Police_2','Shot_2','Snake_3','Seal_1','Thunderstorm_1','Scared_face_1','Snake_4'),
(4,'Child_labor_1','Fire_3','Running_away_1','Dog_attack_3','Seal_1','Fire_3','Bar_2','Car_crash_3','Scared_face_1','Fireman_1','Surprise_1','Tornado_1'),
(5,'Child_labor_1','Dog_23','Doctor_9','Spider_2','Child_labor_1','Tornado_3','Seal_1','Fire_3','Child_labor_3','Dog_attack_3','Shark_11','Thunderstorm_1'),
(6,'Child_labor_1','Fire_6','Seal_1','Car_crash_3','Seal_1','Shark_4','Bar_2','Dog_attack_3','Scared_face_1','Car_crash_3','Scared_face_1','Fireman_1'),
(7,'Exercise_2','Tornado_3','Seal_1','Thunderstorm_4','Exercise_2','Tornado_3','Seal_1','Car_crash_3','Bar_2','Dog_attack_1','Surprise_1','Dog_23'),
(8,'Exercise_2','Snake_4','Archery_1','Fire_3','Scared_face_1','Shark_4','Archery_1','Fire_3','Stingray_2','Snake_3','Archery_1','Thunderstorm_1'),
(9,'Knife_2','Snake_4','Shark_11','Fire_3','Child_labor_3','Snake_4','Scared_face_1','Dog_attack_3','Child_labor_1','Fire_6','Exercise_1','Explosion_2'),
(10,'Knife_2','Snake_4','Scared_face_1','Fire_10','Knife_2','Fire_10','Stingray_2','Dog_23','Surprise_1','Wolf_2','Soldiers_6','Explosion_6'),
(11,'Child_labor_3','Explosion_3','Scared_face_1','Police_2','Child_labor_3','Explosion_3','Scared_face_1','Explosion_2','Boxing_2','War_4','Archery_1','Thunderstorm_4'),
(12,'Rooster_1','Wolf_2','Scared_face_1','Thunderstorm_1','Stingray_1','Wolf_2','Child_labor_1','Snake_4','Running_away_1','Fire_6','Child_labor_3','Wolf_2'),
(13,'Rooster_1','War_4','Stingray_1','Fire_6','Rooster_1','War_4','Stingray_1','Dog_23','Boxing_2','Wolf_2','Doctor_9','Explosion_6'),
(14,'Rock_climbing_1','Explosion_6','Child_labor_3','Snake_3','Rock_climbing_1','Explosion_6','Cat_7','Thunderstorm_1','Running_away_1','Animal_carcass_6','Stingray_1','Thunderstorm_4'),
(15,'Archery_1','Cemetery_5','Child_labor_3','Shark_4','Boxing_2','Cemetery_5','Knife_2','Snake_4','Shark_11','Cemetery_5','Child_labor_3','Tornado_3'),
(16,'Soldiers_6','Car_crash_3','Exercise_2','Tornado_3','Running_away_1','Snake_3','Stingray_3','Cemetery_5','Running_away_1','Wolf_2','Doctor_9','Dog_attack_3'),
(17,'Boxing_2','Car_crash_3','Knife_2','Wolf_2','Boxing_2','Car_crash_3','Knife_2','Animal_carcass_6','Doctor_9','Fire_10','Rock_climbing_1','Spider_2'),
(18,'Running_away_1','Snake_3','Stingray_3','Wolf_2','Running_away_1','Snake_3','Stingray_3','Shark_4','Graveyard_3','War_2_','Running_away_1','Explosion_3'),
(19,'Exercise_1','Thunderstorm_4','Rooster_1','Wolf_2','Exercise_1','War_2_','Rooster_1','Fireman_1','Doctor_9','Explosion_6','Graveyard_3','Dog_attack_3'),
(20,'Shark_11','Thunderstorm_4','Surprise_1','War_4','Stingray_2','Snake_3','Surprise_1','War_2_','Graveyard_3','Snake_4','Rock_climbing_1','Shark_4'),
(21,'Stingray_3','Thunderstorm_4','Soldiers_6','Tornado_1','Stingray_3','War_2_','Rooster_1','Dog_attack_1','Stingray_1','Dog_23','Boxing_2','Explosion_3'),
(22,'Stingray_2','Fireman_1','Frustrated_pose_8','Tornado_1','Frustrated_pose_8','Fireman_1','Frustrated_pose_8','Fireman_1','Frustrated_pose_8','Police_2','Stingray_3','Snake_3'),
(23,'Stingray_2','Dog_attack_3','Graveyard_3','Snake_4','Surprise_1','War_2_','Graveyard_3','Spider_2','Exercise_2','Snake_4','Cold_1','Fire_6'),
(24,'Graveyard_3','Thunderstorm_1','Boxing_2','Explosion_3','Graveyard_3','Thunderstorm_1','Rock_climbing_1','Wolf_2','Knife_2','Explosion_3','Cat_7','Dog_attack_1'),
(25,'Surprise_1','Animal_carcass_6','Boxing_2','Explosion_3','Surprise_1','Animal_carcass_6','Boxing_2','Tornado_1','Archery_1','Explosion_2','Child_labor_1','War_4');
/*!40000 ALTER TABLE `emapp_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emapp_stepsettings`
--

DROP TABLE IF EXISTS `emapp_stepsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `emapp_stepsettings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `set_1_2_text` varchar(100) NOT NULL,
  `set_3_4_text` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emapp_stepsettings`
--

LOCK TABLES `emapp_stepsettings` WRITE;
/*!40000 ALTER TABLE `emapp_stepsettings` DISABLE KEYS */;
INSERT INTO `emapp_stepsettings` VALUES
(1,'Ali je ta slika enaka kot ena slika pred njo?','Ali je ta slika enaka kot dve sliki pred njo?');
/*!40000 ALTER TABLE `emapp_stepsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emapp_testtablemigration`
--

DROP TABLE IF EXISTS `emapp_testtablemigration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `emapp_testtablemigration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `test_field` varchar(20) NOT NULL,
  `some_field` int(11) NOT NULL,
  `another_char_field` varchar(20) NOT NULL,
  `blabla` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emapp_testtablemigration`
--

LOCK TABLES `emapp_testtablemigration` WRITE;
/*!40000 ALTER TABLE `emapp_testtablemigration` DISABLE KEYS */;
INSERT INTO `emapp_testtablemigration` VALUES
(1,'asdfasf',2341234,'asdfasdf','default_value'),
(2,'asasdfa',12312,'asdfasdfa','default_value'),
(3,'23423sdf',23423,'adsfasdf','default_value');
/*!40000 ALTER TABLE `emapp_testtablemigration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emapp_usersequence`
--

DROP TABLE IF EXISTS `emapp_usersequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `emapp_usersequence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `seq_N1_1` varchar(20) NOT NULL,
  `seq_N1_2` varchar(20) NOT NULL,
  `seq_N1_3` varchar(20) NOT NULL,
  `seq_N1_4` varchar(20) NOT NULL,
  `seq_N2_1` varchar(20) NOT NULL,
  `seq_N2_2` varchar(20) NOT NULL,
  `seq_N2_3` varchar(20) NOT NULL,
  `seq_N2_4` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emapp_usersequence_user_id_e9f79e8d_fk_auth_user_id` (`user_id`),
  CONSTRAINT `emapp_usersequence_user_id_e9f79e8d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emapp_usersequence`
--

LOCK TABLES `emapp_usersequence` WRITE;
/*!40000 ALTER TABLE `emapp_usersequence` DISABLE KEYS */;
INSERT INTO `emapp_usersequence` VALUES
(1,'nms_N1_1','nms_N1_4','nms_N1_3','nms_N1_2','nms_N2_1','nms_N2_4','nms_N2_3','nms_N2_2',1),
(2,'nms_N1_3','nms_N1_2','nms_N1_1','nms_N1_4','nms_N2_1','nms_N2_4','nms_N2_3','nms_N2_2',2),
(3,'nms_N1_3','nms_N1_4','nms_N1_1','nms_N1_2','nms_N2_1','nms_N2_4','nms_N2_3','nms_N2_2',3),
(4,'nms_N1_3','nms_N1_4','nms_N1_1','nms_N1_2','nms_N2_3','nms_N2_2','nms_N2_1','nms_N2_4',4),
(5,'nms_N1_1','nms_N1_4','nms_N1_3','nms_N1_2','nms_N2_1','nms_N2_4','nms_N2_3','nms_N2_2',5),
(6,'nms_N1_1','nms_N1_2','nms_N1_3','nms_N1_4','nms_N2_3','nms_N2_2','nms_N2_1','nms_N2_4',6),
(7,'nms_N1_1','nms_N1_4','nms_N1_3','nms_N1_2','nms_N2_3','nms_N2_2','nms_N2_1','nms_N2_4',7),
(8,'nms_N1_1','nms_N1_2','nms_N1_3','nms_N1_4','nms_N2_3','nms_N2_4','nms_N2_1','nms_N2_2',8),
(9,'nms_N1_1','nms_N1_4','nms_N1_3','nms_N1_2','nms_N2_3','nms_N2_4','nms_N2_1','nms_N2_2',9),
(10,'nms_N1_3','nms_N1_2','nms_N1_1','nms_N1_4','nms_N2_3','nms_N2_2','nms_N2_1','nms_N2_4',10),
(11,'nms_N1_1','nms_N1_2','nms_N1_3','nms_N1_4','nms_N2_3','nms_N2_4','nms_N2_1','nms_N2_2',11),
(12,'nms_N1_1','nms_N1_4','nms_N1_3','nms_N1_2','nms_N2_3','nms_N2_2','nms_N2_1','nms_N2_4',12),
(13,'nms_N1_3','nms_N1_2','nms_N1_1','nms_N1_4','nms_N2_3','nms_N2_4','nms_N2_1','nms_N2_2',13),
(14,'nms_N1_3','nms_N1_4','nms_N1_1','nms_N1_2','nms_N2_3','nms_N2_4','nms_N2_1','nms_N2_2',14),
(15,'nms_N1_1','nms_N1_2','nms_N1_3','nms_N1_4','nms_N2_1','nms_N2_2','nms_N2_3','nms_N2_4',15),
(16,'nms_N1_1','nms_N1_4','nms_N1_3','nms_N1_2','nms_N2_1','nms_N2_4','nms_N2_3','nms_N2_2',16),
(17,'nms_N1_1','nms_N1_2','nms_N1_3','nms_N1_4','nms_N2_1','nms_N2_4','nms_N2_3','nms_N2_2',17),
(18,'nms_N1_1','nms_N1_2','nms_N1_3','nms_N1_4','nms_N2_1','nms_N2_2','nms_N2_3','nms_N2_4',18),
(19,'nms_N1_3','nms_N1_2','nms_N1_1','nms_N1_4','nms_N2_3','nms_N2_4','nms_N2_1','nms_N2_2',19),
(20,'nms_N1_3','nms_N1_4','nms_N1_1','nms_N1_2','nms_N2_1','nms_N2_4','nms_N2_3','nms_N2_2',20),
(21,'nms_N1_3','nms_N1_4','nms_N1_1','nms_N1_2','nms_N2_3','nms_N2_2','nms_N2_1','nms_N2_4',21),
(22,'nms_N1_1','nms_N1_2','nms_N1_3','nms_N1_4','nms_N2_3','nms_N2_4','nms_N2_1','nms_N2_2',22),
(23,'nms_N1_3','nms_N1_4','nms_N1_1','nms_N1_2','nms_N2_3','nms_N2_4','nms_N2_1','nms_N2_2',23),
(24,'nms_N1_3','nms_N1_4','nms_N1_1','nms_N1_2','nms_N2_1','nms_N2_4','nms_N2_3','nms_N2_2',24),
(25,'nms_N1_3','nms_N1_4','nms_N1_1','nms_N1_2','nms_N2_1','nms_N2_2','nms_N2_3','nms_N2_4',25),
(26,'nms_N1_3','nms_N1_4','nms_N1_1','nms_N1_2','nms_N2_1','nms_N2_2','nms_N2_3','nms_N2_4',26),
(27,'nms_N1_3','nms_N1_4','nms_N1_1','nms_N1_2','nms_N2_3','nms_N2_2','nms_N2_1','nms_N2_4',27),
(28,'nms_N1_3','nms_N1_4','nms_N1_1','nms_N1_2','nms_N2_3','nms_N2_4','nms_N2_1','nms_N2_2',28),
(29,'nms_N1_3','nms_N1_4','nms_N1_1','nms_N1_2','nms_N2_1','nms_N2_4','nms_N2_3','nms_N2_2',29),
(30,'nms_N1_1','nms_N1_4','nms_N1_3','nms_N1_2','nms_N2_1','nms_N2_2','nms_N2_3','nms_N2_4',30),
(31,'nms_N1_1','nms_N1_4','nms_N1_3','nms_N1_2','nms_N2_3','nms_N2_4','nms_N2_1','nms_N2_2',31),
(32,'nms_N1_3','nms_N1_2','nms_N1_1','nms_N1_4','nms_N2_1','nms_N2_2','nms_N2_3','nms_N2_4',32),
(33,'nms_N1_1','nms_N1_2','nms_N1_3','nms_N1_4','nms_N2_3','nms_N2_4','nms_N2_1','nms_N2_2',33),
(34,'nms_N1_1','nms_N1_2','nms_N1_3','nms_N1_4','nms_N2_1','nms_N2_2','nms_N2_3','nms_N2_4',34),
(35,'nms_N1_1','nms_N1_2','nms_N1_3','nms_N1_4','nms_N2_1','nms_N2_4','nms_N2_3','nms_N2_2',35),
(36,'nms_N1_3','nms_N1_2','nms_N1_1','nms_N1_4','nms_N2_3','nms_N2_2','nms_N2_1','nms_N2_4',36),
(37,'nms_N1_3','nms_N1_4','nms_N1_1','nms_N1_2','nms_N2_1','nms_N2_2','nms_N2_3','nms_N2_4',37),
(38,'nms_N1_3','nms_N1_4','nms_N1_1','nms_N1_2','nms_N2_3','nms_N2_2','nms_N2_1','nms_N2_4',38),
(39,'nms_N1_1','nms_N1_2','nms_N1_3','nms_N1_4','nms_N2_3','nms_N2_4','nms_N2_1','nms_N2_2',39),
(40,'nms_N1_3','nms_N1_2','nms_N1_1','nms_N1_4','nms_N2_3','nms_N2_4','nms_N2_1','nms_N2_2',40),
(41,'nms_N1_3','nms_N1_4','nms_N1_1','nms_N1_2','nms_N2_3','nms_N2_2','nms_N2_1','nms_N2_4',41),
(42,'nms_N1_3','nms_N1_2','nms_N1_1','nms_N1_4','nms_N2_1','nms_N2_4','nms_N2_3','nms_N2_2',42),
(43,'nms_N1_1','nms_N1_4','nms_N1_3','nms_N1_2','nms_N2_3','nms_N2_4','nms_N2_1','nms_N2_2',43),
(44,'nms_N1_3','nms_N1_4','nms_N1_1','nms_N1_2','nms_N2_3','nms_N2_2','nms_N2_1','nms_N2_4',44),
(45,'nms_N1_1','nms_N1_4','nms_N1_3','nms_N1_2','nms_N2_3','nms_N2_4','nms_N2_1','nms_N2_2',45),
(46,'nms_N1_1','nms_N1_2','nms_N1_3','nms_N1_4','nms_N2_1','nms_N2_2','nms_N2_3','nms_N2_4',46),
(47,'nms_N1_1','nms_N1_2','nms_N1_3','nms_N1_4','nms_N2_1','nms_N2_2','nms_N2_3','nms_N2_4',47),
(48,'nms_N1_3','nms_N1_2','nms_N1_1','nms_N1_4','nms_N2_1','nms_N2_2','nms_N2_3','nms_N2_4',48),
(49,'nms_N1_1','nms_N1_2','nms_N1_3','nms_N1_4','nms_N2_3','nms_N2_2','nms_N2_1','nms_N2_4',49),
(50,'nms_N1_3','nms_N1_2','nms_N1_1','nms_N1_4','nms_N2_1','nms_N2_2','nms_N2_3','nms_N2_4',50),
(51,'nms_N1_1','nms_N1_2','nms_N1_3','nms_N1_4','nms_N2_1','nms_N2_2','nms_N2_3','nms_N2_4',51),
(52,'nms_N1_1','nms_N1_2','nms_N1_3','nms_N1_4','nms_N2_3','nms_N2_4','nms_N2_1','nms_N2_2',52),
(53,'nms_N1_3','nms_N1_4','nms_N1_1','nms_N1_2','nms_N2_3','nms_N2_4','nms_N2_1','nms_N2_2',53),
(54,'nms_N1_3','nms_N1_4','nms_N1_1','nms_N1_2','nms_N2_1','nms_N2_4','nms_N2_3','nms_N2_2',54),
(55,'nms_N1_3','nms_N1_2','nms_N1_1','nms_N1_4','nms_N2_1','nms_N2_2','nms_N2_3','nms_N2_4',55),
(56,'nms_N1_3','nms_N1_2','nms_N1_1','nms_N1_4','nms_N2_3','nms_N2_4','nms_N2_1','nms_N2_2',56),
(57,'nms_N1_3','nms_N1_2','nms_N1_1','nms_N1_4','nms_N2_3','nms_N2_2','nms_N2_1','nms_N2_4',57),
(58,'nms_N1_1','nms_N1_4','nms_N1_3','nms_N1_2','nms_N2_3','nms_N2_4','nms_N2_1','nms_N2_2',58),
(59,'nms_N1_3','nms_N1_4','nms_N1_1','nms_N1_2','nms_N2_3','nms_N2_2','nms_N2_1','nms_N2_4',59),
(60,'nms_N1_1','nms_N1_4','nms_N1_3','nms_N1_2','nms_N2_1','nms_N2_4','nms_N2_3','nms_N2_2',60),
(61,'nms_N1_1','nms_N1_2','nms_N1_3','nms_N1_4','nms_N2_1','nms_N2_4','nms_N2_3','nms_N2_2',61),
(62,'nms_N1_3','nms_N1_4','nms_N1_1','nms_N1_2','nms_N2_3','nms_N2_4','nms_N2_1','nms_N2_2',62),
(63,'nms_N1_1','nms_N1_2','nms_N1_3','nms_N1_4','nms_N2_1','nms_N2_4','nms_N2_3','nms_N2_2',63),
(64,'nms_N1_3','nms_N1_2','nms_N1_1','nms_N1_4','nms_N2_1','nms_N2_4','nms_N2_3','nms_N2_2',64),
(65,'nms_N1_3','nms_N1_2','nms_N1_1','nms_N1_4','nms_N2_3','nms_N2_4','nms_N2_1','nms_N2_2',65),
(66,'nms_N1_1','nms_N1_2','nms_N1_3','nms_N1_4','nms_N2_1','nms_N2_4','nms_N2_3','nms_N2_2',66),
(67,'nms_N1_3','nms_N1_2','nms_N1_1','nms_N1_4','nms_N2_1','nms_N2_4','nms_N2_3','nms_N2_2',67),
(68,'nms_N1_1','nms_N1_2','nms_N1_3','nms_N1_4','nms_N2_1','nms_N2_2','nms_N2_3','nms_N2_4',68),
(69,'nms_N1_3','nms_N1_4','nms_N1_1','nms_N1_2','nms_N2_1','nms_N2_4','nms_N2_3','nms_N2_2',69),
(70,'nms_N1_3','nms_N1_2','nms_N1_1','nms_N1_4','nms_N2_1','nms_N2_4','nms_N2_3','nms_N2_2',70),
(71,'nms_N1_1','nms_N1_2','nms_N1_3','nms_N1_4','nms_N2_1','nms_N2_2','nms_N2_3','nms_N2_4',71),
(72,'nms_N1_3','nms_N1_4','nms_N1_1','nms_N1_2','nms_N2_1','nms_N2_2','nms_N2_3','nms_N2_4',72),
(73,'nms_N1_1','nms_N1_2','nms_N1_3','nms_N1_4','nms_N2_1','nms_N2_4','nms_N2_3','nms_N2_2',73),
(74,'nms_N1_3','nms_N1_2','nms_N1_1','nms_N1_4','nms_N2_3','nms_N2_2','nms_N2_1','nms_N2_4',74),
(75,'nms_N1_3','nms_N1_4','nms_N1_1','nms_N1_2','nms_N2_3','nms_N2_4','nms_N2_1','nms_N2_2',75),
(76,'nms_N1_3','nms_N1_4','nms_N1_1','nms_N1_2','nms_N2_1','nms_N2_2','nms_N2_3','nms_N2_4',76),
(77,'nms_N1_1','nms_N1_4','nms_N1_3','nms_N1_2','nms_N2_3','nms_N2_2','nms_N2_1','nms_N2_4',77),
(78,'nms_N1_1','nms_N1_4','nms_N1_3','nms_N1_2','nms_N2_1','nms_N2_4','nms_N2_3','nms_N2_2',78),
(79,'nms_N1_3','nms_N1_2','nms_N1_1','nms_N1_4','nms_N2_3','nms_N2_4','nms_N2_1','nms_N2_2',79),
(80,'nms_N1_3','nms_N1_4','nms_N1_1','nms_N1_2','nms_N2_3','nms_N2_2','nms_N2_1','nms_N2_4',80),
(81,'nms_N1_3','nms_N1_4','nms_N1_1','nms_N1_2','nms_N2_3','nms_N2_2','nms_N2_1','nms_N2_4',81),
(82,'nms_N1_1','nms_N1_4','nms_N1_3','nms_N1_2','nms_N2_1','nms_N2_2','nms_N2_3','nms_N2_4',82),
(83,'nms_N1_3','nms_N1_2','nms_N1_1','nms_N1_4','nms_N2_1','nms_N2_2','nms_N2_3','nms_N2_4',83),
(84,'nms_N1_1','nms_N1_4','nms_N1_3','nms_N1_2','nms_N2_1','nms_N2_4','nms_N2_3','nms_N2_2',84),
(85,'nms_N1_1','nms_N1_4','nms_N1_3','nms_N1_2','nms_N2_3','nms_N2_2','nms_N2_1','nms_N2_4',85),
(86,'nms_N1_1','nms_N1_2','nms_N1_3','nms_N1_4','nms_N2_1','nms_N2_2','nms_N2_3','nms_N2_4',86),
(87,'nms_N1_3','nms_N1_2','nms_N1_1','nms_N1_4','nms_N2_1','nms_N2_2','nms_N2_3','nms_N2_4',87),
(88,'nms_N1_1','nms_N1_4','nms_N1_3','nms_N1_2','nms_N2_3','nms_N2_2','nms_N2_1','nms_N2_4',88),
(89,'nms_N1_1','nms_N1_2','nms_N1_3','nms_N1_4','nms_N2_3','nms_N2_4','nms_N2_1','nms_N2_2',89),
(90,'nms_N1_1','nms_N1_4','nms_N1_3','nms_N1_2','nms_N2_3','nms_N2_4','nms_N2_1','nms_N2_2',90),
(91,'nms_N1_3','nms_N1_2','nms_N1_1','nms_N1_4','nms_N2_3','nms_N2_4','nms_N2_1','nms_N2_2',91),
(92,'nms_N1_1','nms_N1_4','nms_N1_3','nms_N1_2','nms_N2_3','nms_N2_4','nms_N2_1','nms_N2_2',92),
(93,'nms_N1_1','nms_N1_2','nms_N1_3','nms_N1_4','nms_N2_1','nms_N2_2','nms_N2_3','nms_N2_4',93),
(94,'nms_N1_3','nms_N1_4','nms_N1_1','nms_N1_2','nms_N2_3','nms_N2_4','nms_N2_1','nms_N2_2',94),
(95,'nms_N1_3','nms_N1_4','nms_N1_1','nms_N1_2','nms_N2_1','nms_N2_4','nms_N2_3','nms_N2_2',95),
(96,'nms_N1_3','nms_N1_4','nms_N1_1','nms_N1_2','nms_N2_3','nms_N2_2','nms_N2_1','nms_N2_4',96),
(97,'nms_N1_3','nms_N1_2','nms_N1_1','nms_N1_4','nms_N2_1','nms_N2_2','nms_N2_3','nms_N2_4',97),
(98,'nms_N1_3','nms_N1_2','nms_N1_1','nms_N1_4','nms_N2_1','nms_N2_2','nms_N2_3','nms_N2_4',98),
(99,'nms_N1_3','nms_N1_2','nms_N1_1','nms_N1_4','nms_N2_1','nms_N2_2','nms_N2_3','nms_N2_4',99),
(100,'nms_N1_3','nms_N1_2','nms_N1_1','nms_N1_4','nms_N2_3','nms_N2_4','nms_N2_1','nms_N2_2',100);
/*!40000 ALTER TABLE `emapp_usersequence` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-07 23:20:19
