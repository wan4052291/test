-- MySQL dump 10.19  Distrib 10.3.34-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: test4
-- ------------------------------------------------------
-- Server version	10.3.34-MariaDB-0ubuntu0.20.04.1

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

--
-- Temporary table structure for view `act_view`
--

DROP TABLE IF EXISTS `act_view`;
/*!50001 DROP VIEW IF EXISTS `act_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `act_view` (
  `student_id` tinyint NOT NULL,
  `exp_year` tinyint NOT NULL,
  `exp_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `activeexp`
--

DROP TABLE IF EXISTS `activeexp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activeexp` (
  `exp_year` decimal(4,0) DEFAULT NULL,
  `exp_name` varchar(50) DEFAULT NULL,
  `student_id` varchar(8) DEFAULT NULL,
  `activeexp_id` int(15) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`activeexp_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `activeexp_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activeexp`
--

LOCK TABLES `activeexp` WRITE;
/*!40000 ALTER TABLE `activeexp` DISABLE KEYS */;
INSERT INTO `activeexp` VALUES (2019,'VCL','40843224',6),(2022,'CL','40843213',7),(2022,'CCL','40843221',8),(2003,'SCL','40843231',9),(2017,'CT','40843294',10),(2018,'AC','40843295',11),(2019,'CS','40843296',12),(2017,'SCL','40843297',13),(2022,'Activities coordinator','40843298',14),(2019,'Class Leader','40843299',15);
/*!40000 ALTER TABLE `activeexp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `dept_name` varchar(15) NOT NULL,
  `building_name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('csie','BGC'),('EE','BGA'),('English','ATZ'),('Geography','Computer Center'),('History','ATC'),('MDE','ATB'),('ME','ATA'),('OEE','BGA'),('PME','ATD'),('Vtuber','VRchat');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `dept_view`
--

DROP TABLE IF EXISTS `dept_view`;
/*!50001 DROP VIEW IF EXISTS `dept_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `dept_view` (
  `student_id` tinyint NOT NULL,
  `dept_name` tinyint NOT NULL,
  `building_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `lic_view`
--

DROP TABLE IF EXISTS `lic_view`;
/*!50001 DROP VIEW IF EXISTS `lic_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `lic_view` (
  `student_id` tinyint NOT NULL,
  `license_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `license`
--

DROP TABLE IF EXISTS `license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license` (
  `license_name` varchar(50) DEFAULT NULL,
  `student_id` varchar(8) DEFAULT NULL,
  `license_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`license_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `license_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license`
--

LOCK TABLES `license` WRITE;
/*!40000 ALTER TABLE `license` DISABLE KEYS */;
INSERT INTO `license` VALUES ('AMA','40843224',4),('AMA','40843213',5),('PMP','40843213',6),('AMA','40843221',7),('AMA','40843231',8),('MCSA','40843231',9),('MCAD','40843231',10),('MCTS','40843231',11),('RHCE','40843294',12),('MCSE','40843295',13),('CCIE','40843295',14),('CISSP','40843296',15),('PMP','40843297',16),('CCNA','40843298',17),('TCSE','40843299',18);
/*!40000 ALTER TABLE `license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `prc_view`
--

DROP TABLE IF EXISTS `prc_view`;
/*!50001 DROP VIEW IF EXISTS `prc_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `prc_view` (
  `student_id` tinyint NOT NULL,
  `prc_unit` tinyint NOT NULL,
  `prc_year` tinyint NOT NULL,
  `prc_pos` tinyint NOT NULL,
  `prc_feel` tinyint NOT NULL,
  `prc_content` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `prcexp`
--

DROP TABLE IF EXISTS `prcexp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prcexp` (
  `prc_unit` varchar(50) DEFAULT NULL,
  `prc_year` decimal(4,0) DEFAULT NULL,
  `prc_pos` varchar(50) DEFAULT NULL,
  `prc_feel` varchar(3000) DEFAULT NULL,
  `prc_content` varchar(1000) DEFAULT NULL,
  `student_id` varchar(8) DEFAULT NULL,
  `prcexp_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`prcexp_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `prcexp_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prcexp`
--

LOCK TABLES `prcexp` WRITE;
/*!40000 ALTER TABLE `prcexp` DISABLE KEYS */;
INSERT INTO `prcexp` VALUES ('Chung-Shan',112,'intern','25000/M nice','Cloud Compute','40843224',3),('ChaoYangLab',2022,'slave','PAINNNNNNNNNNNNN','Homeworker','40843213',4),('Goverment',2220,'president','MONEYMONEY','oppress the people','40843221',5),('Chung-Shan',2022,'intern','NICE','sweep the floor','40843231',6),('ChaoYangLab',2025,'slave','NO MONEY QQ','delivery','40843231',7),('Executive Yuan',2023,'intern','Not Bad','deiver document','40843294',8),('Chung-Shan',2027,'Web Designer','Not Bad','Develop Web','40843295',9),('Tao-Yuan',2022,'intern','Best work','programming','40843296',10),('computer_center',2022,'Web Designer','NICE','Design Web','40843297',11),('Chung-Shan',2022,'intern','sad','so busy','40843298',12),('Google',2022,'intern','good job','process douments','40843299',13);
/*!40000 ALTER TABLE `prcexp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `proj_view`
--

DROP TABLE IF EXISTS `proj_view`;
/*!50001 DROP VIEW IF EXISTS `proj_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `proj_view` (
  `student_id` tinyint NOT NULL,
  `proj_title` tinyint NOT NULL,
  `proj_year` tinyint NOT NULL,
  `proj_url` tinyint NOT NULL,
  `proj_guide` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `proj_title` varchar(50) DEFAULT NULL,
  `proj_year` decimal(4,0) DEFAULT NULL,
  `proj_url` varchar(1000) DEFAULT NULL,
  `proj_student_id` varchar(8) DEFAULT NULL,
  `proj_guide` varchar(1000) DEFAULT NULL,
  `proj_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`proj_id`),
  KEY `proj_student_id` (`proj_student_id`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`proj_student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('MBNRMS',111,'','40843224','OpenStack+Free5GC',3),('Drone',2022,'','40843213','NOT GOOD',4),('Vdg Machine',2022,'','40843221','i dont know',5),('Drone',2022,'https://www.google.com/','40843231','FLYYY',6),('Web',2022,'https://reurl.cc/QLOkZM','40843231','PAIN',7),('trash tacker',2022,'https://reurl.cc/e3Z4ZM','40843294','sort garbage',8),('auto drone',2026,'https://reurl.cc/QLOkZM','40843295','auto fly',9),('Pet House',2022,'https://reurl.cc/RrQlKG','40843296','Pet House',10),('5G ROBOT',2022,'https://reurl.cc/p1V0Zx','40843297','Robot',11),('5G ROBOT',2022,'https://reurl.cc/p1V0Zx','40843298','5G ROBOT',12),('Vending Machine',2022,'https://reurl.cc/41Ge9v','40843299','Vending Machine NICE',13);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `race_view`
--

DROP TABLE IF EXISTS `race_view`;
/*!50001 DROP VIEW IF EXISTS `race_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `race_view` (
  `student_id` tinyint NOT NULL,
  `race_year` tinyint NOT NULL,
  `race_name` tinyint NOT NULL,
  `race_type` tinyint NOT NULL,
  `race_intro` tinyint NOT NULL,
  `race_grade` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `raceexp`
--

DROP TABLE IF EXISTS `raceexp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `raceexp` (
  `race_year` decimal(4,0) DEFAULT NULL,
  `race_name` varchar(50) DEFAULT NULL,
  `race_type` varchar(50) DEFAULT NULL,
  `student_id` varchar(8) DEFAULT NULL,
  `race_intro` varchar(1000) DEFAULT NULL,
  `race_grade` varchar(1000) DEFAULT NULL,
  `race_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`race_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `raceexp_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raceexp`
--

LOCK TABLES `raceexp` WRITE;
/*!40000 ALTER TABLE `raceexp` DISABLE KEYS */;
INSERT INTO `raceexp` VALUES (2022,'TDK34','drone','40843224','Fly drone','17',3),(2019,'TDK27','Drone','40843213','Play Drone','100',4),(2022,'HOLTEK-MCU 16','i dont know','40843221','32-bit MCU','1000',5),(2031,'TDK87','Drone','40843231','Fly Drone','87',6),(2039,'TDK117','Drone','40843231','Fly drone','0',7),(2022,'CHT5G','Presentation','40843294','Guide 5G','0',8),(2026,'ICPC','Program','40843295','program','100',9),(2047,'Macronix','Science','40843295','Inspiring interest in natual and applied sciences','59',10),(2047,'WangHonz','Science','40843295','Inspiring interest in natual','59',11),(2049,'Project Race','Normal','40843296','race your project','43',12),(2064,'iSOCIPcontest','MOE','40843297','Smart Chip System Application','1',13),(2022,'MobileHero','5G Robot','40843297','5G','100',14),(2058,'Y.S AWARD','SA','40843298','AR Drum kit','100',15),(2017,'Olympiad Math','program','40843299','math','70',16);
/*!40000 ALTER TABLE `raceexp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `staff_ID` varchar(15) NOT NULL,
  `staff_name` varchar(15) DEFAULT NULL,
  `dept_name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`staff_ID`),
  KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('B10035','Dennis P','Geography'),('B10036','Gawr Justin','Vtuber'),('B10037','lyc','csie'),('B10038','cch','csie'),('B10039','yhsheu','csie'),('B10040','lwj','csie'),('B10041','chhuang','csie'),('B10042','jychang','csie'),('B13024','yys','csie'),('B13102','hsuic','csie');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `student_id` varchar(8) NOT NULL,
  `student_name` varchar(50) DEFAULT NULL,
  `dept_name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('40843201','Xiao','csie'),('40843213','Liu,Yale-Peko','csie'),('40843221','Yu,Cheng-Ru','csie'),('40843224','HUANG-BO-WEI','csie'),('40843231','HONG,MING-XAIN','csie'),('40843294','Tian-Shen-Jie','csie'),('40843295','A-Bao','EE'),('40843296','Lao-Pi','OEE'),('40843297','XiaoMei','ME'),('40843298','XiaoMing','MDE'),('40843299','XiaoXiao','PME');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `takes`
--

DROP TABLE IF EXISTS `takes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `takes` (
  `student_id` varchar(8) NOT NULL,
  `course_id` varchar(15) NOT NULL,
  `course_name` varchar(15) DEFAULT NULL,
  `grade` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`student_id`,`course_id`),
  CONSTRAINT `takes_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `takes`
--

LOCK TABLES `takes` WRITE;
/*!40000 ALTER TABLE `takes` DISABLE KEYS */;
INSERT INTO `takes` VALUES ('40843201','1721','Biology','100'),('40843213','1922','COVID-19','100'),('40843221','1922','COVID-21','100'),('40843224','1658','Plane','60'),('40843224','1922','COVID-19','0'),('40843231','1302','WW3','80'),('40843294','1302','WW3','0'),('40843295','2048','gym class','60'),('40843295','2632','Biology','0'),('40843296','2046','WW2','56'),('40843297','1068','geography','42'),('40843298','7658','Machine Learn','53'),('40843299','1543','AI','100');
/*!40000 ALTER TABLE `takes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `takes_view`
--

DROP TABLE IF EXISTS `takes_view`;
/*!50001 DROP VIEW IF EXISTS `takes_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `takes_view` (
  `student_id` tinyint NOT NULL,
  `course_id` tinyint NOT NULL,
  `course_name` tinyint NOT NULL,
  `grade` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `act_view`
--

/*!50001 DROP TABLE IF EXISTS `act_view`*/;
/*!50001 DROP VIEW IF EXISTS `act_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `act_view` AS select `s`.`student_id` AS `student_id`,`e`.`exp_year` AS `exp_year`,`e`.`exp_name` AS `exp_name` from (`student` `s` join `activeexp` `e` on(`s`.`student_id` = `e`.`student_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dept_view`
--

/*!50001 DROP TABLE IF EXISTS `dept_view`*/;
/*!50001 DROP VIEW IF EXISTS `dept_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dept_view` AS select `s`.`student_id` AS `student_id`,`d`.`dept_name` AS `dept_name`,`d`.`building_name` AS `building_name` from (`student` `s` join `department` `d` on(`s`.`dept_name` = `d`.`dept_name`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lic_view`
--

/*!50001 DROP TABLE IF EXISTS `lic_view`*/;
/*!50001 DROP VIEW IF EXISTS `lic_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `lic_view` AS select `s`.`student_id` AS `student_id`,`l`.`license_name` AS `license_name` from (`student` `s` join `license` `l` on(`s`.`student_id` = `l`.`student_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `prc_view`
--

/*!50001 DROP TABLE IF EXISTS `prc_view`*/;
/*!50001 DROP VIEW IF EXISTS `prc_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prc_view` AS select `s`.`student_id` AS `student_id`,`p`.`prc_unit` AS `prc_unit`,`p`.`prc_year` AS `prc_year`,`p`.`prc_pos` AS `prc_pos`,`p`.`prc_feel` AS `prc_feel`,`p`.`prc_content` AS `prc_content` from (`student` `s` join `prcexp` `p` on(`s`.`student_id` = `p`.`student_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `proj_view`
--

/*!50001 DROP TABLE IF EXISTS `proj_view`*/;
/*!50001 DROP VIEW IF EXISTS `proj_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `proj_view` AS select `s`.`student_id` AS `student_id`,`p`.`proj_title` AS `proj_title`,`p`.`proj_year` AS `proj_year`,`p`.`proj_url` AS `proj_url`,`p`.`proj_guide` AS `proj_guide` from (`student` `s` join `project` `p` on(`s`.`student_id` = `p`.`proj_student_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `race_view`
--

/*!50001 DROP TABLE IF EXISTS `race_view`*/;
/*!50001 DROP VIEW IF EXISTS `race_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `race_view` AS select `s`.`student_id` AS `student_id`,`r`.`race_year` AS `race_year`,`r`.`race_name` AS `race_name`,`r`.`race_type` AS `race_type`,`r`.`race_intro` AS `race_intro`,`r`.`race_grade` AS `race_grade` from (`student` `s` join `raceexp` `r` on(`s`.`student_id` = `r`.`student_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `takes_view`
--

/*!50001 DROP TABLE IF EXISTS `takes_view`*/;
/*!50001 DROP VIEW IF EXISTS `takes_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `takes_view` AS select `s`.`student_id` AS `student_id`,`t`.`course_id` AS `course_id`,`t`.`course_name` AS `course_name`,`t`.`grade` AS `grade` from (`student` `s` join `takes` `t` on(`s`.`student_id` = `t`.`student_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-12 12:19:54
