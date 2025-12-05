-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: bankdb
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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `account_number` varchar(18) NOT NULL,
  `customer_id` int NOT NULL,
  `account_type` enum('Savings','Current','Other') NOT NULL,
  `balance` decimal(15,2) DEFAULT '0.00',
  `creation_date` date NOT NULL,
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `account_number` (`account_number`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'00121010000101',1,'Savings',150000.00,'2019-01-01'),(2,'00121010000102',2,'Current',50000.00,'2020-03-10'),(3,'00121010000103',3,'Savings',75000.00,'2023-11-11'),(4,'00121010000104',4,'Current',12000.50,'2024-01-05'),(5,'00121010000105',5,'Other',250000.00,'2015-08-20'),(6,'00121010000106',6,'Savings',5000.00,'2024-01-10'),(7,'00121010000107',7,'Savings',12000.00,'2023-12-05'),(8,'00121010000108',8,'Current',45000.00,'2022-06-18'),(9,'00121010000109',9,'Savings',8000.00,'2024-02-01'),(10,'00121010000110',10,'Savings',150000.00,'2020-11-20'),(11,'00121010000111',11,'Current',90000.00,'2021-09-15'),(12,'00121010000112',12,'Other',200000.00,'2019-03-30'),(13,'00121010000113',13,'Savings',3000.00,'2024-05-10'),(14,'00121010000114',14,'Savings',25000.00,'2022-01-25'),(15,'00121010000115',15,'Savings',60000.00,'2023-08-14'),(16,'00121010000116',16,'Current',1000000.00,'2018-07-07'),(17,'00121010000117',17,'Savings',400.00,'2024-06-01'),(18,'00121010000118',18,'Savings',95000.00,'2021-04-12'),(19,'00121010000119',19,'Current',55000.00,'2023-10-30'),(20,'00121010000120',20,'Savings',18000.00,'2022-12-25');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `branch_id` int NOT NULL AUTO_INCREMENT,
  `branch_bank` varchar(50) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `branch_city` varchar(50) NOT NULL,
  `branch_email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`branch_id`),
  UNIQUE KEY `branch_name` (`branch_name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'State Bank of India','Bandra West','Mumbai',NULL),(2,'HDFC Bank','Koramangala','Bengaluru',NULL),(3,'ICICI Bank','Connaught Place','New Delhi',NULL),(4,'Axis Bank','Koregaon Park','Pune',NULL),(5,'Canara Bank','Adyar','Chennai',NULL),(6,'HDFC Bank','Mjpru campus','Bareilly',NULL),(7,'Union Bank','Mjpru','Bareilly',NULL),(8,'State Bank of India','Kutubkhana','Bareilly',NULL),(9,'HDFC Bank','Rajendra Nagar','Bareilly',NULL),(10,'Punjab National Bank','Hazratganj','Lucknow',NULL),(11,'Axis Bank','Salt Lake','Kolkata',NULL),(12,'ICICI Bank','Sector 17','Chandigarh',NULL),(13,'Bank of Baroda','Malviya Nagar','Jaipur',NULL),(14,'Union Bank','Alkapuri','Vadodara',NULL),(15,'Canara Bank','Panjim','Goa',NULL),(16,'HDFC Bank','Pilibhit Road','Bareilly',NULL),(17,'Kotak Mahindra','Indiranagar','Bengaluru',NULL),(18,'IndusInd Bank','Vashi','Mumbai',NULL),(19,'IDFC First','Gachibowli','Hyderabad',NULL),(20,'Yes Bank','MG Road','Pune',NULL);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card` (
  `card_id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `card_number` varchar(20) NOT NULL,
  `issue_date` date NOT NULL,
  `expiration_date` date NOT NULL,
  `is_blocked` tinyint(1) DEFAULT '0',
  `card_type` enum('Debit','Credit') NOT NULL,
  PRIMARY KEY (`card_id`),
  UNIQUE KEY `card_number` (`card_number`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `card_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES (1,1,'4000111122223333','2023-01-01','2027-01-01',0,'Debit'),(2,2,'5000444455556666','2022-05-20','2026-05-20',0,'Credit'),(3,3,'4000777788889999','2023-07-01','2027-07-01',0,'Debit'),(4,4,'5000123412341234','2024-02-01','2028-02-01',1,'Credit'),(6,6,'6000111122223333','2024-01-15','2028-01-15',0,'Debit'),(7,7,'6000222233334444','2023-12-10','2027-12-10',0,'Debit'),(8,8,'6000333344445555','2022-07-01','2026-07-01',1,'Credit'),(9,9,'6000444455556666','2024-02-05','2028-02-05',0,'Debit'),(10,10,'6000555566667777','2020-12-01','2024-12-01',0,'Credit'),(11,11,'6000666677778888','2021-10-01','2025-10-01',0,'Debit'),(12,12,'6000777788889999','2019-04-05','2023-04-05',1,'Credit'),(13,13,'6000888899990000','2024-05-15','2028-05-15',0,'Debit'),(14,14,'6000999900001111','2022-02-01','2026-02-01',0,'Debit'),(15,15,'6000000011112222','2023-08-20','2027-08-20',0,'Credit'),(16,16,'6000121212121212','2018-07-10','2022-07-10',1,'Credit'),(17,17,'6000232323232323','2024-06-05','2028-06-05',0,'Debit'),(18,18,'6000343434343434','2021-04-15','2025-04-15',0,'Debit'),(19,19,'6000454545454545','2023-11-01','2027-11-01',0,'Credit'),(20,20,'6000565656565656','2022-12-30','2026-12-30',0,'Debit');
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `branch_id` int NOT NULL,
  `address_id` int NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `mobile_number` (`mobile_number`),
  KEY `branch_id` (`branch_id`),
  KEY `address_id` (`address_id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`),
  CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `customer_address` (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,1,1,'Ravi','Sharma','1990-05-10','Male','ravi.s@test.com','9999999999'),(2,2,2,'Neha','Patel','1985-11-25','Female','neha.p@test.com','9988776655'),(3,3,3,'Amit','Verma','2000-01-01','Male','amit.v@test.com','9000111222'),(4,4,4,'Shreya','Jain','1998-03-15','Female','shreya.j@test.com','8888444455'),(5,5,5,'Kiran','Singh','1975-10-20','Male','kiran.s@test.com','9717012345'),(6,6,6,'Aman','Verma','1999-08-15','Male','aman.v@test.com','9000000001'),(7,6,7,'Ritika','Gupta','2001-02-20','Female','ritika.g@test.com','9000000002'),(8,7,8,'Saurabh','Mishra','1988-11-11','Male','saurabh.m@test.com','9000000003'),(9,8,9,'Pooja','Sharma','1995-06-30','Female','pooja.s@test.com','9000000004'),(10,9,10,'Raj','Malhotra','1982-01-25','Male','raj.m@test.com','9000000005'),(11,10,11,'Simran','Kaur','1997-09-09','Female','simran.k@test.com','9000000006'),(12,11,12,'Deepak','Kumar','1990-04-14','Male','deepak.k@test.com','9000000007'),(13,12,13,'Ananya','Pandey','2000-12-01','Female','ananya.p@test.com','9000000008'),(14,13,14,'Hardik','Patel','1985-03-03','Male','hardik.p@test.com','9000000009'),(15,14,15,'Maria','Dsouza','1992-07-22','Female','maria.d@test.com','9000000010'),(16,16,16,'Vikas','Agarwal','1980-05-18','Male','vikas.a@test.com','9000000011'),(17,17,17,'Ishaan','Reddy','1996-10-05','Male','ishaan.r@test.com','9000000012'),(18,18,18,'Meera','Iyer','1989-08-08','Female','meera.i@test.com','9000000013'),(19,19,19,'Faizan','Ali','1993-01-12','Male','faizan.a@test.com','9000000014'),(20,20,20,'Tanvi','Shah','1998-11-30','Female','tanvi.s@test.com','9000000015');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address`
--

DROP TABLE IF EXISTS `customer_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `street` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `pincode` varchar(10) NOT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address`
--

LOCK TABLES `customer_address` WRITE;
/*!40000 ALTER TABLE `customer_address` DISABLE KEYS */;
INSERT INTO `customer_address` VALUES (1,'4B Linking Road','Mumbai','Maharashtra','400050'),(2,'12A Sarjapur Road','Bengaluru','Karnataka','560001'),(3,'C-2 Sector 18','Gurgaon','Haryana','122002'),(4,'50 Shivaji Nagar','Pune','Maharashtra','411005'),(5,'2/1 Anna Salai','Chennai','Tamil Nadu','600002'),(6,'Civil Lines','Bareilly','Uttar Pradesh','243001'),(7,'Pilibhit Bypass Road','Bareilly','Uttar Pradesh','243006'),(8,'Rajendra Nagar','Bareilly','Uttar Pradesh','243122'),(9,'DD Puram','Bareilly','Uttar Pradesh','243003'),(10,'10 Park Street','Kolkata','West Bengal','700016'),(11,'Sector 17','Chandigarh','Chandigarh','160017'),(12,'Mall Road','Shimla','Himachal Pradesh','171001'),(13,'Ashok Nagar','Jaipur','Rajasthan','302001'),(14,'Gomti Nagar','Lucknow','Uttar Pradesh','226010'),(15,'Cantt Area','Bareilly','Uttar Pradesh','243001'),(16,'Rampur Garden','Bareilly','Uttar Pradesh','243001'),(17,'Salt Lake City','Kolkata','West Bengal','700091'),(18,'Banjara Hills','Hyderabad','Telangana','500034'),(19,'Marine Drive','Kochi','Kerala','682001'),(20,'University Road','Bareilly','Uttar Pradesh','243006');
/*!40000 ALTER TABLE `customer_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `branch_id` int NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  `join_date` date NOT NULL,
  `status` enum('Active','Terminated','Leave') NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `email` (`email`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,1,'Gita','Mehta','Branch Manager','gita.m@sbi.in',1800000.00,'2018-04-01','Active'),(2,1,'Akash','Yadav','Teller','akash.y@sbi.in',450000.00,'2023-01-20','Active'),(3,2,'Pooja','Rao','Loan Officer','pooja.r@hdfc.in',902000.00,'2021-11-15','Active'),(4,3,'Suresh','Kumar','Teller','suresh.k@icici.in',480000.00,'2022-08-01','Active'),(5,5,'Lata','Sharma','Relationship Manager','lata.s@canara.in',1100000.00,'2020-05-10','Active'),(6,6,'Rakesh','Gangwar','Branch Manager','rakesh.g@mjpru.in',1200000.00,'2019-06-01','Active'),(7,6,'Suman','Lata','Clerk','suman.l@mjpru.in',350000.00,'2022-01-10','Active'),(8,7,'Vikram','Singh','Teller','vikram.s@mjpru.in',300000.00,'2023-05-20','Active'),(9,8,'Anjali','Tiwari','Loan Officer','anjali.t@sbi.in',800000.00,'2020-03-15','Active'),(10,9,'Rahul','Khanna','Manager','rahul.k@hdfc.in',1500000.00,'2018-09-01','Active'),(11,10,'Sneha','Roy','Teller','sneha.r@pnb.in',400000.00,'2021-12-12','Active'),(12,11,'Amit','Bose','Security','amit.b@axis.in',250000.00,'2023-01-01','Active'),(13,12,'Priya','Gill','Manager','priya.g@icici.in',1400000.00,'2019-11-20','Active'),(14,13,'Rohit','Meena','Clerk','rohit.m@bob.in',320000.00,'2022-07-04','Active'),(15,14,'Kavita','Patel','Teller','kavita.p@union.in',380000.00,'2020-08-18','Active'),(16,15,'John','Fernandes','Manager','john.f@canara.in',1300000.00,'2017-05-30','Terminated'),(17,16,'Mohit','Saxena','Loan Officer','mohit.s@mjpru.in',750000.00,'2021-02-14','Active'),(18,17,'Swati','Desai','Relationship Mgr','swati.d@kotak.in',950000.00,'2020-10-10','Leave'),(19,18,'Arjun','Nair','Teller','arjun.n@indus.in',420000.00,'2023-03-25','Active'),(20,19,'Zoya','Khan','Manager','zoya.k@idfc.in',1600000.00,'2018-01-15','Active');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan` (
  `loan_id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `loan_type_id` int NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `start_date` date NOT NULL,
  `due_date` date NOT NULL,
  PRIMARY KEY (`loan_id`),
  KEY `account_id` (`account_id`),
  KEY `loan_type_id` (`loan_type_id`),
  CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `loan_ibfk_2` FOREIGN KEY (`loan_type_id`) REFERENCES `loan_type` (`loan_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (1,1,1,8000000.00,'2021-05-01','2046-05-01'),(2,2,2,750000.00,'2023-09-10','2028-09-10'),(3,3,3,85000.00,'2024-01-20','2025-01-20'),(4,4,4,40000.00,'2024-03-15','2027-03-15'),(5,5,5,1600000.00,'2022-11-01','2032-11-01'),(6,6,6,200000.00,'2024-02-01','2026-02-01'),(7,7,7,500000.00,'2024-01-01','2027-01-01'),(8,8,8,300000.00,'2023-06-01','2025-06-01'),(9,9,9,200000.00,'2024-03-10','2029-03-10'),(10,10,10,1000000.00,'2021-01-01','2026-01-01'),(11,11,11,100000.00,'2023-05-01','2024-05-01'),(12,12,12,50000.00,'2020-01-01','2021-01-01'),(13,13,13,80000.00,'2024-05-15','2026-05-15'),(14,14,14,600000.00,'2022-08-01','2027-08-01'),(15,15,15,20000.00,'2023-11-01','2024-11-01'),(16,16,16,100000.00,'2019-01-01','2024-01-01'),(17,17,17,500000.00,'2024-06-01','2034-06-01'),(18,18,18,40000.00,'2022-01-01','2023-01-01'),(19,19,19,2000000.00,'2023-12-01','2025-12-01'),(20,20,20,150000.00,'2023-02-01','2028-02-01');
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_payment`
--

DROP TABLE IF EXISTS `loan_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `loan_id` int NOT NULL,
  `payment_date` date NOT NULL,
  `payment_amount` decimal(15,2) NOT NULL,
  `interest_paid` decimal(15,2) NOT NULL,
  `principal_paid` decimal(15,2) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `loan_id` (`loan_id`),
  CONSTRAINT `loan_payment_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `loan` (`loan_id`),
  CONSTRAINT `loan_payment_chk_1` CHECK ((`payment_amount` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_payment`
--

LOCK TABLES `loan_payment` WRITE;
/*!40000 ALTER TABLE `loan_payment` DISABLE KEYS */;
INSERT INTO `loan_payment` VALUES (1,1,'2024-12-01',70000.00,55000.00,15000.00),(2,2,'2024-12-05',15000.00,6800.00,8200.00),(3,3,'2024-12-10',8000.00,650.00,7350.00),(4,4,'2024-12-15',1500.00,450.00,1050.00),(5,5,'2024-12-20',20000.00,12500.00,7500.00),(6,6,'2024-03-01',5000.00,1000.00,4000.00),(7,7,'2024-03-05',12000.00,4000.00,8000.00),(8,8,'2024-03-10',8000.00,2000.00,6000.00),(9,9,'2024-04-10',4000.00,1500.00,2500.00),(10,10,'2024-01-01',25000.00,10000.00,15000.00),(11,11,'2023-06-01',5000.00,1000.00,4000.00),(12,12,'2020-02-01',2500.00,500.00,2000.00),(13,13,'2024-06-15',3000.00,800.00,2200.00),(14,14,'2022-09-01',15000.00,4000.00,11000.00),(15,15,'2023-12-01',2000.00,300.00,1700.00),(16,16,'2019-02-01',4000.00,800.00,3200.00),(17,17,'2024-07-01',6000.00,3500.00,2500.00),(18,18,'2022-02-01',3500.00,500.00,3000.00),(19,19,'2024-01-01',100000.00,20000.00,80000.00),(20,20,'2023-03-01',4500.00,800.00,3700.00);
/*!40000 ALTER TABLE `loan_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_type`
--

DROP TABLE IF EXISTS `loan_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_type` (
  `loan_type_id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `base_amount` decimal(15,2) DEFAULT '0.00',
  `base_interest_rate` decimal(5,2) NOT NULL,
  PRIMARY KEY (`loan_type_id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_type`
--

LOCK TABLES `loan_type` WRITE;
/*!40000 ALTER TABLE `loan_type` DISABLE KEYS */;
INSERT INTO `loan_type` VALUES (1,'Home Loan','Long-term residential mortgage',5000000.00,8.25),(2,'Vehicle Loan','Car/Bike financing',800000.00,10.50),(3,'Gold Loan','Secured loan against jewelry',100000.00,11.00),(4,'Personal Loan','Unsecured fixed-rate loan',50000.00,12.00),(5,'Education Loan','For higher studies',1500000.00,9.50),(6,'Agriculture Loan','Farming equipment financing',200000.00,7.00),(7,'Medical Loan','Emergency medical expenses',500000.00,10.00),(8,'Wedding Loan','Marriage expense financing',300000.00,11.50),(9,'Home Renovation','Repairs and upgrades',200000.00,9.00),(10,'Startup Business','Funding for new ventures',1000000.00,12.00),(11,'Travel Loan','Domestic and international travel',100000.00,13.00),(12,'Laptop Loan','Electronics financing',50000.00,14.00),(13,'Two-Wheeler Loan','Bike and Scooter financing',80000.00,10.50),(14,'Tractor Loan','Agricultural vehicle loan',600000.00,8.50),(15,'Microfinance','Small loans for individuals',20000.00,15.00),(16,'Pension Loan','Loan against pension',100000.00,9.50),(17,'Top-up Home Loan','Additional funding on home loan',500000.00,8.75),(18,'Consumer Durable','Household appliances',40000.00,16.00),(19,'Bridge Loan','Short term property finance',2000000.00,11.00),(20,'Solar Equipment','Green energy installation',150000.00,7.50);
/*!40000 ALTER TABLE `loan_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `description` varchar(100) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `transaction_type` enum('Deposit','Withdrawal','Transfer','Payment') NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,1,'Salary Deposit - Wipro',100000.00,'2024-12-01 09:00:00','Deposit'),(2,2,'Online Shopping - Myntra',8500.00,'2024-12-02 14:30:00','Withdrawal'),(3,3,'UPI Payment to Vendor',5000.00,'2024-12-03 11:00:00','Payment'),(4,4,'Inter-Bank Transfer',20000.00,'2024-12-04 16:45:00','Transfer'),(5,5,'Dividend Credit',750.50,'2024-12-05 10:15:00','Deposit'),(6,6,'Scholarship Credit',5000.00,'2024-02-15 10:00:00','Deposit'),(7,7,'ATM Withdrawal',2000.00,'2024-02-16 18:00:00','Withdrawal'),(8,8,'Business Payment',15000.00,'2024-02-17 11:30:00','Payment'),(9,9,'Salary Deposit',25000.00,'2024-02-18 09:00:00','Deposit'),(10,10,'Rent Payment',12000.00,'2024-02-19 10:00:00','Transfer'),(11,11,'Consulting Fee',50000.00,'2024-02-20 14:00:00','Deposit'),(12,12,'Grocery Shopping',1500.00,'2024-02-21 17:00:00','Withdrawal'),(13,13,'Mobile Recharge',299.00,'2024-02-22 20:00:00','Payment'),(14,14,'Pension Credit',15000.00,'2024-02-23 08:00:00','Deposit'),(15,15,'Loan Disbursement',20000.00,'2023-11-01 10:00:00','Deposit'),(16,16,'Fixed Deposit Interest',8000.00,'2024-02-24 09:00:00','Deposit'),(17,17,'Low Balance Fee',50.00,'2024-02-25 00:00:01','Withdrawal'),(18,18,'Stock Market Invest',5000.00,'2024-02-26 10:30:00','Transfer'),(19,19,'Car Downpayment',100000.00,'2023-12-05 11:00:00','Transfer'),(20,20,'Electricity Bill',1200.00,'2024-02-27 15:00:00','Payment');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-05  0:34:45
