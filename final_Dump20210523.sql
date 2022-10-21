-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: yssworkshop
-- ------------------------------------------------------
-- Server version	5.5.25a

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `userId` varchar(60) DEFAULT NULL,
  `profilPicId` int(11) DEFAULT NULL,
  `phoneId` int(11) DEFAULT NULL,
  `emailId` int(11) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `name` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userId_UNIQUE` (`userId`),
  KEY `FK_admin_to_adminphoneno` (`phoneId`),
  KEY `FK_admin_to_email` (`emailId`),
  KEY `FK_admin` (`profilPicId`),
  CONSTRAINT `FK_admin` FOREIGN KEY (`profilPicId`) REFERENCES `adminprofilepic` (`id`),
  CONSTRAINT `FK_admin_to_adminphoneno` FOREIGN KEY (`phoneId`) REFERENCES `adminphoneno` (`id`),
  CONSTRAINT `FK_admin_to_email` FOREIGN KEY (`emailId`) REFERENCES `adminemail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'chaku',2,0,0,'ctanmoy','Tanmoy Chaku');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminemail`
--

DROP TABLE IF EXISTS `adminemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminemail` (
  `id` int(11) NOT NULL,
  `adminId` int(11) NOT NULL,
  `email` varchar(320) DEFAULT NULL,
  PRIMARY KEY (`id`,`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminemail`
--

LOCK TABLES `adminemail` WRITE;
/*!40000 ALTER TABLE `adminemail` DISABLE KEYS */;
INSERT INTO `adminemail` VALUES (0,1,'tanmoychaku@gmail.com');
/*!40000 ALTER TABLE `adminemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminloginprivilage`
--

DROP TABLE IF EXISTS `adminloginprivilage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminloginprivilage` (
  `adminId` int(11) NOT NULL,
  `privilag` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`adminId`),
  CONSTRAINT `adminloginprivilage_ibfk_1` FOREIGN KEY (`adminId`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminloginprivilage`
--

LOCK TABLES `adminloginprivilage` WRITE;
/*!40000 ALTER TABLE `adminloginprivilage` DISABLE KEYS */;
/*!40000 ALTER TABLE `adminloginprivilage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminphoneno`
--

DROP TABLE IF EXISTS `adminphoneno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminphoneno` (
  `id` int(11) NOT NULL,
  `adminId` int(11) NOT NULL,
  `isdCode` int(11) DEFAULT NULL,
  `phoneNo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`,`adminId`),
  KEY `FK_adminphoneno_to_isd` (`isdCode`),
  CONSTRAINT `FK_adminphoneno_to_isd` FOREIGN KEY (`isdCode`) REFERENCES `isd` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminphoneno`
--

LOCK TABLES `adminphoneno` WRITE;
/*!40000 ALTER TABLE `adminphoneno` DISABLE KEYS */;
INSERT INTO `adminphoneno` VALUES (0,1,0,'8145768188');
/*!40000 ALTER TABLE `adminphoneno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminprofilepic`
--

DROP TABLE IF EXISTS `adminprofilepic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminprofilepic` (
  `id` int(11) NOT NULL,
  `adminId` int(11) NOT NULL,
  `path` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`,`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminprofilepic`
--

LOCK TABLES `adminprofilepic` WRITE;
/*!40000 ALTER TABLE `adminprofilepic` DISABLE KEYS */;
INSERT INTO `adminprofilepic` VALUES (0,1,'pp.jpg'),(1,1,'admin/profilepic/pp.jpg'),(2,1,'admin/profilepic/pp_G0RsXCc.jpg');
/*!40000 ALTER TABLE `adminprofilepic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datastore`
--

DROP TABLE IF EXISTS `datastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datastore` (
  `id` int(11) NOT NULL,
  `linkId` int(11) DEFAULT NULL,
  `fullName` varchar(400) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `state` varchar(60) DEFAULT NULL,
  `phoneNo` varchar(10) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datastore`
--

LOCK TABLES `datastore` WRITE;
/*!40000 ALTER TABLE `datastore` DISABLE KEYS */;
/*!40000 ALTER TABLE `datastore` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER datastoretrigger
 BEFORE INSERT ON datastore
 FOR EACH ROW
 BEGIN
    IF NEW.date IS NULL THEN
       SET NEW.date = NOW();
    END IF;
 END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('sb9uj029c4x1f2oeeibhs9lvi7suj5e1','eyJ1c2VyIjoxfQ:1lg5oP:L8nnr5amuCAmhtBsSDwHLOFZmPsizBl1vMk1KhidFvU','2021-05-24 13:19:05'),('wvf3bw396q8ta6ae9cwbsbtd84kjdcvs','eyJ1c2VyIjoxfQ:1lPowc:Y2FJPtwZgQ52MS02yeKgeIBxxIdZJ6eTh62b-jtrGIU','2021-04-09 16:04:18');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `isd`
--

DROP TABLE IF EXISTS `isd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `isd` (
  `id` int(11) NOT NULL,
  `name` varchar(74) DEFAULT NULL,
  `isdNo` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isd`
--

LOCK TABLES `isd` WRITE;
/*!40000 ALTER TABLE `isd` DISABLE KEYS */;
INSERT INTO `isd` VALUES (0,'India','91');
/*!40000 ALTER TABLE `isd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link`
--

DROP TABLE IF EXISTS `link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminId` int(11) DEFAULT NULL,
  `value` varchar(60) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link`
--

LOCK TABLES `link` WRITE;
/*!40000 ALTER TABLE `link` DISABLE KEYS */;
INSERT INTO `link` VALUES (1,1,'lkjsdlkfs88w0ukjl',0,'2021-03-21 19:37:02'),(2,1,'qwerty',1,'2021-03-21 19:37:02'),(3,1,'kjahkjfd',0,'2021-03-21 19:37:02'),(4,1,'hjgjhfhg',0,'2021-05-10 19:49:03'),(5,1,'meditation',1,'2021-05-11 21:28:07'),(6,1,'yoga',1,'2021-05-11 21:28:32'),(7,1,'aba2132e141d59d12ce0d27485417fdf',0,'2021-05-17 20:58:25'),(8,1,'ca34dc6c15dc0c509f162d6a5949e653',0,'2021-05-22 22:44:24'),(9,1,'5f691fa671f6620a3e9e5f4f3d63585a',0,'2021-05-22 23:11:27'),(10,1,'2a11db6bdc41542828368deb9b7067c8',0,'2021-05-22 23:12:40'),(11,1,'918f49de32a3f4085f52641f27764da9',0,'2021-05-22 23:40:50'),(12,1,'53880fd2d0220d639abaff2ae356016f',0,'2021-05-22 23:42:24'),(13,1,'438c447b3c72a38ebaaebdb95c1851e0',0,'2021-05-22 23:51:50');
/*!40000 ALTER TABLE `link` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER linktrigger
 BEFORE INSERT ON link
 FOR EACH ROW
 BEGIN
    IF NEW.date IS NULL THEN
       SET NEW.date = NOW();
    END IF;
 END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'yssworkshop'
--

--
-- Dumping routines for database 'yssworkshop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-23  0:27:43
