-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: e_commerce
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  `quantity` int NOT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,5,6,23,'2023-03-19 09:21:51'),(2,5,6,4,'2023-03-19 09:23:59'),(4,5,2,3,'2023-03-19 09:28:11'),(6,1,1,3,'2023-03-19 09:43:12'),(7,5,1,1,'2023-03-19 09:56:52'),(8,11,1,2,'2023-03-19 10:10:54'),(10,1,1,2,'2023-03-19 17:27:26'),(11,6,1,2,'2023-03-19 17:28:40'),(12,2,1,1,'2023-03-19 17:45:54'),(13,11,1,1,'2023-03-19 17:46:45'),(15,1,1,1,'2023-03-19 18:05:29'),(16,7,1,1,'2023-03-19 18:05:29'),(17,12,1,2,'2023-03-19 18:06:24'),(18,5,1,3,'2023-03-19 18:06:24'),(19,2,1,1,'2023-03-19 18:06:24'),(20,12,1,3,'2023-03-19 18:15:22'),(21,3,1,2,'2023-03-19 18:15:46'),(22,2,1,1,'2023-03-19 18:15:46'),(23,2,1,1,'2023-03-19 19:06:12'),(24,4,1,1,'2023-03-19 19:06:12'),(25,4,1,1,'2023-03-19 19:13:58'),(27,7,1,3,'2023-03-19 19:45:04'),(28,10,1,4,'2023-03-19 19:46:04'),(29,12,1,2,'2023-03-19 19:46:04'),(30,8,1,3,'2023-03-19 19:46:04');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `category` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'iPhone 14 Pro Max','Smartphones',129999.00,'iphone13.jpg'),(2,'Samsung Galaxy S21','Smartphones',89999.00,'SamsungGalaxy.jpg'),(3,'Sony WH-1000XM5','Headphones',2599.00,'sony.jpg'),(4,'Apple AirPods Pro','Headphones',18000.00,'appleairpods.jpg'),(5,'HP Pavilion','Laptops',60000.00,'dell.jpg'),(6,'MacBook Air','Laptops',150000.00,'mackbook.jpg'),(7,'Puma Casual Shoes','Shoes',1999.00,'puma.jpg'),(8,'Nike Sports Shoes','Shoes',2499.00,'nike.jpg'),(9,'Titan Premium Watch','Watches',1999.00,'watch1.jpg'),(10,'Rolex Men Watch','Watches',39999.00,'watch2.jpg'),(11,'Men\'s Shirt','Clothing',429.00,'shirt.jpg'),(12,'Coat for Men','Clothing',899.00,'Coat.jpg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Madhur Jatiya','madhur@gmail.com','1234'),(2,'akshada','akshada@example.com','password123'),(3,'lokesh','lokesh@example.com','password456'),(4,'rani','rani@example.com','password789'),(5,'priyaka','priyaka@example.com','password1011'),(6,'aastha','aastha@example.com','password1213'),(7,'lavya','lavya@example.com','password1415'),(8,'raghav','raghav@example.com','password1617'),(9,'anurag','anurag@example.com','password1819'),(10,'ankit','ankit@example.com','password2021');
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

-- Dump completed on 2023-03-20  1:29:41
