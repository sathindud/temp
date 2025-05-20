-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: trustmark
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `business`
--

DROP TABLE IF EXISTS `business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `sub_category` varchar(20) DEFAULT NULL,
  `website` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `verified_at` date DEFAULT NULL,
  `verification_status` set('PENDING','APPROVE','REJECT') DEFAULT NULL,
  `subscription_tier` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fkuser` (`user_id`),
  CONSTRAINT `fkuser` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business`
--

LOCK TABLES `business` WRITE;
/*!40000 ALTER TABLE `business` DISABLE KEYS */;
INSERT INTO `business` VALUES (1,5,'Tech Haven','A modern electronics store specializing in smart gadgets.',NULL,'www.techhaven.com','+1-234-567-8901','contact@techhaven.com',NULL,NULL,NULL,NULL,'2025-05-01 16:20:47','2025-05-01 16:20:47'),(2,6,'Green Eats','Organic restaurant offering healthy meal options.',NULL,'www.greeneats.com','+1-987-654-3210','info@greeneats.com',NULL,NULL,NULL,NULL,'2025-05-01 16:20:47','2025-05-01 16:20:47'),(3,7,'FitPro Gym','A high-end gym with personal training and nutrition guidance.',NULL,'www.fitprogym.com','+1-555-123-4567','support@fitprogym.com',NULL,NULL,NULL,NULL,'2025-05-01 16:20:47','2025-05-01 16:20:47'),(4,8,'CodeCrafters','Software development company specializing in AI and cloud solutions.',NULL,'www.codecrafters.io','+1-777-888-9999','hello@codecrafters.io',NULL,NULL,NULL,NULL,'2025-05-01 16:20:47','2025-05-01 16:20:47'),(5,9,'Bloom Florist','Local flower shop providing fresh floral arrangements and delivery.',NULL,'www.bloomflorist.com','+1-444-222-3333','orders@bloomflorist.com',NULL,NULL,NULL,NULL,'2025-05-01 16:20:47','2025-05-01 16:20:47');
/*!40000 ALTER TABLE `business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_has_categories`
--

DROP TABLE IF EXISTS `business_has_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_has_categories` (
  `business_id` int NOT NULL,
  `categories_id` int NOT NULL,
  PRIMARY KEY (`business_id`,`categories_id`),
  KEY `fk_business_has_categories_categories1` (`categories_id`),
  CONSTRAINT `fk_business_has_categories_business1` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_business_has_categories_categories1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_has_categories`
--

LOCK TABLES `business_has_categories` WRITE;
/*!40000 ALTER TABLE `business_has_categories` DISABLE KEYS */;
INSERT INTO `business_has_categories` VALUES (2,1),(1,2),(3,2),(1,3),(3,4);
/*!40000 ALTER TABLE `business_has_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_photo`
--

DROP TABLE IF EXISTS `business_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_photo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `business_id` int NOT NULL,
  `url` varchar(20) NOT NULL,
  `caption` varchar(20) DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `display_order` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkphoto` (`business_id`),
  CONSTRAINT `fkphoto` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_photo`
--

LOCK TABLES `business_photo` WRITE;
/*!40000 ALTER TABLE `business_photo` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_response`
--

DROP TABLE IF EXISTS `business_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_response` (
  `id` int NOT NULL AUTO_INCREMENT,
  `review_id` int NOT NULL,
  `business_id` int NOT NULL,
  `content` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fkreview` (`review_id`),
  KEY `fkbusiness_response` (`business_id`),
  CONSTRAINT `fkbusiness_response` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fkreview` FOREIGN KEY (`review_id`) REFERENCES `review` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_response`
--

LOCK TABLES `business_response` WRITE;
/*!40000 ALTER TABLE `business_response` DISABLE KEYS */;
INSERT INTO `business_response` VALUES (9,1,1,'Thank you sir for your response','2025-05-01 16:21:29','2025-05-01 16:21:29'),(10,2,1,'Thank you sir','2025-05-01 16:21:29','2025-05-01 16:21:29'),(11,5,2,'Thank you sir ','2025-05-01 16:21:29','2025-05-01 16:21:29');
/*!40000 ALTER TABLE `business_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `types` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Grossery'),(2,'Food'),(3,'Technology'),(4,'Bank'),(5,'Resturent');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `business_id` int NOT NULL,
  `address_line_1` varchar(30) NOT NULL,
  `address_line_2` varchar(30) NOT NULL,
  `city` varchar(20) NOT NULL,
  `discrict` varchar(20) NOT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `latitude` decimal(9,6) DEFAULT NULL,
  `longitutde` decimal(9,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fklocation` (`business_id`),
  CONSTRAINT `fklocation` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `business_id` int NOT NULL,
  `rating` int NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_verified_purches` set('yes','no','pending') NOT NULL,
  `helpful_count` int DEFAULT '0',
  `unhelpful_count` int DEFAULT '0',
  `is_flagged` tinyint(1) DEFAULT '0',
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkuser_review` (`user_id`),
  KEY `fkbusiness` (`business_id`),
  CONSTRAINT `fkbusiness` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fkuser_review` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,1,1,5,'Excellent Service!','Amazing experience, highly recommend this place.','2025-05-01 16:20:47','2025-05-01 16:20:47','yes',0,0,0,NULL),(2,1,1,5,'Great Quality','The product quality is really good, but shipping was slow.','2025-05-01 16:20:47','2025-05-01 16:20:47','yes',0,0,0,NULL),(5,3,1,3,'Average Experience','Decent service but could improve customer support.','2025-05-01 16:20:47','2025-05-01 16:20:47','no',0,0,0,NULL),(19,2,1,5,'Highly Satisfied','Loved the experience! Will definitely return.','2025-05-01 16:20:47','2025-05-01 16:20:47','yes',0,0,0,NULL),(20,4,2,2,'Not Impressed','Expected better service for the price paid.','2025-05-01 16:20:47','2025-05-01 16:20:47','no',0,0,0,NULL),(21,3,2,4,'Good Value','Fair pricing and good service, but room for improvement.','2025-05-01 16:20:47','2025-05-01 16:20:47','yes',0,0,0,NULL),(22,1,3,1,'Disappointed','Product was not as described, very dissatisfied.','2025-05-01 16:20:47','2025-05-01 16:20:47','pending',0,0,0,NULL),(23,4,3,5,'Fantastic!','Everything was perfect, exceeded my expectations!','2025-05-01 16:20:47','2025-05-01 16:20:47','yes',0,0,0,NULL),(24,3,3,5,'Excellent Service!','Amazing experience, highly recommend this place.','2025-05-01 16:20:47','2025-05-01 16:20:47','yes',0,0,0,NULL),(25,4,4,5,'Great Quality','The product quality is really good, but shipping was slow.','2025-05-01 16:20:47','2025-05-01 16:20:47','yes',0,0,0,NULL),(26,3,4,3,'Average Experience','Decent service but could improve customer support.','2025-05-01 16:20:47','2025-05-01 16:20:47','no',0,0,0,NULL),(27,2,4,5,'Highly Satisfied','Loved the experience! Will definitely return.','2025-05-01 16:20:47','2025-05-01 16:20:47','yes',0,0,0,NULL),(28,4,5,2,'Not Impressed','Expected better service for the price paid.','2025-05-01 16:20:47','2025-05-01 16:20:47','no',0,0,0,NULL),(29,3,5,4,'Good Value','Fair pricing and good service, but room for improvement.','2025-05-01 16:20:47','2025-05-01 16:20:47','yes',0,0,0,NULL),(30,1,5,1,'Disappointed','Product was not as described, very dissatisfied.','2025-05-01 16:20:47','2025-05-01 16:20:47','pending',0,0,0,NULL);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  `password_hash` varchar(64) NOT NULL,
  `full_name` varchar(20) NOT NULL,
  `profile_image` varchar(20) DEFAULT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `verification_status` varchar(10) DEFAULT NULL,
  `role` set('USER','ADMIN','BUSINESS') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'root@gmail.com','$2a$10$EshKNIW326nsP3e2pvtI/..3rmSzfgjmpR/LeCyfctZKMn.nkaOx2','admin',NULL,'2025-05-01 16:20:47','2025-05-17 04:43:52',NULL,'ADMIN'),(2,'sathindu.d.zoysa@gmail.com','$2a$10$EshKNIW326nsP3e2pvtI/..3rmSzfgjmpR/LeCyfctZKMn.nkaOx2','sathindu dhanushka',NULL,'2025-05-01 16:20:47','2025-05-17 04:43:52',NULL,'USER'),(3,'manji@gmail.com','$2a$10$EshKNIW326nsP3e2pvtI/..3rmSzfgjmpR/LeCyfctZKMn.nkaOx2','Manji',NULL,'2025-05-01 16:20:47','2025-05-17 04:43:52',NULL,'USER'),(4,'hithush@gmail.com','$2a$10$EshKNIW326nsP3e2pvtI/..3rmSzfgjmpR/LeCyfctZKMn.nkaOx2','Hithush',NULL,'2025-05-01 16:20:47','2025-05-17 04:43:52',NULL,'USER'),(5,'dinush@gmail.com','$2a$10$EshKNIW326nsP3e2pvtI/..3rmSzfgjmpR/LeCyfctZKMn.nkaOx2','dinushka',NULL,'2025-05-01 16:20:47','2025-05-17 04:43:52',NULL,'USER'),(6,'tech@gmail.com','$2a$10$EshKNIW326nsP3e2pvtI/..3rmSzfgjmpR/LeCyfctZKMn.nkaOx2','abc cdf',NULL,'2025-05-01 16:20:47','2025-05-17 04:43:52',NULL,'BUSINESS'),(7,'green@gmail.com','$2a$10$EshKNIW326nsP3e2pvtI/..3rmSzfgjmpR/LeCyfctZKMn.nkaOx2','abc cdf',NULL,'2025-05-01 16:20:47','2025-05-17 04:43:52',NULL,'BUSINESS'),(8,'fitpro@gmail.com','$2a$10$EshKNIW326nsP3e2pvtI/..3rmSzfgjmpR/LeCyfctZKMn.nkaOx2','abc cdf',NULL,'2025-05-01 16:20:47','2025-05-17 04:43:52',NULL,'BUSINESS'),(9,'code@gmail.com','$2a$10$EshKNIW326nsP3e2pvtI/..3rmSzfgjmpR/LeCyfctZKMn.nkaOx2','abc cdf',NULL,'2025-05-01 16:20:47','2025-05-17 04:43:52',NULL,'BUSINESS'),(10,'bloom@gmail.com','$2a$10$EshKNIW326nsP3e2pvtI/..3rmSzfgjmpR/LeCyfctZKMn.nkaOx2','abc cdf',NULL,'2025-05-01 16:20:47','2025-05-17 04:43:52',NULL,'BUSINESS'),(11,'sathindu@gmail.com','$2a$10$EshKNIW326nsP3e2pvtI/..3rmSzfgjmpR/LeCyfctZKMn.nkaOx2','sathindu',NULL,'2025-05-16 15:54:24','2025-05-16 15:54:24',NULL,'USER');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_verification`
--

DROP TABLE IF EXISTS `user_verification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_verification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `verification_type` varchar(30) DEFAULT NULL,
  `verification_data` varchar(30) DEFAULT NULL,
  `submitted_at` datetime DEFAULT NULL,
  `verified_at` datetime DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkverification` (`user_id`),
  CONSTRAINT `fkverification` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_verification`
--

LOCK TABLES `user_verification` WRITE;
/*!40000 ALTER TABLE `user_verification` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_verification` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-17 10:28:09
