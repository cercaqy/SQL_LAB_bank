-- MySQL dump 10.13  Distrib 8.0.29, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: bank
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `account_history`
--

DROP TABLE IF EXISTS `account_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_history` (
  `account_history_id` int NOT NULL AUTO_INCREMENT,
  `prev_balance` float NOT NULL,
  `new_balance` float NOT NULL,
  `account_history_dt` datetime NOT NULL,
  `action_h` varchar(45) NOT NULL,
  `account_id` char(12) NOT NULL,
  PRIMARY KEY (`account_history_id`),
  KEY `account_id_idx` (`account_id`),
  CONSTRAINT `account_history_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account_t` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_history`
--

LOCK TABLES `account_history` WRITE;
/*!40000 ALTER TABLE `account_history` DISABLE KEYS */;
INSERT INTO `account_history` VALUES (1,0,200000,'2009-04-21 13:09:21','Пополнение','777362199000'),(2,200000,50000,'2010-06-13 12:01:13','Перевод','777362199000'),(3,0,4812.32,'2010-06-13 12:01:13','Пополнение','874326554335'),(4,4812.32,4512.32,'2020-03-01 11:00:43','Перевод','874326554335'),(5,0,299.59,'2020-03-01 11:00:43','Пополнение','362663773362'),(6,50000,0,'2022-11-13 14:53:11','Снятие','777362199000'),(7,4512.32,0,'2020-03-10 09:53:22','Снятие','362663773362'),(8,0,100000,'2020-08-21 16:21:20','Пополнение','273849984837'),(9,100000,0,'2022-12-20 13:27:15','Снятие','273849984837'),(10,0,2500,'2020-10-12 10:03:41','Пополнение','265533352627'),(11,2500,1500,'2020-12-07 12:02:17','Перевод','265533352627'),(12,0,74210,'2020-12-07 12:02:17','Пополнение','173477383888'),(13,0,170000,'2020-09-13 14:07:31','Пополнение','372727772839'),(14,0,23000,'2020-05-10 08:53:19','Пополнение','848726364789'),(15,23000,73000,'2022-12-30 18:12:16','Пополнение','848726364789');
/*!40000 ALTER TABLE `account_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_t`
--

DROP TABLE IF EXISTS `account_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_t` (
  `account_id` char(12) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `balance` float NOT NULL,
  `balance_dt` datetime NOT NULL,
  `client_id` int NOT NULL,
  PRIMARY KEY (`account_id`),
  KEY `client_id_idx` (`client_id`),
  CONSTRAINT `client_id` FOREIGN KEY (`client_id`) REFERENCES `client_t` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_t`
--

LOCK TABLES `account_t` WRITE;
/*!40000 ALTER TABLE `account_t` DISABLE KEYS */;
INSERT INTO `account_t` VALUES ('173477383888','RUB',74210,'2020-12-07 12:02:17',3),('265533352627','USD',1500,'2020-12-07 12:02:17',3),('273849984837','RUB',0,'2022-12-20 13:27:15',2),('362663773362','EUR',0,'2020-03-10 10:02:51',1),('372727772839','RUB',170000,'2020-09-13 14:07:31',4),('777362199000','RUB',0,'2022-11-13 14:53:11',1),('848726364789','RUB',73000,'2022-12-30 18:12:16',5),('874326554335','USD',0,'2020-03-10 09:53:22',1);
/*!40000 ALTER TABLE `account_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_t`
--

DROP TABLE IF EXISTS `client_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_t` (
  `client_id` int NOT NULL,
  `surname` varchar(50) NOT NULL,
  `phone_number` char(12) NOT NULL,
  `birth_date` date NOT NULL,
  `address` varchar(200) NOT NULL,
  `start_of_deal` date NOT NULL,
  `end_of_deal` date DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_t`
--

LOCK TABLES `client_t` WRITE;
/*!40000 ALTER TABLE `client_t` DISABLE KEYS */;
INSERT INTO `client_t` VALUES (1,'Астафьев','+79856743254','1978-03-23','г. Москва, Дубининская улица, 63с2, кв 52','2009-04-21','2023-01-23'),(2,'Васильев','+79098764531','1973-09-08','г. Химки, Спортивная улица, 10','2020-05-22','2023-01-22'),(3,'Иванова','+79096547888','2001-06-13','г. Москва, 1-й Колобовский переулок, 15/6, кв 15','2020-03-07',NULL),(4,'Гордеева','+79047832333','1998-07-24','Раменский городской округ, деревня Малое Саврасово, 96А','2020-05-21',NULL),(5,'Кузьмин','+79058764553','2004-05-16','г. Москва, Хитровский переулок, 2/8с5, кв 203','2020-01-12',NULL);
/*!40000 ALTER TABLE `client_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exchange_rate`
--

DROP TABLE IF EXISTS `exchange_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exchange_rate` (
  `exchange_rate_id` int NOT NULL AUTO_INCREMENT,
  `exchange_rate_dt` date NOT NULL,
  `sold_currency` varchar(10) NOT NULL,
  `bought_currency` varchar(10) NOT NULL,
  `rate` double NOT NULL,
  PRIMARY KEY (`exchange_rate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exchange_rate`
--

LOCK TABLES `exchange_rate` WRITE;
/*!40000 ALTER TABLE `exchange_rate` DISABLE KEYS */;
INSERT INTO `exchange_rate` VALUES (1,'2010-06-13','USD','RUB',31.17),(2,'2010-06-13','RUB','USD',0.032082130253449),(3,'2010-06-13','EUR','RUB',38.11),(4,'2010-06-13','RUB','EUR',0.026239832065075),(5,'2020-03-01','USD','RUB',66.61),(6,'2020-03-01','RUB','USD',0.01501276084672),(7,'2020-03-01','EUR','RUB',66.7),(8,'2020-03-01','RUB','EUR',0.014992503748126),(9,'2020-12-07','USD','RUB',74.21),(10,'2020-12-07','RUB','USD',0.013475272874276),(11,'2020-12-07','EUR','RUB',74.13),(12,'2020-12-07','RUB','EUR',0.013489815189532),(13,'2020-03-01','USD','EUR',0.998650674662669);
/*!40000 ALTER TABLE `exchange_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_t`
--

DROP TABLE IF EXISTS `transaction_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_t` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `amount_of_money` float NOT NULL,
  `transaction_dt` datetime NOT NULL,
  `account_id_from` char(12) NOT NULL,
  `account_id_to` char(12) NOT NULL,
  `exchange_rate_id` int DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `exchange_rate_id_idx` (`exchange_rate_id`),
  KEY `account_id_from_idx` (`account_id_from`),
  KEY `account_id_to_idx` (`account_id_to`),
  CONSTRAINT `account_id_from` FOREIGN KEY (`account_id_from`) REFERENCES `account_t` (`account_id`),
  CONSTRAINT `account_id_to` FOREIGN KEY (`account_id_to`) REFERENCES `account_t` (`account_id`),
  CONSTRAINT `exchange_rate_id` FOREIGN KEY (`exchange_rate_id`) REFERENCES `exchange_rate` (`exchange_rate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_t`
--

LOCK TABLES `transaction_t` WRITE;
/*!40000 ALTER TABLE `transaction_t` DISABLE KEYS */;
INSERT INTO `transaction_t` VALUES (1,150000,'2010-06-13 12:01:13','777362199000','874326554335',2),(2,300,'2020-03-01 11:00:43','874326554335','362663773362',13),(3,1000,'2020-12-07 12:02:17','265533352627','173477383888',9);
/*!40000 ALTER TABLE `transaction_t` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `transaction_t_AFTER_INSERT` AFTER INSERT ON `transaction_t` FOR EACH ROW BEGIN
	/* Переменная, куда извлекаются данные */
	DECLARE r DOUBLE DEFAULT 1;
    
    /* Флаг для обработчика ошибок*/
    DECLARE done INT DEFAULT 0;
    
    /* Обработчик ошибок */
    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000'
    SET done = 1;
    
    /* Извлечение соответствующего переводу rate в переменную r */
    SELECT rate
    INTO r
    FROM transaction_t
    JOIN exchange_rate
		USING(exchange_rate_id)
    WHERE transaction_id = new.transaction_id;
    
    IF done = 0 THEN
    
    /* Обновление данных для счета, с которого переводятся деньги */
    UPDATE account_t
			SET
				balance = balance - new.amount_of_money,
				balance_dt = new.transaction_dt
			WHERE account_id = new.account_id_from;
	
    /* Обновление данных для счета, на который переводятся деньги */
	UPDATE account_t
			SET
				balance = balance + new.amount_of_money * r,
				balance_dt = new.transaction_dt
			WHERE account_id = new.account_id_to;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `transactions_count`
--

DROP TABLE IF EXISTS `transactions_count`;
/*!50001 DROP VIEW IF EXISTS `transactions_count`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `transactions_count` AS SELECT 
 1 AS `client_id`,
 1 AS `surname`,
 1 AS `phone_number`,
 1 AS `birth_date`,
 1 AS `address`,
 1 AS `start_of_deal`,
 1 AS `end_of_deal`,
 1 AS `tr_cnt`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'bank'
--

--
-- Dumping routines for database 'bank'
--
/*!50003 DROP PROCEDURE IF EXISTS `account_t_updating_balance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `account_t_updating_balance`(t_num INT)
BEGIN
	/* Объявление переменных, куда извлекаются данные */
	DECLARE a_money FLOAT;
	DECLARE t_dt DATETIME;
	DECLARE a_from CHAR(12);
	DECLARE a_to CHAR(12);
	DECLARE r DOUBLE DEFAULT 1;

	/* Флаг для обработчика ошибок*/
	DECLARE	done INT DEFAULT 0;

	/* Обработчик ошибок */
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000'
	SET done = 1;
		
	/* Извлечение данных в соответствующие переменные */
	SELECT
		amount_of_money,
		transaction_dt,
		account_id_from,
		account_id_to,
		rate
	INTO 
		a_money,
		t_dt,
		a_from,
		a_to,
		r
	FROM transaction_t
    JOIN exchange_rate
		USING(exchange_rate_id)
	WHERE transaction_id = 	t_num;

	/* Транзакция для обновления данных в таблице account_t  */
	START TRANSACTION;
		/* Обновление данных для счета, с которого переводятся деньги */
		UPDATE account_t
			SET
				balance = balance - a_money,
				balance_dt = t_dt
			WHERE account_id = a_from;
		/* Обновление данных для счета, на который переводятся деньги */
		UPDATE account_t
			SET
				balance = balance + a_money * r,
				balance_dt = t_dt
			WHERE account_id = a_to;	
	/* Если транзакция выполнилась без ошибок, то сохраняем текущее состояние БД */
	IF done = 0 THEN COMMIT;
	/* Если при выполнении транзакции произошла ошибка, то откатываем БД до ее состояния перед началом выполнения транзакции */
	ELSE ROLLBACK;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `transactions_count`
--

/*!50001 DROP VIEW IF EXISTS `transactions_count`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `transactions_count` AS select `c`.`client_id` AS `client_id`,`c`.`surname` AS `surname`,`c`.`phone_number` AS `phone_number`,`c`.`birth_date` AS `birth_date`,`c`.`address` AS `address`,`c`.`start_of_deal` AS `start_of_deal`,`c`.`end_of_deal` AS `end_of_deal`,count(`t`.`transaction_id`) AS `tr_cnt` from ((`client_t` `c` join `account_t` `a` on((`c`.`client_id` = `a`.`client_id`))) join `transaction_t` `t` on((`a`.`account_id` = `t`.`account_id_from`))) where (year(`t`.`transaction_dt`) = 2020) group by `c`.`client_id` */;
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

-- Dump completed on 2023-01-28  2:09:51
