-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: livraria
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `NIF` int NOT NULL,
  `Contacto` int NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Código de Postal` char(8) NOT NULL,
  `Localidade` varchar(30) NOT NULL,
  `Rua` varchar(90) NOT NULL,
  PRIMARY KEY (`NIF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (126434219,961434578,'João Barbatana','2300-313','Viana do Castelo','Rua do Amongo'),(225424587,912563598,'José Alcino','2400-827','Leiria','Rua do Carmo'),(226354688,914452322,'Nick Ger','4500-943','Porto','Rua do Pão Seco'),(254876589,914578455,'João Gonçalo','1000-124','Lisboa','Rua da Madalena'),(326444590,961435315,'Esdrubaldo Moisés','4500-423','Porto','Rua do Aires'),(526421477,919666667,'Marta Suares','2450-335','Nazaré','Rua dos Bacalhoeiros'),(526524564,252658747,'Tozé Da Quinta','4941-909','Paredes de Coura','Rua das Laranjeiras'),(547856974,919662666,'Alberto Ronaldo','2450-023','Famalicão Nazaré','Rua José Pinto Sá'),(589424525,966785241,'Catarina Maia','4910-023','Caminha','Rua do Fado Português'),(726424588,911452365,'Esdrubaldo Maurício','2400-823','Leiria','Rua de São Bento');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encomenda`
--

DROP TABLE IF EXISTS `encomenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encomenda` (
  `idEncomenda` int NOT NULL,
  `Local de Entrega` varchar(100) NOT NULL,
  `Estado` varchar(15) NOT NULL,
  `Tipo de Pagamento` varchar(40) DEFAULT NULL,
  `Data de Encomenda` date NOT NULL,
  `Data de Entrega` date NOT NULL,
  `Funcionário_idFuncionário` int NOT NULL,
  `Cliente_NIF` int NOT NULL,
  `Veículo_Matrícula` char(8) NOT NULL,
  PRIMARY KEY (`idEncomenda`),
  KEY `fk_Encomenda_Funcionário1_idx` (`Funcionário_idFuncionário`),
  KEY `fk_Encomenda_Cliente1_idx` (`Cliente_NIF`),
  KEY `fk_Encomenda_Veículo1_idx` (`Veículo_Matrícula`),
  CONSTRAINT `fk_Encomenda_Cliente1` FOREIGN KEY (`Cliente_NIF`) REFERENCES `cliente` (`NIF`),
  CONSTRAINT `fk_Encomenda_Funcionário1` FOREIGN KEY (`Funcionário_idFuncionário`) REFERENCES `funcionário` (`idFuncionário`),
  CONSTRAINT `fk_Encomenda_Veículo1` FOREIGN KEY (`Veículo_Matrícula`) REFERENCES `veículo` (`Matrícula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encomenda`
--

LOCK TABLES `encomenda` WRITE;
/*!40000 ALTER TABLE `encomenda` DISABLE KEYS */;
INSERT INTO `encomenda` VALUES (1,'Rua da Madalena','Paga','Paysafecard','2022-10-22','2022-10-23',1,254876589,'24-UA-26'),(2,'Rua da Madalena','Paga','Cartão de Crédito','2022-10-22','2022-10-23',1,254876589,'24-UA-26'),(3,'Rua José Pinto Sá','Paga','MBway','2022-10-22','2022-10-23',2,547856974,'UO-57-12'),(4,'Rua dos Bacalhoeiros','Paga','Cartão de Débito','2022-10-22','2022-10-23',3,526421477,'25-KL-69'),(5,'Rua dos Bacalhoeiros','Paga','Paysafecard','2022-10-22','2022-10-23',2,526421477,'24-UA-26'),(6,'Rua do Carmo','Entregue','Cartão de Crédito','2022-10-21','2022-10-22',4,225424587,'25-KL-69'),(7,'Rua do Fado Português','Entregue','Bitcoin','2022-10-21','2022-10-22',1,589424525,'UO-57-12'),(8,'Rua das Laranjeiras','Entregue','Cartão de Crédito','2022-10-21','2022-10-22',4,526524564,'25-KL-69'),(9,'Rua de São Bento','Entregue','Paypal','2022-10-20','2022-10-21',3,726424588,'25-KL-69'),(10,'Rua do Aires','Entregue','Cartão de Crédito','2022-10-20','2022-10-21',2,326444590,'UO-57-12'),(11,'Rua do Pão Seco','Entregue',' Cartão de Crédito','2022-10-20','2022-10-21',1,226354688,'UO-57-12'),(12,'Rua do Amongo','Entregue','Bitcoin','2022-10-20','2022-10-21',4,126434219,'25-KL-69'),(13,'Rua do Sésamo','Entregue','MBway','2000-07-21','2000-07-23',4,254876589,'UO-57-12'),(14,'Rua do Amongo','Entregue','Dogecoin','2000-07-22','2000-07-23',2,126434219,'UO-57-12'),(15,'Rua do Amongo','Entregue','Dogecoin','2000-07-22','2000-07-23',2,126434219,'UO-57-12'),(16,'Rua do Amongo','Entregue','Dogecoin','2000-07-22','2000-07-23',2,126434219,'UO-57-12'),(17,'Rua do Amongo','Entregue','Dogecoin','2000-07-22','2000-07-23',2,126434219,'UO-57-12'),(18,'Rua do Amongo','Entregue','Dogecoin','2000-07-22','2000-07-23',2,126434219,'UO-57-12'),(19,'Rua do Amongo','Entregue','Dogecoin','2000-07-22','2000-07-23',2,126434219,'UO-57-12'),(20,'Rua do Amongo','Entregue','Dogecoin','2000-07-22','2000-07-23',2,126434219,'UO-57-12'),(21,'Rua do Amongo','Entregue','Dogecoin','2000-07-22','2000-07-23',2,126434219,'UO-57-12'),(22,'Rua do Amongo','Entregue','Dogecoin','2000-07-22','2000-07-23',2,126434219,'UO-57-12'),(23,'Rua do Amongo','Entregue','Dogecoin','2000-07-22','2000-07-23',2,126434219,'UO-57-12');
/*!40000 ALTER TABLE `encomenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encomenda_has_livros`
--

DROP TABLE IF EXISTS `encomenda_has_livros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encomenda_has_livros` (
  `Encomenda_idEncomenda` int NOT NULL,
  `Livros_Nome` varchar(45) NOT NULL,
  `Quantidade` int NOT NULL,
  PRIMARY KEY (`Encomenda_idEncomenda`,`Livros_Nome`),
  KEY `fk_Encomenda_has_Livros_Livros1_idx` (`Livros_Nome`),
  KEY `fk_Encomenda_has_Livros_Encomenda1_idx` (`Encomenda_idEncomenda`),
  CONSTRAINT `fk_Encomenda_has_Livros_Encomenda1` FOREIGN KEY (`Encomenda_idEncomenda`) REFERENCES `encomenda` (`idEncomenda`),
  CONSTRAINT `fk_Encomenda_has_Livros_Livros1` FOREIGN KEY (`Livros_Nome`) REFERENCES `livros` (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encomenda_has_livros`
--

LOCK TABLES `encomenda_has_livros` WRITE;
/*!40000 ALTER TABLE `encomenda_has_livros` DISABLE KEYS */;
INSERT INTO `encomenda_has_livros` VALUES (1,'Chainsaw Man',2),(1,'Dune',1),(2,'Harry Potter - Phoenix',1),(3,'Harry Potter - Phoenix',1),(3,'Harry Potter - The Squid Master',1),(4,'Chainsaw Man',2),(4,'Neon Genesis Evangelion',2),(5,'Little Women',1),(6,'Dune',1),(7,'Suspect',1),(8,'Dune',2),(8,'The Rabbit Hole',1),(9,'Neon Genesis Evangelion',1),(10,'Little Women',25),(10,'Neon Genesis Evangelion',26),(11,'Chainsaw Man',1),(12,'Dune',1),(12,'Suspect',1),(13,'Chainsaw Man',1),(14,'Dune',1),(14,'Neon Genesis Evangelion',1),(14,'Suspect',1),(15,'Dune',1),(16,'Dune',1),(16,'Suspect',1),(17,'Chainsaw Man',1),(17,'Dune',2),(17,'Suspect',2),(18,'Dune',1),(19,'Chainsaw Man',1),(19,'Dune',1),(20,'Dune',1),(21,'Hail Marry',1),(22,'Chainsaw Man',1),(22,'Dune',1),(23,'Dune',1);
/*!40000 ALTER TABLE `encomenda_has_livros` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `takeStock` AFTER INSERT ON `encomenda_has_livros` FOR EACH ROW BEGIN
	UPDATE livros
		SET livros.Quantidade = livros.Quantidade - NEW.Quantidade
        WHERE livros.Nome = NEW.Livros_Nome;
        
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `idFornecedor` int NOT NULL,
  `Nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idFornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'Bertrand'),(2,'Cartucho'),(3,'Zowie'),(4,'Fornecedor Teste');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecimento_has_livros`
--

DROP TABLE IF EXISTS `fornecimento_has_livros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecimento_has_livros` (
  `id` int NOT NULL,
  `Livros_Nome` varchar(45) NOT NULL,
  `Fornecedor_idFornecedor` int NOT NULL,
  `Quantidade` int NOT NULL,
  `Data` date NOT NULL,
  PRIMARY KEY (`id`,`Livros_Nome`),
  KEY `fk_Livros_has_Fornecedor_Fornecedor1_idx` (`Fornecedor_idFornecedor`),
  KEY `fk_Livros_has_Fornecedor_Livros1_idx` (`Livros_Nome`),
  CONSTRAINT `fk_Livros_has_Fornecedor_Fornecedor1` FOREIGN KEY (`Fornecedor_idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`),
  CONSTRAINT `fk_Livros_has_Fornecedor_Livros1` FOREIGN KEY (`Livros_Nome`) REFERENCES `livros` (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecimento_has_livros`
--

LOCK TABLES `fornecimento_has_livros` WRITE;
/*!40000 ALTER TABLE `fornecimento_has_livros` DISABLE KEYS */;
INSERT INTO `fornecimento_has_livros` VALUES (1,'Chainsaw Man',1,5,'2022-07-10'),(2,'Neon Genesis Evangelion',1,10,'2022-07-15'),(3,'Suspect',2,5,'2022-07-23'),(4,'Dune',3,14,'2022-08-10'),(5,'Neon Genesis Evangelion',2,2,'2022-07-10'),(6,'Dune',1,1,'2022-07-10'),(7,'Neon Genesis Evangelion',1,1,'2022-07-10'),(8,'Chainsaw Man',1,2,'2023-01-10'),(8,'Dune',1,2,'2023-01-10'),(9,'Chainsaw Man',1,2,'2023-01-10'),(9,'Dune',1,2,'2023-01-10'),(10,'Chainsaw Man',1,2,'2023-01-10'),(10,'Dune',1,2,'2023-01-10'),(10,'Suspect',1,10,'2023-01-10'),(11,'Chainsaw Man',1,1,'2023-01-10'),(12,'Chainsaw Man',1,1,'2023-01-10');
/*!40000 ALTER TABLE `fornecimento_has_livros` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `addStock` AFTER INSERT ON `fornecimento_has_livros` FOR EACH ROW BEGIN
	
	UPDATE livros
		SET livros.Quantidade = livros.Quantidade + NEW.Quantidade
		WHERE livros.Nome = NEW.Livros_Nome;
	
	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `funcionário`
--

DROP TABLE IF EXISTS `funcionário`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionário` (
  `idFuncionário` int NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Contacto` int NOT NULL,
  PRIMARY KEY (`idFuncionário`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionário`
--

LOCK TABLES `funcionário` WRITE;
/*!40000 ALTER TABLE `funcionário` DISABLE KEYS */;
INSERT INTO `funcionário` VALUES (1,'Filipe Azevedo',910666578),(2,'João Vítor',914528777),(3,'Diogo Fernandes',965874587),(4,'David Gonçalves',932588965);
/*!40000 ALTER TABLE `funcionário` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livros`
--

DROP TABLE IF EXISTS `livros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livros` (
  `Nome` varchar(45) NOT NULL,
  `Tema` varchar(45) NOT NULL,
  `Autor` varchar(45) NOT NULL,
  `PreçoL` float NOT NULL,
  `Quantidade` int NOT NULL,
  PRIMARY KEY (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livros`
--

LOCK TABLES `livros` WRITE;
/*!40000 ALTER TABLE `livros` DISABLE KEYS */;
INSERT INTO `livros` VALUES ('Chainsaw Man','Ação/Drama','Tatsuki Fujimoto',9.99,24),('Dune','Ficção Científica','Frank Herbert',13.99,44),('Hail Marry','Ficção Científica','John Qqr coisa',20,0),('Harry Potter - Phoenix','Drama/Fantasia','J. K. Rowling',15.99,200),('Harry Potter - The Squid Master','Comédia/Fantasia','J. K. Rowling',9.99,10),('Little Women','Ficção Doméstica','Louisa May Alcott',15.99,35),('Neon Genesis Evangelion','Drama Psicológico/Apocalíptico','Akio Satsukawa',20,105),('Suspect','Drama/Mistério','João Vermelho',12.42,26),('The Rabbit Hole','Fantasia','John Lennon Jr.',11.45,32);
/*!40000 ALTER TABLE `livros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veículo`
--

DROP TABLE IF EXISTS `veículo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veículo` (
  `Matrícula` char(8) NOT NULL,
  `Marca` varchar(20) NOT NULL,
  `Modelo` varchar(20) NOT NULL,
  PRIMARY KEY (`Matrícula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veículo`
--

LOCK TABLES `veículo` WRITE;
/*!40000 ALTER TABLE `veículo` DISABLE KEYS */;
INSERT INTO `veículo` VALUES ('24-UA-26','Ford','Transit'),('25-KL-69','Bugatti','Chiron'),('AB-12-12','marca','modelo'),('UO-57-12','Peugot','Van');
/*!40000 ALTER TABLE `veículo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_encomenda`
--

DROP TABLE IF EXISTS `vw_encomenda`;
/*!50001 DROP VIEW IF EXISTS `vw_encomenda`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_encomenda` AS SELECT 
 1 AS `idEncomenda`,
 1 AS `funcionário`,
 1 AS `Modelo`,
 1 AS `cliente`,
 1 AS `livro`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_mediapreço`
--

DROP TABLE IF EXISTS `vw_mediapreço`;
/*!50001 DROP VIEW IF EXISTS `vw_mediapreço`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_mediapreço` AS SELECT 
 1 AS `MediaPreço`,
 1 AS `MediaQuantidade`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_preço`
--

DROP TABLE IF EXISTS `vw_preço`;
/*!50001 DROP VIEW IF EXISTS `vw_preço`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_preço` AS SELECT 
 1 AS `id`,
 1 AS `Preço`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'livraria'
--

--
-- Dumping routines for database 'livraria'
--
/*!50003 DROP PROCEDURE IF EXISTS `dataFornecidos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dataFornecidos`(IN `Data` DATE)
BEGIN
	SELECT fornecimento_has_livros.Livros_Nome, fornecimento_has_livros.`Data` FROM fornecimento_has_livros
    WHERE `Data`= fornecimento_has_livros.`Data`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `encomendasDeCLiente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `encomendasDeCLiente`(IN NIF INT)
BEGIN
	SELECT * FROM encomenda
    WHERE encomenda.Cliente_NIF=NIF
    ORDER BY 1 DESC;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `encomendasEntreguesPorFuncionario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `encomendasEntreguesPorFuncionario`(IN idFuncionario INT, IN dataInicial DATE, IN dataFinal DATE)
BEGIN
	SELECT * FROM encomenda
    WHERE encomenda.Funcionário_idFuncionário=idFuncionario
    AND encomenda.Estado='Entregue'
    AND dataInicial <= encomenda.`Data de Entrega`
    AND dataFinal >= encomenda.`Data de Entrega`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `entregasDosFuncionarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `entregasDosFuncionarios`(IN dia DATE)
BEGIN
	SELECT encomenda.Funcionário_idFuncionário, count(*) AS NrEntregas FROM encomenda
    WHERE encomenda.`Data de Entrega` = dia
    GROUP BY encomenda.Funcionário_idFuncionário
    ORDER BY 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `infLivro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `infLivro`(IN `Nome do livro` VARCHAR(45))
BEGIN
	SELECT * from livros
    WHERE livros.Nome = `Nome do livro`;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insereCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insereCliente`(IN NIF INT, IN Contacto INT, IN Nome VARCHAR(45), IN `Código de Postal` CHAR(8), IN Localidade VARCHAR(30), IN Rua VARCHAR(90))
BEGIN
		INSERT INTO cliente (NIF, Contacto, Nome, `Código de Postal`, Localidade, Rua)
	VALUE (NIF, Contacto, Nome, `Código de Postal`, Localidade, Rua);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insereEncomenda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insereEncomenda`(IN idEncomenda INT,
 IN `Local de Entrega` VARCHAR(100), IN Estado VARCHAR(15),
 IN `Tipo de Pagamento` VARCHAR(40), IN `Data de Encomenda` DATE,
 IN `Data de Entrega` DATE, IN Funcionário_idFuncionário INT, IN Cliente_NIF INT, IN Veículo_Matrícula CHAR(8))
BEGIN 
		INSERT INTO encomenda (idEncomenda, `Local de Entrega`, Estado, `Tipo de Pagamento`, `Data de Encomenda`, `Data de Entrega`, Funcionário_idFuncionário, Cliente_NIF, Veículo_Matrícula)
	VALUE (idEncomenda, `Local de Entrega`, Estado, `Tipo de Pagamento`, `Data de Encomenda`, `Data de Entrega`, Funcionário_idFuncionário, Cliente_NIF, Veículo_Matrícula);  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insereEncomendaFinal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insereEncomendaFinal`(IN idEncomenda INT,
 IN `Local de Entrega` VARCHAR(100), IN Estado VARCHAR(15),
 IN `Tipo de Pagamento` VARCHAR(40), IN `Data de Encomenda` DATE,
 IN `Data de Entrega` DATE, IN Funcionário_idFuncionário INT, IN Cliente_NIF INT, IN Veículo_Matrícula CHAR(8),
 IN Livro1 VARCHAR(40), IN Qnt1 INT, IN Livro2 VARCHAR(40), IN Qnt2 INT, IN Livro3 VARCHAR(40), IN Qnt3 INT)
BEGIN
 
	DECLARE var1 INT DEFAULT 0;
	DECLARE var2 INT DEFAULT 0;
    DECLARE var3 INT DEFAULT 0;
    
    DECLARE ErroTransacao BOOL DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET ErroTransacao = 1;
    
	START TRANSACTION;
			
            SELECT livros.Quantidade from livros
            WHERE livros.Nome = Livro1 Into var1;
            
            SELECT livros.Quantidade from livros
            WHERE livros.Nome = Livro2 Into var2;
            
            SELECT livros.Quantidade from livros
            WHERE livros.Nome = Livro3 Into var3;
            
	
            
            IF (Livro1 != '0' AND Qnt1 != 0 AND Livro2 = '0' AND Qnt2 = 0 AND Livro3 = '0' AND Qnt3 = 0 AND var1 >= Qnt1)
				THEN 	INSERT INTO encomenda(idEncomenda, `Local de Entrega`, Estado, `Tipo de Pagamento`, `Data de Encomenda`, `Data de Entrega`, Funcionário_idFuncionário, Cliente_NIF, Veículo_Matrícula)
						VALUE (idEncomenda, `Local de Entrega`, Estado, `Tipo de Pagamento`, `Data de Encomenda`, `Data de Entrega`, Funcionário_idFuncionário, Cliente_NIF, Veículo_Matrícula);
			
						INSERT INTO encomenda_has_livros (Encomenda_idEncomenda, Livros_Nome, Quantidade)
						VALUE (idEncomenda, Livro1, Qnt1);
                        
			ELSE IF (Livro1 != '0' AND Qnt1 != 0 AND Livro2 != '0' AND Qnt2 != 0 AND Livro3 = '0' AND Qnt3 = 0 AND var1 >= Qnt1 AND var2 >= Qnt2)
						THEN 	INSERT INTO encomenda(idEncomenda, `Local de Entrega`, Estado, `Tipo de Pagamento`, `Data de Encomenda`, `Data de Entrega`, Funcionário_idFuncionário, Cliente_NIF, Veículo_Matrícula)
								VALUE (idEncomenda, `Local de Entrega`, Estado, `Tipo de Pagamento`, `Data de Encomenda`, `Data de Entrega`, Funcionário_idFuncionário, Cliente_NIF, Veículo_Matrícula);
			
                        
								INSERT INTO encomenda_has_livros (Encomenda_idEncomenda, Livros_Nome, Quantidade)
								VALUE (idEncomenda, Livro1, Qnt1);
                                
								INSERT INTO encomenda_has_livros (Encomenda_idEncomenda, Livros_Nome, Quantidade)
								VALUE (idEncomenda, Livro2, Qnt2);
				ELSE IF (Livro1 != '0' AND Qnt1 != 0 AND Livro2 != '0' AND Qnt2 != 0 AND Livro3 != '0' AND Qnt3 != 0 AND var1 >= Qnt1 AND var2 >= Qnt2 AND var3 >= Qnt3)
						
						THEN 	INSERT INTO encomenda(idEncomenda, `Local de Entrega`, Estado, `Tipo de Pagamento`, `Data de Encomenda`, `Data de Entrega`, Funcionário_idFuncionário, Cliente_NIF, Veículo_Matrícula)
								VALUE (idEncomenda, `Local de Entrega`, Estado, `Tipo de Pagamento`, `Data de Encomenda`, `Data de Entrega`, Funcionário_idFuncionário, Cliente_NIF, Veículo_Matrícula);
			
                        
								INSERT INTO encomenda_has_livros (Encomenda_idEncomenda, Livros_Nome, Quantidade)
								VALUE (idEncomenda, Livro1, Qnt1);
								INSERT INTO encomenda_has_livros (Encomenda_idEncomenda, Livros_Nome, Quantidade)
								VALUE (idEncomenda, Livro2, Qnt2);
								INSERT INTO encomenda_has_livros (Encomenda_idEncomenda, Livros_Nome, Quantidade)
								VALUE (idEncomenda, Livro3, Qnt3);
                    END IF;            
				END IF;
            END IF;
            IF ErroTransacao THEN
				ROLLBACK;
			ELSE 
				COMMIT;
			END IF;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insereEncomenda_has_livros` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insereEncomenda_has_livros`(IN Encomenda_idEncomenda INT, IN Livros_Nome VARCHAR(45), IN Quantidade INT)
BEGIN
		INSERT INTO encomenda_has_livros (Encomenda_idEncomenda, Livros_Nome, Quantidade)
	VALUE (Encomenda_idEncomenda, Livros_Nome, Quantidade);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insereFornecedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insereFornecedor`(IN idFornecedor INT, IN Nome VARCHAR(45))
BEGIN
		INSERT INTO fornecedor (idFornecedor, Nome)
	VALUE (idFornecedor, Nome);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insereFornecimentoFinal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insereFornecimentoFinal`(IN id INT, IN Livro1 VARCHAR(45),IN Livro2 VARCHAR(45), IN Livro3 VARCHAR(45),IN Qnt1 INT,IN Qnt2 INT,IN Qnt3 INT, IN Fornecedor_idFornecedor INT, IN `Data` DATE)
BEGIN
 
    
    DECLARE ErroTransacao BOOL DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET ErroTransacao = 1;
    
	START TRANSACTION;
			
           
		
            IF (Livro1 != '0' AND Livro2 = '0' AND Livro3 = '0' AND Qnt1 > 0)
				THEN 	INSERT INTO fornecimento_has_livros (id, Livros_Nome, Fornecedor_idFornecedor, Quantidade, `Data`)
						VALUE (id, Livro1, Fornecedor_idFornecedor, Qnt1, `Data`);
			
						
                        
			ELSE IF (Livro1 != '0' AND Livro2 != '0' AND Livro3 = '0' AND Qnt1 >0 AND Qnt2 >0)
						THEN 	INSERT INTO fornecimento_has_livros (id, Livros_Nome, Fornecedor_idFornecedor, Quantidade, `Data`)
								VALUE (id, Livro1, Fornecedor_idFornecedor, Qnt1, `Data`);
			
                        
								INSERT INTO fornecimento_has_livros (id, Livros_Nome, Fornecedor_idFornecedor, Quantidade, `Data`)
								VALUE (id, Livro2, Fornecedor_idFornecedor, Qnt2, `Data`);
                                
								
				ELSE IF (Livro1 != '0' AND Livro2 != '0' AND Livro3 != '0' AND Qnt1 >0 AND Qnt2 >0 AND Qnt3 >0 )
						
						THEN 	INSERT INTO fornecimento_has_livros (id, Livros_Nome, Fornecedor_idFornecedor, Quantidade, `Data`)
								VALUE (id, Livro1, Fornecedor_idFornecedor, Qnt1, `Data`);
			
                        
								INSERT INTO fornecimento_has_livros (id, Livros_Nome, Fornecedor_idFornecedor, Quantidade, `Data`)
								VALUE (id, Livro2, Fornecedor_idFornecedor, Qnt2, `Data`);
                                
                                INSERT INTO fornecimento_has_livros (id, Livros_Nome, Fornecedor_idFornecedor, Quantidade, `Data`)
								VALUE (id, Livro3, Fornecedor_idFornecedor, Qnt3, `Data`);
                    END IF;            
				END IF;
            END IF;
            IF ErroTransacao THEN
				ROLLBACK;
			ELSE 
				COMMIT;
			END IF;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insereFornecimentoHasLivros` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insereFornecimentoHasLivros`(IN id INT, IN Livros_Nome VARCHAR(45), IN Fornecedor_idFornecedor INT, IN Quantidade INT, IN `Data` DATE)
BEGIN
		INSERT INTO fornecimento_has_livros (id, Livros_Nome, Fornecedor_idFornecedor, Quantidade, `Data`)
	VALUE (id, Livros_Nome, Fornecedor_idFornecedor, Quantidade, `Data`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insereFuncionário` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insereFuncionário`(IN idFuncionário INT, IN Nome VARCHAR(45), IN Contacto INT)
BEGIN
		INSERT INTO funcionário (idFuncionário, Nome, Contacto)
	VALUE (idFuncionário, Nome, Contacto);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insereLivro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insereLivro`(IN Nome VARCHAR(45), IN Tema VARCHAR(45), IN Autor VARCHAR(45), IN PreçoL FLOAT, IN Quantidade INT)
BEGIN
		INSERT INTO livros (Nome, Tema, Autor, PreçoL, Quantidade)
	VALUE (Nome, Tema, Autor, PreçoL, Quantidade);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insereVeículo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insereVeículo`(IN Matrícula CHAR(8), IN Marca VARCHAR(20), IN Modelo VARCHAR(20))
BEGIN
		INSERT INTO veículo (Matrícula, Marca, Modelo)
	VALUE (Matrícula, Marca, Modelo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `livroMaisVendido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `livroMaisVendido`()
BEGIN 
	SELECT livros.Nome, sum(encomenda_has_livros.Quantidade) as Quantidade from Livros
    INNER JOIN encomenda_has_livros ON encomenda_has_livros.Livros_Nome = Livros.Nome
    GROUP by livros.Nome
    ORDER by 2 DESC
    LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `livrosNumaEncomenda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `livrosNumaEncomenda`(IN encomenda INT)
BEGIN
	SELECT encomenda_has_livros.Encomenda_idEncomenda, encomenda_has_livros.Livros_Nome, encomenda_has_livros.Quantidade FROM encomenda_has_livros
    WHERE Encomenda = encomenda_has_livros.Encomenda_idEncomenda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `nomedolivro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `nomedolivro`(IN `Autor` VARCHAR(45))
BEGIN
	SELECT * from livros
    WHERE livros.Autor = `Autor`;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `top3clientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `top3clientes`()
BEGIN
	SELECT cliente.NIF, cliente.Nome, count(encomenda.Cliente_NIF) as 'Encomendas Feita' from cliente
    INNER join encomenda
    ON cliente.NIF = encomenda.Cliente_NIF
    GROUP BY cliente.NIF
    ORDER BY 3 DESC
    LIMIT 3;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `veiculosMaisUtilizados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `veiculosMaisUtilizados`()
BEGIN
	SELECT encomenda.Veículo_Matrícula, count(*) AS NrEntregas FROM encomenda
    GROUP BY encomenda.Veículo_Matrícula
    ORDER BY 2 DESC
    LIMIT 2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `verCarroFuncionarioNumaData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `verCarroFuncionarioNumaData`(IN id INT, IN `Data` DATE)
BEGIN
	SELECT encomenda.Funcionário_idFuncionário as idFuncionário, veículo.Marca as Marca, veículo.Modelo as Modelo, encomenda.`Data de Entrega` as `Data` from encomenda
	inner join veículo
	on encomenda.Veículo_Matrícula = veículo.Matrícula
	WHERE `Data`= encomenda.`Data de Entrega`
    AND id = encomenda.Funcionário_idFuncionário;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visualizarClientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `visualizarClientes`()
BEGIN
	SELECT * FROM cliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visualizarEncomendas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `visualizarEncomendas`()
BEGIN
	SELECT * FROM encomenda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visualizarFornecedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `visualizarFornecedor`()
BEGIN
	SELECT * FROM fornecedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visualizarFornecimentoHasLivros` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `visualizarFornecimentoHasLivros`()
BEGIN
	SELECT * FROM fornecimento_has_livros;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visualizarFuncionário` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `visualizarFuncionário`()
BEGIN
	SELECT * FROM funcionário;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visualizarLivros` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `visualizarLivros`()
BEGIN
	SELECT * FROM livros;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visualizarRelaçãoEncLivro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `visualizarRelaçãoEncLivro`()
BEGIN
	SELECT * FROM encomenda_has_livros;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visualizarVeículo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `visualizarVeículo`()
BEGIN
	SELECT * FROM veículo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_encomenda`
--

/*!50001 DROP VIEW IF EXISTS `vw_encomenda`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_encomenda` AS select `encomenda`.`idEncomenda` AS `idEncomenda`,`funcionário`.`Nome` AS `funcionário`,`veículo`.`Modelo` AS `Modelo`,`cliente`.`Nome` AS `cliente`,'-' AS `livro` from (((((`encomenda` join `funcionário` on((`encomenda`.`Funcionário_idFuncionário` = `funcionário`.`idFuncionário`))) join `veículo` on((`encomenda`.`Veículo_Matrícula` = `veículo`.`Matrícula`))) join `cliente` on((`encomenda`.`Cliente_NIF` = `cliente`.`NIF`))) join `encomenda_has_livros` on((`encomenda`.`idEncomenda` = `encomenda_has_livros`.`Encomenda_idEncomenda`))) join `livros` on((`encomenda_has_livros`.`Livros_Nome` = `livros`.`Nome`))) union select `encomenda_has_livros`.`Encomenda_idEncomenda` AS `Encomenda_idEncomenda`,'-' AS `-`,'-' AS `-`,'-' AS `-`,`livros`.`Nome` AS `livro` from (`encomenda_has_livros` join `livros` on((`encomenda_has_livros`.`Livros_Nome` = `livros`.`Nome`))) order by `idEncomenda` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_mediapreço`
--

/*!50001 DROP VIEW IF EXISTS `vw_mediapreço`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_mediapreço` AS select avg(`livros`.`PreçoL`) AS `MediaPreço`,avg(`livros`.`Quantidade`) AS `MediaQuantidade` from `livros` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_preço`
--

/*!50001 DROP VIEW IF EXISTS `vw_preço`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_preço` AS select `encomenda_has_livros`.`Encomenda_idEncomenda` AS `id`,round(sum((`encomenda_has_livros`.`Quantidade` * `livros`.`PreçoL`)),0) AS `Preço` from (`encomenda_has_livros` join `livros` on((`encomenda_has_livros`.`Livros_Nome` = `livros`.`Nome`))) group by `encomenda_has_livros`.`Encomenda_idEncomenda` order by `encomenda_has_livros`.`Encomenda_idEncomenda` */;
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

-- Dump completed on 2023-01-15 16:23:25
