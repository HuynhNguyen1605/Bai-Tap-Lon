-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: quanlydatvexe
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `avatar` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `gender` tinyint DEFAULT NULL,
  `user_role` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (3,'nguyennhatsang','$2a$10$u1R4bHA.ft6tKIVRj37mJO6BESXfXAnvaikL6yyQ9emhJ1NgHNmEa',NULL,'sangnguyen32423@gmail.com','0324634455','Nguyễn Nhật Sang','Biên Hoà, Đồng Nai',0,'driver'),(4,'nguyentien','$2a$12$sMk0qzYrdTmWWSUPU.hWAOa0s9bEkfhhLm/gRO7SR7YO.3EkSAtaC','https://res.cloudinary.com/huynhnguyen/image/upload/v1660804377/vhscya9cdjkti72mm8o1.jpg','nguyentien2020@gmail.com','3453453555','Nguyễn Tiến','Sài Gòn',1,'customer'),(5,'vothanhlen','$2a$12$DuSncR1Rup.t/A4UmutubOX/xV0RU9ORKBkOVlPdTCf25isSotjXu','https://res.cloudinary.com/huynhnguyen/image/upload/v1660896682/IMG_3171_kpzygb.jpg','lenvothanh123@gmail.com','1234567809','Võ Thành Lên','Nhà Bè, TP HCM',0,'driver'),(9,'phucbeou','$2a$10$g0Hy2gpGaEKmkkekRCQ7Juz/2INsmdKU964TIPToLzJd9L9xJQgTu','https://res.cloudinary.com/huynhnguyen/image/upload/v1660898054/dqcmueynzeuuhj47y15p.jpg','phucbeo@gmail.com','0348547836','Nguyễn Hữu Phúc','Tân Phú, TP HCM',0,'customer'),(11,'huuphuc','$2a$10$vG.SYMvDbtJI1gQwYK2lZufxg5A8Jf9B7r652rs8tMlSRhfR580Ri','https://res.cloudinary.com/huynhnguyen/image/upload/v1661413393/segjneez8thqknrcrpmv.jpg','phucbeou@gmai.com','452433242','huu phuc','tan phu',1,'customer'),(24,'huynhnguyen','$2a$12$O81GWM/qTMB2m5hQk9K9BeBS1Qhqj.E4YYWtnmIMV6YQCZbmPl6t2','https://res.cloudinary.com/huynhnguyen/image/upload/v1662268900/buz4qobzmoah4m2qec6d.jpg','nguyenyl1605@gmail.com','0385626803','Huỳnh Nguyễn','daklak',0,'admin'),(39,'tai','$2a$10$Pg0JuoMimGkocsPYWrSUI..ke6kYL4yUGCRFStBYsqMAhNLPRvSA2',NULL,'nhatsang57@gmail.com','0921288154','NGUYỄN NHẬT SANG','dsada',0,'driver'),(40,'nnhatsang','$2a$10$5ZdHDB.nq.BvEgfurpNDZ.U4U2t8YDpx3wUIlj1dDTV1RWJS3.Q7W',NULL,'buihuuloc9411@gmail.com','0921288155','Nhật Sang','dsada',0,'customer');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach_line`
--

DROP TABLE IF EXISTS `coach_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coach_line` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `price` decimal(18,0) DEFAULT NULL,
  `departure_date` datetime DEFAULT NULL,
  `arrival_date` datetime DEFAULT NULL,
  `remaining_seats` int DEFAULT NULL,
  `coachway_id` int NOT NULL,
  `driver_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_coach_coachway_idx` (`coachway_id`),
  KEY `fk_coach_driver_idx` (`driver_id`),
  CONSTRAINT `fk_coach_coachway` FOREIGN KEY (`coachway_id`) REFERENCES `coach_way` (`id`),
  CONSTRAINT `fk_coach_driver` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach_line`
--

LOCK TABLES `coach_line` WRITE;
/*!40000 ALTER TABLE `coach_line` DISABLE KEYS */;
INSERT INTO `coach_line` VALUES (1,'Sài Gòn - Đà Nẵng',500000,'2022-05-23 10:20:00','2022-05-24 12:30:00',50,1,1),(2,'Sài Gòn - Nha Trang',231000,'2022-03-12 09:30:00','2022-03-13 07:00:00',50,2,1),(3,'Sài Gòn - Đà Lạt',150000,'2022-09-20 19:00:00','2022-09-21 06:00:00',49,3,5),(4,'Sài Gòn - Cà Mau',300000,'2022-10-13 06:00:00','2022-10-12 17:00:00',50,5,1),(10,'Sài Gòn - Phan Thiết',200000,'2021-08-12 00:00:00','2020-12-12 00:00:00',48,1,1),(14,'Sài Gòn - ĐakLak',350000,'2022-09-20 00:30:00','2022-09-21 00:30:00',50,7,5),(19,'Sài Gòn - Đà Nẵng',530000,'2022-09-20 12:30:00','2022-09-22 13:30:00',50,1,1);
/*!40000 ALTER TABLE `coach_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach_way`
--

DROP TABLE IF EXISTS `coach_way`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coach_way` (
  `id` int NOT NULL AUTO_INCREMENT,
  `departure_point` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `destination_point` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach_way`
--

LOCK TABLES `coach_way` WRITE;
/*!40000 ALTER TABLE `coach_way` DISABLE KEYS */;
INSERT INTO `coach_way` VALUES (1,'Sài Gòn','Đà Nẵng'),(2,'Sài gòn','Nha Trang'),(3,'Sài Gòn','Đà Lạt'),(4,'Sài Gòn','Phan Thiết'),(5,'Sài Gòn','Cà Mau'),(6,'Biên Hoà','Cần Thơ'),(7,'Biên Hoà','ĐakLak'),(13,'Cà Mau','Khánh hoà');
/*!40000 ALTER TABLE `coach_way` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `coachline_id` int NOT NULL,
  `content` varchar(300) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_content_coachline_idx` (`coachline_id`),
  KEY `fk_content_account_idx` (`account_id`),
  CONSTRAINT `fk_content_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_content_coachline` FOREIGN KEY (`coachline_id`) REFERENCES `coach_line` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,9,1,'OK nha','2022-08-22 11:33:00');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `cmnd` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_account_idx` (`account_id`),
  CONSTRAINT `fk_customer_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,4,'123456789'),(3,11,'435346356'),(10,9,'123456789'),(17,40,NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (2,'Chăm sóc khách hàng'),(3,'Vệ sinh');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_driver_account_idx` (`account_id`),
  CONSTRAINT `fk_driver_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (1,3),(5,5),(9,39);
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `department_id` int DEFAULT NULL,
  `position` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_staff_account_idx` (`account_id`),
  KEY `fk_staff_department_idx` (`department_id`),
  CONSTRAINT `fk_staff_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  CONSTRAINT `fk_staff_department` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `coach_line_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `staff_id` int DEFAULT NULL,
  `price` decimal(18,0) DEFAULT '0',
  `amount` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_ticket_coachline_idx` (`coach_line_id`),
  KEY `fk_ticket_customer_idx` (`customer_id`),
  KEY `fk_ticket_staff_idx` (`staff_id`),
  CONSTRAINT `fk_ticket_coachline` FOREIGN KEY (`coach_line_id`) REFERENCES `coach_line` (`id`),
  CONSTRAINT `fk_ticket_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_ticket_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (84,'Sài Gòn - Đà Nẵng',1,1,NULL,500000,0),(85,'Sài Gòn - Cà Mau',4,1,NULL,300000,1),(88,'Sài Gòn - Cà Mau',4,1,NULL,300000,0),(89,'Sài Gòn - Cà Mau',4,1,NULL,300000,0),(91,'Sài Gòn - Nha Trang',2,1,NULL,231000,1),(92,'Sài Gòn - Nha Trang',2,1,NULL,231000,1),(94,'Sài Gòn - Đà Nẵng',1,1,NULL,500000,0),(96,'Sài Gòn - Đà Nẵng',1,1,NULL,500000,0),(97,'Sài Gòn - Cà Mau',4,1,NULL,300000,0),(99,'Sài Gòn - Cà Mau',4,1,NULL,300000,0),(100,'Sài Gòn - Đà Lạt',3,1,NULL,150000,0),(101,'Sài Gòn - Đà Lạt',3,1,NULL,150000,0),(103,'Sài Gòn - Đà Nẵng',1,1,NULL,500000,0),(104,'Sài Gòn - Đà Nẵng',1,1,NULL,500000,0),(106,'Sài Gòn - Đà Nẵng',1,1,NULL,500000,0),(114,'Sài Gòn - Đà Nẵng',1,1,NULL,500000,0),(115,'Sài Gòn - Đà Nẵng',1,1,NULL,500000,0),(116,'Sài Gòn - Cà Mau',4,1,NULL,300000,0),(117,'Sài Gòn - Cà Mau',4,1,NULL,300000,0),(118,'Sài Gòn - Cà Mau',4,1,NULL,300000,0),(119,'Sài Gòn - Cà Mau',4,1,NULL,300000,0),(129,'Sài Gòn - Cà Mau',4,1,NULL,300000,0),(138,'Sài Gòn - Cà Mau',4,1,NULL,300000,0),(139,'Sài Gòn - Đà Lạt',3,3,NULL,150000,0),(140,'Sài Gòn - Đà Lạt',3,3,NULL,150000,0),(141,'Sài Gòn - Đà Lạt',3,3,NULL,150000,0),(142,'Sài Gòn - Đà Lạt',3,3,NULL,150000,0),(143,'Sài Gòn - Đà Lạt',3,3,NULL,150000,0),(144,'Sài Gòn - Nha Trang',2,3,NULL,231000,0),(145,'Sài Gòn - Nha Trang',2,3,NULL,231000,0),(146,'Sài Gòn - Đà Lạt',3,3,NULL,150000,0),(147,'Sài Gòn - Đà Lạt',3,3,NULL,150000,0),(148,'Sài Gòn - Đà Lạt',3,1,NULL,150000,0),(149,'Sài Gòn - Phan Thiết',10,1,NULL,200000,0),(150,'Sài Gòn - Phan Thiết',10,17,NULL,200000,0);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_detail`
--

DROP TABLE IF EXISTS `ticket_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `seat` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `active` tinyint DEFAULT NULL,
  `ticket_id` int NOT NULL,
  `vehicle_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ticket_idx` (`ticket_id`),
  KEY `fk_td_vehicle_idx` (`vehicle_id`),
  CONSTRAINT `fk_td_vehicle` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`),
  CONSTRAINT `fk_ticket` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_detail`
--

LOCK TABLES `ticket_detail` WRITE;
/*!40000 ALTER TABLE `ticket_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `car_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `active` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-07 23:19:07
