-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: libro_Express
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_clientes`
--

DROP TABLE IF EXISTS `tb_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_clientes` (
  `id_cliente` varchar(36) NOT NULL DEFAULT uuid(),
  `nombre_cliente` varchar(50) NOT NULL,
  `email_cliente` varchar(100) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `unique_email_cliente` (`email_cliente`),
  UNIQUE KEY `unique_telefono` (`telefono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_clientes`
--

LOCK TABLES `tb_clientes` WRITE;
/*!40000 ALTER TABLE `tb_clientes` DISABLE KEYS */;
INSERT INTO `tb_clientes` VALUES ('291c814b-d6aa-11ee-ac11-508140ed6d22','Ana Pérez','ana.perez@gmail.com','1234-5678'),('292d82cf-d6aa-11ee-ac11-508140ed6d22','Carlos García','carlos.garcia@hotmail.com','0987-6543'),('29331c87-d6aa-11ee-ac11-508140ed6d22','Luisa Rodríguez','luisa.rodriguez@yahoo.com','2345-6789'),('293b8422-d6aa-11ee-ac11-508140ed6d22','Pedro Sánchez','pedro.sanchez@outlook.com','3456-7890'),('2943f790-d6aa-11ee-ac11-508140ed6d22','María López','maria.lopez@libroexpress.com','4567-8901'),('29479467-d6aa-11ee-ac11-508140ed6d22','Jorge Martínez','jorge.martinez@libroexpress.com','5678-9012'),('294c05c0-d6aa-11ee-ac11-508140ed6d22','Sofía González','sofia.gonzalez@libroexpress.com','6789-0123'),('295bc110-d6aa-11ee-ac11-508140ed6d22','Juan Hernández','juan.hernandez@libroexpress.com','7890-1234'),('29602912-d6aa-11ee-ac11-508140ed6d22','Laura Torres','laura.torres@libroexpress.com','8901-2345'),('29641ea5-d6aa-11ee-ac11-508140ed6d22','Miguel Álvarez','miguel.alvarez@libroexpress.com','9012-3456'),('2968a8d6-d6aa-11ee-ac11-508140ed6d22','Elena Jiménez','elena.jimenez@libroexpress.com','0123-4567'),('296c94ce-d6aa-11ee-ac11-508140ed6d22','Daniel Ruiz','daniel.ruiz@libroexpress.com','1234-5098'),('29710319-d6aa-11ee-ac11-508140ed6d22','Sara Morales','sara.morales@libroexpress.com','2345-6109'),('297508ef-d6aa-11ee-ac11-508140ed6d22','José Ramírez','jose.ramirez@libroexpress.com','3456-7210'),('29797714-d6aa-11ee-ac11-508140ed6d22','Carmen Díaz','carmen.diaz@libroexpress.com','4567-8321');
/*!40000 ALTER TABLE `tb_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_detalles_prestamos`
--

DROP TABLE IF EXISTS `tb_detalles_prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_detalles_prestamos` (
  `id_detalle_prestamo` varchar(36) NOT NULL DEFAULT uuid(),
  `id_prestamo` varchar(36) NOT NULL,
  `id_libro` varchar(36) NOT NULL,
  PRIMARY KEY (`id_detalle_prestamo`),
  KEY `id_prestamo_detalle` (`id_prestamo`),
  KEY `id_libro_detalle` (`id_libro`),
  CONSTRAINT `id_libro_detalle` FOREIGN KEY (`id_libro`) REFERENCES `tb_libros` (`id_libro`),
  CONSTRAINT `id_prestamo_detalle` FOREIGN KEY (`id_prestamo`) REFERENCES `tb_prestamos` (`id_prestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_detalles_prestamos`
--

LOCK TABLES `tb_detalles_prestamos` WRITE;
/*!40000 ALTER TABLE `tb_detalles_prestamos` DISABLE KEYS */;
INSERT INTO `tb_detalles_prestamos` VALUES ('34dd2a46-d6aa-11ee-ac11-508140ed6d22','2dd60009-d6aa-11ee-ac11-508140ed6d22','31cf975d-d6aa-11ee-ac11-508140ed6d22'),('34e4ab0e-d6aa-11ee-ac11-508140ed6d22','2ddd876f-d6aa-11ee-ac11-508140ed6d22','31d964d5-d6aa-11ee-ac11-508140ed6d22'),('34f0eb85-d6aa-11ee-ac11-508140ed6d22','2ded05a7-d6aa-11ee-ac11-508140ed6d22','31e6c427-d6aa-11ee-ac11-508140ed6d22'),('34f738b9-d6aa-11ee-ac11-508140ed6d22','2df408b5-d6aa-11ee-ac11-508140ed6d22','31ebf7b7-d6aa-11ee-ac11-508140ed6d22'),('34fcc027-d6aa-11ee-ac11-508140ed6d22','2df8845c-d6aa-11ee-ac11-508140ed6d22','31f116e1-d6aa-11ee-ac11-508140ed6d22'),('3501e578-d6aa-11ee-ac11-508140ed6d22','2dfc7f13-d6aa-11ee-ac11-508140ed6d22','31f5a525-d6aa-11ee-ac11-508140ed6d22'),('350896a3-d6aa-11ee-ac11-508140ed6d22','2e032c6e-d6aa-11ee-ac11-508140ed6d22','31fb3965-d6aa-11ee-ac11-508140ed6d22'),('350db770-d6aa-11ee-ac11-508140ed6d22','2e06a4f3-d6aa-11ee-ac11-508140ed6d22','31ffc3c8-d6aa-11ee-ac11-508140ed6d22'),('35146518-d6aa-11ee-ac11-508140ed6d22','2e0b155c-d6aa-11ee-ac11-508140ed6d22','32055727-d6aa-11ee-ac11-508140ed6d22'),('35198a16-d6aa-11ee-ac11-508140ed6d22','2e0f07da-d6aa-11ee-ac11-508140ed6d22','320a533b-d6aa-11ee-ac11-508140ed6d22'),('351e0f84-d6aa-11ee-ac11-508140ed6d22','2e139773-d6aa-11ee-ac11-508140ed6d22','320dcb5f-d6aa-11ee-ac11-508140ed6d22'),('3523a951-d6aa-11ee-ac11-508140ed6d22','2e177f4a-d6aa-11ee-ac11-508140ed6d22','32124b08-d6aa-11ee-ac11-508140ed6d22'),('35282af4-d6aa-11ee-ac11-508140ed6d22','2e1bffc2-d6aa-11ee-ac11-508140ed6d22','3217edef-d6aa-11ee-ac11-508140ed6d22'),('352dd053-d6aa-11ee-ac11-508140ed6d22','2e21d3d8-d6aa-11ee-ac11-508140ed6d22','321c6e4e-d6aa-11ee-ac11-508140ed6d22'),('353252f6-d6aa-11ee-ac11-508140ed6d22','2e262433-d6aa-11ee-ac11-508140ed6d22','32220abf-d6aa-11ee-ac11-508140ed6d22');
/*!40000 ALTER TABLE `tb_detalles_prestamos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER actualizar_estado_libro

AFTER INSERT ON tb_detalles_prestamos

FOR EACH ROW

BEGIN

    UPDATE tb_libros

    SET estado = 'Prestado'

    WHERE id_libro = NEW.id_libro;
 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_genero_libros`
--

DROP TABLE IF EXISTS `tb_genero_libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_genero_libros` (
  `id_genero_libro` varchar(36) NOT NULL DEFAULT uuid(),
  `nombre_genero_libro` varchar(50) NOT NULL,
  PRIMARY KEY (`id_genero_libro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_genero_libros`
--

LOCK TABLES `tb_genero_libros` WRITE;
/*!40000 ALTER TABLE `tb_genero_libros` DISABLE KEYS */;
INSERT INTO `tb_genero_libros` VALUES ('2baa6b7f-d6aa-11ee-ac11-508140ed6d22','Novela'),('2bb2ba12-d6aa-11ee-ac11-508140ed6d22','Poesía'),('2bb7dfa9-d6aa-11ee-ac11-508140ed6d22','Ensayo'),('2bbc5d5d-d6aa-11ee-ac11-508140ed6d22','Biografía'),('2bc20940-d6aa-11ee-ac11-508140ed6d22','Ciencia ficción'),('2bc67fd3-d6aa-11ee-ac11-508140ed6d22','Fantasía'),('2bcdc9b1-d6aa-11ee-ac11-508140ed6d22','Terror'),('2bd48965-d6aa-11ee-ac11-508140ed6d22','Romance'),('2bd90f02-d6aa-11ee-ac11-508140ed6d22','Histórica'),('2bdea124-d6aa-11ee-ac11-508140ed6d22','Policial'),('2be332c5-d6aa-11ee-ac11-508140ed6d22','Humor'),('2be940d8-d6aa-11ee-ac11-508140ed6d22','Autoayuda'),('2bf9b31f-d6aa-11ee-ac11-508140ed6d22','Infantil'),('2bfd0030-d6aa-11ee-ac11-508140ed6d22','Juvenil'),('2c0220ae-d6aa-11ee-ac11-508140ed6d22','Cómic');
/*!40000 ALTER TABLE `tb_genero_libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_libros`
--

DROP TABLE IF EXISTS `tb_libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_libros` (
  `id_libro` varchar(36) NOT NULL DEFAULT uuid(),
  `titulo_libro` varchar(50) NOT NULL,
  `anio_publicacion` int(11) NOT NULL,
  `id_genero_libro` varchar(36) NOT NULL,
  `estado` enum('disponible','prestado') DEFAULT NULL,
  PRIMARY KEY (`id_libro`),
  KEY `id_genero_tblibro` (`id_genero_libro`),
  CONSTRAINT `id_genero_tblibro` FOREIGN KEY (`id_genero_libro`) REFERENCES `tb_genero_libros` (`id_genero_libro`),
  CONSTRAINT `check_anio_publicacion` CHECK (`anio_publicacion` > 0 and `anio_publicacion` < 2025)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_libros`
--

LOCK TABLES `tb_libros` WRITE;
/*!40000 ALTER TABLE `tb_libros` DISABLE KEYS */;
INSERT INTO `tb_libros` VALUES ('31cf975d-d6aa-11ee-ac11-508140ed6d22','Cien años de soledad',1967,'2baa6b7f-d6aa-11ee-ac11-508140ed6d22','prestado'),('31d964d5-d6aa-11ee-ac11-508140ed6d22','Veinte poemas de amor y una canción desesperada',1924,'2bb2ba12-d6aa-11ee-ac11-508140ed6d22','prestado'),('31e6c427-d6aa-11ee-ac11-508140ed6d22','El origen de las especies',1859,'2bb7dfa9-d6aa-11ee-ac11-508140ed6d22','prestado'),('31ebf7b7-d6aa-11ee-ac11-508140ed6d22','El diario de Ana Frank',1947,'2bbc5d5d-d6aa-11ee-ac11-508140ed6d22','prestado'),('31f116e1-d6aa-11ee-ac11-508140ed6d22','El juego de Ender',1985,'2bc20940-d6aa-11ee-ac11-508140ed6d22','prestado'),('31f5a525-d6aa-11ee-ac11-508140ed6d22','El señor de los anillos',1954,'2bc67fd3-d6aa-11ee-ac11-508140ed6d22','prestado'),('31fb3965-d6aa-11ee-ac11-508140ed6d22','El resplandor',1977,'2bcdc9b1-d6aa-11ee-ac11-508140ed6d22','prestado'),('31ffc3c8-d6aa-11ee-ac11-508140ed6d22','Orgullo y prejuicio',1813,'2bd48965-d6aa-11ee-ac11-508140ed6d22','prestado'),('32055727-d6aa-11ee-ac11-508140ed6d22','El nombre de la rosa',1980,'2bd90f02-d6aa-11ee-ac11-508140ed6d22','prestado'),('320a533b-d6aa-11ee-ac11-508140ed6d22','El código Da Vinci',2003,'2bdea124-d6aa-11ee-ac11-508140ed6d22','prestado'),('320dcb5f-d6aa-11ee-ac11-508140ed6d22','El principito',1943,'2be332c5-d6aa-11ee-ac11-508140ed6d22','prestado'),('32124b08-d6aa-11ee-ac11-508140ed6d22','Los cuatro acuerdos',1997,'2be940d8-d6aa-11ee-ac11-508140ed6d22','prestado'),('3217edef-d6aa-11ee-ac11-508140ed6d22','Harry Potter y la piedra filosofal',1997,'2bf9b31f-d6aa-11ee-ac11-508140ed6d22','prestado'),('321c6e4e-d6aa-11ee-ac11-508140ed6d22','Los juegos del hambre',2008,'2bfd0030-d6aa-11ee-ac11-508140ed6d22','prestado'),('32220abf-d6aa-11ee-ac11-508140ed6d22','Maus',1986,'2c0220ae-d6aa-11ee-ac11-508140ed6d22','prestado');
/*!40000 ALTER TABLE `tb_libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_prestamos`
--

DROP TABLE IF EXISTS `tb_prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_prestamos` (
  `id_prestamo` varchar(36) NOT NULL DEFAULT uuid(),
  `id_cliente` varchar(36) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_devolucion` date NOT NULL,
  `estado` enum('activo','inactivo') DEFAULT NULL,
  PRIMARY KEY (`id_prestamo`),
  KEY `id_cliente_prestamo` (`id_cliente`),
  CONSTRAINT `id_cliente_prestamo` FOREIGN KEY (`id_cliente`) REFERENCES `tb_clientes` (`id_cliente`),
  CONSTRAINT `check_fecha` CHECK (`fecha_inicio` < `fecha_devolucion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_prestamos`
--

LOCK TABLES `tb_prestamos` WRITE;
/*!40000 ALTER TABLE `tb_prestamos` DISABLE KEYS */;
INSERT INTO `tb_prestamos` VALUES ('2dd60009-d6aa-11ee-ac11-508140ed6d22','291c814b-d6aa-11ee-ac11-508140ed6d22','2024-01-01','2024-01-15','activo'),('2ddd876f-d6aa-11ee-ac11-508140ed6d22','292d82cf-d6aa-11ee-ac11-508140ed6d22','2024-01-02','2024-01-16','activo'),('2ded05a7-d6aa-11ee-ac11-508140ed6d22','29331c87-d6aa-11ee-ac11-508140ed6d22','2024-01-03','2024-01-17','activo'),('2df408b5-d6aa-11ee-ac11-508140ed6d22','293b8422-d6aa-11ee-ac11-508140ed6d22','2024-01-04','2024-01-18','activo'),('2df8845c-d6aa-11ee-ac11-508140ed6d22','2943f790-d6aa-11ee-ac11-508140ed6d22','2024-01-05','2024-01-19','activo'),('2dfc7f13-d6aa-11ee-ac11-508140ed6d22','29479467-d6aa-11ee-ac11-508140ed6d22','2024-01-06','2024-01-20','activo'),('2e032c6e-d6aa-11ee-ac11-508140ed6d22','294c05c0-d6aa-11ee-ac11-508140ed6d22','2024-01-07','2024-01-21','activo'),('2e06a4f3-d6aa-11ee-ac11-508140ed6d22','295bc110-d6aa-11ee-ac11-508140ed6d22','2024-01-08','2024-01-22','activo'),('2e0b155c-d6aa-11ee-ac11-508140ed6d22','29602912-d6aa-11ee-ac11-508140ed6d22','2024-01-09','2024-01-23','activo'),('2e0f07da-d6aa-11ee-ac11-508140ed6d22','29641ea5-d6aa-11ee-ac11-508140ed6d22','2024-01-10','2024-01-24','activo'),('2e139773-d6aa-11ee-ac11-508140ed6d22','2968a8d6-d6aa-11ee-ac11-508140ed6d22','2024-01-11','2024-01-25','activo'),('2e177f4a-d6aa-11ee-ac11-508140ed6d22','296c94ce-d6aa-11ee-ac11-508140ed6d22','2024-01-12','2024-01-26','activo'),('2e1bffc2-d6aa-11ee-ac11-508140ed6d22','29710319-d6aa-11ee-ac11-508140ed6d22','2024-01-13','2024-01-27','activo'),('2e21d3d8-d6aa-11ee-ac11-508140ed6d22','297508ef-d6aa-11ee-ac11-508140ed6d22','2024-01-14','2024-01-28','activo'),('2e262433-d6aa-11ee-ac11-508140ed6d22','29797714-d6aa-11ee-ac11-508140ed6d22','2024-01-15','2024-01-29','activo');
/*!40000 ALTER TABLE `tb_prestamos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-28 20:29:47
