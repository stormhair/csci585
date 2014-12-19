CREATE DATABASE  IF NOT EXISTS `hw1` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hw1`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: hw1
-- ------------------------------------------------------
-- Server version	5.7.4-m14

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
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon` (
  `coupon_id` varchar(10) NOT NULL,
  `villa` varchar(5) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  PRIMARY KEY (`coupon_id`),
  KEY `vid_idx` (`villa`),
  CONSTRAINT `villa` FOREIGN KEY (`villa`) REFERENCES `villa` (`vid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
INSERT INTO `coupon` VALUES ('Coup1','Vil1','2013-09-01','2014-01-31',20),('Coup2','Vil2','2013-09-01','2013-12-31',15),('Coup3','Vil3','2013-09-01','2013-12-31',25),('Coup4','Vil4','2013-09-01','2013-12-31',10),('Coup5','Vil1','2014-01-01','2014-08-31',15);
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features`
--

DROP TABLE IF EXISTS `features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `features` (
  `feature_id` varchar(5) NOT NULL,
  `feature_name` varchar(30) NOT NULL,
  PRIMARY KEY (`feature_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features`
--

LOCK TABLES `features` WRITE;
/*!40000 ALTER TABLE `features` DISABLE KEYS */;
INSERT INTO `features` VALUES ('Fea1','swimming pool'),('Fea2','Jacuzzi'),('Fea3','billiard table'),('Fea4','Xbox 360'),('Fea5','board games'),('Fea6','pets allowed');
/*!40000 ALTER TABLE `features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `has_feature`
--

DROP TABLE IF EXISTS `has_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `has_feature` (
  `_villa` varchar(5) NOT NULL,
  `_feature` varchar(5) NOT NULL,
  PRIMARY KEY (`_villa`,`_feature`),
  KEY `feature_idx` (`_feature`),
  CONSTRAINT `_villa` FOREIGN KEY (`_villa`) REFERENCES `villa` (`vid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `_feature` FOREIGN KEY (`_feature`) REFERENCES `features` (`feature_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `has_feature`
--

LOCK TABLES `has_feature` WRITE;
/*!40000 ALTER TABLE `has_feature` DISABLE KEYS */;
INSERT INTO `has_feature` VALUES ('Vil1','Fea1'),('Vil2','Fea1'),('Vil3','Fea1'),('Vil1','Fea2'),('Vil11','Fea2'),('Vil12','Fea2'),('Vil4','Fea2'),('Vil7','Fea3'),('Vil3','Fea4'),('Vil5','Fea4'),('Vil7','Fea4'),('Vil10','Fea5'),('Vil3','Fea5'),('Vil7','Fea5'),('Vil9','Fea5'),('Vil6','Fea6'),('Vil7','Fea6'),('Vil8','Fea6');
/*!40000 ALTER TABLE `has_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_review`
--

DROP TABLE IF EXISTS `like_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `like_review` (
  `_rev` varchar(5) NOT NULL,
  `_user` varchar(5) NOT NULL,
  PRIMARY KEY (`_rev`,`_user`),
  KEY `_user_idx` (`_user`),
  CONSTRAINT `_rev` FOREIGN KEY (`_rev`) REFERENCES `review` (`rev_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `_user` FOREIGN KEY (`_user`) REFERENCES `users` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_review`
--

LOCK TABLES `like_review` WRITE;
/*!40000 ALTER TABLE `like_review` DISABLE KEYS */;
INSERT INTO `like_review` VALUES ('Rev1','U2'),('Rev14','U2'),('Rev5','U2'),('Rev1','U3'),('Rev15','U3'),('Rev1','U4'),('Rev14','U4'),('Rev2','U4'),('Rev5','U4'),('Rev14','U6'),('Rev15','U6'),('Rev15','U7'),('Rev2','U7'),('Rev3','U8'),('Rev4','U9');
/*!40000 ALTER TABLE `like_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `mid` varchar(5) NOT NULL,
  `managed_by` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`mid`),
  CONSTRAINT `mid` FOREIGN KEY (`mid`) REFERENCES `users` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES ('U14',NULL),('U15','U14');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners`
--

DROP TABLE IF EXISTS `owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owners` (
  `oid` varchar(5) NOT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `managed_by` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `managed_by_idx` (`managed_by`),
  CONSTRAINT `oid` FOREIGN KEY (`oid`) REFERENCES `users` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `managed_by` FOREIGN KEY (`managed_by`) REFERENCES `manager` (`mid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners`
--

LOCK TABLES `owners` WRITE;
/*!40000 ALTER TABLE `owners` DISABLE KEYS */;
INSERT INTO `owners` VALUES ('U11','111-111-1111','U15'),('U12','222-222-2222','U15'),('U13','333-333-3333','U15'),('U14','444-444-4444',NULL);
/*!40000 ALTER TABLE `owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate`
--

DROP TABLE IF EXISTS `rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rate` (
  `rate_id` varchar(10) NOT NULL,
  `vid` varchar(5) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  PRIMARY KEY (`rate_id`),
  KEY `vid_idx` (`vid`),
  CONSTRAINT `vid` FOREIGN KEY (`vid`) REFERENCES `villa` (`vid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate`
--

LOCK TABLES `rate` WRITE;
/*!40000 ALTER TABLE `rate` DISABLE KEYS */;
INSERT INTO `rate` VALUES ('Rat1','Vil1','2013-01-01','2013-08-31',150),('Rat10','Vil10','2013-01-01','2013-08-31',250),('Rat11','Vil11','2013-01-01','2013-08-31',170),('Rat12','Vil12','2013-01-01','2013-08-31',110),('Rat13','Vil1','2013-09-01','2013-12-31',120),('Rat14','Vil2','2013-09-01','2013-12-31',75),('Rat15','Vil3','2013-09-01','2013-12-31',160),('Rat16','Vil4','2013-09-01','2013-12-31',90),('Rat17','Vil5','2013-09-01','2013-12-31',80),('Rat18','Vil6','2013-09-01','2013-12-31',100),('Rat19','Vil7','2013-09-01','2013-12-31',150),('Rat2','Vil2','2013-01-01','2013-08-31',100),('Rat20','Vil8','2013-09-01','2013-12-31',200),('Rat21','Vil9','2013-09-01','2013-12-31',50),('Rat22','Vil10','2013-09-01','2013-12-31',200),('Rat23','Vil11','2013-09-01','2013-12-31',120),('Rat24','Vil12','2013-09-01','2013-12-31',90),('Rat25','Vil1','2014-01-01','2014-08-31',180),('Rat26','Vil2','2014-01-01','2014-08-31',120),('Rat27','Vil3','2014-01-01','2014-08-31',240),('Rat28','Vil4','2014-01-01','2014-08-31',150),('Rat29','Vil5','2014-01-01','2014-08-31',150),('Rat3','Vil3','2013-01-01','2013-08-31',200),('Rat30','Vil6','2014-01-01','2014-08-31',180),('Rat31','Vil7','2014-01-01','2014-08-31',250),('Rat32','Vil8','2014-01-01','2014-08-31',400),('Rat33','Vil9','2014-01-01','2014-08-31',110),('Rat34','Vil10','2014-01-01','2014-08-31',320),('Rat35','Vil11','2014-01-01','2014-08-31',210),('Rat36','Vil12','2014-01-01','2014-08-31',140),('Rat4','Vil4','2013-01-01','2013-08-31',130),('Rat5','Vil5','2013-01-01','2013-08-31',120),('Rat6','Vil6','2013-01-01','2013-08-31',140),('Rat7','Vil7','2013-01-01','2013-08-31',180),('Rat8','Vil8','2013-01-01','2013-08-31',300),('Rat9','Vil9','2013-01-01','2013-08-31',80);
/*!40000 ALTER TABLE `rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation` (
  `reservation_id` varchar(10) NOT NULL,
  `res_user` varchar(5) NOT NULL,
  `res_villa` varchar(5) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `res_coupon` varchar(10) DEFAULT NULL,
  `deposit` float DEFAULT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `user_idx` (`res_user`),
  KEY `res_villa` (`res_villa`),
  CONSTRAINT `res_user` FOREIGN KEY (`res_user`) REFERENCES `users` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `res_villa` FOREIGN KEY (`res_villa`) REFERENCES `villa` (`vid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES ('Res1','U1','Vil1','2013-01-02','2013-01-04','null',50),('Res10','U2','Vil10','2013-08-19','2013-08-21','null',75),('Res11','U5','Vil11','2013-08-15','2013-08-17','null',51),('Res12','U6','Vil12','2013-08-27','2013-08-28','null',33),('Res13','U2','Vil1','2013-09-01','2013-09-03','null',40),('Res14','U5','Vil2','2013-09-02','2013-09-03','null',25),('Res15','U9','Vil3','2013-09-15','2013-09-20','Coup3',36),('Res16','U5','Vil4','2013-10-01','2013-10-03','Coup4',27),('Res17','U4','Vil5','2013-10-15','2013-10-16','null',24),('Res18','U5','Vil6','2013-11-02','2013-11-04','null',30),('Res19','U10','Vil7','2013-11-06','2013-11-07','null',50),('Res2','U7','Vil2','2013-01-05','2013-01-06','null',30),('Res20','U9','Vil8','2013-11-06','2013-11-10','null',60),('Res21','U4','Vil9','2013-11-10','2013-11-13','null',15),('Res22','U4','Vil10','2013-11-11','2013-11-13','null',60),('Res23','U6','Vil11','2013-12-01','2013-12-04','null',40),('Res24','U5','Vil12','2013-12-23','2013-12-26','null',30),('Res25','U7','Vil1','2014-01-12','2014-01-15','Coup1',48),('Res26','U9','Vil2','2014-01-06','2014-01-07','Coup2',34),('Res27','U6','Vil2','2014-02-05','2014-02-09','null',40),('Res28','U5','Vil5','2014-02-09','2014-02-15','null',50),('Res29','U4','Vil8','2014-03-18','2014-03-19','null',120),('Res3','U2','Vil3','2013-02-03','2013-02-07','null',60),('Res30','U2','Vil4','2014-04-27','2014-04-30','null',50),('Res31','U4','Vil10','2014-05-29','2014-06-01','null',96),('Res32','U9','Vil12','2014-07-28','2014-08-02','null',42),('Res33','U9','Vil7','2014-08-11','2014-08-12','null',75),('Res34','U7','Vil4','2014-08-15','2014-08-21','null',50),('Res35','U8','Vil8','2014-08-13','2014-08-17','null',120),('Res36','U3','Vil2','2014-08-27','2014-08-28','null',40),('Res37','U2','Vil11','2014-06-20','2014-06-23','null',70),('Res38','U1','Vil2','2014-08-28','2014-08-30','null',40),('Res39','U9','Vil1','2014-04-10','2014-04-15','null',60),('Res4','U4','Vil4','2013-02-04','2013-02-05','null',39),('Res40','U9','Vil7','2014-02-05','2014-02-09','null',75),('Res41','U8','Vil7','2014-02-09','2014-02-15','null',75),('Res42','U5','Vil7','2014-03-18','2014-03-19','null',75),('Res43','U6','Vil1','2014-05-12','2014-05-13','Coup5',51),('Res5','U4','Vil5','2013-03-06','2013-03-12','null',40),('Res6','U4','Vil6','2013-04-23','2013-04-25','null',42),('Res7','U6','Vil7','2013-05-29','2013-06-01','null',60),('Res8','U10','Vil8','2013-07-30','2013-08-02','null',100),('Res9','U3','Vil9','2013-08-11','2013-08-12','null',24);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `rev_id` varchar(5) NOT NULL,
  `user_id` varchar(5) NOT NULL,
  `villa_id` varchar(5) NOT NULL,
  `text` varchar(100) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`rev_id`),
  KEY `user_id_idx` (`user_id`),
  KEY `villa_id_idx` (`villa_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `villa_id` FOREIGN KEY (`villa_id`) REFERENCES `villa` (`vid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES ('Rev1','U1','Vil1','Poor maintainance considering the price.',2),('Rev10','U3','Vil9','A must visit villa',5),('Rev11','U10','Vil8','Nice',1),('Rev13','U6','Vil7','poor one',1),('Rev14','U1','Vil7','popular one',4),('Rev15','U7','Vil3','wanna go back!',5),('Rev2','U2','Vil3','Boring and Dull',1),('Rev3','U4','Vil6','Love it!',4),('Rev4','U2','Vil1','Best vila error',2),('Rev5','U7','Vil1','Though not clean, has fantastic scenery around it',3),('Rev6','U5','Vil2','not recommended',1),('Rev7','U6','Vil1','Good one',4),('Rev8','U4','Vil4','I gonna rent again and again',5),('Rev9','U9','Vil3','Good work',5);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` varchar(5) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('U1','jack_killer@gmail.com','Jackie','Jones','1983-02-28'),('U10','danamoon@louti.com','Carlos','Santana','1977-07-07'),('U11','owner1@villa.com','Roberto','Carlos','1955-05-05'),('U12','owner2@villa.com','De','Vilardo','1944-04-04'),('U13','owner3@villa.com','villa','Blanka','1974-11-11'),('U14','ceo@villa.com','nino','bino','1991-01-01'),('U15','manager2@villa.com','Bookish','Morinio','1950-04-17'),('U2','Hello_macy@yahoo.com','Jessie','Jackson','1986-03-04'),('U3','john_black@hotmail.com','Tommy','Trojan','1990-04-22'),('U4','ny_robert@usc.edu','Niki','Nanjan','1980-06-10'),('U5','cool_andrew@bbc.co.uk','Jalli','Shadan','1984-11-27'),('U6','coryphillip@voa.gov','Houtan','Khandan','1966-06-06'),('U7','DaneilJ@msnbc.com','Naz','Nazi','2000-04-20'),('U8','rohanau@cs.mit.edu','Ab','Bazi','1956-12-12'),('U9','edmorales@houti.com','Ben','Ghazi','1973-11-10');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `villa`
--

DROP TABLE IF EXISTS `villa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `villa` (
  `vid` varchar(5) NOT NULL,
  `name` varchar(10) NOT NULL,
  `owner` varchar(5) NOT NULL,
  PRIMARY KEY (`vid`),
  KEY `owner_idx` (`owner`),
  CONSTRAINT `owner` FOREIGN KEY (`owner`) REFERENCES `owners` (`oid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `villa`
--

LOCK TABLES `villa` WRITE;
/*!40000 ALTER TABLE `villa` DISABLE KEYS */;
INSERT INTO `villa` VALUES ('Vil1','Fifi','U11'),('Vil10','Kelley','U12'),('Vil11','Dori','U12'),('Vil12','Houti','U13'),('Vil2','Lulu','U12'),('Vil3','Penny','U13'),('Vil4','Kiki','U11'),('Vil5','Vivi','U11'),('Vil6','Gigi','U11'),('Vil7','Kitty','U12'),('Vil8','Ellie','U13'),('Vil9','Ali','U14');
/*!40000 ALTER TABLE `villa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-10  2:28:51
