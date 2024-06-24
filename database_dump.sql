CREATE DATABASE  IF NOT EXISTS `bhima_db_test_2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bhima_db_test_2`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: bhima_db_test_2
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `base_station_coordinates`
--

DROP TABLE IF EXISTS `base_station_coordinates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_station_coordinates` (
  `Entry_id` int NOT NULL AUTO_INCREMENT,
  `Latitude` float NOT NULL,
  `Longitude` float NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_station_coordinates`
--

LOCK TABLES `base_station_coordinates` WRITE;
/*!40000 ALTER TABLE `base_station_coordinates` DISABLE KEYS */;
INSERT INTO `base_station_coordinates` VALUES (1,15.3695,75.1234,'2024-01-24 09:30:40');
/*!40000 ALTER TABLE `base_station_coordinates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `current_tasks`
--

DROP TABLE IF EXISTS `current_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `current_tasks` (
  `Entry_id` int NOT NULL AUTO_INCREMENT,
  `Employee_ID` varchar(50) NOT NULL,
  `robot_id` varchar(50) NOT NULL,
  `charge_electronics_battery` int NOT NULL,
  `charge_motor_battery` int NOT NULL,
  `current_latitude` varchar(20) NOT NULL,
  `current_longitude` varchar(20) NOT NULL,
  `destination` varchar(50) NOT NULL,
  `destination_latitude` float NOT NULL,
  `destination_longitude` float NOT NULL,
  `additional_description` varchar(50) NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `current_tasks`
--

LOCK TABLES `current_tasks` WRITE;
/*!40000 ALTER TABLE `current_tasks` DISABLE KEYS */;
INSERT INTO `current_tasks` VALUES (1,'101','Robot1',61,71,'15.3692355','75.1235555','Landmark3',15.3692,75.1235,'Delivery','2024-04-05 08:40:14'),(2,'101','Robot2',55,60,'15.3692225','75.1233333','Landmark2',15.3693,75.1232,'Delivery','2024-06-24 11:07:55'),(3,'101','Robot3',45,50,'15.3692444','75.1234444','Landmark4',15.3693,75.1235,'Delivery','2024-06-24 11:07:45');
/*!40000 ALTER TABLE `current_tasks` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `current_tasks_BEFORE_INSERT` BEFORE INSERT ON `current_tasks` FOR EACH ROW BEGIN
	SET NEW.destination_latitude = (SELECT Latitude FROM Landmark_coordinates WHERE coordinate_id = NEW.destination);
	 SET NEW.destination_longitude = (SELECT Longitude FROM Landmark_coordinates WHERE coordinate_id = NEW.destination);
     SET NEW.charge_electronics_battery = (SELECT charge_electronics_battery FROM Robot_Info WHERE robot_id = NEW.robot_id);
     SET NEW.charge_motor_battery = (SELECT charge_motor_battery FROM Robot_Info WHERE robot_id = NEW.robot_id);
     SET NEW.current_latitude = (SELECT Latitude FROM Robot_Info WHERE robot_id = NEW.robot_id);
     SET NEW.current_longitude = (SELECT Longitude FROM Robot_Info WHERE robot_id = NEW.robot_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `current_tasks_BEFORE_UPDATE` BEFORE UPDATE ON `current_tasks` FOR EACH ROW BEGIN
	 SET NEW.destination_latitude = (SELECT Latitude FROM Landmark_coordinates WHERE coordinate_id = NEW.destination);
	 SET NEW.destination_longitude = (SELECT Longitude FROM Landmark_coordinates WHERE coordinate_id = NEW.destination);
	 SET NEW.charge_electronics_battery = (SELECT charge_electronics_battery FROM Robot_Info WHERE robot_id = NEW.robot_id);
	 SET NEW.charge_motor_battery = (SELECT charge_motor_battery FROM Robot_Info WHERE robot_id = NEW.robot_id);
	 SET NEW.current_latitude = (SELECT Latitude FROM Robot_Info WHERE robot_id = NEW.robot_id);
	 SET NEW.current_longitude = (SELECT Longitude FROM Robot_Info WHERE robot_id = NEW.robot_id);
	 INSERT INTO Task_Log (Employee_ID, robot_id, charge_electronics_battery, charge_motor_battery,destination, additional_description, time_stamp)
	 VALUES (old.Employee_ID, old.robot_id, old.charge_electronics_battery, old.charge_motor_battery,old.destination, old.additional_description, old.time_stamp);
	 update landmark_coordinates set Robot_id=null where Robot_id=new.robot_id;
	 update landmark_coordinates Set Robot_id=new.robot_id where Coordinate_id=new.destination;
    if new.destination=null then
		Update robot_info set current_assignment=null where current_assignment=new.destination;
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `current_tasks_AFTER_UPDATE` AFTER UPDATE ON `current_tasks` FOR EACH ROW BEGIN
	insert into Employee_Log(Employee_ID,event_description) values(new.employee_id,concat('[Employee ID:',NEW.employee_id,']: Assigned Task to: ',new.robot_id,' Destination: ',new.destination));
     update Robot_info Set current_assignment=new.destination where robot_id=new.robot_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `electronics_battery_consumption_log`
--

DROP TABLE IF EXISTS `electronics_battery_consumption_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `electronics_battery_consumption_log` (
  `Entry_id` int NOT NULL AUTO_INCREMENT,
  `robot_id` varchar(50) NOT NULL,
  `current_battery_level` int NOT NULL,
  `last_updated` timestamp NULL DEFAULT NULL,
  `uptime_1_percent` time DEFAULT '00:00:00',
  `current__uptime` time DEFAULT '00:00:00',
  `total__uptime` time DEFAULT '00:00:00',
  PRIMARY KEY (`Entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electronics_battery_consumption_log`
--

LOCK TABLES `electronics_battery_consumption_log` WRITE;
/*!40000 ALTER TABLE `electronics_battery_consumption_log` DISABLE KEYS */;
INSERT INTO `electronics_battery_consumption_log` VALUES (1,'Robot1',56,'2024-02-02 09:54:31','00:07:28','00:07:28','00:07:28'),(16,'Robot1',55,'2024-02-02 09:57:27','00:02:49','00:10:17','00:10:17'),(17,'Robot1',54,'2024-02-02 09:59:28','00:02:00','00:12:17','00:12:17'),(18,'Robot1',53,'2024-02-02 10:01:29','00:02:00','00:14:17','00:14:17'),(19,'Robot1',52,'2024-02-02 10:03:30','00:02:00','00:16:17','00:16:17'),(20,'Robot1',61,'2024-02-02 10:05:31','00:02:00','00:18:17','00:18:17'),(21,'Robot1',71,'2024-02-06 09:36:47','00:00:37','00:18:54','00:18:54'),(22,'Robot1',72,'2024-02-08 05:03:14','00:00:00','00:18:54','00:18:54'),(23,'Robot1',71,'2024-02-08 05:05:40','00:02:00','00:20:54','00:20:54'),(24,'Robot1',70,'2024-02-08 05:07:41','00:02:00','00:22:54','00:22:54'),(25,'Robot1',69,'2024-02-08 05:09:42','00:02:00','00:24:54','00:24:54'),(26,'Robot1',68,'2024-02-08 05:11:43','00:02:00','00:26:54','00:26:54'),(27,'Robot1',67,'2024-02-08 05:13:45','00:02:01','00:28:55','00:28:55'),(28,'Robot1',66,'2024-02-08 05:15:46','00:02:00','00:30:55','00:30:55'),(29,'Robot1',65,'2024-02-08 05:16:32','00:00:00','00:30:55','00:30:55'),(30,'Robot1',61,'2024-02-08 05:23:38','00:02:00','00:32:55','00:32:55'),(31,'Robot1',60,'2024-02-08 05:25:40','00:02:01','00:34:56','00:34:56'),(32,'Robot1',59,'2024-02-08 05:27:42','00:02:01','00:36:57','00:36:57'),(33,'Robot1',58,'2024-02-08 05:29:43','00:02:00','00:38:57','00:38:57'),(34,'Robot1',57,'2024-02-08 05:31:45','00:02:01','00:40:58','00:40:58'),(35,'Robot2',55,'2024-02-08 05:35:47','00:02:00','00:00:00','00:00:00'),(36,'Robot2',54,'2024-02-08 05:37:48','00:02:00','00:02:00','00:02:00'),(37,'Robot2',53,'2024-02-08 05:39:50','00:02:01','00:04:01','00:04:01'),(38,'Robot2',52,'2024-02-08 05:41:51','00:02:00','00:06:01','00:06:01'),(39,'Robot2',51,'2024-02-08 05:43:52','00:02:00','00:08:01','00:08:01'),(40,'Robot3',45,'2024-02-08 05:47:55','00:02:01','00:00:00','00:00:00'),(41,'Robot3',44,'2024-02-08 05:49:56','00:02:00','00:02:00','00:02:00'),(42,'Robot3',43,'2024-02-08 05:51:58','00:02:01','00:04:01','00:04:01'),(43,'Robot3',42,'2024-02-08 05:53:59','00:02:00','00:06:01','00:06:01'),(44,'Robot3',41,'2024-02-08 05:56:01','00:02:01','00:08:02','00:08:02');
/*!40000 ALTER TABLE `electronics_battery_consumption_log` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `electronics_battery_consumption_log_BEFORE_INSERT` BEFORE INSERT ON `electronics_battery_consumption_log` FOR EACH ROW BEGIN
    DECLARE prev_uptime TIME;
    DECLARE prev_total_uptime TIME;
    
    -- Get the value of current__uptime and total__uptime from the previous row
    SELECT current__uptime, total__uptime
    INTO prev_uptime, prev_total_uptime
    FROM electronics_battery_consumption_log
    WHERE robot_id = NEW.robot_id
    ORDER BY Entry_id DESC
    LIMIT 1;

    -- Set the value of current__uptime for the new row
    SET NEW.current__uptime = IFNULL(ADDTIME(NEW.uptime_1_percent, prev_uptime), '00:00:00');
    
    -- Set the value of total__uptime for the new row
    SET NEW.total__uptime = IFNULL(ADDTIME(NEW.uptime_1_percent, prev_total_uptime), '00:00:00');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `electronics_battery_info`
--

DROP TABLE IF EXISTS `electronics_battery_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `electronics_battery_info` (
  `Entry_id` int NOT NULL AUTO_INCREMENT,
  `robot_id` varchar(50) NOT NULL,
  `battery_status` varchar(15) DEFAULT NULL,
  `current_battery_level` int NOT NULL,
  `last_updated` timestamp NULL DEFAULT NULL,
  `uptime_1_percent` time DEFAULT NULL,
  `Current_estimated_uptime` time DEFAULT NULL,
  PRIMARY KEY (`Entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electronics_battery_info`
--

LOCK TABLES `electronics_battery_info` WRITE;
/*!40000 ALTER TABLE `electronics_battery_info` DISABLE KEYS */;
INSERT INTO `electronics_battery_info` VALUES (1,'Robot1','active',61,'2024-02-08 05:35:48','00:04:02','06:15:12'),(2,'Robot2','active',55,'2024-02-08 05:58:28','00:14:35','19:55:50'),(3,'Robot3','active',45,'2024-02-08 05:58:28','00:02:26','02:30:40');
/*!40000 ALTER TABLE `electronics_battery_info` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `electronics_battery_info_BEFORE_UPDATE` BEFORE UPDATE ON `electronics_battery_info` FOR EACH ROW BEGIN
IF NEW.current_battery_level = OLD.current_battery_level THEN
    IF NEW.battery_status = 'active' AND OLD.battery_status = 'active' THEN
        SET NEW.battery_status = 'active';
        SET NEW.last_updated = NOW();
        SET NEW.uptime_1_percent = IFNULL(ADDTIME(old.uptime_1_percent, TIMEDIFF(NOW(), old.last_updated)), '00:00:00');
        SET NEW.Current_estimated_uptime = IFNULL(SEC_TO_TIME(NEW.uptime_1_percent * NEW.current_battery_level), '00:00:00');
    ELSEIF NEW.battery_status = 'inactive' AND OLD.battery_status = 'active' THEN
        SET NEW.last_updated = NOW();
        SET NEW.uptime_1_percent = IFNULL(ADDTIME(old.uptime_1_percent, TIMEDIFF(NOW(), old.last_updated)), '00:00:00');
        SET NEW.Current_estimated_uptime = IFNULL(SEC_TO_TIME(NEW.uptime_1_percent * NEW.current_battery_level), '00:00:00');
    ELSEIF NEW.battery_status = 'active' AND OLD.battery_status = 'inactive' THEN
        SET NEW.last_updated = NOW();
    END IF;
ELSEIF NEW.current_battery_level < OLD.current_battery_level THEN
	insert into electronics_battery_consumption_log(robot_id,current_battery_level,last_updated,uptime_1_percent)
    values(old.robot_id,old.current_battery_level,old.last_updated,old.uptime_1_percent);
    SET NEW.last_updated = NOW();
    SET NEW.uptime_1_percent = '00:00:00';
    SET NEW.Current_estimated_uptime = '00:00:00';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `employee_info`
--

DROP TABLE IF EXISTS `employee_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_info` (
  `Employee_ID` int NOT NULL AUTO_INCREMENT,
  `Employee_Name` varchar(10) DEFAULT NULL,
  `Employee_Age` int DEFAULT NULL,
  `Employee_Gender` varchar(6) DEFAULT NULL,
  `Employee_Field` varchar(10) DEFAULT NULL,
  `Access_Key` varchar(20) DEFAULT NULL,
  `login_status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_info`
--

LOCK TABLES `employee_info` WRITE;
/*!40000 ALTER TABLE `employee_info` DISABLE KEYS */;
INSERT INTO `employee_info` VALUES (101,'Nakul',21,'Male','Operator','123','Yes'),(102,'Sunil',21,'Male','Operator','123','Yes'),(103,'Shrinivas',21,'Male','Operator','123','No'),(104,'Patanjali',21,'Male','Operator','123','no'),(105,'Pavan',21,'Male','Operator','123','No');
/*!40000 ALTER TABLE `employee_info` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `employee_info_BEFORE_UPDATE` BEFORE UPDATE ON `employee_info` FOR EACH ROW BEGIN
		IF NEW.login_status = 'yes' AND OLD.login_status != 'yes' THEN
			INSERT INTO employee_log (employee_id, event_description)
			VALUES (NEW.employee_id,CONCAT('[Employee ID:',NEW.employee_id,']: Logged In' ));
		END IF;
		IF NEW.login_status = 'no' AND OLD.login_status = 'yes' THEN
			INSERT INTO employee_log (employee_id, event_description)
			VALUES (NEW.employee_id,CONCAT('[Employee ID: ',NEW.employee_id,']: Logged Out' ));
		END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `employee_log`
--

DROP TABLE IF EXISTS `employee_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_log` (
  `Entry_id` int NOT NULL AUTO_INCREMENT,
  `Employee_ID` int DEFAULT NULL,
  `event_description` varchar(150) DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_log`
--

LOCK TABLES `employee_log` WRITE;
/*!40000 ALTER TABLE `employee_log` DISABLE KEYS */;
INSERT INTO `employee_log` VALUES (1,101,'Operator [Employee ID:101]: Logged In','2024-01-24 11:11:36'),(2,101,'Operator [Employee ID:101]: Task Assigned to: Robot3 Destination: Landmark2','2024-01-24 11:11:59'),(3,101,'Operator [Employee ID:101]: Task Assigned to: Robot3 Destination: Landmark3','2024-01-24 11:13:34'),(4,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark3','2024-01-24 11:15:58'),(5,101,'Operator [Employee ID: 101]: Logged Out','2024-01-24 12:11:26'),(6,102,'Operator [Employee ID: 102]: Logged Out','2024-01-24 12:11:26'),(7,102,'Operator [Employee ID:102]: Logged In','2024-01-24 12:21:06'),(8,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark1','2024-01-24 12:21:26'),(24,101,'Operator [Employee ID:101]: Logged In','2024-01-25 06:57:26'),(25,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark1','2024-01-25 07:16:58'),(26,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark1','2024-01-25 07:16:58'),(27,101,'Operator [Employee ID:101]: Task Assigned to: Robot3 Destination: Landmark3','2024-01-25 07:16:58'),(28,101,'Operator [Employee ID:101]: Task Assigned to: Robot3 Destination: Landmark1','2024-01-25 07:47:43'),(29,101,'Operator [Employee ID:101]: Task Assigned to: Robot3 Destination: Landmark1','2024-01-25 07:49:55'),(30,101,'Operator [Employee ID: 101]: Logged Out','2024-01-25 09:37:03'),(31,101,'Operator [Employee ID:101]: Logged In','2024-01-25 09:37:41'),(32,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark2','2024-01-25 10:37:02'),(33,101,'Operator [Employee ID:101]: Task Assigned to: Robot3 Destination: Landmark2','2024-01-25 10:56:01'),(34,101,'Operator [Employee ID: 101]: Logged Out','2024-01-25 11:19:53'),(35,101,'Operator [Employee ID:101]: Logged In','2024-01-25 11:19:57'),(36,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark4','2024-01-25 11:47:02'),(37,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark2','2024-01-28 17:53:40'),(38,101,'Operator [Employee ID: 101]: Logged Out','2024-01-28 17:57:35'),(39,101,'Operator [Employee ID:101]: Logged In','2024-01-28 17:57:45'),(40,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark1','2024-01-28 20:14:17'),(41,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark1','2024-01-28 20:15:45'),(42,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark2','2024-01-28 20:16:57'),(43,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark1','2024-01-28 20:25:41'),(44,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark1','2024-01-28 20:34:05'),(45,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark1','2024-01-28 20:34:17'),(46,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark1','2024-01-28 20:34:28'),(47,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark4','2024-01-28 20:40:51'),(48,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark2','2024-01-28 20:42:33'),(49,101,'Operator [Employee ID:101]: Task Assigned to: Robot3 Destination: Landmark3','2024-01-28 20:42:45'),(50,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark3','2024-01-28 20:45:07'),(51,101,'Operator [Employee ID: 101]: Logged Out','2024-01-28 21:10:48'),(52,101,'Operator [Employee ID:101]: Logged In','2024-01-28 21:10:52'),(53,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark1','2024-01-28 21:21:12'),(54,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark2','2024-01-28 21:21:26'),(55,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark2','2024-01-28 21:21:41'),(56,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark1','2024-01-28 21:21:48'),(57,101,'Operator [Employee ID:101]: Task Assigned to: Robot3 Destination: Landmark4','2024-01-28 21:21:57'),(58,101,'Operator [Employee ID: 101]: Logged Out','2024-01-28 21:24:32'),(59,102,'Operator [Employee ID:102]: Task Assigned to: Robot3 Destination: Landmark1','2024-01-28 21:47:11'),(60,102,'Operator [Employee ID:102]: Task Assigned to: Robot1 Destination: Landmark1','2024-01-28 21:48:54'),(61,102,'Operator [Employee ID:102]: Task Assigned to: Robot2 Destination: Landmark3','2024-01-28 22:07:26'),(62,102,'Operator [Employee ID:102]: Task Assigned to: Robot3 Destination: Landmark4','2024-01-28 22:07:38'),(63,102,'Operator [Employee ID:102]: Task Assigned to: Robot1 Destination: Landmark1','2024-01-28 22:10:58'),(64,101,'Operator [Employee ID:101]: Logged In','2024-01-28 22:19:06'),(65,102,'Operator [Employee ID: 102]: Logged Out','2024-01-28 22:34:54'),(66,101,'Operator [Employee ID: 101]: Logged Out','2024-01-28 22:37:55'),(67,103,'Operator [Employee ID:103]: Logged In','2024-01-28 22:38:10'),(68,103,'Operator [Employee ID:103]: Task Assigned to: Robot2 Destination: Landmark2','2024-01-28 22:38:26'),(69,101,'Operator [Employee ID:101]: Logged In','2024-01-29 17:58:07'),(70,101,'Operator [Employee ID:101]: Task Assigned to: Robot3 Destination: Landmark1','2024-01-29 21:10:55'),(71,101,'Operator [Employee ID: 101]: Logged Out','2024-02-01 10:23:48'),(72,101,'Operator [Employee ID:101]: Logged In','2024-02-01 10:23:55'),(73,101,'Operator [Employee ID: 101]: Logged Out','2024-02-01 10:24:26'),(74,101,'Operator [Employee ID:101]: Logged In','2024-02-01 10:24:30'),(75,101,'Operator [Employee ID: 101]: Logged Out','2024-02-06 07:17:11'),(76,101,'Operator [Employee ID:101]: Logged In','2024-02-06 07:17:15'),(77,101,'Operator [Employee ID:101]: Task Assigned to: Robot3 Destination: Landmark2','2024-02-12 13:40:20'),(78,101,'Operator [Employee ID: 101]: Logged Out','2024-02-13 06:29:32'),(79,101,'Operator [Employee ID:101]: Logged In','2024-02-13 07:03:44'),(80,101,'Operator [Employee ID:101]: Task Assigned to: Robot3 Destination: Landmark1','2024-02-13 09:01:21'),(81,101,'Operator [Employee ID:101]: Task Assigned to: Robot3 Destination: Landmark2','2024-02-13 09:03:32'),(82,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark1','2024-02-13 09:04:06'),(83,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark3','2024-02-13 09:04:13'),(84,101,'Operator [Employee ID: 101]: Logged Out','2024-02-13 09:20:28'),(85,101,'Operator [Employee ID:101]: Logged In','2024-02-13 09:29:33'),(86,101,'Operator [Employee ID:101]: Task Assigned to: Robot3 Destination: Landmark1','2024-02-13 09:30:41'),(87,101,'Operator [Employee ID:101]: Task Assigned to: Robot3 Destination: Landmark2','2024-02-13 09:30:52'),(88,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark1','2024-02-13 10:12:25'),(89,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark2','2024-02-13 10:12:32'),(90,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark1','2024-02-13 11:19:34'),(91,101,'Operator [Employee ID:101]: Task Assigned to: Robot3 Destination: Landmark2','2024-02-14 04:52:48'),(92,101,'Operator [Employee ID:101]: Task Assigned to: Robot3 Destination: Landmark2','2024-02-14 04:52:51'),(93,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark4','2024-02-14 06:31:39'),(94,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark3','2024-02-14 06:34:53'),(95,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark4','2024-02-14 06:39:29'),(96,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark3','2024-02-14 07:01:44'),(97,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark4','2024-02-14 07:02:28'),(98,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark3','2024-02-14 07:02:35'),(99,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark4','2024-02-14 07:35:08'),(100,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark3','2024-02-14 07:35:17'),(101,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark1','2024-02-14 07:36:38'),(102,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark3','2024-02-14 07:37:27'),(103,101,'Operator [Employee ID:101]: Task Assigned to: Robot3 Destination: Landmark2','2024-02-14 07:37:40'),(104,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark1','2024-02-14 07:37:50'),(105,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark3','2024-02-14 07:38:20'),(106,102,'Operator [Employee ID:102]: Logged In','2024-02-14 07:41:36'),(107,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark4','2024-02-14 09:44:29'),(112,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark3','2024-02-14 09:49:19'),(113,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark4','2024-02-14 09:49:36'),(114,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark2','2024-02-14 09:49:42'),(115,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark1','2024-02-14 09:49:48'),(116,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark2','2024-02-14 09:50:00'),(117,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark1','2024-02-14 10:03:40'),(118,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark1','2024-02-14 10:04:04'),(119,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark1','2024-02-14 10:04:17'),(120,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark1','2024-02-14 10:06:30'),(121,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark1','2024-02-14 10:06:40'),(122,101,'Operator [Employee ID:101]: Task Assigned to: Robot3 Destination: Landmark2','2024-02-14 10:07:54'),(123,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark4','2024-02-14 10:08:06'),(124,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark1','2024-02-14 10:22:38'),(125,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark1','2024-02-14 10:22:43'),(126,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark1','2024-02-14 10:22:44'),(127,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark4','2024-02-14 14:28:25'),(128,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark1','2024-02-14 14:29:47'),(129,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark3','2024-02-14 14:30:38'),(130,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark1','2024-02-14 15:28:48'),(131,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark3','2024-02-14 15:29:27'),(132,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark1','2024-02-14 15:31:06'),(133,101,'Operator [Employee ID: 101]: Logged Out','2024-02-14 15:37:56'),(134,101,'Operator [Employee ID:101]: Logged In','2024-02-15 05:45:19'),(135,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark3','2024-02-15 06:25:14'),(136,102,'Operator [Employee ID: 102]: Logged Out','2024-02-15 06:30:35'),(137,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark1','2024-02-15 06:34:18'),(138,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark2','2024-02-15 06:34:26'),(139,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark4','2024-02-15 06:34:45'),(140,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark4','2024-02-15 06:35:41'),(141,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark4','2024-02-15 06:35:50'),(142,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark4','2024-02-15 06:36:30'),(143,101,'Operator [Employee ID: 101]: Logged Out','2024-02-15 06:37:58'),(144,101,'Operator [Employee ID:101]: Logged In','2024-02-15 06:38:01'),(145,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark4','2024-02-15 06:43:12'),(146,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark2','2024-02-15 06:43:27'),(147,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark2','2024-02-15 06:43:28'),(148,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark3','2024-02-15 06:45:45'),(149,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark1','2024-02-15 06:45:54'),(150,101,'Operator [Employee ID:101]: Task Assigned to: Robot3 Destination: Landmark2','2024-02-15 06:46:11'),(151,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark3','2024-02-15 06:46:22'),(152,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark3','2024-02-15 06:48:01'),(153,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark3','2024-02-15 06:50:23'),(154,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark3','2024-02-15 06:50:34'),(155,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark3','2024-02-15 06:50:45'),(156,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark3','2024-02-15 06:52:51'),(157,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark3','2024-02-15 06:53:01'),(158,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark3','2024-02-15 06:54:20'),(159,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark3','2024-02-15 06:54:55'),(160,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark3','2024-02-15 07:08:56'),(161,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark3','2024-02-15 07:10:11'),(162,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark1','2024-02-15 07:10:36'),(163,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark2','2024-02-15 07:10:43'),(164,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark2','2024-02-15 07:10:51'),(165,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark4','2024-02-15 07:10:58'),(166,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark3','2024-02-15 09:46:03'),(167,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark2','2024-02-15 10:00:38'),(168,101,'Operator [Employee ID:101]: Task Assigned to: Robot2 Destination: Landmark2','2024-02-15 10:00:46'),(169,101,'Operator [Employee ID: 101]: Logged Out','2024-02-16 05:30:44'),(170,101,'Operator [Employee ID:101]: Logged In','2024-02-16 05:31:15'),(171,101,'Operator [Employee ID: 101]: Logged Out','2024-02-16 05:48:41'),(172,101,'Operator [Employee ID:101]: Logged In','2024-02-16 06:08:19'),(173,101,'Operator [Employee ID:101]: Task Assigned to: Robot1 Destination: Landmark4','2024-02-16 06:08:39'),(174,101,'Operator [Employee ID: 101]: Logged Out','2024-02-16 06:16:01'),(175,101,'Operator [Employee ID:101]: Logged In','2024-02-16 06:57:20'),(176,101,'[Employee ID: 101]: Logged Out','2024-03-13 08:33:35'),(177,101,'[Employee ID:101]: Logged In','2024-03-13 08:33:41'),(178,101,'[Employee ID:101]: Assigned Task to: Robot2 Destination: Landmark1','2024-03-13 08:38:23'),(179,101,'[Employee ID:101]: Assigned Task to: Robot2 Destination: Landmark2','2024-03-15 11:24:32'),(180,101,'[Employee ID: 101]: Logged Out','2024-04-02 08:16:27'),(181,101,'[Employee ID:101]: Logged In','2024-04-02 08:16:38'),(182,101,'[Employee ID: 101]: Logged Out','2024-04-02 09:19:23'),(183,101,'[Employee ID:101]: Logged In','2024-04-02 09:19:27'),(184,101,'[Employee ID: 101]: Logged Out','2024-04-02 09:19:31'),(185,101,'[Employee ID:101]: Logged In','2024-04-02 09:19:38'),(186,101,'[Employee ID:101]: Assigned Task to: Robot2 Destination: Landmark1','2024-04-02 09:45:49'),(187,101,'[Employee ID:101]: Assigned Task to: Robot2 Destination: Landmark2','2024-04-02 09:45:58'),(188,101,'[Employee ID:101]: Assigned Task to: Robot2 Destination: Landmark1','2024-04-02 09:47:49'),(189,101,'[Employee ID:101]: Assigned Task to: Robot2 Destination: Landmark1','2024-04-02 09:47:56'),(190,101,'[Employee ID:101]: Assigned Task to: Robot2 Destination: Landmark1','2024-04-02 09:48:19'),(191,101,'[Employee ID:101]: Assigned Task to: Robot2 Destination: Landmark1','2024-04-02 09:48:34'),(192,101,'[Employee ID:101]: Assigned Task to: Robot2 Destination: Landmark1','2024-04-02 09:48:39'),(193,101,'[Employee ID:101]: Assigned Task to: Robot2 Destination: Landmark2','2024-04-02 09:48:53'),(194,101,'[Employee ID:101]: Assigned Task to: Robot3 Destination: Landmark1','2024-04-02 09:49:16'),(195,101,'[Employee ID:101]: Assigned Task to: Robot1 Destination: Landmark3','2024-04-02 10:50:45'),(196,101,'[Employee ID:101]: Assigned Task to: Robot1 Destination: Landmark3','2024-04-02 10:50:52'),(197,101,'[Employee ID:101]: Assigned Task to: Robot1 Destination: Landmark4','2024-04-02 11:08:32'),(198,101,'[Employee ID: 101]: Logged Out','2024-04-02 11:18:32'),(199,101,'[Employee ID:101]: Logged In','2024-04-02 11:18:39'),(200,101,'[Employee ID: 101]: Logged Out','2024-04-05 06:51:33'),(201,101,'[Employee ID:101]: Logged In','2024-04-05 06:51:37'),(202,101,'[Employee ID: 101]: Logged Out','2024-04-05 07:35:12'),(203,101,'[Employee ID:101]: Logged In','2024-04-05 07:37:11'),(204,101,'[Employee ID:101]: Assigned Task to: Robot2 Destination: Landmark1','2024-04-05 08:31:38'),(205,101,'[Employee ID:101]: Assigned Task to: Robot3 Destination: Landmark2','2024-04-05 08:31:57'),(206,101,'[Employee ID:101]: Assigned Task to: Robot1 Destination: Landmark3','2024-04-05 08:40:14'),(207,101,'[Employee ID:101]: Assigned Task to: Robot3 Destination: Landmark4','2024-04-05 08:40:30'),(208,101,'[Employee ID:101]: Assigned Task to: Robot3 Destination: Landmark3','2024-04-05 08:40:42'),(209,101,'[Employee ID:101]: Assigned Task to: Robot1 Destination: Landmark3','2024-04-05 08:40:58'),(210,101,'[Employee ID: 101]: Logged Out','2024-04-05 08:50:40'),(211,101,'[Employee ID:101]: Logged In','2024-04-05 08:50:45'),(212,101,'[Employee ID: 101]: Logged Out','2024-04-05 08:51:15'),(213,101,'[Employee ID:101]: Logged In','2024-04-05 09:13:51'),(214,101,'[Employee ID: 101]: Logged Out','2024-04-05 09:13:54'),(215,101,'[Employee ID:101]: Logged In','2024-04-05 09:18:21'),(216,101,'[Employee ID: 101]: Logged Out','2024-04-05 09:20:18'),(217,101,'[Employee ID:101]: Logged In','2024-04-05 09:58:32'),(218,101,'[Employee ID: 101]: Logged Out','2024-04-05 10:05:33'),(219,101,'[Employee ID:101]: Logged In','2024-04-05 10:05:37'),(220,101,'[Employee ID: 101]: Logged Out','2024-04-05 14:26:56'),(221,101,'[Employee ID:101]: Logged In','2024-04-05 14:27:01'),(222,101,'[Employee ID: 101]: Logged Out','2024-04-05 14:27:03'),(223,101,'[Employee ID:101]: Logged In','2024-04-05 14:27:12'),(224,101,'[Employee ID: 101]: Logged Out','2024-04-05 14:29:07'),(225,103,'[Employee ID:103]: Assigned Task to: Robot3 Destination: Landmark4','2024-04-05 14:29:26'),(226,103,'[Employee ID:103]: Assigned Task to: Robot3 Destination: Landmark2','2024-04-05 14:38:51'),(227,101,'[Employee ID:101]: Logged In','2024-04-05 14:43:23'),(228,101,'[Employee ID: 101]: Logged Out','2024-04-05 14:50:13'),(229,101,'[Employee ID:101]: Logged In','2024-04-05 14:50:22'),(230,101,'[Employee ID: 101]: Logged Out','2024-04-05 14:51:46'),(231,101,'[Employee ID:101]: Logged In','2024-04-05 14:51:50'),(232,101,'[Employee ID: 101]: Logged Out','2024-04-06 09:18:51'),(233,103,'[Employee ID: 103]: Logged Out','2024-04-06 09:19:21'),(234,101,'[Employee ID:101]: Logged In','2024-04-06 13:05:41'),(235,101,'[Employee ID: 101]: Logged Out','2024-04-06 13:30:01'),(236,101,'[Employee ID:101]: Logged In','2024-04-06 13:30:09'),(237,101,'[Employee ID: 101]: Logged Out','2024-04-18 09:34:17'),(238,102,'[Employee ID:102]: Logged In','2024-04-18 09:34:24'),(239,101,'[Employee ID:101]: Logged In','2024-04-22 05:03:01'),(240,101,'[Employee ID: 101]: Logged Out','2024-06-24 09:35:37'),(241,101,'[Employee ID:101]: Logged In','2024-06-24 09:35:40'),(242,101,'[Employee ID:101]: Assigned Task to: Robot3 Destination: Landmark4','2024-06-24 11:07:45'),(243,101,'[Employee ID:101]: Assigned Task to: Robot2 Destination: Landmark2','2024-06-24 11:07:55'),(244,101,'[Employee ID: 101]: Logged Out','2024-06-24 14:45:31'),(245,101,'[Employee ID:101]: Logged In','2024-06-24 14:45:35');
/*!40000 ALTER TABLE `employee_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `landmark_coordinates`
--

DROP TABLE IF EXISTS `landmark_coordinates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `landmark_coordinates` (
  `Entry_id` int NOT NULL AUTO_INCREMENT,
  `Coordinate_id` varchar(50) NOT NULL,
  `Robot_id` varchar(50) DEFAULT NULL,
  `Latitude` varchar(20) NOT NULL,
  `Longitude` varchar(20) NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landmark_coordinates`
--

LOCK TABLES `landmark_coordinates` WRITE;
/*!40000 ALTER TABLE `landmark_coordinates` DISABLE KEYS */;
INSERT INTO `landmark_coordinates` VALUES (1,'Landmark1',NULL,'15.3692','75.1232','2024-06-24 11:07:55'),(2,'Landmark2','Robot2','15.3693','75.1232','2024-06-24 11:07:55'),(3,'Landmark3','Robot1','15.3692181','75.1235114','2024-04-05 08:40:58'),(4,'Landmark4','Robot3','15.3693','75.1235','2024-06-24 11:07:45');
/*!40000 ALTER TABLE `landmark_coordinates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mapped_coordinates`
--

DROP TABLE IF EXISTS `mapped_coordinates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mapped_coordinates` (
  `Entry_id` int NOT NULL AUTO_INCREMENT,
  `Coordinate_id` varchar(50) NOT NULL,
  `Coordinate_type` varchar(50) NOT NULL,
  `Marker_id` varchar(50) NOT NULL,
  `NMEA_Message` varchar(100) NOT NULL,
  `Latitude` float NOT NULL,
  `Longitude` float NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapped_coordinates`
--

LOCK TABLES `mapped_coordinates` WRITE;
/*!40000 ALTER TABLE `mapped_coordinates` DISABLE KEYS */;
INSERT INTO `mapped_coordinates` VALUES (1,'Perimeter1','Perimeter','marker1','$GPGGA,114527.031,1522.147,N,07507.381,E,1,12,1.0,0.0,M,0.0,M,,*',15.3691,75.123,'2024-01-24 08:59:41'),(2,'Perimeter2','Perimeter','marker2','$GPGGA,114528.031,1522.156,N,07507.386,E,1,12,1.0,0.0,M,0.0,M,,*',15.3693,75.1231,'2024-01-24 08:59:41'),(3,'Perimeter3','Perimeter','marker3','$GPGGA,114529.031,1522.162,N,07507.390,E,1,12,1.0,0.0,M,0.0,M,,*',15.3694,75.1232,'2024-01-24 08:59:41'),(4,'Perimeter4','Perimeter','marker4','$GPGGA,114530.031,1522.168,N,07507.393,E,1,12,1.0,0.0,M,0.0,M,,*',15.3695,75.1232,'2024-01-24 08:59:41'),(5,'Perimeter5','Perimeter','marker5','$GPGGA,114531.031,1522.167,N,07507.405,E,1,12,1.0,0.0,M,0.0,M,,*',15.3694,75.1234,'2024-01-24 08:59:41'),(6,'Perimeter6','Perimeter','marker6','$GPGGA,114532.031,1522.166,N,07507.415,E,1,12,1.0,0.0,M,0.0,M,,*',15.3694,75.1236,'2024-01-24 08:59:41'),(7,'Perimeter7','Perimeter','marker7','$GPGGA,114533.031,1522.159,N,07507.414,E,1,12,1.0,0.0,M,0.0,M,,*',15.3693,75.1236,'2024-01-24 08:59:41'),(8,'Perimeter8','Perimeter','marker8','$GPGGA,114534.031,1522.159,N,07507.422,E,1,12,1.0,0.0,M,0.0,M,,*',15.3693,75.1237,'2024-01-24 08:59:41'),(9,'Perimeter9','Perimeter','marker9','$GPGGA,114535.031,1522.152,N,07507.421,E,1,12,1.0,0.0,M,0.0,M,,*',15.3692,75.1237,'2024-01-24 08:59:41'),(10,'Perimeter10','Perimeter','marker10','$GPGGA,114536.031,1522.151,N,07507.429,E,1,12,1.0,0.0,M,0.0,M,,*',15.3692,75.1238,'2024-01-24 08:59:41'),(11,'Perimeter11','Perimeter','marker11','$GPGGA,114537.031,1522.159,N,07507.429,E,1,12,1.0,0.0,M,0.0,M,,*',15.3693,75.1238,'2024-01-24 08:59:41'),(12,'Perimeter12','Perimeter','marker12','$GPGGA,114538.031,1522.157,N,07507.445,E,1,12,1.0,0.0,M,0.0,M,,*',15.3693,75.1241,'2024-01-24 08:59:41'),(13,'Perimeter13','Perimeter','marker13','$GPGGA,114539.031,1522.141,N,07507.444,E,1,12,1.0,0.0,M,0.0,M,,*',15.369,75.1241,'2024-01-24 08:59:41'),(14,'Perimeter14','Perimeter','marker14','$GPGGA,114540.031,1522.142,N,07507.430,E,1,12,1.0,0.0,M,0.0,M,,*',15.369,75.1238,'2024-01-24 08:59:41'),(15,'Perimeter15','Perimeter','marker15','$GPGGA,114541.031,1522.144,N,07507.412,E,1,12,1.0,0.0,M,0.0,M,,*',15.3691,75.1235,'2024-01-24 08:59:41'),(16,'Perimeter16','Perimeter','marker16','$GPGGA,114542.031,1522.145,N,07507.398,E,1,12,1.0,0.0,M,0.0,M,,*',15.3691,75.1233,'2024-01-24 08:59:41'),(17,'Perimeter17','Perimeter','marker17','$GPGGA,114543.031,1522.146,N,07507.386,E,1,12,1.0,0.0,M,0.0,M,,*',15.3691,75.1231,'2024-01-24 08:59:41'),(18,'Landmark1','Landmark','marker18','$GPGGA,125614.243,1522.149,N,07507.389,E,1,12,1.0,0.0,M,0.0,M,,*',15.3692,75.1232,'2024-01-24 08:59:41'),(19,'Landmark2','Landmark','marker19','$GPGGA,125619.243,1522.155,N,07507.389,E,1,12,1.0,0.0,M,0.0,M,,*',15.3693,75.1232,'2024-01-24 08:59:41'),(20,'Landmark3','Landmark','marker20','$GPGGA,125615.243,1522.149,N,07507.411,E,1,12,1.0,0.0,M,0.0,M,,*',15.3692,75.1235,'2024-01-24 08:59:41'),(21,'Landmark4','Landmark','marker21','$GPGGA,125617.243,1522.155,N,07507.411,E,1,12,1.0,0.0,M,0.0,M,,*',15.3693,75.1235,'2024-01-24 08:59:41');
/*!40000 ALTER TABLE `mapped_coordinates` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `mapped_coordinates_AFTER_INSERT` AFTER INSERT ON `mapped_coordinates` FOR EACH ROW BEGIN
	if new.Coordinate_type = 'Landmark' then
		insert into Landmark_coordinates(Coordinate_id, Marker_id, NMEA_Message, Latitude, Longitude, time_stamp) values(new.Coordinate_id, new.Marker_id, new.NMEA_Message, new.Latitude, new.Longitude, new.time_stamp);
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `motor_battery_consumption_log`
--

DROP TABLE IF EXISTS `motor_battery_consumption_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motor_battery_consumption_log` (
  `Entry_id` int NOT NULL AUTO_INCREMENT,
  `robot_id` varchar(50) NOT NULL,
  `current_battery_level` int NOT NULL,
  `last_updated` timestamp NULL DEFAULT NULL,
  `uptime_1_percent` time DEFAULT '00:00:00',
  `current__uptime` time DEFAULT '00:00:00',
  `total__uptime` time DEFAULT '00:00:00',
  PRIMARY KEY (`Entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motor_battery_consumption_log`
--

LOCK TABLES `motor_battery_consumption_log` WRITE;
/*!40000 ALTER TABLE `motor_battery_consumption_log` DISABLE KEYS */;
INSERT INTO `motor_battery_consumption_log` VALUES (1,'Robot1',75,'2024-02-06 07:25:56','00:05:02','00:00:00','00:00:00'),(2,'Robot1',74,'2024-02-06 07:30:58','00:05:01','00:05:01','00:05:01'),(3,'Robot1',73,'2024-02-06 07:36:02','00:05:03','00:10:04','00:10:04'),(4,'Robot1',72,'2024-02-06 07:41:05','00:05:02','00:15:06','00:15:06'),(5,'Robot1',72,'2024-02-06 09:36:33','01:55:27','02:10:33','02:10:33'),(6,'Robot1',71,'2024-02-08 06:05:47','00:05:02','02:15:35','02:15:35'),(7,'Robot1',71,'2024-02-08 06:07:22','00:01:34','02:17:09','02:17:09'),(8,'Robot1',71,'2024-02-08 06:11:43','00:04:09','02:21:18','02:21:18'),(9,'Robot1',70,'2024-02-08 06:15:46','00:04:02','02:25:20','02:25:20'),(10,'Robot1',69,'2024-02-08 06:19:49','00:04:02','02:29:22','02:29:22'),(11,'Robot1',68,'2024-02-08 06:23:52','00:04:02','02:33:24','02:33:24'),(12,'Robot1',67,'2024-02-08 06:27:55','00:04:02','02:37:26','02:37:26'),(13,'Robot2',60,'2024-02-08 06:36:02','00:04:03','00:00:00','00:00:00'),(14,'Robot2',59,'2024-02-08 06:40:05','00:04:02','00:04:02','00:04:02'),(15,'Robot2',58,'2024-02-08 06:44:07','00:04:01','00:08:03','00:08:03'),(16,'Robot2',57,'2024-02-08 06:48:11','00:04:03','00:12:06','00:12:06'),(17,'Robot2',56,'2024-02-08 06:52:14','00:04:02','00:16:08','00:16:08'),(18,'Robot3',50,'2024-02-08 07:00:18','00:04:01','00:00:00','00:00:00'),(19,'Robot3',49,'2024-02-08 07:04:21','00:04:02','00:04:02','00:04:02'),(20,'Robot3',48,'2024-02-08 07:08:23','00:04:01','00:08:03','00:08:03'),(21,'Robot3',47,'2024-02-08 07:12:25','00:04:01','00:12:04','00:12:04'),(22,'Robot3',46,'2024-02-08 07:16:27','00:04:01','00:16:05','00:16:05');
/*!40000 ALTER TABLE `motor_battery_consumption_log` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `motor_battery_consumption_log_BEFORE_INSERT` BEFORE INSERT ON `motor_battery_consumption_log` FOR EACH ROW BEGIN
	 DECLARE prev_uptime TIME;
    DECLARE prev_total_uptime TIME;
    
    -- Get the value of current__uptime and total__uptime from the previous row
    SELECT current__uptime, total__uptime
    INTO prev_uptime, prev_total_uptime
    FROM motor_battery_consumption_log
    WHERE robot_id = NEW.robot_id
    ORDER BY Entry_id DESC
    LIMIT 1;

    -- Set the value of current__uptime for the new row
    SET NEW.current__uptime = IFNULL(ADDTIME(NEW.uptime_1_percent, prev_uptime), '00:00:00');
    
    -- Set the value of total__uptime for the new row
    SET NEW.total__uptime = IFNULL(ADDTIME(NEW.uptime_1_percent, prev_total_uptime), '00:00:00');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `motor_battery_info`
--

DROP TABLE IF EXISTS `motor_battery_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motor_battery_info` (
  `Entry_id` int NOT NULL AUTO_INCREMENT,
  `robot_id` varchar(50) NOT NULL,
  `battery_status` varchar(15) DEFAULT NULL,
  `current_battery_level` int NOT NULL,
  `last_updated` timestamp NULL DEFAULT NULL,
  `uptime_1_percent` time DEFAULT '00:00:00',
  `Current_estimated_uptime` time DEFAULT '00:00:00',
  PRIMARY KEY (`Entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motor_battery_info`
--

LOCK TABLES `motor_battery_info` WRITE;
/*!40000 ALTER TABLE `motor_battery_info` DISABLE KEYS */;
INSERT INTO `motor_battery_info` VALUES (1,'Robot1','active',71,'2024-02-08 06:31:58','00:04:02','07:22:12'),(2,'Robot2','active',60,'2024-02-08 06:56:16','00:04:01','06:07:35'),(3,'Robot3','active',50,'2024-02-08 07:20:29','00:04:01','05:00:45');
/*!40000 ALTER TABLE `motor_battery_info` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `motor_battery_info_BEFORE_UPDATE` BEFORE UPDATE ON `motor_battery_info` FOR EACH ROW BEGIN
	IF NEW.current_battery_level = OLD.current_battery_level THEN
    IF NEW.battery_status = 'active' AND OLD.battery_status = 'active' THEN
        SET NEW.battery_status = 'active';
        SET NEW.last_updated = NOW();
        SET NEW.uptime_1_percent = IFNULL(ADDTIME(old.uptime_1_percent, TIMEDIFF(NOW(), old.last_updated)), '00:00:00');
        SET NEW.Current_estimated_uptime = IFNULL(SEC_TO_TIME(NEW.uptime_1_percent * NEW.current_battery_level), '00:00:00');
    ELSEIF NEW.battery_status = 'inactive' AND OLD.battery_status = 'active' THEN
        SET NEW.last_updated = NOW();
        SET NEW.uptime_1_percent = IFNULL(ADDTIME(old.uptime_1_percent, TIMEDIFF(NOW(), old.last_updated)), '00:00:00');
        SET NEW.Current_estimated_uptime = IFNULL(SEC_TO_TIME(NEW.uptime_1_percent * NEW.current_battery_level), '00:00:00');
    ELSEIF NEW.battery_status = 'active' AND OLD.battery_status = 'inactive' THEN
        SET NEW.last_updated = NOW();
    END IF;
ELSEIF NEW.current_battery_level < OLD.current_battery_level THEN
	insert into motor_battery_consumption_log(robot_id,current_battery_level,last_updated,uptime_1_percent)
    values(old.robot_id,old.current_battery_level,old.last_updated,old.uptime_1_percent);
    SET NEW.last_updated = NOW();
    SET NEW.uptime_1_percent = '00:00:00';
    SET NEW.Current_estimated_uptime = '00:00:00';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `robot_info`
--

DROP TABLE IF EXISTS `robot_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `robot_info` (
  `Entry_id` int NOT NULL AUTO_INCREMENT,
  `robot_id` varchar(20) NOT NULL,
  `charge_electronics_battery` int NOT NULL,
  `charge_motor_battery` int NOT NULL,
  `Latitude` double NOT NULL,
  `Longitude` double NOT NULL,
  `current_assignment` varchar(100) NOT NULL,
  PRIMARY KEY (`Entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robot_info`
--

LOCK TABLES `robot_info` WRITE;
/*!40000 ALTER TABLE `robot_info` DISABLE KEYS */;
INSERT INTO `robot_info` VALUES (1,'Robot1',61,71,15.3692355,75.1235555,'Landmark3'),(2,'Robot2',55,60,15.3692225,75.1233333,'Landmark2'),(3,'Robot3',45,50,15.3692444,75.1234444,'Landmark4');
/*!40000 ALTER TABLE `robot_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robot_log`
--

DROP TABLE IF EXISTS `robot_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `robot_log` (
  `Entry_id` int NOT NULL AUTO_INCREMENT,
  `robot_id` varchar(20) NOT NULL,
  `charge_electronics_battery` int NOT NULL,
  `charge_motor_battery` int NOT NULL,
  `current_latitude` float NOT NULL,
  `current_longitude` float NOT NULL,
  `previous_latitude` float NOT NULL,
  `previous_longitude` float NOT NULL,
  `event_description` varchar(100) DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robot_log`
--

LOCK TABLES `robot_log` WRITE;
/*!40000 ALTER TABLE `robot_log` DISABLE KEYS */;
INSERT INTO `robot_log` VALUES (1,'Robot2',60,13,15.3697,75.1232,15.3697,75.1232,'Bot Movement from (15.3697, 75.1232) to (15.3697, 75.1232)','2024-01-23 11:37:25'),(2,'Robot2',60,13,15.3696,75.1232,15.3697,75.1232,'Bot Movement from (15.3697, 75.1232) to (15.3696, 75.1232)','2024-01-23 11:45:20'),(3,'Robot2',60,13,15.3697,75.1232,15.3696,75.1232,'Bot Movement from (15.3696, 75.1232) to (15.3697, 75.1232)','2024-01-23 14:51:45'),(4,'Robot1',61,71,15.3693,75.1234,15.3696,75.1232,'Bot Movement from (15.3696, 75.1232) to (15.3693, 75.1234)','2024-02-14 06:19:02'),(12,'Robot2',55,60,15.3696,75.1232,15.3697,75.1232,'Bot Movement from (15.3697, 75.1232) to (15.3696, 75.1232)','2024-02-14 07:05:10'),(28,'Robot3',45,50,15.3696,75.1233,15.3695,75.1232,'Bot Movement from (15.3695, 75.1232) to (15.3696, 75.1233)','2024-02-14 07:45:03');
/*!40000 ALTER TABLE `robot_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_log`
--

DROP TABLE IF EXISTS `task_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_log` (
  `Entry_id` int NOT NULL AUTO_INCREMENT,
  `Employee_ID` varchar(50) NOT NULL,
  `robot_id` varchar(50) NOT NULL,
  `charge_electronics_battery` int NOT NULL,
  `charge_motor_battery` int NOT NULL,
  `destination` varchar(50) NOT NULL,
  `additional_description` varchar(50) NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_log`
--

LOCK TABLES `task_log` WRITE;
/*!40000 ALTER TABLE `task_log` DISABLE KEYS */;
INSERT INTO `task_log` VALUES (1,'101','Robot1',50,80,'Landmark1','','2024-01-24 10:01:46'),(2,'101','Robot1',50,80,'Landmark1','','2024-01-24 10:33:54'),(3,'101','Robot3',27,50,'Landmark1','','2024-01-24 10:34:02'),(5,'101','Robot3',27,50,'Landmark2','','2024-01-24 11:02:20'),(6,'101','Robot3',27,50,'Landmark3','','2024-01-24 11:10:01'),(7,'101','Robot3',27,50,'Landmark2','','2024-01-24 11:11:59'),(8,'101','Robot1',50,80,'Landmark2','','2024-01-24 10:49:31'),(9,'101','Robot1',50,80,'Landmark3','','2024-01-24 11:15:58'),(10,'101','Robot1',45,75,'Landmark1','','2024-01-24 12:21:26'),(11,'101','Robot2',60,13,'Landmark1','','2024-01-24 10:34:01'),(12,'101','Robot3',27,50,'Landmark3','','2024-01-24 11:13:34'),(13,'101','Robot3',27,50,'Landmark3','','2024-01-25 07:16:58'),(14,'101','Robot3',27,50,'Landmark1','Tomato Harvesting','2024-01-25 07:47:43'),(15,'101','Robot1',45,75,'Landmark1','','2024-01-25 07:16:58'),(16,'101','Robot3',27,50,'Landmark1','Tomato Harvesting','2024-01-25 07:47:43'),(17,'101','Robot2',55,13,'Landmark1','','2024-01-25 07:16:58'),(19,'101','Robot2',55,13,'Landmark4','','2024-01-25 11:47:02'),(20,'101','Robot1',45,75,'Landmark2','','2024-01-25 10:37:02'),(21,'101','Robot2',55,13,'Landmark2','Delivery','2024-01-28 17:53:40'),(22,'101','Robot1',45,75,'Landmark1','','2024-01-28 20:14:17'),(23,'101','Robot1',45,75,'Landmark2','','2024-01-28 20:16:57'),(24,'101','Robot1',45,75,'Landmark1','','2024-01-28 20:25:41'),(25,'101','Robot2',55,13,'Landmark1','','2024-01-28 20:15:45'),(26,'101','Robot2',55,13,'Landmark1','','2024-01-28 20:15:45'),(27,'101','Robot1',45,75,'Landmark1','','2024-01-28 20:25:41'),(28,'101','Robot1',45,75,'Landmark4','','2024-01-28 20:40:51'),(29,'101','Robot3',27,50,'Landmark2','','2024-01-25 10:56:01'),(30,'101','Robot1',45,75,'Landmark2','','2024-01-28 20:42:33'),(31,'101','Robot1',45,75,'Landmark3','','2024-01-28 20:45:07'),(32,'101','Robot1',45,75,'Landmark1','','2024-01-28 21:21:12'),(33,'101','Robot2',55,13,'Landmark1','','2024-01-28 20:15:45'),(34,'101','Robot1',45,75,'Landmark2','','2024-01-28 21:21:26'),(35,'101','Robot3',27,50,'Landmark3','','2024-01-28 20:42:45'),(36,'101','Robot3',27,50,'Landmark4','','2024-01-28 21:21:57'),(37,'101','Robot1',45,75,'Landmark1','','2024-01-28 21:21:48'),(38,'101','Robot2',55,13,'Landmark2','','2024-01-28 21:21:41'),(39,'102','Robot3',27,50,'Landmark1','Delivery','2024-01-28 21:47:11'),(40,'102','Robot1',45,75,'Landmark1','Tomato Harvesting','2024-01-28 21:48:54'),(41,'102','Robot2',55,13,'Landmark3','Tomato Harvesting','2024-01-28 22:07:26'),(42,'102','Robot3',27,50,'Landmark4','Tomato Harvesting','2024-01-28 22:07:38'),(43,'101','Robot3',45,50,'Landmark1','Harvesting','2024-01-29 21:10:55'),(44,'101','Robot3',45,50,'Landmark2','','2024-02-12 13:40:20'),(45,'101','Robot3',45,50,'Landmark1','','2024-02-13 09:01:21'),(46,'103','Robot2',55,13,'Landmark2','','2024-01-28 22:38:26'),(47,'102','Robot1',45,75,'Landmark1','','2024-01-28 22:10:58'),(48,'101','Robot3',45,50,'Landmark2','','2024-02-13 09:03:32'),(49,'101','Robot3',45,50,'Landmark1','','2024-02-13 09:30:41'),(50,'101','Robot2',55,60,'Landmark1','','2024-02-13 09:04:06'),(51,'101','Robot2',55,60,'Landmark1','','2024-02-13 09:04:06'),(52,'101','Robot2',55,60,'Landmark2','','2024-02-13 10:12:32'),(53,'101','Robot3',45,50,'Landmark2','','2024-02-13 09:30:52'),(54,'101','Robot3',45,50,'Landmark2','','2024-02-13 09:30:52'),(55,'101','Robot1',61,71,'Landmark3','','2024-02-13 09:04:13'),(56,'101','Robot1',61,71,'Landmark4','','2024-02-14 06:31:39'),(57,'101','Robot1',61,71,'Landmark3','','2024-02-14 06:34:53'),(58,'101','Robot1',61,71,'Landmark4','','2024-02-14 06:39:29'),(59,'101','Robot1',61,71,'Landmark3','','2024-02-14 07:01:44'),(60,'101','Robot1',61,71,'Landmark4','','2024-02-14 07:02:28'),(61,'101','Robot1',61,71,'Landmark3','','2024-02-14 07:02:35'),(62,'101','Robot2',55,60,'Landmark1','','2024-02-13 11:19:34'),(63,'101','Robot2',55,60,'Landmark3','','2024-02-14 07:35:17'),(64,'101','Robot2',55,60,'Landmark1','','2024-02-14 07:36:38'),(65,'101','Robot3',45,50,'Landmark2','','2024-02-13 09:30:52'),(66,'101','Robot2',55,60,'Landmark3','','2024-02-14 07:37:27'),(67,'101','Robot1',61,71,'Landmark4','','2024-02-14 07:35:08'),(92,'101','Robot1',61,71,'Landmark3','','2024-02-14 07:38:20'),(97,'101','Robot2',55,60,'Landmark1','','2024-02-14 07:37:50'),(98,'101','Robot2',55,60,'Landmark3','Delivery','2024-02-14 09:49:19'),(99,'101','Robot2',55,60,'Landmark4','Delivery','2024-02-14 09:49:36'),(100,'101','Robot2',55,60,'Landmark2','Delivery','2024-02-14 09:49:42'),(101,'101','Robot2',55,60,'Landmark1','Delivery','2024-02-14 09:49:48'),(102,'101','Robot1',61,71,'Landmark1','','2024-02-14 10:04:17'),(103,'101','Robot2',55,60,'Landmark1','','2024-02-14 10:03:40'),(104,'101','Robot3',45,50,'Landmark2','','2024-02-13 09:30:52'),(105,'101','Robot1',61,71,'Landmark1','','2024-02-14 10:04:17'),(106,'101','Robot1',61,71,'Landmark4','','2024-02-14 10:08:06'),(107,'101','Robot1',61,71,'Landmark1','','2024-02-14 10:22:38'),(108,'101','Robot1',61,71,'Landmark1','','2024-02-14 10:22:38'),(109,'101','Robot1',61,71,'Landmark1','','2024-02-14 10:22:38'),(110,'101','Robot2',55,60,'Landmark1','','2024-02-14 10:03:40'),(111,'101','Robot2',55,60,'Landmark1','','2024-02-14 10:03:40'),(112,'101','Robot2',55,60,'Landmark3','','2024-02-14 14:30:38'),(113,'101','Robot2',55,60,'Landmark1','','2024-02-14 15:28:48'),(114,'101','Robot2',55,60,'Landmark3','','2024-02-14 15:29:27'),(118,'101','Robot2',55,60,'Landmark1','','2024-02-14 15:31:06'),(119,'101','Robot2',55,60,'Landmark3','','2024-02-15 06:25:14'),(120,'101','Robot2',55,60,'Landmark1','','2024-02-15 06:34:18'),(121,'101','Robot2',55,60,'Landmark2','','2024-02-15 06:34:26'),(122,'101','Robot2',55,60,'Landmark4','','2024-02-15 06:34:45'),(123,'101','Robot2',55,60,'Landmark4','','2024-02-15 06:34:45'),(124,'101','Robot2',55,60,'Landmark4','','2024-02-15 06:34:45'),(125,'101','Robot1',61,71,'Landmark4','','2024-02-14 14:28:25'),(126,'101','Robot1',61,71,'Landmark4','','2024-02-14 14:28:25'),(127,'101','Robot1',61,71,'Landmark2','','2024-02-15 06:43:27'),(128,'101','Robot1',61,71,'Landmark2','','2024-02-15 06:43:27'),(129,'101','Robot2',55,60,'Landmark4','','2024-02-15 06:34:45'),(130,'101','Robot3',45,50,'Landmark2','','2024-02-13 09:30:52'),(131,'101','Robot2',55,60,'Landmark1','','2024-02-15 06:45:54'),(132,'101','Robot2',55,60,'Landmark3','','2024-02-15 06:46:22'),(133,'101','Robot2',55,60,'Landmark3','','2024-02-15 06:46:22'),(134,'101','Robot2',55,60,'Landmark3','','2024-02-15 06:46:22'),(135,'101','Robot2',55,60,'Landmark3','','2024-02-15 06:46:22'),(136,'101','Robot2',55,60,'Landmark3','','2024-02-15 06:46:22'),(137,'101','Robot2',55,60,'Landmark3','','2024-02-15 06:46:22'),(138,'101','Robot2',55,60,'Landmark3','','2024-02-15 06:46:22'),(139,'101','Robot2',55,60,'Landmark3','','2024-02-15 06:46:22'),(140,'101','Robot2',55,60,'Landmark3','','2024-02-15 06:46:22'),(141,'101','Robot1',61,71,'Landmark3','','2024-02-15 06:45:45'),(142,'101','Robot2',55,60,'Landmark3','','2024-02-15 06:46:22'),(143,'101','Robot2',55,60,'Landmark1','','2024-02-15 07:10:36'),(144,'101','Robot2',55,60,'Landmark2','','2024-02-15 07:10:43'),(145,'101','Robot1',61,71,'Landmark3','','2024-02-15 06:45:45'),(146,'101','Robot1',61,71,'Landmark4','','2024-02-15 07:10:58'),(147,'101','Robot2',55,60,'Landmark2','','2024-02-15 07:10:43'),(148,'101','Robot2',55,60,'Landmark2','','2024-02-15 07:10:43'),(149,'101','Robot1',61,71,'Landmark3','','2024-02-15 09:46:03'),(150,'101','Robot2',55,60,'Landmark2','','2024-02-15 07:10:43'),(151,'101','Robot2',55,60,'Landmark1','','2024-03-13 08:38:23'),(152,'101','Robot2',55,60,'Landmark2','','2024-03-15 11:24:32'),(153,'101','Robot2',55,60,'Landmark1','','2024-04-02 09:45:49'),(154,'101','Robot2',55,60,'Landmark2','','2024-04-02 09:45:58'),(155,'101','Robot2',55,60,'Landmark1','Not Specified','2024-04-02 09:47:49'),(156,'101','Robot2',55,60,'Landmark1','delivery','2024-04-02 09:47:56'),(157,'101','Robot2',55,60,'Landmark1','delivery','2024-04-02 09:47:56'),(158,'101','Robot2',55,60,'Landmark1','Not Specified','2024-04-02 09:48:34'),(159,'101','Robot2',55,60,'Landmark1','Delivery','2024-04-02 09:48:39'),(160,'101','Robot3',45,50,'Landmark2','','2024-02-13 09:30:52'),(161,'101','Robot1',61,71,'Landmark4','','2024-02-16 06:08:39'),(162,'101','Robot1',61,71,'Landmark3','Not Specified','2024-04-02 10:50:45'),(163,'101','Robot1',61,71,'Landmark3','Harvesting','2024-04-02 10:50:52'),(164,'101','Robot2',55,60,'Landmark2','Delivery','2024-04-02 09:48:53'),(165,'101','Robot3',45,50,'Landmark1','Delivery','2024-04-02 09:49:16'),(166,'101','Robot1',61,71,'Landmark4','Harvesting','2024-04-02 11:08:32'),(167,'101','Robot3',45,50,'Landmark2','Harvesting','2024-04-05 08:31:57'),(168,'101','Robot3',45,50,'Landmark4','Delivery','2024-04-05 08:40:30'),(169,'101','Robot1',61,71,'Landmark3','Delivery','2024-04-05 08:40:14'),(170,'101','Robot3',45,50,'Landmark3','Delivery','2024-04-05 08:40:42'),(171,'103','Robot3',45,50,'Landmark4','Harvesting','2024-04-05 14:29:26'),(174,'103','Robot3',45,50,'Landmark2','Harvesting','2024-04-05 14:38:51'),(175,'101','Robot2',55,60,'Landmark1','Not Specified','2024-04-05 08:31:38');
/*!40000 ALTER TABLE `task_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bhima_db_test_2'
--

--
-- Dumping routines for database 'bhima_db_test_2'
--
/*!50003 DROP PROCEDURE IF EXISTS `GetEmployeeLogs_limited` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GetEmployeeLogs_limited`(IN count int)
BEGIN
	SELECT event_description, time_stamp
    FROM Employee_log
    ORDER BY time_stamp DESC
    LIMIT count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetLatestUptime1Percent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GetLatestUptime1Percent`(IN robotid varchar(50))
BEGIN
    DECLARE motor_uptime_1_percent TIME;
    DECLARE electronics_uptime_1_percent TIME;
    DECLARE motor_numEntries INT;
    DECLARE electronics_numEntries INT;
    DECLARE motor_avgUptime1Percent TIME;
    DECLARE electronics_avgUptime1Percent TIME;

    -- Get the latest entry of 'uptime_1_percent' for motor_battery_consumption_log
    SELECT uptime_1_percent INTO motor_uptime_1_percent
    FROM motor_battery_consumption_log
    WHERE robot_id = robotid
    ORDER BY last_updated DESC
    LIMIT 1;

    -- Get the number of entries for motor_battery_consumption_log
    SELECT COUNT(*) INTO motor_numEntries
    FROM motor_battery_consumption_log
    WHERE robot_id = robotid;

    -- Calculate the average uptime_1_percent for motor_battery_consumption_log
    IF motor_numEntries > 5 THEN
        SELECT SEC_TO_TIME(AVG(TIME_TO_SEC(uptime_1_percent))) INTO motor_avgUptime1Percent
        FROM motor_battery_consumption_log
        WHERE robot_id = robotid;
    ELSE
        SET motor_avgUptime1Percent = motor_uptime_1_percent;
    END IF;

    -- Get the latest entry of 'uptime_1_percent' for electronics_battery_consumption_log
    SELECT uptime_1_percent INTO electronics_uptime_1_percent
    FROM electronics_battery_consumption_log
    WHERE robot_id = robotid
    ORDER BY last_updated DESC
    LIMIT 1;

    -- Get the number of entries for electronics_battery_consumption_log
    SELECT COUNT(*) INTO electronics_numEntries
    FROM electronics_battery_consumption_log
    WHERE robot_id = robotid;

    -- Calculate the average uptime_1_percent for electronics_battery_consumption_log
    IF electronics_numEntries > 5 THEN
        SELECT SEC_TO_TIME(AVG(TIME_TO_SEC(uptime_1_percent))) INTO electronics_avgUptime1Percent
        FROM electronics_battery_consumption_log
        WHERE robot_id = robotid;
    ELSE
        SET electronics_avgUptime1Percent = electronics_uptime_1_percent;
    END IF;

    -- Return the results
         SELECT motor_avgUptime1Percent , electronics_avgUptime1Percent;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-24 21:49:14
