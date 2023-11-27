CREATE DATABASE  IF NOT EXISTS `optisync2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `optisync2`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: optisync2
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `assembly`
--

DROP TABLE IF EXISTS `assembly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assembly` (
  `assembly_entry_no` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT (curdate()),
  `order_id` int NOT NULL,
  `part_id` int NOT NULL,
  `received_part_qty` int NOT NULL,
  `targeted_value` int NOT NULL,
  `achieve` int NOT NULL,
  `current_qty` int DEFAULT NULL,
  `assembler_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`assembly_entry_no`),
  KEY `a1_idx` (`order_id`),
  KEY `a2_idx` (`part_id`),
  CONSTRAINT `a1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `a2` FOREIGN KEY (`part_id`) REFERENCES `parts` (`part_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assembly`
--

LOCK TABLES `assembly` WRITE;
/*!40000 ALTER TABLE `assembly` DISABLE KEYS */;
/*!40000 ALTER TABLE `assembly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `client_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Ashok Leyland'),(2,'Hero Honda Motors'),(3,'Bajaj Auto'),(4,'Maruti Suzuki Limited'),(5,'Godrej Group');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `company_id` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) NOT NULL,
  `person_name` varchar(255) NOT NULL,
  `contact_no` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `registration_date` datetime(6) DEFAULT (curdate()),
  `plan_id` int NOT NULL,
  `payment_status` bit(1) DEFAULT b'0',
  `plan_startdate` datetime(6) DEFAULT NULL,
  `plan_enddate` datetime(6) DEFAULT NULL,
  `admin_approval` bit(1) NOT NULL DEFAULT b'0',
  `mode_of_transaction` varchar(255) DEFAULT 'online',
  PRIMARY KEY (`company_id`),
  KEY `c1_idx` (`plan_id`),
  CONSTRAINT `co1` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Optisync Pvt Ltd.','Shirish Gaikwad','8793467456','rajeshirish123@gmail.com','2023-08-18 00:00:00.000000',1,_binary '','2023-08-18 00:00:00.000000',NULL,_binary '','online'),(2,'Samarth Manufacturings','Sushil Chaudhari','8830889788','chaudharisushil1379@gmail.com','2023-08-31 05:30:00.000000',1,_binary '','2023-08-31 00:00:00.000000','2024-05-27 00:00:00.000000',_binary '','online'),(3,'Punjab steels and co. ','Jasbeer Singh','7894625615','punjabsteels@gmail.com','2023-08-31 05:30:00.000000',2,_binary '',NULL,NULL,_binary '\0','online');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cpm`
--

DROP TABLE IF EXISTS `cpm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cpm` (
  `cpm_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `product_id` int NOT NULL,
  `part_id` int NOT NULL,
  `store_ct` decimal(7,4) NOT NULL,
  `production_ct` decimal(7,4) NOT NULL,
  `vendor_ct` decimal(7,4) NOT NULL,
  `assembly_ct` decimal(7,4) NOT NULL,
  `dispatch_ct` decimal(7,4) NOT NULL,
  PRIMARY KEY (`cpm_id`),
  KEY `c_idx` (`company_id`),
  KEY `c1_idx` (`product_id`),
  KEY `c2_idx` (`part_id`),
  CONSTRAINT `c` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  CONSTRAINT `c1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `c2` FOREIGN KEY (`part_id`) REFERENCES `parts` (`part_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpm`
--

LOCK TABLES `cpm` WRITE;
/*!40000 ALTER TABLE `cpm` DISABLE KEYS */;
INSERT INTO `cpm` VALUES (1,2,1,1,1.0000,2.0000,1.0000,1.0000,1.0000),(2,2,1,2,1.0000,0.0000,1.0000,0.0000,0.0000),(3,2,1,3,0.0000,2.0000,2.0000,1.0000,1.0000),(4,2,1,4,1.0000,0.0000,1.0000,1.0000,1.0000),(5,2,1,5,0.0000,2.0000,2.0000,1.0000,1.0000),(6,2,1,6,1.0000,2.0000,1.0000,1.0000,1.0000);
/*!40000 ALTER TABLE `cpm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispatch`
--

DROP TABLE IF EXISTS `dispatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dispatch` (
  `dispatch_entry_no` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `received_product_qty` int DEFAULT NULL,
  `tageted_value` int DEFAULT NULL,
  `achieved` int DEFAULT NULL,
  `dispatcher_name` varchar(45) DEFAULT NULL,
  `dispatch_status` int DEFAULT NULL,
  PRIMARY KEY (`dispatch_entry_no`),
  KEY `d_idx` (`order_id`),
  KEY `d1_idx` (`product_id`),
  CONSTRAINT `d` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `d1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispatch`
--

LOCK TABLES `dispatch` WRITE;
/*!40000 ALTER TABLE `dispatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `dispatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forward`
--

DROP TABLE IF EXISTS `forward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forward` (
  `forward_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`forward_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forward`
--

LOCK TABLES `forward` WRITE;
/*!40000 ALTER TABLE `forward` DISABLE KEYS */;
INSERT INTO `forward` VALUES (1,'Production'),(2,'Assembly'),(3,'vendor'),(4,'Dispatch');
/*!40000 ALTER TABLE `forward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `login_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `company_id` int NOT NULL,
  `role_id` int NOT NULL,
  `forgetpass_status` bit(1) DEFAULT b'0',
  `setup_status` bit(1) DEFAULT b'0',
  PRIMARY KEY (`login_id`),
  KEY `l1_idx` (`company_id`),
  KEY `l2_idx` (`role_id`),
  CONSTRAINT `l1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  CONSTRAINT `l2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'Shirish.admin','Shirish@admin',1,1,_binary '\0',_binary '\0'),(2,'Samart.store','Samart@store',2,3,_binary '',_binary ''),(3,'Samart.manager','Samart@manager',2,2,_binary '\0',_binary '\0'),(4,'Samart.production','Samart@production',2,4,_binary '\0',_binary '\0'),(5,'Samart.assembly','Samart@assembly',2,5,_binary '\0',_binary '\0'),(6,'Samart.dispatch','Samart@dispatch',2,6,_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machines`
--

DROP TABLE IF EXISTS `machines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `machines` (
  `machine_id` int NOT NULL AUTO_INCREMENT,
  `machine_name` varchar(255) DEFAULT NULL,
  `machine_description` varchar(255) DEFAULT NULL,
  `company_id` int NOT NULL,
  PRIMARY KEY (`machine_id`),
  KEY `m1_idx` (`company_id`),
  CONSTRAINT `m1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machines`
--

LOCK TABLES `machines` WRITE;
/*!40000 ALTER TABLE `machines` DISABLE KEYS */;
INSERT INTO `machines` VALUES (1,'VMC','vmc machine',5),(2,'Grinding','frinding machine',5),(3,'drill machine','Industial drill machine',5),(4,'Hand Polishimg','Hand poslishing machine',5),(5,'ScrewDriver','to fit screws',5),(6,'Top Drill machine','Drilling machine',5),(7,'Lathe Machine','lathe machine to perform different Operation',5),(9,'Lathe machine','Lathe Machine',18);
/*!40000 ALTER TABLE `machines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_vendor`
--

DROP TABLE IF EXISTS `master_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_vendor` (
  `master_vendor_id` int NOT NULL AUTO_INCREMENT,
  `master_vendor_name` varchar(255) DEFAULT NULL,
  `master_vendor_part_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`master_vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_vendor`
--

LOCK TABLES `master_vendor` WRITE;
/*!40000 ALTER TABLE `master_vendor` DISABLE KEYS */;
INSERT INTO `master_vendor` VALUES (1,'SS Nuts and bolt Co','Bolts'),(2,'SS nuts and bolt Co','Nuts');
/*!40000 ALTER TABLE `master_vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `company_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_qty` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `dispatch_qty` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`),
  KEY `o1_idx` (`company_id`),
  KEY `o2_idx` (`client_id`),
  KEY `o3_idx` (`product_id`),
  CONSTRAINT `o1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  CONSTRAINT `o2` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  CONSTRAINT `o3` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parts`
--

DROP TABLE IF EXISTS `parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parts` (
  `part_id` int NOT NULL AUTO_INCREMENT,
  `part_name` varchar(255) DEFAULT NULL,
  `part_description` varchar(255) DEFAULT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`part_id`),
  KEY `p1_idx` (`product_id`),
  CONSTRAINT `p1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parts`
--

LOCK TABLES `parts` WRITE;
/*!40000 ALTER TABLE `parts` DISABLE KEYS */;
INSERT INTO `parts` VALUES (1,'Driving Shaft','Shat which is joined to the hub and flang',1),(2,'Nuts','M12 nylon lock nuts',1),(3,'Hub','Block of Mild Steel which coupled with flange',1),(4,'Bolts','M12 x 3mm pitch bolts',1),(5,'Flange','Block of mild steel which is coupled with hub',1),(6,'Key','4130 mild steel for locking of flang and hub',1);
/*!40000 ALTER TABLE `parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plans` (
  `plan_id` int NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(255) DEFAULT NULL,
  `user_no` int NOT NULL,
  `duration` int NOT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans`
--

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
INSERT INTO `plans` VALUES (1,'Gold',5,270,5000),(2,'Silver',5,180,4000),(3,'Bronze',5,90,3000);
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) DEFAULT NULL,
  `product_description` varchar(255) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `pr1_idx` (`company_id`),
  CONSTRAINT `pr1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Universal Coupling','An universal Flang Coupling',2);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production`
--

DROP TABLE IF EXISTS `production`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `production` (
  `entry_no` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `raw_material_id` int NOT NULL,
  `received_qty` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `target_value` int DEFAULT NULL,
  `achieve` int DEFAULT NULL,
  `current_qty` int DEFAULT NULL,
  `operator_name` varchar(200) DEFAULT NULL,
  `machine_id` int DEFAULT NULL,
  PRIMARY KEY (`entry_no`),
  KEY `p1_idx` (`order_id`),
  KEY `p2_idx` (`raw_material_id`),
  KEY `p3_idx` (`machine_id`),
  CONSTRAINT `pd1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `pd2` FOREIGN KEY (`raw_material_id`) REFERENCES `raw_materials` (`raw_material_id`),
  CONSTRAINT `pd3` FOREIGN KEY (`machine_id`) REFERENCES `machines` (`machine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production`
--

LOCK TABLES `production` WRITE;
/*!40000 ALTER TABLE `production` DISABLE KEYS */;
/*!40000 ALTER TABLE `production` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raw_materials`
--

DROP TABLE IF EXISTS `raw_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raw_materials` (
  `raw_material_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `part_id` int NOT NULL,
  PRIMARY KEY (`raw_material_id`),
  KEY `raw1_idx` (`part_id`),
  CONSTRAINT `raw1` FOREIGN KEY (`part_id`) REFERENCES `parts` (`part_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raw_materials`
--

LOCK TABLES `raw_materials` WRITE;
/*!40000 ALTER TABLE `raw_materials` DISABLE KEYS */;
INSERT INTO `raw_materials` VALUES (1,'Shaft','Mild Steel 1210 graded 50 mm shaft',1),(2,'Hub','Casted mild steel block with 1060 grade',3),(3,'flange','Casted mild steel block with 1060 grading',5),(4,'key','30mmx40m 1030 steel block',6);
/*!40000 ALTER TABLE `raw_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin'),(2,'Manager'),(3,'Store'),(4,'Production'),(5,'Assembly'),(6,'Dispatch'),(7,'vendor');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `stock_entry_no` int NOT NULL AUTO_INCREMENT,
  `stock_date` datetime(6) DEFAULT NULL,
  `raw_material_id` int DEFAULT NULL,
  `raw_material_qty` int DEFAULT NULL,
  `final_raw_material_qty` int DEFAULT NULL,
  `part_id` int DEFAULT NULL,
  `part_qty` int DEFAULT NULL,
  `final_part_qty` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  PRIMARY KEY (`stock_entry_no`),
  KEY `s1_idx` (`company_id`),
  KEY `s2_idx` (`raw_material_id`),
  KEY `s3_idx` (`part_id`),
  CONSTRAINT `s1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  CONSTRAINT `s2` FOREIGN KEY (`raw_material_id`) REFERENCES `raw_materials` (`raw_material_id`),
  CONSTRAINT `s3` FOREIGN KEY (`part_id`) REFERENCES `parts` (`part_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stores` (
  `store_entry_no` int NOT NULL AUTO_INCREMENT,
  `store_date` date DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `raw_material_id` int DEFAULT NULL,
  `raw_material_qty` int DEFAULT NULL,
  `forward_id` int DEFAULT NULL,
  `part_id` int DEFAULT NULL,
  `part_qty` int DEFAULT NULL,
  PRIMARY KEY (`store_entry_no`),
  KEY `st_idx` (`order_id`),
  KEY `st1_idx` (`raw_material_id`),
  KEY `st2_idx` (`part_id`),
  KEY `st3_idx` (`forward_id`),
  CONSTRAINT `st` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `st1` FOREIGN KEY (`raw_material_id`) REFERENCES `raw_materials` (`raw_material_id`),
  CONSTRAINT `st2` FOREIGN KEY (`part_id`) REFERENCES `parts` (`part_id`),
  CONSTRAINT `st3` FOREIGN KEY (`forward_id`) REFERENCES `forward` (`forward_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendormap`
--

DROP TABLE IF EXISTS `vendormap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendormap` (
  `vendor_id` int NOT NULL,
  `company_id` int NOT NULL,
  `vendormap_id` int NOT NULL AUTO_INCREMENT,
  `part_id` int NOT NULL,
  PRIMARY KEY (`vendormap_id`),
  KEY `v2_idx` (`company_id`),
  KEY `v1` (`vendor_id`),
  CONSTRAINT `v1` FOREIGN KEY (`vendor_id`) REFERENCES `master_vendor` (`master_vendor_id`),
  CONSTRAINT `v2` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendormap`
--

LOCK TABLES `vendormap` WRITE;
/*!40000 ALTER TABLE `vendormap` DISABLE KEYS */;
INSERT INTO `vendormap` VALUES (2,2,1,2),(1,2,2,4);
/*!40000 ALTER TABLE `vendormap` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-01 14:06:33
