CREATE DATABASE  IF NOT EXISTS `fitflow` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fitflow`;
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: fitflow
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.2

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
  `treino` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordem` int NOT NULL,
  `qntdSeries` int NOT NULL,
  `qtndRep` int NOT NULL,
  `peso` decimal(6,2) DEFAULT NULL,
  `descanso` int DEFAULT NULL,
  `descricao` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercicio`
--

LOCK TABLES `exercicio` WRITE;
/*!40000 ALTER TABLE `exercicio` DISABLE KEYS */;
INSERT INTO `exercicio` VALUES (1,'Tre Langworth V',16,10,27,NULL,NULL,'Hic culpa labore voluptate accusantium exercitationem.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(2,'Vance Upton',22,3,18,NULL,NULL,NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(3,'Amos King',12,7,7,NULL,NULL,NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(4,'Elmira Klocko',15,8,12,NULL,NULL,NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(5,'Mr. Carlos Bradtke II',5,4,10,4025.75,NULL,'Nostrum ullam odit et numquam iste facere velit.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(6,'Edwin Ondricka',11,4,14,4067.98,NULL,NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(7,'Jaida Hoppe',5,2,30,NULL,NULL,'Alias enim accusantium fugit sapiente illo.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(8,'Janis Bauch',19,7,15,3888.47,NULL,'Deleniti at possimus ut voluptatem tenetur quia eligendi.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(9,'Celestine Bogisich',22,12,8,7459.43,NULL,'In qui eius voluptatum incidunt veritatis sunt.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(10,'Annette Kuhn',18,11,30,NULL,NULL,'Totam dignissimos amet sint aperiam.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(11,'Travis Strosin IV',5,9,21,NULL,NULL,NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(12,'Consuelo Friesen IV',25,4,11,7526.43,NULL,NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(13,'Edd Feil IV',8,4,18,7648.75,NULL,NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(14,'Caroline Parisian',19,5,8,NULL,NULL,'Fuga eos unde doloremque in.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(15,'Ervin Jaskolski IV',19,7,14,NULL,NULL,NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(16,'Mr. Kamren Kreiger',25,12,11,9560.12,NULL,'Sunt velit aut aut.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(17,'Oswaldo Konopelski',12,11,5,NULL,NULL,'Pariatur in sed et quos in sit et libero.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(18,'Prof. Gus Berge DVM',7,2,5,NULL,NULL,'Et consequatur harum adipisci ab harum.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(19,'Mrs. Gregoria Schroeder IV',11,8,25,3825.49,NULL,'Est omnis delectus temporibus cupiditate deserunt quaerat non totam.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(20,'Denis Turner',4,8,4,1745.90,NULL,'Doloremque optio laborum eius et et adipisci.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(21,'Anderson Kuphal',6,6,13,NULL,NULL,NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(22,'Sebastian Ortiz',24,5,20,NULL,NULL,'Repellat soluta sit aut molestias.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(23,'Jarred Schiller',11,8,2,6930.98,NULL,NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(24,'Mr. King Raynor',3,12,13,NULL,NULL,'Ea soluta rerum sint dolores repellendus expedita odio.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(25,'Dr. Verner Wiza',21,1,9,NULL,NULL,'Nesciunt fuga nobis ex.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(26,'Miss Flavie Zboncak Jr.',13,3,15,NULL,NULL,'Facilis natus deleniti temporibus reprehenderit.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(27,'Dawn Zboncak PhD',14,9,11,2873.80,NULL,NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(28,'Giuseppe Jenkins IV',13,11,17,6874.72,NULL,NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(29,'Harry Schamberger',6,1,13,NULL,NULL,NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(30,'Isabel Ritchie',7,10,27,2417.06,NULL,'Eaque repellat maiores iusto et nihil.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(31,'Felix Cruickshank',15,8,18,956.17,NULL,'Cupiditate velit sint deserunt voluptate est hic voluptatem.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(32,'Prof. Alessia Grant I',19,12,26,NULL,NULL,'Sapiente et nesciunt quia impedit veritatis qui fugiat libero.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(33,'Susana Ernser',22,10,16,5601.57,NULL,'Et dolores maiores voluptatem non commodi.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(34,'Kirstin Goodwin III',7,4,15,NULL,NULL,'Laudantium enim laborum numquam sint quia.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(35,'Abdul Kemmer',21,3,3,5643.37,NULL,'Voluptas ut possimus sunt accusantium voluptatum similique debitis culpa.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(36,'Prof. Randall Ebert',9,8,18,NULL,NULL,NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(37,'Theodora Miller PhD',8,9,2,NULL,NULL,NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(38,'Alayna Ratke Sr.',5,2,26,NULL,NULL,NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(39,'Ephraim Crona',9,5,12,NULL,NULL,'Culpa asperiores voluptatem ducimus assumenda ea ut voluptate aperiam.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(40,'Joshua Boyer DDS',9,4,17,NULL,NULL,'Quos voluptatem voluptas sint est commodi necessitatibus consequatur.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(41,'Miss Kaylah Upton DVM',13,5,17,NULL,NULL,NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(42,'Marlee McClure',3,7,20,493.91,NULL,'Similique est ab illum aliquid non sequi quas.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(43,'Kyla Durgan',10,2,27,5505.22,NULL,NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(44,'Blake Schuppe',13,9,17,NULL,NULL,'Mollitia fugiat et provident dignissimos.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(45,'Prof. Logan Bradtke Sr.',7,11,23,NULL,NULL,NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(46,'Dr. Otho Torphy V',21,10,15,NULL,NULL,NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(47,'Dr. Ivory Reichel Jr.',3,3,5,4401.56,NULL,NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(48,'Paxton Kirlin',5,9,23,1170.68,NULL,'Voluptate perferendis cum nesciunt.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(49,'Ilene Morissette',21,11,23,NULL,NULL,NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(50,'Demetrius Beahan',14,1,9,NULL,NULL,NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25');
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
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL,
  `descricao` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ficha_name_unique` (`name`),
  KEY `ficha_user_id_foreign` (`user_id`),
  CONSTRAINT `ficha_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha`
--

LOCK TABLES `ficha` WRITE;
/*!40000 ALTER TABLE `ficha` DISABLE KEYS */;
INSERT INTO `ficha` VALUES (1,44,'Immanuel Schamberger','2021-06-04','2000-05-24','Vel iusto in qui id.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(2,40,'Delphia Luettgen','2006-11-08','1999-05-14','Nam voluptatem sit eligendi.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(3,47,'Ms. Georgette Jenkins DVM','2014-03-25','1996-11-22',NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(4,15,'Wilber O\'Keefe DDS','2023-10-23','2014-10-02','Voluptas quia dignissimos itaque.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(5,25,'Jessika Bechtelar PhD','1986-02-06','1980-12-10',NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(6,26,'Kasey Walter IV','1987-11-02','1996-04-19','Dolore voluptatem tempora aliquam et et quibusdam ut asperiores.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(7,17,'Whitney Borer','2015-02-14','2014-05-15',NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(8,17,'Miss Lisa Dietrich','2011-02-03','1992-08-31','Voluptate quae neque cupiditate.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(9,46,'Dr. Lilian Heller','2001-12-17','1995-01-07','Excepturi officiis ut ut quo ad perferendis voluptatem.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(10,18,'Alexanne Collier','1985-06-30','1992-12-24',NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(11,32,'Carlie Brekke','1979-05-08','1982-09-12','Sit est pariatur iure tempora consectetur nemo.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(12,16,'Miss Joanny Jenkins','2024-06-28','2013-03-07',NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(13,30,'Vena Thiel','2002-11-12','2017-08-25','Nihil possimus qui expedita incidunt.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(14,34,'Enrique Mohr','1979-08-02','1993-04-02',NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(15,46,'Toney Kiehn','2013-06-09','2007-01-10','Cum magnam recusandae quia ea enim natus.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(16,16,'Mia Wuckert','1992-03-13','1996-05-27','Provident quia inventore et dolor aut.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(17,43,'Leif Walter','1994-08-01','2013-08-03','Tenetur qui ad repellendus sed ipsam sit.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(18,27,'King Daniel Jr.','1979-10-20','1984-12-10','Autem quia ipsum esse est eum velit voluptas in.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(19,4,'Prof. Makenna Hane DVM','1992-09-02','1990-04-15','Numquam voluptatem error voluptates ab non eos deleniti sit.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(20,6,'Dr. Eleanore Hagenes','1978-02-07','1985-05-22','Ex est quis rem suscipit soluta.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(21,41,'Dangelo Breitenberg','2006-08-20','2015-03-28',NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(22,42,'Gonzalo Parker','2004-03-28','2026-04-19',NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(23,26,'Prof. Braden Kling I','1988-06-29','1970-10-26','Nobis doloribus delectus est tenetur et tempora.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(24,47,'Ulises Sawayn','1994-09-10','1984-05-22',NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(25,19,'Angelo Baumbach','2009-08-08','1997-06-28','Accusamus distinctio sed autem ipsum qui deleniti.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(26,42,'Jess Quitzon','1988-08-27','2005-01-23',NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(27,29,'Wayne Zemlak IV','1986-05-16','2007-05-14','Velit amet eaque qui explicabo accusamus suscipit dignissimos quia.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(28,17,'Ms. Alivia Rempel Sr.','1980-04-26','1995-02-11',NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(29,16,'Ms. Ernestina Sporer','1986-12-24','1993-03-25',NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(30,44,'Ivy Kertzmann','1983-08-28','2004-05-20',NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(31,35,'Alaina Runolfsson I','1996-01-06','1978-07-22','Veritatis magni labore natus.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(32,3,'Keven O\'Connell III','2007-12-06','1992-05-23',NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(33,13,'Ms. Bailee Gusikowski III','1984-02-07','1995-06-22','Libero dolores deserunt velit aspernatur aut enim.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(34,16,'Timmy Ebert','2004-09-15','1970-05-28','Dicta eius quis placeat vel voluptas consequatur ut.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(35,45,'Izaiah Schiller','1980-07-06','1994-03-07','Eum alias commodi architecto dolorum aut dolor.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(36,14,'Parker Hegmann','2009-03-18','1997-12-19','Placeat rerum architecto autem exercitationem ipsum non ut.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(37,25,'Audrey Wintheiser PhD','1980-01-02','1987-08-11',NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(38,2,'Junius Nikolaus','1973-09-15','2010-07-04',NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(39,11,'Rowena Fisher PhD','2001-12-27','1985-03-29','Minus accusamus et odit.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(40,18,'Kristin Langosh','1977-11-11','2002-06-30','Voluptate qui consequuntur consequatur quisquam laboriosam.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(41,27,'Adelia Runolfsson','1972-09-11','2004-04-06',NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(42,5,'Coby Medhurst','1990-10-04','1972-02-09','Et illo et tempore.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(43,12,'Ms. Cynthia Dicki DDS','1996-08-15','1997-05-23','Quia cumque non provident vero quia.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(44,20,'Tillman Prosacco','1988-10-14','2024-01-04','Reprehenderit et qui modi quae sed delectus ut.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(45,17,'Jaime Ernser III','1976-11-17','2020-06-10',NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(46,27,'Mrs. Delpha Russel','1986-06-14','2012-07-11',NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(47,37,'Eloisa Jacobs','2013-11-24','1989-02-14','Accusantium vel ut neque cumque nam.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(48,26,'Jordyn Stokes','1971-07-04','2018-04-18',NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(49,41,'Mrs. Julianne Nienow','1980-04-10','2022-06-11',NULL,NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(50,23,'Kenyatta Corwin II','2020-12-06','2019-03-09','Quidem et voluptatem quidem veritatis enim.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25');
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
INSERT INTO `ficha_exercicio` VALUES (28,28,'seg',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(25,3,'ter',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(48,29,'qui',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(43,31,'sex',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(34,22,'dom',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(17,34,'seg',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(10,19,'qua',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(49,25,'qui',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(48,6,'dom',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(10,5,'sex',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(49,36,'seg',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(17,1,'sab',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(48,47,'sab',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(21,4,'seg',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(20,37,'ter',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(49,45,'ter',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(24,13,'dom',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(15,30,'dom',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(27,20,'sex',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(2,34,'ter',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(48,39,'dom',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(25,7,'qua',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(40,41,'dom',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(35,14,'ter',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(49,24,'ter',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(41,43,'sab',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(1,17,'qui',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(26,49,'ter',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(39,39,'ter',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(26,32,'ter',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(41,33,'qui',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(8,20,'sex',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(36,26,'sab',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(4,17,'ter',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(39,27,'ter',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(50,4,'qua',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(18,4,'dom',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(2,6,'ter',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(43,44,'ter',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(48,36,'dom',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(25,7,'qui',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(12,40,'seg',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(47,16,'ter',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(41,20,'sex',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(37,20,'sex',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(50,48,'qui',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(49,11,'qua',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(31,41,'qui',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(8,41,'sab',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(43,48,'sab',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_04_24_172039_ficha',1),(5,'2026_04_24_172226_exercicio',1),(6,'2026_04_24_172317_ficha_exemplo',1);
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
INSERT INTO `sessions` VALUES ('unf3vIc6h7HV6ACpbzJNEvFMBRSTCHLw69vGIdaa',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','eyJfdG9rZW4iOiIxbURpUndQQmllN0VRVVE2Mkp0MnBRZzdYbkx2RXZ0UUNKTXlwbTRtIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwIiwicm91dGUiOiJ3ZWxjb21lIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1780797060),('voJQnxcht0KdMZ6jaHISn0BbbQ5rH9vcG90fLnPV',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','eyJfdG9rZW4iOiJWN3U0V0U0YW92ZlU2cmV3TkxXd0JTc2VSOWJ5bDBCNmZpaVJabmREIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwIiwicm91dGUiOiJ3ZWxjb21lIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1780841513);
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
  `urlImage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'userSemImg',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idade` int unsigned DEFAULT NULL,
  `cidadeMora` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_user_name_unique` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Elenora Maggio DVM','stella43@example.net','Erick Schmeler','2026-05-01 21:40:24','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','PxgRjJqknA',18,'Mrs. Kathryne Koelpin','Prof. Marianna Howe',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(2,'Davonte Simonis','kale.marvin@example.net','Ms. Mikayla McGlynn','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','xiJGkdTZLN',12,'Zelda Sawayn','Jerry Kuvalis',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(3,'Dr. Ariel Macejkovic MD','isaiah18@example.net','Prof. Elbert Bernhard','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','uD4zP4xCZH',80,'Ms. Rachael Boehm','Melyssa Effertz',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(4,'Sandra Schaefer','lyla96@example.net','Mr. Deangelo Collins PhD','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','QJaGWFZ1or',96,'Friedrich Haag','Aaliyah Ankunding',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(5,'Dr. Constance Greenholt IV','jacinthe.gislason@example.net','Dagmar Purdy','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','EWRzAn6Riu',70,'Walton Macejkovic','Maddison Kuhlman',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(6,'Ms. Francesca Nolan','creilly@example.org','Maritza Gislason','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','9lLQlW5FZo',75,'Ashlynn Schmeler','Colleen Leffler',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(7,'Jadyn Hayes','obartoletti@example.com','Chance McCullough PhD','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','OGI3HiopXx',18,'Frederic Walter','Dr. Lyric Jacobson Sr.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(8,'Diego Rogahn','alueilwitz@example.com','Brannon Nikolaus','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','zSflnt8Np1',4,'David Gislason','Gay Watsica',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(9,'Declan Bernhard','hessel.kaleb@example.com','Lonie Vandervort','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','nlr9mH3gXK',99,'Makenna Block','Clementine Cormier',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(10,'Hertha Sauer','yfriesen@example.org','Ethelyn Purdy I','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','odBDIMIzDx',24,'Dr. Nils Purdy','Layne Dach Jr.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(11,'Georgette Schiller IV','sharris@example.org','Lempi Funk','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','YzgB6q65fn',32,'Prof. Reba Abernathy','Jesus Prosacco',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(12,'Ardella Sawayn','nico.ohara@example.com','Cordie Fisher','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','GU0YQsK4NS',6,'Ryann Kovacek','Talon Muller',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(13,'Ms. Mae Mitchell','bruen.shaun@example.com','Jewell Wolf','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','P8rDe3RxeM',33,'Mrs. Brisa Lueilwitz','Shaylee Hickle',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(14,'Walter Mayert','elijah.kozey@example.com','Dr. Caterina Gutkowski','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','QKoN02DRbN',82,'Guillermo Effertz','Hilbert Abernathy',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(15,'Lillian Cremin','cpurdy@example.org','Richard Dietrich','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','ynxggyTIB6',6,'Dr. Zackery Lowe','Mckenzie Terry I',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(16,'Joshua Feeney','vincent04@example.net','Mackenzie Larson IV','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','1CQ6xGAceu',56,'Rose Cruickshank','Demond Zulauf',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(17,'Antone Mertz','clifford99@example.org','Karli Friesen','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','cR1tCLRRsq',68,'Rod Pfeffer','Laurie Yundt',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(18,'Dr. Nigel Denesik','kilback.delaney@example.net','Ms. Cynthia Marks MD','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','OwaFVmVEKD',76,'Anjali Altenwerth','Mr. Jaylin Spinka PhD',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(19,'Sheldon Pfeffer','monique19@example.net','Modesto Sporer I','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','b5E68MWSNw',89,'Stephen Hackett V','Dr. Larue VonRueden I',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(20,'Dr. Elvera Cartwright','daugherty.carmelo@example.net','Bernita Hansen','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','EtRHVCI0pV',88,'Mya Spinka I','Armand Carter',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(21,'Eleanore Harris','nschoen@example.com','Alexandre Nolan','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','AZLUZOo6LI',94,'Guadalupe Schneider','Dr. Alf Hand IV',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(22,'Brandy McDermott','gsimonis@example.com','Ms. Mittie O\'Keefe Jr.','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','gIaSuu5G4p',43,'Prof. Gaston Wehner I','Daphne Becker',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(23,'Dr. Amely Gislason','ihaley@example.com','Prof. Cruz Weissnat','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','0dsOiaa5TL',87,'Erik Johnson','Mrs. Ardith McDermott II',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(24,'Selmer Leuschke','corwin.ezekiel@example.com','Friedrich Kuhn II','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','NSg1o6ByW0',64,'Alison Walsh','Darlene Mitchell',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(25,'Ms. Pinkie Dibbert PhD','nicolette02@example.com','Adella Dibbert I','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','pgOvjwnQ5k',66,'Dr. Ed Larson','Hilda Erdman',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(26,'Prof. Marlon Schneider','ukiehn@example.org','Dr. Camilla Carter I','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','cFdDa5o1ti',19,'Mrs. Shayna Runolfsdottir PhD','Leon Spinka',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(27,'Mrs. Betsy Reichert I','erna.hegmann@example.com','Delphine O\'Reilly','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','nJxauo89AI',65,'Dr. Alexane Kuhic IV','Prof. Otha Hettinger IV',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(28,'Mr. Josue Breitenberg','harold88@example.com','Ms. Kaycee Doyle II','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','aPCbodLUAM',8,'Josiah Koelpin','Ms. Sarai Altenwerth',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(29,'Jasmin Ziemann','waters.ladarius@example.com','Mr. Javonte Prosacco I','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','k9encalgQi',33,'Madisen Goyette III','Derrick Crona II',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(30,'Miss Maeve Conroy','lkub@example.net','Haven Schaefer','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','CuS7GT6ScX',18,'Mrs. Susie McClure','Bernadine Pouros',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(31,'Irma Roberts','ayla42@example.org','Antone Reichert','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','i5gx7AqMG9',25,'Brannon Walter','Cleveland Beer I',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(32,'Prof. Edwin Harber','pamela.kautzer@example.net','Gabriel Rippin','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','C9IzuuKkiw',99,'Kayla Windler','Johan Lindgren',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(33,'Caleb Cummings','oconner.baby@example.com','Ms. Mina Maggio PhD','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','teYV3C2snO',78,'Mason Rolfson','Rosalee Hill II',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(34,'Ms. Marie Senger','wilkinson.astrid@example.org','Peyton Jaskolski','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','dW7ADZ79QE',51,'Ana Beahan','Miss Tara Kshlerin MD',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(35,'Charley Romaguera','merritt.schaden@example.net','Aglae Renner','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','z8slpeZHuM',90,'Arnaldo Hamill','Ethyl Deckow',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(36,'Conrad Paucek','jones.luther@example.com','Hal Kuphal','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','N5OAphiDMW',85,'Ursula Goyette','Camylle Willms',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(37,'Santos Walsh','raymundo47@example.org','Caterina Torphy','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','LqYA2YjgG3',74,'Prof. Bartholome Jacobi','Rick Graham',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(38,'Dr. Michale Turner IV','prunolfsdottir@example.net','Griffin Hoppe','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','y052LT8MdW',49,'Prof. Cooper Larkin','Faye Aufderhar',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(39,'Dr. Rocio Crona PhD','katlyn.hyatt@example.org','Rosamond Armstrong PhD','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','NPcBN56uvo',5,'Prof. Clovis Muller','Abner O\'Kon',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(40,'Lisandro Breitenberg','roberto.jacobi@example.net','Prof. Weldon Kertzmann Sr.','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','II7CDL1wAW',34,'Dr. Myriam Stroman DVM','Marge Vandervort Sr.',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(41,'Holly Anderson','amarks@example.org','Gene Zboncak I','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','t9SpV5LaHC',87,'Vicenta Wisozk','Janae Hammes',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(42,'Prof. Kiera Flatley','greg94@example.com','Otha Hudson','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','WESMcuRclv',21,'Cristobal Lebsack MD','Braden Bins',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(43,'Dominique Stokes','rutherford.junius@example.org','Prof. Bethel Green III','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','cw1neK54An',28,'Chris Franecki','Roel Rau V',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(44,'Johathan Schoen','zemlak.maxine@example.com','Mr. Al Mills','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','X80DvUE5YZ',23,'Dr. Nicklaus Jacobi III','Thomas Jacobs DVM',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(45,'Isidro Cormier','scotty.farrell@example.org','Era Wolff','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','4fBPiMa3oj',35,'Maeve Cruickshank','Wiley Boyle',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(46,'Lilian Hilpert','uschoen@example.com','Henriette Schowalter','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','t8FQ5tGYxw',72,'Yessenia O\'Conner','Annabell Jenkins',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(47,'Maye Blanda','dbeer@example.com','Orlo Parisian II','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','BeOfaMGDHt',39,'Adelia Spinka','Evert Gutmann',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(48,'Leda Cormier','qemmerich@example.com','Rosanna Cremin','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','z2X2ehfF3g',45,'Clemens Considine','Merlin King',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(49,'Dr. Bret Brown II','murazik.norberto@example.org','Miss Janis Leffler','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','akQXwvdXtY',42,'Ms. Kasey Renner II','Prof. Jany Ondricka III',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25'),(50,'Jamey Schaden','madonna72@example.net','Ms. Florida Lehner','2026-05-01 21:40:25','$2y$12$NILhPZr3oZJybuEPTHFkJOqOMidFJKUbo.FIiAeHH7yIYw6DSRDPS','ctuGR55DGU',87,'Mrs. Ariane Veum Sr.','Ryann Hills DDS',NULL,'2026-05-01 21:40:25','2026-05-01 21:40:25');
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

-- Dump completed on 2026-06-07 11:29:10
