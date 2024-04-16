/*
SQLyog Ultimate
MySQL - 8.0.32 : Database - hotel_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hotel_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `hotel_db`;

/*Table structure for table `affiche_info` */

DROP TABLE IF EXISTS `affiche_info`;

CREATE TABLE `affiche_info` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标题',
  `content` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '内容',
  `user_id` INT DEFAULT NULL COMMENT '用户id',
  `read` INT DEFAULT NULL COMMENT '已读状态',
  `author` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '作者',
  `time` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `affiche_info` */

LOCK TABLES `affiche_info` WRITE;

INSERT  INTO `affiche_info`(`id`,`title`,`content`,`user_id`,`read`,`author`,`time`) VALUES 
(183,'小黄鸭官方','欢迎使用小黄鸭app,稍后会为您发放1元的钱包充值兑换码',1,1,'小黄鸭官方','2024年3月27日10:20'),
(184,'小黄鸭官方','欢迎使用小黄鸭app,稍后会为您发放1元的钱包充值兑换码',2,1,'小黄鸭官方','2024年3月27日10:20'),
(185,'小黄鸭官方','欢迎使用小黄鸭app,稍后会为您发放1元的钱包充值兑换码',3,1,'小黄鸭官方','2024年3月27日10:20'),
(186,'小黄鸭官方','欢迎使用小黄鸭app,稍后会为您发放1元的钱包充值兑换码',4,1,'小黄鸭官方','2024年3月27日10:20'),
(187,'小黄鸭官方','欢迎使用小黄鸭app,稍后会为您发放1元的钱包充值兑换码',5,0,'小黄鸭官方','2024年3月27日10:20'),
(188,'小黄鸭官方','欢迎使用小黄鸭app,稍后会为您发放1元的钱包充值兑换码',6,0,'小黄鸭官方','2024年3月27日10:20'),
(189,'小黄鸭官方','欢迎使用小黄鸭app,稍后会为您发放1元的钱包充值兑换码',7,0,'小黄鸭官方','2024年3月27日10:20'),
(190,'小黄鸭官方','欢迎使用小黄鸭app,稍后会为您发放1元的钱包充值兑换码',8,0,'小黄鸭官方','2024年3月27日10:20'),
(191,'小黄鸭官方','欢迎使用小黄鸭app,稍后会为您发放1元的钱包充值兑换码',9,1,'小黄鸭官方','2024年3月27日10:20'),
(192,'小黄鸭官方','欢迎使用小黄鸭app,稍后会为您发放1元的钱包充值兑换码',10,0,'小黄鸭官方','2024年3月27日10:20'),
(193,'福利CDKEY','您的CDKEY是 WHJa-tqKG-yxx6-kZca-KF5SD, 请注意查收！',1,1,'小黄鸭官方','2024年3月27日10:20'),
(194,'福利CDKEY','您的CDKEY是 6qM6-uUOL-cSKC-v2Av-Uda3U, 请注意查收！',2,1,'小黄鸭官方','2024年3月27日10:20'),
(195,'福利CDKEY','您的CDKEY是 Qedb-ELzl-A6QU-vjH2-am84G, 请注意查收！',3,1,'小黄鸭官方','2024年3月27日10:20'),
(196,'福利CDKEY','您的CDKEY是 Uw0L-Habl-9Yfp-7uWs-I9ugv, 请注意查收！',4,1,'小黄鸭官方','2024年3月27日10:20'),
(197,'福利CDKEY','您的CDKEY是 LSQu-djRv-krB4-qMNL-zPGPJ, 请注意查收！',5,0,'小黄鸭官方','2024年3月27日10:20'),
(198,'福利CDKEY','您的CDKEY是 KBPQ-df28-pIO0-S99R-dSONg, 请注意查收！',6,0,'小黄鸭官方','2024年3月27日10:20'),
(199,'福利CDKEY','您的CDKEY是 awYf-BCOb-H9Jj-gxdR-Qx9ii, 请注意查收！',7,0,'小黄鸭官方','2024年3月27日10:20'),
(200,'福利CDKEY','您的CDKEY是 26zc-9ehh-5Pvl-xeC1-KEKF9, 请注意查收！',8,0,'小黄鸭官方','2024年3月27日10:20'),
(201,'福利CDKEY','您的CDKEY是 2Rci-51Q9-7yTy-3OVW-NqfoH, 请注意查收！',9,1,'小黄鸭官方','2024年3月27日10:20'),
(202,'福利CDKEY','您的CDKEY是 xup4-a80p-wS8u-O8Dy-uJqAp, 请注意查收！',10,0,'小黄鸭官方','2024年3月27日10:20'),
(203,'至用户的一封信','欢迎使用小黄鸭app,稍后会为您发放1元的钱包充值兑换码',1,1,'小黄鸭官方','2024年3月27日10:20'),
(204,'至用户的一封信','欢迎使用小黄鸭app,稍后会为您发放1元的钱包充值兑换码',2,1,'小黄鸭官方','2024年3月27日10:20'),
(205,'至用户的一封信','欢迎使用小黄鸭app,稍后会为您发放1元的钱包充值兑换码',3,1,'小黄鸭官方','2024年3月27日10:20'),
(206,'至用户的一封信','欢迎使用小黄鸭app,稍后会为您发放1元的钱包充值兑换码',4,1,'小黄鸭官方','2024年3月27日10:20'),
(207,'至用户的一封信','欢迎使用小黄鸭app,稍后会为您发放1元的钱包充值兑换码',5,1,'小黄鸭官方','2024年3月27日10:20'),
(208,'至用户的一封信','欢迎使用小黄鸭app,稍后会为您发放1元的钱包充值兑换码',6,0,'小黄鸭官方','2024年3月27日10:20'),
(209,'至用户的一封信','欢迎使用小黄鸭app,稍后会为您发放1元的钱包充值兑换码',7,0,'小黄鸭官方','2024年3月27日10:20'),
(210,'至用户的一封信','欢迎使用小黄鸭app,稍后会为您发放1元的钱包充值兑换码',8,1,'小黄鸭官方','2024年3月27日10:20'),
(211,'至用户的一封信','欢迎使用小黄鸭app,稍后会为您发放1元的钱包充值兑换码',9,1,'小黄鸭官方','2024年3月27日10:20'),
(212,'至用户的一封信','欢迎使用小黄鸭app,稍后会为您发放1元的钱包充值兑换码',10,0,'小黄鸭官方','2024年3月27日10:20'),
(213,'福利CDKEY','您的CDKEY是 zaa9-sDj5-7Vby-37En-tokUg, 请注意查收！',1,1,'小黄鸭官方','2024年3月27日10:20'),
(214,'福利CDKEY','您的CDKEY是 4YXR-JKcN-LKPF-yKfT-EdfBm, 请注意查收！',2,1,'小黄鸭官方','2024年3月27日10:20'),
(215,'福利CDKEY','您的CDKEY是 mEXd-uSO9-6VO4-A8gS-popoC, 请注意查收！',3,1,'小黄鸭官方','2024年3月27日10:20'),
(216,'福利CDKEY','您的CDKEY是 VjRk-RerL-75OD-GVYy-M08rV, 请注意查收！',4,1,'小黄鸭官方','2024年3月27日10:20'),
(217,'福利CDKEY','您的CDKEY是 PfzH-wfIZ-Zw0o-Xp16-nZTFm, 请注意查收！',5,1,'小黄鸭官方','2024年3月27日10:20'),
(218,'福利CDKEY','您的CDKEY是 bNvP-6zOF-XVDT-JeRn-Qu3r9, 请注意查收！',6,0,'小黄鸭官方','2024年3月27日10:20'),
(219,'福利CDKEY','您的CDKEY是 rAr0-dQ2x-GmDo-owug-8uEWx, 请注意查收！',7,0,'小黄鸭官方','2024年3月27日10:20'),
(220,'福利CDKEY','您的CDKEY是 VBFC-56nT-9llt-0As9-eKqaz, 请注意查收！',8,1,'小黄鸭官方','2024年3月27日10:20'),
(221,'福利CDKEY','您的CDKEY是 AH7a-gknP-nosW-yMeA-hkvbW, 请注意查收！',9,1,'小黄鸭官方','2024年3月27日10:20'),
(222,'福利CDKEY','您的CDKEY是 jlwN-fMLs-b34k-0A4J-e9EOt, 请注意查收！',10,0,'小黄鸭官方','2024年3月27日10:20'),
(223,'欢迎使用 小黄鸭 · 酒店','欢迎使用小黄鸭app,稍后会为您发放100元的钱包充值兑换码',1,1,'小黄鸭官方','2024年3月27日11:48'),
(224,'欢迎使用 小黄鸭 · 酒店','欢迎使用小黄鸭app,稍后会为您发放100元的钱包充值兑换码',2,1,'小黄鸭官方','2024年3月27日11:48'),
(225,'欢迎使用 小黄鸭 · 酒店','欢迎使用小黄鸭app,稍后会为您发放100元的钱包充值兑换码',3,1,'小黄鸭官方','2024年3月27日11:48'),
(226,'欢迎使用 小黄鸭 · 酒店','欢迎使用小黄鸭app,稍后会为您发放100元的钱包充值兑换码',4,1,'小黄鸭官方','2024年3月27日11:48'),
(227,'欢迎使用 小黄鸭 · 酒店','欢迎使用小黄鸭app,稍后会为您发放100元的钱包充值兑换码',5,1,'小黄鸭官方','2024年3月27日11:48'),
(228,'欢迎使用 小黄鸭 · 酒店','欢迎使用小黄鸭app,稍后会为您发放100元的钱包充值兑换码',6,0,'小黄鸭官方','2024年3月27日11:48'),
(229,'欢迎使用 小黄鸭 · 酒店','欢迎使用小黄鸭app,稍后会为您发放100元的钱包充值兑换码',7,0,'小黄鸭官方','2024年3月27日11:48'),
(230,'欢迎使用 小黄鸭 · 酒店','欢迎使用小黄鸭app,稍后会为您发放100元的钱包充值兑换码',8,1,'小黄鸭官方','2024年3月27日11:48'),
(231,'欢迎使用 小黄鸭 · 酒店','欢迎使用小黄鸭app,稍后会为您发放100元的钱包充值兑换码',9,1,'小黄鸭官方','2024年3月27日11:48'),
(232,'欢迎使用 小黄鸭 · 酒店','欢迎使用小黄鸭app,稍后会为您发放100元的钱包充值兑换码',10,0,'小黄鸭官方','2024年3月27日11:48'),
(233,'新用户注册福利CDKEY','您的CDKEY是 MvHZ-GThD-HVbW-RIvC-PwScC, 请注意查收！',1,1,'小黄鸭官方','2024年3月27日11:48'),
(234,'新用户注册福利CDKEY','您的CDKEY是 IWo9-O5uv-wIzg-KQhL-LZDZv, 请注意查收！',2,1,'小黄鸭官方','2024年3月27日11:48'),
(235,'新用户注册福利CDKEY','您的CDKEY是 09Im-1Y8Z-D9Hv-cCqj-aB0Og, 请注意查收！',3,1,'小黄鸭官方','2024年3月27日11:48'),
(236,'新用户注册福利CDKEY','您的CDKEY是 b6ri-QOll-XTzR-I5Ja-Q90VI, 请注意查收！',4,1,'小黄鸭官方','2024年3月27日11:48'),
(237,'新用户注册福利CDKEY','您的CDKEY是 ndf6-RWD1-qS2H-lN3m-Za2B4, 请注意查收！',5,1,'小黄鸭官方','2024年3月27日11:48'),
(238,'新用户注册福利CDKEY','您的CDKEY是 w3k1-mIey-4DRN-2FZO-pYagW, 请注意查收！',6,0,'小黄鸭官方','2024年3月27日11:48'),
(239,'新用户注册福利CDKEY','您的CDKEY是 vkkY-WXxR-3VU9-X3tp-xQgsI, 请注意查收！',7,0,'小黄鸭官方','2024年3月27日11:48'),
(240,'新用户注册福利CDKEY','您的CDKEY是 4LsG-53Xg-teV8-jxXo-5sJoA, 请注意查收！',8,1,'小黄鸭官方','2024年3月27日11:48'),
(241,'新用户注册福利CDKEY','您的CDKEY是 0w72-gf7r-3j3i-NJ12-2AeUF, 请注意查收！',9,1,'小黄鸭官方','2024年3月27日11:48'),
(242,'新用户注册福利CDKEY','您的CDKEY是 rTAh-B1uD-IUWU-ddq0-ESWuy, 请注意查收！',10,1,'小黄鸭官方','2024年3月27日11:48'),
(243,'欢迎使用 小黄鸭 · 酒店','欢迎使用小黄鸭app,稍后会为您发放10元的钱包充值兑换码',1,1,'小黄鸭官方','2024年3月27日11:48'),
(244,'欢迎使用 小黄鸭 · 酒店','欢迎使用小黄鸭app,稍后会为您发放10元的钱包充值兑换码',2,0,'小黄鸭官方','2024年3月27日11:48'),
(245,'欢迎使用 小黄鸭 · 酒店','欢迎使用小黄鸭app,稍后会为您发放10元的钱包充值兑换码',3,0,'小黄鸭官方','2024年3月27日11:48'),
(246,'欢迎使用 小黄鸭 · 酒店','欢迎使用小黄鸭app,稍后会为您发放10元的钱包充值兑换码',4,0,'小黄鸭官方','2024年3月27日11:48'),
(247,'欢迎使用 小黄鸭 · 酒店','欢迎使用小黄鸭app,稍后会为您发放10元的钱包充值兑换码',5,0,'小黄鸭官方','2024年3月27日11:48'),
(248,'欢迎使用 小黄鸭 · 酒店','欢迎使用小黄鸭app,稍后会为您发放10元的钱包充值兑换码',6,0,'小黄鸭官方','2024年3月27日11:48'),
(249,'欢迎使用 小黄鸭 · 酒店','欢迎使用小黄鸭app,稍后会为您发放10元的钱包充值兑换码',7,0,'小黄鸭官方','2024年3月27日11:48'),
(250,'欢迎使用 小黄鸭 · 酒店','欢迎使用小黄鸭app,稍后会为您发放10元的钱包充值兑换码',8,0,'小黄鸭官方','2024年3月27日11:48'),
(251,'欢迎使用 小黄鸭 · 酒店','欢迎使用小黄鸭app,稍后会为您发放10元的钱包充值兑换码',9,0,'小黄鸭官方','2024年3月27日11:48'),
(252,'欢迎使用 小黄鸭 · 酒店','欢迎使用小黄鸭app,稍后会为您发放10元的钱包充值兑换码',10,0,'小黄鸭官方','2024年3月27日11:48'),
(253,'欢迎使用 小黄鸭 · 酒店','欢迎使用小黄鸭app,稍后会为您发放10元的钱包充值兑换码',51,0,'小黄鸭官方','2024年3月27日11:48'),
(254,'欢迎使用 小黄鸭 · 酒店','欢迎使用小黄鸭app,稍后会为您发放10元的钱包充值兑换码',52,0,'小黄鸭官方','2024年3月27日11:48'),
(255,'欢迎使用 小黄鸭 · 酒店','欢迎使用小黄鸭app,稍后会为您发放10元的钱包充值兑换码',53,0,'小黄鸭官方','2024年3月27日11:48'),
(256,'欢迎使用 小黄鸭 · 酒店','欢迎使用小黄鸭app,稍后会为您发放10元的钱包充值兑换码',54,0,'小黄鸭官方','2024年3月27日11:48'),
(257,'用户注册福利CDKEY','您的CDKEY是 gRDj-9kaX-QWta-pmfB-KlNwL, 请注意查收！',1,1,'小黄鸭官方','2024年3月27日11:48'),
(258,'用户注册福利CDKEY','您的CDKEY是 YDwj-RYoz-ZNUa-9fdN-hmHXm, 请注意查收！',2,0,'小黄鸭官方','2024年3月27日11:48'),
(259,'用户注册福利CDKEY','您的CDKEY是 1Qbo-Dmry-7KPz-qKdQ-V2tiU, 请注意查收！',3,0,'小黄鸭官方','2024年3月27日11:48'),
(260,'用户注册福利CDKEY','您的CDKEY是 5BAN-DYKR-orWa-3Xfs-Ujl6J, 请注意查收！',4,0,'小黄鸭官方','2024年3月27日11:48'),
(261,'用户注册福利CDKEY','您的CDKEY是 dN3C-Xucw-ecab-uf6U-vef2p, 请注意查收！',5,0,'小黄鸭官方','2024年3月27日11:48'),
(262,'用户注册福利CDKEY','您的CDKEY是 E28N-OjGe-FnRf-pZaO-Tb3o9, 请注意查收！',6,0,'小黄鸭官方','2024年3月27日11:48'),
(263,'用户注册福利CDKEY','您的CDKEY是 mNyU-M7PJ-uere-59Nl-YKjgj, 请注意查收！',7,0,'小黄鸭官方','2024年3月27日11:48'),
(264,'用户注册福利CDKEY','您的CDKEY是 NLdb-BR3K-MqxD-tZVa-79mFc, 请注意查收！',8,0,'小黄鸭官方','2024年3月27日11:48'),
(265,'用户注册福利CDKEY','您的CDKEY是 X5Zz-Tc2Y-C0uH-OYCA-7Qc7Z, 请注意查收！',9,0,'小黄鸭官方','2024年3月27日11:48'),
(266,'用户注册福利CDKEY','您的CDKEY是 7ZQ5-r9Kf-M3ab-SHfr-TIdtz, 请注意查收！',10,0,'小黄鸭官方','2024年3月27日11:48'),
(267,'用户注册福利CDKEY','您的CDKEY是 dhk8-D6He-knkS-gRB6-Ftfk3, 请注意查收！',51,0,'小黄鸭官方','2024年3月27日11:48'),
(268,'用户注册福利CDKEY','您的CDKEY是 N1D4-AaQ5-d4LJ-UyN0-aeLFG, 请注意查收！',52,0,'小黄鸭官方','2024年3月27日11:48'),
(269,'用户注册福利CDKEY','您的CDKEY是 7elE-a96l-6lWx-i9ek-hf5rV, 请注意查收！',53,0,'小黄鸭官方','2024年3月27日11:48'),
(270,'用户注册福利CDKEY','您的CDKEY是 qGSU-y30P-WZE9-RMPp-FsDLw, 请注意查收！',54,0,'小黄鸭官方','2024年3月27日11:48'),
(271,'欢迎使用 小黄鸭 · 酒店','为了感谢您的使用,稍后会为您发放1元的钱包充值兑换码',1,1,'小黄鸭官方','2024年3月28日18.37'),
(272,'欢迎使用 小黄鸭 · 酒店','为了感谢您的使用,稍后会为您发放1元的钱包充值兑换码',2,0,'小黄鸭官方','2024年3月28日18.37'),
(273,'欢迎使用 小黄鸭 · 酒店','为了感谢您的使用,稍后会为您发放1元的钱包充值兑换码',3,0,'小黄鸭官方','2024年3月28日18.37'),
(274,'欢迎使用 小黄鸭 · 酒店','为了感谢您的使用,稍后会为您发放1元的钱包充值兑换码',4,0,'小黄鸭官方','2024年3月28日18.37'),
(275,'欢迎使用 小黄鸭 · 酒店','为了感谢您的使用,稍后会为您发放1元的钱包充值兑换码',5,0,'小黄鸭官方','2024年3月28日18.37'),
(276,'欢迎使用 小黄鸭 · 酒店','为了感谢您的使用,稍后会为您发放1元的钱包充值兑换码',6,0,'小黄鸭官方','2024年3月28日18.37'),
(277,'欢迎使用 小黄鸭 · 酒店','为了感谢您的使用,稍后会为您发放1元的钱包充值兑换码',7,0,'小黄鸭官方','2024年3月28日18.37'),
(278,'欢迎使用 小黄鸭 · 酒店','为了感谢您的使用,稍后会为您发放1元的钱包充值兑换码',8,0,'小黄鸭官方','2024年3月28日18.37'),
(279,'欢迎使用 小黄鸭 · 酒店','为了感谢您的使用,稍后会为您发放1元的钱包充值兑换码',9,0,'小黄鸭官方','2024年3月28日18.37'),
(280,'欢迎使用 小黄鸭 · 酒店','为了感谢您的使用,稍后会为您发放1元的钱包充值兑换码',10,0,'小黄鸭官方','2024年3月28日18.37'),
(281,'欢迎使用 小黄鸭 · 酒店','为了感谢您的使用,稍后会为您发放1元的钱包充值兑换码',51,0,'小黄鸭官方','2024年3月28日18.37'),
(282,'欢迎使用 小黄鸭 · 酒店','为了感谢您的使用,稍后会为您发放1元的钱包充值兑换码',52,0,'小黄鸭官方','2024年3月28日18.37'),
(283,'欢迎使用 小黄鸭 · 酒店','为了感谢您的使用,稍后会为您发放1元的钱包充值兑换码',53,0,'小黄鸭官方','2024年3月28日18.37'),
(284,'欢迎使用 小黄鸭 · 酒店','为了感谢您的使用,稍后会为您发放1元的钱包充值兑换码',54,0,'小黄鸭官方','2024年3月28日18.37'),
(285,'欢迎使用 小黄鸭 · 酒店','为了感谢您的使用,稍后会为您发放1元的钱包充值兑换码',55,0,'小黄鸭官方','2024年3月28日18.37'),
(286,'欢迎使用 小黄鸭 · 酒店','为了感谢您的使用,稍后会为您发放1元的钱包充值兑换码',56,0,'小黄鸭官方','2024年3月28日18.37'),
(287,'新用户注册福利CDKEY','您的CDKEY是 NFgk-lyhY-KWsW-hdS0-u9i69, 请注意查收！',1,1,'小黄鸭官方','2024年3月27日11:48'),
(288,'新用户注册福利CDKEY','您的CDKEY是 ymgF-XumQ-eAI5-uJuN-Fx3Ge, 请注意查收！',2,0,'小黄鸭官方','2024年3月27日11:48'),
(289,'新用户注册福利CDKEY','您的CDKEY是 iE6Q-vbPk-n6mU-nmD7-8kBoC, 请注意查收！',3,0,'小黄鸭官方','2024年3月27日11:48'),
(290,'新用户注册福利CDKEY','您的CDKEY是 R4eM-dIOQ-gzwg-dapT-CmBD0, 请注意查收！',4,0,'小黄鸭官方','2024年3月27日11:48'),
(291,'新用户注册福利CDKEY','您的CDKEY是 bUU7-wplF-pGy7-W5eS-rDNpC, 请注意查收！',5,0,'小黄鸭官方','2024年3月27日11:48'),
(292,'新用户注册福利CDKEY','您的CDKEY是 rApO-k79H-2TFH-nRkM-B55bk, 请注意查收！',6,0,'小黄鸭官方','2024年3月27日11:48'),
(293,'新用户注册福利CDKEY','您的CDKEY是 zdB0-d4H1-4MJn-FKBu-rsK69, 请注意查收！',7,0,'小黄鸭官方','2024年3月27日11:48'),
(294,'新用户注册福利CDKEY','您的CDKEY是 tRlC-ZA4X-9J4I-WEX4-l8FpI, 请注意查收！',8,0,'小黄鸭官方','2024年3月27日11:48'),
(295,'新用户注册福利CDKEY','您的CDKEY是 GJe4-VyYd-ZL1x-iXFZ-otaMJ, 请注意查收！',9,0,'小黄鸭官方','2024年3月27日11:48'),
(296,'新用户注册福利CDKEY','您的CDKEY是 EYjl-1DKX-3adA-QRoc-QfELN, 请注意查收！',10,0,'小黄鸭官方','2024年3月27日11:48'),
(297,'新用户注册福利CDKEY','您的CDKEY是 kavT-Ex4N-nP3a-spL5-FXupo, 请注意查收！',51,0,'小黄鸭官方','2024年3月27日11:48'),
(298,'新用户注册福利CDKEY','您的CDKEY是 ItFd-iHGS-Rmve-09Rx-TxKcI, 请注意查收！',52,0,'小黄鸭官方','2024年3月27日11:48'),
(299,'新用户注册福利CDKEY','您的CDKEY是 suLo-Oaqd-i1UC-cW6c-0jNKA, 请注意查收！',53,0,'小黄鸭官方','2024年3月27日11:48'),
(300,'新用户注册福利CDKEY','您的CDKEY是 VlPy-ZYt3-lXAh-KqBM-L1DdU, 请注意查收！',54,0,'小黄鸭官方','2024年3月27日11:48'),
(301,'新用户注册福利CDKEY','您的CDKEY是 gswh-GLtb-Ux1a-tS8M-BusKJ, 请注意查收！',55,0,'小黄鸭官方','2024年3月27日11:48'),
(302,'新用户注册福利CDKEY','您的CDKEY是 QSe0-coBP-aCRh-savz-IDy6I, 请注意查收！',56,0,'小黄鸭官方','2024年3月27日11:48');

UNLOCK TABLES;

/*Table structure for table `article_info` */

DROP TABLE IF EXISTS `article_info`;

CREATE TABLE `article_info` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标题',
  `content` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '内容',
  `user_id` INT NOT NULL COMMENT '所属用户',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `article_info` */

LOCK TABLES `article_info` WRITE;

INSERT  INTO `article_info`(`id`,`title`,`content`,`user_id`) VALUES 
(1,'隐私政策','   <h1>隐私政策</h1>\r\n    <div style=\"text-align: right;\">更新日期：<strong>2024/3/17</strong></div>\r\n    <div style=\"text-align: right;\">生效日期：<strong>2024/3/17</strong></div>\r\n    <h2>导言</h2>\r\n    <p>\r\n        <strong>小黄鸭 · 酒店</strong> 是一款由 <strong>Jun</strong> （以下简称“我们”）提供的产品。\r\n        您在使用我们的服务时，我们可能会收集和使用您的相关信息。我们希望通过本《隐私政策》向您说明，在使用我们的服务时，我们如何收集、使用、储存和分享这些信息，以及我们为您提供的访问、更新、控制和保护这些信息的方式。\r\n        本《隐私政策》与您所使用的 <strong>小黄鸭 · 酒店</strong>\r\n        服务息息相关，希望您仔细阅读，在需要时，按照本《隐私政策》的指引，作出您认为适当的选择。本《隐私政策》中涉及的相关技术词汇，我们尽量以简明扼要的表述，并提供进一步说明的链接，以便您的理解。\r\n    </p>\r\n    <p><strong>您使用或继续使用我们的服务，即意味着同意我们按照本《隐私政策》收集、使用、储存和分享您的相关信息。</strong></p>\r\n    <p>如对本《隐私政策》或相关事宜有任何问题，请通过 <strong>3010977181@qq.com</strong> 与我们联系。</p>\r\n\r\n    <h2>1. 我们收集的信息</h2>\r\n    <p>我们或我们的第三方合作伙伴提供服务时，可能会收集、储存和使用下列与您有关的信息。如果您不提供相关信息，可能无法注册成为我们的用户或无法享受我们提供的某些服务，或者无法达到相关服务拟达到的效果。</p>\r\n\r\n    <ul>\r\n        <li><strong>位置信息</strong>，指您开启设备定位功能并使用我们基于位置提供的相关服务时，收集的有关您位置的信息，包括：<ul>\r\n                <li>您通过具有定位功能的移动设备使用我们的服务时，通过GPS或WiFi等方式收集的您的地理位置信息；</li>\r\n                <li>您可以通过关闭定位功能，停止对您的地理位置信息的收集。</li>\r\n            </ul>\r\n        </li>\r\n        <li><strong>个人信息</strong>，您在注册账户或使用我们的服务时，向我们提供的相关个人信息，例如电话号码、电子邮件等。</li>\r\n        <li><strong>日志信息</strong>，指您使用我们的服务时，系统可能通过cookies、标识符及相关技术收集的信息，包括您的<strong>设备信息</strong>、<strong>浏览信息</strong>、<strong>点击信息</strong>，并将该等信息储存为日志信息，为您提供个性化的用户体验、保障服务安全。您可以通过浏览器设置拒绝或管理cookie、标识符或相关技术的使用。\r\n        </li>\r\n    </ul>\r\n\r\n\r\n\r\n\r\n    </ul>\r\n\r\n    <h2>2. 信息的存储</h2>\r\n    <strong>2.1 信息存储的方式和期限</strong>\r\n    <ul>\r\n        <li>我们会通过安全的方式存储您的信息，包括本地存储（例如利用APP进行数据缓存）、数据库和服务器日志。</li>\r\n        <li>一般情况下，我们只会在为实现服务目的所必需的时间内或法律法规规定的条件下存储您的个人信息。</li>\r\n    </ul>\r\n\r\n    <strong>2.2 信息存储的地域</strong>\r\n    <ul>\r\n        <li>我们会按照法律法规规定，将境内收集的用户个人信息存储于中国境内。</li>\r\n        <li>目前我们不会跨境传输或存储您的个人信息。将来如需跨境传输或存储的，我们会向您告知信息出境的目的、接收方、安全保证措施和安全风险，并征得您的同意。</li>\r\n    </ul>\r\n\r\n    <strong>2.3 产品或服务停止运营时的通知</strong>\r\n    <ul>\r\n        <li>当我们的产品或服务发生停止运营的情况时，我们将以推送通知、公告等形式通知您，并在合理期限内删除您的个人信息或进行匿名化处理，法律法规另有规定的除外。</li>\r\n    </ul>\r\n\r\n    <h2>3. 信息安全</h2>\r\n    <p>\r\n        我们使用各种安全技术和程序，以防信息的丢失、不当使用、未经授权阅览或披露。例如，在某些服务中，我们将利用加密技术（例如SSL）来保护您提供的个人信息。但请您理解，由于技术的限制以及可能存在的各种恶意手段，在互联网行业，即便竭尽所能加强安全措施，也不可能始终保证信息百分之百的安全。您需要了解，您接入我们的服务所用的系统和通讯网络，有可能因我们可控范围外的因素而出现问题。\r\n    </p>\r\n\r\n    <h2>4. 我们如何使用信息</h2>\r\n    <p>我们可能将在向您提供服务的过程之中所收集的信息用作下列用途：</p>\r\n    <ul>\r\n        <li>向您提供服务；</li>\r\n        <li>在我们提供服务时，用于身份验证、客户服务、安全防范、诈骗监测、存档和备份用途，确保我们向您提供的产品和服务的安全性；</li>\r\n        <li>帮助我们设计新服务，改善我们现有服务；</li>\r\n        <li>使我们更加了解您如何接入和使用我们的服务，从而针对性地回应您的个性化需求，例如语言设定、位置设定、个性化的帮助服务和指示，或对您和其他用户作出其他方面的回应；</li>\r\n        <li>向您提供与您更加相关的广告以替代普遍投放的广告；</li>\r\n        <li>评估我们服务中的广告和其他促销及推广活动的效果，并加以改善；</li>\r\n        <li>软件认证或管理软件升级；</li>\r\n        <li>让您参与有关我们产品和服务的调查。</li>\r\n    </ul>\r\n\r\n    <h2>5. 信息共享</h2>\r\n    <p>\r\n        目前，我们不会主动共享或转让您的个人信息至第三方，如存在其他共享或转让您的个人信息或您需要我们将您的个人信息共享或转让至第三方情形时，我们会直接或确认第三方征得您对上述行为的明示同意。\r\n    </p>\r\n    <p>\r\n        为了投放广告，评估、优化广告投放效果等目的，我们需要向广告主及其代理商等第三方合作伙伴共享您的部分数据，要求其严格遵守我们关于数据隐私保护的措施与要求，包括但不限于根据数据保护协议、承诺书及相关数据处理政策进行处理，避免识别出个人身份，保障隐私安全。\r\n    </p>\r\n    <p>\r\n        我们不会向合作伙伴分享可用于识别您个人身份的信息（例如您的姓名或电子邮件地址），除非您明确授权。\r\n    </p>\r\n    <p>\r\n        我们不会对外公开披露所收集的个人信息，如必须公开披露时，我们会向您告知此次公开披露的目的、披露信息的类型及可能涉及的敏感信息，并征得您的明示同意。\r\n    </p>\r\n    <p>\r\n        随着我们业务的持续发展，我们有可能进行合并、收购、资产转让等交易，我们将告知您相关情形，按照法律法规及不低于本《隐私政策》所要求的标准继续保护或要求新的控制者继续保护您的个人信息。\r\n    </p>\r\n    <p>\r\n        另外，根据相关法律法规及国家标准，以下情形中，我们可能会共享、转让、公开披露个人信息无需事先征得您的授权同意：\r\n    </p>\r\n    <ul>\r\n        <li>与国家安全、国防安全直接相关的；</li>\r\n        <li>与公共安全、公共卫生、重大公共利益直接相关的；</li>\r\n        <li>犯罪侦查、起诉、审判和判决执行等直接相关的；</li>\r\n        <li>出于维护个人信息主体或其他个人的生命、财产等重大合法权益但又很难得到本人同意的；</li>\r\n        <li>个人信息主体自行向社会公众公开个人信息的；</li>\r\n        <li>从合法公开披露的信息中收集个人信息的，如合法的新闻报道、政府信息公开等渠道。</li>\r\n    </ul>\r\n\r\n    <h2>6. 您的权利</h2>\r\n    <p>\r\n        在您使用我们的服务期间，我们可能会视产品具体情况为您提供相应的操作设置，以便您可以查询、删除、更正或撤回您的相关个人信息，您可参考相应的具体指引进行操作。此外，我们还设置了投诉举报渠道，您的意见将会得到及时的处理。如果您无法通过上述途径和方式行使您的个人信息主体权利，您可以通过本《隐私政策》中提供的联系方式提出您的请求，我们会按照法律法规的规定予以反馈。\r\n    </p>\r\n    <p>当您决定不再使用我们的产品或服务时，可以申请注销账户。注销账户后，除法律法规另有规定外，我们将删除或匿名化处理您的个人信息。</p>\r\n\r\n    <h2>7. 变更</h2>\r\n    <p>\r\n        我们可能适时修订本《隐私政策》的条款。当变更发生时，我们会在版本更新时向您提示新的《隐私政策》，并向您说明生效日期。请您仔细阅读变更后的《隐私政策》内容，<strong>若您继续使用我们的服务，即表示您同意我们按照更新后的《隐私政策》处理您的个人信息。</strong>\r\n    </p>\r\n\r\n    <h2>8. 未成年人保护</h2>\r\n    <p>\r\n        我们鼓励父母或监护人指导未满十八岁的未成年人使用我们的服务。我们建议未成年人鼓励他们的父母或监护人阅读本《隐私政策》，并建议未成年人在提交的个人信息之前寻求父母或监护人的同意和指导。\r\n    </p>',1),
(2,'用户协议','   <h1>用户协议</h1>\r\n    <p>\r\n        <strong>Jun</strong>（以下简称“我们”）依据本协议为用户（以下简称“你”）提供<strong>小黄鸭 · 酒店</strong>服务。本协议对你和我们均具有法律约束力。\r\n    </p>\r\n    <div style=\"margin: 20rpx 0;\">\r\n        <h4>一、本服务的功能</h4>\r\n        <p>你可以使用本服务订购酒店。</p>\r\n    </div>\r\n    <div style=\"margin: 20rpx 0;\">\r\n        <h4>二、责任范围及限制</h4>\r\n        <p>你使用本服务得到的结果仅供参考，实际情况以官方为准。</p>\r\n    </div>\r\n    <div style=\"margin: 20rpx 0;\">\r\n        <h4>三、隐私保护</h4>\r\n        <p>我们重视对你隐私的保护，你的个人隐私信息将根据《隐私政策》受到保护与规范，详情请参阅《隐私政策》。</p>\r\n    </div>\r\n    <div style=\"margin: 20rpx 0;\">\r\n        <h4>四、其他条款</h4>\r\n        <p>4.1 本协议所有条款的标题仅为阅读方便，本身并无实际涵义，不能作为本协议涵义解释的依据。</p>\r\n        <p>4.2 本协议条款无论因何种原因部分无效或不可执行，其余条款仍有效，对双方具有约束力。</p>\r\n    </div>',1);

UNLOCK TABLES;

/*Table structure for table `cdkey_info` */

DROP TABLE IF EXISTS `cdkey_info`;

CREATE TABLE `cdkey_info` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cdkey` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '兑换号码',
  `isuse` INT NOT NULL DEFAULT '0' COMMENT '是否可用',
  `price` DECIMAL(10,0) DEFAULT NULL COMMENT '充值金额',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `cdkey_info` */

LOCK TABLES `cdkey_info` WRITE;

INSERT  INTO `cdkey_info`(`id`,`cdkey`,`isuse`,`price`) VALUES 
(78,'Ps0w-O0jd-EEiQ-ybSV-xKoox',0,1),
(79,'jQ6B-R3dV-w61Z-OBjm-rVbkm',0,1),
(80,'GR6m-1ldu-Dv4Y-l0HH-1AZnA',0,1),
(81,'B7on-BHvk-ueUD-1gi1-7iz1C',0,1),
(82,'68JH-f1yQ-bZMo-GRLl-LTRpv',0,1),
(83,'oO0H-5zxo-Qv5f-US97-eAuv8',0,1),
(84,'oC0V-uiSf-XMjt-61cP-drU0l',0,1),
(85,'69w3-c0L8-KKXz-uO4Q-0mvSp',0,1),
(86,'uh9d-CkA7-DA1U-dfqG-RFaAA',0,1),
(87,'Q3k7-ppkg-eacf-NVGs-DUIBf',0,1),
(88,'JPL4-pE8C-tTgd-5CBz-nrZWh',0,1),
(89,'9zm5-HoHt-JyRP-890h-UQXgN',0,1),
(90,'tID6-bVeb-EytR-HhFg-Qr4nm',0,1),
(91,'dhVA-jSGC-MzgB-yZml-uzPdp',0,1),
(92,'LNUA-2ppi-8MmV-wjrB-4HK4A',0,1),
(93,'0t75-0bsD-wY1M-egbl-nqRo8',0,1),
(94,'JNsX-ozeT-1pmZ-2XpK-01OCd',0,1),
(95,'NUDt-doJC-MA5r-crt8-TQLBM',0,1),
(96,'Xmiw-ELFy-RcAw-JJB5-lawCf',0,1),
(97,'0ILu-MuB4-rOT8-wFKH-DfnCI',0,1),
(98,'WHJa-tqKG-yxx6-kZca-KF5SD',0,1),
(99,'6qM6-uUOL-cSKC-v2Av-Uda3U',0,1),
(100,'Qedb-ELzl-A6QU-vjH2-am84G',0,1),
(101,'Uw0L-Habl-9Yfp-7uWs-I9ugv',0,1),
(102,'LSQu-djRv-krB4-qMNL-zPGPJ',0,1),
(103,'KBPQ-df28-pIO0-S99R-dSONg',0,1),
(104,'awYf-BCOb-H9Jj-gxdR-Qx9ii',0,1),
(105,'26zc-9ehh-5Pvl-xeC1-KEKF9',0,1),
(106,'2Rci-51Q9-7yTy-3OVW-NqfoH',0,1),
(107,'xup4-a80p-wS8u-O8Dy-uJqAp',0,1),
(108,'zaa9-sDj5-7Vby-37En-tokUg',0,1),
(109,'4YXR-JKcN-LKPF-yKfT-EdfBm',0,1),
(110,'mEXd-uSO9-6VO4-A8gS-popoC',0,1),
(111,'VjRk-RerL-75OD-GVYy-M08rV',0,1),
(112,'PfzH-wfIZ-Zw0o-Xp16-nZTFm',0,1),
(113,'bNvP-6zOF-XVDT-JeRn-Qu3r9',0,1),
(114,'rAr0-dQ2x-GmDo-owug-8uEWx',0,1),
(115,'VBFC-56nT-9llt-0As9-eKqaz',1,1),
(116,'AH7a-gknP-nosW-yMeA-hkvbW',0,1),
(117,'jlwN-fMLs-b34k-0A4J-e9EOt',0,1),
(118,'MvHZ-GThD-HVbW-RIvC-PwScC',1,100),
(119,'IWo9-O5uv-wIzg-KQhL-LZDZv',0,100),
(120,'09Im-1Y8Z-D9Hv-cCqj-aB0Og',0,100),
(121,'b6ri-QOll-XTzR-I5Ja-Q90VI',0,100),
(122,'ndf6-RWD1-qS2H-lN3m-Za2B4',0,100),
(123,'w3k1-mIey-4DRN-2FZO-pYagW',0,100),
(124,'vkkY-WXxR-3VU9-X3tp-xQgsI',0,100),
(125,'4LsG-53Xg-teV8-jxXo-5sJoA',1,100),
(126,'0w72-gf7r-3j3i-NJ12-2AeUF',0,100),
(127,'rTAh-B1uD-IUWU-ddq0-ESWuy',0,100),
(128,'msjn-3Gc2-k7Bg-2OHA-gv0TI',1,3000),
(129,'L0iz-xjAR-Wqcb-hrNa-ODChz',0,10),
(130,'gRDj-9kaX-QWta-pmfB-KlNwL',1,10),
(131,'YDwj-RYoz-ZNUa-9fdN-hmHXm',0,10),
(132,'1Qbo-Dmry-7KPz-qKdQ-V2tiU',0,10),
(133,'5BAN-DYKR-orWa-3Xfs-Ujl6J',0,10),
(134,'dN3C-Xucw-ecab-uf6U-vef2p',0,10),
(135,'E28N-OjGe-FnRf-pZaO-Tb3o9',0,10),
(136,'mNyU-M7PJ-uere-59Nl-YKjgj',0,10),
(137,'NLdb-BR3K-MqxD-tZVa-79mFc',0,10),
(138,'X5Zz-Tc2Y-C0uH-OYCA-7Qc7Z',0,10),
(139,'7ZQ5-r9Kf-M3ab-SHfr-TIdtz',0,10),
(140,'dhk8-D6He-knkS-gRB6-Ftfk3',0,10),
(141,'N1D4-AaQ5-d4LJ-UyN0-aeLFG',0,10),
(142,'7elE-a96l-6lWx-i9ek-hf5rV',0,10),
(143,'qGSU-y30P-WZE9-RMPp-FsDLw',0,10),
(144,'vjsY-yIJR-EuuH-Vquh-cwPKh',0,1),
(145,'NFgk-lyhY-KWsW-hdS0-u9i69',1,1),
(146,'ymgF-XumQ-eAI5-uJuN-Fx3Ge',0,1),
(147,'iE6Q-vbPk-n6mU-nmD7-8kBoC',0,1),
(148,'R4eM-dIOQ-gzwg-dapT-CmBD0',0,1),
(149,'bUU7-wplF-pGy7-W5eS-rDNpC',0,1),
(150,'rApO-k79H-2TFH-nRkM-B55bk',0,1),
(151,'zdB0-d4H1-4MJn-FKBu-rsK69',0,1),
(152,'tRlC-ZA4X-9J4I-WEX4-l8FpI',0,1),
(153,'GJe4-VyYd-ZL1x-iXFZ-otaMJ',0,1),
(154,'EYjl-1DKX-3adA-QRoc-QfELN',0,1),
(155,'kavT-Ex4N-nP3a-spL5-FXupo',0,1),
(156,'ItFd-iHGS-Rmve-09Rx-TxKcI',0,1),
(157,'suLo-Oaqd-i1UC-cW6c-0jNKA',0,1),
(158,'VlPy-ZYt3-lXAh-KqBM-L1DdU',0,1),
(159,'gswh-GLtb-Ux1a-tS8M-BusKJ',0,1),
(160,'QSe0-coBP-aCRh-savz-IDy6I',0,1),
(161,'XqRO-wBuv-5347-wk1d-08cee',0,999999999),
(162,'PH6f-XLMR-dIXp-8pQ7-MGBIR',1,99999),
(163,'vjIN-SqgA-ATnE-GO2h-ecnsJ',1,10000),
(164,'j8t0-NFhw-mW4s-kVGL-m95rG',1,1000),
(165,'kqtE-387f-v0pA-AQw9-lzaeX',1,1000),
(166,'NDYU-pyeR-8PBn-poMZ-OrUU1',1,1000),
(167,'CRtq-vaM2-BtJ5-FOXL-7AFT1',1,300),
(168,'7p9n-xKwi-GXwf-H5LD-5SYKK',1,1000),
(169,'7FZR-mboR-z9Mc-dp4y-riSD0',1,200),
(170,'BCfw-WH5p-miSh-Nkdi-rRpkS',1,200),
(171,'HLRI-GAzd-XdOF-P1dw-k3HBv',1,300),
(172,'BV5B-nbwW-oEgn-XAbW-8dL1O',1,300);

UNLOCK TABLES;

/*Table structure for table `coupon_info` */

DROP TABLE IF EXISTS `coupon_info`;

CREATE TABLE `coupon_info` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `detail` VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '介绍',
  `minus_price` DECIMAL(10,0) NOT NULL COMMENT '优惠金额',
  `start_price` DECIMAL(10,0) NOT NULL COMMENT '起始价格',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `coupon_info` */

LOCK TABLES `coupon_info` WRITE;

INSERT  INTO `coupon_info`(`id`,`name`,`detail`,`minus_price`,`start_price`) VALUES 
(1,'新客专享','单次消费满101元减100元<br />1.预订酒店可用，每个用户一次仅限使用1张抵用券（同一小黄鸭账号、手机号、移动设备、银行卡、支付账号、身份证以及经过授权获取的身份标识信息，均视为同一用户）。<br />2、活动过程中，如果出现因网络攻击、黑客攻击、数据泄露等原因导致活动无法继续，小黄鸭 · 酒店 有权利提前终止活动。<br />3、活动过程中，用户不得使用任何外挂、插件以及其他破坏活动规则、违背活动公平原则的方式参加本次活动（如批量注册、恶意购买、虚假分享、倒买倒卖、虚假交易等），用户和商户不得进行有组织的众包作弊行为，否则美团有权取消用户、商户参与活动资格，取消已经领取或者使用的抵用券，必要时取消后续参与美团任意活动的权利，并追究法律责任。<br />4、如有任何问题请与小黄鸭客服联系。',100,101),
(2,'老用户回归','单次消费满200元减100元<br />1.预订酒店可用，每个用户一次仅限使用1张抵用券（同一小黄鸭账号、手机号、移动设备、银行卡、支付账号、身份证以及经过授权获取的身份标识信息，均视为同一用户）。<br />2、活动过程中，如果出现因网络攻击、黑客攻击、数据泄露等原因导致活动无法继续，小黄鸭 · 酒店 有权利提前终止活动。<br />3、活动过程中，用户不得使用任何外挂、插件以及其他破坏活动规则、违背活动公平原则的方式参加本次活动（如批量注册、恶意购买、虚假分享、倒买倒卖、虚假交易等），用户和商户不得进行有组织的众包作弊行为，否则美团有权取消用户、商户参与活动资格，取消已经领取或者使用的抵用券，必要时取消后续参与美团任意活动的权利，并追究法律责任。<br />4、如有任何问题请与小黄鸭客服联系。',100,200),
(3,'3月幸运用户神卷','单次消费满300元减299元<br />1.预订酒店可用，每个用户一次仅限使用1张抵用券（同一小黄鸭账号、手机号、移动设备、银行卡、支付账号、身份证以及经过授权获取的身份标识信息，均视为同一用户）。<br />2、活动过程中，如果出现因网络攻击、黑客攻击、数据泄露等原因导致活动无法继续，小黄鸭 · 酒店 有权利提前终止活动。<br />3、活动过程中，用户不得使用任何外挂、插件以及其他破坏活动规则、违背活动公平原则的方式参加本次活动（如批量注册、恶意购买、虚假分享、倒买倒卖、虚假交易等），用户和商户不得进行有组织的众包作弊行为，否则美团有权取消用户、商户参与活动资格，取消已经领取或者使用的抵用券，必要时取消后续参与美团任意活动的权利，并追究法律责任。<br />4、如有任何问题请与小黄鸭客服联系。',299,300);

UNLOCK TABLES;

/*Table structure for table `hotel_info` */

DROP TABLE IF EXISTS `hotel_info`;

CREATE TABLE `hotel_info` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'id',
  `hotelName` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `province` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所在省',
  `city` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所在市',
  `address` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '详细地址',
  `star` INT DEFAULT NULL COMMENT '星级',
  `cover` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '封面图片',
  `latitude` DOUBLE DEFAULT NULL COMMENT '纬度',
  `longitude` DOUBLE DEFAULT NULL COMMENT '经度',
  `phone` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `type` VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '酒店类型',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `hotel_info` */

LOCK TABLES `hotel_info` WRITE;

INSERT  INTO `hotel_info`(`id`,`hotelName`,`province`,`city`,`address`,`star`,`cover`,`latitude`,`longitude`,`phone`,`type`) VALUES 
(1,'维也纳酒店(岳阳楼步步高店)','湖南','岳阳市','湖南省岳阳市岳阳楼区冷水铺路东腾花园综合楼',2,'https://cdn.zhujunpeng.love/hotelApp/hotel/hotel1.jpg',29.384941,113.149095,'18974071389;0730-8266888','0'),
(2,'紫罗兰主题酒店','湖南','岳阳市','湖南省岳阳市岳阳楼区青年西路8号(康达骨伤医院旁边,东风广场对面)',0,'https://cdn.zhujunpeng.love/hotelApp/hotel/hotel2.jpg',29.366472,113.10116,'0730-3344999','0'),
(3,'岳阳见景酒店(天伦国际店)','湖南','岳阳市','湖南省岳阳市岳阳楼区建湘路502号七公司院内',3,'https://cdn.zhujunpeng.love/hotelApp/hotel/hotel3.jpg',29.370721,113.130772,'0730-8989899','0,2'),
(4,'沐沐城市生活酒店','湖南','岳阳市','湖南省岳阳市岳阳楼区东茅岭路255号土桥中南美容二楼',1,'https://cdn.zhujunpeng.love/hotelApp/hotel/hotel4.jpg',29.369036,113.117235,'0730-3345678','0'),
(5,'临湘时光印主题酒店(市政府店)','湖南','岳阳市','湖南省岳阳市临湘市长盛西路58号临湘市总工会',0,'https://cdn.zhujunpeng.love/hotelApp/75a271f98c025d9421b845febdcf0cc.jpg',29.470335,113.448706,'0730-3556888','0,2'),
(6,'珂莱酒店(五一广场地铁站店)','湖南','长沙市','湖南省长沙市开福区五一西路060号10层',3,'https://cdn.zhujunpeng.love/hotelApp/0987d77193ce5922df29dde2f481bfd.jpg',28.195687,112.974378,'15367869728','0,2'),
(7,'长沙阳光酒店公寓','湖南','长沙市','湖南省长沙市芙蓉区八一路38号锦华时代17楼',0,'https://cdn.zhujunpeng.love/hotelApp/a22fe881366d3f8f54f89ae1887612f.jpg',28.197774,113.009343,'19311592560','0,1');

UNLOCK TABLES;

/*Table structure for table `judge_info` */

DROP TABLE IF EXISTS `judge_info`;

CREATE TABLE `judge_info` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'id',
  `image` VARCHAR(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图片',
  `content` VARCHAR(300) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '评论内容',
  `star` INT DEFAULT NULL COMMENT '评分',
  `user_id` INT DEFAULT NULL COMMENT '用户id',
  `hotel_id` INT DEFAULT NULL COMMENT '酒店id',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `judge_info` */

LOCK TABLES `judge_info` WRITE;

INSERT  INTO `judge_info`(`id`,`image`,`content`,`star`,`user_id`,`hotel_id`) VALUES 
(5,'http://172.20.10.3:3000/uploads\\file-1711878069167.jpg,http://172.20.10.3:3000/uploads\\file-1711878070191.png','酒店可以的',5,1,4),
(6,'http://172.20.10.3:3000/uploads\\file-1711879159757.jpg','11',5,1,4),
(7,'http://172.20.10.3:3000/uploads\\file-1711879222268.jpg','1',5,1,4),
(8,'http://172.20.10.3:3000/uploads\\file-1711879909782.jpg','1111',4,1,4),
(9,'http://172.20.10.3:3000/uploads\\file-1711879997720.jpg','111111',5,1,4),
(10,'http://172.20.10.3:3000/uploads\\file-1711880078278.jpg','1111111111',5,1,4),
(11,'http://172.20.10.3:3000/uploads\\file-1711880118554.jpg,http://172.20.10.3:3000/uploads\\file-1711880119589.png,http://172.20.10.3:3000/uploads\\file-1711880120613.png','daadsda',1,1,4),
(12,'http://172.20.10.3:3000/uploads\\file-1711880166917.png','999999999999',1,1,4),
(13,'http://172.20.10.3:3000/uploads\\file-1711880527465.jpg','adsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsd',1,1,4),
(14,'http://172.20.10.3:3000/uploads\\file-1711880738103.png,http://172.20.10.3:3000/uploads\\file-1711880739119.jpg,http://172.20.10.3:3000/uploads\\file-1711880740152.png','111111111111111111',1,1,5),
(15,'http://172.20.10.3:3000/uploads\\file-1711880749488.png,http://172.20.10.3:3000/uploads\\file-1711880750507.png','23411421341412341',5,1,5),
(16,'http://172.20.10.3:3000/uploads\\file-1711880862641.jpg,http://172.20.10.3:3000/uploads\\file-1711880863667.png','111',5,1,5),
(17,'http://172.20.10.3:3000/uploads\\file-1711881057764.jpg','123333333333333333333',1,1,5),
(18,'图片地址','评论内容',5,1,1),
(19,'http://172.20.10.3:3000/uploads\\file-1711897312475.png','房间小,不太行',1,1,7);

UNLOCK TABLES;

/*Table structure for table `order_info` */

DROP TABLE IF EXISTS `order_info`;

CREATE TABLE `order_info` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'id',
  `orderNumber` VARCHAR(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单号',
  `room_id` INT DEFAULT NULL COMMENT '房间id',
  `user_id` INT DEFAULT NULL COMMENT '用户id',
  `time` VARCHAR(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '下单时间',
  `state` INT DEFAULT NULL COMMENT '状态(0待支付,1待评价,2已完成)',
  `price` INT DEFAULT NULL COMMENT '金额',
  `coupon_id` INT DEFAULT NULL COMMENT '优惠卷id',
  `userName` VARCHAR(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '入住人',
  `phone` VARCHAR(11) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `roomNumber` VARCHAR(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '房间数',
  `comeDate` JSON DEFAULT NULL COMMENT '入住时间',
  `leaveDate` JSON DEFAULT NULL COMMENT '离店时间',
  `night` VARCHAR(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '住几晚',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `order_info` */

LOCK TABLES `order_info` WRITE;

INSERT  INTO `order_info`(`id`,`orderNumber`,`room_id`,`user_id`,`time`,`state`,`price`,`coupon_id`,`userName`,`phone`,`roomNumber`,`comeDate`,`leaveDate`,`night`) VALUES 
(24,'1711696134546',1,57,'2024-03-29 15:08',1,99,0,'张三','10086','1','{\"day\": \"29\", \"week\": \"五\", \"year\": 2024, \"month\": \"03\"}','{\"day\": \"30\", \"week\": \"六\", \"year\": 2024, \"month\": \"03\"}','1'),
(25,'1711696198899',1,57,'2024-03-29 15:09',1,198,0,'张三, 李四','10086','2','{\"day\": \"29\", \"week\": \"五\", \"year\": 2024, \"month\": \"03\"}','{\"day\": \"29\", \"week\": \"一\", \"year\": 2024, \"month\": \"07\"}','122'),
(38,'1711782832460',16,1,'2024-03-30 15:13',3,223,0,'张三','13117582730','1','{\"day\": \"30\", \"week\": \"六\", \"year\": 2024, \"month\": \"03\"}','{\"day\": \"31\", \"week\": \"日\", \"year\": 2024, \"month\": \"03\"}','1'),
(53,'1711880806198',8,1,'2024-03-31 18:26',3,212,0,'张三','13117582730','1','{\"day\": \"31\", \"week\": \"日\", \"year\": 2024, \"month\": \"03\"}','{\"day\": \"01\", \"week\": \"一\", \"year\": 2024, \"month\": \"04\"}','1'),
(54,'1711880904358',8,1,'2024-03-31 18:28',3,212,0,'张三','13117582730','1','{\"day\": \"31\", \"week\": \"日\", \"year\": 2024, \"month\": \"03\"}','{\"day\": \"01\", \"week\": \"一\", \"year\": 2024, \"month\": \"04\"}','1'),
(55,'1711897302333',23,1,'2024-03-31 23:01',3,27,0,'张三','13117582730','1','{\"day\": \"31\", \"week\": \"日\", \"year\": 2024, \"month\": \"03\"}','{\"day\": \"01\", \"week\": \"一\", \"year\": 2024, \"month\": \"04\"}','1');

UNLOCK TABLES;

/*Table structure for table `room_image` */

DROP TABLE IF EXISTS `room_image`;

CREATE TABLE `room_image` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'id',
  `url` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图片路径',
  `room_id` INT DEFAULT NULL COMMENT '所属房间id',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `room_image` */

LOCK TABLES `room_image` WRITE;

INSERT  INTO `room_image`(`id`,`url`,`room_id`) VALUES 
(1,'https://cdn.zhujunpeng.love/hotelApp/room/room1.jpg',1),
(2,'https://cdn.zhujunpeng.love/hotelApp/room/room2.jpg',2),
(3,'https://cdn.zhujunpeng.love/hotelApp/room/room3.jpg',3),
(4,'https://cdn.zhujunpeng.love/hotelApp/room/room4.jpg',4),
(5,'https://cdn.zhujunpeng.love/hotelApp/room/room5.jpg',5),
(6,'https://cdn.zhujunpeng.love/hotelApp/room/room6.jpg',6),
(7,'https://cdn.zhujunpeng.love/hotelApp/room/room7.jpg',7),
(8,'https://cdn.zhujunpeng.love/hotelApp/room/room8.jpg',8),
(9,'https://cdn.zhujunpeng.love/hotelApp/room/room9.jpg',9),
(10,'https://cdn.zhujunpeng.love/hotelApp/room/room10.jpg',10),
(11,'https://cdn.zhujunpeng.love/hotelApp/room/room1.jpg',11),
(12,'https://cdn.zhujunpeng.love/hotelApp/room/room2.jpg',12),
(13,'https://cdn.zhujunpeng.love/hotelApp/room/room3.jpg',13),
(14,'https://cdn.zhujunpeng.love/hotelApp/room/room4.jpg',14),
(15,'https://cdn.zhujunpeng.love/hotelApp/room/room5.jpg',15),
(16,'https://cdn.zhujunpeng.love/hotelApp/room/room6.jpg',16),
(17,'https://cdn.zhujunpeng.love/hotelApp/Snipaste_2024-03-31_21-18-52.png',19),
(18,'https://cdn.zhujunpeng.love/hotelApp/Snipaste_2024-03-31_21-18-33.png',17),
(19,'https://cdn.zhujunpeng.love/hotelApp/Snipaste_2024-03-31_21-18-18.png',18),
(20,'https://cdn.zhujunpeng.love/hotelApp/e76fab174e8a023079fc2f8dec1e64b.jpg',20),
(21,'https://cdn.zhujunpeng.love/hotelApp/92337ec72d0203ee0c5b0066decac33.jpg',21),
(22,'https://cdn.zhujunpeng.love/hotelApp/92337ec72d0203ee0c5b0066decac33.jpg',22),
(23,'https://cdn.zhujunpeng.love/hotelApp/640738894ead098037ef63067d034ed.jpg',23),
(24,'https://cdn.zhujunpeng.love/hotelApp/8b4c34393c82b17a6a2ddcd05afe420.jpg',24);

UNLOCK TABLES;

/*Table structure for table `room_info` */

DROP TABLE IF EXISTS `room_info`;

CREATE TABLE `room_info` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '房间名称',
  `price` DECIMAL(10,0) DEFAULT NULL COMMENT '价格',
  `type_id` INT DEFAULT NULL COMMENT '类型表id',
  `hotel_id` INT DEFAULT NULL COMMENT '所属酒店',
  `number` INT DEFAULT '1' COMMENT '房间数',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `room_info` */

LOCK TABLES `room_info` WRITE;

INSERT  INTO `room_info`(`id`,`name`,`price`,`type_id`,`hotel_id`,`number`) VALUES 
(1,'单人房',99,2,1,2),
(2,'单人房',102,3,2,3),
(3,'单人房',321,1,3,2),
(4,'单人房',123,4,4,4),
(5,'单人房',124,3,6,5),
(6,'单人房',98,4,3,1),
(7,'单人房',163,1,4,2),
(10,'单人房',98,5,3,1),
(11,'单人房',123,3,3,2),
(12,'单人房',98,4,6,5),
(13,'单人房',98,4,2,1),
(14,'单人房',243,2,2,3),
(15,'单人房',123,1,1,4),
(16,'单人房',223,3,4,2),
(17,'晨曦[明朗舒适,空间免費停车]',89,2,5,4),
(18,'朝花夕拾[休闲阳台榻榻米]',97,2,5,4),
(19,'悦时光麻将房[雀圣聚会优选]',112,3,5,2),
(20,'莱享单间',102,1,6,3),
(21,'莱梦星空房',115,2,6,5),
(22,'莱享影院双床房间',177,3,6,4),
(23,'阳光舒适床位房',27,2,7,12),
(24,'标准床位房',37,1,7,5);

UNLOCK TABLES;

/*Table structure for table `room_kind` */

DROP TABLE IF EXISTS `room_kind`;

CREATE TABLE `room_kind` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` VARCHAR(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `room_kind` */

LOCK TABLES `room_kind` WRITE;

INSERT  INTO `room_kind`(`id`,`title`) VALUES 
(1,'国内'),
(2,'民宿公寓'),
(3,'钟点房');

UNLOCK TABLES;

/*Table structure for table `room_type` */

DROP TABLE IF EXISTS `room_type`;

CREATE TABLE `room_type` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'id',
  `people` INT DEFAULT NULL COMMENT '人数',
  `floor` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '楼层',
  `length` DOUBLE DEFAULT NULL COMMENT '床长度',
  `area` DOUBLE DEFAULT NULL COMMENT '房间面积',
  `window` TINYINT(1) DEFAULT NULL COMMENT '是否有窗户',
  `wifi` TINYINT(1) DEFAULT NULL COMMENT '是否有wifi',
  `smoke` TINYINT(1) DEFAULT NULL COMMENT '是否允许吸烟',
  `elevator` TINYINT(1) DEFAULT NULL COMMENT '是否提供电梯',
  `breakfast` TINYINT(1) DEFAULT NULL COMMENT '是否提供早餐',
  `luggage` TINYINT(1) DEFAULT NULL COMMENT '是否提供行李寄存',
  `awaken` TINYINT(1) DEFAULT NULL COMMENT '是否提供叫醒服务',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `room_type` */

LOCK TABLES `room_type` WRITE;

INSERT  INTO `room_type`(`id`,`people`,`floor`,`length`,`area`,`window`,`wifi`,`smoke`,`elevator`,`breakfast`,`luggage`,`awaken`) VALUES 
(1,1,'1-2-3',1.8,20,0,1,1,1,1,1,1),
(2,2,'2-3',2,30,1,1,1,0,0,0,1),
(3,2,'1-2',2.2,28,0,0,0,1,1,1,1),
(4,1,'2-4',2.1,40,1,1,1,1,1,1,0),
(5,2,'6-7',2.3,90,1,0,0,0,0,1,1),
(6,1,'9',1.9,40,1,0,1,1,1,1,1);

UNLOCK TABLES;

/*Table structure for table `swiper_info` */

DROP TABLE IF EXISTS `swiper_info`;

CREATE TABLE `swiper_info` (
  `image` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片路径'
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `swiper_info` */

LOCK TABLES `swiper_info` WRITE;

INSERT  INTO `swiper_info`(`image`) VALUES 
('https://cdn.zhujunpeng.love/hotelApp/swiper1.jpg'),
('https://cdn.zhujunpeng.love/hotelApp/swiper2.png'),
('https://cdn.zhujunpeng.love/hotelApp/swiper3.jpg'),
('https://cdn.zhujunpeng.love/hotelApp/swiper4.jpg');

UNLOCK TABLES;

/*Table structure for table `user_coupon` */

DROP TABLE IF EXISTS `user_coupon`;

CREATE TABLE `user_coupon` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL COMMENT '用户id',
  `coupon_id` INT NOT NULL COMMENT '优惠卷的id',
  `expire_date` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '到期时间',
  `usable` TINYINT(1) DEFAULT NULL COMMENT '是否可用',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `user_coupon` */

LOCK TABLES `user_coupon` WRITE;

INSERT  INTO `user_coupon`(`id`,`user_id`,`coupon_id`,`expire_date`,`usable`) VALUES 
(1,1,1,'2024-6-1',1),
(2,1,2,'2024-1-1',1),
(3,13,1,'2025-1-1',1),
(4,1,3,'2025-1-1',0);

UNLOCK TABLES;

/*Table structure for table `user_info` */

DROP TABLE IF EXISTS `user_info`;

CREATE TABLE `user_info` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'id',
  `phone` VARCHAR(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `username` VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `sex` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '性别',
  `avatar` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像',
  `wallet` DECIMAL(10,2) DEFAULT NULL COMMENT '钱包',
  `paypassword` INT DEFAULT NULL COMMENT '支付密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `user_info` */

LOCK TABLES `user_info` WRITE;

insert  into `user_info`(`id`,`phone`,`username`,`password`,`sex`,`avatar`,`wallet`,`paypassword`) values 
(1,'13112345678','Jun','123456','男','https://cdn.zhujunpeng.love/Jun.jpg',10000.00,123456);

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;