CREATE DATABASE  IF NOT EXISTS `fitflow` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fitflow`;
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: fitflow
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.3

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
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('fitflow-cache-356a192b7913b04c54574d18c28d46e6395428ab','i:2;',1787332188),('fitflow-cache-356a192b7913b04c54574d18c28d46e6395428ab:timer','i:1787332188;',1787332188),('fitflow-cache-a9334987ece78b6fe8bf130ef00b74847c1d3da6','i:1;',1787333860),('fitflow-cache-a9334987ece78b6fe8bf130ef00b74847c1d3da6:timer','i:1787333860;',1787333860),('fitflow-cache-c5b76da3e608d34edb07244cd9b875ee86906328','i:1;',1787488351),('fitflow-cache-c5b76da3e608d34edb07244cd9b875ee86906328:timer','i:1787488351;',1787488351),('fitflow-cache-supercanal1@gmail.com|127.0.0.1','i:1;',1787334184),('fitflow-cache-supercanal1@gmail.com|127.0.0.1:timer','i:1787334184;',1787334184);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercicio`
--

DROP TABLE IF EXISTS `exercicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercicio` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `treino` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordem` int NOT NULL,
  `qntdSeries` int NOT NULL,
  `qtndRep` int NOT NULL,
  `peso` decimal(6,2) DEFAULT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `descanso` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercicio`
--

LOCK TABLES `exercicio` WRITE;
/*!40000 ALTER TABLE `exercicio` DISABLE KEYS */;
INSERT INTO `exercicio` VALUES (1,'Moriah VonRueden',16,10,5,NULL,'Quasi laboriosam in et rerum autem minus voluptatum.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',3),(2,'Dr. Lorna Nitzsche',6,11,27,3218.10,'Veritatis unde tempore corrupti sunt et sapiente perferendis sit.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',14),(3,'Mr. Kayleigh Bayer',2,2,5,433.94,'Numquam quia enim ducimus voluptatem et ea odit.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',37),(4,'Mr. Adelbert Bernhard II',15,4,14,NULL,NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',26),(5,'Paolo Christiansen',17,6,20,NULL,NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',10),(6,'Mr. Dalton Lubowitz IV',1,12,19,NULL,NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',3),(7,'Ludie Russel',19,2,4,2086.19,NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',58),(8,'Dr. Jody Yundt I',14,10,24,NULL,'Aperiam assumenda cupiditate mollitia magni asperiores.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',48),(9,'Merle O\'Kon',20,7,3,NULL,'Dicta ad optio temporibus veniam et.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',19),(10,'Mr. Melvin Mayert',3,12,3,6455.39,'Deserunt soluta quaerat sit possimus aut.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',37),(11,'Juston Grant',20,9,5,NULL,'Aut error consequuntur fugit itaque fuga nisi.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',19),(12,'Lavon Cummerata DVM',5,8,28,NULL,'Fuga earum id sit aut.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',15),(13,'Kimberly VonRueden DDS',14,11,7,NULL,'Neque numquam deserunt mollitia nihil sint expedita deserunt reiciendis.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',40),(14,'Ms. Alisha Howe',9,2,4,NULL,NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',31),(15,'Savannah Dickens',2,6,21,NULL,NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',33),(16,'Dr. Lazaro Bailey',21,3,19,9222.69,'Corrupti voluptas est pariatur voluptas perferendis nemo explicabo.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',11),(17,'Hassie Waelchi',20,3,6,NULL,'Aut ut delectus molestiae quasi asperiores aperiam unde.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',29),(18,'Miss Viva Weissnat V',4,1,15,362.88,NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',32),(19,'Dr. Louisa Fritsch',13,5,4,5656.39,'Et quod corporis ullam molestiae saepe.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',40),(20,'Miss Kaycee Marks Sr.',3,11,28,6503.05,'Et dicta sit nam odit.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',57),(21,'Alejandrin Hauck',25,12,6,NULL,NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',3),(22,'Minnie Windler',25,9,28,5130.63,NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',55),(23,'Ms. Norene Beer V',9,10,11,NULL,'A ducimus rerum optio et velit odio.','2026-08-21 20:38:33','2026-08-21 20:07:47','2026-08-21 20:38:33',19),(24,'Magdalen Luettgen IV',20,4,2,9587.41,'Ut illum quia assumenda deleniti.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',57),(25,'Velda Hammes',9,1,3,5174.08,NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',21),(26,'Prof. Jerel Larkin',22,7,16,NULL,'Animi dolorem velit nihil et at.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',15),(27,'Linda Spinka DDS',1,9,12,NULL,'Culpa earum rem est voluptatem in laborum.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',29),(28,'Arnaldo Purdy',20,9,14,6788.10,'Impedit omnis et magnam nam ea.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',28),(29,'Elaina Heidenreich',14,9,7,NULL,'Nesciunt rerum quam quae aliquid quia qui qui.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',19),(30,'Eva Schmidt',13,6,17,NULL,'Eos molestiae occaecati expedita.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',51),(31,'Loren Heller IV',8,12,30,NULL,NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',32),(32,'Mr. Jevon Towne',15,9,2,7906.27,NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',31),(33,'Lia O\'Connell',9,11,15,4801.06,NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',50),(34,'Burdette Fritsch',12,10,12,9469.13,'Suscipit nobis sequi veritatis aut rerum ipsam.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',32),(35,'Karlie Grady',18,11,19,NULL,'Ut voluptatem ipsa quia eos magni.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',6),(36,'Dr. Mathew Jones',23,6,14,NULL,NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',60),(37,'Tyler Sauer',8,8,22,3737.13,NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',33),(38,'Kaleigh Ziemann',1,1,3,NULL,'Quia repellendus quia blanditiis qui soluta odio maxime.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',31),(39,'Dr. Alysa Stehr',14,3,20,NULL,NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',46),(40,'Percival Hirthe',17,12,17,NULL,NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',48),(41,'Lawrence Cummerata',7,7,24,NULL,NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',60),(42,'Jamaal Lubowitz',2,2,2,5854.28,NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',48),(43,'Nicolette Stoltenberg',5,2,24,1509.42,'Fuga qui illum cupiditate soluta cum vitae.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',29),(44,'Gayle Jaskolski',16,9,8,NULL,'Aperiam est voluptas eos est ab commodi voluptatem.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',58),(45,'Mr. Mervin Nicolas I',21,2,30,NULL,NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',15),(46,'Tiffany Denesik',5,7,8,NULL,'Tenetur perferendis cum molestiae esse.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',25),(47,'Eloisa Stark',19,5,2,1320.87,'Ratione sint accusantium et qui quis possimus.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',11),(48,'Ashlynn Sipes',7,8,26,1190.00,NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',51),(49,'Coleman Schaden',14,4,27,NULL,'Officia blanditiis ut voluptas molestiae voluptatem perferendis sapiente omnis.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',39),(50,'Dion Wisoky',15,7,26,651.94,NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47',49),(51,'teste2',0,3,12,NULL,'nada','2026-08-21 20:48:33','2026-08-21 20:48:25','2026-08-21 20:48:33',NULL),(52,'teste2',0,12,3,NULL,NULL,'2026-08-21 20:52:44','2026-08-21 20:52:35','2026-08-21 20:52:44',NULL),(53,'teste',1,12,3,NULL,NULL,NULL,'2026-08-23 15:32:03','2026-08-23 15:32:03',NULL),(54,'teste',2,12,3,NULL,NULL,NULL,'2026-08-23 15:32:12','2026-08-23 15:32:12',NULL);
/*!40000 ALTER TABLE `exercicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha`
--

DROP TABLE IF EXISTS `ficha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ficha` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ficha_user_id_foreign` (`user_id`),
  CONSTRAINT `ficha_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha`
--

LOCK TABLES `ficha` WRITE;
/*!40000 ALTER TABLE `ficha` DISABLE KEYS */;
INSERT INTO `ficha` VALUES (1,16,'Armani Altenwerth','2002-03-14','2012-01-16','Cum autem autem aliquam eum debitis et sit.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(2,46,'Jane McKenzie MD','1974-06-03','1981-12-27',NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(3,15,'Dr. Marlon Hickle','2020-11-18','1970-11-22',NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(4,2,'Dr. Antoinette Emmerich PhD','2004-10-22','2022-06-23','Voluptas corporis harum aperiam culpa dolor.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(5,48,'Doug Stehr DVM','2023-12-18','2018-09-21',NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(6,7,'Dr. Jasmin Satterfield PhD','1983-05-02','1981-03-27','Saepe beatae illum et aperiam id iste quos.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(7,49,'Jovanny King','2019-04-27','2003-03-02','Repudiandae et dolores ipsa temporibus cumque.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(8,38,'Ms. Kristina West I','1975-06-07','1980-07-11','Et quisquam voluptas unde ea consectetur modi.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(9,44,'Rod Farrell','1970-02-24','1984-05-26',NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(10,6,'Leslie Pollich Jr.','2006-04-18','2009-01-23',NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(11,23,'Prof. Cristian Durgan V','2014-09-29','1971-02-02','Amet et doloribus deleniti suscipit sint excepturi.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(12,43,'Dr. Jeremy Kautzer','1990-10-10','1977-02-26',NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(13,29,'Prof. Rebecca O\'Hara Sr.','2006-11-16','1994-05-31','Eligendi molestias molestiae minus asperiores blanditiis rem omnis.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(14,24,'Mr. Leo Graham','2026-02-20','1997-12-31',NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(15,49,'Terrill West','2006-02-12','2023-04-23','Fugit accusamus praesentium et natus itaque fuga repudiandae autem.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(16,46,'Christelle Schinner','2018-05-04','1995-02-12',NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(17,30,'Mrs. Daphnee Hahn','1981-06-27','2018-04-24',NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(18,16,'Meda Rohan','1992-09-13','2019-07-16','Eligendi omnis quaerat velit aperiam facilis asperiores.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(19,13,'Tyler Eichmann','2001-02-20','1987-06-02',NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(20,47,'Trudie Turner','1984-08-04','2001-06-07',NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(21,5,'Pink Kris','1995-12-12','2026-01-25',NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(22,26,'Mr. Orin Wunsch Jr.','2016-12-26','2014-04-04','Ducimus error facilis ad sed ducimus sapiente deserunt.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(23,27,'Destany Ratke II','2009-03-31','2000-03-29',NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(24,50,'Stacy Jaskolski','2005-08-14','2014-04-02','Consequuntur dignissimos dolore ea non libero.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(25,39,'Deondre Keebler III','1996-04-27','2021-01-19',NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(26,40,'Paolo Schoen V','2000-07-02','2024-01-28',NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(27,50,'Nicolas Hudson','1982-01-14','1970-10-11',NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(28,18,'Dr. Mikayla Wintheiser','2011-04-10','1972-10-10',NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(29,38,'Erna Hartmann','2010-11-05','2017-03-05',NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(30,11,'Telly Fisher','2004-07-06','1996-11-22',NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(31,44,'Prof. Adolfo Yost PhD','1972-01-31','2013-08-04','Quia rerum molestias rerum porro.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(32,49,'Magdalena Carroll','1985-02-15','1982-08-11','Ea repellat delectus et numquam beatae adipisci illo.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(33,39,'Levi Sawayn','2000-07-20','2023-01-19','Et ullam veritatis voluptatem autem harum tempora.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(34,33,'Miss Shea Eichmann','2000-11-27','1970-10-01','Et corporis tempore sit qui fuga dolorem et.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(35,25,'Leland Pollich','1998-03-29','2004-05-15','Officia earum ea dolor quo quam ut ut.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(36,27,'Pearline Auer','2002-01-22','1984-06-21',NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(37,21,'Hyman Smith IV','1989-06-15','2002-09-11','Quasi consequatur cum numquam ea incidunt.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(38,34,'Freeman Altenwerth','2020-05-06','2010-07-20',NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(39,27,'Syble Goyette','1985-03-31','2009-03-02',NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(40,1,'Flavie Metz','2017-11-16','1973-09-27','Consequatur ut nisi qui vero officia.','2026-08-21 20:38:51','2026-08-21 20:07:47','2026-08-21 20:38:51'),(41,27,'Nayeli Murray','1990-07-07','1984-09-02','Consequatur est nobis ipsam ut ut facere accusantium.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(42,6,'Prof. Ivah Spinka','1981-03-30','1984-10-08','Eos ad dolorum tempora vitae aut delectus.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(43,35,'Deshawn Marquardt MD','1997-10-10','2004-01-25','Perferendis qui sed id eum qui molestiae distinctio sapiente.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(44,9,'Johanna Lemke','1982-11-11','2022-07-25',NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(45,41,'Mrs. Alva Jaskolski','2019-10-09','2022-09-19',NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(46,21,'Sallie Hudson','1996-01-08','2011-12-30',NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(47,15,'Mr. Marc Haag','2012-02-02','2025-03-13','Nostrum temporibus et sequi qui maiores illo.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(48,48,'Rachael Schneider','2014-05-24','1990-04-15','Sapiente a numquam ipsum voluptatum ullam voluptates enim soluta.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(49,15,'Dr. Kasandra Balistreri I','1993-06-08','2022-12-31',NULL,NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(50,19,'Irma Larson','2013-07-04','1985-04-21','Quas expedita est impedit officiis eum et sed.',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(51,1,'seila','2026-08-05','2026-08-14',NULL,NULL,'2026-08-21 20:47:33','2026-08-21 20:47:33'),(52,1,'Hardcore TryHardaoasdasd','2026-08-05','2026-08-08',NULL,'2026-08-21 20:52:51','2026-08-21 20:52:08','2026-08-21 20:52:51'),(53,53,'Hardcore TryHardao','2026-07-31','2026-08-14',NULL,NULL,'2026-08-23 15:31:48','2026-08-23 15:31:48');
/*!40000 ALTER TABLE `ficha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_exercicio`
--

DROP TABLE IF EXISTS `ficha_exercicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ficha_exercicio` (
  `ficha_id` bigint unsigned NOT NULL,
  `exercicio_id` bigint unsigned NOT NULL,
  `dias_semana` enum('seg','ter','qua','qui','sex','sab','dom') COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `ficha_exercicio_ficha_id_foreign` (`ficha_id`),
  KEY `ficha_exercicio_exercicio_id_foreign` (`exercicio_id`),
  CONSTRAINT `ficha_exercicio_exercicio_id_foreign` FOREIGN KEY (`exercicio_id`) REFERENCES `exercicio` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ficha_exercicio_ficha_id_foreign` FOREIGN KEY (`ficha_id`) REFERENCES `ficha` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_exercicio`
--

LOCK TABLES `ficha_exercicio` WRITE;
/*!40000 ALTER TABLE `ficha_exercicio` DISABLE KEYS */;
INSERT INTO `ficha_exercicio` VALUES (24,16,'sex',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(24,47,'sex',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(6,31,'ter',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(41,30,'sex',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(44,49,'ter',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(2,42,'qui',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(43,9,'qui',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(45,40,'sab',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(29,45,'ter',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(10,41,'dom',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(9,47,'ter',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(46,5,'dom',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(25,50,'sab',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(21,35,'qui',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(46,10,'sab',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(26,3,'qua',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(7,48,'seg',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(44,17,'dom',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(45,24,'sab',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(9,13,'qua',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(8,22,'ter',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(32,5,'sex',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(28,24,'dom',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(20,36,'sex',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(13,1,'dom',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(9,50,'sab',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(10,2,'seg',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(4,33,'dom',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(35,7,'qui',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(4,39,'dom',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(26,11,'ter',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(14,11,'qua',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(43,22,'ter',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(11,42,'qui',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(25,13,'sex',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(1,2,'sex',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(30,4,'sab',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(31,4,'seg',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(40,23,'sab','2026-08-21 20:38:33','2026-08-21 20:07:47','2026-08-21 20:38:33'),(36,10,'seg',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(44,44,'qua',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(8,12,'qui',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(37,34,'qua',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(21,24,'dom',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(42,45,'ter',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(22,7,'qui',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(14,6,'sab',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(11,13,'qua',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(43,8,'qua',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(25,19,'qua',NULL,'2026-08-21 20:07:47','2026-08-21 20:07:47'),(51,51,'seg','2026-08-21 20:48:33','2026-08-21 20:48:25','2026-08-21 20:48:33'),(52,52,'seg','2026-08-21 20:52:44','2026-08-21 20:52:35','2026-08-21 20:52:44'),(53,53,'seg',NULL,'2026-08-23 15:32:03','2026-08-23 15:32:03'),(53,54,'seg',NULL,'2026-08-23 15:32:12','2026-08-23 15:32:12');
/*!40000 ALTER TABLE `ficha_exercicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (52,'0001_01_01_000000_create_users_table',1),(53,'0001_01_01_000001_create_cache_table',1),(54,'0001_01_01_000002_create_jobs_table',1),(55,'2026_04_24_172039_ficha',1),(56,'2026_04_24_172226_exercicio',1),(57,'2026_04_24_172317_ficha_exemplo',1),(58,'2026_06_07_143700_adicionar_coluna_descanso',1),(59,'2026_08_21_164624_adiciona_is_adimin',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('TXC6MTnxiiUr0UUcfezxjV7bNIweoqfuj8aEodQR',53,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','eyJfdG9rZW4iOiJlT0x3NVJRNTBFdnZHRENXbTJZWVFiVkNWQkhNUkh5bDlMU3A4d012IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9ob21lIiwicm91dGUiOiJob21lIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfSwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjUzLCJ1cmwiOltdfQ==',1787488579);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `urlImage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idade` int unsigned DEFAULT NULL,
  `cidadeMora` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_user_name_unique` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','supercanal134@gmail.com','','2026-08-21 20:08:57','$2y$12$Ps8HnNVR0Z0bFtrLG4T62.aiVAZigR4lqx/zdiVuGMZN4K2mVGAWq',NULL,NULL,NULL,'admin',NULL,'2026-08-21 20:07:46','2026-08-21 20:08:57',1),(2,'Prof. Clemens Hamill','vward@example.org','Wyatt Langosh','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','KnyUNB0HDm',22,'Gerda Mohr MD','Dr. Kamron Ankunding PhD',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(3,'Susana Raynor','schamberger.jadon@example.net','Ms. Hassie Lang II','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','E1M4TsEBGq',36,'Summer Tillman','Lou Hansen',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(4,'Hiram Bins DDS','yrodriguez@example.net','Natasha Roberts','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','gK0Iqi62G1',31,'Doris McLaughlin','Dr. Cynthia Wiegand',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(5,'Mrs. Dayna Tillman','brandi18@example.org','Kamryn Lockman','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','cgarWI2dfd',4,'Mr. Donnie Herman','Verlie Bruen',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(6,'Narciso Nader','jacobs.ima@example.com','Prof. Annalise Moore','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','D7C2VLDHUA',62,'Miss Jennyfer Prosacco','Dr. Jose Ernser',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(7,'Mr. Jaylen Lang III','maverick34@example.net','Mr. Rick Hettinger DDS','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','1l08AUXvEX',78,'Miss Deja Pouros DDS','Prof. Eliane Barton',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(8,'Ayden Ullrich Sr.','tkovacek@example.com','Seth Christiansen','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','qFpm1t2Pga',73,'Evangeline Okuneva','Dr. Marley Hirthe',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(9,'Prof. Halie Harris','jamal13@example.com','Luigi Bogisich','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','6yKW7S9cI2',73,'Mr. Raoul Schultz II','Mr. Erwin Kuhic Sr.',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(10,'Selmer Funk','mrussel@example.org','Letitia Weimann','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','Q2xTR1hoOT',66,'Ms. Shanon Gottlieb','Payton Roob',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(11,'Deven Jacobson','flossie.nienow@example.org','Shaylee Paucek','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','hPjywSmQH6',9,'Prof. Kacey Huel','Jaylin Hill',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(12,'Dr. Ulises Wuckert V','dgaylord@example.net','Noah Dooley','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','xk3vH2omxt',61,'Luella Larkin','Joana Daniel',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(13,'Fiona Von','jodie29@example.net','Prof. Deontae Wiegand','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','uRhebrnSEi',48,'Michael Kemmer','Amber Blanda',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(14,'Guido Altenwerth','silas02@example.org','Miss Jodie Donnelly Jr.','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','W50xKbH2nR',87,'Noemi Hammes','Maci Christiansen V',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(15,'Vaughn Shields','euna.pacocha@example.net','Dr. Esmeralda Bradtke IV','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','rd8MPQhOac',52,'Mrs. Ana Roob DVM','Ricky Lueilwitz',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(16,'Nayeli Weber','vida16@example.org','Prof. Alvis Davis','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','3J5znTqCV3',91,'Mireya Homenick PhD','Dr. Edgardo Ferry',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(17,'Prof. Tiffany Swaniawski','green.bethel@example.net','Prof. Tyra Mitchell','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','XFmL7tudJy',87,'Mrs. Jodie Roberts MD','Mr. Ewell Cronin Jr.',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(18,'Eda McGlynn','cheyanne.hand@example.net','Elta Fadel','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','y8mjWw1Q4G',69,'Granville Keebler','Demarco Turcotte',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(19,'Taylor Koepp','bruce.sipes@example.com','Amelia Watsica IV','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','P2BNGhXx74',55,'Ricardo Romaguera','Elisha Kirlin I',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(20,'Dr. Camryn Heaney Sr.','stracke.ted@example.com','Dr. Orville White DVM','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','8cCNS7TytA',78,'Miss America Herman','Opal Abshire',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(21,'Robb Satterfield','jeffrey45@example.org','Manley Prohaska','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','YpHEQJQcf5',35,'Dr. Kylee Parker','Germaine Quigley',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(22,'Prof. Alvina Hermann','fharvey@example.net','Sylvia Ferry','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','Wo1RTQPrZT',86,'Eric Wilderman','Josefina Homenick',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(23,'Nikolas Sawayn','morris74@example.org','Gerda Goldner','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','mv08SnANQ8',53,'Makayla Ernser','Zachariah Towne',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(24,'Gwen McDermott Sr.','philip.kerluke@example.org','Raheem Bednar MD','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','fHjTKLLCyA',58,'Margaretta Jones','Darrin Heathcote',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(25,'Vincenzo Shanahan','marion.koch@example.org','Justus Turner','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','bJCy8J60OY',32,'Darwin Johnston','Dr. Arno Lubowitz DVM',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(26,'Petra Hodkiewicz V','philip.murray@example.com','Dr. Roma Purdy','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','JJ2AusqZbd',40,'Fae Lakin','Brett D\'Amore',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(27,'Dedrick Pacocha Sr.','mstamm@example.net','Dr. Emilio Herman DDS','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','KWWAfpuJdE',88,'Oceane Frami','Miss Madilyn Schaden',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(28,'Vernon Hettinger','jamel05@example.net','Tamia Pfeffer','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','mTaJlsmta9',37,'Arely Schulist','Mr. Jarrett Jast',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(29,'Shanie Muller','holden99@example.net','Arnulfo Kassulke','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','ILSozPUsCk',63,'Frances Dooley','Monica Kemmer',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(30,'Prof. Theresia Braun','sziemann@example.com','Damian Batz','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','0CKaXsREXx',55,'Carmine Reilly','Prof. Luna Bode MD',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(31,'Margarete Heidenreich','apurdy@example.org','Dr. Malachi Haley','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','0bKDrhTg3k',55,'Dr. Pearlie Cartwright','Mrs. Sonya Bergstrom',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(32,'Mrs. Joelle Johns','dannie70@example.org','Ashlee Kulas','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','RQ0Ajmlb9t',63,'Dr. Dillon Mueller DDS','Prof. Carmine Carter',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(33,'Stanford Zieme V','hspencer@example.com','Yolanda Jacobs','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','YfRNyyZ9fh',72,'Sigurd Kuhic','Moriah Stehr',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(34,'Jazmin Gaylord','shea54@example.org','Prof. Vinnie Jacobs','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','4HsUazYCxB',36,'Mrs. Juliana Zieme PhD','Torrey Schultz',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(35,'Dr. Diamond Kertzmann V','ybernhard@example.com','Prof. Clement Jacobi','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','BIgWq4ZfnQ',2,'Kariane Grady','Dr. Maida Heidenreich III',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(36,'Joy McCullough','constantin20@example.net','Prof. Austen Padberg III','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','yJbVEJoWRY',77,'Mrs. Eldridge Gaylord','Donnie Witting',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(37,'Rosamond Legros','kub.elias@example.com','Vincenza Herzog I','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','oZerWPfKSV',61,'Ivah Blick','Mrs. Margarete Weissnat III',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(38,'Cortney Eichmann','pfeffer.layla@example.net','Mrs. Genoveva Nitzsche V','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','hcHRnfXTul',83,'Dillon Kilback','Mozelle Lemke',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(39,'Zoey Wolff','ymurazik@example.org','Asia Bailey','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','rY7Vo1Ut8t',50,'Carleton McLaughlin PhD','Ephraim Miller',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(40,'Dr. Shaylee Botsford PhD','bednar.amparo@example.com','Asha Abernathy','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','Y0Z4nd1Y1U',79,'Dr. Earnest Lehner','Dr. Devin Ullrich MD',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(41,'Katelyn Keebler MD','adriana83@example.com','Jeffery Nader','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','SWPpxlX3wN',79,'General Von','Prof. Darien Satterfield',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(42,'Ross Huel Jr.','sporer.madisen@example.com','Enoch Quigley','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','8kf659Wbr4',88,'Prof. Jacey Schaden','Jerald Schroeder DDS',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(43,'Verla Goodwin','darrin27@example.net','Prof. Jadyn Beahan','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','9kQCuWI8VP',66,'Jane Bosco','Dr. Favian Hammes',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(44,'Forest Keebler','pkreiger@example.org','Catalina Corkery','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','r5m09ppUlN',72,'Lucienne Mills','Prof. Crystel Beahan MD',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(45,'Ms. Nyah Graham','ahmad99@example.org','Luna Miller','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','Q8wsQfSLPa',23,'Brooke Russel','Prof. Kacie Beahan PhD',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(46,'Garett Emmerich','elsie87@example.net','Miss Heidi Auer','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','QShqVBfx2O',82,'Karianne Grimes','Dr. Verona Durgan II',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(47,'Terrell Crona','meta69@example.net','Marcia Dicki IV','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','X6KmgUeEy1',98,'Prof. Ferne Harris','Rylan Trantow',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(48,'Lyla Watsica','aniyah48@example.com','Reanna Stanton','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','Rrnq6jN2Tx',12,'Delores Corkery','Koby Howell DVM',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(49,'Prof. Oliver Harber','ettie43@example.org','Peter Hauck','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','TPocGiudXZ',15,'Libby Jakubowski','Magdalen Prosacco',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(50,'Isom Kovacek','jamil.connelly@example.net','Miss Ally Dickinson MD','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','7WKMUkDq7j',10,'Emely Gutkowski I','Mackenzie Schumm',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(51,'Cassidy Schaefer','kautzer.alivia@example.org','Prof. Aurelia Brakus V','2026-08-21 20:07:46','$2y$12$HuwCagwYEBT.5A0lmBrwe.PiWspozqHtyn5eskT72Hxnc/q9cBew.','AnfYFk5Ncm',81,'Dr. Jarod Senger MD','Dr. Kole Rempel',NULL,'2026-08-21 20:07:46','2026-08-21 20:07:46',0),(52,'seila','supercanal1@gmail.com','perfis/ptEqF8ndQvuwTcxKa1VqJQ5XvbacRVEjtNl81f5v.png','2026-08-21 20:36:40','$2y$12$lqC7rwpKBYmG6C9/Vit5mOdXPhbS5eDHI4ORKADSWKT.3mxvx8IwG',NULL,12,'Greta Durgan','não sei','2026-08-21 20:41:40','2026-08-21 20:36:29','2026-08-21 20:41:40',0),(53,'jao','jao@email','perfis/zICgxUJcu1RiHnxjw8PytRGqEQKJi23AS26Rorff.png','2026-08-23 15:31:31','$2y$12$HjbP7zLo8pQ.W7PURFFZmuCScrnq0WkVRmd7iagMSvaxXBV6OH1uW',NULL,12,'lagoas','jao',NULL,'2026-08-23 15:31:20','2026-08-23 15:31:31',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-26 19:43:32
