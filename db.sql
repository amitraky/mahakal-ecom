/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.4.32-MariaDB : Database - indiazona_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`indiazona_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `indiazona_db`;

/*Table structure for table `discounts_charges` */

DROP TABLE IF EXISTS `discounts_charges`;

CREATE TABLE `discounts_charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `coupon_discount` decimal(10,2) DEFAULT 0.00,
  `bank_discount` decimal(10,2) DEFAULT 0.00,
  `no_return_discount` decimal(10,2) DEFAULT 0.00,
  `cod_charges` decimal(10,2) DEFAULT 0.00,
  `shipping_charges` decimal(10,2) DEFAULT 0.00,
  `packing_charges` decimal(10,2) DEFAULT 0.00,
  `handling_charges` decimal(10,2) DEFAULT 0.00,
  `net_amount` decimal(10,2) DEFAULT 0.00,
  `gross_amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `discounts_charges` */

/*Table structure for table `order_exchanges` */

DROP TABLE IF EXISTS `order_exchanges`;

CREATE TABLE `order_exchanges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `exchange_quantity` int(11) NOT NULL,
  `exchange_amount` decimal(10,2) NOT NULL,
  `taxes` decimal(10,2) DEFAULT 0.00,
  `discount` decimal(10,2) DEFAULT 0.00,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('Pending','Processed','Cancelled') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_exchanges_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_exchanges_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `order_exchanges` */

insert  into `order_exchanges`(`id`,`order_id`,`product_id`,`exchange_quantity`,`exchange_amount`,`taxes`,`discount`,`total_amount`,`status`,`created_at`,`updated_at`) values (1,1,52,1,'850.00','150.00','0.00','850.00','Processed','2025-01-28 17:55:50','2025-02-08 15:55:23'),(2,1,52,1,'850.00','150.00','0.00','850.00','Pending','2025-02-07 15:03:19','2025-02-07 15:03:19'),(3,1,52,1,'850.00','150.00','0.00','850.00','Pending','2025-02-08 15:43:25','2025-02-08 15:43:25'),(4,1,52,1,'850.00','150.00','0.00','850.00','Pending','2025-02-08 15:43:28','2025-02-08 15:43:28'),(5,1,52,0,'0.00','0.00','0.00','0.00','Pending','2025-02-08 15:45:23','2025-02-08 15:45:23'),(6,1,52,0,'0.00','0.00','0.00','0.00','Pending','2025-02-08 15:47:30','2025-02-08 15:47:30'),(7,1,52,0,'0.00','0.00','0.00','0.00','Pending','2025-02-08 15:49:40','2025-02-08 15:49:40'),(8,1,52,0,'0.00','0.00','0.00','0.00','Pending','2025-02-08 15:51:43','2025-02-08 15:51:43'),(9,1,52,0,'0.00','0.00','0.00','0.00','Pending','2025-02-08 15:52:04','2025-02-08 15:52:04'),(10,1,52,0,'0.00','0.00','0.00','0.00','Pending','2025-02-08 15:52:05','2025-02-08 15:52:05'),(11,1,52,0,'0.00','0.00','0.00','0.00','Pending','2025-02-08 15:52:42','2025-02-08 15:52:42'),(12,1,52,0,'0.00','0.00','0.00','0.00','Pending','2025-02-08 15:52:49','2025-02-08 15:52:49'),(13,1,52,0,'0.00','0.00','0.00','0.00','Pending','2025-02-08 15:54:41','2025-02-08 15:54:41'),(14,1,52,0,'0.00','0.00','0.00','0.00','Pending','2025-02-08 15:54:43','2025-02-08 15:54:43'),(15,1,52,0,'0.00','0.00','0.00','0.00','Pending','2025-02-08 15:55:21','2025-02-08 15:55:21'),(16,1,52,0,'0.00','0.00','0.00','0.00','Pending','2025-02-08 15:55:23','2025-02-08 15:55:23');

/*Table structure for table `order_returns` */

DROP TABLE IF EXISTS `order_returns`;

CREATE TABLE `order_returns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `return_quantity` int(11) NOT NULL,
  `return_amount` decimal(10,2) NOT NULL,
  `taxes` decimal(10,2) DEFAULT 0.00,
  `discount` decimal(10,2) DEFAULT 0.00,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_returns_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_returns_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `order_returns` */

insert  into `order_returns`(`id`,`order_id`,`product_id`,`return_quantity`,`return_amount`,`taxes`,`discount`,`total_amount`,`status`,`created_at`,`updated_at`) values (3,1,52,1,'850.00','150.00','0.00','850.00','Pending','2025-01-28 14:39:08','2025-01-28 14:39:08'),(4,1,52,1,'850.00','150.00','0.00','850.00','Pending','2025-01-28 14:39:09','2025-01-28 14:39:09'),(5,1,52,1,'850.00','150.00','0.00','850.00','Pending','2025-01-28 14:39:10','2025-01-28 14:39:10'),(6,1,52,1,'850.00','150.00','0.00','850.00','Pending','2025-01-28 14:39:11','2025-01-28 14:39:11'),(7,1,52,1,'850.00','150.00','0.00','850.00','Pending','2025-01-28 14:42:29','2025-01-28 14:42:29'),(8,1,52,1,'850.00','150.00','0.00','850.00','Pending','2025-01-28 14:42:31','2025-01-28 14:42:31'),(9,1,52,1,'850.00','150.00','0.00','850.00','Pending','2025-01-28 14:42:43','2025-01-28 14:42:43'),(10,1,52,1,'850.00','150.00','0.00','850.00','Pending','2025-01-28 14:42:45','2025-01-28 14:42:45'),(11,1,52,1,'850.00','150.00','0.00','850.00','Pending','2025-01-28 14:43:14','2025-01-28 14:43:14'),(12,1,52,1,'850.00','150.00','0.00','850.00','Pending','2025-01-28 14:43:28','2025-01-28 14:43:28'),(13,1,52,1,'850.00','150.00','0.00','850.00','Pending','2025-01-28 14:43:55','2025-01-28 14:43:55'),(14,1,52,1,'850.00','150.00','0.00','850.00','Pending','2025-01-28 14:44:32','2025-01-28 14:44:32'),(15,1,52,1,'850.00','150.00','0.00','850.00','Pending','2025-01-28 14:44:33','2025-01-28 14:44:33'),(16,1,52,1,'850.00','150.00','0.00','850.00','Approved','2025-01-28 14:44:35','2025-01-28 17:39:04'),(17,1,52,1,'850.00','150.00','0.00','850.00','Pending','2025-01-28 17:40:30','2025-01-28 17:40:30'),(18,1,52,1,'850.00','150.00','0.00','850.00','Pending','2025-01-28 17:40:33','2025-01-28 17:40:33'),(19,1,52,1,'850.00','150.00','0.00','850.00','Pending','2025-01-28 17:56:26','2025-01-28 17:56:26'),(20,1,52,1,'850.00','150.00','0.00','850.00','Pending','2025-01-28 17:56:29','2025-01-28 17:56:29'),(21,1,52,1,'850.00','150.00','0.00','850.00','Pending','2025-02-07 15:44:52','2025-02-07 15:44:52'),(22,1,52,1,'850.00','150.00','0.00','850.00','Pending','2025-02-08 15:35:55','2025-02-08 15:35:55'),(23,1,52,1,'850.00','150.00','0.00','850.00','Pending','2025-02-08 15:35:58','2025-02-08 15:35:58'),(24,1,52,1,'850.00','150.00','0.00','850.00','Approved','2025-02-08 15:36:03','2025-02-08 15:58:32');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `order_number` varchar(20) NOT NULL,
  `order_status` enum('Pending','Shipped','Delivered','Cancelled') NOT NULL DEFAULT 'Pending',
  `payment_status` enum('Paid','Failed','Refunded','Pending') NOT NULL DEFAULT 'Pending',
  `payment_mode` enum('Card','UPI','Wallet','COD') NOT NULL,
  `discounts_charges_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `orders` */

insert  into `orders`(`id`,`user_id`,`order_number`,`order_status`,`payment_status`,`payment_mode`,`discounts_charges_id`,`created_at`,`updated_at`) values (1,1,'ORD55','Delivered','Paid','COD',2,'2025-01-28 14:21:53','2025-01-28 14:21:53'),(2,1,'ORD91','Delivered','Paid','COD',2,'2025-01-28 14:21:56','2025-01-28 14:21:56'),(3,1,'ORD82','Delivered','Paid','COD',2,'2025-01-28 14:21:57','2025-01-28 14:21:57'),(4,1,'ORD46','Delivered','Paid','COD',2,'2025-01-28 14:33:50','2025-01-28 14:33:50'),(5,1,'ORD75','Delivered','Paid','COD',2,'2025-01-28 14:33:51','2025-01-28 14:33:51'),(6,1,'ORD29','Delivered','Paid','COD',2,'2025-01-28 14:33:52','2025-01-28 14:33:52'),(7,1,'ORD1739008774142','Delivered','Paid','COD',2,'2025-02-08 15:29:34','2025-02-08 15:29:34');

/*Table structure for table `product_orders` */

DROP TABLE IF EXISTS `product_orders`;

CREATE TABLE `product_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_variant_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `tax_amount_id` int(11) NOT NULL,
  `transaction_type` varchar(100) DEFAULT NULL,
  `address_id` int(10) unsigned DEFAULT NULL,
  `logistics_tracking_link` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `coupon_discount` decimal(10,2) DEFAULT 0.00,
  `bank_discount` decimal(10,2) DEFAULT 0.00,
  `no_return_discount` decimal(10,2) DEFAULT 0.00,
  `cod_charges` decimal(10,2) DEFAULT 0.00,
  `shipping_charges` decimal(10,2) DEFAULT 0.00,
  `packing_charges` decimal(10,2) DEFAULT 0.00,
  `handling_charges` decimal(10,2) DEFAULT 0.00,
  `net_amount` decimal(10,2) DEFAULT 0.00,
  `gross_amount` decimal(10,2) NOT NULL,
  `indiazona_price` decimal(10,2) DEFAULT NULL,
  `checkout_logistics_price` decimal(10,2) DEFAULT NULL,
  `awb_number` varchar(50) DEFAULT NULL,
  `nimbus_label` varchar(255) DEFAULT NULL,
  `nimbus_manifest` varchar(255) DEFAULT NULL,
  `product_order_code` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `product_orders` */

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `user_address_id` int(10) unsigned DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `is_made_in_india` tinyint(1) DEFAULT 0,
  `is_hand_made` tinyint(1) DEFAULT 0,
  `is_cash_on_delivery` tinyint(1) DEFAULT 0,
  `is_customizable_product` tinyint(1) DEFAULT 0,
  `delivery_by` tinyint(1) DEFAULT 1 COMMENT '1- Shipping by IndiaZona, 0- Shipping by Vendor',
  `return_policy_id` tinyint(1) DEFAULT NULL,
  `exchange_policy_id` tinyint(1) DEFAULT NULL,
  `hsn_code_id` int(11) DEFAULT NULL,
  `gst` decimal(5,2) DEFAULT NULL,
  `tag_price` decimal(10,2) DEFAULT NULL,
  `iz_commission` decimal(5,2) DEFAULT NULL,
  `no_return_discount` double(8,2) DEFAULT 0.00,
  `insurance_premium` tinyint(1) DEFAULT 0,
  `variant_type` tinyint(1) DEFAULT 0,
  `minimum_purchase_quantity` int(11) DEFAULT 1,
  `low_stock_quantity_warning` int(11) DEFAULT 0,
  `product_description` text DEFAULT NULL,
  `product_specification` text DEFAULT NULL,
  `thumbnail_image_url` varchar(255) DEFAULT NULL,
  `pdf_specification_url` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `status` enum('0','1','2') NOT NULL DEFAULT '0',
  `is_daily_deals` tinyint(1) DEFAULT 0,
  `is_new` tinyint(1) DEFAULT 0,
  `is_highlights` tinyint(1) DEFAULT 0,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `fk_products_user_id` (`user_id`),
  KEY `fk_item_id` (`item_id`),
  KEY `fk_brand_id` (`brand_id`),
  KEY `fk_hsn_code_id` (`hsn_code_id`),
  KEY `fk_user_address_id` (`user_address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `products` */

insert  into `products`(`id`,`item_id`,`user_id`,`user_address_id`,`product_name`,`slug`,`brand_id`,`is_made_in_india`,`is_hand_made`,`is_cash_on_delivery`,`is_customizable_product`,`delivery_by`,`return_policy_id`,`exchange_policy_id`,`hsn_code_id`,`gst`,`tag_price`,`iz_commission`,`no_return_discount`,`insurance_premium`,`variant_type`,`minimum_purchase_quantity`,`low_stock_quantity_warning`,`product_description`,`product_specification`,`thumbnail_image_url`,`pdf_specification_url`,`video_url`,`is_active`,`status`,`is_daily_deals`,`is_new`,`is_highlights`,`created_on`,`updated_on`) values (52,407,32,21,'Test ','Test ',73,1,0,1,1,1,2,1,70,'5.00','2400.00','15.50',50.00,1,1,1,1,'test',NULL,'1737028498183-Screenshot 2025-01-16 at 1.52.26â¯PM.png',NULL,NULL,1,'2',0,0,0,'2025-01-12 05:48:38','2025-01-20 09:14:49'),(53,2421,28,NULL,'Natraj Black Ball Pen','Natraj Black Ball Pen',73,0,0,0,0,1,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0,0,1,0,'Test ',NULL,NULL,NULL,NULL,1,'1',0,0,0,'2025-01-12 09:14:51','2025-01-13 10:05:14'),(54,1355,13,4,'test product','test product',81,1,1,1,0,1,2,2,3,'5.00','1000.00','15.50',0.00,1,0,1,1,'test',NULL,'1736761218405-mission_pic_badges_drib.jpg',NULL,NULL,1,'0',0,0,0,'2025-01-13 06:02:17','2025-01-17 06:36:11'),(55,2086,13,4,'Natraj Pen','Natraj Pen',81,1,0,1,0,1,2,1,1,'5.00','500.00','12.50',50.00,1,1,1,1,'test',NULL,NULL,NULL,NULL,1,'0',0,0,0,'2025-01-13 07:11:55','2025-01-13 13:03:08'),(56,2086,13,6,'Geyser ','Geyser ',80,1,0,1,0,1,2,1,NULL,NULL,NULL,NULL,0.00,0,0,1,0,'Portable geyser',NULL,NULL,NULL,NULL,1,'2',0,0,0,'2025-01-13 07:26:42','2025-01-20 07:53:10'),(57,2086,13,6,'Portable Geyser','Portable Geyser',80,1,0,0,0,1,2,1,NULL,NULL,NULL,NULL,0.00,0,0,1,0,'Portable Geyser ',NULL,NULL,NULL,NULL,1,'0',0,0,0,'2025-01-13 07:35:13','2025-01-13 07:35:28'),(60,2647,37,NULL,'Short handle','Short handle',73,0,0,0,0,1,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0,0,1,0,'Cricket short handle plastic bat. ',NULL,NULL,NULL,NULL,1,'0',0,0,0,'2025-01-14 06:51:41','2025-01-14 06:51:41'),(62,2678,46,27,'dd','dd',72,1,0,0,0,1,1,2,2,'5.00','99.00','14.50',0.00,1,0,1,1,'dd\n',NULL,NULL,NULL,NULL,1,'0',0,0,0,'2025-01-17 05:23:07','2025-01-17 08:10:47'),(66,485,46,27,'Elegant Silk Sari with Traditional Embroidery – 6 Yards of Style','Elegant Silk Sari with Traditional Embroidery – 6 Yards of Style',79,1,0,0,0,1,2,2,4395,'5.00','5999.00','24.50',0.00,1,0,1,1,'Discover  elegance with our premium silk sari, crafted to perfection. Featuring intricate embroidery and a luxurious finish, this sari is ideal for weddings, festive occasions, and cultural celebrations. Its lightweight and breathable fabric ensure comfort while exuding sophistication.',NULL,'1737351128705-DALLÂ·E 2025-01-20 10.57.03 - A traditional Indian sari draped on a mannequin, featuring a classic design with rich colors such as red or blue and a golden border. The sari is disp.webp',NULL,NULL,1,'1',0,0,0,'2025-01-20 05:04:19','2025-01-20 07:52:57'),(67,499,46,27,'Classic Black Graduation Gown with Cap and Tassel – Unisex Academic Robe','Classic Black Graduation Gown with Cap and Tassel – Unisex Academic Robe',84,1,0,0,1,1,1,2,5339,'0.00','1999.00','18.50',0.00,1,1,1,1,'Celebrate your achievements in style with our classic black graduation gown. Made from premium, lightweight fabric, this gown offers a comfortable fit and a timeless design. Perfect for graduation ceremonies, it comes with a matching cap and tassel to complete the look. Suitable for all genders and available in various sizes.\n',NULL,'1737352029971-graduation gown.jpg',NULL,NULL,1,'1',0,0,0,'2025-01-20 05:40:19','2025-01-20 07:52:54'),(68,928,46,27,'Crispy Fryum Papad – Ready-to-Fry Snack Delight','Crispy Fryum Papad – Ready-to-Fry Snack Delight',85,1,1,0,0,1,1,1,1339,'5.00','450.00','6.75',0.00,1,0,1,1,'Enjoy the perfect crispy snack with our premium Fryum Papad, ideal for all ages! Made with high-quality ingredients, these papads are quick and easy to fry, providing a light and crunchy texture. Perfect as a standalone snack or a side dish with your meals.',NULL,'1737352470406-fryums.jpeg',NULL,NULL,1,'1',0,0,0,'2025-01-20 05:49:38','2025-01-20 07:52:51'),(69,949,46,27,'Mint-Flavored Chewing Gum – Long-Lasting Freshness','Mint-Flavored Chewing Gum – Long-Lasting Freshness',86,1,0,0,0,1,1,1,1270,'5.00','250.00','5.25',0.00,1,0,5,1,'Experience a burst of freshness with our mint-flavored chewing gum. Each piece is crafted for long-lasting flavor and a soft, chewy texture. Perfect for freshening your breath or enjoying a quick treat on the go. Comes in a convenient pack to fit easily in your pocket or bag.',NULL,'1737354456729-gums.jpeg',NULL,NULL,1,'1',0,0,0,'2025-01-20 06:22:05','2025-01-20 07:52:49'),(70,657,46,27,'Universal Laptop Adapter – 65W Power Supply with Multiple Connectors','Universal Laptop Adapter – 65W Power Supply with Multiple Connectors',87,1,0,0,0,1,2,2,7135,'18.00','3499.00','16.50',0.00,1,0,1,1,'Stay powered up with our high-performance universal laptop adapter, designed to provide reliable and efficient power delivery for various laptop brands. Featuring multiple connector tips and advanced safety features, this adapter ensures compatibility, durability, and protection for your device. Perfect for home, office, or travel use.',NULL,'1737354769061-adapter.jpeg',NULL,NULL,1,'1',0,0,0,'2025-01-20 06:30:30','2025-01-20 07:52:47'),(71,713,46,27,'Stylish Smartwatch with Fitness Tracker and Heart Rate Monitor','Stylish Smartwatch with Fitness Tracker and Heart Rate Monitor',88,1,0,0,0,1,1,2,6838,'12.00','5499.00','19.50',0.00,1,0,1,1,'Redefine your style and productivity with this fashionable smartwatch. Equipped with a vibrant touch display, health tracking features, and seamless smartphone connectivity, it is your perfect companion for both fitness and daily life. Track steps, monitor heart rate, receive notifications, and much more with a sleek and lightweight design.',NULL,'1737355691575-sw.jpeg',NULL,NULL,1,'1',0,0,0,'2025-01-20 06:44:38','2025-01-20 07:52:45'),(72,1915,46,27,'BPA-Free Sipper Cup with Leak-Proof Lid – 500ml','BPA-Free Sipper Cup with Leak-Proof Lid – 500ml',89,1,0,0,1,1,2,2,2896,'18.00','599.00','13.00',0.00,1,0,1,1,'Stay hydrated on the go with this stylish and durable sipper cup. Designed with a leak-proof lid and a convenient drinking spout, this cup is perfect for gym sessions, travel, or everyday use. Made from BPA-free, food-grade material, it ensures safety and long-lasting performance.',NULL,'1737356564568-sc.jpeg',NULL,NULL,1,'1',0,0,0,'2025-01-20 06:51:42','2025-01-20 07:52:43'),(74,1955,46,27,'Naphthalene Ball – Moth and Insect Repellent for Wardrobes & Storage','Naphthalene Ball – Moth and Insect Repellent for Wardrobes & Storage',90,1,0,0,0,1,1,1,7580,'12.00','199.00','9.75',0.00,1,0,1,1,'Naphthalene Balls protect your clothes and storage from moths and insects with their strong, long-lasting odor. Ideal for wardrobes, closets, and storage spaces.',NULL,'1737357390318-nb.jpg',NULL,NULL,1,'1',0,0,0,'2025-01-20 07:14:09','2025-01-20 07:52:41'),(75,387,46,27,'Elegant Briefcase – Professional Leather Laptop & Document Carrier','Elegant Briefcase – Professional Leather Laptop & Document Carrier',91,1,0,0,0,1,2,2,3302,'12.00','4000.00','18.50',0.00,1,1,1,1,'This Elegant Briefcase is designed for professionals who need to carry documents, laptops, and other essentials in style. Made with premium leather, it combines durability with a sleek, sophisticated look. Perfect for business meetings, travel, or everyday use.',NULL,'1737357723920-briefcase.jpeg',NULL,NULL,1,'1',0,0,0,'2025-01-20 07:19:10','2025-01-20 07:52:39'),(76,406,46,27,'Slim Card Wallet – Compact & Stylish Leather Wallet for Cards and Cash','Slim Card Wallet – Compact & Stylish Leather Wallet for Cards and Cash',92,1,0,0,0,1,2,2,3302,'12.00','800.00','20.50',0.00,1,0,1,1,'The Slim Card Wallet is a minimalist, stylish wallet designed to carry your essential cards and cash in a compact form. Made from premium leather, it’s the perfect solution for those who prefer sleek, lightweight wallets with maximum organization.',NULL,'1737358466054-wallet card.jpg',NULL,NULL,1,'1',0,0,0,'2025-01-20 07:31:17','2025-01-20 07:52:37'),(77,611,46,27,'Comfortable Sandal – Stylish and Casual Daily Wear','Comfortable Sandal – Stylish and Casual Daily Wear',93,1,0,0,0,1,2,2,5829,'18.00','999.00','15.00',50.00,1,1,1,1,'These Comfortable Sandals are designed for all-day wear, offering both style and functionality. Perfect for casual outings, beach days, or as daily footwear, they feature a soft footbed and durable straps for long-lasting comfort. Available in a variety of colors to match your style.',NULL,'1737358993817-sandal.jpeg',NULL,NULL,1,'1',0,0,0,'2025-01-20 07:38:47','2025-01-20 07:52:35'),(78,619,46,27,'Shoe Polish Cream – Premium Leather Conditioner and Shine','Shoe Polish Cream – Premium Leather Conditioner and Shine',94,1,0,0,0,1,1,1,27,'5.00','399.00','16.50',0.00,1,0,1,1,'Shoe Polish Cream is designed to restore the shine and nourishment of your leather footwear. It helps maintain the leather quality, providing protection from water, dirt, and wear. Available in a variety of colors to match your shoes, it keeps them looking polished and new for longer.',NULL,'1737359370514-shoe cream.jpeg',NULL,NULL,1,'1',0,0,0,'2025-01-20 07:44:40','2025-01-20 07:52:33'),(79,275,46,27,'Colorful Kite – Fun and Easy-to-Fly Toy for Kids','Colorful Kite – Fun and Easy-to-Fly Toy for Kids',95,1,0,0,0,1,1,1,7668,'5.00','500.00','10.50',0.00,1,0,1,1,'This Colorful Kite is the perfect outdoor toy for kids, designed for easy flying and hours of fun. Made with durable, lightweight materials, it features a vibrant design that catches the wind effortlessly. Ideal for sunny days in the park, beach, or backyard, this kite encourages outdoor play and coordination.',NULL,'1737360224564-kite.jpeg',NULL,NULL,1,'1',0,0,0,'2025-01-20 07:59:27','2025-01-20 09:09:52'),(80,455,47,29,'Ready Women\'s Ethnic Printed Kurta and Pant Set - Festive and Casual Wear. Pink Color','Ready Women\'s Ethnic Printed Kurta and Pant Set - Festive and Casual Wear. Pink Color',96,1,1,1,0,1,2,1,5398,'0.00','990.00','15.50',50.00,1,1,1,1,'Upgrade your ethnic wardrobe with this charming Women\'s Ethnic Printed Kurta and Pant Set. Designed in a captivating pink hue, this set features intricate traditional prints that add a festive touch. The kurta boasts a flattering silhouette, paired with elasticated pants for maximum comfort and style. Whether you\'re attending a festival, a family gathering, or simply enjoying a casual day out, this outfit ensures you look your best effortlessly.\n\nCrafted from high-quality, breathable fabric, this set guarantees comfort without compromising on elegance. Easy to maintain and versatile to style, it’s a must-have addition to your collection.\n\nKey Features:\n\nFabric: Soft, breathable, and skin-friendly material\nColor: Vibrant pink with traditional prints\nSet Includes: One kurta and one matching pant\nCare Instructions: Machine wash cold, tumble dry low, iron on low heat if needed',NULL,'1737361128427-WhatsApp Image 2025-01-17 at 12.15.10.jpg',NULL,NULL,1,'1',0,0,0,'2025-01-20 08:11:03','2025-01-20 09:09:49'),(83,319,46,27,'Diaper Disposal Bin – Odor-Control Baby Diaper Trash Can for Nursery','Diaper Disposal Bin – Odor-Control Baby Diaper Trash Can for Nursery',97,1,0,0,0,1,2,2,2896,'18.00','2500.00','20.50',0.00,1,0,1,1,'The Diaper Disposal Bin is designed to make diaper changes easier and more hygienic. With an advanced odor-control system and a spacious, easy-to-use design, it ensures a clean and odor-free nursery. This diaper bin is a must-have for parents, providing convenience and cleanliness in one simple solution.',NULL,'1737360938491-bin.jpeg',NULL,NULL,1,'1',0,0,0,'2025-01-20 08:13:20','2025-01-20 09:09:47'),(84,986,46,27,'Premium Attar – Traditional Natural Fragrance for Men & Women','Premium Attar – Traditional Natural Fragrance for Men & Women',98,1,0,0,0,1,1,1,1522,'12.00','1499.00','19.00',0.00,1,1,1,1,'Zarqaa Premium Attar is a luxurious and natural fragrance made from the finest flower extracts and essential oils. Free from alcohol, it provides a rich and long-lasting scent that is perfect for both men and women. Ideal for daily wear or special occasions, this attar is an exquisite addition to any perfume collection.',NULL,'1737361333259-attar.jpeg',NULL,NULL,1,'1',0,0,0,'2025-01-20 08:19:45','2025-01-20 09:09:44'),(85,1053,46,27,'Matte Lipstick – Long-Lasting, Smooth Finish for All-Day Wear','Matte Lipstick – Long-Lasting, Smooth Finish for All-Day Wear',99,1,0,0,0,1,1,1,1607,'5.00','699.00','11.00',0.00,0,0,1,1,'VelvetTouch Matte Lipstick delivers rich, bold color with a velvety matte finish that lasts all day. Infused with moisturizing ingredients, it glides on smoothly and doesn’t dry out lips. Available in a variety of shades, it’s perfect for both casual and professional looks, making your lips stand out with confidence.',NULL,'1737361910376-lipstick.jpeg',NULL,NULL,1,'1',0,0,0,'2025-01-20 08:29:05','2025-01-20 09:09:42'),(86,1304,46,27,'Soft Bed Cover – Premium Cotton Bedspread for Ultimate Comfort','Soft Bed Cover – Premium Cotton Bedspread for Ultimate Comfort',100,1,0,0,0,1,2,2,5635,'0.00','1499.00','16.50',40.00,1,0,1,1,'This Soft Bed Cover from ComfyHome is made from high-quality cotton to ensure maximum comfort and breathability. Its elegant design and rich colors add a touch of sophistication to any bedroom. Perfect for year-round use, this bed cover provides warmth during cooler months and a lightweight feel in warmer weather.',NULL,'1737362596134-cover.jpeg',NULL,NULL,1,'1',0,0,0,'2025-01-20 08:40:21','2025-01-20 09:09:41'),(87,1315,46,27,'Durable Storage Box – Multi-Purpose Organizer for Home & Office','Durable Storage Box – Multi-Purpose Organizer for Home & Office',101,1,0,0,0,1,2,2,2873,'12.00','499.00','6.75',0.00,0,0,1,1,'The StorEase Durable Storage Box is the perfect solution for keeping your space organized and clutter-free. Made from high-quality plastic, it is sturdy, stackable, and perfect for storing clothes, toys, office supplies, and more. Its clear design lets you see the contents easily, while the secure lid ensures items stay dust-free.',NULL,'1737364479023-sb.jpeg',NULL,NULL,1,'1',0,0,0,'2025-01-20 08:47:46','2025-01-20 09:14:39'),(88,1557,46,27,'Heavy-Duty Wall Hook – Multipurpose Hanging Solution for Home and Office','Heavy-Duty Wall Hook – Multipurpose Hanging Solution for Home and Office',102,1,0,0,0,1,1,1,6988,'18.00','350.00','12.50',0.00,1,1,1,1,'The FixItPro Heavy-Duty Wall Hook offers a simple and sturdy solution for hanging items in your home, office, or garage. Made from durable stainless steel, this hook is designed to hold heavy objects securely. Its sleek design complements any space, making it ideal for coats, bags, towels, tools, and more.',NULL,'1737376739505-hook.jpeg',NULL,NULL,1,'0',0,0,0,'2025-01-20 12:18:21','2025-01-20 12:38:59'),(89,1610,46,27,'Aquatic Plant Fertilizer – Enriched Nutrients for Healthy Water Plants','Aquatic Plant Fertilizer – Enriched Nutrients for Healthy Water Plants',103,1,0,0,0,1,1,1,4670,'12.00','700.00','17.00',0.00,1,0,1,1,'AquaBloom Aquatic Plant Fertilizer is specially formulated to promote the healthy growth of aquatic plants in aquariums and ponds. Enriched with essential nutrients, it ensures lush greenery, improved root development, and vibrant plant growth. This eco-friendly fertilizer is safe for fish, shrimp, and other aquatic life.',NULL,'1737377517258-aquatic.jpeg',NULL,NULL,1,'0',0,0,0,'2025-01-20 12:48:14','2025-01-20 12:51:57'),(91,587,32,21,'Chicago Brannd Sunglasses','Chicago Brannd Sunglasses',80,1,0,1,0,1,2,1,7080,'12.00','950.00','15.50',50.00,1,0,1,1,'test',NULL,NULL,NULL,NULL,1,'0',0,0,0,'2025-01-21 05:09:59','2025-01-21 05:13:33'),(92,2310,46,27,'Premium Color Pencils – Vibrant Shades for Art and Craft','Premium Color Pencils – Vibrant Shades for Art and Craft',104,1,0,0,0,1,1,1,7885,'12.00','599.00','13.00',0.00,0,1,1,1,'ColorVista Premium Color Pencils are designed for artists and crafters of all skill levels. Featuring smooth, vibrant pigments, these pencils deliver excellent blending, shading, and detailing. Perfect for drawing, sketching, and coloring, they are non-toxic and safe for kids and adults alike.',NULL,'1737437870824-cp.jpg',NULL,NULL,1,'0',0,0,0,'2025-01-21 05:34:41','2025-01-21 05:37:50'),(93,2368,46,27,'A4 Lamination Machine – High-Speed Thermal Laminator for Office & Home Use','A4 Lamination Machine – High-Speed Thermal Laminator for Office & Home Use',105,1,0,0,0,1,1,1,420,'0.00','3499.00','10.00',0.00,1,0,1,1,'The DocuPro A4 Lamination Machine is a reliable and efficient solution for protecting important documents, photographs, certificates, and more. Designed for ease of use, it features a high-speed heating mechanism and supports hot and cold lamination modes, making it ideal for office, school, or home use. Compact and lightweight, this laminator ensures professional results every time.',NULL,'1737438115226-lp.jpg',NULL,NULL,1,'0',0,0,0,'2025-01-21 05:39:33','2025-01-21 05:41:55'),(94,894,46,27,'Havan Items Set – Essential Pooja Samagri for Spiritual Ceremonies','Havan Items Set – Essential Pooja Samagri for Spiritual Ceremonies',106,1,0,0,0,1,1,1,7814,'18.00','899.00','20.50',0.00,0,0,1,1,'DivyaPooja Havan Items Set contains all the essential samagri required for performing havans and spiritual rituals. Made with authentic and natural ingredients, this set is perfect for invoking positive energies and purifying the environment. Suitable for all religious occasions, it ensures a complete and hassle-free experience.',NULL,'1737439710283-hi.jpeg',NULL,NULL,1,'0',0,0,0,'2025-01-21 05:45:43','2025-01-21 06:08:30'),(95,792,13,NULL,'SeeGate Fast USB 3.0 | 32 GB ','SeeGate Fast USB 3.0 | 32 GB ',76,0,0,0,0,1,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0,0,1,0,' Fast 32 GB 3.032 gb pendrive, used in making bootable things, storings songs and many more.',NULL,NULL,NULL,NULL,1,'0',0,0,0,'2025-01-21 06:45:00','2025-01-21 06:45:00'),(96,913,46,27,'Festive Gift Box – Premium Assortment for Celebrations & Special Occasions','Festive Gift Box – Premium Assortment for Celebrations & Special Occasions',107,1,0,0,0,1,1,1,1534,'5.00','1799.00','22.50',0.00,1,0,1,1,'The Celebria Festive Gift Box is a thoughtfully curated collection of premium goodies, perfect for gifting during festivals, special occasions, or corporate events. Packed in an elegant box, this assortment is designed to spread joy and make your celebrations memorable.',NULL,'1737442220563-gb.jpg',NULL,NULL,1,'0',0,0,0,'2025-01-21 06:46:44','2025-01-21 06:50:20'),(97,982,46,27,'Handmade Decorative Handicraft – Authentic Artisan Craft for Home Decor','Handmade Decorative Handicraft – Authentic Artisan Craft for Home Decor',108,1,1,0,0,1,1,1,7960,'12.00','1600.00','20.00',0.00,1,0,1,1,'The ArtisanElegance Handmade Decorative Handicraft is a unique, skillfully crafted piece that adds a touch of tradition and elegance to any space. Created by skilled artisans using sustainable materials, this product is perfect for gifting or enhancing your home decor. Each piece reflects rich cultural heritage and unparalleled craftsmanship.',NULL,'1737443115585-handicrafts.jpeg',NULL,NULL,1,'0',0,0,0,'2025-01-21 07:02:48','2025-01-21 07:05:15');

/*Table structure for table `tax_amounts` */

DROP TABLE IF EXISTS `tax_amounts`;

CREATE TABLE `tax_amounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `cgst_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `sgst_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `igst_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `transaction_type` enum('Intra','Inter') NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `total_tax` decimal(10,2) NOT NULL DEFAULT 0.00,
  `product_order_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_product_order_id` FOREIGN KEY (`id`) REFERENCES `product_orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tax_amounts` */

/*Table structure for table `user_roles` */

DROP TABLE IF EXISTS `user_roles`;

CREATE TABLE `user_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `user_roles` */

insert  into `user_roles`(`id`,`type`,`is_active`,`created_at`,`updated_at`) values (1,'ADMIN',1,'2024-11-13 09:34:21','2024-11-13 09:34:21'),(2,'VENDOR',1,'2024-11-13 09:34:21','2024-11-13 09:34:21'),(3,'SUPER DEALER',1,'2024-11-29 11:27:09','2024-11-29 11:27:16'),(4,'DEALER',1,'2024-11-29 11:27:31','2024-11-29 11:27:31'),(5,'CUSTOMER',1,'2024-11-29 11:27:31','2024-11-29 11:27:31'),(6,'GUEST',1,'2024-11-29 11:27:39','2024-11-29 11:27:39');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `secure_id` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verify_token` varchar(255) DEFAULT NULL,
  `is_email` tinyint(1) NOT NULL DEFAULT 0,
  `is_phone` tinyint(1) NOT NULL DEFAULT 0,
  `phone` varchar(20) NOT NULL,
  `otp` varchar(6) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `referral_code` varchar(20) DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `reset_token` varchar(200) DEFAULT NULL,
  `reset_token_expiry` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `secure_id` (`secure_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`secure_id`,`role_id`,`name`,`email`,`email_verify_token`,`is_email`,`is_phone`,`phone`,`otp`,`password`,`is_active`,`status`,`referral_code`,`phone_verified_at`,`email_verified_at`,`remember_token`,`reset_token`,`reset_token_expiry`,`created_at`,`updated_at`,`deleted_at`) values (1,'d7473fa6502ee129ad70b4e7139b003r',2,'raju12356777','byrrajuramanaraju777@gmail.com','$2a$10$Ih4Qy0f5roZbeOJZVgC8g.eGzcCAzPmtr4pFZdh7avNC7z0iFupCy',1,1,'9542254777',NULL,'$2a$10$eY.SM4yMV0axTo3jJ.HNlOxbYQlvMAfvWy3.OoyAg7.HhjwE3RHsO',0,3,'','2024-12-19 06:24:39','2024-12-19 06:27:07',NULL,'1',1,'2024-12-19 06:24:16','2025-01-01 16:56:29',NULL),(2,'1c8f72933e7521b32288cd091907ba3r',1,'Indiazona Admin ','admin@mahakaliinfotek.com','R2CuDGEiXF2vkSKob78Eitv4DZiZw14D3c24z3EcQR33sVP7YOBTDtmwOJNcM6',1,1,'8317510846',NULL,'$2a$10$eY.SM4yMV0axTo3jJ.HNlOxbYQlvMAfvWy3.OoyAg7.HhjwE3RHsO',NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-01-08 08:27:50',NULL),(3,'d7473fa6502e6e129ad70b4e7139b00r',2,'Shubham Kumar Kurrey','skurrey2806@gmail.com',NULL,0,0,'7667491408','957244',NULL,0,7,'',NULL,NULL,NULL,'1',1,'2024-12-30 07:28:08','2025-01-09 11:26:08',NULL),(4,'1c8f72933e7521b32273cd091907ba3r',2,'Shubham Kumar Kurrey','yajoj34700@nongnue.com','AaBP4QaLdj4jjbYY8StKjznngPYn2aZGuPvH2YN2Je0lv3LwkvFGUQPt2CtEKR',1,1,'7667481408',NULL,'$2a$10$qVuZUt5GePUv61QyFEHNoeF6Ra3yPn5Jnh8r73dJkuubk.mQmzLne',0,6,'','2024-12-30 07:29:54','2024-12-30 07:30:59',NULL,'1',1,'2024-12-30 07:29:40','2025-01-20 05:58:05',NULL),(7,'cf135e63d1d0cbd51286201bccea1950',2,'RamanaRaju','byrrajuramanaraju67yu7@gmail.com','xQeSloBfO3ysI8d6VFf7ml3FV8M4540aOTcmuh3vKEtFJkpLRYxRGxQTxw7ZDq',1,1,'95422524409',NULL,'$2a$10$OgNfpFVUskkixKcjSKSakOjzyreV77eA0vmkLRGaEGh/iPZu/Ho3i',0,3,'','2025-01-01 16:47:03','2025-01-02 12:20:27',NULL,'1',1,'2025-01-01 16:46:34','2025-01-10 14:03:51',NULL),(10,'04ab6b3a62baf6095a775e7bd668a9b7',2,'raju','bpagaria.mahakali@gmail.com','5NjJARWlu3amn2TCnkiJQzjliOlFxBRSl9KFqoxpjvxk3056hgI8cu9idpmLgO',1,1,'8317570846',NULL,'$2b$10$YWOnlWvHn4ueCsPLO6e.Ueyaj9hhEvP.4pmEXHzZhSYpwnvAK7e36',0,3,'','2025-01-01 17:36:58','2025-01-01 18:53:58',NULL,NULL,NULL,'2025-01-01 17:36:38','2025-01-11 05:36:44',NULL),(11,'5607941b1ffb345b74acf0ede8de19f8',2,'Aakarsh','aakarsh2007@gmail.com','6pTEJOEw4vH1Pdcnwz5VXPCevCrSUh4JjkOKlKOW62sccVZFJkwqZGrIIypxGB',0,0,'9910225334',NULL,'$2a$10$VcJiXedI9bFLgBGaGVcobuLcWDw6vop1T9lZZGvcMrYQ3.TYCGXB6',0,1,'','2025-01-02 05:59:33',NULL,NULL,'1',1,'2025-01-02 05:59:02','2025-01-02 05:59:42',NULL),(12,'e89a50bfac122ec9b567f563cde6f104',2,'Mridula','heeden011@gmail.com','cMcgScZcBD3AlEUDycHFwd2AqbJKIhPWeyyCygVzncvPZ8suPR0J7XVwpuS1xV',1,1,'7042023248','469793','$2a$10$YUVvUaOxAPhz4yR5jB3qy.QdgbWGZNC7LChHMGrZmohYqcROPzYz2',0,4,'','2025-01-02 06:07:29','2025-01-02 12:20:57',NULL,'1',1,'2025-01-02 06:06:36','2025-01-04 06:04:28',NULL),(13,'3020a065e8a078f727f6668e8610e262',2,'Vendor','byrrajuramanaraju@gmail.com','O2z7VO4Diiv6FFUdHqHpfoyLHE3yrJ0LNtWd1gnL15dyJLw05roog7RgZu9UbU',1,1,'8317510846',NULL,'$2a$10$2eAB484tQIQ2DY.zESilredYh2XNgyrQM0e4R82Jq.O7ygJsSg90S',0,12,'','2025-01-13 06:56:24','2025-01-02 16:34:53',NULL,'1',1,'2025-01-02 15:23:03','2025-01-13 06:56:24',NULL),(14,'3f2013e3e8cd25b90c3e7a2d6cbf64c1',2,'Gaurav Saxena','gaura.saxena13031982@gmail.com','VaGkTzWLLdiAmuFTFoMnzdzlwkTuBKQSSjlm6wRmtpxUeU6MPJeUbBUyCL8rax',0,0,'9889776629',NULL,'$2a$10$G.8/ek8yDgVgdjpuS8cITeEcO9YTZ0IRkfeQrgYfnviU.4TATCVtq',0,5,'','2025-01-03 04:31:43',NULL,NULL,'1',1,'2025-01-03 04:31:08','2025-01-08 09:50:35',NULL),(15,'a3cdc9b29752a2af09edc7fd2f743124',2,'Tripurari Sharan','tssrivastava22@gmail.con','6G4St5iEojkcph2Vg5VBsou3SXKBWOQHVx6fNvHwx9DYq1PAGj57AFzkFsFfHU',1,1,'9910225333','244113','$2b$10$2fZEObjCHDyxmZGX2gNDVeGHqDP6GDu/NrwVrmLhbQ5uL3063NCwK',0,7,'','2025-01-03 05:22:19','2025-01-03 05:43:14',NULL,NULL,NULL,'2025-01-03 05:15:33','2025-01-12 11:23:00',NULL),(16,'07cfc6296ee8271965006a7152ad7f16',2,'Sachita Nand Gupta','sng.gurgaon@gmail.com','JCpYDFUDWINLo0RCHDFiT3d4vf6exqSfa5S1LoNux8j41IMRrYroqueZ9iYbCo',1,1,'9868797944',NULL,'$2a$10$vHnKy7c3bDTXWpxP7rkTHugsrvwlIWKmc7HMVsO2F2V4m6AWAB61q',0,1,'','2025-01-03 07:50:27','2025-01-03 07:51:58',NULL,'1',1,'2025-01-03 07:50:08','2025-01-03 07:51:58',NULL),(17,'fbc92948713e4506be91422a5dbe907d',2,'Gaurav Saxena','gaurav.saxena13031982@gmail.com','sPIjlNedLzB1ag4YE5A5NXNhxj2MaoP4VjSK2mRuMPVLwq05SAsIo1XC7AR1i9',1,1,'9889776629',NULL,'$2a$10$nxDU7erFQuHgoLq4XdmoeO8I2rNPkZDi7pKGPwWa3fFHoaKgrMrwi',0,1,'','2025-01-03 08:59:37','2025-01-03 09:02:54',NULL,'1',1,'2025-01-03 08:58:44','2025-01-10 08:12:54',NULL),(18,'ac6f86cca13a3ebb5ec08b40e2675104',2,'Priya ojha','wesay@koletter.in','qPJwQRnsvS5WeE9kSSNwRTlRbBsvGDGWAT6p4MvoGqm9R0L7dq44MX35EKgL13',1,1,'9502825989','692823','$2a$10$eJsuG7UqUbb.sVi8JgB6AeesZoalli0/HFyq2biO4ctV8NeCFSNAm',0,4,'','2025-01-10 07:29:31','2025-01-10 07:30:41',NULL,'1',1,'2025-01-10 07:26:32','2025-01-10 12:07:33','2025-01-10 11:43:02'),(19,'9ce4ff1a5a3b253217efc722eb1b6238',2,'Bhawna Pagaria','naweyaw984@kvegg.com','7HO60gl768q2SVj1QDzNmPmL2YNSwnjgVLgUpVkdjVASxtQHUKjgZcufmwQsfV',1,1,'9748530000',NULL,'$2a$10$STEBDpuQQlRcmKH9PIXWQe1zZlitWKVY/wQ77pG1OPGpEE9FwyF0y',0,3,'','2025-01-10 09:10:37','2025-01-10 09:11:42',NULL,'1',1,'2025-01-10 09:10:23','2025-01-10 11:49:23','2025-01-10 11:42:26'),(20,'467ddb8becdc84f5b05e7bfdd1d73bdd',2,'Rajesh pagaria','wesay@koletter.com','YJI77IYwKCCiBeCFFRsYdCl8VpNIPMjhBhRDLUwcKOG70eGrJQWDyyqakbypqF',0,0,'9502825965',NULL,'$2a$10$xO4OAKP5hsx0I3QUZ98qJuTGJXFd4PCHI2mQnRuapKeJWzRHQKj7a',0,1,'','2025-01-10 12:24:21',NULL,NULL,'1',1,'2025-01-10 12:24:09','2025-01-10 12:24:28',NULL),(21,'6bf2fb50588c400b827b03d0f72db4a3',2,'Bhawna Pagaria','imy80@freesourcecodes.com','SxZRuDlqdEg7DBF2yHy8d9ZGJQH7qN5WOVjTRRinhSyBldrQ0JsrGBSYsRbZQo',1,1,'9748530111',NULL,'$2a$10$yc8siJMLxn3dkd9/Ws.gRudOQYb1nSUfbxtYM.XC4OgWuFNKx55RO',0,3,'','2025-01-10 12:26:17','2025-01-10 12:27:10',NULL,'1',1,'2025-01-10 12:26:02','2025-01-10 12:57:50',NULL),(22,'2521aed360a00a73c896066b2403f820',2,'Rajesh pagaria','famasaw410@xcmexico.com','uaNVUPLRr0DGaPanlLFpHVUWqvsxglPUKbOKHZLbN5pRFo9RUUMoK5sAJKEP4r',1,1,'1234567890',NULL,'$2a$10$P8/9ypHd2v/hG/zuHwpkAOp.CK/U4E.6ydj/aC2RnwAurM2ZyIiCy',0,6,'','2025-01-10 12:27:43','2025-01-10 12:28:12',NULL,'1',1,'2025-01-10 12:26:47','2025-01-10 14:51:35',NULL),(23,'651d36ffb57c3354af20cffb53b5b6a9',2,'SURAPU RAJU Byrraju','braju.indiazo3na@gmail.com','4IRyFEPLtKIFM2qALy8IlWqz4wK9sYDCgs3LEXER4wQia8Z98AF0auWKUcvWuC',1,1,'95422564409',NULL,'$2a$10$VvkRxcB2Cwc/31Q.GqrmGOp8ma5DsPonQOwJw9/HasxnR.TdAEzUa',0,4,'','2025-01-10 14:24:05','2025-01-10 16:08:50',NULL,'1',1,'2025-01-10 14:23:46','2025-01-12 12:19:08',NULL),(24,'4eedf1dfb33a08673d9aa6f3ce959322',2,'SURAPU RAJU Byrraju','braju.indiazona@gmail.com','wm3pHMnbj0Ih7GrPzugKRKlmgWZcKcWRbtuKLG9Z3QCtcimJeTXK5dtoHR439c',1,1,'9542254409','195599','$2a$10$Z7GeWKlOnUTOy00ls2/sfeKEu8z/ve5OjwA3zY/PqsFkWY2lCE5Eu',0,3,'','2025-01-10 15:37:26','2025-01-10 15:37:56',NULL,'1',1,'2025-01-10 15:36:59','2025-01-12 09:04:28',NULL),(25,'b3e7e0ef1aca478fbdf9c34e4b326542',2,'Bhawna Pagaria','xapiv92054@kvegg.com','qV1VBv3mYjuoGlumEL2WZfLjYzI1YK9ojk7CUGZXLerNKzU0P0eC8kXbrN6blO',1,1,'9748530000','017165','$2a$10$P.f6v4A2hwimBt52AbQ8JOuXxZuuPDzld26zSrO9vo0H/LQx7kOmS',0,3,'','2025-01-10 17:26:41','2025-01-10 17:27:23',NULL,'1',1,'2025-01-10 17:26:21','2025-01-16 11:44:44','2025-01-16 11:44:44'),(26,'4c6d996bba529fa257113cb874d20ce3',2,'Srabani Das','srabanid938@gmail.com','2trECrtfFxGawhNyjKst3yU8DCBfRmRq6kfLTinbuYLfLWeGa0WgGteHFFHioS',1,1,'8240409220',NULL,'$2a$10$2eEhXRqcjub.VfrEzkGdTOUsNKOU4Zu7xISyr2ppXCgRtU6TCsFl6',0,1,'','2025-01-11 04:51:04','2025-01-11 04:56:01',NULL,'1',1,'2025-01-11 04:50:37','2025-01-11 04:56:01',NULL),(27,'a7956290604ea7aaed06928e254a3cda',2,'raju','test@test234.com',NULL,0,0,'8175051190','540549',NULL,0,1,'',NULL,NULL,NULL,'1',1,'2025-01-11 08:09:57','2025-01-11 08:09:57',NULL),(28,'8f2f0a3bb339d5d2760d9f1ecd432bd6',2,'Bhawna Pagaria','xacodej243@kvegg.com','Qp8sLtQiEbZz9FWIntnZ1FFfg9AAVihDEMcf8emd9S1l9X0SMCG4DNdbtOXLfF',1,1,'9007062002',NULL,'$2a$10$uD5.mz4tQudQFVtzqm1x0uaU82PsqB.zkDsAkpfSikTFnifU8d29m',0,4,'','2025-01-12 08:44:03','2025-01-12 08:44:24',NULL,'1',1,'2025-01-12 08:43:02','2025-01-12 08:50:36',NULL),(29,'408d380d52e7730b22195c6975a1c527',2,'BHAWNA PAGARIA','vabivi9857@pariag.com','bcfuvTToqb48NslgWQgTV2s7qkCb7k3wwweaHS8CXQsGZx6ESwEEIocgcajp3h',1,1,'9583637995',NULL,'$2a$10$h3uwZOvWtC9wSO.vocgW2.x9byXTkcNAAR/ouwlSydswPKGtHNWBK',0,1,'','2025-01-12 08:53:22','2025-01-12 08:53:45',NULL,'1',1,'2025-01-12 08:52:42','2025-01-12 08:53:45',NULL),(30,'9de716d13e5db0b87775eb0c98e50117',2,'BHAWNA PAGARIA','gipava5511@kvegg.com','GAQKfNyztMJXd0jfNxS3WEGoQuUIFxkXzuyLVyV08o6lTgl7flK3VgQkASPW4n',1,1,'9748530009',NULL,'$2a$10$PFYwZbywYseWeH6vOWv9hOFQF/.YwgImWcs1eGXI.FjHTdKl2NXwO',0,6,'','2025-01-12 09:51:53','2025-01-12 09:52:18',NULL,'1',1,'2025-01-12 09:51:37','2025-01-13 07:00:11',NULL),(31,'a470fd3cd0e3cddb05545824f31a9de0',2,'Tripurari Sharan','tssrivastava22@gmail.com','Bs1WWITPNyhoHBrMLASCUcGLSttLEFxffZJDNePF7QXaTuGI2iVsa7DtjpdONc',1,1,'9910225334',NULL,'$2a$10$kIZ/skA7d0oIMWafDjXyAe9gICtO5HzTfsBWs8ZJZ.8kNBXHM.Jdm',0,6,'','2025-01-14 11:48:02','2025-01-12 11:32:53',NULL,'1',1,'2025-01-12 11:31:18','2025-01-14 11:48:02',NULL),(32,'760386ba3ffc01b13c99ff87b4f1d1de',2,'Bhawna Pagaria ','vijahi8418@nalwan.com','CrH3Kt4mSpOk62TVArUdH1fUUiOCbcsf7phpviat5cuDMgk4rg979QzNUzRwXv',1,1,'9748530006',NULL,'$2a$10$LiZ7NNeXE0pljdcqXfs3f.wHtb7IHY3idehZiZ3PpKfZNTMS7ySDy',0,12,'','2025-01-12 12:44:38','2025-01-12 12:45:00',NULL,'1',1,'2025-01-12 12:44:26','2025-01-13 10:29:19',NULL),(33,'f9b68c557647c18228f01b48450e06e0',2,'Rajesh Pagaria ','savclrajesh@gmail.com','hGYRnDP8dB4myk4CoS7fXC7bb5NamgB7El6euuSU5To7OrdvddYaLavwHHJ9zJ',1,1,'9515226195',NULL,'$2a$10$HzkghsJKEwpzt18NMhiia.Uqkl6z0/WOJuSYkemUHbc1IyYx/1yl6',0,1,'','2025-01-12 13:17:08','2025-01-12 13:17:51',NULL,'1',1,'2025-01-12 13:16:13','2025-01-12 13:17:51',NULL),(34,'287cb9caa5695bd0bd6da79076f59a55',2,'abc','vendor@gmail.com','DKZ4Pug8CibW4oHuIPLDSCnbnDJPzRTevF0SshKJhS8ohHaMNxFbAmZxa4hP7b',0,0,'7080010300',NULL,'$2a$10$izlO5fAUxwVYGmBEaRjIOuyHB3repFP4Gf1T3w9cieSxuWjDRgT4O',0,1,'','2025-01-13 06:41:03',NULL,NULL,'1',1,'2025-01-13 06:40:39','2025-01-13 06:41:10',NULL),(35,'46c249a4cb1b420858a278edf4d9f3d5',2,'Prajna Dey Sarkar','prajnadeysarkar@gmail.com','TE44oxgSfdD3oZzpo4t4YbhQkZ38kRa3RL7YIjfzUx7487G5tvIE64DRJuSaKE',1,1,'9205083510',NULL,'$2a$10$ZnjMtnAjnmC5aUd964T2deTBE.QHAMkUb6W3ny.QSXtUrojwL6oM.',0,1,'','2025-01-13 16:47:05','2025-01-13 16:47:57',NULL,'1',1,'2025-01-13 16:46:42','2025-01-13 16:47:57',NULL),(36,'93f5877bf381c76c90bb3c8bfbc1751d',2,'Rajesh pagaria','yewei7147@kvegg.com','mkRnSBh7PycRt7k4LklGM3UcNEQztt843wJRqj4v9tjPPcDcyw1uvCvifPQnYp',0,0,'9502825965',NULL,'$2a$10$o.PGGonKn15H861239h0ie4HB6cTq2NtPhdz7Y7vWoHvlhHWF/BfW',0,1,'','2025-01-14 04:59:38',NULL,NULL,'1',1,'2025-01-14 04:59:11','2025-01-14 05:01:19',NULL),(37,'25ba264d87c6fc951fe2b4a8ad4511eb',2,'Rajesh pagaria','tohisot257@nalwan.com','XIvJy84pf2zoYNT3yrLRyKCyEo7DC5NqIFnIaVZWYdeTitPEEpNdQ6ujJhcEoA',0,0,'9502825965',NULL,'$2a$10$VcdX2E8jaBQes8XJQNJk.ei/3rOYjW/Q9xG3v9R3bXy39dj9dOew2',0,1,'','2025-01-14 05:19:17',NULL,NULL,'1',1,'2025-01-14 05:18:44','2025-01-14 05:19:32',NULL),(38,'b13ce4c39d87cc6e32ba77ecb932be57',2,'Bhawna Pagaria','jotaw95836@pariag.com','sqKox83SmlSR7aJC6UpLW3GVEmCW4WCw8xi0KfHGK37XJyiEkTRx6Hp2LoDnJI',1,1,'7667491408',NULL,'$2a$10$hmcDVUV3/bvkumgRSOX19O77eXltdr.ER.pSg..iVJJS2WyIFSxky',0,1,'','2025-01-14 06:43:46','2025-01-14 06:44:36',NULL,'1',1,'2025-01-14 06:43:25','2025-01-21 05:08:08','2025-01-21 05:08:08'),(39,'d60a4c3ae86ea28f5eecc382b62fa38e',2,'Rajesh pagaria','priyaojha276@gmail.com','WUCXbQZ8cHOFsBkbNd7ZzmQ0dSSNw0esP36gTbxYDF6pK41FxIRicZfuYSADRU',1,1,'9502825965',NULL,'$2a$10$WsQEkRmtCNmnLF38/mFFPe8..1x7qQxxCJejFVD3entxIzmDskN8q',0,1,'','2025-01-14 07:57:37','2025-01-14 07:59:04',NULL,'1',1,'2025-01-14 07:57:04','2025-01-14 07:59:04',NULL),(40,'e539453a80cd145ad822a63b624cfd62',2,'Bhawna Pagaria','kimofix691@fenxz.com','AdiOtW96jFTE6hdrxTe334EK0g8k1Q3eQO10IMCcaVM4x1vnABmxJQZ2nUyksR',1,1,'9007062001',NULL,'$2a$10$ah9f0Mpmkqs1PzPeqF2M4unwZGA0bE5ROfwEM2wdq3J20NEZSE/D2',0,1,'','2025-01-14 11:45:06','2025-01-14 11:45:22',NULL,'1',1,'2025-01-14 11:44:34','2025-01-21 05:08:03','2025-01-21 05:08:03'),(41,'c9667b098f1ac7588258138ae49e5ec5',2,'Vivek Kumar','vivek@gmail.com','srMBCctledyAU74z8gRGNAGKVDldrDW3OOOm2Jl0UyPGrhlUbzNxABjMCWDCIK',0,0,'9508540673',NULL,'$2a$10$GvAMOPM4eOKLdQRZIRjoq.8gEB4jta0eLXVYDqhKfCu/CHbH1zfha',0,1,'','2025-01-15 05:47:31',NULL,NULL,'1',1,'2025-01-15 05:46:00','2025-01-15 05:48:36',NULL),(42,'5d736cafd6ee3ad42947eb7198c6f9cf',2,'EQUITECH TRADING PRIVATE LIMITED','equitech2019@gmail.com','T5e7In469bOLdAdk6rX5bI93kc8KvfFXSJ63TbOYjrFxR1UGbfXpNkYYLf8Ecy',1,1,'8920425090',NULL,'$2a$10$JOQ60JWVjnleB.b92RL6uenV.hIcJqRU15kKclIEQ6vVy/WLBPZjS',0,6,'','2025-01-17 04:58:02','2025-01-17 04:59:35',NULL,'1',1,'2025-01-15 06:55:16','2025-01-17 04:59:42',NULL),(43,'10af1e9abdb2ea2aa69e18798f4488dd',2,'Darshan manglani','darshanmanglani00@gmail.com','e9jg8M9AkP2MAS7nAIzVIqrBxWriVF4WedS1SfhKBpIAEA4aYsWyZLKeKvli4k',0,0,'7976915556',NULL,'$2a$10$KUAAJC8iJsvHaHh2eDwijurFM.29NQY91KxKY8Wih9/sT1DLbbvAu',0,1,'','2025-01-15 07:34:40',NULL,NULL,'1',1,'2025-01-15 07:34:00','2025-01-15 07:35:42',NULL),(44,'fad701fe7e20f03f814acda12238188f',2,'tan','test12313123@gmail.com',NULL,0,0,'8175051190','074010',NULL,0,1,'',NULL,NULL,NULL,'1',1,'2025-01-15 11:26:13','2025-01-21 06:21:08','2025-01-21 06:21:08'),(45,'74f3cc8d633c8db5c9804e6aa7de2f30',2,'Sarita Agarwal ','saritaaagarwal1707@gmail.com','5qSWcHjmwjZmayI0LJkHRHt21AmOZjOV0rLcfUDiBmK1vor4wvPUknHMKnuRRa',1,1,'6309312497',NULL,'$2a$10$L1VVmiHAm7/SmS3YvwZT1.QfcUOIcmYxjJDJSCJ1gEjQPsqSMQNlK',0,1,'','2025-01-15 14:22:47','2025-01-15 14:32:39',NULL,'1',1,'2025-01-15 14:22:30','2025-01-16 04:13:22',NULL),(46,'66d9c70ce55b8f3c656e25359141dd4f',2,'Purvi Modi','purvi.indiazona@gmail.com','k3qZ9CW3Myv2Zduw6yCBHDugKh8tK7sbo7lOrKKsBzm0VIgLFH58MdM9IgpjBj',1,1,'9831607163',NULL,'$2a$10$GqtKexG6bXIFX4jPc9skp.5aWmJ1ksuceGDYeB8Cm7I5q/xSO4YKm',0,12,'','2025-01-16 09:44:02','2025-01-16 09:44:47',NULL,'1',1,'2025-01-16 09:43:21','2025-01-16 11:39:03',NULL),(47,'f29e03eec61ea74a7cea003a77338c92',2,'Hitika kedia ','hitikakedia16@gmail.com','WLVXFpzP1oMJHJj32pX3IciKbHNPlpQmSg43kfErdYRzIXDyIYQ24f0y6W7qfH',1,1,'8084590613',NULL,'$2a$10$NxPtszW265QbdGE5u.HSteOPwY2PuC4zw2VRFFFog03dvX0RxwbaC',0,12,'','2025-01-17 06:47:27','2025-01-17 06:51:10',NULL,'1',1,'2025-01-17 06:47:19','2025-01-18 11:53:42',NULL),(48,'6bc4159a3eb754972f9621ba899c7ced',2,'ROY PADIPPURAKKAL ','jlcashewsprivatelimited@gmail.com','znAWAFYZnvErDZh4pyuKpNk1rrIfUwo0KLTOGRDWRdmkjsxcM9wBIcmkoURyFk',0,0,'7206321286',NULL,'$2a$10$lxuNfGfoSKj2dGBYfro/HeQD4mmcyKzamV30C1SPz0kgcGky3EL/C',0,1,'','2025-01-19 12:31:45',NULL,NULL,'1',1,'2025-01-19 12:31:26','2025-01-19 12:32:06',NULL),(49,'fc147822367395f10315e58b6d65f876',2,'Mohammad Abubakar','abubakarmohammad093@gmail.com','bdldZXIVk6y7vgQeTOc9sXjGb8F23y7Qr1vueAMVgX8YDzA4Osz868PLMyyq9F',1,1,'9831567436',NULL,'$2a$10$pS17qXd.mYG/yUtYMmsxQuTBSVASOXMzFwSSM39sxW4SSS/XHqPoy',0,1,'','2025-01-20 06:07:13','2025-01-20 06:09:15',NULL,'1',1,'2025-01-20 06:06:45','2025-01-20 06:09:15',NULL),(50,'63338ca33ad2149edf9a777ff51991e0',2,'Kapil Mittal','kapilmittal@kalprishifoods.com','hsR4Dsjdv7JaCn6iamsQarw3rZSjXCzk8jcDcX8Gx598QJmVClSfTnEYMv8BS9',1,1,'7838440202',NULL,'$2a$10$CyG5pqcbreiyL3A92Wq.iel.J98mpiwFX2DAp9oFpVaMRPRnp/ZF6',0,1,'','2025-01-20 07:18:18','2025-01-20 07:15:40',NULL,'1',1,'2025-01-20 07:06:54','2025-01-20 07:18:18',NULL),(51,'98ecf348fd251a2612b32bbd2466a664',2,'Value plus retail Pvt Ltd','karan.agarwal@valueplusretail.com','w3SgDO9dR6qL14mHgbQT3oj6lDArMJ39fvmS3htzsM8s4FOqXsusVC3APIMtYQ',1,1,'9650285700',NULL,'$2a$10$Tp3q8uDg3qFaCp/8G/MM2.g3j6aDvvVZvJ3G2fgmRASmO8hDZbrEG',0,12,'','2025-01-20 10:40:26','2025-01-20 10:40:56',NULL,'1',1,'2025-01-20 10:40:06','2025-01-20 12:47:49',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
