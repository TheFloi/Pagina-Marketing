-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 14, 2024 at 04:06 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `base_merchandising`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE IF NOT EXISTS `cart_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT '1',
  `total_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `user_id`, `product_id`, `quantity`, `total_price`) VALUES
(1, NULL, 0, 1, 100.00),
(2, NULL, 0, 1, 100.00),
(3, NULL, 0, 1, 100.00),
(4, NULL, 0, 1, 100.00),
(5, NULL, 0, 1, 100.00),
(6, NULL, 0, 1, 100.00),
(7, NULL, 1, 1, 100.00),
(8, NULL, 1, 1, 100.00),
(9, NULL, 1, 1, 100.00),
(10, NULL, 1, 1, 100.00),
(11, NULL, 1, 1, 100.00),
(12, NULL, 1, 1, 100.00);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `productid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `category_id` int DEFAULT NULL,
  `stock` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `image_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`productid`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productid`, `name`, `description`, `price`, `category_id`, `stock`, `created_at`, `image_url`) VALUES
(1, 'Nombre del Producto', 'Descripción del Producto', 100.00, 1, 50, '2024-08-10 18:09:51', 'IMG/taza.jpg'),
(2, 'producto 2', 'Este es un producto 2', 100.00, 1, 50, '2024-08-10 18:58:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`user`)
) ENGINE=MyISAM AUTO_INCREMENT=245 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `user`, `pass`, `created_at`, `name`) VALUES
(4, 'Jololeo', '$2a$08$v43naOSuyOqzWXMHwcyNTO/nqoQgxEDu7DnctTSgjQA4snScpvIpa', '2024-07-30 05:24:37', 'Joel Velarde'),
(5, 'si soy', '$2a$08$XDohM1nnnT8LcgSvwyaN1uLla1B6uSUdb3BosbFQyJ4jtnnh/ehqS', '2024-07-30 05:25:16', 'yo no soy '),
(6, 'annnn', '$2a$08$vw9UkmycfZxERM0mGOal5uCqHEPMFPXARCHYMKa86cypytHQVFTfC', '2024-07-30 05:46:12', 'anna lopez'),
(7, '', '$2a$08$4CTJQClSlPH4cmV9b6EtUuN/GgUrGwr/2VTH0jOShHJSzPlOEGKta', '2024-07-30 05:46:33', ''),
(8, 'asdasdasd', '$2a$08$9LOjny1tgBJa/ayg8x4n8e0XBWUWAKCBi3TVXmzOHFJvyYVOogBZa', '2024-07-30 15:29:43', 'asdasda'),
(9, 'estrella', '$2a$08$cNwdD44J4V8juc4rdrCZCuIWqZG7HIUGUBnop4DzAt3.1A1GcTotC', '2024-07-30 17:04:07', 'patricio estrella'),
(10, 'el que soy', '$2a$08$kkbC7aAFnhPPDMY95FB5m.QSu/Npxfq1MgPbznb2BSZD2fqpLI1mK', '2024-07-30 18:24:00', 'yo soy'),
(11, 'kit', '$2a$08$oB.RGQ4R7z77UnkjNC5vb.oXqhO5AfKBuaCarTpjKDi96Tv5IGwZq', '2024-08-04 22:31:22', 'kity'),
(12, 'jo', '$2a$08$/toQnyWqvM9HDnuN/7sg4eZn5VXOjo8oI9OTf4AWDJESsEG391Isi', '2024-08-04 22:32:39', 'joao'),
(14, 'lol', '$2a$08$0ZpTsu29BrpF6nb5l9lUPu77KSDV7P77Huztr1JZsd.12kZTcKy4G', '2024-08-06 17:39:57', 'lois'),
(16, 'noloso', '$2a$08$1CLggSS3V14rOYVYi/P5/uZX2jfSs/y0vBCmv0HdrnD2w1W8GGSoa', '2024-08-12 03:19:15', 'nolose'),
(17, 'ZAP', '$2a$08$OKMAzQyQx6jn.iYH4.8LVu8QwSs0h9udMjaMwVV9fHic8K2KG7pUe', '2024-08-13 01:27:43', 'ZAP'),
(18, 'c:/Windows/system.ini', '$2a$08$adWbxtuxY8XMvaeLqCa4Ge3i44gRZpwKowwiIq3trKc.P0WsPw.Aa', '2024-08-13 01:27:50', 'ZAP'),
(19, '../../../../../../../../../../../../../../../../Wi', '$2a$08$/2/5y/Srd39XSXoKHkhvFeQ9MedMPFXwWvwQ31HBQoGiqNDCOxO12', '2024-08-13 01:27:50', 'ZAP'),
(20, 'c:\\Windows\\system.ini', '$2a$08$3hvKdhM3qgvo5/IzQuhTnuPk7JiAa/lk9Ee5o3mdEIsrkaZcmVFBO', '2024-08-13 01:27:50', 'ZAP'),
(21, '..\\..\\..\\..\\..\\..\\..\\..\\..\\..\\..\\..\\..\\..\\..\\..\\Wi', '$2a$08$ZgN43Aue31Ck5GI.f47HXeBwuMWDmLLil7jod2VOnqp8QyhCSHDOS', '2024-08-13 01:27:50', 'ZAP'),
(22, '/etc/passwd', '$2a$08$xEzPtJAHpW/YTIVR0Spghelu6Dbdg9G0edg1jLjNfNcy51K5W5F/K', '2024-08-13 01:27:50', 'ZAP'),
(23, '../../../../../../../../../../../../../../../../et', '$2a$08$WxQMj504xTNk3oUFZX2/QeVL5YLZvoLNSdGFoNNqEcER5oH7bmqkC', '2024-08-13 01:27:50', 'ZAP'),
(24, '/', '$2a$08$jwsrZMUYEnPAsZeAPLCB1.TaOXZU65c7LsN1wkpl5WBs4Y4rn3roa', '2024-08-13 01:27:51', 'ZAP'),
(25, '../../../../../../../../../../../../../../../../', '$2a$08$MzhZtxk.XnEkTXucVmUIc.vCENtDXSgMamkx3d9asnFY2YZ2glKMm', '2024-08-13 01:27:51', 'ZAP'),
(26, 'c:/', '$2a$08$8sqx0XD6x1SyS4R38gC/4O5JaSBQxZ5VNJ4.FxTnAB2piTX1hR5GC', '2024-08-13 01:27:51', 'ZAP'),
(27, 'c:\\', '$2a$08$2xvCGHVrTZnW4fK7krrs1eW7/U.ir2UDEKtt7eVUTdlrna3ryX1nW', '2024-08-13 01:27:51', 'ZAP'),
(28, 'WEB-INF/web.xml', '$2a$08$Q4CoXJfeb3njrc97tXGBduPIaWshFAU9S1KkwpCjO8dzamt0..i0.', '2024-08-13 01:27:51', 'ZAP'),
(29, 'WEB-INF\\web.xml', '$2a$08$I/.hrXi97ViisuSYDd2DfOCkf5Gj2SOq0N.K..pALYsHZdIsfCJFS', '2024-08-13 01:27:51', 'ZAP'),
(30, '/WEB-INF/web.xml', '$2a$08$u44srfml.Lr7J9rfjeTpi.qwuOWuRLL8kaCE./Of6eLEvYHYUAY4S', '2024-08-13 01:27:51', 'ZAP'),
(31, '\\WEB-INF\\web.xml', '$2a$08$.sOKLnqrvX/vwgNr2xC15uQIudMablu/eiLqMGvWZDGAXpF/qay1a', '2024-08-13 01:27:51', 'ZAP'),
(32, 'thishouldnotexistandhopefullyitwillnot', '$2a$08$hU68OXAa2FGenFEjdXoiBeS20h90GWXZWwFWPdOZ1kWPQ1I9pcDOG', '2024-08-13 01:27:51', 'ZAP'),
(33, 'register', '$2a$08$pHRfHFjV7PXsCrZpBmULPegWODDESy0.9L.V7Y8h.VKEgCP.p5Me2', '2024-08-13 01:27:52', 'ZAP'),
(34, '/register', '$2a$08$SikR3xAV2axF0mqeDkxvMOur36ycEJY3Km.pXD7.gW7oXKbpzJnEi', '2024-08-13 01:27:52', 'ZAP'),
(35, '\\register', '$2a$08$EZk57pSS//jN.wLG9mY0furNr5mPXnU5.JUmW2iaXjTBn0P2c03O6', '2024-08-13 01:27:52', 'ZAP'),
(36, 'http://www.google.com/', '$2a$08$JlcNsMhg6p9b.c7cuGep5u.msJQLhofYbUlkzSS9.HkI0hPI8Xeu2', '2024-08-13 01:27:54', 'ZAP'),
(37, 'http://www.google.com:80/', '$2a$08$maQZkwwWmC0uZ2iXXAKF7OPJSJTu1Yx4Q1tEHWpyQHIuqezZGGZ4a', '2024-08-13 01:27:54', 'ZAP'),
(38, 'http://www.google.com', '$2a$08$fIh5N44mCgCCDP8lT8xpPOZyPFNO1.pf4sngtiaMeamKzVlNd68Su', '2024-08-13 01:27:54', 'ZAP'),
(39, 'http://www.google.com/search?q=ZAP', '$2a$08$kcDPMKBdFEYHQxW7ugN4TOCSEBIY77HrIAJl4Cq4Wn1DaNxTjE1C.', '2024-08-13 01:27:54', 'ZAP'),
(40, 'http://www.google.com:80/search?q=ZAP', '$2a$08$OGqAcZojnIVKLo0ddtU.xuWCLgkDVQ2H3TrqaV/NDE3Ko6GJy38La', '2024-08-13 01:27:54', 'ZAP'),
(41, 'www.google.com/', '$2a$08$pltK7dkz9e7rHIFtdUXXkeyj/5tfldOGE017Wjw/lPbGEzMIuA4FS', '2024-08-13 01:27:54', 'ZAP'),
(42, 'www.google.com:80/', '$2a$08$v8qS98OMiBMVcD5w/HQkMOXpBsMwuV/NWJW4jaIj//9ZVhpzX/0Fi', '2024-08-13 01:27:54', 'ZAP'),
(43, 'www.google.com', '$2a$08$TTV0H4JfrSSSH9KWaE1nAOxWVx0Re2i6c0kWbSEPazLQDx8nSp2ZG', '2024-08-13 01:27:54', 'ZAP'),
(44, 'www.google.com/search?q=ZAP', '$2a$08$Y4gsINCMBXjdY8cQY0OLMOaZ6IKjpvFeqbKredx6IiQfTuAszQUqu', '2024-08-13 01:27:55', 'ZAP'),
(45, 'www.google.com:80/search?q=ZAP', '$2a$08$3KwGkCyKOmnfgqldLzDnIecy/vrNxVJHO/sY5Ihp6ZtUe8EDsg6Z6', '2024-08-13 01:27:55', 'ZAP'),
(46, '2486642769004284140.owasp.org', '$2a$08$sTQ/TTsBr03H/jWtORlP3uCrn/bv5G.9LqJVHko/ZNYtP96O0ACFy', '2024-08-13 01:28:00', 'ZAP'),
(47, 'http://2486642769004284140.owasp.org', '$2a$08$4FeBFBNE1njR9Zr7tH/JEuG8Bw5xJtYpo7sTs65l9XGumnxNWp3eK', '2024-08-13 01:28:00', 'ZAP'),
(48, 'https://2486642769004284140.owasp.org', '$2a$08$2M1m.pEYTQOSwQe6dXASvuFdX5Pq3GDNHGo7PDo.W/SO61qCaeVGO', '2024-08-13 01:28:00', 'ZAP'),
(49, 'https://2486642769004284140%2eowasp%2eorg', '$2a$08$p7lXciY.DE4A/NHv8CueTO.Opyh8FiMuGtvkvFcxEY90f3jidtaNO', '2024-08-13 01:28:00', 'ZAP'),
(50, '5;URL=\'https://2486642769004284140.owasp.org\'', '$2a$08$BHBuNFDKQcjd3T1VFRSqIu4wp1Gsc/r5IxLLpROQoFr2qPHFaQG8i', '2024-08-13 01:28:00', 'ZAP'),
(51, 'URL=\'http://2486642769004284140.owasp.org\'', '$2a$08$ZLfZ/mbytqnjm//iE7n.l.HvgZItQozmBeh7PBcpnHbaDHfY/MB16', '2024-08-13 01:28:00', 'ZAP'),
(52, 'http://\\2486642769004284140.owasp.org', '$2a$08$w8oh1e6sIEva.KEdmTq6yu/OhKh2enmJoVyVFJVzMhpuoO8rocRPO', '2024-08-13 01:28:00', 'ZAP'),
(53, 'https://\\2486642769004284140.owasp.org', '$2a$08$I5KsjqBo6UOuMwRxDK8raetkAnFtnyRJ4ptpltAD8FD09YFnwN/zy', '2024-08-13 01:28:00', 'ZAP'),
(54, '//2486642769004284140.owasp.org', '$2a$08$nkb8I4hEafDsgb8qr857g.v9D1XuZlhaZy3eQvgbKQnAvT2lLT2UG', '2024-08-13 01:28:00', 'ZAP'),
(55, '<!--#EXEC cmd=\"ls /\"-->', '$2a$08$FGuEKE7cIlR9mx45B/Ly4O1jng96OeOh2U3WwggDST.Zmg2dMXWxG', '2024-08-13 01:28:01', 'ZAP'),
(56, '\"><!--#EXEC cmd=\"ls /\"--><', '$2a$08$Bo.PfdwRKCV9UKnGTksUve6j11DOyra93WM2UPsahPl2wDq4RNxHW', '2024-08-13 01:28:01', 'ZAP'),
(57, '<!--#EXEC cmd=\"dir \\\"-->', '$2a$08$x5b23/.xcuGoQZkayvSuxewitYLWRj.prpH7Rp/rU8rXnP1JgiH7m', '2024-08-13 01:28:02', 'ZAP'),
(58, '\"><!--#EXEC cmd=\"dir \\\"--><', '$2a$08$7ZkAbPnUxaVeXo22MMWOsORh.yTIEgrFBXh86SHMgUgFQY16J/P/C', '2024-08-13 01:28:02', 'ZAP'),
(59, '0W45pz4p', '$2a$08$dFeRq0MITB5Rl8QYnn3fFOmovnKPTrJ4cbBXJOsHK5nYzdiMtBg2O', '2024-08-13 01:28:03', 'ZAP'),
(60, 'ZAP0W45pz4p', '$2a$08$JST2EJN5ucyBRZkQkgVUNOsGSc/QKzh9osPO4v3hGJKDM8xqtxZ5K', '2024-08-13 01:28:03', 'ZAP'),
(61, '\'\"<scrIpt>alert(1);</scRipt>', '$2a$08$OqQuZbGr0Es9VbB8RDoHDeKBBwuo9l7Gf70vAqTQSYqYWRQ8wYpn2', '2024-08-13 01:28:03', 'ZAP'),
(62, '\'\"<img src=x onerror=prompt()>', '$2a$08$b1Hn/Ib/YI6HJG3u7eVJtO0yUABVjxBMth4KBLdjYR4B5Pk.irya.', '2024-08-13 01:28:03', 'ZAP'),
(63, 'zApPX3sS', '$2a$08$JHdDHNDZKnb.5YFu4tfz0eIWx7lH4Bw21w81O33CkGpvVqe.wj6cq', '2024-08-13 01:28:04', 'ZAP'),
(64, '\'', '$2a$08$vcEIeRHIDtljfrVDHHCrc.dNxLi.qu2StikJz3rHfk8BRSO1sRn6e', '2024-08-13 01:28:07', 'ZAP'),
(65, 'ZAP\'', '$2a$08$2PzWk.LyowXs5.o0OywovOgMlwQBLYlQOKrjRpGDMJp5yzutPNAUS', '2024-08-13 01:28:07', 'ZAP'),
(66, '\"', '$2a$08$t1PasucJNyImUAmUySu7w./5KxNXIof2.y9h1Fi8US1wooi6tOKtW', '2024-08-13 01:28:08', 'ZAP'),
(67, 'ZAP\"', '$2a$08$IjyMhRDXTjACV.qmvALMj.ajQZ5N/8Oukc8ZD8LTaG2LDc3M23MO2', '2024-08-13 01:28:08', 'ZAP'),
(68, ';', '$2a$08$.GBQkKAw5JeR8XkqsQ.MMereVt1BACBN/uicdXiODumKzg7IGqMCG', '2024-08-13 01:28:08', 'ZAP'),
(69, 'ZAP;', '$2a$08$6dN6DmUWVTh8J1FXMBpBDeOF8SEtv2kc3YNF1CZpR.QvIml7MsQMW', '2024-08-13 01:28:08', 'ZAP'),
(70, '\'(', '$2a$08$Fr25Rqhel5jLIhkQkTrgW.eDRunyx2K/.KwO1Ui4x8rwk7hMItdJC', '2024-08-13 01:28:08', 'ZAP'),
(71, 'ZAP\'(', '$2a$08$cNwlRbC4RH/.asPjLtGuX.VQQOhTL2GrDTNEWKGkQf4QSypKmoQme', '2024-08-13 01:28:08', 'ZAP'),
(72, 'ZAP AND 1=1 -- ', '$2a$08$yY5C5clSOlU5joowgEQZuOielbND9M8TEd./UTy2ZUH5pdNoV8qrC', '2024-08-13 01:28:08', 'ZAP'),
(73, 'ZAP\' AND \'1\'=\'1\' -- ', '$2a$08$C7TifYLV1UVdeC9pLEe09OBMW/rX5PbAuGlCriD7TXyGtnc2LSOGq', '2024-08-13 01:28:08', 'ZAP'),
(74, 'ZAP\" AND \"1\"=\"1\" -- ', '$2a$08$nyvqt/5cOiiWljAkwi.qYenea58b/scL1mPr1vn.QL5A38jEVrIqW', '2024-08-13 01:28:09', 'ZAP'),
(75, 'ZAP AND 1=1', '$2a$08$ui5uUkmRGlH0J.ZeDskIr.B56ShVLXrcwob2PWLC3aD0WQLP3Qhq2', '2024-08-13 01:28:09', 'ZAP'),
(76, 'ZAP\' AND \'1\'=\'1', '$2a$08$71TO56GyJf76fia7gP5RL.sFyH3E4jbqrVUC32cEkfaxOMKS33Nma', '2024-08-13 01:28:09', 'ZAP'),
(77, 'ZAP\" AND \"1\"=\"1', '$2a$08$MSVAA6zkQfVH11jqY1Fy6.ynFzwA7ce8JG4aSz22xqgPDK50YJXHC', '2024-08-13 01:28:09', 'ZAP'),
(78, 'ZAP UNION ALL select NULL -- ', '$2a$08$xyDZquOtv0chgnqlXfg05ey6n.DiK6HiW6gzUmOP1UKK48cO1YRIa', '2024-08-13 01:28:09', 'ZAP'),
(79, 'ZAP\' UNION ALL select NULL -- ', '$2a$08$Ik/xXlfH088ry7.xZempreHZzhrfUXUh133ATZ6gsbXnPFitO8Rwe', '2024-08-13 01:28:09', 'ZAP'),
(80, 'ZAP\" UNION ALL select NULL -- ', '$2a$08$UX9Vd/RawzaPPppCGL1DBONpvSiQ5ofIqVW/3SX/SUF.6OH0cLshS', '2024-08-13 01:28:09', 'ZAP'),
(81, 'ZAP) UNION ALL select NULL -- ', '$2a$08$RTFcsSAu33AonHnA.G5FH.Y0p8mpl.JG93kn7lWd3eJtZBA3/LFV6', '2024-08-13 01:28:09', 'ZAP'),
(82, 'ZAP\') UNION ALL select NULL -- ', '$2a$08$ZJstY0VJ6rAqNvl.tEvn.uvIymeDgH8.CIothUosDrDHv1D/ggvOe', '2024-08-13 01:28:09', 'ZAP'),
(83, 'ZAP / sleep(15) ', '$2a$08$/1piMDKu8qpiX7i9QGSpD.wqbiSA3rNB0cUuRgrNNhdXzli9QMrkO', '2024-08-13 01:28:11', 'ZAP'),
(84, 'ZAP\' / sleep(15) / \'', '$2a$08$fWqQVV4JF.GZ8BVS1y4ii.vOmPN8cITRCA2OBBJFekL48dWIXJRqW', '2024-08-13 01:28:11', 'ZAP'),
(85, 'ZAP\" / sleep(15) / \"', '$2a$08$EbNGE22/56XedXWX9GUkQ.2r.jNlyq8I6fCSOhEBnn3cMf7Bxzc1O', '2024-08-13 01:28:11', 'ZAP'),
(86, 'ZAP and 0 in (select sleep(15) ) -- ', '$2a$08$jUTFFpQfOnbYRW2NgdKv9O8tEkoC4y/MByO.4BVQY1XlyMsO6a5uG', '2024-08-13 01:28:11', 'ZAP'),
(87, 'ZAP\' and 0 in (select sleep(15) ) -- ', '$2a$08$5aVQvelUl.ZvtDlpF9GBIu9CyWt2U5NscyfcdFHgMCWGrxqrAhiPW', '2024-08-13 01:28:12', 'ZAP'),
(88, 'ZAP\" and 0 in (select sleep(15) ) -- ', '$2a$08$VSrYgq9k096ILlrs28hZhOrVKlb19zF6FWTi9y2e.VfuuyO7aAqt6', '2024-08-13 01:28:12', 'ZAP'),
(89, 'ZAP where 0 in (select sleep(15) ) -- ', '$2a$08$NAxwFYjo94GU/CdYEsDowuU6VjMeWQ/bpGFuenvhUcEbYKZkj0tmm', '2024-08-13 01:28:12', 'ZAP'),
(90, 'ZAP\' where 0 in (select sleep(15) ) -- ', '$2a$08$Y6zwxL6YmidT2O1SOviH7OaYvf4rCrQhLyo4dHhnZbfFMyugil03m', '2024-08-13 01:28:12', 'ZAP'),
(91, 'ZAP\" where 0 in (select sleep(15) ) -- ', '$2a$08$AWKMPam0m9Os1W4nu9rXO.vJHGIQ0F1nQmDERc.nd37K7CY1MnZOu', '2024-08-13 01:28:12', 'ZAP'),
(92, 'ZAP or 0 in (select sleep(15) ) -- ', '$2a$08$DCesD6fdVRccsc.pEvTHr.wHeFP5EHcVodjrNPsne1JTDRmzuUjH.', '2024-08-13 01:28:12', 'ZAP'),
(93, '; select \"java.lang.Thread.sleep\"(15000) from INFO', '$2a$08$GtYec8.XUfT/1Xh9FI9Msem29ZHbLmuHbbJDseTyxtn5hFFEZu9ei', '2024-08-13 01:28:13', 'ZAP'),
(94, '\'; select \"java.lang.Thread.sleep\"(15000) from INF', '$2a$08$dPox5k0HrfmWlQWUp2Cc/.ZbR9VgyTpfW7KLKRECyURlbqu99GrCy', '2024-08-13 01:28:13', 'ZAP'),
(95, '\"; select \"java.lang.Thread.sleep\"(15000) from INF', '$2a$08$szSjS8.ipEq/HnO7O32dV.CDQWkmibKvNZnHNecfEgUomMDwJHysi', '2024-08-13 01:28:13', 'ZAP'),
(96, '); select \"java.lang.Thread.sleep\"(15000) from INF', '$2a$08$i0/kpPpntS4579M0y5bs9uDGusoUU2KZbf3xtZ9.ywz5ScoeBuiE.', '2024-08-13 01:28:13', 'ZAP'),
(97, '\"java.lang.Thread.sleep\"(15000)', '$2a$08$YPT1wEi/rA3yGuMRyui/SuCMoJlphbfM7i9wmX3DoBXCOETlryiz2', '2024-08-13 01:28:13', 'ZAP'),
(98, 'ZAP / \"java.lang.Thread.sleep\"(15000) ', '$2a$08$Vr4BW3om2Ijaw0uOC7xMwOzvcAX8AXTLTfAAoik0bPMUVqkTULHCK', '2024-08-13 01:28:13', 'ZAP'),
(99, 'ZAP\' / \"java.lang.Thread.sleep\"(15000) / \'', '$2a$08$s/vMNaA882XXhUwCkgZSpOSReCoorckPkeS4VKI19o51SLfOjvJ3e', '2024-08-13 01:28:13', 'ZAP'),
(100, 'ZAP\" / \"java.lang.Thread.sleep\"(15000) / \"', '$2a$08$Dp4Y5uiNFZJAeuNmZJWKquevmwBV3IK.tDF7Ge4DhDgGGrH4x.b.O', '2024-08-13 01:28:13', 'ZAP'),
(101, 'ZAP and exists ( select \"java.lang.Thread.sleep\"(1', '$2a$08$9dwdUjxp6QU7vQCu3yVD/.ap.nXm3Nf7BAkxv6xgk8ReBb33tosWq', '2024-08-13 01:28:13', 'ZAP'),
(102, 'ZAP\' and exists ( select \"java.lang.Thread.sleep\"(', '$2a$08$WvNKbQET2qyzkYQJw3Jyfu/45N97OnJlUczoa3nnJQc4OEHdmqgbC', '2024-08-13 01:28:13', 'ZAP'),
(103, '(SELECT  UTL_INADDR.get_host_name(\'10.0.0.1\') from', '$2a$08$Z4y5jGUSLtqs5nEq52fDsu3YYSZdOw97zxo70ohEy0PIRMqTZpteS', '2024-08-13 01:28:15', 'ZAP'),
(104, 'ZAP / (SELECT  UTL_INADDR.get_host_name(\'10.0.0.1\'', '$2a$08$MuVweSCN4ME0bAApVKZX2O1p.RWnoqXMMKQTNqTBnly8s7M9lFroO', '2024-08-13 01:28:15', 'ZAP'),
(105, 'ZAP\' / (SELECT  UTL_INADDR.get_host_name(\'10.0.0.1', '$2a$08$RBpwWUVCsrWO6XEXsf7VYOiDLeqEI/6Zs3EjX9/p50kciTaRRmx/6', '2024-08-13 01:28:15', 'ZAP'),
(106, 'ZAP\" / (SELECT  UTL_INADDR.get_host_name(\'10.0.0.1', '$2a$08$/..ZvPcBQE.eD3DjtqpRpeKxclm9pmt/F9tB9AYj2Crc3Hm4A4tK.', '2024-08-13 01:28:15', 'ZAP'),
(107, 'ZAP and exists (SELECT  UTL_INADDR.get_host_name(\'', '$2a$08$jtmMK.draWN/5x7yhNjb8./3c8xESZT0N39nCJ6i.dWRkZ3YAUHqq', '2024-08-13 01:28:15', 'ZAP'),
(108, 'case when cast(pg_sleep(15.0) as varchar) > \'\' the', '$2a$08$JHhNPxuqqYDINkyhzxiXdui1W85WXEgBIrsPEktv3kBsdQhN9bBqy', '2024-08-13 01:28:16', 'ZAP'),
(109, '\'case when cast(pg_sleep(15.0) as varchar) > \'\' th', '$2a$08$cXrnITkdlF2iopu9albqdOPwWfOumIBzhDIxmdbLXkL.5OxIvmnmq', '2024-08-13 01:28:16', 'ZAP'),
(110, '\"case when cast(pg_sleep(15.0) as varchar) > \'\' th', '$2a$08$tI0ftYn3mxKqujwMEEdzW.pq7SGFR4CRScGStmXPW3TLTkfvjCP.m', '2024-08-13 01:28:16', 'ZAP'),
(111, 'ZAP / case when cast(pg_sleep(15.0) as varchar) > ', '$2a$08$jaYhd65UkL/EA..sNFDkce7MrRp9fk1Yu7WsaYNGzyMcLoXFpd45K', '2024-08-13 01:28:16', 'ZAP'),
(112, 'case randomblob(100000) when not null then 1 else ', '$2a$08$izXuLJj/uKzt4UXhxaD8AOE.Jiiw2MhsPjKJanMWgYltJ4ht.V4cm', '2024-08-13 01:28:17', 'ZAP'),
(113, 'mcmvchwiqzsyp1j5cdk0qd33hfy42h9e84nmf2cmbmeasr2dvn', '$2a$08$Q4J1gTfwDecVtu.A4T0VGe5JMAQB3aAFf80/LHXFxde3Ruz.ywyk2', '2024-08-13 01:28:17', 'ZAP'),
(114, 'case randomblob(1000000) when not null then 1 else', '$2a$08$IADKU7qZGS7mMyVfhsf3d.8oSBMnM36Ofy9MUmv2SCGWOQi2B3lGO', '2024-08-13 01:28:17', 'ZAP'),
(115, 'case randomblob(10000000) when not null then 1 els', '$2a$08$Y.MFHLPPIoIyw8iYP.YrNO7l3CZMbTfSc0ZP7lhIw8zdAIex5Jsmi', '2024-08-13 01:28:17', 'ZAP'),
(116, 'jpnjjv1icbtw96bvxwmq07rhq13co08ulyuivq6xg3x01i26gi', '$2a$08$v3NCVwMvtA71etQNTDzhUuKP87Ez2u2qR7QcK/WEvBe8rMvvKaeIK', '2024-08-13 01:28:17', 'ZAP'),
(117, 'case randomblob(100000000) when not null then 1 el', '$2a$08$9xrNowFtAFYef8cfR/oapONdqO34YtV32Gvz.ab9MKlGirLiEatka', '2024-08-13 01:28:17', 'ZAP'),
(118, '6gq94zeqo0xociix5aypq1ydhwqb69n3eznlqtcdu4cbdktcgz', '$2a$08$lMzX82P8X9RbGIJ2kBN87uLF0XyBn4rROge1xtDaZ/ARIda3E0jZy', '2024-08-13 01:28:17', 'ZAP'),
(119, 'case randomblob(1000000000) when not null then 1 e', '$2a$08$3jHJk/hfCC8CdgCf6uoKkeBPXw3cRZc5nTilWqDFWQyBC.qGzsxya', '2024-08-13 01:28:17', 'ZAP'),
(120, 'ZAP WAITFOR DELAY \'0:0:15\' -- ', '$2a$08$HvMWzWxt5o5cjYr1umWdW.3YHi9vezNkbl4gLEjx//LlkGK1moX.q', '2024-08-13 01:28:23', 'ZAP'),
(121, 'ZAP\' WAITFOR DELAY \'0:0:15\' -- ', '$2a$08$oIzjpxAIPWU7r7XZ7ik60.4chhysR1znyCUL7sHeF1gDCAG5JArSy', '2024-08-13 01:28:23', 'ZAP'),
(122, 'ZAP\" WAITFOR DELAY \'0:0:15\' -- ', '$2a$08$nMPZwwqy9kFwqYVEEmUIpu20Ob8jzyrrs1G5ryEIyznWwJp3vtTYa', '2024-08-13 01:28:23', 'ZAP'),
(123, 'ZAP) WAITFOR DELAY \'0:0:15\' -- ', '$2a$08$C9zpZJFPIguFZ05Scx/MT.941kwkxni.Ee6WYu3Y4DJkffRLRHkHu', '2024-08-13 01:28:23', 'ZAP'),
(124, 'ZAP) \' WAITFOR DELAY \'0:0:15\' -- ', '$2a$08$z3W52VxqaxaJcs6/Uhd.r.KowdCMMlaJcPJcOziQ8GDqHSY8qbD3.', '2024-08-13 01:28:23', 'ZAP'),
(125, 'ZAP) \" WAITFOR DELAY \'0:0:15\' -- ', '$2a$08$bx2UoV2fVBsz3mdk3Eq/fey6NTWXhrlJuPf38fFEvCXvDu4DGpDYK', '2024-08-13 01:28:23', 'ZAP'),
(126, 'ZAP)) WAITFOR DELAY \'0:0:15\' -- ', '$2a$08$WDXnyv5IF.Ep1J7lrOzbcO58OQCxva.BNY2RuoN53LdAXVZjla5I2', '2024-08-13 01:28:24', 'ZAP'),
(127, 'ZAP)) \' WAITFOR DELAY \'0:0:15\' -- ', '$2a$08$wXU2OWPTyHpkGSLgWmCHDeXwJ57hy5eXm2OnCzW7vR2i/z2HYDhte', '2024-08-13 01:28:24', 'ZAP'),
(128, 'ZAP)) \" WAITFOR DELAY \'0:0:15\' -- ', '$2a$08$NfLIEJkv/ZYYWzAq/lT95ummL1IWySV4DX6dJNsByBjcabGSz3Sd6', '2024-08-13 01:28:24', 'ZAP'),
(129, 'ZAP) WAITFOR DELAY \'0:0:15\' (', '$2a$08$87MCAnd/Yqilj623vUjqluuNeDYNaOM7gwZ/UPbw5cvDTqaQ0F0OW', '2024-08-13 01:28:24', 'ZAP'),
(130, '\";print(chr(122).chr(97).chr(112).chr(95).chr(116)', '$2a$08$z7dxjdHa5yGQARaFkekFsO0Sl4d3rVWZvyIZO6FrmmAoMsmZz9vzm', '2024-08-13 01:28:26', 'ZAP'),
(131, '\';print(chr(122).chr(97).chr(112).chr(95).chr(116)', '$2a$08$CPc2FT1DXoJlXvfL9GN6FOYs1fYP0IIZsKo0JHgx6YoGCAhFr24ua', '2024-08-13 01:28:26', 'ZAP'),
(132, '${@print(chr(122).chr(97).chr(112).chr(95).chr(116', '$2a$08$yxKWFKEvBBZEbMT70blw8O1C.DCcQUWgHEsxETlwElNx9iLA5D8Q.', '2024-08-13 01:28:26', 'ZAP'),
(133, ';print(chr(122).chr(97).chr(112).chr(95).chr(116).', '$2a$08$OrpfUq6KsMV7.H/WmzvL4O7RL/ctnSqxJKhI5oyQh4QUYER3rsLhK', '2024-08-13 01:28:26', 'ZAP'),
(134, '\"+response.write(646,792*338,092)+\"', '$2a$08$LJTYG2RbDYeXweSWELLS6ubx7WlCbQYufcZgiuuv/d.b0lhOh80im', '2024-08-13 01:28:26', 'ZAP'),
(135, '+response.write({0}*{1})+', '$2a$08$zALKvFAUXkMD6UNUtofr0Owpij4MC305WRWgkXemWKecnVL0OYVDy', '2024-08-13 01:28:26', 'ZAP'),
(136, 'response.write(646,792*338,092)', '$2a$08$6HUI698kUvTc3p5/a9nDy.gBX46QLk22NHt9UV0l6Yg.Ug19y898C', '2024-08-13 01:28:26', 'ZAP'),
(137, 'cat /etc/passwd', '$2a$08$x27tRfukXaakCKg.5EiPJO9Bv8oLI9.1Q.xX22aEcgV1n3zO8ymbG', '2024-08-13 01:28:30', 'ZAP'),
(138, 'ZAP&cat /etc/passwd&', '$2a$08$.CDUvDWr/eoeIQ0FpxOoKeGSMfQo7fo15MnbZPAH8GdHdR0qELlL.', '2024-08-13 01:28:30', 'ZAP'),
(139, 'ZAP;cat /etc/passwd;', '$2a$08$wkrMQh8TPYF4m86Nr9iY7uy5r3aQf67iOR67i5On.w4meAGvCYBfS', '2024-08-13 01:28:30', 'ZAP'),
(140, 'ZAP\"&cat /etc/passwd&\"', '$2a$08$.4fTReBg.jRa9k0.1trlBOCkHA56EIIIhHzpZbuJ53om8tdV3W8Fu', '2024-08-13 01:28:30', 'ZAP'),
(141, 'ZAP\";cat /etc/passwd;\"', '$2a$08$kzTF1jWeym9j5tX3xi/FEuAgW6lz1ll9NgRQ4X1Vb5GmCJnbL6Uou', '2024-08-13 01:28:30', 'ZAP'),
(142, 'ZAP\'&cat /etc/passwd&\'', '$2a$08$uEhYMAtQhWSmZ1b7ZLf0rOz20jebp78Ue1BSzkxA7lL8DnHKO5ST.', '2024-08-13 01:28:30', 'ZAP'),
(143, 'ZAP\';cat /etc/passwd;\'', '$2a$08$z9HzANPTpmHk7skFearxg.5GCaitBdSc64BZEG2pQldTYNFDT7uaS', '2024-08-13 01:28:30', 'ZAP'),
(144, 'ZAP&sleep 15.0&', '$2a$08$F4L9h8nlH4Ak8k.w4hM.PeEnqzIu8YABjLaEtyDdWdgh9jm.GMXRW', '2024-08-13 01:28:30', 'ZAP'),
(145, 'ZAP;sleep 15.0;', '$2a$08$l5b3uVj0g6BM1tVEQtVMZuobp/VeN6YgKKtvvuWs32KyXuN1JwQoW', '2024-08-13 01:28:30', 'ZAP'),
(146, 'ZAP\"&sleep 15.0&\"', '$2a$08$Xl4a3cZw6VWSpJdDepfPSecdAO4Tr65pInXPj2jGQ5CEW4BeIbyGu', '2024-08-13 01:28:30', 'ZAP'),
(147, 'ZAP\";sleep 15.0;\"', '$2a$08$r82X2QHlE2ZeM0X7fdGUJu8KJbX0UytlX8rXBiL0NxZunEwuwpp66', '2024-08-13 01:28:30', 'ZAP'),
(148, 'ZAP\'&sleep 15.0&\'', '$2a$08$9poqNd5yzxRP/T6Jw6w2XuZw6ZY9yjZ8/p.6drD8Xnb.8WEAtQPSu', '2024-08-13 01:28:30', 'ZAP'),
(149, 'ZAP\';sleep 15.0;\'', '$2a$08$aPERHcggNJu0karxYj5d2OZ/Tkm4da.1LhYQF8ufcpbj.KTlDM..i', '2024-08-13 01:28:30', 'ZAP'),
(150, 'type %SYSTEMROOT%\\win.ini', '$2a$08$rjcq7G8282ZjP7mD7221lOqym5.5JeDlOz.ghsT.SOwjSUCihP.7y', '2024-08-13 01:28:30', 'ZAP'),
(151, 'ZAP&type %SYSTEMROOT%\\win.ini', '$2a$08$kT6gCUPMPQzYLgKVDoPseelE73IpG2KC0njVmqkZPE6PR3jypaMFW', '2024-08-13 01:28:30', 'ZAP'),
(152, 'ZAP|type %SYSTEMROOT%\\win.ini', '$2a$08$raPgQTqHSJG6RFIykcTkyuHy4tASztPTojAdCKpt45jSeuRYSz3ye', '2024-08-13 01:28:31', 'ZAP'),
(153, 'ZAP\"&type %SYSTEMROOT%\\win.ini&\"', '$2a$08$NkX3orijuamc3680lUGWgOIupgEKEd1xER.MapN0v/ghWihP./W1G', '2024-08-13 01:28:31', 'ZAP'),
(154, 'ZAP\"|type %SYSTEMROOT%\\win.ini', '$2a$08$VXPuk801NbIhxI.c1W8DROxZmJx3yOLLGc6oYCPkw1quUdKt0eEVO', '2024-08-13 01:28:31', 'ZAP'),
(155, 'ZAP\'&type %SYSTEMROOT%\\win.ini&\'', '$2a$08$M39JotaHhFRceCX.NRbhkOz3.VuAn9Daonao7xCk//tVEVWHC5MkG', '2024-08-13 01:28:31', 'ZAP'),
(156, 'ZAP\'|type %SYSTEMROOT%\\win.ini', '$2a$08$xyTwQ0oWQAtw7rdr0CqCZOivWXJVjlkX9a9MVmNZjHhlFcKjcAEM2', '2024-08-13 01:28:31', 'ZAP'),
(157, 'ZAP&timeout /T 15.0', '$2a$08$44opdF8XmVX8ZKoN2vwaSuQ8ZBpJjzQgMTdj2Utg0i2tT4zKwW/l.', '2024-08-13 01:28:31', 'ZAP'),
(158, 'ZAP|timeout /T 15.0', '$2a$08$k0K5U5iEcU0Ap6wcUXHVhu4dL.WbXxypYPR4M6bG9PuicsJZHgfIm', '2024-08-13 01:28:31', 'ZAP'),
(159, 'ZAP\"&timeout /T 15.0&\"', '$2a$08$rwNktHidt2zH5GckUaScC.ew6yp/wOUa/2go2tt9ZSeKbPsM14czi', '2024-08-13 01:28:31', 'ZAP'),
(160, 'ZAP\"|timeout /T 15.0', '$2a$08$npoKE0SQukDJTtlxebclnOxAArGPbL3KBIXcC7BTDet/7NWI9z5ny', '2024-08-13 01:28:31', 'ZAP'),
(161, 'ZAP\'&timeout /T 15.0&\'', '$2a$08$2VgB/CwUzeQC3.sIoSfUEeaGzfHAFi1SNo7/SpAh94GXXPrL4q/Oe', '2024-08-13 01:28:31', 'ZAP'),
(162, 'ZAP\'|timeout /T 15.0', '$2a$08$uzKc6ZRnnJ2Pim6CAhXjCe0FqvFyWvkftT9lUVsH8Nv.RgIu6UZqS', '2024-08-13 01:28:31', 'ZAP'),
(163, 'get-help', '$2a$08$Q9PGo1wv9eU4IxTe28FYsO0iirioALBwZSZtFl4d7gudevIts8z4S', '2024-08-13 01:28:31', 'ZAP'),
(164, 'ZAP;get-help', '$2a$08$5M7l/wEHyAZFCUi.ZSgfR.262wsfaVzHDbBjYAwPCDMo7esAz3MnG', '2024-08-13 01:28:31', 'ZAP'),
(165, 'ZAP\";get-help', '$2a$08$xKfyqvygzYq0XQMHOcSoSubikTYZVKY45oXxmp4jwUZnOnjUFQfHW', '2024-08-13 01:28:31', 'ZAP'),
(166, 'ZAP\';get-help', '$2a$08$v0jSLC8wvm9Lj3eJIOpvS.vBUrvGbzMmIvfQQeQEB1fJiTrZwcpmW', '2024-08-13 01:28:31', 'ZAP'),
(167, 'ZAP;get-help #', '$2a$08$Zc3Ib0d1qYYBV0bvaZHhO.206LKNnwp1vQPIXAaYlyQNdduFTAScW', '2024-08-13 01:28:32', 'ZAP'),
(168, 'ZAP;start-sleep -s 15.0', '$2a$08$fMQiofXPsoFynDx915Igheso34s9CJoF2MERWBt.bFmJLos7yNmSG', '2024-08-13 01:28:32', 'ZAP'),
(169, 'ZAP\";start-sleep -s 15.0', '$2a$08$.vVDkhljJx6gkmTweKLw6Owx1opO66H4D6TR1i7uY8LB8To4bVV5a', '2024-08-13 01:28:32', 'ZAP'),
(170, 'ZAP\';start-sleep -s 15.0', '$2a$08$365HMHydLB5loSGYvbU.t.oovsXOW0.GhanQUd0qge7sRuPUnyOTK', '2024-08-13 01:28:32', 'ZAP'),
(171, 'ZAP;start-sleep -s 15.0 #', '$2a$08$ef6DUJEyvMWFUwkKHD/kOegWU99ryQzQiKDOJrSjJp6Q7P/YHgsHC', '2024-08-13 01:28:32', 'ZAP'),
(172, '\"\'', '$2a$08$O.tIIYZTXRR9xpJduRNzp.1tCZyMz/ZrnNBnhLRUqHVhc3mJYm9wK', '2024-08-13 01:28:34', 'ZAP'),
(173, '<!--', '$2a$08$vlBMXOdv5UG2QdH9EFOB7.6uOCcw/INa90VTRQ3Ogbbe5cCl2XLDm', '2024-08-13 01:28:35', 'ZAP'),
(174, ']]>', '$2a$08$CAdTfUBETQzT4Z0vGJW7Y.JtjMzjRzna5UHdoleoyPxbeAakUWbZK', '2024-08-13 01:28:35', 'ZAP'),
(175, 'zj 6685*4368 zj', '$2a$08$fTBidMuG47DGYrEps1p4n.O0Jr8I.wVWy8574/iFoy16W9/dyLHXi', '2024-08-13 01:28:36', 'ZAP'),
(176, 'zj{6211*4484}zj', '$2a$08$GZm9dsyKxCwYYWp6qLXpMO0V/VfcGFfiyvVxSlo4L2frpIikZ7Q5O', '2024-08-13 01:28:36', 'ZAP'),
(177, 'zj${6027*8437}zj', '$2a$08$bI3BHLLpVJ6HjIIpHMnt6OrBT12b20gZSGs.wveAj81GGPaXIyF12', '2024-08-13 01:28:36', 'ZAP'),
(178, 'zj#{9833*4343}zj', '$2a$08$WcV32DHEFnk3MCwGoSPWc.gzJ45ROzTiazBqn/Tk9f2rGo6G87x/i', '2024-08-13 01:28:36', 'ZAP'),
(179, 'zj{#2999*9469}zj', '$2a$08$oUoMbgf0Ba20XKlXV5xlJ.hmPMmaclvoBjYwUddXHfC4i5ca/RP0e', '2024-08-13 01:28:36', 'ZAP'),
(180, 'zj{@7297*4055}zj', '$2a$08$L0t7fk1zS.np5zPcbRb/meT06iEqujfCvePrPep9OtStm3nyre.K6', '2024-08-13 01:28:36', 'ZAP'),
(181, 'zj{{6663*6096}}zj', '$2a$08$szF2IDGZLdihySf4h9OtQepqvl40rwqfy.2vCLjoqYh25DPd5y4ri', '2024-08-13 01:28:36', 'ZAP'),
(182, 'zj{{=7389*9745}}zj', '$2a$08$nNDMDnrk4ssBeNG/FUSLcOMcLOjCoIAcB9QeEID24ZXE3lTQASUM6', '2024-08-13 01:28:36', 'ZAP'),
(183, 'zj<%=2292*1993%>zj', '$2a$08$nle94tsAHFmwUi57N6sgj.hhh6usVzMT3nYs10cLQGGQHXE9sT7s2', '2024-08-13 01:28:36', 'ZAP'),
(184, 'zj#set($x=5461*7113)${x}zj', '$2a$08$ryqcmRVUdjM5EFDSkdVGROEHYiC1MOat0W7WLkNZVqHes5FyF5KWS', '2024-08-13 01:28:36', 'ZAP'),
(185, 'zj<p th:text=\"${6987*8119}\"></p>zj', '$2a$08$aEyLxi08O5zWY3QOfDbY8.f7/M/e7X/EnbLgiv5SC0yplYizTNnnu', '2024-08-13 01:28:36', 'ZAP'),
(186, 'zj{@math key=\"6564\" method=\"multiply\" operand=\"747', '$2a$08$Uno9hR9R9u.E1PPhkSLbJu.2Xa3o4GkNCsTGaMBWDx.Dr6CYLcXbK', '2024-08-13 01:28:37', 'ZAP'),
(187, 'zj{{14130|add:18130}}zj', '$2a$08$.SZZx5UbOFPw152XPqjAmezujC0xJUvSN6PXJm62PFxFWqoyNtB1K', '2024-08-13 01:28:37', 'ZAP'),
(188, 'zj{{print \"4862\" \"1703\"}}zj', '$2a$08$B55EluOwy6cr7weslzji8.tqKMl.N5Gh3udPVSvTWDCY7wVo0Fq/y', '2024-08-13 01:28:37', 'ZAP'),
(189, '<#assign ex=\"freemarker.template.utility.Execute\"?', '$2a$08$soe9KCfZbQWNYRs4aPDwzOn3OyKWQrsvd/sY3FcSAPbj8rtXbTstS', '2024-08-13 01:28:38', 'ZAP'),
(190, '#set($engine=\"\")\n#set($proc=$engine.getClass().for', '$2a$08$I3F4Q00GT40.VL9rGe/BEuV6gjgwhKgsbQQWx1x.5flTY5YSZyBpu', '2024-08-13 01:28:38', 'ZAP'),
(191, '{{= global.process.mainModule.require(\'child_proce', '$2a$08$cTzD9DpbwlCZzYq49.R0sOZfTV9zNSI9/OlWfhuRxt1HHZSm9SRsG', '2024-08-13 01:28:38', 'ZAP'),
(192, '<%= global.process.mainModule.require(\'child_proce', '$2a$08$hn8o7ZhQeBmcHXjEUkZQiuQKyMq679GM9A/zt8rhffyAjih61wHEO', '2024-08-13 01:28:38', 'ZAP'),
(193, '#{global.process.mainModule.require(\'child_process', '$2a$08$iCXmmp7NbvRfmc.WKIrQPeCLT6jwRDiELfZzBGlelcEczoLEy0Cba', '2024-08-13 01:28:38', 'ZAP'),
(194, '{{range.constructor(\"return eval(\\\"global.process.', '$2a$08$HkRRFibq.H7WcelXhJ35e.oMGEoyjkr/qIFQRvpSljBaEQrLqny7e', '2024-08-13 01:28:38', 'ZAP'),
(195, '{{\"\".__class__.__mro__[1].__subclasses__()[157].__', '$2a$08$dOEzXycoASFT6F6wz6iUf.EGc1SfAZHoiJqJdTDD6EWY2WeY9aQ9y', '2024-08-13 01:28:38', 'ZAP'),
(196, '${__import__(\"subprocess\").check_output(\"sleep 15\"', '$2a$08$0H8e4skc1ufcxZz6SoNf5.lyYExiwMqOMSadEHJzHTPfs0Atpdi4W', '2024-08-13 01:28:38', 'ZAP'),
(197, '{{__import__(\"subprocess\").check_output(\"sleep 15\"', '$2a$08$MfR/erqffb4gMXyhQlYNKuIGdu707P1hta6T7.8f5GviboB4/st5O', '2024-08-13 01:28:38', 'ZAP'),
(198, '<%=%x(sleep 15)%>', '$2a$08$5/OoaczIzFNrf1ZRK7klpOFfBuW0EvTUvp1EVsopYNQLGKT5PnpPW', '2024-08-13 01:28:39', 'ZAP'),
(199, '#{%x(sleep 15)}', '$2a$08$zQA4uwLbXLGfWA8aWoVtfe3ODl1D49dW/WoDysFFGXHzyiJHcdUP6', '2024-08-13 01:28:39', 'ZAP'),
(200, '{system(\"sleep 15\")}', '$2a$08$0FAUfPFMD7jYs2IYIsuZWePiDs05ZzxCRC/QzEokodTzVbC0hxRw2', '2024-08-13 01:28:39', 'ZAP'),
(201, 'kjGKwBTWjVGnIIoZJQiQnkldDtHxkKsTDNLmjvtjThquOQaXFf', '$2a$08$fDHSC16Zy/bKLuoSaYxLjeyToxiB/aLaOCvV7ir.n47vhfjRbfGES', '2024-08-13 01:28:39', 'ZAP'),
(202, 'ZAP%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%s%n%', '$2a$08$OqlE2w/6nzX4mwy9ksCQtuycSUoSz7LrwpgKALm7QhJ03Rxw9nLee', '2024-08-13 01:28:40', 'ZAP'),
(203, 'ZAP %1!s%2!s%3!s%4!s%5!s%6!s%7!s%8!s%9!s%10!s%11!s', '$2a$08$gu5ZmcoJD8VoVGnwoVNu2.CHgkE5sfRDWvr60WOOCF3BrzV.1ZBbS', '2024-08-13 01:28:40', 'ZAP'),
(204, 'Set-cookie: Tamper=297cb3ab-ff3b-4b6f-8f81-36e2c7d', '$2a$08$C7uY3.bgskS4XFPrysutt.luRPBC.iLhzrYvNx6ChMzvtPxbRLX3e', '2024-08-13 01:28:41', 'ZAP'),
(205, 'any\r\nSet-cookie: Tamper=297cb3ab-ff3b-4b6f-8f81-36', '$2a$08$Vn93xq1P783wzEBCWl7Oteq7km8urZHU2XBIWITAoixzCXqsf6qwq', '2024-08-13 01:28:41', 'ZAP'),
(206, 'any?\r\nSet-cookie: Tamper=297cb3ab-ff3b-4b6f-8f81-3', '$2a$08$9AG5YctaS6edjriCFLi4su/9tRLjq1qiNiKQ6RvBRdn8Cw3j6LQpO', '2024-08-13 01:28:41', 'ZAP'),
(207, 'any\nSet-cookie: Tamper=297cb3ab-ff3b-4b6f-8f81-36e', '$2a$08$uJYZFcxiiNtWhIP2IwPWgedo69Ei7Tp.cXQ817PSHKqrZ2Wihzspq', '2024-08-13 01:28:41', 'ZAP'),
(208, 'any?\nSet-cookie: Tamper=297cb3ab-ff3b-4b6f-8f81-36', '$2a$08$rQSG3lhT0gjhajxarEeX6.Q7OnagtgVhH7mgm9RsocYu9tWI15scK', '2024-08-13 01:28:41', 'ZAP'),
(209, '@', '$2a$08$nI56UFDmReHTvGH3LcwjPuRrGJ3Q9strPj8/hMGF.VZChUZfSP.ZW', '2024-08-13 01:28:42', 'ZAP'),
(210, '+', '$2a$08$3.jLCPVCfi/CQevPMxedfug/Nq2mOb6bEGpjH63lb1eKAvCtws5dO', '2024-08-13 01:28:42', 'ZAP'),
(211, '|', '$2a$08$VJwvxe2h/8s9bx4IYyTwjuxsTg2epHQwQGvwcAretE5YzRPgGqdhy', '2024-08-13 01:28:42', 'ZAP'),
(212, '<', '$2a$08$LR1/c9XdR4A655axyKUiNeUK9CEBHAkzmuLaI1fiX0/Lnk.vMd3Cq', '2024-08-13 01:28:43', 'ZAP'),
(213, '<xsl:value-of select=\"system-property(\'xsl:vendor\'', '$2a$08$muuOLKIA4MzgdGJC/3a1Pe36HEG8s6NvExjDMpEc4adN7LvlFhFwa', '2024-08-13 01:28:43', 'ZAP'),
(214, 'system-property(\'xsl:vendor\')/>', '$2a$08$I30SmDRurAybDddXcnT6c.ubF2psJr288jlipZkN3xXzVC.55Yd7a', '2024-08-13 01:28:43', 'ZAP'),
(215, '\"/><xsl:value-of select=\"system-property(\'xsl:vend', '$2a$08$khqssaoCN3YkXHMkL.QzB.li4OYq4OaVtTgLtNyDGzVi1UkJaqxOW', '2024-08-13 01:28:43', 'ZAP'),
(216, 'zApPX8sS', '$2a$08$sP4V4DlpXi896yeZTgRtXOIwKpEo7BHU6YeJ2s480kt2ubMeCV8lS', '2024-08-13 01:30:42', 'ZAP'),
(217, 'ZAP AND 1=2 -- ', '$2a$08$KOvwguNf8Me299XYJCjoS./D76QBmJCGZXN/Oz3qiJtWZq4pmdLYS', '2024-08-13 01:30:44', 'ZAP'),
(218, 'f5voa69x1jdc0ryyxz37k90aykekp3n7juh3ts9q1x4iccd69f', '$2a$08$QRAtkC72fW3U.np2vaHSzOjdAKf/BdeEzgekNHOS4HTeJY.P0cmK.', '2024-08-13 01:30:50', 'ZAP'),
(219, '3rx6kzp8f9n66nvk7dsfpgk39t3bb3tps1panirw8nfh48u5ps', '$2a$08$El/eWQ9MseFheyRqfnQtguvneAlUdyIOKRmmWi//CFM0jsw3eNvLm', '2024-08-13 01:30:50', 'ZAP'),
(220, '5fyv6epmzynuxv9mib9eea8pn18spfw7zitb2ylg5ah9okv39x', '$2a$08$bagS8oyBWsJ/vvESoS0XXOiAq3ERn3VusdplQDrKLKTf6xMJpoblC', '2024-08-13 01:30:50', 'ZAP'),
(221, '\"+response.write(846,088*758,033)+\"', '$2a$08$6p1QBGvGu4nVM6d6v884neSQj0SRWTOFoXMR1qecMDF/58WoyYkrG', '2024-08-13 01:31:01', 'ZAP'),
(222, 'response.write(846,088*758,033)', '$2a$08$w7WO.732.DT9t/OHKIn/guT45TQjw08myfkUca493YiQCEt7MRuqS', '2024-08-13 01:31:01', 'ZAP'),
(223, 'zj 2022*8150 zj', '$2a$08$YOfUQLWYjLNKY5vp6ngTZOdo2qGFsJjT6dJQybc5p2MHILYvSs1Oy', '2024-08-13 01:31:12', 'ZAP'),
(224, 'zj{8571*6822}zj', '$2a$08$89214Q431qDnmZBKdLAKwOF1HJ.OFWxte6ZMWkbTrCHnBfJEbGQh.', '2024-08-13 01:31:12', 'ZAP'),
(225, 'zj${7206*2999}zj', '$2a$08$8tuWtrCDbhqenh3kWYmCWuDWEdYdeR80RinXdZoVHGKfzB2gpQAmy', '2024-08-13 01:31:12', 'ZAP'),
(226, 'zj#{8718*3481}zj', '$2a$08$1twzYffJJdz28YYGPxGm.uG.SWOpf.id12HBx0efZgyvTzzg.yF5y', '2024-08-13 01:31:12', 'ZAP'),
(227, 'zj{#1828*5193}zj', '$2a$08$PssfBeFHZ2ptxAk2azHQk.7AuIDYEdG3Uorx.AkhRT30nTWRMCYgS', '2024-08-13 01:31:12', 'ZAP'),
(228, 'zj{@8343*2540}zj', '$2a$08$du5NXfJnLcGWu8XzcB0NeuDU7QHsQhB7z3JiYvqJVXsLLIZqPmVyu', '2024-08-13 01:31:12', 'ZAP'),
(229, 'zj{{2938*6527}}zj', '$2a$08$gid5aEqkfopCcOjBeqLCAu8ZWNdqusXXNj5w3Cu/8X1g0LsT6RWB2', '2024-08-13 01:31:12', 'ZAP'),
(230, 'zj{{=5861*7807}}zj', '$2a$08$G.qONUoIKz/.t/DqIG1N7.RdtGjFosyPKUEb4/Kc.9aiZ.LAYvkaW', '2024-08-13 01:31:12', 'ZAP'),
(231, 'zj<%=3003*3407%>zj', '$2a$08$Cc.7/cJzBjrQpvyWprqH9.HKh25x6Xxqh1KRjXRBHOuGqevSvIZAG', '2024-08-13 01:31:12', 'ZAP'),
(232, 'zj#set($x=6835*3220)${x}zj', '$2a$08$0FmUt5ZKk2iTQCBUaF7O/.A4myGh/YxCnuVspoWWvTXDBvwGd8Qge', '2024-08-13 01:31:12', 'ZAP'),
(233, 'zj<p th:text=\"${6913*1441}\"></p>zj', '$2a$08$rX/8Tlshwngs4QXM3DRzpOk6pHpTTdQCvjHj36s90U7iaGiLI44w2', '2024-08-13 01:31:12', 'ZAP'),
(234, 'zj{@math key=\"8916\" method=\"multiply\" operand=\"932', '$2a$08$XTNJacrHgN6CZYaGvwHdMOZEB2VEqh1da.rMUnu52KgLuT05DJSUK', '2024-08-13 01:31:12', 'ZAP'),
(235, 'zj{{20170|add:16110}}zj', '$2a$08$nonob5qvAQyi9RosbrXfie7lhKhjlkCe7T11xSjJnEGFmDlEyfOgG', '2024-08-13 01:31:12', 'ZAP'),
(236, 'zj{{print \"6506\" \"7940\"}}zj', '$2a$08$YzUhjjHx87SQ3VojHgJfCuqai33uEK/9bA6e4J6tA5c.87wju/n56', '2024-08-13 01:31:12', 'ZAP'),
(237, 'AgbotnnDAsnPmsdZwtthrGQPGaKnsLHyulywynDnuuSRXnGGBm', '$2a$08$4WRnHR1huEjth2kZEZEusucoWSRZdwKIyY/kwaCQxoNRt8QI0IlsK', '2024-08-13 01:31:15', 'ZAP'),
(238, 'Set-cookie: Tamper=3bd3cd54-21d5-4834-a218-c4a3a9a', '$2a$08$TIXzBsfUjIBTITmDjGcaTOla2inDYaCsAPHy.KA0hkfMhZ3vCTgka', '2024-08-13 01:31:15', 'ZAP'),
(239, 'any\r\nSet-cookie: Tamper=3bd3cd54-21d5-4834-a218-c4', '$2a$08$R8ct13YNSc4me1RnfC6KmuK.o/o6XNOINOq6A3oxBo/pUb/s1q4cm', '2024-08-13 01:31:15', 'ZAP'),
(240, 'any?\r\nSet-cookie: Tamper=3bd3cd54-21d5-4834-a218-c', '$2a$08$.e1O.1MZNVfVAaAl9G6Jju8Dz.kkDHEbzKuKoA.BecFC2/h0PHWVC', '2024-08-13 01:31:15', 'ZAP'),
(241, 'any\nSet-cookie: Tamper=3bd3cd54-21d5-4834-a218-c4a', '$2a$08$ZIKt0l/otBk9TJK0y.DSL.DFCFPWI/t9T.kDHlweW3rfBG6TAY5FK', '2024-08-13 01:31:15', 'ZAP'),
(242, 'any?\nSet-cookie: Tamper=3bd3cd54-21d5-4834-a218-c4', '$2a$08$cSkwbB1UJ4xyrpqc3HQgWeYopgWJDimj3mrn9aAq0cY8RIP427OcG', '2024-08-13 01:31:16', 'ZAP'),
(243, 'zApPX13sS', '$2a$08$x51WwyK1qk/QNaHV22wwaOKye/vsgN7nv8zEX1hqGslqEvAuHnYBW', '2024-08-13 01:40:45', 'ZAP'),
(244, 'ZAP OR 1=1 -- ', '$2a$08$i59g2tQeejMO1ezfAxY9n.u0AZ37Rn68GSO9JYQoIP1ENtgMs.7Iy', '2024-08-13 01:40:47', 'ZAP');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
