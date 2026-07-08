-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: e_commerce
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `brand_ID` int NOT NULL,
  `location` varchar(50) DEFAULT 'unknown',
  `brandname` varchar(20) DEFAULT NULL,
  `phoneno` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`brand_ID`),
  UNIQUE KEY `phoneno` (`phoneno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'USA','Nike','03001234567'),(2,'Germany','Adidas','03007654321'),(3,'South Korea','Samsung','03111222333'),(4,'Japan','Sony','03222333444'),(5,'China','Huawei','03333444555'),(6,'USA','Apple','03444555666'),(7,'Switzerland','Nestle','03555666777'),(8,'UK','Unilever','03666777888');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card` (
  `payment_ID` int NOT NULL,
  `cardno` int NOT NULL,
  `cardtype` varchar(20) NOT NULL,
  PRIMARY KEY (`payment_ID`),
  CONSTRAINT `card_ibfk_1` FOREIGN KEY (`payment_ID`) REFERENCES `payment` (`payment_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES (1,12345678,'Debit Card'),(2,23456789,'Credit Card'),(3,34567890,'Debit Card'),(4,45678901,'Credit Card'),(5,56789012,'Debit Card');
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_ID` int NOT NULL,
  `category_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`category_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Men Clothing'),(2,'Women Clothing'),(3,'Kids Clothing'),(4,'Mobile Phones'),(5,'Laptops'),(6,'Televisions'),(7,'Refrigerators'),(8,'Washing Machines'),(9,'Kitchen Electronics'),(10,'Frozen Food'),(11,'Dairy Products'),(12,'Bakery Items'),(13,'Fresh Vegetables'),(14,'Fresh Fruits'),(15,'Snacks'),(16,'Beverages'),(17,'Footwear'),(18,'Accessories'),(19,'Gaming Consoles'),(20,'Smart Home Devices');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clothing`
--

DROP TABLE IF EXISTS `clothing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clothing` (
  `category_ID` int NOT NULL,
  `material` varchar(40) DEFAULT 'not specified',
  `gender` varchar(10) NOT NULL,
  PRIMARY KEY (`category_ID`),
  CONSTRAINT `clothing_ibfk_1` FOREIGN KEY (`category_ID`) REFERENCES `category` (`category_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothing`
--

LOCK TABLES `clothing` WRITE;
/*!40000 ALTER TABLE `clothing` DISABLE KEYS */;
INSERT INTO `clothing` VALUES (1,'Cotton','Male'),(2,'Linen','Female'),(3,'Wool','Kids'),(17,'Leather','Unisex'),(18,'Mixed','Unisex');
/*!40000 ALTER TABLE `clothing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cod`
--

DROP TABLE IF EXISTS `cod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cod` (
  `payment_ID` int NOT NULL,
  `collectedby` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`payment_ID`),
  CONSTRAINT `cod_ibfk_1` FOREIGN KEY (`payment_ID`) REFERENCES `payment` (`payment_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cod`
--

LOCK TABLES `cod` WRITE;
/*!40000 ALTER TABLE `cod` DISABLE KEYS */;
INSERT INTO `cod` VALUES (6,'Courier A'),(7,'Courier B'),(8,'Courier C'),(9,'Courier D'),(10,'Courier E');
/*!40000 ALTER TABLE `cod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `complex`
--

DROP TABLE IF EXISTS `complex`;
/*!50001 DROP VIEW IF EXISTS `complex`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `complex` AS SELECT 
 1 AS `payment_id`,
 1 AS `payment_date`,
 1 AS `collectedby`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `electronics`
--

DROP TABLE IF EXISTS `electronics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `electronics` (
  `category_ID` int NOT NULL,
  `voltage` varchar(10) DEFAULT NULL,
  `warrenty` varchar(10) DEFAULT '1 year',
  PRIMARY KEY (`category_ID`),
  CONSTRAINT `electronics_ibfk_1` FOREIGN KEY (`category_ID`) REFERENCES `category` (`category_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electronics`
--

LOCK TABLES `electronics` WRITE;
/*!40000 ALTER TABLE `electronics` DISABLE KEYS */;
INSERT INTO `electronics` VALUES (4,'5V','1 year'),(5,'19V','2 years'),(6,'220V','3 years'),(7,'220V','5 years'),(8,'220V','4 years'),(9,'220V','2 years'),(19,'12V','1 year'),(20,'110V','2 years');
/*!40000 ALTER TABLE `electronics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `category_ID` int NOT NULL,
  `storage` varchar(10) DEFAULT 'in/out',
  `expiry_date` date DEFAULT NULL,
  PRIMARY KEY (`category_ID`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`category_ID`) REFERENCES `category` (`category_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (10,'Frozen','2026-01-15'),(11,'Cold','2025-08-10'),(12,'Room','2025-06-30'),(13,'Fresh','2025-05-05'),(14,'Fresh','2025-05-07'),(15,'Room','2025-12-20'),(16,'Cool','2025-11-01');
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_ID` int NOT NULL,
  `order_date` date NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `totalproducts` int NOT NULL,
  `user_ID` int DEFAULT NULL,
  PRIMARY KEY (`order_ID`),
  KEY `user_ID` (`user_ID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `useraccount` (`user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2024-01-05','Placed',1500.00,2,1),(2,'2024-01-07','Delivered',3200.50,1,2),(3,'2024-01-10','Cancelled',800.00,3,3),(4,'2024-01-12','Placed',2200.75,2,4),(5,'2024-01-15','Delivered',4500.00,1,5),(6,'2024-01-18','Placed',1300.25,4,6),(7,'2024-01-20','Delivered',2750.00,2,7),(8,'2024-01-22','Placed',999.99,1,8),(9,'2024-01-25','Delivered',5100.00,3,9),(10,'2024-01-28','Placed',1800.00,2,10);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_ID` int NOT NULL,
  `payment_date` date NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `order_ID` int DEFAULT NULL,
  PRIMARY KEY (`payment_ID`),
  KEY `order_ID` (`order_ID`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`order_ID`) REFERENCES `orders` (`order_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'2024-01-05',1500.00,'Paid',1),(2,'2024-01-07',3200.50,'Paid',2),(3,'2024-01-10',800.00,'Refunded',3),(4,'2024-01-12',2200.75,'Pending',4),(5,'2024-01-15',4500.00,'Paid',5),(6,'2024-01-18',1300.25,'Paid',6),(7,'2024-01-20',2750.00,'Paid',7),(8,'2024-01-22',999.99,'Pending',8),(9,'2024-01-25',5100.00,'Paid',9),(10,'2024-01-28',1800.00,'Paid',10);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_ID` int NOT NULL,
  `product_name` varchar(40) DEFAULT NULL,
  `product_price` float NOT NULL,
  `stock_quantity` int DEFAULT NULL,
  `category_ID` int DEFAULT NULL,
  PRIMARY KEY (`product_ID`),
  KEY `category_ID` (`category_ID`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_ID`) REFERENCES `category` (`category_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (101,'Men Cotton Shirt',2500,50,1),(102,'Women Silk Dress',4800,30,2),(103,'Kids Winter Jacket',3200,20,3),(104,'iPhone 15',350000,10,4),(105,'Dell Inspiron Laptop',180000,10,5),(106,'Samsung Smart TV',120000,8,6),(107,'Double Door Refrigerator',160000,5,7),(108,'Automatic Washing Machine',140000,6,8),(109,'Frozen Chicken Nuggets',1200,100,10),(110,'Fresh Milk 1L',220,200,11),(111,'Chocolate Cake',1800,25,12);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_brand`
--

DROP TABLE IF EXISTS `product_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_brand` (
  `product_brand_ID` int NOT NULL,
  `product_ID` int DEFAULT NULL,
  `brand_ID` int DEFAULT NULL,
  PRIMARY KEY (`product_brand_ID`),
  KEY `product_ID` (`product_ID`),
  KEY `brand_ID` (`brand_ID`),
  CONSTRAINT `product_brand_ibfk_1` FOREIGN KEY (`product_ID`) REFERENCES `product` (`product_ID`),
  CONSTRAINT `product_brand_ibfk_2` FOREIGN KEY (`brand_ID`) REFERENCES `brand` (`brand_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_brand`
--

LOCK TABLES `product_brand` WRITE;
/*!40000 ALTER TABLE `product_brand` DISABLE KEYS */;
INSERT INTO `product_brand` VALUES (1,101,1),(2,104,2),(3,105,4),(4,109,4),(5,107,5),(6,110,2),(7,102,1),(8,108,5);
/*!40000 ALTER TABLE `product_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_order`
--

DROP TABLE IF EXISTS `product_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_order` (
  `product_order_ID` int NOT NULL,
  `product_ID` int DEFAULT NULL,
  `order_ID` int DEFAULT NULL,
  `productquantity` int DEFAULT NULL,
  PRIMARY KEY (`product_order_ID`),
  KEY `product_ID` (`product_ID`),
  KEY `order_ID` (`order_ID`),
  CONSTRAINT `product_order_ibfk_1` FOREIGN KEY (`product_ID`) REFERENCES `product` (`product_ID`),
  CONSTRAINT `product_order_ibfk_2` FOREIGN KEY (`order_ID`) REFERENCES `orders` (`order_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_order`
--

LOCK TABLES `product_order` WRITE;
/*!40000 ALTER TABLE `product_order` DISABLE KEYS */;
INSERT INTO `product_order` VALUES (1,101,1,1),(2,102,1,1),(3,103,2,1),(4,104,3,2),(5,105,3,1),(6,106,4,2),(7,107,5,1),(8,108,6,2),(9,109,6,2),(10,110,7,2),(11,111,8,1);
/*!40000 ALTER TABLE `product_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_ID` int NOT NULL,
  `comments` varchar(50) DEFAULT NULL,
  `user_ID` int DEFAULT NULL,
  PRIMARY KEY (`review_ID`),
  KEY `user_ID` (`user_ID`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `useraccount` (`user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'Great quality product',1),(2,'Fast delivery',2),(4,'Satisfied with purchase',4),(5,'Packaging was good',5),(6,'Highly recommended',6),(7,'Average experience',7),(8,'Excellent service',8),(9,'Product as described',9),(10,'Will buy again',10);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount`
--

DROP TABLE IF EXISTS `useraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `useraccount` (
  `user_ID` int NOT NULL,
  `userpassword` varchar(40) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `phoneno` varchar(15) DEFAULT '0',
  `email` varchar(50) DEFAULT NULL,
  `shippingaddress` varchar(40) DEFAULT NULL,
  `totalorderplace` int DEFAULT '0',
  PRIMARY KEY (`user_ID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount`
--

LOCK TABLES `useraccount` WRITE;
/*!40000 ALTER TABLE `useraccount` DISABLE KEYS */;
INSERT INTO `useraccount` VALUES (1,'pass123','Ali Khan','Male','1998-05-12','03001234567','ali@gmail.com','johar town',3),(2,'secure456','Ayesha Noor','Female','2000-08-21','03111234567','ayesha@gmail.com','Karachi',5),(3,'mypassword','Ahmed Raza','Male','1997-03-18','03221234567','ahmed@gmail.com','Islamabad',2),(4,'user789','Sara Malik','Female','2001-11-02','03331234567','sara@gmail.com','Rawalpindi',4),(5,'login321','Usman Ali','Male','1995-01-30','03441234567','usman@gmail.com','Faisalabad',6),(6,'hello123','Fatima Zahra','Female','1999-06-14','03011239876','fatima@gmail.com','Multan',1),(7,'abc@123','Bilal Hussain','Male','1996-09-25','03121239876','bilal@gmail.com','Gujranwala',0),(8,'pass999','Hira Shah','Female','2002-04-10','03231239876','hira@gmail.com','Sialkot',2),(9,'test111','Zain Ahmed','Male','1998-12-07','03341239876','zain@gmail.com','Peshawar',3),(10,'user000','Noor Fatima','Female','2000-02-19','03451239876','noor@gmail.com','Quetta',1);
/*!40000 ALTER TABLE `useraccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `complex`
--

/*!50001 DROP VIEW IF EXISTS `complex`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `complex` AS select `payment`.`payment_ID` AS `payment_id`,`payment`.`payment_date` AS `payment_date`,`cod`.`collectedby` AS `collectedby` from (`cod` left join `payment` on((`payment`.`payment_ID` = `cod`.`payment_ID`))) */;
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

-- Dump completed on 2026-07-08 17:44:15
