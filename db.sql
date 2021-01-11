-- MySQL dump 10.13  Distrib 8.0.15, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: usersData
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `hobbies`
--

DROP TABLE IF EXISTS `hobbies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hobbies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hobbies`
--

LOCK TABLES `hobbies` WRITE;
/*!40000 ALTER TABLE `hobbies` DISABLE KEYS */;
INSERT INTO `hobbies` VALUES (1,'Sports'),(2,'Cooking'),(3,'Yoga'),(4,'Reading'),(5,'Dancing'),(6,'Eating');
/*!40000 ALTER TABLE `hobbies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `img` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Glennie Ouellette',25,'https://i.pravatar.cc/400?img=1'),(2,'Albertha Reveles',18,'https://i.pravatar.cc/400?img=5'),(3,'Fredia Bellard',34,'https://i.pravatar.cc/400?img=7'),(4,'Lucienne Klawitter',40,'https://i.pravatar.cc/400?img=10'),(5,'Nena Eagles',45,'https://i.pravatar.cc/400?img=29'),(6,'Sheldon Rundquist',58,'https://i.pravatar.cc/400?img=11'),(7,'Avis Renfrew',39,'https://i.pravatar.cc/400?img=12'),(8,'Lahoma Wiltsie',33,'https://i.pravatar.cc/400?img=13'),(9,'Ramon Trusty',32,'https://i.pravatar.cc/400?img=14'),(10,'Charmain Gowen',43,'https://i.pravatar.cc/400?img=15'),(11,'Armanda Mccormick',33,'https://i.pravatar.cc/400?img=16'),(12,'Catharine Hammell',77,'https://i.pravatar.cc/400?img=17'),(13,'Hayden Hanchett',58,'https://i.pravatar.cc/400?img=18'),(14,'Sachiko Caton',29,'https://i.pravatar.cc/400?img=19'),(15,'Cindi Osterberg',31,'https://i.pravatar.cc/400?img=20'),(16,'Terina Dyer',34,'https://i.pravatar.cc/400?img=21'),(17,'Candida Barrett',44,'https://i.pravatar.cc/400?img=22'),(18,'Marlys Sward',40,'https://i.pravatar.cc/400?img=23'),(19,'Shawnee Hice',39,'https://i.pravatar.cc/400?img=24'),(20,'Tynisha Cessna',19,'https://i.pravatar.cc/400?img=25'),(21,'Danyelle Phillips',37,'https://i.pravatar.cc/400?img=26'),(22,'Fanny Iles',29,'https://i.pravatar.cc/400?img=27');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_hobbies`
--

DROP TABLE IF EXISTS `users_hobbies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_hobbies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `hobby_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  KEY `hobby_id_idx` (`hobby_id`),
  CONSTRAINT `hobby_id` FOREIGN KEY (`hobby_id`) REFERENCES `hobbies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_hobbies`
--

LOCK TABLES `users_hobbies` WRITE;
/*!40000 ALTER TABLE `users_hobbies` DISABLE KEYS */;
INSERT INTO `users_hobbies` VALUES (1,1,3),(2,1,4),(3,1,1),(4,1,2),(5,1,3),(6,1,4),(7,1,1),(8,1,2),(9,2,1),(10,2,4),(11,2,6),(12,2,5),(13,3,4),(14,3,1),(15,3,6),(16,3,3),(17,4,4),(18,4,1),(19,4,6),(20,4,3),(21,5,6),(22,5,2),(23,5,3),(24,5,5);
/*!40000 ALTER TABLE `users_hobbies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-11 14:29:56
