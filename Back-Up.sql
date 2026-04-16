CREATE DATABASE  IF NOT EXISTS `roldan_rodrigo_bbva` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `roldan_rodrigo_bbva`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: roldan_rodrigo_bbva
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `aviso_cliente`
--

DROP TABLE IF EXISTS `aviso_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aviso_cliente` (
  `id_aviso` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `mensaje` varchar(300) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id_aviso`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `aviso_cliente_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aviso_cliente`
--

LOCK TABLES `aviso_cliente` WRITE;
/*!40000 ALTER TABLE `aviso_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `aviso_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `dni` varchar(15) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT 'notiene@notiene.com',
  `id_sucursal` int DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `dni` (`dni`),
  KEY `id_sucursal` (`id_sucursal`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Martin','Suarez','30111222','Av Siempre Viva 123','1122334455','martin@gmail.com',1),(2,'Julieta','Diaz','30222333','San Martin 450','1122221111','julieta@hotmail.com',1),(3,'Nicolas','Herrera','30333444','Belgrano 780','1133344455','nico@gmail.com',2),(4,'Carolina','Navarro','30444555','Mitre 120','1144455566','caro@gmail.com',2),(5,'Lucas','Paz','30555666','Rivadavia 900','1155566677','lucas@hotmail.com',3),(6,'Camila','Sosa','30666777','Lavalle 345','1166677788','camila@hotmail.com',3),(7,'Mateo','Ruiz','30777888','Urquiza 111','1177788899','mateo@gmail.com',4),(8,'Valentina','Vega','30888999','Colon 567','1188899900','vale@hotmail.com',4),(9,'Tomas','Morales','30999000','Brown 222','1199900011','tomas@gmail.com',5),(10,'Florencia','Reyes','31000111','Pueyrredon 654','1100011122','flor@gmail.com',5),(11,'Agustin','Molina','31111222','Alsina 876','1101122233','agus@hotmail.com',6),(12,'Paula','Ortega','31222333','Callao 345','1102233344','paula@gmail.com',6),(13,'Joaquin','Ibarra','31333444','Independencia 765','1103344455','joa@gmail.com',7),(14,'Milagros','Campos','31444555','Saavedra 543','1104455566','mili@gmail.com',7),(15,'Bruno','Luna','31555666','Guemes 222','1105566677','bruno@hotmail.com',8),(16,'Sofia','Roldan','31666777','Lavalle 200','1106677788','sofia@hotmail.com',8),(17,'Diego','Fernandez','31777888','Mitre 340','1107788899','diego@yahoo.com',9),(18,'Lucia','Gimenez','31888999','San Martin 500','1108899900','lucia@gmail.com',9),(19,'Fernando','Acosta','31999000','Belgrano 890','1109900011','fer@yahoo.com',10),(20,'Carla','Mendez','32000111','Rivadavia 150','1110011122','carla@yahoo.com',10),(21,'Juan','Torres','32111222','Colon 765','1111122233','juan@gmail.com',11),(22,'Laura','Silva','32222333','Urquiza 222','1112233344','laura@gmail.com',11),(23,'Pedro','Castro','32333444','Brown 333','1113344455','pedro@yahoo.com',12),(24,'Ana','Vargas','32444555','Alsina 444','1114455566','ana@hotmail.com',12),(25,'Miguel','Rojas','32555666','Callao 555','1115566677','miguel@yahoo.com',13),(26,'Valeria','Navarro','32666777','Mitre 777','1116677788','valeria@gmail.com',13),(27,'Santiago','Ledesma','32777888','Belgrano 888','1117788899','santi@yahoo.com',14),(28,'Daniela','Godoy','32888999','Rivadavia 999','1118899900','dani@hotmail.com',14),(29,'Pablo','Ojeda','32999000','San Martin 222','1119900011','pablo@hotmail.com',15),(30,'Gabriela','Cardozo','33000111','Lavalle 111','1120011122','gabi@gmail.com',15);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_cuenta`
--

DROP TABLE IF EXISTS `cliente_cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_cuenta` (
  `id_cliente` int NOT NULL,
  `id_cuenta` int NOT NULL,
  PRIMARY KEY (`id_cliente`,`id_cuenta`),
  KEY `id_cuenta` (`id_cuenta`),
  CONSTRAINT `cliente_cuenta_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `cliente_cuenta_ibfk_2` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta` (`id_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_cuenta`
--

LOCK TABLES `cliente_cuenta` WRITE;
/*!40000 ALTER TABLE `cliente_cuenta` DISABLE KEYS */;
INSERT INTO `cliente_cuenta` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30);
/*!40000 ALTER TABLE `cliente_cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuenta` (
  `id_cuenta` int NOT NULL AUTO_INCREMENT,
  `tipo_cuenta` varchar(100) DEFAULT NULL,
  `saldo` decimal(12,2) DEFAULT NULL,
  `fecha_apertura` date DEFAULT NULL,
  `id_sucursal` int DEFAULT NULL,
  PRIMARY KEY (`id_cuenta`),
  KEY `id_sucursal` (`id_sucursal`),
  CONSTRAINT `cuenta_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
INSERT INTO `cuenta` VALUES (1,'Caja de ahorro',150000.00,'2023-01-10',1),(2,'Cuenta corriente',200000.00,'2023-02-10',1),(3,'Caja de ahorro',90000.00,'2023-03-10',2),(4,'Cuenta corriente',250000.00,'2023-04-10',2),(5,'Caja de ahorro',80000.00,'2023-05-10',3),(6,'Cuenta corriente',300000.00,'2023-06-10',3),(7,'Caja de ahorro',95000.00,'2023-07-10',4),(8,'Cuenta corriente',270000.00,'2023-08-10',4),(9,'Caja de ahorro',110000.00,'2023-09-10',5),(10,'Cuenta corriente',220000.00,'2023-10-10',5),(11,'Caja de ahorro',70000.00,'2023-11-10',6),(12,'Cuenta corriente',310000.00,'2023-12-10',6),(13,'Caja de ahorro',60000.00,'2024-01-10',7),(14,'Cuenta corriente',260000.00,'2024-02-10',7),(15,'Caja de ahorro',120000.00,'2024-03-10',8),(16,'Cuenta corriente',240000.00,'2024-04-10',8),(17,'Caja de ahorro',130000.00,'2024-05-10',9),(18,'Cuenta corriente',210000.00,'2024-06-10',9),(19,'Caja de ahorro',85000.00,'2024-07-10',10),(20,'Cuenta corriente',290000.00,'2024-08-10',10),(21,'Caja de ahorro',90000.00,'2024-09-10',11),(22,'Cuenta corriente',230000.00,'2024-10-10',11),(23,'Caja de ahorro',75000.00,'2024-11-10',12),(24,'Cuenta corriente',280000.00,'2024-12-10',12),(25,'Caja de ahorro',100000.00,'2025-01-10',13),(26,'Cuenta corriente',260000.00,'2025-02-10',13),(27,'Caja de ahorro',115000.00,'2025-03-10',14),(28,'Cuenta corriente',270000.00,'2025-04-10',14),(29,'Caja de ahorro',95000.00,'2025-05-10',15),(30,'Cuenta corriente',300000.00,'2025-06-10',15);
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_control_descubierto` BEFORE UPDATE ON `cuenta` FOR EACH ROW BEGIN

IF NEW.saldo < 0 AND NEW.saldo >= -2000 THEN
	SET NEW.saldo = 0;
END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `id_sucursal` int DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `sueldo` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `id_sucursal` (`id_sucursal`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,1,'Juan','Perez','Gerente',350000.00),(2,1,'Maria','Lopez','Cajero',220000.00),(3,1,'Carlos','Gomez','Asesor',240000.00),(4,2,'Ana','Martinez','Gerente',360000.00),(5,2,'Luis','Rodriguez','Cajero',210000.00),(6,2,'Laura','Fernandez','Asesor',230000.00),(7,3,'Pedro','Sanchez','Gerente',355000.00),(8,3,'Sofia','Ramirez','Cajero',205000.00),(9,3,'Miguel','Torres','Asesor',235000.00),(10,4,'Lucia','Flores','Gerente',365000.00),(11,4,'Diego','Acosta','Cajero',215000.00),(12,4,'Valeria','Mendez','Asesor',240000.00),(13,5,'Fernando','Rojas','Gerente',370000.00),(14,5,'Carla','Silva','Cajero',210000.00),(15,5,'Andres','Castro','Asesor',245000.00),(16,6,'Martin','Suarez','Gerente',360000.00),(17,6,'Julieta','Diaz','Cajero',220000.00),(18,6,'Nicolas','Herrera','Asesor',235000.00),(19,7,'Carolina','Navarro','Gerente',355000.00),(20,7,'Lucas','Paz','Cajero',205000.00),(21,7,'Camila','Sosa','Asesor',230000.00),(22,8,'Mateo','Ruiz','Gerente',365000.00),(23,8,'Valentina','Vega','Cajero',215000.00),(24,8,'Tomas','Morales','Asesor',240000.00),(25,9,'Florencia','Reyes','Gerente',360000.00),(26,9,'Agustin','Molina','Cajero',210000.00),(27,9,'Paula','Ortega','Asesor',235000.00),(28,10,'Joaquin','Ibarra','Gerente',370000.00),(29,10,'Milagros','Campos','Cajero',220000.00),(30,10,'Bruno','Luna','Asesor',245000.00),(31,11,'Santiago','Benitez','Gerente',360000.00),(32,11,'Luciana','Paredes','Cajero',215000.00),(33,11,'Franco','Villalba','Asesor',235000.00),(34,12,'Daniela','Godoy','Gerente',355000.00),(35,12,'Gonzalo','Quiroga','Cajero',210000.00),(36,12,'Marina','Vargas','Asesor',230000.00),(37,13,'Sebastian','Peralta','Gerente',365000.00),(38,13,'Rocio','Farias','Cajero',220000.00),(39,13,'Ivan','Ledesma','Asesor',240000.00),(40,14,'Natalia','Correa','Gerente',360000.00),(41,14,'Ezequiel','Bustamante','Cajero',210000.00),(42,14,'Lorena','Serrano','Asesor',235000.00),(43,15,'Pablo','Salinas','Gerente',370000.00),(44,15,'Gabriela','Cardozo','Cajero',220000.00),(45,15,'Adrian','Ojeda','Asesor',245000.00);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimiento`
--

DROP TABLE IF EXISTS `movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimiento` (
  `id_movimiento` int NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `monto` decimal(12,2) DEFAULT NULL,
  `tipo_movimiento` varchar(100) DEFAULT NULL,
  `id_cuenta` int DEFAULT NULL,
  PRIMARY KEY (`id_movimiento`),
  KEY `id_cuenta` (`id_cuenta`),
  CONSTRAINT `movimiento_ibfk_1` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta` (`id_cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimiento`
--

LOCK TABLES `movimiento` WRITE;
/*!40000 ALTER TABLE `movimiento` DISABLE KEYS */;
INSERT INTO `movimiento` VALUES (1,'2024-01-10',5000.00,'Deposito',1),(2,'2024-01-11',2000.00,'Extraccion',2),(3,'2024-01-12',7000.00,'Deposito',3),(4,'2024-01-13',1500.00,'Extraccion',4),(5,'2024-01-14',8000.00,'Deposito',5),(6,'2024-01-15',2500.00,'Extraccion',6),(7,'2024-01-16',6000.00,'Deposito',7),(8,'2024-01-17',1200.00,'Extraccion',8),(9,'2024-01-18',4500.00,'Deposito',9),(10,'2024-01-19',3000.00,'Extraccion',10),(11,'2024-01-20',9000.00,'Deposito',11),(12,'2024-01-21',1000.00,'Extraccion',12),(13,'2024-01-22',11000.00,'Deposito',13),(14,'2024-01-23',2000.00,'Extraccion',14),(15,'2024-01-24',7500.00,'Deposito',15),(16,'2025-01-05',12000.00,'Transferencia',3),(17,'2025-01-07',8500.00,'Transferencia',5),(18,'2025-01-10',15000.00,'Transferencia',7),(19,'2025-01-12',6400.00,'Transferencia',9),(20,'2025-01-15',9200.00,'Transferencia',11),(21,'2025-01-18',13400.00,'Transferencia',14),(22,'2025-01-20',7800.00,'Transferencia',17),(23,'2025-01-22',9900.00,'Transferencia',21),(24,'2025-01-25',5600.00,'Transferencia',24),(25,'2025-01-28',14300.00,'Transferencia',28);
/*!40000 ALTER TABLE `movimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio` (
  `id_servicio` int NOT NULL AUTO_INCREMENT,
  `tipo_servicio` varchar(100) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_cuenta` int DEFAULT NULL,
  `id_sucursal` int DEFAULT NULL,
  `id_empleado` int NOT NULL,
  PRIMARY KEY (`id_servicio`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_cuenta` (`id_cuenta`),
  KEY `id_sucursal` (`id_sucursal`),
  KEY `fk_servicio_empleado` (`id_empleado`),
  CONSTRAINT `fk_servicio_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `servicio_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `servicio_ibfk_2` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta` (`id_cuenta`),
  CONSTRAINT `servicio_ibfk_3` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (1,'Seguro','Seguro de tarjeta premium',2100.00,'2025-02-01',1,1,1,2),(2,'Mantenimiento','Mantenimiento de cuenta corriente',1600.00,'2025-02-02',4,4,2,5),(3,'Transferencia','Transferencia internacional',2800.00,'2025-02-03',6,6,3,8),(4,'Prestamo','Gestion de prestamo personal',3500.00,'2025-02-04',9,9,5,13),(5,'Seguro','Seguro de cuenta bancaria',1900.00,'2025-02-05',12,12,6,16),(6,'Mantenimiento','Mantenimiento mensual',1500.00,'2025-02-06',15,15,8,22),(7,'Transferencia','Transferencia nacional',1300.00,'2025-02-07',18,18,9,25),(8,'Prestamo','Gestion de prestamo hipotecario',4200.00,'2025-02-08',21,21,11,31),(9,'Seguro','Seguro de tarjeta de credito',2000.00,'2025-02-09',25,25,13,38),(10,'Mantenimiento','Mantenimiento de cuenta ahorro',1500.00,'2025-02-10',29,29,15,44),(11,'Mantenimiento','Mantenimiento mensual',1500.00,'2024-02-01',1,1,1,1),(12,'Transferencia','Transferencia internacional',2500.00,'2024-02-02',2,2,2,2),(13,'Seguro','Seguro de cuenta',1800.00,'2024-02-03',3,3,3,3),(14,'Mantenimiento','Mantenimiento mensual',1500.00,'2024-02-04',4,4,4,4),(15,'Prestamo','Gestion de prestamo',3000.00,'2024-02-05',5,5,5,5),(16,'Seguro','Seguro de tarjeta',1700.00,'2024-02-06',6,6,6,6),(17,'Mantenimiento','Mantenimiento mensual',1500.00,'2024-02-07',7,7,7,7),(18,'Transferencia','Transferencia nacional',1200.00,'2024-02-08',8,8,8,8),(19,'Seguro','Seguro de cuenta',1800.00,'2024-02-09',9,9,9,9),(20,'Mantenimiento','Mantenimiento mensual',1500.00,'2024-02-10',10,10,10,10),(21,'Prestamo','Gestion de prestamo',3200.00,'2024-02-11',11,11,11,11),(22,'Seguro','Seguro de tarjeta',1700.00,'2024-02-12',12,12,12,12),(23,'Transferencia','Transferencia internacional',2600.00,'2024-02-13',13,13,13,13),(24,'Mantenimiento','Mantenimiento mensual',1500.00,'2024-02-14',14,14,14,14),(25,'Prestamo','Gestion de prestamo',3500.00,'2024-02-15',15,15,15,15);
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_aviso_transf_int` AFTER INSERT ON `servicio` FOR EACH ROW BEGIN

IF NEW.tipo_servicio = 'Transferencia Internacional' THEN 
INSERT INTO aviso_cliente (id_cliente, mensaje, fecha)
VALUES (NEW.id_cliente, 'Se aplico un recargo del 20% por transferencia internacional', NOW ()
);

END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal` (
  `id_sucursal` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,'Sucursal Centro','Av. San Martin 120','Buenos Aires'),(2,'Sucursal Norte','Av. Libertador 450','Buenos Aires'),(3,'Sucursal Sur','Av. Mitre 330','Avellaneda'),(4,'Sucursal Oeste','Rivadavia 2200','Moreno'),(5,'Sucursal Este','Av. Belgrano 800','La Plata'),(6,'Sucursal Pilar','Ruta 8 km 50','Pilar'),(7,'Sucursal San Miguel','Av. Peron 1200','San Miguel'),(8,'Sucursal Tigre','Av. Cazon 450','Tigre'),(9,'Sucursal Quilmes','Av. Calchaqui 600','Quilmes'),(10,'Sucursal Moron','Av. Rivadavia 17500','Moron'),(11,'Sucursal Lujan','San Martin 450','Lujan'),(12,'Sucursal Escobar','Av. Tapia de Cruz 900','Escobar'),(13,'Sucursal Lanus','Hipolito Yrigoyen 3500','Lanus'),(14,'Sucursal Ituzaingo','Santa Rosa 900','Ituzaingo'),(15,'Sucursal San Isidro','Av. Centenario 700','San Isidro');
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjeta`
--

DROP TABLE IF EXISTS `tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarjeta` (
  `nro_tarjeta` bigint NOT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `limite` decimal(12,2) DEFAULT NULL,
  `id_cuenta` int DEFAULT NULL,
  PRIMARY KEY (`nro_tarjeta`),
  KEY `id_cuenta` (`id_cuenta`),
  CONSTRAINT `tarjeta_ibfk_1` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta` (`id_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjeta`
--

LOCK TABLES `tarjeta` WRITE;
/*!40000 ALTER TABLE `tarjeta` DISABLE KEYS */;
INSERT INTO `tarjeta` VALUES (4500000000000001,'Credito','2027-01-01',200000.00,1),(4500000000000002,'Debito','2027-02-01',150000.00,2),(4500000000000003,'Credito','2027-03-01',180000.00,3),(4500000000000004,'Debito','2027-04-01',120000.00,4),(4500000000000005,'Credito','2027-05-01',300000.00,5),(4500000000000006,'Debito','2027-06-01',100000.00,6),(4500000000000007,'Credito','2027-07-01',400000.00,7),(4500000000000008,'Debito','2027-08-01',90000.00,8),(4500000000000009,'Credito','2027-09-01',220000.00,9),(4500000000000010,'Debito','2027-10-01',110000.00,10),(4500000000000011,'Credito','2027-11-01',350000.00,11),(4500000000000012,'Debito','2027-12-01',95000.00,12),(4500000000000013,'Credito','2028-01-01',420000.00,13),(4500000000000014,'Debito','2028-02-01',100000.00,14),(4500000000000015,'Credito','2028-03-01',310000.00,15),(4500000000000016,'Debito','2028-04-01',90000.00,16),(4500000000000017,'Credito','2028-05-01',210000.00,17),(4500000000000018,'Debito','2028-06-01',120000.00,18),(4500000000000019,'Credito','2028-07-01',330000.00,19),(4500000000000020,'Debito','2028-08-01',95000.00,20),(4500000000000021,'Credito','2028-09-01',250000.00,21),(4500000000000022,'Debito','2028-10-01',110000.00,22),(4500000000000023,'Credito','2028-11-01',360000.00,23),(4500000000000024,'Debito','2028-12-01',100000.00,24),(4500000000000025,'Credito','2029-01-01',410000.00,25),(4500000000000026,'Debito','2029-02-01',95000.00,26),(4500000000000027,'Credito','2029-03-01',230000.00,27),(4500000000000028,'Debito','2029-04-01',120000.00,28),(4500000000000029,'Credito','2029-05-01',340000.00,29),(4500000000000030,'Debito','2029-06-01',100000.00,30);
/*!40000 ALTER TABLE `tarjeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_retenciones_x_extraccion`
--

DROP TABLE IF EXISTS `vw_retenciones_x_extraccion`;
/*!50001 DROP VIEW IF EXISTS `vw_retenciones_x_extraccion`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_retenciones_x_extraccion` AS SELECT 
 1 AS `id_movimiento`,
 1 AS `fecha`,
 1 AS `monto`,
 1 AS `tipo_movimiento`,
 1 AS `id_cuenta`,
 1 AS `valor_retencion`,
 1 AS `tipo_cuenta`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_transferencias_clientes`
--

DROP TABLE IF EXISTS `vw_transferencias_clientes`;
/*!50001 DROP VIEW IF EXISTS `vw_transferencias_clientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_transferencias_clientes` AS SELECT 
 1 AS `tipo_servicio`,
 1 AS `descripcion`,
 1 AS `costo`,
 1 AS `costo_con_impuesto`,
 1 AS `fecha`,
 1 AS `id_cliente`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'roldan_rodrigo_bbva'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_imp_transf_int` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_imp_transf_int`(costo DECIMAL(10,2), tipo VARCHAR(100)) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    IF tipo = 'Transferencia Internacional' THEN
        SET total = costo + (costo * 0.20);
    ELSE
        SET total = costo;
    END IF;

    RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_retencion_iva_cc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_retencion_iva_cc`(monto DECIMAL (10,2), tipo_cuenta VARCHAR (100)) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
	DECLARE monto_final DECIMAL (10,2);
    
	IF tipo_cuenta = 'Cuenta Corriente' THEN
		SET monto_final = (monto * 0.21);
	ELSE
		SET monto_final = 0;
	END IF;
    
    RETURN monto_final;
    
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `aumento_cajero` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `aumento_cajero`()
BEGIN

UPDATE empleado
	SET sueldo = sueldo * 1.10
WHERE cargo = 'Cajero';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `clientes_por_sucursal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `clientes_por_sucursal`(
IN sucursalID INT)
BEGIN

SELECT nombre, apellido, email
FROM cliente
WHERE id_sucursal = sucursalID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_retenciones_x_extraccion`
--

/*!50001 DROP VIEW IF EXISTS `vw_retenciones_x_extraccion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_retenciones_x_extraccion` AS select `c`.`id_movimiento` AS `id_movimiento`,`c`.`fecha` AS `fecha`,`c`.`monto` AS `monto`,`c`.`tipo_movimiento` AS `tipo_movimiento`,`c`.`id_cuenta` AS `id_cuenta`,`fn_retencion_iva_cc`(`c`.`monto`,`b`.`tipo_cuenta`) AS `valor_retencion`,`b`.`tipo_cuenta` AS `tipo_cuenta`,`q`.`nombre` AS `nombre`,`q`.`apellido` AS `apellido`,`q`.`email` AS `email` from (((`movimiento` `c` join `cuenta` `b` on((`c`.`id_cuenta` = `b`.`id_cuenta`))) join `cliente_cuenta` `a` on((`b`.`id_cuenta` = `a`.`id_cuenta`))) join `cliente` `q` on((`a`.`id_cliente` = `q`.`id_cliente`))) where (`c`.`tipo_movimiento` = 'Extraccion') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_transferencias_clientes`
--

/*!50001 DROP VIEW IF EXISTS `vw_transferencias_clientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_transferencias_clientes` AS select `c`.`tipo_servicio` AS `tipo_servicio`,`c`.`descripcion` AS `descripcion`,`c`.`costo` AS `costo`,`fn_imp_transf_int`(`c`.`costo`,`c`.`descripcion`) AS `costo_con_impuesto`,`c`.`fecha` AS `fecha`,`c`.`id_cliente` AS `id_cliente`,`d`.`nombre` AS `nombre`,`d`.`apellido` AS `apellido`,`d`.`email` AS `email` from (`servicio` `c` join `cliente` `d` on((`c`.`id_cliente` = `d`.`id_cliente`))) where (`c`.`descripcion` like '%Transferencia%') */;
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

-- Dump completed on 2026-04-15 21:08:06
