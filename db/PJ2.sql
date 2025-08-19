CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `AttendanceID` int NOT NULL AUTO_INCREMENT,
  `Role` varchar(45) DEFAULT NULL,
  `Type` varchar(45) NOT NULL,
  `Members_MemberID` int NOT NULL,
  `Events_EventID` int NOT NULL,
  PRIMARY KEY (`AttendanceID`),
  KEY `fk_Attendance_Members1_idx` (`Members_MemberID`),
  KEY `fk_Attendance_Events1_idx` (`Events_EventID`),
  CONSTRAINT `fk_Attendance_Events1` FOREIGN KEY (`Events_EventID`) REFERENCES `events` (`EventID`),
  CONSTRAINT `fk_Attendance_Members1` FOREIGN KEY (`Members_MemberID`) REFERENCES `members` (`MemberID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,'Judge','No-Show',25,22),(2,'Organizer','No-Show',11,30),(3,'Judge','No-Show',35,2),(4,'Participant','No-Show',37,2),(5,'Judge','Attended',28,9),(6,'Judge','Registered',4,17),(7,'Volunteer','Registered',14,30),(8,'Judge','Registered',25,18),(9,'Participant','No-Show',6,31),(10,'Volunteer','Attended',35,4),(11,'Participant','Attended',5,3),(12,'Organizer','Attended',13,2),(13,'Participant','No-Show',9,31),(14,'Organizer','No-Show',17,24),(15,'Organizer','Registered',39,8),(16,'Participant','Registered',7,38),(17,'Judge','No-Show',37,25),(18,'Organizer','Attended',13,5),(19,'Participant','No-Show',20,39),(20,'Judge','No-Show',3,23),(21,'Volunteer','Attended',24,5),(22,'Participant','Registered',27,32),(23,'Organizer','Registered',24,30),(24,'Volunteer','No-Show',12,34),(25,'Judge','Registered',35,31),(26,'Volunteer','Attended',38,18),(27,'Judge','Attended',6,18),(28,'Judge','Registered',30,37),(29,'Volunteer','Attended',2,32),(30,'Volunteer','Registered',32,14),(31,'Volunteer','No-Show',22,18),(32,'Organizer','Attended',1,34),(33,'Judge','No-Show',16,27),(34,'Judge','Registered',16,31),(35,'Volunteer','Attended',2,6),(36,'Volunteer','No-Show',26,16),(37,'Judge','No-Show',38,24),(38,'Judge','No-Show',34,23),(39,'Volunteer','No-Show',36,22),(40,'Volunteer','Registered',30,18);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `EventID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `EventsDate` date DEFAULT NULL,
  `Purpose` varchar(255) DEFAULT NULL,
  `Location_LocationID` int NOT NULL,
  PRIMARY KEY (`EventID`),
  KEY `fk_Events_Location1_idx` (`Location_LocationID`),
  CONSTRAINT `fk_Events_Location1` FOREIGN KEY (`Location_LocationID`) REFERENCES `location` (`LocationID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Saltwater Trip Briefing #1','2024-10-02','Planning',34),(2,'River Cleanup #2','2024-03-01','Planning',6),(3,'River Cleanup #3','2024-03-07','Planning',5),(4,'Casting Clinic #4','2024-08-25','Social',37),(5,'Casting Clinic #5','2024-11-23','Planning',3),(6,'Saltwater Trip Briefing #6','2024-03-13','Volunteer',38),(7,'Saltwater Trip Briefing #7','2024-10-25','Competition',17),(8,'Casting Clinic #8','2025-01-08','Competition',16),(9,'Boat Safety #9','2024-08-21','Education',20),(10,'Fundraiser #10','2024-07-11','Social',1),(11,'Fundraiser #1','2024-12-15','Planning',7),(12,'Club BBQ #2','2024-11-02','Education',33),(13,'Boat Safety #3','2024-04-08','Competition',5),(14,'Casting Clinic #4','2024-08-08','Competition',11),(15,'Fundraiser #5','2025-04-02','Planning',20),(16,'Saltwater Trip Briefing #6','2025-03-20','Planning',1),(17,'Lake Derby #7','2024-07-03','Social',9),(18,'Boat Safety #8','2024-03-31','Social',36),(19,'River Cleanup #9','2024-06-19','Competition',39),(20,'Casting Clinic #10','2025-02-02','Competition',14),(21,'Boat Safety #1','2024-10-16','Volunteer',17),(22,'Monthly Meeting #2','2024-03-19','Volunteer',18),(23,'Monthly Meeting #3','2024-02-02','Competition',9),(24,'Boat Safety #4','2024-04-23','Volunteer',36),(25,'Kids Day #5','2024-11-14','Social',8),(26,'Club BBQ #6','2025-05-29','Education',35),(27,'Monthly Meeting #7','2025-04-03','Competition',38),(28,'Lake Derby #8','2024-04-16','Volunteer',9),(29,'Monthly Meeting #9','2024-07-07','Competition',3),(30,'Tackle Swap #10','2024-05-18','Education',7),(31,'Tackle Swap #1','2025-03-06','Planning',27),(32,'Saltwater Trip Briefing #2','2025-02-18','Education',16),(33,'River Cleanup #3','2025-06-14','Education',27),(34,'Monthly Meeting #4','2024-05-02','Competition',27),(35,'Casting Clinic #5','2024-06-16','Education',7),(36,'Kids Day #6','2025-04-22','Social',31),(37,'Casting Clinic #7','2024-05-13','Volunteer',23),(38,'Boat Safety #8','2025-03-27','Education',15),(39,'Monthly Meeting #9','2025-01-03','Education',26),(40,'Tackle Swap #10','2024-06-22','Social',18);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fish type`
--

DROP TABLE IF EXISTS `fish type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fish type` (
  `TypeID` int NOT NULL AUTO_INCREMENT,
  `SpeciesName` varchar(45) NOT NULL,
  `WaterType` varchar(45) DEFAULT NULL,
  `Fish typecol` varchar(45) DEFAULT NULL,
  `Fish_Catches_CatchID` int NOT NULL,
  PRIMARY KEY (`TypeID`),
  KEY `fk_Fish type_Fish_Catches1_idx` (`Fish_Catches_CatchID`),
  CONSTRAINT `fk_Fish type_Fish_Catches1` FOREIGN KEY (`Fish_Catches_CatchID`) REFERENCES `fish_catches` (`CatchID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fish type`
--

LOCK TABLES `fish type` WRITE;
/*!40000 ALTER TABLE `fish type` DISABLE KEYS */;
INSERT INTO `fish type` VALUES (1,'Pike','Freshwater',NULL,1),(2,'Pike','Saltwater',NULL,2),(3,'Salmon','Brackish',NULL,3),(4,'Crappie','Brackish',NULL,4),(5,'Bass','Freshwater',NULL,5),(6,'Pike','Brackish',NULL,6),(7,'Perch','Saltwater',NULL,7),(8,'Steelhead','Brackish',NULL,8),(9,'Steelhead','Saltwater',NULL,9),(10,'Salmon','Freshwater',NULL,10),(11,'Walleye','Freshwater',NULL,11),(12,'Carp','Freshwater',NULL,12),(13,'Walleye','Freshwater',NULL,13),(14,'Crappie','Freshwater',NULL,14),(15,'Walleye','Freshwater',NULL,15),(16,'Trout','Brackish',NULL,16),(17,'Walleye','Brackish',NULL,17),(18,'Bass','Brackish',NULL,18),(19,'Perch','Freshwater',NULL,19),(20,'Trout','Brackish',NULL,20),(21,'Walleye','Saltwater',NULL,21),(22,'Perch','Saltwater',NULL,22),(23,'Carp','Freshwater',NULL,23),(24,'Trout','Saltwater',NULL,24),(25,'Perch','Freshwater',NULL,25),(26,'Salmon','Saltwater',NULL,26),(27,'Perch','Freshwater',NULL,27),(28,'Steelhead','Brackish',NULL,28),(29,'Trout','Freshwater',NULL,29),(30,'Bass','Brackish',NULL,30),(31,'Walleye','Freshwater',NULL,31),(32,'Pike','Freshwater',NULL,32),(33,'Crappie','Saltwater',NULL,33),(34,'Steelhead','Brackish',NULL,34),(35,'Steelhead','Freshwater',NULL,35),(36,'Crappie','Saltwater',NULL,36),(37,'Perch','Saltwater',NULL,37),(38,'Walleye','Brackish',NULL,38),(39,'Catfish','Saltwater',NULL,39),(40,'Steelhead','Brackish',NULL,40);
/*!40000 ALTER TABLE `fish type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fish_catches`
--

DROP TABLE IF EXISTS `fish_catches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fish_catches` (
  `CatchID` int NOT NULL AUTO_INCREMENT,
  `Weight` varchar(45) NOT NULL,
  `Length` varchar(45) NOT NULL,
  `Released` tinyint DEFAULT NULL,
  `Fishing_Trips_TripID` int NOT NULL,
  PRIMARY KEY (`CatchID`),
  KEY `fk_Fish_Catches_Fishing_Trips1_idx` (`Fishing_Trips_TripID`),
  CONSTRAINT `fk_Fish_Catches_Fishing_Trips1` FOREIGN KEY (`Fishing_Trips_TripID`) REFERENCES `fishing_trips` (`TripID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fish_catches`
--

LOCK TABLES `fish_catches` WRITE;
/*!40000 ALTER TABLE `fish_catches` DISABLE KEYS */;
INSERT INTO `fish_catches` VALUES (1,'5.9 lb','26 in',1,35),(2,'5.6 lb','10 in',0,17),(3,'3.5 lb','18 in',0,7),(4,'9.4 lb','21 in',1,28),(5,'9.5 lb','26 in',0,25),(6,'13.6 lb','16 in',1,3),(7,'10.9 lb','10 in',0,24),(8,'7.0 lb','31 in',1,40),(9,'5.4 lb','13 in',1,33),(10,'5.3 lb','23 in',1,26),(11,'10.8 lb','27 in',0,13),(12,'6.9 lb','22 in',0,40),(13,'9.0 lb','22 in',0,20),(14,'5.0 lb','23 in',1,30),(15,'7.2 lb','31 in',0,33),(16,'7.6 lb','35 in',0,6),(17,'5.0 lb','31 in',1,6),(18,'12.5 lb','34 in',0,20),(19,'4.1 lb','16 in',0,2),(20,'1.6 lb','25 in',0,30),(21,'6.8 lb','30 in',0,25),(22,'7.9 lb','17 in',0,1),(23,'13.5 lb','34 in',0,28),(24,'4.1 lb','35 in',1,4),(25,'8.8 lb','13 in',1,9),(26,'12.2 lb','31 in',1,29),(27,'9.6 lb','33 in',1,36),(28,'7.2 lb','15 in',1,29),(29,'4.6 lb','17 in',1,34),(30,'7.8 lb','17 in',1,29),(31,'2.1 lb','19 in',0,18),(32,'5.7 lb','27 in',0,9),(33,'3.1 lb','22 in',0,14),(34,'1.9 lb','23 in',1,35),(35,'7.5 lb','11 in',0,27),(36,'6.5 lb','34 in',0,37),(37,'6.3 lb','10 in',1,20),(38,'11.5 lb','36 in',1,35),(39,'11.5 lb','27 in',0,32),(40,'4.1 lb','23 in',1,2);
/*!40000 ALTER TABLE `fish_catches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fishing_trips`
--

DROP TABLE IF EXISTS `fishing_trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fishing_trips` (
  `TripID` int NOT NULL AUTO_INCREMENT,
  `TripDate` date NOT NULL,
  `TripTime` time NOT NULL,
  `Trip_Type` tinyint DEFAULT NULL,
  `Location_LocationID` int NOT NULL,
  PRIMARY KEY (`TripID`),
  KEY `fk_Fishing_Trips_Location1_idx` (`Location_LocationID`),
  CONSTRAINT `fk_Fishing_Trips_Location1` FOREIGN KEY (`Location_LocationID`) REFERENCES `location` (`LocationID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fishing_trips`
--

LOCK TABLES `fishing_trips` WRITE;
/*!40000 ALTER TABLE `fishing_trips` DISABLE KEYS */;
INSERT INTO `fishing_trips` VALUES (1,'2024-10-02','09:45:00',3,26),(2,'2024-07-04','08:15:00',3,32),(3,'2024-02-16','17:00:00',1,10),(4,'2024-11-17','07:45:00',3,5),(5,'2024-07-16','11:45:00',3,17),(6,'2025-05-12','13:00:00',3,8),(7,'2024-12-15','13:30:00',3,22),(8,'2024-02-27','09:45:00',1,30),(9,'2024-01-02','16:30:00',3,12),(10,'2024-09-16','06:30:00',3,33),(11,'2024-11-07','08:15:00',2,11),(12,'2024-10-03','17:00:00',3,21),(13,'2024-09-07','05:00:00',2,20),(14,'2024-05-02','05:15:00',3,6),(15,'2024-02-13','16:45:00',1,35),(16,'2025-01-27','07:15:00',3,31),(17,'2025-04-29','13:15:00',2,34),(18,'2025-03-22','14:45:00',1,35),(19,'2025-01-21','16:15:00',3,20),(20,'2024-07-23','15:30:00',2,34),(21,'2024-08-19','06:15:00',1,5),(22,'2024-06-22','05:15:00',3,15),(23,'2024-01-04','06:00:00',1,5),(24,'2025-04-08','05:30:00',1,33),(25,'2024-05-01','09:45:00',1,35),(26,'2024-03-08','16:45:00',1,31),(27,'2025-02-17','11:15:00',1,7),(28,'2024-12-03','11:30:00',2,27),(29,'2024-08-27','18:00:00',3,7),(30,'2024-02-01','11:30:00',1,16),(31,'2024-04-08','08:45:00',1,28),(32,'2024-04-03','09:45:00',1,5),(33,'2024-08-14','17:00:00',1,35),(34,'2025-03-04','05:00:00',1,11),(35,'2024-07-27','12:45:00',1,26),(36,'2025-04-07','05:15:00',2,1),(37,'2024-07-18','09:45:00',2,28),(38,'2024-12-22','16:45:00',1,13),(39,'2024-05-31','08:00:00',3,35),(40,'2024-02-01','16:30:00',1,4);
/*!40000 ALTER TABLE `fishing_trips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `LocationID` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `State` varchar(3) NOT NULL,
  `Zipcode` varchar(5) NOT NULL,
  PRIMARY KEY (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Location 1','100 Cedar St','Seattle','WA','98000'),(2,'Location 2','101 5th Ave','Tacoma','WA','98001'),(3,'Location 3','102 Maple Ave','Bellevue','WA','98002'),(4,'Location 4','103 Pine St','Everett','WA','98003'),(5,'Location 5','104 3rd St','Kirkland','WA','98004'),(6,'Location 6','105 Pine St','Redmond','WA','98005'),(7,'Location 7','106 Pine St','Renton','WA','98006'),(8,'Location 8','107 4th St','Auburn','WA','98007'),(9,'Location 9','108 5th Ave','Lynnwood','WA','98008'),(10,'Location 10','109 2nd Ave','Shoreline','WA','98009'),(11,'Location 11','110 Lakeview Rd','Bellingham','WA','98010'),(12,'Location 12','111 3rd St','Olympia','WA','98011'),(13,'Location 13','112 Oak St','Spokane','MT','98012'),(14,'Location 14','113 4th St','Yakima','MT','98013'),(15,'Location 15','114 3rd St','Kennewick','MT','98014'),(16,'Location 16','115 Maple Ave','Pullman','MT','98015'),(17,'Location 17','116 Cedar St','Portland','OR','98016'),(18,'Location 18','117 5th Ave','Vancouver','OR','98017'),(19,'Location 19','118 Oak St','Salem','OR','98018'),(20,'Location 20','119 4th St','Eugene','OR','98019'),(21,'Location 21','120 Pine St','Boise','ID','98020'),(22,'Location 22','121 1st Ave','Meridian','ID','98021'),(23,'Location 23','122 4th St','Nampa','ID','98022'),(24,'Location 24','123 1st Ave','Coeur d\'Alene','ID','98023'),(25,'Location 25','124 Pine St','Helena','MT','98024'),(26,'Location 26','125 Cedar St','Missoula','MT','98025'),(27,'Location 27','126 5th Ave','Billings','MT','98026'),(28,'Location 28','127 2nd Ave','Great Falls','MT','98027'),(29,'Location 29','128 4th St','Kalispell','MT','98028'),(30,'Location 30','129 Lakeview Rd','Butte','MT','98029'),(31,'Location 31','130 Pine St','Anchorage','AK','98030'),(32,'Location 32','131 4th St','Juneau','AK','98031'),(33,'Location 33','132 Maple Ave','Fairbanks','AK','98032'),(34,'Location 34','133 Cedar St','Sitka','AK','98033'),(35,'Location 35','134 Maple Ave','Ketchikan','AK','98034'),(36,'Location 36','135 3rd St','Bend','OR','98035'),(37,'Location 37','136 5th Ave','Medford','OR','98036'),(38,'Location 38','137 3rd St','Redding','CA','98037'),(39,'Location 39','138 4th St','Santa Rosa','CA','98038'),(40,'Location 40','139 Oak St','San Jose','CA','98039');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `MemberID` int NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Email` varchar(45) NOT NULL,
  `JoinDate` date DEFAULT NULL,
  `MemberType` tinyint NOT NULL,
  PRIMARY KEY (`MemberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'John','Smith','+1-206-555-1000','john.smith@example.com','2024-10-16',1),(2,'Mary','Johnson','+1-206-555-1001','mary.johnson@example.com','2023-01-26',3),(3,'Alex','Lee','+1-206-555-1002','alex.lee@example.com','2023-10-09',1),(4,'Taylor','Brown','+1-206-555-1003','taylor.brown@example.com','2023-08-17',1),(5,'Jordan','Garcia','+1-206-555-1004','jordan.garcia@example.com','2025-01-24',1),(6,'Casey','Davis','+1-206-555-1005','casey.davis@example.com','2024-11-23',3),(7,'Riley','Miller','+1-206-555-1006','riley.miller@example.com','2024-07-12',1),(8,'Chris','Wilson','+1-206-555-1007','chris.wilson@example.com','2024-08-27',2),(9,'Morgan','Moore','+1-206-555-1008','morgan.moore@example.com','2023-02-02',1),(10,'Sam','Taylor','+1-206-555-1009','sam.taylor@example.com','2023-04-06',1),(11,'Baagii','Bat','+1-206-555-1010','baagii.bat@example.com','2023-08-27',3),(12,'Nara','Enkh','+1-206-555-1011','nara.enkh@example.com','2024-09-08',1),(13,'Tuvshin','Bold','+1-206-555-1012','tuvshin.bold@example.com','2024-07-28',1),(14,'Erdene','Purev','+1-206-555-1013','erdene.purev@example.com','2025-01-03',3),(15,'Oyun','Gan','+1-206-555-1014','oyun.gan@example.com','2024-12-19',3),(16,'Bataa','Dorj','+1-206-555-1015','bataa.dorj@example.com','2024-03-05',1),(17,'Sarnai','Bayar','+1-206-555-1016','sarnai.bayar@example.com','2024-04-04',3),(18,'Bilguun','Tungalag','+1-206-555-1017','bilguun.tungalag@example.com','2023-10-12',1),(19,'Anu','Chin','+1-206-555-1018','anu.chin@example.com','2025-02-16',1),(20,'Temuulen','Khulan','+1-206-555-1019','temuulen.khulan@example.com','2024-12-15',2),(21,'Olivia','Anderson','+1-206-555-1020','olivia.anderson@example.com','2023-12-15',2),(22,'Liam','Thomas','+1-206-555-1021','liam.thomas@example.com','2023-06-09',1),(23,'Noah','Jackson','+1-206-555-1022','noah.jackson@example.com','2025-02-20',2),(24,'Emma','White','+1-206-555-1023','emma.white@example.com','2023-04-15',1),(25,'Ava','Harris','+1-206-555-1024','ava.harris@example.com','2024-01-25',1),(26,'Sophia','Martin','+1-206-555-1025','sophia.martin@example.com','2024-01-03',2),(27,'Mason','Thompson','+1-206-555-1026','mason.thompson@example.com','2024-09-10',2),(28,'Ethan','Martinez','+1-206-555-1027','ethan.martinez@example.com','2025-04-06',1),(29,'Isabella','Clark','+1-206-555-1028','isabella.clark@example.com','2025-01-17',2),(30,'Mia','Rodriguez','+1-206-555-1029','mia.rodriguez@example.com','2024-07-03',1),(31,'James','Lewis','+1-206-555-1030','james.lewis@example.com','2024-01-23',1),(32,'Henry','Walker','+1-206-555-1031','henry.walker@example.com','2024-07-19',2),(33,'Amelia','Hall','+1-206-555-1032','amelia.hall@example.com','2025-04-29',3),(34,'Lucas','Allen','+1-206-555-1033','lucas.allen@example.com','2024-09-25',2),(35,'Charlotte','Young','+1-206-555-1034','charlotte.young@example.com','2024-08-14',1),(36,'Harper','Hernandez','+1-206-555-1035','harper.hernandez@example.com','2024-12-22',1),(37,'Evelyn','King','+1-206-555-1036','evelyn.king@example.com','2023-02-16',3),(38,'Elijah','Wright','+1-206-555-1037','elijah.wright@example.com','2023-08-22',2),(39,'Benjamin','Lopez','+1-206-555-1038','benjamin.lopez@example.com','2023-03-23',1),(40,'Logan','Hill','+1-206-555-1039','logan.hill@example.com','2025-06-06',1);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-18 17:47:45
