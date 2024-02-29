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
/*!40000 ALTER TABLE `tb_detalles_prestamos` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2024-02-28 20:08:38
