-- MySQL dump 10.13  Distrib 8.4.9, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: controle_projetos
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `Apontamentos`
--

DROP TABLE IF EXISTS `Apontamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Apontamentos` (
  `id_apontamentos` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `horas_trabalhadas` decimal(5,2) DEFAULT NULL,
  `id_colaboradores` int(11) NOT NULL,
  `id_projetos` int(11) NOT NULL,
  PRIMARY KEY (`id_apontamentos`),
  KEY `fk_Apontamentos_Colaboradores1_idx` (`id_colaboradores`),
  KEY `fk_Apontamentos_Projetos1_idx` (`id_projetos`),
  CONSTRAINT `fk_Apontamentos_Colaboradores1` FOREIGN KEY (`id_colaboradores`) REFERENCES `Colaboradores` (`id_colaboradores`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Apontamentos_Projetos1` FOREIGN KEY (`id_projetos`) REFERENCES `Projetos` (`id_projetos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Apontamentos`
--

LOCK TABLES `Apontamentos` WRITE;
/*!40000 ALTER TABLE `Apontamentos` DISABLE KEYS */;
INSERT INTO `Apontamentos` VALUES (1,'2024-05-06',8.00,1,1),(2,'2024-05-07',8.00,1,1),(3,'2024-05-08',9.00,1,24),(4,'2024-05-09',8.00,1,24),(5,'2024-05-10',7.50,1,38),(6,'2024-05-13',8.00,1,38),(7,'2024-05-14',8.00,10,16),(8,'2024-05-15',9.00,10,16),(9,'2024-05-16',8.00,10,38),(10,'2024-05-17',8.00,10,38),(11,'2024-05-20',8.00,13,1),(12,'2024-05-21',7.00,13,1),(13,'2024-05-22',8.50,21,24),(14,'2024-05-23',8.00,21,24),(15,'2024-05-24',8.00,21,34),(16,'2024-05-27',9.00,24,16),(17,'2024-05-28',8.00,24,16),(18,'2024-05-29',8.00,28,16),(19,'2024-05-30',7.50,28,38),(20,'2024-05-31',8.00,28,38),(21,'2024-06-03',8.00,32,24),(22,'2024-06-04',9.00,32,24),(23,'2024-06-05',8.00,39,38),(24,'2024-06-06',8.00,39,38),(25,'2024-06-07',8.00,43,1),(26,'2024-06-10',7.50,43,1),(27,'2024-06-11',8.00,46,16),(28,'2024-06-12',8.50,46,16),(29,'2024-06-13',8.00,49,38),(30,'2024-06-14',9.00,49,38),(31,'2024-06-17',8.00,53,24),(32,'2024-06-18',8.00,53,24),(33,'2024-06-19',8.00,56,38),(34,'2024-06-20',7.50,56,38),(35,'2024-06-21',8.00,59,16),(36,'2024-06-24',8.00,59,16),(37,'2024-06-25',9.00,63,24),(38,'2024-06-26',8.00,63,24),(39,'2024-05-06',8.00,2,21),(40,'2024-05-07',8.00,2,21),(41,'2024-05-08',7.00,9,21),(42,'2024-05-09',8.00,9,35),(43,'2024-05-10',8.50,15,35),(44,'2024-05-13',8.00,29,2),(45,'2024-05-14',8.00,3,3),(46,'2024-05-15',9.00,3,8),(47,'2024-05-16',8.00,8,3),(48,'2024-05-17',8.00,8,12),(49,'2024-05-20',8.00,14,8),(50,'2024-05-21',7.50,14,19),(51,'2024-05-22',8.00,20,12),(52,'2024-05-23',8.00,25,19),(53,'2024-05-24',9.00,4,4),(54,'2024-05-27',8.00,4,14),(55,'2024-05-28',8.00,11,4),(56,'2024-05-29',7.50,11,27),(57,'2024-05-30',8.00,19,14),(58,'2024-05-31',8.00,26,4),(59,'2024-06-03',8.00,6,11),(60,'2024-06-04',8.50,16,11),(61,'2024-06-05',8.00,23,22),(62,'2024-06-06',8.00,33,30),(63,'2024-06-07',9.00,7,6),(64,'2024-06-10',8.00,7,40),(65,'2024-06-11',8.00,18,6),(66,'2024-06-12',7.50,27,18),(67,'2024-06-13',8.00,37,36),(68,'2024-06-14',8.00,47,40),(69,'2024-06-17',8.00,5,20),(70,'2024-06-18',9.00,5,38),(71,'2024-06-19',8.00,17,20),(72,'2024-06-20',8.00,35,38),(73,'2024-06-21',8.00,2,29),(74,'2024-06-24',7.50,9,29),(75,'2024-06-25',8.00,15,35),(76,'2024-06-26',8.50,3,39),(77,'2024-06-27',8.00,8,31),(78,'2024-04-08',8.00,1,1),(79,'2024-04-09',9.00,1,24),(80,'2024-04-10',8.00,10,16),(81,'2024-04-11',8.00,13,1),(82,'2024-04-12',8.50,21,24),(83,'2024-04-15',8.00,24,16),(84,'2024-04-16',7.50,28,38),(85,'2024-04-17',8.00,32,24),(86,'2024-04-18',8.00,39,38),(87,'2024-04-19',9.00,43,1),(88,'2024-04-22',8.00,46,16),(89,'2024-04-23',8.00,49,38),(90,'2024-04-24',8.00,53,24),(91,'2024-04-25',7.50,56,38),(92,'2024-04-26',8.00,59,16),(93,'2024-04-29',8.50,63,24),(94,'2024-04-30',8.00,1,38),(95,'2024-03-04',8.00,1,1),(96,'2024-03-05',9.00,10,16),(97,'2024-03-06',8.00,13,1),(98,'2024-03-07',8.00,21,24),(99,'2024-03-08',7.50,24,16),(100,'2024-03-11',8.00,28,38);
/*!40000 ALTER TABLE `Apontamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Colaboradores`
--

DROP TABLE IF EXISTS `Colaboradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Colaboradores` (
  `id_colaboradores` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `genero` char(1) NOT NULL,
  `cargo` varchar(45) NOT NULL,
  `carga_horaria` time NOT NULL,
  `id_departamentos` int(11) NOT NULL,
  PRIMARY KEY (`id_colaboradores`),
  KEY `fk_Colaboradores_Departamentos1_idx` (`id_departamentos`),
  CONSTRAINT `fk_Colaboradores_Departamentos1` FOREIGN KEY (`id_departamentos`) REFERENCES `Departamentos` (`id_departamentos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Colaboradores`
--

LOCK TABLES `Colaboradores` WRITE;
/*!40000 ALTER TABLE `Colaboradores` DISABLE KEYS */;
INSERT INTO `Colaboradores` VALUES (1,'Lucas Andrade','M','Engenheiro Civil Sênior','40:00:00',1),(2,'Marina Silva','F','Engenheira Elétrica Pleno','40:00:00',2),(3,'Gabriel Costa','M','Engenheiro de Software Sênior','44:00:00',3),(4,'Aline Pereira','F','Engenheira Aeronáutica Pleno','40:00:00',4),(5,'Rafael Souza','M','Engenheiro Civil Pleno','44:00:00',1),(6,'Beatriz Lima','F','Engenheira Mecânica Júnior','36:00:00',5),(7,'Thiago Ferreira','M','Engenheiro Químico Sênior','40:00:00',6),(8,'Camila Rocha','F','Engenheira de Software Pleno','44:00:00',3),(9,'Diego Alves','M','Engenheiro Elétrico Sênior','40:00:00',2),(10,'Fernanda Carvalho','F','Engenheira Civil Pleno','40:00:00',1),(11,'Rodrigo Martins','M','Engenheiro Aeronáutico Sênior','44:00:00',4),(12,'Juliana Nascimento','F','Analista de Projetos','40:00:00',7),(13,'Felipe Santos','M','Engenheiro Civil Júnior','40:00:00',1),(14,'Larissa Oliveira','F','Engenheira de Software Sênior','44:00:00',3),(15,'Gustavo Almeida','M','Engenheiro Elétrico Pleno','40:00:00',2),(16,'Patrícia Moura','F','Engenheira Mecânica Sênior','36:00:00',5),(17,'Vinícius Lima','M','Engenheiro Civil Sênior','44:00:00',1),(18,'Carla Ribeiro','F','Engenheiro Químico Pleno','40:00:00',6),(19,'Eduardo Borges','M','Engenheiro Aeronáutico Pleno','40:00:00',4),(20,'Amanda Freitas','F','Engenheira de Software Júnior','44:00:00',3),(21,'Leandro Nunes','M','Engenheiro Civil Sênior','40:00:00',1),(22,'Isabela Castro','F','Engenheira Elétrica Júnior','40:00:00',2),(23,'Marcelo Gomes','M','Engenheiro Mecânico Sênior','44:00:00',5),(24,'Priscila Teixeira','F','Engenheira Civil Pleno','40:00:00',1),(25,'Anderson Pinto','M','Engenheiro de Software Pleno','40:00:00',3),(26,'Renata Dias','F','Engenheira Aeronáutica Sênior','44:00:00',4),(27,'Fábio Cardoso','M','Engenheiro Químico Júnior','40:00:00',6),(28,'Tatiane Mendes','F','Engenheira Civil Júnior','36:00:00',1),(29,'Bruno Araújo','M','Engenheiro Elétrico Sênior','44:00:00',2),(30,'Daniela Campos','F','Engenheiro de Software Pleno','40:00:00',3),(31,'Caio Ramos','M','Engenheiro Mecânico Pleno','40:00:00',4),(32,'Vanessa Barbosa','F','Engenheira Civil Sênior','44:00:00',1),(33,'Henrique Farias','M','Engenheiro de Produção Pleno','40:00:00',5),(34,'Natália Cruz','F','Engenheira de Software Sênior','40:00:00',3),(35,'Alexandre Correia','M','Engenheiro Químico Pleno','44:00:00',1),(36,'Débora Lopes','F','Engenheira Elétrica Sênior','40:00:00',2),(37,'Mateus Vieira','M','Engenheiro Civil Júnior','40:00:00',6),(38,'Camile Sousa','F','Engenheira Mecânica Pleno','44:00:00',4),(39,'Cristiano Batista','M','Engenheiro de Software Júnior','40:00:00',1),(40,'Luana Monteiro','F','Engenheira Civil Sênior','36:00:00',3),(41,'Sérgio Tavares','M','Engenheiro Elétrico Pleno','44:00:00',2),(42,'Elaine Magalhães','F','Engenheira Ambiental Sênior','40:00:00',5),(43,'Patrick Moreira','M','Engenheiro Civil Pleno','40:00:00',1),(44,'Jéssica Cunha','F','Engenheira de Software Pleno','44:00:00',4),(45,'Renato Cavalcante','M','Engenheiro Mecânico Júnior','40:00:00',3),(46,'Simone Azevedo','F','Engenheira Química Sênior','40:00:00',1),(47,'Danilo Rezende','M','Engenheiro Aeronáutico Pleno','44:00:00',6),(48,'Bruna Fonseca','F','Engenheira Elétrica Júnior','40:00:00',2),(49,'Wesley Machado','M','Engenheiro Civil Sênior','40:00:00',1),(50,'Adriana Guimarães','F','Engenheira de Produção Júnior','44:00:00',3),(51,'Cauã Peixoto','M','Engenheiro de Software Sênior','40:00:00',4),(52,'Monique Barros','F','Engenheira Mecânica Sênior','36:00:00',5),(53,'Jonatas Paiva','M','Engenheiro Civil Pleno','44:00:00',1),(54,'Talita Evangelista','F','Engenheira Química Pleno','40:00:00',2),(55,'Leonardo Queiroz','M','Engenheiro Elétrico Júnior','40:00:00',3),(56,'Raquel Sampaio','F','Engenheira Ambiental Júnior','44:00:00',1),(57,'Mário Lacerda','M','Engenheiro Civil Júnior','40:00:00',6),(58,'Sabrina Nogueira','F','Engenheira de Software Pleno','40:00:00',4),(59,'Davi Studart','M','Engenheiro Mecânico Pleno','44:00:00',1),(60,'Letícia Vasconcelos','F','Engenheira Elétrica Sênior','40:00:00',3),(61,'Ítalo Medeiros','M','Engenheiro Civil Sênior','40:00:00',2),(62,'Caroline Melo','F','Engenheira Química Júnior','44:00:00',5),(63,'Otávio Coutinho','M','Engenheiro Aeronáutico Sênior','40:00:00',1),(64,'Tatiana Fontenele','F','Engenheira Civil Pleno','36:00:00',4),(65,'Samuel Alencar','M','Engenheiro de Software Sênior','44:00:00',3),(66,'Gisele Holanda','F','Engenheira Mecânica Pleno','40:00:00',1),(67,'Vinícius Uchoa','M','Engenheiro Elétrico Pleno','40:00:00',6),(68,'Mônica Brito','F','Engenheira Civil Júnior','44:00:00',2),(69,'Alex Saldanha','M','Engenheiro de Produção Sênior','40:00:00',4),(70,'Érica Pinheiro','F','Engenheira de Software Júnior','40:00:00',1),(71,'Cleber Damasceno','M','Engenheiro Civil Sênior','44:00:00',3),(72,'Núbia Falcão','F','Engenheira Química Pleno','40:00:00',5),(73,'Flávio Pimentel','M','Engenheiro Mecânico Sênior','40:00:00',1),(74,'Ingrid Sobral','F','Engenheira Elétrica Pleno','44:00:00',2),(75,'Antônio Frota','M','Engenheiro de Software Pleno','36:00:00',4),(76,'Elisa Siqueira','F','Engenheira Civil Pleno','40:00:00',1),(77,'Murilo Macedo','M','Engenheiro Aeronáutico Júnior','44:00:00',3),(78,'Renata Bastos','F','Engenheira Ambiental Sênior','40:00:00',6),(79,'Derick Gonçalves','M','Engenheiro Civil Pleno','40:00:00',1),(80,'Paloma Duarte','F','Engenheira de Software Sênior','44:00:00',2),(81,'Túlio Matos','M','Engenheiro Civil Sênior','40:00:00',4),(82,'Íris Figueiredo','F','Engenheira Elétrica Pleno','40:00:00',3),(83,'Leandro Aragão','M','Engenheiro de Software Sênior','44:00:00',1),(84,'Cecília Portela','F','Engenheira Aeronáutica Pleno','36:00:00',5),(85,'Márcio Lira','M','Engenheiro Civil Pleno','40:00:00',2),(86,'Adrielle Brandão','F','Engenheira Mecânica Júnior','44:00:00',1),(87,'Cláudio Mendes','M','Engenheiro Químico Sênior','40:00:00',3),(88,'Talyne Pessoa','F','Engenheira de Software Pleno','40:00:00',4),(89,'Everton Chaves','M','Engenheiro Elétrico Sênior','44:00:00',6),(90,'Glória Esteves','F','Engenheira Civil Pleno','40:00:00',1),(91,'Robson Leite','M','Engenheiro Aeronáutico Sênior','40:00:00',2),(92,'Verônica Meireles','F','Analista de Projetos','44:00:00',3),(93,'Josué Freire','M','Engenheiro Civil Júnior','40:00:00',4),(94,'Nathalia Andrade','F','Engenheira de Software Sênior','36:00:00',1),(95,'Renan Coelho','M','Engenheiro Elétrico Pleno','44:00:00',5),(96,'Sheila Cavalcanti','F','Engenheira Mecânica Sênior','40:00:00',3),(97,'Nilton Menezes','M','Engenheiro Civil Sênior','40:00:00',1),(98,'Flávia Cordeiro','F','Engenheiro Químico Pleno','44:00:00',2),(99,'Omar Bezerra','M','Engenheiro Aeronáutico Pleno','40:00:00',4),(100,'Tamiris Furtado','F','Engenheira de Software Júnior','40:00:00',1);
/*!40000 ALTER TABLE `Colaboradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Colaboradores_Projetos`
--

DROP TABLE IF EXISTS `Colaboradores_Projetos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Colaboradores_Projetos` (
  `id_colaboradores` int(11) NOT NULL,
  `id_projetos` int(11) NOT NULL,
  `data_entrada` date DEFAULT NULL,
  `data_saida` date DEFAULT NULL,
  PRIMARY KEY (`id_colaboradores`,`id_projetos`),
  KEY `fk_Colaboradores_has_Projetos_Projetos1_idx` (`id_projetos`),
  KEY `fk_Colaboradores_has_Projetos_Colaboradores1_idx` (`id_colaboradores`),
  CONSTRAINT `fk_Colaboradores_has_Projetos_Colaboradores1` FOREIGN KEY (`id_colaboradores`) REFERENCES `Colaboradores` (`id_colaboradores`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Colaboradores_has_Projetos_Projetos1` FOREIGN KEY (`id_projetos`) REFERENCES `Projetos` (`id_projetos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Colaboradores_Projetos`
--

LOCK TABLES `Colaboradores_Projetos` WRITE;
/*!40000 ALTER TABLE `Colaboradores_Projetos` DISABLE KEYS */;
INSERT INTO `Colaboradores_Projetos` VALUES (1,1,'2023-01-10','2024-01-20'),(1,5,'2021-05-01','2023-01-10'),(1,10,'2023-02-01','2024-03-20'),(1,13,'2022-04-01','2023-05-20'),(1,16,'2024-04-01',NULL),(1,20,'2022-11-01','2024-01-15'),(1,24,'2023-09-01',NULL),(1,32,'2021-09-01','2023-05-20'),(1,34,'2020-03-01','2023-07-05'),(1,38,'2024-01-01',NULL),(2,2,'2022-06-01','2023-07-15'),(2,7,'2022-01-10','2023-03-01'),(2,15,'2022-03-01','2023-04-25'),(2,21,'2023-04-01',NULL),(2,29,'2024-02-01',NULL),(2,35,'2023-05-01',NULL),(2,37,'2021-11-01','2024-02-20'),(3,3,'2024-01-15',NULL),(3,8,'2024-03-01',NULL),(3,12,'2023-11-01',NULL),(3,19,'2024-01-01',NULL),(3,25,'2022-07-01','2023-09-10'),(3,31,'2024-03-01',NULL),(3,39,'2024-04-01',NULL),(4,4,'2023-03-01',NULL),(4,9,'2022-09-01',NULL),(4,14,'2023-06-01',NULL),(4,17,'2021-01-01','2022-03-20'),(4,23,'2020-01-01','2022-02-15'),(4,27,'2023-01-01',NULL),(4,33,'2022-05-01',NULL),(5,1,'2023-01-10','2024-01-20'),(5,5,'2021-05-01','2023-01-10'),(5,10,'2023-02-01','2024-03-20'),(5,13,'2022-04-01','2023-05-20'),(5,20,'2022-11-01','2024-01-15'),(5,24,'2023-09-01',NULL),(5,32,'2021-09-01','2023-05-20'),(5,34,'2020-03-01','2023-07-05'),(5,38,'2024-01-01',NULL),(6,11,'2024-02-01',NULL),(6,22,'2024-05-01',NULL),(6,30,'2023-10-01',NULL),(7,6,'2023-07-01',NULL),(7,18,'2023-08-01',NULL),(7,26,'2021-06-01','2023-08-25'),(7,36,'2022-08-01',NULL),(7,40,'2023-02-01',NULL),(8,3,'2024-01-15',NULL),(8,8,'2024-03-01',NULL),(8,12,'2023-11-01',NULL),(8,19,'2024-01-01',NULL),(8,31,'2024-03-01',NULL),(8,39,'2024-04-01',NULL),(9,2,'2022-06-01','2023-07-15'),(9,7,'2022-01-10','2023-03-01'),(9,15,'2022-03-01','2023-04-25'),(9,21,'2023-04-01',NULL),(9,29,'2024-02-01',NULL),(9,35,'2023-05-01',NULL),(9,37,'2021-11-01','2024-02-20'),(10,1,'2023-02-01','2024-01-20'),(10,5,'2021-06-01','2023-01-10'),(10,13,'2022-05-01','2023-05-20'),(10,16,'2024-04-01',NULL),(10,38,'2024-02-01',NULL),(11,4,'2023-03-01',NULL),(11,9,'2022-09-01',NULL),(11,14,'2023-06-01',NULL),(11,17,'2021-01-01','2022-03-20'),(11,23,'2020-01-01','2022-02-15'),(11,27,'2023-01-01',NULL),(11,33,'2022-06-01',NULL),(13,1,'2023-02-01','2024-01-20'),(13,10,'2023-03-01','2024-03-20'),(13,20,'2022-12-01','2024-01-15'),(13,32,'2021-10-01','2023-05-20'),(14,3,'2024-02-01',NULL),(14,8,'2024-04-01',NULL),(14,19,'2024-02-01',NULL),(14,25,'2022-07-01','2023-09-10'),(14,31,'2024-04-01',NULL),(15,2,'2022-07-01','2023-07-15'),(15,7,'2022-02-01','2023-03-01'),(15,15,'2022-04-01','2023-04-25'),(15,35,'2023-06-01',NULL),(15,37,'2021-12-01','2024-02-20'),(16,11,'2024-02-01',NULL),(17,1,'2023-03-01','2024-01-20'),(17,13,'2022-05-01','2023-05-20'),(17,20,'2022-12-01','2024-01-15'),(17,34,'2020-04-01','2023-07-05'),(18,6,'2023-07-01',NULL),(18,26,'2021-06-01','2023-08-25'),(18,40,'2023-02-01',NULL),(19,4,'2023-04-01',NULL),(19,9,'2022-10-01',NULL),(19,14,'2023-07-01',NULL),(19,17,'2021-02-01','2022-03-20'),(19,23,'2020-02-01','2022-02-15'),(20,3,'2024-02-01',NULL),(20,12,'2023-12-01',NULL),(21,1,'2023-04-01','2024-01-20'),(21,10,'2023-03-01','2024-03-20'),(21,24,'2023-10-01',NULL),(21,34,'2020-04-01','2023-07-05'),(23,11,'2024-03-01',NULL),(23,22,'2024-05-01',NULL),(23,30,'2023-10-01',NULL),(24,5,'2021-06-01','2023-01-10'),(24,16,'2024-05-01',NULL),(24,32,'2021-10-01','2023-05-20'),(25,3,'2024-03-01',NULL),(25,19,'2024-02-01',NULL),(26,4,'2023-04-01',NULL),(26,17,'2021-02-01','2022-03-20'),(26,27,'2023-02-01',NULL),(27,6,'2023-08-01',NULL),(27,18,'2023-08-01',NULL),(27,26,'2021-07-01','2023-08-25'),(27,36,'2022-08-01',NULL),(28,16,'2024-05-01',NULL),(29,2,'2022-07-01','2023-07-15'),(29,15,'2022-04-01','2023-04-25'),(29,21,'2023-05-01',NULL),(29,37,'2021-12-01','2024-02-20'),(30,8,'2024-04-01',NULL),(31,4,'2023-06-01',NULL),(32,5,'2021-07-01','2023-01-10'),(33,11,'2024-03-01',NULL),(33,22,'2024-06-01',NULL),(33,30,'2023-11-01',NULL),(34,12,'2023-12-01',NULL),(36,7,'2022-02-01','2023-03-01'),(37,6,'2023-08-01',NULL),(37,18,'2023-09-01',NULL),(37,36,'2022-09-01',NULL),(38,9,'2022-10-01',NULL),(44,14,'2023-07-01',NULL),(47,6,'2023-09-01',NULL),(47,18,'2023-09-01',NULL),(47,40,'2023-03-01',NULL);
/*!40000 ALTER TABLE `Colaboradores_Projetos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Departamentos`
--

DROP TABLE IF EXISTS `Departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Departamentos` (
  `id_departamentos` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_departamentos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Departamentos`
--

LOCK TABLES `Departamentos` WRITE;
/*!40000 ALTER TABLE `Departamentos` DISABLE KEYS */;
INSERT INTO `Departamentos` VALUES (1,'Engenharia Civil'),(2,'Engenharia Elétrica'),(3,'Engenharia da Computação'),(4,'Engenharia Aeronáutica'),(5,'Engenharia Mecânica'),(6,'Engenharia Química'),(7,'Gestão de Projetos'),(8,'Recursos Humanos'),(9,'Financeiro'),(10,'Tecnologia da Informação');
/*!40000 ALTER TABLE `Departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lancamentos`
--

DROP TABLE IF EXISTS `Lancamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Lancamentos` (
  `id_lancamentos` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `tipo` enum('estimado','real') DEFAULT NULL,
  `id_projetos` int(11) NOT NULL,
  PRIMARY KEY (`id_lancamentos`),
  KEY `fk_Lancamentos_Projetos1_idx` (`id_projetos`),
  CONSTRAINT `fk_Lancamentos_Projetos1` FOREIGN KEY (`id_projetos`) REFERENCES `Projetos` (`id_projetos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lancamentos`
--

LOCK TABLES `Lancamentos` WRITE;
/*!40000 ALTER TABLE `Lancamentos` DISABLE KEYS */;
INSERT INTO `Lancamentos` VALUES (1,'2023-01-15',250000.00,'estimado',1),(2,'2023-04-10',280000.00,'real',1),(3,'2023-08-20',320000.00,'real',1),(4,'2023-11-05',290000.00,'real',1),(5,'2022-06-10',200000.00,'estimado',2),(6,'2022-10-15',190000.00,'real',2),(7,'2023-03-20',210000.00,'real',2),(8,'2024-02-01',100000.00,'estimado',3),(9,'2024-04-15',85000.00,'real',3),(10,'2024-06-01',90000.00,'real',3),(11,'2023-03-15',350000.00,'estimado',4),(12,'2023-07-20',310000.00,'real',4),(13,'2023-12-01',340000.00,'real',4),(14,'2021-05-10',420000.00,'estimado',5),(15,'2021-10-15',450000.00,'real',5),(16,'2022-05-20',480000.00,'real',5),(17,'2023-07-15',550000.00,'estimado',6),(18,'2023-11-20',420000.00,'real',6),(19,'2024-03-10',380000.00,'real',6),(20,'2022-01-15',140000.00,'estimado',7),(21,'2022-06-20',150000.00,'real',7),(22,'2022-11-10',145000.00,'real',7),(23,'2024-03-05',90000.00,'estimado',8),(24,'2024-05-15',75000.00,'real',8),(25,'2022-09-10',700000.00,'estimado',9),(26,'2023-02-20',580000.00,'real',9),(27,'2023-09-15',620000.00,'real',9),(28,'2023-02-10',350000.00,'estimado',10),(29,'2023-07-20',330000.00,'real',10),(30,'2023-12-05',310000.00,'real',10),(31,'2024-02-10',160000.00,'estimado',11),(32,'2024-05-15',130000.00,'real',11),(33,'2023-11-10',70000.00,'estimado',12),(34,'2024-02-20',55000.00,'real',12),(35,'2022-04-05',310000.00,'estimado',13),(36,'2022-09-15',330000.00,'real',13),(37,'2022-12-20',310000.00,'real',13),(38,'2023-06-10',480000.00,'estimado',14),(39,'2023-10-20',410000.00,'real',14),(40,'2024-02-15',380000.00,'real',14),(41,'2022-03-10',780000.00,'estimado',15),(42,'2022-08-20',750000.00,'real',15),(43,'2022-12-15',720000.00,'real',15),(44,'2024-04-05',210000.00,'estimado',16),(45,'2024-06-15',155000.00,'real',16),(46,'2021-01-10',950000.00,'estimado',17),(47,'2021-07-20',980000.00,'real',17),(48,'2021-12-15',960000.00,'real',17),(49,'2023-08-10',230000.00,'estimado',18),(50,'2023-12-20',200000.00,'real',18),(51,'2024-04-15',195000.00,'real',18),(52,'2024-01-05',380000.00,'estimado',19),(53,'2024-04-15',290000.00,'real',19),(54,'2022-11-05',560000.00,'estimado',20),(55,'2023-04-15',580000.00,'real',20),(56,'2023-09-20',560000.00,'real',20),(57,'2023-04-10',1050000.00,'estimado',21),(58,'2023-09-20',820000.00,'real',21),(59,'2024-02-15',910000.00,'real',21),(60,'2024-05-05',190000.00,'estimado',22),(61,'2024-06-20',120000.00,'real',22),(62,'2020-01-10',1650000.00,'estimado',23),(63,'2020-09-15',1620000.00,'real',23),(64,'2021-08-20',1580000.00,'real',23),(65,'2023-09-05',1350000.00,'estimado',24),(66,'2024-01-15',980000.00,'real',24),(67,'2024-06-20',1050000.00,'real',24),(68,'2022-07-05',250000.00,'estimado',25),(69,'2022-11-15',240000.00,'real',25),(70,'2023-05-20',230000.00,'real',25),(71,'2021-06-05',2000000.00,'estimado',26),(72,'2022-02-15',2100000.00,'real',26),(73,'2022-12-20',2200000.00,'real',26),(74,'2023-01-05',850000.00,'estimado',27),(75,'2023-07-15',650000.00,'real',27),(76,'2024-01-20',610000.00,'real',27),(77,'2022-02-05',2500000.00,'estimado',28),(78,'2022-10-15',2600000.00,'real',28),(79,'2023-08-20',2700000.00,'real',28),(80,'2024-02-05',125000.00,'estimado',29),(81,'2024-05-15',90000.00,'real',29),(82,'2023-10-05',420000.00,'estimado',30),(83,'2024-02-15',310000.00,'real',30),(84,'2024-03-05',60000.00,'estimado',31),(85,'2024-06-15',42000.00,'real',31),(86,'2021-09-05',950000.00,'estimado',32),(87,'2022-04-15',1000000.00,'real',32),(88,'2022-12-20',980000.00,'real',32),(89,'2022-05-05',1200000.00,'estimado',33),(90,'2023-01-15',1050000.00,'real',33),(91,'2023-10-20',980000.00,'real',33),(92,'2020-03-05',3800000.00,'estimado',34),(93,'2021-03-15',4000000.00,'real',34),(94,'2022-06-20',4200000.00,'real',34),(95,'2023-05-05',700000.00,'estimado',35),(96,'2023-10-15',530000.00,'real',35),(97,'2022-08-05',2800000.00,'estimado',36),(98,'2023-04-15',2300000.00,'real',36),(99,'2021-11-05',4600000.00,'estimado',37),(100,'2022-08-15',4500000.00,'real',37);
/*!40000 ALTER TABLE `Lancamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Projetos`
--

DROP TABLE IF EXISTS `Projetos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Projetos` (
  `id_projetos` int(11) NOT NULL,
  `nome_projeto` varchar(45) NOT NULL,
  `prazo_inicio` date NOT NULL,
  `prazo_final` date NOT NULL,
  `finalizado` date DEFAULT NULL,
  `custo_estimado` decimal(12,2) DEFAULT NULL,
  `custo_real` decimal(12,2) DEFAULT NULL,
  `area` varchar(45) NOT NULL,
  `status` varchar(12) NOT NULL,
  `id_gerentes` int(11) NOT NULL,
  PRIMARY KEY (`id_projetos`),
  KEY `fk_Projetos_gerentes1_idx` (`id_gerentes`),
  CONSTRAINT `fk_Projetos_gerentes1` FOREIGN KEY (`id_gerentes`) REFERENCES `gerentes` (`id_gerentes`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Projetos`
--

LOCK TABLES `Projetos` WRITE;
/*!40000 ALTER TABLE `Projetos` DISABLE KEYS */;
INSERT INTO `Projetos` VALUES (1,'Ponte sobre Rio das Antas','2023-01-10','2023-12-31','2024-01-15',2500000.00,2700000.00,'Engenharia Civil','Concluído',1),(2,'Subestação Norte','2022-06-01','2023-06-01','2023-07-10',1800000.00,1750000.00,'Engenharia Elétrica','Concluído',2),(3,'Sistema de Monitoramento IoT','2024-01-15','2024-12-15',NULL,900000.00,650000.00,'Engenharia da Computação','Em Andamento',3),(4,'Projeto Asa Delta Ultraleve','2023-03-01','2024-03-01',NULL,3200000.00,2900000.00,'Engenharia Aeronáutica','Em Andamento',4),(5,'Viaduto Marginal Sul','2021-05-01','2022-11-01','2022-12-20',4100000.00,4350000.00,'Engenharia Civil','Concluído',6),(6,'Planta de Refino Fase 2','2023-07-01','2024-07-01',NULL,5500000.00,3800000.00,'Engenharia Química','Em Andamento',7),(7,'Rede de Distribuição Zona Leste','2022-01-10','2023-01-10','2023-02-28',1200000.00,1280000.00,'Engenharia Elétrica','Concluído',11),(8,'Sistema ERP Industrial','2024-03-01','2025-03-01',NULL,750000.00,420000.00,'Engenharia da Computação','Em Andamento',8),(9,'Hangar de Manutenção Aeroporto','2022-09-01','2023-09-01',NULL,6800000.00,5200000.00,'Engenharia Aeronáutica','Atrasado',9),(10,'Edifício Comercial Centro','2023-02-01','2024-02-01','2024-03-10',3300000.00,3150000.00,'Engenharia Civil','Concluído',15),(11,'Automação de Linha de Montagem','2024-02-01','2025-02-01',NULL,1400000.00,980000.00,'Engenharia Mecânica','Em Andamento',5),(12,'Plataforma de Dados Ambientais','2023-11-01','2024-11-01',NULL,620000.00,390000.00,'Engenharia da Computação','Em Andamento',3),(13,'Reforço Estrutural Viaduto Norte','2022-04-01','2023-04-01','2023-05-15',2800000.00,2950000.00,'Engenharia Civil','Concluído',1),(14,'Drone de Vigilância Costeira','2023-06-01','2024-06-01',NULL,4500000.00,3100000.00,'Engenharia Aeronáutica','Em Andamento',13),(15,'Usina Solar Nordeste','2022-03-01','2023-03-01','2023-04-20',7200000.00,6900000.00,'Engenharia Elétrica','Concluído',2),(16,'Reservatório Comunitário','2024-04-01','2025-04-01',NULL,1900000.00,1100000.00,'Engenharia Civil','Em Andamento',6),(17,'Simulador de Voo Regional','2021-01-01','2022-01-01','2022-03-15',8900000.00,9200000.00,'Engenharia Aeronáutica','Concluído',4),(18,'Sistema de Tratamento de Efluentes','2023-08-01','2024-08-01',NULL,2100000.00,1600000.00,'Engenharia Química','Atrasado',14),(19,'Infraestrutura de Data Center','2024-01-01','2025-01-01',NULL,3400000.00,2200000.00,'Engenharia da Computação','Em Andamento',8),(20,'Passarela Estaiada Centro Cívico','2022-11-01','2023-11-01','2024-01-05',5100000.00,5300000.00,'Engenharia Civil','Concluído',15),(21,'Turbina Eólica Offshore','2023-04-01','2024-04-01',NULL,9500000.00,7100000.00,'Engenharia Elétrica','Atrasado',11),(22,'Compressor Industrial de Alta P.','2024-05-01','2025-05-01',NULL,1700000.00,900000.00,'Engenharia Mecânica','Em Andamento',12),(23,'Aeronave de Treinamento Militar','2020-01-01','2021-12-31','2022-02-10',15000000.00,14800000.00,'Engenharia Aeronáutica','Concluído',9),(24,'Complexo Residencial Parque Sul','2023-09-01','2025-09-01',NULL,12000000.00,7500000.00,'Engenharia Civil','Em Andamento',1),(25,'Rede de Fibra Óptica Municipal','2022-07-01','2023-07-01','2023-09-01',2200000.00,2100000.00,'Engenharia da Computação','Concluído',3),(26,'Planta Petroquímica Expansão','2021-06-01','2023-06-01','2023-08-20',18000000.00,19200000.00,'Engenharia Química','Concluído',7),(27,'Torre de Controle Aeroporto','2023-01-01','2024-06-01',NULL,7700000.00,5400000.00,'Engenharia Aeronáutica','Atrasado',13),(28,'Túnel Subterrâneo Contorno Leste','2022-02-01','2024-02-01','2024-04-30',22000000.00,23500000.00,'Engenharia Civil','Concluído',6),(29,'Sistema SCADA Subestação','2024-02-01','2025-02-01',NULL,1100000.00,650000.00,'Engenharia Elétrica','Em Andamento',2),(30,'Robô de Inspeção de Dutos','2023-10-01','2024-10-01',NULL,3800000.00,2300000.00,'Engenharia Mecânica','Em Andamento',5),(31,'Plataforma de Gestão Ambiental','2024-03-01','2025-03-01',NULL,540000.00,310000.00,'Engenharia da Computação','Em Andamento',8),(32,'Condomínio Industrial Zona Norte','2021-09-01','2023-03-01','2023-05-10',8500000.00,8800000.00,'Engenharia Civil','Concluído',15),(33,'Motor Híbrido para Aeronaves','2022-05-01','2024-05-01',NULL,11000000.00,8200000.00,'Engenharia Aeronáutica','Atrasado',4),(34,'Malha Ferroviária Metropolitana','2020-03-01','2023-03-01','2023-06-30',35000000.00,36500000.00,'Engenharia Civil','Concluído',1),(35,'Central de Cogeração Energética','2023-05-01','2024-11-01',NULL,6300000.00,4100000.00,'Engenharia Elétrica','Em Andamento',11),(36,'Ampliação Refinaria Sul','2022-08-01','2024-08-01',NULL,25000000.00,18000000.00,'Engenharia Química','Atrasado',14),(37,'Aeroporto Regional Expansão','2021-11-01','2023-11-01','2024-02-15',42000000.00,41000000.00,'Engenharia Aeronáutica','Concluído',9),(38,'Sistema Anti-Inundação Zona Portuária','2024-01-01','2025-06-01',NULL,14000000.00,8900000.00,'Engenharia Civil','Em Andamento',6),(39,'Laboratório de Inovação Digital','2024-04-01','2025-04-01',NULL,480000.00,270000.00,'Engenharia da Computação','Em Andamento',3),(40,'Planta de Biocombustível','2023-02-01','2025-02-01',NULL,9800000.00,6200000.00,'Engenharia Química','Em Andamento',7);
/*!40000 ALTER TABLE `Projetos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Projetos_Departamentos`
--

DROP TABLE IF EXISTS `Projetos_Departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Projetos_Departamentos` (
  `Projetos_id_projetos` int(11) NOT NULL,
  `Departamentos_id_departamentos` int(11) NOT NULL,
  PRIMARY KEY (`Projetos_id_projetos`,`Departamentos_id_departamentos`),
  KEY `fk_Projetos_has_Departamentos_Departamentos1_idx` (`Departamentos_id_departamentos`),
  KEY `fk_Projetos_has_Departamentos_Projetos1_idx` (`Projetos_id_projetos`),
  CONSTRAINT `fk_Projetos_has_Departamentos_Departamentos1` FOREIGN KEY (`Departamentos_id_departamentos`) REFERENCES `Departamentos` (`id_departamentos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Projetos_has_Departamentos_Projetos1` FOREIGN KEY (`Projetos_id_projetos`) REFERENCES `Projetos` (`id_projetos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Projetos_Departamentos`
--

LOCK TABLES `Projetos_Departamentos` WRITE;
/*!40000 ALTER TABLE `Projetos_Departamentos` DISABLE KEYS */;
INSERT INTO `Projetos_Departamentos` VALUES (1,1),(1,7),(1,9),(2,2),(2,7),(3,3),(3,10),(4,4),(4,7),(5,1),(5,7),(6,6),(6,9),(7,2),(7,7),(8,3),(8,10),(9,4),(9,7),(10,1),(10,9),(11,5),(11,7),(12,3),(12,10),(13,1),(13,7),(14,4),(14,7),(15,2),(15,9),(16,1),(16,7),(17,4),(17,7),(18,6),(18,9),(19,3),(19,10),(20,1),(20,7),(21,2),(21,9),(22,5),(22,7),(23,4),(23,7),(24,1),(24,7),(24,9),(25,3),(25,10),(26,6),(26,9),(27,4),(27,7),(28,1),(28,7),(28,9),(29,2),(29,10),(30,5),(30,7),(31,3),(31,10),(32,1),(32,9),(33,4),(33,7),(34,1),(34,7),(34,9),(35,2),(35,9),(36,6),(36,9),(37,4),(37,7),(38,1),(38,7),(39,3),(39,10),(40,6),(40,9);
/*!40000 ALTER TABLE `Projetos_Departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Qualificações`
--

DROP TABLE IF EXISTS `Qualificações`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Qualificações` (
  `id_qualificações` int(11) NOT NULL,
  `tipo` enum('formacao','especializacao') DEFAULT NULL,
  `descrição` varchar(45) DEFAULT NULL,
  `id_colaboradores` int(11) NOT NULL,
  PRIMARY KEY (`id_qualificações`),
  KEY `fk_Qualificações_Colaboradores1_idx` (`id_colaboradores`),
  CONSTRAINT `fk_Qualificações_Colaboradores1` FOREIGN KEY (`id_colaboradores`) REFERENCES `Colaboradores` (`id_colaboradores`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Qualificações`
--

LOCK TABLES `Qualificações` WRITE;
/*!40000 ALTER TABLE `Qualificações` DISABLE KEYS */;
INSERT INTO `Qualificações` VALUES (1,'formacao','Engenharia Civil',1),(2,'formacao','Engenharia Elétrica',2),(3,'formacao','Engenharia da Computação',3),(4,'formacao','Engenharia Aeronáutica',4),(5,'formacao','Engenharia Civil',5),(6,'formacao','Engenharia Mecânica',6),(7,'formacao','Engenharia Química',7),(8,'formacao','Engenharia da Computação',8),(9,'formacao','Engenharia Elétrica',9),(10,'formacao','Engenharia Civil',10),(11,'formacao','Engenharia Aeronáutica',11),(12,'formacao','Administração',12),(13,'formacao','Engenharia Civil',13),(14,'formacao','Engenharia da Computação',14),(15,'formacao','Engenharia Elétrica',15),(16,'formacao','Engenharia Mecânica',16),(17,'formacao','Engenharia Civil',17),(18,'formacao','Engenharia Química',18),(19,'formacao','Engenharia Aeronáutica',19),(20,'formacao','Engenharia da Computação',20),(21,'formacao','Engenharia Civil',21),(22,'formacao','Engenharia Elétrica',22),(23,'formacao','Engenharia Mecânica',23),(24,'formacao','Engenharia Civil',24),(25,'formacao','Engenharia da Computação',25),(26,'formacao','Engenharia Aeronáutica',26),(27,'formacao','Engenharia Química',27),(28,'formacao','Engenharia Civil',28),(29,'formacao','Engenharia Elétrica',29),(30,'formacao','Engenharia da Computação',30),(31,'formacao','Engenharia Aeronáutica',31),(32,'formacao','Engenharia Civil',32),(33,'formacao','Engenharia Mecânica',33),(34,'formacao','Engenharia da Computação',34),(35,'formacao','Engenharia Civil',35),(36,'formacao','Engenharia Elétrica',36),(37,'formacao','Engenharia Química',37),(38,'formacao','Engenharia Aeronáutica',38),(39,'formacao','Engenharia Civil',39),(40,'formacao','Engenharia da Computação',40),(41,'formacao','Engenharia Elétrica',41),(42,'formacao','Engenharia Mecânica',42),(43,'formacao','Engenharia Civil',43),(44,'formacao','Engenharia Aeronáutica',44),(45,'formacao','Engenharia da Computação',45),(46,'formacao','Engenharia Civil',46),(47,'formacao','Engenharia Química',47),(48,'formacao','Engenharia Elétrica',48),(49,'formacao','Engenharia Civil',49),(50,'formacao','Engenharia da Computação',50),(51,'especializacao','Gestão de Projetos',1),(52,'especializacao','BIM',5),(53,'especializacao','Gestão de Projetos',10),(54,'especializacao','Redes Elétricas',9),(55,'especializacao','Gestão de Projetos',13),(56,'especializacao','Estruturas Metálicas',17),(57,'especializacao','Gestão de Projetos',21),(58,'especializacao','Aerodinâmica',4),(59,'especializacao','Gestão de Projetos',24),(60,'especializacao','Machine Learning',3),(61,'especializacao','Gestão de Projetos',28),(62,'especializacao','Propulsão',11),(63,'especializacao','Gestão de Projetos',32),(64,'especializacao','Fundações',35),(65,'especializacao','Gestão de Projetos',39),(66,'especializacao','Automação Industrial',23),(67,'especializacao','Gestão de Projetos',43),(68,'especializacao','Sistemas Embarcados',8),(69,'especializacao','Gestão de Projetos',46),(70,'especializacao','Controle de Qualidade',7),(71,'especializacao','Gestão de Projetos',49),(72,'especializacao','Segurança do Trabalho',6),(73,'especializacao','Gestão de Projetos',53),(74,'especializacao','Hidráulica',2),(75,'especializacao','Gestão de Projetos',56),(76,'especializacao','Sistemas de Energia',15),(77,'especializacao','Gestão de Projetos',59),(78,'especializacao','Inteligência Artificial',14),(79,'especializacao','Gestão de Projetos',63),(80,'especializacao','Aviônica',19),(81,'especializacao','Cálculo Estrutural',81),(82,'especializacao','Eficiência Energética',82),(83,'especializacao','Desenvolvimento de Software',83),(84,'especializacao','Engenharia de Manutenção',84),(85,'especializacao','Infraestrutura Urbana',85),(86,'especializacao','Mecatrônica',86),(87,'especializacao','Petroquímica',87),(88,'especializacao','Arquitetura de Sistemas',88),(89,'especializacao','Instalações Industriais',89),(90,'especializacao','Saneamento',90),(91,'especializacao','Sistemas Aeroespaciais',91),(92,'especializacao','Planejamento Estratégico',92),(93,'especializacao','Materiais de Construção',93),(94,'especializacao','Ciência de Dados',94),(95,'especializacao','Energias Renováveis',95),(96,'especializacao','Robótica',96),(97,'especializacao','Barragens e Geotecnia',97),(98,'especializacao','Reatores Químicos',98),(99,'especializacao','Logística Aeronáutica',99),(100,'especializacao','DevOps',100);
/*!40000 ALTER TABLE `Qualificações` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tarefas`
--

DROP TABLE IF EXISTS `Tarefas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tarefas` (
  `id_tarefas` int(11) NOT NULL,
  `atividade` varchar(45) NOT NULL,
  `inicio` date NOT NULL,
  `fim` date NOT NULL,
  `status` varchar(12) NOT NULL,
  `finalizado` date DEFAULT NULL,
  `tempo_total` varchar(10) DEFAULT NULL,
  `id_projetos` int(11) NOT NULL,
  PRIMARY KEY (`id_tarefas`),
  KEY `fk_Tarefas_Projetos_idx` (`id_projetos`),
  CONSTRAINT `fk_Tarefas_Projetos` FOREIGN KEY (`id_projetos`) REFERENCES `Projetos` (`id_projetos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tarefas`
--

LOCK TABLES `Tarefas` WRITE;
/*!40000 ALTER TABLE `Tarefas` DISABLE KEYS */;
INSERT INTO `Tarefas` VALUES (1,'Levantamento topográfico','2023-01-10','2023-02-10','Concluído','2023-02-08','180:00:00',1),(2,'Projeto estrutural de fundações','2023-02-11','2023-04-11','Concluído','2023-04-09','320:00:00',1),(3,'Concretagem dos pilares','2023-04-12','2023-08-12','Concluído','2023-08-15','600:00:00',1),(4,'Instalação da superestrutura','2023-08-13','2023-11-13','Concluído','2023-11-20','500:00:00',1),(5,'Inspeção e testes de carga','2023-11-14','2023-12-31','Concluído','2024-01-10','120:00:00',1),(6,'Projeto de subestação','2022-06-01','2022-09-01','Concluído','2022-09-05','280:00:00',2),(7,'Aquisição de equipamentos','2022-09-02','2022-11-02','Concluído','2022-11-15','160:00:00',2),(8,'Montagem e cabeamento','2022-11-03','2023-03-03','Concluído','2023-03-20','400:00:00',2),(9,'Testes elétricos e comissionamento','2023-03-04','2023-06-01','Concluído','2023-06-30','200:00:00',2),(10,'Levantamento de requisitos IoT','2024-01-15','2024-02-15','Concluído','2024-02-14','80:00:00',3),(11,'Arquitetura do sistema','2024-02-16','2024-03-16','Concluído','2024-03-18','120:00:00',3),(12,'Desenvolvimento de firmware','2024-03-17','2024-06-17','Em Andamento',NULL,NULL,3),(13,'Integração com plataforma cloud','2024-06-18','2024-09-18','Pendente',NULL,NULL,3),(14,'Testes de campo','2024-09-19','2024-12-15','Pendente',NULL,NULL,3),(15,'Estudo de aerodinâmica','2023-03-01','2023-06-01','Concluído','2023-06-10','240:00:00',4),(16,'Projeto estrutural da aeronave','2023-06-02','2023-10-02','Concluído','2023-10-15','380:00:00',4),(17,'Fabricação do protótipo','2023-10-03','2024-02-03','Em Andamento',NULL,NULL,4),(18,'Testes de voo','2024-02-04','2024-03-01','Atrasado',NULL,NULL,4),(19,'Demolição controlada existente','2021-05-01','2021-07-01','Concluído','2021-07-05','160:00:00',5),(20,'Escavação e fundações','2021-07-02','2021-10-02','Concluído','2021-10-10','320:00:00',5),(21,'Estrutura de concreto','2021-10-03','2022-04-03','Concluído','2022-04-20','580:00:00',5),(22,'Acabamentos e sinalização','2022-04-04','2022-11-01','Concluído','2022-12-01','300:00:00',5),(23,'Estudo de viabilidade química','2023-07-01','2023-09-01','Concluído','2023-09-05','160:00:00',6),(24,'Engenharia básica','2023-09-02','2023-12-02','Concluído','2023-12-10','280:00:00',6),(25,'Engenharia detalhada','2023-12-03','2024-04-03','Em Andamento',NULL,NULL,6),(26,'Aquisição de reatores','2024-04-04','2024-07-01','Pendente',NULL,NULL,6),(27,'Projeto de rede elétrica','2022-01-10','2022-04-10','Concluído','2022-04-15','200:00:00',7),(28,'Instalação de postes e cabos','2022-04-11','2022-09-11','Concluído','2022-09-25','420:00:00',7),(29,'Energização e testes','2022-09-12','2023-01-10','Concluído','2023-02-15','180:00:00',7),(30,'Levantamento de processos','2024-03-01','2024-05-01','Concluído','2024-05-05','160:00:00',8),(31,'Desenvolvimento módulo fiscal','2024-05-02','2024-08-02','Em Andamento',NULL,NULL,8),(32,'Desenvolvimento módulo RH','2024-08-03','2024-11-03','Pendente',NULL,NULL,8),(33,'Projeto de hangar','2022-09-01','2022-12-01','Concluído','2022-12-15','240:00:00',9),(34,'Fundações do hangar','2022-12-02','2023-04-02','Concluído','2023-04-20','360:00:00',9),(35,'Estrutura metálica','2023-04-03','2023-09-03','Atrasado',NULL,NULL,9),(36,'Instalações internas','2023-09-04','2023-09-01','Atrasado',NULL,NULL,9),(37,'Projeto arquitetônico','2023-02-01','2023-04-01','Concluído','2023-04-05','160:00:00',10),(38,'Construção do edifício','2023-04-02','2023-11-02','Concluído','2023-11-20','720:00:00',10),(39,'Acabamentos e entrega','2023-11-03','2024-02-01','Concluído','2024-03-01','200:00:00',10),(40,'Estudo de viabilidade automação','2024-02-01','2024-03-15','Concluído','2024-03-14','80:00:00',11),(41,'Projeto de linha automatizada','2024-03-16','2024-06-16','Em Andamento',NULL,NULL,11),(42,'Instalação de robôs','2024-06-17','2024-10-17','Pendente',NULL,NULL,11),(43,'Arquitetura de dados','2023-11-01','2024-01-01','Concluído','2024-01-05','120:00:00',12),(44,'Coleta e integração de sensores','2024-01-02','2024-05-02','Em Andamento',NULL,NULL,12),(45,'Desenvolvimento de dashboards','2024-05-03','2024-11-01','Pendente',NULL,NULL,12),(46,'Diagnóstico estrutural','2022-04-01','2022-06-01','Concluído','2022-06-05','120:00:00',13),(47,'Projeto de reforço','2022-06-02','2022-09-02','Concluído','2022-09-10','240:00:00',13),(48,'Execução do reforço','2022-09-03','2023-02-03','Concluído','2023-02-20','400:00:00',13),(49,'Inspeção final','2023-02-04','2023-04-01','Concluído','2023-05-01','80:00:00',13),(50,'Projeto do drone','2023-06-01','2023-09-01','Concluído','2023-09-15','280:00:00',14),(51,'Fabricação do drone','2023-09-02','2024-01-02','Em Andamento',NULL,NULL,14),(52,'Sistemas de sensoriamento','2024-01-03','2024-04-03','Pendente',NULL,NULL,14),(53,'Homologação regulatória','2024-04-04','2024-06-01','Pendente',NULL,NULL,14),(54,'Projeto de usina solar','2022-03-01','2022-06-01','Concluído','2022-05-28','200:00:00',15),(55,'Aquisição de painéis','2022-06-02','2022-09-02','Concluído','2022-09-10','80:00:00',15),(56,'Instalação dos painéis','2022-09-03','2023-01-03','Concluído','2023-01-20','480:00:00',15),(57,'Conexão à rede e testes','2023-01-04','2023-03-01','Concluído','2023-04-01','120:00:00',15),(58,'Projeto hidráulico do reservatório','2024-04-01','2024-06-01','Concluído','2024-06-05','160:00:00',16),(59,'Escavação e impermeabilização','2024-06-02','2024-09-02','Em Andamento',NULL,NULL,16),(60,'Instalação de equipamentos','2024-09-03','2025-01-03','Pendente',NULL,NULL,16),(61,'Projeto de simulador','2021-01-01','2021-04-01','Concluído','2021-04-10','320:00:00',17),(62,'Desenvolvimento do software','2021-04-02','2021-10-02','Concluído','2021-10-20','580:00:00',17),(63,'Integração de hardware','2021-10-03','2022-01-01','Concluído','2022-01-15','280:00:00',17),(64,'Testes e certificação','2022-01-02','2022-01-01','Concluído','2022-03-01','160:00:00',17),(65,'Diagnóstico do sistema efluentes','2023-08-01','2023-10-01','Concluído','2023-10-05','120:00:00',18),(66,'Projeto de tratamento','2023-10-02','2024-01-02','Concluído','2024-01-15','200:00:00',18),(67,'Construção das lagoas','2024-01-03','2024-08-01','Atrasado',NULL,NULL,18),(68,'Infraestrutura de rede DC','2024-01-01','2024-04-01','Concluído','2024-04-05','200:00:00',19),(69,'Instalação de servidores','2024-04-02','2024-07-02','Em Andamento',NULL,NULL,19),(70,'Testes de carga e segurança','2024-07-03','2025-01-01','Pendente',NULL,NULL,19),(71,'Projeto da passarela estaiada','2022-11-01','2023-02-01','Concluído','2023-02-10','280:00:00',20),(72,'Fundações e ancoragem','2023-02-02','2023-06-02','Concluído','2023-06-20','400:00:00',20),(73,'Montagem da estrutura','2023-06-03','2023-10-03','Concluído','2023-10-20','360:00:00',20),(74,'Acabamentos e iluminação','2023-10-04','2023-11-01','Concluído','2024-01-01','120:00:00',20),(75,'Estudos de viabilidade eólica','2023-04-01','2023-07-01','Concluído','2023-07-10','200:00:00',21),(76,'Projeto da turbina','2023-07-02','2023-12-02','Concluído','2023-12-15','380:00:00',21),(77,'Fabricação e transporte','2023-12-03','2024-04-01','Atrasado',NULL,NULL,21),(78,'Instalação offshore','2024-04-02','2024-04-01','Atrasado',NULL,NULL,21),(79,'Projeto do compressor','2024-05-01','2024-07-01','Em Andamento',NULL,NULL,22),(80,'Fabricação de componentes','2024-07-02','2024-10-02','Pendente',NULL,NULL,22),(81,'Projeto aeronave militar','2020-01-01','2020-08-01','Concluído','2020-08-20','640:00:00',23),(82,'Fabricação do protótipo','2020-08-02','2021-06-02','Concluído','2021-06-30','840:00:00',23),(83,'Testes de voo militares','2021-06-03','2021-12-31','Concluído','2022-01-20','400:00:00',23),(84,'Projeto urbanístico residencial','2023-09-01','2024-01-01','Em Andamento',NULL,NULL,24),(85,'Infraestrutura e terraplanagem','2024-01-02','2024-08-02','Em Andamento',NULL,NULL,24),(86,'Projeto de fibra óptica','2022-07-01','2022-09-01','Concluído','2022-09-10','160:00:00',25),(87,'Lançamento de cabos','2022-09-02','2023-03-02','Concluído','2023-03-20','480:00:00',25),(88,'Ativação e testes de banda','2023-03-03','2023-07-01','Concluído','2023-08-15','160:00:00',25),(89,'Projeto petroquímico expansão','2021-06-01','2022-01-01','Concluído','2022-01-20','640:00:00',26),(90,'Construção de unidades','2022-01-02','2023-01-02','Concluído','2023-01-25','960:00:00',26),(91,'Comissionamento','2023-01-03','2023-06-01','Concluído','2023-08-01','320:00:00',26),(92,'Projeto da torre de controle','2023-01-01','2023-06-01','Concluído','2023-06-20','280:00:00',27),(93,'Construção da estrutura','2023-06-02','2024-01-02','Atrasado',NULL,NULL,27),(94,'Sistemas de navegação aérea','2024-01-03','2024-06-01','Atrasado',NULL,NULL,27),(95,'Escavação do túnel','2022-02-01','2023-02-01','Concluído','2023-02-20','960:00:00',28),(96,'Revestimento e drenagem','2023-02-02','2023-10-02','Concluído','2023-10-25','640:00:00',28),(97,'Sistemas elétricos e segurança','2023-10-03','2024-02-01','Concluído','2024-04-20','280:00:00',28),(98,'Projeto SCADA','2024-02-01','2024-05-01','Concluído','2024-05-10','160:00:00',29),(99,'Instalação de sensores','2024-05-02','2024-09-02','Em Andamento',NULL,NULL,29),(100,'Testes do sistema SCADA','2024-09-03','2025-02-01','Pendente',NULL,NULL,29);
/*!40000 ALTER TABLE `Tarefas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gerentes`
--

DROP TABLE IF EXISTS `gerentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gerentes` (
  `id_gerentes` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `genero` char(1) DEFAULT NULL,
  `id_departamentos` int(11) NOT NULL,
  PRIMARY KEY (`id_gerentes`),
  KEY `fk_gerentes_Departamentos1_idx` (`id_departamentos`),
  CONSTRAINT `fk_gerentes_Departamentos1` FOREIGN KEY (`id_departamentos`) REFERENCES `Departamentos` (`id_departamentos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gerentes`
--

LOCK TABLES `gerentes` WRITE;
/*!40000 ALTER TABLE `gerentes` DISABLE KEYS */;
INSERT INTO `gerentes` VALUES (1,'Ricardo Souza','M',1),(2,'Fernanda Lima','F',2),(3,'Carlos Mendes','M',3),(4,'Patrícia Oliveira','F',4),(5,'Marcos Ferreira','M',5),(6,'Juliana Costa','F',1),(7,'André Almeida','M',6),(8,'Camila Rocha','F',3),(9,'Roberto Nunes','M',4),(10,'Tatiana Borges','F',7),(11,'Felipe Cardoso','M',2),(12,'Larissa Martins','F',5),(13,'Eduardo Pinto','M',4),(14,'Vanessa Gomes','F',6),(15,'Henrique Barbosa','M',1);
/*!40000 ALTER TABLE `gerentes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-07 18:31:50
