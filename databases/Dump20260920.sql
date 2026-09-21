CREATE DATABASE  IF NOT EXISTS `fitflow` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fitflow`;
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: fitflow
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.4

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
INSERT INTO `cache` VALUES ('fitflow-cache-54ceb91256e8190e474aa752a6e0650a2df5ba37','i:1;',1789882091),('fitflow-cache-54ceb91256e8190e474aa752a6e0650a2df5ba37:timer','i:1789882091;',1789882091),('fitflow-cache-80e28a51cbc26fa4bd34938c5e593b36146f5e0c','i:1;',1789260577),('fitflow-cache-80e28a51cbc26fa4bd34938c5e593b36146f5e0c:timer','i:1789260577;',1789260577),('fitflow-cache-a9334987ece78b6fe8bf130ef00b74847c1d3da6','i:1;',1788474714),('fitflow-cache-a9334987ece78b6fe8bf130ef00b74847c1d3da6:timer','i:1788474714;',1788474714),('fitflow-cache-c5b76da3e608d34edb07244cd9b875ee86906328','i:2;',1789255148),('fitflow-cache-c5b76da3e608d34edb07244cd9b875ee86906328:timer','i:1789255148;',1789255148);
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
  `grupo_muscular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercicio`
--

LOCK TABLES `exercicio` WRITE;
/*!40000 ALTER TABLE `exercicio` DISABLE KEYS */;
INSERT INTO `exercicio` VALUES (1,'Caroline Brown','Prof. George Fahey Sr.',NULL,'2026-09-04 01:30:03','2026-09-04 06:18:42'),(2,'Pascale Huel','Nakia Bosco','2026-09-14 05:42:20','2026-09-04 01:30:03','2026-09-14 05:42:20'),(3,'Mudei o nome o','Magnus Abshire DDS',NULL,'2026-09-04 01:30:03','2026-09-14 03:49:07'),(4,'Rossie Cronin','Raymundo Schmidt',NULL,'2026-09-04 01:30:03','2026-09-04 06:18:58'),(5,'Betty Bergstrom','Malvina Waters',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(6,'Ryley Hills','Guillermo Osinski',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(7,'Mack Herzog V','Mrs. Katrine Harber I',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(8,'Olen Rutherford','Mr. Moses Trantow',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(9,'Patience Klocko V','Dr. Mario Skiles MD',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(10,'Ephraim Beer DVM','Ms. Julie Walker DVM',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(11,'Willow West','Maegan Quigley',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(12,'Natalia Quigley','Prof. Florian Metz',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(13,'Mrs. Jordane Nitzsche Sr.','Hayley Hills DDS',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(14,'Bridget Kuhn IV','Jamey Orn',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(15,'Jakayla Christiansen I','Derek Kreiger',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(16,'Junius Bailey','Brant Powlowski',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(17,'Miss Rossie Muller','Emelie Mitchell I',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(18,'Kenneth Beier','Maudie Kuvalis',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(19,'Kelton Gibson','Alfredo Kris',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(20,'Mr. Howard Torp','Hal Schaefer',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(21,'Dr. Charlotte Cole V','Katharina Prosacco',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(22,'Lera King','Loraine Lubowitz IV',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(23,'Dax Mann','Maddison Krajcik',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(24,'Prof. Leola Dooley II','Cecilia Cummerata',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(25,'Alena Hermann','Mr. Stuart Pacocha',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(26,'Bessie Frami','Chanel Tillman',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(27,'Prof. Buck Schamberger Jr.','Shanna Schumm V',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(28,'Nikita Lakin','Vivianne Lueilwitz III',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(29,'Dr. Haven Stehr PhD','Henry Bartell',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(30,'Fausto West','Jordon Cruickshank Jr.','2026-09-14 05:27:38','2026-09-04 01:30:03','2026-09-14 05:27:38'),(31,'Miss Kayli Lockman','Jalen Weimann',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(32,'Anais Wolff','Wilma Cole DDS',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(33,'Jonatan Hand','Precious O\'Kon',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(34,'Juliana Kozey','Thurman Johnson',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(35,'Giovanny Romaguera','Ms. Lura Denesik Jr.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(36,'Theo Spencer','Mrs. Christelle Ritchie V',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(37,'Raymond Carroll','Guadalupe Sipes PhD',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(38,'Markus Simonis','Donald Fahey Sr.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(39,'Prof. Santa Rolfson DVM','Damon Nikolaus',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(40,'Kristian Walsh','Wayne Jacobi',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(41,'Claud Cartwright','Isai Roberts',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(42,'Sydnee Hettinger','Jackeline Braun',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(43,'Dr. Kobe Bartell','Velva Dare',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(44,'Candido Schmidt','Ms. Ursula Morar',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(45,'Gaylord Reilly','Denis Shanahan III',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(46,'Abelardo Klein','Vita Johnson',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(47,'Lina Schroeder','Ms. Leola Labadie',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(48,'Haleigh Waters II','Roel Fadel IV',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(49,'Caroline Bernier','Stan Schmeler',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(50,'Eulah Reichel','Gerhard Heidenreich',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(51,'teste','testando',NULL,'2026-09-04 01:33:47','2026-09-04 01:33:47'),(52,'teste2','testando',NULL,'2026-09-04 01:33:59','2026-09-04 01:33:59'),(53,'teste3','testando2',NULL,'2026-09-04 01:34:15','2026-09-04 01:34:15'),(54,'teste4','testando2',NULL,'2026-09-04 05:28:02','2026-09-04 05:28:02');
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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha`
--

LOCK TABLES `ficha` WRITE;
/*!40000 ALTER TABLE `ficha` DISABLE KEYS */;
INSERT INTO `ficha` VALUES (1,17,'Prof. Kurt Gaylord Jr.','2011-11-24','2015-08-25','Vero rerum atque aut.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(2,27,'Isobel Witting DDS','1983-02-25','1974-04-18','Eos cumque deserunt perferendis quas voluptatem dolorem ab.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(3,38,'Prof. Kasandra Greenholt III','2023-08-23','1981-08-15','Maxime eos provident minus repellendus.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(4,41,'Schuyler Greenfelder','1996-10-30','2007-08-01',NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(5,16,'Vernie Beer','1983-04-19','2023-11-05','Vel mollitia magni ab nihil voluptatum sapiente atque.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(6,2,'Aylin O\'Kon DDS','1999-08-24','1995-05-08','Inventore quasi et adipisci occaecati consequuntur libero.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(7,10,'Dr. Annabelle Schaden','2026-06-24','1975-04-06','Totam perferendis nihil ipsam sint sunt quo delectus tempora.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(8,13,'Cornell Donnelly II','1994-05-18','2002-10-03','Quidem aspernatur quo omnis.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(9,26,'Dr. Caroline Hettinger II','2020-05-19','1999-07-27',NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(10,26,'Jarrell Denesik','2001-03-25','1976-04-26',NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(11,13,'Mr. Tristian Lubowitz','1982-03-18','2006-07-01',NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(12,5,'Prof. Carlotta Senger','1979-06-10','2004-09-04',NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(13,39,'Halie Greenfelder','1997-07-03','2008-07-14',NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(14,27,'Sincere Bins','2010-11-10','1988-03-17',NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(15,47,'Tyrese Rosenbaum','2017-02-22','1977-07-12','Adipisci omnis autem vitae sequi corporis nihil.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(16,21,'Bryon Luettgen IV','2014-11-05','2024-10-03',NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(17,9,'Edna Steuber','1970-09-28','1992-04-12','Nostrum vel et optio harum.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(18,8,'Mr. Jordan Dicki Jr.','1988-06-21','1979-06-05',NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(19,37,'Miss Dawn Bayer IV','1971-03-12','2018-07-28',NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(20,23,'Blaise Heaney','2000-09-13','2015-01-14','Error nisi sit blanditiis sunt sed.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(21,6,'Lura Aufderhar','1989-07-15','1985-11-20',NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(22,23,'Adele Douglas','1972-09-15','1982-08-25','Iste in nulla error alias corporis.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(23,32,'Major Donnelly','2020-11-06','1998-04-24',NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(24,12,'Maude Tremblay PhD','2017-07-31','1971-07-31',NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(25,50,'Kelley Waelchi','2007-09-24','2023-02-27',NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(26,50,'Dr. Andrew Marquardt MD','1976-11-15','1989-01-18','Hic dolore vitae eos consequatur.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(27,23,'Garett Connelly','1975-11-30','1982-08-27',NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(28,12,'Nasir Trantow MD','1983-11-20','2017-08-24','Mollitia quia sequi sed nobis fuga.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(29,25,'Dakota Goldner','2010-07-09','1990-07-23','Quo eligendi dolorum aut ut modi qui sed est.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(30,46,'Kimberly Pouros','2015-12-26','2023-07-21','Qui ad adipisci similique sed corporis laudantium sint.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(31,8,'Christine Sipes','1987-10-15','2021-02-13',NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(32,47,'Dr. Noble Williamson I','2020-05-30','1977-01-11',NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(33,49,'Lavonne Beatty','1987-01-09','2004-10-18',NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(34,39,'Prof. Vladimir Dicki','2002-10-20','1992-01-02',NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(35,14,'Keegan Grant','1977-08-29','1971-02-02','Illo incidunt ipsa aut quod tempora reiciendis.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(36,26,'Mr. Abelardo Crist','1994-12-04','2023-02-17',NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(37,51,'Napoleon Grant','1985-04-03','1989-01-21',NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(38,13,'Jewell Maggio','2011-10-26','1970-03-26',NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(39,21,'Mireille Emmerich','1971-02-02','1971-08-21',NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(40,21,'Merl Ortiz','1977-09-28','2016-12-24',NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(41,31,'Lilla Jenkins','2021-12-23','2016-05-18','Cumque in excepturi mollitia vel.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(42,33,'Ms. Miracle Wolff','2010-05-03','1987-06-24','Sed voluptatem quo voluptas.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(43,10,'Prof. Bradford Kuphal I','2021-10-17','1980-12-20','Laudantium illo fugiat suscipit eius sit qui quo.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(44,10,'Mariana Konopelski','1973-01-28','2021-11-11',NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(45,3,'Serena Klocko','2007-11-08','2005-06-05',NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(46,46,'Thurman Renner','1994-10-28','1995-10-04','Vel dolor atque molestias est rem ea.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(47,27,'Roberto Pollich','2015-02-16','1988-03-14','Sequi dolor illo sit voluptatem consequatur optio.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(48,13,'Miss Zaria Hill MD','1977-11-01','2006-02-21',NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(49,20,'Wallace Bailey','2001-10-09','2023-01-12',NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(50,3,'Raheem Parisian','1995-10-18','2000-05-20',NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03'),(51,52,'Hardcore TryHardao','2026-09-10','2026-09-18','nada',NULL,'2026-09-04 01:31:26','2026-09-04 01:31:26'),(52,52,'Hardcore TryHardao 2','2026-09-10','2026-09-24',NULL,'2026-09-04 06:04:44','2026-09-04 05:57:53','2026-09-04 06:04:44'),(53,52,'Hardcore TryHardao 3','2026-10-03','2026-10-31',NULL,'2026-09-04 06:23:26','2026-09-04 06:06:03','2026-09-04 06:23:26'),(54,53,'Hardcore TryHardao3','2026-09-09','2026-09-17',NULL,NULL,'2026-09-13 12:19:16','2026-09-13 12:32:49'),(55,53,'Hardcore TryHardao2','2026-10-10','2026-10-10','nada nada',NULL,'2026-09-13 12:19:38','2026-09-13 12:19:38'),(56,53,'Hardcore','2026-10-21','2026-11-07','aaaaaaaaaaaaaaaaaaaaaaaaa',NULL,'2026-09-13 12:19:59','2026-09-20 00:17:14'),(57,53,'Hardcore TryHardao4','2026-09-11','2026-09-25',NULL,NULL,'2026-09-13 22:13:03','2026-09-13 22:13:03'),(58,53,'Hardcore TryHardao5','2026-09-18','2026-09-26',NULL,NULL,'2026-09-13 22:13:23','2026-09-13 22:13:23'),(59,53,'Hardcore TryHardao6','2026-09-11','2026-10-10','ultima',NULL,'2026-09-13 22:13:38','2026-09-13 22:13:38'),(60,54,'Ficha','2026-10-10','2026-10-11',NULL,NULL,'2026-09-19 20:20:07','2026-09-20 00:13:41'),(61,54,'Hardcore TryHardao','2026-09-02','2026-09-16',NULL,NULL,'2026-09-20 00:15:04','2026-09-20 00:15:04');
/*!40000 ALTER TABLE `ficha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_exercicio`
--

DROP TABLE IF EXISTS `ficha_exercicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ficha_exercicio` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ficha_id` bigint unsigned NOT NULL,
  `exercicio_id` bigint unsigned NOT NULL,
  `dias_semana` enum('seg','ter','qua','qui','sex','sab','dom') COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordem` int unsigned NOT NULL,
  `qntdSeries` int DEFAULT NULL,
  `qntdRep` int DEFAULT NULL,
  `peso` decimal(6,2) DEFAULT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `descanso` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ficha_exercicio_ficha_id_foreign` (`ficha_id`),
  KEY `ficha_exercicio_exercicio_id_foreign` (`exercicio_id`),
  CONSTRAINT `ficha_exercicio_exercicio_id_foreign` FOREIGN KEY (`exercicio_id`) REFERENCES `exercicio` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ficha_exercicio_ficha_id_foreign` FOREIGN KEY (`ficha_id`) REFERENCES `ficha` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_exercicio`
--

LOCK TABLES `ficha_exercicio` WRITE;
/*!40000 ALTER TABLE `ficha_exercicio` DISABLE KEYS */;
INSERT INTO `ficha_exercicio` VALUES (1,6,8,'dom',5,3,12,4109.21,'Similique hic in qui modi earum iste.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',9),(2,27,2,'seg',17,11,12,3698.68,'Ut voluptatem nam laborum expedita in accusantium.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',2),(3,14,16,'sex',3,7,11,NULL,NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',58),(4,50,40,'seg',7,8,1,1514.09,NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',24),(5,5,48,'sab',11,9,17,NULL,'Nihil perferendis dolorem magnam rerum sunt nulla sit eligendi.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',33),(6,4,48,'dom',22,3,30,9925.26,NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',47),(7,17,13,'seg',22,10,17,3569.40,NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',56),(8,36,34,'seg',24,2,8,3995.59,'Cum sequi laudantium nam facilis nulla saepe reprehenderit.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',37),(9,44,6,'sab',3,4,29,NULL,NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',6),(10,5,25,'dom',16,11,30,NULL,'Odio consequatur possimus numquam aut libero mollitia nihil.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',24),(11,47,34,'sab',16,2,9,4762.27,NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',38),(12,32,9,'qua',10,6,17,7275.86,'Voluptatem maxime atque rem.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',41),(13,20,48,'qui',20,1,26,7742.33,'Sed voluptatum sed eveniet iste.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',11),(14,47,47,'sab',15,11,22,2594.74,NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',49),(15,13,15,'qui',22,7,2,5287.67,'Blanditiis totam laudantium minus aspernatur possimus explicabo.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',41),(16,13,30,'sex',20,8,19,7061.26,'Facilis labore cumque ipsum provident tempora.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',49),(17,8,23,'sex',9,6,23,9036.06,NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',40),(18,10,2,'sab',24,5,28,3746.79,'Nam nesciunt suscipit et a reiciendis voluptatem.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',21),(19,1,30,'ter',13,5,22,NULL,NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',6),(20,18,15,'dom',9,3,3,3162.76,'Tempore dolor voluptas similique voluptatum et fugiat vero.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',60),(21,39,7,'seg',1,2,11,NULL,NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',52),(22,47,14,'seg',1,1,22,NULL,NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',51),(23,16,30,'seg',7,12,7,NULL,NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',52),(24,14,36,'sex',5,5,7,7152.39,'Non explicabo maxime quas minima et incidunt.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',49),(25,18,50,'seg',7,7,7,1342.09,NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',10),(26,41,49,'seg',17,12,28,1579.69,NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',58),(27,28,17,'dom',23,2,14,NULL,'Velit debitis illo asperiores.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',49),(28,1,4,'seg',22,7,18,228.26,'Id quas tempore tenetur sed.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',13),(29,30,12,'ter',25,3,7,8049.53,'Ut quis iste autem deleniti nisi fuga dignissimos.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',15),(30,4,33,'sex',11,12,22,9857.61,NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',39),(31,19,18,'qua',5,9,16,6544.65,NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',32),(32,44,47,'sab',7,6,2,NULL,'Sed ipsam dolorem non repellat sapiente nisi.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',26),(33,21,49,'qui',14,1,18,9974.14,NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',20),(34,42,16,'sab',17,8,4,NULL,NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',17),(35,9,30,'qui',24,4,10,81.13,'Doloribus reiciendis illo non corrupti officia quia asperiores.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',16),(36,47,36,'qua',13,3,26,387.85,NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',19),(37,36,7,'sex',16,12,14,NULL,'Sit quibusdam velit cum ut fuga sapiente.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',51),(38,44,44,'qua',22,6,7,NULL,NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',51),(39,13,16,'seg',17,7,11,1705.88,'Illum totam laboriosam id placeat.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',12),(40,13,38,'ter',5,10,28,NULL,NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',42),(41,35,5,'sex',1,8,7,9497.57,NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',38),(42,1,3,'qui',1,10,27,NULL,NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',16),(43,18,9,'seg',10,7,24,NULL,'Quia qui non odit ducimus illum.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',16),(44,25,5,'sex',13,11,15,NULL,'Porro perspiciatis sunt aut est explicabo aut ullam.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',13),(45,45,1,'sab',23,2,5,6182.27,'Fugit corrupti voluptatem aut soluta ipsam aut numquam velit.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',19),(46,7,26,'sab',15,6,25,7574.46,NULL,NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',31),(47,21,4,'dom',5,7,3,3456.48,'Non nulla veritatis qui dicta doloremque ut.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',52),(48,1,5,'dom',12,4,25,NULL,'Sint aut doloremque quia ipsam eligendi beatae similique.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',17),(49,47,34,'qua',21,11,21,585.56,'Quasi quidem unde quae quas praesentium modi.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',27),(50,39,36,'qua',9,5,20,NULL,'Nesciunt deleniti culpa voluptates hic ut quae molestiae.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',26),(51,51,53,'seg',1,NULL,NULL,NULL,NULL,'2026-09-04 03:49:12','2026-09-04 02:55:24','2026-09-04 03:49:12',NULL),(52,51,52,'seg',2,NULL,NULL,NULL,NULL,'2026-09-04 05:16:07','2026-09-04 02:56:06','2026-09-04 05:16:07',NULL),(53,51,53,'ter',1,NULL,NULL,NULL,NULL,NULL,'2026-09-04 02:56:19','2026-09-04 02:56:19',NULL),(54,51,9,'dom',1,3,12,30.00,'e de domingo','2026-09-04 03:49:44','2026-09-04 03:22:34','2026-09-04 03:49:44',60),(55,51,6,'qua',1,NULL,NULL,NULL,'e de quarta feira 1','2026-09-04 04:20:11','2026-09-04 04:09:42','2026-09-04 04:20:11',NULL),(56,51,51,'qua',2,NULL,NULL,NULL,'e de quarta feira 2','2026-09-04 04:09:49','2026-09-04 04:09:42','2026-09-04 04:09:49',NULL),(57,51,52,'qua',3,NULL,NULL,NULL,'e de quarta feira 3','2026-09-04 04:20:01','2026-09-04 04:09:42','2026-09-04 04:20:01',NULL),(58,51,51,'qua',1,NULL,NULL,NULL,'e de quarta feira 4','2026-09-04 04:20:08','2026-09-04 04:09:42','2026-09-04 04:20:08',NULL),(59,51,19,'sab',1,NULL,NULL,NULL,'e de sabado 1','2026-09-04 04:21:04','2026-09-04 04:20:56','2026-09-04 04:21:04',NULL),(60,51,7,'sab',1,NULL,NULL,NULL,'e de sabado 2','2026-09-04 04:21:18','2026-09-04 04:20:56','2026-09-04 04:21:18',NULL),(61,51,35,'sab',1,NULL,NULL,NULL,'e de sabado 3','2026-09-04 06:03:48','2026-09-04 04:20:56','2026-09-04 06:03:48',NULL),(62,51,51,'sab',2,NULL,NULL,NULL,'e de sabado 4','2026-09-04 04:21:52','2026-09-04 04:20:56','2026-09-04 04:21:52',NULL),(63,51,9,'sab',2,NULL,NULL,NULL,'e de sabado 5','2026-09-04 05:16:21','2026-09-04 04:21:44','2026-09-04 05:16:21',NULL),(64,51,25,'sab',1,NULL,NULL,NULL,'e de sabado 6',NULL,'2026-09-04 04:21:44','2026-09-04 06:03:48',NULL),(65,51,2,'qui',1,NULL,NULL,NULL,'e de quinta feira 1',NULL,'2026-09-04 05:23:50','2026-09-04 05:23:50',NULL),(66,51,9,'qui',2,NULL,NULL,NULL,'e de quinta feira 2','2026-09-04 05:27:19','2026-09-04 05:23:50','2026-09-04 05:27:19',NULL),(67,51,5,'qui',2,NULL,NULL,NULL,'e de quinta feira 3',NULL,'2026-09-04 05:23:50','2026-09-04 05:27:19',NULL),(68,51,2,'qui',3,NULL,NULL,NULL,'e de quinta feira 4','2026-09-04 06:24:59','2026-09-04 05:23:50','2026-09-04 06:24:59',NULL),(69,52,5,'qui',1,NULL,NULL,NULL,'e de quinta feira 1',NULL,'2026-09-04 05:58:11','2026-09-04 05:58:11',NULL),(70,53,4,'sex',1,NULL,NULL,NULL,'e de sexta feira 1','2026-09-04 06:23:26','2026-09-04 06:08:33','2026-09-04 06:23:26',NULL),(71,53,1,'sex',2,NULL,NULL,NULL,'e de sexta feira 2','2026-09-04 06:23:26','2026-09-04 06:08:33','2026-09-04 06:23:26',NULL),(72,51,2,'qui',3,NULL,NULL,NULL,'e de quinta feira 5',NULL,'2026-09-04 06:24:47','2026-09-04 06:24:59',NULL),(73,51,4,'qui',4,NULL,NULL,NULL,'e de quinta feira 6','2026-09-04 06:25:06','2026-09-04 06:24:47','2026-09-04 06:25:06',NULL),(74,51,2,'qui',4,NULL,NULL,NULL,'e de quinta feira 7',NULL,'2026-09-04 06:24:47','2026-09-04 06:25:06',NULL),(75,51,7,'qui',5,NULL,NULL,NULL,'e de quinta feira 8',NULL,'2026-09-04 06:24:47','2026-09-04 06:25:06',NULL),(76,51,6,'qui',6,3,12,10.00,'so de teste 1',NULL,'2026-09-04 06:50:44','2026-09-04 06:50:44',20),(77,51,3,'qui',7,30,50,22.00,'sera??',NULL,'2026-09-04 06:50:44','2026-09-04 07:55:14',180),(78,56,51,'seg',1,4,15,20.00,'teste',NULL,'2026-09-13 22:42:57','2026-09-13 22:42:57',30),(79,56,52,'seg',2,3,12,31.00,NULL,NULL,'2026-09-13 22:42:57','2026-09-13 22:42:57',60),(80,56,53,'seg',3,NULL,10,40.00,'teste3',NULL,'2026-09-13 22:42:57','2026-09-13 22:42:57',10),(81,56,54,'seg',4,NULL,NULL,20.56,NULL,NULL,'2026-09-13 22:42:57','2026-09-20 07:09:13',10),(82,56,51,'seg',5,NULL,NULL,NULL,NULL,NULL,'2026-09-13 22:42:57','2026-09-20 07:09:09',90),(83,56,51,'seg',6,NULL,NULL,NULL,NULL,NULL,'2026-09-13 22:42:57','2026-09-13 22:42:57',NULL),(84,56,3,'sex',1,NULL,NULL,NULL,NULL,NULL,'2026-09-13 22:43:13','2026-09-13 22:43:13',NULL),(85,55,2,'seg',1,NULL,NULL,NULL,'aqui esta a descrição',NULL,'2026-09-14 00:07:46','2026-09-14 00:08:01',NULL),(86,58,51,'seg',1,NULL,NULL,NULL,'teste I',NULL,'2026-09-14 02:34:03','2026-09-14 02:34:03',NULL),(87,58,30,'seg',2,NULL,NULL,NULL,'teste II mudei o',NULL,'2026-09-14 02:34:03','2026-09-14 04:01:44',NULL),(88,54,51,'seg',1,3,12,20.00,'teste','2026-09-14 04:06:44','2026-09-14 04:04:40','2026-09-14 04:06:44',60),(89,55,8,'ter',1,NULL,NULL,NULL,'e de terca feira','2026-09-14 05:58:07','2026-09-14 05:57:25','2026-09-14 05:58:07',NULL),(90,60,3,'seg',1,1,12,12.00,NULL,NULL,'2026-09-19 20:20:58','2026-09-20 06:47:40',12),(91,60,3,'seg',2,15,15,15.00,'muiiiiiiiiiiiiiiiiiiiiiiiiiiitoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo loooooooooooooooooooooooooooooooongooooooooooooooooooooooooooooooooooooooooooo',NULL,'2026-09-19 20:22:01','2026-09-20 06:35:13',15),(92,60,1,'ter',1,NULL,NULL,NULL,'----',NULL,'2026-09-20 06:39:40','2026-09-20 06:39:48',NULL),(93,56,3,'seg',7,NULL,NULL,NULL,NULL,NULL,'2026-09-20 07:12:07','2026-09-20 07:12:07',NULL),(94,56,6,'seg',8,NULL,NULL,NULL,NULL,NULL,'2026-09-20 07:12:07','2026-09-20 07:12:07',NULL),(95,56,18,'seg',9,NULL,NULL,NULL,NULL,NULL,'2026-09-20 07:12:07','2026-09-20 07:12:07',NULL),(96,56,9,'seg',10,NULL,NULL,NULL,NULL,NULL,'2026-09-20 07:12:07','2026-09-20 07:12:07',NULL),(97,56,10,'seg',11,NULL,NULL,NULL,NULL,NULL,'2026-09-20 07:12:07','2026-09-20 07:12:07',NULL),(98,56,11,'seg',12,NULL,NULL,NULL,NULL,NULL,'2026-09-20 07:12:07','2026-09-20 07:12:07',NULL),(99,56,46,'seg',13,NULL,NULL,NULL,NULL,NULL,'2026-09-20 07:12:07','2026-09-20 07:12:07',NULL),(100,56,36,'seg',14,NULL,NULL,NULL,NULL,NULL,'2026-09-20 07:12:07','2026-09-20 07:12:07',NULL),(101,56,7,'seg',15,NULL,NULL,NULL,NULL,NULL,'2026-09-20 07:12:07','2026-09-20 07:12:07',NULL),(102,56,46,'seg',16,NULL,NULL,NULL,NULL,NULL,'2026-09-20 07:12:07','2026-09-20 07:12:07',NULL),(103,56,16,'seg',17,NULL,NULL,NULL,NULL,NULL,'2026-09-20 07:12:07','2026-09-20 07:12:07',NULL),(104,56,4,'seg',18,NULL,NULL,NULL,NULL,NULL,'2026-09-20 07:12:07','2026-09-20 07:12:07',NULL),(105,56,51,'seg',19,NULL,NULL,NULL,NULL,NULL,'2026-09-20 07:12:07','2026-09-20 07:12:07',NULL),(106,56,52,'seg',20,NULL,NULL,NULL,NULL,NULL,'2026-09-20 07:12:07','2026-09-20 07:12:07',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (81,'0001_01_01_000000_create_users_table',1),(82,'0001_01_01_000001_create_cache_table',1),(83,'0001_01_01_000002_create_jobs_table',1),(84,'2026_04_24_172039_ficha',1),(85,'2026_04_24_172226_exercicio',1),(86,'2026_04_24_172317_ficha_exemplo',1),(87,'2026_06_07_143700_adicionar_coluna_descanso',1),(88,'2026_08_21_164624_adiciona_is_adimin',1),(89,'2026_09_12_120002_create_personal_access_tokens_table',2);
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
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',53,'app-flutter','c072115600181cd74fddeb0702f54dcaa3d8aa0922430437e2b3598eee4dee9e','[\"*\"]',NULL,NULL,'2026-09-12 15:38:16','2026-09-12 15:38:16'),(2,'App\\Models\\User',53,'app-flutter','d1ffa42c45175a2cd0a387daf4f690bfd4a8a927fd2288ddf9c78b7038832143','[\"*\"]',NULL,NULL,'2026-09-12 15:38:50','2026-09-12 15:38:50'),(3,'App\\Models\\User',53,'app-flutter','70ff57e216424e4722edd43ce50112bdada6a55d3ae9f035a9f0a15e76836338','[\"*\"]',NULL,NULL,'2026-09-12 15:39:32','2026-09-12 15:39:32'),(4,'App\\Models\\User',53,'app-flutter','e704c07b39860d91dc4ea30ee6db437bc3473a1f0c395119762ee2d6267f03ed','[\"*\"]',NULL,NULL,'2026-09-12 15:39:58','2026-09-12 15:39:58'),(5,'App\\Models\\User',53,'app-flutter','4d145ae52a66aaf86b51458502547ec166e1e6e4066cd9cd2b2994e85de3195a','[\"*\"]',NULL,NULL,'2026-09-12 15:40:45','2026-09-12 15:40:45'),(6,'App\\Models\\User',53,'app-flutter','8206ca714e0bf79ccf022760c2c3029a555597b92da039ceeaaa98f495391a84','[\"*\"]',NULL,NULL,'2026-09-12 15:42:11','2026-09-12 15:42:11'),(7,'App\\Models\\User',53,'app-flutter','f48a2963970ec9a916e78b183c41882907ceccd13e4f2f8ec0dabdd586c6be98','[\"*\"]',NULL,NULL,'2026-09-12 15:56:56','2026-09-12 15:56:56'),(8,'App\\Models\\User',53,'app-flutter','3b7f09d3fddcc2cb3b1a5fef15fe8ec30caab65522b05c849c7ff1df45e709a1','[\"*\"]',NULL,NULL,'2026-09-12 15:58:50','2026-09-12 15:58:50'),(9,'App\\Models\\User',53,'app-flutter','f4682998573f6e93b743a20f3c647d6c15828a0d32d019d88e84166a26e3d616','[\"*\"]',NULL,NULL,'2026-09-12 16:04:41','2026-09-12 16:04:41'),(10,'App\\Models\\User',53,'app-flutter','c8e0702c927f24703e0dd4d5f058f50a43586f65716b7ed84cd523ae1c9f33ef','[\"*\"]',NULL,NULL,'2026-09-12 16:08:26','2026-09-12 16:08:26'),(11,'App\\Models\\User',53,'app-flutter','bdaf3a53f3ae989b1a50d916aad1d86f9ceb7c9d942804413db34b5c3fc5ff54','[\"*\"]',NULL,NULL,'2026-09-12 16:08:41','2026-09-12 16:08:41'),(12,'App\\Models\\User',53,'app-flutter','a4044d4870baa24cef36a6dfb02a93986ba52b66fa28fd618a33bfdec5c292d5','[\"*\"]',NULL,NULL,'2026-09-12 16:08:45','2026-09-12 16:08:45'),(13,'App\\Models\\User',53,'app-flutter','4dcc57b0635088c31b13de54dbf89229b216bdb731d9fc1cce085e4581040d60','[\"*\"]',NULL,NULL,'2026-09-12 16:13:51','2026-09-12 16:13:51'),(14,'App\\Models\\User',53,'app-flutter','26c3dcf265cbdb974386f09fb01f027d5dc9501b9dc50b2b23bb20872737f77b','[\"*\"]',NULL,NULL,'2026-09-12 18:39:18','2026-09-12 18:39:18'),(15,'App\\Models\\User',53,'app-flutter','5ab2a44263c0553cdce791af2db7c24ee7274738a4eb592f8bd587abe3c14cbe','[\"*\"]',NULL,NULL,'2026-09-12 18:39:48','2026-09-12 18:39:48'),(16,'App\\Models\\User',53,'app-flutter','bcc9b85dd5c8b94b4986460429ee87b647c2fca33f9c06067e6a7138dcd22f8d','[\"*\"]',NULL,NULL,'2026-09-12 18:42:26','2026-09-12 18:42:26'),(17,'App\\Models\\User',53,'app-flutter','fe17c5e8caa18737413d4312ba684d532db09244d53e25d964e7c7e7b27e83c2','[\"*\"]',NULL,NULL,'2026-09-12 18:46:50','2026-09-12 18:46:50'),(18,'App\\Models\\User',53,'app-flutter','bc8ba3fb707b8803ef27df65f015ad610bd408db256cea75768348bc5cf991c9','[\"*\"]',NULL,NULL,'2026-09-12 18:54:25','2026-09-12 18:54:25'),(19,'App\\Models\\User',53,'app-flutter','8eefd307afd43e4aac4c5a85a58c6962708bb81c7c451ae37446e5574ea5b2da','[\"*\"]',NULL,NULL,'2026-09-12 23:52:46','2026-09-12 23:52:46'),(20,'App\\Models\\User',53,'app-flutter','c7a60dba71de1f5062ccc35efda70e79688ca70babac1fa98eb8ed548782a0de','[\"*\"]',NULL,NULL,'2026-09-12 23:58:54','2026-09-12 23:58:54'),(21,'App\\Models\\User',53,'app-flutter','be44072b083733d6055bec2ff1dc577a9b00538c6ccbf003ee38d117d1b0d429','[\"*\"]',NULL,NULL,'2026-09-12 23:59:37','2026-09-12 23:59:37'),(22,'App\\Models\\User',53,'app-flutter','9dd81056faf04532d2d514070174c1af1d4f0887e68976a8bd5de387898fdeae','[\"*\"]',NULL,NULL,'2026-09-13 00:01:27','2026-09-13 00:01:27'),(23,'App\\Models\\User',53,'app-flutter','62e839aa221f8d6c99760ad1346776a4cf42718bc66694b2f4187d90603421fb','[\"*\"]',NULL,NULL,'2026-09-13 00:02:37','2026-09-13 00:02:37'),(24,'App\\Models\\User',53,'app-flutter','5c746edf6cfae05c9cdcdcf87a928985e439d9b38c4bdbec2287ce35526ce203','[\"*\"]',NULL,NULL,'2026-09-13 00:03:54','2026-09-13 00:03:54'),(25,'App\\Models\\User',53,'app-flutter','b8bd0ca363058ccd55e3aa8ced8653901cb0adb85615b6e460709f289fcdd2b5','[\"*\"]',NULL,NULL,'2026-09-13 00:04:44','2026-09-13 00:04:44'),(26,'App\\Models\\User',53,'app-flutter','f9aedb01c7052153b91dde0a8cd6beb9631970a4db0c21281a9a26e8eb79279a','[\"*\"]','2026-09-13 01:54:49',NULL,'2026-09-13 00:05:39','2026-09-13 01:54:49'),(27,'App\\Models\\User',53,'app-flutter','2561161cb13e21da88de118287af0283e0d85c4052bc5c5340898822b5dcdafd','[\"*\"]','2026-09-13 01:55:21',NULL,'2026-09-13 01:55:16','2026-09-13 01:55:21'),(28,'App\\Models\\User',53,'app-flutter','76164f666d3f29e81cbcd4cd4e1cbc9cad927b9ebcd899ec676a6f16fc434621','[\"*\"]','2026-09-13 02:16:55',NULL,'2026-09-13 01:57:30','2026-09-13 02:16:55'),(29,'App\\Models\\User',53,'app-flutter','e8c7c712adab1b5f7c0071cdcb35125ef65acac8a8e89d859dc9e5c48d54282a','[\"*\"]','2026-09-13 02:17:19',NULL,'2026-09-13 02:17:15','2026-09-13 02:17:19'),(30,'App\\Models\\User',53,'app-flutter','4518b5a7944b61dec4cb0e3d46422540879cdc0559b043c8b313d293af48e8f6','[\"*\"]','2026-09-13 02:19:51',NULL,'2026-09-13 02:17:46','2026-09-13 02:19:51'),(60,'App\\Models\\User',53,'app-flutter','0ebddf0281634a6616d5d9632d627c94b79c5a01de4732d9962add0bb2e75a59','[\"*\"]','2026-09-20 08:28:52',NULL,'2026-09-20 07:08:45','2026-09-20 08:28:52');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
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
INSERT INTO `sessions` VALUES ('mIIA2c89WXA95F4ItGwQaKCHmZcSoc9zDvxRALWf',53,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','eyJfdG9rZW4iOiJCYzZLemNQQlhKSzZuYmFpMGw2MFZUZ3U1cTZ2dTBscFNkcVBaeVFNIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvMTI3LjAuMC4xOjgwMDBcL3Byb2ZpbGUiLCJyb3V0ZSI6InByb2ZpbGUuZWRpdCJ9LCJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI6NTN9',1789883309);
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','supercanal134@gmail.com','','2026-09-04 01:30:02','$2y$12$lAdiWHILO9qBH0qKFtny7uH/nSzsY5tbWaDkjLI1Mi8keQq5rPNtC',NULL,NULL,NULL,'admin',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',1),(2,'Trace Lueilwitz','pasquale85@example.org','Andres Paucek','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','aE2JSkbANF',84,'Micheal Yost','Jeff Dach',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(3,'Catherine Fritsch','mills.eveline@example.org','Mrs. Betsy Mohr Sr.','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','UsBwO617Xd',55,'Fatima Johnston','Edmond Renner',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(4,'Jeramie Walker','robb01@example.org','Ms. Freeda Green DVM','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','Eca6WNyfEo',20,'Meda Haley','Leif Wiegand',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(5,'Katharina Hane','koss.dahlia@example.net','Daphne Will','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','eUcU0H7BN6',67,'Macey Hartmann','Gail Bayer',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(6,'Jerry Jones','rogahn.general@example.net','Jaquan O\'Conner','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','SpSzv3Lkwr',100,'Hulda Mills PhD','Mattie Koepp',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(7,'Frederic Russel','qlabadie@example.org','Rodger Haley','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','Iz8Ig6OEES',97,'Prof. Alena Barrows','Liana Wisozk',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(8,'Mr. Carroll Hermiston IV','janis91@example.net','Mrs. Velma McLaughlin','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','AI1S3KDdCh',78,'Eileen Reynolds','Garnett Gleichner',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(9,'Justen Carter','flatley.triston@example.com','Prof. Filiberto Durgan','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','sYVIpa9Cke',94,'Shana Miller','Stanley Huel',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(10,'Iliana Hyatt PhD','vwalsh@example.com','Jarod Konopelski','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','KpJEt8rVf3',21,'Tressa Jones','George Nienow DVM',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(11,'Caleigh Carroll','maeve.schiller@example.org','Prof. Marge Littel Jr.','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','MKtvf0zEjO',77,'Mr. Clovis Roob MD','Adonis Hessel',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(12,'Leann Olson PhD','dorcas32@example.com','Kristoffer Welch','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','7RaNoWCvi7',90,'Berenice Schaefer','Mrs. Abigale McDermott',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(13,'Alejandrin Bernhard','maia45@example.net','Maximo Gusikowski','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','DNdqXBXOSe',58,'Jalyn Cronin','Nickolas Pagac',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(14,'Rusty Rice','hayes.marjory@example.com','Landen Lebsack','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','4ZiA3Rvxue',91,'Lynn Huel','Elvera Effertz',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(15,'Mr. Jeromy Considine MD','ziemann.mara@example.org','Kayden Gutmann','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','j75URS34Ot',52,'Loyce Kiehn','Destinee Lesch',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(16,'Dr. Laurel Koch','leopoldo.okeefe@example.com','Vince Hodkiewicz','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','jG7UpVxr0P',49,'Diana Raynor','Dr. Garrett Pacocha',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(17,'Edmond Cartwright','amber28@example.org','Prof. Sterling Heaney PhD','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','Tl6vo2cVpl',67,'Prof. Stephen Ziemann','Evalyn Stehr PhD',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(18,'Helena Marvin','volkman.rudy@example.org','Mrs. Joannie Satterfield I','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','0Sc0rMLbdp',24,'Sylvan Weimann','Carson Klocko',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(19,'Justina Kiehn Jr.','darius00@example.com','Mr. Monte Pfeffer','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','ukBJH6wwzN',40,'John Kris','Mrs. Rhoda Bahringer',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(20,'Anika Bauch Sr.','gusikowski.elvie@example.com','Mrs. Cheyenne Frami','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','H62Jl4zi3o',12,'Beaulah Volkman','Freddie Boyle III',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(21,'Cathrine Mosciski Jr.','freida33@example.net','Kendall DuBuque','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','gVORg6SRLA',59,'Wilton Gutkowski Sr.','Prof. Edward Legros MD',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(22,'Dr. Kelvin Mann V','littel.annie@example.net','Minnie Connelly','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','IXPsTITXgX',84,'Waldo Lehner','Miss Autumn Huels Jr.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(23,'Dr. Myrl Durgan','modesto03@example.org','Hailey Fritsch','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','kJPjDw0SxR',47,'Lucie Daniel','Prof. Clotilde Fahey PhD',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(24,'Dandre Torphy','rigoberto18@example.org','Cristopher Jerde','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','leBLDC2x17',15,'Rory Schimmel','Sandy Brekke',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(25,'Mrs. Piper Friesen','linnea.zulauf@example.org','Dr. Lola Dooley','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','NlafQnRrTn',36,'Walter Walker DDS','Billie Pfannerstill DVM',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(26,'Destiny Marvin','ichamplin@example.org','Raleigh Stanton','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','bsl5W0ckFS',71,'Adaline Dare DVM','Lilyan Collier',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(27,'Urban Blanda','bboyle@example.com','Gisselle Davis','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','kdQYNB1UP4',18,'Mrs. Zetta Reinger','Prof. Georgiana Kerluke Jr.',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(28,'Dr. Jaclyn Pacocha','ole33@example.com','Sofia Huels','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','VDltFN0jl0',61,'Francesca Stanton III','Ms. Brisa Hermann',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(29,'Jorge Mills','agustina.mayert@example.org','Cordie Rau DDS','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','akQmF4Nb27',38,'Mr. Giovanny Gibson','Alexandro Pouros',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(30,'Kamron Jast','cummings.summer@example.com','Prof. Diamond O\'Reilly PhD','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','KQnfMyEuhj',1,'Ms. Bert Reichel','Zachariah Nolan',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(31,'Prof. Tyrell Kihn','olin.halvorson@example.org','Miss Maya Langworth Jr.','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','DdATP8gw8O',58,'Reginald Rogahn','Ms. Cleora Goyette',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(32,'Allison Russel','lauryn02@example.net','Cecilia Welch','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','LonD3bRSFC',4,'Neha White','Noemy Braun',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(33,'Dr. Ubaldo Brakus V','elmo.treutel@example.com','Prof. Greyson Bartoletti II','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','ZuYpKc4kwR',5,'Pinkie Hauck','Moises Bergnaum',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(34,'Ernest Runte','gusikowski.immanuel@example.net','Marion O\'Hara','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','wptjHI6N4z',34,'Kamren Feil','Virgie Greenfelder IV',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(35,'Charity Reynolds I','august44@example.net','Merl Skiles','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','9Zmiy337YS',27,'Shanny Orn','Mr. Omari Fritsch',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(36,'Prof. Ahmed Kshlerin','abbey60@example.org','Lavern Rodriguez DDS','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','WNkxtTJh4m',46,'Prof. Hilma Larkin PhD','Dr. Jed Schowalter',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(37,'Kayli Hills','aspencer@example.com','Prof. Jamey Wisoky','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','6sFHaYvk5h',62,'Rod Dibbert Jr.','Braden Corkery DDS',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(38,'Wilfred Kertzmann','ila.schoen@example.org','Ms. Molly Schmitt PhD','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','1ENdQAyb7x',15,'Rhianna Ebert','Marcellus Mosciski',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(39,'Madison Schaden','wklein@example.com','Felton Armstrong Sr.','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','YU2rvvrC3q',56,'Hettie Roberts','Jamarcus Ziemann',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(40,'Ila Stiedemann','austen.vandervort@example.net','Tara Goodwin','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','hZH2MH8VGI',2,'Ayden Nitzsche MD','Celine Mills',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(41,'Nathen Blanda','leatha.becker@example.org','Robert Lehner','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','DGBXasNROV',17,'Germaine Romaguera','Verona Rosenbaum',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(42,'Geoffrey Kerluke','josefina92@example.net','Dallas Leuschke','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','26cen3O3ze',67,'Marvin Runolfsdottir','Landen Bauch',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(43,'Bell Hodkiewicz II','dubuque.dedric@example.org','Christina Walter','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','jtffH9tKjJ',7,'Johnathan Wintheiser','Mike Goodwin',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(44,'Miss Myrna Fahey DVM','bergstrom.mia@example.org','Janiya Wisoky','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','UfF0DgvWHs',87,'Prof. Rowan Okuneva I','Mr. Johnathan Friesen',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(45,'Dr. Dorthy Shields DVM','pshanahan@example.net','Carley Langosh','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','Wy8fiM2FPr',53,'Adriana Mueller','Keon Jenkins',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(46,'Christopher Denesik V','terrill.weber@example.org','Drew Quigley','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','k0kTAryTYN',61,'Citlalli Wehner','Amelie Hansen',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(47,'Dr. Lulu Anderson','chanelle38@example.org','Jarrell King','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','8qer9NFlqJ',81,'Hermina Kunde','Dr. Danika Brakus PhD',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(48,'Fletcher Murphy','regan84@example.net','Sarai Will','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','yWedH8Y8BC',13,'Dr. Kelsie Grant','Prof. Alexandrine Cartwright',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(49,'Prof. Hank D\'Amore','ztowne@example.com','Allie Kub','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','fgZ0OcGoBb',14,'Cruz Mraz','Prof. Brooklyn Zulauf',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(50,'Ruben Hill','viva91@example.com','Janick Doyle MD','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','EWlIWud5Lw',30,'Edwina Gislason','Miss Candida Gerlach',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(51,'Prof. Vernie Lang DVM','ltreutel@example.org','Ruthe Daugherty','2026-09-04 01:30:03','$2y$12$Dg1BntlnVYqgj77uSGYZZOw1cgXtPx19eNZZKJ8z7Tl4UCi6KJ.tm','E3GwJotH70',68,'Frances Gottlieb','Brandy Cronin',NULL,'2026-09-04 01:30:03','2026-09-04 01:30:03',0),(52,'usuario_name','usuario@email.com','perfis/HUU7kC9ElPyGn77LsZcv2SdMFhCE6lRJGUfoTirq.png','2026-09-04 01:30:54','$2y$12$vsmh006da0If1sEK1GRt/ev64RDyo23KGTQhIFRyr1BzywnzIsmRa',NULL,23,'Greta Durgan','usuario_user_name',NULL,'2026-09-04 01:30:47','2026-09-12 05:28:05',0),(53,'teste','teste@email.com','https://res.cloudinary.com/ebwyqpkm/image/upload/v1789882097/perfis/rx6cqp2eefwp6kjbehmt.png','2026-09-13 02:18:15','$2y$12$8ovmoqV1ak21s5pI/Pj8wOrnfptHwiPF/0iru0pNWF38d4G26U/X6',NULL,NULL,NULL,'teste',NULL,'2026-09-12 15:15:14','2026-09-20 08:28:17',0),(54,'teste2','teste2@email.com','perfis/82VgyxxSCq6K47i6q0BOLes3U69p8HzWgdq6bRDh.png','2026-09-13 03:48:37','$2y$12$gR.TwqnxaNI2qeCQzHxI2OUqsPp.Npdp/kTENQv3GEwdqDWmoMv/y',NULL,13,'formiga','teste2',NULL,'2026-09-13 03:48:27','2026-09-13 03:49:21',0),(55,'teste3','teste3@email.com','perfis/uDs7Y4uirKiPEN0d6wXz0xAFzWuOB5eWhfi9a2rl.png',NULL,'$2y$12$mmIFxsY9WCfeFxefNmOeQu/ji85xl4GuHTomvoJJaDPeI79ja5.Wi',NULL,14,'capital','teste3',NULL,'2026-09-13 03:50:20','2026-09-13 03:50:20',0),(56,'teste4','teste4@email.com','https://res.cloudinary.com/ebwyqpkm/image/upload/v1789882047/perfis/e1wvucv8qvla1kkvv4e9.png','2026-09-20 08:27:11','$2y$12$PQvAhUq/9mghomPrwyTO/eqqQQrm6nz2q0aKQaahiR3zzQGId15Ya',NULL,32,'jabuticaba','teste4',NULL,'2026-09-20 08:27:03','2026-09-20 08:27:28',0);
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

-- Dump completed on 2026-09-20 16:35:58
