-- MySQL dump 10.13  Distrib 5.5.9, for Win32 (x86)
--
-- Host: localhost    Database: vendabilhetes
-- ------------------------------------------------------
-- Server version	5.5.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `vendabilhetes`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `vendabilhetes` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `vendabilhetes`;

--
-- Table structure for table `tb_bilhete`
--

DROP TABLE IF EXISTS `tb_bilhete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_bilhete` (
  `numero` int(11) NOT NULL AUTO_INCREMENT,
  `dataCompra` date NOT NULL,
  `idEvento` int(11) NOT NULL,
  `cpfUsuario` varchar(255) NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `FKF97BA9E239D096BB` (`idEvento`),
  KEY `FKF97BA9E2EA8BC5AD` (`cpfUsuario`),
  CONSTRAINT `FKF97BA9E2EA8BC5AD` FOREIGN KEY (`cpfUsuario`) REFERENCES `tb_usuario` (`cpf`),
  CONSTRAINT `FKF97BA9E239D096BB` FOREIGN KEY (`idEvento`) REFERENCES `tb_evento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_bilhete`
--

LOCK TABLES `tb_bilhete` WRITE;
/*!40000 ALTER TABLE `tb_bilhete` DISABLE KEYS */;
INSERT INTO `tb_bilhete` (`numero`, `dataCompra`, `idEvento`, `cpfUsuario`) VALUES (1,'2011-08-30',4,'345678'),(2,'2011-08-30',4,'345678'),(3,'2011-08-30',1,'345678'),(4,'2011-08-30',1,'345678'),(5,'2011-08-30',2,'345678'),(6,'2011-08-30',2,'345678'),(7,'2011-08-30',2,'345678'),(8,'2011-08-30',3,'345678'),(9,'2011-08-30',5,'345678'),(10,'2011-08-30',6,'345678'),(11,'2011-08-30',1,'456789'),(12,'2011-08-30',3,'456789'),(13,'2011-08-30',6,'456789'),(14,'2011-08-30',3,'567890'),(15,'2011-08-30',3,'567890'),(16,'2011-08-30',5,'567890'),(17,'2011-08-30',5,'567890'),(18,'2011-08-30',6,'567890'),(19,'2011-08-30',6,'567890');
/*!40000 ALTER TABLE `tb_bilhete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_categoria`
--

DROP TABLE IF EXISTS `tb_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_categoria`
--

LOCK TABLES `tb_categoria` WRITE;
/*!40000 ALTER TABLE `tb_categoria` DISABLE KEYS */;
INSERT INTO `tb_categoria` (`id`, `descricao`) VALUES (1,'Show'),(2,'Filme'),(3,'Peça Teatral'),(4,'Programa Televisivo de Auditório');
/*!40000 ALTER TABLE `tb_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_evento`
--

DROP TABLE IF EXISTS `tb_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_evento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `capacidade` int(11) NOT NULL,
  `classificacaoEtaria` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `valor` float NOT NULL,
  `idCategoria` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK47AD5806AF8A5835` (`idCategoria`),
  CONSTRAINT `FK47AD5806AF8A5835` FOREIGN KEY (`idCategoria`) REFERENCES `tb_categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_evento`
--

LOCK TABLES `tb_evento` WRITE;
/*!40000 ALTER TABLE `tb_evento` DISABLE KEYS */;
INSERT INTO `tb_evento` (`id`, `capacidade`, `classificacaoEtaria`, `data`, `descricao`, `valor`, `idCategoria`) VALUES (1,120,0,'2011-09-05 20:00:00','E o Vento Levou',50,2),(2,110,0,'2011-09-06 15:00:00','Garfield 2',35,2),(3,80,16,'2011-09-07 21:00:00','O Exterminador do Futuro 4',50,2),(4,60,14,'2011-09-10 20:00:00','Aluga-se um Namorado',100,3),(5,120,18,'2011-10-05 17:00:00','Programa do Jô',0,4),(6,320,16,'2011-10-29 20:00:00','U2 no Brasil',350,1);
/*!40000 ALTER TABLE `tb_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_usuario` (
  `cpf` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nascimento` date NOT NULL,
  `nivel` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuario`
--

LOCK TABLES `tb_usuario` WRITE;
/*!40000 ALTER TABLE `tb_usuario` DISABLE KEYS */;
INSERT INTO `tb_usuario` (`cpf`, `email`, `nascimento`, `nivel`, `nome`, `senha`) VALUES ('123456','admin@admin','1970-01-01',0,'Administrador','123456'),('234567','emilio@fiap','1995-05-02',0,'Emilio Celso de Souza','234567'),('345678','robson@robsonmartins.com','1978-08-02',1,'Robson de Sousa Martins','345678'),('456789','adriana@fiap','1990-05-03',1,'Adriana Del Nero Romano','456789'),('567890','christiny@fiap','1987-02-18',1,'Christiny Belini Goulart','567890');
/*!40000 ALTER TABLE `tb_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


