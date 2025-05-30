/*
 Navicat Premium Dump SQL

 Source Server         : Mevivu
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : len

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 30/05/2025 23:49:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES (0, '', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `admins` VALUES (1, 'admin', '$2b$10$zn9NQj2Wuv9haQjiBm7w5uZQdGvelZ7ijTqcr.FZct7i7GjmdukzO', '2025-05-26 13:02:03', '2025-05-26 13:02:03');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `search` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 324 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (2, 'milk mác xanh 100g', NULL, 'mct mct 100', 10000, '/public/images/len.png', '2025-05-26 19:09:44', '2025-05-26 19:09:44');
INSERT INTO `products` VALUES (3, 'milk 125g', NULL, 'mct125 125 mct-125 mct milkcotton125', 10000, '/public/images/len.png', '2025-05-26 19:09:44', '2025-05-26 19:09:44');
INSERT INTO `products` VALUES (4, 'cotton love 1', NULL, 'ctl', 10000, '/public/images/len.png', '2025-05-26 19:09:44', '2025-05-26 19:09:44');
INSERT INTO `products` VALUES (5, 'cotton candy', NULL, 'ctc', 10000, '/public/images/len.png', '2025-05-26 19:09:44', '2025-05-26 19:09:44');
INSERT INTO `products` VALUES (6, 'ctvn craft yarn', NULL, 'ctvn', 10000, '/public/images/len.png', '2025-05-26 19:09:44', '2025-05-26 19:09:44');
INSERT INTO `products` VALUES (7, 'ctvn thhx', NULL, 'ctvn thhx', 10000, '/public/images/len.png', '2025-05-26 19:09:44', '2025-05-26 19:09:44');
INSERT INTO `products` VALUES (8, 'yaoh', NULL, 'yaoh', 10000, '/public/images/len.png', '2025-05-26 19:09:44', '2025-05-26 19:09:44');
INSERT INTO `products` VALUES (9, 'yaoh loang', NULL, 'yaoh loang', 10000, '/public/images/len.png', '2025-05-26 19:09:44', '2025-05-26 19:09:44');
INSERT INTO `products` VALUES (10, 'baby yarn 1', NULL, 'baby yarn', 10000, '/public/images/len.png', '2025-05-26 19:09:44', '2025-05-26 19:09:44');
INSERT INTO `products` VALUES (33, 'kim móc', NULL, 'kim móc', 10000, '/public/images/len.png', '2025-05-26 20:48:09', '2025-05-26 20:48:09');
INSERT INTO `products` VALUES (35, 'kim đan', NULL, 'kim đan kdg', 10000, '/public/images/len.png', '2025-05-26 20:48:09', '2025-05-26 20:48:09');
INSERT INTO `products` VALUES (36, 'kim đan gỗ', NULL, 'kim đan gỗ kdg kim dan go', 10000, '/public/images/len.png', '2025-05-26 20:48:09', '2025-05-26 20:48:09');
INSERT INTO `products` VALUES (37, 'kim đan vòng', NULL, 'kim đan vòng kim dan vong kimdanvong kdv', 10000, '/public/images/len.png', '2025-05-26 20:48:09', '2025-05-26 20:48:09');
INSERT INTO `products` VALUES (38, 'kim mó skc', NULL, 'kim móc skc kimmocskc skc', 10000, '/public/images/len.png', '2025-05-26 20:48:09', '2025-05-26 20:48:09');
INSERT INTO `products` VALUES (40, 'sản phẩm mới', NULL, 'spm sanphammoi s a n p h a m m o i san pham moi ', 10000, '/public/images/len.png', '2025-05-26 22:53:53', '2025-05-26 22:53:53');
INSERT INTO `products` VALUES (193, 'kim đan', NULL, 'kim đan kdg', 10000, '', '2025-05-28 00:52:15', '2025-05-28 00:52:15');
INSERT INTO `products` VALUES (267, 'abc', NULL, 'abc', 100000, '/public/images/1748532704709-8.jpg', '2025-05-29 22:31:44', '2025-05-29 22:31:44');
INSERT INTO `products` VALUES (272, 'ctvn craft yarn', NULL, 'ctvn', 10000, '', '2025-05-29 22:37:29', '2025-05-29 22:37:29');
INSERT INTO `products` VALUES (273, 'ctvn thhx', NULL, 'ctvn thhx', 10000, '', '2025-05-29 22:37:29', '2025-05-29 22:37:29');
INSERT INTO `products` VALUES (274, 'yaoh', NULL, 'yaoh', 10000, '', '2025-05-29 22:37:29', '2025-05-29 22:37:29');
INSERT INTO `products` VALUES (275, 'yaoh loang', NULL, 'yaoh loang', 10000, '', '2025-05-29 22:37:29', '2025-05-29 22:37:29');
INSERT INTO `products` VALUES (276, 'baby yarn 1', NULL, 'baby yarn', 10000, '', '2025-05-29 22:37:29', '2025-05-29 22:37:29');
INSERT INTO `products` VALUES (277, 'kim móc', NULL, 'kim móc', 10000, '', '2025-05-29 22:37:29', '2025-05-29 22:37:29');
INSERT INTO `products` VALUES (278, 'kim đan', NULL, 'kim đan kdg', 10000, '', '2025-05-29 22:37:29', '2025-05-29 22:37:29');
INSERT INTO `products` VALUES (279, 'kim đan gỗ', NULL, 'kim đan gỗ kdg kim dan go', 10000, '', '2025-05-29 22:37:29', '2025-05-29 22:37:29');
INSERT INTO `products` VALUES (280, 'kim đan vòng', NULL, 'kim đan vòng kim dan vong kimdanvong kdv', 10000, '', '2025-05-29 22:37:29', '2025-05-29 22:37:29');
INSERT INTO `products` VALUES (281, 'kim mó skc', NULL, 'kim móc skc kimmocskc skc', 10000, '', '2025-05-29 22:37:29', '2025-05-29 22:37:29');
INSERT INTO `products` VALUES (282, 'sản phẩm mới', NULL, 'spm sanphammoi s a n p h a m m o i san pham moi ', 10000, '', '2025-05-29 22:37:29', '2025-05-29 22:37:29');
INSERT INTO `products` VALUES (283, 'kim đan', NULL, 'kim đan kdg', 10000, '', '2025-05-29 22:37:29', '2025-05-29 22:37:29');
INSERT INTO `products` VALUES (284, 'sản phẩm mới một', 'them-san-pham-moi', 'theem', 1000, '/public/images/1748619966702-2.png', '2025-05-30 22:46:06', '2025-05-30 22:46:06');
INSERT INTO `products` VALUES (285, 'sản phẩm đầu', 'san-pham-dau', '', 100000, '/public/images/1748620158956-9.png', '2025-05-30 22:49:18', '2025-05-30 22:49:18');
INSERT INTO `products` VALUES (286, 'sản phẩm 2', 'san-pham-2', '', 100000, '/public/images/1748620190504-4.png', '2025-05-30 22:49:50', '2025-05-30 22:49:50');
INSERT INTO `products` VALUES (287, 'thêm sản phẩm mới', 'them-san-pham-moi', 'themsanphammoi,tspm,thsaphmo', 100000, '/public/images/1748620658410-9.png', '2025-05-30 22:57:38', '2025-05-30 22:57:38');
INSERT INTO `products` VALUES (288, 'milk cotton 50g', 'milk-cotton-50g', 'milkcotton50g,mc5,mico50, mct50', 10000, '/public/images/1748620713659-1.png', '2025-05-30 22:58:33', '2025-05-30 22:58:33');
INSERT INTO `products` VALUES (289, 'milk mác xanh 100g', 'milk-mac-xanh-100g', 'milkmacxanh100g,mmx1,mimaxa10', 10000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (290, 'milk 125g', 'milk-125g', 'milk125g,m1,mi12', 10000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (291, 'cotton love 1', 'cotton-love-1', 'cottonlove1,cl1,colo1', 10000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (292, 'cotton candy', 'cotton-candy', 'cottoncandy,cc,coca', 10000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (293, 'ctvn craft yarn', 'ctvn-craft-yarn', 'ctvncraftyarn,ccy,ctcrya', 10000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (294, 'ctvn thhx', 'ctvn-thhx', 'ctvnthhx,ct,ctth', 10000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (295, 'yaoh', 'yaoh', 'yaoh,y,ya', 10000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (296, 'yaoh loang', 'yaoh-loang', 'yaohloang,yl,yalo', 10000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (297, 'baby yarn 1', 'baby-yarn-1', 'babyyarn1,by1,baya1', 10000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (298, 'kim móc', 'kim-moc', 'kimmoc,km,kimo', 10000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (299, 'kim đan', 'kim-dan', 'kimdan,kd,kida', 10000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (300, 'kim đan gỗ', 'kim-dan-go', 'kimdango,kdg,kidago', 10000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (301, 'kim đan vòng', 'kim-dan-vong', 'kimdanvong,kdv,kidavo', 10000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (302, 'kim mó skc', 'kim-mo-skc', 'kimmoskc,kms,kimosk', 10000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (303, 'sản phẩm mới', 'san-pham-moi', 'sanphammoi,spm,saphmo', 10000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (304, 'kim đan', 'kim-dan', 'kimdan,kd,kida', 10000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (305, 'abc', 'abc', 'abc,a,ab', 100000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (306, 'ctvn craft yarn', 'ctvn-craft-yarn', 'ctvncraftyarn,ccy,ctcrya', 10000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (307, 'ctvn thhx', 'ctvn-thhx', 'ctvnthhx,ct,ctth', 10000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (308, 'yaoh', 'yaoh', 'yaoh,y,ya', 10000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (309, 'yaoh loang', 'yaoh-loang', 'yaohloang,yl,yalo', 10000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (310, 'baby yarn 1', 'baby-yarn-1', 'babyyarn1,by1,baya1', 10000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (311, 'kim móc', 'kim-moc', 'kimmoc,km,kimo', 10000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (312, 'kim đan', 'kim-dan', 'kimdan,kd,kida', 10000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (313, 'kim đan gỗ', 'kim-dan-go', 'kimdango,kdg,kidago', 10000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (314, 'kim đan vòng', 'kim-dan-vong', 'kimdanvong,kdv,kidavo', 10000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (315, 'kim mó skc', 'kim-mo-skc', 'kimmoskc,kms,kimosk', 10000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (316, 'sản phẩm mới', 'san-pham-moi', 'sanphammoi,spm,saphmo', 10000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (317, 'kim đan', 'kim-dan', 'kimdan,kd,kida', 10000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (318, 'sản phẩm mới một', 'san-pham-moi-mot', 'sanphammoimot,spmm,saphmomo', 1000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (319, 'sản phẩm đầu', 'san-pham-dau', 'sanphamdau,spd,saphda', 100000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (320, 'sản phẩm 2', 'san-pham-2', 'sanpham2,sp2,saph2', 100000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (321, 'thêm sản phẩm mới', 'them-san-pham-moi', 'themsanphammoi,tspm,thsaphmo', 100000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (322, 'milk cotton 50g', 'milk-cotton-50g', 'milkcotton50g,mc5,mico50', 10000, '', '2025-05-30 23:11:07', '2025-05-30 23:11:07');
INSERT INTO `products` VALUES (323, 'them', 'them', 'them,t,th', 1000, '/public/images/1748623477776-2.png', '2025-05-30 23:44:37', '2025-05-30 23:44:37');

-- ----------------------------
-- Table structure for variants
-- ----------------------------
DROP TABLE IF EXISTS `variants`;
CREATE TABLE `variants`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `product_id` int UNSIGNED NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `variant_product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `variant_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of variants
-- ----------------------------
INSERT INTO `variants` VALUES (8, 'đen', '', 10000, 36, '/public/images/1748416598347-5.png', '2025-05-28 14:16:38', '2025-05-28 14:16:38');
INSERT INTO `variants` VALUES (9, 'đen', '', 10000, 2, '', '2025-05-29 22:11:55', '2025-05-29 22:11:55');
INSERT INTO `variants` VALUES (10, 'vàng', '', 10000, 2, '', '2025-05-29 22:11:55', '2025-05-29 22:11:55');
INSERT INTO `variants` VALUES (11, 'đỏ', '', 10000, 2, '', '2025-05-29 22:11:55', '2025-05-29 22:11:55');
INSERT INTO `variants` VALUES (13, 'đỏ đô', '', 10000, 3, '', '2025-05-29 22:11:55', '2025-05-29 22:11:55');
INSERT INTO `variants` VALUES (15, 'đen đỏ', '', 10000, 8, '', '2025-05-29 22:11:55', '2025-05-29 22:11:55');
INSERT INTO `variants` VALUES (16, 'vàng', '', 10000, 8, '', '2025-05-29 22:11:55', '2025-05-29 22:11:55');
INSERT INTO `variants` VALUES (17, 'tím pastel', '', 10000, 8, '', '2025-05-29 22:11:55', '2025-05-29 22:11:55');
INSERT INTO `variants` VALUES (18, 'đen', 'den', 100000, 288, '/public/images/1748620926245-9.png', '2025-05-30 23:02:06', '2025-05-30 23:02:06');
INSERT INTO `variants` VALUES (19, 'đen', 'den', 10000, 36, '', '2025-05-30 23:11:48', '2025-05-30 23:11:48');
INSERT INTO `variants` VALUES (20, 'đen', 'den', 10000, 2, '', '2025-05-30 23:11:48', '2025-05-30 23:11:48');
INSERT INTO `variants` VALUES (21, 'vàng', 'vang', 10000, 2, '', '2025-05-30 23:11:48', '2025-05-30 23:11:48');
INSERT INTO `variants` VALUES (22, 'đỏ', 'do', 10000, 2, '', '2025-05-30 23:11:48', '2025-05-30 23:11:48');
INSERT INTO `variants` VALUES (23, 'đỏ đô', 'do-do', 10000, 3, '', '2025-05-30 23:11:48', '2025-05-30 23:11:48');
INSERT INTO `variants` VALUES (24, 'đen đỏ', 'den-do', 10000, 8, '', '2025-05-30 23:11:48', '2025-05-30 23:11:48');
INSERT INTO `variants` VALUES (25, 'vàng', 'vang', 10000, 8, '', '2025-05-30 23:11:48', '2025-05-30 23:11:48');
INSERT INTO `variants` VALUES (26, 'tím pastel', 'tim-pastel', 10000, 8, '', '2025-05-30 23:11:48', '2025-05-30 23:11:48');
INSERT INTO `variants` VALUES (27, 'đen', 'den', 100000, 288, '', '2025-05-30 23:11:48', '2025-05-30 23:11:48');

SET FOREIGN_KEY_CHECKS = 1;
