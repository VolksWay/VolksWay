CREATE DATABASE  IF NOT EXISTS `db_volksway` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_volksway`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: db_volksway
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `tb_checklist`
--

DROP TABLE IF EXISTS `tb_checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_checklist` (
  `id_checklist` binary(16) NOT NULL,
  `id_veiculo` binary(16) NOT NULL,
  `freio` bit(1) NOT NULL,
  `combustivel` bit(1) NOT NULL,
  `oleo` bit(1) NOT NULL,
  `ar_condicionado` bit(1) NOT NULL,
  `foto_pneu` varchar(256) NOT NULL,
  `data_criado` date NOT NULL,
  `estado_pneu` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_checklist`),
  KEY `id_veiculo` (`id_veiculo`),
  CONSTRAINT `tb_checklist_ibfk_1` FOREIGN KEY (`id_veiculo`) REFERENCES `tb_veiculo` (`id_veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_checklist`
--

LOCK TABLES `tb_checklist` WRITE;
/*!40000 ALTER TABLE `tb_checklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_checklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_empresa`
--

DROP TABLE IF EXISTS `tb_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_empresa` (
  `id_empresa` binary(16) NOT NULL,
  `razao_social` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `cnpj` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_empresa`),
  UNIQUE KEY `razao_social` (`razao_social`),
  UNIQUE KEY `cnpj` (`cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_empresa`
--

LOCK TABLES `tb_empresa` WRITE;
/*!40000 ALTER TABLE `tb_empresa` DISABLE KEYS */;
INSERT INTO `tb_empresa` VALUES (_binary '[Qn\ÕÜ³N”¾cqÒž~\Ã\Ñ','volksway','saocaetano','35207000123');
/*!40000 ALTER TABLE `tb_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_interesse`
--

DROP TABLE IF EXISTS `tb_interesse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_interesse` (
  `id_interesse` binary(16) NOT NULL,
  `id_propaganda` binary(16) NOT NULL,
  `id_usuario` binary(16) NOT NULL,
  `meio_contato_email` bit(1) NOT NULL,
  PRIMARY KEY (`id_interesse`),
  KEY `id_propaganda` (`id_propaganda`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `tb_interesse_ibfk_1` FOREIGN KEY (`id_propaganda`) REFERENCES `tb_propaganda` (`id_propaganda`),
  CONSTRAINT `tb_interesse_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_interesse`
--

LOCK TABLES `tb_interesse` WRITE;
/*!40000 ALTER TABLE `tb_interesse` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_interesse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_propaganda`
--

DROP TABLE IF EXISTS `tb_propaganda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_propaganda` (
  `id_propaganda` binary(16) NOT NULL,
  `id_usuario` binary(16) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `url` varchar(256) NOT NULL,
  `descricao` varchar(256) NOT NULL,
  `img` varchar(256) NOT NULL,
  `publico_alvo` varchar(30) NOT NULL,
  `data_limite` datetime(6) DEFAULT NULL,
  `preco` float(10,2) NOT NULL,
  `importancia` bit(1) NOT NULL,
  `nome_tipo_propaganda` varchar(20) NOT NULL,
  PRIMARY KEY (`id_propaganda`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `tb_propaganda_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_propaganda`
--

LOCK TABLES `tb_propaganda` WRITE;
/*!40000 ALTER TABLE `tb_propaganda` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_propaganda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_usuario` (
  `id_usuario` binary(16) NOT NULL,
  `id_empresa` binary(16) DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(256) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `cidade` varchar(50) NOT NULL,
  `cpf` varchar(255) DEFAULT NULL,
  `img` varchar(256) DEFAULT NULL,
  `tipo_usuario` tinyint NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `telefone` (`telefone`),
  UNIQUE KEY `cpf` (`cpf`),
  KEY `id_empresa` (`id_empresa`),
  CONSTRAINT `tb_usuario_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `tb_empresa` (`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuario`
--

LOCK TABLES `tb_usuario` WRITE;
/*!40000 ALTER TABLE `tb_usuario` DISABLE KEYS */;
INSERT INTO `tb_usuario` VALUES (_binary '\Ùgûž\ÃWOp¤}ú5€³',_binary '[Qn\ÕÜ³N”¾cqÒž~\Ã\Ñ','fiama','964253654','fiama@gmail.com','$2a$10$1AOq7mym5obtPu50h/eaR.E.tWsFhX.2Xc5SpuZL6gpHf2xTQk1py','1994-11-30','saopaulo','37240392805',NULL,3);
/*!40000 ALTER TABLE `tb_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_veiculo`
--

DROP TABLE IF EXISTS `tb_veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_veiculo` (
  `id_veiculo` binary(16) NOT NULL,
  `id_usuario` binary(16) NOT NULL,
  `marca` varchar(30) NOT NULL,
  `placa` varchar(255) DEFAULT NULL,
  `codigo_chassi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_veiculo`),
  UNIQUE KEY `placa` (`placa`),
  UNIQUE KEY `codigo_chassi` (`codigo_chassi`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `tb_veiculo_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_veiculo`
--

LOCK TABLES `tb_veiculo` WRITE;
/*!40000 ALTER TABLE `tb_veiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_veiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-20 19:16:01
