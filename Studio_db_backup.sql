-- MySQL dump 10.13  Distrib 8.0.24, for macos11 (x86_64)
--
-- Host: localhost    Database: Studio
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `Adaptation_projects`
--

DROP TABLE IF EXISTS `Adaptation_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Adaptation_projects` (
  `Project_id` int NOT NULL AUTO_INCREMENT,
  `Book_id` int DEFAULT NULL,
  `Project_title` varchar(50) NOT NULL,
  `Budget` int NOT NULL,
  `Filming_location` varchar(50) NOT NULL,
  `Starting_date` date NOT NULL,
  `End_date` date NOT NULL,
  `Statut` varchar(30) NOT NULL DEFAULT 'Not Started',
  PRIMARY KEY (`Project_id`),
  KEY `Book_id` (`Book_id`),
  CONSTRAINT `adaptation_projects_ibfk_1` FOREIGN KEY (`Book_id`) REFERENCES `Copyright_books` (`Book_id`),
  CONSTRAINT `adaptation_projects_chk_1` CHECK ((`Budget` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Adaptation_projects`
--

LOCK TABLES `Adaptation_projects` WRITE;
/*!40000 ALTER TABLE `Adaptation_projects` DISABLE KEYS */;
INSERT INTO `Adaptation_projects` VALUES (1,3,'A Clockwork Orange',1500000,'Germany','1968-11-11','1970-11-11','Released'),(2,10,'Charlie',550000,'US','1969-01-10','1971-01-10','Released'),(3,1,'Shining',7800000,'Canada','1978-05-03','1980-01-10','Released'),(4,14,'Sense and Sensibility',4500000,'UK','1992-10-14','1995-01-10','Released'),(5,9,'Lolita',3500000,'USA','1994-07-04','1997-11-09','Released'),(6,5,'Green Mile',4500000,'USA','1995-09-24','1999-11-15','Released'),(7,2,'Lord of the Rings 1',45000000,'NZ','1997-12-01','2001-01-23','Released'),(8,2,'Lord of the Rings 3',55000000,'NZ','1999-03-16','2003-03-10','Released'),(9,2,'Lord of the Rings 2',65000000,'NZ','1998-04-21','2002-07-09','Released'),(10,12,'Charlie and the Chocolate Factory',7000000,'UK','2000-07-23','2005-08-10','Released'),(11,6,'Pride and Prejudice',3000000,'UK','2003-03-03','2005-12-15','Released'),(12,15,'Alice',8000000,'UK','2007-01-08','2010-05-11','Released'),(13,10,'Hunger Games',12000000,'USA','2010-11-22','2012-04-19','Released'),(14,13,'Gone Gril',15000000,'USA','2012-02-03','2014-08-22','Released'),(15,1,'The Shining',56000000,'USA','2015-03-21','2016-02-03','Abandonned'),(16,4,'Dangerous Liaisons',34000000,'France','2018-02-03','2021-07-14','In Progress'),(17,7,'Misery',15800000,'USA','2019-02-03','2021-12-03','In Progress'),(18,8,'Jurassic Park',215000000,'USA','2019-02-03','2022-07-03','In Progress'),(19,9,'Lolita',25007000,'USA','2022-02-13','2024-12-03','Not Started'),(20,17,'Dracula',58700000,'UK','2021-06-16','2022-11-18','In Progress');
/*!40000 ALTER TABLE `Adaptation_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Copyright_books`
--

DROP TABLE IF EXISTS `Copyright_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Copyright_books` (
  `Book_id` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) NOT NULL,
  `Auteur` varchar(30) NOT NULL,
  `Year` int NOT NULL,
  `Copies_sold` int NOT NULL,
  `Price` float NOT NULL,
  PRIMARY KEY (`Book_id`),
  CONSTRAINT `copyright_books_chk_1` CHECK ((`Copies_sold` >= 0)),
  CONSTRAINT `copyright_books_chk_2` CHECK ((`Price` > 0.00))
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Copyright_books`
--

LOCK TABLES `Copyright_books` WRITE;
/*!40000 ALTER TABLE `Copyright_books` DISABLE KEYS */;
INSERT INTO `Copyright_books` VALUES (1,'The Shining','Stephen King',1977,1070000,7.99),(2,'The Lord of the Rings','J. R. R. Tolkien',1954,150000,7.99),(3,'A Clockwork Orange','Anthony Burges',1962,700800,7.99),(4,'Dangerous Liaisons','Laclos',1782,985000,1.99),(5,'The Green Mile','Stephen King',1965,850000,7.99),(6,'Pride and Prejudice','Jane Austen',1813,2500000,8.5),(7,'Misery','Stephen King',1977,354500,4.5),(8,'Jurassic Park','Michael Crichton',1990,750670,4.99),(9,'Lolita','Vladimir Nabokov',1955,6050000,2.5),(10,'The Hunger Games','Suzanne Collins',2008,3000000,9.99),(11,'Trainspotting','Irvine Welsh',1993,450000,6.99),(12,'Charlie and the Chocolate Factory','Roald Dahl',1964,4050600,5.99),(13,'Gone Gril','Gillian Flynn',2012,160000,12.99),(14,'Sense and Sensibility','Jane Austen',1811,1000000,7.99),(15,'Alice in Wonderland','Lewis Carol',1865,5500000,2.99),(16,'The Name of the Rose','Umberto Eco',1980,900800,1.89),(17,'Dracula','Bram Stoker',1897,105400,3.49);
/*!40000 ALTER TABLE `Copyright_books` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_books` AFTER INSERT ON `copyright_books` FOR EACH ROW BEGIN  
    INSERT INTO Genre_books (Book_id, Genre_id)
    values (new.Book_id,22);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Employees`
--

DROP TABLE IF EXISTS `Employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employees` (
  `Employee_id` int NOT NULL AUTO_INCREMENT,
  `Team_id` int DEFAULT NULL,
  `Employee_name` varchar(50) NOT NULL,
  `Job_title` varchar(50) NOT NULL,
  PRIMARY KEY (`Employee_id`),
  KEY `Team_id` (`Team_id`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`Team_id`) REFERENCES `Teams` (`Team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employees`
--

LOCK TABLES `Employees` WRITE;
/*!40000 ALTER TABLE `Employees` DISABLE KEYS */;
INSERT INTO `Employees` VALUES (1,1,'Bob','Director of Photography'),(2,1,'Hannah','Chef Operator'),(3,1,'Sarah','Productor'),(4,1,'John','Assistant'),(5,1,'Max','Assistant'),(6,1,'Dany','Movie Editor'),(7,2,'Mary','Assistant'),(8,2,'Lara','Chef Operator'),(9,2,'John','Movie Editor'),(10,3,'Monica','Chef Operator'),(11,3,'Jennifer','Makeup Artist'),(12,3,'Lisa','Costume Designer'),(13,3,'Jessica','Assistant'),(14,4,'James','Director of Photography'),(15,4,'Tom','Makeup Artist'),(16,4,'Josh','Assistant'),(17,4,'Emma','Costume Designer');
/*!40000 ALTER TABLE `Employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Films_released`
--

DROP TABLE IF EXISTS `Films_released`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Films_released` (
  `Film_id` int NOT NULL AUTO_INCREMENT,
  `Project_id` int DEFAULT NULL,
  `Title` varchar(50) NOT NULL,
  `Director` varchar(30) NOT NULL,
  `Year_release` year NOT NULL,
  `Box_Office` int DEFAULT '0',
  PRIMARY KEY (`Film_id`),
  KEY `Project_id` (`Project_id`),
  CONSTRAINT `films_released_ibfk_1` FOREIGN KEY (`Project_id`) REFERENCES `Adaptation_projects` (`Project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Films_released`
--

LOCK TABLES `Films_released` WRITE;
/*!40000 ALTER TABLE `Films_released` DISABLE KEYS */;
INSERT INTO `Films_released` VALUES (1,3,'The Shining','Stanley Kubrick',1980,8000000),(2,7,'The Lord of the Rings: The Fellowship of the Ring','Peter Jackon',2001,8900000),(3,8,'The Lord of the Rings: The Return of the King','Peter Jackon',2003,6050050),(4,9,'The Lord of the Rings: The Two Towers','Peter Jackon',2002,3005000),(5,1,'A Clockwork Orange','Stanley Kubrick',1971,2500000),(6,6,'The Green Mile','Frank Darabont',1999,6000000),(7,11,'Pride and Prejudice','Joe Wright',2005,195000),(8,5,'Lolita','Stanley Kubrick',1997,1000000),(9,13,'The Hunger Games','Gary Ross',2012,1000000),(10,10,'Charlie and the Chocolate Factory','Tim Burton',2005,1568000),(11,2,'Charlie and the Chocolate Factory','Muel Stuart',1971,1000000),(12,14,'Gone Gril','David Fincher',2014,1000000),(13,4,'Sense and Sensibility','Ang Lee',1995,1000000),(14,12,'Alice in Wonderland','Tim Burton',2010,1000000),(15,16,'Dangerous Liaisons','Paul Riley',2021,0),(16,17,'Misery','Rob Reiner',2021,0),(17,18,'Jurassic Park','Sid Scott',2022,0),(18,19,'Lolita','Janne Doe',2024,0),(19,20,'Dracula','John Doe',2022,0);
/*!40000 ALTER TABLE `Films_released` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genre_Books`
--

DROP TABLE IF EXISTS `Genre_Books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genre_Books` (
  `Book_id` int DEFAULT NULL,
  `Genre_id` int DEFAULT NULL,
  KEY `Book_id` (`Book_id`),
  KEY `Genre_id` (`Genre_id`),
  CONSTRAINT `genre_books_ibfk_1` FOREIGN KEY (`Book_id`) REFERENCES `Copyright_books` (`Book_id`),
  CONSTRAINT `genre_books_ibfk_2` FOREIGN KEY (`Genre_id`) REFERENCES `Genres` (`Genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genre_Books`
--

LOCK TABLES `Genre_Books` WRITE;
/*!40000 ALTER TABLE `Genre_Books` DISABLE KEYS */;
INSERT INTO `Genre_Books` VALUES (1,1),(2,2),(2,3),(3,4),(4,6),(4,8),(5,1),(6,9),(6,5),(7,1),(8,3),(9,16),(10,11),(10,14),(11,16),(12,10),(13,4),(14,5),(14,8),(15,10),(16,16),(17,2),(17,21);
/*!40000 ALTER TABLE `Genre_Books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genre_Films`
--

DROP TABLE IF EXISTS `Genre_Films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genre_Films` (
  `Film_id` int DEFAULT NULL,
  `Genre_id` int DEFAULT NULL,
  KEY `Film_id` (`Film_id`),
  KEY `Genre_id` (`Genre_id`),
  CONSTRAINT `genre_films_ibfk_1` FOREIGN KEY (`Film_id`) REFERENCES `Films_released` (`Film_id`),
  CONSTRAINT `genre_films_ibfk_2` FOREIGN KEY (`Genre_id`) REFERENCES `Genres` (`Genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genre_Films`
--

LOCK TABLES `Genre_Films` WRITE;
/*!40000 ALTER TABLE `Genre_Films` DISABLE KEYS */;
INSERT INTO `Genre_Films` VALUES (1,1),(1,2),(2,2),(2,3),(3,2),(3,3),(4,2),(4,3),(5,4),(6,9),(7,6),(7,8),(8,9),(9,15),(9,9),(10,12),(11,12),(12,4),(13,6),(13,8),(14,2),(14,3);
/*!40000 ALTER TABLE `Genre_Films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genres`
--

DROP TABLE IF EXISTS `Genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genres` (
  `Genre_id` int NOT NULL AUTO_INCREMENT,
  `Genre_description` varchar(20) NOT NULL,
  PRIMARY KEY (`Genre_id`),
  UNIQUE KEY `Genre_description` (`Genre_description`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genres`
--

LOCK TABLES `Genres` WRITE;
/*!40000 ALTER TABLE `Genres` DISABLE KEYS */;
INSERT INTO `Genres` VALUES (15,'Action'),(3,'Adventure'),(10,'Children'),(5,'Classic'),(7,'Comedy'),(17,'Crime'),(9,'Drama'),(14,'Dystopia'),(19,'Family'),(2,'Fantasy'),(21,'Gothic'),(6,'Historical'),(1,'Horror'),(13,'Moderne Classic'),(12,'Muscical'),(16,'Novel'),(8,'Romance'),(18,'Sci-Fi'),(4,'Thriller'),(20,'War'),(11,'Young Adult');
/*!40000 ALTER TABLE `Genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reviewers`
--

DROP TABLE IF EXISTS `Reviewers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reviewers` (
  `Reviewer_id` int NOT NULL AUTO_INCREMENT,
  `Reviewer_name` varchar(50) NOT NULL,
  `Reviewer_type` varchar(50) NOT NULL,
  PRIMARY KEY (`Reviewer_id`),
  UNIQUE KEY `Reviewer_name` (`Reviewer_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reviewers`
--

LOCK TABLES `Reviewers` WRITE;
/*!40000 ALTER TABLE `Reviewers` DISABLE KEYS */;
INSERT INTO `Reviewers` VALUES (1,'The New York Time','Press'),(2,'The Guardian','Press'),(3,'Rotten Tomatoes','Website'),(4,'IMDb','Website');
/*!40000 ALTER TABLE `Reviewers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reviews`
--

DROP TABLE IF EXISTS `Reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reviews` (
  `Review_id` int NOT NULL AUTO_INCREMENT,
  `Film_id` int DEFAULT NULL,
  `Reviewer_id` int DEFAULT NULL,
  `Rating` int DEFAULT NULL,
  PRIMARY KEY (`Review_id`),
  KEY `Film_id` (`Film_id`),
  KEY `Reviewer_id` (`Reviewer_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`Film_id`) REFERENCES `Films_released` (`Film_id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`Reviewer_id`) REFERENCES `Reviewers` (`Reviewer_id`),
  CONSTRAINT `reviews_chk_1` CHECK (((`Rating` >= 1) and (`Rating` <= 5)))
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reviews`
--

LOCK TABLES `Reviews` WRITE;
/*!40000 ALTER TABLE `Reviews` DISABLE KEYS */;
INSERT INTO `Reviews` VALUES (1,1,1,5),(2,1,2,5),(3,2,4,5),(4,2,1,4),(5,2,2,4),(6,3,1,3),(7,3,2,4),(8,3,3,5),(9,3,4,5),(10,4,3,4),(11,4,4,4),(12,5,1,2),(13,5,2,4),(14,6,1,3),(15,6,2,4),(16,6,4,5),(17,7,2,3),(18,7,3,3),(19,7,4,3),(20,8,2,4),(21,8,1,3),(22,9,2,2),(23,9,3,3),(24,9,4,3),(25,10,2,2),(26,10,4,3),(27,12,2,4),(28,12,4,5),(29,12,2,4),(30,13,2,2),(31,13,3,2),(32,14,2,2),(33,14,4,3);
/*!40000 ALTER TABLE `Reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Team_projects`
--

DROP TABLE IF EXISTS `Team_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Team_projects` (
  `Project_id` int DEFAULT NULL,
  `Team_id` int DEFAULT NULL,
  KEY `Project_id` (`Project_id`),
  KEY `Team_id` (`Team_id`),
  CONSTRAINT `team_projects_ibfk_1` FOREIGN KEY (`Project_id`) REFERENCES `Adaptation_projects` (`Project_id`),
  CONSTRAINT `team_projects_ibfk_2` FOREIGN KEY (`Team_id`) REFERENCES `Teams` (`Team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Team_projects`
--

LOCK TABLES `Team_projects` WRITE;
/*!40000 ALTER TABLE `Team_projects` DISABLE KEYS */;
INSERT INTO `Team_projects` VALUES (1,4),(2,3),(3,1),(4,3),(5,4),(6,1),(7,1),(8,1),(9,1),(7,4),(8,4),(9,4),(10,3),(11,2),(12,3),(13,1),(14,4),(15,2),(16,2),(17,4),(18,1),(18,4),(19,2),(20,3);
/*!40000 ALTER TABLE `Team_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teams`
--

DROP TABLE IF EXISTS `Teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Teams` (
  `Team_id` int NOT NULL AUTO_INCREMENT,
  `Office` varchar(30) NOT NULL,
  PRIMARY KEY (`Team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teams`
--

LOCK TABLES `Teams` WRITE;
/*!40000 ALTER TABLE `Teams` DISABLE KEYS */;
INSERT INTO `Teams` VALUES (1,'LA'),(2,'Paris'),(3,'London'),(4,'LA');
/*!40000 ALTER TABLE `Teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_film_box_office_vs_rating_team`
--

DROP TABLE IF EXISTS `view_film_box_office_vs_rating_team`;
/*!50001 DROP VIEW IF EXISTS `view_film_box_office_vs_rating_team`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_film_box_office_vs_rating_team` AS SELECT 
 1 AS `Title`,
 1 AS `Box_Office`,
 1 AS `Rating`,
 1 AS `Team_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_film_vs_genre`
--

DROP TABLE IF EXISTS `view_film_vs_genre`;
/*!50001 DROP VIEW IF EXISTS `view_film_vs_genre`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_film_vs_genre` AS SELECT 
 1 AS `Film_id`,
 1 AS `Title`,
 1 AS `Genre_description`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_film_vs_rating_by_reviwer`
--

DROP TABLE IF EXISTS `view_film_vs_rating_by_reviwer`;
/*!50001 DROP VIEW IF EXISTS `view_film_vs_rating_by_reviwer`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_film_vs_rating_by_reviwer` AS SELECT 
 1 AS `Title`,
 1 AS `Box_Office`,
 1 AS `Rating`,
 1 AS `Reviewer_name`,
 1 AS `Reviewer_type`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'Studio'
--
/*!50003 DROP FUNCTION IF EXISTS `days_left` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `days_left`(date1 date) RETURNS varchar(30) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
 DECLARE date2 DATE;
 DECLARE days INT;
 DECLARE days_left_sentence VARCHAR(30);
  SELECT  CURRENT_DATE() INTO date2;
  SET days = DATEDIFF(date1, date2);
  SET days_left_sentence = CONVERT(days, CHAR);
  SET days_left_sentence = CONCAT_WS(' ', days_left_sentence, 'days');
  RETURN days_left_sentence;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `is_a_good_movie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `is_a_good_movie`(
    Rating INT
) RETURNS varchar(30) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE Movie_quality VARCHAR(30);
    IF Rating > 4 THEN
        SET Movie_quality = 'Excellent';
    ELSEIF (Rating  >= 3 AND 
            Rating  <= 4) THEN
        SET Movie_quality = 'Good';
	ELSEIF (Rating  < 3  AND
			Rating > 2)THEN
        SET Movie_quality = 'Not Great';
    ELSEIF Rating  <= 2 THEN
        SET Movie_quality = 'Very Bad';
    END IF;
    RETURN (Movie_quality);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `find_project_of_employee_by_filming_location` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `find_project_of_employee_by_filming_location`(FirstName VARCHAR(30), Location VARCHAR(30))
BEGIN
SELECT 
		*
	FROM 
		Employees JOIN Teams USING (Team_id)
        JOIN Team_projects USING(Team_id)
        JOIN Adaptation_projects USING (Project_id)
        WHERE Employee_name = FirstName  AND Filming_location = Location ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_film_box_office_vs_rating_team`
--

/*!50001 DROP VIEW IF EXISTS `view_film_box_office_vs_rating_team`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_film_box_office_vs_rating_team` AS select `films_released`.`Title` AS `Title`,`films_released`.`Box_Office` AS `Box_Office`,`reviews`.`Rating` AS `Rating`,`team_projects`.`Team_id` AS `Team_id` from (((`films_released` join `reviews` on((`films_released`.`Film_id` = `reviews`.`Film_id`))) join `adaptation_projects` on((`adaptation_projects`.`Project_id` = `films_released`.`Project_id`))) join `team_projects` on((`team_projects`.`Project_id` = `adaptation_projects`.`Project_id`))) order by `team_projects`.`Team_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_film_vs_genre`
--

/*!50001 DROP VIEW IF EXISTS `view_film_vs_genre`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_film_vs_genre` AS select `films_released`.`Film_id` AS `Film_id`,`films_released`.`Title` AS `Title`,`genres`.`Genre_description` AS `Genre_description` from ((`films_released` join `genre_films` on((`films_released`.`Film_id` = `genre_films`.`Film_id`))) join `genres` on((`genres`.`Genre_id` = `genre_films`.`Genre_id`))) order by `films_released`.`Film_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_film_vs_rating_by_reviwer`
--

/*!50001 DROP VIEW IF EXISTS `view_film_vs_rating_by_reviwer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_film_vs_rating_by_reviwer` AS select `films_released`.`Title` AS `Title`,`films_released`.`Box_Office` AS `Box_Office`,`reviews`.`Rating` AS `Rating`,`reviewers`.`Reviewer_name` AS `Reviewer_name`,`reviewers`.`Reviewer_type` AS `Reviewer_type` from ((`films_released` join `reviews` on((`films_released`.`Film_id` = `reviews`.`Film_id`))) join `reviewers` on((`reviews`.`Reviewer_id` = `reviewers`.`Reviewer_id`))) order by ((0 <> `films_released`.`Title`) and (0 <> `reviewers`.`Reviewer_type`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-12 22:22:45
