-- MySQL dump 10.13  Distrib 8.0.44, for macos15 (x86_64)
--
-- Host: 127.0.0.1    Database: bd1
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `Gamers`
--

DROP TABLE IF EXISTS `Gamers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Gamers` (
  `idGamers` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `country` varchar(45) DEFAULT NULL,
  `favorite_game` int DEFAULT NULL,
  `birth_day` date NOT NULL,
  PRIMARY KEY (`idGamers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gamers`
--

LOCK TABLES `Gamers` WRITE;
/*!40000 ALTER TABLE `Gamers` DISABLE KEYS */;
INSERT INTO `Gamers` VALUES (10,'El Gato','China',100,'2007-09-11'),(11,'Medvejonok','USA',100,'2006-12-07'),(12,'Heltam','USA',101,'2007-07-31'),(13,'Borda3x','NULL',108,'2007-08-30'),(14,'khodya',NULL,NULL,'2007-05-31'),(15,'chizhik','China',NULL,'2006-06-13'),(16,'yzhass',NULL,104,'2006-09-12'),(17,'opo','USA',NULL,'2007-06-30');
/*!40000 ALTER TABLE `Gamers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Gamers_games`
--

DROP TABLE IF EXISTS `Gamers_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Gamers_games` (
  `idGamers_games` int NOT NULL,
  `Gamer` int NOT NULL,
  `Game` int NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`idGamers_games`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gamers_games`
--

LOCK TABLES `Gamers_games` WRITE;
/*!40000 ALTER TABLE `Gamers_games` DISABLE KEYS */;
INSERT INTO `Gamers_games` VALUES (1000,10,100,'2010-01-01','10:30:10'),(1001,11,100,'2015-04-03','02:07:42'),(1002,12,102,'2010-01-01','01:40:22'),(1003,15,103,'2012-02-15','02:15:01'),(1004,14,104,'2011-04-10','00:02:22'),(1005,11,100,'2015-04-04','00:18:07'),(1006,16,100,'2013-03-02','00:10:01'),(1007,16,100,'2017-09-11','02:50:43'),(1008,17,106,'2016-06-13','00:05:15'),(1009,11,104,'2015-09-30','05:18:01'),(1010,12,101,'2012-02-20','01:30:01'),(1011,14,104,'2011-03-09','08:24:23'),(1012,12,101,'2015-01-11','04:00:00'),(1013,15,101,'2020-09-11','05:55:55'),(1014,13,108,'2017-09-24','01:45:12');
/*!40000 ALTER TABLE `Gamers_games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Games`
--

DROP TABLE IF EXISTS `Games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Games` (
  `idGames` int NOT NULL,
  `Game_name` varchar(45) NOT NULL,
  `Developer` varchar(45) NOT NULL,
  `Price` double DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idGames`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Games`
--

LOCK TABLES `Games` WRITE;
/*!40000 ALTER TABLE `Games` DISABLE KEYS */;
INSERT INTO `Games` VALUES (100,'Counter-Srtike 2','Valve',0,'USA'),(101,'Dota 2','Valve',0,'USA'),(102,'Battlefield 6','Battlefield studios',100,'USA'),(103,'PUBG','PUBG Corparation',0,'South Korea'),(104,'Escape from Duckov','Team Soda',15,'China'),(105,'Marvel Rivals','NetEase Games',0,'China'),(106,'Delta Force','Team Jade',0,'China'),(107,'Banana','Sky',0,'USA'),(108,'Dota 3','ISIT',NULL,'Russia');
/*!40000 ALTER TABLE `Games` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-25 15:34:26
