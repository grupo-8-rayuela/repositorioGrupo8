DATABASE  IF NOT EXISTS `rayuela` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `rayuela`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: rayuela
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.24-MariaDB

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
-- Table structure for table `ages`
--

DROP TABLE IF EXISTS `ages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recommended_age` varchar(200) NOT NULL,
  `age_img` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ages`
--

LOCK TABLES `ages` WRITE;
/*!40000 ALTER TABLE `ages` DISABLE KEYS */;
INSERT INTO `ages` VALUES (1,'De 6 meses a 1 año','categoria-6meses.png'),(2,'De 1 año a 3 años','categoria-1año.png'),(3,'De 3 a 6 años','categoria-3años.png'),(4,'Mas de 6 años','categoria-6años.png');
/*!40000 ALTER TABLE `ages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(200) NOT NULL,
  `category_descri` varchar(200) NOT NULL,
  `category_img` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Sensoriales','Juguetes que ayudan a que los niños desarrollen sus sentidos, mediante la estimulación de cada uno de ellos, durante sus primeros años de vida.','categoria-sensorial.png'),(2,'Musicales','Los juguetes musicales estimulan la creatividad, expresividad y cognición, de niños en edad de desarrollo.','categoria-instrumentos.png'),(3,'Ingenio','Juegos de mesa que ayudarán a desarrollar la memoria visual y la motricidad fina en niños pequeños.','categoria-rompecabezas.png'),(4,'Movimientos','Los juegos de movimiento favorecen el ejercicio entre los y las pequeñas porque necesitan, para lograr un sano desarrollo, potenciar su motricidad.','categoria-movimientos.png');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_order_id` int(11) NOT NULL,
  `fk_product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `fk_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id_idx` (`fk_order_id`),
  KEY `product_id_idx` (`fk_product_id`),
  KEY `fk_user_id_idx` (`fk_user_id`),
  CONSTRAINT `fk_order_id` FOREIGN KEY (`fk_order_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_id` FOREIGN KEY (`fk_product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (2,1,28,1,55),(3,1,29,1,55),(4,1,30,1,55),(5,2,36,1,50),(6,2,39,1,50),(7,2,32,1,50),(8,3,33,1,43),(9,3,79,1,43),(10,3,75,1,43),(11,3,65,1,43),(12,4,67,1,24),(13,5,68,1,21),(14,5,64,1,21),(15,6,63,1,8),(16,6,62,1,8),(17,6,61,1,8),(18,6,60,1,8),(19,6,57,1,8),(20,7,31,1,23),(21,8,35,1,11),(22,8,34,1,11),(23,8,46,1,11),(31,12,40,1,17),(32,12,72,1,17),(33,13,44,1,18),(34,13,56,1,18),(35,13,51,1,18),(36,14,77,1,1),(37,15,30,1,48),(38,15,36,1,48),(39,15,44,1,48),(40,16,49,1,54),(42,16,50,1,54),(43,16,66,1,54),(44,17,79,1,53),(45,17,78,1,53),(46,17,77,1,53),(47,17,76,1,53),(48,18,30,1,45),(49,18,53,1,45),(50,19,54,1,42),(51,20,55,1,41),(52,21,55,1,38),(53,21,39,1,38),(54,21,36,1,38),(55,21,38,1,38),(56,22,35,1,39),(57,22,33,1,39),(58,23,47,1,37),(59,23,41,1,37),(61,25,37,1,55),(62,25,47,1,55);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `order_total_amt` decimal(9,2) NOT NULL,
  `order_date` date NOT NULL,
  `order_status` varchar(45) NOT NULL,
  `order_address` varchar(100) NOT NULL,
  `pay_method_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  KEY `pay_method_id_idx` (`pay_method_id`),
  CONSTRAINT `pay_method_id` FOREIGN KEY (`pay_method_id`) REFERENCES `payment_method` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,55,22997.00,'2022-09-02','Enviado','Montevideo 879',7),(2,50,35747.00,'2022-09-02','Enviado','Florida 457',1),(3,43,21696.00,'2022-09-02','Enviado','Sarmiento 697',5),(4,24,4299.00,'2022-09-02','Enviado','Honduras 547',4),(5,21,3848.00,'2022-09-02','Enviado','Costa Rica 1498',2),(6,8,20295.00,'2022-09-02','Enviado','Junin 457',3),(7,23,32999.00,'2022-09-02','Enviado','Coronel Diaz 2532',5),(8,11,22397.00,'2022-09-02','Enviado','Jujuy 235',6),(12,17,8498.00,'2022-09-02','Enviado','Guatemala 234',1),(13,18,11087.00,'2022-09-02','Enviado','Francia 334',3),(14,1,1699.00,'2022-09-02','Enviado','Larrea 342',2),(15,48,26097.00,'2022-09-02','Enviado','Angel Pelliza 541',7),(16,54,27997.00,'2022-09-01','Enviado','Riobamba 743',6),(17,53,12796.00,'2022-09-11','Enviado','Urdapilleta 883',5),(18,45,13098.00,'2022-07-16','Enviado','Scalabrini Ortiz 4698',2),(19,42,12499.00,'2022-06-23','Enviado','Humboldt 2489',1),(20,41,8499.00,'2022-06-17','Enviado','Avellaneda 358',3),(21,38,68496.00,'2022-05-05','Enviado','Alsina 654',4),(22,39,19698.00,'2022-04-24','Enviado','Entre Ríos 409',5),(23,37,7448.00,'2022-03-02','Enviado','La Pampa 459',6),(25,55,9398.00,'2022-09-15','Enviado','Montevideo 879',7);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_method_type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method`
--

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
INSERT INTO `payment_method` VALUES (1,'Tarjeta de crédito VISA'),(2,'Tarjeta de crédito MASTER CARD'),(3,'Mercado Pago'),(4,'Efectivo'),(5,'Paypal'),(6,'Transferencia bancaria'),(7,'Tarjeta de Débito');
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `discount` decimal(5,2) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `age_id` int(11) NOT NULL,
  `principal_img` varchar(500) NOT NULL,
  `description` longtext NOT NULL,
  `materials` varchar(500) DEFAULT NULL,
  `height` decimal(5,2) DEFAULT NULL,
  `width` decimal(5,2) DEFAULT NULL,
  `depth` decimal(5,2) DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id_idx` (`category_id`),
  KEY `age_id_idx` (`age_id`),
  CONSTRAINT `age_id` FOREIGN KEY (`age_id`) REFERENCES `ages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (28,'Arco Iris de Madera',5499.00,0.00,1,3,'arco-iris-de-madera-1.png','Los arco iris didácticos fomentan la imaginación a través de la transformación de escenarios.','Madera',28.00,30.00,20.00,1.00,11),(29,'Banco Didáctico 4 en 1',8999.00,0.00,1,2,'banco-didactico-1.jpg','¡Banco didáctico 4 en 1 para desarrollar la motricidad y cognición de los más peques!','Madera',45.00,45.00,20.00,1.00,6),(30,'Cocodrilo de Arrastre',5899.00,0.00,4,2,'cocodrilo-de-arrastre-1.png','Cocodrilo de Arrastre Classic World','Madera',50.00,30.00,80.00,1.00,7),(31,'Cohete Multifunción',32999.00,0.00,4,4,'coehete-multifuncion-1.png','En el cohete podemos encontrar: 12 salas, tales como: dormitorio, quirófano o laboratorio.','Madera y plástico',35.00,35.00,70.00,2.00,12),(32,'Carrito de Compras',8749.00,0.00,4,2,'carrito-compras-madera-1.png','Antideslizante en las 4 ruedas para evitar patinadas, rayones y ruidos molestos.','Madera',50.00,30.00,70.00,3.00,8),(33,'Camión Mosquito con 3 Autos',8999.00,0.00,4,2,'camion-mosquito-3autos-1.png','Desarrolla la motricidad fina y la resolución de problemas, mientras fomenta el juego imaginativo.','Madera',30.00,10.00,15.00,1.00,13),(34,'Cubo de Madera 5 en 1',8499.00,0.00,1,1,'cubo-de-madera-1.png','Para estimular la creatividad y la motricidad.','Madera',27.00,27.00,18.00,2.00,9),(35,'Carro Andador 40 bloques',10699.00,0.00,4,2,'carro-andador-40-bloques-1.png','Ideal para acompañar los primeros pasos del peque.','Madera',38.00,48.00,46.00,1.00,14),(36,'Mesa Musical Infantil',18499.00,0.00,2,3,'mesa-musical.infantil-1.png',' Este divertido juego, fomenta la expresión musical, la apreciación artística, el desarrollo de las habilidades motrices y la socialización.','Madera y metal',50.00,30.00,30.00,3.00,15),(37,'Panel de Pared',4399.00,0.00,1,1,'panel-de-pared-1.png','El objetivo del juego es desarmar la imagen siguiendo los caminos y volver a armarla ¡Mucho ingenio y dedicación! ','Madera',50.00,30.00,5.00,1.00,6),(38,'Caminador Andador',32999.00,0.00,2,2,'caminador-andador-1.png','Incluye: bloques para encastrar, un rompecabezas simple, un xilófon, un reloj y engranajes.','Madera',40.00,40.00,50.00,4.00,9),(39,'Juguete Musical',8499.00,0.00,2,1,'juguete-musical-1.png','4 Juegos en 1.  Ideal para desarrollar la creatividad.','Madera y metal',20.00,20.00,14.00,1.00,5),(40,'Banco con Rulero y Martillo',6999.00,0.00,2,1,'banco-descarga-rulero-1.png','Uno de nuestros juguetes más vendidos, super divertido y didáctico ¡Les encanta tirar las pelotas por el rulero! ','Madera',28.00,20.00,20.00,1.00,16),(41,'Banco de Descarga con Tuerca',2449.00,0.00,1,2,'banco-descarga-tuerca-1.jpg','Uno de nuestros juguetes más queridos: Banco de descarga.','Madera',40.00,30.00,25.00,1.00,9),(42,'Camión con Bloques de Encastre',5499.00,0.00,1,1,'camion-bloques-encastre-1.png','Hermoso camión con bloques para encastrar. ¡Y súper didáctico!','Madera',24.00,16.00,10.00,1.00,12),(44,'Rompecabezas Dino 3D',1699.00,0.00,3,4,'rompecabezas-3d-dino-1.png','Original rompecabezas 3D! incluye los anteojos para ver las dinosaurios bien cerca ','Cartón',29.00,42.00,10.00,1.00,21),(45,'Torre Didáctica',6449.00,0.00,1,2,'torre-didactica-1.png','Juego de torres para encastrar. Los ayuda a identificar formas y colores.','Madera',20.00,10.00,10.00,1.00,7),(46,'Cubo Fauna',3199.00,0.00,1,1,'cubo-fauna-1.png','¡Hermoso Cubo Fauna Didáctico de Madera!','Madera',16.00,16.00,16.00,1.00,4),(47,'Arco Iris 10 piezas',4999.00,0.00,1,1,'arco-iris-ensartado-madera-1.png','El juego permite transformarse escenarios para interactuar con imaginación ¡Les encanta!','Madera',25.00,25.00,25.00,1.30,4),(48,'Carro Andador',11000.00,0.00,4,3,'carro-andador-1.jpg','¡Para aprender a caminar y trasladar juguetes a la vez!','Madera',45.00,54.00,25.00,2.00,9),(49,'Tren con Figuras Geométricas',3499.00,0.00,1,2,'tren-figuras-geometricas-1.png','Tren de Madera con Bloques Geométricos.','Madera',8.00,8.00,28.00,1.00,4),(50,'Pista Tren 75 piezas',22999.00,0.00,3,3,'pista-tren-madera-1.png','Los niños se divertirán llevando mercancías desde el puerto hasta la ciudad, a través de animados pueblos','Madera',97.00,55.00,40.00,3.00,3),(51,'Pista Trencity',6889.00,0.00,4,4,'pista-tren-city-1.png','¡Pista de Tren Trencity Kit Inicial!','Metal y plástico',10.00,5.00,5.00,1.00,2),(52,'Camión Didáctico Animales',8599.00,0.00,1,3,'camion-didactico-animales-1.png','¡Camión de Arrastre con Animales! Incluye dos personas y 6 animales de la selva. Desarrolla la motricidad fina y la resolución de problemas, mientras fomenta el juego imaginativo.','Madera',33.00,20.00,20.00,1.00,2),(53,'Cinturón Carpintero Herramientas',7199.00,0.00,1,1,'cinturon-carpintero-1.png','¡Cinturón de Carpintero! Herramientas de madera: Martillo, Destornillador, Regla y Tornillo.','Plástico y simil cuero',30.00,40.00,15.00,1.00,5),(54,'Set Herramientas Valija',12499.00,0.00,4,3,'set-herramientas-valija-1.png','¡Set Carpintero! Este taller portátil es ideal para aprender a identificar herramientas y adquirir cierto conocimiento de su uso. ','Plástico y simil cuero',45.00,66.00,14.00,1.00,2),(55,'Guitarra Ukelele',8499.00,0.00,2,3,'guitarra-ukelele-1.png','¡Guitarra/Ukelele de madera! ','Madera',20.00,6.00,53.00,1.00,8),(56,'Rompecabezas Fluor',2499.00,0.00,3,3,'rompecabezas-fluor-1.jpg','¡Brillá en la oscuridad!','Cartón',42.00,29.00,8.00,1.00,6),(57,'Rompecabezas Argentina',2499.00,0.00,3,3,'rompecabezas-argentina-1.jpg','Rompecabezas Multiple Mapa de Argentina. 5 CAPAS. Clima. Relieve. Productividad. Regiones. Provincias.','Madera',24.00,19.00,2.00,1.00,7),(58,'Camión Didáctico Desarmable',9499.00,0.00,1,3,'camion-didactico-desarmable-1.png','El camión es totalmente desarmable, es grande y muy colorido ¡Y tiene descarga con martillo! ','Madera',10.00,11.00,28.00,1.00,5),(59,'Pizarra Atril de Mesa',7499.00,0.00,4,3,'pizarra-atril-1.png','¡Ideal para escribir o dibujar con pinceles, témperas, acuarelas, crayones, lápices o marcadores!','Madera',17.00,30.00,40.00,3.00,6),(60,'Laberinto Magnético',5499.00,0.00,1,3,'laberinto-magnetico-1.png','Excelente Laberinto Mágnetico de Madera. Laberinto de bolitas con lápiz magnético para moverlas.','Madera',3.00,28.00,28.00,1.00,6),(61,'Pizarra Imantada para Armar',3499.00,0.00,3,4,'pizarra-imantada-armar-1.jpg','Pizarra Imantada Magnética con formas para hacer caras graciosas.','Madera y metal',7.00,21.00,25.00,2.00,5),(62,'Bloques Geométricos',6499.00,0.00,1,2,'bloques-geometricos-1.png','Bloques Geométricos. Ayuda al niño a aprender la figuras geométricas, el contraste de alturas, los colores.','Madera',4.00,25.00,25.00,1.00,7),(63,'Encastre Animales',2299.00,0.00,1,1,'encastre-animales-1.jpg','Rompecabezas de Encastre con Animnales','Madera',4.00,15.00,20.00,1.30,3),(64,'Juegos de Ingenio',2449.00,0.00,3,4,'juegos-ingenio-1.jpg','Juegos de ingenio de madera x 6 unidades','Madera',5.00,15.00,15.00,1.50,5),(65,'Rompecabezas de Ingenio con cubos',1999.00,0.00,1,1,'ingenio-cubos-1.jpg','Original Juego de Mesa Cubi Geométrico','Cartón',3.00,25.00,40.00,0.50,8),(66,'Rompecabezas 150 piezas grandes',1499.00,0.00,1,1,'rompecabezas-piezas-grandes-1.png','¡Hermosos Rompecabezas Gigantes!','Cartón',3.00,15.00,17.00,1.20,5),(67,'Pizarra Pizarrón doble',4299.00,0.00,4,4,'pizarra-pizarron-1.jpg','Ideal para chicos en edad pre-escolar.','Madera',6.00,30.00,50.00,1.70,24),(68,'Enhebrado de Animales',1399.00,0.00,1,4,'enhebrado-animales-1.png','Hermoso juego de animales para enhebrar. Didáctico y divertido.','Madera',3.00,15.00,20.00,1.00,8),(69,'Puzzle Edificios Mundo',4299.00,0.00,3,4,'puzzle-edificios-1.png','¡Puzzle Edificios del Mundo!','Cartón',4.00,50.00,70.00,0.70,5),(70,'Juego de Estrategia Toque y Gol',3299.00,0.00,3,4,'juego-estrategia-toque-gol-1.png','Original Juego de Mesa TOQUE Y GOL. Juego de mesa para conocer y disfrutar del futbol.','Cartón',4.00,40.00,60.00,0.50,9),(71,'Pizarra Doble Mesa Didáctica',22999.00,0.00,4,3,'pizarra-doble-mesa-didactica-1.png','Espetacular Pizarra + Mesa didáctica! Incluye: PIZARRON, BANCOS Y ACCESORIOS.','Madera y metal',65.00,70.00,80.00,5.00,4),(72,'Mini Sonajero Rodante',1449.00,0.00,2,1,'mini-sonajero.rodante-1.png','¿Está comenzando a gatear? Este juguete es un gran estímulo visual y auditivo. El cascabel produce un dulce sonido al rodar ¡Que les encanta! ','Madera y metal',5.00,5.00,6.00,0.30,11),(73,'Bloques Contrucción 100 piezas',5999.00,0.00,3,4,'bloques-construccion-1.png','¡Balde de Bloques!\r\n\r\n','Madera',30.00,50.00,40.00,2.60,11),(74,'Set Desayuno',6299.00,0.00,1,1,'set-desayuno-1.png','¡Bandeja de Desayuno Didáctica! Los niños pueden aprender sobre un desayuno saludable con este juego de 16 piezas.','Madera',2.00,40.00,60.00,0.60,5),(75,'Set Tostadora',6399.00,0.00,1,2,'set-tostadora-1.png','Set Tostadora. Juguete de representación.','Madera',10.00,17.00,20.00,0.60,6),(76,'Puzzle Dragones',3499.00,0.00,3,4,'puzzle-dragones-1.png','¡Puzzle Tierra de Dragones! Es ideal para esos niños que se inician en el mundo de los puzzles.','Cartón',5.00,50.00,68.00,1.50,5),(77,'Juego de Mesa Plan Escape',1699.00,0.00,3,4,'juego-mesa-escape-1.jpg','Juego de Mesa Plan Escape. Bienvenidos a la mansión! Fácil es llegar...pero el desafío es poder salir, no te queda mucho tiempo...','Cartón',4.00,20.00,20.00,0.50,3),(78,'Kit de Efectos Especiales',3299.00,0.00,3,4,'kit-efectos-especiales-1.jpg','Kit de Ciencias Especiales para descubrir los efectos visuales del Cine','Cartón',3.00,30.00,20.00,0.50,6),(79,'T.E.G. Junior',4299.00,0.00,3,4,'teg-junior-1.jpg','Juego de Mesa TEG Junion. De YETEM. ¡Una versión del clásico TEG, adaptado para los mas chicos!','Cartón',3.00,30.00,40.00,0.70,8),(80,'Rompecabezas en Cubos',2199.00,0.00,3,4,'rompecabezas-en-cubos-1.jpg','Original Libro con 6 Rompecabezas. 4 Cubos para armar escenas del cuento.','Cartón',6.00,30.00,23.00,0.40,7);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rating` int(11) NOT NULL,
  `review_title` varchar(100) NOT NULL,
  `review` longtext NOT NULL,
  `product_fk_id` int(11) NOT NULL,
  `order_detail_fk_id` int(11) NOT NULL,
  `userr_fk_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id_idx` (`product_fk_id`),
  KEY `order_detail_fk_id_idx` (`order_detail_fk_id`),
  KEY `userr_fk_id_idx` (`userr_fk_id`),
  CONSTRAINT `order_detail_fk_id` FOREIGN KEY (`order_detail_fk_id`) REFERENCES `order_detail` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `product_fk_id` FOREIGN KEY (`product_fk_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userr_fk_id` FOREIGN KEY (`userr_fk_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (2,85,'Hermoso juguete artesanal','Hermoso juguete, a mis chicos les encantó !',30,4,55),(3,90,'Muy lindo juguete','A mi hijo le encantó este juguete, es genial, hasta le puso nombre; \'Colorinche\'',30,37,48),(4,95,'Espectacular instrumento musical !','Mi sobrino quedo maravillado, será el músico de la familia !',36,5,50),(5,75,'Recuerdos de infancia','Cuando yo era chica, nos quedabamos horas con amigos jugando al T.E.G , ahora le regalo esta version de T.E.G. Junior a mi hija, y ya se prendió a jugarlo con sus amigas',79,9,43),(6,75,'Con esta pizarra, la hija de mi amiga será maestra...','Le lleve la pizarra doble para el cumpleaños a la hija de mi gran amiga de toda la vida. Enseguida se puso a jugar y a hacer cuentas con su nueva adquisición',67,12,24),(7,70,'Genial','Esta 10 puntos el banco didáctico',29,3,55),(8,84,'Divino juguete','Me encantó. Es una pieza artesanal, la verdad.',28,2,55),(9,30,'No llego a tiempo!','Me encanto el juguete pero demoró mucho en llegar! ',35,21,11),(10,80,'Muy didáctico','Hace tiempo que buscaba un juguete así. Decorativo y educativo al mismo tiempo. Estoy muy conforme como cliente. Sigan así !! ',37,61,55),(11,85,'Muy mono este juguete','Me encantó la tostadora. De madera. Una pinturita. Juguete didáctico y entretenido. ',75,10,43),(12,75,'Juegos para pensar durante un rato','Me parecieron muy copados estos juegos. Un desafío. Para chicos y grandes..',64,14,21),(13,90,'Divino !!','Una maravilla artesanal y moderna este cohete ! Mi sobrino y sus compas se la pasan inmersos, jugando durante horas !',31,20,23),(14,70,'Muy indicado para los mas peques','Un juego que que los mas chiquitos exploren el ingenio con divertidos y coloridos animalitos. Le encantó. ',46,23,11),(15,100,'Clásico y sencillo','Su primer juguete. El sonido le encanta !! Muy buena terminación del producto',72,32,17),(16,70,'Bárbaro este juguete','Estoy muy conforme tanto con el servicio como con el producto. No demoró casi nada y era lo que esperaba. ',40,31,17),(17,100,'Me pueden este tipo de puzzles','Este rompecabezas me tiene como loco !! Es todo un desafío para los 6 sentidos... brilla en la oscuridad. Todo un flassshhh !!! ',56,34,18),(18,80,'De colección','Me la paso jugando durante horas con estos puzzles. Son 3d, y viene con los anteojitos. ',44,33,18),(19,90,'De chico yo no tuve nada así','Estos juguetes son muy cancheros para los chicos que les encanta el 3D además educativos. Me siento privilegiado de poder regalarle a mi hijo el puzzle dino 3D',44,39,48),(20,50,'Mas o menos','Mmm, no estoy muy conforme. Los materiales no me convencen mucho por el precio del producto. Son lindos, pero muuuuuy caros para lo que son, la verdad',49,40,54),(21,60,'Apenas cumple','La calidad del puzzle es un poco menor a lo que esperaba. No se engancho, mucho no le gustó, no creo que vuelva a comprar...',66,43,54),(22,70,'Copado','Es bastante loco este juego, lo jugamos con amigos hasta altas horas de la noche. De ingenio.',77,46,53),(23,80,'Clásico absoluto','El T.E.G. ya lleva varias generaciones dando vuelta por ahí. Por algo será.  Todo un ícono de los 80s ',79,44,53),(24,75,'Multimedia game, atención ahí...original','Se lo regalé a mi primo. Le encanta las pelis de de los 80s. Con esto son Spielberg. ',78,45,53),(25,90,'Que delicia de juguete','Es ideal para jugar al taller, como su padre cuando construye cosas. De todos los colores, esta maravillado con su cinturón carpintero que lo lleva a todos lados',53,49,45),(26,75,'Rainbow Ccocdrile','Me encantó el cocodrilo, que me lo compré para mí cuando le regalé a mi peque para su cumple. Amo los cocodrilos. Animal favorito. Y este viene en colores. ',30,48,45),(27,65,'Me gusto mucho','Era lo esperado. Muy pedagógico, para jugar a trabajar. Un ejemplo de juguete educacional con buena terminación y muy buen diseño',54,50,42),(28,40,'Ukelele Star rompe Ukelele','El juguete es divino, divertidísimo, pero no muy resistente, no resultó muy duradero, igual suena bastante bien, para ser un juguete',55,51,41),(29,60,'Ella ama su Ukelele !!!','Ella y su ukelele se volvieron inseparables, Ella va cantando por ahí chocha de la vida. Satisfecha con el tiempo de entrega. No ningún tipo de  problemas',55,52,38),(30,95,'Caja musical para mi chiquita','Por alguna razón los juguetes musicales atraen su atención mas que otro tipo de juguetes. Mu buena calidad y terminación del producto. Tiempo de entrega optimpo',39,53,38),(31,85,'Camioncito legendario','Hubiera querido tener un juguete así de pibe. Se lo regalé y le gusto mucho realmente. No se va a aburrir rápido como con otros juguetes, se ve que lo artesanal ayuda a crear un vínculo entre el niño y el juguete. No more industrial toys...',33,57,39),(32,70,'Un flash','Colecciono este tipo de juguetes decorativos. Mezcla de adorno y rompecabezas.',47,58,37);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secondary_images`
--

DROP TABLE IF EXISTS `secondary_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `secondary_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `image_2` varchar(100) DEFAULT NULL,
  `image_3` varchar(100) DEFAULT NULL,
  `image_4` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product_idx` (`id_product`),
  CONSTRAINT `id_product` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secondary_images`
--

LOCK TABLES `secondary_images` WRITE;
/*!40000 ALTER TABLE `secondary_images` DISABLE KEYS */;
INSERT INTO `secondary_images` VALUES (10,28,'arco-iris-de-madera-4.png','arco-iris-de-madera-5.png','arco-iris-de-madera-6.png'),(11,29,'banco-didactico-3.jpg','banco-didactico-4.jpg','banco-didactico-5.jpg'),(12,30,'cocodrilo-de-arrastre-2.png','cocodrilo-de-arrastre-3.png','cocodrilo-de-arrastre-4.png'),(13,31,'coehete-multifuncion-2.png','coehete-multifuncion-3.png','coehete-multifuncion-4.png'),(14,32,'carrito-compras-madera-2.png','carrito-compras-madera-3.png','carrito-compras-madera-4.png'),(15,33,'camion-mosquito-3autos-2.png','camion-mosquito-3autos-3.png','camion-mosquito-3autos-4.png'),(16,34,'cubo-de-madera-2.png','cubo-de-madera-3.png','cubo-de-madera-4.png'),(17,35,'carro-andador-40-bloques-2.png','carro-andador-40-bloques-3.png','carro-andador-40-bloques-4.png'),(18,36,'mesa-musical.infantil-2.png','mesa-musical.infantil-3.png','mesa-musical.infantil-4.png'),(19,37,'panel-de-pared-2.png','panel-de-pared-3.png','panel-de-pared-4.png'),(20,38,'caminador-andador-2.png','caminador-andador-3.png','caminador-andador-4.png'),(21,39,'juguete-musical-2.png','juguete-musical-3.png','juguete-musical-4.png'),(22,40,'banco-descarga-rulero-2.png','banco-descarga-rulero-3.png','banco-descarga-rulero-4.png'),(23,41,'banco-descarga-tuerca-2.jpg','banco-descarga-tuerca-3.jpg','banco-descarga-tuerca-4.jpg'),(24,42,'camion-bloques-encastre-2.png','camion-bloques-encastre-3.png','camion-bloques-encastre-4.png'),(25,44,'rompecabezas-3d-dino-2.png','rompecabezas-3d-dino-3.png','rompecabezas-3d-dino-4.png'),(26,45,'torre-didactica-2.png','torre-didactica-3.png','torre-didactica-4.png'),(27,46,'cubo-fauna-2.png','cubo-fauna-3.png','cubo-fauna-4.png'),(28,47,'arco-iris-ensartado-madera-2.png','arco-iris-ensartado-madera-3.png','arco-iris-ensartado-madera-4.png'),(29,48,'carro-andador-2.jpg','carro-andador-3.jpg','carro-andador-4.jpg'),(30,49,'tren-figuras-geometricas-2.png','tren-figuras-geometricas-3.png','tren-figuras-geometricas-4.png'),(31,50,'pista-tren-madera-2.png','pista-tren-madera-3.png','pista-tren-madera-4.png'),(32,51,'pista-tren-city-2.png','pista-tren-city-3.png','pista-tren-city-4.png'),(33,52,'camion-didactico-animales-2.png','camion-didactico-animales-3.png','camion-didactico-animales-4.png'),(34,53,'cinturon-carpintero-2.png','cinturon-carpintero-3.png','cinturon-carpintero-4.png'),(35,54,'set-herramientas-valija-2.png','set-herramientas-valija-3.png','set-herramientas-valija-4.png'),(36,55,'guitarra-ukelele-2.png','guitarra-ukelele-3.png','guitarra-ukelele-4.png'),(37,56,'rompecabezas-fluor-2.jpg','rompecabezas-fluor-3.jpg','rompecabezas-fluor-4.jpg'),(38,57,'rompecabezas-argentina-2 - copia.jpg','rompecabezas-argentina-2.jpg','rompecabezas-argentina-3 - copia.jpg'),(39,58,'camion-didactico-desarmable-2.png','camion-didactico-desarmable-3.png','camion-didactico-desarmable-4.png'),(40,59,'pizarra-atril-2.png','pizarra-atril-3.png','pizarra-atril-4.png'),(41,60,'laberinto-magnetico-2.png','laberinto-magnetico-3.png','laberinto-magnetico-4.png'),(42,61,'pizarra-imantada-armar-2.jpg','pizarra-imantada-armar-3.jpg','pizarra-imantada-armar-4.jpg'),(43,62,'bloques-geometricos-2.png','bloques-geometricos-3.png','bloques-geometricos-4.png'),(44,63,'encastre-animales-2.jpg','encastre-animales-3.jpg','encastre-animales-4.jpg'),(45,64,'juegos-ingenio-2.jpg','juegos-ingenio-3.jpg','juegos-ingenio-4.jpg'),(46,65,'ingenio-cubos-2.jpg','ingenio-cubos-3.jpg','ingenio-cubos-4.jpg'),(47,66,'rompecabezas-piezas-grandes-2.png','rompecabezas-piezas-grandes-3.png','rompecabezas-piezas-grandes-4.png'),(48,67,'pizarra-pizarron-2.jpg','pizarra-pizarron-3.jpg','pizarra-pizarron-4.jpg'),(49,68,'enhebrado-animales-2.png','enhebrado-animales-3.png','enhebrado-animales-4.png'),(50,69,'puzzle-edificios-2.png','puzzle-edificios-3.png','puzzle-edificios-4.png'),(51,70,'juego-estrategia-toque-gol-2.png','juego-estrategia-toque-gol-3.png','juego-estrategia-toque-gol-4.png'),(52,71,'pizarra-doble-mesa-didactica-2.png','pizarra-doble-mesa-didactica-3.png','pizarra-doble-mesa-didactica-4.png'),(53,72,'mini-sonajero.rodante-2.png','mini-sonajero.rodante-3.png','mini-sonajero.rodante-4.png'),(54,73,'bloques-construccion-2.png','bloques-construccion-3.png','bloques-construccion-4.png'),(55,74,'set-desayuno-2.png','set-desayuno-3.png','set-desayuno-4.png'),(56,75,'set-tostadora-2.png','set-tostadora-3.png','set-tostadora-4.png'),(57,76,'puzzle-dragones-2.png','puzzle-dragones-3.png','puzzle-dragones-4.png'),(58,77,'juego-mesa-escape-2.jpg','juego-mesa-escape-3.jpg','juego-mesa-escape-4.jpg'),(59,78,'kit-efectos-especiales-2.jpg','kit-efectos-especiales-3.jpg','kit-efectos-especiales-4.jpg'),(60,79,'teg-junior-2.jpg','teg-junior-3.jpg','teg-junior-4.jpg'),(61,80,'rompecabezas-en-cubos-2.jpg','rompecabezas-en-cubos-3.jpg','rompecabezas-en-cubos-4.jpg');
/*!40000 ALTER TABLE `secondary_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type_id` int(11) NOT NULL,
  `user_first_name` varchar(45) NOT NULL,
  `user_last_name` varchar(45) NOT NULL,
  `user_mail` varchar(45) NOT NULL,
  `user_cel` varchar(45) NOT NULL,
  `user_address` varchar(200) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_img` varchar(200) NOT NULL,
  `dni` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_mail_UNIQUE` (`user_mail`),
  KEY `user_type_id_idx` (`user_type_id`),
  CONSTRAINT `user_type_id` FOREIGN KEY (`user_type_id`) REFERENCES `users_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Pedro','Alvarez','mail@gneil.com','1565654578','Larrea 342','$2a$10$xY.w/u1jOdeDuDtm52AfvOAvb23g0JTw5eFcXzX4ibXA/ScFj5wsf','img-user-1661456884777.png','20047910'),(2,1,'Juan','Sanchez','sanchmail@gneil.com','1597814578','Moreno 542','$2a$10$7Wgqgmz1JkOEBXUlkrFyGeEppNVh8Ba58oWihqGxsIgYKfsEHyF7z','img-user-1661358391294.png','20000000'),(6,1,'Roberto','Martinez','arsanchmaoil@gneil.com','1597814577','Moreno 542','$2a$10$7Wrqgmh1JkOEBXUlkrFyGeEppNVh8Ba51oWihqGxsIgYKfsEHyF9m','img-user-1659123690879.png','20000000'),(7,1,'Pepe','Wolsen','wol@gmaeil.com','54698741','Junin 457','$2l$10$bCObCv3ap8RfvJmvsvfzw.j1cVbXL94Y3d8ppTxLI0JR9YyjfYFPk','img-user-1661358368489.png','25654913'),(8,1,'Julieta','Tabernera','tabern@gmeil.com','65465478','Junin 457','$2a$10$F/hFkfBjyt5UaJcNUcT7n.LTjSihygKenQP24XWvJWOqOEv7RI/fJ','img-user-1661318922042.png','25654874'),(9,1,'Karen','Wolfenstein','wkar@gmeil.com','56458745','Guatemala 541','$2a$10$Ww.gIgiXZLSWJ.smNFNP0uRFAzHtROKDl6Rv7DjMhUSpUGHZTIyOt','img-user-1661319816948.png','26541241'),(10,1,'Rita','Ferranti','ferr@gmeil.com','65412345','Honduras 124','$2a$10$6DEhRfAZEXzr4KFJZChYMu1Lgt2cNR7mCt/Jpm3iQRz7sTXdsgSn3','img-user-1661321409657.png','21365478'),(11,1,'Brenda','Reiters','reit@gmaeil.com','65478945','Jujuy 235','$2a$10$.aCpPP040QDIhE8AQeBUDuaDPvv3PLraUO9s5s3wn7GDNpAT7AiDa','img-user-1661359546684.png','12345678'),(13,1,'Lidia','Torrontesi','torront@homeil.com','6655998877','Estados Unidos 1256','$2a$10$xY.w/u1jOdeDuDtm72AfvOAvb2Wg0JTw5eFcXzX4ibXA/ScFj5wsK','img-user-1661456585922.png','20000000'),(14,1,'Julio','Estenssoro','esten@homeil.com','6633225544','Cordoba 1654','$2a$10$G47Wm2WI9E.Aivzv6IwsVO3C7JioiTS3/wtdmstWtKAFD7plrMjEO','img-user-1661456848744.png','20364500'),(15,1,'Julieta ','Rossi','rossi@gmeil.com','6655994789','Montevideo 2697','$2a$10$2HPa39Oz5ZqHV0PoouVcoe64hOCG4KoGMDHcaFQv85TnaM4QMEXs2','img-user-1661457269433.png','20000000'),(16,1,'Manuel','Ugart','Manugart@gmeil.com','64978546','Uruguay 2111','$2a$10$IaIpNNRnA7UITaL/KekhveJkM6zewixSM1lWOOOyk43LyLLlYY8Ki','img-user-1661457452304.png','20064810'),(17,1,'Gabriela','Trillo','trillo@yuhumeil.com','6655447788','Guatemala 234','$2a$10$lFZHExy2lp4Kgb3vM1GXSeS3xIlGiSiAKjugV4avkx30CKWuQmr9m','img-user-1661457650730.png','29745000'),(18,1,'Rupert','Eisenstein','eise@gmeil.com','6699885533','Francia 334','$2a$10$fn2xRguWekNJcTvLvichPeIYA8lPV8EjmeykIJECRezUYFeyPGwAS','img-user-1661457818700.png','20098730'),(19,1,'Marcos','Salgán','marquitos@yuhumail.com','65987458','Italia 125','$2a$10$7Wgqgmz1JkOEAXUlkrFyGeEppNVh8Ba58oWuhqGxsIgYKfsEHyF8i','img-user-1661458006088.png','20645700'),(20,1,'Camila ','Presto','cami@gmeil.com','64559988','España 589','$2a$10$x0VSS.yI4nrjIfaS8uMce.ohGVhkiPiFTxtGJv2qZznxAMjYrJ8l6','img-user-1661458192968.png','29514000'),(21,1,'Raul','Rabena','rab@yuhu.com','66699444','Costa Rica 1498','$2a$10$bCObCv3ap8RfcJmvsvfzw.j1cVbXL14Y5d8ppTxLI0JR9YyjjYOUa','img-user-1661458365323.png','20000000'),(22,1,'Sebastián ','Serizolo','seriz@yuhu.com','666445','Tapiales 1467','$2a$10$H7yzDSTI1u84XrRXupwd4uTJ/rm90.M0BIKz8V7kdfSc.0ytVPBBO','img-user-1661458493772.png','20000000'),(23,1,'Tiffany','Riverdall','tiff@gmail.com','44557766','Coronel Diaz 2532','$2a$10$5mcxdAgwrW05oZLqSnqujOvHgOSEMkv0U0/ZTc9ziQnXYJ5mId5om','img-user-1661458579238.png','20951460'),(24,1,'Monique','Della Rivere','della@homeil.com','44557788','Honduras 547','$2a$10$kCN5x9s3uw7PCdgiTdF7aOq0jPxFZJgOPo1IJwU7putFOl/Ce/RNe','img-user-1661458684874.png','29516400'),(25,1,'Jessica ','Rabin','rabjes@gmeil.com','66448877','Anchorena 667','$2a$10$W7LWEmdsMNNLgMFwtZZmvOkYYb20mI9Qv0TegaNcEUmp62RsvTi/S','img-user-1661458771148.png','28457700'),(26,1,'Ana','Derby','derb@homail.com','65478965','Ñuñez 654','$2a$10$oYpaMOMPg6b17R8hMGRQ7OP.Sa9G1ZHNKxggcjEFbPQx8x5IqfbJ2','img-user-1661458871282.png','20000000'),(27,1,'Alberto','Livingston','livin@gmeil.com','6655997744','Gral Mitre 2678','$2a$10$GmfPbZo9ul6zsGrDSjwVyeoeeAAWnp8m6gB5KE4xaCRjxxa0QmRKK','img-user-1661459019024.png','27542300'),(28,1,'Helena','Almeria','helen@gmail.com','4567894','Moreno 569','$2a$10$Sc3CjF6JnWB.P6pYPkFLSOo4k1FQDGcnVUKtGIGo5hS8HOULIrSAO','img-user-1661459104240.jpg','29567800'),(29,1,'Gonzalo','Sanatea','gonza@gmail.com','45678965','Avellaneda 569','$2a$10$Fy.FT9uwpF1sHf.Dw9D/Heswr26j/UHXrtHwHmd5ZPeyApVw6RoAi','img-user-1661459646184.jpg','29651400'),(30,1,'Rodrigo','Balmacera','balma@gmall.com','456789','Azcuenaga 333','$2a$10$XzPeRStPSBO5sWaJlKNjout7LiyjEES8UOAXYQqzMOAbF/6XUKxby','img-user-1661459798853.png','29668400'),(31,1,'debora','granada','deb@gmail.com','4567898','Urquiza 225','$2a$10$ta/OyP0QQuq39V/6erR7Oe05Eozt7rrRiGB9I8gS.48Qnsu0keYxi','img-user-1661459924665.png','28895400'),(32,1,'hugo','sivori','huguito@gmail.com','654789','Junin 457','$2a$10$XxBMJ0R0aWhIb6qKTlVOQOfON29q/tOYdudl56eDmT6sxh7PhqL9y','img-user-1661460050012.png','26598740'),(33,1,'Nicolás ','Pueyrredon','nicop@gmoll.com','1198765987','Formosa 432','$2a$10$t0dKdeMkX1Q3mJJZ9hdJhOOgTY25HNuuJlqZRDNl/kw4obl5Q0MRS','img-user-1661460183613.png','25266100'),(34,1,'Andrés','Broda','bro@gmall.com','1199665588','Juan Jose Paso 5566','$2a$10$ZqcY3CFtflqGuDevi.qmjOEV2AVXLPimCtzSCBzI/h8BOSquWtO6O','img-user-1661460288345.png','29948700'),(35,1,'Monica','Quiroga','quiro@gmall.com','1199884567','Talcahuano 945','$2a$10$QsZgk.Dva9hJnK2U2ha0F.W7FfpsgjlPtyDAxxs0YKfVDZAOV2fuC','img-user-1661460711149.png','20000000'),(36,1,'Estela','Guzman','guz@gmall.com','1169857485','Nicaragua 555','$2a$10$x9Ds2rusExYSn7tmh4EwS.q87SmtbZy8mhx1Abu0UVq8zN137ONx6','img-user-1661461092223.png','29652440'),(37,1,'Federico','Echeverria','fede@lolmail.com','116699887744','La Pampa 459','$2a$10$e2B.LNvTwhqzKzcuI5pNQexJ/Mr1xamIsO1DQolyr68zo4hGA0y9C','img-user-1661461158700.png','26645270'),(38,1,'Constanza','Repetto','coni@hmail.com','1198744789','Alsina 654','$2a$10$SZEfPYTEEqHrtkyZstLYu./ndSUW16c8GBwqSfvniK7pljvz.SaOO','img-user-1661461218952.png','29685740'),(39,1,'Fabian','Quintana','quinta@gmeil.com','1197458632','Entre Ríos 409','$2a$10$6hVYCWvN2xkdwN22GRTKoeEtpbJ/zdsvOPgMCVaEfbNx7UKannmai','img-user-1661461283780.png','26655420'),(40,1,'Jorge','Tobal','jor@gmall.com','1198745698','Libertador 1254','$2a$10$h3HvHCgMA/SwrJznNiYw3ewLhNXqecMtZkGADczSbpANgszO7iSXq','img-user-1661461343877.png','25584790'),(41,1,'Hector','Burma','burma@gmall.com','1165478945','Avellaneda 358','$2a$10$r2WH5qVwKEqTsazB23iESuNtqIH0OMnky5y83gaIxt3CotpM99KDS','img-user-1661461400807.png','23652260'),(42,1,'Fernanda','Lavallol','ferlol@gmeil.com','1166997898','Humboldt 2489','$2a$10$3Nmr/pAk9WsYh/p5SbUsE.iMOEe1Mta1ZTnvocUZDM75THrzVThpu','img-user-1661461463548.png','23326570'),(43,1,'Juana','Pedernera','juani@gmall.com','1165897498','Sarmiento 697','$2a$10$hwSq4TtJOVH5Tc474QeCJuE8BMFWnhTZLVKY17Mq.hRQnz0lgheI6','img-user-1661461542668.png','21125650'),(44,1,'Rafael','Mesina','mesi@msmail.com','1199884456','Lavalle 458','$2a$10$lUksQJdd3mAvu75PuTo0hehGzRh74Igea5ZZDzbGbQFOURmIqJl86','img-user-1661461616955.png','26584560'),(45,1,'Rita','Walters','ritwal@gmall.com','1199887744','Scalabrini Ortiz 4698','$2a$10$F/hFkfBjyt5UaJcNUcT7n.LTjSuhygKenQP24XWvJWOqOEv9RI/gS','img-user-1661461884296.png','25564510'),(46,1,'Victoria','Perez','vicperez@gmal.com','1165457898','Las Heras 537','$2a$10$tsDdHI6ZfET0.GNMgpV3TOJ7zYkxXxErhB8849.Mg6FSMK1D04f3K','img-user-1661461945794.png','25598130'),(47,1,'Jon','Leningrad','lejon@mail.com','11987456368','Salta 986','$2a$10$M6igScoDDlT4N8XqJeuypuxmVEy5rKhJRMH3rkZw8DmWlteBJJwva','img-user-1661462016096.png','26532880'),(48,1,'Jesus','Frias ','jesusf@mill.com','11987457894','Cordoba 457','$2a$10$4uXxxJMmmIkEyWOiwqJaNeuKqxXrEUWZWlVlHqJuVa4jZyIAJdGH2','img-user-1661462076137.png','26532991'),(49,1,'Analia','Spina','abaespo@gmill.com','119635987465','Chile 654','$2a$10$YZaByz9.MUB6MyX1Hy861ugvevKIVYimn51mulqYGcQ1UewhNcAM6','img-user-1661462159905.png','23265970'),(50,1,'Hugo','Carranza','huguito@mailgoo.com','11987456633','Florida 457','$2a$10$RJOjdcS2JZMXhx3oKufj3OKDTap3V6BdKx.LshFbPcaXwFbBQVz9i','img-user-1661462240166.png','23265440'),(51,2,'Juan','Palomino','juani@msn.com','1158889977','Urquiza 2489','$2a$10$QUd1M1a5/SY5l45AEhSSP.4nhM1RHsUlDNF1mJ9PNN3P/OWSwCpdq','img-user-1661462347543.png','26633240'),(52,1,'Gonzalo','Arastiaga','ara@mailgoo.com','1198457632','Echeverria 368','$2a$10$QC0rxFR5/GKLeusTDNlPEuvYq3em.3V8dCWlNqi.5p5tjed/GpIhi','img-user-1661462432503.png','26533210'),(53,1,'Victor','Saralegui','raymond@mailg.com','1525489762','Maipu 237','$2a$10$Ww.gIgiXZLSWJ.smNFNP0uRFAzHtROKDl8Rv7DjMhUSpUYHZTIyOq','img-user-1661462617661.png','23698520'),(54,1,'Silvia','Salgano','mail@mailg.com','1159765422','Azcuenaga 479','$2a$10$NDw.I3ellBIFp2ywpsYDaOwYxvBbmuqkJrN4.AA/RASCsCO7P5w82','img-user-1661462696261.png','23399855'),(55,1,'Karina','Ferrari','karferrari@msmail.com','1158976543','Montevideo 879','$2a$10$6DEhRfAZEXzr4KFJZChYMu2Lgt2cNR7mCt/Jpm3iQRz9sTXdsgXn6','img-user-1661462769142.png','23269970'),(57,1,'Paco','Derribes','derr@gmail.com','645899745','Manuela Pedraza 451','$2a$10$ucgfIIMfEuMCjAMCrUemwOFbqk6RS.BHT3haC1gCuj2/2yo7s.hZ2','','41235987');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_type`
--

DROP TABLE IF EXISTS `users_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_type`
--

LOCK TABLES `users_type` WRITE;
/*!40000 ALTER TABLE `users_type` DISABLE KEYS */;
INSERT INTO `users_type` VALUES (1,'user'),(2,'admin');
/*!40000 ALTER TABLE `users_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-06 22:48:16
