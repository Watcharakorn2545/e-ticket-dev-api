-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: eticket
-- ------------------------------------------------------
-- Server version	11.6.2-MariaDB

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
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank` (
  `bank_id` int(11) NOT NULL,
  `th_name` varchar(50) DEFAULT NULL,
  `en_name` varchar(50) DEFAULT NULL,
  `bank_code` varchar(50) DEFAULT NULL,
  `bank_abbreviation` varchar(50) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'inactive',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_brand`
--

DROP TABLE IF EXISTS `car_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_brand` (
  `car_brand_id` int(11) NOT NULL,
  `car_brand_name` varchar(50) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  PRIMARY KEY (`car_brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_brand`
--

LOCK TABLES `car_brand` WRITE;
/*!40000 ALTER TABLE `car_brand` DISABLE KEYS */;
/*!40000 ALTER TABLE `car_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_convenient`
--

DROP TABLE IF EXISTS `car_convenient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_convenient` (
  `car_convenient_id` int(11) NOT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `convenient_id` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  PRIMARY KEY (`car_convenient_id`),
  KEY `fk_car_convenient_vehicle` (`vehicle_id`),
  KEY `fk_car_convenient_convenient` (`convenient_id`),
  CONSTRAINT `fk_car_convenient_convenient` FOREIGN KEY (`convenient_id`) REFERENCES `convenient` (`convenient_id`),
  CONSTRAINT `fk_car_convenient_vehicle` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_convenient`
--

LOCK TABLES `car_convenient` WRITE;
/*!40000 ALTER TABLE `car_convenient` DISABLE KEYS */;
/*!40000 ALTER TABLE `car_convenient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_type`
--

DROP TABLE IF EXISTS `car_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_type` (
  `car_type_id` int(11) NOT NULL,
  `car_type_name` varchar(50) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  PRIMARY KEY (`car_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_type`
--

LOCK TABLES `car_type` WRITE;
/*!40000 ALTER TABLE `car_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `car_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `convenient`
--

DROP TABLE IF EXISTS `convenient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `convenient` (
  `convenient_id` int(11) NOT NULL,
  `convenient_name` varchar(50) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  PRIMARY KEY (`convenient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convenient`
--

LOCK TABLES `convenient` WRITE;
/*!40000 ALTER TABLE `convenient` DISABLE KEYS */;
/*!40000 ALTER TABLE `convenient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `district` (
  `district_id` int(11) NOT NULL,
  `province_id` int(11) DEFAULT NULL,
  `district_name` varchar(50) DEFAULT NULL,
  `district_name_en` varchar(50) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  PRIMARY KEY (`district_id`),
  KEY `fk_district_province` (`province_id`),
  CONSTRAINT `fk_district_province` FOREIGN KEY (`province_id`) REFERENCES `province` (`province_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver` (
  `driver_id` int(11) NOT NULL,
  `driver_full_name` varchar(100) DEFAULT NULL,
  `driver_tel` varchar(10) DEFAULT NULL,
  `driver_gender` varchar(10) DEFAULT NULL,
  `entrepreneur_id` varchar(50) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  PRIMARY KEY (`driver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrepreneur`
--

DROP TABLE IF EXISTS `entrepreneur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrepreneur` (
  `entrepreneur_id` uuid NOT NULL,
  `entrepreneur_one_id` varchar(50) DEFAULT NULL,
  `entrepreneur_name` varchar(50) DEFAULT NULL,
  `refresh_token` text DEFAULT NULL,
  `status` enum('inactive') DEFAULT 'inactive',
  `tel` varchar(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `subdistrict` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `score` double DEFAULT 0,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  PRIMARY KEY (`entrepreneur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrepreneur`
--

LOCK TABLES `entrepreneur` WRITE;
/*!40000 ALTER TABLE `entrepreneur` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrepreneur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrepreneur_review`
--

DROP TABLE IF EXISTS `entrepreneur_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrepreneur_review` (
  `review_id` int(11) NOT NULL,
  `reviewer_name` varchar(50) DEFAULT NULL,
  `reviewer_tel` varchar(10) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `rating` double DEFAULT 0,
  `entrepreneur_id` uuid DEFAULT NULL,
  `user_id` uuid DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `fk_review_entrepreneur` (`entrepreneur_id`),
  KEY `fk_review_user` (`user_id`),
  CONSTRAINT `fk_review_entrepreneur` FOREIGN KEY (`entrepreneur_id`) REFERENCES `entrepreneur` (`entrepreneur_id`),
  CONSTRAINT `fk_review_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrepreneur_review`
--

LOCK TABLES `entrepreneur_review` WRITE;
/*!40000 ALTER TABLE `entrepreneur_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrepreneur_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eticket`
--

DROP TABLE IF EXISTS `eticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eticket` (
  `ticket_id` int(11) NOT NULL,
  `ticket_code` varchar(10) DEFAULT NULL,
  `total_price` double DEFAULT 0,
  `seat_numbers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`seat_numbers`)),
  `seat_amount` int(11) DEFAULT 0,
  `identify_qr` text DEFAULT NULL,
  `passenger_fullname` text DEFAULT NULL,
  `passenger_tel` varchar(10) DEFAULT NULL,
  `user_id` uuid DEFAULT NULL,
  `trip_id` int(11) DEFAULT NULL,
  `payment_type_id` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `fk_eticket_trip` (`trip_id`),
  KEY `fk_eticket_payment_type` (`payment_type_id`),
  KEY `fk_eticket_user` (`user_id`),
  CONSTRAINT `fk_eticket_payment_type` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_type` (`payment_type_id`),
  CONSTRAINT `fk_eticket_trip` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`trip_id`),
  CONSTRAINT `fk_eticket_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eticket`
--

LOCK TABLES `eticket` WRITE;
/*!40000 ALTER TABLE `eticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `eticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_type`
--

DROP TABLE IF EXISTS `payment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_type` (
  `payment_type_id` int(11) NOT NULL,
  `payment_name` varchar(50) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  PRIMARY KEY (`payment_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_type`
--

LOCK TABLES `payment_type` WRITE;
/*!40000 ALTER TABLE `payment_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `province` (
  `province_id` int(11) NOT NULL,
  `province_name` varchar(50) DEFAULT NULL,
  `province_name_en` varchar(50) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  PRIMARY KEY (`province_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_by_user`
--

DROP TABLE IF EXISTS `review_by_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_by_user` (
  `review_by_user_id` int(11) NOT NULL,
  `review_object` varchar(100) DEFAULT NULL,
  `rating` double DEFAULT 0,
  `reviewer_name` varchar(50) DEFAULT NULL,
  `user_id` uuid DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  PRIMARY KEY (`review_by_user_id`),
  KEY `fk_review_ticket` (`ticket_id`),
  CONSTRAINT `fk_review_ticket` FOREIGN KEY (`ticket_id`) REFERENCES `eticket` (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_by_user`
--

LOCK TABLES `review_by_user` WRITE;
/*!40000 ALTER TABLE `review_by_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_by_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seats`
--

DROP TABLE IF EXISTS `seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seats` (
  `seat_id` int(11) NOT NULL,
  `seats` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`seats`)),
  `total` int(11) DEFAULT 0,
  `remain` int(11) DEFAULT 0,
  `booked` int(11) DEFAULT 0,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  PRIMARY KEY (`seat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seats`
--

LOCK TABLES `seats` WRITE;
/*!40000 ALTER TABLE `seats` DISABLE KEYS */;
/*!40000 ALTER TABLE `seats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `station` (
  `station_id` int(11) NOT NULL,
  `station_name` varchar(50) DEFAULT NULL,
  `station_code` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `subdistrict` int(11) DEFAULT NULL,
  `district` int(11) DEFAULT NULL,
  `province` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  PRIMARY KEY (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_district`
--

DROP TABLE IF EXISTS `sub_district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_district` (
  `subdistrict_id` int(11) NOT NULL,
  `district_id` int(11) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `sub_district_name_en` varchar(50) DEFAULT NULL,
  `district_name` varchar(50) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  PRIMARY KEY (`subdistrict_id`),
  KEY `fk_sub_district_district` (`district_id`),
  KEY `fk_sub_district_province` (`province_id`),
  CONSTRAINT `fk_sub_district_district` FOREIGN KEY (`district_id`) REFERENCES `district` (`district_id`),
  CONSTRAINT `fk_sub_district_province` FOREIGN KEY (`province_id`) REFERENCES `province` (`province_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_district`
--

LOCK TABLES `sub_district` WRITE;
/*!40000 ALTER TABLE `sub_district` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trips`
--

DROP TABLE IF EXISTS `trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trips` (
  `trip_id` int(11) NOT NULL,
  `trip_name` varchar(50) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `origin_location` int(11) DEFAULT NULL,
  `destination_location` int(11) DEFAULT NULL,
  `start_date_time` date DEFAULT NULL,
  `finish_date_time` date DEFAULT NULL,
  `entrepreneur_id` uuid DEFAULT NULL,
  `trip_type` enum('one_way','round_trip') DEFAULT 'one_way',
  `price` double DEFAULT 0,
  `vehicle_id` int(11) DEFAULT NULL,
  `trip_status_id` int(11) DEFAULT NULL,
  `seat_id` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  PRIMARY KEY (`trip_id`),
  KEY `fk_trips_driver` (`driver_id`),
  KEY `fk_trips_origin` (`origin_location`),
  KEY `fk_trips_destination` (`destination_location`),
  KEY `fk_trips_vehicle` (`vehicle_id`),
  KEY `fk_trips_status` (`trip_status_id`),
  KEY `fk_trips_seat` (`seat_id`),
  KEY `fk_trips_entrepreneur` (`entrepreneur_id`),
  CONSTRAINT `fk_trips_destination` FOREIGN KEY (`destination_location`) REFERENCES `station` (`station_id`),
  CONSTRAINT `fk_trips_driver` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driver_id`),
  CONSTRAINT `fk_trips_entrepreneur` FOREIGN KEY (`entrepreneur_id`) REFERENCES `entrepreneur` (`entrepreneur_id`),
  CONSTRAINT `fk_trips_origin` FOREIGN KEY (`origin_location`) REFERENCES `station` (`station_id`),
  CONSTRAINT `fk_trips_seat` FOREIGN KEY (`seat_id`) REFERENCES `seats` (`seat_id`),
  CONSTRAINT `fk_trips_status` FOREIGN KEY (`trip_status_id`) REFERENCES `trips_status` (`trip_status_id`),
  CONSTRAINT `fk_trips_vehicle` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trips`
--

LOCK TABLES `trips` WRITE;
/*!40000 ALTER TABLE `trips` DISABLE KEYS */;
/*!40000 ALTER TABLE `trips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trips_bill_report`
--

DROP TABLE IF EXISTS `trips_bill_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trips_bill_report` (
  `trip_bill_id` int(11) NOT NULL,
  `trip_bill_code` varchar(50) DEFAULT NULL,
  `total_price` double DEFAULT 0,
  `service_charge` double DEFAULT 0,
  `total_net_price` double DEFAULT 0,
  `passenger_amount` int(11) DEFAULT 0,
  `trip_id` int(11) DEFAULT NULL,
  `entrepreneur_id` uuid DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  PRIMARY KEY (`trip_bill_id`),
  KEY `fk_trip_bill_trip` (`trip_id`),
  KEY `fk_trip_bill_entrepreneur` (`entrepreneur_id`),
  CONSTRAINT `fk_trip_bill_entrepreneur` FOREIGN KEY (`entrepreneur_id`) REFERENCES `entrepreneur` (`entrepreneur_id`),
  CONSTRAINT `fk_trip_bill_trip` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`trip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trips_bill_report`
--

LOCK TABLES `trips_bill_report` WRITE;
/*!40000 ALTER TABLE `trips_bill_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `trips_bill_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trips_status`
--

DROP TABLE IF EXISTS `trips_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trips_status` (
  `trip_status_id` int(11) NOT NULL,
  `status_name` varchar(50) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  PRIMARY KEY (`trip_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trips_status`
--

LOCK TABLES `trips_status` WRITE;
/*!40000 ALTER TABLE `trips_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `trips_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` uuid NOT NULL,
  `user_one_id` varchar(50) DEFAULT NULL,
  `user_prefix` varchar(10) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `tel` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `refresh_token` text DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_bill_log`
--

DROP TABLE IF EXISTS `user_bill_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_bill_log` (
  `user_bill_log_id` int(11) NOT NULL,
  `user_id` uuid DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `total_price` double DEFAULT 0,
  `user_bill_code` varchar(100) DEFAULT NULL,
  `user_fullname` varchar(100) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  PRIMARY KEY (`user_bill_log_id`),
  KEY `fk_user_bill_ticket` (`ticket_id`),
  KEY `fk_user_bill_user` (`user_id`),
  CONSTRAINT `fk_user_bill_ticket` FOREIGN KEY (`ticket_id`) REFERENCES `eticket` (`ticket_id`),
  CONSTRAINT `fk_user_bill_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_bill_log`
--

LOCK TABLES `user_bill_log` WRITE;
/*!40000 ALTER TABLE `user_bill_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_bill_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `vehicle_id` int(11) NOT NULL,
  `vehicle_code` varchar(50) DEFAULT NULL,
  `car_type_id` int(11) DEFAULT NULL,
  `seat_amount` int(11) DEFAULT 0,
  `car_brand_id` int(11) DEFAULT NULL,
  `vehicle_status` enum('active','inactive') DEFAULT 'inactive',
  `remark` text DEFAULT NULL,
  `entrepreneur_id` uuid DEFAULT NULL,
  `registration_number` varchar(50) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  PRIMARY KEY (`vehicle_id`),
  KEY `fk_vehicle_car_type` (`car_type_id`),
  KEY `fk_vehicle_car_brand` (`car_brand_id`),
  KEY `fk_vehicle_entrepreneur` (`entrepreneur_id`),
  CONSTRAINT `fk_vehicle_car_brand` FOREIGN KEY (`car_brand_id`) REFERENCES `car_brand` (`car_brand_id`),
  CONSTRAINT `fk_vehicle_car_type` FOREIGN KEY (`car_type_id`) REFERENCES `car_type` (`car_type_id`),
  CONSTRAINT `fk_vehicle_entrepreneur` FOREIGN KEY (`entrepreneur_id`) REFERENCES `entrepreneur` (`entrepreneur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'eticket'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-17 17:10:39
