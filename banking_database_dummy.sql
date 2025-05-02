-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ammu
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `_account`
--

DROP TABLE IF EXISTS `_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_account` (
  `customer_id` int DEFAULT NULL,
  `_account_id` int NOT NULL,
  `sort_code` int NOT NULL,
  `_account_no` int NOT NULL,
  `opening_balance` decimal(10,0) NOT NULL,
  PRIMARY KEY (`_account_id`),
  UNIQUE KEY `_account_id` (`_account_id`),
  UNIQUE KEY `sort_code` (`sort_code`),
  UNIQUE KEY `_account_no` (`_account_no`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `_account_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `_account_chk_1` CHECK ((`opening_balance` >= 300))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_account`
--

LOCK TABLES `_account` WRITE;
/*!40000 ALTER TABLE `_account` DISABLE KEYS */;
INSERT INTO `_account` VALUES (1,1001,200401,10004301,450),(2,1002,200502,10340002,300),(3,1003,200603,10520003,300),(4,1004,200704,10730004,300),(5,1005,200805,10890005,300),(6,1006,200906,10764006,300),(7,1007,201007,10534007,300),(8,1008,201108,10230008,300),(9,1009,201209,13420009,300),(10,1010,201310,10002310,300),(11,1011,201411,15460011,300),(12,1012,201512,19870012,300),(13,1013,201613,13450013,300),(14,1014,201714,10000014,300),(15,1015,201815,15670015,300),(16,1016,201916,10000016,300),(17,1017,202017,13060017,300),(18,1018,202118,10000018,300),(19,1019,202219,10035019,300),(20,1020,202320,10000020,300);
/*!40000 ALTER TABLE `_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_account_balance`
--

DROP TABLE IF EXISTS `_account_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_account_balance` (
  `_account_no` int NOT NULL,
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `_account_id` int DEFAULT NULL,
  PRIMARY KEY (`_account_no`),
  KEY `fk_account_id` (`_account_id`),
  CONSTRAINT `fk_account_id` FOREIGN KEY (`_account_id`) REFERENCES `transactions` (`_account_id`),
  CONSTRAINT `yaari` FOREIGN KEY (`_account_no`) REFERENCES `_account` (`_account_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_account_balance`
--

LOCK TABLES `_account_balance` WRITE;
/*!40000 ALTER TABLE `_account_balance` DISABLE KEYS */;
INSERT INTO `_account_balance` VALUES (10000014,4640.00,1014),(10000016,4951.00,1016),(10000018,2035.00,1018),(10000020,2898.00,1020),(10002310,2222.00,1010),(10004301,1890.00,1001),(10035019,1614.00,1019),(10230008,3268.00,1008),(10340002,3123.00,1002),(10520003,2706.00,1003),(10534007,3887.00,1007),(10730004,3076.00,1004),(10764006,2579.00,1006),(10890005,1911.00,1005),(13060017,4864.00,1017),(13420009,1335.00,1009),(13450013,3223.00,1013),(15460011,3206.00,1011),(15670015,3802.00,1015),(19870012,4870.00,1012);
/*!40000 ALTER TABLE `_account_balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `First_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `Telephone_no` varchar(20) DEFAULT NULL,
  `Email_address` varchar(40) NOT NULL,
  `address` varchar(100) NOT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `Email_address` (`Email_address`),
  UNIQUE KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('Elliot','Sanders','07197865432','elliot.sanders@unique.com','123 Elm Street',1),('Harriet','Griffiths','07456789012','harriet.griffiths@unique.com','456 Oak Avenue',2),('Dylan','Parker','07123459678','dylan.parker@unique.com','789 Pine Boulevard',3),('Megan','Fletcher','07345678214','megan.fletcher@unique.com','101 Maple Road',4),('Isaac','Bradley','07567891234','isaac.bradley@unique.com','202 Birch Lane',5),('Poppy','Armstrong','07987654321','poppy.armstrong@unique.com','303 Cedar Street',6),('Theo','Henderson','07198712345','theo.henderson@unique.com','404 Redwood Drive',7),('Lola','Chapman','07234567891','lola.chapman@unique.com','505 Willow Avenue',8),('Arthur','Murray','07456123879','arthur.murray@unique.com','606 Ash Street',9),('Rosie','Harper','07321987654','rosie.harper@unique.com','707 Elm Road',10),('Felix','Stevenson','07945671238','felix.stevenson@unique.com','808 Maple Lane',11),('Ellie','Carter','07896543210','ellie.carter@unique.com','909 Oak Blvd',12),('Louis','Mason','07193485672','louis.mason@unique.com','1010 Pine Street',13),('Sophia','Kemp','07928467531','sophia.kemp@unique.com','111 Elm Avenue',14),('Ryan','Preston','07783456920','ryan.preston@unique.com','1212 Cedar Blvd',15),('Evie','Goodwin','07561983427','evie.goodwin@unique.com','1313 Ash Street',16),('Freddie','Dawson','07128345967','freddie.dawson@unique.com','1414 Willow Road',17),('Lily','Hunt','07458962371','lily.hunt@unique.com','1515 Redwood Drive',18),('Jacob','Cameron','07319482756','jacob.cameron@unique.com','1616 Maple Lane',19),('Grace','Barlow','07249816357','grace.barlow@unique.com','1717 Oak Blvd',20);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laon_type`
--

DROP TABLE IF EXISTS `laon_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laon_type` (
  `loan_id` int DEFAULT NULL,
  `t_ype` varchar(12) NOT NULL,
  `interest_rate` int DEFAULT NULL,
  `no_of_payments` int DEFAULT NULL,
  KEY `fk_loan` (`loan_id`),
  CONSTRAINT `fk_loan` FOREIGN KEY (`loan_id`) REFERENCES `loan` (`loan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laon_type`
--

LOCK TABLES `laon_type` WRITE;
/*!40000 ALTER TABLE `laon_type` DISABLE KEYS */;
INSERT INTO `laon_type` VALUES (1,'Personal',5,12),(2,'Home',3,240),(3,'Auto',4,60),(4,'Education',6,48),(5,'Business',7,120),(6,'Personal',5,24),(7,'Home',3,180),(8,'Auto',4,36),(9,'Education',6,72),(10,'Business',8,144),(11,'Personal',5,18),(12,'Home',3,300),(13,'Auto',4,48),(14,'Education',6,54),(15,'Business',7,96),(16,'Personal',5,6),(17,'Home',2,360),(18,'Auto',3,12),(19,'Education',4,36),(20,'Business',6,84);
/*!40000 ALTER TABLE `laon_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan` (
  `_account_no` int DEFAULT NULL,
  `loan_id` int NOT NULL,
  `first_payment_d` date NOT NULL,
  `monthly_payment` decimal(10,2) NOT NULL,
  `loan_amount` decimal(10,2) NOT NULL,
  `payment_due_d` date DEFAULT NULL,
  PRIMARY KEY (`loan_id`),
  UNIQUE KEY `loan_id` (`loan_id`),
  KEY `_account_no` (`_account_no`),
  CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`_account_no`) REFERENCES `_account` (`_account_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (10004301,1,'2024-01-15',1250.00,300000.00,'2024-08-13'),(10340002,2,'2023-12-05',450.00,27000.00,'2024-06-10'),(10520003,3,'2024-01-10',300.00,10800.00,'2024-05-09'),(10730004,4,'2023-11-20',800.00,96000.00,'2024-06-12'),(10890005,5,'2024-02-01',400.00,24000.00,'2024-03-03'),(10764006,6,'2023-12-01',1000.00,180000.00,'2024-07-07'),(10534007,7,'2024-01-25',600.00,14400.00,'2024-01-25'),(10230008,8,'2023-10-15',750.00,75000.00,'2024-10-12'),(13420009,9,'2023-09-25',500.00,18000.00,'2024-09-18'),(10002310,10,'2024-03-05',1500.00,300000.00,'2024-03-25'),(15460011,11,'2023-11-15',950.00,114000.00,'2024-01-05'),(19870012,12,'2023-12-10',500.00,24000.00,'2024-05-14'),(13450013,13,'2024-01-05',450.00,8100.00,'2024-10-20'),(10000014,14,'2024-01-20',700.00,42000.00,'2024-12-01'),(15670015,15,'2023-08-01',1350.00,324000.00,'2024-03-07'),(10000016,16,'2024-02-10',520.00,24960.00,'2024-02-24'),(13060017,17,'2023-09-01',320.00,11520.00,'2024-03-14'),(10000018,18,'2024-04-15',810.00,81000.00,'2024-07-22'),(10035019,19,'2023-12-20',900.00,162000.00,'2024-03-06'),(10000020,20,'2023-07-15',450.00,27000.00,'2024-03-25');
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `_account_id` int DEFAULT NULL,
  `transaction_id` int NOT NULL,
  `transaction_Type` varchar(50) NOT NULL,
  `transaction_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  KEY `_account_id` (`_account_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`_account_id`) REFERENCES `_account` (`_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1001,101,'deposit','2024-06-15',250.75),(1002,102,'withdrawal','2023-10-22',-150.00),(1003,103,'deposit','2024-03-08',300.00),(1004,104,'transfer','2024-08-01',-450.00),(1005,105,'deposit','2024-02-12',200.00),(1006,106,'withdrawal','2023-11-19',-100.00),(1007,107,'transfer','2024-01-30',350.00),(1008,108,'deposit','2023-12-05',400.00),(1009,109,'withdrawal','2024-09-11',-75.50),(1010,110,'deposit','2023-06-21',250.00),(1011,111,'transfer','2024-04-28',-300.00),(1012,112,'deposit','2024-07-10',150.00),(1013,113,'withdrawal','2024-10-05',-200.00),(1014,114,'transfer','2023-12-12',100.00),(1015,115,'deposit','2024-02-20',250.00),(1016,116,'withdrawal','2023-09-09',-125.00),(1017,117,'transfer','2024-05-16',300.00),(1018,118,'deposit','2024-11-03',450.00),(1019,119,'withdrawal','2023-08-27',-100.00),(1020,120,'withdrawal','2023-08-27',200.00),(1001,121,'deposit','2024-12-16',500.00),(1003,122,'deposit','2024-12-16',500.00),(1001,124,'deposit','2024-12-16',500.00);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions_transfer`
--

DROP TABLE IF EXISTS `transactions_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions_transfer` (
  `tranfer_id` int NOT NULL AUTO_INCREMENT,
  `original_transaction_id` int DEFAULT NULL,
  `account_no` int DEFAULT NULL,
  `destination_account_no` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`tranfer_id`),
  KEY `original_transaction_id` (`original_transaction_id`),
  KEY `account_no` (`account_no`),
  CONSTRAINT `transactions_transfer_ibfk_1` FOREIGN KEY (`original_transaction_id`) REFERENCES `transactions` (`transaction_id`),
  CONSTRAINT `transactions_transfer_ibfk_2` FOREIGN KEY (`account_no`) REFERENCES `_account` (`_account_no`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions_transfer`
--

LOCK TABLES `transactions_transfer` WRITE;
/*!40000 ALTER TABLE `transactions_transfer` DISABLE KEYS */;
INSERT INTO `transactions_transfer` VALUES (9,104,10730004,10534007,450.00),(10,107,10534007,13450013,350.00),(11,111,15460011,10534007,450.00),(12,117,13060017,10730004,350.00);
/*!40000 ALTER TABLE `transactions_transfer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-03  0:35:01
