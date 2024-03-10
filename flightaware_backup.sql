-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: flightaware1db
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft` (
  `aircraft_id` int NOT NULL,
  `model` varchar(30) NOT NULL,
  `capacity` int NOT NULL,
  `airline_id` int NOT NULL,
  PRIMARY KEY (`aircraft_id`),
  KEY `Aircraft_Airline` (`airline_id`),
  CONSTRAINT `Aircraft_Airline` FOREIGN KEY (`airline_id`) REFERENCES `airline` (`airline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft`
--

LOCK TABLES `aircraft` WRITE;
/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
INSERT INTO `aircraft` VALUES (1,'Altima',537,317),(2,'Mustang',878,308),(3,'Roadster',144,305),(4,'Countach',560,318),(5,'Expeditional',385,302),(6,'PTCruiser',333,319),(7,'Arizon',134,319),(8,'Victor',121,312),(9,'Prius',86,310),(10,'Expedition',748,312),(12,'Hoota',328,317),(13,'Camry',563,316),(15,'Malibu',181,310),(16,'Challenger',207,319),(17,'Jetta',202,317),(18,'Charger',701,317),(20,'Camry',966,301);
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airline`
--

DROP TABLE IF EXISTS `airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airline` (
  `airline_id` int NOT NULL,
  `airline_name` varchar(25) NOT NULL,
  PRIMARY KEY (`airline_id`),
  KEY `idx_airline_name` (`airline_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airline`
--

LOCK TABLES `airline` WRITE;
/*!40000 ALTER TABLE `airline` DISABLE KEYS */;
INSERT INTO `airline` VALUES (308,'American Airlines'),(305,'British Airways'),(310,'Delta'),(318,'easyjet'),(302,'Ethiad'),(311,'Ethopia airlines'),(312,'Finair'),(313,'Gulf Airlines'),(301,'Indigo'),(304,'JetBlue'),(303,'Lufthansa'),(319,'Lux Air'),(317,'Middle East Airlines'),(316,'Oman Air'),(314,'Russian Airlines'),(320,'Southwest'),(315,'THAI'),(306,'Turkish Airlines'),(309,'United'),(307,'Vistara');
/*!40000 ALTER TABLE `airline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `airport_id` int NOT NULL,
  `airport_name` varchar(30) NOT NULL,
  `airport_country` varchar(30) NOT NULL,
  `airport_city` varchar(30) NOT NULL,
  `flight_id` int NOT NULL,
  PRIMARY KEY (`airport_id`),
  KEY `Airport_flight` (`flight_id`),
  CONSTRAINT `Airport_flight` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES (21,'Olive','India','Chicago',2455),(23,'Phillip','Nicaragua','Marccester',2388),(24,'Angelo','Rwanda','Ernserberg',2377),(26,'Verna','Mozambique','LakeCobyview',2355),(27,'Claude','Togo','FortJonasstead',2344),(28,'Carl','Mauritius','CarsonCity',2333),(29,'Beatrice','Uzbekistan','LakeBella',2322),(31,'Chester','Maldives','Ferneland',2222),(32,'Lloyd','Niue','PortTimmothy',2111),(33,'Douglas','Nauru','SouthHortense',2001),(34,'Jodi','Senegal','FortChristophetown',1991),(35,'Olivia','Montserrat','North',1881),(36,'Marta','Kiribati','Krisstad',1771),(37,'Beulah','ElSalvador','FortBransonberg',1661),(38,'Paul','Haiti','Kennewick',1551),(39,'Tricia','Fiji','RochesterHills',1441),(40,'Dallas','Namibia','Strosinworth',1331);
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `booking_id` int NOT NULL,
  `booking_date` date NOT NULL,
  `seat_number` int NOT NULL,
  `passenger_id` int NOT NULL,
  `flight_id` int NOT NULL,
  `airline_id` int NOT NULL,
  `ticket_id` int NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `Booking_Airline` (`airline_id`),
  KEY `Booking_Passenger` (`passenger_id`),
  KEY `Booking_Ticket` (`ticket_id`),
  KEY `Booking_flight` (`flight_id`),
  CONSTRAINT `Booking_Airline` FOREIGN KEY (`airline_id`) REFERENCES `airline` (`airline_id`),
  CONSTRAINT `Booking_flight` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`),
  CONSTRAINT `Booking_Passenger` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`),
  CONSTRAINT `Booking_Ticket` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (8001,'2024-02-05',53,130,1331,311,2030),(8002,'2024-02-21',55,131,1441,312,2031),(8003,'2024-02-18',52,132,1551,313,2032),(8004,'2024-02-07',53,133,1661,314,2033),(8005,'2024-01-06',54,134,1771,315,2034),(8006,'2024-02-12',55,135,1881,316,2035),(8007,'2024-02-20',56,136,1991,317,2036),(8008,'2024-01-18',57,137,2001,318,2037),(8009,'2024-01-29',58,138,2111,319,2038),(8012,'2024-02-12',61,121,2322,302,2021),(8013,'2024-03-24',62,122,2333,303,2022),(8014,'2024-01-27',63,123,2344,304,2023),(8017,'2024-01-13',66,126,2377,307,2026),(8018,'2024-03-29',67,127,2388,308,2027),(8020,'2024-03-24',69,129,2455,310,2029),(8021,'2024-03-16',71,130,1331,311,2030),(8022,'2024-03-16',71,130,1331,311,2042);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `UpdateTicketStatus` AFTER INSERT ON `booking` FOR EACH ROW BEGIN
    DECLARE ticketID INT;
    SELECT ticket_id INTO ticketID FROM ticket WHERE ticket_id = NEW.ticket_id;
    IF ticketID IS NOT NULL THEN
        UPDATE ticket SET ticket_status = 'Approved' WHERE ticket_id = NEW.ticket_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `bookinginfoview`
--

DROP TABLE IF EXISTS `bookinginfoview`;
/*!50001 DROP VIEW IF EXISTS `bookinginfoview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `bookinginfoview` AS SELECT 
 1 AS `booking_id`,
 1 AS `booking_date`,
 1 AS `seat_number`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `email`,
 1 AS `mobile_number`,
 1 AS `flight_status`,
 1 AS `arrival_time`,
 1 AS `departure_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `flight_id` int NOT NULL,
  `flight_status` char(8) NOT NULL,
  `arrival_time` timestamp NOT NULL,
  `departure_time` timestamp NOT NULL,
  `aircraft_id` int NOT NULL,
  `airline_id` int NOT NULL,
  PRIMARY KEY (`flight_id`),
  KEY `flight_Aircraft` (`aircraft_id`),
  KEY `flight_Airline` (`airline_id`),
  KEY `idx_flight_status` (`flight_status`),
  CONSTRAINT `flight_Aircraft` FOREIGN KEY (`aircraft_id`) REFERENCES `aircraft` (`aircraft_id`),
  CONSTRAINT `flight_Airline` FOREIGN KEY (`airline_id`) REFERENCES `airline` (`airline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (1331,'delayed','2023-11-20 07:00:00','2023-11-21 08:00:00',5,318),(1441,'delayed','2024-01-10 07:15:00','2024-01-10 07:40:00',6,301),(1551,'ontime','2023-12-12 10:14:00','2023-12-12 12:14:00',1,303),(1661,'delayed','2023-10-23 02:30:00','2023-10-23 03:30:00',2,305),(1771,'ontime','2024-02-11 04:25:00','2024-02-11 05:25:00',3,307),(1881,'ontime','2024-01-25 18:34:00','2024-01-25 08:34:00',7,302),(1991,'delayed','2024-01-15 17:42:00','2024-01-15 19:42:00',4,304),(2001,'ontime','2023-10-08 12:00:00','2023-10-08 15:00:00',20,306),(2111,'ontime','2024-01-01 14:15:00','2024-01-01 15:00:00',15,309),(2222,'delayed','2024-02-02 06:00:00','2024-02-02 08:00:00',10,311),(2322,'delayed','2023-11-24 23:18:00','2023-11-25 01:18:00',4,308),(2333,'ontime','2024-01-10 22:20:00','2024-01-11 00:20:00',8,312),(2344,'delayed','2023-11-15 06:00:00','2023-11-15 09:00:00',9,315),(2355,'ontime','2024-01-02 08:25:00','2024-01-02 09:25:00',13,317),(2377,'delayed','2024-01-16 13:20:00','2024-01-16 13:44:00',12,319),(2388,'ontime','2024-01-18 14:55:00','2024-01-18 16:05:00',17,314),(2455,'delayed','2024-02-08 18:25:00','2024-02-08 20:12:00',16,310);
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `passenger_id` int NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile_number` int NOT NULL,
  PRIMARY KEY (`passenger_id`),
  KEY `idx_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (121,'Glenda','Rosenbaum','Glenda65@hotmail.com',108137932),(122,'Nathan','Gibson','Nathan.Gibson8@gmail.com',132810302),(123,'Ida','Jast','Ida_Jast22@yahoo.com',10328812),(125,'Irvin','Haag','Irvin_Haag48@yahoo.com',183910753),(126,'Dawn','Steuber','Dawn.Steuber@gmail.com',154654077),(127,'Robyn','Cartwright','Robyn_Cartwright6@yahoo.com',132714861),(128,'Bobby','Hane','Bobby.Hane@yahoo.com',197734245),(129,'Byron','Friesen','Byron46@gmail.com',133515932),(130,'Mona','Pagac','Mona95@hotmail.com',140530314),(131,'Julian','Ritchie','Julian_Ritchie@hotmail.com',141778043),(132,'Cynthia','Wiza','Cynthia.Wiza29@yahoo.com',103879270),(133,'Wade','Fay','Wade11@gmail.com',193372889),(134,'Craig','Fritsch','Craig_Fritsch46@hotmail.com',158424853),(135,'Sheldon','Ryan','Sheldon_Ryan53@hotmail.com',125438769),(136,'Rachael','Friesen','Rachael.Friesen91@yahoo.com',185262370),(137,'Nelson','Ondricka','Nelson_Ondricka@yahoo.com',185318375),(138,'Dewey','Runolfsdottir','Dewey_Runolfsdottir@yahoo.com',170531952),(139,'Christie','Walter','Christie.Walter@hotmail.com',180634361),(140,'Gertrude','Rippin','Gertrude30@gmail.com',108146350);
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `amount` int NOT NULL,
  `payment_date` date NOT NULL,
  `payment_status` longtext NOT NULL,
  `booking_id` int NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `Payment_Booking` (`booking_id`),
  CONSTRAINT `Payment_Booking` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (300001,'Debit card',2020,'2023-11-07','Completed',8001),(300002,'Debit card',6524,'2024-01-23','Refunded',8002),(300003,'Bank transfer',9627,'2023-12-28','Failed',8003),(300004,'Credit card',7086,'2023-12-12','Refunded',8004),(300005,'Credit card',8510,'2023-11-08','Failed',8005),(300006,'Net Banking',2156,'2023-12-05','Failed',8006),(300007,'Net Banking',7106,'2023-12-29','Refunded',8007),(300008,'Bank transfer',1516,'2023-11-20','Completed',8008),(300009,'Bank transfer',3067,'2023-12-05','Refunded',8009),(300012,'Credit card',5611,'2023-12-10','Completed',8012),(300013,'Credit card',6803,'2023-11-23','Refunded',8013),(300014,'Net Banking',4582,'2024-01-24','Pending',8014),(300017,'Bank transfer',2476,'2023-12-05','Pending',8017),(300018,'Bank transfer',7444,'2024-01-02','Refunded',8018),(300020,'Bank transfer',4041,'2024-01-04','Pending',8020);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `paymentdetailsview`
--

DROP TABLE IF EXISTS `paymentdetailsview`;
/*!50001 DROP VIEW IF EXISTS `paymentdetailsview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `paymentdetailsview` AS SELECT 
 1 AS `payment_id`,
 1 AS `payment_method`,
 1 AS `amount`,
 1 AS `payment_date`,
 1 AS `payment_status`,
 1 AS `booking_id`,
 1 AS `booking_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `ticket_id` int NOT NULL,
  `ticket_date` date NOT NULL,
  `ticket_status` longtext NOT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `idx_ticket_date` (`ticket_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (2021,'2023-06-16','Approved'),(2022,'2023-12-29','Approved'),(2023,'2024-01-16','Declined'),(2024,'2024-02-24','Declined'),(2025,'2024-02-04','Approved'),(2026,'2023-12-31','Approved'),(2027,'2024-02-02','Approved'),(2028,'2024-02-24','Declined'),(2029,'2024-02-11','Declined'),(2030,'2024-01-20','Approved'),(2031,'2024-02-21','Approved'),(2032,'2023-11-28','Approved'),(2033,'2024-01-23','Declined'),(2034,'2023-11-12','Declined'),(2035,'2024-02-22','Approved'),(2036,'2023-12-28','Approved'),(2037,'2024-01-07','Declined'),(2038,'2024-01-03','Declined'),(2039,'2023-11-29','Declined'),(2040,'2024-02-15','Declined'),(2041,'2024-02-09','Declined'),(2042,'2024-02-09','Approved');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `bookinginfoview`
--

/*!50001 DROP VIEW IF EXISTS `bookinginfoview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bookinginfoview` AS select `b`.`booking_id` AS `booking_id`,`b`.`booking_date` AS `booking_date`,`b`.`seat_number` AS `seat_number`,`p`.`first_name` AS `first_name`,`p`.`last_name` AS `last_name`,`p`.`email` AS `email`,`p`.`mobile_number` AS `mobile_number`,`f`.`flight_status` AS `flight_status`,`f`.`arrival_time` AS `arrival_time`,`f`.`departure_time` AS `departure_time` from ((`booking` `b` join `passenger` `p` on((`b`.`passenger_id` = `p`.`passenger_id`))) join `flight` `f` on((`b`.`flight_id` = `f`.`flight_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `paymentdetailsview`
--

/*!50001 DROP VIEW IF EXISTS `paymentdetailsview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `paymentdetailsview` AS select `p`.`payment_id` AS `payment_id`,`p`.`payment_method` AS `payment_method`,`p`.`amount` AS `amount`,`p`.`payment_date` AS `payment_date`,`p`.`payment_status` AS `payment_status`,`b`.`booking_id` AS `booking_id`,`b`.`booking_date` AS `booking_date` from (`payment` `p` join `booking` `b` on((`p`.`booking_id` = `b`.`booking_id`))) */;
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

-- Dump completed on 2024-03-09 23:31:16
