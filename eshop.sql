CREATE DATABASE  IF NOT EXISTS `shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `shop`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	8.0.26

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
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `created_date` date NOT NULL,
  `role` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'admin','d9b1d7db4cd6e70935368a1efb10e377','Nguyễn Đình Dũng','dungnd@ptit.edu.vn','Hà Nội','0376682678','2018-10-10',1),(2,'demo','c69bd0e6c1b8ff2f9f0ef362f80fc4d3','Demo','demo@ptit.edu.vn','Trái Đất','123','2018-10-10',0),(3,'dungnd','c4ca4238a0b923820dcc509a6f75849b','Dũng ND','nddungx@gmail.com','Earth','0999999999','2018-10-10',1),(4,'hieutn','c4ca4238a0b923820dcc509a6f75849b','Tô Ngọc Hiếu','hieutn@ptit.edu.vn','Cà Mau','0123456789','2018-10-10',0),(5,'tubv','202cb962ac59075b964b07152d234b70','Bùi Văn Tụ','tubv@ptit.edu.vn','Hải Phòng','0982361281','2018-10-10',0);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customerID` int NOT NULL,
  `created_date` date NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1,1,'2018-12-13',0),(2,1,'2018-12-13',1),(3,3,'2018-12-13',1),(4,3,'2018-12-13',0),(5,3,'2018-12-13',1),(6,5,'2018-12-14',1),(7,5,'2018-12-23',0),(8,5,'2018-12-23',0),(9,1,'2018-12-30',0),(10,1,'2018-12-30',1),(11,1,'2018-12-30',0),(12,1,'2018-12-30',0),(13,3,'2018-12-30',0),(14,5,'2018-12-30',0),(15,5,'2018-12-30',1),(16,5,'2018-12-30',0),(17,5,'2018-12-30',0),(18,5,'2018-12-30',0),(19,1,'2021-11-09',0);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Apple'),(2,'Xiaomi'),(3,'Samsung'),(4,'Vivo'),(5,'Realme'),(6,'Oppo');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderID` int NOT NULL,
  `productID` int NOT NULL,
  `price` double NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,1,4,408000,1),(2,1,5,468000,2),(3,2,6,299000,2),(4,2,2,218000,1),(5,3,6,299000,1),(6,4,5,468000,1),(7,4,20,299000,1),(8,4,8,89000,1),(12,5,6,299000,8),(13,5,1,129000,9),(14,6,1,129000,3),(15,6,5,468000,2),(16,7,12,115000,2),(17,8,5,468000,2),(18,8,3,99000,1),(19,9,5,468000,1),(20,10,6,299000,1),(21,10,3,99000,2),(22,11,3,99000,2),(23,11,6,299000,1),(24,11,5,468000,1),(25,11,4,408000,1),(26,11,12,115000,1),(27,12,3,99000,1),(28,13,4,408000,1),(29,14,3,99000,3),(30,15,6,299000,1),(31,16,1,129000,1),(32,17,5,468000,2),(33,18,6,299000,1),(34,19,1,129000,1);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `id_post` int NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'Tuzoro','sdfsdf',1,'2018-12-28T13:58:31+0000'),(4,'Tuzoro','sdfsdfs',1,'2018-12-28T14:15:23+0000'),(5,'Tuzoro','fsfsdf',6,'2018-12-28T14:38:10+0000'),(7,'Nguyễn Đình Dũng','sản phẩm đẹp quá bạn ơi',1,'2018-12-30T13:09:03+0000'),(9,'Nguyễn Đình Dũng','có màu hồng không bạn',1,'2018-12-30T13:10:01+0000'),(11,'Nguyễn Đình Dũng','tặng kèm gì không vậy shop?',12,'2018-12-30T13:23:10+0000'),(13,'Dũng Ng','giày fake hay chính hãng bạn?',2,'2018-12-30T14:26:21+0000'),(14,'Dũng Ng','sản phẩm còn hàng không shop?',4,'2018-12-30T15:21:01+0000'),(15,'Dũng Ng','giày màu hường còn không?',4,'2018-12-30T15:24:13+0000');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `categoryID` int NOT NULL,
  `price` double NOT NULL,
  `details` varchar(500) DEFAULT NULL,
  `img` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'iPhone 13 Mini - 512GB',1,26790000,'Điện thoại di động Apple iPhone 13 Mini - 512GB - Chính hãng VN/A','ip13mini.png'),(2,'iPhone 13 Pro Max - 512GB',1,37790000,'Điện thoại di động Apple iPhone 13 Pro Max - 512GB - Chính hãng VN/A','ip13promax.png'),(3,'iPhone 13 Pro Max - 1TB',1,42990000,'Điện thoại di động Apple iPhone 13 Pro Max - 1TB - Chính hãng VN/A','ip13promax.png'),(4,'iPhone 13 Pro Max - 256GB',1,33990000,'Điện thoại di động Apple iPhone 13 Pro Max - 256GB - Chính hãng VN/A','ip13promax.png'),(5,'iPhone 13 Pro Max - 128GB',1,30990000,'Điện thoại di động Apple iPhone 13 Pro Max - 128GB- Chính hãng VN/A','ip13promax.png'),(6,'iPhone 13 Pro - 128GB',1,27990000,'Điện thoại di động Apple iPhone 13 Pro - 128GB- Chính hãng VN/A','ip13pro.png'),(7,'iPhone 13 Pro - 256GB',1,29790000,'Điện thoại di động Apple iPhone 13 Pro - 256GB- Chính hãng VN/A','ip13pro.png'),(8,'iPhone 13 Pro - 512GB',1,35190000,'Điện thoại di động Apple iPhone 13 Pro - 512GB- Chính hãng VN/A','ip13pro.png'),(9,'iPhone 13 Pro - 1TB',1,40190000,'Điện thoại di động Apple iPhone 13 Pro - 1TB- Chính hãng VN/A','ip13pro.png'),(10,'iPhone 13 Mini - 256GB',1,21490000,'Điện thoại di động Apple iPhone 13 Mini - 256GB - Chính hãng VN/A','ip13mini.png'),(11,'iPhone 13 Mini - 128GB',1,18690000,'Điện thoại di động Apple iPhone 13 Mini - 128GB - Chính hãng VN/A','ip13mini.png'),(12,'iPhone 13 - 128GB',1,22590000,'Điện thoại di động Apple iPhone 13 - 128GB - Chính hãng VN/A','ip13.png'),(13,'iPhone 13 - 256GB',1,24090000,'Điện thoại di động Apple iPhone 13 - 256GB - Chính hãng VN/A','ip13.png'),(14,'iPhone 13 - 512GB',1,29490000,'Điện thoại di động Apple iPhone 13 - 512GB - Chính hãng VN/A','ip13.png'),(15,'Samsung Galaxy S21 Ultra 128GB 5G',3,21150000,'Điện thoại di động Samsung Galaxy S21 Ultra 128GB 5G - Chính hãng','s21ultra.png'),(16,'Samsung Galaxy S21 Ultra 256GB 5G',3,27350000,'Điện thoại di động Samsung Galaxy S21 Ultra 256GB 5G - Chính hãng','s21ultra.png'),(17,'Samsung Galaxy S21 Plus 256GB 5G',3,22450000,'Điện thoại di động Samsung Galaxy S21 Plus 256GB 5G - Chính hãng','s21plus.png'),(18,'Samsung Galaxy S21 Plus 128GB 5G',3,17350000,'Điện thoại di động Samsung Galaxy S21 Plus 256GB 5G - Chính hãng','s21plus.png'),(19,'Samsung Galaxy Note 20 Ultra',3,18490000,'Điện thoại di động Samsung Galaxy Note 20 Ultra - Chính hãng','note20ultra.png'),(20,'Xiaomi 11T 5G - 8GB/128GB',2,10490000,'Điện thoại di động Xiaomi 11T 5G - 8GB/128GB - Chính Hãng DGW','mi11t.png'),(22,'Xiaomi 11T Pro 5G - 12GB/256GB',2,14990000,'Điện thoại di động Xiaomi 11T Pro 5G - 12GB/256GB - Chính Hãng DGW','mi11tpro.png'),(23,'Xiaomi 11 Lite 5G NE - 8GB/128GB',2,9490000,'Điện thoại di động Xiaomi 11 Lite 5G NE - 8GB/128GB - Chính hãng DGW','mi11lite.png'),(24,'Xiaomi 11 Lite 5G NE - 8GB/128GB (Swarovski)',2,9490000,'Điện thoại di động Xiaomi 11 Lite 5G NE - 8GB/128GB (Phiên bản Swarovski)','mi11lite_swarvski.png'),(25,'Vivo X70 Pro',4,16990000,'Điện thoại di động Vivo X70 Pro - Chính hãng','x70.png');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-13  0:08:43
