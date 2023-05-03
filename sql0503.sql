CREATE DATABASE  IF NOT EXISTS `database` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `database`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: database
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `eval_list`
--

DROP TABLE IF EXISTS `eval_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eval_list` (
  `eval_id` int NOT NULL AUTO_INCREMENT,
  `eval_cnt` varchar(50) NOT NULL,
  `eval_ctg` int NOT NULL,
  `eval_imoji` char(4) NOT NULL,
  PRIMARY KEY (`eval_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eval_list`
--

LOCK TABLES `eval_list` WRITE;
/*!40000 ALTER TABLE `eval_list` DISABLE KEYS */;
INSERT INTO `eval_list` VALUES (1,'친절해요',0,'?'),(2,'분위기가 편안해요',0,'?');
/*!40000 ALTER TABLE `eval_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_eval`
--

DROP TABLE IF EXISTS `post_eval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_eval` (
  `post_eval_id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `store_id` int NOT NULL,
  `eval_id` int NOT NULL,
  PRIMARY KEY (`post_eval_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_eval`
--

LOCK TABLES `post_eval` WRITE;
/*!40000 ALTER TABLE `post_eval` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_eval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_mst`
--

DROP TABLE IF EXISTS `post_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_mst` (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `post_cnt` text,
  `store_id` int NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_mst`
--

LOCK TABLES `post_mst` WRITE;
/*!40000 ALTER TABLE `post_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_mst` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `post_mst_AFTER_INSERT` AFTER INSERT ON `post_mst` FOR EACH ROW BEGIN
	INSERT INTO user_post (user_id, post_id) VALUES (NEW.user_id, NEW.post_id);
	INSERT INTO store_post (store_id, post_id) VALUES (NEW.store_id, NEW.post_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `post_pic`
--

DROP TABLE IF EXISTS `post_pic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_pic` (
  `post_pic_id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  `pic_data` text NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_pic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_pic`
--

LOCK TABLES `post_pic` WRITE;
/*!40000 ALTER TABLE `post_pic` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_pic` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `post_pic_AFTER_INSERT` AFTER INSERT ON `post_pic` FOR EACH ROW BEGIN
  INSERT INTO user_pic (user_id, post_id, post_pic_id) VALUES (NEW.user_id, NEW.post_id, NEW.post_pic_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `store_eval`
--

DROP TABLE IF EXISTS `store_eval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_eval` (
  `store_eval_id` int NOT NULL AUTO_INCREMENT,
  `store_id` int NOT NULL,
  `post_eval_id` int NOT NULL,
  PRIMARY KEY (`store_eval_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_eval`
--

LOCK TABLES `store_eval` WRITE;
/*!40000 ALTER TABLE `store_eval` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_eval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_mst`
--

DROP TABLE IF EXISTS `store_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_mst` (
  `store_id` int NOT NULL AUTO_INCREMENT,
  `store_name` varchar(50) NOT NULL,
  `store_lat` double NOT NULL,
  `store_lng` double NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_mst`
--

LOCK TABLES `store_mst` WRITE;
/*!40000 ALTER TABLE `store_mst` DISABLE KEYS */;
INSERT INTO `store_mst` VALUES (1,'삼정타워',35.152727,129.059674),(2,'한성각',35.151376,129.062542);
/*!40000 ALTER TABLE `store_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_post`
--

DROP TABLE IF EXISTS `store_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_post` (
  `store_post_id` int NOT NULL AUTO_INCREMENT,
  `store_id` int NOT NULL,
  `post_id` int NOT NULL,
  PRIMARY KEY (`store_post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_post`
--

LOCK TABLES `store_post` WRITE;
/*!40000 ALTER TABLE `store_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_post_comment`
--

DROP TABLE IF EXISTS `store_post_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_post_comment` (
  `store_post_cmt_id` int NOT NULL AUTO_INCREMENT,
  `store_post_id` int NOT NULL,
  `post_cmt` text,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`store_post_cmt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_post_comment`
--

LOCK TABLES `store_post_comment` WRITE;
/*!40000 ALTER TABLE `store_post_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_post_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_dtl`
--

DROP TABLE IF EXISTS `user_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_dtl` (
  `user_dtl_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `introduce` text,
  `image_url` text,
  `join_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_dtl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_dtl`
--

LOCK TABLES `user_dtl` WRITE;
/*!40000 ALTER TABLE `user_dtl` DISABLE KEYS */;
INSERT INTO `user_dtl` VALUES (1,1,'rjxwjfl',NULL,NULL,'2023-05-03 07:38:26'),(2,2,'강대협',NULL,NULL,'2023-05-03 07:40:15'),(3,3,'은빈',NULL,NULL,'2023-05-03 07:41:22'),(4,4,'병수',NULL,NULL,'2023-05-03 07:42:22');
/*!40000 ALTER TABLE `user_dtl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_fav`
--

DROP TABLE IF EXISTS `user_fav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_fav` (
  `user_fav_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  PRIMARY KEY (`user_fav_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_fav`
--

LOCK TABLES `user_fav` WRITE;
/*!40000 ALTER TABLE `user_fav` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_fav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_mst`
--

DROP TABLE IF EXISTS `user_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_mst` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_mst`
--

LOCK TABLES `user_mst` WRITE;
/*!40000 ALTER TABLE `user_mst` DISABLE KEYS */;
INSERT INTO `user_mst` VALUES (1,'rjxwjfl@gmail.com','123123123'),(2,'eoguq2823@naver.com','dkdldld'),(3,'534311@naver.com','123123'),(4,'byoungsoo@gmail.com','jfdkslfjioejfw1525');
/*!40000 ALTER TABLE `user_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_pic`
--

DROP TABLE IF EXISTS `user_pic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_pic` (
  `user_pic_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  `post_pic_id` int NOT NULL,
  PRIMARY KEY (`user_pic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_pic`
--

LOCK TABLES `user_pic` WRITE;
/*!40000 ALTER TABLE `user_pic` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_pic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_post`
--

DROP TABLE IF EXISTS `user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_post` (
  `user_post_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  PRIMARY KEY (`user_post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_post`
--

LOCK TABLES `user_post` WRITE;
/*!40000 ALTER TABLE `user_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_sub`
--

DROP TABLE IF EXISTS `user_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_sub` (
  `user_sub_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `sub_user` int NOT NULL,
  PRIMARY KEY (`user_sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_sub`
--

LOCK TABLES `user_sub` WRITE;
/*!40000 ALTER TABLE `user_sub` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_sub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'database'
--

--
-- Dumping routines for database 'database'
--
/*!50003 DROP PROCEDURE IF EXISTS `addEval` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `addEval`(
    IN p_eval_cnt TEXT,
    IN p_eval_ctg INT,
    IN p_eval_emoji CHAR(4)
)
BEGIN

	INSERT INTO eval_list(eval_cnt, eval_ctg, eval_imoji)
    VALUES (p_eval_cnt, p_eval_ctg, p_eval_emoji);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addPost` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `addPost`(
    IN p_user_id INT,
    IN p_post_cnt TEXT,
    IN p_store_id INT,
    IN p_eval_ids TEXT,
    IN p_pic_datas TEXT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error occurred. Changes have been rolled back.' AS message;
    END;

    START TRANSACTION;
    INSERT INTO post_mst (user_id, post_cnt, store_id)
    VALUES (p_user_id, p_post_cnt, p_store_id);
    
    SET @post_id = LAST_INSERT_ID();
    
    SET @evals = p_eval_ids;
    WHILE LENGTH(@evals) > 0 DO
        SET @eval_id = SUBSTRING_INDEX(@evals, ',', 1);
        INSERT INTO post_eval (post_id, store_id, eval_id)
        VALUES (@post_id, p_store_id, @eval_id);
        SET @evals = SUBSTRING(@evals, LENGTH(@eval_id) + 2);
    END WHILE;
    
    SET @pic_datas = p_pic_datas;
    WHILE LENGTH(@pic_datas) > 0 DO
        SET @pic_data = SUBSTRING_INDEX(@pic_datas, ',', 1);
        INSERT INTO post_pic (post_id, user_id, pic_data)
        VALUES (@post_id, p_user_id, @pic_data);
        SET @pic_datas = SUBSTRING(@pic_datas, LENGTH(@pic_data) + 2);
    END WHILE;
    
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `signUpUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `signUpUser`(
  IN p_username VARCHAR(50),
  IN p_password VARCHAR(255),
  IN p_name VARCHAR(30)
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SELECT 'Error occurred. Changes have been rolled back.' AS message;
  END;
  
  START TRANSACTION;
  
  INSERT INTO user_mst (username, password)
  VALUES (p_username, p_password);
  
  SET @last_user_id = LAST_INSERT_ID();
  
  INSERT INTO user_dtl (user_id, name)
  VALUES (@last_user_id, p_name);
  
  COMMIT;

  SELECT task_id;
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

-- Dump completed on 2023-05-03 17:41:12
