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
INSERT INTO `cache` VALUES ('fitflow-cache-54ceb91256e8190e474aa752a6e0650a2df5ba37','i:2;',1784322853),('fitflow-cache-54ceb91256e8190e474aa752a6e0650a2df5ba37:timer','i:1784322853;',1784322853),('fitflow-cache-5a5b0f9b7d3f8fc84c3cef8fd8efaaa6c70d75ab','i:1;',1784425347),('fitflow-cache-5a5b0f9b7d3f8fc84c3cef8fd8efaaa6c70d75ab:timer','i:1784425347;',1784425347),('fitflow-cache-667be543b02294b7624119adc3a725473df39885','i:2;',1784336221),('fitflow-cache-667be543b02294b7624119adc3a725473df39885:timer','i:1784336221;',1784336221),('fitflow-cache-6c1e671f9af5b46d9c1a52067bdf0e53685674f7','i:1;',1784601889),('fitflow-cache-6c1e671f9af5b46d9c1a52067bdf0e53685674f7:timer','i:1784601889;',1784601889),('fitflow-cache-8effee409c625e1a2d8f5033631840e6ce1dcb64','i:1;',1784263443),('fitflow-cache-8effee409c625e1a2d8f5033631840e6ce1dcb64:timer','i:1784263443;',1784263443),('fitflow-cache-9109c85a45b703f87f1413a405549a2cea9ab556','i:2;',1784322961),('fitflow-cache-9109c85a45b703f87f1413a405549a2cea9ab556:timer','i:1784322961;',1784322961),('fitflow-cache-c5b76da3e608d34edb07244cd9b875ee86906328','i:2;',1784246729),('fitflow-cache-c5b76da3e608d34edb07244cd9b875ee86906328:timer','i:1784246729;',1784246729),('fitflow-cache-e6c3dd630428fd54834172b8fd2735fed9416da4','i:1;',1784592746),('fitflow-cache-e6c3dd630428fd54834172b8fd2735fed9416da4:timer','i:1784592746;',1784592746),('fitflow-cache-supercanal13aaaa4@gmail.com|127.0.0.1','i:1;',1784246697),('fitflow-cache-supercanal13aaaa4@gmail.com|127.0.0.1:timer','i:1784246697;',1784246697),('laravel-cache-a9334987ece78b6fe8bf130ef00b74847c1d3da6','i:1;',1784208766),('laravel-cache-a9334987ece78b6fe8bf130ef00b74847c1d3da6:timer','i:1784208766;',1784208766),('laravel-cache-c5b76da3e608d34edb07244cd9b875ee86906328','i:1;',1784242436),('laravel-cache-c5b76da3e608d34edb07244cd9b875ee86906328:timer','i:1784242436;',1784242436);
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercicio`
--

LOCK TABLES `exercicio` WRITE;
/*!40000 ALTER TABLE `exercicio` DISABLE KEYS */;
INSERT INTO `exercicio` VALUES (1,'Miss Sierra Gaylord',23,6,26,NULL,NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',50),(2,'Gene Brakus',10,1,1,NULL,'Et vel est sit consectetur et voluptate nisi.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',30),(3,'Mr. Mack Veum V',25,12,2,NULL,NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',54),(4,'Lucie Johnston',21,5,3,7633.75,NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',49),(5,'Dr. Loyce O\'Keefe',1,4,17,NULL,'Voluptatem quia cumque reiciendis accusamus.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',42),(6,'Mr. Sydney Grant',7,4,20,4479.55,'Et optio sint autem.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',6),(7,'Daren Lang',22,7,5,NULL,'Voluptas qui molestiae consequatur quisquam qui assumenda.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',21),(8,'Christa Steuber',18,3,10,NULL,'Reprehenderit et alias exercitationem voluptatem eum impedit laudantium.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',32),(9,'Gracie Kuhn III',3,8,2,6812.07,'Dolores repudiandae accusamus reiciendis sint.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',10),(10,'Jany Gerlach',14,7,10,4806.62,'Optio maiores odio dolorem quisquam.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',42),(11,'Dr. Moises Moore',10,9,24,9410.20,NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',14),(12,'Tessie Reinger',24,11,10,NULL,'Non ratione id labore veritatis molestiae pariatur.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',37),(13,'Brandon Conroy V',8,3,30,NULL,'Atque omnis aut qui atque fugiat id aut.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',21),(14,'Kelvin Okuneva',18,3,15,NULL,'Repellendus id omnis qui ut laudantium necessitatibus.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',22),(15,'Ahmad Leffler',21,10,30,4434.96,'Enim quia et est blanditiis ut.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',51),(16,'Leonel Douglas',9,10,4,NULL,NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',30),(17,'Mona Bailey PhD',6,8,4,NULL,'Sapiente est eveniet est odio a.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',43),(18,'Carley Murray',24,10,26,1047.64,NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',55),(19,'Kurtis Kovacek',19,9,26,1182.99,NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',12),(20,'Ms. Isobel Crist',18,3,24,5417.00,NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',34),(21,'Mrs. Vanessa Schneider',23,3,4,4905.31,'Totam perferendis itaque velit expedita quasi unde.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',15),(22,'Ms. Willa Barton DDS',13,10,23,NULL,'Odit sed dolor quisquam debitis dolor occaecati minima.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',25),(23,'Dr. Rowan Lehner Jr.',25,4,12,NULL,NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',54),(24,'Ms. Delpha Bradtke',18,3,5,NULL,NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',51),(25,'Foster Balistreri',23,1,13,5457.69,NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',18),(26,'Dr. Judson Volkman PhD',6,2,23,NULL,NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',13),(27,'Maybelle Schmeler',15,12,28,4862.08,NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',11),(28,'Sheridan O\'Reilly',7,3,3,NULL,'Fugit odit voluptatem eaque aliquam sed ex.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',10),(29,'Miss Precious Bartoletti V',20,2,9,8290.87,'Facere cupiditate et eveniet et eum consequatur repellat.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',28),(30,'Lila Wiza',19,1,27,7121.71,NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',50),(31,'Harrison Swaniawski',1,6,23,NULL,NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',45),(32,'Barrett Nitzsche',24,4,2,8646.35,'Dolorem libero enim aliquam ut dignissimos quaerat.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',51),(33,'Kattie Towne',20,7,30,5970.26,'Illo qui quis quia sed rerum tempore officiis.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',41),(34,'Drew Schmitt',25,9,5,NULL,'Accusantium fugiat quia harum.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',52),(35,'Mr. Mavis Kovacek IV',13,9,1,NULL,NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',17),(36,'Abagail Wiegand',11,4,29,6469.25,NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',13),(37,'Zakary Lowe Sr.',20,8,22,NULL,'Quia pariatur in et repellat et qui necessitatibus.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',7),(38,'Maximillian Goodwin I',16,2,18,9086.67,NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',46),(39,'Nelda Ferry DVM',6,12,14,3453.66,'Reprehenderit ex accusantium modi id.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02',50),(40,'Mr. Vaughn Hamill MD',23,1,30,NULL,NULL,NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03',44),(41,'Sherwood Schmidt',10,9,12,2851.91,NULL,NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03',33),(42,'Teagan Wolff',9,12,23,NULL,NULL,NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03',59),(43,'Aida Senger Jr.',9,3,1,9019.80,NULL,NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03',16),(44,'Omer Corkery',14,6,14,7852.84,'Eius consequatur sit odio eligendi quo sunt corrupti aut.',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03',40),(45,'Arnoldo Stroman IV',16,4,8,NULL,NULL,NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03',55),(46,'Timmy Jenkins Sr.',18,1,10,NULL,'Maxime sit qui velit veritatis illo eos quo.',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03',60),(47,'Aniyah Tillman',17,1,14,6425.83,'Esse consectetur molestiae eos quidem omnis.',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03',3),(48,'Sallie Bradtke',23,11,11,NULL,'Laborum exercitationem inventore culpa in provident.',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03',37),(49,'Therese Hodkiewicz',17,4,16,NULL,'Porro reprehenderit nostrum tempora similique.',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03',60),(50,'Dr. Destiny Douglas II',17,11,14,283.56,NULL,NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03',54),(51,'teste',1,1,22,521.00,NULL,'2026-07-21 02:37:18','2026-07-20 05:53:10','2026-07-21 02:37:18',2),(52,'teste',0,2,12,20.00,'testando','2026-07-21 02:05:10','2026-07-20 07:19:45','2026-07-21 02:05:10',2),(53,'teste2',-2,1,2,NULL,'home','2026-07-21 02:42:35','2026-07-20 09:45:33','2026-07-21 02:42:35',NULL),(54,'teste3',-1,5,12,1.00,'nada','2026-07-21 02:43:28','2026-07-20 10:16:41','2026-07-21 02:43:28',NULL),(55,'teste4',-2,3,12,5.00,'1doaofa','2026-07-21 02:43:30','2026-07-20 20:57:58','2026-07-21 02:43:30',20),(56,'Testando5',1,3,12,20.00,'Testando5','2026-07-21 02:04:16','2026-07-20 21:15:03','2026-07-21 02:04:16',60),(57,'testando6',1,10,23,NULL,NULL,'2026-07-21 02:42:19','2026-07-20 21:22:32','2026-07-21 02:42:19',NULL),(58,'testando6',0,2,3,NULL,NULL,'2026-07-21 02:42:39','2026-07-20 21:23:49','2026-07-21 02:42:39',NULL),(59,'testando7',0,12,3,12.23,'nada','2026-07-21 02:42:40','2026-07-20 21:32:02','2026-07-21 02:42:40',12),(60,'testando8',0,3,12,32.21,'aaaaaaaaaaaaaaaaaa','2026-07-21 02:42:41','2026-07-20 21:32:25','2026-07-21 02:42:41',NULL),(61,'testando9',6,22,222,222.00,'adasdascwa','2026-07-21 02:14:34','2026-07-21 01:06:45','2026-07-21 02:14:34',232),(62,'teste',0,10,20,NULL,NULL,'2026-07-21 02:45:50','2026-07-21 02:43:53','2026-07-21 02:45:50',NULL),(63,'teste2',0,20,30,NULL,NULL,'2026-07-21 02:46:00','2026-07-21 02:44:05','2026-07-21 02:46:00',NULL),(64,'teste3',0,30,40,NULL,NULL,'2026-07-21 02:46:05','2026-07-21 02:44:17','2026-07-21 02:46:05',NULL),(65,'teste4',0,40,50,NULL,NULL,'2026-07-21 02:46:07','2026-07-21 02:45:04','2026-07-21 02:46:07',NULL),(66,'teste5',0,50,60,NULL,NULL,'2026-07-21 02:46:08','2026-07-21 02:45:43','2026-07-21 02:46:08',NULL),(67,'teste',1,3,12,NULL,NULL,'2026-07-21 02:51:34','2026-07-21 02:46:51','2026-07-21 02:51:34',NULL),(68,'teste4',1,4,12,NULL,NULL,'2026-07-21 02:51:34','2026-07-21 02:47:08','2026-07-21 02:51:34',NULL),(69,'especifico',2,3,123,NULL,NULL,'2026-07-21 02:51:34','2026-07-21 02:50:42','2026-07-21 02:51:34',NULL),(70,'especifico2',1,21,31,NULL,NULL,'2026-07-21 02:51:34','2026-07-21 02:50:58','2026-07-21 02:51:34',NULL),(71,'supino',1,3,12,120.00,NULL,NULL,'2026-07-21 03:13:38','2026-07-21 03:13:38',80),(72,'teste',1,1,1,NULL,NULL,NULL,'2026-07-21 05:45:12','2026-07-21 05:45:12',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha`
--

LOCK TABLES `ficha` WRITE;
/*!40000 ALTER TABLE `ficha` DISABLE KEYS */;
INSERT INTO `ficha` VALUES (1,22,'Bailey Farrell Sr.','1981-02-01','2006-11-18',NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(2,16,'Reba Hirthe','1985-06-11','1999-08-22',NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(3,31,'Caden Bradtke','2010-11-30','1989-03-10','Possimus fuga sequi culpa praesentium omnis non dolore quia.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(4,40,'Rafaela Erdman','2017-02-18','1999-04-13','Et eveniet qui ratione nemo harum est et.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(5,38,'Alysa Buckridge II','2014-12-22','1983-02-09','Molestiae veritatis explicabo porro eaque beatae ex sint.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(6,36,'Mossie Fay','1996-12-02','1978-05-11',NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(7,50,'Deondre Senger','2000-10-23','1984-12-12','Eveniet aperiam qui et velit dolor dolorem.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(8,17,'Rhea Haag','1989-12-01','2008-07-11','Rerum ut et excepturi est.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(9,47,'Aidan Waters','1995-09-23','1994-12-28','Sit amet temporibus et ut molestiae voluptatem quaerat.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(10,31,'Rosemary Koepp','1993-07-10','2013-07-06',NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(11,4,'Prof. Derick Bogan','2019-09-22','1977-03-08',NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(12,5,'Ms. Valentina Langworth Sr.','1986-03-25','2008-09-29','Magni dolore quam tempore rerum id impedit.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(13,16,'Corine O\'Conner','2022-07-13','1972-05-07',NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(14,30,'Serenity Dach','2014-11-13','2005-09-18',NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(15,17,'Prof. Silas Wuckert','1971-01-15','2013-09-18','Aliquam voluptate labore quod ut adipisci.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(16,17,'Mr. Dexter Rowe DVM','1996-11-20','2024-10-27',NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(17,46,'Kyler Turner','1996-07-13','2012-09-12','Ut magni fuga aspernatur et velit.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(18,37,'Lupe Donnelly','2017-10-23','2025-08-27',NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(19,42,'Mr. Arno Harvey','2019-08-04','1989-01-18',NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(20,6,'Fernando Durgan','2014-09-01','1987-12-13',NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(21,31,'Ms. Katelynn Littel','2021-10-09','1990-10-18',NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(22,14,'Prof. Wade Gorczany PhD','2007-05-06','1984-02-22',NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(23,11,'Malachi Kuphal Jr.','2005-01-24','2010-04-28',NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(24,33,'Kailey Homenick','2004-02-03','1997-01-30',NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(25,33,'Arlie Balistreri','1985-01-26','1975-10-14','Dolore sed quis blanditiis beatae eligendi.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(26,49,'Prof. Florence Ruecker II','1971-12-15','1987-03-30','Et doloribus fugit iusto qui iusto.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(27,46,'Reed Considine','2008-08-17','2009-08-15',NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(28,27,'Citlalli Wiegand Sr.','2023-11-06','1996-04-23',NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(29,15,'Miss Modesta Kerluke DVM','1977-09-24','2012-05-01','Eos nisi facilis fugiat incidunt.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(30,35,'Johann O\'Reilly','1980-07-28','1971-08-31',NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(31,29,'Johathan Frami','2012-03-14','2004-09-30','Dolores et laborum molestiae et accusamus culpa exercitationem sint.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(32,17,'Cortney Parisian','1980-01-24','1972-04-26',NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(33,33,'Magdalen Franecki','2002-03-26','1979-09-14','Quia quam culpa et.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(34,37,'Rebeca Sipes DVM','1993-10-29','2006-05-11',NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(35,13,'Kennith Littel','1977-09-29','1999-10-31',NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(36,6,'Kevin Olson','2006-08-03','1972-01-21',NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(37,35,'Prof. Catherine Murphy','1989-02-28','1988-04-28','Est sequi id nihil enim.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(38,32,'Sabina Reynolds V','2025-12-12','2005-11-11',NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(39,2,'Chandler Konopelski','1999-07-08','2007-12-19','Ut minima ratione quis consequuntur dignissimos ipsum.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(40,28,'Mrs. Vickie Feeney','1991-11-21','1989-12-19','Maxime voluptatem voluptatum blanditiis autem nihil.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(41,25,'Ronaldo Hahn','2020-01-17','1980-08-29',NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(42,37,'Madeline Koepp','1970-04-12','2011-08-13',NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(43,28,'Prof. Emanuel Mante I','1984-07-25','1979-05-27','Sit ut blanditiis quaerat sit nihil nihil qui.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(44,42,'Chloe Watsica','1974-08-03','1974-01-18',NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(45,33,'Dr. Marianna Metz','1988-02-07','1994-10-18',NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(46,30,'Maryse Hintz','2008-07-25','1986-04-21','Esse quasi eum consequatur.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(47,31,'Dr. Ransom Trantow PhD','2011-07-23','1988-04-10','Voluptate laboriosam quasi consequatur voluptas.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(48,38,'Winifred Hoeger','1988-01-12','1971-10-10',NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(49,37,'Jimmie Gibson','1983-09-18','1972-08-14',NULL,NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(50,31,'Alberto Reynolds','1998-11-22','2016-04-04','Est molestiae natus inventore quo porro eligendi nam.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(51,58,'Hardcore','2026-07-15','2026-07-18','nada','2026-07-21 02:51:34','2026-07-18 08:26:50','2026-07-21 02:51:34'),(52,58,'dificil TryHardaoaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','2026-07-15','2026-07-18','NADAAAAAAAAAAAAAAAAAAAAAAA',NULL,'2026-07-18 08:33:45','2026-07-19 04:30:41'),(53,58,'Hardcore TryHardao DENOVOOO','2026-07-09','2026-07-31','ne',NULL,'2026-07-18 08:34:57','2026-07-18 08:34:57'),(54,58,'teste','2026-07-02','2026-07-16',NULL,'2026-07-18 09:58:06','2026-07-18 09:58:03','2026-07-18 09:58:06'),(55,58,'teste','2026-06-28','2026-07-31',NULL,'2026-07-18 10:14:56','2026-07-18 10:03:52','2026-07-18 10:14:56'),(56,58,'teste','2026-07-06','2026-08-07',NULL,'2026-07-18 10:23:58','2026-07-18 10:23:51','2026-07-18 10:23:58'),(57,58,'teste','2026-07-10','2026-08-08',NULL,NULL,'2026-07-18 10:27:18','2026-07-18 10:27:18'),(58,58,'teste2','2026-07-02','2026-08-01',NULL,NULL,'2026-07-18 10:27:38','2026-07-18 10:27:38'),(59,58,'teste3','2026-07-02','2026-07-25',NULL,NULL,'2026-07-18 10:32:08','2026-07-18 10:32:08'),(60,58,'teste4','2026-06-30','2026-08-08','olaaa',NULL,'2026-07-19 04:01:02','2026-07-19 04:01:02'),(61,58,'teste5','2026-06-28','2026-08-08',NULL,NULL,'2026-07-19 04:01:41','2026-07-19 04:01:41'),(62,55,'Hardcore TryHardao','2026-07-21','2026-07-21','swswswsws','2026-07-19 06:47:33','2026-07-19 06:39:57','2026-07-19 06:47:33'),(63,60,'Hardcore TryHardao','2026-06-30','2026-07-31','nada',NULL,'2026-07-21 03:13:00','2026-07-21 03:13:00'),(64,61,'Hardcore TryHardao','2026-07-06','2026-07-22',NULL,NULL,'2026-07-21 05:44:33','2026-07-21 05:44:33');
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
INSERT INTO `ficha_exercicio` VALUES (7,36,'seg',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(4,29,'qui',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(3,35,'qua',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(22,23,'qui',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(3,50,'sab',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(48,12,'sex',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(47,27,'qui',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(18,24,'qui',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(2,32,'sab',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(13,20,'seg',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(35,30,'ter',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(9,14,'qui',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(50,18,'dom',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(13,35,'dom',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(33,25,'qua',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(45,10,'dom',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(1,6,'sab',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(26,37,'qui',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(43,8,'dom',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(25,13,'ter',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(49,31,'sex',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(14,43,'dom',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(30,46,'sab',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(6,8,'sex',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(4,35,'qua',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(36,17,'sex',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(40,7,'seg',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(32,6,'ter',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(50,26,'dom',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(35,14,'qui',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(4,36,'dom',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(27,28,'seg',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(16,38,'dom',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(14,8,'qua',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(16,36,'ter',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(19,39,'sex',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(28,7,'seg',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(7,23,'seg',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(40,42,'dom',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(28,13,'dom',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(50,30,'sex',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(16,11,'seg',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(43,6,'qui',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(31,33,'sex',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(42,42,'ter',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(44,26,'seg',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(46,15,'dom',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(40,34,'qua',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(43,32,'sex',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(7,7,'seg',NULL,'2026-07-16 16:03:03','2026-07-16 16:03:03'),(63,71,'seg',NULL,'2026-07-21 03:13:38','2026-07-21 03:13:38'),(64,72,'seg',NULL,'2026-07-21 05:45:13','2026-07-21 05:45:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (15,'0001_01_01_000000_create_users_table',1),(16,'0001_01_01_000001_create_cache_table',1),(17,'0001_01_01_000002_create_jobs_table',1),(18,'2026_04_24_172039_ficha',1),(19,'2026_04_24_172226_exercicio',1),(20,'2026_04_24_172317_ficha_exemplo',1),(21,'2026_06_07_143700_adicionar_coluna_descanso',1);
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
INSERT INTO `password_reset_tokens` VALUES ('supercanal13aaa4@gmail.com','$2y$12$5DX4HDkq.zR.HtSUyWGZcu3B/K/LL1X/kxWqKWNOq7z1dxcYCOXye','2026-07-17 02:41:38');
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
INSERT INTO `sessions` VALUES ('0XO2PBjfw89DOWaNzHEidF1Nfi2ZX3EvrM1an2pT',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','eyJfdG9rZW4iOiJJQUlpd1FxYm5nTmNFVlFCNVFFSkVGVGNaMlF2OVFrZHphNWhsOXp6IiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvMTI3LjAuMC4xOjgwMDAiLCJyb3V0ZSI6IndlbGNvbWUifX0=',1784593366),('dlpMqnhBJPba39HEX2av1sXqDvmhlnf2ldJPqAIA',61,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','eyJfdG9rZW4iOiJQQlV6TGdtZUNXaW4yWWRFR1Z1ZmN4RWZUcWd0c1F4dVQzNmNQNm1qIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9maWNoYXNcL2V5SnBkaUk2SWtsak0xWklXVWt6TmpsNGNDdDFWMWN3TDNaUGNuYzlQU0lzSW5aaGJIVmxJam9pV1RFemJITmliV2hpZWtsck5GZDVRa28zYkhJMFp6MDlJaXdpYldGaklqb2lNemszT0RCalpEWmlPR00yT0RFeU56UTROMkpsTTJVMFpERTJaalkzTlRka05HWXlORGhtWWpRNE5UVXpNalJsWldWa05HTm1ZbUpoWkdKbVltTmtNU0lzSW5SaFp5STZJaUo5Iiwicm91dGUiOiJmaWNoYXMuc2hvdyJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX0sImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjo2MSwidXJsIjpbXX0=',1784601921);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_user_name_unique` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Amaya Marks II','wyman.ludie@example.org','Prof. Misael Hilpert','2026-07-16 16:03:01','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','gdFnnN9bjW',79,'Jaylon Larkin','Merl Larson',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(2,'Buddy Sawayn','larue86@example.com','Maye Parisian','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','2vOCq7jnUp',57,'Golden Torphy','Garrett Blick',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(3,'Ms. Maggie Sawayn Jr.','bartoletti.lane@example.org','Lorenzo Trantow','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','V01xe3LciP',16,'Dr. Natalia Turner II','Mr. Pierre Gulgowski',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(4,'Zita Schimmel','jazmyne79@example.com','Prof. Bonita Reinger','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','qtAL8CBcky',41,'Efrain Balistreri','Keira Grady V',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(5,'Conor Borer','dawson.wiza@example.net','Alvina Marquardt','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','ZiGjZlYSPm',55,'Prof. Hadley Rempel DDS','Prof. Darryl Kohler III',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(6,'Eduardo Marks MD','runolfsson.moshe@example.net','Mr. Wilburn Lang','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','uGB25IheIs',3,'Christopher Watsica','Mr. Christop Schneider',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(7,'Zane Schneider','valentine30@example.com','Guy Barrows','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','A3GzHYEoDS',99,'Elmore Zboncak','Melvina Goyette',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(8,'Opal Batz','hollie.effertz@example.org','Maxine Ferry','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','yG2MlksVPC',8,'Willard Oberbrunner','Prof. Nina Leuschke',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(9,'Elnora Langosh','jeremy93@example.net','Dortha Christiansen','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','0nYupjjD9C',98,'Bert Labadie','Garett Kling',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(10,'Giovanna Hansen','witting.izaiah@example.net','Terence Feil','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','WxqmYLwWxF',1,'Marcella McKenzie','Cornell Rohan MD',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(11,'Prof. Westley Feeney PhD','xmorar@example.org','Adonis Farrell','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','x6jJmYzei8',73,'Mrs. Elisabeth Robel III','Ashleigh Williamson III',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(12,'Clarissa Fisher I','emma.lynch@example.com','Prof. Marielle Rodriguez I','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','0HgnIrN1gS',97,'Jayda Ankunding','Colten Fahey',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(13,'Enola Wilkinson','xhammes@example.org','Prof. Cielo Hintz','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','ZSjh5BZBOo',4,'Kaley Lesch','Tiana Krajcik',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(14,'Miss Euna Macejkovic','wehner.tianna@example.net','Agnes Runolfsdottir','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','thDSupEL0S',52,'Emma Zemlak V','Claudine Beatty',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(15,'Kieran Kutch','bartell.felicia@example.org','Dr. Emmie Cormier','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','ueFwwNkF7U',13,'Brycen Bernier V','Yazmin Feil',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(16,'Dayne Welch','ysmitham@example.com','Dr. Abby Farrell I','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','vFkGBXzFdG',4,'Keith Jacobs','Marc Lueilwitz',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(17,'Emmett Schmitt','jayson39@example.com','Vallie Effertz','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','ZvxFlUenE9',6,'Prof. Melany Jones DDS','Kiarra Orn',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(18,'Marquise Dickinson','bosco.collin@example.com','Mrs. Maryjane Kshlerin','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','l7AUiO2F0E',41,'Jaron Prosacco I','Prof. Eliezer Schinner IV',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(19,'Emery Hoppe','donald51@example.net','Carmela Schuster','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','Hni1NHFMrk',95,'Ms. Madonna Von DDS','Mrs. Cleora Jakubowski DVM',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(20,'Prof. Lexie Bednar','corkery.jedediah@example.org','Dr. Jerome Klein','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','nih2JHLT6B',31,'Miss Alaina Volkman','Olen Dare',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(21,'Deontae Baumbach','kaia99@example.net','Onie Flatley','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','si8Ys2rTFG',62,'Martine Wehner PhD','Ms. Camille Schmeler I',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(22,'Kathryn Kerluke','dominique.zulauf@example.com','Herta Ernser','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','K7VzCXwl41',19,'Maureen Will','Jackie Lesch',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(23,'Favian Bogisich Jr.','bsmitham@example.com','Mike Donnelly II','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','n9bvHUnYXG',12,'Else Runte IV','Prof. Tyrel Gaylord II',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(24,'Emelie Moore II','ktorphy@example.net','Madalyn Gutkowski','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','ZrXUniqNqh',88,'Miss Ardella Berge','Dr. Barbara O\'Hara',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(25,'Dr. Dusty Mueller III','blanda.jace@example.org','Prof. Brayan Emmerich','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','FkFcOp7Dg4',81,'Mariane Hintz DVM','Ursula Balistreri',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(26,'Serenity Labadie','kaylee.murazik@example.net','Mrs. Odie Romaguera II','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','YA1GMWtNpa',32,'Pearl Mosciski','Dr. Delores Dickinson MD',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(27,'Raegan Graham','ujacobs@example.com','Leilani Corkery','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','g3fLURRh66',6,'Dr. Velda McKenzie','Heather Rolfson',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(28,'Dr. Athena Kunde I','ydaugherty@example.com','Kole Wunsch','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','TsL9Bic8m2',57,'Hazel Baumbach DVM','Mr. Shayne Sporer',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(29,'Kirk Johns','harley.harvey@example.net','Felipa Ratke','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','C7x78GbIiF',84,'Ben Fadel','Jairo Nitzsche',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(30,'Dr. Nash Hane I','emard.devante@example.org','Leonor Kiehn','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','Oy9VHFqRgE',40,'Kay Kunze II','Chance Littel III',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(31,'Scot Vandervort','nyah.feest@example.net','Ms. Earlene Leffler Jr.','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','LlF9oVcdUg',79,'Bradford Kuhlman','Prof. Brandt Kling',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(32,'Ella Gerlach','hintz.sven@example.net','Dr. Felton Romaguera Sr.','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','HHxAj8Il6P',7,'Shayne Labadie','Everardo Runolfsson',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(33,'Rosario Torp','ydickens@example.com','Jerrod Kutch III','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','lg4OzQLmTD',56,'Dr. Nayeli Kunde','Antone Kozey',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(34,'Marcos Wisozk','carmine79@example.com','Ms. Lucinda Bergstrom MD','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','iNqtxEeeRM',67,'Dr. Izaiah Ondricka','Wilton Marvin',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(35,'Consuelo Parisian','robel.simone@example.net','Loma Barrows','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','8oQStvbkjZ',59,'Kiara Hill','Collin Heidenreich Sr.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(36,'Mr. Demarco Bode','gwilkinson@example.net','Dr. Leanna Hand I','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','j1aPvZzaVB',42,'Linwood Bartoletti Sr.','Rosalind Kreiger',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(37,'Nikki Rolfson','donato.waelchi@example.net','Oceane Lynch','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','QA00MJkBv5',10,'Luciano Kuphal','Christelle Luettgen',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(38,'Vena Olson','alarson@example.net','Mafalda Douglas II','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','Z4W6mO62N1',60,'Mrs. Bette Hansen','Mr. Erwin Flatley DDS',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(39,'Phyllis Shields I','efeeney@example.net','Ms. Kariane Rosenbaum','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','tcnayTQiFQ',62,'Mona Von','Mr. Lowell Price I',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(40,'Samir Deckow','dkirlin@example.net','Ms. Marge Spinka','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','0zfUXerBd1',49,'Delaney Keebler','Genesis Leannon',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(41,'Jayden Monahan','patience.lebsack@example.org','Prof. Clotilde Rempel','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','EizHQQI15T',23,'Mckenna Weber Jr.','Hazle Lynch',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(42,'Dr. Marge Considine','ada12@example.com','Marilie Moore','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','D8STCswDVJ',59,'Nyasia Labadie','Miss Sarah Lueilwitz',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(43,'Edwardo Yost','kozey.annetta@example.net','Isobel Sanford II','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','MyC9fRUTvy',53,'Lindsay Boehm','Karine Okuneva',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(44,'Olaf Doyle','linda.carroll@example.org','Gudrun Botsford','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','TcGdjni4vn',98,'Mr. Kay Graham','Prof. Rhea Botsford',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(45,'Mrs. River Wilkinson','krystina.casper@example.org','Rahsaan Johns','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','Yu71fsl5Dk',97,'Camilla Bednar','Dr. Shannon Cassin',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(46,'Isabelle Wisoky','owilkinson@example.net','Murphy Bailey','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','lgtbnzbU3V',48,'Ambrose Leannon','Kaylah Hahn',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(47,'Gertrude Moen','crenner@example.net','Monroe Franecki','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','7z9Giqy0Z5',16,'Ivory Harvey','Eryn Boyer',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(48,'Efrain Heidenreich','zmraz@example.org','Dr. Orion Gusikowski IV','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','WgP01fHggF',83,'Roma Gerhold','Miss Daniella Kessler MD',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(49,'Ms. Earlene Boyle','cathryn60@example.com','Candido Batz','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','JndIkj6qUF',99,'Prof. Maximillia Luettgen','Ezekiel Sipes',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(50,'Ms. Ruby Hodkiewicz','jreynolds@example.net','Dr. Kristopher Bogisich Jr.','2026-07-16 16:03:02','$2y$12$958TrjDM7Fh2DPinulG4Ye13.7fRVdIYQW4F.nR8AGl3eX6LOzluW','5prWGv9Q4P',73,'Marco Torphy I','Nichole Ryan Sr.',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(51,'admin','admin@email.com','minhaUrl',NULL,'$2y$12$65pPeTusshI41whAUKQYuuRDNmK.VbQ0XhXkyfTqALhKBiRaHikSO',NULL,NULL,NULL,'adminUserName',NULL,'2026-07-16 16:03:02','2026-07-16 16:03:02'),(53,'Lucas Malaquias Bispo Silva','supercanal13aaa4@gmail.com',NULL,'2026-07-17 03:04:44','$2y$12$DejURx4CMT7GCxmNt6D0D.nFhdWDvkfbDsKfOIRRlfeIysp16Wc7a','dBkSOh2dTSEh7VEMgSqjQReUuMR74dAJ8lJkmAPzhtgw76xo6uoF6ZRStt4z',90,NULL,'admin2',NULL,'2026-07-16 16:47:16','2026-07-17 03:04:44'),(54,'Lucas Malaquias Bispo Silva','supercanal1aaa34@gmail.com',NULL,NULL,'$2y$12$/rjvy1hLHALnFDcEuBf3numveYJsMwsmBk3cmnpzTyl03s75a9oMq','i9BzonxqiFWkvONFRD3qmQILE3ywgb76mF2dnpjYqvbVzqdmdDisOBGVPGwN',22,'capital','adminee',NULL,'2026-07-17 06:09:57','2026-07-17 06:11:15'),(55,'Lucas Malaquias Bispo Silva','supercanal134@gmail.coma','perfis/vwe7c4YRNgaN3XkVEI5YMTWJoOtKUhtykYEm7dzp.png','2026-07-17 07:41:11','$2y$12$viKbdTHlBjszHM6gOLG74.8OHd0DSL3nqcwly5jSgpTRUPP5mc4mW','PGRJj8Y3a5rqfokcSAaO0jKihROYt3MEG69z6WjROS6DYB8PgjxeIbPhaIF0',12,'Greta Durgan','adminUse',NULL,'2026-07-17 07:40:57','2026-07-19 06:34:46'),(58,'Lucas Malaquias Bispo Silva','supercanal134@gmail.com','perfis/kgPRFsI4jT6KjQ8wL2edWkLFYGat0hNWq7ehO3Db.png','2026-07-18 03:56:09','$2y$12$.Ngau1CHETJ0kfBpEj6hJObikNxS6ViCNx4qKYT22a9stGiuN1Ohy',NULL,10,'Greta Durgan','admin',NULL,'2026-07-18 00:16:44','2026-07-18 09:07:54'),(60,'Kauan','imagina@mail','perfis/JBg9wyi43VaHjDiyu9nm6NK3eKro5WUxQYSrNauR.png','2026-07-21 03:11:26','$2y$12$ey7JTkVRw1ZB9Iu9/IPs9O9qJ1/R5CDsT69WNY57nx17Fo4a1o/hG',NULL,10,'Greta Durgan','Apenas um Jovem',NULL,'2026-07-21 03:11:16','2026-07-21 03:11:51'),(61,'Lucas Malaquias Bispo Silva','supercanhial134@gmail.com','perfis/2p3DIfyFiXvvshDdNqCUZoOlgGJqmDwgFkHYxphA.png','2026-07-21 05:43:49','$2y$12$.rew/kwf53ddAREpx86AkuhXe1GKby1R/D.1Mq6fbfPNSir/3mBCO',NULL,98,'Greta Durgan','adminjiji',NULL,'2026-07-21 05:43:26','2026-07-21 05:44:11');
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

-- Dump completed on 2026-07-20 23:52:58
